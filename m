Return-Path: <vince@underview.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9D18C44509
	for <webhook@archiver.kernel.org>; Sun, 12 Jul 2026 18:43:26 +0000 (UTC)
Received: from mail-yx1-f49.google.com (mail-yx1-f49.google.com [74.125.224.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.930.1783881800953933503
 for <openembedded-core@lists.openembedded.org>;
 Sun, 12 Jul 2026 11:43:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@underview.tech header.s=google header.b=BkydHURG;
 spf=pass (domain: underview.tech, ip: 74.125.224.49, mailfrom: vince@underview.tech)
Received: by mail-yx1-f49.google.com with SMTP id 956f58d0204a3-6611669cd16so3394869d50.0
        for <openembedded-core@lists.openembedded.org>; Sun, 12 Jul 2026 11:43:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=underview.tech; s=google; t=1783881800; x=1784486600; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZB56sPF6HXLkrQexTiEGWtEDUFkz7VbuMfCVba1w6PI=;
        b=BkydHURGcIR+QbYlxc8DY0KU8+Yo27Tczs+5vgTFtRYb9gdebLvVwnt0qPfHQuDJbJ
         4Cn92X4KscZ2fYmKTStt0fIWlghCTk2xstMLG+8vs/aUFXotkRwYQCgMswvxU8RT7rlV
         TYzXC7oVL6/c18N0al+To9y/zmTlpCCKFrFVZhKLUWW/3l/j/6ml5QGp4I0l2MX8ebyb
         +QBc2RTp7pSO/hmV1+NNldrXtg6OdjitD2ptd6sDnrEHE7FFJAaEgxRE3Yalt83BW0Zp
         iNEJidWf3HPvZKir6kE11NcOB3f8xCN1wZk0+aaZJ+AavDIzIoCFgMxs8faXqazMDma2
         jEmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783881800; x=1784486600;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZB56sPF6HXLkrQexTiEGWtEDUFkz7VbuMfCVba1w6PI=;
        b=Sn9ZQR1o9dEAzAdw0CulDmbsv21Vg8jJubsiPVEAc8rQARjVOhWcpw6DqZbqJEsXV7
         3xP+DJhcwUCfGRJLzRKLGkxN569seElJGUJqQHxTrTvyLeJP7nVx5rRTejD1+70KuBkQ
         soO0dlMSzkUTO2vUxOg1wKn8BEQiNiQ5GXOa8aB2IX3m1eqe9X004afbGFrf5KcZQ7hE
         g4IztDQdS2xbdxzdsEZM4e5XjchnWX81NkoRfVPSC7mP5P7hn6uF5S/uPWLRzQaCPUcz
         M922VTghWviSdVS3KEnirkMuvHU6tsGA634oeX/rEQgSsRD5PG08fz/yW2usxC2IO+pv
         jm/w==
X-Gm-Message-State: AOJu0Yy5LSDwrWtIdlQZq0pMPHLweMCTm6b40GKx4kowQzZJZk5BJcFb
	p+kEp93CU996NQJs48ZcxEyNrOuB3uV3xhIBl3S8YXUIDJ6JDCNND1MeI7VAjaXKjCJUDz8bbYV
	dVY03HFA=
X-Gm-Gg: AfdE7clpJyygbGsE6jV8WOz946imt7t6PeG6yPCnltJhuYRCVwKg18oR3RfGg5rM8he
	bqUQbufKQ0H9HdPMZClX0r5s13KA4we2HkQMOvgaKX5lMA6lVSIeEWFFdkp2JQA1mieXlQTmRHp
	nV5NcVUrchkWfZjcG+SuOPt9jbuppst/3t7fcI+A66frtvW6BRjZ2CD4i9/CarhBr6+Q4L5dFsA
	PYmPz+/SEQparIfLOHh6bMeKOhnNKSLegW0TMhQIi/JBVaq3aBiHUAoyVpswVGp8AEK9Mv7a2zH
	P59PUZYwp11De+L0mKxInbJgeiamxmM5p3ZUXD06urOfLcx6fY1t6FX6uROBHEw67bv0oT+OzIX
	t3XPosp+RlGzmBu/0Ua/Izii94mLI6pSwdgvTTDcrEBHl1uC/Yqe8gJPaYWNJEUSS7aFZU4+/RF
	ZguvFeIn70l1KmkMHLjOznb7DP
X-Received: by 2002:a53:ac97:0:b0:667:e178:5326 with SMTP id 956f58d0204a3-667e1785db6mr3046933d50.57.1783881799978;
        Sun, 12 Jul 2026 11:43:19 -0700 (PDT)
Received: from vince-server.attlocal.net ([2600:1700:b540:3af0::42])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-66787b23b35sm11768236d50.21.2026.07.12.11.43.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2026 11:43:19 -0700 (PDT)
From: Vincent Davis Jr <vince@underview.tech>
To: openembedded-core@lists.openembedded.org
Cc: Vincent Davis Jr <vince@underview.tech>
Subject: [PATCH v4 02/27] kernel: dont set WORKDIR if KERNEL_PACKAGE_NAME changes
Date: Sun, 12 Jul 2026 14:42:42 -0400
Message-ID: <20260712184307.3259642-2-vince@underview.tech>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260712184307.3259642-1-vince@underview.tech>
References: <20260712184307.3259642-1-vince@underview.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 12 Jul 2026 18:43:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240792

Setting WORKDIR in the kernel recipes if
KERNEL_PACKAGE_NAME changes to the WORKDIR
of the recipe leads to other recipes such
as perf and make-mod-scripts build errors.
As they rely on globally set variables to
determine the location of the kernel-source.

Commit also removes KERNEL_PACKAGE_NAME variable
as it's set globally in bitbake.conf.

Signed-off-by: Vincent Davis Jr <vince@underview.tech>
---
 meta/classes-recipe/kernel.bbclass | 13 -------------
 1 file changed, 13 deletions(-)

diff --git a/meta/classes-recipe/kernel.bbclass b/meta/classes-recipe/kernel.bbclass
index 48e394b650..d8d44de27b 100644
--- a/meta/classes-recipe/kernel.bbclass
+++ b/meta/classes-recipe/kernel.bbclass
@@ -12,7 +12,6 @@ COMPATIBLE_HOST = ".*-linux"
 REQUIRED_TUNE_FEATURES:riscv32 = "rv 32 i m a zicsr zifencei"
 REQUIRED_TUNE_FEATURES:riscv64 = "rv 64 i m a zicsr zifencei"
 
-KERNEL_PACKAGE_NAME ??= "kernel"
 KERNEL_DEPLOYSUBDIR ??= "${@ "" if (d.getVar("KERNEL_PACKAGE_NAME") == "kernel") else d.getVar("KERNEL_PACKAGE_NAME") }"
 
 PROVIDES += "virtual/kernel"
@@ -67,18 +66,6 @@ python __anonymous () {
         bb.warn("Some packages (E.g. *-dev) might be missing due to "
                 "bug 11905 (variable KERNEL_PACKAGE_NAME == PN)")
 
-    # The default kernel recipe builds in a shared location defined by
-    # bitbake/distro confs: STAGING_KERNEL_DIR and STAGING_KERNEL_BUILDDIR.
-    # Set these variables to directories under ${WORKDIR} in alternate
-    # kernel recipes (I.e. where KERNEL_PACKAGE_NAME != kernel) so that they
-    # may build in parallel with the default kernel without clobbering.
-    if kpn != "kernel":
-        workdir = d.getVar("WORKDIR")
-        sourceDir = os.path.join(workdir, 'kernel-source')
-        artifactsDir = os.path.join(workdir, 'kernel-build-artifacts')
-        d.setVar("STAGING_KERNEL_DIR", sourceDir)
-        d.setVar("STAGING_KERNEL_BUILDDIR", artifactsDir)
-
     # Merge KERNEL_IMAGETYPE and KERNEL_ALT_IMAGETYPE into KERNEL_IMAGETYPES
     type = d.getVar('KERNEL_IMAGETYPE') or ""
     alttype = d.getVar('KERNEL_ALT_IMAGETYPE') or ""
-- 
2.43.0


