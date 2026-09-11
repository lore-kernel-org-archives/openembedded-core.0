Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B5CAC88E50
	for <webhook@archiver.kernel.org>; Fri, 11 Sep 2026 22:15:51 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.50974.1789164950483845212
 for <openembedded-core@lists.openembedded.org>;
 Fri, 11 Sep 2026 15:15:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=bV0qIpyN;
 spf=pass (domain: smile.fr, ip: 209.85.128.41, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-49b0d8bc2aaso16454895e9.0
        for <openembedded-core@lists.openembedded.org>; Fri, 11 Sep 2026 15:15:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1789164949; x=1789769749; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=w6jJG89Op7C0IhvlVv5QAiYHvmD5fqO0HNbVU5kRxX8=;
        b=bV0qIpyNniAe+3oDfViPmUlQLOsCycgqLWf+/zWsW5kxNWGRZQrqgU0dx+Xdl2Mb7/
         jWcJgaa5N8Dx+QdTEjj/Ubfy9aBGnkAIBPCH3z4oSXNZj9cA1/D4rtFNiK2XfY1xMvKh
         Bj78Y5lQkUXeN2TlNjCO/V1JrhRsrv/v+LL0k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789164949; x=1789769749;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=w6jJG89Op7C0IhvlVv5QAiYHvmD5fqO0HNbVU5kRxX8=;
        b=IIEMg7NrrycENTQQcynSKysNJDBnmt1QqTtRJHsZ03vzo8nK01wUZYTFiUj6dL9bcq
         3fL71nFWK3E9RIMTaXjJW8/3IenC4tyovot1qAZEfZZq+BcXpMTvgXhPLUYiAqCcRKXs
         6RyjoSrCKzuFCvEv/wbm4AYnDpixM44ffmbyZSoyOXVcvE9sQxpKS246JFQBXBpNrqCY
         CbG3t6GddE29809X3LH+Z7atYoZXB2CnDflv2CLl/DjDJqQL1jqNBqe4Qe7EVp1cxaKe
         SORH0CXroevBVD/nBCw2xb8AXY3yeH1vxC8/2dtZOjfyJOnOQEC/YvAvds8X4lVttcaG
         3v3g==
X-Gm-Message-State: AFuF++kFT89msPHOfB22qEVLilRGyH6nj9a6cpoWPdkncoK4D4FxXkQI
	otHD6Vodm+KFR5lUR2KXtTqRnn49VMeXXfNTpak6B5EheiZVnrAAh+IXPJIrbRKaxfD4ffAYvcU
	u0aavtxE=
X-Gm-Gg: AYBFou1V7LdLvp7OWLRJXkODeiNkg8WcVj4zDlj4uqNSkImCFMstGgEpidcyGwBAXrV
	3XMb6G94TpGUjPSmYILUH0PWHT1FSQdx4z2/kHhoK6KxHVcqHwUlFZYXA/xvwhQUyXyOvrIzRl3
	cVqujo4bnyU1v2Ov7ynBt98KGJ/C3qnA5bIoYbkLt47cQzB2/FdFA4liTYZ+y3FTO5c92ACOOCK
	RzXbCO65uPXmjxkynVY2j1arxvk/t/jC30VY66rzWWEp0eO3hkAMSKr1gT/Jvv4CX4T48zSQ8zJ
	81Xw+RDAwrRH4hP29tNN5qrzaWRHOPJpSNOn/1Lu9uBd0GxO8xAbxyr/52t+ZMzRRd1ScNu+Uq6
	MupZ0or1/rRGVw33LF+SnAwdyUG3dxfxC9gONGCJbHsUl9yEkfyZ+qjMds5BUh+xwaYMFIGUeaM
	YnTeYqpBYf14tFEEF3LKEHOz55uhUX8q5rTpepgDglW4CjDsk9dksm4c+p8EJ5u8hvGVeJZuy32
	FthJ+ZacV+NWQod0xYZIEhdWDGIpb8sV+klIysT+cuYxBf+wKzhMZX9smcYXtwVim/+HLHd0dY=
X-Received: by 2002:a05:600c:a03:b0:49c:dada:f57f with SMTP id 5b1f17b1804b1-49e6197f78dmr75131155e9.7.1789164948767;
        Fri, 11 Sep 2026 15:15:48 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e6c566bdbsm8434045e9.11.2026.09.11.15.15.47
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 15:15:47 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 09/13] python3-py: set CVE_PRODUCT
Date: Sat, 12 Sep 2026 00:15:03 +0200
Message-ID: <54c6a775ab49f88f04305fd18fe19fe4fedeb161.1789163914.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1789163914.git.yoann.congal@smile.fr>
References: <cover.1789163914.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 11 Sep 2026 22:15:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245679

From: Gyorgy Sarvari <skandigraun@gmail.com>

The related CVEs are tracked using pytest:py CPE, so set the CVE_PRODUCT
accordingly instead of the default python:py.

See CVE db query:
sqlite> select * from products where product like 'py';
CVE-2020-29651|pytest|py|||1.9.0|<=
CVE-2022-42969|pytest|py|||1.11.0|<=

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 1fac509459c4e2d970121b66ae33cd53ef1eb8a6)
Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
[YC: This is a cherry-pick from meta-openembedded]
---
 meta/recipes-devtools/python/python3-py_1.11.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/python/python3-py_1.11.0.bb b/meta/recipes-devtools/python/python3-py_1.11.0.bb
index 31d5a377a7e..a75b9c2b142 100644
--- a/meta/recipes-devtools/python/python3-py_1.11.0.bb
+++ b/meta/recipes-devtools/python/python3-py_1.11.0.bb
@@ -5,6 +5,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=a6bb0320b04a0a503f12f69fea479de9"
 
 SRC_URI[sha256sum] = "51c75c4126074b472f746a24399ad32f6053d1b34b68d2fa41e558e6f4a98719"
 
+CVE_PRODUCT = "py"
+
 DEPENDS += "python3-setuptools-scm-native"
 
 inherit pypi python_setuptools_build_meta

