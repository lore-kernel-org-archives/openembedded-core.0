Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E6BEC44502
	for <webhook@archiver.kernel.org>; Mon, 29 Jun 2026 14:20:38 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.38588.1782742831003118423
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Jun 2026 07:20:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=M74nrRdQ;
 spf=pass (domain: smile.fr, ip: 209.85.128.47, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4938d5f86f3so13282685e9.1
        for <openembedded-core@lists.openembedded.org>; Mon, 29 Jun 2026 07:20:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1782742829; x=1783347629; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rMourJBos371K0wOV3mBriAgNBa+4g9eD6xSAl3Hk4Y=;
        b=M74nrRdQrZEKwy3tfejyYUXdeFFcHlCQTQIAHaycEB3zA6PQTYuXI0wUEPPyYxYsgD
         AOFK5QWALU+bcWdLvH6mEGA+yKbg6rTy6metS1w52ugs7OjBnc4hjfz8Fmbeq72IVCu+
         32ZSBrDXHIBObqU7q0+1zewkLtsO3d0xP9vmo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782742829; x=1783347629;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=rMourJBos371K0wOV3mBriAgNBa+4g9eD6xSAl3Hk4Y=;
        b=rKwOWmn0IwMF3qVLvWR72tsBEwyzE4QTY5UNqeYXwMfh/xUKHiuDPzEb8hSgxD3FqC
         ImE0eFv+0+RpcsJBG4cvSMrJCB7xbuK8q28jE5jS9lDbC9QOJxjwy4Q/OIzk1aLaj7le
         F1TYPG8z6iouFBM0eLuRwzIuxwmr38068Yn8acKrfWZhAJ93p5Km6vJL0ZpbvG+mducN
         o/vdHAZoKQMiT7fIEu9C5t2jIDeVFaZSdFVyedFBSVL6Vi1jAWiw9NhK4YhiZFHNo0tJ
         sB18S1ENUQu2epWsv6fAgkK3EVWiFiBTkJwH9h10gdY2OYcWK3shQ19dQ37VNdDaiHpx
         gA4g==
X-Gm-Message-State: AOJu0YzZprPpNm8Zyu+LayaHlKeyAEsh1dIvKtms/XAq/nkyR1gAOhcQ
	9A++yq2PBsHKaEqvCIq4hpbsyS/ye2kPT7Yy5LWwQFwDIvzbd8KD2dMmLld/fVi2XrL1tLnrbQ6
	1tDrygis=
X-Gm-Gg: AfdE7cmzAvR0Z/ZvqTQBTACswoIZR//tMMHp6mbVmbaDXrGk9Vzw6P26GEB20JGslP8
	rdUNNFqrX1QIlE3OrBRD76bjIm1QInlyWsNzZWaQZd/wWp3H3qemA8bDQpxP6rc03JigG8x2Euo
	MNihSUFtlKGhqBY/TV2RMJlyjqu8ww8cZMgbispd4TthhxqWgRLj9XZsGTe8D1Wd26CYbeiL3z+
	o/CYgLsXBlFgnYsA/9mSo1JbHMubQoUAy+LifE6e6yL0fYdWJOCjYlN028piKmA3MfFERq9vxhz
	5CJQe75NyigDr7bs4nSl2UPDRqaXAdWcwM901VMUf+Q01QpsjHSAWxKy6dUoKJUI9YEbb/TPujc
	kBw+9g+MGR58U2dM1ODPVHKBvDZDR9vmVvQ3252CWiyrvW44BqhCp305uDjgf1oSiZ2PI58Sh33
	QRCkgdyocTT2RxYZyUZbHCWLWOMj8SpVq+n3PsENGWWx5OXkKyUKNh7uDcUoXtD/NpMjsO9CTbB
	RtLVP7o8w66ICaoezJ9y+U=
X-Received: by 2002:a05:600c:3e1a:b0:492:70c9:c50d with SMTP id 5b1f17b1804b1-49270c9c64fmr131106305e9.9.1782742829188;
        Mon, 29 Jun 2026 07:20:29 -0700 (PDT)
Received: from FRSMI25-LASER.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-46f8d6f10absm44958410f8f.5.2026.06.29.07.20.28
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 07:20:28 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 06/19] libsoup: fix for CVE-2026-2369
Date: Mon, 29 Jun 2026 16:19:51 +0200
Message-ID: <6ca4635dfe2c7fb277af3409931c66f7863af890.1782742373.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1782742373.git.yoann.congal@smile.fr>
References: <cover.1782742373.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 29 Jun 2026 14:20:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239794

From: Hitendra Prajapati <hprajapati@mvista.com>

Pick patch from [1] also mentioned at Debian report in [2]

[1] https://gitlab.gnome.org/GNOME/libsoup/-/commit/af4bde990270b825b7d110a495cc65de9e2ec32f
[2] https://security-tracker.debian.org/tracker/CVE-2026-2369

Note: Issue introduced by the fix for CVE-2025-32052.

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../libsoup/libsoup-3.4.4/CVE-2026-2369.patch | 32 +++++++++++++++++++
 meta/recipes-support/libsoup/libsoup_3.4.4.bb |  1 +
 2 files changed, 33 insertions(+)
 create mode 100644 meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2026-2369.patch

diff --git a/meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2026-2369.patch b/meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2026-2369.patch
new file mode 100644
index 00000000000..bee8a35323b
--- /dev/null
+++ b/meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2026-2369.patch
@@ -0,0 +1,32 @@
+From af4bde990270b825b7d110a495cc65de9e2ec32f Mon Sep 17 00:00:00 2001
+From: Samuel Dainard <>
+Date: Wed, 11 Feb 2026 10:19:04 -0600
+Subject: [PATCH] sniffer: Handle potential underflow
+
+Closes #498
+
+CVE: CVE-2026-2369
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libsoup/-/commit/af4bde990270b825b7d110a495cc65de9e2ec32f]
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ libsoup/content-sniffer/soup-content-sniffer.c | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/libsoup/content-sniffer/soup-content-sniffer.c b/libsoup/content-sniffer/soup-content-sniffer.c
+index a5e18d5..594d0bb 100644
+--- a/libsoup/content-sniffer/soup-content-sniffer.c
++++ b/libsoup/content-sniffer/soup-content-sniffer.c
+@@ -524,6 +524,10 @@ sniff_unknown (SoupContentSniffer *sniffer, GBytes *buffer,
+ 		if (!sniff_scriptable && type_row->scriptable)
+ 			continue;
+ 
++		/* Ensure we have data to sniff - prevents underflow in resource_length - 1 */
++		if (resource_length == 0)
++			continue;
++
+ 		if (type_row->has_ws) {
+ 			guint index_stream = 0;
+ 			guint index_pattern = 0;
+-- 
+2.50.1
+
diff --git a/meta/recipes-support/libsoup/libsoup_3.4.4.bb b/meta/recipes-support/libsoup/libsoup_3.4.4.bb
index 8fe3775e1e4..15164d940c1 100644
--- a/meta/recipes-support/libsoup/libsoup_3.4.4.bb
+++ b/meta/recipes-support/libsoup/libsoup_3.4.4.bb
@@ -52,6 +52,7 @@ SRC_URI = "${GNOME_MIRROR}/libsoup/${SHRT_VER}/libsoup-${PV}.tar.xz \
            file://CVE-2025-32049-3.patch \
            file://CVE-2025-32049-4.patch \
            file://CVE-2025-11021.patch \
+           file://CVE-2026-2369.patch \
 "
 SRC_URI[sha256sum] = "291c67725f36ed90ea43efff25064b69c5a2d1981488477c05c481a3b4b0c5aa"
 

