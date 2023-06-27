Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB87CC0015E
	for <webhook@archiver.kernel.org>; Tue, 27 Jun 2023 10:17:46 +0000 (UTC)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
 by mx.groups.io with SMTP id smtpd.web10.9630.1687861059764761934
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Jun 2023 03:17:40 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=Nxogm55t;
 spf=pass (domain: gmail.com, ip: 209.85.167.52, mailfrom: quaresma.jose@gmail.com)
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-4fb7769f15aso2719950e87.0
        for <openembedded-core@lists.openembedded.org>; Tue, 27 Jun 2023 03:17:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687861057; x=1690453057;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Xa6cWTwkOVYMf5l8foHZC1PXwc3btdaruKtqtQj3cqA=;
        b=Nxogm55tj91rwWuyp7xMaINNNx4vVMGEIezZMALyADkQUIZbHLjqAK4BE+ofJ0V9LS
         czxOB/mUwbPkqx8JUskT9eiMN2IC521F/bdgixMwNDjhF3i3/cWgYbXox1wK1hQ+ngDW
         1/EKqfhGgB/wbNu8etujbcN7V/5F1gtHqhBxQmpNTXrU8eeJ9imcOTyKXKtgE4cP3d8+
         PDh1DMsQYs74vWUd2CVJk+7Dc6yNHJwauGE1SYucVGgCsCuvDj5ega1Inq8a8pDWqj59
         5jOoapa8kW57jIftSiTR6At+6aQyNAV7v6mYEF24UiWv09yDMAcu+4a7q+5jnwHDfq0Y
         9uUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687861057; x=1690453057;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Xa6cWTwkOVYMf5l8foHZC1PXwc3btdaruKtqtQj3cqA=;
        b=M7kUQczf6hsE4FdTRL3dPGoThRVwqtVPbjAAVTjFzusx8+JCv0RY479YzTypZQOV/A
         BBWdyRaAh5VsMjT5k4Lv8TOIjc4BDJZG1qiNdY9Hy+KIaZW6aTdKkedC5wXpazMcKDFN
         dnudfm1BahAyE7XVkeWN6gPYNTyCAIDAOFU9WwGcRkXFJ9nxZT5hGOvFb4Yy3S2oU4VJ
         G/qF4etZR0lK6QzvDAfmb8u8sSiqbq64D9xa8J4FCeeZ1DDTuwleWGClexbuAhlI3hqA
         Tg+GAdEirqx6p2l0zaCCILjfLVrzr74uqcSwhjkhn4XNCqS4lti0iPvKEVHVQ9vJQYRe
         FA0Q==
X-Gm-Message-State: AC+VfDwYcwhvwud99nf35kRIB6A3F6zQRZjpbD2N7jMPEvQPu78bGTsY
	hobcelc3bh0dCSrCLX3RkUSdO0Tik9gZfQ==
X-Google-Smtp-Source: ACHHUZ4Tb2nDzsqUpBf1vrCy5yXXXaOhv5doj0Mq3jGGMBerMCkJjtSQsVbI3HUGfUFs7xsjl/ZQ+Q==
X-Received: by 2002:a05:6512:32a1:b0:4f8:589d:647b with SMTP id q1-20020a05651232a100b004f8589d647bmr17837018lfe.34.1687861057362;
        Tue, 27 Jun 2023 03:17:37 -0700 (PDT)
Received: from og-worker-dev-01.infra.foundries.io.net (51-159-19-113.rev.poneytelecom.eu. [51.159.19.113])
        by smtp.gmail.com with ESMTPSA id s6-20020a5d4ec6000000b0030ae849c70csm9961436wrv.37.2023.06.27.03.17.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jun 2023 03:17:36 -0700 (PDT)
From: Jose Quaresma <quaresma.jose@gmail.com>
X-Google-Original-From: Jose Quaresma <jose.quaresma@foundries.io>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <jose.quaresma@foundries.io>,
	Ola x Nilsson <Ola.x.Nilsson@axis.com>,
	Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Subject: [PATCH 4/5] kernel-module-split: make autoload and probeconf distribution specific
Date: Tue, 27 Jun 2023 10:16:43 +0000
Message-Id: <20230627101644.881715-4-jose.quaresma@foundries.io>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230627101644.881715-1-jose.quaresma@foundries.io>
References: <20230627101644.881715-1-jose.quaresma@foundries.io>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 27 Jun 2023 10:17:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183482

The modules-load.d [1] - Configure kernel modules to load at boot
should install their configuration files in /usr/lib/modules-load.d.

The modprobe.d [2] - Configuration directory for modprobe
should install their configuration files in /lib/modprobe.d

[1] https://man7.org/linux/man-pages/man5/modules-load.d.5.html
[2] https://man7.org/linux/man-pages/man5/modprobe.d.5.html

[YOCTO #12212] https://bugzilla.yoctoproject.org/show_bug.cgi?id=12212

CC: Ola x Nilsson <Ola.x.Nilsson@axis.com>
CC: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
---

v5: slipt out systemd config and removing of unused directories
kernel-module-split: install config modules directories only when they are needed
init-manager-systemd: add modulesloaddir and modprobedir

v4: also remove the sysconfdir when systemd is not used as it causes
QA Issue: linux-yocto: Files/directories were installed but not shipped in any package

v3: fix v2 build issue and only add configuration files to FILES
and CONFFILES when they exist and are used.

v2: use the same location as before on the class and define the new
location just for systemd.

 meta/classes-recipe/kernel-module-split.bbclass | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/meta/classes-recipe/kernel-module-split.bbclass b/meta/classes-recipe/kernel-module-split.bbclass
index c59e10adcd..0e4f9a6ec3 100644
--- a/meta/classes-recipe/kernel-module-split.bbclass
+++ b/meta/classes-recipe/kernel-module-split.bbclass
@@ -30,6 +30,9 @@ fi
 
 PACKAGE_WRITE_DEPS += "kmod-native depmodwrapper-cross"
 
+modulesloaddir ??= "${sysconfdir}/modules-load.d"
+modprobedir ??= "${sysconfdir}/modprobe.d"
+
 KERNEL_SPLIT_MODULES ?= "1"
 PACKAGESPLITFUNCS =+ "split_kernel_module_packages"
 
@@ -88,7 +91,7 @@ python split_kernel_module_packages () {
 
         dvar = d.getVar('PKGD')
 
-        # If autoloading is requested, output /etc/modules-load.d/<name>.conf and append
+        # If autoloading is requested, output ${modulesloaddir}/<name>.conf and append
         # appropriate modprobe commands to the postinst
         autoloadlist = (d.getVar("KERNEL_MODULE_AUTOLOAD") or "").split()
         autoload = d.getVar('module_autoload_%s' % basename)
@@ -97,7 +100,7 @@ python split_kernel_module_packages () {
         if autoload and basename not in autoloadlist:
             bb.warn("module_autoload_%s is defined but '%s' isn't included in KERNEL_MODULE_AUTOLOAD, please add it there" % (basename, basename))
         if basename in autoloadlist:
-            conf = '/etc/modules-load.d/%s.conf' % basename
+            conf = '%s/%s.conf' % (d.getVar('modulesloaddir'), basename)
             name = '%s%s' % (dvar, conf)
             os.makedirs(os.path.dirname(name), exist_ok=True)
             with open(name, 'w') as f:
@@ -119,7 +122,7 @@ python split_kernel_module_packages () {
         modconflist = (d.getVar("KERNEL_MODULE_PROBECONF") or "").split()
         modconf = d.getVar('module_conf_%s' % basename)
         if modconf and basename in modconflist:
-            conf = '/etc/modprobe.d/%s.conf' % basename
+            conf = '%s/%s.conf' % (d.getVar('modprobedir'), basename)
             name = '%s%s' % (dvar, conf)
             os.makedirs(os.path.dirname(name), exist_ok=True)
             with open(name, 'w') as f:
@@ -165,8 +168,8 @@ python split_kernel_module_packages () {
     postrm = d.getVar('pkg_postrm:modules')
 
     if splitmods != '1':
-        etcdir = d.getVar('sysconfdir')
-        d.appendVar('FILES:' + metapkg, '%s/modules-load.d/ %s/modprobe.d/ %s/modules/' % (etcdir, etcdir, d.getVar("nonarch_base_libdir")))
+        d.appendVar('FILES:' + metapkg, '%s %s %s/modules' %
+            (d.getVar('modulesloaddir'), d.getVar('modprobedir'), d.getVar("nonarch_base_libdir")))
         d.appendVar('pkg_postinst:%s' % metapkg, postinst)
         d.prependVar('pkg_postrm:%s' % metapkg, postrm);
         return
-- 
2.34.1


