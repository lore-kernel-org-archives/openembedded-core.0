Return-Path: <richard@rpsys.net>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id BBA0B7881D
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Jan 2018 16:11:28 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	w05GBRgc013062
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Fri, 5 Jan 2018 16:11:28 GMT
Received: from richard by hex with local (Exim 4.86_2)
	(envelope-from <richard@rpsys.net>)
	id 1eXUad-0007Os-Sq; Fri, 05 Jan 2018 16:11:27 +0000
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Fri,  5 Jan 2018 16:11:26 +0000
Message-Id: <1515168686-28402-2-git-send-email-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1515168686-28402-1-git-send-email-richard.purdie@linuxfoundation.org>
References: <1515168686-28402-1-git-send-email-richard.purdie@linuxfoundation.org>
X-Virus-Scanned: clamav-milter 0.99.2 at dan
X-Virus-Status: Clean
Subject: [PATCH 2/2] bitbake.conf: Set AUTOREV to have a vardepvalue
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
X-List-Received-Date: Fri, 05 Jan 2018 16:11:30 -0000

If you have a recipe which does not include SRCPV in PV but does set
SRCREV = "${AUTOREV}" and you run do_fetch, then change the repo to a
new commit then run do_unpack, do_unpack will fail since the new commit
doesn't exist in the repo that was fetched.

The problem is the revision chosen is not represented in the do_fetch
task hash. It if were, the fetch would rerun first and the commit would be
present. It works when PV includes SRCPV since that does contain the chosen
commit from the AUTOREV.

The solution is to include the SRCPV value into the representation of AUTOREV
used for checksum calculation purposes.

Add a selftest for this issue.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/conf/bitbake.conf                      |  1 +
 meta/lib/oeqa/selftest/cases/sstatetests.py | 38 ++++++++++++++++++++++++++++-
 2 files changed, 38 insertions(+), 1 deletion(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 15feb57..93afb13 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -663,6 +663,7 @@ FETCHCMD_hg = "/usr/bin/env hg"
 SRCDATE = "${DATE}"
 SRCREV ??= "INVALID"
 AUTOREV = "${@bb.fetch2.get_autorev(d)}"
+AUTOREV[vardepvalue] = "${SRCPV}"
 # Set Dynamically in base.bbclass
 # SRCPV = "${@bb.fetch2.get_srcrev(d)}"
 SRCPV[vardepvalue] = "${SRCPV}"
diff --git a/meta/lib/oeqa/selftest/cases/sstatetests.py b/meta/lib/oeqa/selftest/cases/sstatetests.py
index 4790088..6735694 100644
--- a/meta/lib/oeqa/selftest/cases/sstatetests.py
+++ b/meta/lib/oeqa/selftest/cases/sstatetests.py
@@ -2,15 +2,51 @@ import os
 import shutil
 import glob
 import subprocess
+import tempfile
 
 from oeqa.selftest.case import OESelftestTestCase
-from oeqa.utils.commands import runCmd, bitbake, get_bb_var, get_test_layer
+from oeqa.utils.commands import runCmd, bitbake, get_bb_var, get_test_layer, create_temp_layer
 from oeqa.selftest.cases.sstate import SStateBase
 from oeqa.core.decorator.oeid import OETestID
 
 import bb.siggen
 
 class SStateTests(SStateBase):
+    def test_autorev_sstate_works(self):
+        # Test that a git repository which changes is correctly handled by SRCREV = ${AUTOREV}
+        # when PV does not contain SRCPV
+
+        tempdir = tempfile.mkdtemp(prefix='oeqa')
+        self.track_for_cleanup(tempdir)
+        create_temp_layer(tempdir, 'selftestrecipetool')
+        self.add_command_to_tearDown('bitbake-layers remove-layer %s' % tempdir)
+        runCmd('bitbake-layers add-layer %s' % tempdir)
+
+        # Use dbus-wait as a local git repo we can add a commit between two builds in
+        pn = 'dbus-wait'
+        srcrev = '6cc6077a36fe2648a5f993fe7c16c9632f946517'
+        url = 'git://git.yoctoproject.org/dbus-wait'
+        result = runCmd('git clone %s noname' % url, cwd=tempdir)
+        srcdir = os.path.join(tempdir, 'noname')
+        result = runCmd('git reset --hard %s' % srcrev, cwd=srcdir)
+        self.assertTrue(os.path.isfile(os.path.join(srcdir, 'configure.ac')), 'Unable to find configure script in source directory')
+
+        recipefile = os.path.join(tempdir, "recipes-test", "dbus-wait-test", 'dbus-wait-test_git.bb')
+        os.makedirs(os.path.dirname(recipefile))
+        srcuri = 'git://' + srcdir + ';protocol=file'
+        result = runCmd(['recipetool', 'create', '-o', recipefile, srcuri])
+        self.assertTrue(os.path.isfile(recipefile), 'recipetool did not create recipe file; output:\n%s' % result.output)
+
+        with open(recipefile, 'a') as f:
+            f.write('SRCREV = "${AUTOREV}"\n')
+            f.write('PV = "1.0"\n')
+
+        bitbake("dbus-wait-test -c fetch")
+        with open(os.path.join(srcdir, "bar.txt"), "w") as f:
+            f.write("foo")
+        result = runCmd('git add bar.txt; git commit -asm "add bar"', cwd=srcdir)
+        bitbake("dbus-wait-test -c unpack")
+
 
     # Test sstate files creation and their location
     def run_test_sstate_creation(self, targets, distro_specific=True, distro_nonspecific=True, temp_sstate_location=True, should_pass=True):
-- 
2.7.4


