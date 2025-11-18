Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F84DCEE340
	for <webhook@archiver.kernel.org>; Tue, 18 Nov 2025 16:59:00 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1895.1763485131785193213
 for <openembedded-core@lists.openembedded.org>;
 Tue, 18 Nov 2025 08:58:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=fYiWzva/;
 spf=pass (domain: gmail.com, ip: 209.85.128.42, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-47775fb6c56so58594545e9.1
        for <openembedded-core@lists.openembedded.org>; Tue, 18 Nov 2025 08:58:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763485130; x=1764089930; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KTVXeSNIbGOokzf0GfrJ9crkdFyQmiWtJZV03Ld23+U=;
        b=fYiWzva/+2hSdgsE0F4gJJTUXllz1XBPO5ta/5TzOrnt72smFMvP0ImaujA85USjIH
         hQ0gf3utGYMOscMlJq6pSGT3uaJKVRKVeKWSExdD5yr+ZZkNBqccqJLJmkLEzWw0z1Wu
         hT/7JJjxxASXkF2VSindHwSyYsV4jXsY7oyoAjzvlFvycNZkDswIj3peDuIpCtAZ72G9
         GrD8WlvWsR+wyMz8eaGYnHYop4VR5aNSRN8J5FKTYA9PiM1xBT+vn5p5evNjqsxXh24b
         32PwKZec6w6eLoUB/Yh9aPgpTZK3gDsr11/K4/jRFuEEYwpOoHfY0e5YC+VaB8r6jzAC
         nHCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763485130; x=1764089930;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KTVXeSNIbGOokzf0GfrJ9crkdFyQmiWtJZV03Ld23+U=;
        b=kX1hZ0ixO7+STPKoJ5nKO3pni30XzWeUXIL2h7F/708XR+h2jj81+FZWx8ip2fpKeL
         QZy6rhOGzsMNRX7tiMol0NIFAVNq1QMNIYeTLjm5+jlK2UlXZr7pUSqr68dxx/pIXZmq
         /BdecMDYKLzQej4VA83WoY2JziVWXPuWyjztTtwug9hGWTH/d02dhE9HZpYin/248V+V
         XsJ2jBwknKMAVn1HBxoPSdH09Vg2pdEDo2cuL+BKL0KnwsIP9cjEYuX8eg++yHzawu13
         UbSCwLZEtYDvKDCmKmjgE8OsIe3mSdGrvRGpuqgIar6w08XbNjFiBZvJhqVY5WhkRTOA
         8Arw==
X-Gm-Message-State: AOJu0YwkF8rsqvLi2gFW5I/iPZKLbSXzNV4g0QoAaPp9T9kCpQOdwa2e
	zTTxAvqqNHZFQ+pXkU6YSECnfN6x/rW3GRhbc1qLcnLXYuSYCMq0NKXr7csE3g==
X-Gm-Gg: ASbGncvS+SzPc5/ySbxZHXn4CsdP6sqF5I950Nbv/+lse1bRE3s6o+CRns74WEL8YsE
	y0SmVVyHrgj/1LIN9cM0Qgo4yfShZ9fHOzijmDDhGPMdpjuX1SFeajmP9yhtT59YEAsAaFU7QTP
	ER8CFMm6UqSNpirE1JXGBrDX+PI1PhPH8jGW1pUy2LVS6JYebIBcJtpAfPs1iJc003mNa3rIpm4
	HOPHb5EM1sDFlb8bLwqOvoW3pbwPNKarEnY23S1fAHo29uLaPP1d2r0/KwYzFQU/0U+tYZl/Q/V
	kIARJEWQpx6g5+9D2C3GgxTb2VrCypMSqaeJNPacf4rhrhOpHFboeG5h0ckuaJojquDSUYBqtEx
	fX12FGxVEt1t8q1PcuqXwvaey9VbdmVNxkDWRMxxu+FFgdY8W2Wo/EHyStdTkTGYLKdabo59p3F
	ABUFYZAHtRVMDVvP76x7G+Wrnd/8B/5eaP1RVFuk+jcd9cD24Yc7sYDD9ljQ==
X-Google-Smtp-Source: AGHT+IGKrvRk0ZDRiXpOtP+RiOKmjGKdptu9MNYR+ODVUkp+Tw7x3HpPxrZNCtMz8mR1nrg+KAWk2g==
X-Received: by 2002:a05:600c:1c20:b0:477:5b0a:e616 with SMTP id 5b1f17b1804b1-4778fe4f635mr167310775e9.5.1763485129955;
        Tue, 18 Nov 2025 08:58:49 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47787e8e6acsm387883405e9.9.2025.11.18.08.58.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Nov 2025 08:58:49 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 1/2] local.conf.sample: do not set PACKAGE_CLASSES as it is matching oe-core's default
Date: Tue, 18 Nov 2025 17:58:42 +0100
Message-Id: <20251118165843.3674407-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 18 Nov 2025 16:59:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226532

From: Alexander Kanavin <alex@linutronix.de>

This setting isn't necessary as it matches what is set in oe-core
already. It may also interfere with settings on other places
such as distro files or fragments.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/conf/templates/default/local.conf.sample | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/conf/templates/default/local.conf.sample b/meta/conf/templates/default/local.conf.sample
index 9bb6601eb19..2639be3ddf1 100644
--- a/meta/conf/templates/default/local.conf.sample
+++ b/meta/conf/templates/default/local.conf.sample
@@ -85,8 +85,8 @@ MACHINE ??= "qemux86-64"
 #  - 'package_ipk' for ipk files are used by opkg (a debian style embedded package manager)
 #  - 'package_rpm' for rpm style packages
 # E.g.: PACKAGE_CLASSES ?= "package_rpm package_deb package_ipk"
-# We default to ipk:
-PACKAGE_CLASSES ?= "package_ipk"
+# We default to ipk (via meta/conf/distro/defaultsetup.conf included in meta/conf/bitbake.conf):
+#PACKAGE_CLASSES ?= "package_ipk"
 
 #
 # SDK target architecture
-- 
2.39.5


