Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D4E0EB64D7
	for <webhook@archiver.kernel.org>; Tue, 20 Jun 2023 22:22:49 +0000 (UTC)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
 by mx.groups.io with SMTP id smtpd.web10.3216.1687299762979654673
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Jun 2023 15:22:43 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=cNOUDrsg;
 spf=pass (domain: gmail.com, ip: 209.85.167.43, mailfrom: quaresma.jose@gmail.com)
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-4f8735ac3e3so3721035e87.2
        for <openembedded-core@lists.openembedded.org>; Tue, 20 Jun 2023 15:22:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687299761; x=1689891761;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tT112n1TQ/kg4iecmwwSDhFFp4mfh675fOUpFoZunoo=;
        b=cNOUDrsgWqG6LNlzSqKLvOAbKdifIGsCbjEQumeoyQmOnMlTqZj8giQqC8YWlf9w3E
         SbjbYfUhVcWw8+wV8FtO2510Hlq66Ggepk9NEH4wOOTkQrCjEEkxJsYJiOm/4p0yJQLw
         8RO50PxzGXnB533M65EVJz8huCIu0iZ+7eCltvqK4d7YsRSLCcLJCxnMFycqB//1QYHN
         ATf5oZPt9rBvyByflILWh4WbyZEoOr1rNU+ZTY4D2SzJJ0y8L6Z4Zl3FfNMV+rNZIMUF
         EzooN2CEdVrGgJlovtvE0Bh+Lc05EutpVrLkmM5+z4JUgP5TQYFdLWTb4oczhG9I/VQk
         iCVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687299761; x=1689891761;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tT112n1TQ/kg4iecmwwSDhFFp4mfh675fOUpFoZunoo=;
        b=LofVYJdxzUSSxEXP7nLdPNRYNDz3MjbmPHtqPLZqydp2C6WLyNv+WytrGp023GZwAh
         NObGzZP4EKqTo1vyz36IGXICUnqBU8NMfvMaZGfyHNIyXx7Q8IClnb//avsy+XOok7m5
         wUEamgEPdUfLqvFMC1FrSvST9l1S073a0mZEldhVdeE6DhHFSbLOrKzo+fNFL3EOCqSm
         joI/FdnOLwJiJqr0+AYkz8B3BifNX2zLc1TH4WHUkqp6beBXNOO99B+1+28V3plcslfd
         Kegn6UQLLP8xlRNUr57Us0bke/+OtqQsn3M6ZWWxGj3LthX8DwspDbYlGX1fQeYmW1nV
         3IYg==
X-Gm-Message-State: AC+VfDwOTY85LvlfswWse0g0eAjRwh02TDt2oJBGHlFI0/3ZuTqptLlr
	Fjm9bBLZjKEv2X4ecOWEX/F1XNxoBQ2mOKuV
X-Google-Smtp-Source: ACHHUZ6HNJRb9H3YSHNPKKOnnFei5YuMRncalU/+bxUA52zLJUaWVprdwuR41b7E3J3vfWtwSzFgkA==
X-Received: by 2002:a19:ca04:0:b0:4f8:5960:49a9 with SMTP id a4-20020a19ca04000000b004f8596049a9mr6934427lfg.23.1687299760612;
        Tue, 20 Jun 2023 15:22:40 -0700 (PDT)
Received: from og-worker-dev-01.infra.foundries.io.net (51-159-19-113.rev.poneytelecom.eu. [51.159.19.113])
        by smtp.gmail.com with ESMTPSA id l13-20020a1c790d000000b003f7ed463954sm3302928wme.25.2023.06.20.15.22.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jun 2023 15:22:40 -0700 (PDT)
From: Jose Quaresma <quaresma.jose@gmail.com>
X-Google-Original-From: Jose Quaresma <jose.quaresma@foundries.io>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <jose.quaresma@foundries.io>,
	Ola x Nilsson <Ola.x.Nilsson@axis.com>,
	Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Subject: [PATCH V3 1/3] kernel-module-split: make autoload and probeconf distribution specific
Date: Tue, 20 Jun 2023 22:19:42 +0000
Message-Id: <20230620221942.2801107-1-jose.quaresma@foundries.io>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 20 Jun 2023 22:22:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183158

Also take the oportunity to only add configuration files to FILES
and CONFFILES when they exist and are used.

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

v3: fix v2 build issue and only add configuration files to FILES
and CONFFILES when they exist and are used.

v2: use the same location as before on the class and define the new
location just for systemd.

 .../kernel-module-split.bbclass               | 36 ++++++++++---------
 .../distro/include/init-manager-systemd.inc   |  4 +++
 2 files changed, 23 insertions(+), 17 deletions(-)

diff --git a/meta/classes-recipe/kernel-module-split.bbclass b/meta/classes-recipe/kernel-module-split.bbclass
index 50882c31a7..e7ee6c55be 100644
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
@@ -102,14 +106,16 @@ python split_kernel_module_packages () {
         if autoload and basename not in autoloadlist:
             bb.warn("module_autoload_%s is defined but '%s' isn't included in KERNEL_MODULE_AUTOLOAD, please add it there" % (basename, basename))
         if basename in autoloadlist:
-            name = '%s/etc/modules-load.d/%s.conf' % (dvar, basename)
-            f = open(name, 'w')
+            f = open("%s%s" % (dvar, autoloadpath), 'w')
             if autoload:
                 for m in autoload.split():
                     f.write('%s\n' % m)
             else:
                 f.write('%s\n' % basename)
             f.close()
+            autoloadpath2append = ' %s' % autoloadpath
+            d.appendVar('FILES:%s' % pkg, autoloadpath2append)
+            d.appendVar('CONFFILES:%s' % pkg, autoloadpath2append)
             postinst = d.getVar('pkg_postinst:%s' % pkg)
             if not postinst:
                 bb.fatal("pkg_postinst:%s not defined" % pkg)
@@ -117,24 +123,19 @@ python split_kernel_module_packages () {
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
+            modconfpath2append = ' %s' % modconfpath
+            d.appendVar('FILES:%s' % pkg, modconfpath2append)
+            d.appendVar('CONFFILES:%s' % pkg, modconfpath2append)
         elif modconf:
             bb.error("Please ensure module %s is listed in KERNEL_MODULE_PROBECONF since module_conf_%s is set" % (basename, basename))
 
-        files = d.getVar('FILES:%s' % pkg)
-        files = "%s /etc/modules-load.d/%s.conf /etc/modprobe.d/%s.conf" % (files, basename, basename)
-        d.setVar('FILES:%s' % pkg, files)
-
-        conffiles = d.getVar('CONFFILES:%s' % pkg)
-        conffiles = "%s /etc/modules-load.d/%s.conf /etc/modprobe.d/%s.conf" % (conffiles, basename, basename)
-        d.setVar('CONFFILES:%s' % pkg, conffiles)
-
         if "description" in vals:
             old_desc = d.getVar('DESCRIPTION:' + pkg) or ""
             d.setVar('DESCRIPTION:' + pkg, old_desc + "; " + vals["description"])
@@ -167,10 +168,11 @@ python split_kernel_module_packages () {
     splitmods = d.getVar('KERNEL_SPLIT_MODULES')
     postinst = d.getVar('pkg_postinst:modules')
     postrm = d.getVar('pkg_postrm:modules')
+    modulesloaddir = d.getVar('modulesloaddir')
+    modprobedir = d.getVar('modprobedir')
 
     if splitmods != '1':
-        etcdir = d.getVar('sysconfdir')
-        d.appendVar('FILES:' + metapkg, '%s/modules-load.d/ %s/modprobe.d/ %s/modules/' % (etcdir, etcdir, d.getVar("nonarch_base_libdir")))
+        d.appendVar('FILES:' + metapkg, '%s %s %s/modules' % (modulesloaddir, modprobedir, d.getVar("nonarch_base_libdir")))
         d.appendVar('pkg_postinst:%s' % metapkg, postinst)
         d.prependVar('pkg_postrm:%s' % metapkg, postrm);
         return
@@ -189,7 +191,7 @@ python split_kernel_module_packages () {
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


