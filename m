Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F2FEC64ED9
	for <webhook@archiver.kernel.org>; Sun, 19 Feb 2023 19:31:10 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web10.3837.1676835066214117063
 for <openembedded-core@lists.openembedded.org>;
 Sun, 19 Feb 2023 11:31:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=g+YOJp09;
 spf=pass (domain: gmail.com, ip: 209.85.221.42, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f42.google.com with SMTP id t6so1030461wrz.7
        for <openembedded-core@lists.openembedded.org>; Sun, 19 Feb 2023 11:31:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uIfPqilan01T9hdpHp1z1itet3FNew4cj5ftUZaLZgE=;
        b=g+YOJp09NPbRGPMBA3S5Oz7FssxyR88PpMBXRyisYBW/gIWLt7DOH9cZHDJo38ZUMj
         8wWvKAQHCijPKX+lKjlnYiPkkd31mGfGKJH8Y4OhNDDm22EzR9jM04R0FJhH/Lzvq4j9
         GoN7UpBk/TBYY9qK2K9aFajI+/awfSmKnxxUJx2eUGQ5YkZHW+t+Ck53BLPVA4ikWG4k
         7Y/Cfi7vXn+xVBq25hjGcEGfLN6GGSQMNLmvhYWfNjQidAvBATaHQ5U0YNSOuEJNIJZP
         5njN2VK7T0nE/gHcLdJjYhM7WAMm+8kmZbNAnLLJJG6ZHp92B+GDt6Op7tH1LSB78Xzq
         EPfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uIfPqilan01T9hdpHp1z1itet3FNew4cj5ftUZaLZgE=;
        b=hI77LJi95ct031VJvo0uVrFvd0uHQDOxT3MsQhR2nEzFwACzhZVQ7UPJokD/Sn7Fg4
         udqHJWG3RhMEi7/xVTpC+ZCPRQC51/9huFavVGeTBc8KIRJeRn5GdKTbMU6Z4lSM2jeb
         Vtblj4Janyh7Masphn2GPGooKvqf0Qj+S5zY0AVtY/3ZP+J0nXYSoNjw9q+nGfZ1Yedh
         K56qCbz9IuF8lZV3+o2T7/0DIXug+nLzjff2B7nXCGFFbbMeWJ4aKSplJZZjeeOp5Gdf
         FVIXK8i76LHKJkmh9IltHMBm+KYomTdmEzRPwuD+DPV0alpkMipdeaB4eM4+qQpiFJjE
         krSQ==
X-Gm-Message-State: AO0yUKXg/iHQReRH8662KzI4XbRZqN/TQkvI4L2pLfW7cxrWSXl/f+rR
	6iuzBW/he1cplWHMiWE1c//59qKmWPI=
X-Google-Smtp-Source: AK7set9vkHHMUXscTNX4ZKtnB0rmLFui7sqAxTb02sUJFERmf526sLZ8FeHLWUOrlCVAIEHwiWgPcA==
X-Received: by 2002:a05:6000:1b09:b0:2c5:5d17:3377 with SMTP id f9-20020a0560001b0900b002c55d173377mr1839880wrz.15.1676835066674;
        Sun, 19 Feb 2023 11:31:06 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id d10-20020adffbca000000b002c54c8e70b1sm3347478wrs.9.2023.02.19.11.31.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Feb 2023 11:31:06 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 04/39] gstreamer1.0-python: do not require introspection during builds
Date: Sun, 19 Feb 2023 20:30:26 +0100
Message-Id: <20230219193101.338397-4-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230219193101.338397-1-alex@linutronix.de>
References: <20230219193101.338397-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 19 Feb 2023 19:31:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177346

Somewhere along the way this ceased to be a build requirement;
I have verified that the recipe installs the same set
of identical files with and without introspection enabled and
present in sysroot.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../gstreamer/gstreamer1.0-python_1.22.0.bb                 | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.22.0.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.22.0.bb
index b6782a842d..6df84a6251 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.22.0.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.22.0.bb
@@ -23,8 +23,4 @@ EXTRA_OEMESON += "\
     -Dlibpython-dir=${libdir} \
 "
 
-# gobject-introspection is mandatory and cannot be configured
-REQUIRED_DISTRO_FEATURES = "gobject-introspection-data"
-GIR_MESON_OPTION = ""
-
-inherit meson pkgconfig setuptools3-base upstream-version-is-even gobject-introspection features_check
+inherit meson pkgconfig setuptools3-base upstream-version-is-even
-- 
2.30.2


