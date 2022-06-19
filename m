Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9E6CC43334
	for <webhook@archiver.kernel.org>; Sun, 19 Jun 2022 19:35:47 +0000 (UTC)
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com
 [209.85.210.180])
 by mx.groups.io with SMTP id smtpd.web10.22010.1655667344274818584
 for <openembedded-core@lists.openembedded.org>;
 Sun, 19 Jun 2022 12:35:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=g1BnSzN8;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.180,
 mailfrom: steve@sakoman.com)
Received: by mail-pf1-f180.google.com with SMTP id c205so1756353pfc.7
        for <openembedded-core@lists.openembedded.org>;
 Sun, 19 Jun 2022 12:35:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=1f2NpFwHAU/vX+tBhekGqxELikj9PqXbvYEwAALtMDM=;
        b=g1BnSzN8FH8Qjjz+iYxNNr8xzIeLR0qkJ0flZRGLsFW+QW5t34Np5+DqtG+RVMP/X7
         /cTX6lEjwYVjAjFD0l87t2ojvUQbclE/fno7zH9fjj7bgo2KzicMYNd26asSO7U7gx5S
         48wv4cma3DKl2+8W7eU/jpQ99VWtysZuhPZC2JHf/fL7n/nh7rVxaslI3rGDgR+qZdNX
         Hrn5jrA6mF4+y9Bcpj9OOM/UdkV5vekkEJErVP9mAuEA561iIYB4Q6ckuUYkHHc6ovuS
         Tio15+vRevS2qCwujBtCFj1AulgLolXgooR75zkJ7geYzaVdnyD0OQol07HU9TZUNCe4
         XXew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=1f2NpFwHAU/vX+tBhekGqxELikj9PqXbvYEwAALtMDM=;
        b=472/e1RTtvfvnHHcbNgUMCWDzsqdPaI58RZ6ViMzrRrqut3ic0FHqphLCe0eZhZzks
         G1MunGUUDU754aKB7yPGp9c5vfJm2bq9pgaKx5Py6h7MMUaDxWkKEHQNfawH9A7+55IP
         KamGeneEk0HU/ywCKBwzlyYLiVEAYFQImwLkq1OFrEoF0ydFNB/0Jd4muJ+greXBWgVW
         2r6QBFgT1RKBqf91riI7EO6a4h1eQVwLpgnak+1AbFsDrTKhxe85kUIeZxqx2NJiPznE
         dl1ujSadNZkXW+UohJKRPyMr4Q+y18D7GOupV5seZ+v044mAYvbfB/hFhqo7Dz18HIcV
         1OKg==
X-Gm-Message-State: AJIora/Vpz1kyHdv3aUbcHBtNudIiib/Hc/10622vAR6McPTPKhHH5Rj
	1GLyu8VeFV8gFDcighNlACHZOw4NinjlsUIf
X-Google-Smtp-Source: 
 AGRyM1vVP4EUiPCANRiquoHhHV67ktT7B7H3t08b2cTXf6/xD2a6k3vPX2n0crWuNfEPBYUQz244JA==
X-Received: by 2002:a05:6a00:1946:b0:4fe:309f:d612 with SMTP id
 s6-20020a056a00194600b004fe309fd612mr21096640pfk.10.1655667343225;
        Sun, 19 Jun 2022 12:35:43 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 e5-20020a170902ed8500b001678dcb4c5asm216994plj.100.2022.06.19.12.35.41
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jun 2022 12:35:42 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 12/12] archiver: don't use machine variables in
 shared recipes
Date: Sun, 19 Jun 2022 09:35:06 -1000
Message-Id: 
 <135adeb82c9303c26193bb6f6bd3bc696793aa62.1655667170.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1655667170.git.steve@sakoman.com>
References: <cover.1655667170.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 19 Jun 2022 19:35:47 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167074

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
index 80fa6752be..6ead010fe1 100644
--- a/meta/classes/archiver.bbclass
+++ b/meta/classes/archiver.bbclass
@@ -54,9 +54,10 @@ ARCHIVER_MODE[mirror] ?= "split"
 
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
@@ -100,6 +101,10 @@ python () {
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


