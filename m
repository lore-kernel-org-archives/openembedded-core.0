Return-Path: <twoerner@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 802C2C61DA4
	for <webhook@archiver.kernel.org>; Thu,  9 Feb 2023 18:38:09 +0000 (UTC)
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
 by mx.groups.io with SMTP id smtpd.web10.25010.1675967881808742541
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Feb 2023 10:38:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=SlgfwJWC;
 spf=pass (domain: gmail.com, ip: 209.85.160.175, mailfrom: twoerner@gmail.com)
Received: by mail-qt1-f175.google.com with SMTP id c2so3053130qtw.5
        for <openembedded-core@lists.openembedded.org>; Thu, 09 Feb 2023 10:38:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Gg4CLtl8zx+qjQGyT/4iR/yxRUQmuATeRU7znqyrmxM=;
        b=SlgfwJWCmm0XmcE8RLfDiw00Hw+eCfkkRLQd/aSGg2ykyUf5HxoRwzyrKGS+zbcthh
         lBhJlIf8KNFMS7Raga5yKfdtDorEaOb6qNU99WGAOUeW8Ya/GSzAK6G7VvA/UT7izxG8
         VWicqYSaoOU8ysqECJrZNzuNePp7se7U20oXKn0u3E/H5eU35J0L4yP1NILwUCZZjO7F
         WdK/v+Fvep3YYG6X4E5E5SO4uuitBQ67kyf3Hw2iFmAvuYRA/Ts/U0UcVKk/R0dah3Cu
         xy/MXbmfrf/G2MgDrCHn/kBvH0Yl2jM3tLC2Fkk4NOl6PkFnTEYIBtYVkRPFbjVGp1Nr
         8rMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Gg4CLtl8zx+qjQGyT/4iR/yxRUQmuATeRU7znqyrmxM=;
        b=YDhwjkvR+2K2vwcCOb39gOoNAMKfVonhIOnsWfGn2U8jAFANO26yGX8omNoqPEwqDD
         jAbb/xVFKjlVjj4eG80DuD4M8IqW6M+0nZALnwySHOuAF/02EJyuq5qIbkRczVSrtXpN
         VT5qM0H7BCtsDc8lktfZeeYWzqMSf6zq2BItUeD+Pca7j5ulpn04EQZJhApPpy9MM3TT
         Te5jfIjTOewUVIcYgiShWi8Mx61Y6WGWDGyq/z4XgC9aslh6OWScwEHpVS02eUB5nmUq
         X2riri25kmhtn4nW1g0+cUmxnnIqYRD0wLNAOmIt09p1sdzTisoVnpNNC8v9q61LfLZv
         P55g==
X-Gm-Message-State: AO0yUKUFPOR7946uk0IkdMKI22NZsfHfeZqfmWTfx2QQ/1ueT8LccalN
	4cmovIXo+Ojn8vm0KiDJd7ydg0kFq54=
X-Google-Smtp-Source: AK7set89FjEPlxLP602bbUxCjPRuDkIJDMOo3ZtaUXvYLq7G5V8P7K8UgfFJIfsHtY7TpbZiVm1owA==
X-Received: by 2002:ac8:7e8f:0:b0:3ae:4e47:52d7 with SMTP id w15-20020ac87e8f000000b003ae4e4752d7mr22312691qtj.38.1675967881663;
        Thu, 09 Feb 2023 10:38:01 -0800 (PST)
Received: from localhost.localdomain (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
        by smtp.gmail.com with ESMTPSA id l67-20020a37bb46000000b0071d0f1d01easm1871845qkf.57.2023.02.09.10.38.00
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Feb 2023 10:38:00 -0800 (PST)
From: Trevor Woerner <twoerner@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] linux-yocto.inc: add dt-schema to devshell
Date: Thu,  9 Feb 2023 13:37:56 -0500
Message-Id: <20230209183756.625-2-twoerner@gmail.com>
X-Mailer: git-send-email 2.36.0.rc2.17.g4027e30c53
In-Reply-To: <20230209183756.625-1-twoerner@gmail.com>
References: <20230209183756.625-1-twoerner@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Feb 2023 18:38:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176967

If the user invokes the devshell on the linux-yocto kernel, add
python3-dtschema-native to their native sysroot so they can do
things like:

	devshell> make dtbs_check

Signed-off-by: Trevor Woerner <twoerner@gmail.com>
---
 meta/recipes-kernel/linux/linux-yocto.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-kernel/linux/linux-yocto.inc b/meta/recipes-kernel/linux/linux-yocto.inc
index 091003ed8299..782dc7a06ef7 100644
--- a/meta/recipes-kernel/linux/linux-yocto.inc
+++ b/meta/recipes-kernel/linux/linux-yocto.inc
@@ -63,6 +63,7 @@ KERNEL_FEATURES:append:qemuall=" features/kernel-sample/kernel-sample.scc"
 KERNEL_DEBUG_OPTIONS ?= "stack"
 KERNEL_EXTRA_ARGS:append:x86-64 = " ${@bb.utils.contains('KERNEL_DEBUG_OPTIONS', 'stack', 'HOST_LIBELF_LIBS="-L${RECIPE_SYSROOT_NATIVE}/usr/lib/pkgconfig/../../../usr/lib/ -lelf"', '', d)}"
 
+do_devshell[depends] += "python3-dtschema-native:do_populate_sysroot"
 do_devshell:prepend() {
     # setup native pkg-config variables (kconfig scripts call pkg-config directly, cannot generically be overriden to pkg-config-native)
     d.setVar("PKG_CONFIG_DIR", "${STAGING_DIR_NATIVE}${libdir_native}/pkgconfig")
-- 
2.36.0.rc2.17.g4027e30c53


