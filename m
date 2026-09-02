Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9F39C624DA
	for <webhook@archiver.kernel.org>; Wed,  2 Sep 2026 17:00:45 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.520.1788368435800957841
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Sep 2026 10:00:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=DYec9+93;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.42, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-49a97714f5dso9646065e9.0
        for <openembedded-core@lists.openembedded.org>; Wed, 02 Sep 2026 10:00:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1788368434; x=1788973234; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=SbTQw5t+k3MUhgg4U/I7SiC/YPJ4nmS0LRT6EsdR190=;
        b=DYec9+93sgUjM6Av2mCvl8MdPUZsPDYU0Lw47ea9v99eYz1RH51uF4Qgcafh+WUnuA
         64OnoqJQz25xhTKza/4yw6Txjdo+v+fM+uIwUM2gJ8EAcUwRSt54bi4BtFdK7HsdDP8D
         ZstgO6KGKfGUrAXdDSOCnD2fyPxUmeeOsMZ7o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788368434; x=1788973234;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=SbTQw5t+k3MUhgg4U/I7SiC/YPJ4nmS0LRT6EsdR190=;
        b=bGRUoHTkrbAlNTrt6kM+Qs1lb7EcPTOmDErR6pSYWMiYzaj18q578b4ZOtFvKM7aw1
         hZjL3vInrNAXyeX00QZVkRUyZHdP8P8oEqBncD64nLYSrLcl1Rx+dPm/aMdCk+nCzgLf
         NmhPU/Qubl4h+0g+8tkKei8JMayCBU8CA75ThnDgEvR2mJdFQzUPEDHoN56lCR/wygh+
         sPJNlzOVF9jIP43kiAZ24fPUFOvxy62pWZkNZnuJ/3udkYVMl/lVg3/e+jA6DhosP6+l
         2vZHve7DxnEQgp2hfkZOsXvGjCFQHdzcD2JVO13VeC2YlwZaRn1vsW3vqTQXcKIGbPQQ
         vmww==
X-Gm-Message-State: AFuF++mvGIsoPFk/a6+qIKgiRurYnSH1ZKmC2NknFxHCafi0Gh0akMoJ
	lZ2UWPZhUKjiBED/3Bpji9fOiiwiCuGHhZCpuDAtXHdeQ6l0YFqawpN8nBGhC3ixMaNBVmUu0aP
	GJYSxyso=
X-Gm-Gg: AR+sD10RA45CYpuEPP5Nmec7i6JsBSIuWK9zcucRmQEP6AcXKVC3375Z8XssLEXrSpT
	HvS3E88NSjKdPcfs4KudnUgaoRN10qi411/0J05YSOVtChwB6m9p5dTKoj8vkiCccWNDDtBaBm1
	J4b1f+ofQcx5eIwPcFtWcHCl+rGDZrqfzQx2YdcUjQ0gE5e9gSUYZfRsQt4zRR0QSR4bnGOJunX
	A555ALdSloltkV166VSeHjuNlVFFLX97pt7aPzUBQFtmmDvOWFbaVus1V0xL7zgXJk3iG+paV5a
	cckEKZOJtnkt55Vz//ksaKRZUv/6uH4m+lY1vFMvDlOp0OlrLWtKQcKbXcZCHrWUS1A4+6bTRYh
	jkHfe8THqhbqOEtAg+Xm3pLZ9SHnclNFW2dAGfNFGxwmexV5/p4bRJf4EOBnI5SbxoooHZsvzH8
	MFwItAETyfuQ153A8hRIvmPv7DluehA4oyXaGwBQoeRKvrOlxRMWndmfRBQVv2Gdn79McXquHGN
	ezHk3UX/62pwTwu6w==
X-Received: by 2002:a05:600c:3496:b0:493:f5bf:4dc6 with SMTP id 5b1f17b1804b1-49ce57fb12cmr129969165e9.7.1788368433619;
        Wed, 02 Sep 2026 10:00:33 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:89b1:8875:2e41:59f0])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48448eeabbfsm7205831f8f.31.2026.09.02.10.00.32
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 10:00:32 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] openssl: Upgrade 4.0.1 -> 4.0.2
Date: Wed,  2 Sep 2026 18:00:30 +0100
Message-ID: <20260902170030.3404153-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Sep 2026 17:00:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244984

OpenSSL 4.0.2 is a security patch release. The most severe CVE fixed
in this release is Moderate.

This release incorporates the following bug fixes and mitigations:

    Fixed QUIC server being able to trigger double free when processing
    INITIAL packet.
    (CVE-2026-18798)

    Fixed heap buffer overflow in CMS key unwrapping.
    (CVE-2026-63072)

    Fixed invalid pointer dereference in CMP server via crafted protectionAlg.
    (CVE-2026-63076)

    Fixed unbounded memory growth in QUIC server incoming channel queue.
    (CVE-2026-14456)

    Fixed RPK server signature algorithm selection being able to dereference
    a missing certificate.
    (CVE-2026-14457)

    Fixed excessive memory use buffering DTLS records for a future epoch.
    (CVE-2026-54874)

    Fixed client-side memory leak in OCSP response checking.
    (CVE-2026-54876)

    Fixed untrusted Sender DN being used as a format string in CMP response
    validation.
    (CVE-2026-63073)

    Fixed CMP indefinite cache growth of extraCerts.
    (CVE-2026-63074)

    Fixed QUIC ACK-only packet retention being able to cause memory exhaustion.
    (CVE-2026-63075)

    Fixed possibility of AEAD forgeries with empty ciphertext when using
    EVP_Cipher().
    (CVE-2026-75803)

    Fixed checking of authentication tags for empty ciphertexts for AEAD ciphers
    in CCM cipher mode.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../openssl/openssl/0001-extend-check_cwm-test-timeout.patch    | 2 +-
 .../openssl/{openssl_4.0.1.bb => openssl_4.0.2.bb}              | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-connectivity/openssl/{openssl_4.0.1.bb => openssl_4.0.2.bb} (99%)

diff --git a/meta/recipes-connectivity/openssl/openssl/0001-extend-check_cwm-test-timeout.patch b/meta/recipes-connectivity/openssl/openssl/0001-extend-check_cwm-test-timeout.patch
index 76bc05d5f95..26622fd1b18 100644
--- a/meta/recipes-connectivity/openssl/openssl/0001-extend-check_cwm-test-timeout.patch
+++ b/meta/recipes-connectivity/openssl/openssl/0001-extend-check_cwm-test-timeout.patch
@@ -1,4 +1,4 @@
-From 14856dbd767621ce6f162680c00557b54af0effb Mon Sep 17 00:00:00 2001
+From 07bbd037ca61264bcc311856a119b664ce13f586 Mon Sep 17 00:00:00 2001
 From: Gyorgy Sarvari <skandigraun@gmail.com>
 Date: Thu, 23 Oct 2025 11:24:36 +0200
 Subject: [PATCH] extend check_cwm test timeout
diff --git a/meta/recipes-connectivity/openssl/openssl_4.0.1.bb b/meta/recipes-connectivity/openssl/openssl_4.0.2.bb
similarity index 99%
rename from meta/recipes-connectivity/openssl/openssl_4.0.1.bb
rename to meta/recipes-connectivity/openssl/openssl_4.0.2.bb
index a669de1b225..9e143b6f6ed 100644
--- a/meta/recipes-connectivity/openssl/openssl_4.0.1.bb
+++ b/meta/recipes-connectivity/openssl/openssl_4.0.2.bb
@@ -18,7 +18,7 @@ SRC_URI:append:class-nativesdk = " \
            file://environment.d-openssl.sh \
            "
 
-SRC_URI[sha256sum] = "2db3f3a0d6ea4b59e1f094ace2c8cd536dffb87cdc39084c5afa1e6f7f37dd09"
+SRC_URI[sha256sum] = "736b467530f916737b7031310ccb21d8218c6229e61e8e160cd1d3458cd543a8"
 
 inherit lib_package multilib_header ptest perlnative manpages
 

