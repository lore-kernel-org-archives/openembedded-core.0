Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD134C87FD8
	for <webhook@archiver.kernel.org>; Wed, 30 Jul 2025 21:29:24 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web10.47212.1753910956051908415
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Jul 2025 14:29:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=UMV2O8bX;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.175, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2400f746440so3007245ad.2
        for <openembedded-core@lists.openembedded.org>; Wed, 30 Jul 2025 14:29:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1753910955; x=1754515755; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=j7d5hqj95eCP9lAyHwzyI05LXHi7yC/4n9ychPZy9iY=;
        b=UMV2O8bX09YaPPXJgLPIvN+2wTlkG1Th3CR0lEYobMqzpShPQIzvrpjJXvPHVh/TK4
         9VoGJ9G4xLxFodDfXoxjP0RzxlxoWBufx/qE/4T04dhMHHlrNH3P1BVABb8d/TmO9RQs
         n0akoz7ELQaSMe5l3rvyCbSBzWbvg2LgBmM6TIWr04t0IZT7s5KQ4tVlWJAIX6PlPtpx
         a8y00RES8dKCTARKezn05RJIaa4PshTK1mXv4nDDe0ebZqLJ04Rblc8l9AlJ0cf2VNKu
         AVOMjBWHP1A3WIcu+EQLipx66J0/RTwp26u3cbJs8nBlQ13lHbQlyuxrluWS39K5QaJH
         6wTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753910955; x=1754515755;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j7d5hqj95eCP9lAyHwzyI05LXHi7yC/4n9ychPZy9iY=;
        b=tuJ6c1+7BqZBrrTSBbgWfEyH4rOnSQMiitygDu6qzCn/nqG4mZf6e9/cEKRUr8nLl6
         Di5M6VX49YHfdjujTGBaPfh0cuTlY6XXtQPW/IF/8BAx3eL16bDQ0mXwo/zp11eNbvPF
         GMizoeCLOJ9k5cZ99+OEYa2p22a4VvXI2/p2bnE/Cg+yqnIwBALeZM8Gy7wEbDEgmvso
         wSM4a3jaPNpXnnOyU/YZctpz6TbeswkXgiwi7SLfF7EcNlFbciibBZdWLuZ22At1za6/
         Qv3rjYYJCDC7jw5OmKI5DDBN6Vaz0yQtL2M3M/5SUXLhITapry70rM8lVfEJ/BU8bKjO
         eY7g==
X-Gm-Message-State: AOJu0YzheVzmcmcW5wA6p5oU1GlCoioCW8gIB0siqvV07ZPazHF870C8
	fvNKy8a6C0YGgDdChPq04IxgrsK/2oP29tSz4ks/+RyGVg5JX4WnjA52SilpUPow585VG8PeW7y
	yimOe
X-Gm-Gg: ASbGnct2Zur7rsPZu/Gn/oQVWJ6MQC+2uUq7qQPbKuamxk6cGtpEfoxQOi5Zj3/eEfh
	SzXx5a03Z9Y7ivkRYd0/R13Ad0K4EqOyT9J4wqDBSXeY/sR4bAC4VXKnG3i05bfOpd1y3RhcGOr
	Ur8xaXlT97PNqMpeXwXFiqbZhj0G7KNNGyl2IapifXP7q5XZCYz5lSG4XCjSMFDv9DLsZ5tBBvK
	Msb4bSzKXhSW+aLZNKH5IRjtaDVslEq4CvV8N0sNkxCwoOX60Vmo9qCkwiDViR94q4obBoWq1Bm
	n4RbOQgcwy2c+N4fyVf6rkXMaYmf3aanNArs5xQQZwn66mZ462ffQ1ZiWwHEThSz1i0ZsUHYaRX
	4CCZcg+beN+Hy9VQHAvzhHRM=
X-Google-Smtp-Source: AGHT+IE8h3NIVKoATRSwxwpri42e4/Os7A1jZekwg/KKNUlXMLHBtzC/L5Ri7jhfChgIJwBGiJfaSw==
X-Received: by 2002:a17:902:e801:b0:23f:df69:af50 with SMTP id d9443c01a7336-24096b237eamr65914105ad.34.1753910955261;
        Wed, 30 Jul 2025 14:29:15 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:58fd:da9:30d5:829a])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-241e899b4adsm576365ad.132.2025.07.30.14.29.14
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Jul 2025 14:29:14 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 03/11] gnutls: patch reject zero-length version in certificate request
Date: Wed, 30 Jul 2025 14:28:54 -0700
Message-ID: <d1aaef9bbaa240c83cc7d485b55570449203da0b.1753910853.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1753910853.git.steve@sakoman.com>
References: <cover.1753910853.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 30 Jul 2025 21:29:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221162

From: Peter Marko <peter.marko@siemens.com>

Pick relevant commit from 3.8.10 release MR [1].
The MR contains referece to undiscoled issue, so any security relevant
patch should be picked.

Binary test file was added as separate file as binary diffs are not
supported.

[1] https://gitlab.com/gnutls/gnutls/-/merge_requests/1979

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...-length-version-in-certificate-reque.patch |  37 ++++++++++++++++++
 .../3e94dcdff862ef5d6db8b5cc8e59310b5f0cdfe2  | Bin 0 -> 830 bytes
 meta/recipes-support/gnutls/gnutls_3.8.4.bb   |   5 ++-
 3 files changed, 41 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-support/gnutls/gnutls/0001-x509-reject-zero-length-version-in-certificate-reque.patch
 create mode 100644 meta/recipes-support/gnutls/gnutls/3e94dcdff862ef5d6db8b5cc8e59310b5f0cdfe2

diff --git a/meta/recipes-support/gnutls/gnutls/0001-x509-reject-zero-length-version-in-certificate-reque.patch b/meta/recipes-support/gnutls/gnutls/0001-x509-reject-zero-length-version-in-certificate-reque.patch
new file mode 100644
index 0000000000..5cecbdfccd
--- /dev/null
+++ b/meta/recipes-support/gnutls/gnutls/0001-x509-reject-zero-length-version-in-certificate-reque.patch
@@ -0,0 +1,37 @@
+From 61c0505634a6faacf9fa0723843408aa0d3fb90a Mon Sep 17 00:00:00 2001
+From: Andrew Hamilton <adhamilt@gmail.com>
+Date: Mon, 7 Jul 2025 10:35:54 +0900
+Subject: [PATCH] x509: reject zero-length version in certificate request
+
+Ensure zero size asn1 values are considered invalid in
+gnutls_x509_crq_get_version, this ensures crq version is not used
+uninitialized. Spotted by oss-fuzz at:
+https://issues.oss-fuzz.com/issues/42536706
+
+Signed-off-by: Andrew Hamilton <adhamilt@gmail.com>
+Signed-off-by: Daiki Ueno <ueno@gnu.org>
+
+Upstream-Status: Backport [https://gitlab.com/gnutls/gnutls/-/commit/61c0505634a6faacf9fa0723843408aa0d3fb90a]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ lib/x509/crq.c                                    |   7 +++++++
+ 1 file changed, 7 insertions(+)
+
+diff --git a/lib/x509/crq.c b/lib/x509/crq.c
+index 19e13623c..9e9801d2b 100644
+--- a/lib/x509/crq.c
++++ b/lib/x509/crq.c
+@@ -615,6 +615,13 @@ int gnutls_x509_crq_get_version(gnutls_x509_crq_t crq)
+ 		return _gnutls_asn2err(result);
+ 	}
+ 
++	/* Note that asn1_read_value can return success with */
++	/* len set to zero (without setting the data) in some */
++	/* conditions. */
++	if (unlikely(len <= 0)) {
++		return gnutls_assert_val(GNUTLS_E_ASN1_VALUE_NOT_VALID);
++	}
++
+ 	return (int)version[0] + 1;
+ }
+ 
diff --git a/meta/recipes-support/gnutls/gnutls/3e94dcdff862ef5d6db8b5cc8e59310b5f0cdfe2 b/meta/recipes-support/gnutls/gnutls/3e94dcdff862ef5d6db8b5cc8e59310b5f0cdfe2
new file mode 100644
index 0000000000000000000000000000000000000000..23ff09c4be5ece2b2aae278f48b3a24543256e8e
GIT binary patch
literal 830
zcmXqLVzx49Vp`19$Y4-yC~6?g#;gDYJRkxF48;vZA;NqxAqZ_KWFP>M;Dk#U@*D6%
z#Mq#UxD7ZV0!#`DV57L;iWL;tp=^W3`9OULV-y&e8+(z|4Lox}6JxDG6JsTkBMqAv
zvxsmQ(BDLW7_gfE|Nj%AmUJaSq-!ClgBPy~G=HFR!CFzpKs@B6!4EYarV1l{G~%_N
LG)b5xr0D_xkf?K@

literal 0
HcmV?d00001

diff --git a/meta/recipes-support/gnutls/gnutls_3.8.4.bb b/meta/recipes-support/gnutls/gnutls_3.8.4.bb
index 973f81719a..2a73a1e3d8 100644
--- a/meta/recipes-support/gnutls/gnutls_3.8.4.bb
+++ b/meta/recipes-support/gnutls/gnutls_3.8.4.bb
@@ -28,6 +28,8 @@ SRC_URI = "https://www.gnupg.org/ftp/gcrypt/gnutls/v${SHRT_VER}/gnutls-${PV}.tar
            file://04939b75417cc95b7372c6f208c4bda4579bdc34 \
            file://0001-psk-fix-read-buffer-overrun-in-the-pre_shared_key-ex.patch \
            file://5477db1bb507a35e8833c758ce344f4b5b246d8e \
+           file://0001-x509-reject-zero-length-version-in-certificate-reque.patch \
+           file://3e94dcdff862ef5d6db8b5cc8e59310b5f0cdfe2 \
            "
 
 SRC_URI[sha256sum] = "2bea4e154794f3f00180fa2a5c51fe8b005ac7a31cd58bd44cdfa7f36ebc3a9b"
@@ -68,9 +70,10 @@ do_configure:prepend() {
 	done
 
     # binary files cannot be delivered as diff
-    mkdir -p ${S}/fuzz/gnutls_x509_parser_fuzzer.repro/ ${S}/fuzz/gnutls_psk_client_fuzzer.repro/
+    mkdir -p ${S}/fuzz/gnutls_x509_parser_fuzzer.repro/ ${S}/fuzz/gnutls_psk_client_fuzzer.repro/ ${S}/fuzz/gnutls_x509_crq_parser_fuzzer.repro/
     cp ${WORKDIR}/04939b75417cc95b7372c6f208c4bda4579bdc34 ${S}/fuzz/gnutls_x509_parser_fuzzer.repro/
     cp ${WORKDIR}/5477db1bb507a35e8833c758ce344f4b5b246d8e ${S}/fuzz/gnutls_psk_client_fuzzer.repro/
+    cp ${WORKDIR}/3e94dcdff862ef5d6db8b5cc8e59310b5f0cdfe2 ${S}/fuzz/gnutls_x509_crq_parser_fuzzer.repro/
 }
 
 do_compile_ptest() {
-- 
2.43.0


