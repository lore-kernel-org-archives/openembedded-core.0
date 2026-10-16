Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ADD64CCF2C3
	for <webhook@archiver.kernel.org>; Fri, 16 Oct 2026 22:24:56 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5948.1792189493981918482
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Oct 2026 15:24:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=jEqYZ58q;
 spf=pass (domain: smile.fr, ip: 209.85.221.46, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-48de72fc832so226115f8f.1
        for <openembedded-core@lists.openembedded.org>; Fri, 16 Oct 2026 15:24:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1792189492; x=1792794292; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=uFmmA6h+J205ImWZoXQcGmU9Q0Fr0asVSi0VqiAJBfQ=;
        b=jEqYZ58qNaXjK0qmj9Y4GpzliY5CokhA1ZFUW61d9Qn2kDN6+sIh00ZN3H9UKdo1bz
         BKNSRJKbIVL/3pjLSL+1rzg8B+LSGNidBgatXfSQ5ZBDzXAu02p38BprS7/teQjJVAhb
         rgR8kOwhVPLP2RQxY+CNSZFw/FLCL0PT+HKmA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792189492; x=1792794292;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=uFmmA6h+J205ImWZoXQcGmU9Q0Fr0asVSi0VqiAJBfQ=;
        b=okDBHm8asaEoKF/KJnIgbplB6PiqK02OKuUiPy1r3gQDtWnV6sU3R7Dv00qjSv632k
         wtiV8K0NMnbEyxDcp2wDgDCvaH6jx6n19TfSKTjizJTjdX1BuiG2/yNt0bvykdEcR6RI
         trzNnHhko0lRGN9bhAG6gALmEQgC2YOmeSGdKS7w8bdRmHKcAYyUPgDbSOnsX17wGY4y
         ICTlfS0N3mGQkN3UX6ZkS7X6w8c++I+qY+iEEGAMSNd2tmLlq5CQ1dv3NWm+s6je79Ow
         /Jw/hKu1emhp4jMQtHD5cpW/eUCLLXLNBvyT0jpWgApCwIYUJgXaqlgrUoOprj4Xo6Mg
         rB+Q==
X-Gm-Message-State: AFq9FYIOnXxnliws9tvG8y4fd8gE3LAnNxkLbUVnR3HMtr5IBzZtf+jQ
	H1jw5oQIux5SlZ4pYzbeZG8eeDiscIt8Cxcyh3R068DeTotOx4i1GKYBsn3cXHZi4lEIyvykOu7
	2h6KuNY4=
X-Gm-Gg: AYBFou0HclzggkQTnneEZOokZYRo/sglWnb8GkBJHOS5ahUUSa8wUQytnvoLfptBb3G
	dK8NiWvt3/IBlvR5R92fy2EnUXhT7Zx+8w/Duj8zlONA7jSHU/tKwH9DNck07zsnlcnAZfHXCAH
	Vtumo5cXzn1Hld/HzpNdvkqqech8ygdXd6YMlEO//sE3il60xClIGwlORdqEQpIc6sL3SFtTNPT
	1qXYNgTefeJdnXi/0QSR+48LnLFrhiVmDKxry1CF5GXc8eWgiC+6RcvxEwKYK7amn6N0/UeQZGo
	fM2RhZ87zuxOrCOY51CA8b/x46hP9CoiTPbMmD9iGT1v5G4G8BwcTvGS2/W3hTBK1IE5i1QB/rc
	z/uxeQXVcL1Ood7c7uMGoUKYemylY4ogn8pl7YqUpeV3xHUH/Wsux9/0fzYxlAegIspF+pNMgAy
	HpcofwZips/lJdo0/V94bDVeYEaIvhx3y7SjUc/I2QQ4EXsX1cpMgOW6C1/2+4RSsGUtYd3Q8+B
	hULswWiNYe3dhy0MJRJge0M586z2nk8zAE/N1LD8n4g40WDUaC2ZOI7Uk8i2xNsshjdw3GK3w==
X-Received: by 2002:a5d:584f:0:b0:48b:123e:2f60 with SMTP id ffacd0b85a97d-48e07fa71c4mr1682913f8f.39.1792189492261;
        Fri, 16 Oct 2026 15:24:52 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd503862sm7639515f8f.46.2026.10.16.15.24.51
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 15:24:51 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][blacksail 17/17] barebox: inherit upstream-stable-release-point
Date: Sat, 17 Oct 2026 00:24:19 +0200
Message-ID: <a4461e117c1c501b7021d20c1380e4187fcda4c1.1792189264.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1792189264.git.yoann.congal@smile.fr>
References: <cover.1792189264.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Oct 2026 22:24:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248067

From: Lucas Stach <l.stach@pengutronix.de>

Barebox uses a vYYYY.MM.stable versioning scheme, with the stable
releases only carrying bug and security fixes. Thus we can use
the upstream-stable-release-point class to mark those releases as
suitable for inclusion in the oe-core stable series.

Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit dd7a67075c67ccd827242f098c41a12023e1a9ba)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-bsp/barebox/barebox.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-bsp/barebox/barebox.bb b/meta/recipes-bsp/barebox/barebox.bb
index a48d97941cc..583fde5d187 100644
--- a/meta/recipes-bsp/barebox/barebox.bb
+++ b/meta/recipes-bsp/barebox/barebox.bb
@@ -6,5 +6,5 @@ Linux kernel driver API for making driver porting easier, \
 and a subset of the POSIX C library for writing more command-line utilities."
 
 require barebox-common.inc
-inherit barebox
+inherit barebox upstream-stable-release-point
 

