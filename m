Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 457ABC54E71
	for <webhook@archiver.kernel.org>; Fri, 22 Mar 2024 13:07:31 +0000 (UTC)
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
 by mx.groups.io with SMTP id smtpd.web11.12786.1711112847812727232
 for <openembedded-core@lists.openembedded.org>;
 Fri, 22 Mar 2024 06:07:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ls5pe0qz;
 spf=pass (domain: gmail.com, ip: 209.85.222.178, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-789db18e356so131708285a.2
        for <openembedded-core@lists.openembedded.org>; Fri, 22 Mar 2024 06:07:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711112847; x=1711717647; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=P7/nqfTVS3+B0/7RXNKE92euexLDBE5aEsxg2qAPYFs=;
        b=ls5pe0qzyzXFBiTwhOBs9kse4EF/3+FDY3XOOe4uAD7X1GQQ3Df226RSh6x9pyn89Y
         Lpy/sPHsRHI4MlyNnnXyxL9Cma1JKFfYKSrzuRuOct3lol/Wpo6sLlOYqP2kvPl2rP+0
         Kjf71fZeSRM+dG3HDoNNzi7MdvtDBLZvzLY0tyGEL891oORHnPQn6nSSL+rbEe/kQLAS
         juPZep0sfQ6m9xriBS7Goe20c6Ta1MJnx44ybUn22sU1sX6MpIeIFnamgMw3O+jLwvQ+
         WKttLIQFtsCgaZjtfLgpPjOE1yazaac3p3txElFhEm/VQsRL2lxNhvqv7i7LKmnMgLKc
         eBwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711112847; x=1711717647;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=P7/nqfTVS3+B0/7RXNKE92euexLDBE5aEsxg2qAPYFs=;
        b=IoJna4puYWxoVABhKDsjbbN7NIgw971NCTnwDNPsdWmZQc8LKPczeufpfMCikSVnpa
         am0AvWpgYrokP4dzCa4dsRAgXXkXd7HEGJk3cVGJwsDqXrns2rJO60EadTZLxNnAEYHt
         X5FW/eTFh5hAHoxpuUN1UMWMGsW5Ri7F8lqglcMGzvBapZnG3r97toA4AQejExoAbHdg
         bSGTJl06SEU4Idywks0sguzzta8BBpMaIVfqKj6Pg8CcNQk+quV6Tv70yTy+m1WidVXF
         2i3ABEX7VS+Bh0L0rE+CDLOx4GMz/FY4qxnyhOadt3rXqzbLfuac6+idYOten75JBsi7
         JZqQ==
X-Gm-Message-State: AOJu0Yw4UD2Ls5f4+3eOr6CTaFKcfHLAxvwMZhblQII544rju/mSofC1
	tKsOzxVENXQTEaRerNsoVnTpoBOtNOKv9V4Qg3UrDsCATVjByQ67SzsB1+Km
X-Google-Smtp-Source: AGHT+IHaaQEQC+fSMiWOFqXtNvQ8yjyrMvW2q83bg6JUJO7q5SzUC49AmhHAG4C9WditY/tdsu2J5w==
X-Received: by 2002:a05:620a:b8b:b0:789:fac3:c757 with SMTP id k11-20020a05620a0b8b00b00789fac3c757mr1947325qkh.43.1711112846718;
        Fri, 22 Mar 2024 06:07:26 -0700 (PDT)
Received: from bruce-XPS-8940.localdomain ([174.112.62.108])
        by smtp.gmail.com with ESMTPSA id k1-20020ae9f101000000b00789fc794dbesm746767qkg.45.2024.03.22.06.07.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Mar 2024 06:07:26 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH] linux-yocto/6.6: cfg: genericarm64 platform/peripheral support
Date: Fri, 22 Mar 2024 09:07:24 -0400
Message-Id: <20240322130724.1997375-1-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 22 Mar 2024 13:07:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197445

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Integrating the following commit(s) to linux-yocto/.:

1/12 [
    Author: Ross Burton
    Email: ross.burton@arm.com
    Subject: bsp/genericarm64: include .scc files instead of .cfg
    Date: Wed, 20 Mar 2024 19:42:09 +0000

    Some .cfg files were included accidentally, fix this.

    Signed-off-by: Ross Burton <ross.burton@arm.com>
    Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
]

2/12 [
    Author: Ross Burton
    Email: ross.burton@arm.com
    Subject: bsp/genericarm64: move CONFIG_PHYLINK under the right comment
    Date: Wed, 20 Mar 2024 19:42:10 +0000

    A bug in my annotation script meant this item ended up in the wrong place.

    Signed-off-by: Ross Burton <ross.burton@arm.com>
    Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
]

3/12 [
    Author: Bill Mills
    Email: bill.mills@linaro.org
    Subject: bsp/genericarm64: Automatically create /dev/i2c* devices
    Date: Wed, 20 Mar 2024 19:42:11 +0000

    With CONFIG_I2C_DEV=m you must modprobe that module in order to get the
    /dev nodes.  It is a small module (~8.5K) so just include it in.

    Signed-off-by: Bill Mills <bill.mills@linaro.org>
    Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
]

4/12 [
    Author: Ross Burton
    Email: ross.burton@arm.com
    Subject: bsp/genericarm64: enable hugetlbfs
    Date: Wed, 20 Mar 2024 19:42:12 +0000

    Signed-off-by: Ross Burton <ross.burton@arm.com>
    Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
]

5/12 [
    Author: Ross Burton
    Email: ross.burton@arm.com
    Subject: bsp/genericarm64: integrate the IMX clocks
    Date: Wed, 20 Mar 2024 19:42:13 +0000

    If these are kernel modules then there's a WARN_ON triggered when booted
    on IMX boards.

    Signed-off-by: Ross Burton <ross.burton@arm.com>
    Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
]

6/12 [
    Author: Ross Burton
    Email: ross.burton@arm.com
    Subject: bsp/genericarm64: enable more SPI controllers
    Date: Wed, 20 Mar 2024 19:42:14 +0000

    Signed-off-by: Ross Burton <ross.burton@arm.com>
    Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
]

7/12 [
    Author: Ross Burton
    Email: ross.burton@arm.com
    Subject: bsp/genericarm64: enable PHY subsystem
    Date: Wed, 20 Mar 2024 19:42:15 +0000

    Signed-off-by: Ross Burton <ross.burton@arm.com>
    Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
]

8/12 [
    Author: Ross Burton
    Email: ross.burton@arm.com
    Subject: bsp/genericarm64: enable USB On-The-Go and Gadget
    Date: Wed, 20 Mar 2024 19:42:16 +0000

    Signed-off-by: Ross Burton <ross.burton@arm.com>
    Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
]

9/12 [
    Author: Ross Burton
    Email: ross.burton@arm.com
    Subject: bsp/genericarm64: enable SATA
    Date: Wed, 20 Mar 2024 19:42:17 +0000

    SBCs don't tend to use SATA, but larger platforms will.

    Signed-off-by: Ross Burton <ross.burton@arm.com>
    Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
]

10/12 [
    Author: Ross Burton
    Email: ross.burton@arm.com
    Subject: bsp/genericarm64: support some i.MX8 boards
    Date: Wed, 20 Mar 2024 19:42:18 +0000

    Add more hardware enabling so that NXP i.MX8M boards boot successfully.

    Thanks to anton.antonov@arm.com for the options and testing.

    Signed-off-by: Ross Burton <ross.burton@arm.com>
    Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
]

11/12 [
    Author: Ross Burton
    Email: ross.burton@arm.com
    Subject: bsp/genericarm64: enable networking on Kontron KBox
    Date: Wed, 20 Mar 2024 19:42:19 +0000

    Thanks to anton.antonov@arm.com.

    Signed-off-by: Ross Burton <ross.burton@arm.com>
    Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
]

12/12 [
    Author: Ross Burton
    Email: ross.burton@arm.com
    Subject: bsp/genericarm64: enable Marvell ThunderX2 support
    Date: Wed, 20 Mar 2024 19:42:20 +0000

    Add the required options so that this BSP works on the Marvell ThunderX2.

    Thanks to anton.antonov@arm.com for the config and testing.

    Signed-off-by: Ross Burton <ross.burton@arm.com>
    Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
]

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb   | 2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb | 2 +-
 meta/recipes-kernel/linux/linux-yocto_6.6.bb      | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
index acafe60e46..eb5e1da33c 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
@@ -15,7 +15,7 @@ python () {
 }
 
 SRCREV_machine ?= "1c3234ba160c59eb50739f23591a87daf09fac35"
-SRCREV_meta ?= "6a24861d6504575a4a9f92366285332d47c7e111"
+SRCREV_meta ?= "a1711f65dcd5f88160d30447dcab3b88a1562690"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.6;destsuffix=${KMETA};protocol=https"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
index 4a87482f20..7d6197db5e 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
@@ -18,7 +18,7 @@ KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
 SRCREV_machine ?= "ca83799fcbc094fdd52caec7c4dca64189acd842"
-SRCREV_meta ?= "6a24861d6504575a4a9f92366285332d47c7e111"
+SRCREV_meta ?= "a1711f65dcd5f88160d30447dcab3b88a1562690"
 
 PV = "${LINUX_VERSION}+git"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.6.bb b/meta/recipes-kernel/linux/linux-yocto_6.6.bb
index 75488ad409..56dd771015 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.6.bb
@@ -32,7 +32,7 @@ SRCREV_machine:qemux86 ?= "ca83799fcbc094fdd52caec7c4dca64189acd842"
 SRCREV_machine:qemux86-64 ?= "ca83799fcbc094fdd52caec7c4dca64189acd842"
 SRCREV_machine:qemumips64 ?= "6cb075269e42d03857c95ebc8b5f8e154f155add"
 SRCREV_machine ?= "ca83799fcbc094fdd52caec7c4dca64189acd842"
-SRCREV_meta ?= "6a24861d6504575a4a9f92366285332d47c7e111"
+SRCREV_meta ?= "a1711f65dcd5f88160d30447dcab3b88a1562690"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
-- 
2.39.2


