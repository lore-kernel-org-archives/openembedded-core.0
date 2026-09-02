Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC646C624DC
	for <webhook@archiver.kernel.org>; Wed,  2 Sep 2026 13:23:18 +0000 (UTC)
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12767.1788355393188747111
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Sep 2026 06:23:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=hEfIvBVZ;
 spf=pass (domain: gmail.com, ip: 209.85.219.49, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-90cdffe8e3eso10889456d6.2
        for <openembedded-core@lists.openembedded.org>; Wed, 02 Sep 2026 06:23:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788355392; x=1788960192; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FZwucFH3E4RiPYebY3+PaiNFTJhEEJnJg4wBR1BAxJQ=;
        b=hEfIvBVZXcVfQQA3wRTaDYuYNZ/iK5xy5sEhmXEs4yqczdUW53SMjyGzVLAMfD8ZkS
         pTov7NGs7no+soHo3kLnRDFCjV8aJYcXV/ith3OmxjkOHucnsbR8DclrhRUByyjcpjfK
         d7Y6Ad2D8zKFNgYnNX5Yj8/eXhxv6b7I9EoZxRp2I5mV8paTdvd3d1XnjYW3iWSFrAqG
         Y+2HED5r+D3o82HSsZ+/+tcsuNkVvOe1sVvbpFOfKgBiJot5D7a0D+Dv64xFiVGk0G7U
         gXOaU2oqviVwIiDBvrm59bSNBAnGhiEHgwy54tvnw3DTeZhmm5TZyicjDUkNmNPNYuAT
         8xjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788355392; x=1788960192;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FZwucFH3E4RiPYebY3+PaiNFTJhEEJnJg4wBR1BAxJQ=;
        b=Z3Q0/zQTuZah0gFHE13ejXIWwfViAjAdx0lQxSF0yHmGPN9ZikHiuJCF9+10Jio5L2
         ESH+dC5KY8FsDW8QIUDrYnkLbFBdkbasSVpbaph9IjZWa/IWmBS1h1UsV24vtYFl57vv
         NPHiOph6R57zLTFRO3vPWuvv3DiX85YDmMcxAR804j+0WCtBWEEQJjro0iLFku59p3Wg
         ebt5WhKeqIuROBszPnVawPrSWrf1UsOKpcERK+M/MClGkPrXrJhpCsIjlUBz08NQHW0i
         uMrOlc2B3kE4LEwD72ZUuSTNK1Ki9wGnZUdyeBKnuti2XliulJWxD2pykl1k4LOXpREd
         9V/A==
X-Gm-Message-State: AFuF++lqtuE8c5sPko359ZEi2qEXqEnCshDr3oPegZ3TbREBXqFuO0Fl
	ahzIaZXNpBfTuNGwnrk9sau59cjC6drwvhDJKFGXw3qakKDQU5wGryifBiV5bZ8t
X-Gm-Gg: AR+sD121LGOVsFaBM3yYIOB8ant2TrNivg6FLipNZR8xpLektykcEMUhBX+0hMgHdbZ
	ALltgWmbxksMwJ/BfIJ2dnTHHa3LK0d3g7fynLvCDgOeYGQtUliMZLqW4lUHxusDghwMnLJzHUB
	W8a0pMNuwSyZyEnAsg5HRc4mZ5pvCGP0C85YivbKOEG5/aCF8tjD4BPBgbIvGNu5+qphtUdNLYb
	Ds3wODuiPQdDF0dCp9O37eo+nnQRplZW6uLvgyR5+TVbAqgTQ20euefxxyTXHK0TJrreWZuym/2
	F921SBPH7aTav1/I+c4BzeDqONXt1kLUqVlCialPpNUhQFQcma4krcPi+F+KM1tuzdOLjMwCbus
	k2KdTbfHbqZ0SLYDzoofAYidgFqd9j33Ne8q92ssRVQi7l3zSDVnUgyF4mW6qb+hyBUrSwEEUKu
	WEUDqXiNEJk1eZswzlc/jtbtQhVCDSXD67BJFVy1gu7YaXBwrf40V6pbGpbylLzcXhTRt4Q1M09
	d14+F4lFeuINjtoy8oFx8G8WXMWNiBSXzFgE05p6b+8b7xLWWwHb1yyKcjIf5sP0xZAz0qli8XT
	ItvkN3X4mlplYzT1rR/LHIOf0Do26dW5dU46XGYreIytRtEtT5DogGr+ucqGOepBjAvBV9levJM
	5q/up
X-Received: by 2002:a05:6214:20c2:b0:90e:95c1:47d3 with SMTP id 6a1803df08f44-90e9f2335f2mr61014576d6.8.1788355391857;
        Wed, 02 Sep 2026 06:23:11 -0700 (PDT)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-90e9ee43763sm18059076d6.22.2026.09.02.06.23.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 06:23:11 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [meta][PATCH 04/07] linux-yocto/7.2: remap rust debug info paths
Date: Wed,  2 Sep 2026 09:23:01 -0400
Message-ID: <20260902132305.3685228-5-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260902132305.3685228-1-bruce.ashfield@gmail.com>
References: <20260902132305.3685228-1-bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Sep 2026 13:23:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244952

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Integrating the following commit(s) to linux-yocto/7.2:

1/1 [
    Author: Bruce Ashfield
    Email: bruce.ashfield@gmail.com
    Subject: Makefile: remap rust debug info paths (scope=all)
    Date: Tue, 1 Sep 2026 22:49:31 -0400

    Commit dda135077ecc9 ("rust: build: remap path to avoid absolute path")
    restricts rustc path remapping to macro scope, which leaves build paths
    in the DWARF debug info of rust objects. Under OpenEmbedded this trips
    the buildpaths QA check on kernel-dbg (samples/rust/*.ko and vmlinux),
    since the remap no longer reaches debug info and rustc rejects a second
    --remap-path-scope, so it cannot be widened from the recipe.

    Widen the scope to 'all' so rust debug info is remapped like C, restoring
    the pre-7.x behaviour that reproducible-build environments rely on.

    Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
]

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_7.2.bb               |  4 ++--
 .../linux/linux-yocto-tiny_7.2.bb             |  4 ++--
 meta/recipes-kernel/linux/linux-yocto_7.2.bb  | 20 +++++++++----------
 3 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_7.2.bb b/meta/recipes-kernel/linux/linux-yocto-rt_7.2.bb
index 9e17cb8b28..503a0ee260 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_7.2.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_7.2.bb
@@ -15,8 +15,8 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "f26e519ec35c8e267e06868e021c048bd2acc56a"
-SRCREV_meta ?= "92f4f82129cb5b0dcc665b31f704b540cf8153e3"
+SRCREV_machine ?= "3d984c8bbdb878fc240fdf9b59892e56802b278d"
+SRCREV_meta ?= "48dd3364f8af7104c75e86ea3c2bd0e55352b59b"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-7.2;destsuffix=${KMETA};protocol=https"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_7.2.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_7.2.bb
index f47866a688..6478274956 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_7.2.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_7.2.bb
@@ -18,8 +18,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "fba15564479e1a6f48ff3b591c11030f7a4f7229"
-SRCREV_meta ?= "92f4f82129cb5b0dcc665b31f704b540cf8153e3"
+SRCREV_machine ?= "eaf351389aa8a14680ad327afecb5abb78347081"
+SRCREV_meta ?= "48dd3364f8af7104c75e86ea3c2bd0e55352b59b"
 
 PV = "${LINUX_VERSION}+git"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_7.2.bb b/meta/recipes-kernel/linux/linux-yocto_7.2.bb
index c3412b596d..98f1041a46 100644
--- a/meta/recipes-kernel/linux/linux-yocto_7.2.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_7.2.bb
@@ -17,18 +17,18 @@ KBRANCH:qemux86-64 ?= "v7.2/standard/base"
 KBRANCH:qemuloongarch64  ?= "v7.2/standard/base"
 KBRANCH:qemumips64 ?= "v7.2/standard/mti-malta"
 
-SRCREV_machine:qemuarm ?= "50c95a086bae6860a661d425650f7777495a9d0f"
-SRCREV_machine:qemuarm64 ?= "fba15564479e1a6f48ff3b591c11030f7a4f7229"
-SRCREV_machine:qemuloongarch64 ?= "fba15564479e1a6f48ff3b591c11030f7a4f7229"
+SRCREV_machine:qemuarm ?= "6390ad2592faab51e5930cdcd4073805ebeb3096"
+SRCREV_machine:qemuarm64 ?= "eaf351389aa8a14680ad327afecb5abb78347081"
+SRCREV_machine:qemuloongarch64 ?= "eaf351389aa8a14680ad327afecb5abb78347081"
 SRCREV_machine:qemumips ?= "ab0e33fefa2a3d0366b2b8deb7cfb3be2d8dc436"
-SRCREV_machine:qemuppc ?= "fba15564479e1a6f48ff3b591c11030f7a4f7229"
-SRCREV_machine:qemuriscv64 ?= "fba15564479e1a6f48ff3b591c11030f7a4f7229"
-SRCREV_machine:qemuriscv32 ?= "fba15564479e1a6f48ff3b591c11030f7a4f7229"
-SRCREV_machine:qemux86 ?= "fba15564479e1a6f48ff3b591c11030f7a4f7229"
-SRCREV_machine:qemux86-64 ?= "fba15564479e1a6f48ff3b591c11030f7a4f7229"
+SRCREV_machine:qemuppc ?= "eaf351389aa8a14680ad327afecb5abb78347081"
+SRCREV_machine:qemuriscv64 ?= "eaf351389aa8a14680ad327afecb5abb78347081"
+SRCREV_machine:qemuriscv32 ?= "eaf351389aa8a14680ad327afecb5abb78347081"
+SRCREV_machine:qemux86 ?= "eaf351389aa8a14680ad327afecb5abb78347081"
+SRCREV_machine:qemux86-64 ?= "eaf351389aa8a14680ad327afecb5abb78347081"
 SRCREV_machine:qemumips64 ?= "ab0e33fefa2a3d0366b2b8deb7cfb3be2d8dc436"
-SRCREV_machine ?= "fba15564479e1a6f48ff3b591c11030f7a4f7229"
-SRCREV_meta ?= "92f4f82129cb5b0dcc665b31f704b540cf8153e3"
+SRCREV_machine ?= "eaf351389aa8a14680ad327afecb5abb78347081"
+SRCREV_meta ?= "48dd3364f8af7104c75e86ea3c2bd0e55352b59b"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
-- 
2.43.0


