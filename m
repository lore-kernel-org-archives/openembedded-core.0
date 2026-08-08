Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF425C55174
	for <webhook@archiver.kernel.org>; Sat,  8 Aug 2026 15:14:38 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7526.1786202070751916038
 for <openembedded-core@lists.openembedded.org>;
 Sat, 08 Aug 2026 08:14:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=LKKVBtKm;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.54, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-498028b3d5eso5177725e9.1
        for <openembedded-core@lists.openembedded.org>; Sat, 08 Aug 2026 08:14:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1786202069; x=1786806869; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=MOUB03IAmLVsxl4KnfArnhLy+YsXvA4v2ANVHTCcgpY=;
        b=LKKVBtKmWYzW7NvZswk1hHVQleK1BsBXX+XtxPwC0Lr/RZWjBGpU0/7z4qvJLsEOYK
         xSwNuMaMfBUze2dVjpRuQYo0ard4RfnEYXH4P/z6milSyh6EeVp7sw8uaQZ3Bn6dbvrd
         McBBLWanogiFtmxTr/d0Aya0N4Vw87rgMwgdU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786202069; x=1786806869;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=MOUB03IAmLVsxl4KnfArnhLy+YsXvA4v2ANVHTCcgpY=;
        b=FhY4mJJg0tZaKhyqXYbrz2NYLbWBVlYUrggakqE2UmXXaUQONTQDrY+87c5T3BGl/F
         pAVNmDtn6SMw27cwjk0je4vCAJT1GalaI1TzA4xRp4to+q1GXkjsBt8FgG1mplL9Ajw+
         loPzn3YFHNnsA90cZKuzbuDshSn9+MNBscbQ7iLDjadmmxgrCfCHr6K/NfkaPvsJUIsH
         TTrmCnEY6UGKpnf1+9jf5xVH1FzH8QcR0Ppm9p1W7FxiuYOFy4F9l570DsqoG95roXwB
         hlbJUP3c9clf8NSj+LOzwGSE8a5Gg4cOhz8FJjrBdatXMyfM0J0wGldYqUfyWYuYLqxe
         AA2w==
X-Gm-Message-State: AOJu0YwtoPCSHbOBgqIcWzzqKPa9vBQV6qiGhPNmgub9XuA+U5h9kBo8
	zHNltaUvCPQ66Pbxeuavi2EEFAEBYcumqrLDar1wxAcsIBGNNZ6R/WQEes4CjJNumdGnElwvzSy
	zBbxJz5A=
X-Gm-Gg: AR+sD130fcst/N0MWn/MaG8V9wkcw8jioFQbI5muUKsTUEW4CvbHRudiiHt6TTQfo3g
	SQK/0vHaBPegdEoJ/W5LXqNE5WhMTn5CmSrF3EbOQHs8B7GjesWTm48J2l35VWM6HYb+4MrZkQk
	UY6nZAJxbKcdZBIxT3bUwO6uFtpMs8kGtHwxXi4ghnfn+hgmJ2UKPIER7kofq7qA9dVetZe6pWt
	XC6ffhzjtfKe8XTyXs/CkUke4At7jgv+h8hR8rhMrHi8KzAO4eteY/ERp8Kxry4ZKs56n6XC2Lv
	quGxhsBewswH38/BtRkKpJRPWB2fCq7sYsrWDcnT4txwaWK/Opx/L3wHRXSzBHTZi3oMWSVl8ic
	m+pkD+/0/0dEXYPLlpSqzmYuvG3GpzANbgsDlhrVmTqiTv6xtuok4RVUxrVJ9OZXrrSKwj5BlRk
	CYQDDAdAw7elg8RoIPrpfnpXt7RzlFVt5R2hWNwEOZvA9UzTIijtSzY1fgV8+w/7M1VShlwi9XB
	i27cstP4XUXiT5oXT7UcLlYHw5IoA==
X-Received: by 2002:a05:600c:3b9b:b0:499:6a92:fff1 with SMTP id 5b1f17b1804b1-4996a93003fmr10343705e9.18.1786202068634;
        Sat, 08 Aug 2026 08:14:28 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:a306:3637:68aa:bc01])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4995e9f060bsm132745975e9.7.2026.08.08.08.14.27
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Aug 2026 08:14:27 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] python_pyo3: Ensure native recipe sstate signatures work
Date: Sat,  8 Aug 2026 16:14:26 +0100
Message-ID: <20260808151426.753073-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 08 Aug 2026 15:14:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243050

When a native recipe was added using this class, issues were exposed by the
sstate tests. We need to exclude the SITEINFO_BITS value from signatures
so native sstate has the same signature on 32 and 64 bit.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes-recipe/python_pyo3.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes-recipe/python_pyo3.bbclass b/meta/classes-recipe/python_pyo3.bbclass
index 7f5a00f584f..d2aa188cf07 100644
--- a/meta/classes-recipe/python_pyo3.bbclass
+++ b/meta/classes-recipe/python_pyo3.bbclass
@@ -32,5 +32,6 @@ build_flags=WITH_THREAD
 suppress_build_script_link_lines=false
 EOF
 }
+python_pyo3_do_configure[vardepsexclude] = "SITEINFO_BITS"
 
 EXPORT_FUNCTIONS do_configure

