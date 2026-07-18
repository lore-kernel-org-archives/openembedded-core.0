Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24ABFC4451B
	for <webhook@archiver.kernel.org>; Sat, 18 Jul 2026 08:53:42 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2528.1784364811986587003
 for <openembedded-core@lists.openembedded.org>;
 Sat, 18 Jul 2026 01:53:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=tCauHaQ6;
 spf=pass (domain: smile.fr, ip: 209.85.128.49, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4954c0833b4so7366815e9.1
        for <openembedded-core@lists.openembedded.org>; Sat, 18 Jul 2026 01:53:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1784364810; x=1784969610; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=E40mGLQzzIkUMFYpNYP8DqqYCvZ8ydkSCvWAvi9omvc=;
        b=tCauHaQ6GQVHFWrOVg+9NePWomK/Pp3YEmCo/BlvKT8gK7RX5SbG338lTOX8NCnqEh
         /0ORLqZ8b4JGWLWG41TxFspmhTWRaYg0FQkvrXUc1z74lYBkF2jC7bDFAPsbATNGvNVY
         1p4NHK64Iysqqg3GSAQFuFNaInja1vyWy2YyA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784364810; x=1784969610;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=E40mGLQzzIkUMFYpNYP8DqqYCvZ8ydkSCvWAvi9omvc=;
        b=RxeWH5m/eqw3lPtQbncegO2bPiQuxvMV75tgN0+eBpJ3SdRrIpkmNy78ESMwB3RFlL
         KxTY8pLUAog1cO2eReHqVsX7yYN2aUNhi7sdWbNKdY2ers+5BwiNcAic+br/rASxrCLt
         NKmAkisBwMFH3p7TMtc5Cb9n3ymEfd4R6u6L9Gwyx5b9Xf/k0+cEHqx6Z9kOwQhLWmv2
         R6lKsEAEQWpUsHGekWqJaC+d2vZO9xyIUXz9jN9+1NNe52ZxVinY7LkVBrZjRDxOdAWk
         RZmH3M+ETniwbydsJIzuheq+DdBh8Av8wRDGnjfnuW9ZgyA/HoPbFn7mLTUTFGfEK3DM
         Zvvw==
X-Gm-Message-State: AOJu0YwswU9nskWUBGgRSvLCAuBSivCrQ2t/ogTCVke+Cf1JQiBp97Za
	7VdGs2k/JYUjxRQ/Vl9r2lA4O+73ZKlc+m8JnOn9vlkmQPWPuwY0Lu7Q4h6MXBQE5z8RDW4pIsg
	FsGlKZ9c=
X-Gm-Gg: AfdE7clnJsvSL23bmvXyAHggQ2vvtyknQa3gVC88STiO8CTFsfkP83KmRcY6vijdkQu
	R3oDvcIZQWLhBLOcl/urxLzdlzaJ1mQtL5zEUx3GhGRRc/uNiYoL+3MiBKaC+d5M4U0cr2A1k67
	XyTfEPqVYhEQH+GEI5Fx7XOhxx5tQCKYhNDSwDFw2+Ia4GGkO0mIQF4lU9DbDv0fSCwSCFbtO51
	Rc6sujuaa2WrahXq/s6K2LeBSmVlm2+Fm1UyzG6n8BiG4TZABJhpSIyWbnGam2d9dsNTwv8Ja61
	FWbRhTZf96Mx/MtOYztbPV5x9IGf7f3PS/MPaX0JaOxqyjtvTYbZlEs9LKfVAwdUjbLfzxJzSnd
	EVeP151o/xE43RAAB7AjCDKHIyUqiOw3iT3XsHLD7oCjN8IcMyF8kJ3UI5kDeNc2+wjRrCirZqL
	rg45AG0xPYh1mLrYk1kibSRat/FvPEXAC0eh+nDTh45OeyOsCFo/YAfvaw8MhcJ782hh92dDdGO
	T6cgJs=
X-Received: by 2002:a05:600c:6287:b0:490:e5c1:b8bf with SMTP id 5b1f17b1804b1-4954a3f3927mr63293465e9.13.1784364810194;
        Sat, 18 Jul 2026 01:53:30 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa001444456ef7d84e9a.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:1444:456e:f7d8:4e9a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4954a2b87c6sm176409335e9.7.2026.07.18.01.53.29
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Jul 2026 01:53:29 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 15/17] flac: make documentation build deterministic
Date: Sat, 18 Jul 2026 10:52:54 +0200
Message-ID: <0d18302027fd3e76a2c64bd6e83b668a373038a8.1784364567.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1784364567.git.yoann.congal@smile.fr>
References: <cover.1784364567.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 18 Jul 2026 08:53:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241252

From: Peter Marko <peter.marko@siemens.com>

doxygen is autodetected (e.g. from HOSTTOOLS or a transient dependency).
Add a knob to make it deterministic when the documentation is being built.
Keep it disabled by default to preserve current default behavior.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(From OE-Core rev: facd4a7561f9e4c8b4b36329115634a586a0f7e1)
Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-multimedia/flac/flac_1.5.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-multimedia/flac/flac_1.5.0.bb b/meta/recipes-multimedia/flac/flac_1.5.0.bb
index a667ea9f625..d55e157a9d1 100644
--- a/meta/recipes-multimedia/flac/flac_1.5.0.bb
+++ b/meta/recipes-multimedia/flac/flac_1.5.0.bb
@@ -34,6 +34,7 @@ PACKAGECONFIG ??= " \
     ogg \
 "
 PACKAGECONFIG[avx] = "--enable-avx,--disable-avx"
+PACKAGECONFIG[doxygen-docs] = "--enable-doxygen-docs,--disable-doxygen-docs,doxygen-native"
 PACKAGECONFIG[ogg] = "--enable-ogg --with-ogg=${STAGING_DIR_HOST},--disable-ogg,libogg"
 
 PACKAGES += "libflac libflac++"

