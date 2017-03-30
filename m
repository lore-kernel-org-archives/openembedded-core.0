Return-Path: <richard@rpsys.net>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 8276877CFD
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Mar 2017 15:27:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTP id v2UFRg3X010221; 
	Thu, 30 Mar 2017 16:27:43 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id M-fWSWS9A0Dp; Thu, 30 Mar 2017 16:27:43 +0100 (BST)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v2UFRemi010203
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Thu, 30 Mar 2017 16:27:41 +0100
Received: from richard by hex with local (Exim 4.86_2)
	(envelope-from <richard@rpsys.net>)
	id 1ctbzA-000757-8m; Thu, 30 Mar 2017 16:27:40 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Thu, 30 Mar 2017 16:27:35 +0100
Message-Id: <1490887659-27179-1-git-send-email-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH 1/5] multilib_header: Update wrapper to handle arm 32/64 bit
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
X-List-Received-Date: Thu, 30 Mar 2017 15:27:45 -0000

Having arm 32/64 bit headers coexisting turns out to be tricky. Unfortunately
our wrapper works using wordsize.h and this differs on arm so we can't use it.

Therefore replicate the logic here for arm. I did look into writing our
own wordsize.h but we also need to remap kernel headers on arm and
since wordsize.h comes from libc, that doesn't work for kernel headers.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/multilib_header.bbclass |  7 -------
 scripts/multilib_header_wrapper.h    | 26 ++++++++++++++++----------
 2 files changed, 16 insertions(+), 17 deletions(-)

diff --git a/meta/classes/multilib_header.bbclass b/meta/classes/multilib_header.bbclass
index 304c28e..e03f5b1 100644
--- a/meta/classes/multilib_header.bbclass
+++ b/meta/classes/multilib_header.bbclass
@@ -13,13 +13,9 @@ oe_multilib_header() {
 		;;
 	*)
 	esac
-        # We use
-        # For ARM: We don't support multilib builds.
         # For MIPS: "n32" is a special case, which needs to be
         # distinct from both 64-bit and 32-bit.
         case ${TARGET_ARCH} in
-        arm*)   return
-                ;;
         mips*)  case "${MIPSPKGSFX_ABI}" in
                 "-n32")
                        ident=n32   
@@ -31,9 +27,6 @@ oe_multilib_header() {
                 ;;
         *)      ident=${SITEINFO_BITS}
         esac
-	if echo ${TARGET_ARCH} | grep -q arm; then
-	    return
-	fi
 	for each_header in "$@" ; do
 	   if [ ! -f "${D}/${includedir}/$each_header" ]; then
 	      bberror "oe_multilib_header: Unable to find header $each_header."
diff --git a/scripts/multilib_header_wrapper.h b/scripts/multilib_header_wrapper.h
index 5a87540..f516673 100644
--- a/scripts/multilib_header_wrapper.h
+++ b/scripts/multilib_header_wrapper.h
@@ -21,11 +21,23 @@
  * 
  */
 
-#include <bits/wordsize.h>
 
-#ifdef __WORDSIZE
+#if defined (__arm__)
+#define __MHWORDSIZE			32
+#elif defined (__aarch64__) && defined ( __LP64__)
+#define __MHWORDSIZE			64
+#elif defined (__aarch64__)
+#define __MHWORDSIZE			32
+#else
+#include <bits/wordsize.h>
+#if defined (__WORDSIZE)
+#define __MHWORDSIZE			__WORDSIZE
+#else
+#error "__WORDSIZE is not defined"
+#endif
+#endif
 
-#if __WORDSIZE == 32
+#if __MHWORDSIZE == 32
 
 #ifdef _MIPS_SIM
 
@@ -41,15 +53,9 @@
 #include <ENTER_HEADER_FILENAME_HERE-32.h>
 #endif
 
-#elif __WORDSIZE == 64
+#elif __MHWORDSIZE == 64
 #include <ENTER_HEADER_FILENAME_HERE-64.h>
 #else
 #error "Unknown __WORDSIZE detected"
 #endif /* matches #if __WORDSIZE == 32 */
-
-#else /* __WORDSIZE is not defined */
-
-#error "__WORDSIZE is not defined"
-
-#endif
   
-- 
2.7.4


