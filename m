Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 137E1C433EF
	for <webhook@archiver.kernel.org>; Sun, 13 Feb 2022 01:23:52 +0000 (UTC)
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com
 [209.85.222.173])
 by mx.groups.io with SMTP id smtpd.web11.16047.1644715430762483175
 for <openembedded-core@lists.openembedded.org>;
 Sat, 12 Feb 2022 17:23:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=iAs9l0Gr;
 spf=pass (domain: gmail.com, ip: 209.85.222.173,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f173.google.com with SMTP id bs32so11544712qkb.1
        for <openembedded-core@lists.openembedded.org>;
 Sat, 12 Feb 2022 17:23:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=l3J4ajEoES4k7nyH16JExChHsxedNhNaDOYcL+baaoQ=;
        b=iAs9l0Gr9oE6SgosHTXW/80GoEkIwktBnm41xlFRAejRySxv33mkF1xAJPoaDGZSwX
         PnVkgA8XKGHa/I23P4drtlYatcu97ZgvDMnNsCpArScp9G96RFwirbWO9T70SDIWuTH+
         rurr161+hbld70RdsLtShIYjqmk72C9GPBJEtI4JghRH7IP3KIO5iWU1GLAKsztUtZ4N
         +ZnOFJRiUHa8L3h/iVPMkpKSzU6K3gX7cQoYmvmnm4hdx1S/kV3vKtIOs+nfn2wSCSp1
         2FKgkSC8USGQZ6ZzMGL+vhP6FpvgfmPtOvGWcqkX2J+3Cm+k2CQsNLrEEmwTTV7oO73x
         BLsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=l3J4ajEoES4k7nyH16JExChHsxedNhNaDOYcL+baaoQ=;
        b=CgPZJu66Yy7A03CN7FMg3X3s7dNa1VZ2BoLvIhvASfKy7X5ZJCdHXv/pENi+LUSziz
         LR+a9w8dCreFuz3Pk7gM3CUaFYdP5pJGHmhMs9jvR5+Co5wlk127/06scrHfBkO3DteB
         pdPMMRG65Bx/1riza75RyAZeiEElGSCepU70u4ukGhdTacjbrbYsi3ofaUcaydjrrGDb
         673gbm8krjM0hT7+Y34JdFTqdvSfPGCL7gRa9Gj6zzsRxzN4x56oMg/tPCiVf2Pty/e8
         0M4TIOwjk7PCK3JpXfjqnlrIgukMqO7KGp7k/TCctuEq8bFZnv1mw1028tZftvjVWXvT
         SWYw==
X-Gm-Message-State: AOAM5327lVVbgxoecdihfkMCI7MXR2rIOS5xIe5VDskXqUNx0FpPDpya
	wil9i/V/KyhBvkc3KpZatio=
X-Google-Smtp-Source: 
 ABdhPJzg5WaV6gque03vXk0MfDdih/29Gjy7K+xZxU/zXF0J0jg30OEEDV/0jnb67+P0eT4VBdahow==
X-Received: by 2002:a05:620a:2902:: with SMTP id
 m2mr4061485qkp.512.1644715429879;
        Sat, 12 Feb 2022 17:23:49 -0800 (PST)
Received: from build.lan
 (cpe04d4c4975b80-cmf4c11490699b.cpe.net.cable.rogers.com. [174.112.63.222])
        by smtp.gmail.com with ESMTPSA id
 w13sm13016556qkb.106.2022.02.12.17.23.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Feb 2022 17:23:49 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 4/4] linux-yocto/5.10: ppc/riscv: fix build with binutils
 2.3.8
Date: Sat, 12 Feb 2022 20:23:44 -0500
Message-Id: 
 <ad5f344142508074fa43058768d55b53c90495c9.1644715271.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1644715271.git.bruce.ashfield@gmail.com>
References: <cover.1644715271.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 13 Feb 2022 01:23:52 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161679

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Integrating the following commit(s) to linux-yocto/5.10:

    1bd813fe8d0e riscv: fix build with binutils 2.38
    835a2d1b24c6 powerpc/lib/sstep: fix 'ptesync' build error

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_5.10.bb              |  2 +-
 .../linux/linux-yocto-tiny_5.10.bb            |  4 ++--
 meta/recipes-kernel/linux/linux-yocto_5.10.bb | 20 +++++++++----------
 3 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
index f353a0610c..4315ef6fa3 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
@@ -11,7 +11,7 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "53a27dc510c8d9152ffa4d2d95b888db7d3d97b6"
+SRCREV_machine ?= "c8061a9f265a0d314e5b780a651662f462e4b287"
 SRCREV_meta ?= "a58f4e7cca3973e04d3f9a40356ef9c2c0bb10a5"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
index e9c20c6c79..c968d404d0 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
@@ -15,8 +15,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine:qemuarm ?= "b7823b6ac25671f8dc5ee2c4cf74af3be88207cf"
-SRCREV_machine ?= "7558a33fc5b60d4327b683c3376c5352cba11ed1"
+SRCREV_machine:qemuarm ?= "5e7b4957ac1a94fdaaa719f6b62b80856e8a55e6"
+SRCREV_machine ?= "24a50caea8c65c2af4987c60067dc55ef737ebca"
 SRCREV_meta ?= "a58f4e7cca3973e04d3f9a40356ef9c2c0bb10a5"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.10.bb b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
index a7b3d08d9e..ae607d721b 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
@@ -13,16 +13,16 @@ KBRANCH:qemux86  ?= "v5.10/standard/base"
 KBRANCH:qemux86-64 ?= "v5.10/standard/base"
 KBRANCH:qemumips64 ?= "v5.10/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "c3a59bad41cefbe15d6bcde0ec2fe5c7ea28ba2b"
-SRCREV_machine:qemuarm64 ?= "07ca3e3c85445f2c31bd081b27741c9680536168"
-SRCREV_machine:qemumips ?= "10ae40d47f14b3c05dd6506c70576383c5474670"
-SRCREV_machine:qemuppc ?= "bc2a7c884103143e0a4360518247fe01bf2c13d3"
-SRCREV_machine:qemuriscv64 ?= "84f6a75f64961e59d61bf3d70ab17e8bb430386b"
-SRCREV_machine:qemuriscv32 ?= "84f6a75f64961e59d61bf3d70ab17e8bb430386b"
-SRCREV_machine:qemux86 ?= "84f6a75f64961e59d61bf3d70ab17e8bb430386b"
-SRCREV_machine:qemux86-64 ?= "84f6a75f64961e59d61bf3d70ab17e8bb430386b"
-SRCREV_machine:qemumips64 ?= "13998bd0244737548a21a17d1969ca65af0712b1"
-SRCREV_machine ?= "84f6a75f64961e59d61bf3d70ab17e8bb430386b"
+SRCREV_machine:qemuarm ?= "7f5de9bc153963749c9a566828b59d4e63796432"
+SRCREV_machine:qemuarm64 ?= "c5bed4d604e64e8ce795a28576e341a2e790b4de"
+SRCREV_machine:qemumips ?= "0361229f491eec312e503cf7e58931571e53503f"
+SRCREV_machine:qemuppc ?= "2d7e10b0e0bab9b364e7612caf81b318f1d28b27"
+SRCREV_machine:qemuriscv64 ?= "1bd813fe8d0e8e2bc4b05fdf61fb77d68ee416c5"
+SRCREV_machine:qemuriscv32 ?= "1bd813fe8d0e8e2bc4b05fdf61fb77d68ee416c5"
+SRCREV_machine:qemux86 ?= "1bd813fe8d0e8e2bc4b05fdf61fb77d68ee416c5"
+SRCREV_machine:qemux86-64 ?= "1bd813fe8d0e8e2bc4b05fdf61fb77d68ee416c5"
+SRCREV_machine:qemumips64 ?= "931424f9c84cc440e8f154465062e71e2bdc2f03"
+SRCREV_machine ?= "1bd813fe8d0e8e2bc4b05fdf61fb77d68ee416c5"
 SRCREV_meta ?= "a58f4e7cca3973e04d3f9a40356ef9c2c0bb10a5"
 
 # remap qemuarm to qemuarma15 for the 5.8 kernel
-- 
2.19.1


