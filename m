Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96403F44850
	for <webhook@archiver.kernel.org>; Fri, 10 Apr 2026 12:27:22 +0000 (UTC)
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com [209.85.128.68])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.155263.1775824033554560837
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Apr 2026 05:27:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=AICOQV37;
 spf=pass (domain: smile.fr, ip: 209.85.128.68, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f68.google.com with SMTP id 5b1f17b1804b1-483487335c2so21762405e9.2
        for <openembedded-core@lists.openembedded.org>; Fri, 10 Apr 2026 05:27:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1775824032; x=1776428832; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WnQifQV7gsrOfjKMl8tp4ygDrv1PPsdOr7pRAbkb3VI=;
        b=AICOQV37mXUxL1RkTstE8nEoYDdafC+5mCJRQtp9eFFGNMBfkgbTmnlOTYYz1I6wdr
         RCUMqlswhNNIWtHsGwQJqzxDH/5gnAvJuHgkexBe83MUAqnVamoRhYvxD8pR0SYhYYio
         eO+kz0E1znuNY0Km9wMWGgEtC0aez5S9AAH8s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775824032; x=1776428832;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WnQifQV7gsrOfjKMl8tp4ygDrv1PPsdOr7pRAbkb3VI=;
        b=CI4wngliQZ04VK3GZZBqmue1YUEXHblI2gTpVOfH4m95rAXNMTL49KkYwgHr2u/44n
         CJxZGhyNUUGmPa198pUTtn/JTnPVBWQYZMR4PzQHuYUW/NEejZ77PDXEFLI3dZ7qxY9x
         S+1Mb/XkvolNqTCN4QJcQf0wTrZxhq5i6G2I3R0MSjP0D7x4Ow3hEeSttJGbdgDhBC2W
         8+uQ7YpWgT5JbMgoAaTc1tXm/11g29eOywgJbDC1HTjwKLnPrMVdlZLPGoj1/Zzojmub
         xEbo6ftkEaFoiCByfHznoHKxf0woGjHmHvzuJ2jLcb1ec1Fkep+kdkLakEgljEY79t22
         q87w==
X-Gm-Message-State: AOJu0YxdXy4ML7p2EljvaSx0h8dW1b0G5otZtYUXk2vHc1YAg4ULzg/s
	F+3X61dCjIym7sJ42iZIvt6oFKMnYxEubDcFQtR3ItWctNZ3kBeAk/Lkp5qs287wH9Yj/j3brrc
	txvxI6rjTmC19
X-Gm-Gg: AeBDiesfSg0d33i9CKnrc0pJPsBl9p11Q/eVg/ikLvt80akn2yrBbJCA2/xwsE4kwAH
	3q44m7Bdyk3+Dlq7i+xl98BOfOqXGEcoqiJCmt+/ekNA1lqlM/uG4UROq2pvNq2YkXRFhOyLDq+
	nx26V/xdmHtMeARg5PHatitXjprO0itdbUq71XrD4nc8MvmUuygVNDxRgw3u9Y2Og6oGI8FQmU9
	QEauE2DNbz/9sFSUeJV7ikmOBhrCweLHhuBvYpo2GE9SwsFNwJaCGbuGjNnOwOMNMDKLHXuMuYM
	XMiPQvx+YF6zb3vorT50/wltA5TC6QkhgIsXDzc2a3m+WxYQ6e27yEstolvxDVg7phmRNLCOZPd
	hZEy6YU7bUwon7b2p5qUfaWwvYTfmuUA/q26lw4JCyCOAjEWAD1nrK3kwj47iVLZ9eNvana2vDl
	PvQYxHt1pdbKB+1y80+w3HIFNjj3pYkikz95V3jwYFjnH8wK8tuQjzIfrY6MGe7/GsACwpxv+SN
	0JVHegMPwiavPXQVKcNuD7af8xa
X-Received: by 2002:a05:600c:5487:b0:488:ae26:435e with SMTP id 5b1f17b1804b1-488d683d4f0mr35846375e9.16.1775824030731;
        Fri, 10 Apr 2026 05:27:10 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00bcd4fc1a1ff2417c.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:bcd4:fc1a:1ff2:417c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488d5df2062sm21098165e9.12.2026.04.10.05.27.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2026 05:27:09 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Cc: Paul Barker <paul@pbarker.dev>
Subject: [OE-core][kirkstone 1/1] oeqa/selftest/git-submodule-test: Default to https git protocol for YP/OE repos
Date: Fri, 10 Apr 2026 14:27:00 +0200
Message-ID: <b507de6d469890f14d153c0eb48361d97d24a71e.1775823919.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1775823919.git.yoann.congal@smile.fr>
References: <cover.1775823919.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 10 Apr 2026 12:27:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235021

From: Yoann Congal <yoann.congal@smile.fr>

Following up on commit 139102a73d41 ("recipes: Default to https git protocol where possible"),
> The recommendation from server maintainers is that the https protocol
> is both faster and more reliable than the dedicated git protocol at this point.
> Switch to it where possible.

Use ";protocol=https" for the parent git submodule and, also, update the
SRCREV to point to a commit where submodules are reference through a
https:// URL instead of a git:// one.

Update the expected output of the archiver test.

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../recipes-test/git-submodule-test/git-submodule-test.bb     | 4 ++--
 meta/lib/oeqa/selftest/cases/archiver.py                      | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta-selftest/recipes-test/git-submodule-test/git-submodule-test.bb b/meta-selftest/recipes-test/git-submodule-test/git-submodule-test.bb
index fa3041b7d8f..3f66cf6919d 100644
--- a/meta-selftest/recipes-test/git-submodule-test/git-submodule-test.bb
+++ b/meta-selftest/recipes-test/git-submodule-test/git-submodule-test.bb
@@ -5,8 +5,8 @@ LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda
 
 INHIBIT_DEFAULT_DEPS = "1"
 
-SRC_URI = "gitsm://git.yoctoproject.org/git-submodule-test;branch=master"
-SRCREV = "a2885dd7d25380d23627e7544b7bbb55014b16ee"
+SRC_URI = "gitsm://git.yoctoproject.org/git-submodule-test;branch=master;protocol=https"
+SRCREV = "f280847494763cdcf71197557a81ba7d8a6bce42"
 
 S = "${WORKDIR}/git"
 
diff --git a/meta/lib/oeqa/selftest/cases/archiver.py b/meta/lib/oeqa/selftest/cases/archiver.py
index 75195241b79..ad2dd2dda65 100644
--- a/meta/lib/oeqa/selftest/cases/archiver.py
+++ b/meta/lib/oeqa/selftest/cases/archiver.py
@@ -301,8 +301,8 @@ class Archiver(OESelftestTestCase):
 
         bb_vars = get_bb_vars(['DEPLOY_DIR_SRC'])
         for target_file_name in [
-            'gitsmshallow_git.yoctoproject.org.git-submodule-test_a2885dd-1_master.tar.gz',
-            'gitsmshallow_git.yoctoproject.org.bitbake-gitsm-test1_bare_120f4c7-1.tar.gz',
+            'gitsmshallow_git.yoctoproject.org.git-submodule-test_f280847-1_master.tar.gz',
+            'gitsmshallow_git.yoctoproject.org.bitbake-gitsm-test1_bare_79a0efa-1.tar.gz',
             'gitsmshallow_git.yoctoproject.org.bitbake-gitsm-test2_bare_f66699e-1.tar.gz',
             'gitsmshallow_git.openembedded.org.bitbake_bare_52a144a-1.tar.gz',
             'gitsmshallow_git.openembedded.org.bitbake_bare_c39b997-1.tar.gz'

