Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1FAECAC5B8
	for <webhook@archiver.kernel.org>; Sun,  5 Oct 2025 11:19:09 +0000 (UTC)
Received: from mta-64-225.siemens.flowmailer.net (mta-64-225.siemens.flowmailer.net [185.136.64.225])
 by mx.groups.io with SMTP id smtpd.web11.8809.1759663144440486253
 for <openembedded-core@lists.openembedded.org>;
 Sun, 05 Oct 2025 04:19:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=Rq6MfCZj;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.225, mailfrom: fm-256628-20251005111901e90d7816c6000207dd-_ydv66@rts-flowmailer.siemens.com)
Received: by mta-64-225.siemens.flowmailer.net with ESMTPSA id 20251005111901e90d7816c6000207dd
        for <openembedded-core@lists.openembedded.org>;
        Sun, 05 Oct 2025 13:19:01 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=JNHnbsVfim8rH0VTimQETQ/ioZz9/r3xgtIR9PSfqnw=;
 b=Rq6MfCZjIeEMXeAaoFH0lerRt6es2hUKkiWKp6ukM0s14Qkzmff3o5Xv/8AEm5aYwE1Ouu
 jBCRdwo4zz1RgmBWz1UX9PUvQuYLSv0vPf1PKv6GOqan8eZKRgOtKIlJ9SUMdTKg0MUvR6t+
 KPd1WELPpqu6Y/1lf0OGawjJMkvl02WkQ0RRYyKgRobvh4tzKEFCaFoikraWFdfenp1eB8+n
 blbpCY5ZOYSfBTxm0/ZImF/0+c813CFlFYlz20/d5uDKJHJMsgztIU7VKDI/f3Xv5t237hxq
 aw0GgJKacD0RlN9BhFvGh5ha0sF6Ttt0T5dUWiJtkwjuKH7Ndmd3vQWQ==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][PATCH] openssl: upgrade 3.5.2 -> 3.5.4
Date: Sun,  5 Oct 2025 13:18:52 +0200
Message-Id: <20251005111852.7589-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 05 Oct 2025 11:19:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224434

From: Peter Marko <peter.marko@siemens.com>

Release information:
https://github.com/openssl/openssl/blob/openssl-3.5/NEWS.md#major-changes-between-openssl-353-and-openssl-354-30-sep-2025

OpenSSL 3.5.4 is a security patch release. The most severe CVE fixed in this release is Moderate.
This release incorporates the following bug fixes and mitigations:
* Fix Out-of-bounds read & write in RFC 3211 KEK Unwrap. (CVE-2025-9230)
* Fix Timing side-channel in SM2 algorithm on 64 bit ARM. (CVE-2025-9231)
* Fix Out-of-bounds read in HTTP client no_proxy handling. (CVE-2025-9232)
* Reverted the synthesised OPENSSL_VERSION_NUMBER change for the release builds, as it broke some exiting applications that relied on the previous 3.x semantics, as documented in OpenSSL_version(3).

Release information:
https://github.com/openssl/openssl/blob/openssl-3.5/NEWS.md#major-changes-between-openssl-352-and-openssl-353-16-sep-2025

OpenSSL 3.5.3 is a bug fix release.
This release incorporates the following bug fixes and mitigations:
* Added FIPS 140-3 PCT on DH key generation.
* Fixed the synthesised OPENSSL_VERSION_NUMBER.
* Removed PCT on key import in the FIPS provider as it is not required by the standard.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 ...1-buildinfo-strip-sysroot-and-debug-prefix-map-from-co.patch | 2 +-
 .../openssl/{openssl_3.5.2.bb => openssl_3.5.4.bb}              | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-connectivity/openssl/{openssl_3.5.2.bb => openssl_3.5.4.bb} (99%)

diff --git a/meta/recipes-connectivity/openssl/openssl/0001-buildinfo-strip-sysroot-and-debug-prefix-map-from-co.patch b/meta/recipes-connectivity/openssl/openssl/0001-buildinfo-strip-sysroot-and-debug-prefix-map-from-co.patch
index 687d682976a..dadc034c913 100644
--- a/meta/recipes-connectivity/openssl/openssl/0001-buildinfo-strip-sysroot-and-debug-prefix-map-from-co.patch
+++ b/meta/recipes-connectivity/openssl/openssl/0001-buildinfo-strip-sysroot-and-debug-prefix-map-from-co.patch
@@ -38,7 +38,7 @@ diff --git a/Configurations/unix-Makefile.tmpl b/Configurations/unix-Makefile.tm
 index 09303c4..011bda1 100644
 --- a/Configurations/unix-Makefile.tmpl
 +++ b/Configurations/unix-Makefile.tmpl
-@@ -502,13 +502,27 @@ BIN_LDFLAGS={- join(' ', $target{bin_lflags} || (),
+@@ -513,13 +513,27 @@ BIN_LDFLAGS={- join(' ', $target{bin_lflags} || (),
                           '$(CNF_LDFLAGS)', '$(LDFLAGS)') -}
  BIN_EX_LIBS=$(CNF_EX_LIBS) $(EX_LIBS)
  
diff --git a/meta/recipes-connectivity/openssl/openssl_3.5.2.bb b/meta/recipes-connectivity/openssl/openssl_3.5.4.bb
similarity index 99%
rename from meta/recipes-connectivity/openssl/openssl_3.5.2.bb
rename to meta/recipes-connectivity/openssl/openssl_3.5.4.bb
index 396e69d7e7f..c222b1533b9 100644
--- a/meta/recipes-connectivity/openssl/openssl_3.5.2.bb
+++ b/meta/recipes-connectivity/openssl/openssl_3.5.4.bb
@@ -18,7 +18,7 @@ SRC_URI:append:class-nativesdk = " \
            file://environment.d-openssl.sh \
            "
 
-SRC_URI[sha256sum] = "c53a47e5e441c930c3928cf7bf6fb00e5d129b630e0aa873b08258656e7345ec"
+SRC_URI[sha256sum] = "967311f84955316969bdb1d8d4b983718ef42338639c621ec4c34fddef355e99"
 
 inherit lib_package multilib_header multilib_script ptest perlnative manpages
 MULTILIB_SCRIPTS = "${PN}-bin:${bindir}/c_rehash"

