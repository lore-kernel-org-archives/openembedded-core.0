Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6EC9CD484E
	for <webhook@archiver.kernel.org>; Wed,  4 Sep 2024 14:46:38 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web10.52099.1725461195123083838
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Sep 2024 07:46:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=NrOXkTx8;
 spf=pass (domain: gmail.com, ip: 209.85.221.45, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-374c326c638so2697635f8f.2
        for <openembedded-core@lists.openembedded.org>; Wed, 04 Sep 2024 07:46:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725461193; x=1726065993; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kjkF9g6DUxf5REm+S70+JiQfdD5TBjNXgENvgH/krso=;
        b=NrOXkTx8lPq75X0q5uncHVtIPSojQmGafMCD8dwuHVe82EQa1tC3Eq8sLX/m4PG42r
         25t+BKmmMEVuME7+/hCGiNIiWYw3LtwygE9r5vLz6p6PiAB3dqTd2YGe67/Xx+xYzb6L
         cHSVinM3DB9on/fF8VpYcHJy5KUDsXRwWJVHCsJBasOmzIftVd8e5G0ilXZuSEehOoeQ
         WO8RYe5np1cWiklgkukARLr2VrzV9Lh2oqDUexsSzcmpa9pgSfsj1lr6HZg0fyG7roLm
         wHWI6niYy4kTn+v0GJnM7N4rhBMQ+oO5hEudRKFalOqVmU+sp1YhRxkJEobTYgEV6Ssa
         9/bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725461193; x=1726065993;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kjkF9g6DUxf5REm+S70+JiQfdD5TBjNXgENvgH/krso=;
        b=LBuv7x5HTtk11TGFpX0v3pjsk4m5XKy8H3wPCH9uqzWGt2958N3u2iF6TjskgvzJUk
         xWm5xCfljXeVLgep1reKAd2Ebca12hRLvyAoSBuYDDBGk00okQp+kX+sKN5ROFKqV/mq
         0jJo3dqPcs/1xsqskiUUnw7O3nEflmjzas0ORbSs7FE66zcmBnI5FBJfs/e5bZwL954J
         UxvG2zdQhPGW4iKqj7EjkwDQSN5y3Q/SH3rZsBkTjzbNOpaB639rj8Yli9sQmYq0pQM2
         FKWX3Nys0rWDNJVOxs+F4proeXGIpuCVi4hi2PzuWDm5Ar9fQ+eAEDl3fTIJ6m6RylHU
         XxqA==
X-Gm-Message-State: AOJu0YzBgy+CVodZqEMjD8oJkJNuCoJYF9OKPcrWbuoz/3k6N7LL60Jn
	XjtOi2WlLxJHZW4ywbSBn9YkbsQFbDMU7/Mt8QXyyrXdEecr8Mu9YfjtAw==
X-Google-Smtp-Source: AGHT+IEiikudKCyqfbY1dMJvC2TdXUrkiVPpMybdamgzE8ydJLq6sH0gw7aNsB0ZylhRk18f/Zmzfw==
X-Received: by 2002:adf:fe03:0:b0:367:8a00:fac3 with SMTP id ffacd0b85a97d-374bf1693femr8465286f8f.30.1725461192471;
        Wed, 04 Sep 2024 07:46:32 -0700 (PDT)
Received: from wsadrian16.fritz.box ([2a02:169:59a6:0:55c4:f628:91f3:4287])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42bb6deb1ebsm206091305e9.3.2024.09.04.07.46.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Sep 2024 07:46:32 -0700 (PDT)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH] cml1: add do_savedefconfig
Date: Wed,  4 Sep 2024 16:46:21 +0200
Message-ID: <20240904144621.59506-1-adrian.freihofer@gmail.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Sep 2024 14:46:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204210

From: Adrian Freihofer <adrian.freihofer@siemens.com>

Move the do_savedefconfig task definition from u-boot and kernel to
cml1.bbclass. There are more recipes which use the kbuild framework and
benefit from a do_savedefconfig task.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 meta/classes-recipe/cml1.bbclass   | 7 +++++++
 meta/classes-recipe/kernel.bbclass | 7 -------
 meta/recipes-bsp/u-boot/u-boot.inc | 6 ------
 3 files changed, 7 insertions(+), 13 deletions(-)

diff --git a/meta/classes-recipe/cml1.bbclass b/meta/classes-recipe/cml1.bbclass
index 03e5fe6f472..8c207daec41 100644
--- a/meta/classes-recipe/cml1.bbclass
+++ b/meta/classes-recipe/cml1.bbclass
@@ -113,3 +113,10 @@ do_showconfig() {
 }
 do_showconfig[nostamp] = "1"
 addtask showconfig after do_configure
+
+do_savedefconfig() {
+	bbplain "Saving defconfig to:\n${B}/defconfig"
+	oe_runmake -C ${B} savedefconfig
+}
+do_savedefconfig[nostamp] = "1"
+addtask savedefconfig after do_configure
diff --git a/meta/classes-recipe/kernel.bbclass b/meta/classes-recipe/kernel.bbclass
index cdcc5e00320..a7c4bf0ef41 100644
--- a/meta/classes-recipe/kernel.bbclass
+++ b/meta/classes-recipe/kernel.bbclass
@@ -689,13 +689,6 @@ kernel_do_configure() {
 	${KERNEL_CONFIG_COMMAND}
 }
 
-do_savedefconfig() {
-	bbplain "Saving defconfig to:\n${B}/defconfig"
-	oe_runmake -C ${B} savedefconfig
-}
-do_savedefconfig[nostamp] = "1"
-addtask savedefconfig after do_configure
-
 inherit cml1 pkgconfig
 
 # Need LD, HOSTLDFLAGS and more for config operations
diff --git a/meta/recipes-bsp/u-boot/u-boot.inc b/meta/recipes-bsp/u-boot/u-boot.inc
index ed3822784ef..9100964c73e 100644
--- a/meta/recipes-bsp/u-boot/u-boot.inc
+++ b/meta/recipes-bsp/u-boot/u-boot.inc
@@ -31,12 +31,6 @@ UBOOT_INITIAL_ENV ?= "${PN}-initial-env"
 
 require u-boot-configure.inc
 
-do_savedefconfig() {
-	bbplain "Saving defconfig to:\n${B}/defconfig"
-	oe_runmake -C ${B} savedefconfig
-}
-do_savedefconfig[nostamp] = "1"
-addtask savedefconfig after do_configure
 UBOOT_ARCH_DIR = "${@'arm' if d.getVar('UBOOT_ARCH').startswith('arm') else d.getVar('UBOOT_ARCH')}"
 do_compile () {
     if [ "${@bb.utils.filter('DISTRO_FEATURES', 'ld-is-gold', d)}" ]; then
-- 
2.46.0


