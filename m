Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 224D0EF06E3
	for <webhook@archiver.kernel.org>; Sun,  8 Feb 2026 19:12:41 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.26760.1770562697665289328
 for <openembedded-core@lists.openembedded.org>;
 Sun, 08 Feb 2026 06:58:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=TA3zDz2p;
 spf=pass (domain: gmail.com, ip: 209.85.128.47, mailfrom: logan.gallois@gmail.com)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-47ee3a63300so40100215e9.2
        for <openembedded-core@lists.openembedded.org>; Sun, 08 Feb 2026 06:58:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770562696; x=1771167496; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=O38CQV6Rqd17a+yTuum9KwCqXqqTlP3CWYNRQWJOIds=;
        b=TA3zDz2pzutAmdDyJMxI06IhHwleR/Y9IT3+YPIlGgOo81Gx1n8uvs2RH5GdkZt+U6
         WLt6s3G1UPlUNRHlNIN5m2hPeHgNFnYMP8KzPgutKsnpKx/ZuA/Q2aZ1nw2Bhe1tUh4s
         TEmrbPmwxDRxWiHsA03FhS9Dx8L/kmfDaI625qvFvppTf6iy4tvOurdAG0WY2va59g4u
         vmgYIeLLV9nePUzFbGaqe2Z2vnorAJG2TLabxykhBX7NSAKXzlSKRzO4Vq9uZWSNvZGk
         myzX+w2bpY3EXyZFaR9dJYjGd+122VX+IgRATNWDzoKmuzF34evnlQh81u9scYGZkX6I
         /KOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770562696; x=1771167496;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=O38CQV6Rqd17a+yTuum9KwCqXqqTlP3CWYNRQWJOIds=;
        b=bBAvXn0fKfyV1rH3m6OES43UrwiR4r/V1vkAlGhts5sfVt3gwFQHkx6ZrLvlCC64CY
         5KXdjY+1k+UhHcVaxUGkmkM/x9lahMz2mnXQrMTfWY3AzXjRJth82HXuuLN2aLAUN0lF
         3ACmAfsRTK2Uf7zMq7aXLj/d9z6P24KC1zKpdTV9Km4MSa5W5mFMoOueYeO8GySWriEd
         trfWx3Nog4YaPRN2oA42DnKOmGBmcgBgHl/7OZe5KFXw+01IFOHVC3X39DX502fzbZQi
         FpGQxlpyd3Vs7J4ThVijd5VdX9y8PiqSm3l2Yt/p6XDkXMHUx4O8Eiuyl+P9fujqlsdr
         3JWw==
X-Gm-Message-State: AOJu0Yw7wWkwyU6BMA/Rz02nh3GGeMbNutDInoky1oGJfzyRTjKvlI0/
	rh/OwY2RFHZ1OhXYU0quNmKAXryEpkr2O24zQP3xEPZqmLGNcNLyFT3JtXAPSg==
X-Gm-Gg: AZuq6aJJVTTyNXTXSOnYZj6juMHjtourPcPQkaqheB+2IvyY4GKcj1DtZ0Vb5gdlg02
	xD/UFYzWvC2n/vFR7IrsKmGG1sUchXVbvSK890x9iwBa0EKPBBH5x3VEA4zoxF7bPLc5CFiZ3Pm
	cHqZMJ4BO1SkDZyZKvjJkYuPkifWDkdcm/gM9lK/au0FCNgpZ/9O4AzdYoh//C8fW5OVy82lbTM
	HP6xVZywqsimq0SShP1EvgR7atISs3G1LZTRUyCan9KnJf+esGsCsfVBFhz6SAo8LU8vaKqWj2x
	+QXL6csyEzNjsvVQuKHv0kni/0mA0ekrUNxE4P3mMgpiNxYVhqYWssRPNjLVjEctP7wOW2oZZAt
	zF0QxGOSBEuIxizm3p+EN5hrx9Lnz2YqrViF6L5vwQ57OHjGqXOaNITAzlLlWiGkBNShptie859
	KI+MPkN9miyKZkpmZMIBtWsnndTY/lRYT6/Kw+qpMuQ91Goe/6GAkCIUMszz8V4k4REA==
X-Received: by 2002:a05:600c:19c7:b0:480:6b76:dfb4 with SMTP id 5b1f17b1804b1-483201ffed3mr127603075e9.8.1770562695144;
        Sun, 08 Feb 2026 06:58:15 -0800 (PST)
Received: from Minicarpet.home (lfbn-orl-1-620-177.w86-196.abo.wanadoo.fr. [86.196.80.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483206b8ebbsm272475085e9.1.2026.02.08.06.58.14
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Feb 2026 06:58:14 -0800 (PST)
From: Logan Gallois <logan.gallois@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2] oe-setup-build: fix TEMPLATECONF not being applied
Date: Sun,  8 Feb 2026 15:58:13 +0100
Message-ID: <20260208145813.7400-1-logan.gallois@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 08 Feb 2026 19:12:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230683

From: Logan Gallois <logan.gallois@hexagon.com>

When using the new bitbake-setup tool, an oe-template created in a
custom layer was ignored because the TEMPLATECONF variable was not
exported to the environment.

Export TEMPLATECONF so that bitbake-setup correctly picks up templates
provided by external layers.

Signed-off-by: Logan Gallois <logan.gallois@hexagon.com>
---
 scripts/oe-setup-build | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/oe-setup-build b/scripts/oe-setup-build
index b391f3b9254..0a3146fd503 100755
--- a/scripts/oe-setup-build
+++ b/scripts/oe-setup-build
@@ -101,7 +101,7 @@ def setup_build_env(args):
             f.write(cmd_base)
     print("\nRun '. {}' to initialize the build in a current shell session.\n".format(initbuild))
 
-    cmd = "TEMPLATECONF={} {}".format(template["templatepath"], cmd_base)
+    cmd = "export TEMPLATECONF={}\n{}".format(template["templatepath"], cmd_base)
     if not no_shell:
         cmd = cmd + " && {}".format(os.environ.get('SHELL','bash'))
     print("Running:", cmd)
-- 
2.43.0


