Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14B2EEB64DC
	for <webhook@archiver.kernel.org>; Mon, 19 Jun 2023 23:18:17 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web10.21910.1687216696115013199
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 Jun 2023 16:18:16 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=HlYdxVZn;
 spf=pass (domain: gmail.com, ip: 209.85.128.44, mailfrom: quaresma.jose@gmail.com)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-3f9b4a71623so8398705e9.1
        for <openembedded-core@lists.openembedded.org>; Mon, 19 Jun 2023 16:18:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687216694; x=1689808694;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RN6PgcgYI/ocOW7VGiGyvvuiMsEVufaEotoad72l6Bs=;
        b=HlYdxVZnh5HRbAVD2hvNLxcfnIzkvL3jo820RSY4P5z+kH+NGgL9QHvyTla44tdmuV
         H4axoBMoNNQSprPeFCsP9Bzdv3CFJPh2UlwA+8XmK5e7JVcN10YVoxJRscZOekdSFm6J
         uI/114WcQeZYoEal36u1+urNaWfSmwu0Ouzc55VBuYPGirHD2LdEecShB7wurQY8j8fs
         tTy3a7BKXuaJeL/gfOdJybT9wcdq+3w1aiRlT894BtbEaPS/QIdcyux02BqqFplkfqTd
         s/1qjFuacwYCoQlUjV1xFxhOemh3IlR6Z6zsBBct01xlEI3rnUqgHiDI21bCNVzAZofp
         XWKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687216694; x=1689808694;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RN6PgcgYI/ocOW7VGiGyvvuiMsEVufaEotoad72l6Bs=;
        b=egw1tqDIVjxw7LWIkorHFO+hLlm/lD4UrQ3d31KNIIWDkPJkRjfNNZvPVspzh2TUyZ
         tc3T5iB2g4X0CbnPjw+vgvC7AXU0AqNK9Ab651Sx0MpcFSjBJnLQ9LqBzkNgJUDLnOcL
         HvXGW7qlXg/HgdlAtVZmNHIBJ3/0Gfn2y+INbirvSGhVCTeGZkrPlfbgybNNB1HFZBui
         xFwBsGE9kNfFhqhf1PnSyd8EMmPA9WO7e9WwNhiuGqOTmLjez96goX81SYYKj6KqqVrK
         lY7/UGW9hVbZ3sTguhxX0YfRepu+z4c8puAZnnXs9pZ4yT0GQ0MjluullUJPhxx6ANY0
         iJDA==
X-Gm-Message-State: AC+VfDyUuMn2mpNjYITQ+WIHaP1fF7mx6syOXpRVm6k4zcTLqT57UpUS
	v2X8D2KNbuMqhgRFgmQaRMkYHtGRwNw=
X-Google-Smtp-Source: ACHHUZ7iyPbw3P35BP1hQ1lhHcAAPJdJNpzb7g900BudeWnGkis9SJbqwS1D4Tj77CT6mcuLN5vIaw==
X-Received: by 2002:a5d:660f:0:b0:311:e41:d71d with SMTP id n15-20020a5d660f000000b003110e41d71dmr6745780wru.28.1687216693051;
        Mon, 19 Jun 2023 16:18:13 -0700 (PDT)
Received: from og-worker-dev-01.infra.foundries.io.net (51-159-19-113.rev.poneytelecom.eu. [51.159.19.113])
        by smtp.gmail.com with ESMTPSA id k18-20020adfe8d2000000b0030ae3a6be4asm615610wrn.72.2023.06.19.16.18.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jun 2023 16:18:12 -0700 (PDT)
From: Jose Quaresma <quaresma.jose@gmail.com>
X-Google-Original-From: Jose Quaresma <jose.quaresma@foundries.io>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <jose.quaresma@foundries.io>,
	Ola x Nilsson <Ola.x.Nilsson@axis.com>,
	Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Subject: [PATCH V2 1/2] kernel-module-split: make autoload and probeconf distribution specific
Date: Mon, 19 Jun 2023 23:13:43 +0000
Message-Id: <20230619231343.1683736-1-jose.quaresma@foundries.io>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 19 Jun 2023 23:18:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183123

The modules-load.d [1] - Configure kernel modules to load at boot
should install their configuration files in /usr/lib/modules-load.d.

The modprobe.d [2] - Configuration directory for modprobe
should install their configuration files in /lib/modprobe.d

[1] https://www.freedesktop.org/software/systemd/man/modules-load.d.html
[2] https://www.man7.org/linux/man-pages//man5/modprobe.d.5.html

[YOCTO #12212] https://bugzilla.yoctoproject.org/show_bug.cgi?id=12212

CC: Ola x Nilsson <Ola.x.Nilsson@axis.com>
CC: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
---

V2: use the same location as before on the class and define the new
location just for systemd.

 .../kernel-module-split.bbclass               | 30 +++++++++----------
 .../distro/include/init-manager-systemd.inc   |  4 +++
 2 files changed, 18 insertions(+), 16 deletions(-)

diff --git a/meta/classes-recipe/kernel-module-split.bbclass b/meta/classes-recipe/kernel-module-split.bbclass
index 50882c31a7..ee14bb6910 100644
--- a/meta/classes-recipe/kernel-module-split.bbclass
+++ b/meta/classes-recipe/kernel-module-split.bbclass
@@ -30,8 +30,11 @@ fi
 
 PACKAGE_WRITE_DEPS += "kmod-native depmodwrapper-cross"
 
+modulesloaddir ??= "${sysconfdir}/modules-load.d"
+modprobedir ??= "${sysconfdir}/modprobe.d"
+
 do_install:append() {
-	install -d ${D}${sysconfdir}/modules-load.d/ ${D}${sysconfdir}/modprobe.d/
+	install -d ${D}${modulesloaddir} ${D}${modprobedir}
 }
 
 KERNEL_SPLIT_MODULES ?= "1"
@@ -93,8 +96,9 @@ python split_kernel_module_packages () {
 
         dvar = d.getVar('PKGD')
 
-        # If autoloading is requested, output /etc/modules-load.d/<name>.conf and append
+        # If autoloading is requested, output ${modulesloaddir}/<name>.conf and append
         # appropriate modprobe commands to the postinst
+        autoloadpath = '%s/%s.conf' % (d.getVar('modulesloaddir'), basename)
         autoloadlist = (d.getVar("KERNEL_MODULE_AUTOLOAD") or "").split()
         autoload = d.getVar('module_autoload_%s' % basename)
         if autoload and autoload == basename:
@@ -102,8 +106,7 @@ python split_kernel_module_packages () {
         if autoload and basename not in autoloadlist:
             bb.warn("module_autoload_%s is defined but '%s' isn't included in KERNEL_MODULE_AUTOLOAD, please add it there" % (basename, basename))
         if basename in autoloadlist:
-            name = '%s/etc/modules-load.d/%s.conf' % (dvar, basename)
-            f = open(name, 'w')
+            f = open("%s%s" % (dvar, autoloadpath), 'w')
             if autoload:
                 for m in autoload.split():
                     f.write('%s\n' % m)
@@ -117,23 +120,19 @@ python split_kernel_module_packages () {
             d.setVar('pkg_postinst:%s' % pkg, postinst)
 
         # Write out any modconf fragment
+        modconfpath = '%s/%s.conf' % (d.getVar('modprobedir'), basename)
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
@@ -169,8 +168,7 @@ python split_kernel_module_packages () {
     postrm = d.getVar('pkg_postrm:modules')
 
     if splitmods != '1':
-        etcdir = d.getVar('sysconfdir')
-        d.appendVar('FILES:' + metapkg, '%s/modules-load.d/ %s/modprobe.d/ %s/modules/' % (etcdir, etcdir, d.getVar("nonarch_base_libdir")))
+        d.appendVar('FILES:' + metapkg, '%s/ %s/ %s/modules/' % (modulesloaddir, modprobedir, d.getVar("nonarch_base_libdir")))
         d.appendVar('pkg_postinst:%s' % metapkg, postinst)
         d.prependVar('pkg_postrm:%s' % metapkg, postrm);
         return
@@ -189,7 +187,7 @@ python split_kernel_module_packages () {
     # avoid warnings. removedirs only raises an OSError if an empty
     # directory cannot be removed.
     dvar = d.getVar('PKGD')
-    for dir in ["%s/etc/modprobe.d" % (dvar), "%s/etc/modules-load.d" % (dvar), "%s/etc" % (dvar)]:
+    for dir in ["%s%s" % (dvar, modprobedir), "%s%s" % (dvar, modulesloaddir)]:
         if len(os.listdir(dir)) == 0:
             os.rmdir(dir)
 }
diff --git a/meta/conf/distro/include/init-manager-systemd.inc b/meta/conf/distro/include/init-manager-systemd.inc
index 7867d90028..fc13089764 100644
--- a/meta/conf/distro/include/init-manager-systemd.inc
+++ b/meta/conf/distro/include/init-manager-systemd.inc
@@ -5,3 +5,7 @@ VIRTUAL-RUNTIME_init_manager ??= "systemd"
 VIRTUAL-RUNTIME_initscripts ??= "systemd-compat-units"
 VIRTUAL-RUNTIME_login_manager ??= "shadow-base"
 VIRTUAL-RUNTIME_dev_manager ??= "systemd"
+
+# use autoload and probeconf distribution specific
+modulesloaddir ?= "${libdir}/modules-load.d"
+modprobedir ?= "${nonarch_base_libdir}/modprobe.d"
-- 
2.34.1


