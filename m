Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79EA4CC6B2F
	for <webhook@archiver.kernel.org>; Thu, 15 Oct 2026 05:04:02 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.32833.1792040640965798408
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Oct 2026 22:04:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=35u5iIxa;
 spf=pass (domain: smile.fr, ip: 209.85.221.54, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-48afcd7ba9bso2673348f8f.3
        for <openembedded-core@lists.openembedded.org>; Wed, 14 Oct 2026 22:04:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1792040639; x=1792645439; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=aIFwYNc678KJnlkYbpRpisPcJb4ITS/94wBbHg57a4s=;
        b=35u5iIxa7cczfoUopOZkOr+VQkAoub/tJgFfT1n+4kNSydR69PUAyyh+fqwUGuTlmX
         2BhYUOzHMUUcTHREyPkrxrBan12UZDz0NYG1UsaZTT1Dq28s5pH+B6hgchySty7scgVt
         +EgBvPS3WqJsBTrm53mC0PL1sjMyFwUUYj1g0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792040639; x=1792645439;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=aIFwYNc678KJnlkYbpRpisPcJb4ITS/94wBbHg57a4s=;
        b=VqkwfBYOghZqFHF5TJfpKLpORTGEWKgirdaGkX9E0tZzuFljr3cWpKbQr2cjlOsD2E
         20IIJnJo9KjuEaODNXkvYkORl0BOBSR16Fkb7sfK8TFDr75HrIPeZGOyuRO//DQcoeM4
         Kljf0aFb6s6h7sO76Z5ht2eYwGhZrKtzQ8WJaJXH7/1avPScQKkAKGPhTmrJDQzzVFs6
         KuxUrSNRz+PhgXRZxSJpmisVPJqgIY1Wj0rCT0/jrN9CTIMYSvJXmKVCXF7ty4CwbVi3
         1ECdyUnl3ZRVfM6b0g2FsGs0z8lxbZWctekRSOzVico0o50Sb7lrZxsy89genNWBlZ1M
         gxpw==
X-Gm-Message-State: AFq9FYLQ3GvgocnxJpvAlqhXnr0RfLBtle6T0fJ5C9WDs4aXWhIUEpPL
	qOmpd0wq51e5AUf1DQg4ewhZ4ge42GqxCS+GBjg7cx66mjV4XjNPU6dFagmYgl8zOBMnuHFzwyF
	aTjZfQhU=
X-Gm-Gg: AYBFou0r+LaEQaL6DMoL7RVM7KLu3SUzGEW+dvy/RtHpFmu9jyXbxelNnwXgLKV+5/p
	+WFKVwRb8NnwhRckENZ8HeKxSYlv2yCQRUVnaXN4yF/tyFuqdZq5+pSV+pfmX5PzDLlpXLEHsc/
	WqBjrXSj5+UGCWhN1PDPMvAOQw1dVwVtViGE60GIgN+BfCk102AQaFcm8yFEoVN2g59seUBqng0
	ZWVZokC97uSt9ElcbwXBqQo46qOZsz/SF+gQ17L1/oD8rXv6BfV3PPnmftfPaPpPIjG2f+In9T/
	E7D5JDLZHNoFt3+xP57v+BLIq7vpopc2ohlp9av5gK02sMvIK4asVeSt/+q0Nx+Iwj48WNfsBWI
	LmjVdlLsKpqYOjSFf3bWgI1Bsrqh65ZSTIJJ2/vAJdyozkvRQBmETfn4qniS2AxZFLeKnazuebx
	0fA3dUcdwuK9KOYetM23yZjU5BjEO4TyoxM4eyzWy0QVdPeU7NfmNxIcgbVUJrkmQvmKmyQlzQI
	3dOtWrbX6wztKfJ/ENnCWLJ1ydydtCRg4ZFMubq8cmOQkh6svdx1nc/xR/io+qZ+BO2+bbz3w==
X-Received: by 2002:a05:600d:4452:20b0:4a1:90d7:88a8 with SMTP id 5b1f17b1804b1-4a190d7891emr253140075e9.25.1792040639105;
        Wed, 14 Oct 2026 22:03:59 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1bd972aebsm46376245e9.1.2026.10.14.22.03.58
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 22:03:58 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 32/55] curl: ignore CVE-2026-8924
Date: Thu, 15 Oct 2026 07:02:55 +0200
Message-ID: <fb1a2f7a29d88b0ee0801dcbb3f129bb916bfc63.1792020605.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1792020605.git.yoann.congal@smile.fr>
References: <cover.1792020605.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Oct 2026 05:04:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247830

From: Devansh Patel <devanshp@cisco.com>

Analysis:
- curl identifies commit 51beed175dbfc37da3113f6acce60c630c070ce8 as
  the fix for trailing-dot domains bypassing the PSL cookie check. [1]
- The upstream fix changes is_public_suffix() and adds a regression test
  that requires PSL support. [2]
- Scarthgap curl 8.7.1 is configured with --without-libpsl, so the PSL
  check addressed by this fix is not built. [3]
- curl notes that builds without PSL cannot protect against overly broad
  cookies; this status describes the absent PSL check path. [1]
- Hence ignoring the CVE for now.

Reference:
[1] https://curl.se/docs/CVE-2026-8924.html
[2] https://github.com/curl/curl/commit/51beed175dbfc37da3113f6acce60c630c070ce8
[3] https://git.openembedded.org/openembedded-core/tree/meta/recipes-support/curl/curl_8.7.1.bb?h=scarthgap

Signed-off-by: Devansh Patel <devanshp@cisco.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-support/curl/curl_8.7.1.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-support/curl/curl_8.7.1.bb b/meta/recipes-support/curl/curl_8.7.1.bb
index 38083b58427..e361e6d6b13 100644
--- a/meta/recipes-support/curl/curl_8.7.1.bb
+++ b/meta/recipes-support/curl/curl_8.7.1.bb
@@ -58,6 +58,7 @@ CVE_STATUS[CVE-2024-32928] = "ignored: CURLOPT_SSL_VERIFYPEER was disabled on go
 CVE_STATUS[CVE-2025-0725] = "not-applicable-config: gzip decompression of content-encoded HTTP responses with the `CURLOPT_ACCEPT_ENCODING` option, using zlib 1.2.0.3 or older"
 CVE_STATUS[CVE-2025-5025] = "${@bb.utils.contains('PACKAGECONFIG', 'openssl', 'not-applicable-config: applicable only with wolfssl','unpatched',d)}"
 CVE_STATUS[CVE-2025-10966] = "${@bb.utils.contains('PACKAGECONFIG', 'openssl', 'not-applicable-config: applicable only with wolfssl','unpatched',d)}"
+CVE_STATUS[CVE-2026-8924] = "not-applicable-config: public suffix list support is disabled by the recipe with --without-libpsl"
 CVE_STATUS[CVE-2026-10536] = "${@bb.utils.contains('PACKAGECONFIG', 'nghttp2', 'unpatched', 'not-applicable-config: applicable only with HTTP/2', d)}"
 CVE_STATUS[CVE-2026-8458] = "${@bb.utils.contains('PACKAGECONFIG', 'krb5 negotiate-auth', 'unpatched', 'not-applicable-config: applicable only with GSS-API-backed Negotiate authentication', d)}"
 CVE_STATUS[CVE-2026-9547] = "not-applicable-config: vulnerable libssh backend is not enabled by the recipe"

