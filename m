Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8277C44506
	for <webhook@archiver.kernel.org>; Fri, 10 Jul 2026 16:37:24 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1960.1783701436989059512
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Jul 2026 09:37:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=O230bBoZ;
 spf=pass (domain: smile.fr, ip: 209.85.128.48, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-493bfe9f886so5846175e9.0
        for <openembedded-core@lists.openembedded.org>; Fri, 10 Jul 2026 09:37:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1783701435; x=1784306235; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=1Z3X2S5BWA6UutDHy07eFTsAMlP5eNKsNOIxh5XC5Jc=;
        b=O230bBoZDXitgmfMfe2Yg0/cy/0fV+dr4WmJgDGN2owB8bB5xuWmzNQdoMQzEzi774
         umUbbI64o27GJCKtsSvKZWbEy9Jqc1p3ZxG0qckALaOI8QRtm6uA2X7mPv2Hd5wSD6FQ
         vMZf0OJfWJsNcX96fq+wqtswr5sO46V60oBqA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783701435; x=1784306235;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=1Z3X2S5BWA6UutDHy07eFTsAMlP5eNKsNOIxh5XC5Jc=;
        b=mRD+OClXfShit1pBvgA9G3q97bvcHbaSAXz5jrKKSr7Q/cB53ZzpOJwU9tKzHEp/aT
         LXsvgPEfDeEPChi058TvZrSuBOA8GepU/CLgbgZq69MW52ykoNDakxfgK4wCaeHxHQtU
         l2cjsCf4SdqCg5ZYqgQ9hcjqhwpHcRex+5NQcvQYGzsKaIY1n9iiW1YwF/rdT0KRyTvU
         6jmjkmRf8oeqVA4SShf25CHQFKX7WZikfYDld8B7p0FTa186TsleXzhPUh8fSS//4YME
         /9UJE4gXGz56C8Xj8+8pUMfKb4aeCXGFJFEiAQLCh7/8ErD+eL2LYWUKJNpigVpsUgE9
         J2xA==
X-Gm-Message-State: AOJu0YwbULyNd58MizM7aCjcVakDj3GuWos4CWaeIpRIgdaXSBwe25yg
	RtroEI9/hhQoQyL82V1Y4sgT9DbPSCS3eVwZ1Stk3QcMar1OdznxzuI56Ro5Q0fSp4BuZpYURQI
	tqtsDz1U=
X-Gm-Gg: AfdE7cl0rqlEEz2ZX1h20JEpl7xCHh97AI5kRDxeYByMYKUQ7bGiweZVslurzt8OkWc
	34Plzr679f/hkRWHqsrljqeMak8MeNPby56rAkFTYgqm8W0Oom/Klrh7gpDg83MZJoBBm6GpAxA
	3qaa71PgzK6PVyPL4sUE7QKfQQy1AoP0d4TqufCfSAFl9ukPpmQuchdx1BRHs46Y7QpA3e3AH0x
	qXb39dsaakD1KbH1qw1qssiQaxaOymiy9LI3+xOfhjekNiF/W1hz8JBQbr2ra0yBhRNhXbSEChK
	nq8dAEnfdDXTbI0YxWPKJZ7A1A27yhgM9QIkCZsVkda2m7qLI0Md/np4innD5Ss0Lw2yhZOuk4J
	MlDDnK22nyInF4vxsfhNGzZN25X3umnn182Zj1nmdH3gxO6kglu7aidvdNOPihywT3Mgttc7XHO
	Bxz0eCng8QON4XcBqeYUcAnWaG3p3d0FPbe2aFHGaybHAvKzS5IpDt6cYGGfGkHwNIZD0M3KcpW
	uJ2Q3j9WjcW9dwBF78=
X-Received: by 2002:a05:600c:3acd:b0:493:e57d:4f58 with SMTP id 5b1f17b1804b1-493e687b8d2mr120186965e9.36.1783701435186;
        Fri, 10 Jul 2026 09:37:15 -0700 (PDT)
Received: from localhost.localdomain (2a02-8440-2608-8c5f-3a92-eb6f-dc01-ac58.rev.sfr.net. [2a02:8440:2608:8c5f:3a92:eb6f:dc01:ac58])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493eb6d4f9fsm150758695e9.4.2026.07.10.09.37.14
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 09:37:14 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 17/18] xmlto: update SRC_URI
Date: Fri, 10 Jul 2026 18:36:32 +0200
Message-ID: <f0b9c59bf25812b77b35fb91fd97e5d109d2bb3f.1783697455.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1783697455.git.yoann.congal@smile.fr>
References: <cover.1783697455.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 10 Jul 2026 16:37:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240677

From: Ross Burton <ross.burton@arm.com>

xmlto was previously hosted on Fedora's pagure.io server, but this is
being decomissioned. As xmlto isn't Fedora-specific the repository has
migrated to codeberg.org.

>From discussion with Michal Schorm <mschorm@redhat.com>:

  I became the new maintainer of the project upstream and after a
  discussion with Kevin Fenzi, migrated it to a new home on the
  codeberg.org: https://codeberg.org/xmlto/xmlto

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 0046c780bf612aa7946023f8993c45f0c0b65c08)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-devtools/xmlto/xmlto_0.0.29.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/xmlto/xmlto_0.0.29.bb b/meta/recipes-devtools/xmlto/xmlto_0.0.29.bb
index 613d7973ec1..c26cd21dd07 100644
--- a/meta/recipes-devtools/xmlto/xmlto_0.0.29.bb
+++ b/meta/recipes-devtools/xmlto/xmlto_0.0.29.bb
@@ -7,7 +7,7 @@ LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
 
 SRCREV = "74862a684907ada3d4ed2ce0f8111adf626e1456"
-SRC_URI = "git://pagure.io/xmlto.git;protocol=https;branch=master"
+SRC_URI = "git://codeberg.org/xmlto/xmlto.git;protocol=https;branch=master"
 
 inherit autotools
 

