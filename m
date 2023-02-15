Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9809C6379F
	for <webhook@archiver.kernel.org>; Wed, 15 Feb 2023 13:01:17 +0000 (UTC)
Received: from mail-il1-f172.google.com (mail-il1-f172.google.com [209.85.166.172])
 by mx.groups.io with SMTP id smtpd.web11.14292.1676466075140186220
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Feb 2023 05:01:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=CjEE+Q+z;
 spf=pass (domain: gmail.com, ip: 209.85.166.172, mailfrom: quaresma.jose@gmail.com)
Received: by mail-il1-f172.google.com with SMTP id g14so746863ild.8
        for <openembedded-core@lists.openembedded.org>; Wed, 15 Feb 2023 05:01:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KuscZfD9DZDoYOPCbGYij04NaXwZyKfHZeJp5a4brGM=;
        b=CjEE+Q+z+5ikcuO8jhfmSzMPVUELDmoKO8imXfdPCcol1IuIZggk4M4Sj82rofdB5F
         E/nFdvlKNAdski5Te239y7Ok93wvJvNX9pwlzix3uO4Jbh0HfTyt4dnOrBiORT2r7Y3v
         x5Qa8NMsmC6nlmVsqcRbcqPslie77+QNZkBg6wX3/ktK1qg1L5X9wXHbTnT7DJu5kzbk
         BoHHqEiiwRD4yjavL5tCvDw4zf/evQHpeU/gqHI5/fEkuTGYaoClKNzoisWFDpBsPfdC
         nqqNGhP5nrulh9lkG1mRYgpz5RfKmyKieTNK/3zA45l4dhzTvuN49guBBXH5Rw9veo/A
         GfUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KuscZfD9DZDoYOPCbGYij04NaXwZyKfHZeJp5a4brGM=;
        b=E/IszeYH3XGRoL+Vcpv5L1jfQEU3Hyy6jwYHB6fg7MJglJo7CWP/xVi74MU9hvCa8G
         RroPhagtG5x9zsVK1WZaQMk6QtKO2Wb3/WTlTBnYFS0qLoe/1x9wI8HcSMxqHMBGCYQ+
         XEFF4kMa8kk9L/8oyUcHsqBerUgV4beVjt++KP1r9m48GoxPow5gCGnL2PV5Ir0L/DTH
         7M618MMc4CylWaAwewEbFWcnGWB2qTQUnUUsAuQDKE2JZG7i2bnoiALpzIWNsoWFNRjg
         K3GOophoQQdkTBPG+u77BpJ4pTEQeqeJzLgHBM/xC4yd3kQokGQM8JLPlCT/TMnKVplN
         uUuw==
X-Gm-Message-State: AO0yUKWPSe2tHLnZiuHpwrmoe5FNTP6phy5RmwvtdKxJxl5aJz17ZhSC
	uNKKX5x8yT5hfwyk1VrFMu6NUMIYeMo=
X-Google-Smtp-Source: AK7set9fCZIdD4BxQzj/xPUBUvo8or81E2GRwHLrqe4423XQm+neehEsC/QB7WleX/LXecPTpH03iw==
X-Received: by 2002:a05:6e02:1a2e:b0:315:3fe4:1d0a with SMTP id g14-20020a056e021a2e00b003153fe41d0amr1832133ile.0.1676466074159;
        Wed, 15 Feb 2023 05:01:14 -0800 (PST)
Received: from og-worker-dev-01.infra.foundries.io.net (51-159-19-113.rev.poneytelecom.eu. [51.159.19.113])
        by smtp.gmail.com with ESMTPSA id u11-20020a92cccb000000b00313f569a0f6sm5570818ilq.40.2023.02.15.05.01.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Feb 2023 05:01:13 -0800 (PST)
From: Jose Quaresma <quaresma.jose@gmail.com>
X-Google-Original-From: Jose Quaresma <jose.quaresma@foundries.io>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <jose.quaresma@foundries.io>
Subject: [OE-core][PATCH 1/2] kernel-module-split: make autoload and probeconf distribution specific
Date: Wed, 15 Feb 2023 13:00:56 +0000
Message-Id: <20230215130057.1923450-1-jose.quaresma@foundries.io>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Feb 2023 13:01:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177186

The modules-load.d [1] - Configure kernel modules to load at boot
should install their configuration files in /usr/lib/modules-load.d.

The modprobe.d [2] - Configuration directory for modprobe
should install their configuration files in /lib/modprobe.d

[1] https://www.freedesktop.org/software/systemd/man/modules-load.d.html
[2] https://www.man7.org/linux/man-pages//man5/modprobe.d.5.html

Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
---
 .../kernel-module-split.bbclass               | 30 +++++++++----------
 1 file changed, 14 insertions(+), 16 deletions(-)

diff --git a/meta/classes-recipe/kernel-module-split.bbclass b/meta/classes-recipe/kernel-module-split.bbclass
index 50882c31a7..b70650888a 100644
--- a/meta/classes-recipe/kernel-module-split.bbclass
+++ b/meta/classes-recipe/kernel-module-split.bbclass
@@ -31,7 +31,8 @@ fi
 PACKAGE_WRITE_DEPS += "kmod-native depmodwrapper-cross"
 
 do_install:append() {
-	install -d ${D}${sysconfdir}/modules-load.d/ ${D}${sysconfdir}/modprobe.d/
+	install -d ${D}${libdir}/modules-load.d
+	install -d ${D}${nonarch_base_libdir}/modprobe.d
 }
 
 KERNEL_SPLIT_MODULES ?= "1"
@@ -93,8 +94,9 @@ python split_kernel_module_packages () {
 
         dvar = d.getVar('PKGD')
 
-        # If autoloading is requested, output /etc/modules-load.d/<name>.conf and append
+        # If autoloading is requested, output ${libdir}/modules-load.d/<name>.conf and append
         # appropriate modprobe commands to the postinst
+        autoloadpath = '%s/modules-load.d/%s.conf' % (d.getVar('libdir'), basename)
         autoloadlist = (d.getVar("KERNEL_MODULE_AUTOLOAD") or "").split()
         autoload = d.getVar('module_autoload_%s' % basename)
         if autoload and autoload == basename:
@@ -102,8 +104,7 @@ python split_kernel_module_packages () {
         if autoload and basename not in autoloadlist:
             bb.warn("module_autoload_%s is defined but '%s' isn't included in KERNEL_MODULE_AUTOLOAD, please add it there" % (basename, basename))
         if basename in autoloadlist:
-            name = '%s/etc/modules-load.d/%s.conf' % (dvar, basename)
-            f = open(name, 'w')
+            f = open("%s%s" % (dvar, autoloadpath), 'w')
             if autoload:
                 for m in autoload.split():
                     f.write('%s\n' % m)
@@ -117,23 +118,19 @@ python split_kernel_module_packages () {
             d.setVar('pkg_postinst:%s' % pkg, postinst)
 
         # Write out any modconf fragment
+        modconfpath = '%s/modprobe.d/%s.conf' % (d.getVar('nonarch_base_libdir'), basename)
         modconflist = (d.getVar("KERNEL_MODULE_PROBECONF") or "").split()
         modconf = d.getVar('module_conf_%s' % basename)
         if modconf and basename in modconflist:
-            name = '%s/etc/modprobe.d/%s.conf' % (dvar, basename)
-            f = open(name, 'w')
+            f = open("%s%s" % (dvar, modconfpath), 'w')
             f.write("%s\n" % modconf)
             f.close()
         elif modconf:
             bb.error("Please ensure module %s is listed in KERNEL_MODULE_PROBECONF since module_conf_%s is set" % (basename, basename))
 
-        files = d.getVar('FILES:%s' % pkg)
-        files = "%s /etc/modules-load.d/%s.conf /etc/modprobe.d/%s.conf" % (files, basename, basename)
-        d.setVar('FILES:%s' % pkg, files)
-
-        conffiles = d.getVar('CONFFILES:%s' % pkg)
-        conffiles = "%s /etc/modules-load.d/%s.conf /etc/modprobe.d/%s.conf" % (conffiles, basename, basename)
-        d.setVar('CONFFILES:%s' % pkg, conffiles)
+        appendfiles = " %s %s" % (autoloadpath, modconfpath)
+        d.appendVar('FILES:%s' % pkg, appendfiles)
+        d.appendVar('CONFFILES:%s' % pkg, appendfiles)
 
         if "description" in vals:
             old_desc = d.getVar('DESCRIPTION:' + pkg) or ""
@@ -167,10 +164,11 @@ python split_kernel_module_packages () {
     splitmods = d.getVar('KERNEL_SPLIT_MODULES')
     postinst = d.getVar('pkg_postinst:modules')
     postrm = d.getVar('pkg_postrm:modules')
+    nonarch_base_libdir = d.getVar("nonarch_base_libdir")
+    libdir = d.getVar("libdir")
 
     if splitmods != '1':
-        etcdir = d.getVar('sysconfdir')
-        d.appendVar('FILES:' + metapkg, '%s/modules-load.d/ %s/modprobe.d/ %s/modules/' % (etcdir, etcdir, d.getVar("nonarch_base_libdir")))
+        d.appendVar('FILES:' + metapkg, '%s/modules-load.d/ %s/modprobe.d/ %s/modules/' % (libdir, nonarch_base_libdir, nonarch_base_libdir))
         d.appendVar('pkg_postinst:%s' % metapkg, postinst)
         d.prependVar('pkg_postrm:%s' % metapkg, postrm);
         return
@@ -189,7 +187,7 @@ python split_kernel_module_packages () {
     # avoid warnings. removedirs only raises an OSError if an empty
     # directory cannot be removed.
     dvar = d.getVar('PKGD')
-    for dir in ["%s/etc/modprobe.d" % (dvar), "%s/etc/modules-load.d" % (dvar), "%s/etc" % (dvar)]:
+    for dir in ["%s%s/modprobe.d" % (dvar, nonarch_base_libdir), "%s%s/modules-load.d" % (dvar, libdir)]:
         if len(os.listdir(dir)) == 0:
             os.rmdir(dir)
 }
-- 
2.34.1


