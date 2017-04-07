Return-Path: <patrick.ohly@intel.com>
Received: from mail-io0-f178.google.com (mail-io0-f178.google.com
	[209.85.223.178])
	by mail.openembedded.org (Postfix) with ESMTP id 966C877DA9
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Apr 2017 16:38:28 +0000 (UTC)
Received: by mail-io0-f178.google.com with SMTP id t68so19344780iof.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 07 Apr 2017 09:38:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=pw1XT4NlVcBHAhzxr39YBwAfgTh9YDh73lknzeNihKQ=;
	b=pdsUE0qdCa+xvfhzjbMOeQSU8HCDGVLTIY0v6uO2e8dg8RNQzwFNc4uJBK/qI06bEl
	c05TXsmCnZnAK9hBDKQ1Qxfa3YOrQ6dOim/nShaH4KNZC0JdcgW2hz/6o/YgAWIiruyU
	8acycdpR5LTyDwRlO3vJRj+/FpWGA7Z4BuxJIWfpZzXF7Nm/C5xEMjKZn5ctbV5AXl4F
	SKMi/Fhg56wcJY8KKMtcv66NWRlaVf33/zSaoc5jyXoZe7Yyb5WyLQ1I9eNxbRjsjt7j
	eZ1b/b2NdTgtDcmq95wljIUrKIicaex7YqNZzM0ry/kPbtb0+4+flQeL+xXoAFCNz7Uw
	XaAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=pw1XT4NlVcBHAhzxr39YBwAfgTh9YDh73lknzeNihKQ=;
	b=h5oJwo/QLi2XUY3diNo3m8gNmGKMKqrTjSYWn3VwwtTM38Zj+U56zRPZlPDPciA5Qc
	BPtvbtHHEQQQDirnOlWWPnsP8aBbKGHBM34fWxc2f3qnMRtgvl3JGfqwjxJO++4pgAap
	kLg5evjlORla4e7JJEEWtd50Y3q4o4O95oFmdDTM4wyOmnMAOvOXtap7P5NGKijaU8eL
	Hfewgch6PPpLYn4CsXfaeSDEo3BHKbeLYdi758WXviyabZxnJeeOgQZcQ4A3TEsE0QT6
	I1Zg1jNM5Il8hehwlVAGMY1GN3u2M1qhSqXKO94733xLPvzSMrE2I4+E/6xPtayULVD8
	pV3g==
X-Gm-Message-State: AN3rC/5wsVy8BYBEWYcvz38UK1U0v0Ikw2tneN6Sficto/7ZXoN4EfHuUYVX/6y6ExufX9ji
X-Received: by 10.107.9.15 with SMTP id j15mr1531430ioi.43.1491583109571;
	Fri, 07 Apr 2017 09:38:29 -0700 (PDT)
Received: from pohly-desktop.fritz.box (p5DE8EAD9.dip0.t-ipconnect.de.
	[93.232.234.217]) by smtp.gmail.com with ESMTPSA id
	n10sm11907916itg.8.2017.04.07.09.38.27
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 07 Apr 2017 09:38:28 -0700 (PDT)
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  7 Apr 2017 18:38:16 +0200
Message-Id: <07ea7f5bf25f51c9e074bffac1f276173b2ae314.1491583077.git-series.patrick.ohly@intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.d48bda0d5a83909c959650e8872315be6a4162a7.1491583077.git-series.patrick.ohly@intel.com>
References: <cover.d48bda0d5a83909c959650e8872315be6a4162a7.1491583077.git-series.patrick.ohly@intel.com>
Cc: paul.eggleton@linux.intel.com
Subject: [PATCH 1/5] yocto-compat-layer: fix also other command invocations
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
X-List-Received-Date: Fri, 07 Apr 2017 16:38:28 -0000

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

