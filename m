Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A31F5CD4F43
	for <webhook@archiver.kernel.org>; Fri, 22 Sep 2023 07:25:02 +0000 (UTC)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
 by mx.groups.io with SMTP id smtpd.web10.16022.1695367500338114558
 for <openembedded-core@lists.openembedded.org>;
 Fri, 22 Sep 2023 00:25:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=lhAMfp3C;
 spf=pass (domain: gmail.com, ip: 209.85.218.46, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-9a648f9d8e3so235412766b.1
        for <openembedded-core@lists.openembedded.org>; Fri, 22 Sep 2023 00:25:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695367499; x=1695972299; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oWUVbwm7LoARpYqRTVEnL6rG93Pm3UqDA0z5lekoRWw=;
        b=lhAMfp3CS2Ltsxmw7tAcmktQo+v/XfF42Yu40+MqrenkwST7CzL1DtptJGq0ePqijQ
         84b79cHYdnC0y1w/Zs2FNg9OVI6tdSqCNavHAI2RgDJgCtNHVyXvoj2ymEX0DQrB7wcs
         cbfKRShcEifZ6H/U/TUEcNrLqh/J7nOA1MixPA18ERfsvtstBm7j4WssYv0+Pu+5N1ky
         1BXZCe4gy37E04mJLshRP93nFHC1S5NPFvLXVjv3H3oc6Wd/12rMoAWNmCrkQLRP81nD
         2qnx2H3jrycR3OAHgGk0fm5z8tyKzqPD3K07Mu2x+nMZhoVVmZFbM8W4ZtsFBLWNvOjj
         CGrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695367499; x=1695972299;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oWUVbwm7LoARpYqRTVEnL6rG93Pm3UqDA0z5lekoRWw=;
        b=r/36k4ua4z7x0uXj5HEXxwQR6tEWjGrwwDImtOldFuJWysblJtAPaZ1tDWGsYyA765
         cDK1S29TQkmhrqNvnmCsYh/Melu4Gj9hx98nTWqax5dF20yCVdONbEFFkaPCHbch9I4j
         7drn167OOmgQE698tx/1YpIKaLA3FXEg+x6O0SHW6VtAQAXpkS1TOZ3QNw9TuqUGxSOt
         n5h7MiNTwQ5/IxrYH9wrA46RWWb6RUek+eKrHP7mzVnbyXO0yYSdKHWd9LPnmdnt4ice
         TasHyO9ZD0q+jVrrM6n26p1vfBjGnxrf7YYWG0ipNXbm2ePOu432PcIARgaUaacz9FLx
         Fj9Q==
X-Gm-Message-State: AOJu0Ywm+Th6cYlqicULNxZNKrd2EH1DCN4rObY7Bh8eWpaDGxnZe7yL
	IJ7aaHZQv0t8whYrWUWZfogjHQICWew=
X-Google-Smtp-Source: AGHT+IF4kH4S1n4r8cjxCji81Tf409Jb/brL0gzq89MjzQtpUGnPlfmjG3+3K3Ka1Vw/QRMrOTFIfg==
X-Received: by 2002:a17:906:2d4:b0:99d:ed5e:cc79 with SMTP id 20-20020a17090602d400b0099ded5ecc79mr7012844ejk.31.1695367498794;
        Fri, 22 Sep 2023 00:24:58 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id z23-20020a170906435700b00992f309cfe8sm2311330ejm.178.2023.09.22.00.24.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Sep 2023 00:24:58 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 39/40] xwayland: upgrade 23.1.2 -> 23.2.1
Date: Fri, 22 Sep 2023 09:24:30 +0200
Message-Id: <20230922072431.1481743-39-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230922072431.1481743-1-alex@linutronix.de>
References: <20230922072431.1481743-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 22 Sep 2023 07:25:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188081

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../xwayland/{xwayland_23.1.2.bb => xwayland_23.2.1.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/xwayland/{xwayland_23.1.2.bb => xwayland_23.2.1.bb} (95%)

diff --git a/meta/recipes-graphics/xwayland/xwayland_23.1.2.bb b/meta/recipes-graphics/xwayland/xwayland_23.2.1.bb
similarity index 95%
rename from meta/recipes-graphics/xwayland/xwayland_23.1.2.bb
rename to meta/recipes-graphics/xwayland/xwayland_23.2.1.bb
index de516536d1d..e97a921a961 100644
--- a/meta/recipes-graphics/xwayland/xwayland_23.1.2.bb
+++ b/meta/recipes-graphics/xwayland/xwayland_23.2.1.bb
@@ -10,7 +10,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=5df87950af51ac2c5822094553ea1880"
 
 SRC_URI = "https://www.x.org/archive/individual/xserver/xwayland-${PV}.tar.xz"
-SRC_URI[sha256sum] = "bd25d8498ee4d77874fda125127e2db37fc332531febc966231ea06fae8cf77f"
+SRC_URI[sha256sum] = "eebc2692c3aa80617d78428bc6ec7b91b254a98214d2a70e997098503cd6ef90"
 
 UPSTREAM_CHECK_REGEX = "xwayland-(?P<pver>\d+(\.(?!90\d)\d+)+)\.tar"
 
-- 
2.30.2


