Return-Path: <sdoshi@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 024A7C25B74
	for <webhook@archiver.kernel.org>; Sun,  2 Jun 2024 16:45:41 +0000 (UTC)
Received: from mail-oo1-f50.google.com (mail-oo1-f50.google.com [209.85.161.50])
 by mx.groups.io with SMTP id smtpd.web10.62414.1717346734077062113
 for <openembedded-core@lists.openembedded.org>;
 Sun, 02 Jun 2024 09:45:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=eLeCQck/;
 spf=pass (domain: mvista.com, ip: 209.85.161.50, mailfrom: sdoshi@mvista.com)
Received: by mail-oo1-f50.google.com with SMTP id 006d021491bc7-5b9794dad09so1541087eaf.3
        for <openembedded-core@lists.openembedded.org>; Sun, 02 Jun 2024 09:45:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1717346733; x=1717951533; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XrJ8zxJlvriRdrlCFySRsUqDmaJgsVr9EbddqDqIaP8=;
        b=eLeCQck/CrDzc10YuRFHdMPceUI7egmrEDAD+8IjjLuSoS4c/6/gACumadcWtjeSQx
         0nikl8AWajd8o8XtvZzScdfPcvOCuNAHtM3HRUYK9FyJfJfommfJVfH22qjxpLCYSl10
         5VJcoB69oPqfdx5vmc7XTiGMu8NGK1RCvnNEQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717346733; x=1717951533;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XrJ8zxJlvriRdrlCFySRsUqDmaJgsVr9EbddqDqIaP8=;
        b=RhFbQMeAdzZg0OIsjXnJua7T79jO1F3q6oDE6RmJaZVVvBx6COrZucgGruqjSnTe5M
         /LkZTF+zLi7cZSHQz3wMl1S+QV0jDauy/BkooFhc4Cil67MdPXmpwEWoAghY/7jXJtZV
         txx4y0CR9fj5jequcntwaOswWNeFlrKap7TmMLnEG7x49qaOppPReKoIByHnkukIxD0Q
         gGR1UmQwGHGBkXEJCdCx3aFABrExeKXylMNSaYdy1gmau+7u5D2vDpAcT138djwM50py
         rtZAc5ep6rwUJxnKWQKYbIT33PZKx141QaHW+YA3AX4ViKF/2S95AEpthZPuY15QDNQn
         hGmA==
X-Gm-Message-State: AOJu0YwhcZjj7HuhGhVdQ31aegLNMCcR1znaQN3Pr6M3FHjsFVm6Hm4K
	9hzlxYDbBK16oWjbJ8O1BQGnmqCGmD4+936AyZM92o4JQU9diCU1oUDbPrPXLr2HFDRMQIDRKy+
	w
X-Google-Smtp-Source: AGHT+IHJ50QWCDjov+fT1UNbph8HF+9hTiY6syRRnd7uE6RagxfvzIrSc4uavs21Iv/qlxgGNFRK3g==
X-Received: by 2002:a05:6358:4305:b0:199:2ecd:ec4c with SMTP id e5c5f4694b2df-19b48d4dcf3mr984678155d.11.1717346732772;
        Sun, 02 Jun 2024 09:45:32 -0700 (PDT)
Received: from siddharth-latitude-3420.mvista.com ([157.32.46.90])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-6c354e74495sm4125852a12.32.2024.06.02.09.45.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Jun 2024 09:45:32 -0700 (PDT)
From: Siddharth <sdoshi@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Siddharth Doshi <sdoshi@mvista.com>
Subject: [OE-core][kirkstone][PATCH] openssl: Security fix for CVE-2024-4741
Date: Sun,  2 Jun 2024 22:15:19 +0530
Message-Id: <20240602164519.126463-1-sdoshi@mvista.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 02 Jun 2024 16:45:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200212

From: Siddharth Doshi <sdoshi@mvista.com>

Upstream-Status: Backport from [https://github.com/openssl/openssl/commit/3559e868e58005d15c6013a0c1fd832e51c73397]

CVE's Fixed:
CVE-2024-4741:Use After Free with SSL_free_buffers

Signed-off-by: Siddharth Doshi <sdoshi@mvista.com>
---
 .../openssl/openssl/CVE-2024-4741.patch       | 76 +++++++++++++++++++
 .../openssl/openssl_3.0.13.bb                 |  1 +
 2 files changed, 77 insertions(+)
 create mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2024-4741.patch

diff --git a/meta/recipes-connectivity/openssl/openssl/CVE-2024-4741.patch b/meta/recipes-connectivity/openssl/openssl/CVE-2024-4741.patch
new file mode 100644
index 0000000000..2fbc55b48a
--- /dev/null
+++ b/meta/recipes-connectivity/openssl/openssl/CVE-2024-4741.patch
@@ -0,0 +1,76 @@
+From b3f0eb0a295f58f16ba43ba99dad70d4ee5c437d Mon Sep 17 00:00:00 2001
+From: Watson Ladd <watsonbladd@gmail.com>
+Date: Wed, 24 Apr 2024 11:26:56 +0100
+Subject: [PATCH] Only free the read buffers if we're not using them
+
+If we're part way through processing a record, or the application has
+not released all the records then we should not free our buffer because
+they are still needed.
+
+CVE-2024-4741
+
+Reviewed-by: Tomas Mraz <tomas@openssl.org>
+Reviewed-by: Neil Horman <nhorman@openssl.org>
+Reviewed-by: Matt Caswell <matt@openssl.org>
+(Merged from https://github.com/openssl/openssl/pull/24395)
+
+(cherry picked from commit 704f725b96aa373ee45ecfb23f6abfe8be8d9177)
+
+Upstream-Status: Backport from [https://github.com/openssl/openssl/commit/b3f0eb0a295f58f16ba43ba99dad70d4ee5c437d]
+CVE: CVE-2024-4741
+Signed-off-by: Siddharth Doshi <sdoshi@mvista.com>
+---
+ ssl/record/rec_layer_s3.c | 9 +++++++++
+ ssl/record/record.h       | 1 +
+ ssl/ssl_lib.c             | 3 +++
+ 3 files changed, 13 insertions(+)
+
+diff --git a/ssl/record/rec_layer_s3.c b/ssl/record/rec_layer_s3.c
+index 4bcffcc..1569997 100644
+--- a/ssl/record/rec_layer_s3.c
++++ b/ssl/record/rec_layer_s3.c
+@@ -81,6 +81,15 @@ int RECORD_LAYER_read_pending(const RECORD_LAYER *rl)
+     return SSL3_BUFFER_get_left(&rl->rbuf) != 0;
+ }
+ 
++int RECORD_LAYER_data_present(const RECORD_LAYER *rl)
++{
++    if (rl->rstate == SSL_ST_READ_BODY)
++        return 1;
++    if (RECORD_LAYER_processed_read_pending(rl))
++        return 1;
++    return 0;
++}
++
+ /* Checks if we have decrypted unread record data pending */
+ int RECORD_LAYER_processed_read_pending(const RECORD_LAYER *rl)
+ {
+diff --git a/ssl/record/record.h b/ssl/record/record.h
+index 234656b..b60f71c 100644
+--- a/ssl/record/record.h
++++ b/ssl/record/record.h
+@@ -205,6 +205,7 @@ void RECORD_LAYER_release(RECORD_LAYER *rl);
+ int RECORD_LAYER_read_pending(const RECORD_LAYER *rl);
+ int RECORD_LAYER_processed_read_pending(const RECORD_LAYER *rl);
+ int RECORD_LAYER_write_pending(const RECORD_LAYER *rl);
++int RECORD_LAYER_data_present(const RECORD_LAYER *rl);
+ void RECORD_LAYER_reset_read_sequence(RECORD_LAYER *rl);
+ void RECORD_LAYER_reset_write_sequence(RECORD_LAYER *rl);
+ int RECORD_LAYER_is_sslv2_record(RECORD_LAYER *rl);
+diff --git a/ssl/ssl_lib.c b/ssl/ssl_lib.c
+index 2c8479e..131eaac 100644
+--- a/ssl/ssl_lib.c
++++ b/ssl/ssl_lib.c
+@@ -5491,6 +5491,9 @@ int SSL_free_buffers(SSL *ssl)
+     if (RECORD_LAYER_read_pending(rl) || RECORD_LAYER_write_pending(rl))
+         return 0;
+ 
++    if (RECORD_LAYER_data_present(rl))
++        return 0;
++
+     RECORD_LAYER_release(rl);
+     return 1;
+ }
+-- 
+2.35.7
+
diff --git a/meta/recipes-connectivity/openssl/openssl_3.0.13.bb b/meta/recipes-connectivity/openssl/openssl_3.0.13.bb
index 87ab4047d9..46f02aa20a 100644
--- a/meta/recipes-connectivity/openssl/openssl_3.0.13.bb
+++ b/meta/recipes-connectivity/openssl/openssl_3.0.13.bb
@@ -14,6 +14,7 @@ SRC_URI = "http://www.openssl.org/source/openssl-${PV}.tar.gz \
            file://0001-Configure-do-not-tweak-mips-cflags.patch \
            file://CVE-2024-2511.patch \
            file://CVE-2024-4603.patch \
+           file://CVE-2024-4741.patch \
            "
 
 SRC_URI:append:class-nativesdk = " \
-- 
2.34.1


