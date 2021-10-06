Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F089C433FE
	for <webhook@archiver.kernel.org>; Wed,  6 Oct 2021 00:12:51 +0000 (UTC)
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com
 [209.85.219.49])
 by mx.groups.io with SMTP id smtpd.web12.5009.1633479169781651813
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Oct 2021 17:12:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=O+CVzJwR;
 spf=pass (domain: gmail.com, ip: 209.85.219.49,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f49.google.com with SMTP id z3so783303qvl.9
        for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Oct 2021 17:12:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=zO3QY9rVxa7FLRu95aIrNVT6UxSXO3sSW9lmR3Bphmo=;
        b=O+CVzJwRvbca8t2DURDAlq1PN84hyULNi8xs56jLZxv6HIA4hlMhzjboDmnz8C3pWc
         3xq4zqWzdwNobRExXwQtfdCF6EKzx+WzY4UVaUAORY1DAp/LvnQMTCSzWiOiBee8ykyZ
         GisUdntYH7QKN5jgC9sUXyhyRPN0b8bu5G4f0bZZCdYFJrPThzT3kcah3c3OLaS8ULXA
         FzNR4uA73hdejYRV7dJxHwLh/A+zOaI4rmDwF2BCZK77WQlNr+tuuN77Amo13gror8Vz
         z4165AlzSQf+r2o9HeNMt0YbQ8i4GF7Mu9ARoRsullXhOib0tOs28RmNNWJDqWxLi3wM
         JJDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=zO3QY9rVxa7FLRu95aIrNVT6UxSXO3sSW9lmR3Bphmo=;
        b=zIJ7yUjQ1xHQKWMmyFdUk79Gpq5/58CbPCs/ZSQR+zMRY3cBncG4d1vySKyxlMEtRN
         jH5cvQ539a+orPZn97AjYeC93gQNnGhr8Ies6by33imiibAiXcYFbAiDPu+I63gouSRP
         uPfRX0XX+05LUqQWg3OOKVJcN6811xpakh4XuqJarfCHarP84v1AZ+WGWucA6vUUS4u+
         5Ex05VA9y4UuqCpvtDhNyu2nqe0x011zY/SKWKmpvlcxfdXxJlNhwOZfPC2XMuug67XX
         ud24XpoMzbDZwRVrB26rj3HNRV93ShWSFuODgVc+p1wuxPb4hfEWWveJ6AU4PK1GV8JV
         70Qw==
X-Gm-Message-State: AOAM533U3khNER/rJIh4Bu0sBDJs4EdQs5mxNBNw4um2YZQ4aSeagGqW
	1s4hFNYdEfzcUbQHa1RmbP2B8hTfLF7oAg==
X-Google-Smtp-Source: 
 ABdhPJzQ5LPrAJmWsN3UnzyubW+Bl5AZHzdUPp1IG69AD5yHm9vuwsXakwrLb9BrzFt+vT48WPJoqQ==
X-Received: by 2002:a0c:e381:: with SMTP id a1mr31212107qvl.42.1633479168913;
        Tue, 05 Oct 2021 17:12:48 -0700 (PDT)
Received: from build.lan
 (cpe04d4c4975b80-cmf4c11490699b.cpe.net.cable.rogers.com. [174.112.63.222])
        by smtp.gmail.com with ESMTPSA id
 bk20sm11275922qkb.13.2021.10.05.17.12.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Oct 2021 17:12:48 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/7] linux-yocto/5.14: scripts/gcc-plugins: consistently use
 HOSTCC
Date: Tue,  5 Oct 2021 20:12:40 -0400
Message-Id: 
 <9666edbab2d32cc53726d177bb23af9976ef90c9.1633478971.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1633478971.git.bruce.ashfield@gmail.com>
References: <cover.1633478971.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Oct 2021 00:12:51 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156661

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Integrating the following commit(s) to linux-yocto/5.14:

    724df5812165 scripts/gcc-plugins: consistently use HOSTCC

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_5.14.bb              |  4 ++--
 .../linux/linux-yocto-tiny_5.14.bb            |  6 ++---
 meta/recipes-kernel/linux/linux-yocto_5.14.bb | 22 +++++++++----------
 3 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.14.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.14.bb
index a147e632e4..06064706e0 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.14.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.14.bb
@@ -11,8 +11,8 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "7630ebb9fd510cf7aa31b6f1dd472f3b0442afb3"
-SRCREV_meta ?= "42d2cf670ed06f4dddd2a035611a519ea68e2d26"
+SRCREV_machine ?= "87e920626b63515458e304527509289993be2796"
+SRCREV_meta ?= "a1e3f40a0f4c5d05d1a6110a42d53eb3c3947ec8"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.14;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.14.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.14.bb
index 20ff40d267..699c8c7da0 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.14.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.14.bb
@@ -15,9 +15,9 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine:qemuarm ?= "ee2ccc84e65ade5ba0f8e1a700fba29a755746a1"
-SRCREV_machine ?= "7ae156be3bdbf033839f7f3ec2e9a0ffffb18818"
-SRCREV_meta ?= "42d2cf670ed06f4dddd2a035611a519ea68e2d26"
+SRCREV_machine:qemuarm ?= "f956536237159b85f94d70bb9e74b5894e6bf07d"
+SRCREV_machine ?= "724df5812165b61d20e93866be8f3e7e1e5e6b5c"
+SRCREV_meta ?= "a1e3f40a0f4c5d05d1a6110a42d53eb3c3947ec8"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.14.bb b/meta/recipes-kernel/linux/linux-yocto_5.14.bb
index 0c6fbff75e..809b6fa066 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.14.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.14.bb
@@ -13,17 +13,17 @@ KBRANCH:qemux86  ?= "v5.14/standard/base"
 KBRANCH:qemux86-64 ?= "v5.14/standard/base"
 KBRANCH:qemumips64 ?= "v5.14/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "8226a3a65df2dbae0fe71e9ff54cba70a9ba85e5"
-SRCREV_machine:qemuarm64 ?= "7ae156be3bdbf033839f7f3ec2e9a0ffffb18818"
-SRCREV_machine:qemumips ?= "b5389debd85300e24b877f25c2e90381f1df7678"
-SRCREV_machine:qemuppc ?= "7ae156be3bdbf033839f7f3ec2e9a0ffffb18818"
-SRCREV_machine:qemuriscv64 ?= "7ae156be3bdbf033839f7f3ec2e9a0ffffb18818"
-SRCREV_machine:qemuriscv32 ?= "7ae156be3bdbf033839f7f3ec2e9a0ffffb18818"
-SRCREV_machine:qemux86 ?= "7ae156be3bdbf033839f7f3ec2e9a0ffffb18818"
-SRCREV_machine:qemux86-64 ?= "7ae156be3bdbf033839f7f3ec2e9a0ffffb18818"
-SRCREV_machine:qemumips64 ?= "56cc67b699194944809832f4c8f58b9828f02bf9"
-SRCREV_machine ?= "7ae156be3bdbf033839f7f3ec2e9a0ffffb18818"
-SRCREV_meta ?= "42d2cf670ed06f4dddd2a035611a519ea68e2d26"
+SRCREV_machine:qemuarm ?= "139cd4a6ac01e83002011680d9fbb14048c1bc3a"
+SRCREV_machine:qemuarm64 ?= "724df5812165b61d20e93866be8f3e7e1e5e6b5c"
+SRCREV_machine:qemumips ?= "f5a73ebec6f028075220c690bbb121284313ebd3"
+SRCREV_machine:qemuppc ?= "724df5812165b61d20e93866be8f3e7e1e5e6b5c"
+SRCREV_machine:qemuriscv64 ?= "724df5812165b61d20e93866be8f3e7e1e5e6b5c"
+SRCREV_machine:qemuriscv32 ?= "724df5812165b61d20e93866be8f3e7e1e5e6b5c"
+SRCREV_machine:qemux86 ?= "724df5812165b61d20e93866be8f3e7e1e5e6b5c"
+SRCREV_machine:qemux86-64 ?= "724df5812165b61d20e93866be8f3e7e1e5e6b5c"
+SRCREV_machine:qemumips64 ?= "912fc3d0cf57239e6fe5030b82165b2d6f0632e3"
+SRCREV_machine ?= "724df5812165b61d20e93866be8f3e7e1e5e6b5c"
+SRCREV_meta ?= "a1e3f40a0f4c5d05d1a6110a42d53eb3c3947ec8"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
-- 
2.19.1


