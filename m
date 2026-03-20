Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15FEA1093170
	for <webhook@archiver.kernel.org>; Fri, 20 Mar 2026 00:28:39 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2632.1773966516897102879
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Mar 2026 17:28:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=LW9LFf2r;
 spf=pass (domain: smile.fr, ip: 209.85.128.44, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4852f8ac7e9so13044005e9.1
        for <openembedded-core@lists.openembedded.org>; Thu, 19 Mar 2026 17:28:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1773966515; x=1774571315; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZFI8K6iiibIDXS4noEj8nAOlMawp7a3N9Js3Osjb9Xc=;
        b=LW9LFf2rmpYVhsy/eHKZ3tQh3MIxjcs5OlbXMFz2KCyXzqb+PouC/Xv8LUo3evBVVG
         nTpRYk+xZFM1Sva4wSlw1AtDN4OTGNtfxMYFg126jFwJUOa/JuRMDQcUCHDIDEYLWYSZ
         TaHhvGqVl8vwXEkmvIhpt0QaGrulfwHyc7aDw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773966515; x=1774571315;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ZFI8K6iiibIDXS4noEj8nAOlMawp7a3N9Js3Osjb9Xc=;
        b=lt4ooA6vRLIuTDcChI7hWPD4C8kpLza1Bc7X2v4CoAsPkEbsygVyuZA6hIg8croc+I
         u/T9OU7JptFRaidVDLMSNnlcTigqCvwp32U+TuyknFaaR26uQPU4/LJPeUvoWxoVU9bL
         a4+zYhs8xoMzewyKq5Y0F4V09oKEI1ELSe+QGh/Ir16a4YJaFfgikaXH93aTRBsFWL+l
         wzLBFwS8xxLrHSZ2vmWgjDe54rsd/1vDHl+KIutWXSwfSCQRw+ydQpJqCcUJTTOndK/h
         2ZTdZsdiGqy+pjZUAcWit70pikxZKa2xGKtU0xYiUImcoejIw1e9tL5Us0T0G66lq7xM
         wrxg==
X-Gm-Message-State: AOJu0YyY9ly8+UakeTURxXCr48vD1dmPq4ViFPi/fUAxoLxw8OOh4UkS
	b/ZWVov3gxUXtVln+hfEbuNwvKmFva+HM0JxzGm1Ae1Oo98XSpqV+r+3uF8/vEUfWm87hGB77kt
	SAbyd
X-Gm-Gg: ATEYQzyg0y5PdJ6a1TgAydbsgyeMTLwHNgY0QpBX+DaYkCm4ApDtfjHmKBvJzkUQZ7M
	t0uickGrArLsja0Kja08wFmQ8PTjzBmrxFRZ64yA71K18XiQAUI2BT0PaKk7Zon/2RljSaxoMOs
	dbjWfkiuRQsnjknDKwjsrustT/ApY0nztZ7PpZrvViMuMG0jOJV+rFs2Z6R05mcM3hoDsWQ4fnR
	aP7mRUO6I2KA7MV7ErldJ/E5cSsIKgorQ/CDlWnMvtdWCkIhhlDkHAZrZZgdQvJbA5ZoaMJEmTD
	K+/SKHR3nLcvM0fk8gImJwBC9SSwZqID/5MqO9TEMTAFK31jOusO66S17kdQNGUDnz3CSrsFRuI
	Yr/iPZAB7GpifLewHIEyvqdEpzRL6h229Zzv+RInavRRP7a35d8xU2UtnUXGzCBfnUM+oe7CSs+
	WKG+N6oiAK9eh9B/SNhrMqiPZj9QFJUEdUMRo2fL+FznS/bbws4dGGLS05C1ADoSSDnwsJsXve+
	4C0SfKImX/UNzCbakSLFk1sgfM=
X-Received: by 2002:a05:600c:a55:b0:485:ae14:8192 with SMTP id 5b1f17b1804b1-486febb5da9mr15065995e9.7.1773966515003;
        Thu, 19 Mar 2026 17:28:35 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486fe8359acsm23850655e9.12.2026.03.19.17.28.34
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Mar 2026 17:28:34 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 14/15] python3-setuptools: drop Windows launcher executables on non-mingw builds
Date: Fri, 20 Mar 2026 01:28:21 +0100
Message-ID: <c84d8bfdfbd5f9aacfe1ff049ee974b925d9f235.1773966414.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1773966414.git.yoann.congal@smile.fr>
References: <cover.1773966414.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 Mar 2026 00:28:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233575

From: Krupal Ka Patel <krkapate@cisco.com>

setuptools installs Windows launcher executables (cli*.exe, gui*.exe)
into site-packages. These binaries are only used on Windows platforms
but are packaged for target, native, and nativesdk builds.

Remove the Windows launcher executables when not building for a mingw
(mingw32/mingw64) host to avoid shipping unused Windows binaries.

Signed-off-by: Krupal Ka Patel <krkapate@cisco.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit cf7c79f3962f2be99cfda47e8cc730091e6a18cb)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../recipes-devtools/python/python3-setuptools_69.1.1.bb | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/meta/recipes-devtools/python/python3-setuptools_69.1.1.bb b/meta/recipes-devtools/python/python3-setuptools_69.1.1.bb
index 46b2f0ab008..00f83056dbf 100644
--- a/meta/recipes-devtools/python/python3-setuptools_69.1.1.bb
+++ b/meta/recipes-devtools/python/python3-setuptools_69.1.1.bb
@@ -19,6 +19,15 @@ SRC_URI += " \
 
 SRC_URI[sha256sum] = "5c0806c7d9af348e6dd3777b4f4dbb42c7ad85b190104837488eab9a7c945cf8"
 
+do_install:append() {
+	# setuptools ships Windows launcher executables (cli*.exe, gui*.exe).
+	# Keep them only when building for a Windows (mingw) host.
+	case "${HOST_OS}" in
+		mingw32|mingw64) ;;
+		*) rm -f ${D}${PYTHON_SITEPACKAGES_DIR}/setuptools/*.exe ;;
+	esac
+}
+
 DEPENDS += "python3"
 
 RDEPENDS:${PN} = "\

