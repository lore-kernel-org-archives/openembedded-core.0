Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B962DC369DF
	for <webhook@archiver.kernel.org>; Tue, 22 Apr 2025 14:35:26 +0000 (UTC)
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
 by mx.groups.io with SMTP id smtpd.web10.41500.1745332521494520748
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Apr 2025 07:35:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=S7z1CCnx;
 spf=pass (domain: linaro.org, ip: 209.85.167.51, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-54d3ee30af1so5447664e87.0
        for <openembedded-core@lists.openembedded.org>; Tue, 22 Apr 2025 07:35:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745332520; x=1745937320; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Sjv8C7m6ZifQlLt6LwTFsO+qlA2Xw+bFA92NkFqtFLY=;
        b=S7z1CCnxhVUj2Pd0O6BU/Wpsfg+aAvbSr3wPCdVn3H+4vTZXjh0/h4/70uR2Fh3G95
         QGnvWlVvxJmOe3csd9KepdRoG5KAFFFRkLskw8v+PBtjrCVoVxZ9AucHAH1gLLhpPtMJ
         Yy9t+T73hVXKbB2NjhtlQ4umzH9r8M2n0OUJCiBAHZBZkBMbjMZT4XBCWIG1elY7JdN3
         b+7ESfdqa+JXHm26iNCegXaM6IyqECtEYo825iOwccJXxYbjlAn3RuUtQNekzKZ4Tqex
         ljOCWwep+mgxXPYM1tKSAVa1IsRMKpcS0HJDXZ/I6BuPUEH+qqri9bILJRbvs6zQ0bdY
         peDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745332520; x=1745937320;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Sjv8C7m6ZifQlLt6LwTFsO+qlA2Xw+bFA92NkFqtFLY=;
        b=KDDqQ19ucs2sgyo24VU8CJ+kOGeTZ1Gp9ipjFmfg54kV7/KrvS59IDl4Bo9UldxA75
         ALmuGi+pE5y1wOJdbzF8ueBmTor3Gy93rN9zZiVD87VBeHM5/XOTUIuIXWB4uV8nOcb1
         G7dkV+t85n74HsSsOAw4UvapLHcpJ3NSfyq2Qhz/YCLA7pfE9Zptx+Az8dJa51aqt4hj
         00EuQomeiDw6R/zj/sBmV/7nhwiKzzIaEt2lXxoGnxrtKHSaar78F0eCaeevvFn9H001
         yGdOz823srUiB7HZHPT3xV2H6JDokAQXrHsqVdJCwDVMfKUeQs3fjUL/QKwg/xJsK84l
         beOA==
X-Gm-Message-State: AOJu0Yw0W405bjQ06eaodQcRLtObZdme6VeTTmOQnOexfnS6xZm/hBGx
	Q5rTBj4poXpL/KetEIn7L+Olg5mZjyuiocL8WY2sKZvYAjkdkiQ+qyzT1oDlNrc3w85Gm7rJJYL
	Ia7U=
X-Gm-Gg: ASbGncsNSEIpHAG4GlTIjmR8hX9uJAmIh/6deka/EiNQBIyY5SDgQn+3BHEhO7vzUtk
	UaMTgtUyoxuNs6y7CpLd//vH1whZFNjgMM1rNUAg0eKXTnyw6gXUl8eM/ef5k1DsnCd0Tsda/ET
	OeuWg0QY1el4xgsCIS5mqf6lWn+dbMrUeHuIOmDFYQqk/y/Ok+NKiq2v+ZemfA4prAOXhyAGQMj
	8GBpTMyAGqFJ3KJ6aZI1F17SxYE/UMhGTxpHDYVTzHwaXIOIx33E4rmdqdvJq++oMz/HdfDr4C/
	X2/8A4SsfTgSX53YlQPBMSvOsqlt4iou+0I/+GVRo+vReBkguhs05ADRxX9ov5gj0CrOxhNXMWx
	YILtY6gAQYjQuJ4TAZA==
X-Google-Smtp-Source: AGHT+IEhECyAL2/v+KUAhZe8Y6VYVv35O3G3apONrzcjDMaZQdOxh5D/w1HSqI284dmmUB5EU0N6mQ==
X-Received: by 2002:a05:6512:32c3:b0:54d:6e19:ba9b with SMTP id 2adb3069b0e04-54d6e63fb3fmr4232067e87.34.1745332519525;
        Tue, 22 Apr 2025 07:35:19 -0700 (PDT)
Received: from localhost.localdomain (87-100-218-141.bb.dnainternet.fi. [87.100.218.141])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54d6e5d0837sm1236503e87.118.2025.04.22.07.35.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Apr 2025 07:35:19 -0700 (PDT)
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: [PATCH v4 3/9] core-image-initramfs-boot: add option to build systemd based initrd
Date: Tue, 22 Apr 2025 17:34:55 +0300
Message-ID: <20250422143501.99565-4-mikko.rapeli@linaro.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250422143501.99565-1-mikko.rapeli@linaro.org>
References: <20250422143501.99565-1-mikko.rapeli@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 22 Apr 2025 14:35:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215217

If "systemd-initramfs" is in IMAGE_FEATURES then convert
core-image-initramfs-boot from shell scripts to systemd.
The resulting initramfs is much bigger than shell script one but
supports much more features like disk encryption and TPM devices.
Also includes udev which can load any drivers needed to mount
rootfs.

Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
---
 .../images/core-image-initramfs-boot.bb       | 22 ++++++++++++++++---
 1 file changed, 19 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-core/images/core-image-initramfs-boot.bb b/meta/recipes-core/images/core-image-initramfs-boot.bb
index 7258944751..2a3fa6d2e0 100644
--- a/meta/recipes-core/images/core-image-initramfs-boot.bb
+++ b/meta/recipes-core/images/core-image-initramfs-boot.bb
@@ -4,7 +4,25 @@ LICENSE = "MIT"
 
 INITRAMFS_SCRIPTS ?= "initramfs-framework-base initramfs-module-udev"
 
-PACKAGE_INSTALL = "${INITRAMFS_SCRIPTS} ${VIRTUAL-RUNTIME_base-utils} base-passwd"
+inherit image
+
+IMAGE_FEATURES[validitems] += "systemd-initramfs"
+
+PACKAGE_INSTALL = " \
+    ${VIRTUAL-RUNTIME_base-utils} \
+    ${@bb.utils.contains('IMAGE_FEATURES', 'systemd-initramfs', ' \
+        base-files \
+        coreutils \
+        e2fsprogs-mke2fs \
+        os-release-initrd \
+        util-linux-blkid \
+        util-linux-mount \
+        util-linux-umount \
+        ${VIRTUAL-RUNTIME_init_manager} \
+        ${VIRTUAL-RUNTIME_dev_manager} \
+    ', '${INITRAMFS_SCRIPTS}', d)} \
+    base-passwd \
+"
 
 # Ensure the initramfs only contains the bare minimum
 IMAGE_FEATURES = ""
@@ -18,5 +36,3 @@ IMAGE_FSTYPES = "${INITRAMFS_FSTYPES}"
 IMAGE_NAME_SUFFIX ?= ""
 IMAGE_ROOTFS_SIZE = "8192"
 IMAGE_ROOTFS_EXTRA_SPACE = "0"
-
-inherit image
-- 
2.43.0


