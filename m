Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D259C44529
	for <webhook@archiver.kernel.org>; Tue, 21 Jul 2026 09:33:07 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.18745.1784626383075400654
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Jul 2026 02:33:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=TtH5ZoFC;
 spf=pass (domain: gmail.com, ip: 209.85.221.45, mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-474560436c3so5859847f8f.0
        for <openembedded-core@lists.openembedded.org>; Tue, 21 Jul 2026 02:33:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784626381; x=1785231181; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0rn28qA2rY8fmDmLpFqAqu0U1KFfmFX82M1lNoE4QiU=;
        b=TtH5ZoFCU+OGQHYka++Zk45eVFUGi3M/EyADmQypIxtkCaiUrKfgH6nGRfiKFqOqcW
         ScGNYdFQAHNs4Bslftyt+5Fst9dqZq9sdWNUvLqaQJEuhq5Ah3mAkjLW54UaGssalAT6
         uDrldyualh3RkBfdt/qFPK4Gj7oA5Z/0notFvtOtxo+d3pZyPfQHGBi909P1jCnvw2bQ
         ElbnGioYgDlBZdHdGGoK845e3EIQmuTy5Ne0exQz29l40Yfv4Ised6YQb7vgaXyEOqXV
         WmKUVh5qW3sSTcO9Gw0J45kHPpt1/Ul6Rj7huHPlkg8rEvitXcPbI9dNttrrSAH6FE0a
         jryg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784626381; x=1785231181;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0rn28qA2rY8fmDmLpFqAqu0U1KFfmFX82M1lNoE4QiU=;
        b=EWGDSuB6dm3oA3s57D7xxt84bs4ZxX5Yzua4qwv4TxIfEv02NbwnqmJTq1OqwTuG4Y
         Qpglcnt/ZtDWWC4m8mq4LSV7nfccRoyAfzEVhVGX0eaXZ+fcdds7SiI0KjbonKnACZa4
         GVuLXKJIRa/aXTlyPq52OUfGgIWeOidJdP5m3DQh2KqorPdodObFSHR0fmjfYH/kMQNl
         GhaCuHeh0SqbsW3+6tP3AteyMVxDCesZRbRNUT672A8t4C3LQzcvSJaxs32Ao0Sptq54
         6ngf7P9ojYbm60JPNbdgmaI65+TIZs8W1HHOsglWve8asamZmdAFhoI1tQHY0r8g0NG8
         EQOA==
X-Gm-Message-State: AOJu0YybGViKNNOY2HJsRgiDWEDZKhY11lmkSVsSsEXo/tj9zYrKiPAo
	rwV9pjAwvPovOx5nakQ5UAshiump4Qopsk6TJNkR2bNHT6cyodEPHf6Vtv8a0W9b
X-Gm-Gg: AR+sD12SZE+s0MSdiHRSU+jpKsg42QlRkblXVUPxbbwZ9q7FuU3YJJ1GhuEy5nmOJLU
	uGreRJYFhPcHWi3ITZvK2XamWOZzytALB+qUTAK8U0TVpy5N0UBeDB0eqET/qnx4LGpPeWYRM0W
	+KdXPXxqjPYhAiKa+TQQjNFhgtEdxCoQyCs3GM2joCZvUbEubi731sYN2kqpD8JMR6If0WQ8Dax
	/xzKvvwGxbGqCcwWqpyZNB6rkAJ9zzmg7KcJm+nc9ZpHUCLZUl5Iw5bRVUzhiAAPNvNQPvSfldl
	PoMXIjTjjBwRPNAqcxfOILKe169iBzKGi7Z9j4mpOGENFvKhNIWOOkt5IetcnxRlC7q6326hxLS
	D4kcooSgZaJu4CxChVbOm/k/hb0TIFePPbVaaQVi1SpePgpLCTiiEJVNedB6Uv1o2cnazjA3yPr
	9N/XmPvR2arTkY5O/gXdzfq97/ahme2Kt+XUAViK90beW4qP/OTxaiCX48Isct
X-Received: by 2002:a05:6000:188f:b0:476:8d5:cf34 with SMTP id ffacd0b85a97d-47f622f2c57mr21505207f8f.8.1784626381143;
        Tue, 21 Jul 2026 02:33:01 -0700 (PDT)
Received: from localhost ([109.238.218.228])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f63e52aa4sm38408088f8f.10.2026.07.21.02.33.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 02:33:00 -0700 (PDT)
From: martin.jansa@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: JPEWhacker@gmail.com,
	Martin Jansa <martin.jansa@gmail.com>
Subject: [PATCH 2/2] linux-firmware: fix typo Firwmare/Firmware in one of the LICENSEs
Date: Tue, 21 Jul 2026 11:32:51 +0200
Message-ID: <20260721093251.2697077-2-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260721093251.2697077-1-martin.jansa@gmail.com>
References: <20260721093251.2697077-1-martin.jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Jul 2026 09:33:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241515

From: Martin Jansa <martin.jansa@gmail.com>

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
---
 .../linux-firmware/linux-firmware_20260622.bb          | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20260622.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20260622.bb
index 33b28c45f4..6ccfa16259 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20260622.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20260622.bb
@@ -73,7 +73,7 @@ LICENSE = "\
     AND LicenseRef-Firmware-ice-enhanced \
     AND LicenseRef-Firmware-inside-secure \
     AND LicenseRef-Firmware-intel \
-    AND LicenseRef-Firwmare-intel-vpu \
+    AND LicenseRef-Firmware-intel-vpu \
     AND LicenseRef-Firmware-ipu3-firmware \
     AND LicenseRef-Firmware-it913x \
     AND LicenseRef-Firmware-ivsc \
@@ -335,7 +335,7 @@ NO_GENERIC_LICENSE[Firmware-ice-enhanced] = "LICENSES/LICENSE.ice_enhanced"
 NO_GENERIC_LICENSE[Firmware-inside-secure] = "LICENSES/LICENCE.inside-secure"
 NO_GENERIC_LICENSE[Firmware-IntcSST2] = "LICENSES/LICENCE.IntcSST2"
 NO_GENERIC_LICENSE[Firmware-intel] = "LICENSES/LICENSE.intel"
-NO_GENERIC_LICENSE[Firwmare-intel-vpu] = "LICENSES/LICENSE.intel_vpu"
+NO_GENERIC_LICENSE[Firmware-intel-vpu] = "LICENSES/LICENSE.intel_vpu"
 NO_GENERIC_LICENSE[Firmware-ipu3-firmware] = "LICENSES/LICENSE.ipu3_firmware"
 NO_GENERIC_LICENSE[Firmware-it913x] = "LICENSES/LICENCE.it913x"
 NO_GENERIC_LICENSE[Firmware-ivsc] = "LICENSES/LICENSE.ivsc"
@@ -3304,10 +3304,10 @@ FILES:${PN}-intel-ipu7-isys = "${firmwaredir}/intel/ipu/ipu7*"
 RDEPENDS:${PN}-intel-ipu7-isys = "${PN}-intel-license"
 
 # For intel_vpu - Intel NPU driver
-LICENSE:${PN}-intel-vpu-license = "LicenseRef-Firwmare-intel-vpu"
+LICENSE:${PN}-intel-vpu-license = "LicenseRef-Firmware-intel-vpu"
 FILES:${PN}-intel-vpu-license = "${firmwaredir}/LICENSE.intel_vpu"
 
-LICENSE:${PN}-intel-vpu = "LicenseRef-Firwmare-intel-vpu"
+LICENSE:${PN}-intel-vpu = "LicenseRef-Firmware-intel-vpu"
 FILES:${PN}-intel-vpu = "${firmwaredir}/intel/vpu/*"
 RDEPENDS:${PN}-intel-vpu = "${PN}-intel-vpu-license"
 
@@ -3580,7 +3580,7 @@ LICENSE:${PN} = "\
     AND LicenseRef-Firmware-ibt-firmware \
     AND LicenseRef-Firmware-inside-secure \
     AND LicenseRef-Firmware-intel \
-    AND LicenseRef-Firwmare-intel-vpu \
+    AND LicenseRef-Firmware-intel-vpu \
     AND LicenseRef-Firmware-ipu3-firmware \
     AND LicenseRef-Firmware-it913x \
     AND LicenseRef-Firmware-ivsc \

