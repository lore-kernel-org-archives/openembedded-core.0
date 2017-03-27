Return-Path: <patrick.ohly@intel.com>
Received: from mail-it0-f43.google.com (mail-it0-f43.google.com
	[209.85.214.43])
	by mail.openembedded.org (Postfix) with ESMTP id 898B777B26
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Mar 2017 09:51:27 +0000 (UTC)
Received: by mail-it0-f43.google.com with SMTP id y18so66726586itc.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Mar 2017 02:51:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=NhQCqUvBmjSx3K/9Pa9Aou5Rcxvr8Gt23rfKGFg5nso=;
	b=y3CnizCBT2lWlIJbM3Q172efa2gwXEU2FDGWkJPgdCrp2DGXqztm5G0zDU1FQ46Vo9
	wqB34xOnALndZnAl1/xaH6y0oocffYBy8aONMYeLAs7+j09CfHvUBOIN5eEhRwSz7xC5
	TXibhAcsaAce2ZQgWC0XOOtAEdtfEGXzZWXAU1D9CYJrfaWXTFa53Ktm9RVUapRuih90
	Oco3WxvVSUZT7XQr1M198Jg5GQqOJWvifXMmfxDOMnWJoNzx49zKw5LSOzdiFdHit/ko
	0DavAFP1Zq/jdm7s57OzTWRGNiJoATw7rYGlrIsa7C/HSs7oS/VVN9sdNNi0aQuzItqx
	IfKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=NhQCqUvBmjSx3K/9Pa9Aou5Rcxvr8Gt23rfKGFg5nso=;
	b=JIgS+sGyRrfrKkRSnYxx2FzpptvYVXazR7cxk2XCizuT6KAgiN0uQ3xvbMHW6WLRYR
	hXTHnLP39vn2PyKSaEHrNBJPs30WIRjOzRs+1gLa2wNz005wSKuOihc50w4DLU0yxHEU
	/90nNCke6WEYCl3i6IvcBNGFZ5UiyEv0XKQSMgyVPxRZOfG7tsQkJBAUvkc+brBLkPE1
	eRpPjWf+WBGU2waUgBF2FD5RU6dMd/5mm69rL2Fqq4Yrzd28qD0p3vRrchsH9XWzPDaV
	M6qKmtXo9AnRKeBA1fK4zC56B6fLv4GLVrFvR5AkOiEJZTviqw0U/sdVTCr+sCFcaqGt
	yKsA==
X-Gm-Message-State: AFeK/H2fvViWiTV+NkBsblmQHUPawrmLDxN0EOwTzdlHQoQKHZeg/fJwALBNvAt5qv8L5Gb1
X-Received: by 10.36.84.199 with SMTP id t190mr9018355ita.114.1490608288326;
	Mon, 27 Mar 2017 02:51:28 -0700 (PDT)
Received: from pohly-desktop.fritz.box (p5DE8D2B5.dip0.t-ipconnect.de.
	[93.232.210.181])
	by smtp.gmail.com with ESMTPSA id q185sm32060itc.22.2017.03.27.02.51.26
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 27 Mar 2017 02:51:27 -0700 (PDT)
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 27 Mar 2017 11:50:40 +0200
Message-Id: <ff4a94fdf7b42cfd7c5114f29734078874d753b8.1490608195.git-series.patrick.ohly@intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.c7547f2eda8922d28653c6746806ea5c16d5a976.1490608195.git-series.patrick.ohly@intel.com>
References: <cover.c7547f2eda8922d28653c6746806ea5c16d5a976.1490608195.git-series.patrick.ohly@intel.com>
Subject: [PATCH v3 3/3] oeqa: allow persistent image writes in runqemu()
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
X-List-Received-Date: Mon, 27 Mar 2017 09:51:28 -0000

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
-- 
git-series 0.9.1

