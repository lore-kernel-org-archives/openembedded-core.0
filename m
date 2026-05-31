Return-Path: <tim.orling@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15C3ECD6E57
	for <webhook@archiver.kernel.org>; Sun, 31 May 2026 21:40:28 +0000 (UTC)
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15336.1780263622923488923
 for <openembedded-core@lists.openembedded.org>;
 Sun, 31 May 2026 14:40:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=G5ugkVAh;
 spf=pass (domain: konsulko.com, ip: 209.85.215.177, mailfrom: tim.orling@konsulko.com)
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-c858014845aso605962a12.1
        for <openembedded-core@lists.openembedded.org>; Sun, 31 May 2026 14:40:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1780263622; x=1780868422; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TIdIR4wxiQgKYZtT+/m0uILScf6EGj1m/R4+dICj5gU=;
        b=G5ugkVAh6tt2dYu/fFZ2RAXRtX30vfV3nvU4FVgdxcVAmdH2OZ8ki5isxn2rpdyLor
         wWQl8Agy5WwnvER4+ycNyBL3fkusah288HFhSrjSOdc8tlOcujp6p3Qn5cFaF+9skB4m
         P/TBJH2lEUBFNtoVWMZqmgSDVV4ghoevexNkk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780263622; x=1780868422;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TIdIR4wxiQgKYZtT+/m0uILScf6EGj1m/R4+dICj5gU=;
        b=h9n88U9Dm1yT8CG3j2SzguG1cE3iBLK4q4fFsBKEQmVCTsY/xfOHhpfePcfPXwQIU7
         3Kn22htiBJYryVydPY1ChOPPL/klC4Ai5eI9YrF/Wn5niQDFIGfjXXSHu/INHH1KrkfP
         3ojiizBlKfEFDDYMGydKtKPP6bfD1RFOEGD5sBa4kJ+1WkBa1/JWCNfbgyK/AJAYlapS
         VsIJbXO1i7+vUxBZzUzBYX0Mqri3u+/+Z8fZvO4RRqz3Yeqci37erPPWM7Y76NbcGVrQ
         77JiTN9g/dd8n+rZ5h3VS0ynyyd4L19Va16ygBjhE2VVQ9zQFSXivuL3UrQmdTCXl7WP
         gj3w==
X-Gm-Message-State: AOJu0YxlrxWWCW5vZmK9NrdE+JmW4h0hpEC9JI0moWaRwMGSgMf2j7TK
	QIS+rjdVP+yrxRN9mxFCTPRWGcqRl72qB7WRIZP66eO/AJw5LnUIA6l/Mbu4gpoUNXLi1aU9KVt
	CuOEp
X-Gm-Gg: Acq92OEH3c5QckLhYGqIRqdMat2HcZVqIRv4xeg+fb5N8t3ll1zL+tpqueV2uxQr7f6
	hq8m72EbMdVItMgTxlij9HIplf2mep3ZtLfxcXgyreFexcW5nKjwnf3fWp0wFdvBQfg/3UiGUq1
	n4CGuq6eWqDuo6vldcP8KklDCgHOXR/0rLlJ3S9LF+YepUjBi9Wb6whgg6k8cgxH8WDeszR/9WS
	5fzsrA8VNrQCXFAW0Y51iQwhNE/LPZ1BqYW94xqsGHe5t31vtdnf1DAgLK/iqKD+9/pq+C7uLwv
	sRCMvxKNaCGqCJAaTL2m/5KB0uqVxtOrvy50ykMoJEniPHccYK/WZZ51u5PcveD4PE29/88Rdd8
	aE13Kz4v+He9g496v9H3OwvzL+IGSmyCAPLwMi/wygzqgpf/VjSsJQcipWwBNNCFpdrP2FW9CfA
	GOGkzr/Ni5Tt6YHxV5pSq3P6ZHcYk+g5T0Be2SIQR5Qy8jyrR++bUgrhFPwxaLenKl4YCDY6YfD
	g==
X-Received: by 2002:a05:6300:6ccf:10b0:3b4:640e:f6c7 with SMTP id adf61e73a8af0-3b4640ef991mr7637637.14.1780263622274;
        Sun, 31 May 2026 14:40:22 -0700 (PDT)
Received: from localhost (c-98-232-159-17.hsd1.or.comcast.net. [98.232.159.17])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-842596e63f4sm167139b3a.29.2026.05.31.14.40.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 May 2026 14:40:21 -0700 (PDT)
From: tim.orling@konsulko.com
To: openembedded-core@lists.openembedded.org
Cc: Tim Orling <tim.orling@konsulko.com>
Subject: [PATCH] curl: upgrade 8.19.0 -> 8.20.0
Date: Sun, 31 May 2026 14:37:33 -0700
Message-ID: <20260531213732.3220315-2-tim.orling@konsulko.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 31 May 2026 21:40:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237805

From: Tim Orling <tim.orling@konsulko.com>

* Remove PACKAGECONFIG[rtmpdump]:
  ceae02db04 rtmp: drop support

CVE: CVE-2026-4873
CVE: CVE-2026-5545
CVE: CVE-2026-5773
CVE: CVE-2026-6253
CVE: CVE-2026-6276
CVE: CVE-2026-6429
CVE: CVE-2026-7009
CVE: CVE-2026-7168

For changelog, see [1].
For full comparison of changes, see [2].

[1] https://curl.se/ch/8.20.0.html
[2] https://github.com/curl/curl/compare/curl-8_19_0...curl-8_20_0

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
All ptests pass on qemux86-64 for core-image-ptest-curl:

TESTDONE: 1897 tests were considered during 42 seconds.
TESTDONE: 928 tests out of 928 reported OK: 100%
DURATION: 43
END: /usr/lib/curl/ptest
2026-05-31T19:51
STOP: ptest-runner
TOTAL: 1 FAIL: 0

 meta/recipes-support/curl/{curl_8.19.0.bb => curl_8.20.0.bb} | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta/recipes-support/curl/{curl_8.19.0.bb => curl_8.20.0.bb} (97%)

diff --git a/meta/recipes-support/curl/curl_8.19.0.bb b/meta/recipes-support/curl/curl_8.20.0.bb
similarity index 97%
rename from meta/recipes-support/curl/curl_8.19.0.bb
rename to meta/recipes-support/curl/curl_8.20.0.bb
index b9251336b8..3cc278c053 100644
--- a/meta/recipes-support/curl/curl_8.19.0.bb
+++ b/meta/recipes-support/curl/curl_8.20.0.bb
@@ -20,7 +20,7 @@ SRC_URI:append:class-nativesdk = " \
     file://environment.d-curl.sh \
 "
 
-SRC_URI[sha256sum] = "4eb41489790d19e190d7ac7e18e82857cdd68af8f4e66b292ced562d333f11df"
+SRC_URI[sha256sum] = "63fe2dc148ba0ceae89922ef838f7e5c946272c2e78b7c59fab4b79d3ce2b896"
 
 # Curl has used many names over the years...
 CVE_PRODUCT = "haxx:curl haxx:libcurl curl:curl curl:libcurl libcurl:libcurl daniel_stenberg:curl"
@@ -63,7 +63,6 @@ PACKAGECONFIG[nghttp2] = "--with-nghttp2,--without-nghttp2,nghttp2"
 PACKAGECONFIG[openssl] = "--with-openssl,--without-openssl,openssl"
 PACKAGECONFIG[pop3] = "--enable-pop3,--disable-pop3,"
 PACKAGECONFIG[proxy] = "--enable-proxy,--disable-proxy,"
-PACKAGECONFIG[rtmpdump] = "--with-librtmp,--without-librtmp,rtmpdump"
 PACKAGECONFIG[rtsp] = "--enable-rtsp,--disable-rtsp,"
 PACKAGECONFIG[schannel] = "--with-schannel,--without-schannel,"
 PACKAGECONFIG[smb] = "--enable-smb,--disable-smb,"
-- 
2.43.0


