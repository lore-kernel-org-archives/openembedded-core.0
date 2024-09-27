Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA5CDFC619D
	for <webhook@archiver.kernel.org>; Fri, 27 Sep 2024 21:15:49 +0000 (UTC)
Received: from mta-65-226.siemens.flowmailer.net (mta-65-226.siemens.flowmailer.net [185.136.65.226])
 by mx.groups.io with SMTP id smtpd.web11.1790.1727471746506903097
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 Sep 2024 14:15:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=W77L+luQ;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.226, mailfrom: fm-256628-202409272115432f9cb1b2274f412772-ctoztg@rts-flowmailer.siemens.com)
Received: by mta-65-226.siemens.flowmailer.net with ESMTPSA id 202409272115432f9cb1b2274f412772
        for <openembedded-core@lists.openembedded.org>;
        Fri, 27 Sep 2024 23:15:44 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=NFYB45iGvpgiIzC3sfDmuibpOpoLjlhzrwdgnF7hzq8=;
 b=W77L+luQ2SuoPxn2L0TTjsuHUMYzcpAKgIc559xxpkTHLOnSGAHmGErBAiQ4uPWMLZKYTq
 yH6lmD/desGHz2cxA00RWMmUxJbhr7sgj+SFsSp5qZGBWCRc6272TsMs9mNSBbnvpYjHjfir
 8KqW5fTfgf1tvxG3DXxBjWIcjY31ivxSdBigOolZ2pXHYHCxeCnjUSyY5aRZ/G7lJeMkRDQv
 am1HJeFfEWCz4FRXObquw3f/fvX2hAkc1Knnh2490qZMXcM6o/ezN27+xzQBUMtSkw9amIT9
 HdyEqD+N7d6ZGC88AboTf3V8ePszYloi0w4c+Fx969ydyXnyJ6dEEv5g==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][PATCH] curl: Upgrade 8.9.1 -> 8.10.1
Date: Fri, 27 Sep 2024 23:14:55 +0200
Message-Id: <20240927211455.3560397-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 27 Sep 2024 21:15:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205041

From: Peter Marko <peter.marko@siemens.com>

resolves CVE-2024-8096

possibility to set random was removed in commit
https://github.com/curl/curl/commit/269fdd4c6ed5d837d57448ac977f6f300968df15

tests have new perl module dependency

removed backported patch present in new version

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 ...e-struct-so-that-first-apply-ignores.patch | 38 -------------------
 .../curl/{curl_8.9.1.bb => curl_8.10.1.bb}    | 10 ++---
 2 files changed, 3 insertions(+), 45 deletions(-)
 delete mode 100644 meta/recipes-support/curl/curl/0001-sigpipe-init-the-struct-so-that-first-apply-ignores.patch
 rename meta/recipes-support/curl/{curl_8.9.1.bb => curl_8.10.1.bb} (94%)

diff --git a/meta/recipes-support/curl/curl/0001-sigpipe-init-the-struct-so-that-first-apply-ignores.patch b/meta/recipes-support/curl/curl/0001-sigpipe-init-the-struct-so-that-first-apply-ignores.patch
deleted file mode 100644
index 15c69e1430..0000000000
--- a/meta/recipes-support/curl/curl/0001-sigpipe-init-the-struct-so-that-first-apply-ignores.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-From 3eec5afbd0b6377eca893c392569b2faf094d970 Mon Sep 17 00:00:00 2001
-From: Daniel Stenberg <daniel@haxx.se>
-Date: Mon, 5 Aug 2024 00:17:17 +0200
-Subject: [PATCH] sigpipe: init the struct so that first apply ignores
-
-Initializes 'no_signal' to TRUE, so that a call to sigpipe_apply() after
-init ignores the signal (unless CURLOPT_NOSIGNAL) is set.
-
-I have read the existing code multiple times now and I think it gets the
-initial state reversed this missing to ignore.
-
-Regression from 17e6f06ea37136c36d27
-
-Reported-by: Rasmus Thomsen
-Fixes #14344
-Closes #14390
-
-Upstream-Status: Backport [https://github.com/curl/curl/commit/3eec5afbd0b6377eca893c392569b2faf094d970]
-Signed-off-by: Robert Joslyn <robert.joslyn@redrectangle.org>
----
- lib/sigpipe.h | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/lib/sigpipe.h b/lib/sigpipe.h
-index b91a2f513..d78afd905 100644
---- a/lib/sigpipe.h
-+++ b/lib/sigpipe.h
-@@ -39,6 +39,7 @@ struct sigpipe_ignore {
- static void sigpipe_init(struct sigpipe_ignore *ig)
- {
-   memset(ig, 0, sizeof(*ig));
-+  ig->no_signal = TRUE;
- }
- 
- /*
--- 
-2.44.2
-
diff --git a/meta/recipes-support/curl/curl_8.9.1.bb b/meta/recipes-support/curl/curl_8.10.1.bb
similarity index 94%
rename from meta/recipes-support/curl/curl_8.9.1.bb
rename to meta/recipes-support/curl/curl_8.10.1.bb
index 745224929b..0252d4475e 100644
--- a/meta/recipes-support/curl/curl_8.9.1.bb
+++ b/meta/recipes-support/curl/curl_8.10.1.bb
@@ -14,9 +14,8 @@ SRC_URI = " \
     file://run-ptest \
     file://disable-tests \
     file://no-test-timeout.patch \
-    file://0001-sigpipe-init-the-struct-so-that-first-apply-ignores.patch \
 "
-SRC_URI[sha256sum] = "f292f6cc051d5bbabf725ef85d432dfeacc8711dd717ea97612ae590643801e5"
+SRC_URI[sha256sum] = "73a4b0e99596a09fa5924a4fb7e4b995a85fda0d18a2c02ab9cf134bebce04ee"
 
 # Curl has used many names over the years...
 CVE_PRODUCT = "haxx:curl haxx:libcurl curl:curl curl:libcurl libcurl:libcurl daniel_stenberg:curl"
@@ -24,10 +23,7 @@ CVE_STATUS[CVE-2024-32928] = "ignored: CURLOPT_SSL_VERIFYPEER was disabled on go
 
 inherit autotools pkgconfig binconfig multilib_header ptest
 
-# Entropy source for random PACKAGECONFIG option
-RANDOM ?= "/dev/urandom"
-
-COMMON_PACKAGECONFIG = "basic-auth bearer-auth digest-auth negotiate-auth openssl proxy random threaded-resolver verbose zlib"
+COMMON_PACKAGECONFIG = "basic-auth bearer-auth digest-auth negotiate-auth openssl proxy threaded-resolver verbose zlib"
 PACKAGECONFIG ??= "${COMMON_PACKAGECONFIG} ${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)} aws libidn"
 PACKAGECONFIG:class-native = "${COMMON_PACKAGECONFIG} ipv6"
 PACKAGECONFIG:class-nativesdk = "${COMMON_PACKAGECONFIG} ipv6"
@@ -61,7 +57,6 @@ PACKAGECONFIG[nghttp2] = "--with-nghttp2,--without-nghttp2,nghttp2"
 PACKAGECONFIG[openssl] = "--with-openssl,--without-openssl,openssl"
 PACKAGECONFIG[pop3] = "--enable-pop3,--disable-pop3,"
 PACKAGECONFIG[proxy] = "--enable-proxy,--disable-proxy,"
-PACKAGECONFIG[random] = "--with-random=${RANDOM},--without-random"
 PACKAGECONFIG[rtmpdump] = "--with-librtmp,--without-librtmp,rtmpdump"
 PACKAGECONFIG[rtsp] = "--enable-rtsp,--disable-rtsp,"
 PACKAGECONFIG[smb] = "--enable-smb,--disable-smb,"
@@ -132,6 +127,7 @@ RDEPENDS:${PN}-ptest += " \
 	perl-module-cwd \
 	perl-module-digest \
 	perl-module-digest-md5 \
+	perl-module-digest-sha \
 	perl-module-file-basename \
 	perl-module-file-spec \
 	perl-module-file-temp \
-- 
2.30.2


