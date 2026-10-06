Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A599ACA6004
	for <webhook@archiver.kernel.org>; Tue,  6 Oct 2026 20:44:38 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5184.1791319476909394436
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 Oct 2026 13:44:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=2NJhwAdd;
 spf=pass (domain: smile.fr, ip: 209.85.128.44, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4995b0343c1so19874915e9.3
        for <openembedded-core@lists.openembedded.org>; Tue, 06 Oct 2026 13:44:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1791319475; x=1791924275; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=w+0l6o6kFbUJPMEYnH7np2ZXGQQLRad+3mAT/sQXDf4=;
        b=2NJhwAddWZK2IjXseiKaJjzrJLCBAFGexIDOdHbWRwVsgaV2SKBUx89YUlH/ctqc/F
         66bk9PQMyGZ4KgaRBOS2iUDEXSFgH7gFOwOX2otAkSj7yRl5NWRTBcUss4sTckXFjMU/
         wMM4JftXtakpOFJVSOkwicPFuyGK4YTfPi/pU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791319475; x=1791924275;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=w+0l6o6kFbUJPMEYnH7np2ZXGQQLRad+3mAT/sQXDf4=;
        b=zehHFMmaw25qT4Dzv68L0LTfkLn044FNjZ3lsmvDzbfTRFLQBj7WVmVhs79p1eLe9i
         M6XY4icl5JhTuIDO1I4I4nbgLbxaQXGsnCCyuldde4ZWXOBVLpnwV1iyswc+XlteCNm2
         SvGEQ1DtdIPlY6G4YYWK9/57M7SNXnVOotUQSETqSOPODek6RiPAY95V3ejaFbhZkwRo
         /udAdVQF7KldYiBDzXeUvIla7COlD8FcE2huC8EPb7nIgl9uatOc9sbDKCShbTqfcxh+
         wYK63GHJWs/c9VMJnf4PnDrAasKB7omiK32Cy6Xk1IJl2wx5tkFk1k0LPP7Yly2P4YtZ
         fQRw==
X-Gm-Message-State: AFuF++kOIRKbHZM0eMWpWtPUC67ZpxoLV1+JVvvM6tVxBgSlQmA8yCx7
	grph8tFWGDLBydsc27JQVqfv3JCqS5EPoIDadbJbqmhXysU0CLNoCcqeATvn4UitXAGLM37FRIT
	4d36AcnE=
X-Gm-Gg: AYBFou1R9ugRirxZUhDYGju8aOWSXqITpKfFS/pbMscmL/cDfiAj2uprmAt7rpQ3tJv
	uhbKDwToTqYL0Vn+aw9m2YNqDTKsblZE+9RPd/VcmQK58jKWBujXQASimK0ySsTsiF10husbHXR
	qsZEZG1q3iPxHZaZHZFK7NzaeRsgcIQCHZ36wjJvCjhj5rSnDJH9PhkRJs9AfKCuBqKF4EMCcgW
	zM8nntd0GyrFfjfjnG/RkKU7dYZ0wJbygkeIp3L8w5Q+5YGrmpIQSW4J9poTI91ZOQ2JVlNWaRl
	kFGLomDkoa1180lloOgl8w2e7OV6M1dmK7Gv4EeDsfeQESP6EJuds79n9iAnyyHyAviqo1sgQIC
	1G+Z4vmDIcub30WOZeT5wLRLY4ICrP41redZE0D8w1+NF3O68auFRFG5O6jhp4Nb/xixcZIRg67
	csaIkA3lg3FSXGSmGgGuG2L7OS8OUlXUemSv2Bcy/Z+LcdcLyg38mb4mJgp1Af1CIfnN4XY59wC
	4jNiGxUDHXpLWPbtGZfw4DX4xYE+psEjmTNWQkIEJbyoC6CHkFb0pk6gbu3YHDkyMo=
X-Received: by 2002:a05:600c:4ed0:b0:4a1:7f41:b9dc with SMTP id 5b1f17b1804b1-4a18043b80amr528075e9.23.1791319475194;
        Tue, 06 Oct 2026 13:44:35 -0700 (PDT)
Received: from FRSMI25-LASER (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48c7273b5e0sm997338f8f.14.2026.10.06.13.44.34
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 13:44:34 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][blacksail v2 18/18] recipes-support/gnutls: disable slow tests for RISCV64
Date: Tue,  6 Oct 2026 22:43:53 +0200
Message-ID: <e182a0c4b91fd459c1f9dece0c7c23f7f9eaa7ab.1791318909.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1791318909.git.yoann.congal@smile.fr>
References: <cover.1791318909.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 06 Oct 2026 20:44:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247355

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

