Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15DD2C79F89
	for <webhook@archiver.kernel.org>; Mon,  7 Sep 2026 13:36:16 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.34947.1788788172823754870
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Sep 2026 06:36:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=me1qLNQA;
 spf=pass (domain: smile.fr, ip: 209.85.128.46, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-49cf4f81d86so28062615e9.2
        for <openembedded-core@lists.openembedded.org>; Mon, 07 Sep 2026 06:36:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1788788171; x=1789392971; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=B+vN2GVNUkGzAidY/yDE3Qqp+YMaxf+E2NrcvbjzwFc=;
        b=me1qLNQAg/ASnif2jVgoX1imDGfRjnUEfzouPWYQ/u2RGDr3SI4oKed9XK0cNb7zPp
         A37rG1CVbRNNB2DItNzh1KYd0qnUrX1tGlWvtPvE6/+KH8XVjnsvzVPDkfezUGyHnh5K
         j45tXgGuNZepiuawjgVHdBsqzT49Zl4qGOViE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788788171; x=1789392971;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=B+vN2GVNUkGzAidY/yDE3Qqp+YMaxf+E2NrcvbjzwFc=;
        b=XblNxHDTScNuev7AVfbYv6PR0iBxzPUeYdoGrB1OYK9VO6pJQYN7lcUPqxMMkl9o+X
         KhRmQ+17jm7wPl5gZER083HaBH7dz/w8t9wAQyd+paJQVAhM2pY3/1jLBmXVIhwhAXPe
         duF6diu4miFG7WnXxDvK8pdTMFIIIlYmHpgLRK/h6EKv121B9mIy+3Co4NjAG/9gFbnj
         w/Tplwmz382SbEbVeVVZvwSeble7Y8oDX+zHzK4Iib4CkbDsiPh62VdRhsOMfTRlw/iL
         GU6xcMboZPZ7QTP33Yj8lwn5lMaFvopn5AtDJjCewDJaCEkbGLKX61ytH/K50cGyvc0Q
         Jrwg==
X-Gm-Message-State: AFuF++kjSQjvfN6bnl4iiCZz4al+J8v9M1UdI1wijv9gR2dTiimXhELI
	wuV9JWKRZKNDrD8YvZS4+7h7W5EYLB/gMqdWMgvtBi6OXuM0zJICwykfi6SPS6+6oel4w/h0quO
	bT+mFsDg=
X-Gm-Gg: AYBFou1nRR+gB9xPhsDJDBpnEqs1D99ARUP5nGchbyXE8ghE3nAprAoLt8IEX2Gs5Hf
	vHBUVO+RGVCGeJzAv10baQ0Y1R5Z0CBg7n2x0MR5FuPGVgy0K0ANZvqivUyjxeaFXLh19Y84+BP
	mZdVQDq92tXaJY+nuw5MIp/fevvS8bJI+89uro99jLMLEJxX05wsVSIg4hwfrhQHedBNdQfwNgF
	Kft9xSN++Heuun382bMaA2jVWf6gMga+uw6TS5UKrW1hqtQf5RujS6K8WE4N1wgiz3prsk5h04g
	f/uNHIPIhOZp2x9yPvSfSFsqMBn8HOTBA79V+nLTZQIePqV2DJsZ6koaUh/P33rtjmM4PeK/mPm
	5tYyDW5VnnT3BxhH53FM8Y6rHZZiHQJlLL+BFKElkxkJfmVLalMGZVkAwsDjv2NXYi0xjTv3Pi/
	0xi2lTc6cos+jpfpzmXKxUGBcF0moeF5ADtlj6dP19ZDXME3cWJLqEfH6zH9LVIeH4pULKOO+CH
	RxboGVKX3AgepomkN8DwNI+m4fihHTU5Vclfj/cpg9SWOr3jpje6iYu6PSfToNU
X-Received: by 2002:a05:600c:190b:b0:49c:fc6c:be12 with SMTP id 5b1f17b1804b1-49cfc6cc0acmr175191675e9.24.1788788170992;
        Mon, 07 Sep 2026 06:36:10 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48588394fa1sm27523836f8f.8.2026.09.07.06.36.09
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 06:36:09 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 35/35] gnutls: Backport fix for CVE-2026-33846
Date: Mon,  7 Sep 2026 15:35:31 +0200
Message-ID: <5b4292b3fc1586709dcdc27d7cfa3d880e6f338a.1788787321.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1788787321.git.yoann.congal@smile.fr>
References: <cover.1788787321.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Sep 2026 13:36:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245292

From: Roland Kovacs <roland.kovacs@est.tech>

Backport patch [1] referenced in [2]. The difference in upstream and the backport
is skipping of intermediate patch [3] which essentially just aliases
`session->internals.handshake_recv_buffer -> recv_buf'.

NVD: https://nvd.nist.gov/vuln/detail/CVE-2026-33846

[1] https://gitlab.com/gnutls/gnutls/-/commit/65ab33fa54e34fba69d793735b7df3d383d1ff78
[2] https://security-tracker.debian.org/tracker/CVE-2026-33846
[3] https://gitlab.com/gnutls/gnutls/-/commit/9deffca528c23bbb218f5ec3bd4bb1bf4cbd1fc0

Signed-off-by: Roland Kovacs <roland.kovacs@est.tech>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../gnutls/gnutls/CVE-2026-33846.patch        | 66 +++++++++++++++++++
 meta/recipes-support/gnutls/gnutls_3.8.4.bb   |  1 +
 2 files changed, 67 insertions(+)
 create mode 100644 meta/recipes-support/gnutls/gnutls/CVE-2026-33846.patch

diff --git a/meta/recipes-support/gnutls/gnutls/CVE-2026-33846.patch b/meta/recipes-support/gnutls/gnutls/CVE-2026-33846.patch
new file mode 100644
index 00000000000..81c928c872a
--- /dev/null
+++ b/meta/recipes-support/gnutls/gnutls/CVE-2026-33846.patch
@@ -0,0 +1,66 @@
+From f83c50305b4186075aeea26c7d8d64fdad95f381 Mon Sep 17 00:00:00 2001
+From: Alexander Sosedkin <asosedkin@redhat.com>
+Date: Fri, 17 Apr 2026 18:21:36 +0200
+Subject: [PATCH] buffers: add more checks to DTLS reassembly
+
+Previously, gnutls didn't check that DTLS fragments claimed
+a consistent message_length value.
+Additionally, a crucial array size check was missing,
+enabling an attacker to cause a heap overwrite.
+The updated version rejects fragments with mismatching length
+and adds a missing boundary check.
+
+Reported-by: Haruto Kimura (Stella)
+Reported-by: Oscar Reparaz
+Reported-by: Zou Dikai
+Fixes: #1816
+Fixes: #1838
+Fixes: #1839
+Fixes: CVE-2026-33846
+Fixes: GNUTLS-SA-2026-04-29-1
+CVSS: 7.4 High CVSS:3.1/AV:N/AC:H/PR:N/UI:N/S:U/C:N/I:H/A:H
+CVSS: 7.5 High CVSS:3.1/AV:N/AC:L/PR:N/UI:N/S:U/C:N/I:N/A:H
+Signed-off-by: Alexander Sosedkin <asosedkin@redhat.com>
+
+CVE: CVE-2026-33846
+Upstream-Status: Backport [https://gitlab.com/gnutls/gnutls/-/commit/65ab33fa54e34fba69d793735b7df3d383d1ff78]
+Signed-off-by: Roland Kovacs <roland.kovacs@est.tech>
+---
+ lib/buffers.c | 21 +++++++++++++++++++++
+ 1 file changed, 21 insertions(+)
+
+diff --git a/lib/buffers.c b/lib/buffers.c
+index 672380b05..2934fd366 100644
+--- a/lib/buffers.c
++++ b/lib/buffers.c
+@@ -1009,6 +1009,27 @@ static int merge_handshake_packet(gnutls_session_t session,
+ 			&session->internals.handshake_recv_buffer[pos], hsk);
+ 
+ 	} else {
++		if (hsk->length !=
++			session->internals.handshake_recv_buffer[pos].length) {
++			/* inconsistent across fragments */
++			_gnutls_handshake_buffer_clear(hsk);
++			return gnutls_assert_val(
++				GNUTLS_E_UNEXPECTED_PACKET_LENGTH);
++		}
++		/* start_offset + data.length <= hsk->length <= max_length */
++		if (hsk->length < hsk->start_offset + hsk->data.length) {
++			/* impossible claims, overflow requested */
++			_gnutls_handshake_buffer_clear(hsk);
++			return gnutls_assert_val(
++				GNUTLS_E_UNEXPECTED_PACKET_LENGTH);
++		}
++		if (hsk->length >
++			session->internals.handshake_recv_buffer[pos].data.max_length) {
++			/* we don't have this much allocated, overflow guard */
++			_gnutls_handshake_buffer_clear(hsk);
++			return gnutls_assert_val(
++				GNUTLS_E_UNEXPECTED_PACKET_LENGTH);
++		}
+ 		if (hsk->start_offset <
+ 			    session->internals.handshake_recv_buffer[pos]
+ 				    .start_offset &&
+-- 
+2.47.3
+
diff --git a/meta/recipes-support/gnutls/gnutls_3.8.4.bb b/meta/recipes-support/gnutls/gnutls_3.8.4.bb
index 2d88bc181de..0aa1eef513f 100644
--- a/meta/recipes-support/gnutls/gnutls_3.8.4.bb
+++ b/meta/recipes-support/gnutls/gnutls_3.8.4.bb
@@ -49,6 +49,7 @@ SRC_URI = "https://www.gnupg.org/ftp/gcrypt/gnutls/v${SHRT_VER}/gnutls-${PV}.tar
            file://CVE-2026-42010.patch \
            file://CVE-2026-42011_p1.patch \
            file://CVE-2026-42011_p2.patch \
+           file://CVE-2026-33846.patch \
            "
 
 SRC_URI[sha256sum] = "2bea4e154794f3f00180fa2a5c51fe8b005ac7a31cd58bd44cdfa7f36ebc3a9b"

