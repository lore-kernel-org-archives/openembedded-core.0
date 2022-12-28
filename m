Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 798DEC46467
	for <webhook@archiver.kernel.org>; Wed, 28 Dec 2022 15:23:55 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web10.182565.1672241029706140040
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Dec 2022 07:23:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=jvett054;
 spf=pass (domain: gmail.com, ip: 209.85.221.46, mailfrom: alex.kiernan@gmail.com)
Received: by mail-wr1-f46.google.com with SMTP id bx10so15245859wrb.0
        for <openembedded-core@lists.openembedded.org>; Wed, 28 Dec 2022 07:23:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hLrreCI8uETlO0TspB7vF7bRZZ8qnLMqJpMgy4myUzo=;
        b=jvett054/beOF5BsYT4fdADGbyT1Yn2M2e12IpCxRVxpLAIhQH1Uqrga8bcT9g+uon
         T9xTLnMiwhlJdl3oXp2NjzVzx80pDhgAQN5Olezkg8TBYvMWA+Y2ozfPY1ofjhUEpyr2
         Ck9JBnRfZQO8x6O1soE+oxbiNxcf5Y+g7sUTRUbsPbTqhfqHk/o9FemINYeLiFQhvVif
         PYje8qodFX3S6ZSjvJkuVYBVw3qwV9DSiqa4rL+YYYaDAg+KEZ/QCle1r9yxgsG1ZAkD
         agUciKY/q5eddKom2EsHLU5Ma/K1m1/luc9271XI8eHWwHEYm5iDzsR7vIlFcwVRHOqR
         PcPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hLrreCI8uETlO0TspB7vF7bRZZ8qnLMqJpMgy4myUzo=;
        b=yWZv6g9Tvaex+NlbmpwEVtsXciooqLLggCVvOG8DM27Wl4cSnkgEemCBMQVu3kmXMX
         LRqUJ2MUEQASjRQVl6RZg4a1skLeguXU2rT2xwsiusp53SWf5u/pieaCG+nPWv2aKdzw
         TyOUCQnyxUlQFh8+NS9ih0nNJQYCnHah3g6YLxkrqOA5+cAe7Oh0LTUUPTf7GVfHvpCX
         HPTTFtxOUnXeS/xOoUpwT58BekyoRMt5BqamoKTj+7vWMRXiisU5BUyaSQ5wcwtQY3XO
         kh2jGkQXOG9DERZbn3cJIc7ASvhdALdJDhq3IfShShC/8T4VjQdfuFtsQn0abvmlZ6tm
         K6PA==
X-Gm-Message-State: AFqh2kqoY7xtyvPr5Iho/mJBMfq2k6ITZB6pmaNrvtgUgdctqaqHxfAe
	1I4uU8S5DtduI14lG/uo8pKom2f3tto=
X-Google-Smtp-Source: AMrXdXstSYOT9ojfP4fu6xuUuA8L/I4OuRaBRD0SfT1qhFDQCAW2Mmg5NgT4vur190CIgZqKS0K8Sg==
X-Received: by 2002:a05:6000:1812:b0:238:3d56:f061 with SMTP id m18-20020a056000181200b002383d56f061mr14352563wrh.63.1672241027986;
        Wed, 28 Dec 2022 07:23:47 -0800 (PST)
Received: from localhost.localdomain (cust246-dsl91-135-6.idnet.net. [91.135.6.246])
        by smtp.gmail.com with ESMTPSA id r17-20020adfdc91000000b0027973315213sm10884893wrj.89.2022.12.28.07.23.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Dec 2022 07:23:47 -0800 (PST)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alex Kiernan <alex.kiernan@gmail.com>
Subject: [OE-Core][PATCH v5 06/12] rust: Move musl-x86 fix for `__stack_chk_fail_local` to rust-source
Date: Wed, 28 Dec 2022 15:23:28 +0000
Message-Id: <20221228152334.25449-7-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20221228152334.25449-1-alex.kiernan@gmail.com>
References: <20221228152334.25449-1-alex.kiernan@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 28 Dec 2022 15:23:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175076

Any consumer of rust-source (potentially) needs this, so move to
rust-source.inc

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---

(no changes since v4)

Changes in v4:
- Fixup `__stack_chk_fail_local` in musl-x86

 meta/recipes-devtools/rust/rust-source.inc | 5 +++++
 meta/recipes-devtools/rust/rust_1.66.0.bb  | 5 -----
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-devtools/rust/rust-source.inc b/meta/recipes-devtools/rust/rust-source.inc
index 91a6c5a942ae..b63e18ac95d2 100644
--- a/meta/recipes-devtools/rust/rust-source.inc
+++ b/meta/recipes-devtools/rust/rust-source.inc
@@ -11,3 +11,8 @@ RUSTSRC = "${WORKDIR}/rustc-${RUST_VERSION}-src"
 
 UPSTREAM_CHECK_URI = "https://forge.rust-lang.org/infra/other-installation-methods.html"
 UPSTREAM_CHECK_REGEX = "rustc-(?P<pver>\d+(\.\d+)+)-src"
+
+# see recipes-devtools/gcc/gcc/0018-Add-ssp_nonshared-to-link-commandline-for-musl-targe.patch
+# we need to link with ssp_nonshared on musl to avoid "undefined reference to `__stack_chk_fail_local'"
+# when building MACHINE=qemux86 for musl
+WRAPPER_TARGET_EXTRALD:libc-musl = "-lssp_nonshared"
diff --git a/meta/recipes-devtools/rust/rust_1.66.0.bb b/meta/recipes-devtools/rust/rust_1.66.0.bb
index 5192ec2ee11a..f1ec769aef48 100644
--- a/meta/recipes-devtools/rust/rust_1.66.0.bb
+++ b/meta/recipes-devtools/rust/rust_1.66.0.bb
@@ -292,11 +292,6 @@ rust_do_install:class-target() {
     rm ${D}${libdir}/rustlib/manifest*
 }
 
-# see recipes-devtools/gcc/gcc/0018-Add-ssp_nonshared-to-link-commandline-for-musl-targe.patch
-# we need to link with ssp_nonshared on musl to avoid "undefined reference to `__stack_chk_fail_local'"
-# when building MACHINE=qemux86 for musl
-WRAPPER_TARGET_EXTRALD:libc-musl = "-lssp_nonshared"
-
 RUSTLIB_DEP:class-nativesdk = ""
 
 # musl builds include libunwind.a
-- 
2.39.0


