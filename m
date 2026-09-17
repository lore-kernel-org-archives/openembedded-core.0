Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56A1FC982E6
	for <webhook@archiver.kernel.org>; Thu, 17 Sep 2026 22:08:17 +0000 (UTC)
Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1585.1789682892409158591
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Sep 2026 15:08:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=WaSLOXln;
 spf=pass (domain: smile.fr, ip: 74.125.225.141, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49b912d3920so876105e9.1
        for <openembedded-core@lists.openembedded.org>; Thu, 17 Sep 2026 15:08:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1789682891; x=1790287691; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=CH84+mS+ZEteQFJctfhr9XygkFnuDlQGvzI1Qlxdia0=;
        b=WaSLOXlnVVVDiU29CMk7gFbXC4sMCyPTc/Jt7xUTadlI3i+aRYpLdnt4SCOuEBHtEv
         khJoMXDIxpmKz04KnSJrM0eTYRYHG5P5ouYf43guYMfgIh1hly5QcZcKpxFxRb44TJdW
         M5rti6if/DcbKauCH+wmBr9A0YcOMk8Uo+F0Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789682891; x=1790287691;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=CH84+mS+ZEteQFJctfhr9XygkFnuDlQGvzI1Qlxdia0=;
        b=gqtKYX3fcatX7oMW78tvU6DV3dQeq8V3ywgmmiSc8n79ivEo+U4wYnwTgh9zBrRLxa
         5j1VZtibe5wgLaSWWaw8z8nMCrBFBmcvlrTFeW5+nuKv+upo5Ci6Wf5qf2/vURc1sQaR
         zodugHReTmXVUriNI9Xoy0PLfIC2UT3J2p0MRegVetzxt1ZT+8ZLwBldYutBOQ5xR+zL
         CRKnu2nrACTlU5rQK/0paLI6x0l1wE02Nu2Nuu5fOR6Vp2EnY+hz5aY0XVWwvtZfjq+g
         5srLZVuZDFC1djfLTxTbp8fGPBh8r1l+FVZZFOQeEgEElF7KGK98jBNGiqf0JH6lAHgM
         FcYQ==
X-Gm-Message-State: AFuF++kKVKZAplvAZuupgd1Jn2A5MoERzA4HlG3fdsZGD6ab+tZHyFYm
	lXT9fPcbj9VIp1UW3pPKlM4+SuKxja8jvfJ3Qtjgw1ETWSGFpV1lEZ0aY5ZQhVQQisMGa/hdPpj
	3xANbX50=
X-Gm-Gg: AYBFou0AJnuBznC1Atc3OmDUzOiOpzSCuvxMQPHJ0XOB8wj90g1IEDW/O3JOAinMTnk
	Yeu6dH7C/QZFRk3v8NSiy7mUVqlsM2dXd89oB1uvbOVz1p0gNTHsqi5+kbEFK6KzTidqtDQq70n
	3WoTNXt2SRB2AW3MC1ygbVkOakocILBpYI2NsTg0iA3IDlivNL6bvgk4BcE5VhZCO6JajcQ+D3M
	ubUkqIFUB08u1UVCpO6BQoU6GaQEjHgohGiHtYI9xvH/vJ4ama4yoqsB11Aky8dnWmpPwfQld/h
	pdBrw14CcjpfOgQPjPLdC4TeoPLXZKI5gUUSeuSTq5CeVwrPzIaXXj4EdgLvSSICsffGxwl2Rxu
	kbCp8onKkiBXuGB3CcPFzfkB6qEpt1LtvAg/cPxYnMKEp/jOvvmN7rwIU7PQMxYTyNMyFmnEAEs
	ueG9n19sJu0eLn895Cd0l6trer+Qq3ZXVXpxDcmdNcv6af6iiGD7qFQTr9YM1vYZg3shR94d1ld
	dvXTKfyrBbx0seWD79HVJOOHVEjFPoqSANFju/frDfup3F+t+BqkFUfvEs3ozwbO1j606UVOs8=
X-Received: by 2002:a05:600c:34c1:b0:49e:799a:8951 with SMTP id 5b1f17b1804b1-49fc56aba0dmr3628615e9.11.1789682890660;
        Thu, 17 Sep 2026 15:08:10 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fc471b9a2sm8984075e9.0.2026.09.17.15.08.10
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 15:08:10 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 40/79] libgcrypt: inherit upstream-stable-release-point
Date: Fri, 18 Sep 2026 00:06:25 +0200
Message-ID: <761295ea203dca54399137c9458b19b4590e4699.1789681419.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1789681419.git.yoann.congal@smile.fr>
References: <cover.1789681419.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Sep 2026 22:08:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246135

From: Daniel Turull <daniel.turull@ericsson.com>

libgcrypt keeps a long-lived maintenance branch per minor version,
LIBGCRYPT-1.12-BRANCH matching the current PV with equivalents back to
1.2, and releases from several in parallel: in one week of April 2026 it
released into four of them, 1.12.2 and 1.8.13 on the 15th, 1.11.3 and
1.10.4 on the 21st. So upgrades within a major.minor are stable point
upgrades per the OE-Core stable release policy (ref-manual, "Stable Point
Release Upgrades").

  https://docs.yoctoproject.org/dev/ref-manual/release-process.html#stable-point-release-upgrades
  https://github.com/gpg/libgcrypt/tree/LIBGCRYPT-1.12-BRANCH

NEWS separates "Bug fixes" from "New and extended interfaces", and neither
point release in the current series has the latter section at all: 1.12.2
(Apr 15 2026) is four fixes, including an ECDH buffer overwrite and a
missing Dilithium bounds check, and 1.12.1 (Feb 20 2026) four build or
arithmetic regressions. 1.12.0 (Jan 29 2026) opens the series and does add
features, confirming X.Y.0 bumps must stay outside the regex.

The libtool version-info in each NEWS heading is upstream's own ABI
record, and across the current series only the revision moves. One
deviation is worth disclosing from the previous series: 1.11.2 adds a
single enum constant, GCRY_KEM_RAW_P256R1, with current and age
incremented together so it stays backward compatible. Point releases here
are fixes-focused rather than absolutely fixes-only, with the deviation
bounded to additive constants.

Already tracked this way on the OE stable branches, counting only bumps
since each branch forked: scarthgap took 1.10.3 -> 1.10.4, which needed a
build fix backported alongside it because 1.10.4 broke building with -O2
in the sysroot path. kirkstone has taken no in-series bump and stays at
1.9.4.

AI-Generated: Kiro with Claude Opus 5
Signed-off-by: Daniel Turull <daniel.turull@ericsson.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>

Adapted for wrynose: applied to libgcrypt_1.12.1.bb (upstream: libgcrypt_1.12.2.bb).
(cherry picked from commit 97caf8a110281becde5d888338712d71627cbf98)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-support/libgcrypt/libgcrypt_1.12.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/libgcrypt/libgcrypt_1.12.1.bb b/meta/recipes-support/libgcrypt/libgcrypt_1.12.1.bb
index d7f8563ae6e..d7b3e182cd2 100644
--- a/meta/recipes-support/libgcrypt/libgcrypt_1.12.1.bb
+++ b/meta/recipes-support/libgcrypt/libgcrypt_1.12.1.bb
@@ -32,7 +32,7 @@ SRC_URI[sha256sum] = "7df5c08d952ba33f9b6bdabdb06a61a78b2cf62d2122c2d1d03a91a798
 
 BINCONFIG = "${bindir}/libgcrypt-config"
 
-inherit autotools texinfo binconfig-disabled pkgconfig ptest
+inherit autotools texinfo binconfig-disabled pkgconfig ptest upstream-stable-release-point
 
 require recipes-support/gnupg/drop-unknown-suffix.inc
 

