Return-Path: <twoerner@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4E6DC6379F
	for <webhook@archiver.kernel.org>; Tue, 14 Feb 2023 18:31:17 +0000 (UTC)
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
 by mx.groups.io with SMTP id smtpd.web11.2100.1676399475920778477
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Feb 2023 10:31:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=LXy9mI4b;
 spf=pass (domain: gmail.com, ip: 209.85.160.175, mailfrom: twoerner@gmail.com)
Received: by mail-qt1-f175.google.com with SMTP id cr22so18564929qtb.10
        for <openembedded-core@lists.openembedded.org>; Tue, 14 Feb 2023 10:31:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CmZfJxV41cFT2eDUoQbE6t1VJZa6RwXH/AWx2UrLVdM=;
        b=LXy9mI4bn36bZ5T3tt2+VIPu6z4QZOJITo4u8PofyiLsYwUSnlYcReKTPClxGMTVqJ
         ZtlOGKu3zpa4JfeaFA2W755RfTLt+UkDAi0xtbiowwEmMBtgMZZMT6fsgx4XYj34Od2V
         +Jb7psWHQni9/zirrs2nj3/BFOyp/6FQ6JgCEtw0OnOs3p+5WUqMSq4zrF7VvGR4cujH
         C/F/swz/h/LlLrLXkazbRfIyk0uGbkoUtEQ31aEwBA1wc9MQp7Fh0+JsXta+k1wVKxKA
         xZMn5xq4hSLuT6EAlPByDCnPP5uP2Hy2nNvRsgZgsMZCmQEKsclidXyk9m42H7gA5eTP
         j2ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CmZfJxV41cFT2eDUoQbE6t1VJZa6RwXH/AWx2UrLVdM=;
        b=8Hl1VWycnmXv9HLdPpxLPq3gTKDSNpLSetC3t6iOH8U4z1nhyZPfX3RgC05DrXj53m
         5e158v1sAKhSV3pAgsbIF8xYsAmxNdaBfkU2VcZEa9hOgGod4OKBSNCjSr0+o6sWBd6w
         rrERh0D9rRmxyoqGZamEJS0XSZk9kuhmmbMEABxJgvOmysTPoP9Wv/lghiVM5brzyWUT
         7YVUiiumGvEIcj+d2+B3V0LNbiOBISAHzf5WEniYTF00uW0skhBIaHRBXnIqs44nuKYY
         vjbUl3sg2ho+C2rbwspIwxiX2se8/QerJ1WhiTAtIWgjM94wqSgimTFLQIUtLdr8zGxY
         E4gA==
X-Gm-Message-State: AO0yUKWmUt1de2me1vZneMAbdWE9uFfbYiP0C8I+j/GE6o2lfCPKNoBW
	Px69s3jf9Xl/PgJTMvMoyzv6ufDYE+w=
X-Google-Smtp-Source: AK7set83IzRtSCtc/SB3Xf8Y6oLAYsByiylQHXWDJsNJoZGvfJrjxJtEJSAdbriBNfhlh/d/oExM2Q==
X-Received: by 2002:a05:622a:170a:b0:3ba:247a:3fb7 with SMTP id h10-20020a05622a170a00b003ba247a3fb7mr4925406qtk.53.1676399474635;
        Tue, 14 Feb 2023 10:31:14 -0800 (PST)
Received: from localhost.localdomain (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
        by smtp.gmail.com with ESMTPSA id e7-20020a378207000000b0071a49ac0e05sm12184387qkd.111.2023.02.14.10.31.13
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Feb 2023 10:31:13 -0800 (PST)
From: Trevor Woerner <twoerner@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v3 4/4] linux-yocto: include tools for dtb in devshell
Date: Tue, 14 Feb 2023 13:31:01 -0500
Message-Id: <20230214183101.33761-4-twoerner@gmail.com>
X-Mailer: git-send-email 2.36.0.rc2.17.g4027e30c53
In-Reply-To: <20230214183101.33761-1-twoerner@gmail.com>
References: <20230214183101.33761-1-twoerner@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 14 Feb 2023 18:31:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177173

Make more tools available to the user in a kernel devshell so they can test
and validate their device trees.

	devshell> make dtbs_check

Signed-off-by: Trevor Woerner <twoerner@gmail.com>
---
 meta/recipes-kernel/linux/linux-yocto.inc | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-kernel/linux/linux-yocto.inc b/meta/recipes-kernel/linux/linux-yocto.inc
index 091003ed8299..86046150d5c7 100644
--- a/meta/recipes-kernel/linux/linux-yocto.inc
+++ b/meta/recipes-kernel/linux/linux-yocto.inc
@@ -63,6 +63,10 @@ KERNEL_FEATURES:append:qemuall=" features/kernel-sample/kernel-sample.scc"
 KERNEL_DEBUG_OPTIONS ?= "stack"
 KERNEL_EXTRA_ARGS:append:x86-64 = " ${@bb.utils.contains('KERNEL_DEBUG_OPTIONS', 'stack', 'HOST_LIBELF_LIBS="-L${RECIPE_SYSROOT_NATIVE}/usr/lib/pkgconfig/../../../usr/lib/ -lelf"', '', d)}"
 
+do_devshell[depends] = " \
+	python3-dtschema-native:do_populate_sysroot \
+	python3-yamllint-native:do_populate_sysroot \
+	"
 do_devshell:prepend() {
     # setup native pkg-config variables (kconfig scripts call pkg-config directly, cannot generically be overriden to pkg-config-native)
     d.setVar("PKG_CONFIG_DIR", "${STAGING_DIR_NATIVE}${libdir_native}/pkgconfig")
-- 
2.36.0.rc2.17.g4027e30c53


