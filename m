Return-Path: <omri.sarig13@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF108C02194
	for <webhook@archiver.kernel.org>; Tue,  4 Feb 2025 12:56:57 +0000 (UTC)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
 by mx.groups.io with SMTP id smtpd.web10.115682.1738673807889380461
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Feb 2025 04:56:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=RGEhWtDg;
 spf=pass (domain: gmail.com, ip: 209.85.167.53, mailfrom: omri.sarig13@gmail.com)
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5401c52000dso6044179e87.3
        for <openembedded-core@lists.openembedded.org>; Tue, 04 Feb 2025 04:56:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738673806; x=1739278606; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tNhtHYaqZbzjt2Uev2fichf33/xR6DuaHQ3Bp+0GTIc=;
        b=RGEhWtDgTOVhH8VIQr+k9rb2TaNJoU98gJ074RtnC6TPHvUyCJQRAQVd/maxlZVGDH
         l0PLFPv3fZDHKWiuUqwC0bKIQP8u5G8C7FAxIPaxS/FCCsQTsYMA9krik3dZE2mD6Vdr
         U593XFZuKD4gBVrsKG+TbZu0Nt0ZXjFCHBuMqw4XiZnzUewiU5iAV/AOrydLT3GaqgRY
         HuHvpvDhXDijkELfiTcaMvBfzO4uxCDuTRvdYzL6Ui7iIBcCTtDgMTP9225z5oMFneuG
         g06Yg7EPdgUOVcv+CUOoBcRLRKvhTkCWyq1CRW8WhdqW7jVuDH1RO4VntQEw+WoyHjyV
         Gj9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738673806; x=1739278606;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tNhtHYaqZbzjt2Uev2fichf33/xR6DuaHQ3Bp+0GTIc=;
        b=ecobHAuPiUo1Z0jCHrFwJR99AebaigpfZJY5Rrnxs9V9vmhWegf4ixjFAPoB7oay9y
         hF+q+OflmMXJcM6mII43vVGUNk0t/7RiNQgNGNAnCVFnkQ+Buvd3JrZfTSmmJvQCRnmL
         p1Qh3dA/uFo0hJi918cxKyDvLFiqlBR5DBFDvv/W4v+L6cTuSrDwUmrUXBB4dQYBGqD8
         qeauMb4cdRvb1r5v5iAXXb6fXXsdsWtDdby1nDFWnWI1iYNkqAfGMWYWUNEKw1E8s/QM
         R6QqwBh59QM2b1QkjESjqSP8jbnRBrUjRLUW8QvWFActfFO/1eN69sXY4ZRsAQB7VpcM
         Hchg==
X-Gm-Message-State: AOJu0YxPb4y6zJiOmqxF1buQ2jWfc914nq8r8gCVrhYWmhp07p0/e4Sz
	Uit4C7UelBM0D0nCWawYbPcF4uIEh1Siprq1yjRRhF/ZASU7wHaY713iPA3wp8s=
X-Gm-Gg: ASbGncv/ll5Erkb1QZukKjwXN7AzaqXdtWIGuTTEy4R70YyKpanQ1OrWRpiy6yDzgHt
	aukhJISk5PwZUGu1UnKR+bIDyf/CLuiYlv5ebu6ANuOtjRmOhFYsREFc0Qemilop2vPQDorc4Wv
	YF0675ixA2WxS6fnxH3MjQC4/x2Kr8p8iN61xgiUDDMW2eeiMhc8rdSBPVE6Pxj4rWO9r0rmBYy
	eM+khsBWII1yrUBpnQ6GWXQblEK1qFdhpdiXJB1YeFq5fImfTy/V3ZxWerp770EWBuId4w+xSzh
	vdVMPlWJDSxVbd5xlc3m2xUEqEECe761u5BSFzvWqzlW93q7MfSnDau5xk9/iyN6OGwJcz2Vfw=
	=
X-Google-Smtp-Source: AGHT+IE9IwZrtJHMA3m/f+SiK2oINm91aFVqQbyhc8uH4glkZKW/iYORX1ho/CKn0b9epTgrxVOExA==
X-Received: by 2002:a05:6512:3f03:b0:541:cdef:7ca3 with SMTP id 2adb3069b0e04-543e4c00bacmr8932582e87.27.1738673805455;
        Tue, 04 Feb 2025 04:56:45 -0800 (PST)
Received: from omsa-HP-EliteBook-840-14-inch-G9-Notebook-PC.prevas.se ([81.216.59.226])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-307a30890absm18007061fa.38.2025.02.04.04.56.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Feb 2025 04:56:45 -0800 (PST)
From: Omri Sarig <omri.sarig13@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Omri Sarig <omri.sarig13@gmail.com>
Subject: [PATCH 2/2] python3: Fix typo in create_manifest3.py
Date: Tue,  4 Feb 2025 13:56:19 +0100
Message-ID: <20250204125619.2278355-2-omri.sarig13@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250204125619.2278355-1-omri.sarig13@gmail.com>
References: <20250204125619.2278355-1-omri.sarig13@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Feb 2025 12:56:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210783

Signed-off-by: Omri Sarig <omri.sarig13@gmail.com>
---
 meta/recipes-devtools/python/python3/create_manifest3.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python3/create_manifest3.py b/meta/recipes-devtools/python/python3/create_manifest3.py
index 045240ea0b..288d5ede3a 100644
--- a/meta/recipes-devtools/python/python3/create_manifest3.py
+++ b/meta/recipes-devtools/python/python3/create_manifest3.py
@@ -1,7 +1,7 @@
 # This script is used as a bitbake task to create a new python manifest
 # $ bitbake python -c create_manifest
 #
-# Our goal is to keep python-core as small as posible and add other python
+# Our goal is to keep python-core as small as possible and add other python
 # packages only when the user needs them, hence why we split upstream python
 # into several packages.
 #

