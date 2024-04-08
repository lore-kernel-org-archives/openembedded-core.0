Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A2FACD1296
	for <webhook@archiver.kernel.org>; Mon,  8 Apr 2024 13:20:22 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web11.106449.1712582412912623973
 for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Apr 2024 06:20:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=UGnZAyO7;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.42, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-416664dbee1so6176045e9.0
        for <openembedded-core@lists.openembedded.org>; Mon, 08 Apr 2024 06:20:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1712582411; x=1713187211; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7Va8C/mgBFUQ8KUt8N1rkXFasU5hUXkd51+3KlVDl4E=;
        b=UGnZAyO7ij+UDZKdMrVngOGqEWa0zu7IjMEvt4l65NKNawMz968C4vZnclcFFWAuCW
         DhvhtqbUcS1HVv2gd9VjPMxgm6Aj4Dtu3QlAFld8jZBmFZxDwnpHYlBlYKfpeISmhPcL
         m9STtyZcmSiiGOWoGwJRw/t7Q/zUZG6EnAVLA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712582411; x=1713187211;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7Va8C/mgBFUQ8KUt8N1rkXFasU5hUXkd51+3KlVDl4E=;
        b=sRjw96TXkaVT+wQ9x8QPjtoTWj5vqw1yw3+MNfHXlii8QfrG6APg7sAbyTWglCQ/RC
         S7UsUyV9aJ6rNfCBs9QeEzUVbNRo2K9YFXKX0TFP9JXw7mlkm4HbBN5Vc2rSRcaaYQYI
         SK37LKT/NINxM9ACqUWzMOzqnOgWax2sYr8gcLdO4zGO60ELgmWVBqg4ceBXyqkgfAAY
         4SLyz6iya8VJXAPpVvuFC2Ujy9VM2+aVZzuJ14fg0BvApEjOPVPbRVTRGkZVB1zIkUy5
         DyssKbDivZkyYj1+n1Dso602ODy7o+czODQRvclHR680aY5hy4+eg11OCSjAyFaHcgy9
         XgsQ==
X-Gm-Message-State: AOJu0YzMe8uWyGcJIC5jFiR63OUaeq7hOa7+ss1kg9yk2wjcya2Iaa77
	dWl67tMWrOUiJt3C0ea6AsdgDb7iWfNUA/jXaq2ql6soNKAxJ7nZHvzDR3CrYolMyYYFXqP+6X8
	p
X-Google-Smtp-Source: AGHT+IH3ePh23c62L/cSlTmGQOo44XXM4Mqj3sS3ltKU7N4C5QjyO1/n0MM5HogJynHuVunAgLVL1w==
X-Received: by 2002:a05:600c:470d:b0:416:6adf:fe44 with SMTP id v13-20020a05600c470d00b004166adffe44mr2788808wmo.17.1712582411247;
        Mon, 08 Apr 2024 06:20:11 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:c0d5:82ce:9fe1:f44f])
        by smtp.gmail.com with ESMTPSA id hn3-20020a05600ca38300b004162b578d8bsm13139748wmb.1.2024.04.08.06.20.10
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Apr 2024 06:20:10 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/3] curl: Upgrade 8.6.0 -> 8.7.1
Date: Mon,  8 Apr 2024 14:20:08 +0100
Message-Id: <20240408132009.1763710-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240408132009.1763710-1-richard.purdie@linuxfoundation.org>
References: <20240408132009.1763710-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 08 Apr 2024 13:20:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198012

This includes 4 security fixes:

CVE-2024-2466 - TLS certificate check bypass with mbedTLS
CVE-2024-2398 - HTTP/2 push headers memory-leak
CVE-2024-2379 - QUIC certificate check bypass with wolfSSL
CVE-2024-2004 - Usage of disabled protocol

Along with many other changes, mostly bugfixes: https://curl.se/changes.html

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-support/curl/curl/no-test-timeout.patch  | 11 +++++++++--
 .../curl/{curl_8.6.0.bb => curl_8.7.1.bb}             |  2 +-
 2 files changed, 10 insertions(+), 3 deletions(-)
 rename meta/recipes-support/curl/{curl_8.6.0.bb => curl_8.7.1.bb} (98%)

diff --git a/meta/recipes-support/curl/curl/no-test-timeout.patch b/meta/recipes-support/curl/curl/no-test-timeout.patch
index b4cfe716db7..7122b6f0435 100644
--- a/meta/recipes-support/curl/curl/no-test-timeout.patch
+++ b/meta/recipes-support/curl/curl/no-test-timeout.patch
@@ -1,10 +1,17 @@
-Set the max-time timeout to 600 so the timeout is 10 minutes instead of 13 seconds.
+From 42cddb52e821cfc2f09f1974742714e5f2f1856e Mon Sep 17 00:00:00 2001
+From: Ross Burton <ross.burton@arm.com>
+Date: Fri, 15 Mar 2024 14:37:37 +0000
+Subject: [PATCH] Set the max-time timeout to 600 so the timeout is 10 minutes
+ instead of 13 seconds.
 
 Upstream-Status: Inappropriate
 Signed-off-by: Ross Burton <ross.burton@arm.com>
+---
+ tests/servers.pm | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/tests/servers.pm b/tests/servers.pm
-index d4472d509..aeab62c47 100644
+index d4472d5..9999938 100644
 --- a/tests/servers.pm
 +++ b/tests/servers.pm
 @@ -120,7 +120,7 @@ my $sshdverstr;  # for socks server, ssh daemon version string
diff --git a/meta/recipes-support/curl/curl_8.6.0.bb b/meta/recipes-support/curl/curl_8.7.1.bb
similarity index 98%
rename from meta/recipes-support/curl/curl_8.6.0.bb
rename to meta/recipes-support/curl/curl_8.7.1.bb
index 49ba0cb4a7e..c6654bbad6d 100644
--- a/meta/recipes-support/curl/curl_8.6.0.bb
+++ b/meta/recipes-support/curl/curl_8.7.1.bb
@@ -15,7 +15,7 @@ SRC_URI = " \
     file://disable-tests \
     file://no-test-timeout.patch \
 "
-SRC_URI[sha256sum] = "3ccd55d91af9516539df80625f818c734dc6f2ecf9bada33c76765e99121db15"
+SRC_URI[sha256sum] = "6fea2aac6a4610fbd0400afb0bcddbe7258a64c63f1f68e5855ebc0c659710cd"
 
 # Curl has used many names over the years...
 CVE_PRODUCT = "haxx:curl haxx:libcurl curl:curl curl:libcurl libcurl:libcurl daniel_stenberg:curl"
-- 
2.40.1


