Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C933E95A71
	for <webhook@archiver.kernel.org>; Sat,  7 Oct 2023 22:25:32 +0000 (UTC)
Received: from mail-oa1-f45.google.com (mail-oa1-f45.google.com [209.85.160.45])
 by mx.groups.io with SMTP id smtpd.web11.27671.1696717525512736051
 for <openembedded-core@lists.openembedded.org>;
 Sat, 07 Oct 2023 15:25:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=WgC0xaX7;
 spf=softfail (domain: sakoman.com, ip: 209.85.160.45, mailfrom: steve@sakoman.com)
Received: by mail-oa1-f45.google.com with SMTP id 586e51a60fabf-1e113555a47so2191406fac.2
        for <openembedded-core@lists.openembedded.org>; Sat, 07 Oct 2023 15:25:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1696717524; x=1697322324; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9yezd/3bGvLpK+xF3LpGXcglH6C1tv7g/zrMJYdXp1I=;
        b=WgC0xaX7Urby3tFORknM+CU8hfkZen7zmguiO+py2CNoppV7qbtrkOaLuweb1sS4lD
         ElmHf1qrCYKlVU5M60cMO/9onKbfQyBsZ1ezLHV8oWr3o82AIp3/F9r6DCnt4izaPxCY
         ium1dgfHqj4hlvjhcEQfCJO4jnii1dOI32lgxNUAvmlaWVMZ7rIfGG+9STyGoYo7+xrs
         si5tn9v5xzQFjuH2/xr234ITrsyirdwl9PF9JXl3QBDyHZT1F0+jFJIXW3RF7CPlN2zf
         1TZ1pPY0v+hBy7m5oXGQrANi0KlUWruic202ir28zXQc0GYcatDvliG9AWCgZvIqbOje
         a8CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696717524; x=1697322324;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9yezd/3bGvLpK+xF3LpGXcglH6C1tv7g/zrMJYdXp1I=;
        b=F/WCSP0ob6WjiMbOOltUl0jd1p9z35m3YBQBDHMGsebZ/BT3oyLOkBucNB+ChdyX+h
         xT4zqZcRXoAFBI32NpP1H2lYpih1C22tju6iVdJ46/IBlfqIEYzoEbjE9UDcX0tE3EMU
         uOpJSSD012hYae6XU/uXf/Hb5A/Y1DqruoF0lN2bktDpheOkqv9zcS3CN0vu5rEF9WrT
         MQLusgxvD77F0mQR3H2dJmk/a06izC+QcMMkgsHylwN4q00i2xQEXpsP0XwGy9JWgj8S
         ONMrVQSmD3hYVLr16QXMi/g6yzcU9pwJRsbR0zWt/jTVCL3LDv4AFwm2l10/OH5jYwID
         kjwA==
X-Gm-Message-State: AOJu0YwUQlg8v1BwbI0IkOdQfgwBLj8ksQ5h2cluTAPd8OSl/gVBiTy3
	hWzhGYaRTlt22bW3CbsEWeiQGsAy9BVkai7buKE=
X-Google-Smtp-Source: AGHT+IHbakkSk6g3QOGe9rv+MXebLmXM7pMxfQ6ElpcIWbUxC5Cv3HkhX7+UIssjr8ua87xWk1mY1Q==
X-Received: by 2002:a05:6870:63aa:b0:1bf:61e3:df1 with SMTP id t42-20020a05687063aa00b001bf61e30df1mr14875709oap.50.1696717524343;
        Sat, 07 Oct 2023 15:25:24 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id jj15-20020a170903048f00b001b8c6890623sm6424076plb.7.2023.10.07.15.25.23
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Oct 2023 15:25:24 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 01/19] qemu: Fix CVE-2023-3180
Date: Sat,  7 Oct 2023 12:24:57 -1000
Message-Id: <2038b5e977481cac2e9e35101a467fbd5268231e.1696702947.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1696702947.git.steve@sakoman.com>
References: <cover.1696702947.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 07 Oct 2023 22:25:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188802

From: Soumya Sambu <soumya.sambu@windriver.com>

A flaw was found in the QEMU virtual crypto device while handling
data encryption/decryption requests in virtio_crypto_handle_sym_req.
There is no check for the value of `src_len` and `dst_len` in
virtio_crypto_sym_op_helper, potentially leading to a heap buffer
overflow when the two values differ.

References:
https://nvd.nist.gov/vuln/detail/CVE-2023-3180

Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/qemu/qemu.inc           |  1 +
 .../qemu/qemu/CVE-2023-3180.patch             | 52 +++++++++++++++++++
 2 files changed, 53 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2023-3180.patch

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index c8e1d28654..cd17a11335 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -41,6 +41,7 @@ SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
 	   file://CVE-2023-3255.patch \
 	   file://CVE-2023-2861.patch \
 	   file://CVE-2023-3354.patch \
+	   file://CVE-2023-3180.patch \
            "
 UPSTREAM_CHECK_REGEX = "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
 
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2023-3180.patch b/meta/recipes-devtools/qemu/qemu/CVE-2023-3180.patch
new file mode 100644
index 0000000000..cd9f85fd43
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2023-3180.patch
@@ -0,0 +1,52 @@
+From 9d38a8434721a6479fe03fb5afb150ca793d3980 Mon Sep 17 00:00:00 2001
+From: zhenwei pi <pizhenwei@bytedance.com>
+Date: Thu, 3 Aug 2023 10:43:13 +0800
+Subject: [PATCH] virtio-crypto: verify src&dst buffer length for sym request
+
+For symmetric algorithms, the length of ciphertext must be as same
+as the plaintext.
+The missing verification of the src_len and the dst_len in
+virtio_crypto_sym_op_helper() may lead buffer overflow/divulged.
+
+This patch is originally written by Yiming Tao for QEMU-SECURITY,
+resend it(a few changes of error message) in qemu-devel.
+
+Fixes: CVE-2023-3180
+Fixes: 04b9b37e
+
+("virtio-crypto: add data queue processing handler")
+Cc: Gonglei <arei.gonglei@huawei.com>
+Cc: Mauro Matteo Cascella <mcascell@redhat.com>
+Cc: Yiming Tao <taoym@zju.edu.cn>
+Signed-off-by: zhenwei pi <pizhenwei@bytedance.com>
+Message-Id: <20230803024314.29962-2-pizhenwei@bytedance.com>
+Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
+Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
+
+CVE: CVE-2023-3180
+
+Upstream-Status: Backport from [https://gitlab.com/qemu-project/qemu/-/commit/9d38a8434721a6479fe03fb5afb150ca793d3980]
+
+Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
+---
+ hw/virtio/virtio-crypto.c | 5 +++++
+ 1 file changed, 5 insertions(+)
+
+diff --git a/hw/virtio/virtio-crypto.c b/hw/virtio/virtio-crypto.c
+index 97da74e71..fdb592861 100644
+--- a/hw/virtio/virtio-crypto.c
++++ b/hw/virtio/virtio-crypto.c
+@@ -633,6 +633,11 @@ virtio_crypto_sym_op_helper(VirtIODevice *vdev,
+         return NULL;
+     }
+
++    if (unlikely(src_len != dst_len)) {
++        virtio_error(vdev, "sym request src len is different from dst len");
++        return NULL;
++    }
++
+     max_len = (uint64_t)iv_len + aad_len + src_len + dst_len + hash_result_len;
+     if (unlikely(max_len > vcrypto->conf.max_size)) {
+         virtio_error(vdev, "virtio-crypto too big length");
+--
+2.40.0
-- 
2.34.1


