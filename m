Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33925E77180
	for <webhook@archiver.kernel.org>; Wed, 11 Dec 2024 18:11:25 +0000 (UTC)
Received: from mta-65-225.siemens.flowmailer.net (mta-65-225.siemens.flowmailer.net [185.136.65.225])
 by mx.groups.io with SMTP id smtpd.web10.1504.1733940681123522959
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Dec 2024 10:11:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=iFaR8nd2;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.225, mailfrom: fm-256628-20241211181119171f1dc9566a77eb0e-xgq3tl@rts-flowmailer.siemens.com)
Received: by mta-65-225.siemens.flowmailer.net with ESMTPSA id 20241211181119171f1dc9566a77eb0e
        for <openembedded-core@lists.openembedded.org>;
        Wed, 11 Dec 2024 19:11:19 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=WXx9iuZ/K1gSCx2LfUv071kE5N/5YPj970YenIPeD/w=;
 b=iFaR8nd29QSfcnAi3Vu1UGkdcb7kQ8Z7F5F1DtwF06G9cAivU5p9DjAGfrne0d2uTLawmM
 /RTx80IDjI7s6rl+8RnKwHDZtq27FuY6C47brvC9P62aTAEXOCPkWSID7fYq+WplOcq9Ee50
 TbfSWcNVR5W23LXD1OQ2KAbEJOxgTtrnilrz6HBtCvKgWUka8+GaobWMeOGDX6/8GBswTakN
 chnK6TnG2pwx65PgvUscnpnChqRPIs3zBs3zbM9XC/7hFTCVb03jXAZOb9M6bOfpHf87FsRS
 Y/kdn/rHt/rL7qHsfo52kxLbDGFy3rGJttuklKw4TxO6BltBCAsMKAEw==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][PATCH 2/2] curl: upgrade 8.11.0 -> 8.11.1
Date: Wed, 11 Dec 2024 19:09:53 +0100
Message-Id: <20241211180953.3369248-3-peter.marko@siemens.com>
In-Reply-To: <20241211180953.3369248-1-peter.marko@siemens.com>
References: <20241211180953.3369248-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 11 Dec 2024 18:11:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208605

From: Peter Marko <peter.marko@siemens.com>

Bugfix release for 8.11.0 regressions.

Solves CVE-2024-11053

Drop patch which was done differently upstream.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 ...pc.in-drop-LDFLAGS-from-Libs.private.patch | 39 -------------------
 .../curl/{curl_8.11.0.bb => curl_8.11.1.bb}   |  3 +-
 2 files changed, 1 insertion(+), 41 deletions(-)
 delete mode 100644 meta/recipes-support/curl/curl/0001-libcurl.pc.in-drop-LDFLAGS-from-Libs.private.patch
 rename meta/recipes-support/curl/{curl_8.11.0.bb => curl_8.11.1.bb} (97%)

diff --git a/meta/recipes-support/curl/curl/0001-libcurl.pc.in-drop-LDFLAGS-from-Libs.private.patch b/meta/recipes-support/curl/curl/0001-libcurl.pc.in-drop-LDFLAGS-from-Libs.private.patch
deleted file mode 100644
index 79fc0b316e7..00000000000
--- a/meta/recipes-support/curl/curl/0001-libcurl.pc.in-drop-LDFLAGS-from-Libs.private.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From cfd5d794fdfcc12e386fdbb14161babf54d2a5ee Mon Sep 17 00:00:00 2001
-From: Peter Marko <peter.marko@siemens.com>
-Date: Sat, 9 Nov 2024 22:26:58 +0100
-Subject: [PATCH] libcurl.pc.in: drop LDFLAGS from Libs.private
-
-Stop passing linker flags to pkg-config.
-
-This was added in v8.11.0 with commit [1].
-There are several problems with this, especially:
-* user may want to link curl and application with different flags
-* user usually adds the same or similar flags in all components, so this
-  will double the flags when linking application
-* when building components in temporary directories, these directories
-  are preserved in pkg-config linker flags and are invalid when building
-  application
-
-[1] https://github.com/curl/curl/commit/9f56bb608ecfbb8978c6cb72a04d9e8b23162d82
-
-Upstream-Status: Submitted [https://github.com/curl/curl/pull/15533]
-Signed-off-by: Peter Marko <peter.marko@siemens.com>
----
- libcurl.pc.in | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/libcurl.pc.in b/libcurl.pc.in
-index 4c60a7ec7..7898dae35 100644
---- a/libcurl.pc.in
-+++ b/libcurl.pc.in
-@@ -36,6 +36,6 @@ Version: @CURLVERSION@
- Requires: @LIBCURL_PC_REQUIRES@
- Requires.private: @LIBCURL_PC_REQUIRES_PRIVATE@
- Libs: -L${libdir} -lcurl @LIBCURL_PC_LIBS@
--Libs.private: @LDFLAGS@ @LIBCURL_PC_LIBS_PRIVATE@
-+Libs.private: @LIBCURL_PC_LIBS_PRIVATE@
- Cflags: -I${includedir} @LIBCURL_PC_CFLAGS@
- Cflags.private: @LIBCURL_PC_CFLAGS_PRIVATE@
--- 
-2.30.2
-
diff --git a/meta/recipes-support/curl/curl_8.11.0.bb b/meta/recipes-support/curl/curl_8.11.1.bb
similarity index 97%
rename from meta/recipes-support/curl/curl_8.11.0.bb
rename to meta/recipes-support/curl/curl_8.11.1.bb
index a512aa443c8..b4d80e9643c 100644
--- a/meta/recipes-support/curl/curl_8.11.0.bb
+++ b/meta/recipes-support/curl/curl_8.11.1.bb
@@ -14,9 +14,8 @@ SRC_URI = " \
     file://run-ptest \
     file://disable-tests \
     file://no-test-timeout.patch \
-    file://0001-libcurl.pc.in-drop-LDFLAGS-from-Libs.private.patch \
 "
-SRC_URI[sha256sum] = "db59cf0d671ca6e7f5c2c5ec177084a33a79e04c97e71cf183a5cdea235054eb"
+SRC_URI[sha256sum] = "c7ca7db48b0909743eaef34250da02c19bc61d4f1dcedd6603f109409536ab56"
 
 # Curl has used many names over the years...
 CVE_PRODUCT = "haxx:curl haxx:libcurl curl:curl curl:libcurl libcurl:libcurl daniel_stenberg:curl"
-- 
2.30.2


