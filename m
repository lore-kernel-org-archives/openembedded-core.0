Return-Path: <patrick.ohly@intel.com>
Received: from mail-it0-f45.google.com (mail-it0-f45.google.com
	[209.85.214.45])
	by mail.openembedded.org (Postfix) with ESMTP id 169E57300A
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Mar 2017 19:39:28 +0000 (UTC)
Received: by mail-it0-f45.google.com with SMTP id y18so67177844itc.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Mar 2017 12:39:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=lV0bEfH8mz+KAaPMhWzAj+T5xQwhvW4ILxjATrQePYs=;
	b=nriuXWZ+VlJqaasJSeBOzH2S8byzfiQjjWvfHZTCoV6zRr/zIxWq61skf2JuISvHD6
	GfLYFs9RPfMvHf6PxG5OA+nLG9jan1Cbku+fRVy/0wVTF8tgT7cZKgqdUVE9VMZM78qS
	urKrTCmsO08W2AvEQ3R2iFF3C/ty/HlQEyM9hRnHy1/+siVvFey6OMGNGVt1pv1AhZMU
	kuGtmabImJauEGPxyqpsJRPk9fT9ECETH4VnrSqPDo5NdhSi0aO4Jk1RxqtUhgWji5cV
	LapMR/w6v7QvCZIPUvyAuTgYOQLjoterRHGanAw05EnWqr9PjTOuO7yuGJ7lJxkfOjjV
	s0iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=lV0bEfH8mz+KAaPMhWzAj+T5xQwhvW4ILxjATrQePYs=;
	b=kqwJL5hrjXdX5ldhU4Rvvic+rJH0Jzdsjz+b8ZerBVlRRtTwfs4Vc4fghONRP6i7QV
	JbyEnU9GE7rtEODS93TmAWhQJpnlzbLtKUL7lglUa1prBHsgMVXYLejrj5L137M6VAWO
	1LmNqA9nrHAdheDkM2CQp4GdAJxcHk+Ir3wMVvSoNWQsFomN7aIt8AJwSw2zFofRUh+K
	YZ0wZpqugG7uKP55uqWSai4fKBCSb0VL6KRHTivq0h6Hxe0SM5vHcjDxVJUZTsRC4ypN
	roHIzABYu2gEJPFH6eapZjGGwFYxZrEUg9hPRtE+NQbVKoVUvWYKQ8XrvBLIz09vaW5e
	lE8A==
X-Gm-Message-State: AFeK/H0Vbn8ayQGcXsTgThCF6PwT95PIfNhEAXFDIYOgCawhRfw5koAzUZSb6n/UiD3Fa7jy
X-Received: by 10.36.107.131 with SMTP id v125mr11235890itc.73.1490643569543; 
	Mon, 27 Mar 2017 12:39:29 -0700 (PDT)
Received: from pohly-desktop.fritz.box (p5DE8D2B5.dip0.t-ipconnect.de.
	[93.232.210.181])
	by smtp.gmail.com with ESMTPSA id 17sm698073ioq.45.2017.03.27.12.39.27
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 27 Mar 2017 12:39:28 -0700 (PDT)
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 27 Mar 2017 21:39:14 +0200
Message-Id: <d9d5ceaf6db3a6e14f1e27b6ad9d2799d61cdbeb.1490643522.git-series.patrick.ohly@intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.e904b46a3797bd3e32fa34431a5549f485271170.1490643522.git-series.patrick.ohly@intel.com>
References: <cover.e904b46a3797bd3e32fa34431a5549f485271170.1490643522.git-series.patrick.ohly@intel.com>
Subject: [PATCH v4 3/3] oeqa: allow persistent image writes in runqemu()
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
X-List-Received-Date: Mon, 27 Mar 2017 19:39:28 -0000

By default, QemuRunner avoids modifying the image files that it boots
into by enabling the qemu snapshot mode. However, some tests may want
to test changes that must persists across reboots, so this mode
should be optional.

This can be combined by copying the image file to a temporary location
first and then booting with that copy. It's also useful when testing
with additional drives attached to a virtual machine.

QemuTinyRunner doesn't use the snapshot parameter and therefore ignores
the new parameter.

Long term, a better way of passing these various configuration
parameters should be used, and perhaps QemuRunner and QemuTinyRunner
can be merged into one again to avoid code duplication. But for now
the patch follows the exiting style.

Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
---
 meta/lib/oeqa/targetcontrol.py        | 6 +++---
 meta/lib/oeqa/utils/commands.py       | 4 ++--
 meta/lib/oeqa/utils/qemurunner.py     | 4 ++--
 meta/lib/oeqa/utils/qemutinyrunner.py | 2 +-
 4 files changed, 8 insertions(+), 8 deletions(-)

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
index 88c9bb1..2951dfb 100644
--- a/meta/lib/oeqa/utils/commands.py
+++ b/meta/lib/oeqa/utils/commands.py
@@ -225,7 +225,7 @@ def create_temp_layer(templayerdir, templayername, priority=999, recipepathspec=
 
 
 @contextlib.contextmanager
-def runqemu(pn, ssh=True, runqemuparams='', image_fstype=None, launch_cmd=None, qemuparams=None, overrides={}):
+def runqemu(pn, ssh=True, runqemuparams='', image_fstype=None, launch_cmd=None, qemuparams=None, overrides={}, discard_writes=True):
     """
     launch_cmd means directly run the command, don't need set rootfs or env vars.
     """
@@ -278,7 +278,7 @@ def runqemu(pn, ssh=True, runqemuparams='', image_fstype=None, launch_cmd=None, 
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
diff --git a/meta/lib/oeqa/utils/qemutinyrunner.py b/meta/lib/oeqa/utils/qemutinyrunner.py
index b1009a0..34cb912 100644
--- a/meta/lib/oeqa/utils/qemutinyrunner.py
+++ b/meta/lib/oeqa/utils/qemutinyrunner.py
@@ -60,7 +60,7 @@ class QemuTinyRunner(QemuRunner):
             with open(self.logfile, "a") as f:
                 f.write("%s" % msg)
 
-    def start(self, qemuparams = None, ssh=True, extra_bootparams=None, runqemuparams=''):
+    def start(self, qemuparams = None, ssh=True, extra_bootparams=None, runqemuparams='', discard_writes=True):
 
         if self.display:
             os.environ["DISPLAY"] = self.display
-- 
git-series 0.9.1

