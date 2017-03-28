Return-Path: <patrick.ohly@intel.com>
Received: from mail-it0-f53.google.com (mail-it0-f53.google.com
	[209.85.214.53])
	by mail.openembedded.org (Postfix) with ESMTP id DCFAC77A4A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Mar 2017 08:02:34 +0000 (UTC)
Received: by mail-it0-f53.google.com with SMTP id y18so9947114itc.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Mar 2017 01:02:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=uasofx50oCYac0LkCo0bWI14bqWSc2az2iEOYB76Frc=;
	b=V9s8dKSpyTgi+XnY1SBkZK4r4FoSUSeTp+t31dN0OSrPuEtnV110O3aWiFoHZsRr+l
	dp9QEoDsNESnC8n74AQnjTlUqrcvpo+BY4fjIoGBSWp0vEiDz9n5CJ43qJnhejPqtMBl
	fUJyEV4yPkInAWpHYcmCN+dmrfGq3LoBUGN8XPN9uiquXHkCbcaUDghG54Og9RaEc7Ab
	++SHw8MckirYDlLMu7zbyMbHhpKeWSMprn1DrMGb+9oQCOyQYaVHS64n1nE4NN8+s7/V
	aWpHEzYBEwpXzGfzXHfyJXo6Njpb2lm3ZvVrlCwkV2mm4wddaTNukRogrdLmE9fmEEx0
	xRAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=uasofx50oCYac0LkCo0bWI14bqWSc2az2iEOYB76Frc=;
	b=FETb3l3NUbUekAYcHuQyE7VbPKoCA7n8Br3YZ4ggOrlmLx2F95dlokdMX+MClESIie
	mhVKkWUsjT36H0ksJuKw87ZoLmJeX0f2/RCpPfrNl0wezNHZmzHlgWnMEXNHo1ntCRcX
	7WEqGQzGDYYVk9Xyj8TjDNQhqMzun0E42a7vzpTneWXi+eIXbr5zAE+j6uLxyPZdd10h
	nPdQXmlbZ13cfQVAyWhojKP6Rb6P0P+LPuBqZsrc7ywwvZixtnb3LLOjuvUQUFLlxWEu
	lqpa2c74C0HXzXlZzIctnnEkQmKTCVBvPOOrySXZbxrFs0QZt6Z4j1KjfXpKouZ37a5x
	ADJg==
X-Gm-Message-State: AFeK/H198PKTp1twjhLhgST5SxxRJfXB3rkChf6gId4FHPIfWLTEItcrtJzi8WsvUnSO1MxP
X-Received: by 10.36.108.144 with SMTP id w138mr6793309itb.67.1490688156072;
	Tue, 28 Mar 2017 01:02:36 -0700 (PDT)
Received: from pohly-desktop.fritz.box (p5DE8D2BA.dip0.t-ipconnect.de.
	[93.232.210.186]) by smtp.gmail.com with ESMTPSA id
	k186sm1137867ita.30.2017.03.28.01.02.34
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 28 Mar 2017 01:02:35 -0700 (PDT)
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 28 Mar 2017 10:02:19 +0200
Message-Id: <b96b881bd41f611633a0d5933163d00790d39f60.1490687992.git-series.patrick.ohly@intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.dc1fc462863c093e384c22eb65a3a07dbc6f3004.1490687992.git-series.patrick.ohly@intel.com>
References: <cover.dc1fc462863c093e384c22eb65a3a07dbc6f3004.1490687992.git-series.patrick.ohly@intel.com>
Subject: [PATCH v5 3/3] oeqa: allow persistent image writes in runqemu()
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
X-List-Received-Date: Tue, 28 Mar 2017 08:02:35 -0000

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

Also beware that QemuTarget.start() now acts in two different modes
(with or without explicit launch command), and depending on that mode
parameters like discard_writes must be ignored, i.e. not get passed to
launch().

Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
---
 meta/lib/oeqa/targetcontrol.py        | 4 ++--
 meta/lib/oeqa/utils/commands.py       | 4 ++--
 meta/lib/oeqa/utils/qemurunner.py     | 4 ++--
 meta/lib/oeqa/utils/qemutinyrunner.py | 2 +-
 4 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/meta/lib/oeqa/targetcontrol.py b/meta/lib/oeqa/targetcontrol.py
index 40a2589..57fd3b8 100644
--- a/meta/lib/oeqa/targetcontrol.py
+++ b/meta/lib/oeqa/targetcontrol.py
@@ -182,11 +182,11 @@ class QemuTarget(BaseTarget):
         logger.info("Qemu log file: %s" % self.qemulog)
         super(QemuTarget, self).deploy()
 
-    def start(self, params=None, ssh=True, extra_bootparams='', runqemuparams='', launch_cmd=''):
+    def start(self, params=None, ssh=True, extra_bootparams='', runqemuparams='', launch_cmd='', discard_writes=True):
         if launch_cmd:
             start = self.runner.launch(get_ip=ssh, launch_cmd=launch_cmd)
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

