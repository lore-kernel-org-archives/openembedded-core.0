Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8BA18C77B6C
	for <webhook@archiver.kernel.org>; Thu, 30 Mar 2023 23:27:44 +0000 (UTC)
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
 by mx.groups.io with SMTP id smtpd.web10.42107.1680218856188240092
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Mar 2023 16:27:36 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20210112 header.b=Xlk0aJUw;
 spf=pass (domain: gmail.com, ip: 209.85.208.50, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f50.google.com with SMTP id w9so83019760edc.3
        for <openembedded-core@lists.openembedded.org>; Thu, 30 Mar 2023 16:27:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680218854; x=1682810854;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J0Z9NrTN4FqCfnSMsEJngZkpEdpDN7/sJQsgX4wb9qo=;
        b=Xlk0aJUwSHGmtX6Sx10ynWy2ajJMf0sarCGcWcjkj15FwfyU9BY50CwfyZJRg0qBcP
         8j3BxemHOdk0F5y3xWb9kCnmHjNAYnhi0T6ZlBa80oJNhvU74WlopVuXO3Ka1D/MJucb
         BUqLmotMjuUXaJ0RuP/Wtdcnfs6Xyem3ow1mu47T+SCkneIthZi8NfqZO98COjGtQqVy
         BnlqgTmGsPljNJtp5AQ2sUAUYtSQRy+XztOfi5gTVpNArLEXupw4dmM8I2Jn1xvGZILa
         b+9tnvgORCLWN0eUTFRTCfgNFyNeUoI5wyscRwuoP2pi6rp0zW8OzLu+g8WySrJm59hK
         hq4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680218854; x=1682810854;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J0Z9NrTN4FqCfnSMsEJngZkpEdpDN7/sJQsgX4wb9qo=;
        b=1TGCu/xBnaA1cZCjO/U0VTJi2u2TiaLWBeaePJ0YHuj3J4jJn8WL77UEx5qHt/I3NI
         ueb5TuHE6MJH2YI84Bj/squxx2QehOWL0F1A1NQWsFKQSwjR4B2GAk/cJFRsjCMunt8Q
         Esdr7xXpJMOp2Eq0FD9AmaXm9J0/I1aHa9bbij+U5p3m64LyNPo3XpsC5A4/0BCjEBfu
         iX0XkagldiZKWb6XEuX1Xhf7ZmaO3epI1sPjccDXgrnA/Tbc0yfBrdbY1Kfq+fy7o7G7
         EUDnWvHjzN3TBLxlbLHavxE8nyKY100gXQFByIf/CsaxJCX1F7x4VAPCXD6fBA45To23
         +2Bw==
X-Gm-Message-State: AAQBX9fLwJ01jKFC6qlnpPIFqSsAR50slMSj2aF0kZ1lwQYmXu6Rl86f
	vd/DJ4g7eTAzYnEaI0ZjTFVV5o+eqAo=
X-Google-Smtp-Source: AKy350ZVkkvddCvmvtrNuIT1SMtKCrEqvU+AqHHL19y85TD/mtVZmWF6bi4/kH6tRnbinZGx7Ad5Pw==
X-Received: by 2002:a17:906:31cb:b0:92c:a80e:225f with SMTP id f11-20020a17090631cb00b0092ca80e225fmr28419689ejf.52.1680218854366;
        Thu, 30 Mar 2023 16:27:34 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id c10-20020a170906d18a00b00923f05b2931sm315705ejz.118.2023.03.30.16.27.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Mar 2023 16:27:34 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [PATCH 3/3] runqemu: respect IMAGE_LINK_NAME
Date: Fri, 31 Mar 2023 01:27:24 +0200
Message-Id: <20230330232724.2868639-3-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230330232724.2868639-1-Martin.Jansa@gmail.com>
References: <20230330232724.2868639-1-Martin.Jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Mar 2023 23:27:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179380

* when searching for qemuboot.conf
* don't assume that IMAGE_LINK_NAME is always
  <rootfs>-<machine> (with <rootfs>-<machine>.qemuboot.conf)

* runqemu: use IMAGE_LINK_NAME set by testimage.bbclass or query with bitbake -e

* testimage.bbclass was setting DEPLOY_DIR which I don't see used
  anywhere else, so I assume it was supposed to be DEPLOY_DIR_IMAGE as mentioned
  in corresponding runqemu code, do the same with IMAGE_LINK_NAME variable

* add virtual/kernel as bitbake -e target in run_bitbake_env to make
  sure IMAGE_LINK_NAME is defined (kernel-artifact-names.bbclass inherits
  image-artifact-names.bbclass as well)

* improve .qemuboot.conf search
  1st search for file matching the rootfs and only when not found
  try again with .rootfs suffix removed

[YOCTO #12937]

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/classes-recipe/testimage.bbclass |  2 +-
 scripts/runqemu                       | 69 ++++++++++++++++++++-------
 2 files changed, 52 insertions(+), 19 deletions(-)

diff --git a/meta/classes-recipe/testimage.bbclass b/meta/classes-recipe/testimage.bbclass
index df22bb2344..b48cd96575 100644
--- a/meta/classes-recipe/testimage.bbclass
+++ b/meta/classes-recipe/testimage.bbclass
@@ -98,7 +98,7 @@ TESTIMAGELOCK:qemuall = ""
 
 TESTIMAGE_DUMP_DIR ?= "${LOG_DIR}/runtime-hostdump/"
 
-TESTIMAGE_UPDATE_VARS ?= "DL_DIR WORKDIR DEPLOY_DIR"
+TESTIMAGE_UPDATE_VARS ?= "DL_DIR WORKDIR DEPLOY_DIR_IMAGE IMAGE_LINK_NAME"
 
 testimage_dump_target () {
     top -bn1
diff --git a/scripts/runqemu b/scripts/runqemu
index 09b0ad5ed5..4c06cefbff 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -384,13 +384,19 @@ class BaseConfig(object):
                     fst =  m.group(1)
             if fst:
                 self.check_arg_fstype(fst)
-                qb = re.sub('\.' + fst + "$", '', self.rootfs)
-                qb = '%s%s' % (re.sub('\.rootfs$', '', qb), '.qemuboot.conf')
+                qb = re.sub('\.' + fst + "$", '.qemuboot.conf', self.rootfs)
                 if os.path.exists(qb):
                     self.qemuboot = qb
                     self.qbconfload = True
                 else:
-                    logger.warning("%s doesn't exist" % qb)
+                    logger.warning("%s doesn't exist, will try to remove '.rootfs' from filename" % qb)
+                    # They to remove .rootfs (IMAGE_NAME_SUFFIX) as well
+                    qb = re.sub('\.rootfs.qemuboot.conf$', '.qemuboot.conf', qb)
+                    if os.path.exists(qb):
+                        self.qemuboot = qb
+                        self.qbconfload = True
+                    else:
+                        logger.warning("%s doesn't exist" % qb)
             else:
                 raise RunQemuError("Can't find FSTYPE from: %s" % p)
 
@@ -424,6 +430,7 @@ class BaseConfig(object):
         # are there other scenarios in which we need to support being
         # invoked by bitbake?
         deploy = self.get('DEPLOY_DIR_IMAGE')
+        image_link_name = self.get('IMAGE_LINK_NAME')
         bbchild = deploy and self.get('OE_TMPDIR')
         if bbchild:
             self.set_machine_deploy_dir(arg, deploy)
@@ -448,6 +455,12 @@ class BaseConfig(object):
         else:
             logger.error("%s not a directory valid DEPLOY_DIR_IMAGE" % deploy_dir_image)
             self.set("MACHINE", arg)
+        if not image_link_name:
+            s = re.search('^IMAGE_LINK_NAME="(.*)"', self.bitbake_e, re.M)
+            if s:
+                image_link_name = s.group(1)
+                self.set("IMAGE_LINK_NAME", image_link_name)
+                logger.debug('Using IMAGE_LINK_NAME = "%s"' % image_link_name)
 
     def set_dri_path(self):
         drivers_path = os.path.join(self.bindir_native, '../lib/dri')
@@ -550,11 +563,18 @@ to your build configuration.
             self.check_arg_machine(unknown_arg)
 
         if not (self.get('DEPLOY_DIR_IMAGE') or self.qbconfload):
-            self.load_bitbake_env()
+            self.load_bitbake_env(target=self.rootfs)
             s = re.search('^DEPLOY_DIR_IMAGE="(.*)"', self.bitbake_e, re.M)
             if s:
                 self.set("DEPLOY_DIR_IMAGE", s.group(1))
 
+        if not self.get('IMAGE_LINK_NAME') and self.rootfs:
+            s = re.search('^IMAGE_LINK_NAME="(.*)"', self.bitbake_e, re.M)
+            if s:
+                image_link_name = s.group(1)
+                self.set("IMAGE_LINK_NAME", image_link_name)
+                logger.debug('Using IMAGE_LINK_NAME = "%s"' % image_link_name)
+
     def check_kvm(self):
         """Check kvm and kvm-host"""
         if not (self.kvm_enabled or self.vhost_enabled):
@@ -660,8 +680,8 @@ to your build configuration.
 
         if self.rootfs and not os.path.exists(self.rootfs):
             # Lazy rootfs
-            self.rootfs = "%s/%s-%s.%s" % (self.get('DEPLOY_DIR_IMAGE'),
-                    self.rootfs, self.get('MACHINE'),
+            self.rootfs = "%s/%s.%s" % (self.get('DEPLOY_DIR_IMAGE'),
+                    self.get('IMAGE_LINK_NAME'),
                     self.fstype)
         elif not self.rootfs:
             glob_name = '%s/%s*.%s' % (self.get('DEPLOY_DIR_IMAGE'), self.get('IMAGE_NAME'), self.fstype)
@@ -865,8 +885,10 @@ to your build configuration.
                 machine = self.get('MACHINE')
                 if not machine:
                     machine = os.path.basename(deploy_dir_image)
-                self.qemuboot = "%s/%s-%s.qemuboot.conf" % (deploy_dir_image,
-                        self.rootfs, machine)
+                if not self.get('IMAGE_LINK_NAME'):
+                    raise RunQemuError("IMAGE_LINK_NAME wasn't set to find corresponding .qemuboot.conf file")
+                self.qemuboot = "%s/%s.qemuboot.conf" % (deploy_dir_image,
+                        self.get('IMAGE_LINK_NAME'))
             else:
                 cmd = 'ls -t %s/*.qemuboot.conf' %  deploy_dir_image
                 logger.debug('Running %s...' % cmd)
@@ -1600,7 +1622,7 @@ to your build configuration.
 
         self.cleaned = True
 
-    def run_bitbake_env(self, mach=None):
+    def run_bitbake_env(self, mach=None, target=''):
         bitbake = shutil.which('bitbake')
         if not bitbake:
             return
@@ -1613,22 +1635,33 @@ to your build configuration.
             multiconfig = "mc:%s" % multiconfig
 
         if mach:
-            cmd = 'MACHINE=%s bitbake -e %s' % (mach, multiconfig)
+            cmd = 'MACHINE=%s bitbake -e %s %s' % (mach, multiconfig, target)
         else:
-            cmd = 'bitbake -e %s' % multiconfig
+            cmd = 'bitbake -e %s %s' % (multiconfig, target)
 
         logger.info('Running %s...' % cmd)
-        return subprocess.check_output(cmd, shell=True).decode('utf-8')
+        try:
+            return subprocess.check_output(cmd, shell=True).decode('utf-8')
+        except subprocess.CalledProcessError as err:
+            logger.warning("Couldn't run '%s' to gather environment information, maybe the target wasn't an image name, will retry with virtual/kernel as a target:\n%s" % (cmd, err.output.decode('utf-8')))
+            # need something with IMAGE_NAME_SUFFIX/IMAGE_LINK_NAME defined (kernel also inherits image-artifact-names.bbclass)
+            target = 'virtual/kernel'
+            if mach:
+                cmd = 'MACHINE=%s bitbake -e %s %s' % (mach, multiconfig, target)
+            else:
+                cmd = 'bitbake -e %s %s' % (multiconfig, target)
+            try:
+                return subprocess.check_output(cmd, shell=True).decode('utf-8')
+            except subprocess.CalledProcessError as err:
+                logger.warning("Couldn't run '%s' to gather environment information, giving up with 'bitbake -e':\n%s" % (cmd, err.output.decode('utf-8')))
+                return ''
 
-    def load_bitbake_env(self, mach=None):
+
+    def load_bitbake_env(self, mach=None, target=None):
         if self.bitbake_e:
             return
 
-        try:
-            self.bitbake_e = self.run_bitbake_env(mach=mach)
-        except subprocess.CalledProcessError as err:
-            self.bitbake_e = ''
-            logger.warning("Couldn't run 'bitbake -e' to gather environment information:\n%s" % err.output.decode('utf-8'))
+        self.bitbake_e = self.run_bitbake_env(mach=mach, target=target)
 
     def validate_combos(self):
         if (self.fstype in self.vmtypes) and self.kernel:
-- 
2.40.0


