Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 304C4103E2EA
	for <webhook@archiver.kernel.org>; Wed, 11 Mar 2026 22:46:13 +0000 (UTC)
Received: from mta-65-225.siemens.flowmailer.net (mta-65-225.siemens.flowmailer.net [185.136.65.225])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9308.1773269171563118597
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Mar 2026 15:46:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=aNuOXI0Z;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.225, mailfrom: fm-256628-202603112246097e45ca7bd900020701-fvhasy@rts-flowmailer.siemens.com)
Received: by mta-65-225.siemens.flowmailer.net with ESMTPSA id 202603112246097e45ca7bd900020701
        for <openembedded-core@lists.openembedded.org>;
        Wed, 11 Mar 2026 23:46:09 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=acYD91zVaB+jfkPQ/guVhmF2q+V5cFudJNwK4MoBKY0=;
 b=aNuOXI0ZWtnajtY5eJUikW7ou58Q7P8RiRlG4Z7Cs9tQBIfWnxLTXGNFwAt6og6w6W/D1n
 fIK6l7oJNd/dLKEgdDIY8RtluF7+9HRlk+7Kz83z5k171qmx3SKC/vamyHF55jyFkMtrc07X
 gC5UqxvFXvWADgzk9N0MSRUlRssgdNYEViow6Car273V3HHStXe0V03VEFMCkV2ryWNmOpFH
 zaxb1iRAjwabmneBj4m0umNNIG3wZHwPnCqRoSstidDbctrDXcGtma8Q5UoFHsIyHyS5gguJ
 INxuuCaWQ09yYhA3ShtLFzWPak2MRqfVWKdE7Fnz5ZLi4dqifqFqAx2A==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [PATCH] curl: upgrade 8.18.8 -> 8.19.0
Date: Wed, 11 Mar 2026 23:46:05 +0100
Message-Id: <20260311224605.3926560-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 11 Mar 2026 22:46:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232915

From: Peter Marko <peter.marko@siemens.com>

Solves CVE-2026-1965, CVE-2026-3783, CVE-2026-3784 and CVE-2026-3805.

Drop patch included in the release.

Release info [1]:

Changes:
* BUG-BOUNTY.md: we stop the bug-bounty end of Jan 2026
* cmake: add `CURL_BUILD_EVERYTHING` option
* mqtt: initial support for MQTTS
* tool: support fractions for --limit-rate and --max-filesize
* tool_cb_hdr: with -J, use the redirect name as a backup
* vquic: drop support for OpenSSL-QUIC
* windows: add build option to use the native CA store
* windows: bump minimum to Vista (from XP)
(and lot of bugfixes)

[1] https://curl.se/ch/8.19.0.html

License-Update: copyright years refreshed

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 ...ix-for-disable-aws-build-configurati.patch | 33 -------------------
 .../curl/{curl_8.18.0.bb => curl_8.19.0.bb}   |  5 ++-
 2 files changed, 2 insertions(+), 36 deletions(-)
 delete mode 100644 meta/recipes-support/curl/curl/0001-config2setopts-fix-for-disable-aws-build-configurati.patch
 rename meta/recipes-support/curl/{curl_8.18.0.bb => curl_8.19.0.bb} (96%)

diff --git a/meta/recipes-support/curl/curl/0001-config2setopts-fix-for-disable-aws-build-configurati.patch b/meta/recipes-support/curl/curl/0001-config2setopts-fix-for-disable-aws-build-configurati.patch
deleted file mode 100644
index 9294094ecf..0000000000
--- a/meta/recipes-support/curl/curl/0001-config2setopts-fix-for-disable-aws-build-configurati.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From a87f346189ffdc7559771c20961a7c294ed8ba5c Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Maksim=20=C5=9Aciepanienka?= <msciepanienka@gmail.com>
-Date: Tue, 20 Jan 2026 04:19:06 +0100
-Subject: [PATCH] config2setopts: fix for --disable-aws build configuration
-
-Closes #20368
-
-Upstream-Status: Backport [https://github.com/curl/curl/commit/a87f346189ffdc7559771c20961a7c294ed8ba5c]
-Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
----
- src/config2setopts.c | 4 +++-
- 1 file changed, 3 insertions(+), 1 deletion(-)
-
-diff --git a/src/config2setopts.c b/src/config2setopts.c
-index 5e1722c3ee..a023287834 100644
---- a/src/config2setopts.c
-+++ b/src/config2setopts.c
-@@ -486,12 +486,14 @@ static CURLcode ssl_setopts(struct OperationConfig *config, CURL *curl)
- /* only called for HTTP transfers */
- static CURLcode http_setopts(struct OperationConfig *config, CURL *curl)
- {
--  CURLcode result;
-+  CURLcode result = CURLE_OK;
-   long postRedir = 0;
- 
-   my_setopt_long(curl, CURLOPT_FOLLOWLOCATION, config->followlocation);
-   my_setopt_long(curl, CURLOPT_UNRESTRICTED_AUTH, config->unrestricted_auth);
-+#ifndef CURL_DISABLE_AWS
-   MY_SETOPT_STR(curl, CURLOPT_AWS_SIGV4, config->aws_sigv4);
-+#endif
-   my_setopt_long(curl, CURLOPT_AUTOREFERER, config->autoreferer);
- 
-   if(config->proxyheaders) {
diff --git a/meta/recipes-support/curl/curl_8.18.0.bb b/meta/recipes-support/curl/curl_8.19.0.bb
similarity index 96%
rename from meta/recipes-support/curl/curl_8.18.0.bb
rename to meta/recipes-support/curl/curl_8.19.0.bb
index a151a7be8c..ee9c90846d 100644
--- a/meta/recipes-support/curl/curl_8.18.0.bb
+++ b/meta/recipes-support/curl/curl_8.19.0.bb
@@ -7,21 +7,20 @@ HOMEPAGE = "https://curl.se/"
 BUGTRACKER = "https://github.com/curl/curl/issues"
 SECTION = "console/network"
 LICENSE = "curl"
-LIC_FILES_CHKSUM = "file://COPYING;md5=72f4e9890e99e68d77b7e40703d789b8"
+LIC_FILES_CHKSUM = "file://COPYING;md5=0515352b285b9c3f66464b135c9c0fdc"
 
 SRC_URI = " \
     https://curl.se/download/${BP}.tar.xz \
     file://run-ptest \
     file://disable-tests \
     file://no-test-timeout.patch \
-    file://0001-config2setopts-fix-for-disable-aws-build-configurati.patch \
 "
 
 SRC_URI:append:class-nativesdk = " \
     file://environment.d-curl.sh \
 "
 
-SRC_URI[sha256sum] = "40df79166e74aa20149365e11ee4c798a46ad57c34e4f68fd13100e2c9a91946"
+SRC_URI[sha256sum] = "4eb41489790d19e190d7ac7e18e82857cdd68af8f4e66b292ced562d333f11df"
 
 # Curl has used many names over the years...
 CVE_PRODUCT = "haxx:curl haxx:libcurl curl:curl curl:libcurl libcurl:libcurl daniel_stenberg:curl"

