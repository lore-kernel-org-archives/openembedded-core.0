Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C967BF9EDF9
	for <webhook@archiver.kernel.org>; Wed, 22 Apr 2026 15:19:12 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.85241.1776871149097297330
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Apr 2026 08:19:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=HD/QRt21;
 spf=pass (domain: gmail.com, ip: 209.85.221.49, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-43fe62837baso3412127f8f.3
        for <openembedded-core@lists.openembedded.org>; Wed, 22 Apr 2026 08:19:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776871147; x=1777475947; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mOI8QpSnS8uTJDTzA1iTFf70sgNwvxU/EXIYxHXSHi8=;
        b=HD/QRt21VMyukxsroHu6weMVkXVBqBAY/dAB2skAoHC33jT+2H4bmd3Ar/uevC2AZe
         U2Ss33lEsEnMzgCcJ5KK5QED9YGCH55gO0gSUQ+2StVoEenBKqV/l2QM/PnsbCaSo59+
         jKLB5QX3RfgfFkwqxhLqls/zCPTrqCcBYVWHKwHCJ3o7Wue/1Yi9F+NuJ8WlxHtD+wjb
         2RlO8jKSuizzZ8oYHWxYgKg+tyrcUKg4+ttZ4VVrgcokQAfu5XetyTUjt59fgqXtxuJt
         OxGkAZqzVXVeZVzizYymtpei1oM9gEdOSmHdJXHg7WFMJUd9fWEtsqe9+GLudpeWBtjh
         nt8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776871147; x=1777475947;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mOI8QpSnS8uTJDTzA1iTFf70sgNwvxU/EXIYxHXSHi8=;
        b=dYotjziWCKonsElpM4nl1WyfDsPUiBRNOWAOCPuqelgwpWuncYOsLZXYc3OMX6kpou
         Ig+KHcYs6lkIOMmuca/GfqM9NrRDC/lfShU8W3RVv/GwngvSgC4vXyD6+lM0hreCBjzA
         YQ4vrj+clyHnFgkOVfDjEn4j8fGzpA5fTqJ5MsStH/Xz7FKpNOGqqtmcDAaW1JXS0LXH
         L9BvTPrMgsoq8HdBjiZLjTaegCnZzGQKTrW0v8wgzrZbbcGUNlgTZqLQJKVg42pJg4pP
         rUF0agdgkrbJoJ4ElNjHrf2v/ezGzWZJ1cJoTUhQdC/6V1tfbj8+s2N9lQA1PGN5ai35
         FjYg==
X-Gm-Message-State: AOJu0YzXBLA1RWiNxDckyWRXj7iYHCnDrIBWPO/Lvz0A6xcPeqTqF3PR
	4/YyDU26LDzpF7XZ3+pcAX3Cf0fRoIjjts3OXPOpNPbfs4bCH8ASeCleEWdLpg==
X-Gm-Gg: AeBDiesAjS+oK4hia8fqA+UD+Emc4ET8ODVTKuZ2LIMSQppI2fFVzcPTGG4GNKhBpD8
	qVbu0FkLcDvK23zubVEtaPiwB+u81dzDxhuFoQrlWVFVdTnQUC7qlSMmPdngmvyaM4cMdavxCu1
	HAAkKxNi6qalzYClQG+tW0mSyIdFdDCWiIzwunPDVbHt/TLBT+6gLAVNnNNEBbHkx9OiEJf9wc3
	urbKwn4J5OqH8e4XX5lnM+818wBTxnesneiLqo+zfi+LbpJZAUI0kzT7wZNt/eBTlcwsehSbtS+
	Y6m8c7YgQ15MxPoJZD7iRU1anEg12Amji26sf8LMaUMhe3lDbjHfTtCPOgYhThO4ffIDw82+6cU
	ev5tYj7/fKtaLBZqjmFh3zt9UcKNmnBOkrTY8bfl+NHVV8L90a8K1/fi2pxPZ1mT/mHoWHbnvBn
	oEoRtMOEPtsOhTYL57CzdAV8TGPWeSbrgzpKtmk9fiKlHrkrX+giGteuidGPIlDKyv6KVXLQ==
X-Received: by 2002:a5d:584c:0:b0:43f:dc86:d61f with SMTP id ffacd0b85a97d-43fe3db30c8mr37813213f8f.14.1776871147059;
        Wed, 22 Apr 2026 08:19:07 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43fe4cc07bbsm49384206f8f.11.2026.04.22.08.19.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Apr 2026 08:19:06 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 1/2] libjpeg-turbo: exclude x.y.9z versions from upstream check
Date: Wed, 22 Apr 2026 17:18:57 +0200
Message-ID: <20260422151858.2598801-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Apr 2026 15:19:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235728

From: Alexander Kanavin <alex@linutronix.de>

E.g. the current 3.1.90 is a pre-release and shouldn't be considered.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-graphics/jpeg/libjpeg-turbo_3.1.3.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-graphics/jpeg/libjpeg-turbo_3.1.3.bb b/meta/recipes-graphics/jpeg/libjpeg-turbo_3.1.3.bb
index 26e84ca42c..f3e1ff59a6 100644
--- a/meta/recipes-graphics/jpeg/libjpeg-turbo_3.1.3.bb
+++ b/meta/recipes-graphics/jpeg/libjpeg-turbo_3.1.3.bb
@@ -10,6 +10,7 @@ DEPENDS:append:x86:class-target = " nasm-native"
 
 SRC_URI = "${GITHUB_BASE_URI}/download/${PV}/${BP}.tar.gz"
 SRC_URI[sha256sum] = "075920b826834ac4ddf97661cc73491047855859affd671d52079c6867c1c6c0"
+UPSTREAM_CHECK_REGEX = "releases/tag/(?P<pver>\d+\.\d+\.(?!9\d+)\d+(\.\d+)*)"
 
 PE = "1"
 
-- 
2.47.3


