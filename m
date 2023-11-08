Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69A39C0018C
	for <webhook@archiver.kernel.org>; Wed,  8 Nov 2023 14:16:57 +0000 (UTC)
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
 by mx.groups.io with SMTP id smtpd.web11.14757.1699453008815887363
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Nov 2023 06:16:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=KEg88srS;
 spf=pass (domain: gmail.com, ip: 209.85.160.182, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-41cc7b67419so46962381cf.2
        for <openembedded-core@lists.openembedded.org>; Wed, 08 Nov 2023 06:16:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699453008; x=1700057808; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=99WrkpMgQFlSzo5d/CSuxbKgEiqQzzhcWEKok2S7Cpk=;
        b=KEg88srS1hw2BQ6jUhmnD+z36VInB82QOxQ7yoX7c1Ms3HiY1GJrLqMZnVqUpACfPR
         zeg02PyKS9gPxi8Lxnhdp2CuQGJ4D0RgAdOr1r7loBP/tsOwLnB6kkkqz+zNF8Gz+5HM
         Qr/d3Vg5JjaPkkq0QD+/ib2xxjHAwgw4YpjfpQv02KUGuSit2oCcxAlMHWMmZtOQzqzt
         FNftyUyhjnG8HJWu0uatITssj6utqEMkn6UOFAZhHyjBMSrzhbHZO+83Yv4N1jXr4emn
         mxpmI4ThRO2RgXjh/dN9BDTjwUd0nhYxz4kCVAVgoV6Yqe4iCHptLiQ1l1VfM4e4dbN0
         iGgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699453008; x=1700057808;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=99WrkpMgQFlSzo5d/CSuxbKgEiqQzzhcWEKok2S7Cpk=;
        b=eRqpQ4oiGP9JECccE1n0a2a7qcWbCA/e94d9XofjExeidXS7gWoEw+QDx0tGVd0Rau
         2U1q3yyU/pYnP5jmSqldQ0iPPGzH2HxOa3DwAzTk7YdvYKLpfxoAVGwWiMBZQTMzoZDo
         gsRmcbiVpuNDHZKfgwVPHI0gfpJnmD7Ymuls8fAMvWI3NilK8brAm28BnjJDNG44bdAo
         hs/oGXTYUk2lGsS5rhHcOEaT2W88pnq7L5q9Gt3Sr+iFNwq5JBFg98fFB5M0sOUffXkv
         MEXljElvaTc3sKmCl8Id2OVICBo45nEInTAECWgqkK3j8W8+i5/Q4xY1ccZ/98oDK0Vf
         mwEA==
X-Gm-Message-State: AOJu0YwqqINnM2EK5z5J0cpSXe8zFyAgn3zQmwH7IVI+9vQsr5GQSuhH
	l6OHx25IQvKM4KKVnhmKUx1osa3s/VEOwCTY
X-Google-Smtp-Source: AGHT+IEctgJB2XoaVcU2bI0v6okV9zfWiu0bh/CYdF2hciZZkpgPI6+zdZecz9WsC3tJP6ZhbKBbvA==
X-Received: by 2002:ac8:5804:0:b0:40f:2e2c:6df4 with SMTP id g4-20020ac85804000000b0040f2e2c6df4mr2044000qtg.6.1699453007806;
        Wed, 08 Nov 2023 06:16:47 -0800 (PST)
Received: from build.lan ([174.112.183.231])
        by smtp.gmail.com with ESMTPSA id j14-20020ac85c4e000000b004181138e0c0sm921665qtj.31.2023.11.08.06.16.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Nov 2023 06:16:47 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 09/12] linux-yocto/6.1: cfg: restore CONFIG_DEVMEM
Date: Wed,  8 Nov 2023 09:16:27 -0500
Message-Id: <d252de6f1ea1e643cc7e5cff38085cf8ce58fc87.1699452828.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1699452828.git.bruce.ashfield@gmail.com>
References: <cover.1699452828.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Nov 2023 14:16:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190348

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Integrating the following commit(s) to linux-yocto/.:

1/1 [
    Author: C. Andy Martin
    Email: cam@myfastmail.com
    Subject: security.cfg: restore strict-only /dev/mem access
    Date: Fri, 27 Oct 2023 11:22:06 -0400

    CONFIG_DEVMEM was mistakenly not enabled, which defeats
    CONFIG_STRICT_DEVMEM and friends, as it completely removes all
    /dev/mem support.

    Signed-off-by: C. Andy Martin <cam@myfastmail.com>
    Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
]

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_6.1.bb   | 2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_6.1.bb | 2 +-
 meta/recipes-kernel/linux/linux-yocto_6.1.bb      | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.1.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.1.bb
index 6ebf533bb0..408fac718e 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.1.bb
@@ -15,7 +15,7 @@ python () {
 }
 
 SRCREV_machine ?= "0dad5306907b9e6fb89103dfba80dbd0edafcdb6"
-SRCREV_meta ?= "0553e01ca003e82d32d9b85c0275568e8ce67274"
+SRCREV_meta ?= "3ec1b83af3b59f07cf04e1264fbd30fe2f2f873b"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.1;destsuffix=${KMETA};protocol=https"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.1.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.1.bb
index af98525c4f..9bf6001353 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.1.bb
@@ -18,7 +18,7 @@ KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
 SRCREV_machine ?= "780d811bb97bf34f2be6cab28d5a8b099154c40d"
-SRCREV_meta ?= "0553e01ca003e82d32d9b85c0275568e8ce67274"
+SRCREV_meta ?= "3ec1b83af3b59f07cf04e1264fbd30fe2f2f873b"
 
 PV = "${LINUX_VERSION}+git"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.1.bb b/meta/recipes-kernel/linux/linux-yocto_6.1.bb
index 9f17f244f8..f497ccedd9 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.1.bb
@@ -29,7 +29,7 @@ SRCREV_machine:qemux86 ?= "780d811bb97bf34f2be6cab28d5a8b099154c40d"
 SRCREV_machine:qemux86-64 ?= "780d811bb97bf34f2be6cab28d5a8b099154c40d"
 SRCREV_machine:qemumips64 ?= "9f25eb5709ab8af0ece7306014d5e8b7c6150c68"
 SRCREV_machine ?= "780d811bb97bf34f2be6cab28d5a8b099154c40d"
-SRCREV_meta ?= "0553e01ca003e82d32d9b85c0275568e8ce67274"
+SRCREV_meta ?= "3ec1b83af3b59f07cf04e1264fbd30fe2f2f873b"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
-- 
2.34.1


