Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1RWGao-00005F-Sd
	for openembedded-core@lists.openembedded.org;
	Fri, 02 Dec 2011 01:03:07 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 01 Dec 2011 15:56:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,281,1320652800"; d="scan'208";a="97666305"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.121.234])
	by fmsmga002.fm.intel.com with ESMTP; 01 Dec 2011 15:56:20 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  1 Dec 2011 23:56:01 +0000
Message-Id: <8cc5f124fb791a762bf6aace3a9bf8c1d1c39dd1.1322782677.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1322782677.git.paul.eggleton@linux.intel.com>
References: <cover.1322782677.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1322782677.git.paul.eggleton@linux.intel.com>
References: <cover.1322782677.git.paul.eggleton@linux.intel.com>
Subject: [RFC PATCH 1/2] classes/buildhistory: add new output history collection class
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 02 Dec 2011 00:03:07 -0000

Create a new build output history reporting class, using testlab.bbclass
from meta-oe as a base. This records information from images produced by
the build process in text files structured suitably for tracking within
a git repository, thus enabling monitoring of changes over time.

Build history collection can be enabled simply by adding the following
to your local.conf:

INHERIT += "buildhistory"

The output after a build can then be found in BUILDHISTORY_DIR (defaults to
TMPDIR/buildhistory). If you set up this directory as a git repository and
set BUILDHISTORY_COMMIT to "1" in local.conf, the build history data will
be committed on every build.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/classes/buildhistory.bbclass |  105 +++++++++++++++++++++++++++++++++++++
 meta/classes/rootfs_ipk.bbclass   |   27 +++++++++-
 meta/classes/rootfs_rpm.bbclass   |   41 +++++++++++++--
 3 files changed, 167 insertions(+), 6 deletions(-)
 create mode 100644 meta/classes/buildhistory.bbclass

diff --git a/meta/classes/buildhistory.bbclass b/meta/classes/buildhistory.bbclass
new file mode 100644
index 0000000..79a074c
--- /dev/null
+++ b/meta/classes/buildhistory.bbclass
@@ -0,0 +1,105 @@
+#
+# Records history of build output in order to detect regressions
+#
+# Based in part on testlab.bbclass
+#
+# Copyright (C) 2011 Intel Corporation
+# Copyright (C) 2007, 2008 Koen Kooi <koen@openembedded.org>
+#
+
+BUILDHISTORY_DIR ?= "${TMPDIR}/buildhistory"
+BUILDHISTORY_DIR_IMAGE = "${BUILDHISTORY_DIR}/images/${MACHINE_ARCH}/${TCLIBC}/${IMAGE_BASENAME}"
+BUILDHISTORY_COMMIT ?= "0"
+BUILDHISTORY_COMMIT_AUTHOR ?= "buildhistory <buildhistory@${DISTRO}>"
+BUILDHISTORY_PUSH_REPO ?= ""
+
+buildhistory_get_image_installed() {
+	# Anything requiring the use of the packaging system should be done in here
+	# in case the packaging files are going to be removed for this image
+
+	mkdir -p ${BUILDHISTORY_DIR_IMAGE}
+
+	# Get list of installed packages
+	list_installed_packages | sort > ${BUILDHISTORY_DIR_IMAGE}/installed-package-names.txt
+	INSTALLED_PKGS=`cat ${BUILDHISTORY_DIR_IMAGE}/installed-package-names.txt`
+
+	# Produce installed package file and size lists and dependency graph
+	echo -n > ${BUILDHISTORY_DIR_IMAGE}/installed-packages.txt
+	echo -n > ${BUILDHISTORY_DIR_IMAGE}/installed-package-sizes.tmp
+	echo -e "digraph depends {\n    node [shape=plaintext]" > ${BUILDHISTORY_DIR_IMAGE}/depends.dot
+	for pkg in $INSTALLED_PKGS; do
+		pkgfile=`get_package_filename $pkg`
+		echo `basename $pkgfile` >> ${BUILDHISTORY_DIR_IMAGE}/installed-packages.txt
+		if [ -f $pkgfile ] ; then
+			pkgsize=`du -k $pkgfile | head -n1 | awk '{ print $1 }'`
+			echo $pkgsize $pkg >> ${BUILDHISTORY_DIR_IMAGE}/installed-package-sizes.tmp
+		fi
+
+		deps=`list_package_depends $pkg`
+		for dep in $deps ; do
+			echo "$pkg OPP $dep;" | sed -e 's:-:_:g' -e 's:\.:_:g' -e 's:+::g' | sed 's:OPP:->:g' >> ${BUILDHISTORY_DIR_IMAGE}/depends.dot
+		done
+
+		recs=`list_package_recommends $pkg`
+		for rec in $recs ; do
+			echo "$pkg OPP $rec [style=dotted];" | sed -e 's:-:_:g' -e 's:\.:_:g' -e 's:+::g' | sed 's:OPP:->:g' >> ${BUILDHISTORY_DIR_IMAGE}/depends.dot
+		done
+	done
+	echo "}" >>  ${BUILDHISTORY_DIR_IMAGE}/depends.dot
+
+	cat ${BUILDHISTORY_DIR_IMAGE}/installed-package-sizes.tmp | sort -n -r | awk '{print $1 "\tKiB " $2}' > ${BUILDHISTORY_DIR_IMAGE}/installed-package-sizes.txt
+	rm ${BUILDHISTORY_DIR_IMAGE}/installed-package-sizes.tmp
+
+	# Produce some cut-down graphs (for readability)
+	grep -v kernel_image ${BUILDHISTORY_DIR_IMAGE}/depends.dot | grep -v kernel_2 | grep -v kernel_3 > ${BUILDHISTORY_DIR_IMAGE}/depends-nokernel.dot
+	grep -v libc6 ${BUILDHISTORY_DIR_IMAGE}/depends-nokernel.dot | grep -v libgcc > ${BUILDHISTORY_DIR_IMAGE}/depends-nokernel-nolibc.dot
+	grep -v update_ ${BUILDHISTORY_DIR_IMAGE}/depends-nokernel-nolibc.dot > ${BUILDHISTORY_DIR_IMAGE}/depends-nokernel-nolibc-noupdate.dot
+	grep -v kernel_module ${BUILDHISTORY_DIR_IMAGE}/depends-nokernel-nolibc-noupdate.dot > ${BUILDHISTORY_DIR_IMAGE}/depends-nokernel-nolibc-noupdate-nomodules.dot
+
+	# Workaround for broken shell function dependencies
+	if false ; then
+		get_package_filename
+		list_package_depends
+		list_package_recommends
+	fi
+}
+
+buildhistory_get_imageinfo() {
+	# List the files in the image, but exclude date/time etc.
+	# This awk script is somewhat messy, but handles where the size is not printed for device files under pseudo
+	find ${IMAGE_ROOTFS} -ls | awk '{ if ( $7 ~ /[0-9]/ ) printf "%s %10-s %10-s %10s %s %s %s\n", $3, $5, $6, $7, $11, $12, $13 ; else printf "%s %10-s %10-s %10s %s %s %s\n", $3, $5, $6, 0, $10, $11, $12 }' > ${BUILDHISTORY_DIR_IMAGE}/files-in-image.txt
+
+	# Add some configuration information
+	echo "${MACHINE}: ${IMAGE_BASENAME} configured for ${DISTRO} ${DISTRO_VERSION}" > ${BUILDHISTORY_DIR_IMAGE}/build-id
+	echo "${@buildhistory_get_layers(d)}" >> ${BUILDHISTORY_DIR_IMAGE}/build-id
+}
+
+# By prepending we get in before the removal of packaging files
+ROOTFS_POSTPROCESS_COMMAND =+ "buildhistory_get_image_installed ; "
+
+IMAGE_POSTPROCESS_COMMAND += " buildhistory_get_imageinfo ; "
+
+def buildhistory_get_layers(d):
+	layertext = "Configured metadata layers:\n%s\n" % '\n'.join(get_layers_branch_rev(d))
+	return layertext
+
+
+buildhistory_commit() {
+	( cd ${BUILDHISTORY_DIR}/
+		git add ${BUILDHISTORY_DIR}/*
+		git commit ${BUILDHISTORY_DIR}/ -m "Build ${BUILDNAME} for machine ${MACHINE} configured for ${DISTRO} ${DISTRO_VERSION}" --author "${BUILDHISTORY_COMMIT_AUTHOR}" > /dev/null
+		if [ "${BUILDHISTORY_PUSH_REPO}" != "" ] ; then
+			git push -q ${BUILDHISTORY_PUSH_REPO}
+		fi) || true
+}
+
+python buildhistory_eventhandler() {
+	import bb.build
+	import bb.event
+
+	if isinstance(e, bb.event.BuildCompleted):
+		if e.data.getVar("BUILDHISTORY_COMMIT", True) == "1":
+			bb.build.exec_func("buildhistory_commit", e.data)
+}
+
+addhandler buildhistory_eventhandler
diff --git a/meta/classes/rootfs_ipk.bbclass b/meta/classes/rootfs_ipk.bbclass
index 4a5a2dd..b4b95c5 100644
--- a/meta/classes/rootfs_ipk.bbclass
+++ b/meta/classes/rootfs_ipk.bbclass
@@ -143,11 +143,36 @@ remove_packaging_data_files() {
         mkdir ${IMAGE_ROOTFS}${opkglibdir}
 }
 
+list_installed_packages() {
+	grep ^Package: ${IMAGE_ROOTFS}${opkglibdir}/status | sed "s/^Package: //"
+}
+
+get_package_filename() {
+	name=`opkg-cl ${IPKG_ARGS} info $1 | grep -B 7 -A 7 "^Status.* \(\(installed\)\|\(unpacked\)\)" | awk '/^Package/ {printf $2"_"}'`
+	name=$name`opkg-cl ${IPKG_ARGS} info $1 | grep -B 7 -A 7 "^Status.* \(\(installed\)\|\(unpacked\)\)" | awk -F: '/^Version/ {printf $NF"_"}' | sed 's/^\s*//g'`
+	name=$name`opkg-cl ${IPKG_ARGS} info $1 | grep -B 7 -A 7 "^Status.* \(\(installed\)\|\(unpacked\)\)" | awk '/^Archi/ {print $2".ipk"}'`
+
+	fullname=`find ${DEPLOY_DIR_IPK} -name "$name" || true`
+	if [ "$fullname" = "" ] ; then
+		echo $name
+	else
+		echo $fullname
+	fi
+}
+
+list_package_depends() {
+	opkg-cl ${IPKG_ARGS} info $1 | grep ^Depends | sed -e 's/^Depends: //' -e 's/,//g' -e 's:([=<>]* [0-9a-zA-Z.~\-]*)::g'
+}
+
+list_package_recommends() {
+	opkg-cl ${IPKG_ARGS} info $1 | grep ^Recommends | sed -e 's/^Recommends: //' -e 's/,//g' -e 's:([=<>]* [0-9a-zA-Z.~\-]*)::g'
+}
+
 install_all_locales() {
 
     PACKAGES_TO_INSTALL=""
 
-    INSTALLED_PACKAGES=`grep ^Package: ${IMAGE_ROOTFS}${opkglibdir}/status |sed "s/^Package: //"|egrep -v -- "(-locale-|-dev$|-doc$|^kernel|^glibc|^ttf|^task|^perl|^python)"`
+    INSTALLED_PACKAGES=`list_installed_packages | egrep -v -- "(-locale-|-dev$|-doc$|^kernel|^glibc|^ttf|^task|^perl|^python)"`
 
     for pkg in $INSTALLED_PACKAGES
     do
diff --git a/meta/classes/rootfs_rpm.bbclass b/meta/classes/rootfs_rpm.bbclass
index 6973008..5fd45d7 100644
--- a/meta/classes/rootfs_rpm.bbclass
+++ b/meta/classes/rootfs_rpm.bbclass
@@ -160,16 +160,47 @@ remove_packaging_data_files() {
 	rm -rf ${IMAGE_ROOTFS}${opkglibdir}
 }
 
+RPM_QUERY_CMD = '${RPM} --root ${IMAGE_ROOTFS} -D "_dbpath ${rpmlibdir}" \
+		-D "__dbi_txn create nofsync private"'
+
+list_installed_packages() {
+	${RPM_QUERY_CMD} -qa --qf "[%{NAME}\n]"
+}
+
+get_package_filename() {
+	resolve_package_rpm ${RPMCONF_TARGET_BASE}-base_archs.conf $1
+}
+
+list_package_depends() {
+	pkglist=`list_installed_packages`
+
+	for req in `${RPM_QUERY_CMD} -q --qf "[%{REQUIRES}\n]" $1`; do
+		if echo "$req" | grep -q "^rpmlib" ; then continue ; fi
+
+		realpkg=""
+		for dep in $pkglist; do
+			if [ "$dep" = "$req" ] ; then
+				realpkg="1"
+				echo $req
+				break
+			fi
+		done
+
+		if [ "$realdep" = "" ] ; then
+			${RPM_QUERY_CMD} -q --whatprovides $req --qf "%{NAME}\n"
+		fi
+	done
+}
+
+list_package_recommends() {
+	:
+}
 
 install_all_locales() {
 	PACKAGES_TO_INSTALL=""
 
 	# Generate list of installed packages...
-	INSTALLED_PACKAGES=$( \
-		${RPM} --root ${IMAGE_ROOTFS} -D "_dbpath ${rpmlibdir}" \
-		-D "__dbi_txn create nofsync private" \
-		-qa --qf "[%{NAME}\n]" | egrep -v -- "(-locale-|-dev$|-doc$|^kernel|^glibc|^ttf|^task|^perl|^python)" \
-	)
+	INSTALLED_PACKAGES=`list_installed_packages | egrep -v -- "(-locale-|-dev$|-doc$|^kernel|^glibc|^ttf|^task|^perl|^python)"`
 
 	# This would likely be faster if we did it in one transaction
 	# but this should be good enough for the few users of this function...
-- 
1.7.5.4



