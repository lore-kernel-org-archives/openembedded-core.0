Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30B6CCD6E43
	for <webhook@archiver.kernel.org>; Wed, 27 May 2026 17:36:00 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.26155.1779903356398854056
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 May 2026 10:35:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=XnFi5Eim;
 spf=pass (domain: gmail.com, ip: 209.85.128.41, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-48984d29fe3so126058115e9.0
        for <openembedded-core@lists.openembedded.org>; Wed, 27 May 2026 10:35:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779903355; x=1780508155; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9N5DlhHJVEpMUVJkspcdPoccZSH73PfWbQ53uuHuL9o=;
        b=XnFi5EimMR/kqTHSg+gFXOAhD45WSCXLueg0DVOOVkmsHk/kp2PLXR0XHbQkLuGkYP
         dYvrkKeck3Iawjv4x1sbYG2ehY6XUMYbacajStRMCm7vfFhKjA3JFoNaWN41TOy0Qe9e
         lxKcJ6yrO7dP1UflUTigfpwbsYL3n3bnIFz8rIWq2tzl58rERd6rst/hYEw7fxS/dQBG
         p7+SHj1KZR7PVnfCZ0mR1JMX4GY8MfYG6BYPH2nKPKLMEaZxkmvn0UaMumRQJU36g1Ph
         ClPSOHQtlriAd9s/jO8dwQRQrInwViMRon2YN3/qSv9MdgM6tRC8C73CNSbYSlPaN/H8
         wQmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779903355; x=1780508155;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9N5DlhHJVEpMUVJkspcdPoccZSH73PfWbQ53uuHuL9o=;
        b=pJQUAw2gk77jk7NYAY+3etPRJgGcit1oHWAKAISBzzTA1iuXmbr3B0n0GdEG8++3R9
         aI1z94E6O6PkymjrCwY57CiG2sCuWq0lB8Pa4yW31BkdnX0RIh2M/jcP+zkFvvvPImDb
         0q/OyzuVY6xUYElyVr7wCPrk6r13zjbRPxm5yvr7li3NuoHHqGO8GRpopU02Hsfuw3LI
         3icierYcAkgqTeuuUED96LgpCOtfu+HwsyDVUYJ+jtfpElC2qZxPAnzsvImI6IK5sDhC
         78cHzKnE1nngFwQb/0F//0Qfv0020Bf54MhjC3zUldWOkIdsn8m7R5xzdQ54w34VnH6/
         rcMw==
X-Gm-Message-State: AOJu0Yx0ESiuh+lO2HFjHw4saQBiHnHxN9Y7tYYFcNbWnzPPOQhQfWzm
	7KWweITPiRMQ7lu1AQMaTNn04QhC3Y0+Vf5T3Dlr0NaXJSq4pvQu2MNcc7Heww==
X-Gm-Gg: Acq92OHOcrsAwFWYfQUV//LejNjk1vFqM2bt9hmjoFTLKbH4nxyVZ9dXIZoWn1jJw/2
	RwHrJpdpAQjPiJAa7sLcv6LGXBcVBM45MrYceg7N6N7ALclfhKt8B3E9YqXZc6y4x77gw+ERFfw
	DqU/awrW/9f/vShJE5GLCA2rlXqTGvvcAB97wUqPUDbrbhM/qwTVh6I4nU4aLIOCmCxtV6T/ix0
	9aCJeF9JlD/Z7EL6zdynY3BzL2uuFgMlVFGTZRhyMibFAs7u0jU/GjeZNS2YIp4G/idXXuVaYGk
	weo+0Mx05HXlaDF6BV9eE46S++Z9YttcRtmHi/yqP9ARDj9/rK+DsRmqAo0o8YH9vOfMdK1aL+s
	EMkFBxxtDthDiOX/nf4+HGaWj5HHqPcpJXd82EP0nYoK1JBU+YY2AIFG79IVdcxr9di3ZJgVwsc
	Kwgv8yr+8CuBcWGuoqD+y6+E5DG1k69Vadc9/mc4kKeyXqqcX62G2vBj4BBFwQkttDRNFazg==
X-Received: by 2002:a05:600c:a402:b0:488:9bf8:7f17 with SMTP id 5b1f17b1804b1-490425ad10cmr328164985e9.14.1779903354517;
        Wed, 27 May 2026 10:35:54 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4907eacb47asm30816845e9.3.2026.05.27.10.35.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 May 2026 10:35:53 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 1/2] libslirp: fix upstream version check
Date: Wed, 27 May 2026 19:35:46 +0200
Message-ID: <20260527173547.188244-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 May 2026 17:36:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237672

From: Alexander Kanavin <alex@linutronix.de>

The regex excludes bogus old yyyymmdd tags which sort higher than real versions.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-connectivity/slirp/libslirp_4.9.1.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-connectivity/slirp/libslirp_4.9.1.bb b/meta/recipes-connectivity/slirp/libslirp_4.9.1.bb
index 9f7005d709..50577fd4ae 100644
--- a/meta/recipes-connectivity/slirp/libslirp_4.9.1.bb
+++ b/meta/recipes-connectivity/slirp/libslirp_4.9.1.bb
@@ -6,6 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=bca0186b14e6b05e338e729f106db727"
 
 SRC_URI = "git://gitlab.freedesktop.org/slirp/libslirp.git;protocol=https;branch=master"
 SRCREV = "9c744e1e52aa0d9646ed91d789d588696292c21e"
+UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+(\.\d+)+)"
 
 DEPENDS = "glib-2.0"
 
-- 
2.47.3


