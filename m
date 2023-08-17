Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61784C05052
	for <webhook@archiver.kernel.org>; Thu, 17 Aug 2023 02:50:16 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.web11.178665.1692240607374227394
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Aug 2023 19:50:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=wdjIqxTW;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.171, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-1bb84194bf3so46608195ad.3
        for <openembedded-core@lists.openembedded.org>; Wed, 16 Aug 2023 19:50:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1692240606; x=1692845406;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uvUmtJ91nBy5++lbX17ITYLm38x53gKCYOVxwH2RwAQ=;
        b=wdjIqxTWkPnoaZ0PHaAUnJdDVbuN0XGvlkcjwX/bZ+69lJPSzegqBELOJenb2BlQQ8
         vLqP8uKavcNRGJnNlAo8ViQlcGHeJZeQ2muN3JiQsFV3JSSu2vTksdUAFMAKnvLyZ7JO
         aZdemmq7uNDi7sKc2JL0aHRvqvWrZD9xTlq5ZabbNN/2uo+EXVH7zYe92ADwVD2rO10/
         Xx3uKM87bXyqb/JaoS54kW91onuJlPCA+l6UzQ0PU5/g8rdZnQZrrZKhHI2RFAEV/e0/
         FnUj63q8LYqec3Z2wCI9R6NFzETMSTUJwBccfZF9MMOiVSBujXP37s11F58UXRD9RGzH
         /6uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692240606; x=1692845406;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uvUmtJ91nBy5++lbX17ITYLm38x53gKCYOVxwH2RwAQ=;
        b=iBDITyWh2cbVyX7ft1qLcv9zCbf/QM4unkCcr9sTknsduGnjRHh2z++7yZaqntNWEB
         RpKdXxlgJR76O63MRsTN1FkuoTvio23r0+F4GlejqA7aHshVcgYASNpSxhljiPSqAxOb
         CIqUL5WM/xny6DMN52P4fiqT0wnv23gvDaPdFanX4Ce0F38PaUyqxZKtNZHh4flf0muL
         /Mmwi4wt0kzPcuQelV9Wo2vPHb/MowDGWZu566ZeYnk6vKsAfs3oekO1DCRov78HIIJe
         rpmgFlFkCJcPyGrd5nlsv/qp4wQ8Mh1CorQrm6Pet+ScgY+o19ClKpJHLN77CMbuw9Vv
         DFMw==
X-Gm-Message-State: AOJu0YyKBKXR5geVEX2x1uiixPifcVL8foYA8JPP1hrk6EybB9ub0u+V
	yXUZyxRi3SBAMh3KX5tRynyd4JlUehj4raXA7X4=
X-Google-Smtp-Source: AGHT+IEniFY+6+OL9dydQA3Q/GKrcmNLpVuVOMlwuDKzPII5Yia91eckJNT1hsi9fsCQ5g0cyP6TmA==
X-Received: by 2002:a17:902:eccc:b0:1b8:9044:b8ae with SMTP id a12-20020a170902eccc00b001b89044b8aemr4227387plh.11.1692240606454;
        Wed, 16 Aug 2023 19:50:06 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id o5-20020a170902d4c500b001bb9bc8d232sm13827594plg.61.2023.08.16.19.50.05
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Aug 2023 19:50:06 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 06/16] qemu: fix CVE-2023-3180
Date: Wed, 16 Aug 2023 16:49:38 -1000
Message-Id: <de421cab92c49ba0f068eae9d6b458a0368fcd03.1692239433.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1692239433.git.steve@sakoman.com>
References: <cover.1692239433.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Aug 2023 02:50:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186271

From: Archana Polampalli <archana.polampalli@windriver.com>

A flaw was found in the QEMU virtual crypto device while handling data
encryption/decryption requests in virtio_crypto_handle_sym_req.
There is no check for the value of `src_len` and `dst_len` in
virtio_crypto_sym_op_helper, potentially leading to a heap buffer
overflow when the two values differ.

References:
https://nvd.nist.gov/vuln/detail/CVE-2023-3180

Upstream patches:
https://gitlab.com/qemu-project/qemu/-/commit/49f1e02bac166821c712534aaa775f50e1afe17f

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/qemu/qemu.inc           |  1 +
 .../qemu/qemu/CVE-2023-3180.patch             | 50 +++++++++++++++++++
 2 files changed, 51 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2023-3180.patch

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index 3347a99e19..d77c376bb6 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -99,6 +99,7 @@ SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
            file://CVE-2023-2861.patch \
 	   file://CVE-2020-14394.patch \
 	   file://CVE-2023-3354.patch \
+	   file://CVE-2023-3180.patch \
            "
 UPSTREAM_CHECK_REGEX = "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
 
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2023-3180.patch b/meta/recipes-devtools/qemu/qemu/CVE-2023-3180.patch
new file mode 100644
index 0000000000..30080924c8
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2023-3180.patch
@@ -0,0 +1,50 @@
+From 49f1e02bac166821c712534aaa775f50e1afe17f Mon Sep 17 00:00:00 2001
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
+Fixes: 04b9b37edda("virtio-crypto: add data queue processing handler")
+Cc: Gonglei <arei.gonglei@huawei.com>
+Cc: Mauro Matteo Cascella <mcascell@redhat.com>
+Cc: Yiming Tao <taoym@zju.edu.cn>
+Signed-off-by: zhenwei pi <pizhenwei@bytedance.com>
+Message-Id: <20230803024314.29962-2-pizhenwei@bytedance.com>
+Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
+Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
+(cherry picked from commit 9d38a8434721a6479fe03fb5afb150ca793d3980)
+Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
+
+Upstream-Status: Backport [https://gitlab.com/qemu-project/qemu/-/commit/49f1e02bac166821c712534aaa775f50e1afe17f]
+CVE: CVE-2023-3180
+Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
+---
+ hw/virtio/virtio-crypto.c | 5 +++++
+ 1 file changed, 5 insertions(+)
+
+diff --git a/hw/virtio/virtio-crypto.c b/hw/virtio/virtio-crypto.c
+index a1d122b9aa..ccaa704530 100644
+--- a/hw/virtio/virtio-crypto.c
++++ b/hw/virtio/virtio-crypto.c
+@@ -635,6 +635,11 @@ virtio_crypto_sym_op_helper(VirtIODevice *vdev,
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


