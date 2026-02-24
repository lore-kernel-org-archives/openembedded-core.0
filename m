Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1FD8AF357A7
	for <webhook@archiver.kernel.org>; Tue, 24 Feb 2026 14:25:21 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.21481.1771943119734044013
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Feb 2026 06:25:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=qffWlR7Z;
 spf=pass (domain: smile.fr, ip: 209.85.128.42, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-48329eb96a7so32847155e9.3
        for <openembedded-core@lists.openembedded.org>; Tue, 24 Feb 2026 06:25:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1771943118; x=1772547918; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VmkTOqDcE93eIMy+M/P6J1uqPcdwrP28jeKbFUrG5VE=;
        b=qffWlR7ZkEdQvpdjTtZ7BvyvteO7rZX/nSXvX3H4oVMsECNS0Lynz77fgX+ahp9EyD
         pQXSljW6VNaz7CZzxreL8FJKryOuhBAmQlbRuxNWixX3HDSMl74Ml/bzc0DuXI7Xm5MK
         5O/TCQmMgrdUyIAEDgze4aP2hRGF6wpLj6Dx4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771943118; x=1772547918;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=VmkTOqDcE93eIMy+M/P6J1uqPcdwrP28jeKbFUrG5VE=;
        b=lenMRNgMSbVCjAPrpRdGs2iqTP2uHZTfRcF+30lj5fnx5IZed9Ksc2csJWiPRp6GeX
         6YtQMdohFx2b6PltRYOG8yhbmXP43lZUgWqqhDy15DbZhR8qH4oeggP1AUpfL99vNlBn
         4m70/HTiXT6bNP3YN0BVD3ycRWrsaALlJRENZMmkT8U820D7V8n9yI2MhdEy/78cXXl1
         SLGECXjc3uBQjSB/9N9lnhOx8apBQ5voD2b3WOV43RdwCBqCF8DgSgnRMaWbbbevq+IU
         ICApJZhOwB9jVK2ALvbBU7ujAhRBbxVTKef3Wk1WI2NjuIMyEBtLbtxxVzxpEpBvyj8n
         UChA==
X-Gm-Message-State: AOJu0YyRIfTDetmFjIEWewHKdqWLUU9DbElrKv4GgVLwz3z4Ip5MEmp6
	n8HDhvBmz4HE7p6DU9u81MOnKXRlngFq2v9+vyoIne5AF5JWTL11NEk6rT9knGDt+XKAl7+5aVe
	n1p42
X-Gm-Gg: AZuq6aLRhYY5GKN6VeIilJG2TyW9dk5P8BK/yktZy4LQ4Oy0Ry/hX1PHJwBpgQqnZNX
	bEsc2ac4QNKsH5UI5ccLKoVxUR+aB1W55cq11udk5N586qLNJUsS4366OkYbE9YkP41V4dkpE2s
	LoLl864BZibQtWVo9RzFCrsn3T1PTSzA71EE7/kgvxIjnPfueHNTXN0r/jQJgrjD4Ru+zA2VD05
	Rw+0zSnKkkKFKqb5XRPW9WGyIsOgnemvk4UPBuThoeyhUxCgPLVTY2AnoJa8WOraT4IDvHl3s5J
	vKAmlpC6rVbxIfx1le+4bq77xJM5DRyz/5aBesRA0CUjECpdGI2uQbp04/V0NJ95fVwRrEPxjiH
	5okGVJKRRlnpSrc8fJeiFtEtQX99LnK2iSquaWxkD/IjTJ5ssq1XSNId/F5AuBCwhVk8gsQiBHu
	PC11J3TRkg2KrYLgoGgfhsjm2u3Q7JXz2+UNcTA+WxLHA/CjtWOBtstiBROLs7wG2kM6xDNz+XB
	x/43CuwNqS5jsQtKhCkYasCxNCD5jNvQw==
X-Received: by 2002:a05:600c:1c22:b0:483:79ad:f3b9 with SMTP id 5b1f17b1804b1-483a95eada4mr217333215e9.28.1771943117719;
        Tue, 24 Feb 2026 06:25:17 -0800 (PST)
Received: from FRSMI25-LASER.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483bd7507adsm2047455e9.9.2026.02.24.06.25.17
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Feb 2026 06:25:17 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 26/38] ffmpeg: set status of CVE-2025-25468 and CVE-2025-25469
Date: Tue, 24 Feb 2026 15:24:18 +0100
Message-ID: <5d0642f48adb0235f98f91636132785f7fd71917.1771942869.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1771942869.git.yoann.congal@smile.fr>
References: <cover.1771942869.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 24 Feb 2026 14:25:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231792

From: Peter Marko <peter.marko@siemens.com>

These CVEs have the same fix commit per NVD report [3].
Blaming the fix [1] is showing that the return without freeing memory
was introduced in [2].

[1] https://git.ffmpeg.org/gitweb/ffmpeg.git/commit/d5873be583ada9e1fb887e2fe8dcfd4b12e0efcd
[2] https://git.ffmpeg.org/gitweb/ffmpeg.git/commit/d38fc25519cf12a9212dadcba1258fc176ffbade
[3] https://nvd.nist.gov/vuln/detail/CVE-2025-25468

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.3.bb | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.3.bb b/meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.3.bb
index d64b97e7877..4793035eb72 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.3.bb
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.3.bb
@@ -105,6 +105,11 @@ CVE_CHECK_IGNORE += "CVE-2022-3341"
 # bugfix: https://github.com/FFmpeg/FFmpeg/commit/28c83584e8f3cd747c1476a74cc2841d3d1fa7f3
 CVE_CHECK_IGNORE += "CVE-2023-6603"
 
+# These vulnerabilities were introduced in v8.0
+# introduced: https://git.ffmpeg.org/gitweb/ffmpeg.git/commit/d38fc25519cf12a9212dadcba1258fc176ffbade
+# bugfix: https://git.ffmpeg.org/gitweb/ffmpeg.git/commit/d5873be583ada9e1fb887e2fe8dcfd4b12e0efcd
+CVE_CHECK_IGNORE += "CVE-2025-25468 CVE-2025-25469"
+
 # Build fails when thumb is enabled: https://bugzilla.yoctoproject.org/show_bug.cgi?id=7717
 ARM_INSTRUCTION_SET:armv4 = "arm"
 ARM_INSTRUCTION_SET:armv5 = "arm"

