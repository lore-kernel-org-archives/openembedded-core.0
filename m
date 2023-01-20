Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D392C52D77
	for <webhook@archiver.kernel.org>; Fri, 20 Jan 2023 18:12:00 +0000 (UTC)
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
 by mx.groups.io with SMTP id smtpd.web10.82064.1674238296753883379
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Jan 2023 10:11:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=1vqYIZkV;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.173, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f173.google.com with SMTP id 7so4754123pga.1
        for <openembedded-core@lists.openembedded.org>; Fri, 20 Jan 2023 10:11:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=InNeuFFkLL9tZzv2NPLeYT9pTJGXQWoavXY/mE4gxpE=;
        b=1vqYIZkVIOgM9EPyW7Pi9ajsffE5e7eTgiyW8GXYLYxBtepUpSZ5BQfvABe+hIP2Zx
         B7gjh3qS2D4QQosa/fqEc1XWZVFdcEBS5ur6fYoEi74uoZS1PiAEOUVebzYBa3O2qJO5
         XTnTy4mgAacuP3m567HeRZgo34FkiQ99nBPp1+OMtqqkDL/Iyi7l3hl9Kcld3bCWjdKg
         85M7rP/Ath7Q40hqKtr63hnOoTQ001kSijXKZNPzMTACUEJL5CXHrda8wzC2m6EHiVzY
         anvOePMeCBw+QAsNmzLemdm4jLGNYayM+IhNMjGEf3x6u1XVRdVbJMRegPHDZStwklAq
         4WiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=InNeuFFkLL9tZzv2NPLeYT9pTJGXQWoavXY/mE4gxpE=;
        b=dWnc72VmwWTC12B3OBVrBbTasjsDek/uJ7FVAwEds+Q3uFovwJmH0D/pdaS1O2143O
         rR+d9mHXMX2D8ZU5yVub1of4HuVmQSJWV6MPJNzxCNU8PjvEewmcbm+atEnewHrCnosR
         ejyALzvHiqfQQtZcZHP+Fw+/yKNEzUoRtQwuBBdg4SWALdO29JisKO3k8LQVu8jxR9rU
         UDG2jj2wyO1fDIHVbrQeKzWByRxK26zuH1kJuSKFVpbPE0AJXoOuWAs7rSD+91535gDC
         YbijK49Ak9T+QQkGMWizXvpOL01SsQKUZtCnBRHqwTd7wv4tQueP0iyn7CK4p9Gq8JYT
         XeVQ==
X-Gm-Message-State: AFqh2kqI+jMqqDFUUhLX2o//uKJE77rEY0/LllAKTPcaT1iERYYNfrB3
	y13M7bYPiA+E1DJJMpYg5jAbW5Utsyk9Zcg0Nh0=
X-Google-Smtp-Source: AMrXdXtiCfqkKY/Fd2vereP8k1zrNQq8DWWacLd/4qPs2c2Svs8tESJXoSTiY8cMR4vVemjkxkAc2w==
X-Received: by 2002:a05:6a00:44cc:b0:58a:fdc8:92bf with SMTP id cv12-20020a056a0044cc00b0058afdc892bfmr16168441pfb.2.1674238318838;
        Fri, 20 Jan 2023 10:11:58 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-5-74.hawaiiantel.net. [72.253.5.74])
        by smtp.gmail.com with ESMTPSA id i128-20020a626d86000000b0058db8f8bce8sm8990396pfc.166.2023.01.20.10.11.57
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jan 2023 10:11:58 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 30/41] harfbuzz: remove bindir only if it exists
Date: Fri, 20 Jan 2023 08:10:47 -1000
Message-Id: <687f371fc99833b878f3cfdb006aca9e238d9909.1674238148.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1674238148.git.steve@sakoman.com>
References: <cover.1674238148.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 Jan 2023 18:12:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176237

From: Petr Kubizňák <kubiznak@2n.com>

In some scenarios (e.g. when "glib" removed from PACKAGECONFIG),
"${D}${bindir}" might not exist which caused `rmdir` to fail.

Signed-off-by: Petr Kubizňák <kubiznak@2n.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 21261072cbe0056e85550a0710de142fab8943e4)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-graphics/harfbuzz/harfbuzz_5.1.0.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-graphics/harfbuzz/harfbuzz_5.1.0.bb b/meta/recipes-graphics/harfbuzz/harfbuzz_5.1.0.bb
index 4905e8e2ad..8e06acc011 100644
--- a/meta/recipes-graphics/harfbuzz/harfbuzz_5.1.0.bb
+++ b/meta/recipes-graphics/harfbuzz/harfbuzz_5.1.0.bb
@@ -32,9 +32,9 @@ PACKAGES =+ "${PN}-icu ${PN}-icu-dev ${PN}-subset"
 LEAD_SONAME = "libharfbuzz.so"
 
 do_install:append() {
-    # If no tools are installed due to PACKAGECONFIG then this directory is
-    #still installed, so remove it to stop packaging wanings.
-    rmdir --ignore-fail-on-non-empty ${D}${bindir}
+    # If no tools are installed due to PACKAGECONFIG then this directory might
+    # still be installed, so remove it to stop packaging warnings.
+    [ ! -d ${D}${bindir} ] || rmdir --ignore-fail-on-non-empty ${D}${bindir}
 }
 
 FILES:${PN}-icu = "${libdir}/libharfbuzz-icu.so.*"
-- 
2.25.1


