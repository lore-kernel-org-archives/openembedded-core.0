Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6DDBCD98D5
	for <webhook@archiver.kernel.org>; Wed, 10 Jun 2026 22:55:30 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.33477.1781132123151233452
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Jun 2026 15:55:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=f+eW+d1u;
 spf=pass (domain: smile.fr, ip: 209.85.128.50, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-490b211ee6aso56874855e9.3
        for <openembedded-core@lists.openembedded.org>; Wed, 10 Jun 2026 15:55:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1781132121; x=1781736921; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ritVWg4TASIj+Gn8+h0ZRG4l2K4C05t6f5xlT8xBY3M=;
        b=f+eW+d1u2Lfycyb8LE6dXqXgPDjchDy9WKQlmrD2AoW/ZVDSlu/SPjmFbcMIPuGIDC
         pSPgpCcf87RH4rWTfgmfs06qHWoYw0yjjtuDSMnBKe1TYD4IwiDZf/3RoeRWA5pzsR9g
         WEhDEJIeNkPv9GJD2xV9KsTZPnSchrJvpuo2s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781132121; x=1781736921;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ritVWg4TASIj+Gn8+h0ZRG4l2K4C05t6f5xlT8xBY3M=;
        b=LFze2DtfxLUQW1ORu+DAWCN0urj8fRa0FlEULY6dIaLqF0nyda/JLSuF7uiZhFYv+p
         5qv+pjLTXTSRcwnwQkkQuCz1kwsB4gkMe8luDFlz5ZsQCNqjqR5Co4iIttsqFFhtq26Q
         XkUJNHEylkCSKK708PYNw0ZLdxUzZNbIeSbW+PGqLMcKjx4NGwSFgAWodeUcPvdwEz9/
         P9vvEtNGtJ3y4Xm59Zp1jN5PmG70bl0rWTa3JhnpR6JJxt4yYONNlfW3HFDNir/5S1vB
         voWOgFN/74sWzQE5SLx3dW3V9P++Es5gIFkQ6KEJHk7Az1mD9pMBFVfKJQjDcVEESQFq
         fSLw==
X-Gm-Message-State: AOJu0YxKuUVFDAlTZg7OQLssnYxQR65ZGgslkg6G4OCb/a9vOx0MYatt
	We4gMztoLLpdY0QPQgKTlZFEZWXfnqGcugWsw7O/OFnyuvv7TbP0RP5FyLn2ayyK45iTAhk1jPj
	DfmTm
X-Gm-Gg: Acq92OF3erDi+oZyUxKGkOjTLsdS0PJDznHWvEhCP+Po7amFO9ebZVtBeAHyeKsZ/0M
	XZB57YmtGxriKDq/lju9i7zZ9h5+ZqHdv5FeThYKwO8DhU+BRfEdsj7acfr3KfyVncIjGh5VUhG
	rShOEbTJ6cQXzZXR2J9V10rdETjPdMNV8stqu7RZ0ZqPRPfQlI+Llr7RjYA2MSpPyaPcLvoHRNu
	RpvTCg2y1t/mPfe9HHLoPIbdT5H2Pan7Tw65q2em0V7j8e25FH1Xclf2WYlosWFrzZcPO7AsWus
	V/XTMSGmoXKJQIBvAPX+j5kur6kgj2s7JNytxTxQl5oNtWTqkBT/ufYvN+aE28OaGjMJJbqMqGQ
	vDTEXD3ENBPyPq0hPedLCkSfv+rVaY3AK4p7nX6CeQ5qiLvFdkN4MI7/EIJEyunWT6+4ZYQpouV
	Lknta/Yb2T0ScDoXEWHmcZ7XoZYDDKPjsZ9sCWNTLCA+JMVusKGE60quGK2iwf0v4Qt1C6Rsj2N
	s7u+unAa0c44/Ha4OdOCHWcNPoQpGZ/x4O3bxU=
X-Received: by 2002:a05:600c:620c:b0:490:b28d:a6f9 with SMTP id 5b1f17b1804b1-490c256f1f1mr432850155e9.8.1781132121561;
        Wed, 10 Jun 2026 15:55:21 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00bb749f54eeb85d7b.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:bb74:9f54:eeb8:5d7b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f344148sm71599304f8f.19.2026.06.10.15.55.21
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 15:55:21 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 10/21] xserver-xorg: upgrade 21.1.21 -> 21.1.22
Date: Thu, 11 Jun 2026 00:55:01 +0200
Message-ID: <136aec02307bab80252ae0d0dc172120ee1243f5.1781132051.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1781132051.git.yoann.congal@smile.fr>
References: <cover.1781132051.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Jun 2026 22:55:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238406

From: Wang Mingyu <wangmy@fujitsu.com>

License-Update:
 add author to HPND-sell-MIT-disclaimer-xserver
 add missing paragraph to SGI-B-2.0

Release Notes: https://lists.x.org/archives/xorg-announce/2026-April/003678.html

Includes fixes for CVE-2026-33999 CVE-2026-34000 CVE-2026-34001
CVE-2026-34002 and CVE-2026-34003

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
(cherry picked from commit d4452b34849b4f06c979c394dc0c824958243861)
Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-graphics/xorg-xserver/xserver-xorg.inc             | 2 +-
 .../{xserver-xorg_21.1.21.bb => xserver-xorg_21.1.22.bb}        | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/xorg-xserver/{xserver-xorg_21.1.21.bb => xserver-xorg_21.1.22.bb} (92%)

diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc b/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
index 59c373280e9..0d8d7827124 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
@@ -2,7 +2,7 @@ SUMMARY = "The X.Org X server"
 HOMEPAGE = "http://www.x.org"
 SECTION = "x11/base"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://COPYING;md5=21e33dcccf2d5034f798a8ea62622939"
+LIC_FILES_CHKSUM = "file://COPYING;md5=f8778cfcd90ece0e4b225f30182227ca"
 
 # xf86-*-* packages depend on an X server built with the xfree86 DDX
 # so we have a virtual to represent that:
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.21.bb b/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.22.bb
similarity index 92%
rename from meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.21.bb
rename to meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.22.bb
index 3781234c84b..6a9826d959a 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.21.bb
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.22.bb
@@ -1,7 +1,7 @@
 require xserver-xorg.inc
 
 SRC_URI += " file://0001-xf86pciBus.c-use-Intel-ddx-only-for-pre-gen4-hardwar.patch"
-SRC_URI[sha256sum] = "c0cbe5545b3f645bae6024b830d1d1154a956350683a4e52b2fff5b0fa1ab519"
+SRC_URI[sha256sum] = "1a242c8917c49ba29ccc1f6021613d8a2b9805dd0d271a66ae9d09f4b0bb06b3"
 
 # These extensions are now integrated into the server, so declare the migration
 # path for in-place upgrades.

