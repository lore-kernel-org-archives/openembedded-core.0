Return-Path: <patrick.ohly@intel.com>
Received: from mail-it0-f41.google.com (mail-it0-f41.google.com
	[209.85.214.41])
	by mail.openembedded.org (Postfix) with ESMTP id D12E677BD4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Mar 2017 17:19:00 +0000 (UTC)
Received: by mail-it0-f41.google.com with SMTP id y18so15255490itc.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Mar 2017 10:19:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=lQkWiJE3yz9yuPzrA69ALHpL07PDjhL9hXDPs8H6gnc=;
	b=q0Rp+mCR744rgtJ+1qecDTDwSQXCsStaqH4+d71Tev62+8v6xijdpp6Plxu47m5D5J
	ZZ/20r10AmYsJSORWO7d/LUd2FbX7Fx/NO12x+bTYuHqFQ831ogzQ3PS3r8Czj3dKOq5
	T5JCECJGcElqmCCKg2HEgZwdp7aPZE7ZFk8HjqkOE0mxaD46JEHcQ9DpKESK5lU3oOyM
	91IENQoTIijhkvh3CK9QmuUL9ECm0TtKD1uu/imPlv8x3HkXXygtHHkOEG33KDRE68mq
	4gkBSGa2TvXSghPNwFyAs68WNp5VGpiLMFRPOLKXt9vmCn1XuN6q17IM/gx2fpg4viVz
	6NMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=lQkWiJE3yz9yuPzrA69ALHpL07PDjhL9hXDPs8H6gnc=;
	b=Os2HwTGk4yJNyGjzycYfq1dU8xNZb0zNP3or+Nq+VqmI+9YhwkXvlAS8+Axk0We043
	uNf+buzx5MBrjtjt3P+TWu4wg/D90AamOogpE6VQ17v/lNpsP5bp8ZhPafmR16Cg2bCj
	B3K7SVLUd2vGqcLakEMjA/Uj3vmlb+soO+qm2InhgQMb8hOvRHaxtTsGG4cQ+DH2rRVF
	HDQGkd343y/HXvispkkG7+SaiFqUdes4aDIEuCpH5Zx1MHTH3oCB1+mBXt9egG6JM33O
	W188AKEByaFo/yUd5TlWd0nZCUqE+/8Rred+rhw9f+ZxN2CMUgbzNOxqsujmO7MC3T1q
	LCAQ==
X-Gm-Message-State: AFeK/H2r6e13zUOAdBF95YrO43EbbYiT4mU+ztpzKlCrrfxZsZxudXZ7nbHvVu2Jq5hP+4jf
X-Received: by 10.36.170.77 with SMTP id y13mr4209170iti.2.1490375941331;
	Fri, 24 Mar 2017 10:19:01 -0700 (PDT)
Received: from pohly-desktop.fritz.box (p5DE8E2F9.dip0.t-ipconnect.de.
	[93.232.226.249]) by smtp.gmail.com with ESMTPSA id
	g23sm1477725ioi.20.2017.03.24.10.18.59
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 24 Mar 2017 10:19:00 -0700 (PDT)
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 24 Mar 2017 18:18:38 +0100
Message-Id: <10c3dfa1db3a92ad82bbeec97d82e70e8df1827a.1490375888.git-series.patrick.ohly@intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.893d808ab8d6ae450d8d95e1b23eeecb627cde36.1490375888.git-series.patrick.ohly@intel.com>
References: <cover.893d808ab8d6ae450d8d95e1b23eeecb627cde36.1490375888.git-series.patrick.ohly@intel.com>
Subject: [PATCH 4/4] oeqa: allow persistent image writes in runqemu()
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
X-List-Received-Date: Fri, 24 Mar 2017 17:19:00 -0000

By default, runqemu() avoids modifying the image files that it boots
into by enabling the qemu snapshot mode. However, some tests may want
to test changes that must persists across reboots, so this mode
should be optional.

This can be combined by copying the image file to a temporary location
first and then booting with that copy. It's also useful when testing
with additional drives attached to a virtual machine.

Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
---
 meta/lib/oeqa/targetcontrol.py    | 4 ++--
 meta/lib/oeqa/utils/commands.py   | 4 ++--
 meta/lib/oeqa/utils/qemurunner.py | 4 ++--
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/meta/lib/oeqa/targetcontrol.py b/meta/lib/oeqa/targetcontrol.py
index 2f071e0..05a1a16 100644
--- a/meta/lib/oeqa/targetcontrol.py
+++ b/meta/lib/oeqa/targetcontrol.py
@@ -176,8 +176,8 @@ class QemuTarget(BaseTarget):
         bb.note("Qemu log file: %s" % self.qemulog)
         super(QemuTarget, self).deploy()
 
-    def start(self, params=None, ssh=True, extra_bootparams=None, runqemuparams=''):
-        if self.runner.start(params, get_ip=ssh, extra_bootparams=extra_bootparams, runqemuparams=runqemuparams):
+    def start(self, params=None, ssh=True, extra_bootparams=None, runqemuparams='', discard_writes=True):
+        if self.runner.start(params, get_ip=ssh, extra_bootparams=extra_bootparams, runqemuparams=runqemuparams, discard_writes=discard_writes):
             if ssh:
                 self.ip = self.runner.ip
                 self.server_ip = self.runner.server_ip
diff --git a/meta/lib/oeqa/utils/commands.py b/meta/lib/oeqa/utils/commands.py
index ed99d0e..793b96b 100644
--- a/meta/lib/oeqa/utils/commands.py
+++ b/meta/lib/oeqa/utils/commands.py
@@ -218,7 +218,7 @@ def create_temp_layer(templayerdir, templayername, priority=999, recipepathspec=
 
 
 @contextlib.contextmanager
-def runqemu(pn, ssh=True, runqemuparams='', image_fstype=None, qemuparams=None, overrides={}):
+def runqemu(pn, ssh=True, runqemuparams='', image_fstype=None, qemuparams=None, overrides={}, discard_writes=True):
 
     import bb.tinfoil
     import bb.build
@@ -262,7 +262,7 @@ def runqemu(pn, ssh=True, runqemuparams='', image_fstype=None, qemuparams=None, 
     try:
         qemu.deploy()
         try:
-            qemu.start(params=qemuparams, ssh=ssh, runqemuparams=runqemuparams)
+            qemu.start(params=qemuparams, ssh=ssh, runqemuparams=runqemuparams, discard_writes=discard_writes)
         except bb.build.FuncFailed:
             raise Exception('Failed to start QEMU - see the logs in %s' % logdir)
 
diff --git a/meta/lib/oeqa/utils/qemurunner.py b/meta/lib/oeqa/utils/qemurunner.py
index c0abb96..ac31e90 100644
--- a/meta/lib/oeqa/utils/qemurunner.py
+++ b/meta/lib/oeqa/utils/qemurunner.py
@@ -97,7 +97,7 @@ class QemuRunner:
                 self._dump_host()
                 raise SystemExit
 
-    def start(self, qemuparams = None, get_ip = True, extra_bootparams = None, runqemuparams=''):
+    def start(self, qemuparams = None, get_ip = True, extra_bootparams = None, runqemuparams='', discard_writes=True):
         if self.display:
             os.environ["DISPLAY"] = self.display
             # Set this flag so that Qemu doesn't do any grabs as SDL grabs
@@ -138,7 +138,7 @@ class QemuRunner:
         self.origchldhandler = signal.getsignal(signal.SIGCHLD)
         signal.signal(signal.SIGCHLD, self.handleSIGCHLD)
 
-        launch_cmd = 'runqemu snapshot %s ' % runqemuparams
+        launch_cmd = 'runqemu %s %s ' % ('snapshot' if discard_writes else '', runqemuparams)
         if self.use_kvm:
             logger.info('Using kvm for runqemu')
             launch_cmd += 'kvm '
-- 
git-series 0.9.1

