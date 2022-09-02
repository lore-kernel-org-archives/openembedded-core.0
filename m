Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BAF11C6FA85
	for <webhook@archiver.kernel.org>; Fri,  2 Sep 2022 12:02:19 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
 [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web12.5629.1662120133383516105
 for <openembedded-core@lists.openembedded.org>;
 Fri, 02 Sep 2022 05:02:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=cD/SOncw;
 spf=pass (domain: gmail.com, ip: 209.85.221.48,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f48.google.com with SMTP id u17so2040469wrp.3
        for <openembedded-core@lists.openembedded.org>;
 Fri, 02 Sep 2022 05:02:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=9pnajyWXj3te3uYGomh8dRnnJuf0ygHjtbOcbygdbQQ=;
        b=cD/SOncw/49SxCByp3ueymWGYE3c6x4/mz65uo6fJ1hv6E/6EbHH7VgWdUvfUac4Q7
         8RAVRB8ufOK/LnrHUB2/PQq2Dg0RB8LJz3aT7aad6fXJEzWt/kzqd5jKyPh+nlUqdE3q
         H/my+xGkdURm6VYTWlR3lpfzrWmMLzYI781+Q1PpdGIrW+E3VUp4mCtzGwzQr6PFxHAL
         feKsSuNzHU4a9kuVL21WX4/tNqdS6dRlg9XwigQyj2OHBTWIt5iERGAU704sfL8R1KVM
         /xgJEpLX31hrI9Q0F7D1WiRgUWr0WHLZVzMdMAQ7oJD4lP91Vrq6c8pXQBGz93dD++/e
         XN/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=9pnajyWXj3te3uYGomh8dRnnJuf0ygHjtbOcbygdbQQ=;
        b=SFYXM7Br6HYDhdg/tuUYRf0vAAe+uXx8GzuDgM1S0sxAuWIiIA4G0nwrVz468jklhu
         ClAQ0dvpcOIzGjniFaAXzC05htOpL9+rOgerosEWUS0VphQasZkcyLsagW1nQ67iScya
         0RCJz1mAC+siewWbdqTCmkD/CPUIxaB4ypvxCD3Fo9jOov+nd2LhgVUARKrtIbgnmFU9
         JfXp6zXWLg0E6yowNjgaGp2+Ynl2QFSjmZ9oy10o4QT/S8mOZ9ePePwtlixeEBozWNrW
         /3slz5/+aNxgYYmwj742rC4l4nrch0tJ5eLkxMKTE2I9iorz/0DmQOWIO28DdbP4+bzZ
         ynNg==
X-Gm-Message-State: ACgBeo1q3TC4w4s0S+jLH9zpv1jXuDTmY/IZAmT846sKBMgf4efVDPQD
	nIyXdmi+j4c97APjzAd59AknbII0MlM=
X-Google-Smtp-Source: 
 AA6agR4RBvPG8TEVyXyJ8mg2ipzQtBxXfev+bqeC6JDZ9YiANznGkhyeCrXH8pHmCgMhhvGXrVY3VA==
X-Received: by 2002:a5d:6d50:0:b0:225:89b2:a03a with SMTP id
 k16-20020a5d6d50000000b0022589b2a03amr18219673wri.51.1662120131748;
        Fri, 02 Sep 2022 05:02:11 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de.
 [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id
 t12-20020a05600c198c00b003a2e92edeccsm8802489wmq.46.2022.09.02.05.02.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Sep 2022 05:02:10 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 2/2] scripts/oe-setup-builddir: write to conf/templateconf.cfg
 after the build is set up
Date: Fri,  2 Sep 2022 14:02:02 +0200
Message-Id: <20220902120202.487119-2-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220902120202.487119-1-alex@linutronix.de>
References: <20220902120202.487119-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 02 Sep 2022 12:02:19 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170245

This was done before any of the sanity checks or actual setup, which
resulted in templateconf.cfg always getting written out, whether it
would be valid or not, and the user becoming stuck with it.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 scripts/oe-setup-builddir | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/scripts/oe-setup-builddir b/scripts/oe-setup-builddir
index 8e95f0d94e..d3c7f943e7 100755
--- a/scripts/oe-setup-builddir
+++ b/scripts/oe-setup-builddir
@@ -50,10 +50,6 @@ fi
 
 . "$OEROOT"/.templateconf
 
-if [ ! -f "$BUILDDIR/conf/templateconf.cfg" ]; then
-    echo "$TEMPLATECONF" >"$BUILDDIR/conf/templateconf.cfg"
-fi
-
 # 
 # $TEMPLATECONF can point to a directory for the template local.conf & bblayers.conf
 #
@@ -140,3 +136,7 @@ if [ -z "$OECORENOTESCONF" ]; then
 fi
 [ ! -r "$OECORENOTESCONF" ] || cat "$OECORENOTESCONF"
 unset OECORENOTESCONF
+
+if [ ! -f "$BUILDDIR/conf/templateconf.cfg" ]; then
+    echo "$TEMPLATECONF" >"$BUILDDIR/conf/templateconf.cfg"
+fi
-- 
2.30.2


