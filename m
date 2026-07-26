Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6121AC54F53
	for <webhook@archiver.kernel.org>; Sun, 26 Jul 2026 08:30:33 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7388.1785054622919882709
 for <openembedded-core@lists.openembedded.org>;
 Sun, 26 Jul 2026 01:30:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=TlYq+9qN;
 spf=pass (domain: smile.fr, ip: 209.85.128.52, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4957eefd361so13244615e9.1
        for <openembedded-core@lists.openembedded.org>; Sun, 26 Jul 2026 01:30:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1785054621; x=1785659421; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=erc4Bm/eLdzJZu0ess4tcs/Bi/hr+AUxAIfpQGZq7vc=;
        b=TlYq+9qNBmu3c++N9H94HA0/fM3YqVQhgAUH49qUWzvg4WIus98xxmNXuy4tkkrfLZ
         vZs3cDGiqh/ufzOZ3Hvh6/KKPg0pR2LiWLTmZRCm5WADS+rVDZxbvRlaclZLW1nKzfWr
         KfkoX8DydlKdkK1KDz1qFrz++lv1diRHekCgI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785054621; x=1785659421;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=erc4Bm/eLdzJZu0ess4tcs/Bi/hr+AUxAIfpQGZq7vc=;
        b=f16sghSUZjA4qxWb7OgAEnnVLiaIIpcPI86C51aBDc/OBtN1DWfKEXbHh+mZdGb6Rd
         4++I7g9AQfrTA/22IUaSXn3lwDR9R478twqXIPPyWOV8PZMaiuBByaQJd5ciKU8LGBAv
         zCKjU17fVQqCY94nbVoj+mvh3sNquoQSDYGxJClN36R3CIz+VIvYpumLo5SFk0KLGiJb
         j7d0XTeFxK0QPMH0FFgKrGnSnnaS6YrPaC03Mo0/6zaPsa3uZW2wwVSjG/Wum1OZZIn3
         Nv8Jzyt8Spg8n9qPKOan+xAuXTGocrpsuadsHCS5CtcVZVuda2NN2xY4TeFecITvhzXZ
         58rg==
X-Gm-Message-State: AOJu0YzZ2MFFg7ud2NcnDjGqIsKsmcZ5PMxpLFbItpM6JynFUb9LhWOU
	eXooHAA4LRQuQ4Qjg+07Hfbd5rpgMWrNXUMU+3roj7NrBloJ2IJgF12gf14D6RUOfGryd8g1+r6
	O1Xtpxz8=
X-Gm-Gg: AR+sD12CuD0q/zQm7VxuuLqy5VuFeuzsS5C3Pd8KyZ3mt68yjr38xUQWT8z87R8XktJ
	bVzaduiUKdA7XZQ2I9yWxAKhuccNQgUkF1GHxg+l9NIQVXyHXmDvbFWzdgQw2PoSAVJqOwNjGOr
	CCOgv9Hl8v73bQa5yhMdtd+vRzRnO9J40mjgAYwR1SVhPLCXvM6usFm+lkbuRRYPQr5RNXK5l2n
	/1VF6gfFB7pSrarSvDwCOjq9f0FpOGfUIbiBwyW7O3cxDif8ZXTfxKWbEiLOGm4JAvTfLAOKwOp
	wCpngPaUMgqnnLp2oL46O0+C20QitWyI62vj5UibhIGW7cE7dNjs1oy34eKNOwZUJz5/4VnSBAH
	btwFxmoIz9LTD1HUrX6VM59UrDNuBvQE4LNd+ilLeri45/mO8VX+cwlc8p1WTH0kDGKBpvt1tIl
	ORQwcQ3F677Cyl4yi0h3xfyWkeHPvAup8AKoi7O2S+62aHTqLywlsypq95y/DmZTkY9HVf8VVGe
	LTXZA==
X-Received: by 2002:a05:600c:630d:b0:495:3da3:beb with SMTP id 5b1f17b1804b1-496b56f9dddmr61177165e9.10.1785054621147;
        Sun, 26 Jul 2026 01:30:21 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-496b4f24a93sm142482505e9.11.2026.07.26.01.30.20
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jul 2026 01:30:20 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 19/31] cups: fix CVE-2026-39314
Date: Sun, 26 Jul 2026 10:29:43 +0200
Message-ID: <d3ab2665bb1b99ced4449e85f1a0e0124033b5d3.1785054430.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1785054429.git.yoann.congal@smile.fr>
References: <cover.1785054429.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 26 Jul 2026 08:30:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242001

From: Deepak Rathore <deeratho@cisco.com>

Pick the upstream patch [1] as mentioned in [2].

[1] https://github.com/OpenPrinting/cups/commit/928a86b1b794f738f0a3dc87561b2e054bff7ce4
[2] https://security-tracker.debian.org/tracker/CVE-2026-39314

Signed-off-by: Deepak Rathore <deeratho@cisco.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-extended/cups/cups.inc           |  1 +
 .../cups/cups/CVE-2026-39314.patch            | 45 +++++++++++++++++++
 2 files changed, 46 insertions(+)
 create mode 100644 meta/recipes-extended/cups/cups/CVE-2026-39314.patch

diff --git a/meta/recipes-extended/cups/cups.inc b/meta/recipes-extended/cups/cups.inc
index 1cef1e71fe4..575dbf9c577 100644
--- a/meta/recipes-extended/cups/cups.inc
+++ b/meta/recipes-extended/cups/cups.inc
@@ -30,6 +30,7 @@ SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/cups-${PV}-source.tar.gz \
            file://CVE-2026-34980-regression_p2.patch \
            file://CVE-2026-34979.patch \
            file://CVE-2026-34990.patch \
+           file://CVE-2026-39314.patch \
            "
 
 GITHUB_BASE_URI = "https://github.com/OpenPrinting/cups/releases"
diff --git a/meta/recipes-extended/cups/cups/CVE-2026-39314.patch b/meta/recipes-extended/cups/cups/CVE-2026-39314.patch
new file mode 100644
index 00000000000..f8d1a69f56e
--- /dev/null
+++ b/meta/recipes-extended/cups/cups/CVE-2026-39314.patch
@@ -0,0 +1,45 @@
+From 65c463ada188915d6700d92ce48a9a14949ca413 Mon Sep 17 00:00:00 2001
+From: Michael R Sweet <msweet@msweet.org>
+Date: Sun, 5 Apr 2026 10:45:25 -0400
+Subject: [PATCH] Range check job-password-supported.
+
+CVE: CVE-2026-39314
+Upstream-Status: Backport [https://github.com/OpenPrinting/cups/commit/928a86b1b794f738f0a3dc87561b2e054bff7ce4]
+
+Backport Changes:
+- Rebase cups/ppd-cache.c context to the CUPS 2.4.11 source carried by
+  this recipe.
+- Omit the upstream CHANGES.md release-note hunk because Yocto patch metadata
+  carries the CVE details and the target source release-note sections differ.
+
+(cherry picked from commit 928a86b1b794f738f0a3dc87561b2e054bff7ce4)
+Signed-off-by: Deepak Rathore <deeratho@cisco.com>
+---
+ cups/ppd-cache.c |    4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/cups/ppd-cache.c b/cups/ppd-cache.c
+index e750fcc..08e0db8 100644
+--- a/cups/ppd-cache.c
++++ b/cups/ppd-cache.c
+@@ -1,7 +1,7 @@
+ /*
+  * PPD cache implementation for CUPS.
+  *
+- * Copyright © 2022-2024 by OpenPrinting.
++ * Copyright © 2022-2026 by OpenPrinting.
+  * Copyright © 2010-2021 by Apple Inc.
+  *
+  * Licensed under Apache License v2.0.  See the file "LICENSE" for more
+@@ -3432,7 +3432,7 @@ _ppdCreateFromIPP2(
+   * Password/PIN printing...
+   */
+ 
+-  if ((attr = ippFindAttribute(supported, "job-password-supported", IPP_TAG_INTEGER)) != NULL)
++  if ((attr = ippFindAttribute(supported, "job-password-supported", IPP_TAG_INTEGER)) != NULL && ippGetInteger(attr, 0) > 0)
+   {
+     char	pattern[33];		/* Password pattern */
+     int		maxlen = ippGetInteger(attr, 0);
+-- 
+2.43.7
+

