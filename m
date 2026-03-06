Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1AF4F5141C
	for <webhook@archiver.kernel.org>; Fri,  6 Mar 2026 07:23:08 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.64685.1772781785605800867
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Mar 2026 23:23:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=ncZ2QbRh;
 spf=pass (domain: smile.fr, ip: 209.85.128.54, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-48329eb96a7so58641605e9.3
        for <openembedded-core@lists.openembedded.org>; Thu, 05 Mar 2026 23:23:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1772781784; x=1773386584; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=njpY43cUsFTxwlAfg2Ji7SvYZpV79HUJrf8BEPfihjY=;
        b=ncZ2QbRhDnnaQdfIodNFCU3zGFINM1F5nF6/zzFJg7Y+k3PCdG54DobmhoHHRTDPHu
         1d/UlsgGCHvNWn3lzxghLN27psg7TOJ36tjhnk3Dh+JeOmRaDZXTo7aqgj0SsjfwyZzV
         V5zfdzyg059BVFOHGiuMMmKuFRcyunvoXng9E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772781784; x=1773386584;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=njpY43cUsFTxwlAfg2Ji7SvYZpV79HUJrf8BEPfihjY=;
        b=KifNlLgsIAGpxRYMt6/PGR2enRSl3Z5jt+yG+tB0APGKF1SsoaiQeB4Ets1RbA4leM
         8ryMokcR8n+Xt6MAxVI1Ui8g8tD4/1aunrqgeFwh4IJ5ubrwcjxyvnuL3DQZimUVi81H
         ukPAvGtRs2GjYAtIklXyWuyRknPPTntme5d+d9H9LyIRvwyFAJJrAZQg6moq6Oap8OYk
         jzxYPRJ9RooYtp2BrWA8YvOh73/AucikOZDTW0pNd/ZVmJhaHHdrW1f6Vt4xWUPbOgYW
         mOTQxwABinjPiHekmpuhtd9gKXMBVyhvIbGpjjxk5IEQRhqUB3t5vv3D+XBsO8Hs+HyF
         p4bg==
X-Gm-Message-State: AOJu0YygWKtlnYpOhjPYBkrxlin2H0XESdDgBYoPuw53tRtKT2aXGgd8
	2N68SD4kAxitwO7ktzMkzecmhNvPKzC/OKnfHgXX17lCpXfdBE7jIoZ/jcjTgh2W7fBV1MHckDw
	MKxEE
X-Gm-Gg: ATEYQzxQ6q+8btQAqubrD4XAiICXpCTL1sY7YFFVZ+f1Ew6Zet3izXFBRk5RcyKKF/K
	gnIUwUbFRyUIOSBGFRGwaXWCTnXiIWlR0KpBwXcWhA8zYy3VRQxUx5AZvkhMosGmKcd1++h5YWN
	anRhO3uFtomytFnLbT8hjM+AxHO68VLSn5l9eqYei7EABrFCq/DIfR1nWaILVyt52TSC3Vefx5T
	9v8ivoa6yAXgUMQ8anmcXsa0yZ5Wu7gRo1rV4+7b36Opd+giyq3z2pKj1gW9HWC+3iimOPv6UDt
	UcxlW6OEaCpGIK/OC2ToCGlJu/fkFFjd7qSLoeNJwRzXqeRGB9/0Mw6r9HoMSIbeE04ZfKEgE+T
	3Ew2pusQj/CPp+iNeMBzhRcl+IDcf6HHfy+Cs4B6ELa4vmFKuksoTt8S852atkmlDPNRS78pCeg
	g/opiH3CjeLQjZ889uOsmpOW5Kd5hr2Gzs320IYyzEE0Cm4abfuK0coPCCpG2emelqTv9dZwMBr
	Bf+iuR60m8vbwbHPwjP9nV++PMDhoHxUZMx5ow=
X-Received: by 2002:a05:600c:3509:b0:477:7f4a:44b4 with SMTP id 5b1f17b1804b1-4852691c673mr16311475e9.1.1772781782208;
        Thu, 05 Mar 2026 23:23:02 -0800 (PST)
Received: from FRSMI25-LASER.home (2a01cb001331aa00bdeac353f6fa5aa8.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:bdea:c353:f6fa:5aa8])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-485276b09casm23106445e9.11.2026.03.05.23.23.01
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2026 23:23:01 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][whinlatter v2 06/16] ffmpeg: set status for CVE-2025-12343
Date: Fri,  6 Mar 2026 08:22:06 +0100
Message-ID: <66bfcd43078d5ac3dc46e1a6a544eb2095b2c8e1.1772780989.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1772780989.git.yoann.congal@smile.fr>
References: <cover.1772780989.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 06 Mar 2026 07:23:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232547

From: Peter Marko <peter.marko@siemens.com>

Per [1] is patch for this CVE [2].
This is equivalent of [3] which is included in n8.0.

[1] https://security-tracker.debian.org/tracker/CVE-2025-12343
[2] https://git.ffmpeg.org/gitweb/ffmpeg.git/commit/b8d5f65b9e89d893f27cf00799dbc15fc0ca2f8e
[3] https://git.ffmpeg.org/gitweb/ffmpeg.git/commit/263e819aa45cd3c48bf6887be02b4ec504c02048

Signed-off-by: Peter Marko <peter.marko@siemens.com>
[YC: commit 8536c8b9e9093ac2d7d82c49e61e1c1cded5d1e0 upstream]
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-multimedia/ffmpeg/ffmpeg_8.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_8.0.bb b/meta/recipes-multimedia/ffmpeg/ffmpeg_8.0.bb
index 1e59bfa33fe..0970575b3ca 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg_8.0.bb
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_8.0.bb
@@ -177,3 +177,4 @@ CVE_STATUS_WRONG_CPE[status] = "fixed-version: these CVEs are fixed in used vers
 
 CVE_STATUS[CVE-2025-25468] = "fixed-version: these CVEs are fixed since v8.0"
 CVE_STATUS[CVE-2025-25469] = "fixed-version: these CVEs are fixed since v8.0"
+CVE_STATUS[CVE-2025-12343] = "fixed-version: this CVE are fixed since v8.0"

