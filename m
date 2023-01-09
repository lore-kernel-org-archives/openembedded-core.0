Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9BDAC54EBC
	for <webhook@archiver.kernel.org>; Mon,  9 Jan 2023 00:39:14 +0000 (UTC)
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
 by mx.groups.io with SMTP id smtpd.web10.59754.1673224753476092546
 for <openembedded-core@lists.openembedded.org>;
 Sun, 08 Jan 2023 16:39:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=MjH3Cusl;
 spf=pass (domain: gmail.com, ip: 209.85.160.181, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f181.google.com with SMTP id v14so6771443qtq.3
        for <openembedded-core@lists.openembedded.org>; Sun, 08 Jan 2023 16:39:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ukOZXnCisXw1jqLNn7WwQ0cuAjLn8qQLOmhlJi0tdNc=;
        b=MjH3CuslFuscaij/J0dcZDwtwRwQGCHuwoe+jHpL396hdTVQdDbxzklOhF4I8A8uj3
         rylvk5aPKL7b4NWe5mg6K31nqd2zgqIAyCRmysxKRt94JzNLsKX3Nynw1TyxyRzwt8TF
         p1KGAj3FvcmpgrSkbAY6yQIqG0icYTu9JryBRFsdRD6jxDt/2ih9gg6JoPj6L9jAXjQQ
         M6jsIZao8j7XOmqIBvj06puR2kEbGEn3YsFHsJjH1Kf2kBKjkw71JI30lc1EJHNtjq/w
         wzURWNDc2mcRWRmZ4zt6gJXbjMYTWHOqvSxRcJTGSvOmdi4JaBLVfTv3HuFsJa2d2S63
         7cJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ukOZXnCisXw1jqLNn7WwQ0cuAjLn8qQLOmhlJi0tdNc=;
        b=rxjD7xqE67xbU/lVK2JkFyrGaJYPV1vRkh8iQ92F2pF/vIQ3jV1adF4UIM9w5QPYYZ
         +zukKSotRNffSJbTrzg783OfCaqy+szIi4EURGVxa5Scjkg8kzgCA/Ey7Di3gBJK6HsD
         hi5DqQ+x84jXsAHuSmtVynXCn55jDYGcKX+PVrg4h3XxYMJyNPGJTK/xYD4jwgzVXtSz
         J0CViVrmkIdBpj7VnTYRn+TdvzOBe3e1MyeCG+wKPi7OCk79V1Y9o24B7dtKQlyRMd2a
         70gLYQishbJgHfgFVJ02Lrfv3iAXkkl1cjRsRqlEk/QTQBYIK3/nAgn5jt0n4t96hzwz
         D6uA==
X-Gm-Message-State: AFqh2kp5NymqNBqMeSC3Z/Ele1WwlmTHpPMQInFJ3gQncN6L/5MX8vft
	R22y0Dv8bKklCAPiWGsumfR+Tg7u3ukf4A==
X-Google-Smtp-Source: AMrXdXvXzkfi+VZig1z/Rqld290RgKtjT2SJ+gG9zKZHZgBpu/V+MWUfxOQxoAqmyF2tczLafzIp5g==
X-Received: by 2002:ac8:698a:0:b0:3a5:f9f8:3ec4 with SMTP id o10-20020ac8698a000000b003a5f9f83ec4mr79174087qtq.30.1673224752389;
        Sun, 08 Jan 2023 16:39:12 -0800 (PST)
Received: from build.lan (cpe7c9a54441c1f-cm7c9a54441c1d.cpe.net.cable.rogers.com. [173.34.238.88])
        by smtp.gmail.com with ESMTPSA id i1-20020a05620a248100b006fc9fe67e34sm4529980qkn.81.2023.01.08.16.39.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Jan 2023 16:39:11 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 08/14] linux-yocto/5.15: libbpf: Fix build warning on ref_ctr_off
Date: Sun,  8 Jan 2023 19:38:55 -0500
Message-Id: <a9de160cc26e3d4490c4002b933867f8fb1d6d3b.1673224444.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1673224444.git.bruce.ashfield@gmail.com>
References: <cover.1673224444.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 09 Jan 2023 00:39:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175649

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Integrating the following commit(s) to linux-yocto/5.15:

    da5513f30187 libbpf: Fix build warning on ref_ctr_off

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_5.15.bb              |  4 ++--
 .../linux/linux-yocto-tiny_5.15.bb            |  4 ++--
 meta/recipes-kernel/linux/linux-yocto_5.15.bb | 24 +++++++++----------
 3 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
index 63294f5bb6..3dac2fbcd2 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
@@ -11,8 +11,8 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "dcd3b533c5f6bc4698d5b09aa83ce9a4695df3b0"
-SRCREV_meta ?= "66de7a6f2687cdaf5169ce5b57dd35f508be1682"
+SRCREV_machine ?= "6a972b54f014ca67588d73f32058c42af0bd856e"
+SRCREV_meta ?= "72756ee16d7230f04fb6bbf0bb115e32a9d73d8d"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.15;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
index 12e462228f..3dd2ecdf6f 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
@@ -14,8 +14,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "c7e10f06a33a546bcdd0b2e2909459b7572b5443"
-SRCREV_meta ?= "66de7a6f2687cdaf5169ce5b57dd35f508be1682"
+SRCREV_machine ?= "6e85c80a960287ec238f53c91eeade3456044fa3"
+SRCREV_meta ?= "72756ee16d7230f04fb6bbf0bb115e32a9d73d8d"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.15.bb b/meta/recipes-kernel/linux/linux-yocto_5.15.bb
index 4e341713f6..dabbb82822 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.15.bb
@@ -13,24 +13,24 @@ KBRANCH:qemux86  ?= "v5.15/standard/base"
 KBRANCH:qemux86-64 ?= "v5.15/standard/base"
 KBRANCH:qemumips64 ?= "v5.15/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "e5f2cf3560139bbaad54796c323d60e66cc19374"
-SRCREV_machine:qemuarm64 ?= "d8835a4d4e9d4ea835316cd1843d62e30c5fef33"
-SRCREV_machine:qemumips ?= "0f802d6525c21abe586c833074fece3e665a9ed9"
-SRCREV_machine:qemuppc ?= "84f529230ca9f2ec20517821f7422d62e43ab808"
-SRCREV_machine:qemuriscv64 ?= "4c5a089621a8f395f020f6c2f4c578aafa155011"
-SRCREV_machine:qemuriscv32 ?= "4c5a089621a8f395f020f6c2f4c578aafa155011"
-SRCREV_machine:qemux86 ?= "4c5a089621a8f395f020f6c2f4c578aafa155011"
-SRCREV_machine:qemux86-64 ?= "4c5a089621a8f395f020f6c2f4c578aafa155011"
-SRCREV_machine:qemumips64 ?= "ea2140a5f0cf7b8351982f60d3b30a4657ab0919"
-SRCREV_machine ?= "4c5a089621a8f395f020f6c2f4c578aafa155011"
-SRCREV_meta ?= "66de7a6f2687cdaf5169ce5b57dd35f508be1682"
+SRCREV_machine:qemuarm ?= "24c30a8e9f8385f6d74785aa345f5731321b6c41"
+SRCREV_machine:qemuarm64 ?= "c3caed57192735dc74adff939ea35af248a11177"
+SRCREV_machine:qemumips ?= "3bed92886dc9177ce0076dada5056cbe83ec11f0"
+SRCREV_machine:qemuppc ?= "45cbeb05d362ee51b7836a7faa07958670110c38"
+SRCREV_machine:qemuriscv64 ?= "da5513f301871b972d5bc6fab284d3cb277e0a28"
+SRCREV_machine:qemuriscv32 ?= "da5513f301871b972d5bc6fab284d3cb277e0a28"
+SRCREV_machine:qemux86 ?= "da5513f301871b972d5bc6fab284d3cb277e0a28"
+SRCREV_machine:qemux86-64 ?= "da5513f301871b972d5bc6fab284d3cb277e0a28"
+SRCREV_machine:qemumips64 ?= "2642cdd862a63f5a8c2774f372f3d3424991b1b9"
+SRCREV_machine ?= "da5513f301871b972d5bc6fab284d3cb277e0a28"
+SRCREV_meta ?= "72756ee16d7230f04fb6bbf0bb115e32a9d73d8d"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
 # meta SRCREV as the linux-yocto-standard builds. Select your version using the
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
-SRCREV_machine:class-devupstream ?= "71e496bd338221709b180b60ba419fa542c2b320"
+SRCREV_machine:class-devupstream ?= "d68f50bfb00f6288e812be895ea5c77932a4b9dd"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v5.15/base"
 
-- 
2.34.1


