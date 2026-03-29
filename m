Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3BF91FC9804
	for <webhook@archiver.kernel.org>; Sun, 29 Mar 2026 22:38:19 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.38621.1774823889138958394
 for <openembedded-core@lists.openembedded.org>;
 Sun, 29 Mar 2026 15:38:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=sPVziziz;
 spf=pass (domain: smile.fr, ip: 209.85.128.54, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4873ce69ba9so2619405e9.2
        for <openembedded-core@lists.openembedded.org>; Sun, 29 Mar 2026 15:38:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1774823887; x=1775428687; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SNnr8zCuK9rJCkrulyG7Tv1QtQHZbFJT4AbUSi4SIIA=;
        b=sPVzizizCpPKWLQ9QEKAshCOgYYiDkUUAd5HCNqhfuOyVvfsUvnnLrZVTWE2A9XOBx
         Gjy/QtSRJu7jSIVu/cNBiCg10cUf4plSkzOWMs4Fop37aTy6WjkTDCWKhVwmpSziM/sJ
         LVUwPWu0dxZ8cWzruWoOpDiPF91QjBne+af5A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774823887; x=1775428687;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=SNnr8zCuK9rJCkrulyG7Tv1QtQHZbFJT4AbUSi4SIIA=;
        b=nFe8P06Uvn55mTlkMi/PBHUuf/5xTGESeE6nzEBh1ZzrWjSnLcuglCEqJ5YXUz2vuO
         TawEd58eHSJILjA/VP90tT05Co2SdEOp/fRj0Uc5aXn4Yo+il+oOrkpKAMJOlfQDWCwM
         FI03K7Iw/xrfZpV9Ihn/2b0apiuu7Bwgyn/mf0+OHGVVr42ccEkjp/TsjIoxVLDlbQVt
         1j+rFS2PAdUCt2gyOiJaHDfUBqrWYAiCKTxOHGfipbZpB2eI+tnlJsWhiWIrGJTYEQ3b
         dlSAU0U7qYxoHs6EudH2afR72C6ijTGl6hMKQAfuSPNpcD02rCcpFvz6vKATkBksXMQo
         9z8g==
X-Gm-Message-State: AOJu0YyGtDD91P1xAATsuAB6WZo3KsoEvxwZTNXhrRxgD6/sQCML/blA
	JIm8LvOAMIAUPpjmUY7i25RRTQdTlgKumJ2Q/mKCZ6CmhjEtlse5SMqjrjuox8jdXJQzRrpJyt2
	COK6e2kA=
X-Gm-Gg: ATEYQzzw5tLkeGBF74b92z770uI5PxGrM3foXXyBHRlSjolBIrxfQ4czvMjjqB81URO
	yzZTOCSgme9XAw+hxYs4VbekG5agP+66U8co7lcDDfwp345yZaW4+jacHfgLkljO48U//rF64qz
	+2Lzm9gZ8e1otIpPzt/rhSbtIaj7eC/2mp5kufJcGasM0D0v647JQWj6tVgGnlkWDuTiy4S7Tgv
	dMWFu7S1cEk4cQIq+e6SjuM3ZGdmLA7sZYHYLk+USMPHptZLgbi28C6/fTiHBkAGvf1RipmM7CE
	paBAuW5uZG4hP1vUE7e2D+MPvpT8pE9RVUkQiU3mAsKPB/MMgBk8wkb3fb+DowWd8kNpzh2EiTG
	EoneErgqr+2fe6mk2/ngrzya0ML9krRR7smvKRoRgcXAwl/y83dVdKTJO0fwPrksh/J3AhqMTPy
	t6s87Jg88+DrUFiMPME0eGo98veWH0KEdHLTa4yDa86AEx2KuXvomPCR5NyqgbfAXleE5GlLgxp
	DAaQ84qPzcTI7ZoXXAzxLJot9U=
X-Received: by 2002:a05:6000:1acd:b0:43d:dd:8cae with SMTP id ffacd0b85a97d-43d00dd92c1mr841648f8f.22.1774823887209;
        Sun, 29 Mar 2026 15:38:07 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43cf2471ee2sm13038542f8f.29.2026.03.29.15.38.06
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Mar 2026 15:38:06 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 07/16] yocto-uninative: Update to 5.1 for glibc 2.43
Date: Mon, 30 Mar 2026 00:37:39 +0200
Message-ID: <d5bc8ec69bf469385db60ff13110a4cfa2dcc67b.1774823430.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1774823430.git.yoann.congal@smile.fr>
References: <cover.1774823430.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 29 Mar 2026 22:38:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234165

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

