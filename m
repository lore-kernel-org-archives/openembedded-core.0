Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90554C87FD3
	for <webhook@archiver.kernel.org>; Wed, 30 Jul 2025 19:05:53 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.web10.43858.1753902346430830492
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Jul 2025 12:05:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=BmHVm/0F;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.181, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-24009eeb2a7so1726265ad.0
        for <openembedded-core@lists.openembedded.org>; Wed, 30 Jul 2025 12:05:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1753902346; x=1754507146; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=d+lWBsUBEVpYlPKNlZ1J8s0+hWXlSPLm/XPy3blvBTo=;
        b=BmHVm/0FzyH14669dqULGCEFim7/GYIFyrkmLwQhOjpDT91hxFz7MJJoJ24tqAptte
         seSLg45THdtdwB503XinyZRz22dtha5JgcPKdpoMqPYojYbxhSdLroep4S6k7QZYi6gk
         gmq92JXrN47FNTDEq+jwe+4YT07hYrt0kCbE31GaWlzGPhCBT3D981I5PRrTFNrS9QvW
         WDYh7JgJo/2XqE87tnW9a6jsoGwzcpvHVHXYaqImH55FEiz08N+pDNaedp9pCZu42wq+
         ImnjXL2RMfdbFnohpbPmSBfLQeeYd3Q9dd/Othd2FTUbJcA08Kkkm+u1RGxgTnUg7/oG
         l+CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753902346; x=1754507146;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d+lWBsUBEVpYlPKNlZ1J8s0+hWXlSPLm/XPy3blvBTo=;
        b=jukmMFBDl5fs7+C9bykCOx2zyfeR+bu+yLMWKZmVzaxZkaUDt9ziS3LOPRqDQqQ2WX
         B3LZvg1FAQTX/2yOUmk6xdiSRd9LiiaJ32o7iB87rcHH33dGOVb5R1sgrnc6OtL+l4Hu
         zqdWdPGTQ0NbQfE2KlEQUx63vsnrvBeYWfO0Wwft7ijLtdS98uhFwPs5W999jBtCQKad
         G/38eDYJ/Hq3vW3y/uLe7OOBIaom7Cj9Wn1XEWJlD5nwXTSzv/v/n70/OTL7lydSnzmi
         o8s67BZ5/UfY4UvlBwexQbfh3GxV85yOobTz1AHMfp75R3IIejLCW5JXRXvkeTyT4mrs
         rMMA==
X-Gm-Message-State: AOJu0Yw1B2CDNZkQ9DE7wTE8BFybaeClMR/FlxMrlybhVtXjjB+9oyoa
	ki0EoNMSo0J5drTSaw4t1fyppfWoefMv3bltyR/qAPl64/Ygm69XJBKHP0x+WtAcRbWNN5E0PAt
	Kan6J
X-Gm-Gg: ASbGnctHwhvxVnZopZ932/9SSri6UdUidBS3GD8yPXbnOuLwOz/8NHMZJSyNpYNF5Nq
	Hp/gfYEeODwh/NY+seFP9ZPVYbjGw1dKi9dmDd8ZN/2iQp+wgeaDIX3+/OQfOiJutlhDWH9HbSg
	K9GsgluHoTGFXYpvR2zixsSjuJFGjWEfV64cEySuHPlTCW4XOzJMblAOmIXoIsw9gYhzlgcrQfY
	uRiL1vSEDjxuZjAppL3XUqaiyu7qh8MO0G/x8BLbOaDAiig3sbFr8/6x465uMswjQUdA57iDI0o
	K/daBTzFXzWA3KQhDsCihpLLaAQxPRiJvv7NQXOT4yZAtscW5NSldwVBOLCeg2NUys8j4MQPJ0o
	xei3grRxFE6Qc
X-Google-Smtp-Source: AGHT+IGncNfP4nJ50EucrlB7+Jbl0jp27Y4kRBRELwjWvrlXPeVD/WfxTIVdMVepxEgf6a+YS+ekiA==
X-Received: by 2002:a17:903:1986:b0:23f:f39b:eaf6 with SMTP id d9443c01a7336-24096b4442dmr58250785ad.46.1753902345570;
        Wed, 30 Jul 2025 12:05:45 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:58fd:da9:30d5:829a])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-240a48b77d3sm22129025ad.117.2025.07.30.12.05.44
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Jul 2025 12:05:45 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 03/10] gnutls: patch read buffer overrun in the "pre_shared_key" extension
Date: Wed, 30 Jul 2025 12:05:27 -0700
Message-ID: <33181e3e8c7427fc823f750e936732b69e247987.1753902181.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1753902181.git.steve@sakoman.com>
References: <cover.1753902181.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 30 Jul 2025 19:05:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221141

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
 meta/recipes-support/gnutls/gnutls_3.7.4.bb   |   5 ++-
 3 files changed, 38 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-support/gnutls/gnutls/0001-psk-fix-read-buffer-overrun-in-the-pre_shared_key-ex.patch
 create mode 100644 meta/recipes-support/gnutls/gnutls/5477db1bb507a35e8833c758ce344f4b5b246d8e

diff --git a/meta/recipes-support/gnutls/gnutls/0001-psk-fix-read-buffer-overrun-in-the-pre_shared_key-ex.patch b/meta/recipes-support/gnutls/gnutls/0001-psk-fix-read-buffer-overrun-in-the-pre_shared_key-ex.patch
new file mode 100644
index 0000000000..ce78fe1c95
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
+@@ -839,6 +839,8 @@ static int _gnutls_psk_recv_params(gnutls_session_t session,
+ 
+ 	if (session->security_parameters.entity == GNUTLS_CLIENT) {
+ 		if (session->internals.hsk_flags & HSK_PSK_KE_MODES_SENT) {
++			DECR_LEN(len, 2);
++
+ 			uint16_t selected_identity = _gnutls_read_uint16(data);
+ 
+ 			for (i=0;i<sizeof(session->key.binders)/sizeof(session->key.binders[0]);i++) {
diff --git a/meta/recipes-support/gnutls/gnutls/5477db1bb507a35e8833c758ce344f4b5b246d8e b/meta/recipes-support/gnutls/gnutls/5477db1bb507a35e8833c758ce344f4b5b246d8e
new file mode 100644
index 0000000000000000000000000000000000000000..009d44c394fd08c5400fb63f837e468f1738522d
GIT binary patch
literal 111
zcmWe*R$$0tVqi#PW>$cL{|f(MOa+Di2(|!16v7f_VPMc>&}Lv_W>HXJK$nH+{f{t!
IL6d<203r_)`v3p{

literal 0
HcmV?d00001

diff --git a/meta/recipes-support/gnutls/gnutls_3.7.4.bb b/meta/recipes-support/gnutls/gnutls_3.7.4.bb
index 48ddb269de..4929e44db3 100644
--- a/meta/recipes-support/gnutls/gnutls_3.7.4.bb
+++ b/meta/recipes-support/gnutls/gnutls_3.7.4.bb
@@ -31,6 +31,8 @@ SRC_URI = "https://www.gnupg.org/ftp/gcrypt/gnutls/v${SHRT_VER}/gnutls-${PV}.tar
            file://CVE-2024-12243.patch \
            file://CVE-2025-32989.patch \
            file://04939b75417cc95b7372c6f208c4bda4579bdc34 \
+           file://0001-psk-fix-read-buffer-overrun-in-the-pre_shared_key-ex.patch \
+           file://5477db1bb507a35e8833c758ce344f4b5b246d8e \
            "
 
 SRC_URI[sha256sum] = "e6adbebcfbc95867de01060d93c789938cf89cc1d1f6ef9ef661890f6217451f"
@@ -69,8 +71,9 @@ do_configure:prepend() {
 	done
 
     # binary files cannot be delivered as diff
-    mkdir -p ${S}/fuzz/gnutls_x509_parser_fuzzer.repro/
+    mkdir -p ${S}/fuzz/gnutls_x509_parser_fuzzer.repro/ ${S}/fuzz/gnutls_psk_client_fuzzer.repro/
     cp ${WORKDIR}/04939b75417cc95b7372c6f208c4bda4579bdc34 ${S}/fuzz/gnutls_x509_parser_fuzzer.repro/
+    cp ${WORKDIR}/5477db1bb507a35e8833c758ce344f4b5b246d8e ${S}/fuzz/gnutls_psk_client_fuzzer.repro/
 }
 
 PACKAGES =+ "${PN}-openssl ${PN}-xx"
-- 
2.43.0


