Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B93DBCCA460
	for <webhook@archiver.kernel.org>; Thu, 15 Oct 2026 05:03:51 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.32433.1792040622205823745
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Oct 2026 22:03:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=Uyo2GuFh;
 spf=pass (domain: smile.fr, ip: 209.85.128.52, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a022fee0caso45223835e9.1
        for <openembedded-core@lists.openembedded.org>; Wed, 14 Oct 2026 22:03:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1792040620; x=1792645420; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=gn8T8hURTa5YoXhAtWQQfQ0LZoYLpQuwnKOsFj/NQA0=;
        b=Uyo2GuFhecLpWrXHD/5qx5moLQzE5qYpX3kyet5Uq1KIUGK+pcqVb6ckCZ6PVBBuCw
         Fc+opGaHaWVzIhg87pTtu7CPI+PWbFwqjiP1blrbKe9qppF7+KjKo9IziJAdH223EzZy
         C0wtNKQSyxzJcv3zfLuS70M3TPX3+4U6QUg2M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792040620; x=1792645420;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=gn8T8hURTa5YoXhAtWQQfQ0LZoYLpQuwnKOsFj/NQA0=;
        b=fOEOpsXz1nVfzwZb6mX1tkUwmMGUTICUmwtDZvZY6f38IWLAwDPLxSbLqcYXnB72yL
         BRWwDWuNTTiMMJs3r8Ww4/W/SjMLbNwBr5XOMVD2fNkFnOT++3cB+Npe4ZVbbIPNJeyU
         qIUy2mA1WpeZKeZbJ2MsBNY3KzzOfmnuASXtduYTCBifh9jRjDjsmyGRf7cnRmFZNMP2
         w/IQIbfxSqYISf03YEImnboVybuP3tCgQTt7fLYd3z7UAZJboW0iPnejd8wH6/kDXKkb
         fEu9b/aTHt9vEqiq151KmTES1UwX6Iltg3tE8/q0pSETy6uB6bJuxooY96Aj/S092wyf
         k9Xg==
X-Gm-Message-State: AFq9FYL2TnfWPlKas6LKwarbLh9o3NCwXEHlZo+66s8OQcGIA2Wyyw4R
	9a0mejXB/rtv60KMwd1fuSrnDhZHO0eW6nZ8CNoqoqCyk2hjMBM89lrUjGfr5vXSsdUIuqQ7ULR
	Pez7IKGE=
X-Gm-Gg: AYBFou2kTWlAtadIV8NWR/zyODwGIkMW6GJVBYuDTNHNuqYHmpUGXBCYxVCDuCPx0lP
	F5TAUdDamN/fN+mWd3Uj0KJJpscXiSh4Hgyn5dyRr7TznFAlfhtl46Z3BeNvKDlmRBSXJaQQXjX
	I7n8ZP0OPMmatHsd8PsHBlKIg+Bhs6SqcDOye4pjMrAtuvaFc9tuRfPp/ClpM6d3TF3m2wvOdbM
	XJ5dFUwe/0VpxpKVAT9F8mQAm0TAcYzGtEMnkigrtijP1jDJiQcyr+Jv6EjX7+SwKvi1Yy90yyw
	SktlPYxbEeTcxNkJajY/uTejeJCZvDf6aZB7bJNitPsQnvwUilLh2DK/UtcdMCUgmBN5a1LqMEB
	vdU80sxoY2qPLiavQy0btyz5MzQTlbcCfX45YzxrnjJNoH0xnRZebHDWRuqlNPE57kAa+Wh9C2W
	t+0FyKCZOFa6FhxR5UcIX1CC3K2JA6pM6DwhdYWptQ2S5yJBMcCDK2I+CCyNgEPK3UHrJ25KlAg
	uQNsIPVwtxv0MXLNt0ffvmmOWM1zUjzWgkJImmvf7DA3wG3+owDZclrU7aN9HIki3IIs7lFWg==
X-Received: by 2002:a05:600c:609b:b0:4a1:83f0:7c91 with SMTP id 5b1f17b1804b1-4a18e4ca1dcmr341722095e9.18.1792040620322;
        Wed, 14 Oct 2026 22:03:40 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1bd972aebsm46376245e9.1.2026.10.14.22.03.39
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 22:03:39 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 05/55] gnutls: fix CVE-2026-42015
Date: Thu, 15 Oct 2026 07:02:28 +0200
Message-ID: <a069e8d76883bd23148b228eb6bac273ef3d01b7.1792020605.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1792020605.git.yoann.congal@smile.fr>
References: <cover.1792020605.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Oct 2026 05:03:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247803

From: Jakub Szczudlo (Nokia) <jakub.szczudlo@nokia.com>

Backport patch to fix CVE-2026-42015.

References:
  https://nvd.nist.gov/vuln/detail/CVE-2026-42015

Upstream fix:
  https://gitlab.com/gnutls/gnutls/-/commit/a3e7c50d3e1761e5ef1d4b225507cab8f2b2c3ca

Tested with ptest

Signed-off-by: Jakub Szczudlo <jakub.szczudlo@nokia.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../gnutls/gnutls/CVE-2026-42015.patch        | 43 +++++++++++++++++++
 meta/recipes-support/gnutls/gnutls_3.8.4.bb   |  1 +
 2 files changed, 44 insertions(+)
 create mode 100644 meta/recipes-support/gnutls/gnutls/CVE-2026-42015.patch

diff --git a/meta/recipes-support/gnutls/gnutls/CVE-2026-42015.patch b/meta/recipes-support/gnutls/gnutls/CVE-2026-42015.patch
new file mode 100644
index 00000000000..1a2065371d4
--- /dev/null
+++ b/meta/recipes-support/gnutls/gnutls/CVE-2026-42015.patch
@@ -0,0 +1,43 @@
+From a3e7c50d3e1761e5ef1d4b225507cab8f2b2c3ca Mon Sep 17 00:00:00 2001
+From: Alexander Sosedkin <asosedkin@redhat.com>
+Date: Mon, 20 Apr 2026 22:42:20 +0200
+Subject: [PATCH] x509/pkcs12_bag: fix off-by-one in bag element bounds check
+
+Appending elements to a PKCS#12 bag had a bounds check that
+prevented adding the 32nd element.
+On the other hand, it is possible to import one that already has 32.
+Subsequent appending then led to writing past the 32-element array,
+smashing its length.
+
+Tighten the check to reject any bag with 32 or more elements.
+
+We'll treat this vulnerability as a Low due to how contrived
+the requirements are: for the code to be vulnerable,
+it needs to append to an imported untrusted unencrypted PKCS#12 structure.
+
+Reported-by: Zou Dikai
+Fixes: #1840
+Fixes: CVE-2026-42015
+Fixes: GNUTLS-SA-2026-04-29-11
+CVSS: 6.1 Medium CVSS:3.1/AV:L/AC:L/PR:N/UI:R/S:U/C:N/I:L/A:H
+Severity: Low
+Signed-off-by: Alexander Sosedkin <asosedkin@redhat.com>
+
+CVE: CVE-2026-42015
+Upstream-Status: Backport [https://gitlab.com/gnutls/gnutls/-/commit/a3e7c50d3e1761e5ef1d4b225507cab8f2b2c3ca]
+
+Signed-off-by: Jakub Szczudlo <jakub.szczudlo@nokia.com>
+---
+diff --git a/lib/x509/pkcs12_bag.c b/lib/x509/pkcs12_bag.c
+index 911aeff..3822861 100644
+--- a/lib/x509/pkcs12_bag.c
++++ b/lib/x509/pkcs12_bag.c
+@@ -375,7 +375,7 @@ int gnutls_pkcs12_bag_set_data(gnutls_pkcs12_bag_t bag,
+ 		return GNUTLS_E_INVALID_REQUEST;
+ 	}
+ 
+-	if (bag->bag_elements == MAX_BAG_ELEMENTS - 1) {
++	if (bag->bag_elements >= MAX_BAG_ELEMENTS - 1) {
+ 		gnutls_assert();
+ 		/* bag is full */
+ 		return GNUTLS_E_MEMORY_ERROR;
diff --git a/meta/recipes-support/gnutls/gnutls_3.8.4.bb b/meta/recipes-support/gnutls/gnutls_3.8.4.bb
index 8f24f01fd34..bb9bc0af05d 100644
--- a/meta/recipes-support/gnutls/gnutls_3.8.4.bb
+++ b/meta/recipes-support/gnutls/gnutls_3.8.4.bb
@@ -59,6 +59,7 @@ SRC_URI = "https://www.gnupg.org/ftp/gcrypt/gnutls/v${SHRT_VER}/gnutls-${PV}.tar
            file://CVE-2026-42013-pre1.patch \
            file://CVE-2026-42013.patch \
            file://CVE-2026-42014.patch \
+           file://CVE-2026-42015.patch \
            "
 
 SRC_URI[sha256sum] = "2bea4e154794f3f00180fa2a5c51fe8b005ac7a31cd58bd44cdfa7f36ebc3a9b"

