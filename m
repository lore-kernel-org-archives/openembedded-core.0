Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 933F7C87FC9
	for <webhook@archiver.kernel.org>; Wed, 30 Jul 2025 21:29:24 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.web10.47209.1753910954426347778
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Jul 2025 14:29:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=jI2F9Pk2;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.177, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-24003ed822cso2267815ad.1
        for <openembedded-core@lists.openembedded.org>; Wed, 30 Jul 2025 14:29:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1753910954; x=1754515754; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CfJA5tUzqMGVQ4u4ZwpmPMq+gJmm/QiD4sd5wfq+KUU=;
        b=jI2F9Pk2PKbRFShZHUAn6jhQgqwkVhV8tR1bFSrOdj1rO8WytoSMs1n6u5ufXwMOIS
         3bk9NvU91qg374CoRDuQEXXncbEICLzP/8+c1mArH+bAwIBkmieoywWZms7U3Iii4DfB
         jLAMv1RfykZvlS2IrHV6d4LgcfV9zXlT1kcCQNwsWRXDeRaMwNHu5hrgvwupHt329Px+
         UXB2w9gekZjygQYdqBvRi/G3izifUr+VkluO1ddIpxFV8XiQ1Nu4UgiO31LV7M0VCm+G
         u/nU0V8FXEAXZQF6cegAaWtgxOKPz6aiFKNAYhCT/9bfibmXRjEj5zcDykWsJJcYiXr6
         G1Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753910954; x=1754515754;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CfJA5tUzqMGVQ4u4ZwpmPMq+gJmm/QiD4sd5wfq+KUU=;
        b=NPINbPB/062UL/H0CcEz8mhcE6+oXN6pHq1yzaI7BbMKM8Gm1hZSjmjmhNSFDDBfHR
         1nESA/reW5vifwdRKYjfWgKC4wqTAwixYQhsO5d+MtgINYW8kRKP4KSabYc8Wk7FBs6z
         h3fPnLssbrwd0py6XxMajvABO7dMT/nDH+wrFb4wzM3Sc+LUue+1+CnsTkC2l3Xi580u
         HKzg+2Ojehjojgbj5HYiH40ma6PEqo4Sy+ZF+nfIrzWo/W3J+jPqUNITHOj4zfAaHVRg
         9SQ4bb8y8JtdW33j4JdFvVf/8mUgD3ViPDyDu28JAYSbpRxKnOFXL7lmrYtiBJWAL5jQ
         HMkQ==
X-Gm-Message-State: AOJu0YxXsZkGQmlldyg4B0U7PdE+6IgwYILaIsany029FKiW9Bgh5SsP
	mStmwsSj6LI+lUtboDX3AL7i8Cfy9avf2BxVsChGBxo75Y11H4jEi1pu4aXlXWIwf37KWiBhIiZ
	+5d1t
X-Gm-Gg: ASbGnctKSMaermoG1v9//jMSaLwvq5tuLkDxrFBX8arhB6cqyicsh+RI3a+ibP6hcvU
	fUroPLOKhEzO4qHHP8DztrPDWoPHK6TRevmnYG3QHaDn98vY5uiiPQmqY/zY9N3UYN/t76F00Uw
	t1VSTTXbapj6CL/xNpKfMQb8laltRl44KzS0LV5NNTCYJAZFRDDnd8OS9+cHk7dYpGmN+UQXKGw
	hrOCtDK6kUwZRI3avogoCgBE0xlD0t9nTswdQWg+og+8+QgsYzrq7EQ9NB47xl6KWl936a4VVkx
	XK9WQiBrGzVqZAonOba23FtI+SUxBjd5mMWCc8j5mYJjepZde7gFML4NTtVxVLmI/gOnjIfQiv3
	jBhZHQcnv5PPBMZIVNrUbNP8=
X-Google-Smtp-Source: AGHT+IFmay9DpGfpXMqc7OcvCLOxJb+aMPcBzbTV3Ehd1el7Tw1KZAEs/Ofvka8rmqW9jBOKw74VCQ==
X-Received: by 2002:a17:902:eb8a:b0:237:d734:5642 with SMTP id d9443c01a7336-24096b4bd4bmr68776865ad.41.1753910953609;
        Wed, 30 Jul 2025 14:29:13 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:58fd:da9:30d5:829a])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-241e899b4adsm576365ad.132.2025.07.30.14.29.12
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Jul 2025 14:29:13 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 02/11] gnutls: patch read buffer overrun in the "pre_shared_key" extension
Date: Wed, 30 Jul 2025 14:28:53 -0700
Message-ID: <8f825e7f4ca36d7ac62062e452cea256f3c058aa.1753910853.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1753910853.git.steve@sakoman.com>
References: <cover.1753910853.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 30 Jul 2025 21:29:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221161

From: Peter Marko <peter.marko@siemens.com>

Pick relevant commit from 3.8.10 release MR [1].
The ME contains referece to undiscoled issue, so any security relevant
patch should be picked.

Binary test file was added as separate file as binary diffs are not
supported.

[1] https://gitlab.com/gnutls/gnutls/-/merge_requests/1979

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...fer-overrun-in-the-pre_shared_key-ex.patch |  34 ++++++++++++++++++
 .../5477db1bb507a35e8833c758ce344f4b5b246d8e  | Bin 0 -> 111 bytes
 meta/recipes-support/gnutls/gnutls_3.8.4.bb   |   5 ++-
 3 files changed, 38 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-support/gnutls/gnutls/0001-psk-fix-read-buffer-overrun-in-the-pre_shared_key-ex.patch
 create mode 100644 meta/recipes-support/gnutls/gnutls/5477db1bb507a35e8833c758ce344f4b5b246d8e

diff --git a/meta/recipes-support/gnutls/gnutls/0001-psk-fix-read-buffer-overrun-in-the-pre_shared_key-ex.patch b/meta/recipes-support/gnutls/gnutls/0001-psk-fix-read-buffer-overrun-in-the-pre_shared_key-ex.patch
new file mode 100644
index 0000000000..e3dc286328
--- /dev/null
+++ b/meta/recipes-support/gnutls/gnutls/0001-psk-fix-read-buffer-overrun-in-the-pre_shared_key-ex.patch
@@ -0,0 +1,34 @@
+From 208c6478d5c20b9d8a9f0a293e3808aa16ee091f Mon Sep 17 00:00:00 2001
+From: Andrew Hamilton <adhamilt@gmail.com>
+Date: Mon, 7 Jul 2025 10:31:55 +0900
+Subject: [PATCH] psk: fix read buffer overrun in the "pre_shared_key"
+ extension
+
+While processing the "pre_shared_key" extension in TLS 1.3, if there
+are certain malformed data in the extension headers, then the code may
+read uninitialized memory (2 bytes) beyond the received TLS extension
+buffer. Spotted by oss-fuzz at:
+https://issues.oss-fuzz.com/issues/42513990
+
+Signed-off-by: Andrew Hamilton <adhamilt@gmail.com>
+Signed-off-by: Daiki Ueno <ueno@gnu.org>
+
+Upstream-Status: Backport [https://gitlab.com/gnutls/gnutls/-/commit/208c6478d5c20b9d8a9f0a293e3808aa16ee091f]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ lib/ext/pre_shared_key.c                          |   2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/lib/ext/pre_shared_key.c b/lib/ext/pre_shared_key.c
+index 51c4891d5..2cb83e670 100644
+--- a/lib/ext/pre_shared_key.c
++++ b/lib/ext/pre_shared_key.c
+@@ -1170,6 +1170,8 @@ static int _gnutls_psk_recv_params(gnutls_session_t session,
+ 
+ 	if (session->security_parameters.entity == GNUTLS_CLIENT) {
+ 		if (session->internals.hsk_flags & HSK_PSK_KE_MODES_SENT) {
++			DECR_LEN(len, 2);
++
+ 			uint16_t selected_identity = _gnutls_read_uint16(data);
+ 
+ 			for (i = 0; i < sizeof(session->key.binders) /
diff --git a/meta/recipes-support/gnutls/gnutls/5477db1bb507a35e8833c758ce344f4b5b246d8e b/meta/recipes-support/gnutls/gnutls/5477db1bb507a35e8833c758ce344f4b5b246d8e
new file mode 100644
index 0000000000000000000000000000000000000000..009d44c394fd08c5400fb63f837e468f1738522d
GIT binary patch
literal 111
zcmWe*R$$0tVqi#PW>$cL{|f(MOa+Di2(|!16v7f_VPMc>&}Lv_W>HXJK$nH+{f{t!
IL6d<203r_)`v3p{

literal 0
HcmV?d00001

diff --git a/meta/recipes-support/gnutls/gnutls_3.8.4.bb b/meta/recipes-support/gnutls/gnutls_3.8.4.bb
index 367872d47e..973f81719a 100644
--- a/meta/recipes-support/gnutls/gnutls_3.8.4.bb
+++ b/meta/recipes-support/gnutls/gnutls_3.8.4.bb
@@ -26,6 +26,8 @@ SRC_URI = "https://www.gnupg.org/ftp/gcrypt/gnutls/v${SHRT_VER}/gnutls-${PV}.tar
            file://CVE-2024-12243.patch \
            file://CVE-2025-32989.patch \
            file://04939b75417cc95b7372c6f208c4bda4579bdc34 \
+           file://0001-psk-fix-read-buffer-overrun-in-the-pre_shared_key-ex.patch \
+           file://5477db1bb507a35e8833c758ce344f4b5b246d8e \
            "
 
 SRC_URI[sha256sum] = "2bea4e154794f3f00180fa2a5c51fe8b005ac7a31cd58bd44cdfa7f36ebc3a9b"
@@ -66,8 +68,9 @@ do_configure:prepend() {
 	done
 
     # binary files cannot be delivered as diff
-    mkdir -p ${S}/fuzz/gnutls_x509_parser_fuzzer.repro/
+    mkdir -p ${S}/fuzz/gnutls_x509_parser_fuzzer.repro/ ${S}/fuzz/gnutls_psk_client_fuzzer.repro/
     cp ${WORKDIR}/04939b75417cc95b7372c6f208c4bda4579bdc34 ${S}/fuzz/gnutls_x509_parser_fuzzer.repro/
+    cp ${WORKDIR}/5477db1bb507a35e8833c758ce344f4b5b246d8e ${S}/fuzz/gnutls_psk_client_fuzzer.repro/
 }
 
 do_compile_ptest() {
-- 
2.43.0


