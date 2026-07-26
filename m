Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27119C54F50
	for <webhook@archiver.kernel.org>; Sun, 26 Jul 2026 08:30:33 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7149.1785054624597975336
 for <openembedded-core@lists.openembedded.org>;
 Sun, 26 Jul 2026 01:30:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=g1DNM4X1;
 spf=pass (domain: smile.fr, ip: 209.85.128.50, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-49550ec592cso17330825e9.0
        for <openembedded-core@lists.openembedded.org>; Sun, 26 Jul 2026 01:30:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1785054623; x=1785659423; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=QqtCAIPnnYO0cq/IU7Ir7Gk6NgzmGizJs0CRYuWp4Pc=;
        b=g1DNM4X1ZSa4UsGGnhAuRJJshBerhLXD39/l6jVD8EvhBvP0D2u3FhiXDpflxO1bQ+
         wi7jG5ywVdiBzNpluP9vripoBTHWKWWCYZF1IsDvhMyCHgLe169Pcy95ZMEI8IaQe719
         PESEcAqCCC0grVDjYmlDaAf+1gVuL5XDp0kk4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785054623; x=1785659423;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=QqtCAIPnnYO0cq/IU7Ir7Gk6NgzmGizJs0CRYuWp4Pc=;
        b=Z9NEJDD/sYBkYopGhHJ7TFM2zniYariOhVD46IP1x2hGHkeTwC0PCB83XL3dW9ssBL
         4eTfJtj1RsZfgfp3QQZ0tIdIYpfXg38lydxBfTp8HfWm4Yy6v08xKrISmIiJirdp7z+E
         jE305zFMsCpoiPjhHLoC1+5qHQjYSwU2cixzjG8OqQj/f/7m2J70Lyt/wvLOd20lG9y8
         V3UGdxJAuuqXijMOh6OG0o4roAV+NGrylFltJ53Ai55vRmfYIT3U5MiQcYo21oxQX0e8
         axdjRi17egpNxCWf7Mh+s030PUo+dPC6Ba+ml92ytdXI0ZPNpGKKswfGjxfYsy4hZFSZ
         ikGQ==
X-Gm-Message-State: AOJu0YyENkf2ds3cv2jrNy9oDqHcMwih3X0SoShkhAeizGQDAEdLrRgM
	x4GT7OIF9PPRwkjSYSXibh9LgHVHXBnzChzISh7/dZtOUfdUTxiInb8uNWtpOnIHLspnwks7QKw
	RCmRFT3E=
X-Gm-Gg: AR+sD13MGaqMu6v6AO9d1qX1P8fsZu7XeTXjsVsQnsENygMBJYfuVXGQ62dgKQR75tz
	IYKO7ry1IjWeRtN5fUI6d7ir0yaCbR/KQJiiICYzMX5aadtsjUbCZf1oRj96XxdmYvL/Qhvs7Mo
	kzr4n0U6Nc9GODK3Q75vu72y+CaBkGUY9TsiR8mCe7L676bn8apNPaUHixEp8gor3Xpjy7iLd1A
	C45hE5V9A/clUivVOAnEkUh639/DZb2Tvc+6ZZgAMZtLIGWaHZ4IdwBHF5e2XqpVrVHY/HfFheJ
	wHLGdGfZp+098qk0IOx53905EwdkcJ4teUMGjSShfBgwMSWbuZRRxoR/YPyDqDvaXy4w88ywshF
	VlUW/pR02GxBFAQ2IE1oOKmK7irFJJ45uSLyMLcA7X05iCqjJ4+D/xSAnq3yTSNdLNMqZHT+sY4
	UpDYzCcVuLibhQgq2yNqjvGZ47LSpI101e1ceNvt+K1cFSGhKJdmOTxIP27NhpNTNoKFIv14SBY
	1Vd7A==
X-Received: by 2002:a05:600c:3150:b0:495:4f84:7280 with SMTP id 5b1f17b1804b1-496b5b3b1d4mr58204125e9.4.1785054622798;
        Sun, 26 Jul 2026 01:30:22 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-496b4f24a93sm142482505e9.11.2026.07.26.01.30.22
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jul 2026 01:30:22 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 22/31] gnutls: set status for CVE-2026-3832
Date: Sun, 26 Jul 2026 10:29:46 +0200
Message-ID: <e07d9d20c8c53b21b57f824a8ea471cb4657e717.1785054430.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1785054429.git.yoann.congal@smile.fr>
References: <cover.1785054429.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 26 Jul 2026 08:30:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242004

From: Sudhir Dumbhare <sudumbha@cisco.com>

Analysis:
  - CVE-2026-3832 affects GnuTLS OCSP multi-record response handling.
  - The vulnerable OCSP response handling code was introduced in GnuTLS 3.8.8.
  - This vulnerable code is not present in the current GnuTLS 3.8.4.
  - Hence ignoring the CVE for this version.

Reference:
https://nvd.nist.gov/vuln/detail/CVE-2026-3832
https://security-tracker.debian.org/tracker/CVE-2026-3832
https://gitlab.com/gnutls/gnutls/-/issues/1801

Signed-off-by: Sudhir Dumbhare <sudumbha@cisco.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-support/gnutls/gnutls_3.8.4.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-support/gnutls/gnutls_3.8.4.bb b/meta/recipes-support/gnutls/gnutls_3.8.4.bb
index ccb6a2b4b2d..6d43c58df27 100644
--- a/meta/recipes-support/gnutls/gnutls_3.8.4.bb
+++ b/meta/recipes-support/gnutls/gnutls_3.8.4.bb
@@ -124,3 +124,5 @@ pkg_postinst_ontarget:${PN}-fips () {
         ${bindir}/fipshmac ${libdir}/libhogweed.so.6.* > ${libdir}/.libhogweed.so.6.hmac
     fi
 }
+
+CVE_STATUS[CVE-2026-3832] = "fixed-version: vulnerable multi-record OCSP response handling was introduced in 3.8.8 and is not present in 3.8.4"

