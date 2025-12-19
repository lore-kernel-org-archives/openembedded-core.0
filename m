Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16280D7361F
	for <webhook@archiver.kernel.org>; Fri, 19 Dec 2025 03:22:46 +0000 (UTC)
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9322.1766114558083205728
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Dec 2025 19:22:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=hH7TPiPM;
 spf=pass (domain: gmail.com, ip: 209.85.210.182, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-7ade456b6abso1148794b3a.3
        for <openembedded-core@lists.openembedded.org>; Thu, 18 Dec 2025 19:22:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766114557; x=1766719357; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F3xkYkueb7dGLiIN2Sk9vDccfm9LIp0ealOrWr9LCDc=;
        b=hH7TPiPMj7KWXK8DED7FJHg2jkze7jeDB5YyfK7ASEtuBM6N4NrV2CG7e2BG29OQJF
         Tw6MzSmN0fFW3++unt0npRcADu3kmUciBZRlYh7ficQXBPpqO2JzWq2tobrFKk0jr5Kr
         EkZ3gaFJ5jKjeKFPC29HjaCD4z4yFL5lbjYOwKG79INRQbVowdJD1WLVDd1ioFvr50rU
         1RxPSofM7qOyGGeXbvjtVsI7Pr15YYB4dDjf+wqta5biu9Mj3RIMlpLAYzzrrRdXGQQf
         OPeOEkXgEcAG6hE7svQkVJZ/d0e9WFvYMNwCUSnW6g2RdejsKn0zU4GKWEOSZf65zJd9
         zYfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766114557; x=1766719357;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=F3xkYkueb7dGLiIN2Sk9vDccfm9LIp0ealOrWr9LCDc=;
        b=k5VYk9TirvOeoqNquu5axTMagdc5QJIHU8K12UPwUQKOgQvF/Va1TCv5yDnxFZtDPd
         BoctKE/RA9dHpSxtl5v3NTG6IYC1waYMuOn3bzej+jYQWxrbO7U1QdgHxtqFmQjD7szj
         WzkH9WMBGiJEKmQUPC15qFpq1o0rkJuLTkfR1K4Nt2JWMZ5QXPdos5hFipu2ahRD/Xpz
         KX5yv/SUeMIGcWE7vg9WOE4pbiAX+ZZSka9SES8LF50iNbLFY70PcOZrU7gEwev+mo28
         8yYx6YDt6Ye8cXXNdZ4g2BzAUyY9svlmqU/aS8VPWI8eqdUSVpVXINi83tEhkUf+ac74
         2LEg==
X-Gm-Message-State: AOJu0YyV0gZoTaaLohzJuAbgkmV+w0i1sUNUYe/vMfO4dsS82O2XY04a
	dI2zCxIIfJ0Yic6gbifNKjPIzxeGP7eaXxCH0tBVu2bqDyx1aQlCohMyhCMeHQ==
X-Gm-Gg: AY/fxX7rg3nJrDmmbEB/9rp156uPn+YNWsIV7oQvOdHK/fAyezKJqxFjFYB9ALDI3Mh
	Kno3MzZ4i3CnpI7uKAWVi2xKXiOZ3h8hw0yHEjFvnJFgU+ilkPhW3x21T2k6kBO11+GpHjnLpiH
	wjAFKn4z1Kb7htIXVJR9SfcSeqCmqVeqvcm7zfRvWa40DRW5pAngk8qoFoS/w2VD72srx9uOzvc
	iO3HENhvYrmhzSWX/GxK6maAV4MXNi9WrnEOx70CMEXeeoOSWREWmXaiZcmeIRanHWEgUHd+MdN
	4OoAiSF9EGpFg6qjWiKIlqdzTNBNneXuweg2piZc6aGKjCZiTh49bWGk8SigmaNGwIx9qUEYlmU
	zRdqxDtnbWdtvUXIullWhKPNTZUKg2dmmOZPNIM9x8cwnEgmFoD6TUauAnoE4+qt+NPwHZ31Llh
	T8U6ubdniQVXQ7abI7q2FvYkRg
X-Google-Smtp-Source: AGHT+IGwPZ7qjwRHyeiC0dygAQTHq9Km509FuY3PMkOW+TBhadVwvxYu66wbuNLMdei4FgdtQrg+XA==
X-Received: by 2002:a05:6a00:451c:b0:7e8:4471:8c6 with SMTP id d2e1a72fcca58-7ff66277f50mr1572287b3a.39.1766114557292;
        Thu, 18 Dec 2025 19:22:37 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([165.225.124.219])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7ff7b12a7dasm753360b3a.22.2025.12.18.19.22.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Dec 2025 19:22:36 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>,
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [OE-core][whinlatter][PATCH v2 08/29] gstreamer1.0-libav: upgrade 1.26.5 -> 1.26.7
Date: Fri, 19 Dec 2025 08:51:47 +0530
Message-ID: <20251219032209.960840-9-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251219032209.960840-1-ankur.tyagi85@gmail.com>
References: <20251219032209.960840-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Dec 2025 03:22:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228176

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
(cherry picked from commit 1535c02a7ddd9fa87e5634bcfcdbf212d7621d0f)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 ...streamer1.0-libav_1.26.5.bb => gstreamer1.0-libav_1.26.7.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-libav_1.26.5.bb => gstreamer1.0-libav_1.26.7.bb} (91%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.26.5.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.26.7.bb
similarity index 91%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.26.5.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.26.7.bb
index c3ee529497..aa6c431daa 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.26.5.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.26.7.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=69333daa044cb77e486cc36129f7a770 \
                     "
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/gst-libav/gst-libav-${PV}.tar.xz"
-SRC_URI[sha256sum] = "d6de05884ef42376dd8cde89940f7b50ced96f4f6f52888e764cd8233e74f052"
+SRC_URI[sha256sum] = "91d4a7a14527d97fe0ce7ccedb3554e8f692b216429ef2b1850944bbf5435c09"
 
 S = "${UNPACKDIR}/gst-libav-${PV}"
 

