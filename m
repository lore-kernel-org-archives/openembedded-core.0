Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3BE4E6FE49
	for <webhook@archiver.kernel.org>; Sun,  8 Sep 2024 13:56:05 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web10.30519.1725803759566534364
 for <openembedded-core@lists.openembedded.org>;
 Sun, 08 Sep 2024 06:55:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=lpx7rDDl;
 spf=pass (domain: gmail.com, ip: 209.85.128.42, mailfrom: martin.jansa@gmail.com)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-42cb1758e41so8451775e9.1
        for <openembedded-core@lists.openembedded.org>; Sun, 08 Sep 2024 06:55:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725803758; x=1726408558; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bPYOPNpwhmzDwKqhJPyK9XXVHT9SS915rj1qAgZiA9g=;
        b=lpx7rDDl0nbhz9sO7vrfjQw4gg2NcG+oYYZ436X/BbHV836/S6pI+piHrYBWy4fvFp
         5nRlQCThJ5NKJqnrlSMmnWdkCPVbO/Aj+g6DzUQInYXQmlurqWRtMMLK5F7SqWRZCRIJ
         TRS7haC5zGmyQsq3fD1IFVnQvP2yyeH1QaRSX3zpKmO8PfaNayLMSQoM02cBZ4NrCbgL
         gKORFEt5DbIHdFjpf/k7FjNo1wJF35cDk/o/RadDmhfrJc3KnfBoTMyVqsLT0gMLfc3/
         mXJ+SYosVWjBIANYexVaUkxQtZlfnIXSzzVuxCn5TfU1eqcVmjNe2s+FZeh1SrFZ06cA
         49Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725803758; x=1726408558;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bPYOPNpwhmzDwKqhJPyK9XXVHT9SS915rj1qAgZiA9g=;
        b=omyS97KXn0MofHKJhHb++XLCL85sjCTGr5svI70Oj20oisK0cqfelOl9RYXIJYDDei
         L4EqxriCn4ddtjrjbWNmm6DJIJpCSZfqp7OQtArbr2JJd4RsJQnyNQ9W8/mlHSY2DgTT
         i2lZFRBs9pXPM4eAMPJ5YoXl3lotVyiWRzMPCa/8eAzldPo5hEAZVHkPx4rPtRfPnwk4
         nhoVBLXw6tBFIJS1xP4KnCv9fv+ZoSP5pWsHYiLCHmDiwKK7UTWjpR25ixNJ1fmYZFs3
         LVZcJVfa/f1R73USbeQ91g9AW/zWOO9I46U+PElIV90aqsGBbLJtxzyB72QEnF924KLY
         INNw==
X-Gm-Message-State: AOJu0YwjImAsBX0/86ikSKCA08Rj2k9qYWiMjX30e8vs3QxFibwGPBKF
	f8bHA6YucXte7itTe0DCw3p2Jb51GgSSA4MLRI4OC/Lc+wEIPFBZm+DNDA==
X-Google-Smtp-Source: AGHT+IGd2IJliB0TiXtAwNIExUlcWsDdg/q4Ex0+A2xV3FHCEhwRMM5zOS0zergmGRdkjxuya5ilAw==
X-Received: by 2002:a05:600c:4f88:b0:426:62c5:4741 with SMTP id 5b1f17b1804b1-42cae70a06bmr30127705e9.2.1725803757089;
        Sun, 08 Sep 2024 06:55:57 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42cb0dbcb6bsm38726735e9.30.2024.09.08.06.55.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Sep 2024 06:55:56 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: steve@sakoman.com,
	Michael Halstead <mhalstead@linuxfoundation.org>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [scarthgap][PATCH] yocto-uninative: Update to 4.6 for glibc 2.40
Date: Sun,  8 Sep 2024 15:55:51 +0200
Message-ID: <20240908135551.495046-1-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 08 Sep 2024 13:56:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204301

From: Michael Halstead <mhalstead@linuxfoundation.org>

Signed-off-by: Michael Halstead <mhalstead@linuxfoundation.org>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/conf/distro/include/yocto-uninative.inc | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta/conf/distro/include/yocto-uninative.inc b/meta/conf/distro/include/yocto-uninative.inc
index 657c1032f9..a6f7107dfe 100644
--- a/meta/conf/distro/include/yocto-uninative.inc
+++ b/meta/conf/distro/include/yocto-uninative.inc
@@ -6,10 +6,10 @@
 # to the distro running on the build machine.
 #
 
-UNINATIVE_MAXGLIBCVERSION = "2.39"
-UNINATIVE_VERSION = "4.5"
+UNINATIVE_MAXGLIBCVERSION = "2.40"
+UNINATIVE_VERSION = "4.6"
 
 UNINATIVE_URL ?= "http://downloads.yoctoproject.org/releases/uninative/${UNINATIVE_VERSION}/"
-UNINATIVE_CHECKSUM[aarch64] ?= "df2e29e2e6feb187a3499abf3b1322a3b251da819c77a7b19d4fe952351365ab"
-UNINATIVE_CHECKSUM[i686] ?= "8ef3eda53428b484c20157f6ec3c130b03080b3d4b3889067e0e184e05102d35"
-UNINATIVE_CHECKSUM[x86_64] ?= "43ee6a25bcf5fce16ea87076d6a96e79ead6ced90690a058d07432f902773473"
+UNINATIVE_CHECKSUM[aarch64] ?= "c2d36338272eba101580f648dd8dff5352cdb4c1809db7dedf8fc4d7e7df716c"
+UNINATIVE_CHECKSUM[i686] ?= "0041584678109c18deca48fb59eaf14cf725cf024a170ab537b354b63240c504"
+UNINATIVE_CHECKSUM[x86_64] ?= "6bf00154c5a7bc48adbf63fd17684bb87eb07f4814fbb482a3fbd817c1ccf4c5"
-- 
2.46.0


