Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B8DBD44D67
	for <webhook@archiver.kernel.org>; Wed,  6 Nov 2024 13:49:47 +0000 (UTC)
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
 by mx.groups.io with SMTP id smtpd.web11.45906.1730900985906012565
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Nov 2024 05:49:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=bZZ11U9I;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.46, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-2e56df894d4so5247145a91.3
        for <openembedded-core@lists.openembedded.org>; Wed, 06 Nov 2024 05:49:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1730900985; x=1731505785; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=t0p05Z0oz5XBWI0EtCO25VLslmULLLv2ZgPzks9fKHE=;
        b=bZZ11U9IIquCJiqJLUs/GabQxqhz0d+RPOdz5tWQ9mals5m3y4LpiXzNxp8sulUFnh
         GmuIc+aHRwLVbMBUu+BhV7Zv1krluVnpXOpHAoxNeOF5fB5SnhQx6xw6Xd650YhaToKS
         N6Nezrmsy0omHUUXsXfoIpVmGhG/dyoN+5NtxzBIv8EU/37v9ZgaK7Mkm1uCUwfaZ6hL
         CRqcdsvhjpX4AgaMGBQ1i/wqMkp/bNjjiz3ZeL2xvQ9CtoscbPUVz21HUZ7i/UizrU9W
         +EKC9CMnl6Z6G5YsbX7JQEQ6AxeHdYYIbIYV4e9C+tsnnJRWkUF9rkxkxog1Nrv0l62l
         gO6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730900985; x=1731505785;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=t0p05Z0oz5XBWI0EtCO25VLslmULLLv2ZgPzks9fKHE=;
        b=Sz/LMHNf80qONpikWmO6bXzMaCBgKnAjNQAA+ujSStVOvdJJuyzC6jaS+dSD5pFw+w
         X7HJdoPxHafBrV8HECNhZMPTeunghUQwD75heVfMn3BXoaZpWNGozcXNj+liqOy2ycDi
         ShryeZbdBmq5CJVsqjnw/gImPJXrtQgNKvFVH7wSzNAhUvg68/qPANk/F7DdNeMDehP/
         1fF2o6B9/7hD2jZXcscmUI5yc9q17jWkkN5QxV2rH7BLUfz3in80J6JNYKLlklJWBpJv
         OcVEMFakpEaT6L1njhPE+zpbca1IP2W2l7XGcXQVYpp2wamUEqjjH3k+RDCgqfJNlmro
         Jf+A==
X-Gm-Message-State: AOJu0Yz59D0+zHPgkGyfC9VUNXJXOHPDrUFh746kzXaLiAqQavaILal0
	1W0iihvKsR84xnqASB99HCa6ooL+EfSh0h/IA0RT8NZt3PNvu3KnruaCnu/LUhChV5NOdeD2D6e
	M
X-Google-Smtp-Source: AGHT+IHOt4k9MzWbZ01DNQCyqxy3jwMz73g1RwgFX1NIlmi+RZ+bRJ0QexC5kwcM6g1EkqDekhmjcQ==
X-Received: by 2002:a17:90b:3849:b0:2e2:be64:488f with SMTP id 98e67ed59e1d1-2e93c12932amr29351774a91.6.1730900985131;
        Wed, 06 Nov 2024 05:49:45 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e99a541e16sm1491795a91.21.2024.11.06.05.49.44
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Nov 2024 05:49:44 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][styhead 1/7] vim: Upgrade 9.1.0698 -> 9.1.0764
Date: Wed,  6 Nov 2024 05:49:31 -0800
Message-Id: <d71af9599b8658fb5d7f5d2845ccf7a956588a3f.1730900782.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1730900782.git.steve@sakoman.com>
References: <cover.1730900782.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Nov 2024 13:49:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206774

From: Rohini Sangam <rsangam@mvista.com>

This includes CVE-fix for CVE-2024-45306 and CVE-2024-47814

Changes between 9.1.0698 -> 9.1.0764
====================================
https://github.com/vim/vim/compare/v9.1.0698...v9.1.0764

Signed-off-by: Rohini Sangam <rsangam@mvista.com>
Signed-off-by: Siddharth Doshi <sdoshi@mvista.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 2f0e5e63399e544063c79b0b1f9555c820b0604c)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-support/vim/vim.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/vim.inc
index f87f4dcbfa..cf36f4087b 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -18,8 +18,8 @@ SRC_URI = "git://github.com/vim/vim.git;branch=master;protocol=https \
            file://no-path-adjust.patch \
            "
 
-PV .= ".0698"
-SRCREV = "d56c451e1c05310562c5282352d7bb287c16323c"
+PV .= ".0764"
+SRCREV = "51b62387be93c65fa56bbabe1c3c1ea5df187641"
 
 # Do not consider .z in x.y.z, as that is updated with every commit
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+\.\d+)\.0"
-- 
2.34.1


