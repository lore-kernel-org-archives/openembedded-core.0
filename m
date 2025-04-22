Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B8B5C369D7
	for <webhook@archiver.kernel.org>; Tue, 22 Apr 2025 14:35:26 +0000 (UTC)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
 by mx.groups.io with SMTP id smtpd.web10.41508.1745332522597638891
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Apr 2025 07:35:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=Ktq18l/k;
 spf=pass (domain: linaro.org, ip: 209.85.167.53, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-54996d30bfbso4749439e87.2
        for <openembedded-core@lists.openembedded.org>; Tue, 22 Apr 2025 07:35:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745332521; x=1745937321; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lZR+/q9VkB+zYItYNjMG4hWekOflju+fRFG49gvQKX8=;
        b=Ktq18l/k1WIs6mBreMJYYiArN6jUNFOTaky9nlKFNRzgSP9I5uj0wMrfgk4LqnIIPH
         hqBt0BTlTYYciulr/EtG6es6IIJaXpRQSu6yr4jK5JajPZUWhw3Up/gsvTR/w3Xu3ThW
         XJ3skshC+yenSJc/lNWXlSHJYFQGL9Fjmi8IldlRtWpkVDtryxnGeZFYufwUSxCaEpDw
         PFVdBpHNQtOLYpILNfuXcpAh8VuFTKRN/QVhOuN4rImhH+a7k+mweRUJoWDypyhQw7ps
         ezuCz5Ocq5odpzBbVwz1vG4ADD5HHS3kLTEyYYDjcUCxxdM7FJVTUzjliXiWSHoaOHC2
         sGng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745332521; x=1745937321;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lZR+/q9VkB+zYItYNjMG4hWekOflju+fRFG49gvQKX8=;
        b=O3nssHcNj5nIAklx1Grllb1jMg90vcs4cOr88L5zmSowR4aqvgSe0/7AFi6JJLWf13
         OGSKrfAbZ0q0ev+5QSP6qqwet7/MtcS4EFdOYKoBO9mbUaitWzi6HbetQSROp0JQnQIz
         QhHs1TtdZJgroGsRL/5n05TmyF61zUWiYAaX7h932RL1WB95KpJzMQEH2EkkopAMjS5I
         y6qrWQUKvzxPlO2XvFltGt1aPUF/JJ70mYoMVPMjhse9YbIqOoHqHu9jOU8BJeCvNvhu
         f7NF5Vd5IKYPyuQEWft30FpO149TtwnRYW5IoUcaM624aYBH+Wq8nGvPtRZ81UNlSwk6
         VxsA==
X-Gm-Message-State: AOJu0Yw3L/tPPfsbAhowTROz1GmKYa5dfhe4pYRBJmjBd+JD41VzhpfK
	NpucScYxowm2J/ZFzocUTpVov1HLsAA3feDjvOS+7a4JQyJaGNcpuE/0+aZJOVwYWqcPJEru4SI
	YPns=
X-Gm-Gg: ASbGncvqvF8yZgNSEPkMU8LLHwCJ9vO5dH62y0IGVtMJ/Z554zTWZFvB2dj8CXnBXL9
	X5p1vRT1aqQ3Z+6lspHOBgyesQRdwoGXnic+7wWvjrEvg+M39vik0fFlaxGqYVPyei5tHdsevZW
	Sv7l2AVyUQxQiW7JBoKQN9MpYx9cIOGsgdT1DCLuLA0NrfqIBmaJdA7prhQj+GwW3+qKT4TMffQ
	TW+yzJuj1gE0Qsd7ushSXTpm1XJUqX8vlF8404clcANx4nx+axZ+7Mb/EKT6Apj+H8IK09Tjiww
	Y1/hfGjCYWm4g76R7EWVq+NFgk6EIiJLZzkrYcfd3C13bMRay+3zD7Mn4bT3Jth6IE3YKPylK7m
	iByPTYy280tQOdJXSwekgIMqThFNu
X-Google-Smtp-Source: AGHT+IF3GHGJCnmsagbwjtrg/DhSfPKcRWZ9qsiZj0jYEH2moBIVTASOyyrS/RO++MWj/zYvq715Jw==
X-Received: by 2002:a05:6512:68f:b0:545:8c5:44cb with SMTP id 2adb3069b0e04-54d6e636e99mr4233364e87.31.1745332520671;
        Tue, 22 Apr 2025 07:35:20 -0700 (PDT)
Received: from localhost.localdomain (87-100-218-141.bb.dnainternet.fi. [87.100.218.141])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54d6e5d0837sm1236503e87.118.2025.04.22.07.35.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Apr 2025 07:35:20 -0700 (PDT)
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: [PATCH v4 4/9] core-image-initramfs-boot: don't install RRECOMMENDS to reduce size
Date: Tue, 22 Apr 2025 17:34:56 +0300
Message-ID: <20250422143501.99565-5-mikko.rapeli@linaro.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250422143501.99565-1-mikko.rapeli@linaro.org>
References: <20250422143501.99565-1-mikko.rapeli@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 22 Apr 2025 14:35:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215218

Disables recommends to only install important packages.
Disable machine specific additions which are meant for
full rootfs boot. For example on genericarm64, full
set of kernel modules and WiFi related firmware is
in the machine recommends and those are not needed when
booting to rootfs from an initrd. These reduce systemd
initrd size from 200Mb to 54Mb.

Since recommends are not automatically installed anymore,
explicitly add initramfs-module-rootfs, busybox-udhcpc and libkmod
to shell script based initrd. initramfs-module-rootfs is needed to
mount the rootfs. Installing busybox-udhcpc and libkmod
for backwards compatibility.

Not installing openssl-conf, openssl-ossl-module-legacy or
ldconfig packages since they don't seem essential in initrd
to mount the rootfs.

Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
---
 meta/recipes-core/images/core-image-initramfs-boot.bb | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/images/core-image-initramfs-boot.bb b/meta/recipes-core/images/core-image-initramfs-boot.bb
index 2a3fa6d2e0..e72efab55d 100644
--- a/meta/recipes-core/images/core-image-initramfs-boot.bb
+++ b/meta/recipes-core/images/core-image-initramfs-boot.bb
@@ -2,7 +2,7 @@ SUMMARY = "Basic initramfs to boot a fully-featured rootfs"
 DESCRIPTION = "Small initramfs that contains just udev and init, to find the real rootfs."
 LICENSE = "MIT"
 
-INITRAMFS_SCRIPTS ?= "initramfs-framework-base initramfs-module-udev"
+INITRAMFS_SCRIPTS ?= "initramfs-framework-base initramfs-module-udev initramfs-module-rootfs"
 
 inherit image
 
@@ -22,8 +22,17 @@ PACKAGE_INSTALL = " \
         ${VIRTUAL-RUNTIME_dev_manager} \
     ', '${INITRAMFS_SCRIPTS}', d)} \
     base-passwd \
+    busybox-udhcpc \
+    libkmod \
 "
 
+# reduce size
+NO_RECOMMENDATIONS = "1"
+
+# don't install automatically, pick manually instead
+MACHINE_EXTRA_RDEPENDS = ""
+MACHINE_EXTRA_RRECOMMENDS = ""
+
 # Ensure the initramfs only contains the bare minimum
 IMAGE_FEATURES = ""
 IMAGE_LINGUAS = ""
-- 
2.43.0


