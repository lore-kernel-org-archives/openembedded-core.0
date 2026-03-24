Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96D43FEC0F1
	for <webhook@archiver.kernel.org>; Tue, 24 Mar 2026 18:21:15 +0000 (UTC)
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4243.1774376474950068325
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Mar 2026 11:21:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=fAM2VBTx;
 spf=pass (domain: gmail.com, ip: 209.85.222.182, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-8cb38e86cf2so541172885a.1
        for <openembedded-core@lists.openembedded.org>; Tue, 24 Mar 2026 11:21:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774376474; x=1774981274; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QWiWHBqWNJeS6Rxurg6SF6CSuR2j5poVJ2O1VH7CKfU=;
        b=fAM2VBTxpB5J0J59xPW+l/y6HtlrgPg1LG+pzaqacP1eqPrBBde2pa5WSl8jWMydy9
         azToRsdrUIVs0tInQZgjj+zTRhfpKOCb3xczA8Xflvo9ei84w7t0H9Q/4TcWK8yEiJ+H
         nlsnY5aZRwFrZ7gP4lYDGUHDwN/1XyyZR1KYKScJ8U9RwcE2CQ6LfaKffbqhTr5UhlNh
         o9k9ggbI9qWPSY6KEHm7OKqQXKfhhbTfjgYawxPx3m9KY/Yi5UjRhAolw/r1VwBJODv0
         ieJ8tGpEvlENAz2DOMK/tSuABx29YEKwEIq6vFf9o+nVqAy7J1c/esei17dO1ww7pf1y
         YGhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774376474; x=1774981274;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QWiWHBqWNJeS6Rxurg6SF6CSuR2j5poVJ2O1VH7CKfU=;
        b=f8T9Fybg90w/ejtRyVEC1K8Ht6W7y/pTURKxRcve1M/iYrCBapoaDVGafQ1zc8Lvft
         XMeFx3NFMyEjyiXyVGWzC6jjwfh1NMc4uMkAD81vqJdCyGCf2UHl76pXUOhEV1aBbqxi
         laAS2UjJpITJdlUIKcVcyAKqaDW0HX5YL4Xq+fiqeDdpdndRCmxj1Qwt9PxOIs9TpjYQ
         n8ksfUAvg6P5t3LGm7Qgui0g31bE3asrWBlxdVy/Y44dto64cUs8wG1GQGCkC0YgOeV9
         JWsYpM+RhRnB2vmlctxrq4samx51x26EK2WTEVPSVZIAHh52XSugIod+PHdHe5c4TLo8
         JAJw==
X-Gm-Message-State: AOJu0YyxQdqXFimuMYCSH7wS9oFJjUQNFstA2g50EuGaMZOBRzDPTzJY
	NkQyEYr+eCcubbW9wo9P258cfYqUGiyEvMvILP4CraLiGEqo8hYYXIMc
X-Gm-Gg: ATEYQzzoTBUHSjmT7aRZALA0K7wDW89JZ1tnbiE/bknEIb/nHLAewUvSdpg5xFFeEyy
	kUYzsrfd0lIwu4zkllo2ojgBklY95E+3b4/eIfa773eDMAD2IUEFaOheLtfOsWjGTINJv2vWHaw
	1qiPEBFJ6gunZuDBkJHwSrZGA9ftg0eYO3ipJlW3AAFExb0HgorKyin/1LCgqfAFVKVzFr/napV
	WaH8Pg/CRyPC3jtU8KlMWrueNF6PlIama0kzn32IwPZ4nr/T0u2eZy73/2LVJ6AYyB1w2PheiX0
	EkZpxahUyv7QzYMlfVmKFbC0X9S5n/CEVWT55YRJwruWBF54PevNVEoEwQ8HkLZo6ur2dju55lm
	UCgJGjWzzO0OFYEseHmiZXm5eTmQKIyzm+jH0kvqZmrlNynwFFbCUfh1DLlvkZ5Ikzh40fmCOIM
	zcajztxFbSv1m5WgieQKn3V/ShgB8j4/bUaggNgyKpQ9XY+D7pd4gvJ0GgyyRYyptwKPVPzInT5
	Tuvh+I0NAPC5F96/EY6H/FBQqLaE0/bGITJp6l/qMEYAtHJzqBaE0/OEYc=
X-Received: by 2002:a05:620a:2893:b0:8cd:93b7:ebbd with SMTP id af79cd13be357-8d001057d82mr72532885a.60.1774376473647;
        Tue, 24 Mar 2026 11:21:13 -0700 (PDT)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8cfc908d8cfsm1096172285a.28.2026.03.24.11.21.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 11:21:13 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH] linux-yocto/6.18: fix genericarm64 config audit warning
Date: Tue, 24 Mar 2026 14:21:11 -0400
Message-ID: <20260324182111.2188583-1-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 24 Mar 2026 18:21:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233822

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Integrating the following commit(s) to linux-yocto/.:

1/1 [
    Author: Bruce Ashfield
    Email: bruce.ashfield@gmail.com
    Subject: genericarm64/serial: change SERIAL_IMX_CONSOLE to =y
    Date: Tue, 24 Mar 2026 14:03:28 -0400

    With the following upstream commit, this option is no longer
    tristate, so we set it to =y instead:

      commit 3f8b835a63341163da0400befb3c6e8f6d4085da
      Author: Randy Dunlap <rdunlap@infradead.org>
      Date:   Sat Jan 10 15:26:40 2026 -0800

          serial: imx: change SERIAL_IMX_CONSOLE to bool

          [ Upstream commit 79527d86ba91c2d9354832d19fd12b3baa66bd10 ]

          SERIAL_IMX_CONSOLE is a build option for the imx driver (SERIAL_IMX).
          It does not build a separate console driver file, so it can't be built
          as a module since it isn't built at all.

          Change the Kconfig symbol from tristate to bool and update the help
          text accordingly.

          Fixes: 0db4f9b91c86 ("tty: serial: imx: enable imx serial console port as module")
          Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
          Link: https://patch.msgid.link/20260110232643.3533351-2-rdunlap@infradead.org
          Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
          Signed-off-by: Sasha Levin <sashal@kernel.org>

    Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
]

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---

This addresses the configuration audit warning found in the latest
6.18 -stable upgrades.

Bruce

 meta/recipes-kernel/linux/linux-yocto-rt_6.18.bb   | 2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_6.18.bb | 2 +-
 meta/recipes-kernel/linux/linux-yocto_6.18.bb      | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.18.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.18.bb
index 39f466d64a..626f30fb83 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.18.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.18.bb
@@ -16,7 +16,7 @@ python () {
 }
 
 SRCREV_machine ?= "64a2ea6184db4c022bec6090982b4b617a6c844b"
-SRCREV_meta ?= "899d5e6d3dd929b52ec2acc5b81e317444279f19"
+SRCREV_meta ?= "465cb5bcefd72f429e0b3ad6ab5b3fcff5b390fc"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.18;destsuffix=${KMETA};protocol=https"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.18.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.18.bb
index 7f3d3bc649..b91e05cf37 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.18.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.18.bb
@@ -19,7 +19,7 @@ KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
 SRCREV_machine ?= "1fa8fa91abea837d76ab91c972e8387aae78157e"
-SRCREV_meta ?= "899d5e6d3dd929b52ec2acc5b81e317444279f19"
+SRCREV_meta ?= "465cb5bcefd72f429e0b3ad6ab5b3fcff5b390fc"
 
 PV = "${LINUX_VERSION}+git"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.18.bb b/meta/recipes-kernel/linux/linux-yocto_6.18.bb
index 1490feb10a..c84bdf2996 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.18.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.18.bb
@@ -29,7 +29,7 @@ SRCREV_machine:qemux86 ?= "1fa8fa91abea837d76ab91c972e8387aae78157e"
 SRCREV_machine:qemux86-64 ?= "1fa8fa91abea837d76ab91c972e8387aae78157e"
 SRCREV_machine:qemumips64 ?= "9fb4ff0187c85426f21fd40d4c61b742800f65c4"
 SRCREV_machine ?= "1fa8fa91abea837d76ab91c972e8387aae78157e"
-SRCREV_meta ?= "899d5e6d3dd929b52ec2acc5b81e317444279f19"
+SRCREV_meta ?= "465cb5bcefd72f429e0b3ad6ab5b3fcff5b390fc"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
-- 
2.43.0


