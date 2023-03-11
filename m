Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F0DFC6FD19
	for <webhook@archiver.kernel.org>; Sat, 11 Mar 2023 00:27:32 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web11.35734.1678494449294612077
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Mar 2023 16:27:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=N9E+o2K6;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.54, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f54.google.com with SMTP id l25so6569909wrb.3
        for <openembedded-core@lists.openembedded.org>; Fri, 10 Mar 2023 16:27:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1678494447;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MAhRnmcbQGtxW/OiVjDpmLct4HqMpQm4S/b3IjGY/wA=;
        b=N9E+o2K6tDr7GfcEk42qwhC0UEu3mZ80R6EJ3dHFS9+vyTqj9HIVgTqbG+pNwbp/a/
         6/BNWvTUsZQxz8pDaZWb01qViDVEm92G0ASNVHYZa1hLoyDLKcW2WC0s+VQI+CON8Oyd
         /Kd07zQKZjoCGevJXb1tD0w7tyki8tBt4KEXA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678494447;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MAhRnmcbQGtxW/OiVjDpmLct4HqMpQm4S/b3IjGY/wA=;
        b=G5RRWUJuxiTlZsKPGjMraHI9V7fjswSuBjfFXzQhjOT5EdBBM7XLxE49VUhiReOdQD
         jray6hgFYrBU/l5NnDrRq1dktXjPBIoBlzoXVn491VYrjR1PqVJPf+IDLT8gxfT4eAYN
         QQatxE4S0lvtuhQrfMl9g1HXACwQ3Vs5UlNA2SHqr+sz2d3BL0Cxb3lrLa+xYthj2m7v
         4mD+WSWnMHHbAxWREBdGQquoHgKe7IXKof5p4moNLHMtaZ508rerbIK71WNevRHBy+nc
         XpNohIaB8/CJ5uHZQKjtDfccvVke5fIU29bksdQaOk8q9fP23uIGnGzALFbrwPtIcq1m
         Hqqw==
X-Gm-Message-State: AO0yUKVh1VC9nvMK6bAshYVjb4x+a+jC8qS+P00SnHDhBFiR3x/UgCcv
	BgnaBcmSkUuLM2VHpHyzz9fiyKCmk8kQfGojrmU=
X-Google-Smtp-Source: AK7set8xhWiHloKrQ1eYohZL/5JN6GEgxSxtQa0YojFozk3xtdoh6VyEg+50fCacy4X+f17RnHrgqA==
X-Received: by 2002:a5d:4b44:0:b0:2c7:156c:affd with SMTP id w4-20020a5d4b44000000b002c7156caffdmr15426214wrs.9.1678494447656;
        Fri, 10 Mar 2023 16:27:27 -0800 (PST)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:9dd5:bdbf:ef9d:c118])
        by smtp.gmail.com with ESMTPSA id n15-20020a5d400f000000b002cea299a575sm291736wrp.101.2023.03.10.16.27.27
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Mar 2023 16:27:27 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 07/16] libmodule-build-perl: Fix ptest dependencies
Date: Sat, 11 Mar 2023 00:27:13 +0000
Message-Id: <20230311002722.3211118-7-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230311002722.3211118-1-richard.purdie@linuxfoundation.org>
References: <20230311002722.3211118-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 11 Mar 2023 00:27:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178351

Some of the ptests fail in a minimal image. Add the missing perl
module dependencies.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../recipes-devtools/perl/libmodule-build-perl_0.4232.bb | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/meta/recipes-devtools/perl/libmodule-build-perl_0.4232.bb b/meta/recipes-devtools/perl/libmodule-build-perl_0.4232.bb
index 748412b414f..0ead690067b 100644
--- a/meta/recipes-devtools/perl/libmodule-build-perl_0.4232.bb
+++ b/meta/recipes-devtools/perl/libmodule-build-perl_0.4232.bb
@@ -91,12 +91,21 @@ RDEPENDS:${PN}-ptest += " \
     packagegroup-core-buildessential \
     perl-dev \
     perl-module-blib \
+    perl-module-encode-encoding \
+    perl-module-extutils-cbuilder-base \
     perl-module-extutils-command-mm \
+    perl-module-extutils-mm-unix \
     perl-module-file-temp \
     perl-module-lib \
+    perl-module-parse-cpan-meta \
     perl-module-perlio \
     perl-module-perlio-encoding \
+    perl-module-pod-simple-transcodesmart \
     perl-module-pod-text \
+    perl-module-tap-base \
+    perl-module-tap-formatter-base \
+    perl-module-tap-formatter-file \
+    perl-module-tap-formatter-session \
     perl-module-tap-harness-env \
     perl-module-tap-parser \
     perl-module-tap-parser-scheduler \
-- 
2.38.1


