Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 67CEF607A5
	for <openembedded-core@lists.openembedded.org>;
	Sat,  6 Feb 2016 22:50:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u16Mon6i004270 for <openembedded-core@lists.openembedded.org>;
	Sat, 6 Feb 2016 22:50:49 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id nQRo1XVK8U3i
	for <openembedded-core@lists.openembedded.org>;
	Sat,  6 Feb 2016 22:50:49 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u16Molkb004265
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Sat, 6 Feb 2016 22:50:48 GMT
Message-ID: <1454799047.27087.316.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Sat, 06 Feb 2016 22:50:47 +0000
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Subject: [PATCH] bitbake.conf/native/nativesdk: Set PKG_CONFIG_SYSTEM_ at top level
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
X-List-Received-Date: Sat, 06 Feb 2016 22:50:53 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Setting PKG_CONFIG_SYSTEM_{HEADERS/INCLUDE}_PATH for nativesdk isn't
enough, we also need to deal with multlib cases where libdir from
pkg-config-native isn't correct. Native builds are about the only
case where this variable shouldn't be set.

Therefore move the code from nativesdk to bitbake.conf and unexport it
in the native case.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/classes/native.bbclass b/meta/classes/native.bbclass
index a3a5c8c..f67ef00 100644
--- a/meta/classes/native.bbclass
+++ b/meta/classes/native.bbclass
@@ -106,6 +106,8 @@ PKG_CONFIG_DIR = "${libdir}/pkgconfig"
 EXTRA_NATIVE_PKGCONFIG_PATH ?= ""
 PKG_CONFIG_PATH .= "${EXTRA_NATIVE_PKGCONFIG_PATH}"
 PKG_CONFIG_SYSROOT_DIR = ""
+PKG_CONFIG_SYSTEM_LIBRARY_PATH[unexport] = "1"
+PKG_CONFIG_SYSTEM_INCLUDE_PATH[unexport] = "1"
 
 # we dont want libc-uclibc or libc-glibc to kick in for native recipes
 LIBCOVERRIDE = ""
diff --git a/meta/classes/nativesdk.bbclass b/meta/classes/nativesdk.bbclass
index 44154d9..f74da62 100644
--- a/meta/classes/nativesdk.bbclass
+++ b/meta/classes/nativesdk.bbclass
@@ -60,8 +60,6 @@ sbindir = "${bindir}"
 
 export PKG_CONFIG_DIR = "${STAGING_DIR_HOST}${libdir}/pkgconfig"
 export PKG_CONFIG_SYSROOT_DIR = "${STAGING_DIR_HOST}"
-export PKG_CONFIG_SYSTEM_LIBRARY_PATH = "${base_libdir}:${libdir}"
-export PKG_CONFIG_SYSTEM_INCLUDE_PATH = "${includedir}"
 
 python nativesdk_virtclass_handler () {
     pn = e.data.getVar("PN", True)
diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index f6df360..4b5dd3b 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -655,6 +655,8 @@ export PKG_CONFIG_PATH = "${PKG_CONFIG_DIR}:${STAGING_DATADIR}/pkgconfig"
 export PKG_CONFIG_LIBDIR = "${PKG_CONFIG_DIR}"
 export PKG_CONFIG_SYSROOT_DIR = "${STAGING_DIR_HOST}"
 export PKG_CONFIG_DISABLE_UNINSTALLED = "yes"
+export PKG_CONFIG_SYSTEM_LIBRARY_PATH = "${base_libdir}:${libdir}"
+export PKG_CONFIG_SYSTEM_INCLUDE_PATH = "${includedir}"
 
 ###
 ### Config file processing



