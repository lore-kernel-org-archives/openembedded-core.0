Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D71E6CCD1BB
	for <webhook@archiver.kernel.org>; Wed, 22 Oct 2025 11:32:24 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web11.6620.1761132740303390590
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Oct 2025 04:32:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=dmScE+xP;
 spf=pass (domain: gmail.com, ip: 209.85.221.48, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-426ff694c1fso1748877f8f.2
        for <openembedded-core@lists.openembedded.org>; Wed, 22 Oct 2025 04:32:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761132738; x=1761737538; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7jvH1nBmiJDjDN7rcDA2l2uNL3oaMtSCIAzuFlfDZ+o=;
        b=dmScE+xPKSTJOE1Ju3k9F3HKoNFux30hjy1aCB2AVC7hiWNarjJOH117jz3S7muanP
         MYlwW9xkfcPDH7BzTlraMFQtVcouSsv8hDaHPjcHBKjdivWrHpr0JXHap+pSplHXU7NH
         ruk8pBb5ewRxmKNjZEP/3dxrbbEEueTmc7Ib2ySPcSpYmSwNfvEDzRxQrlAAv8ETrrTa
         rXvQUCajCSXmyPjYzY9nHrVOM5xx1mSlD4NhYVnHqe+XXSXH9qnZKt4RJ4+GdSNG9cib
         ohPAr5cvjnOyAKuxotsmjNvboL0p+XvQxLoQ3AChbih+LfSZCuJ5c0dJoS6FTtmtFb30
         EOZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761132738; x=1761737538;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7jvH1nBmiJDjDN7rcDA2l2uNL3oaMtSCIAzuFlfDZ+o=;
        b=vw2o+9qrxwXn5rClyEOEgyIP5uVAPc7kdZNFjKZUc0B3uUOrmt6B7ul4BBew/o3DIo
         +A+0HnNQufXeqyJWnRiVo9Oxw1U4WN5aHDvUfxz8OLFCrqBw2t+Ou7f7lHdmC0HhcZsi
         P0n7TH/h/3PXMm05Bm3dC/vcj4z2DKMJhcKiZEEGMRiwuRZOSCwlDIfGezIRSG1n0TaX
         rSGlE4jnE5yCAVeabvPzhe70sMl79saMqu7P8klP/85CylrI3dgEuMyn03pqWE+2Q7Ba
         ZXRi5fW4A+WCi8zdsATkhT+zCYjsCTr2lhjcWcodIyzmwxaIjByCmB3lCY4vYn3urjfO
         Fzzg==
X-Gm-Message-State: AOJu0Yxgye2afDTFfsvmtOCCqoEZxCx86hF2JmAmTBGhBI2wlizEsdyW
	6F9y4vy+PFMRSZ2mBBeImpcbyVHOwDO8DY/Pdu1fzN/9BIPJoh5JK89GYoHcfg==
X-Gm-Gg: ASbGncvfCFwZTrxuURwSclpwKvsbvQ3pdleUWLeC8oDV9EsImAIBXiwtajKw+Ewz9DE
	GlBD2p68lG7gz9B5sG7QQyYlSybbx4h+jL62xxBW5US3JsI4CUqqxxFjmLV5bzJbimA524mSOiF
	6oS4uCHAH77fO6UI0wGjM7BHe1rdRwxJL8INjvvvjOBgT64rLbHKCewo9eSl2QlueFdxgyRsnT+
	Wgp6s3C48wthqJd8Jgovpwp2LCxfy8qkGXSV+207Mt+eqnpJbN3sit6GgG89nq6/ybDVLacRzuG
	odK+YZN/AMMQdJtjR6hm+m1LfXNIlBuCjz+/CHUI2o3OuFmX8Goai3OLxXT44qbj8dzPwU36eUS
	HEWb4hoBeN9pd3c2Ozshr74l1LkxyHEYgfZz65uF5FDQGI49EluoWWQeyJlH+eYvB2DcqMH2+Rb
	587Qei54C4ykN9xltAS40RIi3khy8rWBZfqCylLvlva6+4VINx3fx7/5Xa7nKnJ6OuwHeUQJDuB
	ru/5VJ3+9KCQV3ZOfiouZT28xgY83f1zUH+Fd0=
X-Google-Smtp-Source: AGHT+IEf+nttqIRsPlsuM9H+mzcZwXogkOFtS2Zqprp1BfELKW4xsH6LaUAJaqGtO0LTpdCgpOn8yw==
X-Received: by 2002:a05:6000:26d2:b0:3e6:f91e:fa72 with SMTP id ffacd0b85a97d-42704d83dfdmr12156686f8f.7.1761132738404;
        Wed, 22 Oct 2025 04:32:18 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-427ea5a0f7dsm24380087f8f.4.2025.10.22.04.32.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Oct 2025 04:32:18 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [RFC PATCH] layer.conf: add a bb_min_version statement to perform an early bitbake version check
Date: Wed, 22 Oct 2025 13:32:12 +0200
Message-Id: <20251022113212.3220395-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Oct 2025 11:32:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225186

From: Alexander Kanavin <alex@linutronix.de>

Please see the corresponding change in bitbake for the rationale.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/conf/layer.conf | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/conf/layer.conf b/meta/conf/layer.conf
index 54fa04e213e..6c05c0e1934 100644
--- a/meta/conf/layer.conf
+++ b/meta/conf/layer.conf
@@ -1,3 +1,5 @@
+bitbake_min_version 2.15.2
+
 # We have a conf and classes directory, add to BBPATH
 BBPATH .= ":${LAYERDIR}"
 # We have recipes-* directories, add to BBFILES
-- 
2.39.5


