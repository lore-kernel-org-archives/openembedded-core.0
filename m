Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97F3FC44507
	for <webhook@archiver.kernel.org>; Mon, 29 Jun 2026 14:20:38 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.38582.1782742827893622269
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Jun 2026 07:20:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=oOOJsVEY;
 spf=pass (domain: smile.fr, ip: 209.85.221.52, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-47122683cf3so962551f8f.0
        for <openembedded-core@lists.openembedded.org>; Mon, 29 Jun 2026 07:20:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1782742826; x=1783347626; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ejGm2IJG5YnbEOWqbCTqO7CbKg46gZpL/uN/xLgfCR4=;
        b=oOOJsVEYzb1Gh0jI1NvaZSbSs8IiiZF5zjPuwmOkCP3yYzUYbJfFFNgYOZwDdeChsw
         y4PPwNnPB/Lyj3pIJKWv3cpuD7HtRnk2bmP9mE+Y1uSu5iaJwBtF88R/J4RZy05AkE3D
         ZK2GsmQ1zzyj6iilptIj0cWvcn5idC3dnaExY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782742826; x=1783347626;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ejGm2IJG5YnbEOWqbCTqO7CbKg46gZpL/uN/xLgfCR4=;
        b=AmEHUBuDLFULE3tZhdwaX2+UQpD+Leusp7Ffm+vKlvxX9zLV0UVL/K2Nnfbct9G5Wa
         km/MKKorMTKV/zmXBR6hLOSRe8HUNOFbBCO8OutgHADINJViuTOwVvnR2HHQwjgY12bK
         LdFGdlJtBqXc7/fnx6M65KfCrejLK1OHo3rDds0vNnIrqMVpVzAePtO2MtUmS3jL/jmY
         3KzQ/VQgruIs5yq1wWNHnGhr9W3VE7zoBM0m1nyDPOPF7rWLSuV8+uHKd++APXMKtsnt
         vzLw9Oewm+0xOQMZau1f1HbX6XhgeejinfbSAdKho6MS/7iD27gzoxun6cF7DRnwSGEl
         1Orw==
X-Gm-Message-State: AOJu0YzwTQVKy41DNDEZWDtsHGUPxz238K4nTcTPib2NXZFCqXz2pkSd
	iLHFSTsvLe12FmsJwHvlfdFBZto4Dm+wgv09UXr28iT3mkF9QMzODujDNThXxX8rNV6zFSy+IJq
	wR7CMnLc=
X-Gm-Gg: AfdE7clllhydv7PeIzzXEqPUNUew5YRI+loz6lYWDMTk1B8kl/NpOLoW04rAMZmVlOa
	bFxS+0Ei49diPc6Ym6TvkBMqKWHoRPQpfUkC0VVagInAtndce7W7L3oczP0DNAuPJPaI/jgqCmO
	BFXOSal2w8I/Wm5wh0pG3IDfGZsUuoJL3wOm/E0qJzsjipDyZhpDsz4uWqkLYJXlqbPBZ+MX584
	SLFbLU3y4H47190lS5/28u1mrg9ipQzQ0eCyJ7K8E9SU2pSnGS3GfkFcBruDMIuuXH1MsKherYM
	7I88Hoe43UaP7A0qgVtjYMlNYGYjh6wU6GF8kiXf8EON/a5DeObsulXEKNFmPI/lEXhVl7pjfc9
	ZIXqzJV2QWASkEg/QgLdbMfg+PafXCKNpE+JVuwShcHt6uIcyfkrgZ/xLc7kEqCfE1k8jVhrnhp
	HsLOBGjE6UGnZG8WOx9aCMt98HJZgLSoJEgBgU+FqxOaqAUNMhJjPQ3G+SbCPx+JUaTyPcOTeTo
	0QxaduSuxVX7OrCz8FDNS0=
X-Received: by 2002:a5d:6a48:0:b0:46d:32:3340 with SMTP id ffacd0b85a97d-46fb8d93892mr14394711f8f.36.1782742826056;
        Mon, 29 Jun 2026 07:20:26 -0700 (PDT)
Received: from FRSMI25-LASER.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-46f8d6f10absm44958410f8f.5.2026.06.29.07.20.25
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 07:20:25 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 03/19] gawk: trim native build configuration
Date: Mon, 29 Jun 2026 16:19:48 +0200
Message-ID: <c80a422c9c1392127a431c2dd38b203266b0b1ed.1782742373.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1782742373.git.yoann.congal@smile.fr>
References: <cover.1782742373.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 29 Jun 2026 14:20:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239791

From: Ross Burton <ross.burton@arm.com>

When we build gawk-native it is only for use in builds where the host
gawk output isn't reproducible across versions[1]. As such it doesn't
need support for readline or mprf, and by removing those from gawk-native
we can get building gawk-native sooner.

[1] oe-core c5bbf0a60b ("gawk: use native gawk when building glibc and grub")

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 1e6b810f60fd45856fc6a57270bf85342bcd9415)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-extended/gawk/gawk_5.3.0.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-extended/gawk/gawk_5.3.0.bb b/meta/recipes-extended/gawk/gawk_5.3.0.bb
index a05ec3b34bc..e38c1f84366 100644
--- a/meta/recipes-extended/gawk/gawk_5.3.0.bb
+++ b/meta/recipes-extended/gawk/gawk_5.3.0.bb
@@ -12,6 +12,9 @@ LICENSE = "GPL-3.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
 PACKAGECONFIG ??= "readline"
+# Make native builds lean
+PACKAGECONFIG:class-native = ""
+
 PACKAGECONFIG[readline] = "--with-readline,--without-readline,readline"
 PACKAGECONFIG[mpfr] = "--with-mpfr,--without-mpfr, mpfr"
 

