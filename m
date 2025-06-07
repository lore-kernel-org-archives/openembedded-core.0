Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E061EC61CE8
	for <webhook@archiver.kernel.org>; Sat,  7 Jun 2025 21:35:23 +0000 (UTC)
Received: from mta-65-225.siemens.flowmailer.net (mta-65-225.siemens.flowmailer.net [185.136.65.225])
 by mx.groups.io with SMTP id smtpd.web10.26700.1749332109118203231
 for <openembedded-core@lists.openembedded.org>;
 Sat, 07 Jun 2025 14:35:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=CjTH26Fm;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.225, mailfrom: fm-256628-20250607213504763cdde0783722493b-wyoyps@rts-flowmailer.siemens.com)
Received: by mta-65-225.siemens.flowmailer.net with ESMTPSA id 20250607213504763cdde0783722493b
        for <openembedded-core@lists.openembedded.org>;
        Sat, 07 Jun 2025 23:35:05 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=mZu33c5Egmy9Qrv0h/CujJCXwCpRyniRQhP8W6yxvFY=;
 b=CjTH26Fm2zEtY/CvaqTI03WDUjSb6mejAk3JSCwAi3T9lyFzQ3CdE1nxi0DiVPdUQy+r47
 fbjBtt8sV4rbpmtoFKmz2CzYZC3K6NCTf/cbHe071pQgMglXQekHS2AX7kHp4xCGEu1otsBV
 K+RnmOUhdHpkjdUv379IvIZRRrAQeP8c+XhBFlEgRTiEChVF9lvaM/KbntNdbzeVEac+vaWr
 UlKUkl4JTPU0c24mal2lGAyT0fCVC9+bNSd/WXpUaE38SMSv0aB3jO+ziqG7a7DQxFHH1iPc
 QG+GLSp84czxeFFpPOwKrS7S86bB3o/UthT00A2X+fp0rWlr8zouRkwA==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [PATCH] curl: upgrade 8.12.1 -> 8.14.1
Date: Sat,  7 Jun 2025 23:34:17 +0200
Message-Id: <20250607213417.1831940-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 07 Jun 2025 21:35:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218205

From: Peter Marko <peter.marko@siemens.com>

Handle CVE-2025-4947 and CVE-2025-5025.

CVE-2025-5399 fixed in 8.14.1 was introduced only in 8.13.0, so Yocto
never had version vulnerable to it.

Rebase patches.

Add openssl-native dependency fo ptest to fix following error:

    Missing or broken 'openssl' tool. openssl 1.0.2+ is required.
    Without it, this script cannot generate the necessary certificates
    the curl test suite needs for all its TLS related tests. at
    ../../../curl-8.14.0/tests/certs/genserv.pl line 33.

Install curlinfo for tests required since 8.14.0
https://github.com/curl/curl/commit/7a1211d474afd4e36bfb39f2b870a418bce42138

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-support/curl/curl/no-test-timeout.patch       | 2 +-
 .../curl/{curl_8.12.1.bb => curl_8.14.1.bb}                | 7 ++++++-
 2 files changed, 7 insertions(+), 2 deletions(-)
 rename meta/recipes-support/curl/{curl_8.12.1.bb => curl_8.14.1.bb} (95%)

diff --git a/meta/recipes-support/curl/curl/no-test-timeout.patch b/meta/recipes-support/curl/curl/no-test-timeout.patch
index 677d177302..5b901a6fe9 100644
--- a/meta/recipes-support/curl/curl/no-test-timeout.patch
+++ b/meta/recipes-support/curl/curl/no-test-timeout.patch
@@ -14,7 +14,7 @@ diff --git a/tests/servers.pm b/tests/servers.pm
 index d4472d5..9999938 100644
 --- a/tests/servers.pm
 +++ b/tests/servers.pm
-@@ -123,7 +123,7 @@ my $sshdverstr;  # for socks server, ssh daemon version string
+@@ -124,7 +124,7 @@ my $sshdverstr;  # for socks server, ssh daemon version string
  my $sshderror;   # for socks server, ssh daemon version error
  my %doesntrun;    # servers that don't work, identified by pidfile
  my %PORT = (nolisten => 47); # port we use for a local non-listening service
diff --git a/meta/recipes-support/curl/curl_8.12.1.bb b/meta/recipes-support/curl/curl_8.14.1.bb
similarity index 95%
rename from meta/recipes-support/curl/curl_8.12.1.bb
rename to meta/recipes-support/curl/curl_8.14.1.bb
index 4192693da8..08ad9cdb17 100644
--- a/meta/recipes-support/curl/curl_8.12.1.bb
+++ b/meta/recipes-support/curl/curl_8.14.1.bb
@@ -20,7 +20,7 @@ SRC_URI:append:class-nativesdk = " \
            file://environment.d-curl.sh \
 "
 
-SRC_URI[sha256sum] = "0341f1ed97a26c811abaebd37d62b833956792b7607ea3f15d001613c76de202"
+SRC_URI[sha256sum] = "f4619a1e2474c4bbfedc88a7c2191209c8334b48fa1f4e53fd584cc12e9120dd"
 
 # Curl has used many names over the years...
 CVE_PRODUCT = "haxx:curl haxx:libcurl curl:curl curl:libcurl libcurl:libcurl daniel_stenberg:curl"
@@ -126,12 +126,17 @@ do_install_ptest() {
 		${B}/libtool --mode=install install ${B}/tests/server/$name ${D}${PTEST_PATH}/tests/server
 	done
 
+	install -d ${D}${PTEST_PATH}/src
+	install -m 755 ${B}/src/curlinfo ${D}${PTEST_PATH}/src
+
 	cp -r ${S}/tests/data ${D}${PTEST_PATH}/tests/
 
 	# More tests that we disable for automated QA as they're not reliable
 	cat ${UNPACKDIR}/disable-tests >>${D}${PTEST_PATH}/tests/data/DISABLED
 }
 
+DEPENDS:append:class-target = "${@bb.utils.contains('PTEST_ENABLED', '1', ' openssl-native', '', d)}"
+
 RDEPENDS:${PN}-ptest += " \
 	locale-base-en-us \
 	perl-module-b \

