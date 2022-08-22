Return-Path: <enrico.scholz@sigma-chemnitz.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B1B1C28D13
	for <webhook@archiver.kernel.org>; Mon, 22 Aug 2022 11:14:04 +0000 (UTC)
Received: from smtpout.cvg.de (smtpout.cvg.de [87.128.211.67])
 by mx.groups.io with SMTP id smtpd.web11.16492.1661166840979582299
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Aug 2022 04:14:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sigma-chemnitz.de header.s=v2022040800 header.b=AAjJBEyA;
 spf=pass (domain: sigma-chemnitz.de, ip: 87.128.211.67,
 mailfrom: enrico.scholz@sigma-chemnitz.de)
Received: from mail-mta-2.intern.sigma-chemnitz.de
 (mail-mta-2.intern.sigma-chemnitz.de [192.168.12.70])
	by mail-out-3.intern.sigma-chemnitz.de (8.16.1/8.16.1) with ESMTPS id
 27MBDxo9917379
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Aug 2022 13:13:59 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sigma-chemnitz.de;
	s=v2022040800; t=1661166839;
	bh=G0yYyyEYM0QQTkhsU/P4h5uuDu3u3yOC7WuWpmOOwOM=; l=1628;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=AAjJBEyAfqZt5dxPoYnE166tUVJPSWYijb+04+J9BgzKPqq/c7E6SKpFHt7Xbf3gf
	 l+WkzeSmvGL0Xsg1v5TsB52qsSd2zy5AE8EWQyjFRyEzlkwk7TrbUy5E7CWILPjJYM
	 bT/AMrVdUtOPsOxEOPSaNsfRnSBAhJOUcS0HZJMvqDX6zj6Vfby5ZpV+ZWRFeywP9M
	 4cpNitqPeRkj8Fy59T7SySym+2xZ4tTonZUpav3mZ7rpRILdgUWmyPfiDmIzEdodl8
	 Cx3reF0k7i3NJosA8zlc2vPtvFfKyaVc+WKw3pu2WcdfzBrNb9WaLHcI7vcGRcIXPS
	 5KVzFTpdlDT+w==
Received: from reddoxx.intern.sigma-chemnitz.de (reddoxx.sigma.local
 [192.168.16.32])
	by mail-mta-2.intern.sigma-chemnitz.de (8.16.1/8.16.1) with ESMTP id
 27MBDv2B906502
	for <openembedded-core@lists.openembedded.org> from
 enrico.scholz@sigma-chemnitz.de; Mon, 22 Aug 2022 13:13:57 +0200
Received: from mail-msa-2.intern.sigma-chemnitz.de ( [192.168.12.72]) by
 reddoxx.intern.sigma-chemnitz.de
	(Reddoxx engine) with SMTP id 7439E88181E; Mon, 22 Aug 2022 13:13:55 +0200
Received: from ensc-pc.intern.sigma-chemnitz.de
 (ensc-pc.intern.sigma-chemnitz.de [192.168.3.24])
	by mail-msa-2.intern.sigma-chemnitz.de (8.16.1/8.16.1) with ESMTPS id
 27MBDtPk699764
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
	Mon, 22 Aug 2022 13:13:55 +0200
Received: from ensc by ensc-pc.intern.sigma-chemnitz.de with local (Exim 4.95)
	(envelope-from <ensc@sigma-chemnitz.de>)
	id 1oQ5NT-0052Ts-J6;
	Mon, 22 Aug 2022 13:13:55 +0200
From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
To: openembedded-core@lists.openembedded.org
Cc: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Subject: [PATCH 2/2] npm.bbclass: fix architecture mapping
Date: Mon, 22 Aug 2022 13:13:37 +0200
Message-Id: <20220822111337.1201003-2-enrico.scholz@sigma-chemnitz.de>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220822111337.1201003-1-enrico.scholz@sigma-chemnitz.de>
References: <20220822111337.1201003-1-enrico.scholz@sigma-chemnitz.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Aug 2022 11:14:04 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169668

Use the same code as the 'nodejs_16.4.bb recipe' for mapping the OE
arch to the NPM arch.

A noticeable change (and fix for exiting problems) is the move from
'arm' to 'arm64' for 'aarch64'.

Signed-off-by: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
---
 meta/classes-recipe/npm.bbclass | 24 +++++++++++-------------
 1 file changed, 11 insertions(+), 13 deletions(-)

diff --git a/meta/classes-recipe/npm.bbclass b/meta/classes-recipe/npm.bbclass
index 8e73400678db..20350cea255f 100644
--- a/meta/classes-recipe/npm.bbclass
+++ b/meta/classes-recipe/npm.bbclass
@@ -28,20 +28,18 @@ NPM_INSTALL_DEV ?= "0"
 
 NPM_NODEDIR ?= "${RECIPE_SYSROOT_NATIVE}${prefix_native}"
 
-def npm_target_arch_map(target_arch):
-    """Maps arch names to npm arch names"""
+## must match mapping in nodejs.bb (openembedded-meta)
+def map_nodejs_arch(a, d):
     import re
-    if re.match("p(pc|owerpc)(|64)", target_arch):
-        return "ppc"
-    elif re.match("i.86$", target_arch):
-        return "ia32"
-    elif re.match("x86_64$", target_arch):
-        return "x64"
-    elif re.match("arm64$", target_arch):
-        return "arm"
-    return target_arch
-
-NPM_ARCH ?= "${@npm_target_arch_map(d.getVar("TARGET_ARCH"))}"
+
+    if   re.match('i.86$', a): return 'ia32'
+    elif re.match('x86_64$', a): return 'x64'
+    elif re.match('aarch64$', a): return 'arm64'
+    elif re.match('(powerpc64|powerpc64le|ppc64le)$', a): return 'ppc64'
+    elif re.match('powerpc$', a): return 'ppc'
+    return a
+
+NPM_ARCH ?= "${@map_nodejs_arch(d.getVar("TARGET_ARCH"), d)}"
 
 NPM_PACKAGE = "${WORKDIR}/npm-package"
 NPM_CACHE = "${WORKDIR}/npm-cache"
-- 
2.37.2


