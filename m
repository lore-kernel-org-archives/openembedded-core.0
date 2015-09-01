Return-Path: <alejandro.delcastillo@ni.com>
Received: from ni.com (skprod3.natinst.com [130.164.80.24])
	by mail.openembedded.org (Postfix) with ESMTP id 97AE676FC9
	for <openembedded-core@lists.openembedded.org>;
	Tue,  1 Sep 2015 23:28:49 +0000 (UTC)
Received: from us-aus-mgwout1.amer.corp.natinst.com (nb-snip2-1338.natinst.com
	[130.164.19.135])
	by us-aus-skprod3.natinst.com (8.15.0.59/8.15.0.59) with ESMTP id
	t81NSmVE016210; Tue, 1 Sep 2015 18:28:48 -0500
Received: from delcastillo2.natinst.com ([130.164.14.198])
	by us-aus-mgwout1.amer.corp.natinst.com (Lotus Domino Release 8.5.3FP6
	HF1218) with ESMTP id 2015090118284850-1057494 ;
	Tue, 1 Sep 2015 18:28:48 -0500 
From: Alejandro del Castillo <alejandro.delcastillo@ni.com>
To: richard.purdie@linuxfoundation.org,
	openembedded-core@lists.openembedded.org
Date: Tue, 1 Sep 2015 18:28:31 -0500
Message-Id: <1441150111-12422-1-git-send-email-alejandro.delcastillo@ni.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1441117073-23911-1-git-send-email-alejandro.delcastillo@ni.com>
References: <1441117073-23911-1-git-send-email-alejandro.delcastillo@ni.com>
X-MIMETrack: Itemize by SMTP Server on US-AUS-MGWOut1/AUS/H/NIC(Release
	8.5.3FP6 HF1218|December 12, 2014) at 09/01/2015 06:28:48 PM,
	Serialize by Router on US-AUS-MGWOut1/AUS/H/NIC(Release 8.5.3FP6
	HF1218|December 12, 2014) at 09/01/2015 06:28:48 PM,
	Serialize complete at 09/01/2015 06:28:48 PM
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2015-09-02_01:, , signatures=0
Subject: [PATCH] adt-installer: upgrade to opkg 0.3.0
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 01 Sep 2015 23:28:51 -0000

- Opkg 0.3.0 deprecated --disable-shave & --withopkglibdir options.
- Add -i option to autoreconf since opkg tarball is missing
  conf.compile.
- Recreate wget_cache.patch
- Bump PR version.

Signed-off-by: Alejandro del Castillo <alejandro.delcastillo@ni.com>

This patch can be squashed with the opkg upgrade to 0.3.0 commit.
---
 .../installer/adt-installer/adt_installer          |  4 ++--
 .../installer/adt-installer/scripts/data_define    |  1 -
 .../installer/adt-installer_1.0.bb                 |  8 +++----
 .../installer/files/wget_cache.patch               | 27 ++++++++++++++--------
 4 files changed, 24 insertions(+), 16 deletions(-)

diff --git a/meta/recipes-devtools/installer/adt-installer/adt_installer b/meta/recipes-devtools/installer/adt-installer/adt_installer
index 3172de7..b8cfb2e 100755
--- a/meta/recipes-devtools/installer/adt-installer/adt_installer
+++ b/meta/recipes-devtools/installer/adt-installer/adt_installer
@@ -182,8 +182,8 @@ if [ ! -x "$LOCAL_OPKG_LOC/bin/opkg" ]; then
   check_result
 
   echo_info "Configure opkg ...\n"
-  autoreconf
-  ./configure --prefix=$parent_folder/$LOCAL_OPKG_LOC --with-opkglibdir=$OPKG_LIBDIR --enable-shared=no --disable-curl --disable-ssl-curl --disable-gpg --disable-shave >> $parent_folder/$YOCTOADT_INSTALL_LOG_FILE
+  autoreconf -i
+  ./configure --prefix=$parent_folder/$LOCAL_OPKG_LOC --enable-shared=no --disable-curl --disable-ssl-curl --disable-gpg >> $parent_folder/$YOCTOADT_INSTALL_LOG_FILE
   check_result
 
   echo_info "Make opkg ...\n"
diff --git a/meta/recipes-devtools/installer/adt-installer/scripts/data_define b/meta/recipes-devtools/installer/adt-installer/scripts/data_define
index 2781e77..cfd6716 100644
--- a/meta/recipes-devtools/installer/adt-installer/scripts/data_define
+++ b/meta/recipes-devtools/installer/adt-installer/scripts/data_define
@@ -27,7 +27,6 @@ source `pwd`/$config_file
 
 LOCAL_OPKG_LOC="./opkg/build/opkg"
 LOCAL_OPKG_FOLDER="./opkg/build"
-OPKG_LIBDIR="/var/lib"
 
 # List all supported root fs types and target types,
 # it will be used in user configuration validity checking
diff --git a/meta/recipes-devtools/installer/adt-installer_1.0.bb b/meta/recipes-devtools/installer/adt-installer_1.0.bb
index 346fd9e..336cda3 100644
--- a/meta/recipes-devtools/installer/adt-installer_1.0.bb
+++ b/meta/recipes-devtools/installer/adt-installer_1.0.bb
@@ -31,13 +31,13 @@ LICENSE = "MIT"
 PACKAGES = ""
 INHIBIT_DEFAULT_DEPS = "1"
 
-PR = "r11"
+PR = "r12"
 
 ADT_DEPLOY = "${DEPLOY_DIR}/sdk/"
 ADT_DIR = "${WORKDIR}/adt-installer/"
 S = "${WORKDIR}/opkg-${PV}"
 
-PV = "0.2.0"
+PV = "0.3.0"
 SRC_URI = "http://downloads.yoctoproject.org/releases/opkg/opkg-${PV}.tar.gz \
            file://wget_cache.patch \
            file://adt_installer \
@@ -50,8 +50,8 @@ SRC_URI = "http://downloads.yoctoproject.org/releases/opkg/opkg-${PV}.tar.gz \
            file://opkg/conf/opkg-sdk-i686.conf \
 	  "
 
-SRC_URI[md5sum] = "e8a6fd34fb2529191fe09dc14c934cc3"
-SRC_URI[sha256sum] = "81b7055eb4c12c5e5652339305c9236cf357890717d4bea063963f3f434d966f"
+SRC_URI[md5sum] = "3412cdc71d78b98facc84b19331ec64e"
+SRC_URI[sha256sum] = "7f735d1cdb8ef3718fb0f9fba44ca0d9a5c90d3a7f014f37a6d2f9474f54988f"
 
 ADTREPO ?= "http://adtrepo.yoctoproject.org/${SDK_VERSION}"
 
diff --git a/meta/recipes-devtools/installer/files/wget_cache.patch b/meta/recipes-devtools/installer/files/wget_cache.patch
index 1281d12..9117510 100644
--- a/meta/recipes-devtools/installer/files/wget_cache.patch
+++ b/meta/recipes-devtools/installer/files/wget_cache.patch
@@ -1,12 +1,21 @@
 Upstream-Status: Inappropriate [configuration]
 
---- trunk/libopkg/opkg_download.c	2011-03-10 16:41:29.000000000 +0800
-+++ trunk/libopkg/opkg_download.c	2011-03-10 16:42:33.000000000 +0800
-@@ -162,6 +162,7 @@
+---
+ libopkg/opkg_download_wget.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/libopkg/opkg_download_wget.c b/libopkg/opkg_download_wget.c
+index 9001493..18ef91e 100644
+--- a/libopkg/opkg_download_wget.c
++++ b/libopkg/opkg_download_wget.c
+@@ -50,6 +50,7 @@ int opkg_download_backend(const char *src, const char *dest,
  
-       argv[i++] = "wget";
-       argv[i++] = "-q";
-+      argv[i++] = "--no-cache";
-       if (conf->http_proxy || conf->ftp_proxy) {
- 	argv[i++] = "-Y";
- 	argv[i++] = "on";
+     argv[i++] = "wget";
+     argv[i++] = "-q";
++    argv[i++] = "--no-cache";
+     if (opkg_config->http_proxy || opkg_config->ftp_proxy) {
+         argv[i++] = "-Y";
+         argv[i++] = "on";
+-- 
+1.9.1
+
-- 
1.9.1


