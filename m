Return-Path: <patrick.ohly@intel.com>
Received: from mail-it0-f45.google.com (mail-it0-f45.google.com
	[209.85.214.45])
	by mail.openembedded.org (Postfix) with ESMTP id 820D277C18
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Mar 2017 21:46:34 +0000 (UTC)
Received: by mail-it0-f45.google.com with SMTP id 190so3260249itm.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Mar 2017 14:46:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=4izhh236gJkz0DZ37CXNXQR/AoX8j0nPBXi8oKJehws=;
	b=KJWIz/u5YODx249k2kpxmHg8OJ8JwsOR/AkZZs6dcDeG3I0KfRhRfTjvccY+AuxsgX
	VAd55Wg+kRDY0ZSmEWJBlUnaUQoNbeR8xRIOpUsGBGM4MSZXE9keKD1iwuMec6lGFi2O
	xGxp476hN2oZvNinriSg+sK+bFjskxrYqRwgoVA9vp9x558tAed30dMyF9t4AmguAcOF
	qWUIQW9lbIFjDW4CLc2rmy2fZOCAL0LTj+WI1Y/AJ+hOMhl0AiIQuE2XC+O5ovZX/fTc
	FlKF5o0yAuamdNJeR/JV/pRvRMbp+FwNxW4BS7kDuFfLYXlsJhAs8X7AehlNDoUm78C6
	R/Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=4izhh236gJkz0DZ37CXNXQR/AoX8j0nPBXi8oKJehws=;
	b=o2t63YD0Qs07cidvMdrOUWN1OMvptELAey5P1KwLvVaau1GWO7DnxZgR9Jut7Nrpow
	pvM0G9snKtnuQn/Zqtwv3VRLSLEivFp2Idn/G4u3UjCw2cseC0oBFuLP8fA3tPVMF5OS
	T7DxT5dFCQkkLDzvbgsu7PxcMHHJzpHHGY8ZxlDkxTMLO1ek2DjLiGj/2F4VG+5hQpRx
	zT24misEPDvIePKxNFrwmV3mxMisFAJpTiF6EdWSRvJxBHQY100qtNw301KVhgt6/y3w
	0AbYOuAb/Cp9GYHB4D5sx95nx5oUxukQpU7qcLBaQkew8+X2PBh81H/ZHg2mY0fNxUXB
	VXWg==
X-Gm-Message-State: AFeK/H2Ip//cD1LJXA1xbFToGTK8Jzk3xlHiTAtVaXrdUZi2+0AlsZ2zYi1wuH0jMdeOUMrd
X-Received: by 10.36.216.213 with SMTP id b204mr5052322itg.66.1490391996455;
	Fri, 24 Mar 2017 14:46:36 -0700 (PDT)
Received: from pohly-desktop.fritz.box (p5DE8E2F9.dip0.t-ipconnect.de.
	[93.232.226.249])
	by smtp.gmail.com with ESMTPSA id 202sm1567370ith.7.2017.03.24.14.46.34
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 24 Mar 2017 14:46:35 -0700 (PDT)
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 24 Mar 2017 22:46:19 +0100
Message-Id: <3567e675c915bca5b8deee054dcb8f1a551e7e80.1490391921.git-series.patrick.ohly@intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.0d2b67b6fd1ebbbb5d2fa788032f2316e484f09b.1490391921.git-series.patrick.ohly@intel.com>
References: <cover.0d2b67b6fd1ebbbb5d2fa788032f2316e484f09b.1490391921.git-series.patrick.ohly@intel.com>
Subject: [PATCH v2 4/4] oeqa: allow persistent image writes in runqemu()
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 24 Mar 2017 21:46:36 -0000

By default, runqemu() avoids modifying the image files that it boots
into by enabling the qemu snapshot mode. However, some tests may want
to test changes that must persists across reboots, so this mode
should be optional.

This can be combined by copying the image file to a temporary location
first and then booting with that copy. It's also useful when testing
with additional drives attached to a virtual machine.

Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
---
 meta/lib/oeqa/targetcontrol.py    | 6 +++---
 meta/lib/oeqa/utils/commands.py   | 4 ++--
 meta/lib/oeqa/utils/qemurunner.py | 4 ++--
 3 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/meta/lib/oeqa/targetcontrol.py b/meta/lib/oeqa/targetcontrol.py
index 40a2589..47cfe85 100644
--- a/meta/lib/oeqa/targetcontrol.py
+++ b/meta/lib/oeqa/targetcontrol.py
@@ -182,11 +182,11 @@ class QemuTarget(BaseTarget):
         logger.info("Qemu log file: %s" % self.qemulog)
         super(QemuTarget, self).deploy()
 
-    def start(self, params=None, ssh=True, extra_bootparams='', runqemuparams='', launch_cmd=''):
+    def start(self, params=None, ssh=True, extra_bootparams='', runqemuparams='', launch_cmd='', discard_writes=True):
         if launch_cmd:
-            start = self.runner.launch(get_ip=ssh, launch_cmd=launch_cmd)
+            start = self.runner.launch(get_ip=ssh, launch_cmd=launch_cmd, discard_writes=discard_writes)
         else:
-            start = self.runner.start(params, get_ip=ssh, extra_bootparams=extra_bootparams, runqemuparams=runqemuparams)
+            start = self.runner.start(params, get_ip=ssh, extra_bootparams=extra_bootparams, runqemuparams=runqemuparams, discard_writes=discard_writes)
 
         if start:
             if ssh:
diff --git a/meta/lib/oeqa/utils/commands.py b/meta/lib/oeqa/utils/commands.py
index 9bae48b..fed6612 100644
--- a/meta/lib/oeqa/utils/commands.py
+++ b/meta/lib/oeqa/utils/commands.py
@@ -218,7 +218,7 @@ def create_temp_layer(templayerdir, templayername, priority=999, recipepathspec=
 
 
 @contextlib.contextmanager
-def runqemu(pn, ssh=True, runqemuparams='', image_fstype=None, launch_cmd=None, qemuparams=None, overrides={}):
+def runqemu(pn, ssh=True, runqemuparams='', image_fstype=None, launch_cmd=None, qemuparams=None, overrides={}, discard_writes=True):
     """
     launch_cmd means directly run the command, don't need set rootfs or env vars.
     """
@@ -271,7 +271,7 @@ def runqemu(pn, ssh=True, runqemuparams='', image_fstype=None, launch_cmd=None, 
     try:
         qemu.deploy()
         try:
-            qemu.start(params=qemuparams, ssh=ssh, runqemuparams=runqemuparams, launch_cmd=launch_cmd)
+            qemu.start(params=qemuparams, ssh=ssh, runqemuparams=runqemuparams, launch_cmd=launch_cmd, discard_writes=discard_writes)
         except bb.build.FuncFailed:
             raise Exception('Failed to start QEMU - see the logs in %s' % logdir)
 
diff --git a/meta/lib/oeqa/utils/qemurunner.py b/meta/lib/oeqa/utils/qemurunner.py
index 95f5925..cd79f21 100644
--- a/meta/lib/oeqa/utils/qemurunner.py
+++ b/meta/lib/oeqa/utils/qemurunner.py
@@ -97,7 +97,7 @@ class QemuRunner:
                 self._dump_host()
                 raise SystemExit
 
-    def start(self, qemuparams = None, get_ip = True, extra_bootparams = None, runqemuparams='', launch_cmd=None):
+    def start(self, qemuparams = None, get_ip = True, extra_bootparams = None, runqemuparams='', launch_cmd=None, discard_writes=True):
         if self.display:
             os.environ["DISPLAY"] = self.display
             # Set this flag so that Qemu doesn't do any grabs as SDL grabs
@@ -118,7 +118,7 @@ class QemuRunner:
             os.environ["DEPLOY_DIR_IMAGE"] = self.deploy_dir_image
 
         if not launch_cmd:
-            launch_cmd = 'runqemu snapshot %s' % runqemuparams
+            launch_cmd = 'runqemu %s %s ' % ('snapshot' if discard_writes else '', runqemuparams)
             if self.use_kvm:
                 logger.info('Using kvm for runqemu')
                 launch_cmd += ' kvm'
-- 
git-series 0.9.1

