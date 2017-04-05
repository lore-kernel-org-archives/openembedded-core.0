Return-Path: <patrick.ohly@intel.com>
Received: from mail-it0-f48.google.com (mail-it0-f48.google.com
	[209.85.214.48])
	by mail.openembedded.org (Postfix) with ESMTP id DDB6877B6E
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Apr 2017 13:36:24 +0000 (UTC)
Received: by mail-it0-f48.google.com with SMTP id y18so82860365itc.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 05 Apr 2017 06:36:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=pw1XT4NlVcBHAhzxr39YBwAfgTh9YDh73lknzeNihKQ=;
	b=It6+5hTtvkFc/GzwZiyYysriGoXpX1jgLEjuK68EAl3LN+aKsiXaDkthiXVjflwNPv
	sCsoOhSylnxAFdNHEZBuTiAm4e9TIDjXuD+pmZ96Hg8O7dyd7k4YhQ5Tiet13f0JgX4Y
	6Pbhe2/nNYa0ov84TUNbWY2qeMY2cymlA5Z3+ZI6IiN5Q65/1PtcpgC+lWrYXxPCQADf
	3J5KuaG+GKAvKWUFtCqGkkH2ik6TM8mVzrRKcHl9wVCYDNEmejG+ZXCmi2W2NKMtXGh8
	pj6wm0jCfZdMVJpPhPuHxxmDCqdK8Kf/eFLxgBeObi7OyDspbvx8I3onQEBReTVvPSvD
	ArsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=pw1XT4NlVcBHAhzxr39YBwAfgTh9YDh73lknzeNihKQ=;
	b=eJWNzgB/CIbTsQHzLkdWDSqQArj2SfII2CmeUznRNy60REZ4+H9elTEzWSqx/FcRe2
	q2vU3pE8OrGx6ceLBcqgXybZir9Q/zvcdyRoM5ycNq2xHeCBDZ3Ma2h24F9Vez6qeejr
	3kDzD4PQmRud2Oloy+hbjZa3MU3b12gqDD4+SLoVOlrkPkFAg5w7WuQBUjM4BoF9ps8t
	s60nkPA8AKEi+7ra5mpXNmlgBazS4sJwg2mnGpRquYLpi1skTw9rdt1CLTeGeM1YAlgO
	B1McwwZI4D7gA9UpHQBhdCeg3ktomDlbHe3FobatZ+vkrA23KCKvKWe7ggJRFwXEltho
	RXDA==
X-Gm-Message-State: AFeK/H097pYHIF6X4UW405CFjItQnV/sM54Iec+Y1CtTDlBaofHY6Ki/gNOCCTfn3NKXTyjz
X-Received: by 10.36.136.132 with SMTP id i126mr21755340itd.107.1491399385777; 
	Wed, 05 Apr 2017 06:36:25 -0700 (PDT)
Received: from pohly-desktop.fritz.box (p5DE8E12B.dip0.t-ipconnect.de.
	[93.232.225.43]) by smtp.gmail.com with ESMTPSA id
	l129sm13211911ite.1.2017.04.05.06.36.23
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 05 Apr 2017 06:36:24 -0700 (PDT)
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  5 Apr 2017 15:36:04 +0200
Message-Id: <c6117f2ee3265d225f6af7c3bbc2d85565fc7089.1491399200.git-series.patrick.ohly@intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.3970fab18c2598adf378d62e8fcba4ca004fbd13.1491399200.git-series.patrick.ohly@intel.com>
References: <cover.3970fab18c2598adf378d62e8fcba4ca004fbd13.1491399200.git-series.patrick.ohly@intel.com>
Cc: paul.eggleton@linux.intel.com
Subject: [PATCH 1/3] yocto-compat-layer: fix also other command invocations
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
X-List-Received-Date: Wed, 05 Apr 2017 13:36:25 -0000

In commit 5b9ac62ab535d, one place was fixed where a command was
invoked such that failures caused double stack traces and stderr was
lost. The same problem also occurs elsewhere, triggered for example by
a layer with parsing problems.

Now a new utility method is used instead of repeating the code.

Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
---
 scripts/lib/compatlayer/__init__.py     | 23 ++++++++++++++++-------
 scripts/lib/compatlayer/cases/common.py | 25 +++++--------------------
 2 files changed, 21 insertions(+), 27 deletions(-)

diff --git a/scripts/lib/compatlayer/__init__.py b/scripts/lib/compatlayer/__init__.py
index 86f86eb..9eb862d 100644
--- a/scripts/lib/compatlayer/__init__.py
+++ b/scripts/lib/compatlayer/__init__.py
@@ -4,6 +4,7 @@
 # Released under the MIT license (see COPYING.MIT)
 
 import os
+import subprocess
 from enum import Enum
 
 class LayerType(Enum):
@@ -199,8 +200,20 @@ def add_layer(bblayersconf, layer, layers, logger):
 
     return True
 
+def check_command(error_msg, cmd):
+    '''
+    Run a command under a shell, capture stdout and stderr in a single stream,
+    throw an error when command returns non-zero exit code. Returns the output.
+    '''
+
+    p = subprocess.Popen(cmd, shell=True, stdout=subprocess.PIPE, stderr=subprocess.STDOUT)
+    output, _ = p.communicate()
+    if p.returncode:
+        msg = "%s\nCommand: %s\nOutput:\n%s" % (error_msg, cmd, output.decode('utf-8'))
+        raise RuntimeError(msg)
+    return output
+
 def get_signatures(builddir, failsafe=False):
-    import subprocess
     import re
 
     # some recipes needs to be excluded like meta-world-pkgdata
@@ -214,12 +227,8 @@ def get_signatures(builddir, failsafe=False):
     if failsafe:
         cmd += '-k '
     cmd += '-S none world'
-    p = subprocess.Popen(cmd, shell=True,
-                         stdout=subprocess.PIPE, stderr=subprocess.STDOUT)
-    output, _ = p.communicate()
-    if p.returncode:
-        msg = "Generating signatures failed. This might be due to some parse error and/or general layer incompatibilities.\nCommand: %s\nOutput:\n%s" % (cmd, output.decode('utf-8'))
-        raise RuntimeError(msg)
+    check_command('Generating signatures failed. This might be due to some parse error and/or general layer incompatibilities.',
+                  cmd)
     sigs_file = os.path.join(builddir, 'locked-sigs.inc')
 
     sig_regex = re.compile("^(?P<task>.*:.*):(?P<hash>.*) .$")
diff --git a/scripts/lib/compatlayer/cases/common.py b/scripts/lib/compatlayer/cases/common.py
index 4d328ec..9cc682e 100644
--- a/scripts/lib/compatlayer/cases/common.py
+++ b/scripts/lib/compatlayer/cases/common.py
@@ -2,9 +2,8 @@
 # Released under the MIT license (see COPYING.MIT)
 
 import os
-import subprocess
 import unittest
-from compatlayer import get_signatures, LayerType
+from compatlayer import get_signatures, LayerType, check_command
 from compatlayer.case import OECompatLayerTestCase
 
 class CommonCompatLayer(OECompatLayerTestCase):
@@ -20,26 +19,12 @@ class CommonCompatLayer(OECompatLayerTestCase):
                 msg="Layer contains README file but is empty.")
 
     def test_parse(self):
-        try:
-            output = subprocess.check_output('bitbake -p', shell=True,
-                    stderr=subprocess.PIPE)
-        except subprocess.CalledProcessError as e:
-            import traceback
-            exc = traceback.format_exc()
-            msg = 'Layer %s failed to parse.\n%s\n%s\n' % (self.tc.layer['name'],
-                    exc, e.output.decode('utf-8'))
-            raise RuntimeError(msg)
+        check_command('Layer %s failed to parse.' % self.tc.layer['name'],
+                      'bitbake -p')
 
     def test_show_environment(self):
-        try:
-            output = subprocess.check_output('bitbake -e', shell=True,
-                    stderr=subprocess.PIPE)
-        except subprocess.CalledProcessError as e:
-            import traceback
-            exc = traceback.format_exc()
-            msg = 'Layer %s failed to show environment.\n%s\n%s\n' % \
-                    (self.tc.layer['name'], exc, e.output.decode('utf-8'))
-            raise RuntimeError(msg)
+        check_command('Layer %s failed to show environment.' % self.tc.layer['name'],
+                      'bitbake -e')
 
     def test_signatures(self):
         if self.tc.layer['type'] == LayerType.SOFTWARE:
-- 
git-series 0.9.1

