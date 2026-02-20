Return-Path: <hprajapati@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4DFF6C53209
	for <webhook@archiver.kernel.org>; Fri, 20 Feb 2026 04:54:59 +0000 (UTC)
Received: from mail-dl1-f65.google.com (mail-dl1-f65.google.com [74.125.82.65])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.31865.1771563293974891014
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Feb 2026 20:54:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=bPgImLh3;
 spf=pass (domain: mvista.com, ip: 74.125.82.65, mailfrom: hprajapati@mvista.com)
Received: by mail-dl1-f65.google.com with SMTP id a92af1059eb24-1270ac5d3efso1583839c88.1
        for <openembedded-core@lists.openembedded.org>; Thu, 19 Feb 2026 20:54:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1771563293; x=1772168093; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UsC/7wGYEzHo57bm4aB4Vnn1xNNpPyd+zxolUZ7L7O8=;
        b=bPgImLh3Vx+UwscPBNAhEVclMsB9nMDtBY/OtVKjXZrkB0yI4m/SnQh7eHO+rUoWR7
         Xy2FIZyIf7In1Zcmi/Iw7fgo8FRf5LSneKjYEVvaGtFF/Mw9rsbIfkrjsYiDaFEZYPNC
         Sfd1m/h89g+vRTtnuN/Qy3gHDUXoYoBSY57x4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771563293; x=1772168093;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UsC/7wGYEzHo57bm4aB4Vnn1xNNpPyd+zxolUZ7L7O8=;
        b=udB3sB+5PVjkHCpi8p6lO2H4Y1RaYieKVxB5OwuX+OjNIZ3cZT5+K3BOUY3c3Cmiln
         9sWr/x/oAWNk591kckNDuv6QdP/i2Yon10X96TavgR1lRpPLVLdWw3aEHqVucUaQQ7J0
         nMSrS5hGsMWOQq8gurEe7hO2/KIRJq/G2So4ZOSDGz1EO1c0PlhTcxjr4yep7Nh6y5HY
         ukZi4mwklMTvzTeU7W0kO1sxvSIptBdCCrjLzrqKhvtoHdW7mRS8gJHQn96Rz8At0qbI
         Vuy4M0odE3EI8gKAzDJ/proc+aL9KsCbV87q5ZMuxkTuN/czgbxvvLzvrwTQNdPVBQku
         giAQ==
X-Gm-Message-State: AOJu0YzA/Ty6eB/evVyS4Pnacck3UP8TsUEws8jShAcJqOVQgaalEPBF
	Pn6fXCj6wSFJPDrDrgCi9CaFTssLxf+HBmRFF4svF3Ah30oI2DRHgDXRr1zRXqln6a/8uRYB8HF
	2OQamjHo=
X-Gm-Gg: AZuq6aIuFAEA4AJZE99dc3owwN//19WbMz1fYSuSrhCAnlb4xM4LlL04GmHQwOmHq04
	YTDlU7MmfMGur7Shey/iEBurFTlArss/2G6ITdcTe37j+lz5HVi/PnOsAmaEjTDKfUSsECuVDXy
	JqOyy2ycOzRNv0sD6+MYY0qECBKW2GTm0TNuqumypUL0MvL5TsrbxVAVBZssACng2f18uwznh9o
	ewkQbYKKkSQENqJ1mWV7+YC4GF4fxD9MlL4aB62WjhPaW8kz9R8egUZSa3fT8xmDpB/0jnXhErI
	RIWOl+1SttfwnVUUqJ3PseDql8V0iCShQv2Aai+OxMkdZ9nbVk7p13uQhdfGG2oztKeIXePGRnC
	K2bs6m1NqCLOODWOhpSW9HfmPwABDgTI0rIWWreILyXCaVbbuPQJ/+64AX+3YjTfCatE406fW57
	eyFq+NM8U2KIQ1eBld9Fu6QBVOSaBGnD7yhg==
X-Received: by 2002:a05:7022:2387:b0:11b:b3a1:714a with SMTP id a92af1059eb24-12741b6da0dmr8447363c88.12.1771563293017;
        Thu, 19 Feb 2026 20:54:53 -0800 (PST)
Received: from MVIN00013.mvista.com ([152.59.0.2])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12742cbc900sm28041650c88.14.2026.02.19.20.54.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Feb 2026 20:54:52 -0800 (PST)
From: Hitendra Prajapati <hprajapati@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Hitendra Prajapati <hprajapati@mvista.com>
Subject: [scarthgap][PATCHv2] openssl: fix CVE-2025-15468
Date: Fri, 20 Feb 2026 10:22:42 +0530
Message-ID: <20260220045244.8430-1-hprajapati@mvista.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 Feb 2026 04:54:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231450

To fix this issue, Add a NULL guard before dereferencing SSL_CIPHER.

Backport patch from NVD report: https://nvd.nist.gov/vuln/detail/CVE-2025-15468

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
---
 .../openssl/openssl/CVE-2025-15468.patch      | 39 +++++++++++++++++++
 .../openssl/openssl_3.2.6.bb                  |  1 +
 2 files changed, 40 insertions(+)
 create mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2025-15468.patch

diff --git a/meta/recipes-connectivity/openssl/openssl/CVE-2025-15468.patch b/meta/recipes-connectivity/openssl/openssl/CVE-2025-15468.patch
new file mode 100644
index 0000000000..dcd862bedf
--- /dev/null
+++ b/meta/recipes-connectivity/openssl/openssl/CVE-2025-15468.patch
@@ -0,0 +1,39 @@
+From 1f08e54bad32843044fe8a675948d65e3b4ece65 Mon Sep 17 00:00:00 2001
+From: Daniel Kubec <kubec@openssl.org>
+Date: Fri, 9 Jan 2026 14:33:24 +0100
+Subject: [PATCH] ossl_quic_get_cipher_by_char(): Add a NULL guard before
+ dereferencing SSL_CIPHER
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Fixes CVE-2025-15468
+
+Reviewed-by: Saša Nedvědický <sashan@openssl.org>
+Reviewed-by: Tomas Mraz <tomas@openssl.org>
+MergeDate: Mon Jan 26 19:36:04 2026
+(cherry picked from commit 293b55de0c434a99d0e744d0521170ca280606a9)
+
+CVE: CVE-2025-15468
+Upstream-Status: Backport [https://github.com/openssl/openssl/commit/1f08e54bad32843044fe8a675948d65e3b4ece65]
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ ssl/quic/quic_impl.c | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/ssl/quic/quic_impl.c b/ssl/quic/quic_impl.c
+index 98b6a0a..4abde64 100644
+--- a/ssl/quic/quic_impl.c
++++ b/ssl/quic/quic_impl.c
+@@ -3646,6 +3646,8 @@ const SSL_CIPHER *ossl_quic_get_cipher_by_char(const unsigned char *p)
+ {
+     const SSL_CIPHER *ciph = ssl3_get_cipher_by_char(p);
+ 
++    if (ciph == NULL)
++        return NULL;
+     if ((ciph->algorithm2 & SSL_QUIC) == 0)
+         return NULL;
+ 
+-- 
+2.50.1
+
diff --git a/meta/recipes-connectivity/openssl/openssl_3.2.6.bb b/meta/recipes-connectivity/openssl/openssl_3.2.6.bb
index fac62245d7..4fd13d52fe 100644
--- a/meta/recipes-connectivity/openssl/openssl_3.2.6.bb
+++ b/meta/recipes-connectivity/openssl/openssl_3.2.6.bb
@@ -16,6 +16,7 @@ SRC_URI = "https://github.com/openssl/openssl/releases/download/openssl-${PV}/op
            file://CVE-2025-15467-01.patch \
            file://CVE-2025-15467-02.patch \
            file://CVE-2025-15467-03.patch \
+           file://CVE-2025-15468.patch \
            "
 
 SRC_URI:append:class-nativesdk = " \
-- 
2.50.1


