Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98420C00140
	for <webhook@archiver.kernel.org>; Fri,  5 Aug 2022 13:13:30 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
 [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web09.6784.1659705204598702671
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Aug 2022 06:13:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=HXIaZNYL;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.48,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f48.google.com with SMTP id j7so3244613wrh.3
        for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Aug 2022 06:13:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc;
        bh=FzQaM6/rmtzt6T/OCSfSg5vmddTGe5xUsss1tR3cyas=;
        b=HXIaZNYLahjtRzVooUXxhf2KWJqU3p1bXeMK0oW6DF3QZB45rkZIYmGHk5fbaaDOzI
         crwmY/PhmHTQo/6dLVkt8d2UiekV9fXFh3NDngqC0Wd9CNvuVnBc/fC7H0ANQ9IYxsXO
         CHrQwJBUvIA1xo8f+e1Ib+4y4V0nfZYqjAOH8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc;
        bh=FzQaM6/rmtzt6T/OCSfSg5vmddTGe5xUsss1tR3cyas=;
        b=IJJxUPp7QwEK3DNUaZQbfWBZMI+/4jeevMY3OPHhhqAxZmidrH7+exDQ9+5s2aBS3J
         7geMGWCZMyR1ApPewFB8fAhLq4xeBXTTCG7fg5XAIhdEbw6p/O5fmiNw2PP521O1grX8
         vWf4t7QRRmrRvl+1jFljabdkNXywZ2GqGzNmjF5mJtZu8vISs7gpyBfxV1lUQ2rIITq7
         xzpk4jeWk1oW0/nN65hP6B1WsU2koEzKC+g2+Etzz63rBzQqCQwuwzbTubrEOKoQIIzp
         2Lven7ZFYxJSy7E7mn4nxpsowavNWirrEKOEu8uRDe/EI06UwaO09CcrBrssbbXBKlRQ
         C0Sg==
X-Gm-Message-State: ACgBeo3CdZ3lXU304d4GoCahHr3l/XYT2Zeoqs1IhHIzcB2o5GLdSAyp
	gGvbIYvEXniP5KTqWsFgNAkQa22sbdtQaA==
X-Google-Smtp-Source: 
 AA6agR4BPl5ZL+bp3uLfWhADu2quaIlm5Jpw5GmHM/J5T7ep26ma53aRFyeqPJtUpiT5uOk3CdID9w==
X-Received: by 2002:a5d:6241:0:b0:21e:f97f:d0cb with SMTP id
 m1-20020a5d6241000000b0021ef97fd0cbmr4376528wrv.37.1659705202833;
        Fri, 05 Aug 2022 06:13:22 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:f483:fcb0:1452:5a5a])
        by smtp.gmail.com with ESMTPSA id
 p12-20020a05600c204c00b003a51a0d35e7sm1908901wmg.37.2022.08.05.06.13.21
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Aug 2022 06:13:22 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 28/29] rust: Fix musl builds
Date: Fri,  5 Aug 2022 14:12:51 +0100
Message-Id: <20220805131252.3706794-28-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220805131252.3706794-1-richard.purdie@linuxfoundation.org>
References: <20220805131252.3706794-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 05 Aug 2022 13:13:30 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168962

Musl targets need a sysroot set to find the musl static libraries. Set this
appropriately in musl builds.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/rust/rust.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/rust/rust.inc b/meta/recipes-devtools/rust/rust.inc
index 1c8fe225fd4..d0f7467a887 100644
--- a/meta/recipes-devtools/rust/rust.inc
+++ b/meta/recipes-devtools/rust/rust.inc
@@ -83,6 +83,8 @@ python do_configure() {
 
     config.set(host_section, "cxx", e(d.expand("${RUST_TARGET_CXX}")))
     config.set(host_section, "cc", e(d.expand("${RUST_TARGET_CC}")))
+    if "musl" in host_section:
+        config.set(host_section, "musl-root", e(d.expand("${STAGING_DIR_HOST}${exec_prefix}")))
 
     # If we don't do this rust-native will compile it's own llvm for BUILD.
     # [target.${BUILD_ARCH}-unknown-linux-gnu]
-- 
2.34.1


