Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3DF6C433F5
	for <webhook@archiver.kernel.org>; Wed, 19 Jan 2022 10:41:55 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web09.4798.1642588914600541848
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Jan 2022 02:41:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=G3IEy2rk;
 spf=pass (domain: gmail.com, ip: 209.85.128.44,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f44.google.com with SMTP id
 l35-20020a05600c1d2300b0034d477271c1so4943843wms.3
        for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Jan 2022 02:41:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=I2uzGb6SE6hb8gu+v4i35bWOET+aGy+IFj4860M1dQM=;
        b=G3IEy2rkyJFdK3MROYm6k9nStuZqaGITRXE8xEa8hzlmqDYDf2Wn7QWGq2WZs5vnSO
         8C33iC3ZE/FklZZXEtsFltO50RKi5qEwHV90NTWg5p+ytBG4MZN6mSTgZx1gEtKXtOOb
         70MugNv85p1iR10gcSDCbSpehnms9YWO1j5U9YK82QjKkpzhMgZL3dA+ejZeigDCAlHu
         z2/M2/fjA8kFxY4EVcs02ShlsaH/TMkaLK1tGVwGSV4p/mmSe3Lj8PS47H5LLQv6rZFi
         Xf+sRsCl4adrVH4zHMY7PCvSbELlLrE/d2JbY/Z3gz6/WCyJ4uPK1Dk+SUBvBX6RfnzT
         p0iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=I2uzGb6SE6hb8gu+v4i35bWOET+aGy+IFj4860M1dQM=;
        b=LsQ78hwEMetw+DPizJXucqsyGigqD+FaDfdkGA8eLe8V6LAXsztc7I9DgKcSOXEJkx
         0+mBDZVesLaXYjZX+KYVOHJxNHBBL0pwez2+ts/+V1UHWvJKNxusoQYKy4vgQVo2bZQp
         Z/RJjgVYWubklG7jxFiZCFzqEkJHQ5Vw1LiIxlWoZOewarzTRyEFZKWUkktrZJqM9P5N
         6Ve9vXeczocXXH2WUmOEVriIHndtWsdmI/mFM2Www31lZCmiX4PsrumD/o/K4o9TI1XR
         045viTH+GIWCGJ3tlIvGykgI2PXyl8SLpgL7bHB/55BkmKwQCMKVndFuh4DABoTxXGJn
         /04g==
X-Gm-Message-State: AOAM533j2L7dsQt7JAWzVyamuR0VrI8CU0ixGAP5M+jJjaPx52RHf8Ym
	u+XAhfLNn4cNnA0iYmw8+c+HxVPPqfM=
X-Google-Smtp-Source: 
 ABdhPJzmzFxw+0TzioZEz1Jw9NhYUfSHTckuAVEa8NPhd+ygCAwYa+nJoRatugeMvd8P9IXpzlwjng==
X-Received: by 2002:a5d:550d:: with SMTP id b13mr6157459wrv.86.1642588913191;
        Wed, 19 Jan 2022 02:41:53 -0800 (PST)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 o5sm4667956wmc.39.2022.01.19.02.41.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jan 2022 02:41:52 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 37/39] liburcu: upgrade 0.13.0 -> 0.13.1
Date: Wed, 19 Jan 2022 11:41:15 +0100
Message-Id: <20220119104117.2120127-37-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220119104117.2120127-1-alex@linutronix.de>
References: <20220119104117.2120127-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Jan 2022 10:41:55 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160729

From: Alexander Kanavin <alex.kanavin@gmail.com>

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../liburcu/{liburcu_0.13.0.bb => liburcu_0.13.1.bb}           | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta/recipes-support/liburcu/{liburcu_0.13.0.bb => liburcu_0.13.1.bb} (86%)

diff --git a/meta/recipes-support/liburcu/liburcu_0.13.0.bb b/meta/recipes-support/liburcu/liburcu_0.13.1.bb
similarity index 86%
rename from meta/recipes-support/liburcu/liburcu_0.13.0.bb
rename to meta/recipes-support/liburcu/liburcu_0.13.1.bb
index aba8d070ed..7e53e1cf7b 100644
--- a/meta/recipes-support/liburcu/liburcu_0.13.0.bb
+++ b/meta/recipes-support/liburcu/liburcu_0.13.1.bb
@@ -12,8 +12,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=e548d28737289d75a8f1e01ba2fd7825 \
 
 SRC_URI = "http://lttng.org/files/urcu/userspace-rcu-${PV}.tar.bz2"
 
-SRC_URI[md5sum] = "8cb75dbb05774c03e66c63cb3186dd59"
-SRC_URI[sha256sum] = "cbb20dbe1a892c2a4d8898bac4316176e585392693d498766ccbbc68cf20ba20"
+SRC_URI[sha256sum] = "3213f33d2b8f710eb920eb1abb279ec04bf8ae6361f44f2513c28c20d3363083"
 
 S = "${WORKDIR}/userspace-rcu-${PV}"
 inherit autotools multilib_header
-- 
2.20.1


