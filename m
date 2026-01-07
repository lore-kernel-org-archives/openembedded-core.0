Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE9DFCF6C0E
	for <webhook@archiver.kernel.org>; Wed,  7 Jan 2026 08:09:32 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1504.1767773368046265607
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Jan 2026 00:09:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=fdodgS6A;
 spf=pass (domain: smile.fr, ip: 209.85.128.50, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4779adb38d3so12362645e9.2
        for <openembedded-core@lists.openembedded.org>; Wed, 07 Jan 2026 00:09:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1767773366; x=1768378166; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=R2WvOF7r7UX7vWMO3ItDAEb6Uqh7ipgPh/UHkc93A3s=;
        b=fdodgS6AHTQn9yvNXsctW2B55sZXlChy7qXlJIoQB8x5My2AmmTuxQEV9v3/t0MV2g
         XPIGISEL0j+mZODISg+Gc7AqmyAJHs6ZhqqdKDh5jxErPfV5aa1Feg94vJ452Ys3kSfj
         JZwlujziJNdgh9HSqw/dqi4/R7Z4/l8Kio5i4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767773366; x=1768378166;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=R2WvOF7r7UX7vWMO3ItDAEb6Uqh7ipgPh/UHkc93A3s=;
        b=OYb1v2L6WnVUUQ8f3/1IlYZstGhA4K2jk727XIEByMrQWwfg5Uqgz3qAXSmlc6IhnA
         7+Os/uE/OB7VjYCSCsto54UsexhFY2xeVSdMcvm28XzwOiztf4Eiyv2jmptlt4T/ytw7
         1lhFJbPlfs6kW72wR44k5adKthahs0/e0wtN/KsuEh+ZxOpSfwuDXdtRyGFZ6YVaMuqz
         IUBFld1DkU5Ks0++6MNgeGkR+JZTFvODBimf53tuDPoYECHMbykWmc32O0Lzo8bYy6nD
         VxcpL9RQLQkWrWqs1lmjiddh37NZOP742F0oD8cvN5UKim0My1zUi7mqyITQMOE4Pxxv
         MSPw==
X-Gm-Message-State: AOJu0YzmvOYPInoCew4O7MKyFAbHrFUTwL0kAtNztnJR2ZKYo9Sh6c1u
	sm/mo+f/xz7LeUEVBGUp2+7aiJZaFIRFzqADcO8hjjE0qVqIMETMk52EEMBcXShD+JS3fNDenEr
	28BbP
X-Gm-Gg: AY/fxX6LLZrrRx2++AdtVXgKIuxFVSwNx+LdJLqqKDBCyolycyRAkNtD7CerJtQwHxV
	RmdljRHOqStabNJyoLFJa6mndshhBe1zyn7xB71w5pmJC3cujnGUGRkWTW0HPSOiNtayZstVrHC
	TN3bq0V+Rru9pYH37F52VYguPxIlL6iRAgyJKaAdCIQ2jaqTuTAZ41NGO726ZN0LufAnDZdVuQ9
	KJCjOm3+itjyvZ9YuopX0041C+twP4tSC98S6QvmWQadlKvYX+dtSCE25e+YjU5hRZ6+/6cfr1i
	qp0H5w/H/zXa3kuovmPSvFZNlF2gwBW92kzioP6q+EDfoqgt+ApEeFzEMSMXkJY3EBmzx6FP/Im
	OBXfjmmk+hBgV2TXi47lalrSGL+oIRalRLpjIB4aXgqH2GZR7viUAo3cn7MsjaMkAG8NKh+dr37
	DtshC9l1Tl+E+aEYJcfcSXKx1ocDyjr6I5N5Ink+FkD2T4+JTCxOsVRGiLKumUVFnPyjh0XyG6v
	eI9RR2FrfKFxBc=
X-Google-Smtp-Source: AGHT+IFivu7I0Xhmbz5uHth+5Ncd9qaDmNaQJJNtJdY+OKJpeyEvgtmWelGtwZsMOdfkHJZfyHYxkA==
X-Received: by 2002:a05:600c:1d0c:b0:471:700:f281 with SMTP id 5b1f17b1804b1-47d84b4093cmr15154885e9.25.1767773366023;
        Wed, 07 Jan 2026 00:09:26 -0800 (PST)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d8715b5f7sm6093485e9.4.2026.01.07.00.09.25
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jan 2026 00:09:25 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][whinlatter 06/11] libarchive: upgrade 3.8.3 -> 3.8.4
Date: Wed,  7 Jan 2026 09:08:55 +0100
Message-ID: <008b509528d4014ce0fe95bde63bc1aa744bcda1.1767772758.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1767772757.git.yoann.congal@smile.fr>
References: <cover.1767772757.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 07 Jan 2026 08:09:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228953

From: Peter Marko <peter.marko@siemens.com>

Handles CVE-2025-60753.

Release Notes [1]:
Libarchive 3.8.4 is a bugfix release.
Notable bugxies:
* bsdtar: Fix zero-length pattern issue (#2787)
* lib: Fix regression introduced in libarchive 3.8.2 when walking enterable but unreadable directories (#2797)
Full Changelog: [2]

[1] https://github.com/libarchive/libarchive/releases/tag/v3.8.4
[2] https://github.com/libarchive/libarchive/compare/v3.8.3...v3.8.4

(From OE-Core rev: 5479a5e6bcdebd2c5c6f1cbbe039243cf9fbc6b0)

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../libarchive/{libarchive_3.8.3.bb => libarchive_3.8.4.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/libarchive/{libarchive_3.8.3.bb => libarchive_3.8.4.bb} (96%)

diff --git a/meta/recipes-extended/libarchive/libarchive_3.8.3.bb b/meta/recipes-extended/libarchive/libarchive_3.8.4.bb
similarity index 96%
rename from meta/recipes-extended/libarchive/libarchive_3.8.3.bb
rename to meta/recipes-extended/libarchive/libarchive_3.8.4.bb
index e3706ba3bb..e89638f5c6 100644
--- a/meta/recipes-extended/libarchive/libarchive_3.8.3.bb
+++ b/meta/recipes-extended/libarchive/libarchive_3.8.4.bb
@@ -32,7 +32,7 @@ EXTRA_OECONF += "--enable-largefile --without-iconv"
 SRC_URI = "https://libarchive.org/downloads/libarchive-${PV}.tar.gz"
 UPSTREAM_CHECK_URI = "https://www.libarchive.org/"
 
-SRC_URI[sha256sum] = "a290c2d82bce7b806d1e5309558a7bd0ef39067a868f4622a0e32e71a4de8cb6"
+SRC_URI[sha256sum] = "b2c75b132a0ec43274d2867221befcb425034cd038e465afbfad09911abb1abb"
 
 inherit autotools update-alternatives pkgconfig
 

