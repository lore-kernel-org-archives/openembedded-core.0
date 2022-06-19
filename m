Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4E23C433EF
	for <webhook@archiver.kernel.org>; Sun, 19 Jun 2022 19:31:37 +0000 (UTC)
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com
 [209.85.210.175])
 by mx.groups.io with SMTP id smtpd.web12.22092.1655667076258179197
 for <openembedded-core@lists.openembedded.org>;
 Sun, 19 Jun 2022 12:31:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=Ek/3RilN;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.175,
 mailfrom: steve@sakoman.com)
Received: by mail-pf1-f175.google.com with SMTP id bo5so8469122pfb.4
        for <openembedded-core@lists.openembedded.org>;
 Sun, 19 Jun 2022 12:31:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=rfI3RY6b60sB9rIF0om2dOL9c0rbMmwv436RJpHskbM=;
        b=Ek/3RilNZriBL5ndaGRjL+HwTAinhENboNZDmIYjsRQ0RurJdj3rZyIf4jpDupbnhh
         B6bXUfcARwUiwpKQWPKtKq2B+ITf6uemOTb2CLqR2aHX5mcQ+ZA7k9+HKGlUc0Q4kvHo
         hXHWpe8BHcMhSZTGaZriHTRJ3qXaLz09VdIetM/6eHkugZMSent3GUR3fdgPC0aGGyto
         /EBiXQB4YRJ2RHFAnjtqzhJuMxStdjN44SBYF7VymuyobRbyRCq9a6iumqeOFaCjbuoU
         gn7Kdbdu8weWf4ogsEIKcOPJdrOkGBsIv11gCTx8vblkkmdJrNXZK3bTPaexw9hIWTKV
         Guog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=rfI3RY6b60sB9rIF0om2dOL9c0rbMmwv436RJpHskbM=;
        b=hZpB81bv4mNc+enKhYCixvjIZmiInOmx5jRS8jVBcUfh/Ju6H81LyzSaZbMUMyjcwl
         m6TofzrPzHqNL1jh7HEtHLCgs026oyuGD0aGZH3Fx5KiawEgWQMzcg7gZOaO403rbm4F
         sB2/GSrzWprMtsZ9wXFsa6v9CWKtB3cnD0/msq4BGtUQAxCB3o+91pxRmmYTqVo6/qhV
         O5aCtOW8H1vO+jeLztHvkw8OHCUWLPe4YjqOZbbkeHEiEGkK192CbBc3NrxLpBg/z2Oj
         CoqBP2lEQFuJE3oXppfxxdc4tYwOxST2ckHo2g/gEktesKNYpbdNyd27/EC1K5qk3BWE
         KdtA==
X-Gm-Message-State: AJIora8Sqf9y6sZb9ZfveNShgCDWLwh+H0w/4BZLLJ2jh/+kN68LWLtF
	fG1wNXYp1hnN1TOz6cs9OTbNSsIeB4XkJPqH
X-Google-Smtp-Source: 
 AGRyM1vZIGQ94951CZxuN0gUbwj8zhkgWqp3QZFankOpigExEKkit+JDs+mtt4V0KVrrpbunYNW5KQ==
X-Received: by 2002:a63:9b0a:0:b0:406:8c31:47e6 with SMTP id
 r10-20020a639b0a000000b004068c3147e6mr18534861pgd.329.1655667093056;
        Sun, 19 Jun 2022 12:31:33 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 o2-20020a637e42000000b003fe4836abdasm7432886pgn.1.2022.06.19.12.31.31
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jun 2022 12:31:32 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 13/15] archiver: don't use machine variables in
 shared recipes
Date: Sun, 19 Jun 2022 09:30:48 -1000
Message-Id: 
 <6fa49ffcf2d77aaae5c348b6eb1f0117aa93eeaf.1655666951.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1655666951.git.steve@sakoman.com>
References: <cover.1655666951.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 19 Jun 2022 19:31:37 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167059

From: Jose Quaresma <quaresma.jose@gmail.com>

When using multiconfig with the same TMP folder we can have
races because the shared recipes like gcc-source run twice.

ARCHIVER_OUTDIR = ${ARCHIVER_TOPDIR}/${TARGET_SYS}/${PF}/
which includes TARGET_SYS and between the two different MACHINE values,
this changes  from 'arm-poky-linux-gnueabi' to 'aarch64-poky-linux'.
This leads to the task running twice, once for each multiconfig.

To solve this we need to store the shared output in a common place
for all machines and in this way the stamps will be the same for each
machine so the gcc-source will on run once regardless of the machine used.

Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 5abe497aad39a6ce8d72556fcdda1938a0f8c1bc)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/archiver.bbclass | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/meta/classes/archiver.bbclass b/meta/classes/archiver.bbclass
index 8d026067f4..33070cd17f 100644
--- a/meta/classes/archiver.bbclass
+++ b/meta/classes/archiver.bbclass
@@ -55,9 +55,10 @@ ARCHIVER_MODE[compression] ?= "xz"
 
 DEPLOY_DIR_SRC ?= "${DEPLOY_DIR}/sources"
 ARCHIVER_TOPDIR ?= "${WORKDIR}/archiver-sources"
-ARCHIVER_OUTDIR = "${ARCHIVER_TOPDIR}/${TARGET_SYS}/${PF}/"
+ARCHIVER_ARCH = "${TARGET_SYS}"
+ARCHIVER_OUTDIR = "${ARCHIVER_TOPDIR}/${ARCHIVER_ARCH}/${PF}/"
 ARCHIVER_RPMTOPDIR ?= "${WORKDIR}/deploy-sources-rpm"
-ARCHIVER_RPMOUTDIR = "${ARCHIVER_RPMTOPDIR}/${TARGET_SYS}/${PF}/"
+ARCHIVER_RPMOUTDIR = "${ARCHIVER_RPMTOPDIR}/${ARCHIVER_ARCH}/${PF}/"
 ARCHIVER_WORKDIR = "${WORKDIR}/archiver-work/"
 
 # When producing a combined mirror directory, allow duplicates for the case
@@ -101,6 +102,10 @@ python () {
         bb.debug(1, 'archiver: %s is excluded, covered by gcc-source' % pn)
         return
 
+    # TARGET_SYS in ARCHIVER_ARCH will break the stamp for gcc-source in multiconfig
+    if pn.startswith('gcc-source'):
+        d.setVar('ARCHIVER_ARCH', "allarch")
+
     def hasTask(task):
         return bool(d.getVarFlag(task, "task", False)) and not bool(d.getVarFlag(task, "noexec", False))
 
-- 
2.25.1


