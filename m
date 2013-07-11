Return-Path: <B40290@freescale.com>
Received: from co1outboundpool.messaging.microsoft.com
	(co1ehsobe005.messaging.microsoft.com [216.32.180.188])
	by mail.openembedded.org (Postfix) with ESMTP id D89CB6AB93
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Jul 2013 07:59:31 +0000 (UTC)
Received: from mail165-co1-R.bigfish.com (10.243.78.244) by
	CO1EHSOBE039.bigfish.com (10.243.66.104) with Microsoft SMTP Server id
	14.1.225.22; Thu, 11 Jul 2013 07:59:32 +0000
Received: from mail165-co1 (localhost [127.0.0.1])	by
	mail165-co1-R.bigfish.com (Postfix) with ESMTP id EEC4E9804D4	for
	<openembedded-core@lists.openembedded.org>;
	Thu, 11 Jul 2013 07:59:31 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: -2
X-BigFish: VS-2(zzbb2dI936eIzz1f42h1ee6h1de0h1fdah2073h1202h1e76h1d1ah1d2ah1fc6hzz8275bhz2dh2a8h668h839he5bhf0ah1288h12a5h12a9h12bdh12e5h137ah139eh13b6h1441h1504h1537h162dh1631h1758h1898h18e1h1946h19b5h1ad9h1b0ah1d0ch1d2eh1d3fh1dc1h1dfeh1dffh1e23h1155h)
Received: from mail165-co1 (localhost.localdomain [127.0.0.1]) by mail165-co1
	(MessageSwitch) id 1373529531239083_9121;
	Thu, 11 Jul 2013 07:58:51 +0000 (UTC)
Received: from CO1EHSMHS013.bigfish.com (unknown [10.243.78.245])	by
	mail165-co1.bigfish.com (Postfix) with ESMTP id 2ECEB38008F	for
	<openembedded-core@lists.openembedded.org>;
	Thu, 11 Jul 2013 07:58:51 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by CO1EHSMHS013.bigfish.com
	(10.243.66.23) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Thu, 11 Jul 2013 07:58:50 +0000
Received: from tx30smr01.am.freescale.net (10.81.153.31) by
	039-SN1MMR1-005.039d.mgd.msft.net (10.84.1.17) with Microsoft SMTP
	Server (TLS) id 14.3.136.1; Thu, 11 Jul 2013 08:01:03 +0000
Received: from sbuilder136.ap.freescale.net (sun.ap.freescale.net
	[10.192.208.136])	by tx30smr01.am.freescale.net (8.14.3/8.14.0) with
	ESMTP id r6B7wkur027695;	Thu, 11 Jul 2013 00:58:48 -0700
From: Chunrong Guo <B40290@freescale.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 11 Jul 2013 15:58:41 +0800
Message-ID: <1373529521-31010-1-git-send-email-B40290@freescale.com>
X-Mailer: git-send-email 1.7.5.4
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Subject: [PATCH] pseudo: pseudo-native breaks native builds for symver.patch
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
X-List-Received-Date: Thu, 11 Jul 2013 07:59:31 -0000
Content-Type: text/plain

      *symver.patch causes failure if the host glibc does not provide the glibc-2.0 version of the symbol.
      *fix the below error log:
      |tmp/work/ppc64-linux/pseudo-native/1.5.1-r3/pseudo-1.5.1/pseudo_ipc.c:153: more
      |undefined references to `memcpy@GLIBC_2.0' follow
      |/pseudo_db.ccollect2: error: ld returned 1 exit status

Signed-off-by: Chunrong Guo <B40290@freescale.com>
---
 meta/recipes-devtools/pseudo/files/symver.patch |   26 -----------------------
 meta/recipes-devtools/pseudo/pseudo.inc         |    2 -
 2 files changed, 0 insertions(+), 28 deletions(-)
 delete mode 100644 meta/recipes-devtools/pseudo/files/symver.patch

diff --git a/meta/recipes-devtools/pseudo/files/symver.patch b/meta/recipes-devtools/pseudo/files/symver.patch
deleted file mode 100644
index 8d1b377..0000000
--- a/meta/recipes-devtools/pseudo/files/symver.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-When running as pseudo-nativesdk, we might need to run host binaries 
-linked against the host libc. Having a 2.14 libc dependency from memcpy is
-problematic so instruct the linker to use older symbols.
-
-Upstream-Status: Pending
-
-RP 2012/4/22
-
-Index: pseudo-1.3/pseudo.h
-===================================================================
---- pseudo-1.3.orig/pseudo.h	2012-04-22 12:17:59.078909060 +0000
-+++ pseudo-1.3/pseudo.h	2012-04-22 12:32:42.954888587 +0000
-@@ -29,6 +29,13 @@
- int pseudo_set_value(const char *key, const char *value);
- char *pseudo_get_value(const char *key);
- 
-+#ifdef __amd64__   
-+#define GLIBC_COMPAT_SYMBOL(SYM) __asm__(".symver " #SYM "," #SYM "@GLIBC_2.2.5")
-+#else   
-+#define GLIBC_COMPAT_SYMBOL(SYM) __asm__(".symver " #SYM "," #SYM "@GLIBC_2.0")
-+#endif
-+GLIBC_COMPAT_SYMBOL(memcpy);
-+
- #include "pseudo_tables.h"
- 
- extern void pseudo_debug_verbose(void);
diff --git a/meta/recipes-devtools/pseudo/pseudo.inc b/meta/recipes-devtools/pseudo/pseudo.inc
index 3baf3af..f5d0608 100644
--- a/meta/recipes-devtools/pseudo/pseudo.inc
+++ b/meta/recipes-devtools/pseudo/pseudo.inc
@@ -9,9 +9,7 @@ SECTION = "base"
 LICENSE = "LGPL2.1"
 DEPENDS = "sqlite3"
 
-SRC_URI_append_class-nativesdk = " file://symver.patch"
 
-SRC_URI_append_class-native = " file://symver.patch"
 
 FILES_${PN} = "${libdir}/pseudo/lib*/libpseudo.so ${bindir}/* ${localstatedir}/pseudo ${prefix}/var/pseudo"
 FILES_${PN}-dbg += "${libdir}/pseudo/lib*/.debug"
-- 
1.7.5.4



