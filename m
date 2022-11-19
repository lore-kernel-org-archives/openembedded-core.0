Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2828FC43217
	for <webhook@archiver.kernel.org>; Sat, 19 Nov 2022 21:16:09 +0000 (UTC)
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
 by mx.groups.io with SMTP id smtpd.web11.30676.1668892567194749351
 for <openembedded-core@lists.openembedded.org>;
 Sat, 19 Nov 2022 13:16:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=1AQtDlc/;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.169, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f169.google.com with SMTP id b62so7975831pgc.0
        for <openembedded-core@lists.openembedded.org>; Sat, 19 Nov 2022 13:16:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5OzQaD9vM5XXkjZUuYHiWA2sehzf+Wv5ydqTbuuR0ck=;
        b=1AQtDlc/XckU1v3pmTjd/TLAEVvtXkYoVmbsKMkpWsGf1v21lNPuemJlSgrKawEvRM
         foTSLdj+kUg+Jow7GKF4EstBI5oTsxiwzhW1P4moKdkWHIcfitx7sMUF51BpUC6Ko/bn
         i20L3Eu5wqnYoVzdYBPnyERgw90iC7997NRkGxIsdhOmFfcp9R3KstFan8S9wxv+Y6HU
         +LWEbkomuuVbeBqMuOe4r/sD2QBwuxGPTDkdFpYgz2f9f2OWOV8tCIo5ZZ8/Q2y4b1mW
         3cpaoVRNNKCkzij8/3BOQjGSWfUtx0ux77XTVUpqAZpvcvx3HpPVqyoL2KgrSH0B5Om1
         L9qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5OzQaD9vM5XXkjZUuYHiWA2sehzf+Wv5ydqTbuuR0ck=;
        b=OcncXLya5cfpzKrTPxdiRRZOt8f/jZWHSeO7H9OTiDMLRcqD4CAO4LZHUmOXjGi3Ty
         T2o+2cW9rJuAUnqtKAME2mnSPxohl3i9W/iz/ViYuNSCfXVgjKBIiW++Qtx4PbiuALzo
         76kaxAbC5luBrbpahZxOLAlIwEYMJwfiBSly8BOiMCXv7sDs9RNW/8F462OHEaxxD+bU
         OmDZM6df3Dv+Vvuj/XAZfCHhHUFa/uaE8YwghelO3tj2hQj7KzMsVx/qrKLVD4Y6gQ9I
         BMmBDBg3n/YI0j+lKxLNhCz6J76HDHndypj9ZyQO7X67jOrHy50d2YvCsPI2rwfKwqAH
         xIaw==
X-Gm-Message-State: ANoB5plINQzPMWZvWuT0gyzAlhOePJKRp/80GIsZADrO+a3Fr711ONxG
	xfx64dzPhJADpJoSlseojE8qpY3wIGKVdpCKXm0=
X-Google-Smtp-Source: AA0mqf4UUtU5/hj3nvODWwh5g9fV2xy/ugw63gKsxJ6uBEwCSlqwHROiC40iXwM42n2eKSI+JjF87A==
X-Received: by 2002:a63:5765:0:b0:476:848e:8baa with SMTP id h37-20020a635765000000b00476848e8baamr225309pgm.592.1668892566169;
        Sat, 19 Nov 2022 13:16:06 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id s16-20020a170902a51000b001869f2120a5sm6197735plq.34.2022.11.19.13.16.05
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Nov 2022 13:16:05 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 23/35] rust: submit a rewritten version of crossbeam_atomic.patch upstream
Date: Sat, 19 Nov 2022 11:15:02 -1000
Message-Id: <3a4e447dd9207fecce4373065172bcb67ee765b4.1668892398.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1668892398.git.steve@sakoman.com>
References: <cover.1668892398.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 19 Nov 2022 21:16:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173563

From: Alexander Kanavin <alex.kanavin@gmail.com>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit 4bbfd7427092063dd612d2ca9e466cb819f5a3e3)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/rust/rust/crossbeam_atomic.patch | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/rust/rust/crossbeam_atomic.patch b/meta/recipes-devtools/rust/rust/crossbeam_atomic.patch
index 7097bb9087..31a76d9bb4 100644
--- a/meta/recipes-devtools/rust/rust/crossbeam_atomic.patch
+++ b/meta/recipes-devtools/rust/rust/crossbeam_atomic.patch
@@ -14,7 +14,7 @@ Someone with more rust knowledge could split up the triplets in no_atmoics.rs
 and compare against the architecture/processor, or replace -unknown with a glob
 to create a patch that upstream might accept.
 
-Upstream-Status: Inappropriate [OE Specific tweak  but could be rewritten]
+Upstream-Status: Submitted [https://github.com/crossbeam-rs/crossbeam/pull/922]
 Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
 
 Index: rustc-1.63.0-src/vendor/crossbeam-utils/build.rs
-- 
2.25.1


