Return-Path: <patrick.ohly@intel.com>
Received: from mail-io0-f173.google.com (mail-io0-f173.google.com
	[209.85.223.173])
	by mail.openembedded.org (Postfix) with ESMTP id D9B6877C3C
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Apr 2017 14:57:29 +0000 (UTC)
Received: by mail-io0-f173.google.com with SMTP id t68so6272850iof.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Apr 2017 07:57:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=zkzRVlhZbcSLwuJm1Fuw8w8/Y05dMoFccoDNaFFQwnk=;
	b=zwIwqhESlOLRd6eLSt0NUrl5mObeDjQQ6zQDfg7zERNI4TgicQePAvm0nOZR4M2b6S
	BmQjqvCG9wRlx3LYbTLXzq251zAwa2L5X5doXUbVkvPwTfxrMtqlSMYxyq+jbH6e5cgX
	Se8uNEdA2EbomwWr5Ihqa/LPOs7zphSsm1sKYVLGCVNGcY9HLxiundJFyEaEBpcedsxz
	M9/1OY1o+CG6h0kpZujw3FwtlaoM5m5YVW/gpmcFdoVi5QcU/zM8EliH09kWBdI9ifq6
	xk5R2au6oomv/W/CgZlL6FI3J6ujqLicJwxMupK8kPuLf8jbVYCb6qM/fJkIucwR1tgV
	7idA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=zkzRVlhZbcSLwuJm1Fuw8w8/Y05dMoFccoDNaFFQwnk=;
	b=Js9ta2+q6kRY1jUnA/z0WUuh6CYQugsNh2l0iJgKE8KsxsEXOyXA6ajXIoFhkakhSf
	dOdPx5XeRRPYXD/FUBr3lBrSMNfxUPKJdWSr3O4SNiEnkXXbNbt0RwxpzxpFHAUaBe/T
	CZuGyoRPgdVnE0dWkjjm0L+5rocB/SyoCjbptRKNk35w2HIHVIaQklqQrPHAXzLkA/kK
	Hi9ruB4W93s5pg+gBY0F9KHC7QobIa3y73U/RYschecSPoQnobeI+fgzdaxdvRCk+yrs
	VEdWbAbmdWnz0FyclqVgLjOjJVwCS6TQDkevkq8QwdE8n2trwtpWN+amthSvBsqDGlQ8
	R2+g==
X-Gm-Message-State: AFeK/H1qHggjZAe4jVrU0Zan5lLP56iaQTvQ5j4m4HcduVcfFatrfUOgfoc5ouxGLXFOvOBS
X-Received: by 10.107.8.85 with SMTP id 82mr55256826ioi.163.1491922650753;
	Tue, 11 Apr 2017 07:57:30 -0700 (PDT)
Received: from pohly-desktop.fritz.box (p5DE8D3A2.dip0.t-ipconnect.de.
	[93.232.211.162])
	by smtp.gmail.com with ESMTPSA id 71sm8025298iof.29.2017.04.11.07.57.28
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 11 Apr 2017 07:57:29 -0700 (PDT)
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 11 Apr 2017 16:57:01 +0200
Message-Id: <3c1df285ce6043ddf6b8c8f615935c7cbe5c13b0.1491922350.git-series.patrick.ohly@intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.a248491aa166631c9f866a7a8314fe9f92a1420b.1491922350.git-series.patrick.ohly@intel.com>
References: <cover.a248491aa166631c9f866a7a8314fe9f92a1420b.1491922350.git-series.patrick.ohly@intel.com>
Subject: [PATCH v3 8/8] yocto-compat-layer: better handling of per-machine world build breakage
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
X-List-Received-Date: Tue, 11 Apr 2017 14:57:31 -0000

It is fairly common that BSP layers enable recipes when choosing
machines from that layer without checking whether the recipe actually
builds in the current distro. That breaks "bitbake world", retrieving
signatures and thus the test_machine_signatures test.

It's better to let that test continue with the signatures that can be
retrieved and report the broken world build separately. Right now, the
new test_machine_world iterates over all machines. More elegant and
useful in combination with a (currently missing) selection of which
tests to run would be generate one test instance per machine. But that
is not straightforward and has to wait.

The "-k" argument alone was not enough to proceed despite failures,
because bitbake then still returns a non-zero exit code. The existance
of the output file is taken as sign that the bitbake execution managed
was not fatally broken.

Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
---
 scripts/lib/compatlayer/__init__.py  | 16 ++++++++++++++--
 scripts/lib/compatlayer/cases/bsp.py | 26 ++++++++++++++++++++++++++
 2 files changed, 40 insertions(+), 2 deletions(-)

diff --git a/scripts/lib/compatlayer/__init__.py b/scripts/lib/compatlayer/__init__.py
index 0d6f4e9..e35f8c0 100644
--- a/scripts/lib/compatlayer/__init__.py
+++ b/scripts/lib/compatlayer/__init__.py
@@ -233,9 +233,21 @@ def get_signatures(builddir, failsafe=False, machine=None):
     if failsafe:
         cmd += '-k '
     cmd += '-S none world'
-    check_command('Generating signatures failed. This might be due to some parse error and/or general layer incompatibilities.',
-                  cmd)
     sigs_file = os.path.join(builddir, 'locked-sigs.inc')
+    if os.path.exists(sigs_file):
+        os.unlink(sigs_file)
+    try:
+        check_command('Generating signatures failed. This might be due to some parse error and/or general layer incompatibilities.',
+                      cmd)
+    except RuntimeError as ex:
+        if failsafe and os.path.exists(sigs_file):
+            # Ignore the error here. Most likely some recipes active
+            # in a world build lack some dependencies. There is a
+            # separate test_machine_world_build which exposes the
+            # failure.
+            pass
+        else:
+            raise
 
     sig_regex = re.compile("^(?P<task>.*:.*):(?P<hash>.*) .$")
     tune_regex = re.compile("(^|\s)SIGGEN_LOCKEDSIGS_t-(?P<tune>\S*)\s*=\s*")
diff --git a/scripts/lib/compatlayer/cases/bsp.py b/scripts/lib/compatlayer/cases/bsp.py
index b205568..d07c96e 100644
--- a/scripts/lib/compatlayer/cases/bsp.py
+++ b/scripts/lib/compatlayer/cases/bsp.py
@@ -25,6 +25,32 @@ class BSPCompatLayer(OECompatLayerTestCase):
                 msg="Layer %s modified machine %s -> %s" % \
                     (self.tc.layer['name'], self.td['bbvars']['MACHINE'], machine))
 
+
+    def test_machine_world(self):
+        '''
+        "bitbake world" is expected to work regardless which machine is selected.
+        BSP layers sometimes break that by enabling a recipe for a certain machine
+        without checking whether that recipe actually can be built in the current
+        distro configuration (for example, OpenGL might not enabled).
+
+        This test iterates over all machines. It would be nicer to instantiate
+        it once per machine. It merely checks for errors during parse
+        time. It does not actually attempt to build anything.
+        '''
+
+        if not self.td['machines']:
+            self.skipTest('No machines set with --machines.')
+        msg = []
+        for machine in self.td['machines']:
+            # In contrast to test_machine_signatures() below, errors are fatal here.
+            try:
+                get_signatures(self.td['builddir'], failsafe=False, machine=machine)
+            except RuntimeError as ex:
+                msg.append(str(ex))
+        if msg:
+            msg.insert(0, 'The following machines broke a world build:')
+            self.fail('\n'.join(msg))
+
     def test_machine_signatures(self):
         '''
         Selecting a machine may only affect the signature of tasks that are specific
-- 
git-series 0.9.1

