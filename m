Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6F5ACA0EDD
	for <webhook@archiver.kernel.org>; Tue, 12 Sep 2023 13:53:48 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.web10.25441.1694526822770354120
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Sep 2023 06:53:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=wiVuFyAO;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.182, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-1c1e780aa95so38222635ad.3
        for <openembedded-core@lists.openembedded.org>; Tue, 12 Sep 2023 06:53:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1694526822; x=1695131622; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oMAl8RKzF+eU+fKvOAwBGlzuSRBGavQ6c4Fj7BxUrCk=;
        b=wiVuFyAOJ+aVSLxI3yNgXftgNCJwvrm2sqgypSSgxUbbJDRPteBGiZeYOK2ybChDVL
         NX7EcS9X/xTGaIadHNs9zffgLYSkioPWjbPmMVJxDgXl/kpV9MplOudHaJd2oV85NMWP
         PD64Sx2iXlAfdekrlqDwHZTa16Hwxrrq95gPTMqzIIfLxep9zs3sZsVi9+I3Wg7IIv1v
         W6JeVhyEJtAdobdIeKUli1t6g/s8Dlt7QGQmoPTBV6CNb8fBaEa6+ZdSAZJbhPj4d6+8
         zfoOtGKkLewtYw1MaCiMsqOCDEMObdGuzia+NLgHsDoDr/Vbm5hkBqqyOkm3gQQYw2hn
         Qbtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694526822; x=1695131622;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oMAl8RKzF+eU+fKvOAwBGlzuSRBGavQ6c4Fj7BxUrCk=;
        b=FRT/KefiuLqqi4RdVBAt+9X9+oQAi3fAIO81nM8pcq/1VFxrEEN3frSocVDfyU6/nG
         Zj9UXgDD8kNI7zcsUZYcbKdH23eBgsOoQHJml7LMt9fb5aFTZwNiaGXuSsCWej84MFol
         xhhJJ3PwJiUAlqt2xdt2aHqxUOFu/AABjRIW4xmUI+FPlsLyVkhHRIqlXZGgHWxaHK2j
         sphkSZz+bjiW4Po4JSuKllp3AR5TNyru/FB8d1BvC7VwF3W/BelT2F8edPOOc1kM9FEO
         Jt96fNdU6SlrtMMF3oTX64vIkHAamQUBKyL90ofbafJ/Z2d+qyEOsXfbCnh0HG2mmYWs
         067g==
X-Gm-Message-State: AOJu0YxINK1LNJanBdLbgTaFwkWXDZpmTt1DW6uZGN/kLb3c84u45Wdt
	qf4upGxmNMNKI1lvDWamy9SDX2gDKsbXmwoZdFE=
X-Google-Smtp-Source: AGHT+IExLbe8gLSy5WRLOIW8RxgkMq7SbuwjANerhf4rxlX/yi49TLnuNZ3OtnZpLuJ/L8cHzK59QA==
X-Received: by 2002:a17:902:b489:b0:1bb:1523:b311 with SMTP id y9-20020a170902b48900b001bb1523b311mr9870331plr.41.1694526821617;
        Tue, 12 Sep 2023 06:53:41 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id j7-20020a170902da8700b001bdeedd8579sm7635246plx.252.2023.09.12.06.53.40
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Sep 2023 06:53:40 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 03/14] qemu: Backport fix CVE-2023-3180
Date: Tue, 12 Sep 2023 03:53:12 -1000
Message-Id: <edbc17315927a711aa9fae7c6cfba61cbf8ab5ad.1694526588.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1694526588.git.steve@sakoman.com>
References: <cover.1694526588.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 Sep 2023 13:53:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187518

From: Ashish Sharma <asharma@mvista.com>

Upstream-Status: Backport from [https://gitlab.com/qemu-project/qemu/-/commit/9d38a8434721a6479fe03fb5afb150ca793d3980]
CVE: CVE-2023-3180
Signed-off-by: Ashish Sharma <asharma@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/qemu/qemu.inc           |  1 +
 .../qemu/qemu/CVE-2023-3180.patch             | 49 +++++++++++++++++++
 2 files changed, 50 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2023-3180.patch

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index 2871818cb1..3789d77046 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -139,6 +139,7 @@ SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
            file://hw-display-qxl-Pass-requested-buffer-size-to-qxl_phy.patch \
            file://CVE-2023-0330.patch \
            file://CVE-2023-3354.patch \
+	   file://CVE-2023-3180.patch \
            "
 UPSTREAM_CHECK_REGEX = "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
 
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2023-3180.patch b/meta/recipes-devtools/qemu/qemu/CVE-2023-3180.patch
new file mode 100644
index 0000000000..7144bdca46
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2023-3180.patch
@@ -0,0 +1,49 @@
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
+Fixes: 04b9b37edda("virtio-crypto: add data queue processing handler")
+Cc: Gonglei <arei.gonglei@huawei.com>
+Cc: Mauro Matteo Cascella <mcascell@redhat.com>
+Cc: Yiming Tao <taoym@zju.edu.cn>
+Signed-off-by: zhenwei pi <pizhenwei@bytedance.com>
+Message-Id: <20230803024314.29962-2-pizhenwei@bytedance.com>
+Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
+Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
+
+Upstream-Status: Backport from [https://gitlab.com/qemu-project/qemu/-/commit/9d38a8434721a6479fe03fb5afb150ca793d3980]
+CVE: CVE-2023-3180
+Signed-off-by: Ashish Sharma <asharma@mvista.com>
+
+ hw/virtio/virtio-crypto.c | 5 +++++
+ 1 file changed, 5 insertions(+)
+
+diff --git a/hw/virtio/virtio-crypto.c b/hw/virtio/virtio-crypto.c
+index 44faf5a522b..13aec771e11 100644
+--- a/hw/virtio/virtio-crypto.c
++++ b/hw/virtio/virtio-crypto.c
+@@ -634,6 +634,11 @@ virtio_crypto_sym_op_helper(VirtIODevice *vdev,
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
+GitLab
+
-- 
2.34.1


