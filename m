Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E80FC77B70
	for <webhook@archiver.kernel.org>; Thu,  6 Apr 2023 16:03:16 +0000 (UTC)
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
 by mx.groups.io with SMTP id smtpd.web10.162558.1680796986750560344
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Apr 2023 09:03:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=kCxD/GGr;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.49, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f49.google.com with SMTP id j14-20020a17090a7e8e00b002448c0a8813so2007207pjl.0
        for <openembedded-core@lists.openembedded.org>; Thu, 06 Apr 2023 09:03:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112; t=1680796986; x=1683388986;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sVjXo83jJk7VPkLIpCjpthUzWAZu1nP4Stn3sWIk5f8=;
        b=kCxD/GGrmo3RmWFq0ro/9IHHOKAG0LhGdP4MYGf2z5BAlQ8GfP3ehsJLaCAQ7E8qpq
         XSAObldx1YDwWtbPDQRSB8PHkolZKkRVn6lrAQPcbELQEwD11KEXyp7SpDmALpL09P72
         oXzYz4rs+ZzsJmT7QGcAbUop0TNcxvUaSc49HonqMb5BprCkLrdMg3y/WykZdnSGOcEM
         4INDTiJIUQTFKVrEmb2Zuz43gnkiiNUqXevR75+2NtK94USYtVywgnzndtWcCIeQHpjo
         78x/dnk0M9CmBVGFVAiov0mpp9oZ4si7gxCys4apvizwCz4u8TIjJkDsQ9rlcTj7NoGk
         zPBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680796986; x=1683388986;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sVjXo83jJk7VPkLIpCjpthUzWAZu1nP4Stn3sWIk5f8=;
        b=c1vJ8wHPwbvfUAFKLeqmjtoS92dhVh+c05/0KbyhojJUUCKm7YtAsULsz4amYMO1f7
         zjiAiViXAnclohz6aDqIbHtv9N3Lx1oVjolIGBBosURPz+++qoM+xpMrM1lVTcv98p+4
         3q1aAMvpLqZG6teZ5uvR+ajoaEFIW8+GGdn4JLMG8diWL9p/YWQj719Vw16c89UWRb1o
         jnvkI5siLJXqfC51IpTUjnGo1NVQbSkqy4dvip12hwS1D2wFQ5N5n5mU4n1wymE4Ronj
         6xhN6mhRv+ECFH6rSmiZYDQDCe1RIY/XDthWI8plv2nQ3ytB31cjNLOs4MLL6a+LCPR4
         A34w==
X-Gm-Message-State: AAQBX9fpC9e1AZIKaOJXUsZoEfuQSjZny13+tcy+SVv2UU2DoxHHGnSQ
	l3z3Zq5Isp5EIPhaVPXi4Yw3Ipg8Nccz0EfjjVU=
X-Google-Smtp-Source: AKy350Z7+WdfFBSkEXsn00piMirzczFcVfnXYeavNVdgk+rk0asEOHqMLtfNj3OxN5EikCDPC3y/fQ==
X-Received: by 2002:a05:6a20:6089:b0:e4:9ac9:844e with SMTP id p9-20020a056a20608900b000e49ac9844emr2660951pza.61.1680796985580;
        Thu, 06 Apr 2023 09:03:05 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id b13-20020aa7870d000000b0062e26487e7esm1532588pfo.155.2023.04.06.09.03.04
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Apr 2023 09:03:05 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 25/26] runqemu: respect IMAGE_LINK_NAME
Date: Thu,  6 Apr 2023 06:01:52 -1000
Message-Id: <82b7a8d5e81d766d0a5c2d0fef0f4c13a8f80c31.1680796770.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1680796770.git.steve@sakoman.com>
References: <cover.1680796770.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 06 Apr 2023 16:03:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179803

From: Martin Jansa <Martin.Jansa@gmail.com>

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
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 716eb55bb963db7b02d985849cb025898aabc855)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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
index efc135e535..9a3c9d2ce4 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -381,13 +381,19 @@ class BaseConfig(object):
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
 
@@ -421,6 +427,7 @@ class BaseConfig(object):
         # are there other scenarios in which we need to support being
         # invoked by bitbake?
         deploy = self.get('DEPLOY_DIR_IMAGE')
+        image_link_name = self.get('IMAGE_LINK_NAME')
         bbchild = deploy and self.get('OE_TMPDIR')
         if bbchild:
             self.set_machine_deploy_dir(arg, deploy)
@@ -445,6 +452,12 @@ class BaseConfig(object):
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
         # As runqemu can be run within bitbake (when using testimage, for example),
@@ -557,11 +570,18 @@ class BaseConfig(object):
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
@@ -667,8 +687,8 @@ class BaseConfig(object):
 
         if self.rootfs and not os.path.exists(self.rootfs):
             # Lazy rootfs
-            self.rootfs = "%s/%s-%s.%s" % (self.get('DEPLOY_DIR_IMAGE'),
-                    self.rootfs, self.get('MACHINE'),
+            self.rootfs = "%s/%s.%s" % (self.get('DEPLOY_DIR_IMAGE'),
+                    self.get('IMAGE_LINK_NAME'),
                     self.fstype)
         elif not self.rootfs:
             cmd_name = '%s/%s*.%s' % (self.get('DEPLOY_DIR_IMAGE'), self.get('IMAGE_NAME'), self.fstype)
@@ -872,8 +892,10 @@ class BaseConfig(object):
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
@@ -1569,7 +1591,7 @@ class BaseConfig(object):
 
         self.cleaned = True
 
-    def run_bitbake_env(self, mach=None):
+    def run_bitbake_env(self, mach=None, target=''):
         bitbake = shutil.which('bitbake')
         if not bitbake:
             return
@@ -1582,22 +1604,33 @@ class BaseConfig(object):
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
2.34.1


