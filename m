Return-Path: <akuster808@gmail.com>
Received: from mail-pl0-f68.google.com (mail-pl0-f68.google.com
	[209.85.160.68])
	by mail.openembedded.org (Postfix) with ESMTP id 8801877E92
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Nov 2017 02:35:34 +0000 (UTC)
Received: by mail-pl0-f68.google.com with SMTP id s23so2315304plk.10
	for <openembedded-core@lists.openembedded.org>;
	Sun, 26 Nov 2017 18:35:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=1Px3QStki7DeORujjhJPbekE2+Fo76rYo+gfxuMg/+A=;
	b=gbY1qSAjoVWDnCAJidvohuP7uvwyXWQlpU8P4/2eOpj96Gb/85z8kq6qzw5m4NRyU2
	z1YXUlHVWDtOqyaPtOcZyFTull00DY8xTG7v2t5vGauFBTVQwu/ZBT3gWVbT5B1rTZcc
	SyOp2XBES64X7h7tWaENpM4t225L/bEKizBxNzGm55oBXl/JVQDZST/8NvSHnLqheJYG
	xrc8r3WWhNcURntO5jvby0ALCpxVlsslcWaIOMbW4V6Iy9PuNUMCREbe3/d9ajto3LQK
	5j0taKjQ2Zm05nXGbt+J2/wUQ3hjg0n0MpzbgpZld6hPX8+2CWprVsZ6BrBRbcxBNPAB
	iMcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=1Px3QStki7DeORujjhJPbekE2+Fo76rYo+gfxuMg/+A=;
	b=STmpS/5vCoAgaILBDtoknINGM76qLfS62P52m3jZMVP0uAFR9avTvEXzFWi1/+AgWK
	53p+O0jeJB8sQ5k1rVWbnTBWmNSLo8bc+PEeBN5+2cNWIxlcvImAIjkL8K0kPJ8WXqux
	FUpXra3YFC0oA4f5f36x/GFH+a0jgS/nw1b+fWAJCUaIduqwLbzSZ0h1cy8wuF4K7q0M
	NStNQeFvV3cOps86UQYpGS+TslfSTKOBjl2/sBAX+bGgH2N7/q6ChlDhoizh8EAb8GLe
	XDkuKpLV7dl0J1wjPKUGLE7uDQBKNeFlATrJNx0h2QKo1wsS9MMVYY+wkkvc999ZDFXT
	o5SA==
X-Gm-Message-State: AJaThX4oCj5pS+v0QJu+3sWr41rP7lHl62w82pI4itB0Q5M10dDSqVD9
	Q4KxLb3b8C75WdiEJM1M77o=
X-Google-Smtp-Source: AGs4zMZmBbmYDdTwwpaQXb4fg5RMj464I6hlXL2w++ZZtGBdZyb4DwbN0dx13BwOi1t/kTWx9KwWQg==
X-Received: by 10.84.239.1 with SMTP id w1mr31333411plk.227.1511750136211;
	Sun, 26 Nov 2017 18:35:36 -0800 (PST)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4001:9ea0:b082:a618:f613:3498])
	by smtp.gmail.com with ESMTPSA id
	e3sm17809103pfe.92.2017.11.26.18.35.35
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 26 Nov 2017 18:35:35 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: akuster@mvista.com,
	openembedded-core@lists.openembedded.org
Date: Sun, 26 Nov 2017 18:35:10 -0800
Message-Id: <1511750112-2263-24-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1511750112-2263-1-git-send-email-akuster808@gmail.com>
References: <1511750112-2263-1-git-send-email-akuster808@gmail.com>
Subject: [pyro][PATCH 24/26] binutls: Secuirty fix for CVE-2017-9756
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
X-List-Received-Date: Mon, 27 Nov 2017 02:35:35 -0000

Affects: <= 2.28

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-devtools/binutils/binutils-2.28.inc   |  1 +
 .../binutils/binutils/CVE-2017-9756.patch          | 50 ++++++++++++++++++++++
 2 files changed, 51 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2017-9756.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.28.inc b/meta/recipes-devtools/binutils/binutils-2.28.inc
index b4299c8..a2b2901 100644
--- a/meta/recipes-devtools/binutils/binutils-2.28.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.28.inc
@@ -66,6 +66,7 @@ SRC_URI = "\
      file://CVE-2017-9752.patch \
      file://CVE-2017-9753.patch \
      file://CVE-2017-9755.patch \
+     file://CVE-2017-9756.patch \
 "
 S  = "${WORKDIR}/git"
 
diff --git a/meta/recipes-devtools/binutils/binutils/CVE-2017-9756.patch b/meta/recipes-devtools/binutils/binutils/CVE-2017-9756.patch
new file mode 100644
index 0000000..191d0be
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/CVE-2017-9756.patch
@@ -0,0 +1,50 @@
+From cd3ea7c69acc5045eb28f9bf80d923116e15e4f5 Mon Sep 17 00:00:00 2001
+From: Nick Clifton <nickc@redhat.com>
+Date: Thu, 15 Jun 2017 13:26:54 +0100
+Subject: [PATCH] Prevent address violation problem when disassembling corrupt
+ aarch64 binary.
+
+	PR binutils/21595
+	* aarch64-dis.c (aarch64_ext_ldst_reglist): Check for an out of
+	range value.
+
+Upstream-Status: Backport
+CVE: CVE-2017-9756
+Signed-off-by: Armin Kuster <akuster@mvista.com>
+
+---
+ opcodes/ChangeLog     | 6 ++++++
+ opcodes/aarch64-dis.c | 3 +++
+ 2 files changed, 9 insertions(+)
+
+Index: git/opcodes/ChangeLog
+===================================================================
+--- git.orig/opcodes/ChangeLog
++++ git/opcodes/ChangeLog
+@@ -6,6 +6,12 @@
+ 
+ 2017-06-15  Nick Clifton  <nickc@redhat.com>
+ 
++	PR binutils/21595
++	* aarch64-dis.c (aarch64_ext_ldst_reglist): Check for an out of
++	range value.
++
++2017-06-15  Nick Clifton  <nickc@redhat.com>
++
+ 	PR binutils/21588
+ 	* rl78-decode.opc (OP_BUF_LEN): Define.
+ 	(GETBYTE): Check for the index exceeding OP_BUF_LEN.
+Index: git/opcodes/aarch64-dis.c
+===================================================================
+--- git.orig/opcodes/aarch64-dis.c
++++ git/opcodes/aarch64-dis.c
+@@ -409,6 +409,9 @@ aarch64_ext_ldst_reglist (const aarch64_
+   info->reglist.first_regno = extract_field (FLD_Rt, code, 0);
+   /* opcode */
+   value = extract_field (FLD_opcode, code, 0);
++  /* PR 21595: Check for a bogus value.  */
++  if (value >= ARRAY_SIZE (data))
++    return 0;
+   if (expected_num != data[value].num_elements || data[value].is_reserved)
+     return 0;
+   info->reglist.num_regs = data[value].num_regs;
-- 
2.7.4


