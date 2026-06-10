Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32963CD98CC
	for <webhook@archiver.kernel.org>; Wed, 10 Jun 2026 10:18:34 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17167.1781086712038677189
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Jun 2026 03:18:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=abKzI5Ze;
 spf=pass (domain: smile.fr, ip: 209.85.221.46, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-45fe59255beso3453588f8f.1
        for <openembedded-core@lists.openembedded.org>; Wed, 10 Jun 2026 03:18:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1781086710; x=1781691510; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZKKOjSO25Iuzu33rm6aSOQsDfTV2QyBiIkd7raa+Lhs=;
        b=abKzI5Ze5rm6Pz+jKabHEpouvvUpuY2acozNNrjCLIf8Bb+zwDXX8M+WFxcI1ZRE6+
         oysEFCVhLdLYYIvVWOQuwgzoQ4wLzTV2V6odh2uMmEhgYWT6DlmPOk4EiBl//SHc7lEM
         rjamPomO2/FfxJ+6ahBTN8jVXPLCAirynPdj8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781086710; x=1781691510;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZKKOjSO25Iuzu33rm6aSOQsDfTV2QyBiIkd7raa+Lhs=;
        b=O17RbYqJztfhtdMi4fZvCdi/1Hzi+OCNFVGlhCF+laqd3NmY3HyZeuZ3T/YrRAeKsK
         8zBagG33P3R8i+sO8PD/NylFjcIZN/D7kKwKueKF05+UBpuAOEVBzgmzB+QRTyA63cRg
         kxTSDnGURsA5WZaF5zOGLTrzGjklV8D8+dqAZYksgVRMnQx5F2XTlYVoj36pR/Ak9NSU
         IN9tUrKYtI/+pOdccJnv3JenGIPZLddmdxmIuJrQwYAnbDTA2mE8Wqlpj8iQsZgcRObn
         OaCxGNKCaYLgI9Tt/xb7tdpYkjudoYCcyl+uB6dVNna1e6xn88V4hvxpLberq5Skrxce
         HDKw==
X-Gm-Message-State: AOJu0Yz/NS34aGil1sspvID83fiadi4wlgceRKIdlWi+5awDnjNDIyvJ
	GLDwzmRZh6No2Vkfc/SgoYN/2kAmPWMiQ6YvZcqSQQI/wxdHpZNnavUBPd8GNerBwecD07N7LyL
	DUgOa
X-Gm-Gg: Acq92OGDWy7QOL9ajXhiXxMdTaihGcoEqHnfVvmXeg8RKC64hwoY9Y/JF2251sdLDJf
	T8v4GneN4DJ4qOU4nBwi7Sbd3rXDoGSWe0XrHPb3kcq2+qSQJusbfYCSEPMDnkyoEV97DihtDsr
	/Xg1u1dmgx6dUd44ZKdNmhk0nhtJPKc8btec7ODYXs+ikOKnT/qc+isV2bTlolNg1IlzO5aE9mm
	/T+gZfwrZLHsaSHXGPwb0+OQ+sv5v44yGpwzTWt3ZwB/mqtOVfB5J+nbry7CCHwHqLoCvB5WRPX
	5UG64A2GgwvnQC2XO0t2tFhGZmzO5Kaj9eOqvqwn9s0whAFvRnaFu2cPs/JnIBBNQvTMhghtlLB
	lO7NFqCi9hmZkfN2AN8JiZW91YbhRLYkt9CrvWuL70Xzpx3hRLRY/hLX56OcT3SJFH6gX/ekN8r
	Y8gVDQdTj2GBvoEw4BDQtQPwHVdNDEH72giumDYyrAQG8DuBmXqM5ZoLjaUypzUNsn2RvE32/N5
	ru90myfevlO7M+br39qlTIV/zcsLzhe77QcPoA=
X-Received: by 2002:a05:6000:12c9:b0:45e:73eb:1ff7 with SMTP id ffacd0b85a97d-460302dccd4mr26826097f8f.3.1781086710376;
        Wed, 10 Jun 2026 03:18:30 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00bb749f54eeb85d7b.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:bb74:9f54:eeb8:5d7b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f2e4b18sm55591592f8f.10.2026.06.10.03.18.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 03:18:30 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Cc: Paul Barker <paul@pbarker.dev>
Subject: [OE-core][wrynose 0/1] Pull request (cover letter only)
Date: Wed, 10 Jun 2026 12:18:16 +0200
Message-ID: <cover.1781086226.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Jun 2026 10:18:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238347

This is the patch from the last patch review:
https://lore.kernel.org/openembedded-core/cover.1780697739.git.yoann.congal@smile.fr/

Passed a-full on autobuilder with 2 AB-INT failures:
https://autobuilder.yoctoproject.org/valkyrie/?#/builders/29/builds/3934
* qemuarm64-ptest failed with #16241 – AB-INT PTEST: util-linux ptest failure: timeout
  -> retried in https://autobuilder.yoctoproject.org/valkyrie/?#/builders/61/builds/3760
* oe-selftest-fedora failed with #16308 – AB-INT: selftest: xterm: Xt error: Can't open display: :1
  -> retried in https://autobuilder.yoctoproject.org/valkyrie/?#/builders/48/builds/3832

The following changes since commit 06dd66e6220e5ce4ed4b9af4d8231ae5f0a8ce80:

  build-appliance-image: Update to wrynose head revisions (2026-05-21 20:42:48 +0100)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/wrynose-next
  https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/wrynose-next

for you to fetch changes up to 39d4d267906f8e18d44e1ba5da84acc4a5a85b61:

  pseudo: Update to version 1.9.8 (2026-06-05 12:59:40 +0200)

----------------------------------------------------------------

Mark Hatle (1):
  pseudo: Update to version 1.9.8

 meta/recipes-devtools/pseudo/pseudo_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)


