Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A13DCD11DF
	for <webhook@archiver.kernel.org>; Thu, 28 Mar 2024 18:43:06 +0000 (UTC)
Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com [209.85.210.42])
 by mx.groups.io with SMTP id smtpd.web10.4459.1711651376287634449
 for <openembedded-core@lists.openembedded.org>;
 Thu, 28 Mar 2024 11:42:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=QY9O/FeM;
 spf=pass (domain: gmail.com, ip: 209.85.210.42, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ot1-f42.google.com with SMTP id 46e09a7af769-6e677008501so753938a34.1
        for <openembedded-core@lists.openembedded.org>; Thu, 28 Mar 2024 11:42:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711651375; x=1712256175; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CGZDeozodNtTxuzyDtMXLgTaq9p4lY4BEtT738DD3v4=;
        b=QY9O/FeMOfxmsQcaJX/kE7WwTQ8gcHZr8CFwiQ1mZG11sgGiejQwDBOcu2j1NNJ/nH
         JR1GjnLWaFhnV7WBBpXezAYjNPGjyRfdh0DYTbUFZF0iiqH2pkNSu+SmZCS7opM1DWgy
         RyCCrvVr2TrVSW0P6nzGQXxUhfT04R4vPPkPR4WeVNJxGTpF9vgaoIijaINTM+6mB5aw
         s1Y+4kkHyKxrDZIEA4yiz5JjIkNCCsnGAK24yILUgYxv+xsioUoGQaX+YuGZasTJOMWZ
         ClrzIhrGD6S5jvGpbuKdfLO0Ys7sKOagYrSwemb9ujmqg8EUvr7lmn0oBz4aGHH01q63
         erHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711651375; x=1712256175;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CGZDeozodNtTxuzyDtMXLgTaq9p4lY4BEtT738DD3v4=;
        b=TJDBLYYCFnD/HpnSny4Bs/o1V25K1bHhcqvmSwoCNSteaJSwhUoy3JnE7D6Om7uoqI
         xiRf6k2gOWOjoKa1o0wrDipIxL28Q84voai3JB1WEys2gl0lqheGv6lu3mf279rjjjfP
         81sA3a5iriVt3DOv6/9p2l3kZRI387jTifsHSDphaNsC9GQTio/7Z40Vb+hfK1RbpCyc
         uuRC/03OXtj63Nc7zJjHM9rXLTn3a5SNXiBun5p4plLwYAR0Xt5rMiS31vDJXIRVNh0Y
         n7EZ2me6tD30gL0MHLTsJrF64OwKqlvZFVu9sN/CZTkqh2uhWnftL8NncNbKO6+qD0wh
         8PLQ==
X-Gm-Message-State: AOJu0YwIdbdnuIXQnVYK/O+0F6o28U7lVRSqHoH6QrLMy4DNCN29ACdf
	jxjzXslKD9C2nEaFl8ps+BOaNJAAioo3qs4qaA4Ufr58fsPw7Jkh
X-Google-Smtp-Source: AGHT+IHJ6a3rLRaVg1ZVvBgxUifdwFkbkvXX9RkWVK1fyC4LsJbW5T1NwNz9+14PETt7KznLOLRIFg==
X-Received: by 2002:a05:6870:508:b0:22a:a75a:139c with SMTP id j8-20020a056870050800b0022aa75a139cmr44046oao.10.1711651375329;
        Thu, 28 Mar 2024 11:42:55 -0700 (PDT)
Received: from bruce-XPS-8940.localdomain ([174.112.62.108])
        by smtp.gmail.com with ESMTPSA id x9-20020ac87a89000000b0042ebbc1196fsm836216qtr.87.2024.03.28.11.42.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Mar 2024 11:42:54 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/4] linux-yocto/6.6: cfg: genericarm64 configuration updates
Date: Thu, 28 Mar 2024 14:42:48 -0400
Message-Id: <e38d47e154d0276749463af01487661056a312b5.1711651290.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1711651290.git.bruce.ashfield@gmail.com>
References: <cover.1711651290.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 28 Mar 2024 18:43:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197603

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Integrating the following commit(s) to linux-yocto/.:

1/3 [
    Author: Ross Burton
    Email: ross.burton@arm.com
    Subject: bsp/genericarm64: enable support for Xilinx KV260
    Date: Wed, 27 Mar 2024 17:08:08 +0000

    Add more config options so that the Xilinx KV260 is fully supported.

    This work was done by Bill Mills <bill.mills@linaro.org>, I simply
    integrated it.

    Signed-off-by: Ross Burton <ross.burton@arm.com>
    Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
]

2/3 [
    Author: Ross Burton
    Email: ross.burton@arm.com
    Subject: bsp/genericarm64: build the Intel Pro/1000 ethernet driver
    Date: Wed, 27 Mar 2024 17:08:10 +0000

    This is both used as a PCIe card, but is also often the virtual hardware
    in VMs.

    Signed-off-by: Ross Burton <ross.burton@arm.com>
    Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
]

3/3 [
    Author: Ross Burton
    Email: ross.burton@arm.com
    Subject: bsp/genericarm64: more enabling for the ThunderX2
    Date: Wed, 27 Mar 2024 17:08:09 +0000

    Enable the ThunderX EDAC support.

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
index eb5e1da33c..e2e3c01285 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
@@ -15,7 +15,7 @@ python () {
 }
 
 SRCREV_machine ?= "1c3234ba160c59eb50739f23591a87daf09fac35"
-SRCREV_meta ?= "a1711f65dcd5f88160d30447dcab3b88a1562690"
+SRCREV_meta ?= "8daefb4bf68e9cbbecdb833dc3fc536f08f5d46a"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.6;destsuffix=${KMETA};protocol=https"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
index 7d6197db5e..f076aa45c7 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
@@ -18,7 +18,7 @@ KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
 SRCREV_machine ?= "ca83799fcbc094fdd52caec7c4dca64189acd842"
-SRCREV_meta ?= "a1711f65dcd5f88160d30447dcab3b88a1562690"
+SRCREV_meta ?= "8daefb4bf68e9cbbecdb833dc3fc536f08f5d46a"
 
 PV = "${LINUX_VERSION}+git"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.6.bb b/meta/recipes-kernel/linux/linux-yocto_6.6.bb
index 01cb6a860c..a0218eb876 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.6.bb
@@ -29,7 +29,7 @@ SRCREV_machine:qemux86 ?= "ca83799fcbc094fdd52caec7c4dca64189acd842"
 SRCREV_machine:qemux86-64 ?= "ca83799fcbc094fdd52caec7c4dca64189acd842"
 SRCREV_machine:qemumips64 ?= "6cb075269e42d03857c95ebc8b5f8e154f155add"
 SRCREV_machine ?= "ca83799fcbc094fdd52caec7c4dca64189acd842"
-SRCREV_meta ?= "a1711f65dcd5f88160d30447dcab3b88a1562690"
+SRCREV_meta ?= "8daefb4bf68e9cbbecdb833dc3fc536f08f5d46a"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
-- 
2.39.2


