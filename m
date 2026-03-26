Return-Path: <foss@0leil.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ADB8F10A1E7C
	for <webhook@archiver.kernel.org>; Thu, 26 Mar 2026 11:06:11 +0000 (UTC)
Received: from smtp-190e.mail.infomaniak.ch (smtp-190e.mail.infomaniak.ch [185.125.25.14])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.44855.1774523165759085403
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Mar 2026 04:06:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@0leil.net header.s=20231125 header.b=mz9rMH/8;
 spf=pass (domain: 0leil.net, ip: 185.125.25.14, mailfrom: foss+yocto@0leil.net)
Received: from smtp-3-0000.mail.infomaniak.ch (unknown [IPv6:2001:1600:4:17::246b])
	by smtp-3-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4fhLYS0JHRz17ZJ;
	Thu, 26 Mar 2026 12:06:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=0leil.net;
	s=20231125; t=1774523163;
	bh=UXIDVzAJyyiAL1x4RgjB6DfD0NWINiNQ4SzuBpAarSU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=mz9rMH/8DLfjGCIFMxzqk2Mz4zzH+xgurN7q9Rmq7L01LztWHhHaKiwuY9E9efZSw
	 TaKLG1W3DAcSLkw2nHTvmLS8qO7Ly+edlMDSTj9xSoIJ/9BVii7b71G1mSyj5tEf+o
	 bFZjsdGNhVwe6trZh/bWetfuxFxhcRkAwgg/Gok7ZE5jq/wB1j6ahbdhoao/rwXEh4
	 a04j0EZfV5+QIlKhdgbnegR7gG5anIs8Re87AeMb5NR5eeaJnlxgLpXkpencYQ6PGK
	 lIaaFCEGUbZeaT9jL9y8ffg6jToYcKVyvTE5sBLFSEU7rIwYfj7yLQSXix2wlDcyOs
	 hWCCex25pfuxA==
Received: from unknown by smtp-3-0000.mail.infomaniak.ch (Postfix) with ESMTPA id 4fhLYR4Y9MzSpn;
	Thu, 26 Mar 2026 12:06:03 +0100 (CET)
From: Quentin Schulz <foss+yocto@0leil.net>
Date: Thu, 26 Mar 2026 12:05:49 +0100
Subject: [PATCH 1/3] mesa: fix missing dependency for libdrm for panfrost
 tools
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260326-mesa-libdrm-imagination-v1-1-fe018f03be6a@cherry.de>
References: <20260326-mesa-libdrm-imagination-v1-0-fe018f03be6a@cherry.de>
In-Reply-To: <20260326-mesa-libdrm-imagination-v1-0-fe018f03be6a@cherry.de>
To: openembedded-core@lists.openembedded.org
Cc: Quentin Schulz <quentin.schulz@cherry.de>, 
 Khem Raj <raj.khem@gmail.com>, Changqing Li <changqing.li@windriver.com>
X-Mailer: b4 0.15-dev-47773
X-Infomaniak-Routing: alpha
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 26 Mar 2026 11:06:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233974

From: Quentin Schulz <quentin.schulz@cherry.de>

mesa-tools-native builds the panfrost tools but if wayland is not in
DISTRO_FEATURES, libdrm dependency is missing and mesa-tools-native will
fail with:

../sources/mesa-26.0.2/src/panfrost/lib/kmod/pan_kmod.c:7:10: fatal error:
xf86drm.h: No such file or directory
    7 | #include <xf86drm.h>
      |          ^~~~~~~~~~~

Note the mesa-26.0.2 in the path. It's simply because the tarball
sources contain this name as root directory, it can be a bit misleading
when looking at mesa-tools-native logs and seeing this error.

Fixes: 937a0931dd07 ("add mesa-tools native-only recipe")
Reported-by: Khem Raj <raj.khem@gmail.com>
Reported-by: Changqing Li <changqing.li@windriver.com>
Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
---
 meta/recipes-graphics/mesa/mesa.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index a95adfc960..e5ee4ad259 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -160,6 +160,7 @@ TOOLS .= "${@bb.utils.contains('PACKAGECONFIG', 'panfrost', ',panfrost', '', d)}
 
 # dependencies for tools.
 TOOLS_DEPS:append = "${@bb.utils.contains('PACKAGECONFIG', 'freedreno', ' ncurses libconfig libxml2 ', '', d)}"
+TOOLS_DEPS:append = "${@bb.utils.contains('PACKAGECONFIG', 'panfrost', ' libdrm', '', d)}"
 
 PACKAGECONFIG[expat] = "-Dexpat=enabled, -Dexpat=disabled, expat"
 PACKAGECONFIG[tools] = "-Dtools=${@strip_comma('${TOOLS}')}, -Dtools='', ${TOOLS_DEPS}"

-- 
2.53.0


