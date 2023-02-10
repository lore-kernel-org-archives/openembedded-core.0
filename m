Return-Path: <twoerner@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15B6AC636CD
	for <webhook@archiver.kernel.org>; Fri, 10 Feb 2023 14:26:06 +0000 (UTC)
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
 by mx.groups.io with SMTP id smtpd.web11.15993.1676039155897412634
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Feb 2023 06:25:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=TjBq9Pg+;
 spf=pass (domain: gmail.com, ip: 209.85.160.173, mailfrom: twoerner@gmail.com)
Received: by mail-qt1-f173.google.com with SMTP id w3so5842158qts.7
        for <openembedded-core@lists.openembedded.org>; Fri, 10 Feb 2023 06:25:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VMucOQoS0yaz6Y8QMqUhRGxF6pMsdk8J098e8UoEqsQ=;
        b=TjBq9Pg+MwbABYqZC51czfVARy2DQZz11KCpjMSl/kZJd0PvVGWSnuaNlP/zYDBr6t
         /wYheIm+k4/ZX+5TIR1etcPgb0w38vf+MZYRcSuGu5SYupQ6rZnxE5Iqvf9xiiLZGvu8
         eWmqhfsEt8zjJhkgVyK0zwqg8a+jXANJdcUwP4LN1WeuDNeIZX/Ust25aZ6r8Q3FeiJQ
         AztiO6WLtRXDbxw8B/jN2DIqyotcGUdFLsh8bshZX0AQ4iede2gI0xNPOUhE85Cb3PHV
         baaBiWQ3pYC0ETYFp3iya2dhMLnrRrbBAIa0c1T/yvSjsjq8yr761KKHwUN/+R23k02E
         6snQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VMucOQoS0yaz6Y8QMqUhRGxF6pMsdk8J098e8UoEqsQ=;
        b=Vk4Xyr/d2fR8pbENbzvQ0seA6vF+mhfoZa0+SLgv7XHLjZiweEA0d25oJY6KbkVzDr
         KTgGveJ1MPa1wS0DeYTnncIk4HV09OuRej3RfpSr/vFOGkH0Yf1aet4iw6RkUcExLach
         4Gkwh4oICjRtop7fzY7CgQs3BWHMl+FGbwZGKNeg50vhlMXcCHBByFYGKTxRnC4zImZA
         65YqgQo0o8Qub5wYknR826yDBc/4QPvaS0WQxdqqQ4ntE3WJljF38nkMFWikJCDA9QV3
         ovHHDV/Ml9UNExm4mb3hJ319aiRE8YUlp+wBKzffTohVygvqQVmO6NQk9pK6DeXW0nOn
         9pfg==
X-Gm-Message-State: AO0yUKUxXPesw9QHPp+MX506ETDLiM4cJ2P/tUXYJERV49NCp0doOTzf
	+kFprBb4DXHNBcnFbAdF8nVQwmSeoWk=
X-Google-Smtp-Source: AK7set/6nwkTo9qtIXiSF366OEx54Wy80uJEwPpsnYO2nqM8H83g9sPW9CeqWNYO5Q1b3OHikfJdSQ==
X-Received: by 2002:a05:622a:1647:b0:3b8:5bc6:deab with SMTP id y7-20020a05622a164700b003b85bc6deabmr25804869qtj.8.1676039154624;
        Fri, 10 Feb 2023 06:25:54 -0800 (PST)
Received: from localhost.localdomain (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
        by smtp.gmail.com with ESMTPSA id fg10-20020a05622a580a00b003b63238615fsm3553809qtb.46.2023.02.10.06.25.54
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Feb 2023 06:25:54 -0800 (PST)
From: Trevor Woerner <twoerner@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2 2/2] linux-yocto.inc: add dt-schema to devshell
Date: Fri, 10 Feb 2023 09:25:39 -0500
Message-Id: <20230210142539.28035-2-twoerner@gmail.com>
X-Mailer: git-send-email 2.36.0.rc2.17.g4027e30c53
In-Reply-To: <20230210142539.28035-1-twoerner@gmail.com>
References: <20230210142539.28035-1-twoerner@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 10 Feb 2023 14:26:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176994

If the user invokes the devshell on the linux-yocto kernel, add
python3-dtschema-native to their native sysroot so they can do
things like:

	devshell> make dtbs_check

Signed-off-by: Trevor Woerner <twoerner@gmail.com>
---
changes since v1:
- none
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


