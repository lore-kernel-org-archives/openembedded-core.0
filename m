Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 27BA7606D1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Feb 2016 23:49:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u1GNntsW016415 for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Feb 2016 23:49:55 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id F7pm4JTMxeib
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Feb 2016 23:49:55 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u1GNnqiJ016412
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Feb 2016 23:49:53 GMT
Message-ID: <1455666592.28376.31.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Tue, 16 Feb 2016 23:49:52 +0000
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Subject: [PATCH] rng-tools: Fix underquoted m4 and libgcrypt floating dependency
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
X-List-Received-Date: Tue, 16 Feb 2016 23:49:57 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

The underquoted m4 caused build failures if libgcrypt wasn't present. The floating
dependency on libgcrypt was just plain incorrect, particularly given the incorrect
libgcrypt RDEPENDS. Change to use PACKAGECONFIG an default to on.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/recipes-support/rng-tools/rng-tools/underquote.patch b/meta/recipes-support/rng-tools/rng-tools/underquote.patch
new file mode 100644
index 0000000..1422571
--- /dev/null
+++ b/meta/recipes-support/rng-tools/rng-tools/underquote.patch
@@ -0,0 +1,31 @@
+Fix underquoted m4 entry. This causes a failure if gcrypt isn't present:
+
+| configure: libgcrypt support disabled
+| ../rng-tools-5/configure: line 4345: ac_fn_c_try_link: command not found
+| configure: error: in `/media/build1/poky/build/tmp/work/i586-poky-linux/rng-tools/5-r0/build':
+
+RP
+2016/2/16
+
+Index: rng-tools-5/configure.ac
+===================================================================
+--- rng-tools-5.orig/configure.ac
++++ rng-tools-5/configure.ac
+@@ -71,7 +71,7 @@ AS_IF(
+ 	[test "x$with_libgcrypt" != "xno"],
+ 	[
+ 		AC_CHECK_HEADER([gcrypt.h],
+-			AC_CHECK_LIB(
++			[AC_CHECK_LIB(
+ 				[gcrypt],
+ 				[gcry_check_version], ,
+ 				[
+@@ -80,7 +80,7 @@ AS_IF(
+ 						AC_MSG_NOTICE([libgcrypt support disabled])
+ 					fi
+ 				]
+-			),
++			)],
+ 			[if test "x$with_libgcrypt" != "xcheck"; then
+ 				AC_MSG_FAILURE([libgcrypt headers not found]); else
+ 				AC_MSG_NOTICE([libgcrypt support disabled])
diff --git a/meta/recipes-support/rng-tools/rng-tools_5.bb b/meta/recipes-support/rng-tools/rng-tools_5.bb
index 9a19d1c..bc67990 100644
--- a/meta/recipes-support/rng-tools/rng-tools_5.bb
+++ b/meta/recipes-support/rng-tools/rng-tools_5.bb
@@ -5,6 +5,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=0b6f033afe6db235e559456585dc8cdc"
 SRC_URI = "http://heanet.dl.sourceforge.net/sourceforge/gkernel/${BP}.tar.gz \
            file://0001-If-the-libc-is-lacking-argp-use-libargp.patch \
            file://0002-Add-argument-to-control-the-libargp-dependency.patch \
+           file://underquote.patch \
            file://init \
            file://default"
 
@@ -20,12 +21,11 @@ python () {
 
 inherit autotools update-rc.d
 
-PACKAGECONFIG = ""
+PACKAGECONFIG = "libgcrypt"
 PACKAGECONFIG_libc-musl = "libargp"
 PACKAGECONFIG_libc-uclibc = "libargp"
 PACKAGECONFIG[libargp] = "--with-libargp,--without-libargp,argp-standalone,"
-
-RDEPENDS_${PN} = "libgcrypt"
+PACKAGECONFIG[libgcrypt] = "--with-libgcrypt,--without-libgcrypt,libgcrypt,"
 
 do_install_append() {
     # Only install the init script when 'sysvinit' is in DISTRO_FEATURES.



