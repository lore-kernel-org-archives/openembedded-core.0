Return-Path: <Jackie.Huang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 9DABE7626C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Jul 2015 08:09:10 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.1/8.15.1) with ESMTPS id t6T89ALB027936
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Jul 2015 01:09:10 -0700 (PDT)
Received: from pek-kkang-d2.wrs.com (128.224.163.135) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.235.1; Wed, 29 Jul 2015 01:08:52 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 29 Jul 2015 16:09:10 +0800
Message-ID: <1438157350-28969-1-git-send-email-jackie.huang@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] guile: Add earlyclobber constraint to the SMULL outputs.
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
X-List-Received-Date: Wed, 29 Jul 2015 08:09:12 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

backport a patch to fix issue:
{standard input}: Assembler messages:
{standard input}:16966: rdhi, rdlo and rm must all be different

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 ...guile-VM-ASM_MUL-for-ARM-Add-earlyclobber.patch | 43 ++++++++++++++++++++++
 meta/recipes-devtools/guile/guile_2.0.11.bb        |  1 +
 2 files changed, 44 insertions(+)
 create mode 100644 meta/recipes-devtools/guile/files/libguile-VM-ASM_MUL-for-ARM-Add-earlyclobber.patch

diff --git a/meta/recipes-devtools/guile/files/libguile-VM-ASM_MUL-for-ARM-Add-earlyclobber.patch b/meta/recipes-devtools/guile/files/libguile-VM-ASM_MUL-for-ARM-Add-earlyclobber.patch
new file mode 100644
index 0000000..e50059a
--- /dev/null
+++ b/meta/recipes-devtools/guile/files/libguile-VM-ASM_MUL-for-ARM-Add-earlyclobber.patch
@@ -0,0 +1,43 @@
+From a85c78ea1393985fdb6e6678dea19135c553d341 Mon Sep 17 00:00:00 2001
+From: Mark H Weaver <mhw@netris.org>
+Date: Fri, 19 Sep 2014 21:18:09 -0400
+Subject: [PATCH] VM: ASM_MUL for ARM: Add earlyclobber constraint to the SMULL
+ outputs.
+
+Reported by Rob Browning <rlb@defaultvalue.org>.
+
+* libguile/vm-i-scheme.c (ASM_MUL)[ARM]: Add earlyclobber (&) constraint
+  to the SMULL output registers.
+
+Author: Mark H Weaver <mhw@netris.org>
+
+Upstream-Status: Backport
+
+Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
+---
+ libguile/vm-i-scheme.c | 5 ++---
+ 1 file changed, 2 insertions(+), 3 deletions(-)
+
+diff --git a/libguile/vm-i-scheme.c b/libguile/vm-i-scheme.c
+index 587aa95..162efab 100644
+--- a/libguile/vm-i-scheme.c
++++ b/libguile/vm-i-scheme.c
+@@ -1,5 +1,4 @@
+-/* Copyright (C) 2001, 2009, 2010, 2011, 2012, 2013,
+- *   2014 Free Software Foundation, Inc.
++/* Copyright (C) 2001, 2009-2014 Free Software Foundation, Inc.
+  * 
+  * This library is free software; you can redistribute it and/or
+  * modify it under the terms of the GNU Lesser General Public License
+@@ -363,7 +362,7 @@ VM_DEFINE_FUNCTION (149, ge, "ge?", 2)
+       {									\
+ 	scm_t_signed_bits rlo, rhi;					\
+ 	asm ("smull %0, %1, %2, %3\n"					\
+-	     : "=r" (rlo), "=r" (rhi)					\
++	     : "=&r" (rlo), "=&r" (rhi)					\
+ 	     : "r" (SCM_UNPACK (x) - scm_tc2_int),			\
+ 	       "r" (SCM_I_INUM (y)));					\
+ 	if (SCM_LIKELY (SCM_SRS (rlo, 31) == rhi))			\
+-- 
+2.3.5
+
diff --git a/meta/recipes-devtools/guile/guile_2.0.11.bb b/meta/recipes-devtools/guile/guile_2.0.11.bb
index 621fa0f..ea9017b 100644
--- a/meta/recipes-devtools/guile/guile_2.0.11.bb
+++ b/meta/recipes-devtools/guile/guile_2.0.11.bb
@@ -22,6 +22,7 @@ SRC_URI = "${GNU_MIRROR}/guile/guile-${PV}.tar.xz \
            file://arm_aarch64.patch \
            file://workaround-ice-ssa-corruption.patch \
            file://libguile-Makefile.am-hook.patch \
+           file://libguile-VM-ASM_MUL-for-ARM-Add-earlyclobber.patch \
            "
 
 #           file://debian/0001-Change-guile-to-guile-X.Y-for-info-pages.patch
-- 
1.9.1


