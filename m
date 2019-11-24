Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com
	[209.85.210.174])
	by mail.openembedded.org (Postfix) with ESMTP id 22C887F76B
	for <openembedded-core@lists.openembedded.org>;
	Sun, 24 Nov 2019 16:25:17 +0000 (UTC)
Received: by mail-pf1-f174.google.com with SMTP id d199so1409272pfd.11
	for <openembedded-core@lists.openembedded.org>;
	Sun, 24 Nov 2019 08:25:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=3wMagoqWbFx2DzvGcSBlx9MLibObTsq8ai8bDDw0nL4=;
	b=S/2VegwZ1WiKqgxrPq8vs48wsmxEnin6tlCvagX9lUzzA5PtH6yPbte87nU76oo+uI
	pJ490+QgAQVeCgnJgepJzP2AnO6LDpGkEPKGRqfdyyvirs0ZZ9R+0PXTGXnsvYjKqwL/
	Hpd602/9y9LpI+WmEwCSmh+/v1tEh0DfXkC54hUHtnIlpLNbnKRLfazpXpcxBrNpqUbU
	9vyw+AkEbv+QUIxjgfLciDTe90cZx5dtkJxNuTPZNJw/EIrKC1WgpmMNqF0UrBs0JW5u
	DdRkTCNyb/ZlBpyo2YarWqWgby1/cLejKCwl+tnEfplH8eb0EAvk3SjMku5WcxV77Mv3
	Wk/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=3wMagoqWbFx2DzvGcSBlx9MLibObTsq8ai8bDDw0nL4=;
	b=ohO7QfqILQuEg9uAO3CUuAL9eX5COPOZIRrX+TrQbGPhF0gAwaorxUIeOJMMI+OSrq
	KefvbK2QVcq1wbAbROYpAdKJYeDvO85b5cV0RxHUecqTDN/H1FQluBkZ2sNVII1ha7sc
	yfk3DOPapDuXWAfIt1jar/RsrYTW4/xLuTEEAjEV0+uJ/rI2J02/DGT0N4gwDoQObCWB
	2H0/j1AhowSFpCJaj0NkU1EutrbxCHx+Vf1HfaMbldEpeidoiYFXgaSwFF1v+QbbTu7K
	AT8w/y+mUcqpSHenYrFukmw4LHXmd3nJJdG7I+zU9pEururf0wS7WbmxKZaWdoY45ez5
	pKqQ==
X-Gm-Message-State: APjAAAUZJb+2HdaUZ4DGhTWX01eT9fxlt8uzLp9N2kIfUeENfOkdRun0
	v/O1vNsM310W4DaZK/YV0nbatQi9
X-Google-Smtp-Source: APXvYqx6/v0UKiJevUS/PE2q7kdFJyDTfADmFf3pYQTcxxLbLkoHkph4KEvfehIqMXXFosPHd907Ig==
X-Received: by 2002:a63:fc09:: with SMTP id j9mr27100056pgi.272.1574612718809; 
	Sun, 24 Nov 2019 08:25:18 -0800 (PST)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:a5c0:69ac:e4d2:e89f:98da])
	by smtp.gmail.com with ESMTPSA id 83sm5238535pgh.12.2019.11.24.08.25.17
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 24 Nov 2019 08:25:18 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 24 Nov 2019 08:25:16 -0800
Message-Id: <1574612716-31823-1-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [zeus][PATCH] oeqa: reproducible: Add option to capture bad packages
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
X-List-Received-Date: Sun, 24 Nov 2019 16:25:18 -0000

From: Joshua Watt <JPEWhacker@gmail.com>

Adds an option that can be used to copy the offending packages to a temp
directory for later evaluation. This is useful on the Autobuilder to
investigate failures.

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/lib/oeqa/selftest/cases/reproducible.py | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/meta/lib/oeqa/selftest/cases/reproducible.py b/meta/lib/oeqa/selftest/cases/reproducible.py
index c235c13..a911056 100644
--- a/meta/lib/oeqa/selftest/cases/reproducible.py
+++ b/meta/lib/oeqa/selftest/cases/reproducible.py
@@ -5,11 +5,16 @@
 
 from oeqa.selftest.case import OESelftestTestCase
 from oeqa.utils.commands import runCmd, bitbake, get_bb_var, get_bb_vars
+import bb.utils
 import functools
 import multiprocessing
 import textwrap
 import json
 import unittest
+import tempfile
+import shutil
+import stat
+import os
 
 MISSING = 'MISSING'
 DIFFERENT = 'DIFFERENT'
@@ -74,6 +79,7 @@ def compare_file(reference, test, diffutils_sysroot):
 class ReproducibleTests(OESelftestTestCase):
     package_classes = ['deb', 'ipk']
     images = ['core-image-minimal']
+    save_results = False
 
     def setUpLocal(self):
         super().setUpLocal()
@@ -117,9 +123,18 @@ class ReproducibleTests(OESelftestTestCase):
         self.extrasresults['reproducible']['files'].setdefault(package_class, {})[name] = [
                 {'reference': p.reference, 'test': p.test} for p in packages]
 
+    def copy_file(self, source, dest):
+        bb.utils.mkdirhier(os.path.dirname(dest))
+        shutil.copyfile(source, dest)
+
     def test_reproducible_builds(self):
         capture_vars = ['DEPLOY_DIR_' + c.upper() for c in self.package_classes]
 
+        if self.save_results:
+            save_dir = tempfile.mkdtemp(prefix='oe-reproducible-')
+            os.chmod(save_dir, stat.S_IRWXU | stat.S_IRGRP | stat.S_IXGRP | stat.S_IROTH | stat.S_IXOTH)
+            self.logger.info('Non-reproducible packages will be copied to %s', save_dir)
+
         # Build native utilities
         self.write_config('')
         bitbake("diffutils-native -c addto_recipe_sysroot")
@@ -176,6 +191,11 @@ class ReproducibleTests(OESelftestTestCase):
                 self.write_package_list(package_class, 'different', result.different)
                 self.write_package_list(package_class, 'same', result.same)
 
+                if self.save_results:
+                    for d in result.different:
+                        self.copy_file(d.reference, '/'.join([save_dir, d.reference]))
+                        self.copy_file(d.test, '/'.join([save_dir, d.test]))
+
                 if result.missing or result.different:
                     self.fail("The following %s packages are missing or different: %s" %
                             (c, ' '.join(r.test for r in (result.missing + result.different))))
-- 
2.7.4


