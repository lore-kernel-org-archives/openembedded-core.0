Return-Path: <anibal.limon@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 162C978350
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 May 2017 20:39:10 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	26 May 2017 13:39:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.38,399,1491289200"; d="scan'208";a="266887938"
Received: from tsriniv-mobl.amr.corp.intel.com (HELO
	alimonb-mobl1.amr.corp.intel.com) ([10.254.103.51])
	by fmsmga004.fm.intel.com with ESMTP; 26 May 2017 13:39:09 -0700
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 26 May 2017 15:37:58 -0500
Message-Id: <bad34c78cf580180fc76ef32508e16db21da5eb9.1495830706.git.anibal.limon@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1495830706.git.anibal.limon@linux.intel.com>
References: <cover.1495830706.git.anibal.limon@linux.intel.com>
In-Reply-To: <cover.1495830706.git.anibal.limon@linux.intel.com>
References: <cover.1495830706.git.anibal.limon@linux.intel.com>
MIME-Version: 1.0
Cc: paul.eggleton@linux.intel.com
Subject: [PATCH 32/36] oeqa/selftest/case.py: Remove machine selection logic
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
X-List-Received-Date: Fri, 26 May 2017 20:39:10 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>

The machine selection is an operation that needs to be made
in every test run, the best place to it is on the context
module.

Use self.tc.custommachine variable instead of use environment.

SIgned-off-by: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
Signed-off-by: Aníbal Limón <anibal.limon@linux.intel.com>
---
 meta/lib/oeqa/selftest/case.py | 37 ++++---------------------------------
 1 file changed, 4 insertions(+), 33 deletions(-)

diff --git a/meta/lib/oeqa/selftest/case.py b/meta/lib/oeqa/selftest/case.py
index ca95b7e..1e6754a 100644
--- a/meta/lib/oeqa/selftest/case.py
+++ b/meta/lib/oeqa/selftest/case.py
@@ -6,7 +6,6 @@ import os
 import shutil
 import glob
 import errno
-from random import choice
 from unittest.util import safe_repr
 
 import oeqa.utils.ftools as ftools
@@ -135,16 +134,9 @@ to ensure accurate results.")
                 if e.errno != errno.ENOENT:
                     raise
 
-        # Get CUSTOMMACHINE from env (set by --machine argument to oe-selftest)
-        custommachine = os.getenv('CUSTOMMACHINE')
-        if custommachine:
-            if custommachine == 'random':
-                machine = get_random_machine()
-            else:
-                machine = custommachine
-            machine_conf = 'MACHINE ??= "%s"\n' % machine
+        if self.tc.custommachine:
+            machine_conf = 'MACHINE ??= "%s"\n' % self.tc.custommachine
             self.set_machine_config(machine_conf)
-            print('MACHINE: %s' % machine)
 
         # tests might need their own setup
         # but if they overwrite this one they have to call
@@ -196,8 +188,7 @@ to ensure accurate results.")
         self.logger.debug("Writing to: %s\n%s\n" % (self.testinc_path, data))
         ftools.write_file(self.testinc_path, data)
 
-        custommachine = os.getenv('CUSTOMMACHINE')
-        if custommachine and 'MACHINE' in data:
+        if self.tc.custommachine and 'MACHINE' in data:
             machine = get_bb_var('MACHINE')
             self.logger.warning('MACHINE overridden: %s' % machine)
 
@@ -206,8 +197,7 @@ to ensure accurate results.")
         self.logger.debug("Appending to: %s\n%s\n" % (self.testinc_path, data))
         ftools.append_file(self.testinc_path, data)
 
-        custommachine = os.getenv('CUSTOMMACHINE')
-        if custommachine and 'MACHINE' in data:
+        if self.tc.custommachine and 'MACHINE' in data:
             machine = get_bb_var('MACHINE')
             self.logger.warning('MACHINE overridden: %s' % machine)
 
@@ -274,22 +264,3 @@ to ensure accurate results.")
         if os.path.exists(expr):
             msg = self._formatMessage(msg, "%s exists when it should not" % safe_repr(expr))
             raise self.failureException(msg)
-
-def get_available_machines():
-    # Get a list of all available machines
-    bbpath = get_bb_var('BBPATH').split(':')
-    machines = []
-
-    for path in bbpath:
-        found_machines = glob.glob(os.path.join(path, 'conf', 'machine', '*.conf'))
-        if found_machines:
-            for i in found_machines:
-            # eg: '/home/<user>/poky/meta-intel/conf/machine/intel-core2-32.conf'
-                machines.append(os.path.splitext(os.path.basename(i))[0])
-
-    return machines
-
-
-def get_random_machine():
-    # Get a random machine
-    return choice(get_available_machines())
-- 
2.1.4


