Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB156CA9ECA
	for <webhook@archiver.kernel.org>; Sun, 11 Oct 2026 08:41:28 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.23571.1791708080073430873
 for <openembedded-core@lists.openembedded.org>;
 Sun, 11 Oct 2026 01:41:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=N7w6FfUh;
 spf=pass (domain: smile.fr, ip: 209.85.221.43, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-48afe75f055so928571f8f.2
        for <openembedded-core@lists.openembedded.org>; Sun, 11 Oct 2026 01:41:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1791708078; x=1792312878; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ntD1fLOdn0QX9QZ+f6AwbMX9P7fN0nNHfIj79hhZQBU=;
        b=N7w6FfUhIdmwTPBPWiF1tmTY4qXWaYNmXcfzYRQd6oWt6CTE9En38Vd0pLosxohV/l
         spElNLYp8qTIrWcgra4z45nO0alEOteIiMengSxFQTTr5t0FOwoLpvtXpZeRinUdGlw/
         jIJnixVRMFqPcdkZjRRqqQvcwdFY5bAns2NGs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791708078; x=1792312878;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=ntD1fLOdn0QX9QZ+f6AwbMX9P7fN0nNHfIj79hhZQBU=;
        b=vld2ln5+lkTv1r7SxPn5A7GKKskYz2n1iRwUYyEILZGbsgc3EZ7DJVESU4l+YRKB7y
         ImaA/xuOHNcSbUz363mWWu5jn3pL0Mlfk68IJDcqeLRkSChWIOZfREuciklZsXkU+FQE
         blvqzycYp3r8/d+i/bjVb10E5YKK0hGwwczOPPb89RdDM0Xz07a62fQeJnXKlzOcqgUg
         cQo3EMSFEfb/7tJxdN7cUX421M/dh3xBvPKp3kdAEbTLF23x5IR51rG/YFSggKQFdFIq
         IQkTA6dmI0Ywh5ldek74mOpgkrY45exuauk7K4zf4+FMvCetCrp/VouUjFdwf++3oYym
         aX0A==
X-Gm-Message-State: AFq9FYIiA2UutsTUDEyWOB+itqcFNDptXZUaHPy9XQ34MRbR5/LciPbI
	pxidiEMd9eua2IyVQlZugWFhxhUflv3F+HGZZXG4b1cmIpm6Np8QLQoD5vUhNK16FJRoPS9pMt0
	7AplH79A=
X-Gm-Gg: AYBFou1Vq+N3dQ4vAsK9CoGElVqGH+N2P3mDDrpbGeEdiRESVwiQXkfxo/yd/KNoHjZ
	eN5hfrakbPNcnXMeiFUm32e2uQSRgpdhEwM8yIqE2kiq922zzHgTslaFFedJlpflsvsowMuHNK1
	O97Rj9KATMDiMJO5jutUuy0+n380s+RDKXAcH/VXbV32xqTLRQa7WunH05eZLPAsnivZG6oHuUQ
	Qg04UrhKkveH9/dpYJTz4kInk3U8FCR9JZwUFBMkGnvsoI5E3MeDKUN1CuYXFrYeZg+NFK5ZZrV
	OOpEnKWTRciMjUjRVOG41m4bqsFxumvR8BArCRfZl6pUYXNA+E5i9lvitTeQghZLjT7j3PP4UiT
	Fluqpc+sMQvjAmagq4feUTtO7maGM8U75VkTQXXgCntqiVynx6kSpL4/moR3eOegW0hPXRlHJc0
	w70mvgfN/H+A+E0yTIdT1fxwo2K3Ar+2O9EVOzyxUwdOAYEXE5qkEvqERouTkXJL4drbPNfxsvh
	+FP38ZzZfpAjI4Q9Cl5Xm8y9dKex7QhS1CnF/TJHx69duxDLM0T/+Ztqydpxov+XZzeJAeeJYet
	S6weA1jc
X-Received: by 2002:a5d:5590:0:b0:48c:6cdd:ba89 with SMTP id ffacd0b85a97d-48dbaaefa6emr8361571f8f.36.1791708078270;
        Sun, 11 Oct 2026 01:41:18 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48db9acfa28sm13481734f8f.51.2026.10.11.01.41.17
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 01:41:17 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 27/60] openssl: upgrade 3.5.8 -> 3.5.9
Date: Sun, 11 Oct 2026 10:40:00 +0200
Message-ID: <cc3c5d3c3f37cdc1db8f3fcaeb4d286f2e67cc46.1791707817.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1791707817.git.yoann.congal@smile.fr>
References: <cover.1791707817.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 11 Oct 2026 08:41:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247536

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
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../openssl/{openssl_3.5.8.bb => openssl_3.5.9.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-connectivity/openssl/{openssl_3.5.8.bb => openssl_3.5.9.bb} (99%)

diff --git a/meta/recipes-connectivity/openssl/openssl_3.5.8.bb b/meta/recipes-connectivity/openssl/openssl_3.5.9.bb
similarity index 99%
rename from meta/recipes-connectivity/openssl/openssl_3.5.8.bb
rename to meta/recipes-connectivity/openssl/openssl_3.5.9.bb
index 71446e62e31..06e25a61587 100644
--- a/meta/recipes-connectivity/openssl/openssl_3.5.8.bb
+++ b/meta/recipes-connectivity/openssl/openssl_3.5.9.bb
@@ -19,7 +19,7 @@ SRC_URI:append:class-nativesdk = " \
            file://environment.d-openssl.sh \
            "
 
-SRC_URI[sha256sum] = "a8f84a39918ec6415ce765d9b429d313ba97b8143169c172e734b9514464f5b2"
+SRC_URI[sha256sum] = "603f5602e2eef00d77fbd429d34dcd5822bb301757a1bc9cdb24c670f1eb859a"
 
 inherit lib_package multilib_header multilib_script ptest perlnative manpages
 MULTILIB_SCRIPTS = "${PN}-bin:${bindir}/c_rehash"

