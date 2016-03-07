Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 1B17760111
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Mar 2016 10:46:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u27AkHCH008656 for <openembedded-core@lists.openembedded.org>;
	Mon, 7 Mar 2016 10:46:17 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id tHzVhOmnZqGU
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Mar 2016 10:46:17 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u27AkBFm008652
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 7 Mar 2016 10:46:12 GMT
Message-ID: <1457347571.2804.102.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Mon, 07 Mar 2016 10:46:11 +0000
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Subject: [PATCH] glibc: Add relocation of GCONV_PATH
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
X-List-Received-Date: Mon, 07 Mar 2016 10:46:19 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

We're seeing various failures where nativesdk glibc can't find the gconv 
modules. We've tried various workaround but this needs fixing
'properly'.
One significant problem is knowing when a binary would use this glibc
and 
hence when to set the path and when not to.

Add the default path to its own special section which the sdk
relocation
script already knows how to handle and remap.

This significantly improves the usability of uninative.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/recipes-core/glibc/glibc/0003-nativesdk-glibc-Raise-the-size-of-arrays-containing-.patch b/meta/recipes-core/glibc/glibc/0003-nativesdk-glibc-Raise-the-size-of-arrays-containing-.patch
index dde94b4..60f9f17 100644
--- a/meta/recipes-core/glibc/glibc/0003-nativesdk-glibc-Raise-the-size-of-arrays-containing-.patch
+++ b/meta/recipes-core/glibc/glibc/0003-nativesdk-glibc-Raise-the-size-of-arrays-containing-.patch
@@ -121,6 +121,16 @@ index 70d4aeb..5c726d0 100644
  #ifndef add_system_dir
  # define add_system_dir(dir) add_dir (dir)
  #endif
--- 
-2.6.4
-
+Index: git/iconv/gconv_conf.c
+===================================================================
+--- git.orig/iconv/gconv_conf.c
++++ git/iconv/gconv_conf.c
+@@ -36,7 +36,7 @@
+ 
+ 
+ /* This is the default path where we look for module lists.  */
+-static const char default_gconv_path[] = GCONV_PATH;
++static char default_gconv_path[4096] __attribute__ ((section (".gccrelocprefix"))) = GCONV_PATH;
+ 
+ /* The path elements, as determined by the __gconv_get_path function.
+    All path elements end in a slash.  */



