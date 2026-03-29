Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 689C9F3D61F
	for <webhook@archiver.kernel.org>; Sun, 29 Mar 2026 22:46:40 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.38499.1774824397847870880
 for <openembedded-core@lists.openembedded.org>;
 Sun, 29 Mar 2026 15:46:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=FPb/wwB4;
 spf=pass (domain: smile.fr, ip: 209.85.128.52, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-483487335c2so40272485e9.2
        for <openembedded-core@lists.openembedded.org>; Sun, 29 Mar 2026 15:46:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1774824396; x=1775429196; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SNnr8zCuK9rJCkrulyG7Tv1QtQHZbFJT4AbUSi4SIIA=;
        b=FPb/wwB4PE+ZjffN7HxHGxfXHR4iyzMgRhFMH2DMLKb/kDOS3nmRFd6keB9JqPPJM/
         QF6M+rE7eVlQOpliI28toGn81Frr0FaXdl3f/KQJ5jJMFFnkjj561DEqpb7U2tt+ciIv
         rVq1IoQTQ9xfzZ827WlvgIHyl+iCZlzty2Osw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774824396; x=1775429196;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=SNnr8zCuK9rJCkrulyG7Tv1QtQHZbFJT4AbUSi4SIIA=;
        b=HR2dsEP4amiaWF5LbN+RFH4rnPtqd6rfs7pO2AS7JDWCVYkBW6n43j3S9kfHqC57bS
         wIPFfD21fdKWnI3Klkk+Ktw2G9mH41u5OOcHz50JASyB9HvPv7GwaHz/EbhmxV3HeisW
         SRM/oO9gN+dmTPlXgKDBrXFlH9oOOconBfgcfXOSrqfV2pvNoWt3WUYDJQ9j8MEmEuHa
         ximgFPrdfiexuOsTN3mp+zEZ0LHo0ACJYTF4EIM9uC+5vddjVIZlsL/lw9KO9JROr6qJ
         RKUYI08wS/xcvomvZgsQxZxkKGnkXKDnIP3PJth3fbSIiO9qaSl/+xsyTtMev6E+nobG
         dMkQ==
X-Gm-Message-State: AOJu0YyorW545kEYShIN2TuhI2a3pV9N9EptSxefBBzF+pWg/p3VaYrZ
	WVy+C2B2sKGwS+U4XTK/7vRhzUZqo09Sq2tMCxojsXntso42Vf6wcmZ/Cu6G/gkMjFRwYjcyj2g
	pqgqF5XY=
X-Gm-Gg: ATEYQzwQG4p54oMN8vLtWHjSTt3bUGVDA+SDyC7yIMCH7zwM5zdevRS8aashzqDxzwu
	EOrLlAyyxjOWxkRjkM6yPNykEwhZQayj9nXdPWKxEAT1SDeo8v0O+0eKkO+hqMl95/pJ9vSK1kH
	8lESlDjLCf2kU/lGNz2yEtCYkh9WOzVZERnzFwYDh4cXiUHAz4UXdO+prdpDK+MqICSO5coDmKV
	BQDtUQHpmHx7z+hbCUxw4XSfHeZ2wOJY3ms5D5tBoXEiwcGAnUXEk/xSlUwAGzAFiOedmDOqRXP
	uZX4wPOuvOAk4G8G1ZX23V7uzc1Gga2Ba0Bfp5W+svP5qS0Q1tOGeb9mtQETKV79h5aTT01EUs0
	N5oMjKIn35JKC4DbBQ5id+MLUS8OYNMU32rzPA4c+8gDsSiTpsu8Eco41TKSOYVDcdwbt/BUWkM
	qZd84Nw/w0IYcpv7QNdNUOuaEn19LNJ9R0U9wOcBanIHXnxivgJhnR4U5WLFhq08bf6EI3f1jpa
	eJ/EyTMAZ4qtfAMNp0FoKSCXCQ=
X-Received: by 2002:a05:600c:3b1c:b0:485:6bcc:87dc with SMTP id 5b1f17b1804b1-48727f27c5fmr188570655e9.14.1774824396018;
        Sun, 29 Mar 2026 15:46:36 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4873061eeeasm133760375e9.2.2026.03.29.15.46.33
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Mar 2026 15:46:33 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 07/11] yocto-uninative: Update to 5.1 for glibc 2.43
Date: Mon, 30 Mar 2026 00:46:14 +0200
Message-ID: <d5bc8ec69bf469385db60ff13110a4cfa2dcc67b.1774824253.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1774824253.git.yoann.congal@smile.fr>
References: <cover.1774824253.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 29 Mar 2026 22:46:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234188

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

