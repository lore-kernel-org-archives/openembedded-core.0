Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72DA1C7EE2A
	for <webhook@archiver.kernel.org>; Wed, 17 May 2023 08:07:08 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web10.44477.1684310822108469215
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 May 2023 01:07:02 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@bgdev-pl.20221208.gappssmtp.com header.s=20221208 header.b=BAbG90o6;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.128.42, mailfrom: brgl@bgdev.pl)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-3f41dceb9c9so3014925e9.3
        for <openembedded-core@lists.openembedded.org>; Wed, 17 May 2023 01:07:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1684310820; x=1686902820;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i6y/MKgHk+m70e7BUZM4vIh0yJ55pOMcTPcjKGdqVWc=;
        b=BAbG90o6yqLN+mj/CFu9cW60KUu/aNis39ioHtTHCcZzmaL1Igv5HKKSPkhC2rVpFU
         98an7XpAI52Vlc7r/8ItHeqlwmX2KHd3N3xhwu8BzwFljGTr0ynFzT0FNurxov44Htiv
         oUzc0G4w0KWjn+rxhsWWxk1KoV7hjMLmcR67H092hrjkWICrM3QXnIuw9e01slbekzxl
         iWed1cZ0oYkneFEhlASo+DNRjoLTa81aOSxK9JJmxeCdK5LIXQ/VUE20SRiWnKGymxpD
         3uAxqv3bak7C7uV/aMO1Pmp2KCU5lWdizXL0vLJbyBaLzUH/Yvu+MmYF7TrkHjkByEi0
         Y2XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684310820; x=1686902820;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=i6y/MKgHk+m70e7BUZM4vIh0yJ55pOMcTPcjKGdqVWc=;
        b=l0LVI/27X3Rau1A4wJVXhpR4wFl5KB1sjlv6pLCLJogpXn5PpDmF2SUuXx/oR8lHhH
         TWANkcb2QURTxi+NlrmRIKPM8s7hCflAflDjKP4BXtXHVE+MVSkquWuVkT03X0pMvT1H
         zvu7/aHjJW3YSd49cNecWBTTL79j+/EgZPNQEN58dqyZ469MAx9NPWbVOzPV/SXABuDX
         Q0LtK/p7hx4IfqkOBmP2NL6ZK6STBHSU66zi0XyxUroUwXVXRyYH3mVykc+jMSuoXfm9
         s8Qd1WlfEB91j4zTqgmKvhStNf1hAFfKFl6yzlojNX4xVXjsCVV6ZgeQQnlMs9N6aypP
         iZHg==
X-Gm-Message-State: AC+VfDwSCV3zMmvyd9GwPZnzhK9gZ/JGo4qN++UDgLrCU7ZgBGu9gTNw
	uZM9Bh3ewO46afBylGI2BprBevy3TJVjYcCjs0o=
X-Google-Smtp-Source: ACHHUZ6gdndSnWoWLQ+b0aEvrYwEKF1E1x9NIVav8RzGy3SetRXOwuzmro47YNphWJNOsryThB1kkg==
X-Received: by 2002:a5d:61ce:0:b0:306:30ea:a072 with SMTP id q14-20020a5d61ce000000b0030630eaa072mr31929016wrv.53.1684310820674;
        Wed, 17 May 2023 01:07:00 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:6f0d:9301:2b67:fec])
        by smtp.gmail.com with ESMTPSA id l6-20020a5d6746000000b003090cb7a9e6sm1919593wrw.31.2023.05.17.01.06.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 May 2023 01:07:00 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>,
	openembedded-core@lists.openembedded.org
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [OE-core][PATCH 17/20] python3-pygobject: add missing run-time dependencies
Date: Wed, 17 May 2023 10:06:36 +0200
Message-Id: <20230517080639.9336-18-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230517080639.9336-1-brgl@bgdev.pl>
References: <20230517080639.9336-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 May 2023 08:07:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181466

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Add missing RDEPENDS for this package.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 meta/recipes-devtools/python/python3-pygobject_3.44.1.bb | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python3-pygobject_3.44.1.bb b/meta/recipes-devtools/python/python3-pygobject_3.44.1.bb
index 8bfff43560..a5eecd33aa 100644
--- a/meta/recipes-devtools/python/python3-pygobject_3.44.1.bb
+++ b/meta/recipes-devtools/python/python3-pygobject_3.44.1.bb
@@ -24,7 +24,10 @@ S = "${WORKDIR}/${SRCNAME}-${PV}"
 
 PACKAGECONFIG ??= "${@bb.utils.contains_any('DISTRO_FEATURES', [ 'directfb', 'wayland', 'x11' ], 'cairo', '', d)}"
 
-RDEPENDS:${PN} += "python3-pkgutil"
+RDEPENDS:${PN} += " \
+    python3-io \
+    python3-pkgutil \
+"
 
 # python3-pycairo is checked on configuration -> DEPENDS
 # we don't link against python3-pycairo -> RDEPENDS
-- 
2.39.2


