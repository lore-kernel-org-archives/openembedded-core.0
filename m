Return-Path: <tim.orling@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4A03CD5BD1
	for <webhook@archiver.kernel.org>; Mon,  1 Jun 2026 19:00:32 +0000 (UTC)
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6978.1780340427595197931
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Jun 2026 12:00:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=WMsYZQ1S;
 spf=pass (domain: konsulko.com, ip: 209.85.216.53, mailfrom: tim.orling@konsulko.com)
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-36d98b68d68so1113734a91.2
        for <openembedded-core@lists.openembedded.org>; Mon, 01 Jun 2026 12:00:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1780340427; x=1780945227; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ep2aAcibO7YWJGPAe2M8drvFk3A8AUiz4KKjlPTi2UA=;
        b=WMsYZQ1SFV/r6OtTk27wAnATSYPuCOHPmcOCTZsVUcIUUXgaaLoSRf3v0orrxBXQ9S
         4Mrm7kxnV+LgqsfFqyXFq3cj+456qQ+IHgmhc0SyvFzgEgwsHP5Nzm566NS4oixRKFAN
         0zxYHI+IWyytODQKNuXiguaUFX7idKWc08kHI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780340427; x=1780945227;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ep2aAcibO7YWJGPAe2M8drvFk3A8AUiz4KKjlPTi2UA=;
        b=NurrcI9bc+LnnFXk23hrrBaFQ4ocfr7ffOm3HMxZSZ2KNyG64nPqMNVSPh3/LbRmZL
         Tx6vj8wuPvrUI7Sk71aHfMoIF+62wEbJCITOgfubwWkBteQPH7AXtWgtsPKllrkr231y
         n6XoCPh+sUQjJO9IJQyxl6eJwSFlLwFOnYp4d0f7qRfXk6v0Lv648/D97ZUEjMCC70dc
         WJ62TTNF8dxdGOYtaX7g73xSRsm4jO+OVynnIBo90z8rz4X0MsjjLBGCja4XVSoo31QD
         cY6cezy/33wCPVOOmAz4h8DNDFo/m2GJtjfjXBvX0V4zZSmNJc3qTo8q8E8Zv/xSA871
         lyvA==
X-Gm-Message-State: AOJu0YzAjofBpxLFkoUE2LgMhMBl8uqVoWDaKIIITqNn42aPcc8LQZD0
	fFmZpAlXhM8WgDH/EE/TE0ZMwm2C+hRjeEO+zW8Y6KAruQQUdHYa5g77NzlOK0nkxFtcJPwmoBq
	r5s9R
X-Gm-Gg: Acq92OE/ZyN/A4KZfynH1tgwL0T5wNRB8N9PWz0VCCdEt6ojzBq2HOX5TVTL4XqC5NF
	9oaiSEaV/cdgtfuvojGr4moQ7zkTZjkSuCcS+zmIlSWL/PyxPEcT/gJPKzCPYVLh3bc/66JeI2J
	eYnSDH5YpAqm2b+zOr+kAmQqlBdekskSPHzTM7PQq9EvGrtJNYXQjaO4/Ln7yS57qoezdNs56T8
	q0x9+q6gRIR7bh9qNRZUZhOk/cFGK9Oyi70tRWtSCuKJUEXQgVhj8unLN5NlyX0n8+UiDtqpZAs
	OwG/xYZbmhUE1lxNWPUxz6sSRwtSk/wIM19vcxSWqLDa1B9Wsf1ULAv8j/+b4jN6aSe/CiR2IZ8
	rNE0MvuEK2Hj2eRVZevOixplF7NWi5veU2j46ZY0GvOcmCfW+WuHAqK6vjXiNsI0JvE5u7kVwSV
	90KIAUAPQkIDRtNKCVS3513q013GdvLSszjdMoueCdisRT+R3IUUnb0eNzR+kX6hMO2pJU5aov9
	w==
X-Received: by 2002:a05:6a20:da11:b0:3a3:add5:7bf7 with SMTP id adf61e73a8af0-3b428069746mr14162967637.23.1780340426306;
        Mon, 01 Jun 2026 12:00:26 -0700 (PDT)
Received: from localhost (c-98-232-159-17.hsd1.or.comcast.net. [98.232.159.17])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8423f419128sm6688401b3a.21.2026.06.01.12.00.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 12:00:25 -0700 (PDT)
From: tim.orling@konsulko.com
To: openembedded-core@lists.openembedded.org
Cc: Tim Orling <tim.orling@konsulko.com>
Subject: [PATCH v2] curl: upgrade 8.19.0 -> 8.20.0
Date: Mon,  1 Jun 2026 11:59:00 -0700
Message-ID: <20260601185900.294639-2-tim.orling@konsulko.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260531213732.3220315-2-tim.orling@konsulko.com>
References: <20260531213732.3220315-2-tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Jun 2026 19:00:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237985

From: Tim Orling <tim.orling@konsulko.com>

* Backport patch to avoid 100% CPU load:
  https://github.com/curl/curl/commit/2a2104f3cff44bb28bb570a093be52bbeeed8f23
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
Changes in v2:
Backport patch suggested by Ross Burton in patch review meeting

ptests still pass on qemux86-64 core-image-ptest-curl:
TESTDONE: 1897 tests were considered during 42 seconds.
TESTDONE: 928 tests out of 928 reported OK: 100%
DURATION: 43
END: /usr/lib/curl/ptest
2026-06-01T18:55
STOP: ptest-runner
TOTAL: 1 FAIL: 0

 .../0001-event-fix-wakeup-consumption.patch   | 39 +++++++++++++++++++
 .../curl/{curl_8.19.0.bb => curl_8.20.0.bb}   |  4 +-
 2 files changed, 41 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-support/curl/curl/0001-event-fix-wakeup-consumption.patch
 rename meta/recipes-support/curl/{curl_8.19.0.bb => curl_8.20.0.bb} (97%)

diff --git a/meta/recipes-support/curl/curl/0001-event-fix-wakeup-consumption.patch b/meta/recipes-support/curl/curl/0001-event-fix-wakeup-consumption.patch
new file mode 100644
index 0000000000..7f22e19c05
--- /dev/null
+++ b/meta/recipes-support/curl/curl/0001-event-fix-wakeup-consumption.patch
@@ -0,0 +1,39 @@
+From 590e31dff8aa4c5ff8be761128e38ac751aed875 Mon Sep 17 00:00:00 2001
+From: Stefan Eissing <stefan@eissing.org>
+Date: Mon, 11 May 2026 14:56:04 +0200
+Subject: [PATCH] event: fix wakeup consumption
+
+The events on a multi wakeup socketpair were only consumed via
+curl_multi_poll()/curl_multi_wait() but not in event based processing on
+a curl_multi_socket() call. That led to busy loops as reported in
+
+Fixes #21547
+Reported-by: Earnestly on github
+Closes #21549
+
+Upstream-Status: Backport ["2a2104f event: fix wakeup consumption"]
+Suggested-by: Ross Burton <ross.burton@arm.com>
+Signed-off-by: Tim Orling <tim.orling@konsulk.com>
+---
+ lib/multi.c | 5 +++++
+ 1 file changed, 5 insertions(+)
+
+diff --git a/lib/multi.c b/lib/multi.c
+index 7520253d70..a0012d8faf 100644
+--- a/lib/multi.c
++++ b/lib/multi.c
+@@ -2479,6 +2479,11 @@ static CURLMcode multi_runsingle(struct Curl_multi *multi,
+   Curl_uint32_bset_remove(&multi->dirty, data->mid);
+ 
+   if(data == multi->admin) {
++#ifdef ENABLE_WAKEUP
++    /* Consume any pending wakeup signals before processing.
++     * This is necessary for event based processing. See #21547 */
++    (void)Curl_wakeup_consume(multi->wakeup_pair, TRUE);
++#endif
+ #ifdef USE_RESOLV_THREADED
+     Curl_async_thrdd_multi_process(multi);
+ #endif
+-- 
+2.47.3
+
diff --git a/meta/recipes-support/curl/curl_8.19.0.bb b/meta/recipes-support/curl/curl_8.20.0.bb
similarity index 97%
rename from meta/recipes-support/curl/curl_8.19.0.bb
rename to meta/recipes-support/curl/curl_8.20.0.bb
index b9251336b8..0408657f40 100644
--- a/meta/recipes-support/curl/curl_8.19.0.bb
+++ b/meta/recipes-support/curl/curl_8.20.0.bb
@@ -14,13 +14,14 @@ SRC_URI = " \
     file://run-ptest \
     file://disable-tests \
     file://no-test-timeout.patch \
+    file://0001-event-fix-wakeup-consumption.patch \
 "
 
 SRC_URI:append:class-nativesdk = " \
     file://environment.d-curl.sh \
 "
 
-SRC_URI[sha256sum] = "4eb41489790d19e190d7ac7e18e82857cdd68af8f4e66b292ced562d333f11df"
+SRC_URI[sha256sum] = "63fe2dc148ba0ceae89922ef838f7e5c946272c2e78b7c59fab4b79d3ce2b896"
 
 # Curl has used many names over the years...
 CVE_PRODUCT = "haxx:curl haxx:libcurl curl:curl curl:libcurl libcurl:libcurl daniel_stenberg:curl"
@@ -63,7 +64,6 @@ PACKAGECONFIG[nghttp2] = "--with-nghttp2,--without-nghttp2,nghttp2"
 PACKAGECONFIG[openssl] = "--with-openssl,--without-openssl,openssl"
 PACKAGECONFIG[pop3] = "--enable-pop3,--disable-pop3,"
 PACKAGECONFIG[proxy] = "--enable-proxy,--disable-proxy,"
-PACKAGECONFIG[rtmpdump] = "--with-librtmp,--without-librtmp,rtmpdump"
 PACKAGECONFIG[rtsp] = "--enable-rtsp,--disable-rtsp,"
 PACKAGECONFIG[schannel] = "--with-schannel,--without-schannel,"
 PACKAGECONFIG[smb] = "--enable-smb,--disable-smb,"
-- 
2.43.0


