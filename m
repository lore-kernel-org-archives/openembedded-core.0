Return-Path: <fabien.thomas@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 452F4C5B572
	for <webhook@archiver.kernel.org>; Wed, 19 Aug 2026 15:58:02 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10337.1787155081512064175
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Aug 2026 08:58:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=wgMTMFa5;
 spf=pass (domain: smile.fr, ip: 209.85.221.54, mailfrom: fabien.thomas@smile.fr)
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-47f703a9d05so798165f8f.0
        for <openembedded-core@lists.openembedded.org>; Wed, 19 Aug 2026 08:58:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1787155080; x=1787759880; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=cSPM3zMNtmHiVLFAleq6A173W/P76aQQ4V89Rtt1Cm0=;
        b=wgMTMFa5EADdpHbuDCgAe8SAO6nQpsPXMn77GbrK4Oz8GgDZ/y18ANoBhg8AsxGHwH
         QRh++Yj9AJJuWs4iMIwyuHA0iy7KNc5ymDHAfWRF+6irrDn67dCPhOvXnic8GK18QH4+
         mfTDxyiWjdGmbTOM6ad/OcIIv7XNYzzuJ9WR0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787155080; x=1787759880;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=cSPM3zMNtmHiVLFAleq6A173W/P76aQQ4V89Rtt1Cm0=;
        b=ffTqyWiXjnAhaxGdXAHIjHDBZ6T1gLUBebugFHU5pWipx1Lj9ywrHU/ZJFnHpKgkGq
         CCWKTXXOl3ivBsyEQNeG/CdNEfppmvLvxTvO0p8DwTpu49k2OC8EnOtUcD6o071k6evD
         IRi+xrd5zwh1unACNMYbimduZlreiDP2gZ75Zh2ErO9hwxwYcYeL23nlfVvGvuhLF8CE
         V9+LXBteNV4JZAQQynL8j9ih8CoGExXy8NiupV1T1rqcO3TGGtyA4rkTJJHwgA604y/B
         9Ttbg5gRGPVt5Jfv0Y5d3e219yNIf+sclL0X1RqQdczSKSXlKU8k923mrnvmHtNNk/y6
         rfEQ==
X-Gm-Message-State: AFuF++mYB8pUpNWCmd8bViNdtA9XeVUC9+bicNqS+VYoiUkUymLCeOO+
	epY/FwMj3L7n6qnpQLVr3XhoGknmK5NsxTLJz74Qs+dSDoMXf96CAwRaUZvY2x9XSUyxbybAc9i
	5jA71xmo=
X-Gm-Gg: AR+sD12Dyk+DgHYj6AV53l9RIwq91/N/LLPz53iekV5E/ZSiRMroMA3HTqeHDOh+KSt
	1wxz6CWWUSX6DCn8G5GxF8vcOc6Uu+Lo07GIWvzfiGEInT1u0+aV/PpYGgL+plffW6cfFPyQ63T
	E/376vBIoTPvVyIjB0qp7Auz4QGjvPNM37HJC41kse4hCgDkH6kkD9B59sHo6uG2SeBkdEzIEAK
	GzSFGSSnk3ZGReFi4jxGiA06CK2rTQw0c1dkmkv7gbgICCkITTHtze4NpEE0O39re4zTcmjyyAT
	TWoK/+sU71vbDT9ALgsN4qunTvNvnkHFiwVwiDktI4OXwo/3Rcv+laLGQ1yujYQjuoFNCqopLK+
	FKse2D+JYWN1AvJWukm7t3kd+a+hModLNWTIFYQCMxkTq9/l1z3mxzulYeaFSiLS/rusQ4OfeSu
	4N956+Mc/b7XaFF2nEZ8pSwXDg+7TiLT1OaB2tanUMcXQ64yTuZ8njhw1qkXLmi7AUR8/2+3p0S
	XcJnTYhmPyPNVD9LbrKt5HG+o1ERzDSO389QvbaKH/c10u6KK2YaenJS0HPzHwZwFFOaHJ2TkCz
	mpn06XCXJF/btH3HGQdEWZeHadTb65SR/JdrY/HT1g==
X-Received: by 2002:a5d:64e4:0:b0:47f:8b2c:3d98 with SMTP id ffacd0b85a97d-482b1e867b5mr9333913f8f.4.1787155079730;
        Wed, 19 Aug 2026 08:57:59 -0700 (PDT)
Received: from FRSMI25-GIGUE (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482b14d05a6sm7215698f8f.35.2026.08.19.08.57.59
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 08:57:59 -0700 (PDT)
From: Fabien Thomas <fabien.thomas@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 35/37] libssh2: fix CVE-2026-66035
Date: Wed, 19 Aug 2026 17:57:06 +0200
Message-ID: <b3b8b568513081dcf3e344ba7f0409025b20d40b.1787154074.git.fabien.thomas@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1787154074.git.fabien.thomas@smile.fr>
References: <cover.1787154074.git.fabien.thomas@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Aug 2026 15:58:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243771

From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>

Reference:
https://nvd.nist.gov/vuln/detail/CVE-2026-66035
https://github.com/libssh2/libssh2/commit/42e33d81577ed4b95d4b4f6f845e5ee8efe5eeb4

libssh2 ptest results (qemux86-64):
  before: PASSED: 1 FAILED: 0 SKIPPED: 0
  after:  PASSED: 1 FAILED: 0 SKIPPED: 0

(From OE-Core rev: 6bfaa957e88c866c9e8257adb165150a2fd6c8d3)

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
index e2872c335b0..d14a27f3dc3 100644
--- a/meta/recipes-support/libssh2/libssh2_1.11.1.bb
+++ b/meta/recipes-support/libssh2/libssh2_1.11.1.bb
@@ -19,6 +19,7 @@ SRC_URI = "http://www.libssh2.org/download/${BP}.tar.gz \
            file://CVE-2026-66032.patch \
            file://CVE-2026-66033.patch \
            file://CVE-2026-66034.patch \
+           file://CVE-2026-66035.patch \
            "
 
 SRC_URI[sha256sum] = "d9ec76cbe34db98eec3539fe2c899d26b0c837cb3eb466a56b0f109cabf658f7"

