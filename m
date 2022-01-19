Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1007C433F5
	for <webhook@archiver.kernel.org>; Wed, 19 Jan 2022 10:41:48 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
 [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web10.4668.1642588907926375821
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Jan 2022 02:41:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=YO5oY76D;
 spf=pass (domain: gmail.com, ip: 209.85.128.53,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f53.google.com with SMTP id
 l12-20020a7bc34c000000b003467c58cbdfso13462451wmj.2
        for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Jan 2022 02:41:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=tSZoopFGCWHqmMl9hl625rILRGrAm2WBygVoTarT3+g=;
        b=YO5oY76Dj+39ez7GTuh7cd4ghLsGXyKual1/jibyByxpkqJ9t/dVQkBE2xMTtI8GF+
         Wa4mETKaizMfw4Zw0+MDjZrpqkUpGd4onHh7Q6xmoRaBCJqld4vLgO+jjDhQMPTkemN6
         BqTU9f0IEUDxftQ3shwzbYHduqsJ2egJMkSIThIJPApEXospE9KXVQ6rvaGqQObRjXyY
         lMejEVW3YuYyy7aCFJxmK5qO7XL6RE1fkNbaiJpO+s9eKyNSA0DAln1wC7EHpyXu0L9J
         ix1AixY8u/IVoQt7n3GnRs6u/l3W2Z2eKGT1vnWRnV1qV92VH17FRnPo1lD/B+IXhbYe
         2MJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=tSZoopFGCWHqmMl9hl625rILRGrAm2WBygVoTarT3+g=;
        b=2d+Yvhc3h5jwi4cd2zormMzL+2nz41OUXUxUZyymnV6GAMIUVdUuPTxKizlg0stGOw
         cmKWEk1eF74R1t17OheYuXeUa3kY1mPVnLKyDWVFffGPz7CLANOs84ypwb28qnW26IFF
         M2mR81/DnTTC2vt7YPNx28higr1+eZMeH2dMhXcAiUOPK5hem8y+lzPUYgxB61Oc44QK
         Uc3x+X2+JVAHqfIgPV7Pzko33IUW/9VnRLA7yV+LuInjMPyeWA+0ocalp7HmJezbAGY6
         oLmw8yQ8I4AfAAw7aEreWYLY5PutYiDd8oaWYYoYUWO+3OyXmQffh0IlbbyInEHlMSKk
         /cDw==
X-Gm-Message-State: AOAM532BUwkA5OH/7f7QU6RCXNiPH7ZDse6f6wD9KTvwsifQzvAgi1D2
	ao5Ov4mmjL/WstBFSsUjmOaL8Z8eaAE=
X-Google-Smtp-Source: 
 ABdhPJyek4l85GdMR7vjvslpBRYVgBawxnkbgbB3VOii9cr2NS1a5X/dCTnL+lOS9/fayxTbb+nOdA==
X-Received: by 2002:a7b:ce8f:: with SMTP id q15mr2793986wmj.193.1642588906589;
        Wed, 19 Jan 2022 02:41:46 -0800 (PST)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 o5sm4667956wmc.39.2022.01.19.02.41.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jan 2022 02:41:46 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 28/39] rpcsvc-proto: upgrade 1.4.2 -> 1.4.3
Date: Wed, 19 Jan 2022 11:41:06 +0100
Message-Id: <20220119104117.2120127-28-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220119104117.2120127-1-alex@linutronix.de>
References: <20220119104117.2120127-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Jan 2022 10:41:48 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160720

From: Alexander Kanavin <alex.kanavin@gmail.com>

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-extended/rpcsvc-proto/rpcsvc-proto.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-extended/rpcsvc-proto/rpcsvc-proto.bb b/meta/recipes-extended/rpcsvc-proto/rpcsvc-proto.bb
index c08e9d52c3..dd7bd2b1be 100644
--- a/meta/recipes-extended/rpcsvc-proto/rpcsvc-proto.bb
+++ b/meta/recipes-extended/rpcsvc-proto/rpcsvc-proto.bb
@@ -15,9 +15,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=0daaf958d5531ab86169ec6e275e1517"
 SECTION = "libs"
 DEPENDS += "rpcsvc-proto-native"
 
-PV = "1.4.2"
+PV = "1.4.3"
 
-SRCREV = "6f54e54455c073d08a56ea627c6cd2355a40eb53"
+SRCREV = "71e0a12c04d130a78674ac6309eefffa6ecee612"
 
 SRC_URI = "git://github.com/thkukuk/${BPN};branch=master;protocol=https \
            file://0001-Use-cross-compiled-rpcgen.patch \
-- 
2.20.1


