Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0A71F8807D
	for <webhook@archiver.kernel.org>; Thu, 16 Apr 2026 06:48:42 +0000 (UTC)
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com [209.85.221.66])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7722.1776322113051977686
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Apr 2026 23:48:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=ruc96Y/5;
 spf=pass (domain: smile.fr, ip: 209.85.221.66, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f66.google.com with SMTP id ffacd0b85a97d-43cf7683a28so5119479f8f.2
        for <openembedded-core@lists.openembedded.org>; Wed, 15 Apr 2026 23:48:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1776322111; x=1776926911; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SNnr8zCuK9rJCkrulyG7Tv1QtQHZbFJT4AbUSi4SIIA=;
        b=ruc96Y/5+6wfHQcLnjuRJrvo7N4c3gQIfGZiEZBzXFREDdg1eApUc5iTXvS+onUwMJ
         fVWRGry67SRc7PrDXEbxquK40wdlZ9GstNHWWMBERjDZ8wQ/5icRaTk9lA4Nkje52pBd
         phvXFZ8ATtifzL/x9ZVH1k9NsBrTGaIAXyTqc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776322111; x=1776926911;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=SNnr8zCuK9rJCkrulyG7Tv1QtQHZbFJT4AbUSi4SIIA=;
        b=chMVrsMos5jys/osn92K4im3rrKOr2eaKuCybxdgUbyBIu/FBbffMoLsHuQQeRjyZk
         UN3eTWy1MUPl9oKv/2mNs4s9pXqx8YCfJRNobB3Fg7IVWpGYm8qrkxINBKJvsi1SC+WT
         a5MfWbfWIqzGbA9TEScOsn9OUw/KhSM9uUxHD+lNBT2NmcQw8oJ/kEaR3FdJMIAZBUFE
         xMF50Z2piprBzTM2Szf+IBGmh7T6NULg9ZrDwrokynrAtvTXO8SdOaB4MfK+jYxb1RIi
         KLfHHvpsaiAfR8r6uzpThiLMbHU0K8nr8J8hitNBGnkV1aUoPfI6yEvS4IkwFIcGzxlX
         P8fQ==
X-Gm-Message-State: AOJu0YwFVgcIW763nDCeI2UBL0UkQm3+jQgBIKZ/B4L/wq8e5j1XGrKX
	Byocbqtx6zuCi4HK1OUqVpbInsVfm1oszrt6WSlFBfs+e6oCpz0hwqlgwbcO2LIH0zShZThukWo
	o/ObijNbr7OS0
X-Gm-Gg: AeBDievQtyQ09DHQcaErn2UeX0BZzv0krf4Zp1fyXkJKf4b/E+HIzG3gJQl88AmdT/U
	QQL8L540MhdjFoNW278zbPTnvmiGY0UeylWfhoYnDA1RWAWf7BUqQlMfjeScqIVEIzeAsynq8ti
	JPuPL0NJagLy/pMMe4VKGQJn2JKYDARExnBTSDvCzZyY37ygXhJEzEAQNgQAoG2ip41l2/cUQq0
	tJWwH3QIkUD4LPmT+etox6ob6biX7szr2hhaLyAMcjpWGdmXE0/5K6folJM9Mz2ecsW00RgwsDk
	2BqFZzeCtvYitWZrBEx073c2Hjf5CqpJBnBn3tU8yzX/oacWHIACVbd5uI7ZFiNSTR83lySGkrp
	TVPQ2R8wwIduXpY2TW2GD2BrSMifQqDkKC0HHnKy1qPg8R/iUxQmJcyovA13PLofB9xpyrBVdgI
	JSZ2eHFyMCj3oSn0JbL2Ci+s3PSETEA4ZeKeY+vhNATZ4sx9lDZn/7xtuqg/019yt2XzSX3l0Sm
	gVhY6KjzgGyAOQu7QZvf8mW5scUgu57DaS18Q==
X-Received: by 2002:a05:6000:200f:b0:43b:9a9f:8956 with SMTP id ffacd0b85a97d-43d6428e889mr34835286f8f.22.1776322110994;
        Wed, 15 Apr 2026 23:48:30 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43ead3d5ea9sm11200017f8f.21.2026.04.15.23.48.30
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2026 23:48:30 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][whinlatter 20/47] yocto-uninative: Update to 5.1 for glibc 2.43
Date: Thu, 16 Apr 2026 08:47:21 +0200
Message-ID: <11ce247a4e165fde70992a6899d9a55b691a4dcd.1776321810.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1776321810.git.yoann.congal@smile.fr>
References: <cover.1776321810.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Apr 2026 06:48:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235362

From: Michael Halstead <mhalstead@linuxfoundation.org>

Signed-off-by: Michael Halstead <mhalstead@linuxfoundation.org>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit c1fb515f2a88fa0a0e95529afc07a99db001af0e)
[YC: fix duplicated line in commit message]
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/conf/distro/include/yocto-uninative.inc | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta/conf/distro/include/yocto-uninative.inc b/meta/conf/distro/include/yocto-uninative.inc
index e9dc6c86408..d97c96f631f 100644
--- a/meta/conf/distro/include/yocto-uninative.inc
+++ b/meta/conf/distro/include/yocto-uninative.inc
@@ -6,10 +6,10 @@
 # to the distro running on the build machine.
 #
 
-UNINATIVE_MAXGLIBCVERSION = "2.42"
-UNINATIVE_VERSION = "5.0"
+UNINATIVE_MAXGLIBCVERSION = "2.43"
+UNINATIVE_VERSION = "5.1"
 
 UNINATIVE_URL ?= "http://downloads.yoctoproject.org/releases/uninative/${UNINATIVE_VERSION}/"
-UNINATIVE_CHECKSUM[aarch64] ?= "a25f2174d0cefcb22af005e9bc72ac01ae83b011c5b6d6d5bf00dac979877f76"
-UNINATIVE_CHECKSUM[i686] ?= "959cc2539b692f9b9862825c7324a0fe4d061fca742f6c259f67f581c59af956"
-UNINATIVE_CHECKSUM[x86_64] ?= "96045e8b1e242c8a849426a8506c7043f354b39f2bc0035192780e8205e23e9d"
+UNINATIVE_CHECKSUM[aarch64] ?= "4166237a9dabd222dcb9627a9435dffd756764fabf76ed7ef2e93dc2964567ad"
+UNINATIVE_CHECKSUM[i686] ?= "761502cc9aef4d54d0c6fe9418beb9fdd2c6220da6f2b04128c89f47902ab9ae"
+UNINATIVE_CHECKSUM[x86_64] ?= "2b63a078c26535e0786e87f81ae69509df30f4dce40693004c527bd5e4ab2b85"

