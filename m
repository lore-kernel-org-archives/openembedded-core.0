Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 21FAA6AC36
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Mar 2015 23:55:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t2QNtPCG023643; Thu, 26 Mar 2015 23:55:25 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id BvrkJ2zAp3AF; Thu, 26 Mar 2015 23:55:25 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t2QNtC26023635
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Thu, 26 Mar 2015 23:55:24 GMT
Message-ID: <1427414112.14020.170.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Thu, 26 Mar 2015 23:55:12 +0000
X-Mailer: Evolution 3.12.10-0ubuntu1~14.10.1 
Mime-Version: 1.0
Subject: [PATCH] gcc: Tweak arm multilib endian patch for baremetal
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
X-List-Received-Date: Thu, 26 Mar 2015 23:55:28 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

In a baremetal build, TARGET_ENDIAN_OPTION isn't set leading to build
failures. Add in ifdefs to avoid this.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/recipes-devtools/gcc/gcc-4.9/0015-arm-Use-TARGET_ENDIAN_OPTION-for-determining-MULTILI.patch b/meta/recipes-devtools/gcc/gcc-4.9/0015-arm-Use-TARGET_ENDIAN_OPTION-for-determining-MULTILI.patch
index ba0a227..37c46fc 100644
--- a/meta/recipes-devtools/gcc/gcc-4.9/0015-arm-Use-TARGET_ENDIAN_OPTION-for-determining-MULTILI.patch
+++ b/meta/recipes-devtools/gcc/gcc-4.9/0015-arm-Use-TARGET_ENDIAN_OPTION-for-determining-MULTILI.patch
@@ -11,26 +11,34 @@ Upstream-Status: Pending
  gcc/config/arm/linux-elf.h |    2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
-Index: gcc-4.9-20140316/gcc/config/arm/coff.h
+Index: gcc-4.9.2/gcc/config/arm/coff.h
 ===================================================================
---- gcc-4.9-20140316.orig/gcc/config/arm/coff.h
-+++ gcc-4.9-20140316/gcc/config/arm/coff.h
-@@ -33,7 +33,7 @@
+--- gcc-4.9.2.orig/gcc/config/arm/coff.h
++++ gcc-4.9.2/gcc/config/arm/coff.h
+@@ -32,8 +32,11 @@
+ #define TARGET_DEFAULT (MASK_APCS_FRAME)
  
  #ifndef MULTILIB_DEFAULTS
++#ifndef TARGET_ENDIAN_OPTION
++#define TARGET_ENDIAN_OPTION "mlittle-endian"
++#endif
  #define MULTILIB_DEFAULTS \
 -  { "marm", "mlittle-endian", "mfloat-abi=soft", "mno-thumb-interwork" }
 +  { "marm", TARGET_ENDIAN_OPTION, "mfloat-abi=soft", "mno-thumb-interwork" }
  #endif
  
  /* This is COFF, but prefer stabs.  */
-Index: gcc-4.9-20140316/gcc/config/arm/elf.h
+Index: gcc-4.9.2/gcc/config/arm/elf.h
 ===================================================================
---- gcc-4.9-20140316.orig/gcc/config/arm/elf.h
-+++ gcc-4.9-20140316/gcc/config/arm/elf.h
-@@ -112,7 +112,7 @@
+--- gcc-4.9.2.orig/gcc/config/arm/elf.h
++++ gcc-4.9.2/gcc/config/arm/elf.h
+@@ -116,8 +116,11 @@
+ #endif
  
  #ifndef MULTILIB_DEFAULTS
++#ifndef TARGET_ENDIAN_OPTION
++#define TARGET_ENDIAN_OPTION "mlittle-endian"
++#endif
  #define MULTILIB_DEFAULTS \
 -  { "marm", "mlittle-endian", "mfloat-abi=soft", "mno-thumb-interwork", "fno-leading-underscore" }
 +  { "marm", TARGET_ENDIAN_OPTION, "mfloat-abi=soft", "mno-thumb-interwork", "fno-leading-underscore" }



