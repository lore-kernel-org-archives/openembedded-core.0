Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99D22CDB47C
	for <webhook@archiver.kernel.org>; Tue, 23 Jun 2026 22:27:26 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.32877.1782253642940746019
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Jun 2026 15:27:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=XIAogP+l;
 spf=pass (domain: smile.fr, ip: 209.85.128.52, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-490c0c92cffso2390475e9.2
        for <openembedded-core@lists.openembedded.org>; Tue, 23 Jun 2026 15:27:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1782253641; x=1782858441; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XsGRHk+FcR67DPywYc8No3vmH14rsYsPFka9eW7gcYg=;
        b=XIAogP+lWYH0kz2g2jzr3UroZtVJDIIa00+N3gFVQbPWQhg0svoDVoytnnU/pt8+4/
         VIa8Xyf00+thWl35G5Ive0VEmKryPw6A8+VnjIWA+bnKynFjC82JBviUzclaX0418fbf
         ljVMMGgmbsH6QpH0OAz3usGWmnq+BaMXsj9h8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782253641; x=1782858441;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=XsGRHk+FcR67DPywYc8No3vmH14rsYsPFka9eW7gcYg=;
        b=J/wX9oshUNZry1X+64FMRGJRKSalEic0cJBnLYqWNOPLr/iCaGZhPzPnbhcnTtLo8U
         OZfFdjBgKm+ZbJkHkC0O4sn+BAgxNfBnkiHMBtaGNzkgewKoXun2x1N9WiIemQADryC0
         IAaicBYzMBwZ9zedPAt4+aYJ09knTzm5aNP/cHbGVYomyEwTbJKc3w2IQ9I94z7PWd8w
         AfEKRGW92GFozi48t2uPPR0GPTkHo7AX0Hztxj+84Y/R3SpNf32K00OUaqCE5SwQmTu+
         bdsrEunL4W7Ub8Fp03eCdREve5Eg8NY3GQwfmmIVvmkqL6ij3GOHWQU9xIDK2cdAuoRv
         Cx3w==
X-Gm-Message-State: AOJu0Yxv0Y19EJej4jeetX2zZV6s2c3cjPOKzrsGTfYGLwsh8iXxhkwo
	iiSfZ/wMVb5XwzkQAAXK6V+d6rpoBMagVbrVvCISoQfFRKtvTvwiDJ2YOQXTsmFkGpwORC7LFvc
	l9LaU
X-Gm-Gg: AfdE7ckGJodVFT2QXgaDhOh1TYylXfl6Uv9x1r3CUyMwj+cT3luK800o6vIhQMUt2iU
	kvE0HumHGCc8CpPhb/OE5veYs2GEY9KolRftC1KOtcc68DUJ0eOJgMY1l5KsskT0cLQ3cPjLCts
	1CbdHURYQXmma3mQMyROAv2je7DkFnOg/W+r+4OR94hu59G+jduPweP7PJxaNVLSksTJHnYyLMC
	PH+SgTD3mD5418v+Rr6LL3US58n9UZrsh0LP6vZ55PL1hxSgYPQX3m86Lg5BeC6pE1TQ5/kvYIT
	GnaCTsWwOp3vYUqSHLl2qt41XidcyloEMw5sn9Ld2+sf+8xJVfec5W93azNtqj6M4p/wdJc4QTE
	b9t6zez7IuU+dDwww6c71cNtToXY6UynLfoNSf94VB/9XrEjfqshgrtGZWJRTYzD49WM9wjKaT3
	NetqBEFQlf8pGUj/bqjCi1a/FAfNNOOqV3TNjewTfD+r6SMxPCFQhajiSdYRkfcdbofU/JA4UQY
	4hWPQnkAYg022AU2lhZWB6e4Bs=
X-Received: by 2002:a05:600c:4f81:b0:490:b724:507d with SMTP id 5b1f17b1804b1-4926084b822mr6381055e9.11.1782253641106;
        Tue, 23 Jun 2026 15:27:21 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa0055dd0cae868d89dd.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:55dd:cae:868d:89dd])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4923fd21dbdsm370786745e9.6.2026.06.23.15.27.20
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 15:27:20 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap v2 41/41] linux-yocto/6.6: address ltp hang
Date: Wed, 24 Jun 2026 00:26:40 +0200
Message-ID: <737293bead3e7b994347e47f09bc69437479d50c.1782252148.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1782252148.git.yoann.congal@smile.fr>
References: <cover.1782252148.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Jun 2026 22:27:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239463

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Integrating the following commit(s) to linux-yocto/6.6:

1/1 [
    Author: Baokun Li
    Email: libaokun1@huawei.com
    Subject: ext4: get rid of ppath in get_ext_path()
    Date: Thu, 22 Aug 2024 10:35:32 +0800

    The use of path and ppath is now very confusing, so to make the code more
    readable, pass path between functions uniformly, and get rid of ppath.

    After getting rid of ppath in get_ext_path(), its caller may pass an error
    pointer to ext4_free_ext_path(), so it needs to teach ext4_free_ext_path()
    and ext4_ext_drop_refs() to skip the error pointer. No functional changes.

    Signed-off-by: Baokun Li <libaokun1@huawei.com>
    Reviewed-by: Jan Kara <jack@suse.cz>
    Reviewed-by: Ojaswin Mujoo <ojaswin@linux.ibm.com>
    Tested-by: Ojaswin Mujoo <ojaswin@linux.ibm.com>
    Link: https://patch.msgid.link/20240822023545.1994557-13-libaokun@huaweicloud.com
    Signed-off-by: Theodore Ts'o <tytso@mit.edu>
]

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
[YC: more detail at https://lore.kernel.org/openembedded-core/DJGKEQF8GRU1.RF7JY64COTAA@smile.fr/T/#u]
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../linux/linux-yocto-rt_6.6.bb               |  2 +-
 .../linux/linux-yocto-tiny_6.6.bb             |  2 +-
 meta/recipes-kernel/linux/linux-yocto_6.6.bb  | 22 +++++++++----------
 3 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
index 67fb5141ce0..c3200cfd3fe 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
@@ -14,7 +14,7 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "422bdbd919836dc6565f5bbeb5b662b9c52dc038"
+SRCREV_machine ?= "1ceada58731a98237f70384921758a4df3951960"
 SRCREV_meta ?= "4a6f16d14b76e28ab7615c88e2fbdf95ee15fc98"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
index 7b4f0430a60..563598a2bde 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
@@ -17,7 +17,7 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "597d6818e83dc368f871fccf981a2a54a93196d0"
+SRCREV_machine ?= "66e051144e21d531fa26ef67476dfdefbfc119a2"
 SRCREV_meta ?= "4a6f16d14b76e28ab7615c88e2fbdf95ee15fc98"
 
 PV = "${LINUX_VERSION}+git"
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.6.bb b/meta/recipes-kernel/linux/linux-yocto_6.6.bb
index 3261ad6ac3f..07a06f18529 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.6.bb
@@ -18,17 +18,17 @@ KBRANCH:qemux86-64 ?= "v6.6/standard/base"
 KBRANCH:qemuloongarch64  ?= "v6.6/standard/base"
 KBRANCH:qemumips64 ?= "v6.6/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "860f859f5e469702d108e6ce9d3affaca072cfa3"
-SRCREV_machine:qemuarm64 ?= "60caa07a883ec933fad7aadaa2eb67a16c207906"
-SRCREV_machine:qemuloongarch64 ?= "a9288bf8eb270b824e3f92ee54df9dcd72a6052f"
-SRCREV_machine:qemumips ?= "6895489ba64aa274deea1687100068d4afddaec4"
-SRCREV_machine:qemuppc ?= "5a29f898aaae6bd0e12bdaeed596f40ab6fec468"
-SRCREV_machine:qemuriscv64 ?= "a9288bf8eb270b824e3f92ee54df9dcd72a6052f"
-SRCREV_machine:qemuriscv32 ?= "a9288bf8eb270b824e3f92ee54df9dcd72a6052f"
-SRCREV_machine:qemux86 ?= "a9288bf8eb270b824e3f92ee54df9dcd72a6052f"
-SRCREV_machine:qemux86-64 ?= "a9288bf8eb270b824e3f92ee54df9dcd72a6052f"
-SRCREV_machine:qemumips64 ?= "44180b7d240f83de490ab570bc092afe5d123207"
-SRCREV_machine ?= "a9288bf8eb270b824e3f92ee54df9dcd72a6052f"
+SRCREV_machine:qemuarm ?= "d81ffd8843535762fecf5aa5fb2ca7d2c4343038"
+SRCREV_machine:qemuarm64 ?= "1f7f3a52dacadfcc75863f25252a534b06fdaeeb"
+SRCREV_machine:qemuloongarch64 ?= "a8a7d078f151a24e01d4501853c88c6b08c9cad9"
+SRCREV_machine:qemumips ?= "4410226fddf113b89cceb26e7ee5ca5bb70c55fb"
+SRCREV_machine:qemuppc ?= "8f8faf1fe9183f295901f8f2b8916ff54f4a4bfb"
+SRCREV_machine:qemuriscv64 ?= "a8a7d078f151a24e01d4501853c88c6b08c9cad9"
+SRCREV_machine:qemuriscv32 ?= "a8a7d078f151a24e01d4501853c88c6b08c9cad9"
+SRCREV_machine:qemux86 ?= "a8a7d078f151a24e01d4501853c88c6b08c9cad9"
+SRCREV_machine:qemux86-64 ?= "a8a7d078f151a24e01d4501853c88c6b08c9cad9"
+SRCREV_machine:qemumips64 ?= "14ca63e9f1ce2090e189c16b1024ed3df8f833f0"
+SRCREV_machine ?= "a8a7d078f151a24e01d4501853c88c6b08c9cad9"
 SRCREV_meta ?= "4a6f16d14b76e28ab7615c88e2fbdf95ee15fc98"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll

