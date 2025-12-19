Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0FF0CD711D9
	for <webhook@archiver.kernel.org>; Fri, 19 Dec 2025 03:22:36 +0000 (UTC)
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9319.1766114552780867874
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Dec 2025 19:22:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=cYBzw6r9;
 spf=pass (domain: gmail.com, ip: 209.85.210.175, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-7b80fed1505so1435700b3a.3
        for <openembedded-core@lists.openembedded.org>; Thu, 18 Dec 2025 19:22:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766114552; x=1766719352; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YJWVUg45msu84JrLVgwozO/a2ViJALRM7mUzsFdY8u8=;
        b=cYBzw6r93pU+43KZpuMBxkZnmpiGwTXaDTnMKU3ZdCOuimxbu6WjAa7q6tcUh+qL2N
         ljiMwZzlpN302QAh7LPl/YSOkcisPdhXqGe//QPzO7hBRVvM1i1vRI8Oqypy5lu/9WYu
         qo//Y7dOVZ+TYtKC32yV1RidnNTmVZeZ6KEOGsztkAZZfkAxYzF9/r7jjNfPCec5X61e
         3ydiFTM9xVFHikuxM3zAFoNsSI6uFHhaKG4rINtEPhZEWlS61OobTgrH+eElZbbauNTo
         04LheHynMqiCesWlvNMaJezeu9gBec7MXF6laW9tiluaN+E6gPxaMEYG2KXiM5BHMhIC
         7qqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766114552; x=1766719352;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YJWVUg45msu84JrLVgwozO/a2ViJALRM7mUzsFdY8u8=;
        b=fOr+y2u4ohYxTEP/3K6emIgHSAJ7iEm8y6WGUbFS5//iHUqUh093kF0UJHvowuXUvr
         ASUUbv9zUPGt6VJj0KgSymb5JmbPaeq3R4l9DwD7SApz/MmdLgwjcD8LceuJWucQoIUj
         wUyPzLdG5KTo5F1WGbjqZ3rPGsB832NDFIKtd6KKLXI77Gg8YinrRkIzxUaFikIT10nA
         4YjaTAm9ABbHiJU4I4w/mzrA3lo0ivWcYl/NlcKnVm+UyhPPbYXnQfrhktiLAwXE5siy
         lW2EMXJS91yLoresP9No50EGgMPMrlOCgug/EgV9Rg99uBQiy6ozH7o5caHgkaPDNiRq
         1i+Q==
X-Gm-Message-State: AOJu0Yx1ZwRmdnYmriMQWec2TtUwJN635tvK97EUNt1BXNF0mfD1Qo3i
	nmT5mJuvaE3TwxzYzutcwiXGFrKyf0wGorxFU30mu4GyMi8RP+F1GdpMGG4+4A==
X-Gm-Gg: AY/fxX6fimAI3JLnbND/Cbu2FcDFsFlHz/1eZjlKqv/fZ9N0n2hIxt9HLSa5xuPeqN8
	gSUShHCv1ZkG7PfxDVGs6MGXA4EMem/QSSJGBShei18HJ1tgTkMAUHw2MWWpjcVa4p9DW81v6k0
	tQ7BDWrgG+gL1eUzXe4hG9FUoro5oeyA7PnuZEXG92+I0WKcr05RjT7UI88Jc9EkMs0wTzr66uP
	31xKARzRo6IFUFhVRdUUnvYXzYQc7c2f024+GogQJyr9Ryq/jRgtoS+5JC/M5SD/Jy5ILZ9DmHo
	8GplMX3sKUVN3TEB4wbia4NOMdxDJ7IOBiO+RYnqmv13RsF+8A2HICGOI2Mfc6WKYFkC/PzfYhE
	VigiZPetugNErlgHbAFeINJw0AvsLrAjtZhnXQ9A4kiGDlfZpFS83gV8vKOdaBfH+rKCRkrgxPz
	YFBz3rl5je2pHEkHOHah05jO/l
X-Google-Smtp-Source: AGHT+IEEyoJf38gEw2ow14b10KGQaKCf0NHOpUDS8lPhf7GsatvOI0XT+jsz1gcEQaseeJ0PsJgBkg==
X-Received: by 2002:a05:6a00:2907:b0:7e8:4398:b356 with SMTP id d2e1a72fcca58-7ff6607b47emr1119653b3a.41.1766114551858;
        Thu, 18 Dec 2025 19:22:31 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([165.225.124.219])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7ff7b12a7dasm753360b3a.22.2025.12.18.19.22.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Dec 2025 19:22:31 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>,
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [OE-core][whinlatter][PATCH v2 06/29] gst-devtools: upgrade 1.26.5 -> 1.26.7
Date: Fri, 19 Dec 2025 08:51:45 +0530
Message-ID: <20251219032209.960840-7-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251219032209.960840-1-ankur.tyagi85@gmail.com>
References: <20251219032209.960840-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Dec 2025 03:22:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228174

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
(cherry picked from commit 8abbe8c533f91780f4d315084290489c052d737e)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../{gst-devtools_1.26.5.bb => gst-devtools_1.26.7.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/gstreamer/{gst-devtools_1.26.5.bb => gst-devtools_1.26.7.bb} (95%)

diff --git a/meta/recipes-multimedia/gstreamer/gst-devtools_1.26.5.bb b/meta/recipes-multimedia/gstreamer/gst-devtools_1.26.7.bb
similarity index 95%
rename from meta/recipes-multimedia/gstreamer/gst-devtools_1.26.5.bb
rename to meta/recipes-multimedia/gstreamer/gst-devtools_1.26.7.bb
index b0de19c10d..dab66c3c9c 100644
--- a/meta/recipes-multimedia/gstreamer/gst-devtools_1.26.5.bb
+++ b/meta/recipes-multimedia/gstreamer/gst-devtools_1.26.7.bb
@@ -12,7 +12,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gst-devtools/gst-devtools-${PV}
            file://0001-connect-has-a-different-signature-on-musl.patch \
            "
 
-SRC_URI[sha256sum] = "63d46a8effa8a225e25a464ba7538ace853fe0dc1e70366b27c208135e5401ce"
+SRC_URI[sha256sum] = "6912330ecfaf4f4f1329defbe97b9daf92e9aeaf8375e327a0dd30524d79f0a0"
 
 DEPENDS = "json-glib glib-2.0 glib-2.0-native gstreamer1.0 gstreamer1.0-plugins-base"
 RRECOMMENDS:${PN} = "git"

