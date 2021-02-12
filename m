Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
 by mx.groups.io with SMTP id smtpd.web12.2493.1613105655903172873
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Feb 2021 20:54:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=NUAA5+lK;
 spf=pass (domain: gmail.com, ip: 209.85.219.50, mailfrom: champagne.guillaume.c@gmail.com)
Received: by mail-qv1-f50.google.com with SMTP id j13so3681050qvu.10
        for <openembedded-core@lists.openembedded.org>; Thu, 11 Feb 2021 20:54:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=WBgi6XDd93svblHP28bY+uPk16pMMEZIUQ3V+0qcwWU=;
        b=NUAA5+lKinn107s+BSL3gIfOWzpUg8iI0TDANNnoe/TY0/4pvpotcX2kRUdwUJ+Sqi
         T4tycElFdiTs+o2L5caIiECY7OczUJ6hVIcAcDKKeIAByU0TXg/hVhxn2lNp6CtVPWHq
         zL55Fr2FZ7dPyUAS1rBe5SfU1jJBq9WE3Ad9Ge7xeSCqnbDEETKfH9HDZiMB2AkcYJap
         To6kuWOxUwFLJd03YCEyBr1uFFbsLWpC+cSXf0jt3DxD9q3QO/KJqTWGXwaP4HpjJAtZ
         wxoZGEJ4OpB9eqM5GwKoIhwXhI+L5Wo/AVgEtBatn7mWhF7K5nqqXODH2trxMTKoz9nS
         UCbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=WBgi6XDd93svblHP28bY+uPk16pMMEZIUQ3V+0qcwWU=;
        b=MzoNbbeZf2fwmTLRMMjbaX9ZQlD1TnV8X5lIpz6AXCq1qIsLhgYge6qgxmUCXBryjk
         tH67rWxFyZ6Jbl0RwBNAtvGx5cCDtS/cosKBILc7ue3I6Mxj+LkXWDUsUOZw23Yc1Y5o
         zGReQMhQXxQj+fqmg4nethl2w5AIS+sN+ACpdUJq8oSow399xqvuhp70bRH9W/FmgshG
         iHrZU44pk8L65Wr9SnNI9aJKkBAuI4RkSNiUEoDkTtT3NoroZ7zUe6MdQSMatYIJ8BHX
         E1VgcZqIIQOm3zKKahpdaOSTUnn23hUSDkTLSAjDfA52Z4AWoa5bC73rgjGKBmTiMjj3
         YFeA==
X-Gm-Message-State: AOAM532Mi1swITWiDokr9B13ieSRfflhJ7ho6gJRcFjG6vP6xEoMU20w
	Udzkn6qH/gicXOHTrEEAEzayQY28y7Y=
X-Google-Smtp-Source: ABdhPJwH5IVBCC2qOf29bRiyE5yt4ErPOH/3nRT0Sw3S8LJaCq9y1G8Dr/hBB2/TYGf5E+bUGKvQ6A==
X-Received: by 2002:ad4:55e6:: with SMTP id bu6mr1012372qvb.49.1613105654780;
        Thu, 11 Feb 2021 20:54:14 -0800 (PST)
Return-Path: <champagne.guillaume.c@gmail.com>
Received: from gchdesk.Sonatest.net (ipagstaticip-d73c7528-4de5-0861-800b-03d8b15e3869.sdsl.bell.ca. [174.94.156.236])
        by smtp.googlemail.com with ESMTPSA id i6sm4992703qti.30.2021.02.11.20.54.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Feb 2021 20:54:14 -0800 (PST)
From: "Guillaume Champagne" <champagne.guillaume.c@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Guillaume Champagne <champagne.guillaume.c@gmail.com>
Subject: [RFC PATCH 1/2] runqemu: replace qemuboot.conf by qemuboot.json
Date: Thu, 11 Feb 2021 23:53:34 -0500
Message-Id: <20210212045335.16612-2-champagne.guillaume.c@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210212045335.16612-1-champagne.guillaume.c@gmail.com>
References: <20210212045335.16612-1-champagne.guillaume.c@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fixes [YOCTO #12503]

Switch to json format since it is more common than INI style
configuration files within oe-core.

Every key stored can now be a top level item and case on keys no longer
has to be enforced.

Signed-off-by: Guillaume Champagne <champagne.guillaume.c@gmail.com>
---
 meta/classes/qemuboot.bbclass           | 18 +++++------
 meta/lib/oeqa/selftest/cases/runqemu.py |  6 ++--
 scripts/runqemu                         | 40 ++++++++++++-------------
 3 files changed, 32 insertions(+), 32 deletions(-)

diff --git a/meta/classes/qemuboot.bbclass b/meta/classes/qemuboot.bbclass
index 4b7532b304..5437e2a499 100644
--- a/meta/classes/qemuboot.bbclass
+++ b/meta/classes/qemuboot.bbclass
@@ -92,7 +92,7 @@ QB_DRIVE_TYPE ?= "/dev/sd"
 
 inherit image-artifact-names
 
-# Create qemuboot.conf
+# Create qemuboot.json
 addtask do_write_qemuboot_conf after do_rootfs before do_image
 
 def qemuboot_vars(d):
@@ -105,14 +105,13 @@ def qemuboot_vars(d):
 do_write_qemuboot_conf[vardeps] += "${@' '.join(qemuboot_vars(d))}"
 do_write_qemuboot_conf[vardepsexclude] += "TOPDIR"
 python do_write_qemuboot_conf() {
-    import configparser
+    import json
 
-    qemuboot = "%s/%s.qemuboot.conf" % (d.getVar('IMGDEPLOYDIR'), d.getVar('IMAGE_NAME'))
-    qemuboot_link = "%s/%s.qemuboot.conf" % (d.getVar('IMGDEPLOYDIR'), d.getVar('IMAGE_LINK_NAME'))
+    qemuboot = "%s/%s.qemuboot.json" % (d.getVar('IMGDEPLOYDIR'), d.getVar('IMAGE_NAME'))
+    qemuboot_link = "%s/%s.qemuboot.json" % (d.getVar('IMGDEPLOYDIR'), d.getVar('IMAGE_LINK_NAME'))
     finalpath = d.getVar("DEPLOY_DIR_IMAGE")
     topdir = d.getVar('TOPDIR')
-    cf = configparser.ConfigParser()
-    cf.add_section('config_bsp')
+    cf = {}
     for k in sorted(qemuboot_vars(d)):
         # qemu-helper-native sysroot is not removed by rm_work and
         # contains all tools required by runqemu
@@ -125,7 +124,8 @@ python do_write_qemuboot_conf() {
         # and still run them
         if val.startswith(topdir):
             val = os.path.relpath(val, finalpath)
-        cf.set('config_bsp', k, '%s' % val)
+
+        cf[k] = val
 
     # QB_DEFAULT_KERNEL's value of KERNEL_IMAGETYPE is the name of a symlink
     # to the kernel file, which hinders relocatability of the qb conf.
@@ -135,11 +135,11 @@ python do_write_qemuboot_conf() {
     # we only want to write out relative paths so that we can relocate images
     # and still run them
     kernel = os.path.relpath(kernel, finalpath)
-    cf.set('config_bsp', 'QB_DEFAULT_KERNEL', kernel)
+    cf['QB_DEFAULT_KERNEL'] = kernel
 
     bb.utils.mkdirhier(os.path.dirname(qemuboot))
     with open(qemuboot, 'w') as f:
-        cf.write(f)
+        f.write(json.dumps(cf, indent=4))
 
     if qemuboot_link != qemuboot:
         if os.path.lexists(qemuboot_link):
diff --git a/meta/lib/oeqa/selftest/cases/runqemu.py b/meta/lib/oeqa/selftest/cases/runqemu.py
index 7e676bcb41..a20c388d91 100644
--- a/meta/lib/oeqa/selftest/cases/runqemu.py
+++ b/meta/lib/oeqa/selftest/cases/runqemu.py
@@ -117,8 +117,8 @@ SYSLINUX_TIMEOUT = "10"
                 self.assertIn('format=qcow2', f.read(), "Failed: %s" % cmd)
 
     def test_boot_qemu_boot(self):
-        """Test runqemu /path/to/image.qemuboot.conf"""
-        qemuboot_conf = "%s-%s.qemuboot.conf" % (self.recipe, self.machine)
+        """Test runqemu /path/to/image.qemuboot.json"""
+        qemuboot_conf = "%s-%s.qemuboot.json" % (self.recipe, self.machine)
         qemuboot_conf = os.path.join(self.deploy_dir_image, qemuboot_conf)
         if not os.path.exists(qemuboot_conf):
             self.skipTest("%s not found" % qemuboot_conf)
@@ -158,7 +158,7 @@ class QemuTest(OESelftestTestCase):
         cls.machine =  get_bb_var('MACHINE')
         cls.deploy_dir_image =  get_bb_var('DEPLOY_DIR_IMAGE')
         cls.cmd_common = "runqemu nographic"
-        cls.qemuboot_conf = "%s-%s.qemuboot.conf" % (cls.recipe, cls.machine)
+        cls.qemuboot_conf = "%s-%s.qemuboot.json" % (cls.recipe, cls.machine)
         cls.qemuboot_conf = os.path.join(cls.deploy_dir_image, cls.qemuboot_conf)
         bitbake(cls.recipe)
 
diff --git a/scripts/runqemu b/scripts/runqemu
index dd92a64553..d87e0ae99c 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -16,7 +16,7 @@ import re
 import fcntl
 import shutil
 import glob
-import configparser
+import json
 import signal
 
 class RunQemuError(Exception):
@@ -29,8 +29,8 @@ class OEPathError(RunQemuError):
         super().__init__("In order for this script to dynamically infer paths\n \
 kernels or filesystem images, you either need bitbake in your PATH\n \
 or to source oe-init-build-env before running this script.\n\n \
-Dynamic path inference can be avoided by passing a *.qemuboot.conf to\n \
-runqemu, i.e. `runqemu /path/to/my-image-name.qemuboot.conf`\n\n %s" % message)
+Dynamic path inference can be avoided by passing a *.qemuboot.json to\n \
+runqemu, i.e. `runqemu /path/to/my-image-name.qemuboot.json`\n\n %s" % message)
 
 
 def create_logger():
@@ -90,7 +90,7 @@ Examples:
   runqemu
   runqemu qemuarm
   runqemu tmp/deploy/images/qemuarm
-  runqemu tmp/deploy/images/qemux86/<qemuboot.conf>
+  runqemu tmp/deploy/images/qemux86/<qemuboot.json>
   runqemu qemux86-64 core-image-sato ext4
   runqemu qemux86-64 wic-image-minimal wic
   runqemu path/to/bzImage-qemux86.bin path/to/nfsrootdir/ serial
@@ -124,7 +124,7 @@ def get_first_file(cmds):
 
 class BaseConfig(object):
     def __init__(self):
-        # The self.d saved vars from self.set(), part of them are from qemuboot.conf
+        # The self.d saved vars from self.set(), part of them are from qemuboot.json
         self.d = {'QB_KERNEL_ROOT': '/dev/vda'}
 
         # Supported env vars, add it here if a var can be got from env,
@@ -288,8 +288,8 @@ class BaseConfig(object):
 
     def is_deploy_dir_image(self, p):
         if os.path.isdir(p):
-            if not re.search('.qemuboot.conf$', '\n'.join(os.listdir(p)), re.M):
-                logger.debug("Can't find required *.qemuboot.conf in %s" % p)
+            if not re.search('.qemuboot.json$', '\n'.join(os.listdir(p)), re.M):
+                logger.debug("Can't find required *.qemuboot.json in %s" % p)
                 return False
             if not any(map(lambda name: '-image-' in name, os.listdir(p))):
                 logger.debug("Can't find *-image-* in %s" % p)
@@ -329,13 +329,13 @@ class BaseConfig(object):
 
     def check_arg_path(self, p):
         """
-        - Check whether it is <image>.qemuboot.conf or contains <image>.qemuboot.conf
+        - Check whether it is <image>.qemuboot.json or contains <image>.qemuboot.json
         - Check whether is a kernel file
         - Check whether is a image file
         - Check whether it is a nfs dir
         - Check whether it is a OVMF flash file
         """
-        if p.endswith('.qemuboot.conf'):
+        if p.endswith('.qemuboot.json'):
             self.qemuboot = p
             self.qbconfload = True
         elif re.search('\.bin$', p) or re.search('bzImage', p) or \
@@ -358,7 +358,7 @@ class BaseConfig(object):
             if fst:
                 self.check_arg_fstype(fst)
                 qb = re.sub('\.' + fst + "$", '', self.rootfs)
-                qb = '%s%s' % (re.sub('\.rootfs$', '', qb), '.qemuboot.conf')
+                qb = '%s%s' % (re.sub('\.rootfs$', '', qb), '.qemuboot.json')
                 if os.path.exists(qb):
                     self.qemuboot = qb
                     self.qbconfload = True
@@ -862,10 +862,10 @@ class BaseConfig(object):
                 machine = self.get('MACHINE')
                 if not machine:
                     machine = os.path.basename(deploy_dir_image)
-                self.qemuboot = "%s/%s-%s.qemuboot.conf" % (deploy_dir_image,
+                self.qemuboot = "%s/%s-%s.qemuboot.json" % (deploy_dir_image,
                         self.rootfs, machine)
             else:
-                cmd = 'ls -t %s/*.qemuboot.conf' %  deploy_dir_image
+                cmd = 'ls -t %s/*.qemuboot.json' %  deploy_dir_image
                 logger.debug('Running %s...' % cmd)
                 try:
                     qbs = subprocess.check_output(cmd, shell=True).decode('utf-8')
@@ -884,7 +884,7 @@ class BaseConfig(object):
                     self.qbconfload = True
 
         if not self.qemuboot:
-            # If we haven't found a .qemuboot.conf at this point it probably
+            # If we haven't found a .qemuboot.json at this point it probably
             # doesn't exist, continue without
             return
 
@@ -893,19 +893,19 @@ class BaseConfig(object):
 
         logger.debug('CONFFILE: %s' % self.qemuboot)
 
-        cf = configparser.ConfigParser()
-        cf.read(self.qemuboot)
-        for k, v in cf.items('config_bsp'):
-            k_upper = k.upper()
+        with open(self.qemuboot, 'r') as f:
+            cf = json.loads(f.read())
+
+        for k, v in cf.items():
             if v.startswith("../"):
                 v = os.path.abspath(os.path.dirname(self.qemuboot) + "/" + v)
             elif v == ".":
                 v = os.path.dirname(self.qemuboot)
-            self.set(k_upper, v)
+            self.set(k, v)
 
     def validate_paths(self):
         """Ensure all relevant path variables are set"""
-        # When we're started with a *.qemuboot.conf arg assume that image
+        # When we're started with a *.qemuboot.json arg assume that image
         # artefacts are relative to that file, rather than in whatever
         # directory DEPLOY_DIR_IMAGE in the conf file points to.
         if self.qbconfload:
@@ -1306,7 +1306,7 @@ class BaseConfig(object):
             logger.error("Unable to determine QEMU PC System emulator for %s machine." % mach)
             logger.error("As %s is not among valid QEMU machines such as," % mach)
             logger.error("qemux86-64, qemux86, qemuarm64, qemuarm, qemumips64, qemumips64el, qemumipsel, qemumips, qemuppc")
-            raise RunQemuError("Set qb_system_name with suitable QEMU PC System emulator in .*qemuboot.conf.")
+            raise RunQemuError("Set qb_system_name with suitable QEMU PC System emulator in .*qemuboot.json.")
 
         return 'qemu-system-%s' % qbsys
 
-- 
2.20.1

