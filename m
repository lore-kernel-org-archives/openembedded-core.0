Return-Path: <dpmin7@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21AA6C5DF97
	for <webhook@archiver.kernel.org>; Thu, 27 Aug 2026 00:48:10 +0000 (UTC)
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.26341.1787791686499284753
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Aug 2026 17:48:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=h8A6ChsP;
 spf=pass (domain: gmail.com, ip: 209.85.216.45, mailfrom: dpmin7@gmail.com)
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-38ec1402b05so1790171a91.2
        for <openembedded-core@lists.openembedded.org>; Wed, 26 Aug 2026 17:48:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787791686; x=1788396486; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=x/+HbU6UE9Phdu0cCqrPX4Zi5brpQPreTg1UqbsgoVM=;
        b=h8A6ChsPA6GjsQDil9tp3/xy/8P/NuD8zyDlyMF698ICw56sOOCBDHI6Bszr66xVDy
         4xQV3/a4yvWIgt+xBLCGlsVQf6T1FgQNznXy+1v1NEBSsCOTgrvcHzHcOC8pLz4TZ5w4
         /27BatX5YauIfLvdlnj8wzhFFVbntVCaIrOVkjcL3BqBmPRC5/exyoHbr5Fq0buSpPon
         niH+2oQyACCzHXsqdT8YLo3nqs0t9cISi/I0VpB9Nt7gB1M/9Myz6FjhmicCwwKSIXNx
         V4pPWb3yheGGCYU6A2Cgf2OMtoKKdByYixHWfXFGOS+DGhVWhsfdgztKY/FfVs3G++5I
         WCiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787791686; x=1788396486;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=x/+HbU6UE9Phdu0cCqrPX4Zi5brpQPreTg1UqbsgoVM=;
        b=qy5vpBK4GpOLci+jy/+rNK8DdvlI0UBSRSPueofcjzof6RNbXUv4CR18hxa0dJRiLi
         XaBPZ+qRmxxhaQG1re5L73+0n24jtRLms6/PDZ5+DixH4vXo1BlxARCIrQ6/A1GxvsiU
         DBzG7IBbQjiHJ2L9MaLSjR5PRAIvdLn2e9PGzFUmD3SKvD3aUVcvdv/LwODB6slj125l
         VgNZPqx2RM0Mc/doTZQSRtZfIrEeDC5Lfv5a/IB4LEQkc56EkZ7o4U3Za9SjjWlR47Tp
         d6upaw/jlNzZt5cjdLE1Nt1ZcWl9BZQjAqR/P5mK/0S5rRgbeAFZ41x453ALWGT5Tf9j
         pkAQ==
X-Gm-Message-State: AFuF++lnOwW1gaQQOGKpD2qQ90XmTUEIIrL8kb1uMwpyUtPmMpIYOohu
	U1sBIQU9I1MtQi1tYd38rHurNUi6uhyKXtuDt1+AsqJx5A+QcGzOBw8mHmnHLA==
X-Gm-Gg: AR+sD11NiY3Cuzy0PNpGBqMIVm8daCTilnyxbmi1ilx2Jv4/OoBBXDNRQhQMMW0XPEt
	3VOEebDv5IYEOHHMU8y4ph9xjeK2YMoaRN+jO3uXMNcw3pnW8/oNn0OIN5gJ1IChPH4ahWQPYPO
	FR2K3O/kt7Y/eVGpIeyMSh3DxoSWeB7ivByX522h/j1uFi3o1Eeeq1DkzVhZ/mAJTpAk023YMa/
	kZ1RNaM2WF4L9LBPqm4lwbqgCgeg3d5IME76j+sqvOH8b3wHrDY5dm+zvzeN1fQUrA4rjIy4L6H
	UMgBhizFEmPsASj8nSFPdNDCvbFLU1OXZ9xUUzkZ0yMrMbfw2m/lSkTeyv6d+1GR9BirnzUoLPu
	pob7soY67nd7CuMPKV8sdVU20gtK6aOwqsInx7wYn3xtGaP4FvFf9pL04LWVzXNr5rzok6EqNDa
	Gq3Qz7Vdlpe23tUrlVur/UqLY23dz6nYe2ohCOZnFz7Z/e+lhDFgz5FkbXjhiF
X-Received: by 2002:a17:90b:380b:b0:38d:ddc2:7ccb with SMTP id 98e67ed59e1d1-3966d13a242mr20606915a91.1.1787791685718;
        Wed, 26 Aug 2026 17:48:05 -0700 (PDT)
Received: from dpmin-PC.. ([27.122.242.71])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-396b19927a1sm405464a91.14.2026.08.26.17.48.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 17:48:05 -0700 (PDT)
From: Kyungjik Min <dpmin7@gmail.com>
X-Google-Original-From: Kyungjik Min <dp.min@lge.com>
To: openembedded-core@lists.openembedded.org
Cc: Kyungjik Min <dp.min@lge.com>
Subject: [OE-core][PATCH] rootfs.py: fix run-postinsts removal on multilib images
Date: Thu, 27 Aug 2026 09:47:55 +0900
Message-ID: <20260827004755.2074071-1-dp.min@lge.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Aug 2026 00:48:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244442

ROOTFS_BOOTSTRAP_INSTALL in image.bbclass unconditionally stages
run-postinsts into every image. When no delayed postinsts remain,
_uninstall_unneeded() is supposed to remove it again, but the removal
call used the bare "run-postinsts" package name without applying
MLPREFIX.

On a multilib image (e.g. lib32-core-image-minimal), the package that
is actually installed is lib32-run-postinsts, so the unprefixed
removal silently matches nothing and run-postinsts leaks into the
final image manifest, along with its now-pointless init script /
systemd unit.

Expand MLPREFIX before removing the package, matching the pattern
already used elsewhere in oe-core (e.g. oe/package.py) for
package-name lookups that need to work across multilib variants.

Signed-off-by: Kyungjik Min <dp.min@lge.com>
---
 meta/lib/oe/rootfs.py | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oe/rootfs.py b/meta/lib/oe/rootfs.py
index 5eee48f587..e0365da285 100644
--- a/meta/lib/oe/rootfs.py
+++ b/meta/lib/oe/rootfs.py
@@ -265,7 +265,8 @@ class Rootfs(object, metaclass=ABCMeta):
         delayed_postinsts = self._get_delayed_postinsts()
         if delayed_postinsts is None:
             if os.path.exists(self.d.expand("${IMAGE_ROOTFS}${sysconfdir}/init.d/run-postinsts")) or os.path.exists(self.d.expand("${IMAGE_ROOTFS}${systemd_system_unitdir}/run-postinsts.service")):
-                self.pm.remove(["run-postinsts"])
+                mlprefix = self.d.getVar('MLPREFIX') or ""
+                self.pm.remove([mlprefix + "run-postinsts"])
 
         image_rorfs = bb.utils.contains("IMAGE_FEATURES", "read-only-rootfs",
                                         True, False, self.d) and \

