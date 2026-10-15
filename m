Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4622CC6B3F
	for <webhook@archiver.kernel.org>; Thu, 15 Oct 2026 05:03:51 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.32432.1792040621490125311
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Oct 2026 22:03:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=k9+ST6t1;
 spf=pass (domain: smile.fr, ip: 209.85.128.47, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a1698ea378so39096825e9.2
        for <openembedded-core@lists.openembedded.org>; Wed, 14 Oct 2026 22:03:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1792040620; x=1792645420; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=sUbQsXKsfLGDW4xc9jSZ1GqcpJilKp/qSja+SkRBrNQ=;
        b=k9+ST6t1meLLcXaUes084JnR1HkyxzGj/W1GpAPSXsWoJShqDmz0aDP0hHNAD4Zj3f
         4AlsiCYFTyBBDMM0AuuasJqXtQr2dOPdseUHHKOMivfKjgBHleTd39H4Nwn+YNypLvTw
         XvyI3Wda+7/N6qwIxttYB+sFD/uzavGL38AZo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792040620; x=1792645420;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=sUbQsXKsfLGDW4xc9jSZ1GqcpJilKp/qSja+SkRBrNQ=;
        b=ICHaem2CD5UQwB/DGw64ULCUF0EWJCidLYKdJwZjGasxnQp92EYV1am1Ignugte3/r
         SdTUMer8iPi+dmRugouhV6pofizAhieeRHbOLQrU0hi6tywY5r9mPndULdcqrSeSEysS
         UzuCsiQKEBfsRgRdeMmXjgpc17BBmqdiHUzceXhpec/r4cF0c7jomdgjBY5ArXrP89Ig
         V5u7cwitZtGkUIiTj64ukX8lhHYQGTpO5l/5DIyh5+irqEx1xqDPF2waY3YLvmRTngAO
         qXjtiy7+S8F3Iq2sEL8KbtuhtYlOh968s1KmaKvho7rszOfmS6OiO8Zy3oJSsHj/LXDP
         a85w==
X-Gm-Message-State: AFq9FYLfAQnkftrNY5gq9mnT2/mEXR4lcawJEMIkRI1kCWDd9nuHR9qR
	s2xXEsm9k6y6+EZKKd9gQnluNWHGup2uX3DwUxhNumjtyMwFk4YR4+Jd58GZIANj6Am15l7Zc2m
	LenkpY9E=
X-Gm-Gg: AYBFou3VFeE5mYTcZpEOIHQHCOa0OFbhibwKj0G91+oT/4JhCSJFrlWm5mbCtSjUPET
	ULtTF5ELr/35RtkpJQwWVFXILzogc1Xm1W6hun9tDI+FrIiBD0CBQ0x4eyqKaXmlEI2HfE57KJY
	Q3EaJorgXDvpaYGibLbAHE6dyl7fgYznuncAPMK1njtT5Uca5txVyqnXTtoUZq0poAoxYNPoHO0
	rHdideJSYCXzy8C46/ai0/Jqnkt47GVc0zIiik8rrMgegQVi0O6c6OcLGPHbhWC7SWH8MwxxMWf
	qTRVnu/kzXzvrdb8oiIx+kPTm2H0UGc4AVUa6eVN6Gre9R/3MfQY/S0SflbwZsX14yC8AnDaSpz
	W2vZX8u9p0DfgrLpjLgKQk+vElqQ2+hLmacjybN1+ZQcKxWc1Yu5PcGQ7zMj6G2wDFkKnyWgIjA
	pLEO3Wd8oYi9F1yii41YZFGTfQcl8/x9khnCIul5dSR38wCEjCru+WlGor3GWcQtCwBMb1y9wsj
	0oafrtfvUoLAX8R9STMgVXu0Xj97cnRVJHnfVfLH5AMMHmG1Z2MBgQ+1xAUUCEXUQEm7X+SNw==
X-Received: by 2002:a05:600c:8b78:b0:4a0:25d5:e853 with SMTP id 5b1f17b1804b1-4a18e4ddd99mr359519465e9.35.1792040618975;
        Wed, 14 Oct 2026 22:03:38 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1bd972aebsm46376245e9.1.2026.10.14.22.03.38
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 22:03:38 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 04/55] gnutls: fix CVE-2026-42014
Date: Thu, 15 Oct 2026 07:02:27 +0200
Message-ID: <c0720c7cba0df610de0c95aa61a3e535df503501.1792020605.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1792020605.git.yoann.congal@smile.fr>
References: <cover.1792020605.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Oct 2026 05:03:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247802

From: Jakub Szczudlo (Nokia) <jakub.szczudlo@nokia.com>

Backport patch to fix CVE-2026-42014.

References:
  https://nvd.nist.gov/vuln/detail/CVE-2026-42014

Upstream fix:
  https://gitlab.com/gnutls/gnutls/-/commit/3957f136e2ed23caf176a594b54b3827f5cef701

Tested with ptest

Signed-off-by: Jakub Szczudlo <jakub.szczudlo@nokia.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../gnutls/gnutls/CVE-2026-42014.patch        | 60 +++++++++++++++++++
 meta/recipes-support/gnutls/gnutls_3.8.4.bb   |  1 +
 2 files changed, 61 insertions(+)
 create mode 100644 meta/recipes-support/gnutls/gnutls/CVE-2026-42014.patch

diff --git a/meta/recipes-support/gnutls/gnutls/CVE-2026-42014.patch b/meta/recipes-support/gnutls/gnutls/CVE-2026-42014.patch
new file mode 100644
index 00000000000..7fd0c163f8a
--- /dev/null
+++ b/meta/recipes-support/gnutls/gnutls/CVE-2026-42014.patch
@@ -0,0 +1,60 @@
+From 3957f136e2ed23caf176a594b54b3827f5cef701 Mon Sep 17 00:00:00 2001
+From: Alexander Sosedkin <asosedkin@redhat.com>
+Date: Wed, 18 Mar 2026 18:19:06 +0100
+Subject: [PATCH] pkcs11_write: fix UAF and leak in gnutls_pkcs11_token_set_pin
+
+Changing Security Officer PIN with gnutls_pkcs11_token_set_pin() with
+oldpin == NULL for a token that lacks a protected authentication path
+led to a use-after-free.
+
+Reported-by: Luigino Camastra and Joshua Rogers of AISLE Research Team
+Fixes: #1766
+Fixes: #1809
+Fixes: CVE-2026-42014
+Fixes: GNUTLS-SA-2026-04-29-9
+CVSS: 4.0 Medium CVSS:3.1/AV:L/AC:L/PR:N/UI:N/S:U/C:N/I:N/A:L
+Signed-off-by: Alexander Sosedkin <asosedkin@redhat.com>
+
+CVE: CVE-2026-42014
+Upstream-Status: Backport [https://gitlab.com/gnutls/gnutls/-/commit/3957f136e2ed23caf176a594b54b3827f5cef701]
+
+Signed-off-by: Jakub Szczudlo <jakub.szczudlo@nokia.com>
+---
+diff --git a/lib/pkcs11_write.c b/lib/pkcs11_write.c
+index 961e1b9..9fe571e 100644
+--- a/lib/pkcs11_write.c
++++ b/lib/pkcs11_write.c
+@@ -1267,10 +1267,9 @@ int gnutls_pkcs11_token_set_pin(const char *token_url, const char *oldpin,
+ 		ses_flags = SESSION_WRITE | SESSION_LOGIN;
+ 
+ 	ret = pkcs11_open_session(&sinfo, NULL, info, ses_flags);
+-	p11_kit_uri_free(info);
+-
+ 	if (ret < 0) {
+ 		gnutls_assert();
++		p11_kit_uri_free(info);
+ 		return ret;
+ 	}
+ 
+@@ -1291,9 +1290,11 @@ int gnutls_pkcs11_token_set_pin(const char *token_url, const char *oldpin,
+ 		oldpin_size = L(oldpin);
+ 
+ 		if (!(sinfo.tinfo.flags & CKF_PROTECTED_AUTHENTICATION_PATH)) {
+-			if (newpin == NULL)
+-				return gnutls_assert_val(
++			if (newpin == NULL) {
++				ret = gnutls_assert_val(
+ 					GNUTLS_E_INVALID_REQUEST);
++				goto finish;
++			}
+ 
+ 			if (oldpin == NULL) {
+ 				struct pin_info_st pin_info;
+@@ -1325,6 +1326,7 @@ int gnutls_pkcs11_token_set_pin(const char *token_url, const char *oldpin,
+ 	ret = 0;
+ 
+ finish:
++	p11_kit_uri_free(info);
+ 	pkcs11_close_session(&sinfo);
+ 	return ret;
+ }
diff --git a/meta/recipes-support/gnutls/gnutls_3.8.4.bb b/meta/recipes-support/gnutls/gnutls_3.8.4.bb
index f85feb7dd2e..8f24f01fd34 100644
--- a/meta/recipes-support/gnutls/gnutls_3.8.4.bb
+++ b/meta/recipes-support/gnutls/gnutls_3.8.4.bb
@@ -58,6 +58,7 @@ SRC_URI = "https://www.gnupg.org/ftp/gcrypt/gnutls/v${SHRT_VER}/gnutls-${PV}.tar
            file://CVE-2026-42012.patch \
            file://CVE-2026-42013-pre1.patch \
            file://CVE-2026-42013.patch \
+           file://CVE-2026-42014.patch \
            "
 
 SRC_URI[sha256sum] = "2bea4e154794f3f00180fa2a5c51fe8b005ac7a31cd58bd44cdfa7f36ebc3a9b"

