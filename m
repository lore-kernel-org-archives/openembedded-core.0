Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC5EBD116F6
	for <webhook@archiver.kernel.org>; Tue,  2 Dec 2025 15:10:11 +0000 (UTC)
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9926.1764688203761543038
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Dec 2025 07:10:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=DIJuRVBb;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.180, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-7aace33b75bso5324099b3a.1
        for <openembedded-core@lists.openembedded.org>; Tue, 02 Dec 2025 07:10:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1764688203; x=1765293003; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sX/ai9mPh3CNPfpJj4yE7q3AzBon+d7NIjBo2EMIrq8=;
        b=DIJuRVBbfwrs3ThoEFQSTQD+SVWl3N/8c3sgehmSoEXavyEsa7Doaa3EEN2D2VTzgM
         2+Ps2rl4sy+a7DcTZBzsrsPpcN11vwTrllY2SntDQ5Ir45DRendnT2cMWnHuMmnV2ZTg
         U43jEj3JFqkPTrR8s91n6v01izBpCIOWCSQ8D4OyI/2gjjhpT8OGylqhNK3bZ9WKRJ2A
         oeyjEQRyxX4yRR2ZriPEBfI27NVzWX3QADG1fZeMlieCHgZj4g/b78/9ewh7KSPD6gPf
         LsEedM+ScTTklGHf6BDWfSFGgVDYDRIws5X/PRX7qwf2ASmfLyYYeY+F3zphnO1Hjvus
         eapg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764688203; x=1765293003;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=sX/ai9mPh3CNPfpJj4yE7q3AzBon+d7NIjBo2EMIrq8=;
        b=J0hWrTxSvdiAbMby9Bx4aRuv1nk3tgWM5WthFJc4cIOAd0HT9X/Ft73+60i3u579hi
         QNpVtkumAGtQtlpjXwEa/wwbLsnn08twPn/TWKucQoTpwjonGQIHe1gH92rpJ4syu+54
         K4aQA2D9UbXG9Foj0AcMyzM8Rl+G6pXpSw068yguOnV9OUb7Bho7OiK6/na7xsfuFINd
         Dnk/jZEgzpqiw635xGxUUSi+zeyHUJp38yxOfyDvTu25ObL3/OQakudH52XRMaKMT6zx
         ScNYVTsk99Wp7Gp4/YN2D3VsIhzBoN5JQ2IvZTcp6MzchAy51xNNkFhgV/a/J8zgkqtI
         OB1w==
X-Gm-Message-State: AOJu0YzRJsZW6tRsh1Q33QtLu/uA5UusQjR4aMEQRgfVEI2IeOLbPBw9
	tpIPC8dIJJegzGsJqqtsC1HKJc9I/g+lRZ2DmpSRpeISDR5HzJnAlVQv29rzYg1vgJBxSiTKeOM
	ZOZ5V
X-Gm-Gg: ASbGncsns1WtI3dVbAAOpfQeLhu2V+Hc4bEe09BxPP9gdwf37saB7lXjJMziYq9dkZA
	uAVfiMiFUIMrIRvaOP1koKVjl47Z6q/kBykDHGc0ZnDAYydocLaqv5jiduVyldWu7hvO+WNLAnf
	/SmlrqLLlEy9nDr/fMKKzwV2shKvQX5BL/3SM5Dg3PKYCFsmHmOYNtEY9XgsKyAXUveNFAO5ELW
	MxZRjSfwHdhpjg2KIlajLIy3nFQZ2vNQd2WGCGF/VzPpH0t8VIFs3xBJb18yKtRWvXj1LoPaZIX
	gsiV50fqZBZ+ExEz7eUzEdnsUO6+Oo5Jl+Uryr5Whi3rShtKiQO3HXtmbIXu8m7RjlPnlP0YMAG
	OC3gX0fnHEY6CGHHrbDDWoHbc22L+h23/WJs6yePPkEVov7WbjLlw0ra0I17yjn9seN2T2DKX04
	BKvA==
X-Google-Smtp-Source: AGHT+IHEKJXEHONkaYWkaY80cKGmwMwZ0JnTQ5p8pWkR3M/68mc0TorgCv1HxN/NNdk6S+kJGqJPEg==
X-Received: by 2002:a05:6a20:3c8e:b0:35e:6c3:c8d6 with SMTP id adf61e73a8af0-36150f2d90dmr47071430637.41.1764688202782;
        Tue, 02 Dec 2025 07:10:02 -0800 (PST)
Received: from hexa.. ([2602:feb4:3b:2100:b8d9:92cd:3fd4:9b7a])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7d1516f6621sm17175182b3a.16.2025.12.02.07.10.01
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Dec 2025 07:10:02 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 10/10] systemd-bootchart: update SRC_URI branch
Date: Tue,  2 Dec 2025 07:09:33 -0800
Message-ID: <80c7fd87fd95a79c6eb5f41b95cf70ccc70d9615.1764688054.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1764688053.git.steve@sakoman.com>
References: <cover.1764688053.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Dec 2025 15:10:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227169

From: Gyorgy Sarvari <skandigraun@gmail.com>

The branch was renamed from master to main.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../recipes-devtools/systemd-bootchart/systemd-bootchart_234.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/systemd-bootchart/systemd-bootchart_234.bb b/meta/recipes-devtools/systemd-bootchart/systemd-bootchart_234.bb
index bc3eee2093..98237aba65 100644
--- a/meta/recipes-devtools/systemd-bootchart/systemd-bootchart_234.bb
+++ b/meta/recipes-devtools/systemd-bootchart/systemd-bootchart_234.bb
@@ -8,7 +8,7 @@ LICENSE = "LGPL-2.1-only & GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://LICENSE.LGPL2.1;md5=4fbd65380cdd255951079008b364516c \
                     file://LICENSE.GPL2;md5=751419260aa954499f7abaabaa882bbe"
 
-SRC_URI = "git://github.com/systemd/systemd-bootchart.git;protocol=https;branch=master \
+SRC_URI = "git://github.com/systemd/systemd-bootchart.git;protocol=https;branch=main \
            file://0001-architecture-Recognise-RISCV-32-RISCV-64.patch \
            file://mips64.patch \
            file://no_lto.patch \
-- 
2.43.0


