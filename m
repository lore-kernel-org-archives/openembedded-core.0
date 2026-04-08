Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8282FD5F7B
	for <webhook@archiver.kernel.org>; Wed,  8 Apr 2026 05:59:01 +0000 (UTC)
Received: from mta-64-225.siemens.flowmailer.net (mta-64-225.siemens.flowmailer.net [185.136.64.225])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.100065.1775627934268048647
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Apr 2026 22:58:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=XlC8hyKg;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.225, mailfrom: fm-256628-202604080558506ff4f71660000207a1-vqekvq@rts-flowmailer.siemens.com)
Received: by mta-64-225.siemens.flowmailer.net with ESMTPSA id 202604080558506ff4f71660000207a1
        for <openembedded-core@lists.openembedded.org>;
        Wed, 08 Apr 2026 07:58:51 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=QRbfktY1CFH8MVOXWlIywWJTdKlDEZKRVvlivW6SSLc=;
 b=XlC8hyKg8GaOtS6Z7tkXqfslm2OQFUVjfntYXk8+1gmDMXEdT/j/qWTGh8DQrG0ekfTold
 xrKWiP9Zzy9nvLLAu6mnWJcIlPOJQm7l0WLo3lJuGECQ5Auoeet4MftdjydWdfMi8NMz04/T
 36Pk/bLoo05pmHh6PMyMNmtVBlpfv23WpF3wbzkzErdkLUVRCSPrVju10bI7LFCGF9AM8OuL
 r3QBW88346/NMTqEAqyrlrOMfwHu4w/mQcFYWJCsb1kSsku6Ve/i7U1sN1zjl5NmdMMZhwWq
 2bBm7ijeX6rfgFF/rjYXeh+azBaypaEduyyMe2xuqHSIJIGau7kOovpQ==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [PATCH] openssl: upgrade 3.5.5 -> 3.5.6
Date: Wed,  8 Apr 2026 07:57:30 +0200
Message-ID: <20260408055730.4881-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Apr 2026 05:59:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234806

From: Peter Marko <peter.marko@siemens.com>

Release information [1]:

OpenSSL 3.5.6 is a security patch release. The most severe CVE fixed in this release is Medium.
This release incorporates the following bug fixes and mitigations:
* Fixed incorrect failure handling in RSA KEM RSASVE encapsulation. (CVE-2026-31790)
* Fixed loss of key agreement group tuple structure when the DEFAULT keyword is used in
  the server-side configuration of the key-agreement group list. (CVE-2026-2673)
* Fixed potential use-after-free in DANE client code. (CVE-2026-28387)
* Fixed NULL pointer dereference when processing a delta CRL. (CVE-2026-28388)
* Fixed possible NULL dereference when processing CMS KeyAgreeRecipientInfo. (CVE-2026-28389)
* Fixed possible NULL dereference when processing CMS KeyTransportRecipientInfo. (CVE-2026-28390)
* Fixed heap buffer overflow in hexadecimal conversion. (CVE-2026-31789)

[1] https://github.com/openssl/openssl/blob/openssl-3.5/NEWS.md#major-changes-between-openssl-355-and-openssl-356-7-apr-2026

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 ...1-buildinfo-strip-sysroot-and-debug-prefix-map-from-co.patch | 2 +-
 .../openssl/{openssl_3.5.5.bb => openssl_3.5.6.bb}              | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-connectivity/openssl/{openssl_3.5.5.bb => openssl_3.5.6.bb} (99%)

diff --git a/meta/recipes-connectivity/openssl/openssl/0001-buildinfo-strip-sysroot-and-debug-prefix-map-from-co.patch b/meta/recipes-connectivity/openssl/openssl/0001-buildinfo-strip-sysroot-and-debug-prefix-map-from-co.patch
index dadc034c91..bfbfedbd67 100644
--- a/meta/recipes-connectivity/openssl/openssl/0001-buildinfo-strip-sysroot-and-debug-prefix-map-from-co.patch
+++ b/meta/recipes-connectivity/openssl/openssl/0001-buildinfo-strip-sysroot-and-debug-prefix-map-from-co.patch
@@ -38,7 +38,7 @@ diff --git a/Configurations/unix-Makefile.tmpl b/Configurations/unix-Makefile.tm
 index 09303c4..011bda1 100644
 --- a/Configurations/unix-Makefile.tmpl
 +++ b/Configurations/unix-Makefile.tmpl
-@@ -513,13 +513,27 @@ BIN_LDFLAGS={- join(' ', $target{bin_lflags} || (),
+@@ -514,13 +514,27 @@ BIN_LDFLAGS={- join(' ', $target{bin_lflags} || (),
                           '$(CNF_LDFLAGS)', '$(LDFLAGS)') -}
  BIN_EX_LIBS=$(CNF_EX_LIBS) $(EX_LIBS)
  
diff --git a/meta/recipes-connectivity/openssl/openssl_3.5.5.bb b/meta/recipes-connectivity/openssl/openssl_3.5.6.bb
similarity index 99%
rename from meta/recipes-connectivity/openssl/openssl_3.5.5.bb
rename to meta/recipes-connectivity/openssl/openssl_3.5.6.bb
index 7799647415..6685654472 100644
--- a/meta/recipes-connectivity/openssl/openssl_3.5.5.bb
+++ b/meta/recipes-connectivity/openssl/openssl_3.5.6.bb
@@ -19,7 +19,7 @@ SRC_URI:append:class-nativesdk = " \
            file://environment.d-openssl.sh \
            "
 
-SRC_URI[sha256sum] = "b28c91532a8b65a1f983b4c28b7488174e4a01008e29ce8e69bd789f28bc2a89"
+SRC_URI[sha256sum] = "deae7c80cba99c4b4f940ecadb3c3338b13cb77418409238e57d7f31f2a3b736"
 
 inherit lib_package multilib_header multilib_script ptest perlnative manpages
 MULTILIB_SCRIPTS = "${PN}-bin:${bindir}/c_rehash"

