Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 044E6CC6B3A
	for <webhook@archiver.kernel.org>; Thu, 15 Oct 2026 05:04:14 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.32844.1792040648098877134
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Oct 2026 22:04:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=c4AMOjpx;
 spf=pass (domain: smile.fr, ip: 209.85.128.49, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a1b07c3c5fso14743595e9.1
        for <openembedded-core@lists.openembedded.org>; Wed, 14 Oct 2026 22:04:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1792040646; x=1792645446; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=QE1ePBcHWgbo47U7xlPB6ZRfPi9VOSJ7fOE/tIKj3I8=;
        b=c4AMOjpx6/dzj9PQMudClQ8lozhMWsVf1Rn/2DRlVEjbOWVStJdmw0dZiOH3bPQO1e
         1j267zO2FyL86vYeubOy/zySGwIUSTPH8VBaeFGPimyXnTxjs+uGTBsVKh0TpJqC8b29
         PzD+aQ4fdKz6NiCjKydjef/zrvhSb7u7umDM4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792040646; x=1792645446;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=QE1ePBcHWgbo47U7xlPB6ZRfPi9VOSJ7fOE/tIKj3I8=;
        b=1khhoS/rEEVIuQoteLdhDOyiVgI1JXZaITJf175kapHykDSHOqEwje1M9yLxNNDyOg
         2ECpkhHto4G0D7T7XC+MiJjbEeM1Qb++kB+xoXx1xeWYQCyaNNQmi6rlOX2Hi5I1EyKG
         6o1Rv0+NeCYs275EFX0+yfCYNL4+VJN9I3OaXZwsgzNVIfK7jZ9JGZ6vMOlo1El1EmRg
         QT3+QzeabkxVlWEkGSCy0cUy/JJe9bwhA6Mb33wNAihg0USpoONZhlOl4yVkkrJGNI9S
         Q6AP/ATXzcoOqFs8VukA4oZycZvw2iR9qoo9btvGM2+EYLfCRmJPpMTrsEIeL6lBLkLa
         k89g==
X-Gm-Message-State: AFq9FYIhu/oEZOyzX9VZLLihweMmWDjjeI7Yl43oHlxouu14QKT2GIXL
	IHVEAr2yi3qsYA7uxms9fKOGr0L1nFfi3537VxX8A/6ae0oqMLjj1O15xE0Y4zNGvUj7r3ZNCzd
	azsBt0GU=
X-Gm-Gg: AYBFou25CqXIf7IpB/SDawRL+wYAPCwPnq8vUkFrrbg18UwgjqSTJXOrpbNI9viRFvT
	Tbdpw4mA6eIpUWhpexR5/A/VOsRDYM5xM94j5TlwPSiYhF+JK4T8aDByjTQ1cp86oTi9t1wTxV8
	lPioL+/8G18MXzbgeG405ZHT/A1M9ZZV4gapZq9Wh3a3vSaNG0bx1RMjFsmvXtthA8M6vlupZ47
	tvYDE7m+wgUUUMFwUur3O6GP6JomgKn2x9QVRzX8cNvChnGXLWpUM+1+TD4+QU1oEhJd8YDX8WV
	XOVFDIfxYLL3kK20hS7ezlheaePSb3mTfDztj+hjfECQFKsvZtT5cAxJJIUsBbzePVkvTJ4zg1W
	Bsx0aVe5Wqm6MuQMIrdh7pdq5pvO+pUpy/zXQxzHUEYdLA/RL08D+hWS63uzTu39SO6yj4zX/pR
	C7NgGk3vnGOvKRCiyHXlZ7lq/h/uGjAyBfSqxsUkjcf0APP/mN8bKw6MbLHozppnJkQ9mpcoosB
	No87kTikMVLE1PYPy59i39zBilUGsbqcx2Vc5umyiGMkBXyI5CvU8FYyrX7kTw96VMjan8O6g==
X-Received: by 2002:a05:600c:8105:b0:4a1:83f0:7c8a with SMTP id 5b1f17b1804b1-4a18e4433d6mr356696825e9.1.1792040646193;
        Wed, 14 Oct 2026 22:04:06 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1bd972aebsm46376245e9.1.2026.10.14.22.04.05
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 22:04:05 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 42/55] openssl: upgrade 3.5.8 -> 3.5.9
Date: Thu, 15 Oct 2026 07:03:05 +0200
Message-ID: <f035c4ec526ef52690e6fbfc4c02fd27a5b6a975.1792020605.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1792020605.git.yoann.congal@smile.fr>
References: <cover.1792020605.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Oct 2026 05:04:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247840

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

