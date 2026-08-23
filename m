Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C5EFC5DF8C
	for <webhook@archiver.kernel.org>; Sun, 23 Aug 2026 07:49:30 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10586.1787471362593621301
 for <openembedded-core@lists.openembedded.org>;
 Sun, 23 Aug 2026 00:49:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=LOgiE+s4;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.51, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-47362928f65so858193f8f.2
        for <openembedded-core@lists.openembedded.org>; Sun, 23 Aug 2026 00:49:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1787471361; x=1788076161; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=b5VR55+X4fRKxPZCe4t9/x+Xj0r18x+gK2w3ubOYUCw=;
        b=LOgiE+s45bpJe/PaYJBb2wS5hhiJCaEdcV+glu2uLK7bB+DUEcPEEhmzfZLOTQQzDZ
         NgPV17wPhWRv04TF9w7MhyxSVjcahw2LrmAQQIkhSZ8Zi0ztFP+McChRNu6Mm2M04Yap
         lOVYdm2DgRXi5Vj+JRhhaiXQ+wyI2notTOdX0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787471361; x=1788076161;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=b5VR55+X4fRKxPZCe4t9/x+Xj0r18x+gK2w3ubOYUCw=;
        b=As3qI5tRBPq9Pvnwhx58CbYXBoTLDvH5XuqwkKwOw/MGj6Yk57ga3Vd8+wwkMWN89X
         D/gamaF5Hi0XmbywrtKymAgKlE73dCvJV8xO6lYLbQAg99R3WI6aucaA2FweroAgfPUF
         DYjTm2vvYnjQXqcpMfW2iNYngeEiWT26SifeZLc/9egNMd3QZVWy6mnBHXAlm2XpwYV/
         mUoy3dnlvkX+g8oj5rBxrnPDh+FzQJ3rsJrdvkATlCfjpmFyiXFSYg7T8XVYbosNH0et
         3V9IK23FeHmv7wwa7zetIDBiGtfhDOpi4pJQua72uRD+3S1vkUzmM0oSz2TSnI1kveQP
         HMCw==
X-Gm-Message-State: AFuF++lfi01vFUJ8q2dl7BAKtgTbF3z7IrmgLCXKzyYKWbGCVtIrNigm
	YyflvG/HxSefPn698gomkTNQmKTD0ZrBdGhyMLS32Mhv+DrcneYX2WCsQlosrSHo5tIwi0XmKFd
	D00eLdCY=
X-Gm-Gg: AR+sD13LLpXBdi6nU0GIt+PwrrwuQ5VkPFahrLaysU3nY8RypqAJcz1bzZw0rkuj+bW
	Pxw+PUofxdu3h5PsLLjIUrXi7IdLwwP3Fm4cOqGXbCjKhI02mzWvfJCxt7abx2OgDbL8vtkOG9C
	kQ9HBpbnH26N/Wsr50RpZBZ8VOX+ooVJbsVz2GmyoVTVtiOKk5+dGaDOnbg/IECgkvzy6EhYiuh
	j00MSqV9kFe5qefCGS7bS6P19nyqZvGcCCeKc0RrwTGTMFeIrJlTh9ublPUmjD5cpiVsTZBSQfb
	9h5jQhn/CNPR+4LB2/E4UxHTlT+tnb6CAafh/bt/TxG6As9HBwh+CsR/ut+2IECQIuTfnhOzdjo
	09MSml3/FFSxe1QzS8zxIQW1/rTiBmZI/5/uGHAW8te2DlILoAY0pIxJ4CFu1NPgzKyG0KBtDRP
	/7ggXWUlLHcz0r8PV2CVOBr+oQ0zplP1bcl1sGayJvCHH+4hwRDjj+76yicXmVn1EZIHfKipjO+
	WuCvViizg7ixxwlFg==
X-Received: by 2002:a05:6000:2589:b0:482:bf17:e685 with SMTP id ffacd0b85a97d-482c0b88f19mr23864132f8f.11.1787471360838;
        Sun, 23 Aug 2026 00:49:20 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:8601:39db:494d:605c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482c9bfcc31sm4279602f8f.17.2026.08.23.00.49.19
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Aug 2026 00:49:20 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/7] makedepend: upgrade 1.0.9 -> 1.0.10
Date: Sun, 23 Aug 2026 08:49:07 +0100
Message-ID: <20260823074911.1711858-3-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260823074911.1711858-1-richard.purdie@linuxfoundation.org>
References: <20260823074911.1711858-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 23 Aug 2026 07:49:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244014

Changes:

- makedepend 1.0.10
- meson: include headers when checking for functions
- meson: Add option to build with meson
- gitlab CI: drop the ci-fairy check-mr job
- Improve man page formatting

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../xorg-util/{makedepend_1.0.9.bb => makedepend_1.0.10.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/xorg-util/{makedepend_1.0.9.bb => makedepend_1.0.10.bb} (88%)

diff --git a/meta/recipes-graphics/xorg-util/makedepend_1.0.9.bb b/meta/recipes-graphics/xorg-util/makedepend_1.0.10.bb
similarity index 88%
rename from meta/recipes-graphics/xorg-util/makedepend_1.0.9.bb
rename to meta/recipes-graphics/xorg-util/makedepend_1.0.10.bb
index 6db7d040790..643624485cd 100644
--- a/meta/recipes-graphics/xorg-util/makedepend_1.0.9.bb
+++ b/meta/recipes-graphics/xorg-util/makedepend_1.0.10.bb
@@ -17,4 +17,4 @@ BBCLASSEXTEND = "native"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=43a6eda34b48ee821b3b66f4f753ce4f"
 
-SRC_URI[sha256sum] = "bc94ffda6cd4671603a69c39dbe8f96b317707b9185b2aaa3b54b5d134b41884"
+SRC_URI[sha256sum] = "baf742fb6c76c15febf5181e5cd814066205d8be9aef4abfdc2c54b235e14917"

