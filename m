Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D4EECA6001
	for <webhook@archiver.kernel.org>; Tue,  6 Oct 2026 15:46:50 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.48872.1791301600750587912
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 Oct 2026 08:46:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=eAieNtdl;
 spf=pass (domain: smile.fr, ip: 209.85.221.48, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-486e70f2457so1405958f8f.2
        for <openembedded-core@lists.openembedded.org>; Tue, 06 Oct 2026 08:46:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1791301599; x=1791906399; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=w+0l6o6kFbUJPMEYnH7np2ZXGQQLRad+3mAT/sQXDf4=;
        b=eAieNtdlDGYicqyGhGvka4GJ7TKvahgXjwhitma3urft2dpm4akvzGjLF5q62kXiHt
         aS1NYKkQwXb6m56smi2ZLuytuMgcHKkNmy6zb9W+oCSLKMjvM4+ySb2uKzOB86lMrIQT
         vivRBTvAPUtDl6BIxPZgRKFKyBrO0MxxznSCM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791301599; x=1791906399;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=w+0l6o6kFbUJPMEYnH7np2ZXGQQLRad+3mAT/sQXDf4=;
        b=XRADyR3BjRj/Qfti/+iyhlORXfntlIjPYbviWKpzYAUoSzIt6TLlBlAQXXa6T/Mkbb
         +QynUECKtKS9i6iYQbkJwZfu2FndfZMk7tNYkdYLXyRfeKJMRahZezTvNNrdgzU8b6QJ
         +yiJvlC4B+gbrCeR6h5tFGWv6BtpY5Bxy8oTrgTmrLlCigpHCoHlgFjTL/ic1I0P5s1D
         rHsFfdEqXQfJEyJWqybD5UVonh59OPINBq9r3N1j+Kmo2glvF4kFXlLwad5DAAqyqkN5
         q7IWeORc0TPKezTKy6U5OXx+E6GEt08AU3Jxsi3hsD72dO744+dZ6dE2SyjzgomcxB5p
         vtGg==
X-Gm-Message-State: AFq9FYIs8d9uv0kO6beTFJ2x1S3iqkzxnqGk7wdCFu276x6oqssqDjUF
	wsFPPvf4w4QO3/NxZoJHz/3jtwPDM5HvjMYn/+vZm5dWd7IjAwNzogbAOIHShmmNkKf9dxWtEsk
	mhDz4w1w=
X-Gm-Gg: AYBFou1rL3P+N+1OUYKFiD3ESPB6st1TlcOB19wAzWVFdAbPZrJaWsqV1D0744KHn1D
	/rd+D2fdZHGs59oseekUoxP4jTIOTJzVgZamcMHM+ELt3lKfRZH8rMLQ3/CFJ9T8YqPBn3aKi6O
	qnFEtAlM3NGs8kdWMn7anTmOobhFd7mQ3lvSzF5eNPUKx2ZxDbvBOiO0/RmdArqcm8poR+/lq/Y
	/7F0+wUZVXrk5KdyGwbTNIWIFgX396BZJ2N90gu4S/A4CdmMfyaKahvJG1TJG41L0IzpGdrCXjJ
	knAY0dMXLaGKgL86c00zOXwPXtO+bNZQnVhqY33wf+6ypDTJyFi1w/46XP8BCSthp7iqPzYOX3c
	fhB4aDf3uBloYdZRtIoS6UBUTzsFBg4Nur7Kefet0fM1pn0u2yUbHQB+lpJ+Tz18rlkTgsog1/3
	o3HtDklh4i7w2vuwCx+90BY1C84r5Ma3pO2FuP1ovRc4eadFLgAuDUlrzQe2OlkyA2VAFnRdxSP
	YSqd8SVwY9yqH2n76/OS1v42/fEf3ZAb/6prpGaZY60UjyRulqaqJ4W7R4KPDJaCmIxDyybyDiD
	LUtJTA==
X-Received: by 2002:a05:6000:388:b0:48a:f404:695e with SMTP id ffacd0b85a97d-48c480108b4mr18565343f8f.50.1791301598927;
        Tue, 06 Oct 2026 08:46:38 -0700 (PDT)
Received: from FRSMI25-LASER.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48c71d3032csm257281f8f.45.2026.10.06.08.46.38
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 08:46:38 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][blacksail 19/19] recipes-support/gnutls: disable slow tests for RISCV64
Date: Tue,  6 Oct 2026 17:46:05 +0200
Message-ID: <f59af8082a2f7cdb27a4ba5968b81d740bdeff35.1791299195.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1791299195.git.yoann.congal@smile.fr>
References: <cover.1791299195.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 06 Oct 2026 15:46:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247308

From: Joao Marcos Costa <joaomarcos.costa@bootlin.com>

Timeouts have been observed (very frequently in the past weeks)
in the autobuilder, and a bug [1] was filed at Bugzilla.

After some investigation [2] was performed by Trevor Gamblin, we now have a
list of the most time consuming test cases:

- mini-record-2 (187880ms)
- record-retvals (145390ms)
- rng-op-key (63820ms)
- rng-op-random (63330ms)
- rng-op-nonce (63260ms)
- dtls-rehandshake-cert (61360ms)
- dtls-rehandshake-cert-2 (61230ms)
- dtls-rehandshake-anon (61030ms)
- mini-loss-time (60130ms)
- mini-dtls-hello-verify-48 (30050ms)
- tls12-ffdhe (27790ms)
- x509sign-verify-rsa (18460ms)
- x509sign-verify-ecdsa (16050ms)

Disable the tests that take > 60000ms to avoid so many timeouts in qemuriscv64-ptest runs.

[1] https://bugzilla.yoctoproject.org/show_bug.cgi?id=16162
[2] https://bugzilla.yoctoproject.org/show_bug.cgi?id=16162#c19

Signed-off-by: João Marcos Costa <joaomarcos.costa@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit cc848c403aa3832453f1adfaa45411b8b72b9363)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
[YC: [YOCTO #16162] ]
---
 meta/recipes-support/gnutls/gnutls/run-ptest |  1 +
 meta/recipes-support/gnutls/gnutls_3.8.13.bb | 18 ++++++++++++++++++
 2 files changed, 19 insertions(+)

diff --git a/meta/recipes-support/gnutls/gnutls/run-ptest b/meta/recipes-support/gnutls/gnutls/run-ptest
index b7827e1358a..1d6999669a3 100644
--- a/meta/recipes-support/gnutls/gnutls/run-ptest
+++ b/meta/recipes-support/gnutls/gnutls/run-ptest
@@ -53,6 +53,7 @@ test_disallowlist="${test_disallowlist} system-override-sig"
 test_disallowlist="${test_disallowlist} system-override-sig-tls"
 test_disallowlist="${test_disallowlist} system-prio-file"
 test_disallowlist="${test_disallowlist} x509cert-tl"
+test_disallowlist="${test_disallowlist} @EXTRA_TEST_DISALLOWLIST@"
 
 LOG=${PWD}/tests.log
 cd tests
diff --git a/meta/recipes-support/gnutls/gnutls_3.8.13.bb b/meta/recipes-support/gnutls/gnutls_3.8.13.bb
index 9c8c994bdc8..88b6135bf1f 100644
--- a/meta/recipes-support/gnutls/gnutls_3.8.13.bb
+++ b/meta/recipes-support/gnutls/gnutls_3.8.13.bb
@@ -77,6 +77,24 @@ do_install:append:class-target() {
         fi
 }
 
+EXTRA_TEST_DISALLOWLIST ?= ""
+
+EXTRA_TEST_DISALLOWLIST:riscv64 = "\
+    dtls-rehandshake-anon \
+    dtls-rehandshake-cert \
+    dtls-rehandshake-cert-2 \
+    mini-loss-time \
+    mini-record-2 \
+    record-retvals \
+    rng-op-key \
+    rng-op-nonce \
+    rng-op-random \
+"
+
+do_install_ptest_base:append() {
+    sed -i 's:@EXTRA_TEST_DISALLOWLIST@:${EXTRA_TEST_DISALLOWLIST}:g' ${D}${PTEST_PATH}/run-ptest
+}
+
 PACKAGES =+ "${PN}-dane ${PN}-openssl ${PN}-xx ${PN}-fips"
 
 FILES:${PN}-dev += "${bindir}/gnutls-cli-debug"

