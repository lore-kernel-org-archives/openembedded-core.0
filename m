Return-Path: <richard@rpsys.net>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 62DE977360
	for <openembedded-core@lists.openembedded.org>;
	Wed,  1 Jun 2016 12:36:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u51CZslU006905; Wed, 1 Jun 2016 13:35:57 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id HK_-btqsuPsm; Wed,  1 Jun 2016 13:35:57 +0100 (BST)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u51CZpl8006889
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Wed, 1 Jun 2016 13:35:52 +0100
Received: from richard by hex with local (Exim 4.86)
	(envelope-from <richard@rpsys.net>)
	id 1b85NH-0000lr-HA; Wed, 01 Jun 2016 13:35:51 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Wed,  1 Jun 2016 13:35:39 +0100
Message-Id: <1464784540-2786-21-git-send-email-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <1464784540-2786-1-git-send-email-richard.purdie@linuxfoundation.org>
References: <1464784540-2786-1-git-send-email-richard.purdie@linuxfoundation.org>
Subject: [PATCH 21/22] oeqa/selftest/recipetool.py: Use regex to match warning line
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
X-List-Received-Date: Wed, 01 Jun 2016 12:36:01 -0000

From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>

We are observing cases (see below) where the 'WARNING:' prefix is not at the
beginning of a line, so instead of expecting it in the beginning, match it with
a regex.

    ======================================================================
    FAIL: test_recipetool_appendfile_patch (oeqa.selftest.recipetool.RecipetoolTests)
    ----------------------------------------------------------------------
    Traceback (most recent call last):
      File "/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-oe-selftest/build/meta/lib/oeqa/utils/decorators.py", line 109, in wrapped_f
        return func(*args, **kwargs)
      File "/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-oe-selftest/build/meta/lib/oeqa/selftest/recipetool.py", line 285, in test_recipetool_appendfile_patch
        self.fail('Patch warning not found in output:\n%s' % output)
    AssertionError: Patch warning not found in output:
    Parsing recipes..WARNING: File /etc/selftest-replaceme-patched is added by the patch /home/pokybuild/yocto-autobuilder/yocto-worker/nightly-oe-selftest/build/meta-selftest/recipes-test/recipetool/files/add-file.patch - you may need to remove or replace this patch in order to replace the file.
    NOTE: Writing append file /tmp/recipetoolqaug0kdb4x/recipes-test/recipetool/selftest-recipetool-appendfile.bbappend
    NOTE: Copying /tmp/recipetoolqagci9tita/testfile to /tmp/recipetoolqaug0kdb4x/recipes-test/recipetool/selftest-recipetool-appendfile/testfile
    done.

Signed-off-by: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/selftest/recipetool.py | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oeqa/selftest/recipetool.py b/meta/lib/oeqa/selftest/recipetool.py
index a93d18e..7c60699 100644
--- a/meta/lib/oeqa/selftest/recipetool.py
+++ b/meta/lib/oeqa/selftest/recipetool.py
@@ -2,6 +2,7 @@ import os
 import logging
 import tempfile
 import urllib.parse
+import re
 
 from oeqa.utils.commands import runCmd, bitbake, get_bb_var, create_temp_layer
 from oeqa.utils.decorators import testcase
@@ -278,8 +279,9 @@ class RecipetoolTests(RecipetoolBase):
                          '}\n']
         _, output = self._try_recipetool_appendfile('selftest-recipetool-appendfile', '/etc/selftest-replaceme-patched', self.testfile, '', expectedlines, ['testfile'])
         for line in output.splitlines():
-            if line.startswith('WARNING: '):
-                self.assertIn('add-file.patch', line, 'Unexpected warning found in output:\n%s' % line)
+            # match the line containing the warning and the patch
+            match = re.match("(WARNING:).*(add-file.patch)", line)
+            if match:
                 break
         else:
             self.fail('Patch warning not found in output:\n%s' % output)
-- 
2.5.0


