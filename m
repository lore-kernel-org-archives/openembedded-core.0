Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1PwkrG-0002OJ-DJ
	for openembedded-core@lists.openembedded.org;
	Tue, 08 Mar 2011 01:33:02 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 07 Mar 2011 16:31:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.62,280,1297065600"; d="scan'208";a="894806186"
Received: from unknown (HELO localhost) ([10.255.12.99])
	by fmsmga001.fm.intel.com with ESMTP; 07 Mar 2011 16:29:33 -0800
Message-Id: <90d4624f0c5de6a35eace1f13c3e04df9737390c.1299544029.git.sgw@linux.intel.com>
In-Reply-To: <cover.1299544029.git.sgw@linux.intel.com>
References: <cover.1299544029.git.sgw@linux.intel.com>
Old-Date: Mon, 7 Mar 2011 13:10:42 +0800
Date: Mon, 07 Mar 2011 16:29:33 -0800
To: poky@yoctoproject.org,openembedded-core@lists.openembedded.org
From: Saul Wold <sgw@linux.intel.com>
X-Mailman-Approved-At: Tue, 08 Mar 2011 08:18:44 +0100
Cc: Koen Kooi <koen@dominion.thruhere.net>, Liping Ke <liping.ke@intel.com>,
	Dongxiao Xu <dongxiao.xu@intel.com>,
	Jingdong Lu <jingdong.lu@windriver.com>
Subject: [PATCH 4/8] adt: Update to svn r596 to fix symbolic link issues
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
X-List-Received-Date: Tue, 08 Mar 2011 00:33:02 -0000

From: Liping Ke <liping.ke@intel.com>

See the longlinksfix patch for details but symlinks over 100 chars long
were broken in sdk tarballs and its due to problems in the inbuilt tar in
libbb in opkg. svn r596 has already fixed the problem.

Signed-off-by: Liping Ke <liping.ke@intel.com>
---
 .../conf/distro/include/poky-default-revisions.inc |    1 +
 .../installer/adt-installer/adt_installer          |    2 +-
 .../installer/adt-installer_1.0.bb                 |    8 ++++----
 3 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/meta/conf/distro/include/poky-default-revisions.inc b/meta/conf/distro/include/poky-default-revisions.inc
index 5045c9e..36202a1 100644
--- a/meta/conf/distro/include/poky-default-revisions.inc
+++ b/meta/conf/distro/include/poky-default-revisions.inc
@@ -140,6 +140,7 @@ OPKGSRCREV = "596"
 SRCREV_pn-opkg ??= "${OPKGSRCREV}"
 SRCREV_pn-opkg-native ??= "${OPKGSRCREV}"
 SRCREV_pn-opkg-nativesdk ??= "${OPKGSRCREV}"
+SRCREV_pn-adt-installer ??= "${OPKGSRCREV}"
 SRCREV_pn-opkg-nogpg ??= "${OPKGSRCREV}"
 SRCREV_pn-opkg-nogpg-native ??= "${OPKGSRCREV}"
 SRCREV_pn-opkg-nogpg-nativesdk ??= "${OPKGSRCREV}"
diff --git a/meta/recipes-devtools/installer/adt-installer/adt_installer b/meta/recipes-devtools/installer/adt-installer/adt_installer
index 2448d2b..b1b4970 100755
--- a/meta/recipes-devtools/installer/adt-installer/adt_installer
+++ b/meta/recipes-devtools/installer/adt-installer/adt_installer
@@ -170,7 +170,7 @@ if [ ! -x "$LOCAL_OPKG_LOC/bin/opkg-cl" ]; then
   check_result
 
   echo_info "Configure opkg ...\n"
-  ./configure --prefix=$parent_folder/$LOCAL_OPKG_LOC --with-opkglibdir=$OPKG_LIBDIR --disable-curl --disable-ssl-curl --disable-gpg --disable-shave >> $parent_folder/$YOCTOADT_INSTALL_LOG_FILE
+  ./autogen.sh --prefix=$parent_folder/$LOCAL_OPKG_LOC --with-opkglibdir=$OPKG_LIBDIR --disable-curl --disable-ssl-curl --disable-gpg --disable-shave >> $parent_folder/$YOCTOADT_INSTALL_LOG_FILE
   check_result
 
   echo_info "Make opkg ...\n"
diff --git a/meta/recipes-devtools/installer/adt-installer_1.0.bb b/meta/recipes-devtools/installer/adt-installer_1.0.bb
index e865971..50290f9 100644
--- a/meta/recipes-devtools/installer/adt-installer_1.0.bb
+++ b/meta/recipes-devtools/installer/adt-installer_1.0.bb
@@ -39,7 +39,8 @@ YOCTOADT_VERSION = "${SDK_VERSION}"
 
 inherit deploy
 
-SRC_URI = "http://opkg.googlecode.com/files/opkg-0.1.8.tar.gz \
+PV = "0.1.8+svnr${SRCPV}"
+SRC_URI = "svn://opkg.googlecode.com/svn;module=trunk;proto=http \
            file://adt_installer \
            file://scripts/adt_installer_internal \
            file://scripts/util \
@@ -49,8 +50,6 @@ SRC_URI = "http://opkg.googlecode.com/files/opkg-0.1.8.tar.gz \
            file://opkg/conf/opkg-sdk-x86_64.conf \
            file://opkg/conf/opkg-sdk-i686.conf \
 	  "
-SRC_URI[md5sum] = "c714ce0e4863bf1315e3b6913ffe3299"
-SRC_URI[sha256sum] = "ff94bf30bd662d49c4b5057e3a0818d062731adaa555d59abd677ec32a3c1c60"
 
 fakeroot do_deploy () {
 	cd ${WORKDIR}
@@ -59,7 +58,8 @@ fakeroot do_deploy () {
 	rm -rf ${ADT_DIR}
 	mkdir -p ${ADT_DIR}/opkg/build
 	cp -r opkg ${ADT_DIR}/
-	cp -r opkg-0.1.8 ${ADT_DIR}/opkg/build/
+	cp -r trunk ${ADT_DIR}/opkg/build/
+	mv ${ADT_DIR}/opkg/build/trunk ${ADT_DIR}/opkg/build/opkg-svn
 	cp -r scripts ${ADT_DIR}/
 	cp adt_installer ${ADT_DIR}
 	cp adt_installer.conf ${ADT_DIR}
-- 
1.7.1.1



