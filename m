Return-Path: <zangruochen@loongson.cn>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D051CCF9FC
	for <webhook@archiver.kernel.org>; Wed,  6 Sep 2023 01:28:45 +0000 (UTC)
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
 by mx.groups.io with SMTP id smtpd.web11.1848.1693963715374025156
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Sep 2023 18:28:36 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: loongson.cn, ip: 114.242.206.163, mailfrom: zangruochen@loongson.cn)
Received: from loongson.cn (unknown [112.20.109.102])
	by gateway (Coremail) with SMTP id _____8BxpPDB1fdkqAIgAA--.64375S3;
	Wed, 06 Sep 2023 09:28:33 +0800 (CST)
Received: from localhost.localdomain (unknown [112.20.109.102])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8Ax8uS_1fdkeNVtAA--.1461S2;
	Wed, 06 Sep 2023 09:28:31 +0800 (CST)
From: Zang Ruochen <zangruochen@loongson.cn>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 5/6] [OE-core][PATCH] gcc: Fresh 0003-64-bit-multilib-hack.patch to add loongarch64 support
Date: Wed,  6 Sep 2023 09:28:31 +0800
Message-Id: <20230906012831.3485-1-zangruochen@loongson.cn>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8Ax8uS_1fdkeNVtAA--.1461S2
X-CM-SenderInfo: p2dqw2xxrfxv3q6o00pqjv00gofq/
X-Coremail-Antispam: 1Uk129KBj93XoWxAr1UZF4xXr4xCF15GFyUArc_yoW5uw17pF
	1a9FyfGr18GF4SgrZxJ34fXa13W392gFnIgFW7tw18u3yUZ348X3WkKryxXFZ8u34UXrW2
	qr4rG34Uu3WUZacCm3ZEXasCq-sJn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUkFb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
	xVW8Jr0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx
	1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r126r1DMcIj6I8E87Iv
	67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41l42xK82IYc2
	Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s02
	6x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1j6r15MIIYrxkI7VAKI48JMIIF0x
	vE2Ix0cI8IcVAFwI0_JFI_Gr1lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE
	42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6x
	kF7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x07UMpBfUUUUU=
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Sep 2023 01:28:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187265

Signed-off-by: Zang Ruochen <zangruochen@loongson.cn>
---
 .../gcc/gcc/0003-64-bit-multilib-hack.patch   | 54 ++++++++++++++++++-
 1 file changed, 53 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/gcc/gcc/0003-64-bit-multilib-hack.patch b/meta/recipes-devtools/gcc/gcc/0003-64-bit-multilib-hack.patch
index 3b3eec2027..69e7fa0ba9 100644
--- a/meta/recipes-devtools/gcc/gcc/0003-64-bit-multilib-hack.patch
+++ b/meta/recipes-devtools/gcc/gcc/0003-64-bit-multilib-hack.patch
@@ -28,6 +28,7 @@ Upstream-Status: Inappropriate [OE-Specific]
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 Signed-off-by: Elvis Dowson <elvis.dowson@gmail.com>
 Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
+Signed-off-by: Zang Ruochen <zangruochen@loongson.cn>
 ---
  gcc/config/aarch64/t-aarch64-linux |  8 ++++----
  gcc/config/arc/t-multilib-linux    |  4 ++--
@@ -35,7 +36,8 @@ Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
  gcc/config/mips/t-linux64          | 28 ++--------------------------
  gcc/config/riscv/t-linux           |  4 ++--
  gcc/config/rs6000/t-linux64        |  5 ++---
- 6 files changed, 14 insertions(+), 41 deletions(-)
+ gcc/config/loongarch/t-linux       | 34 ++++++++++++++++++----------------
+ 7 files changed, 32 insertions(+), 57 deletions(-)
 
 diff --git a/gcc/config/aarch64/t-aarch64-linux b/gcc/config/aarch64/t-aarch64-linux
 index 57bf4100fcd..aaef5da8059 100644
@@ -147,3 +149,53 @@ index 01a94242308..1429eceaebf 100644
  
  rs6000-linux.o: $(srcdir)/config/rs6000/rs6000-linux.cc
  	$(COMPILE) $<
+diff --git a/gcc/config/loongarch/t-linux b/gcc/config/loongarch/t-linux
+index e40da1792..0c7ec9f8a 100644
+--- a/gcc/config/loongarch/t-linux
++++ b/gcc/config/loongarch/t-linux
+@@ -18,7 +18,9 @@
+
+ # Multilib
+ MULTILIB_OPTIONS = mabi=lp64d/mabi=lp64f/mabi=lp64s
+-MULTILIB_DIRNAMES = base/lp64d base/lp64f base/lp64s
++#MULTILIB_DIRNAMES = base/lp64d base/lp64f base/lp64s
++MULTILIB_DIRNAMES = . . .
++MULTILIB_OSDIRNAMES = ../$(shell basename $(base_libdir)) ../$(shell basename $(base_libdir)) ../$(shell basename $(base_libdir))
+
+ # The GCC driver always gets all abi-related options on the command line.
+ # (see loongarch-driver.c:driver_get_normalized_m_opts)
+@@ -36,18 +38,18 @@ else
+ endif
+
+ # Don't define MULTILIB_OSDIRNAMES if multilib is disabled.
+-ifeq ($(filter LA_DISABLE_MULTILIB,$(tm_defines)),)
+-
+-    MULTILIB_OSDIRNAMES = \
+-      mabi.lp64d=../lib64$\
+-      $(call if_multiarch,:loongarch64-linux-gnu)
+-
+-    MULTILIB_OSDIRNAMES += \
+-      mabi.lp64f=../lib64/f32$\
+-      $(call if_multiarch,:loongarch64-linux-gnuf32)
+-
+-    MULTILIB_OSDIRNAMES += \
+-      mabi.lp64s=../lib64/sf$\
+-      $(call if_multiarch,:loongarch64-linux-gnusf)
+-
+-endif
++#ifeq ($(filter LA_DISABLE_MULTILIB,$(tm_defines)),)
++#
++#    MULTILIB_OSDIRNAMES = \
++#      mabi.lp64d=../lib64$\
++#      $(call if_multiarch,:loongarch64-linux-gnu)
++#
++#    MULTILIB_OSDIRNAMES += \
++#      mabi.lp64f=../lib64/f32$\
++#      $(call if_multiarch,:loongarch64-linux-gnuf32)
++#
++#    MULTILIB_OSDIRNAMES += \
++#      mabi.lp64s=../lib64/sf$\
++#      $(call if_multiarch,:loongarch64-linux-gnusf)
++#
++#endif
+
-- 
2.20.1


