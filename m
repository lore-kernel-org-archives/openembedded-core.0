Return-Path: <akuster808@gmail.com>
Received: from mail-pd0-f171.google.com (mail-pd0-f171.google.com
	[209.85.192.171])
	by mail.openembedded.org (Postfix) with ESMTP id 6AAA765DD0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Aug 2014 20:44:46 +0000 (UTC)
Received: by mail-pd0-f171.google.com with SMTP id z10so14549566pdj.30
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Aug 2014 13:44:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=kBgS8lIix2XAgJZjjMTDb4pQLwChyXEYEQtFWAWt82A=;
	b=mMxpoUJ00liC3mAHpllWsojyg1x9F0Jgrv4aZXZRZcXJfBWgyrhYER6FUAa0bGccbJ
	ZxXyZwXvPo39eOUMdHVBFyTErdFVWd2VGI9BnBexxGjsaqDyLOrun8XErmrrVdoftrCr
	Fl0EE8j2tCeLEqpLDChyRVpLT7ax9D6AQglPMuvhebVjzR2LlQS1bhY5ZFvf8AGPhPf9
	mBPDRNElRKLrZIDg5Xv0ftjxEherW32W+M2b3tsba6JWy99Y5H5t4f9HVQiMCcgnsTAw
	4t50C12RJxDMvHG2e4cWPFKBPKdM+mVYPqFlqfRrKDpxEB1MmWE8gW8ObZRqNyzy8HAR
	hP3g==
X-Received: by 10.70.96.193 with SMTP id du1mr1172640pdb.132.1408653888069;
	Thu, 21 Aug 2014 13:44:48 -0700 (PDT)
Received: from Pahoa2.mvista.com (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207]) by mx.google.com with ESMTPSA id
	pk15sm40192804pdb.49.2014.08.21.13.44.45
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 21 Aug 2014 13:44:46 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 21 Aug 2014 13:44:41 -0700
Message-Id: <1408653881-7021-2-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1408653881-7021-1-git-send-email-akuster808@gmail.com>
References: <1408653881-7021-1-git-send-email-akuster808@gmail.com>
Subject: [PATCH]] gpm: ppc64 build issue
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
X-List-Received-Date: Thu, 21 Aug 2014 20:44:52 -0000

tmp-gcd_1.s: Assembler messages:
| tmp-gcd_1.s:94: Error: unsupported relocation against BMOD_1_TO_MOD_1_THRESHOLD
| make[2]: *** [gcd_1.lo] Error 1

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-support/gmp/gmp/gpm-6.0.0-ppc64.patch | 25 ++++++++++++++++++++++
 meta/recipes-support/gmp/gmp_6.0.0.bb              |  1 +
 2 files changed, 26 insertions(+)
 create mode 100644 meta/recipes-support/gmp/gmp/gpm-6.0.0-ppc64.patch

diff --git a/meta/recipes-support/gmp/gmp/gpm-6.0.0-ppc64.patch b/meta/recipes-support/gmp/gmp/gpm-6.0.0-ppc64.patch
new file mode 100644
index 0000000..19bb4fa
--- /dev/null
+++ b/meta/recipes-support/gmp/gmp/gpm-6.0.0-ppc64.patch
@@ -0,0 +1,25 @@
+
+Signed-off-by: Armin Kuster <akuster808@gmail.com>
+
+This patch with pulled from gmp.
+https://gmplib.org/repo/gmp/rev/4a6d258b467f
+
+# HG changeset patch
+# User Torbjorn Granlund <tege@gmplib.org>
+# Date 1395835068 -3600
+# Node ID 4a6d258b467f661da0894cc60ecd060f2e3c67c7
+# Parent  301ce2788826a2d4d2725bd5cf01e998638db37a
+Provide default for BMOD_1_TO_MOD_1_THRESHOLD.
+
+diff -r 301ce2788826 -r 4a6d258b467f mpn/powerpc64/mode64/gcd_1.asm
+--- a/mpn/powerpc64/mode64/gcd_1.asm    Tue Mar 25 15:34:52 2014 +0100
++++ b/mpn/powerpc64/mode64/gcd_1.asm    Wed Mar 26 12:57:48 2014 +0100
+@@ -43,6 +43,9 @@
+ define(`n',     `r4')
+ define(`v0',    `r5')
+
++ifdef(`BMOD_1_TO_MOD_1_THRESHOLD',,
++  `define(`BMOD_1_TO_MOD_1_THRESHOLD',30)')
++
+ EXTERN_FUNC(mpn_mod_1)
+ EXTERN_FUNC(mpn_modexact_1c_odd)
diff --git a/meta/recipes-support/gmp/gmp_6.0.0.bb b/meta/recipes-support/gmp/gmp_6.0.0.bb
index 19e5f4d..cd515e8 100644
--- a/meta/recipes-support/gmp/gmp_6.0.0.bb
+++ b/meta/recipes-support/gmp/gmp_6.0.0.bb
@@ -7,6 +7,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504 \
 "
 SRC_URI_append = " file://use-includedir.patch \
                    file://append_user_provided_flags.patch \
+                   file://gpm-6.0.0-ppc64.patch \
 "
 
 SRC_URI[md5sum] = "b7ff2d88cae7f8085bd5006096eed470"
-- 
1.9.1


