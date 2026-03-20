Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA7B2109193D
	for <webhook@archiver.kernel.org>; Fri, 20 Mar 2026 00:28:37 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2622.1773966512055734853
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Mar 2026 17:28:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=fbzwZnYo;
 spf=pass (domain: smile.fr, ip: 209.85.128.51, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-486fb112c09so485755e9.1
        for <openembedded-core@lists.openembedded.org>; Thu, 19 Mar 2026 17:28:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1773966510; x=1774571310; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OesDvmcjGBPe6c3iXpZsuflgY3c2ZsIxyQb7w/uUu9k=;
        b=fbzwZnYoO3ppwj4YmH6YuQZVArlYrECysjxFF/OvzpWCJIxcDNAdld7aMs4L5xJVPx
         W+KfMcfCseikhHrFMcNwiOqIc2eZgBxOHRkonjnme+wECkR1B48hNTFD2tecWy1KKCAw
         fbNaOgn5DwW4ECl0AW7wcFmUrSpDVnBE6dkDI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773966510; x=1774571310;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=OesDvmcjGBPe6c3iXpZsuflgY3c2ZsIxyQb7w/uUu9k=;
        b=g9Qa2FjD+OUJndjyUrrM30LPYBIVbc2ngL35A7dD+RqgnOiwBf0+jCjkklw/0xb5gY
         ywqspuLOnKX09KztCKqmItdIyGZ/jGeN+olglE8dmdLJSvwMs8psbhsf433olf+LZVNl
         XlnHgkieHq70hbs/s6NPXhoXlnJqFYJNp/XcVgoEG+J8ruXxliU5QRBZVLdHSt4aHQcI
         KToBZKEZ/17n/Mitwp0o5tQmtYAjURJOB8Nv6/NX0SXTZoET958uJIwDl47cG8hDTJTD
         TTSMaQKmT32dJsrs18ciXg0QFDale4BWbBmBaMkjzTJT27rYA3BG8TSlB7ysmHbExZ1C
         JhEQ==
X-Gm-Message-State: AOJu0Yywd0lLUBI8ARFT712JTgLFft6mjbMCTpPz5TvVXsoDQqtZ8I8a
	06x87EEvGmuNiC6NjbBfyLV6ObArksmjQGtvDTMOK4gFRqrt2ZqhxsHGdA4LFCSMv5dOyrpTaq6
	RVAUl
X-Gm-Gg: ATEYQzzshzSv3dTh1/PmAQM6WonDanqWSssO4KW7OjvSaFIjQwplCxu2fOe1I99IWqf
	JG2HlB1Ed4wKKJSfKFzxUG0W+vwYM4z3XmBbaQEpTJf0moW/YzQADrzjb359oMXfxEAfZGBYb8x
	It4CLbU4NolDPLkTgYTF6E7j3cIyZrMk2AP1BqBYEbSgh9A08qpADw3c0rlVnuiAaFhu0Vo+U/v
	vo6f9nSFwDITxhCbrwgVhdtvAvSJCaPLMvbN+YW62hMoH3AdsdqQMwomt9ufm9vKoB/pQoO4l5L
	Vr06TTYRTQT51dZIwhxWj4/sfixwwDTsq2yuCe8JEDVVg08fly1vHYFQp5Ij9qqBJMVI1mt/KpO
	kw0zaupFxBC6Jof6+DDpeyFRWOpt0I5yJJlEF99MNca5lCTFr5eYFOLENJ7hGTPdq4Mhd2lQXI8
	YesbSSrynoGgsPU0cc7rE6/LiOOjStFTDriOokGyBmnSGGjFkflmvow7uzqfx6uu3C0NAM3Q3sp
	oi8xc+pQakNNZJiI8nuw9Nj4DY=
X-Received: by 2002:a05:600c:3546:b0:486:fbdb:b718 with SMTP id 5b1f17b1804b1-486fee29536mr14901645e9.25.1773966510235;
        Thu, 19 Mar 2026 17:28:30 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486fe8359acsm23850655e9.12.2026.03.19.17.28.29
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Mar 2026 17:28:29 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 04/15] tiff: ignore CVE-2025-61143, CVE-2025-61144 and CVE-2025-61145
Date: Fri, 20 Mar 2026 01:28:11 +0100
Message-ID: <2552809fb0b3664824be09ee6dce66db97aa0755.1773966414.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1773966414.git.yoann.congal@smile.fr>
References: <cover.1773966414.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 Mar 2026 00:28:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233565

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

These CVEs are for tools which were removed in v4.6.0[1]

[1]https://gitlab.com/libtiff/libtiff/-/commit/eab89a627f0a65e9a1a47c4b30b4802c80b1ac45

Details:
https://nvd.nist.gov/vuln/detail/CVE-2025-61143
https://nvd.nist.gov/vuln/detail/CVE-2025-61144
https://nvd.nist.gov/vuln/detail/CVE-2025-61145

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
[YC: NVD patches for these CVEs only modify the tools which are not in
the tarball we use]
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-multimedia/libtiff/tiff_4.6.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-multimedia/libtiff/tiff_4.6.0.bb b/meta/recipes-multimedia/libtiff/tiff_4.6.0.bb
index 777783d7ccd..07540692fcf 100644
--- a/meta/recipes-multimedia/libtiff/tiff_4.6.0.bb
+++ b/meta/recipes-multimedia/libtiff/tiff_4.6.0.bb
@@ -29,7 +29,7 @@ CVE_STATUS[CVE-2015-7313] = "fixed-version: Tested with check from https://secur
 CVE_STATUS[CVE-2023-3164] = "cpe-incorrect: Issue only affects the tiffcrop tool not compiled by default since 4.6.0"
 
 CVE_STATUS_GROUPS += "CVE_STATUS_REMOVED_TOOLS"
-CVE_STATUS_REMOVED_TOOLS = "CVE-2024-13978 CVE-2025-8176 CVE-2025-8177 CVE-2025-8534 CVE-2025-8851 CVE-2025-8961"
+CVE_STATUS_REMOVED_TOOLS = "CVE-2024-13978 CVE-2025-8176 CVE-2025-8177 CVE-2025-8534 CVE-2025-8851 CVE-2025-8961 CVE-2025-61143 CVE-2025-61144 CVE-2025-61145"
 CVE_STATUS_REMOVED_TOOLS[status] = "cpe-incorrect: tools affected by these CVEs are not present in this release"
 
 inherit autotools multilib_header

