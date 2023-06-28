Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D427EEB64D7
	for <webhook@archiver.kernel.org>; Wed, 28 Jun 2023 14:13:37 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.web11.17584.1687961609339950624
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Jun 2023 07:13:29 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=kLfrzk+g;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.179, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-1b539d2f969so7487565ad.0
        for <openembedded-core@lists.openembedded.org>; Wed, 28 Jun 2023 07:13:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1687961608; x=1690553608;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JuG8mlkvZIWUl66go7aNaY1AHjXwll8INRh41iqa9LI=;
        b=kLfrzk+ga8SGu7EYGGuQyHoqHCdan0ZHRij3MSPCt96e7/vJjKGbS+vATrDJBhqssF
         4wYhGd345gNBvbbKLcH0rFL+WHKbYXGq3YKoh2D90Cdr7LYHhWrHuq2LSf6ZECg8ARx5
         yy1K1vd4RdaSl5HgIVuHmI3KV76VrRSI5mT1Giaxc/LxHHsB6HI1mEFVBhURFqcWZzpA
         InCxA+p3P06fDICy6xAf7KeSg6pXjS+j/L8aadgz2b67XbjlKbTxGHDDC5jzj7y+zjyI
         w9YngNHV5B30eVfn+toxezOY0Adev8Pk/wHB25lyFjRJrO15AeqXcLLFs7jpuAk7BY1M
         caqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687961608; x=1690553608;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JuG8mlkvZIWUl66go7aNaY1AHjXwll8INRh41iqa9LI=;
        b=JY9KyK784CRBFWE33usFU5jP9r0wlOLyFtz9fZ8shpwN9/QRPM25VsMy1LMPOq8DXp
         Z6MoPw4/VMFDHBPpsAWF1DWBI0kN6garIrZldnPiDnK8aYQnyTjYBV712DxX+8peyqFt
         pQb4Y9sOShrMAL0CRw2qZs/A/GjjO/8Y7Jwhr74ScbWD7gdU0mmwK7/cXDUbp0b4o6tt
         LdRfeBLgbwzsx0t4bB5HrNOIQGUeykP7KLpkM46FwAqO5KgozNELmOO95swRWAE5RpGW
         A8xK8MDwuEwGV4TZJEIpMeBFbiIzMN3WxuumBF5HGTuxsteVVD8NZw4WFdfCXVHfz2ji
         v0ng==
X-Gm-Message-State: AC+VfDyRyh95wwgQl4YYafO3U0d94klgeH9DWxtbKpKUfvIdCzXmgLGh
	9BTOY5RotKLGekSUMMkzHxYP8LiS+KwO9F4Wc6ZaYA==
X-Google-Smtp-Source: ACHHUZ7UMn1RlXCcOV8wru4izAaPbJx3Ng/pV16h4kvmiB0GkJGRa0rWfXPkouFBxxGGEhXxGw84Pw==
X-Received: by 2002:a17:902:f68a:b0:1ae:6947:e63b with SMTP id l10-20020a170902f68a00b001ae6947e63bmr2137998plg.16.1687961608434;
        Wed, 28 Jun 2023 07:13:28 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id b19-20020a170902d89300b001b3ce619e2esm7792092plz.179.2023.06.28.07.13.27
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jun 2023 07:13:28 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 16/29] linux-yocto/5.10: cfg: fix DECNET configuration warning
Date: Wed, 28 Jun 2023 04:12:41 -1000
Message-Id: <60eb677142dfd0264a99f626b5b9ede1a6d706e1.1687961326.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1687961326.git.steve@sakoman.com>
References: <cover.1687961326.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 28 Jun 2023 14:13:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183571

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Dropping CONFIG_DECNET as it has been removed from -stable
and we now get a configuration warning.

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb   | 2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb | 2 +-
 meta/recipes-kernel/linux/linux-yocto_5.10.bb      | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
index 8e7b0b32a0..7976b96a61 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
@@ -12,7 +12,7 @@ python () {
 }
 
 SRCREV_machine ?= "46fb028ad9413cfa8d47a6dc8bf9a57d9d5edf8b"
-SRCREV_meta ?= "697cb5ef3aff49be3fa29bf604598ca36ceb5dfd"
+SRCREV_meta ?= "c1168e10ecf30b123a341ca500966eebf3fe2cc2"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.10;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
index 5c4eb9e990..85dac1d874 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
@@ -17,7 +17,7 @@ KCONF_BSP_AUDIT_LEVEL = "2"
 
 SRCREV_machine:qemuarm ?= "6e0299be775387485e22edcd57ac6099c08f4356"
 SRCREV_machine ?= "772cf990473f73ebf34c1a1ef4f06eb3e297c4db"
-SRCREV_meta ?= "697cb5ef3aff49be3fa29bf604598ca36ceb5dfd"
+SRCREV_meta ?= "c1168e10ecf30b123a341ca500966eebf3fe2cc2"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.10.bb b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
index 6e82782a38..2c7a3e2597 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
@@ -23,7 +23,7 @@ SRCREV_machine:qemux86 ?= "dafc025b033585311d1693255c80b60b690b0e54"
 SRCREV_machine:qemux86-64 ?= "dafc025b033585311d1693255c80b60b690b0e54"
 SRCREV_machine:qemumips64 ?= "ee18c4343db52d5846a0f332cd6df26a6f72dd45"
 SRCREV_machine ?= "dafc025b033585311d1693255c80b60b690b0e54"
-SRCREV_meta ?= "697cb5ef3aff49be3fa29bf604598ca36ceb5dfd"
+SRCREV_meta ?= "c1168e10ecf30b123a341ca500966eebf3fe2cc2"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.10;destsuffix=${KMETA}"
-- 
2.34.1


