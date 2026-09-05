Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35FDFC79FA5
	for <webhook@archiver.kernel.org>; Sat,  5 Sep 2026 20:45:37 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2595.1788641129488541024
 for <openembedded-core@lists.openembedded.org>;
 Sat, 05 Sep 2026 13:45:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=HMjI8syj;
 spf=pass (domain: smile.fr, ip: 209.85.221.41, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-4843efcbdb2so1099938f8f.2
        for <openembedded-core@lists.openembedded.org>; Sat, 05 Sep 2026 13:45:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1788641128; x=1789245928; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=RAfZf/u4qIXHyL82JIK1P5zwhgtgiwbUgqBAsrFHe2U=;
        b=HMjI8syj78SR2gTTM/gah5JvN87BzlwgEWfD71NdFULVyX+yWFmZvRX/TeyUYr1gPQ
         8atAiL/P6nj/b8txfllOFloCYPmd/hKzOJejBQ3/dPQZEDe+oRnU735kVShc95IGAWgQ
         /P/7CPhv/eWpN3FiGbZdHYC/V4jQGYxCuZtW8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788641128; x=1789245928;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=RAfZf/u4qIXHyL82JIK1P5zwhgtgiwbUgqBAsrFHe2U=;
        b=Ogn4Ja6gqVfJn1Np4rw/YTvMVBkEzTJpxLd88nLZ2GdRNuEdwIFjixhlEn6Y337F5X
         knkTDsfsvH3Zc7DiSJ7yZ/7oEmTmC6uxWh4J0h/OtG1USgA0adX0JTZdKcUQZBrIaG1i
         zwmRec3lCRY5Y8jYggh1rswKAD5wdEiQU/i4enl/LTHZfxxqVV8wpWFCu47LnqBTYWlb
         zGrVa+HHQDxheudWJrC7gH2LtQfKDTAZmrhScFcza0JlhIRKm4MCsKXDZmv5Lu/KZj2l
         ZPTjrqy822PWY5BTjEmn3/CdjC19hm437E20/R+9XxHzvgghMq7C21AeOpj/c1FL8LkO
         rGYQ==
X-Gm-Message-State: AFuF++ljgVhyGatVF/ntuSBkECQkdU4oJmmQGsJ/CVO0lY529w2n+Nz1
	6cry7AY7bXujFyqB19UehdH0RQGbbYX+0UpoGNlQpHff9IZQVkaIdeNdCrLJ+TLzMXGq86uZ502
	m8j1YDW4=
X-Gm-Gg: AYBFou0wZksnP21r4ac68DyTkfYavwEtX3DTLKl2YyLCwdF4PjqSkK0la5sQi/TXw5l
	CtuEGd3hkXsCDefpsHbrOjBgAAazlie3iMIL/vQk8QlyTUfjckfcSd835uqfFx7OshQrFrWhV23
	cNCFy+piPMoQpFlOsTPztijHbJA3erqQE9S7r5gc1yQoUxiAQI6CJp132g/2+c3FuOFfk3zClvq
	O4I30ZqAQEOtuWRQyLKIJdnr2qG8SyyDyaI6H4BBHjXajTqr6w2/THv9ZYbjkFVN7ASU33PbMDA
	Bp9ruc2JvXz+D5I9kWNhEhpIk5p7rM8/WqvudKEXoYrvfW+XmjDN4oUbvBRBzH8rdcr8DIOonVb
	SvqSQFCCvb1yeTjpiBTktYXbtMTwAp8nunAt1YQIWf9X2s0er/TURTh0kr+R6eQAL5rcOP/4XEZ
	VuuDLC0mEi6dtSelReAnYA6Y7T6ujRwAedFTbwXox22x3f6sDmZz6x3IlkZEx3/imdSs+x0o5TC
	h33MkVzhh9r/ToiSXZyiwuWZeZkNnQkm405TONjFJHqBdPI4hSfRiJoR5/NYJakoA==
X-Received: by 2002:a05:6000:4b0f:b0:484:3647:d977 with SMTP id ffacd0b85a97d-485872df445mr15346298f8f.27.1788641127786;
        Sat, 05 Sep 2026 13:45:27 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa0048511f7ccf23d3ce.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:4851:1f7c:cf23:d3ce])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485885bfdf6sm17069098f8f.34.2026.09.05.13.45.27
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2026 13:45:27 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 30/40] python3-git: fix CVE_PRODUCT
Date: Sat,  5 Sep 2026 22:44:31 +0200
Message-ID: <7ceb739a42260adc216aff61e3d5fe296154ee6c.1788629392.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1788629392.git.yoann.congal@smile.fr>
References: <cover.1788629392.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 05 Sep 2026 20:45:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245182

From: Tim Orling <tim.orling@konsulko.com>

Using the pypi.bbclass default CPE of python:GitPython detects no CVEs.
With CVE_PRODUCT = "gitpython_project:gitpython" we properly detect
9 CVEs, with 4 unpatched.

WARNING: core-image-full-cmdline-1.0-r0 do_sbom_cve_check:
python3-git-3.1.43: Found unpatched CVEs: CVE-2026-42215, CVE-2026-42284,
CVE-2026-44243, CVE-2026-44244

(cherry picked from commit 3a6af75a33b4e007f0d3a247b6a149e32d51e510)

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Devansh Patel <devanshp@cisco.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-devtools/python/python3-git_3.1.43.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/python/python3-git_3.1.43.bb b/meta/recipes-devtools/python/python3-git_3.1.43.bb
index 7534531fa37..ebb5e4b442a 100644
--- a/meta/recipes-devtools/python/python3-git_3.1.43.bb
+++ b/meta/recipes-devtools/python/python3-git_3.1.43.bb
@@ -10,6 +10,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=5279a7ab369ba336989dcf2a107e5c8e"
 
 PYPI_PACKAGE = "GitPython"
 
+CVE_PRODUCT = "gitpython_project:gitpython"
+
 inherit pypi python_setuptools_build_meta
 
 SRC_URI += "file://CVE-2026-42284.patch \

