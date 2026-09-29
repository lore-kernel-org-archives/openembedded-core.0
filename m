Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96634CA5FA5
	for <webhook@archiver.kernel.org>; Tue, 29 Sep 2026 18:26:55 +0000 (UTC)
Received: from mta-64-226.siemens.flowmailer.net (mta-64-226.siemens.flowmailer.net [185.136.64.226])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3276.1790706413000270100
 for <openembedded-core@lists.openembedded.org>;
 Tue, 29 Sep 2026 11:26:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=UzCYRigT;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.226, mailfrom: fm-256628-202609291826510a072a66f600020783-94_izb@rts-flowmailer.siemens.com)
Received: by mta-64-226.siemens.flowmailer.net with ESMTPSA id 202609291826510a072a66f600020783
        for <openembedded-core@lists.openembedded.org>;
        Tue, 29 Sep 2026 20:26:51 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=t3LwIL5AVZTmk2Ma/v/iTbkNTdqc07bPBnM6r4Ue0F4=;
 b=UzCYRigTbDYEp+x8TmIdZ6bP7Hv5FztFkteerWQCYdfMyCylxH/GsNId1+TAHTJBRnh6Gh
 Z+1dcgNiS4oYm1tTACw4qjn+EWHx7AAEZqX8AkK/F+vZLdUqmW5S3flGn3YUJTJIBFrBz9sF
 f/x7lLjxF5VGzRPEkQcIa0dMtcpNpwMhctAfCJAmV6T2PS+artGq8UJPsvPH0l5sHbzFn0lF
 NA8zoO0Ip3N6Ee6LcKu/Q266PBx2apqiKWakYkhDm22XcG9rJiom5z6y6cILn+CzvAc1ehIY
 hqe3UN2uUeLlwURPQJQ6D+ry3wOEjg1vpZ8HCeXo6aYlIeD9oCJe/6qw==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [scarthgap][PATCH] openssl: upgrade 3.5.8 -> 3.5.9
Date: Tue, 29 Sep 2026 19:59:53 +0200
Message-ID: <20260929175953.3330782-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 29 Sep 2026 18:26:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246891

From: Peter Marko <peter.marko@siemens.com>

Release information [1]:

OpenSSL 3.5.9 is a security patch release. The most severe CVE fixed in this release is High.
This release incorporates the following bug fixes and mitigations:
* Fixed DTLS retransmissions of handshake messages from a stale buffer offset. (CVE-2026-84782)
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

[1] https://github.com/openssl/openssl/blob/openssl-3.5/NEWS.md#major-changes-between-openssl-358-and-openssl-359-29-sep-2026

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../openssl/{openssl_3.5.8.bb => openssl_3.5.9.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-connectivity/openssl/{openssl_3.5.8.bb => openssl_3.5.9.bb} (99%)

diff --git a/meta/recipes-connectivity/openssl/openssl_3.5.8.bb b/meta/recipes-connectivity/openssl/openssl_3.5.9.bb
similarity index 99%
rename from meta/recipes-connectivity/openssl/openssl_3.5.8.bb
rename to meta/recipes-connectivity/openssl/openssl_3.5.9.bb
index be52e228f10..ef806d0d984 100644
--- a/meta/recipes-connectivity/openssl/openssl_3.5.8.bb
+++ b/meta/recipes-connectivity/openssl/openssl_3.5.9.bb
@@ -19,7 +19,7 @@ SRC_URI:append:class-nativesdk = " \
            file://environment.d-openssl.sh \
            "
 
-SRC_URI[sha256sum] = "a8f84a39918ec6415ce765d9b429d313ba97b8143169c172e734b9514464f5b2"
+SRC_URI[sha256sum] = "603f5602e2eef00d77fbd429d34dcd5822bb301757a1bc9cdb24c670f1eb859a"
 
 inherit lib_package multilib_header multilib_script ptest perlnative manpages
 MULTILIB_SCRIPTS = "${PN}-bin:${bindir}/c_rehash"

