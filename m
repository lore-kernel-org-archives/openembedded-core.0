Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5EBC0C44503
	for <webhook@archiver.kernel.org>; Mon,  6 Jul 2026 17:17:12 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.156289.1783358230730996326
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Jul 2026 10:17:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=qh6DLZAD;
 spf=pass (domain: gmail.com, ip: 209.85.128.47, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-493c2b3dc8bso22860465e9.2
        for <openembedded-core@lists.openembedded.org>; Mon, 06 Jul 2026 10:17:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783358229; x=1783963029; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iA+UrrF9SYZrpqeZSP1d6LN/4Kutm0P672MJDHP4Deg=;
        b=qh6DLZADWU7cFTMHCF5dTjGHVUPPVE5euILClyj9iVey+iMATWS2g3gBTwyocJ4yzl
         BLU5JN5EqHdS7Mxjl0XJp7KLvohNwHu8cKhk3EPiJj9S4bSLK31IqXgiq+g6JQPtkE6N
         YuSAfmgbjCC3BFcMjiwu5EjvLCe26xHwDHUK2RgbNM97BM1RnGX6MH8jwL2TfoInf1w8
         299jRSoZQPN9AJF241nk6Dsa3hvtUF6jfkuBptSFa8pWXyUzegOXhN5TtCLMj+BvS2SM
         5M2dts1jedhJB5TWFxjatk66kLgl7UX3wf3A9vlGaifDAtnHVJKVpN63wmj+kOlQ0fhH
         scrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783358229; x=1783963029;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=iA+UrrF9SYZrpqeZSP1d6LN/4Kutm0P672MJDHP4Deg=;
        b=YZgIzEalhsuFnM6rfLA6tg5CMfOouVddkg6WTTAIgRC/aSa1ZCKS7h+XsUQRXmq3uc
         A1OqLMTYO73pmaogb4N0S+llbMOX4NTacrL1NVLFD9K8F9mU/bUubekSELkbgRZOsqhH
         AGQKgTBCNLE4fVydLCtiu8loTkSkmx9TOcm/sk848ryS0zgyHBnEGKU15gsVgeHfbd32
         gHJHZQiwGavTdmhp815C/BSfKqGOzMUXoyQ2Ht+WTSUyjGITrSMFkJnF5iRytvyn6qTe
         aF264+UzzfoZzASn3+SGMDGEL20z2ECjHcb3dMnCJeh4ojQsUv6yXkxoc4vSQz0EzWSj
         kZ5w==
X-Gm-Message-State: AOJu0Yz+zqRF8XFev4fj7/qripuS2UhajAcrKDCLvf8i+aUHDCDtzF1b
	gSdNhG4r5mXXhf+TXYWSU8KcNqYE5464V+RWNebQPddHFSsLztjeUs6T0Zzhmw==
X-Gm-Gg: AfdE7ckmgbdIEC7Zo55BCOXe6MOlL1YFDn5APbbnj98umnf4z8PHABUdIFVoJibfLCJ
	0jJ8Am0gBdgNiSKITOYHupatETchoCw6/75uzmTg4JDGzHC/RjgvBQ6OlYkecvWQHyLRSd4ZeRG
	qdNlAiIfcMzjUpZbW28MWhY2f4kLGI/ZTKZHxU/QqunKrgnOnc0JFLWa65Y9z3V9014H1hhAQ73
	CguaFyUGMD27yJaLrcUN9a9SboFsSZMtdkRubteMn6VTjoSImPpAGKfUd/WfhFlia7QFtW2UyYC
	6iTq28RZCU5ss4i6auI5KwsBc34V1gIoVK1B+KuTT4YIwteUOyyOwHzuC/j/zWBHoXjAJVv2nwG
	wNiY48Sth9SP2YCx+11gYsm3lUV+GXZA4J9q+tMF3ciYL0Ran0Ty8xORJtqgAXdajXnIefqY+3u
	Pl3sBnYk2bk9xs+PlyOimF6/lHxY4pnZt0yySGFwM2gBIPSDeo
X-Received: by 2002:a05:600c:46cf:b0:493:dcad:84ee with SMTP id 5b1f17b1804b1-493df0258bemr17628335e9.0.1783358228884;
        Mon, 06 Jul 2026 10:17:08 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493c63ba971sm640541005e9.13.2026.07.06.10.17.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 10:17:08 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 05/45] at-spi2-core: upgrade 2.60.4 -> 2.60.5
Date: Mon,  6 Jul 2026 19:16:19 +0200
Message-ID: <20260706171701.70536-5-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260706171701.70536-1-alex.kanavin@gmail.com>
References: <20260706171701.70536-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Jul 2026 17:17:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240291

From: Alexander Kanavin <alex@linutronix.de>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../atk/{at-spi2-core_2.60.4.bb => at-spi2-core_2.60.5.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/atk/{at-spi2-core_2.60.4.bb => at-spi2-core_2.60.5.bb} (94%)

diff --git a/meta/recipes-support/atk/at-spi2-core_2.60.4.bb b/meta/recipes-support/atk/at-spi2-core_2.60.5.bb
similarity index 94%
rename from meta/recipes-support/atk/at-spi2-core_2.60.4.bb
rename to meta/recipes-support/atk/at-spi2-core_2.60.5.bb
index 9472e06b1d..b53a0e0795 100644
--- a/meta/recipes-support/atk/at-spi2-core_2.60.4.bb
+++ b/meta/recipes-support/atk/at-spi2-core_2.60.5.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 
 CVE_PRODUCT += "at-spi2-atk"
 
-SRC_URI[archive.sha256sum] = "1a1f5ba9805917f41fc6aa6823dcf887a291d607a427e2d5afb6b5dfa65070c7"
+SRC_URI[archive.sha256sum] = "6059a77d507438ff6c8d6d06025f8f9f5774fa0f8eabe9c9b059b1cc41e1bbc0"
 
 DEPENDS = " \
 	dbus \
-- 
2.47.3


