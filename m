Return-Path: <hthakar@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82D01CC6B38
	for <webhook@archiver.kernel.org>; Fri, 16 Oct 2026 03:37:34 +0000 (UTC)
Received: from rcdn-iport-9.cisco.com (rcdn-iport-9.cisco.com [173.37.86.80])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14209.1792121847719051683
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Oct 2026 20:37:27 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=NwfLdXoV;
 spf=pass (domain: cisco.com, ip: 173.37.86.80, mailfrom: hthakar@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=4851; q=dns/txt;
  s=iport01; t=1792121847; x=1793331447;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=5psA1zkdgA75MOTdRmx+2AqFxFPNNKFxh5/4/OiD/k0=;
  b=NwfLdXoVa3ObXL9BoGe0kQp3xRKzM+XW+3RNRmxrS/odKevhd8pGUtuZ
   GJPEhYe6egwVwR1ETGE8wddAgyGRuJw+6lrH0G7FItTiY8/ZFMmyOWWLU
   ERqSDIx922oZArS5M49beioohcIsMFu4mpg35irFmUgy3kAcdXjH6Fmlc
   zAD9pauNsN46i1n7goozC0rnZ/GyXTRig6hRR2pUsdD4TLJ/AqCNkj5fZ
   rCU7oMQ1g1LuvsD0ihFGwupcC1ZRmnliFjZeCfTTR2O+tQpDR6k9ZV5tW
   qSiuhFOGuYMZlHcRduMHWXGRQmLu9u/+33jzc3DVWrmT7s1AKDPWSG4YP
   A==;
X-CSE-ConnectionGUID: fPuZOEPjQ9+Y6dSykWrhqg==
X-CSE-MsgGUID: RxS+G1ZOTrq4MaUpjyatYw==
X-IPAS-Result: =?us-ascii?q?A0BHAgDymtFq/4z/Ja1aHgEBCxIMggULgld1YENJlkoDn?=
 =?us-ascii?q?hyBfg8BAQEPSgcEAQGFBQKOFQImNAkOAQIEAwIDAQEBAQEBAQEBAQEBCgEBB?=
 =?us-ascii?q?QEBAQIBBwWBDhOGTw2QEgECAQMyARgBLRAcAwECLysjCBkagmgBgnQDEbxzg?=
 =?us-ascii?q?iyBAYMpAYFU2zIBCxQBBYEzhUCII10YAYR8JxsbgXKBFAGDaYEFgVwCggaGH?=
 =?us-ascii?q?wSCInoSgVoelSlIgR4DWSwBVRMNCgsHBYFoAzUSKhVuMh2BIz4XgQcbBgWBH?=
 =?us-ascii?q?YEgghYjGTZ6gQlegSspYAEQF4EJggcCglSCAAIBSUEOB0VTCSVDEkcmIggSC?=
 =?us-ascii?q?QETGjALgRs4PAkoQRcMcwwdBXIIAg0JBykYDUgRLDcVGQQ+bgeSEx6CZAE9H?=
 =?us-ascii?q?CITASuBfRAfEZMukBWCIaEPCiiDdowilToaM4VbpRQLmH2OCpZPhGmBaDyBW?=
 =?us-ascii?q?XAVgyIJShkPji4LC4FRgg8zgiPMBCcyAgEIMgEBBwIHDgMLgWiRfgEB?=
IronPort-Data: A9a23:zlno2Kkk6gIyRPmFrqgjkQjo5gzXJ0RdPkR7XQ2eYbSJt1+Wr1Gzt
 xJJXmHQafeONDSmLY9/aYuzoB4G6MLTzoI1HgFlrywzF1tH+JHPbTi7wugcHM8zwunrFh8PA
 xA2M4GYRCwMZiaC4Errav6+/SEUOZigHtLUEPTDNj16WThqQSIgjQMLs+Mii+aEu/Dha++2k
 Y20+ZK31GONgWYubDtMsvzb8XuDgdyr0N8mlg1mDRx0lAe2e0k9VPo3Oay3Jn3kdYhYdsbSb
 /rD1ryw4lTC9B4rDN6/+p6jGqHdauePVeQmoiM+t5mK2nCulARrukoIHKZ0hXNsttm8t4sZJ
 OOhGnCHYVxB0qXkwIzxWvTDes10FfUuFLTveRBTvSEPpqHLWyOE/hlgMK05FYMg59RQLFlMz
 K1bGW4BVQGAuPi22b3uH4GAhux7RCXqFJkUtnclyXTSCuwrBMiYBa7L/tRfmjw3g6iiH96HO
 JFfMmUpNkmdJUQTYj/7C7pm9AusrnnjczRboUi9rqss6G+Vxwt0uFToGIeOJ4baGJkPxC50o
 Er871+6LUgoE+CF0Gag+0+0hP7GgRLkDdd6+LqQs6QCbEeo7msLBRsbUFG2rfW0hgu1XMhSA
 0gV4TY1668q+UqmS9PwUxG1rDiDpBF0ZjZLO/cx5AfIzu/f5ByUQzBfCDVAc9ch8sQxQFTGy
 2O0oj8gPhQ32JX9dJ5X3u78Qe+aUcTNEVI/WA==
IronPort-HdrOrdr: A9a23:EwnqJq50luZjAgIHbQPXwBDXdLJyesId70hD6qm+c3Nom6uj5q
 eTdZsgtCMc5Ax9ZJhko6HjBEDiewK5yXcK2+ks1N6ZNWGM0ldAbrsSiLcKqAePJ8SRzIJgPI
 5bAs5D4aXLfDtHpPe/xhWkGNA9x9TC2qWpieDCi0pJd2hRGthdB8MTMHfhLqWwLzM2faYEKA
 ==
X-Talos-CUID: =?us-ascii?q?9a23=3A8qnd22vku3FafmCdwI0qdBYf6IsrSmDv61roIXb?=
 =?us-ascii?q?pSlc3RIaESmCK+Lprxp8=3D?=
X-Talos-MUID: 9a23:Xgr4IwXqV1uUjLfq/AX8v3JNbfVP3763VGUErI0EqsCYBDMlbg==
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,161,1787011200"; 
   d="scan'208";a="535285422"
Received: from rcdn-l-core-03.cisco.com ([173.37.255.140])
  by rcdn-iport-9.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 16 Oct 2026 03:37:26 +0000
Received: from sjc-ads-5245.cisco.com (sjc-ads-5245.cisco.com [10.28.23.9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-03.cisco.com (Postfix) with ESMTPS id BDE7118000624;
	Fri, 16 Oct 2026 03:37:26 +0000 (GMT)
Received: by sjc-ads-5245.cisco.com (Postfix, from userid 1887505)
	id 663E8CBF201; Thu, 15 Oct 2026 20:37:26 -0700 (PDT)
From: "Hetvi Thakar -X (hthakar - E INFOCHIPS PRIVATE LIMITED at Cisco)" <hthakar@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com
Subject: [OE-core][wrynose][PATCH 2/3] lrzsz: fix CVE-2026-105840
Date: Thu, 15 Oct 2026 20:37:25 -0700
Message-Id: <20261016033726.426908-2-hthakar@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20261016033726.426908-1-hthakar@cisco.com>
References: <20261016033726.426908-1-hthakar@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-5245.cisco.com [10.28.23.9];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.28.23.9, sjc-ads-5245.cisco.com
X-Outbound-Node: rcdn-l-core-03.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Oct 2026 03:37:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247904

From: Hetvi Thakar <hthakar@cisco.com>

This patch applies the upstream fix as referenced in [2],
using the commit shown in [1].

[1] https://github.com/UweOhse/lrzsz/commit/b1fc8a01e3a074f8462a29dca45ed7c8fd2ef665
[2] https://www.vulncheck.com/advisories/lrzsz-before-0.13.0-path-traversal-via-lrz-restricted-mode-checkpath

Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
---
 .../lrzsz/lrzsz-0.12.20/CVE-2026-105840.patch | 106 ++++++++++++++++++
 meta/recipes-bsp/lrzsz/lrzsz_0.12.20.bb       |   1 +
 2 files changed, 107 insertions(+)
 create mode 100644 meta/recipes-bsp/lrzsz/lrzsz-0.12.20/CVE-2026-105840.patch

diff --git a/meta/recipes-bsp/lrzsz/lrzsz-0.12.20/CVE-2026-105840.patch b/meta/recipes-bsp/lrzsz/lrzsz-0.12.20/CVE-2026-105840.patch
new file mode 100644
index 00000000000..1bf5eae803c
--- /dev/null
+++ b/meta/recipes-bsp/lrzsz/lrzsz-0.12.20/CVE-2026-105840.patch
@@ -0,0 +1,106 @@
+From b1fc8a01e3a074f8462a29dca45ed7c8fd2ef665 Mon Sep 17 00:00:00 2001
+From: Uwe Ohse at akiar <uwe@ohse.de>
+Date: Mon, 10 Aug 2026 18:09:20 +0200
+Subject: [PATCH] remove PUBDIR, fix the 2nd security hole found by
+ tristaninsec
+
+CVE: CVE-2026-105840
+Upstream-Status: Backport [https://github.com/UweOhse/lrzsz/commit/b1fc8a01e3a074f8462a29dca45ed7c8fd2ef665]
+
+Backport Changes:
+- Applied the configure.ac change to configure.in, which is the build
+  configuration filename used by lrzsz 0.12.20.
+- Omitted NEWS because its 0.13.0 release-note hunk conflicts with the
+  0.12.20 release history and is not needed for the security fix.
+
+(cherry picked from commit b1fc8a01e3a074f8462a29dca45ed7c8fd2ef665)
+Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
+---
+ configure.in |  7 -------
+ src/lrz.c    | 16 +++++-----------
+ src/lsz.c    |  9 ++-------
+ 3 files changed, 7 insertions(+), 25 deletions(-)
+
+diff --git a/configure.in b/configure.in
+index b7c3c31..504bd32 100644
+--- a/configure.in
++++ b/configure.in
+@@ -37,13 +37,6 @@ AC_ARG_ENABLE(timesync,
+ 	  fi],
+ 	[AC_DEFINE(ENABLE_TIMESYNC)])
+ AC_SUBST(ENABLE_TIMESYNC)
+-AC_ARG_ENABLE(pubdir,
+-	[--enable-pubdir=/path   include support for a public writeable directory],
+-	[if test "$enableval" = "no" ; then 
+-		: 
+-	  else 
+-	    AC_DEFINE_UNQUOTED(PUBDIR,"$enableval")
+-	  fi])
+ AC_ARG_ENABLE(mkdir,
+ 	[--disable-mkdir   disable support for creating directories (lrz)],
+ 	[if test "$enableval" = "no" ; then 
+diff --git a/src/lrz.c b/src/lrz.c
+index 9c08a3d..168636e 100644
+--- a/src/lrz.c
++++ b/src/lrz.c
+@@ -1553,12 +1553,10 @@ chkinvok(const char *s)
+ }
+ 
+-/*
+- * Totalitarian Communist pathname processing
+- */
+ static void 
+ checkpath(const char *name)
+ {
+ 	if (Restricted) {
++                FILE *noleak = NULL;
+ 		const char *p;
+ 		p=strrchr(name,'/');
+ 		if (p)
+@@ -1595,20 +1593,16 @@ checkpath(const char *name)
+ 			p=name;
+ 		/* don't overwrite any file in very restricted mode.
+ 		 * don't overwrite hidden files in restricted mode */
+-		if ((Restricted==2 || *name=='.') && fopen(name, "r") != NULL) {
++		if ((Restricted==2 || *name=='.') && (noleak = fopen(name, "r")) != NULL) {
++                        fclose(noleak);
+ 			canit(STDOUT_FILENO);
+ 			vstring("\r\n");
+ 			vstringf(_("%s: %s exists\n"), 
+ 				program_name, name);
+ 			bibi(-1);
+ 		}
+-		/* restrict pathnames to current tree or uucppublic */
+-		if ( strstr(name, "../")
+-#ifdef PUBDIR
+-		 || (name[0]== '/' && strncmp(name, PUBDIR, 
+-		 	strlen(PUBDIR)))
+-#endif
+-		) {
++		/* restrict pathnames to the current tree */
++		if ( strstr(name, "../") || name[0] == '/') {
+ 			canit(STDOUT_FILENO);
+ 			vstring("\r\n");
+ 			vstringf(_("%s:\tSecurity Violation"),program_name);
+diff --git a/src/lsz.c b/src/lsz.c
+index 69f4fb8..3dd91b1 100644
+--- a/src/lsz.c
++++ b/src/lsz.c
+@@ -1009,13 +1009,8 @@ wcs(const char *oname, const char *remotename)
+ 
+ 
+ 	if (Restricted) {
+-		/* restrict pathnames to current tree or uucppublic */
+-		if ( strstr(oname, "../")
+-#ifdef PUBDIR
+-		 || (oname[0]== '/' && strncmp(oname, MK_STRING(PUBDIR),
+-		 	strlen(MK_STRING(PUBDIR))))
+-#endif
+-		) {
++		/* restrict pathnames to current tree */
++		if ( strstr(oname, "../") || oname[0] == '/') {
+ 			canit(STDOUT_FILENO);
+ 			vchar('\r');
+ 			error(1,0,
+-- 
+2.35.6
diff --git a/meta/recipes-bsp/lrzsz/lrzsz_0.12.20.bb b/meta/recipes-bsp/lrzsz/lrzsz_0.12.20.bb
index 403266743e0..ec98f690153 100644
--- a/meta/recipes-bsp/lrzsz/lrzsz_0.12.20.bb
+++ b/meta/recipes-bsp/lrzsz/lrzsz_0.12.20.bb
@@ -22,6 +22,7 @@ SRC_URI = "https://www.ohse.de/uwe/releases/lrzsz-${PV}.tar.gz \
            file://0001-Fix-build-with-GCC-15.patch \
            file://0001-lrzsz-convert-K-R-function-definitions-to-ANSI-C-pro.patch \
            file://CVE-2026-105841.patch \
+           file://CVE-2026-105840.patch \
            "
 SRC_URI[sha256sum] = "c28b36b14bddb014d9e9c97c52459852f97bd405f89113f30bee45ed92728ff1"
 
-- 
2.35.6


