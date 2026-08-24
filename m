Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B78DBC5DF9C
	for <webhook@archiver.kernel.org>; Mon, 24 Aug 2026 13:00:55 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15952.1787576445612819860
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Aug 2026 06:00:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=Ft2HwgQl;
 spf=pass (domain: smile.fr, ip: 209.85.128.43, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-49954b88fffso27397565e9.0
        for <openembedded-core@lists.openembedded.org>; Mon, 24 Aug 2026 06:00:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1787576444; x=1788181244; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Qb3z6o1JageTw2oNk+bklxaTKI6WQ2zPyas4dnkrCpI=;
        b=Ft2HwgQluVthqX8ncFtJ8E4DAsyRORBQ1ILOVyPl/hrSsYJ07PiOajRoDIkQAc3qSa
         pR3Cbk4WfYUKBjwOg4tdpJE23XcVp59jO+atZXGf3cz0Cdt86n55yxVQE6j91fBCh7rX
         tIh3yKfwpNY/ErMx47gmkR3drkBbIdID6xf+M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787576444; x=1788181244;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Qb3z6o1JageTw2oNk+bklxaTKI6WQ2zPyas4dnkrCpI=;
        b=FfoNmZqkz1G1T1xjMzMQLmMHkAcrvv0QNtegFR+6zV1MNq0urgMenv841Bs8jRlnLr
         KpWkzyj7g9FBCpR+s3a0T+arhaxZDPCraT9M4d1ieqleJKqo9dusYvS/AaC3WxgqCaOJ
         OcLmILHxel1DjGj10e0M/fkaUE/RTrzAh1nA/Di3zzQiCPkjKv8e6fseuku3+mTWhex8
         zRJMxq6hkeoBLlNfWgD8pTAt3VYxo06EAyHHsrDrokzKeRpsbsb2pj3RKPB2SJLTqEat
         VFG9AtoC2OSZ1X5KGictxamPH1Fo2dDbYsdQqpVQ3JI+I2gZhlWrhhWTPse7BoIfmg7q
         fJag==
X-Gm-Message-State: AFuF++n32LTXFlubuPcnAKyZBqYfUnEqdewuLfo97TdYoqChegKhA0PJ
	tO/0wtJE9akeMd9oJuc8ydRXAEHqR2PDD3nyIG0sNGZbt3EW5UttdijMg5CjLUbdUxW7SJVHWej
	ug1td77A=
X-Gm-Gg: AR+sD13Sb0YcpCUkh9Yd+bf+5JFJSinVkQales/e2pDvSJ06rz1YbIf4VICPdR7vQOK
	fAfE9t81BrMS5X9XteONdTzkQPXSzJH/MrMD2Z1CT2XVwoAAteveauQZKE2u9UCSWiSxV4nF6T9
	RnX/+jtsrL00GC8JhjzUk9HCVeod7r3UjL1EAd3ojIG8dxEDoRMLQpETbbNeMvbOY0xVlCr9MhA
	mc1ytqBACi6blkPP/mzBV9TNYuMdmnim4+CFk3h4zhjkCDa/QHsk5V6I9kXpiS0d33AI03b3R2Z
	1MpQiotpnZZnwHm4UPoFVW/0qRNsaEVx6QUzwSCRaEarpsEACNSzwSbVCB/509qH5BOCFgojrCH
	VaiJSpXe5CU/2Fnk/nVMfqI24h5hLBMtv7+PS7ezQUWGeWiBMaKQV7x8/GGYRGnJRkaVorCndnR
	Gk1xPQVlj/+GHIA7z9d8Mhb2M02Ar7jbwoQx5CLGPVlLpNa3kGddStQvvAJ84XL+O0Wun1mOcmW
	vH/NEPellXcISBCt7yKKdCKi8L4xQpYjCgIujb2RDXl91M/Ze0638kpTFs1OB7TbqulRy5eYX64
	YV5Zqg==
X-Received: by 2002:a05:600c:628d:b0:499:4892:d022 with SMTP id 5b1f17b1804b1-499c19bd51emr191879515e9.8.1787576443740;
        Mon, 24 Aug 2026 06:00:43 -0700 (PDT)
Received: from FRSMI25-LASER.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499c35935f5sm61379865e9.2.2026.08.24.06.00.42
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 06:00:42 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 06/19] libssh2: fix CVE-2026-66035
Date: Mon, 24 Aug 2026 14:59:48 +0200
Message-ID: <5f5c4afa331cf0f4df845092071f712e9ba50fc7.1787576160.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1787576160.git.yoann.congal@smile.fr>
References: <cover.1787576160.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 24 Aug 2026 13:00:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244102

From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>

Reference:
https://nvd.nist.gov/vuln/detail/CVE-2026-66035
https://github.com/libssh2/libssh2/commit/42e33d81577ed4b95d4b4f6f845e5ee8efe5eeb4

libssh2 ptest results (qemux86-64):
  before: PASSED: 1 FAILED: 0 SKIPPED: 0
  after:  PASSED: 1 FAILED: 0 SKIPPED: 0

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
Signed-off-by: Fabien Thomas <fabien.thomas@smile.fr>
---
 .../libssh2/libssh2/CVE-2026-66035.patch      | 56 +++++++++++++++++++
 .../recipes-support/libssh2/libssh2_1.11.1.bb |  1 +
 2 files changed, 57 insertions(+)
 create mode 100644 meta/recipes-support/libssh2/libssh2/CVE-2026-66035.patch

diff --git a/meta/recipes-support/libssh2/libssh2/CVE-2026-66035.patch b/meta/recipes-support/libssh2/libssh2/CVE-2026-66035.patch
new file mode 100644
index 00000000000..7c15f92fb6d
--- /dev/null
+++ b/meta/recipes-support/libssh2/libssh2/CVE-2026-66035.patch
@@ -0,0 +1,56 @@
+From 6671019836476649792eea12868a370133be1abe Mon Sep 17 00:00:00 2001
+From: Viktor Szakats <commit@vsz.me>
+Date: Fri, 3 Jul 2026 18:22:55 +0200
+Subject: [PATCH] transport: fix potential heap overflow on ETM decrypt
+
+Reported-by: Vladimir Eli Tokarev
+Fixes GHSA-6c79-444r-wx26
+
+Closes #2198
+
+Backport adaptations:
+- The upstream fix uses SSH2_SAFEFREE() to safely release allocated
+  memory and reset the pointer. Since SSH2_SAFEFREE() is not available
+  in libssh2 1.11.1, replace its usage with the equivalent NULL check,
+  LIBSSH2_FREE(), and pointer reset sequence.
+- The upstream fix renames decrypt() to transport_decrypt(). Since this
+  rename is not present in libssh2 1.11.1, retain the original
+  decrypt() function name.
+
+CVE: CVE-2026-66035
+Upstream-Status: Backport [https://github.com/libssh2/libssh2/commit/42e33d81577ed4b95d4b4f6f845e5ee8efe5eeb4]
+Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
+---
+ src/transport.c | 12 +++++++++++-
+ 1 file changed, 11 insertions(+), 1 deletion(-)
+
+diff --git a/src/transport.c b/src/transport.c
+index d147505b..9f386e75 100644
+--- a/src/transport.c
++++ b/src/transport.c
+@@ -242,6 +242,17 @@ fullpacket(LIBSSH2_SESSION * session, int encrypted /* 1 or 0 */ )
+                 unsigned char *decrypt_buffer;
+                 int blocksize = session->remote.crypt->blocksize;
+ 
++                if(p->total_num < mac_len + 4 + (size_t)blocksize) {
++                    if(p->payload) {
++                        LIBSSH2_FREE(session, p->payload);
++                        p->payload = NULL;
++                    }
++                    return LIBSSH2_ERROR_DECRYPT;
++                }
++                decrypt_size = (ssize_t)(p->total_num - mac_len - 4);
++
++                first_block[0] = 0;
++
+                 rc = decrypt(session, p->payload + 4,
+                              first_block, blocksize, FIRST_BLOCK);
+                 if(rc) {
+@@ -249,7 +260,6 @@ fullpacket(LIBSSH2_SESSION * session, int encrypted /* 1 or 0 */ )
+                 }
+ 
+                 /* we need buffer for decrypt */
+-                decrypt_size = p->total_num - mac_len - 4;
+                 decrypt_buffer = LIBSSH2_ALLOC(session, decrypt_size);
+                 if(!decrypt_buffer) {
+                     return LIBSSH2_ERROR_ALLOC;
diff --git a/meta/recipes-support/libssh2/libssh2_1.11.1.bb b/meta/recipes-support/libssh2/libssh2_1.11.1.bb
index 7d3063d9304..faa34ba3eb6 100644
--- a/meta/recipes-support/libssh2/libssh2_1.11.1.bb
+++ b/meta/recipes-support/libssh2/libssh2_1.11.1.bb
@@ -19,6 +19,7 @@ SRC_URI = "http://www.libssh2.org/download/${BP}.tar.gz \
            file://CVE-2026-66032.patch \
            file://CVE-2026-66033.patch \
            file://CVE-2026-66034.patch \
+           file://CVE-2026-66035.patch \
            "
 
 SRC_URI[sha256sum] = "d9ec76cbe34db98eec3539fe2c899d26b0c837cb3eb466a56b0f109cabf658f7"

