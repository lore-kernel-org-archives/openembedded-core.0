Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9240BCD5BAB
	for <webhook@archiver.kernel.org>; Wed, 20 May 2026 08:21:33 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7292.1779265283154793141
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 May 2026 01:21:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=azx4bD3D;
 spf=pass (domain: smile.fr, ip: 209.85.221.42, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-44ce78ab5feso3819956f8f.0
        for <openembedded-core@lists.openembedded.org>; Wed, 20 May 2026 01:21:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1779265281; x=1779870081; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oE3aYSBF52qVbSf0opU/ta0V1vEo1StKEh3KB5OFdW8=;
        b=azx4bD3DV/R76ZnN9v2gtE2tycw+sJwDoMsihM7/ioV0bqWPozSAtu/g5bNbyo1htW
         Kyvav6rG2ihjpPJMnXcUa7uuI8zc91ENQUran91TFBbqtLublHTPbjPw5tsWT0MunIbC
         SIiAsox0s5BLSqrCiTgh91RoTyMWSmMeLVFDY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779265281; x=1779870081;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=oE3aYSBF52qVbSf0opU/ta0V1vEo1StKEh3KB5OFdW8=;
        b=g1HczY7nZv+UPADJpctk5tSqbkbx8ylESuNmNRMXhynTZJV/xG92hSQm/Dd2fcIx+t
         IkA0Q3Qt3QFuDEOhuFV2hIVx+95SC5g31c2SW2h/CGa1/maY8m3e5cqz+Mb0MfgtkK0Y
         0szUIpW7cSfpoef9XsDAcMP9yDnPvvVPKHFVJ2DlktgvkKeUyxq0Mpq5JQ5VBcU7jOkx
         THlMxPF/sq8+GAfwnijLgEvM6rzIpRfEN8d8ARpC6tu96fmP4yoTfRHGv5RUr09d+C4x
         JSEAROU6ld3zPapJs8UPre7iKxRgWmgVaq+9veR5x5e9iK57ojEAcUyw4el7XoHj8FTy
         TKvw==
X-Gm-Message-State: AOJu0Yz96ESXeo/zj1fJFFYEWhnqPmuER6Qct4KiURM3LHj72bf+ClQ0
	7vowEkaeiD/FIACn/HRXM6m0f0cpIZXobviaMJcWtEZ3t/rsTtDrBR58ur99WUP6EqQiKyOeLH6
	9mv3+
X-Gm-Gg: Acq92OF5/cxRaqfA85n+eE30DtmTxe6r4xtho6My0g4dzMlOY/3mvJQF12rcp/VxreS
	QrDs+ipDzYkPWGjHB5eTZG7STYXG+aP47ZbtAP4D/Ya4bQ6QQZrULjuHtH5JgIRxMHztUZFRi0G
	Z8Q8dRRLBNd9r16WC2JcTH19HI4jVBHXcVRvOpfvHHsAdO9OuvJhv0t0HE/x3vNpIbvSy4iOPtQ
	2UCwbFEmNVHBYtCl6q7oDHk6INUZMP1kyJ7OA5b5RKX95FMsNVkNsdG8cXY2Vw0DZiyRl8Sd9oO
	udFBDm8iUPAopfoSgOK6YNbJT/TcmvMN4ccq4WlBNT7gSNIr6wCq9hPDbtIEtsTYiI/VmwOmdKh
	kny9G+EfQwcDgP5TQOhzj9ZXOhSdXb9L7R5vtQCYOylh0paRzCiL9MmnaVuZBRdAu34X/CRPt30
	1r13AmoKT9XGAXvs4Ubs7/a1WTsvohv14LK9KMQMmuRphaZwmD5k5J+3h0eZjhcXJL1yxUhmEVg
	7amstWkBSkbJ/AS4DbGYAieh79D
X-Received: by 2002:a05:6000:4210:b0:446:ef9a:8f41 with SMTP id ffacd0b85a97d-45e5c5a8a00mr35534553f8f.40.1779265281243;
        Wed, 20 May 2026 01:21:21 -0700 (PDT)
Received: from localhost.localdomain (2a02-8440-250c-63aa-0256-2b9f-d16e-d784.rev.sfr.net. [2a02:8440:250c:63aa:256:2b9f:d16e:d784])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45d9ec39ff1sm56350642f8f.10.2026.05.20.01.21.20
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 01:21:20 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose v2 26/28] default-distrovars.inc: add missing spaces in append overrides
Date: Wed, 20 May 2026 10:20:27 +0200
Message-ID: <1e86f2d053fec8408c6974b4f45772c43a456cb5.1779264709.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1779264709.git.yoann.congal@smile.fr>
References: <cover.1779264709.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 May 2026 08:21:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237425

From: João Marcos Costa <joaomarcos.costa@bootlin.com>

DISTRO_FEATURES_OPTED_OUT is a space-separated list, so the missing
space leads to:

$ bitbake-getvar DISTRO_FEATURES_OPTED_OUT
(...)
   set /src/build/conf/local.conf:277
     "x11"
(...)
   :append[loongarch64] /src/openembedded-core/meta/conf/distro/include/default-distrovars.inc:26
     "seccomp"
(...)
DISTRO_FEATURES_OPTED_OUT="x11seccomp"

Signed-off-by: João Marcos Costa <joaomarcos.costa@bootlin.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit f1e6a11501224e68a5989cc6cd33cf1b903e542d)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/conf/distro/include/default-distrovars.inc | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/conf/distro/include/default-distrovars.inc b/meta/conf/distro/include/default-distrovars.inc
index 4bfe2469e28..69c6db589b7 100644
--- a/meta/conf/distro/include/default-distrovars.inc
+++ b/meta/conf/distro/include/default-distrovars.inc
@@ -14,16 +14,16 @@ LOCALE_UTF8_IS_DEFAULT ?= "1"
 LOCALE_UTF8_IS_DEFAULT:class-nativesdk = "0"
 
 # seccomp is not yet ported to rv32
-DISTRO_FEATURES_OPTED_OUT:append:riscv32 = "seccomp"
+DISTRO_FEATURES_OPTED_OUT:append:riscv32 = " seccomp"
 
 # seccomp is not yet ported to ARC
-DISTRO_FEATURES_OPTED_OUT:append:arc = "seccomp"
+DISTRO_FEATURES_OPTED_OUT:append:arc = " seccomp"
 
 # seccomp is not yet ported to microblaze
-DISTRO_FEATURES_OPTED_OUT:append:microblaze = "seccomp"
+DISTRO_FEATURES_OPTED_OUT:append:microblaze = " seccomp"
 
 # seccomp is not yet ported to loongarch64
-DISTRO_FEATURES_OPTED_OUT:append:loongarch64 = "seccomp"
+DISTRO_FEATURES_OPTED_OUT:append:loongarch64 = " seccomp"
 
 DISTRO_FEATURES_DEFAULTS ?= " \
     acl alsa bluetooth debuginfod ext2 ipv4 ipv6 \

