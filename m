Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55E58C021B2
	for <webhook@archiver.kernel.org>; Tue, 25 Feb 2025 15:56:53 +0000 (UTC)
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
 by mx.groups.io with SMTP id smtpd.web10.11689.1740499010268221450
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 Feb 2025 07:56:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=lyH+4hKF;
 spf=pass (domain: gmail.com, ip: 209.85.219.49, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-6dd43aa1558so48382606d6.0
        for <openembedded-core@lists.openembedded.org>; Tue, 25 Feb 2025 07:56:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740499009; x=1741103809; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7KIRRpkgSFvuA4nrLufpoV3V46+dRot1gjzRrmTzcn4=;
        b=lyH+4hKFdlrSsaLmdC+u2AO8Tzop3hTcaA0QFGk/gxGMf6o1lsqZcr5x+IBCVFEAcD
         e2iPoJwTKm4NcusXACtg4A6+ROT9LKI+No8GEFqAjgiI+GA5U3tGILaoYMUVOZlMLB9r
         YOn0z/AXCry/fnW8whQI3Do5Fa5pydvY81SJslqZbJNDKrfhCNtXYqb0Dclxenhv+SKi
         eEw/74IUplJsas1dYWWlSDeAMX0jkBI92m2OD8g8JQzaaRGjN7tKhs5jMc3al7qLKNz9
         fmYSFTo6WCJbo+zcEuIDwGvL+SJM6bxud7OLHrj3w0tW8Fpe7Ct9ykfNYZ8cybXZbFvq
         zCuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740499009; x=1741103809;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7KIRRpkgSFvuA4nrLufpoV3V46+dRot1gjzRrmTzcn4=;
        b=GCsZHg0Y8a0xSUjkpA86VjTqPyB/xcj5atJgU8/TdyJGhAqny+fbD6HA3Fe5PXR54M
         mgD91o5hTptHVZztVpRXNYGIr0RmeWzS/ohNPpQYTFh4L8K/C43SAbE+ODplDxsvNRFn
         N3WGRJOtaFiI909R1xh+gy6Kkbm2CX+vU/dVKQbGKO42zCN9+jcwQeBniPlicpl3BM6j
         ADbhoo5Rx/DztReYgdYpgHhMND2PAXTDT7xxx9ELTygQYviiDuYsZBc66ODkhPQeHOnL
         CAIKBFaMhDUg2W4/ike82v0dmT2Y3/xYXjRzV7ze+uODiGJhkbumgRzCZImYlTnutVis
         Ujsg==
X-Gm-Message-State: AOJu0YwKnosN4MZkR58kBrEwetxgfQZNWg5b9kGPaqCEEQmU3FMmOUMa
	n7xP2KkJbV82+sq2Vqjt2NuBR4KdMTKreaoYWelhuu5i3Y1+i2pPy+PItBSV
X-Gm-Gg: ASbGncupuKX7AicxgtNgkkElYXbhyFI+z+i4DuoCb/rH2BlD/dAvkTaYxPOBNRJLTgn
	VqIV+Es8YIjo1T27f1BJjWVusUzwCw72A06UbxOJaEiP+2LZECh9x6YcUM7eOkiq5Hr00vLYGO2
	d50BkysTsHx2cCMb7rlo5gyPn4Zld5jkV3HnYf8wbTWlAiiL9/Rh6W1Hz5IV9BEZaHYepvQjIau
	UyfCdBKcCTCE/pljcefZBafnhXiowVofm27FeOH+e0uOrkQx+pGqqWHTcanfTViR9hOjjZMiw6e
	JArSctSFgpKdsBzfnldPRnUpGF/kt8KFD9Wu8cjeC0ZDuyTPJIIR56LTS07dDD6YV61umvq3GyY
	903SmXYDN8YYwPNnWe4XuGQeSZQ0=
X-Google-Smtp-Source: AGHT+IGFyO3Rg5+vGMyri+dKSM0MIXajooSARI2PfnaA2tW2HKORcgKHJTbk2x8/v916198Y+UcipA==
X-Received: by 2002:a05:6214:d6f:b0:6d8:6a74:ae68 with SMTP id 6a1803df08f44-6e6ae96734dmr199687616d6.29.1740499009290;
        Tue, 25 Feb 2025 07:56:49 -0800 (PST)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6e87b087221sm10749476d6.26.2025.02.25.07.56.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2025 07:56:48 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] linux-yocto-dev: bump to v6.14
Date: Tue, 25 Feb 2025 10:56:46 -0500
Message-Id: <20250225155647.3295109-1-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 25 Feb 2025 15:56:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211914

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating the development kernel to track the v6.14 series.

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/recipes-kernel/linux/linux-yocto-dev.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-dev.bb b/meta/recipes-kernel/linux/linux-yocto-dev.bb
index e78fd51749..5604a11eae 100644
--- a/meta/recipes-kernel/linux/linux-yocto-dev.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-dev.bb
@@ -14,7 +14,7 @@ require recipes-kernel/linux/linux-yocto.inc
 # provide this .inc to set specific revisions
 include recipes-kernel/linux/linux-yocto-dev-revisions.inc
 
-KBRANCH = "v6.13/standard/base"
+KBRANCH = "v6.14/standard/base"
 KMETA = "kernel-meta"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-dev.git;branch=${KBRANCH};name=machine;protocol=https \
@@ -28,7 +28,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto-dev.git;branch=${KBRANCH};name
 SRCREV_machine ?= '${@oe.utils.conditional("PREFERRED_PROVIDER_virtual/kernel", "linux-yocto-dev", "${AUTOREV}", "29594404d7fe73cd80eaa4ee8c43dcc53970c60e", d)}'
 SRCREV_meta ?= '${@oe.utils.conditional("PREFERRED_PROVIDER_virtual/kernel", "linux-yocto-dev", "${AUTOREV}", "29594404d7fe73cd80eaa4ee8c43dcc53970c60e", d)}'
 
-LINUX_VERSION ?= "6.13"
+LINUX_VERSION ?= "6.14"
 LINUX_VERSION_EXTENSION ?= "-yoctodev-${LINUX_KERNEL_TYPE}"
 PV = "${LINUX_VERSION}+git"
 
-- 
2.39.2


