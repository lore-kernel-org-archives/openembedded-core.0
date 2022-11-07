Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A743CC4332F
	for <webhook@archiver.kernel.org>; Mon,  7 Nov 2022 14:55:52 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web10.4286.1667832922748436115
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Nov 2022 06:55:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=FUyKuBed;
 spf=pass (domain: gmail.com, ip: 209.85.221.41, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f41.google.com with SMTP id g12so16558531wrs.10
        for <openembedded-core@lists.openembedded.org>; Mon, 07 Nov 2022 06:55:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iuQDJ18Ta4IdHvtWOOvwGGs26UVZZxgILSBlQq/xMe8=;
        b=FUyKuBedjjProPeGAA5FPBPs63LsDr2tG3JlzFu60Y3IeRqOBq5Fn1vvN5NV27yw+z
         NGIEYVaMMiHr2QAoevgZXl94LBtgYqW17o6ltGbCXluw0P5c+Z2/N2BRZyHk/g2kq4AG
         u7R7zhKPYGANSLH824BNGmmOSKHtno2ZIbmMV1PYaLaZ+EBxgsUa08fugXRthwllVREg
         d8wHfK26CJ5ssCpFN3vaEudecVNHdxJn+BVk1hWNVbp8I2ZXXwILhs5bNyafDTR/N9gi
         /5HKZhtyVGyUoMpR2Z6BCaH6g9iEMh4T3uR4OlWENuC7JHxEDEHJahtFxeih6giOEtcv
         PNpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iuQDJ18Ta4IdHvtWOOvwGGs26UVZZxgILSBlQq/xMe8=;
        b=cRFVfeKeRpL2NdTGPh0cQxw+VH3pqEpOBCOq+DGD1x62j2hgI1vw8VSda07a8DaUwS
         ayjN5O625h0ueBgYnlOxvrYyAsRDx3TjPnBFZSm6SDqcX98f2LOb3BWa0quqGp5nL3fe
         jUSz+tC/ata6jRbCRmVPWb+CaUnZ1luEN01NEh2iRJbgJ7yTeJgtrDQ2+O5ALf8/LcLY
         shR4hahsxSlAF7zxBqu20AEuDypKmgsWgmj8lr5I2ryl3s+AEHS3EjLoMmJMiuZeiGKO
         V4rhFDCJ0gbUEACnvgC3KKYdgNbmO7Pzi+OY95vNdSFIXQQ/hGE52XbM1WT3z2vg8HVo
         +5Fg==
X-Gm-Message-State: ACrzQf1rdBEMl4RLLKOPQRAIumPOEA33UmBh4ingSOY/YQVJmKQXhd9E
	lsnaGfuJsqbnUc6chCr5XpLQlyrzN+U=
X-Google-Smtp-Source: AMsMyM45Q+D7Y0/IaYOqK0YjtEhkXItIETXupq4VpGH8Ps/TG6Tpx6QUYFsLDdhrv80KZY2n6kJwBw==
X-Received: by 2002:a5d:530e:0:b0:236:e1b9:4a9 with SMTP id e14-20020a5d530e000000b00236e1b904a9mr23369300wrv.70.1667832941545;
        Mon, 07 Nov 2022 06:55:41 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id s13-20020a5d69cd000000b0023659925b2asm7460440wrw.51.2022.11.07.06.55.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Nov 2022 06:55:41 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 27/48] repo: upgrade 2.29.3 -> 2.29.5
Date: Mon,  7 Nov 2022 15:54:47 +0100
Message-Id: <20221107145508.1051404-27-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221107145508.1051404-1-alex@linutronix.de>
References: <20221107145508.1051404-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Nov 2022 14:55:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172877

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-devtools/repo/{repo_2.29.3.bb => repo_2.29.5.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/repo/{repo_2.29.3.bb => repo_2.29.5.bb} (95%)

diff --git a/meta/recipes-devtools/repo/repo_2.29.3.bb b/meta/recipes-devtools/repo/repo_2.29.5.bb
similarity index 95%
rename from meta/recipes-devtools/repo/repo_2.29.3.bb
rename to meta/recipes-devtools/repo/repo_2.29.5.bb
index 66b632c29d..037919641e 100644
--- a/meta/recipes-devtools/repo/repo_2.29.3.bb
+++ b/meta/recipes-devtools/repo/repo_2.29.5.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 SRC_URI = "git://gerrit.googlesource.com/git-repo.git;protocol=https;branch=main \
            file://0001-python3-shebang.patch \
            "
-SRCREV = "acc4c857a0b6e2e33e3647028cbd312498fd5900"
+SRCREV = "b750b48f50eb4a11087ca6775161d5bf4d5c47d5"
 
 MIRRORS += "git://gerrit.googlesource.com/git-repo.git git://github.com/GerritCodeReview/git-repo.git"
 
-- 
2.30.2


