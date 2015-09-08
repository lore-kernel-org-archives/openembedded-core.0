Return-Path: <alejandro.delcastillo@ni.com>
Received: from ni.com (skprod3.natinst.com [130.164.80.24])
	by mail.openembedded.org (Postfix) with ESMTP id 6BA7365C8A
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Sep 2015 19:24:51 +0000 (UTC)
Received: from us-aus-mgwout1.amer.corp.natinst.com (nb-snip2-1338.natinst.com
	[130.164.19.135])
	by us-aus-skprod3.natinst.com (8.15.0.59/8.15.0.59) with ESMTP id
	t88JOpfs005956 for <openembedded-core@lists.openembedded.org>;
	Tue, 8 Sep 2015 14:24:51 -0500
Received: from delcastillo2.natinst.com ([130.164.14.198])
	by us-aus-mgwout1.amer.corp.natinst.com (Lotus Domino Release 8.5.3FP6
	HF1218) with ESMTP id 2015090814245098-1486075 ;
	Tue, 8 Sep 2015 14:24:50 -0500 
From: Alejandro del Castillo <alejandro.delcastillo@ni.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 8 Sep 2015 14:24:49 -0500
Message-Id: <1441740289-19755-1-git-send-email-alejandro.delcastillo@ni.com>
X-Mailer: git-send-email 1.9.1
X-MIMETrack: Itemize by SMTP Server on US-AUS-MGWOut1/AUS/H/NIC(Release
	8.5.3FP6 HF1218|December 12, 2014) at 09/08/2015 02:24:50 PM,
	Serialize by Router on US-AUS-MGWOut1/AUS/H/NIC(Release 8.5.3FP6
	HF1218|December 12, 2014) at 09/08/2015 02:24:51 PM,
	Serialize complete at 09/08/2015 02:24:51 PM
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2015-09-08_09:, , signatures=0
Subject: [PATCHv3] adt-installer: upgrade to opkg 0.3.0
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
X-List-Received-Date: Tue, 08 Sep 2015 19:24:52 -0000

- Opkg 0.3.0 deprecated --disable-shave & --withopkglibdir options.
- Add -i option to autoreconf since opkg tarball is missing conf.compile.
- Recreate wget_cache.patch

Signed-off-by: Alejandro del Castillo <alejandro.delcastillo@ni.com>
---
 .../installer/adt-installer/adt_installer          |  4 ++--
 .../installer/adt-installer/scripts/data_define    |  1 -
 .../installer/adt-installer_1.0.bb                 |  6 ++---
 .../installer/files/wget_cache.patch               | 27 ++++++++++++++--------
 4 files changed, 23 insertions(+), 15 deletions(-)

Changes from v3: remove PR version bump

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
index 346fd9e..22e3850 100644
--- a/meta/recipes-devtools/installer/adt-installer_1.0.bb
+++ b/meta/recipes-devtools/installer/adt-installer_1.0.bb
@@ -37,7 +37,7 @@ ADT_DEPLOY = "${DEPLOY_DIR}/sdk/"
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


