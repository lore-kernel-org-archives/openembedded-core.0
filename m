Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26AF7C49EA1
	for <webhook@archiver.kernel.org>; Tue,  6 Aug 2024 15:01:31 +0000 (UTC)
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
 by mx.groups.io with SMTP id smtpd.web11.9573.1722956490205006879
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 Aug 2024 08:01:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=H1UMEuOf;
 spf=pass (domain: gmail.com, ip: 209.85.218.41, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-a7abe5aa9d5so90005466b.1
        for <openembedded-core@lists.openembedded.org>; Tue, 06 Aug 2024 08:01:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722956488; x=1723561288; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kzDraF5QwKurzGxUFmHtKyfR0B/EXoSubgVeJvlkn1g=;
        b=H1UMEuOfpPLR7mOVduoCblRGk1yC1WWhNZuUIX3rMQwyUgY5V/LDojI+PWLGsKuQJH
         IdAtdJT8bfHdpWHDmHVWdIL5142I3z13ZmcgTOOM3OfiwRL/mnSKoKIDJjUagj66rZEu
         xoGvbWSeVoyEn/yXetAmetO4Wwfz1flSMLkmyhA2v46xkL3ukK4ugWZdehwzxw2qIVtF
         +JSY4awjstFTveQm3wOseSSuWDMiU0EW8hZs/ZrP7PEOxFbbbVHMtbwUWbDjB5ar8MP9
         af5+pL68BnY2SCO84R4B/ykGFQ+rzZywqXwRRfhbU+ek0CyDgwEJY9yRVUCTvC9kyTyj
         yh3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722956488; x=1723561288;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kzDraF5QwKurzGxUFmHtKyfR0B/EXoSubgVeJvlkn1g=;
        b=w1VBPW2ZwGSX5tprqP96xp0qPSBZmVOVHuXRTlfOIWsBaxkGqjCcgohjEA389ZLqBr
         hSk3aXitWq0hy4ABLRj5OrhzFGvFh+vUxtZFApKNu9DGou2esuQFJNWy6nvD7+4sZjfo
         miKhnMJcOH9lX2FPoWk3183U+zZ4L4+8NaEJkwEvyVbDJZSFnBvwaYw0rB0UVmqV2jvZ
         +qwkgnlFHnMK7rT9P0N1Az7rVn1lhMOPMV9bRtx/kAPlBtHh92hbKqfFeI0VBI2xvk4p
         Z3kGjj8BkjMlYxcEJ1pKKKOZl3dQom1yLJs4VVVYFbMCftCyhkwbYKYqBT2hK5t8Fn7K
         gMpA==
X-Gm-Message-State: AOJu0Yx4Ti04tCHr+FMt+VIDRIJE9mGRaJkQi+zZgSqd6r3XmB+PB7hi
	Tq1p27HUXI3tW5AhJ/gNw0YKW6fUwDaSKfM3SICIGctNjXz6me2How/3WvEq
X-Google-Smtp-Source: AGHT+IGEvte7UMuSb/q44sJfYMRHiE3rAV2NZbIXoo2a87IK//7+pM/lEoAMDpnZ0KEGZ++axKFr+g==
X-Received: by 2002:a17:907:96a2:b0:a6f:593f:d336 with SMTP id a640c23a62f3a-a7dc4dc1875mr805856866b.11.1722956487640;
        Tue, 06 Aug 2024 08:01:27 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a7dc9bc3cf3sm566141566b.13.2024.08.06.08.01.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Aug 2024 08:01:27 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 1/2] xf86-video-intel: correct SRC_URI as freedesktop anongit is down
Date: Tue,  6 Aug 2024 17:01:21 +0200
Message-Id: <20240806150122.2356176-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 06 Aug 2024 15:01:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203028

From: Alexander Kanavin <alex@linutronix.de>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-graphics/xorg-driver/xf86-video-intel_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/xorg-driver/xf86-video-intel_git.bb b/meta/recipes-graphics/xorg-driver/xf86-video-intel_git.bb
index 2e526bd7999..0a42bd99755 100644
--- a/meta/recipes-graphics/xorg-driver/xf86-video-intel_git.bb
+++ b/meta/recipes-graphics/xorg-driver/xf86-video-intel_git.bb
@@ -13,7 +13,7 @@ SRCREV = "31486f40f8e8f8923ca0799aea84b58799754564"
 PV = "2.99.917+git"
 S = "${WORKDIR}/git"
 
-SRC_URI = "git://anongit.freedesktop.org/git/xorg/driver/xf86-video-intel;protocol=https;branch=master"
+SRC_URI = "git://gitlab.freedesktop.org/xorg/driver/xf86-video-intel.git;protocol=https;branch=master"
 
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+(\.\d+)+)"
 
-- 
2.39.2


