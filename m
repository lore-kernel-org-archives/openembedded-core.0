Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 191F9CCFA1A
	for <webhook@archiver.kernel.org>; Tue, 11 Nov 2025 14:58:49 +0000 (UTC)
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.19308.1762873122545284723
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Nov 2025 06:58:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=m2BWvGZ8;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.46, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-3436d6ca17bso3508629a91.3
        for <openembedded-core@lists.openembedded.org>; Tue, 11 Nov 2025 06:58:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1762873122; x=1763477922; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yaGQ8K3Sf+eL8UJOWfx5m1LZznG5WArSRG9D+Eo0WSo=;
        b=m2BWvGZ8pQwsLP+nBmGj5m+8DTRiHuT53AM5CqbL2zXYZ8eVaTHkWcAuxb3gQD4tlu
         KnN4U4Awecsjs2MW4a0mdvXjsrnz2RZweGzbpDq1cZTxjJWaVgcnc8g8hmlFcaIEIymG
         +VM/tXgOiz/iFAMRGHepc4Dkhcf+Bohh3IZw5NCEY+ifI7pOXpdPujq+MS/HOJ9KKMtr
         XpYE9EFpHC2HYmaKyAFPaencSNIskLELF2gLKUzd8s4inDo+RLK8CBcqKisEBuCJ1OsX
         ZXSyZg0al4bu05r2QPf4eDd4X4oVnAWiTKfbIg/T2CfAe9ZyFyUcvIrPzGCBHkXGdoaZ
         uNpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762873122; x=1763477922;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=yaGQ8K3Sf+eL8UJOWfx5m1LZznG5WArSRG9D+Eo0WSo=;
        b=h9szpYp4Gt25ra0W87PwS7nm0RMxNt6ipQpaNt0Fc6wvEIEaYJwr3A3KXO55TaPy4H
         KoZf1ZfOBF7oJCoIdZdII/luCwTc1apy3hqQfofugf5jdqYxp23+89z8c+Wn59eH0Lm3
         vdxly+7YtyDCJtTfuhQR0H/n2r0ayC/hJvUk8sk2ipVRojrebVM3O2fViJo8R/+JDj8M
         1UPUn0h5MnLFA8/jqcPKojbVd28EGMuS48bOnmIRAYxCidXo2AdkIqMz3L8ty/1AQ/Zg
         vUEKz/8lef/HVCQs3vtaMRcakgIbe6zqiZ9POZGdaHyaPVWehd3JTyxn2l/gV4ubmXl0
         Yy6g==
X-Gm-Message-State: AOJu0YwptJFvfxvFFeY9b+/htIzgWCOtYxc/XYATCRT2NN3GVqv8lb1X
	kLo/OhQFi7UUziJHYU5+b8wae+ZYTbkftGitOS3eY7luYP2QJW6hBFAQlXAEYrQ7Jy6jh32hp8d
	lvqf/qMM=
X-Gm-Gg: ASbGnct7NWDOf7/uVXlvBboCoXipMwe/3AMm+h1ls1JCLmadPFYJgTa0ZKZraWO4bYJ
	w0GH8MaRlgUZY7cyr47SuLWemLFrpWtDYFinJS75I6ZM3j1rYr61sJpU5YyrFTB6PhKUBov8FgD
	SL8NqnEfP+XijD9FnLO72OFw1HGA6oxgR1DICfuYzCD3TI++7ahgyZ5IdCKjOkWGmNNmQxhG9f3
	acNFJqMu2lTqtBrUVc/9jkbI3yMx5MCxx15OaGM4Z74NH+PG9hEzFdztZv+XiD0NDUBGXiJ1SWC
	qjllProwAAQeLHIerXpc834XWnSTk6NqAvpmKcMA8lteLwKgfFV9A5yO/pLOYuqsvVMT7skUq/V
	ng2G5u1xFB4Uab2Eo5jqzZUR6E/+4eTjemzOhRycaslpb/MZ4S/J5O6FvTOJGVoMDFzY=
X-Google-Smtp-Source: AGHT+IEqzYuQALHYSYd97fr33zJMQioyKNAXazDSrpM5mVpxZKtvU6abG1Sybq10FgtHedRcnxAKIg==
X-Received: by 2002:a17:90b:1f8e:b0:340:a1a8:eb87 with SMTP id 98e67ed59e1d1-3436cd15b96mr16492948a91.35.1762873121824;
        Tue, 11 Nov 2025 06:58:41 -0800 (PST)
Received: from hexa.. ([2602:feb4:3b:2100:db6b:ed5a:7890:6b41])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-343685301f8sm11662588a91.5.2025.11.11.06.58.41
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Nov 2025 06:58:41 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 01/19] curl: ignore CVE-2025-10966
Date: Tue, 11 Nov 2025 06:58:09 -0800
Message-ID: <3de9b86c295c88005d4df53e5137bb09ea104ed0.1762872962.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1762872962.git.steve@sakoman.com>
References: <cover.1762872962.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Nov 2025 14:58:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226166

From: Peter Marko <peter.marko@siemens.com>

Per [1] this CVE applies only when wolfssl backed is used.
8.17.0 removed WolfSSL support completely.

[1] https://curl.se/docs/CVE-2025-10966.html

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-support/curl/curl_8.7.1.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-support/curl/curl_8.7.1.bb b/meta/recipes-support/curl/curl_8.7.1.bb
index 713d90a378..6c02746394 100644
--- a/meta/recipes-support/curl/curl_8.7.1.bb
+++ b/meta/recipes-support/curl/curl_8.7.1.bb
@@ -39,6 +39,7 @@ CVE_STATUS[CVE-2024-32928] = "ignored: CURLOPT_SSL_VERIFYPEER was disabled on go
 
 CVE_STATUS[CVE-2025-0725] = "not-applicable-config: gzip decompression of content-encoded HTTP responses with the `CURLOPT_ACCEPT_ENCODING` option, using zlib 1.2.0.3 or older"
 CVE_STATUS[CVE-2025-5025] = "${@bb.utils.contains('PACKAGECONFIG', 'openssl', 'not-applicable-config: applicable only with wolfssl','unpatched',d)}"
+CVE_STATUS[CVE-2025-10966] = "${@bb.utils.contains('PACKAGECONFIG', 'openssl', 'not-applicable-config: applicable only with wolfssl','unpatched',d)}"
 
 
 inherit autotools pkgconfig binconfig multilib_header ptest
-- 
2.43.0


