Return-Path: <asharma@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C491DEB8FAF
	for <webhook@archiver.kernel.org>; Wed,  6 Sep 2023 11:10:51 +0000 (UTC)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.web11.5828.1693998643496745267
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Sep 2023 04:10:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=W4w02Vvg;
 spf=pass (domain: mvista.com, ip: 209.85.210.176, mailfrom: asharma@mvista.com)
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-68a42d06d02so2494285b3a.0
        for <openembedded-core@lists.openembedded.org>; Wed, 06 Sep 2023 04:10:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1693998643; x=1694603443; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1Y4Rz7NrNrNZ8xBAhiBFgTc56x93wIhJS0mtRVbqr+Q=;
        b=W4w02Vvg/+IgdQMX8/FOkvdRCAGGPBEG/HzfTCvxkDUU+ft8jwpSugoIEa/UpgQtDC
         vr42kUTDV/5yXBDGlms6ltzpA0N+Xxh3GySxzZSN/s6jOY+Ei4ncX2/rWEZJ6qf45haz
         5PRqh9qjPX2gnESHxJNuQnsG+mn6CbzXU8EXg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693998643; x=1694603443;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1Y4Rz7NrNrNZ8xBAhiBFgTc56x93wIhJS0mtRVbqr+Q=;
        b=OQ/WYuedL5BlSeleO+Tvykqhc3W8VgU2G3++IJ5QuBknNCIorfDSPRO9+yEXuO1FH3
         hD6Zy1bbhcIh5RYxcPfxLM2Q03HgIlqAWcEQHbrZRpf8E58dbTZSMOywcbPHYInIzbAO
         l8soMlfBR61FLMfPtIIPyRA77mA/VcI+WGP1+HC9S37l1toruJDJ8R+DmNu3POLRSxGM
         6Esz2r9I63c9FT1PCLbH4b2rxIjXOsfwJwznoNGyQHayc/7JDiC/d3WX60HCPOjGiN84
         z88jknBafVAnYFwSMBDtsYhtZGdiYbAjZqKwNxNMiOvhqHholCCd5gv1UIJTLfECrNDh
         nKZQ==
X-Gm-Message-State: AOJu0YyHvMwAKnHGZNRwF7DQn4Q2rW/IGl1EA4YjWqblTdG8lu83C4Ax
	EqXJ1q1S44Dpo+fJeDAosjfRZcHRvjxVPOlkwhk=
X-Google-Smtp-Source: AGHT+IE25Ij7TXdmlE6eigSpJWhD2spRyvWU71giTAXUi8iYoj69UMP736eaZbRUaToPUDTIY8kqug==
X-Received: by 2002:a05:6a00:2484:b0:68b:e7d4:2564 with SMTP id c4-20020a056a00248400b0068be7d42564mr15726529pfv.24.1693998642592;
        Wed, 06 Sep 2023 04:10:42 -0700 (PDT)
Received: from asharma-Latitude-3400 ([122.161.84.231])
        by smtp.gmail.com with ESMTPSA id c9-20020aa78c09000000b0068bff979c33sm10637993pfd.188.2023.09.06.04.10.40
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 06 Sep 2023 04:10:42 -0700 (PDT)
Received: by asharma-Latitude-3400 (sSMTP sendmail emulation); Wed, 06 Sep 2023 16:38:30 +0530
From: Ashish Sharma <asharma@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Ashish Sharma <asharma@mvista.com>
Subject: [OE-core][dunfell][PATCH] qemu: Backport fix CVE-2023-3180
Date: Wed,  6 Sep 2023 16:38:26 +0530
Message-Id: <20230906110826.19020-1-asharma@mvista.com>
X-Mailer: git-send-email 2.24.4
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Sep 2023 11:10:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187292

Upstream-Status: Backport from [https://gitlab.com/qemu-project/qemu/-/commit/9d38a8434721a6479fe03fb5afb150ca793d3980]
CVE: CVE-2023-3180
Signed-off-by: Ashish Sharma <asharma@mvista.com>
---
 meta/recipes-devtools/qemu/qemu.inc           |  1 +
 .../qemu/qemu/CVE-2023-3180.patch             | 49 +++++++++++++++++++
 2 files changed, 50 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2023-3180.patch

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index ddb6ed999a5..678bc171f89 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -141,6 +141,7 @@ SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
            file://hw-display-qxl-Pass-requested-buffer-size-to-qxl_phy.patch \
            file://CVE-2023-0330.patch \
            file://CVE-2023-3354.patch \
+	   file://CVE-2023-3180.patch \
            "
 UPSTREAM_CHECK_REGEX = "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
 
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2023-3180.patch b/meta/recipes-devtools/qemu/qemu/CVE-2023-3180.patch
new file mode 100644
index 00000000000..7144bdca460
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
2.24.4


