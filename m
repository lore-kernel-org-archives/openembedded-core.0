Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3952CA5FA7
	for <webhook@archiver.kernel.org>; Tue, 29 Sep 2026 18:26:45 +0000 (UTC)
Received: from mta-64-225.siemens.flowmailer.net (mta-64-225.siemens.flowmailer.net [185.136.64.225])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3302.1790706394680706486
 for <openembedded-core@lists.openembedded.org>;
 Tue, 29 Sep 2026 11:26:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=edRxpi+q;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.225, mailfrom: fm-256628-202609291826311f13e004da0002077d-pm9crc@rts-flowmailer.siemens.com)
Received: by mta-64-225.siemens.flowmailer.net with ESMTPSA id 202609291826311f13e004da0002077d
        for <openembedded-core@lists.openembedded.org>;
        Tue, 29 Sep 2026 20:26:32 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=UdslbclyO8ijrvMVRT8cyXEdu+JeR9npI5BKsBJpFPs=;
 b=edRxpi+q2s3HI7jaJmgV+TD80YBSHEHChZ4/z7BTg2JuL0AdGA2IJIAtSJWtJGEaDU6ubR
 Yuf+Wuizy9PpT+gMgu3xvFRtODbrhg61pMYh5jRnZaI+GFbmA/g4XDKtlZqZGGZhkMbSyHWx
 FpPeWMg5ed+9jh3UeRoSIw7B5LhZX64uODGTKgvqFULzRULc9GNCJGyVxmJVpif/EVsqBlRa
 EpXqicjCMQYbXX8V3EwyiYCK57IeJLRWw/iKAeStbmcP24Inir9a43rLUfNcHvDmVIq4iNMy
 OcI57oNUC3iscW+7vVXWpUglVOfFXzA/G8Li8n/1nAuDTXaUZuveLvsw==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [PATCH] openssl: upgrade 4.0.2 -> 4.0.3
Date: Tue, 29 Sep 2026 19:54:41 +0200
Message-ID: <20260929175441.2999029-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 29 Sep 2026 18:26:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246889

From: Peter Marko <peter.marko@siemens.com>

Release information [1]:

OpenSSL 4.0.3 is a security patch release. The most severe CVE fixed in this release is High.
This release incorporates the following bug fixes and mitigations:
* Fixed DTLS retransmissions of handshake messages from a stale buffer offset. (CVE-2026-84782)
* Fixed a use-after-free in X.509 extension cache under concurrent use. (CVE-2026-84783)
* Fixed excessive memory allocation in relative CRLDP processing. (CVE-2026-35189)
* Fixed QUIC unvalidated amplification credit may be over-accounted. (CVE-2026-35191)
* Fixed potential CPU DoS via O(n^2) fragment reassembly in QUIC. (CVE-2026-42772)
* Fixed a timing side-channel in scalar multiplication for mon-NIST EC curves. (CVE-2026-54872)
* Fixed QUIC STREAM fragment metadata DoS. (CVE-2026-54873)
* Fixed non-constant-time SM2 scalar multiplication on ARM64 and RISC-V. (CVE-2026-54875)
* Fixed out-of-bounds access after SSL_set_SSL_CTX() during a handshake. (CVE-2026-72897)
* Fixed QUIC connection-level flow control was not enforced for streams. (CVE-2026-75804)
* Fixed a NULL pointer dereference in CMP client revocation response handling. (CVE-2026-75805)
* Fixed an unauthenticated and undersized DTLS 1.2 AEAD record causing DoS. (CVE-2026-75806)
* Fixed a timing side-channel in SM2 signature generation. (CVE-2026-77696)
* Fixed an unbounded RETIRE_CONNECTION_ID backlog in QUIC stack implementation. (CVE-2026-84784)
* Fixed a bug where EVP_DecryptFinal() incorrectly reported a stale success on AES-SIV authentication failure.
* Fixed a regression in base64 encoding BIO filter introduced in OpenSSL 4.0, where incomplete writes down
  the BIO chain may result in the loss of encoded base64 data.

[1] https://github.com/openssl/openssl/blob/openssl-4.0/NEWS.md#major-changes-between-openssl-402-and-openssl-403-29-sep-2026

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../openssl/{openssl_4.0.2.bb => openssl_4.0.3.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-connectivity/openssl/{openssl_4.0.2.bb => openssl_4.0.3.bb} (99%)

diff --git a/meta/recipes-connectivity/openssl/openssl_4.0.2.bb b/meta/recipes-connectivity/openssl/openssl_4.0.3.bb
similarity index 99%
rename from meta/recipes-connectivity/openssl/openssl_4.0.2.bb
rename to meta/recipes-connectivity/openssl/openssl_4.0.3.bb
index bb58c27fbc..122bf61f59 100644
--- a/meta/recipes-connectivity/openssl/openssl_4.0.2.bb
+++ b/meta/recipes-connectivity/openssl/openssl_4.0.3.bb
@@ -18,7 +18,7 @@ SRC_URI:append:class-nativesdk = " \
            file://environment.d-openssl.sh \
            "
 
-SRC_URI[sha256sum] = "736b467530f916737b7031310ccb21d8218c6229e61e8e160cd1d3458cd543a8"
+SRC_URI[sha256sum] = "325b5c806167c13b40b1ffeadfe0248197c00eccc4cf123ec1e28d2d2fd216d9"
 
 inherit lib_package multilib_header ptest perlnative manpages
 

