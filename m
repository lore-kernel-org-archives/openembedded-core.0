Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1SaDDV-0003Il-9u
	for openembedded-core@lists.openembedded.org;
	Thu, 31 May 2012 23:47:37 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.3/8.14.3) with ESMTP id q4VLbGgh009942
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 May 2012 14:37:16 -0700 (PDT)
Received: from localhost.localdomain (172.25.34.61) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Thu, 31 May 2012 14:37:16 -0700
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 31 May 2012 16:42:05 -0500
Message-ID: <53600bd8863c22153cca1d79ad1eb514c80d384b.1338500281.git.mark.hatle@windriver.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1338500281.git.mark.hatle@windriver.com>
References: <cover.1338500281.git.mark.hatle@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [172.25.34.61]
Subject: [PATCH 4/5 v3] package_rpm: Add capability to directly query packageorigin
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
X-List-Received-Date: Thu, 31 May 2012 21:47:37 -0000
Content-Type: text/plain

Add functionality to RPM to directly query the packageorigin (path) from
the resolver database, instead of having to do this via an indirect method.

This results in a minor performance improvement.

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 meta/classes/package_rpm.bbclass                   |   18 +++++++-------
 .../rpm/rpm/rpm-packageorigin.patch                |   23 ++++++++++++++++++++
 meta/recipes-devtools/rpm/rpm_5.4.9.bb             |    3 +-
 3 files changed, 34 insertions(+), 10 deletions(-)
 create mode 100644 meta/recipes-devtools/rpm/rpm/rpm-packageorigin.patch

diff --git a/meta/classes/package_rpm.bbclass b/meta/classes/package_rpm.bbclass
index 35928ab..097fa12 100644
--- a/meta/classes/package_rpm.bbclass
+++ b/meta/classes/package_rpm.bbclass
@@ -130,12 +130,12 @@ resolve_package_rpm () {
 	shift
 	local pkg_name=""
 	for solve in `cat ${conffile}`; do
-		pkg_name=$(${RPM} -D "_dbpath $solve" -D "__dbi_txn create nofsync" -q --yaml $@ | grep -i 'Packageorigin' | cut -d : -f 2)
-		if [ -n "$pkg_name" ]; then
+		pkg_name=$(${RPM} -D "_dbpath $solve" -D "__dbi_txn create nofsync" -q --qf "%{packageorigin}\n" "$@" | grep -v "is not installed" || true)
+		if [ -n "$pkg_name" -a "$pkg_name" != "(none)" ]; then
+			echo $pkg_name
 			break;
 		fi
 	done
-	echo $pkg_name
 }
 
 # rpm common command and options
@@ -401,9 +401,9 @@ package_install_internal_rpm () {
 
 	# Now that we have a solution, pull out a list of what to install...
 	echo "Manifest: ${target_rootfs}/install/install.manifest"
-	${RPM} -D "_dbpath ${target_rootfs}/install" -qa --yaml \
+	${RPM} -D "_dbpath ${target_rootfs}/install" -qa --qf "%{packageorigin}\n" \
 		-D "__dbi_txn create nofsync private" \
-		| grep -i 'Packageorigin' | cut -d : -f 2 > ${target_rootfs}/install/install_solution.manifest
+		> ${target_rootfs}/install/install_solution.manifest
 
 	touch ${target_rootfs}/install/install_multilib_solution.manifest
 
@@ -421,9 +421,9 @@ package_install_internal_rpm () {
 
 		# Now that we have a solution, pull out a list of what to install...
 		echo "Manifest: ${target_rootfs}/install/install_multilib.manifest"
-		${RPM} -D "_dbpath ${target_rootfs}/install" -qa --yaml \
+		${RPM} -D "_dbpath ${target_rootfs}/install" -qa --qf "%{packageorigin}\n" \
 			-D "__dbi_txn create nofsync private" \
-			| grep -i 'Packageorigin' | cut -d : -f 2 > ${target_rootfs}/install/install_multilib_solution.manifest
+			> ${target_rootfs}/install/install_multilib_solution.manifest
 
 	fi
 
@@ -478,9 +478,9 @@ EOF
 			-U --justdb --noscripts --notriggers --noparentdirs --nolinktos --ignoresize \
 			${target_rootfs}/install/initial_install.manifest
 
-		${RPM} -D "_dbpath ${target_rootfs}/initial" -qa --yaml \
+		${RPM} -D "_dbpath ${target_rootfs}/initial" -qa --qf "%{packageorigin}\n" \
 			-D "__dbi_txn create nofsync private" \
-			| grep -i 'Packageorigin' | cut -d : -f 2 > ${target_rootfs}/install/initial_solution.manifest
+			> ${target_rootfs}/install/initial_solution.manifest
 
 		rpm_update_pkg ${target_rootfs}/install/initial_solution.manifest
 		
diff --git a/meta/recipes-devtools/rpm/rpm/rpm-packageorigin.patch b/meta/recipes-devtools/rpm/rpm/rpm-packageorigin.patch
new file mode 100644
index 0000000..3c6dad4
--- /dev/null
+++ b/meta/recipes-devtools/rpm/rpm/rpm-packageorigin.patch
@@ -0,0 +1,23 @@
+Add the ability to query the packageorigin
+
+Written by jbj at rpm5.org
+
+Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
+
+Index: rpm-5.4.8/rpmdb/hdrfmt.c
+===================================================================
+--- rpm-5.4.8.orig/rpmdb/hdrfmt.c
++++ rpm-5.4.8/rpmdb/hdrfmt.c
+@@ -2403,8 +2403,10 @@ static int pkgoriginTag(Header h, HE_t 
+     int rc = 1;
+ 
+     he->tag = RPMTAG_PACKAGEORIGIN;
+-    if (!headerGet(h, he, HEADERGET_NOEXTENSION)
+-     && (origin = headerGetOrigin(h)) != NULL)
++    /* XXX two sources for tag data: what search precedence? */
++    if (headerGet(h, he, HEADERGET_NOEXTENSION))
++	rc = 0;
++    else if ((origin = headerGetOrigin(h)) != NULL)
+     {
+ 	he->t = RPM_STRING_TYPE;
+ 	he->p.str = xstrdup(origin);
diff --git a/meta/recipes-devtools/rpm/rpm_5.4.9.bb b/meta/recipes-devtools/rpm/rpm_5.4.9.bb
index f2477a4..2fb5b97 100644
--- a/meta/recipes-devtools/rpm/rpm_5.4.9.bb
+++ b/meta/recipes-devtools/rpm/rpm_5.4.9.bb
@@ -43,7 +43,7 @@ LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=2d5025d4aa3495befef8f17206a5b0a1"
 
 DEPENDS = "libpcre attr acl popt ossp-uuid file"
-PR = "r41"
+PR = "r42"
 
 # rpm2cpio is a shell script, which is part of the rpm src.rpm.  It is needed
 # in order to extract the distribution SRPM into a format we can extract...
@@ -69,6 +69,7 @@ SRC_URI = "http://www.rpm5.org/files/rpm/rpm-5.4/rpm-5.4.9-0.20120508.src.rpm;ex
 	   file://rpm-no-perl-urpm.patch \
 	   file://rpm-lua.patch \
 	   file://rpm-ossp-uuid.patch \
+	   file://rpm-packageorigin.patch \
 	  "
 
 SRC_URI[md5sum] = "60d56ace884340c1b3fcac6a1d58e768"
-- 
1.7.3.4



