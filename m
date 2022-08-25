Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF6BFC28D13
	for <webhook@archiver.kernel.org>; Thu, 25 Aug 2022 10:49:08 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
 [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web12.22350.1661424539633396033
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Aug 2022 03:48:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=acvrnqCu;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.46,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f46.google.com with SMTP id bq11so17500223wrb.12
        for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Aug 2022 03:48:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc;
        bh=dxtaSeBJ0NLeEoM4lQ57SefX6QjByf3t4JlmGQwS4hA=;
        b=acvrnqCusxpzpZ8PLiMQY9F7TyJRwHY4qI25tVDmfTqCnc0j/BNnAE2Q5AkUWcrBaL
         0DW7bTQCAhZO6VPHw3BVpL/dtndTJ9mMKutQyN64DCADABHx1gqHtlZJ+RuzwJGWI/+R
         uYCf2XW1Ni5DKoOnjz7+VqL+wr82v8+bQmbq8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc;
        bh=dxtaSeBJ0NLeEoM4lQ57SefX6QjByf3t4JlmGQwS4hA=;
        b=A69r9Y8+NlZQ1KkCovRUCVAVQ0agMz6rWhE/NI8PePUZ7fPJSe5R3sUxICwyUKHr/s
         Q+NnyeXfCTgogZXsiUVzWW91kiV1asLLG42I1u0+pb0bW+pHtefasQNnS5hvokylWiM7
         lK1E8F7qdkiC/4AZdgMMNzGWuznQw9hrk4C8yWkrynfp0Z6dnyUcCJ2xWBKHBpGZyoal
         HxZMmMeT0xkEcm3oIEBKB+v5ED99ITH6SoHvU2s6qanGa12vHMCVZNJUJr+dAmBQSj0M
         sb6vDNPCMKYSBhX5bLCZmKhd4XzpBL68F3bjQ1or9oL3ZZploIAnxgAT0D6yHy3EFdi3
         oszA==
X-Gm-Message-State: ACgBeo1RttuYtZ6pQq6KG5uYPFWftIvcARB54VqL/oRxsmzPyPTGZQIv
	GpXDACwLCaqTGvYGm617CGkKLPS4kPc2vg==
X-Google-Smtp-Source: 
 AA6agR4293P6/pH80PpypADOrvi0mooyfo2+oox5/N/lltyWExC7px+82j2968RzfD1N/4ikn2B1Lg==
X-Received: by 2002:a05:6000:1210:b0:225:5eeb:fdf3 with SMTP id
 e16-20020a056000121000b002255eebfdf3mr1957821wrx.334.1661424537735;
        Thu, 25 Aug 2022 03:48:57 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:8059:8737:891c:87d])
        by smtp.gmail.com with ESMTPSA id
 bh19-20020a05600c3d1300b003a54d610e5fsm5235521wmb.26.2022.08.25.03.48.56
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Aug 2022 03:48:56 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/3] rust-target-config: Fix qemuppc target cpu option
Date: Thu, 25 Aug 2022 11:48:51 +0100
Message-Id: <20220825104851.3258387-3-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220825104851.3258387-1-richard.purdie@linuxfoundation.org>
References: <20220825104851.3258387-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 25 Aug 2022 10:49:08 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169846

We see a lot of warnings about incorrect processor types on qemuppc, drowning
out anything else. Fix the option.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes-recipe/rust-target-config.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes-recipe/rust-target-config.bbclass b/meta/classes-recipe/rust-target-config.bbclass
index e30eaa1da30..259cba7bbd0 100644
--- a/meta/classes-recipe/rust-target-config.bbclass
+++ b/meta/classes-recipe/rust-target-config.bbclass
@@ -272,7 +272,7 @@ def llvm_cpu(d):
     trans['x86-64'] = "x86-64"
     trans['i686'] = "i686"
     trans['i586'] = "i586"
-    trans['powerpc'] = "powerpc"
+    trans['powerpc'] = "7400"
     trans['mips64'] = "mips64"
     trans['mips64el'] = "mips64"
     trans['riscv64'] = "generic-rv64"
-- 
2.34.1


