Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5D31C44500
	for <webhook@archiver.kernel.org>; Sun,  5 Jul 2026 22:42:56 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.139215.1783291373807785000
 for <openembedded-core@lists.openembedded.org>;
 Sun, 05 Jul 2026 15:42:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=QrwMPz6t;
 spf=pass (domain: smile.fr, ip: 209.85.128.46, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-493c19bad03so21176275e9.2
        for <openembedded-core@lists.openembedded.org>; Sun, 05 Jul 2026 15:42:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1783291372; x=1783896172; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=k9BpYvYHgkJPJ6j+boGFmlCwngJCB5RCjtsHl+WCETY=;
        b=QrwMPz6tBbhFtfBchIQX/1leLBW+tBg38vJoloGYwaWVERZMY64yN6+0pwH+E+3utJ
         ZbypOX9aXAKDHqyYFQJPZ7chuVxsXD3drjLOXKxYO7JvQweLSwt61mxHuvzXXyNBbY9l
         8E+gNyqxWRVGYm64RyRFWhxfMuHt7qc8waLNo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783291372; x=1783896172;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=k9BpYvYHgkJPJ6j+boGFmlCwngJCB5RCjtsHl+WCETY=;
        b=N3C1JwWD+vQ098WbvVBXQHeFHM9wOmco1sn304Gryy/TKL8V0YHyfNWVAvu54mzpmZ
         48MHenjzwMH4G7sn30nJXSH3qEch7bDn9t01LfdnE8yYVKm+H8t/spLruqAvc86hWWB+
         mjXC3My2gNOVW5qN5yrM2+qgDf9iqPz9BfTLrjjXiP2D414L8osGmmFkKhJ6MvN75ZEd
         EHf7p8a0Mhf/hfQnAq56qFWDxA0/SRgMobJ39p76/9Yhditt1gBgvEBhbO19xofmLV8Y
         wxwavRlJp4pbTy6Kokk/QV9tZf8SdldR9v5fYbid8mgfkMli9iFJu71pqHB9CxpSwbwb
         MpMA==
X-Gm-Message-State: AOJu0YwSj2ld1gHtt1x4QQ147OABEO/m7ShDQZEtQPRtCBjCHohjJZXA
	BibMlNUqvG/5Di3ohaoHMIAsCL/H91HoCIlXkiiHyFmnT72BhTNy9VW0WeHZspf5JZHHteTGcST
	diGk5jvM=
X-Gm-Gg: AfdE7clFPBs5dsRA3yqE+29pUto7BgIFwbsD031KtLixTvJJyUr9RyDfZAqZaMc62gc
	920O4Dy2nNPm0uOBU0VOfRqIFG1isNvAXJP4K91vXH3UdALEV2pfs9wpY6SPDB7t85qDrb5eIBZ
	2aBowRtuCZIvgkMqaV7En5nujIJhLFTNirCfYc5OI58GOPDn7phJlUEDoKQixfvrO1AGhEsblAq
	sEFynL+DGHIu9Be/eYDh20DFJCGk0d486Onn1HVtvxfR3creC2DEYhyU4u8GS+d/6eHYt0v39t1
	sMGscV8c0BkYKQqK6V4d5AGFE1KUENgovyB23+r4cvtvPzkoV0ERm3EK4gzja5Lyt7BlyhE5Cy1
	iP8XQqjoKXV87GGvCx3fqQLnXt0YEDYFBF1gshBkoLBqdyFB/49zmqVkxB7qitQefl/stz7vbxW
	QV2XMZHaiRvQ067wpLWgH6U+ZQOw==
X-Received: by 2002:a05:600c:19cd:b0:493:d282:8298 with SMTP id 5b1f17b1804b1-493d88d2f58mr28457805e9.16.1783291372086;
        Sun, 05 Jul 2026 15:42:52 -0700 (PDT)
Received: from FRSMI25-LASER.lan ([2001:861:8010:5750:6d3a:72ff:5857:d2a8])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa0960af0sm17943606f8f.30.2026.07.05.15.42.51
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2026 15:42:51 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 17/55] libxpm: upgrade 3.5.18 -> 3.5.19
Date: Mon,  6 Jul 2026 00:41:07 +0200
Message-ID: <2018b1c49ed6f44303f832857a009c7c5c9f55a5.1783289522.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1783289522.git.yoann.congal@smile.fr>
References: <cover.1783289522.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 05 Jul 2026 22:42:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240171

From: Richard Purdie <richard.purdie@linuxfoundation.org>

A vulnerability in the `xpmNextWord()` function could cause an internal pointer to read beyond the file's end due to improper validation of file boundaries. This issue was fixed in libXpm 3.5.19.

The changes between 3.5.18 and 3.5.19 contain only the fix to CVE-2026-4367.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Enoch Ng <enoch.ng@windriver.com>
(cherry picked from commit 1fc25a668ee8bbabf7e8e369b2d94867cd22243b)
[YC: changelog: https://gitlab.freedesktop.org/xorg/lib/libxpm/-/compare/libXpm-3.5.18...libXpm-3.5.19 ]
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../xorg-lib/{libxpm_3.5.18.bb => libxpm_3.5.19.bb}             | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/xorg-lib/{libxpm_3.5.18.bb => libxpm_3.5.19.bb} (88%)

diff --git a/meta/recipes-graphics/xorg-lib/libxpm_3.5.18.bb b/meta/recipes-graphics/xorg-lib/libxpm_3.5.19.bb
similarity index 88%
rename from meta/recipes-graphics/xorg-lib/libxpm_3.5.18.bb
rename to meta/recipes-graphics/xorg-lib/libxpm_3.5.19.bb
index 94bf28232e9..32e052fd424 100644
--- a/meta/recipes-graphics/xorg-lib/libxpm_3.5.18.bb
+++ b/meta/recipes-graphics/xorg-lib/libxpm_3.5.19.bb
@@ -22,6 +22,6 @@ PACKAGES =+ "sxpm cxpm"
 FILES:cxpm = "${bindir}/cxpm"
 FILES:sxpm = "${bindir}/sxpm"
 
-SRC_URI[sha256sum] = "b4ed79bfc718000edee837d551c35286f0b84576db0ce07bbbebe60a4affa1e4"
+SRC_URI[sha256sum] = "ad3576d689221a39dc728f0e0dc02ca7bb6a0d724c9a77fd1bfa1e9af83be900"
 
 BBCLASSEXTEND = "native"

