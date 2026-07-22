Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B02BC531C7
	for <webhook@archiver.kernel.org>; Wed, 22 Jul 2026 17:24:10 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5527.1784741046924850642
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Jul 2026 10:24:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=Jxj5dMrL;
 spf=pass (domain: smile.fr, ip: 209.85.128.48, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4954a9e8490so28732605e9.1
        for <openembedded-core@lists.openembedded.org>; Wed, 22 Jul 2026 10:24:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1784741045; x=1785345845; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=YeE4hTvZZE1z6dOCpnXSSFnb8hRh6l+8ObjSDf/O8DU=;
        b=Jxj5dMrLFHIKL0yOlsJuYnYuSEcILzYQEQFiPqKTpnkaP6jOU/yTBjju/XVcjpFd0d
         6HOZN+fbmFrjGRHK3onM5gjxS6QrcXJOQABfj5mgZ/gysjW1j4/WZoA28YaG5O+CjhIb
         NaaCQmfXn/XSrrRs6fih1AgI7e3HtD0m7JuJw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784741045; x=1785345845;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=YeE4hTvZZE1z6dOCpnXSSFnb8hRh6l+8ObjSDf/O8DU=;
        b=sPZofE62QiC8g6FGbYE6kgpC46j2aOvSF90CJ3gViBvuD7YE6LUNpjXU+NBPZkGLmk
         D/TKQNnT/VAOGk0XQwqWO7LTmiCvorRMmaz9qHviVTYz/7eqhNgS/nk2ws7ijs2jeBCn
         yI73Tu9GCBxdgpOYOoTs+Oe3fc/7D42ithJdTTDb5W3i+mOfErZM7WDKzwuQI6OLGWWY
         ldXFlmOHWmPiMkRoccKCg4yyKH5RLgrGSpOH0nDxP9Dyo9apteyrNHXe6LkcCHNfYNxv
         9soO6UhTDobKeNaEQXU0RF/EKKIKGdrzlxHhGYd9U17zGF8GOFD8H6+GbvKPEHglE68b
         7YZA==
X-Gm-Message-State: AOJu0YyCAQ9R3fLhVK5lIpcMkErBnJyLP5id4aO+FOfMrgAVI5sBOkjD
	hVsjDWLTja8etgmsXJGHuS8gdBsa0j01CtKmWdPiKkbr1FW2eLEgm+NFhZLp1Cq5ZQ5c6FTdrTR
	GuqXqeuo=
X-Gm-Gg: AR+sD122ULgaDZhC5KMf11i+87ifYixbmZ17Df3jRWtcpqOHQaTAF9HEC+9HilaiZ4S
	yxIfvVUWEi8Ri3VI51yqHEr/M3FLg4bKDFlojgd6TyuoOQgyHSKb8Mp6PCvHLB6O2fOTxUAa08y
	8vWTun9YTIBVrux67zEt0ZivA+MKmuMgD216ALa3tBBPiTseeAA7DYOBYxcjOV3GmTwu7Deobka
	Lzsqii48/v54FMGy0rDKuazxySmBWbXj0yCP5vu5kkxoA7pFcZbm+cGihMxhYrhuLEyOTx8FXlx
	rboueqznpyVBiQ60hyAewLVt4FHETr2JMenDqZ9hSwIqD4z+CX/N7GmFF36Euj4cWErXIrpMNwG
	MNACdKfdq/J0avzUesEX1fBx/v029oU1z4jqZ2li/4sqgRCirCc4qTZLcUeDEjmvGFcTY7Sd7Hm
	je5mFQrra7BCPKaRboV6MPNz+bzKzcqeiDUt65otCqt8PvIEowsb5B69Y2WbYsyuuumFI8ZbcWs
	sA5qHiF5h/tE0L+UEfyPX4=
X-Received: by 2002:a05:600c:3b98:b0:495:495f:bc30 with SMTP id 5b1f17b1804b1-4956a4fff26mr56334925e9.12.1784741045155;
        Wed, 22 Jul 2026 10:24:05 -0700 (PDT)
Received: from FRSMI25-LASER.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-495653c8760sm148275275e9.14.2026.07.22.10.24.04
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 10:24:04 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 13/27] curl: ignore CVE-2026-4873
Date: Wed, 22 Jul 2026 19:23:26 +0200
Message-ID: <3f4ccfb2028c1be88a5c82ea9df557150dd9e542.1784740870.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1784740870.git.yoann.congal@smile.fr>
References: <cover.1784740870.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Jul 2026 17:24:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241723

From: Deepak Rathore <deeratho@cisco.com>

- CVE-2026-4873 affects curl before 8.20.0 when a connection negotiated with
  clear-text IMAP, POP3, or SMTP can later be reused for a TLS-required
  transfer.
- In wrynose, these protocols are optional PACKAGECONFIG entries and are not
  enabled by default in curl_8.19.0.bb, so record this CVE as configuration-not-applicable
  for the default recipe configuration.

Reference:
- https://curl.se/docs/CVE-2026-4873.html
- https://nvd.nist.gov/vuln/detail/CVE-2026-4873

Signed-off-by: Deepak Rathore <deeratho@cisco.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-support/curl/curl_8.19.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-support/curl/curl_8.19.0.bb b/meta/recipes-support/curl/curl_8.19.0.bb
index 3326f478b5c..1cda69401bc 100644
--- a/meta/recipes-support/curl/curl_8.19.0.bb
+++ b/meta/recipes-support/curl/curl_8.19.0.bb
@@ -28,6 +28,7 @@ SRC_URI[sha256sum] = "4eb41489790d19e190d7ac7e18e82857cdd68af8f4e66b292ced562d33
 # Curl has used many names over the years...
 CVE_PRODUCT = "haxx:curl haxx:libcurl curl:curl curl:libcurl libcurl:libcurl daniel_stenberg:curl"
 CVE_STATUS[CVE-2024-32928] = "ignored: CURLOPT_SSL_VERIFYPEER was disabled on google cloud services causing a potential man in the middle attack"
+CVE_STATUS[CVE-2026-4873] = "${@bb.utils.contains_any('PACKAGECONFIG', 'imap pop3 smtp', 'unpatched', 'not-applicable-config: clear-text imap/pop3/smtp support is not enabled in PACKAGECONFIG', d)}"
 
 inherit autotools pkgconfig binconfig multilib_header ptest
 

