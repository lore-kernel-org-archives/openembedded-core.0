Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f67.google.com (mail-pg0-f67.google.com [74.125.83.67])
	by mail.openembedded.org (Postfix) with ESMTP id 770F577BE0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 Mar 2017 18:58:07 +0000 (UTC)
Received: by mail-pg0-f67.google.com with SMTP id g2so19169348pge.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 Mar 2017 11:58:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=G5TrbutDs+XlrfGeETPim6L3NX+bYg8dJsoXiVkLevs=;
	b=gYuZSt9oJRaVCvVv4EVA88wQTegbmZBe9dgwkRbcKv9KLksQxcmueSgpQW3hcoB2B2
	BSzpYiQOKTGyUCM77oqwuRIarQ+6bRrn1WtdeR9+4CbqWUGGIHJjykB3q5vkrcqtVqhR
	h4sxNLdrGnA8ZKLQhlXI4moCdLlnlWEVk35zR8wvsZRh1gxt2ACyMdyg84VhU4oYwW1W
	vDGrEPdG5zsTdHwIJejlq5SzqcbX0IycUrWknLDaMNjtghwwFpQFL7xm3u1lsRr+wUnb
	+KxNv5UIUAEHiOFf0Bp7cp48JmDQvxhxvN6bawpswIL58L4Ok4sEAc0nFjd4Nxb0nO3J
	8qXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=G5TrbutDs+XlrfGeETPim6L3NX+bYg8dJsoXiVkLevs=;
	b=McZNYP575lLvYX9cQpWbrn9NVFhllUh57k2dLLGaU5W8VsLGMf+x3tDls83p7OhGRI
	EaW/byFKg/7Z3NlPYCQPyY+o9v/BRJfxcn58jUKZ61og5pMdBHa+bK5rGiQ+mA7knPWu
	KovMnO7YPbjpfif5bCK/mnEnhKfyEn2eOixIGQX1pIVXjdIciQjo8lmHxs/maHirIN2o
	0Ir9iO46B3IqQsED8BeQgiAi8+rDd6tlrEetHfw4Jdm6DxQBo5mKNgmLtue5l9mkaPQr
	wc/thDb7GmV6Re/2P31LVDesIdgBG2ZrNmzutgzduxda/JHAwU63OoBbOiP8JQ2SZkZH
	z9kQ==
X-Gm-Message-State: AFeK/H1Yv0Z1nZ79zsimQGvDGp+/r6lTep5uNRLxT/GACspGe1kF7o8oyr2S9BotdkU60Q==
X-Received: by 10.99.97.77 with SMTP id v74mr4523431pgb.76.1490986689502;
	Fri, 31 Mar 2017 11:58:09 -0700 (PDT)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	k184sm12024836pgc.23.2017.03.31.11.58.08
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 31 Mar 2017 11:58:08 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 31 Mar 2017 11:57:55 -0700
Message-Id: <20170331185755.14492-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.12.1
Subject: [PATCH] binutils: Detect 64bit mips target for gold
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
X-List-Received-Date: Fri, 31 Mar 2017 18:58:09 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/binutils/binutils-2.28.inc   |  1 +
 .../binutils/0016-Detect-64-bit-MIPS-targets.patch | 50 ++++++++++++++++++++++
 2 files changed, 51 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/0016-Detect-64-bit-MIPS-targets.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.28.inc b/meta/recipes-devtools/binutils/binutils-2.28.inc
index fcf30357f69..76b81b04cae 100644
--- a/meta/recipes-devtools/binutils/binutils-2.28.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.28.inc
@@ -34,6 +34,7 @@ SRC_URI = "\
      file://0013-Add-support-for-Netlogic-XLP.patch \
      file://0014-fix-the-incorrect-assembling-for-ppc-wait-mnemonic.patch \
      file://0015-sync-with-OE-libtool-changes.patch \
+     file://0016-Detect-64-bit-MIPS-targets.patch \
 "
 S  = "${WORKDIR}/git"
 
diff --git a/meta/recipes-devtools/binutils/binutils/0016-Detect-64-bit-MIPS-targets.patch b/meta/recipes-devtools/binutils/binutils/0016-Detect-64-bit-MIPS-targets.patch
new file mode 100644
index 00000000000..1b2eb8485c5
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/0016-Detect-64-bit-MIPS-targets.patch
@@ -0,0 +1,50 @@
+From c3ebde5d8cc3b0092966b4d725cad7cfd074fd8d Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 31 Mar 2017 11:42:03 -0700
+Subject: [PATCH 16/16] Detect 64-bit MIPS targets
+
+Add mips64 target triplets and default to N64
+
+Upstream-Status: Submitted
+https://sourceware.org/ml/binutils/2016-08/msg00048.html
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ gold/configure.tgt | 14 ++++++++++++++
+ 1 file changed, 14 insertions(+)
+
+diff --git a/gold/configure.tgt b/gold/configure.tgt
+index 3d63027297..c1f92a1360 100644
+--- a/gold/configure.tgt
++++ b/gold/configure.tgt
+@@ -153,6 +153,13 @@ aarch64*-*)
+  targ_big_endian=false
+  targ_extra_big_endian=true
+  ;;
++mips*64*el*-*-*|mips*64*le*-*-*)
++ targ_obj=mips
++ targ_machine=EM_MIPS_RS3_LE
++ targ_size=64
++ targ_big_endian=false
++ targ_extra_big_endian=true
++ ;;
+ mips*el*-*-*|mips*le*-*-*)
+  targ_obj=mips
+  targ_machine=EM_MIPS_RS3_LE
+@@ -160,6 +167,13 @@ mips*el*-*-*|mips*le*-*-*)
+  targ_big_endian=false
+  targ_extra_big_endian=true
+  ;;
++mips*64*-*-*)
++ targ_obj=mips
++ targ_machine=EM_MIPS
++ targ_size=64
++ targ_big_endian=true
++ targ_extra_big_endian=false
++ ;;
+ mips*-*-*)
+  targ_obj=mips
+  targ_machine=EM_MIPS
+-- 
+2.12.1
+
-- 
2.12.1


