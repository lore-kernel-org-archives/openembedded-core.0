Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f51.google.com (mail-pa0-f51.google.com
	[209.85.220.51])
	by mail.openembedded.org (Postfix) with ESMTP id 16DE465D53
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Aug 2014 21:36:01 +0000 (UTC)
Received: by mail-pa0-f51.google.com with SMTP id ey11so14840817pad.24
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Aug 2014 14:36:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id;
	bh=81AqApYtyUd1MylT5Y0eipcLFl33phWW12Ney7lkNEg=;
	b=V4/EhqcpY/UlPfD+PmrTFDUiWcNscJUNLmkESd8TchBI9TdMPj8uFPDo6QzaH1ZEF+
	yrCFr/5hKqnCAanPfGO7UJrZ8RxNfscMcBNnGlXsVlAz7repVr/WUD0sUvda+DcjiCS9
	8PDmcXZJaZVxony1UcYqfA/m48FLsWXA4b2T4s6H8wzwPyPexV4JkG2HpVUhA3sFhtmq
	3XhbEaqvpXTfHBsyE2FiqlP24af1orKAq2W5iZUBOenzGk9qRDnykurFiqlPclGDlUfG
	jW6rmyEXPnYGTk/uLWxouAZzFsXqAf3ldwbtP7Umb/XdX+tr4VGUGBVeJXBKquvutKuK
	6PsQ==
X-Received: by 10.67.13.176 with SMTP id ez16mr1496889pad.54.1408656962742;
	Thu, 21 Aug 2014 14:36:02 -0700 (PDT)
Received: from Pahoa2.mvista.com (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207]) by mx.google.com with ESMTPSA id
	pk15sm40321599pdb.49.2014.08.21.14.36.00
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 21 Aug 2014 14:36:01 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 21 Aug 2014 14:35:58 -0700
Message-Id: <1408656958-2280-1-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH v2] gmp: ppc64 build issue
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
X-List-Received-Date: Thu, 21 Aug 2014 21:36:03 -0000


tmp-gcd_1.s: Assembler messages:
| tmp-gcd_1.s:94: Error: unsupported relocation against BMOD_1_TO_MOD_1_THRESHOLD
| make[2]: *** [gcd_1.lo] Error 1

V2: fixed PN name

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-support/gmp/gmp/gmp-6.0.0-ppc64.patch | 25 ++++++++++++++++++++++
 meta/recipes-support/gmp/gmp_6.0.0.bb              |  1 +
 2 files changed, 26 insertions(+)
 create mode 100644 meta/recipes-support/gmp/gmp/gmp-6.0.0-ppc64.patch

diff --git a/meta/recipes-support/gmp/gmp/gmp-6.0.0-ppc64.patch b/meta/recipes-support/gmp/gmp/gmp-6.0.0-ppc64.patch
new file mode 100644
index 0000000..19bb4fa
--- /dev/null
+++ b/meta/recipes-support/gmp/gmp/gmp-6.0.0-ppc64.patch
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
index 19e5f4d..6218491 100644
--- a/meta/recipes-support/gmp/gmp_6.0.0.bb
+++ b/meta/recipes-support/gmp/gmp_6.0.0.bb
@@ -7,6 +7,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504 \
 "
 SRC_URI_append = " file://use-includedir.patch \
                    file://append_user_provided_flags.patch \
+                   file://gmp-6.0.0-ppc64.patch \
 "
 
 SRC_URI[md5sum] = "b7ff2d88cae7f8085bd5006096eed470"
-- 
1.9.1


