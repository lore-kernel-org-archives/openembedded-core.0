Return-Path: <benjamin.esquivel@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 8640860232
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Oct 2015 22:45:54 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 22 Oct 2015 15:45:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,184,1444719600"; d="scan'208";a="817378708"
Received: from yctb05.ostc.intel.com (HELO yctb05.otcr.jf.intel.com)
	([10.23.219.54])
	by fmsmga001.fm.intel.com with ESMTP; 22 Oct 2015 15:45:54 -0700
From: Benjamin Esquivel <benjamin.esquivel@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 22 Oct 2015 22:45:10 +0000
Message-Id: <1445553911-12721-2-git-send-email-benjamin.esquivel@linux.intel.com>
X-Mailer: git-send-email 1.8.4.5
In-Reply-To: <1445553911-12721-1-git-send-email-benjamin.esquivel@linux.intel.com>
References: <1445553911-12721-1-git-send-email-benjamin.esquivel@linux.intel.com>
Cc: brian.avery@intel.com, randy.e.witt@intel.com
Subject: [PATCH 1/2] systemd: test target boot time against unit timeout
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
X-List-Received-Date: Thu, 22 Oct 2015 22:45:56 -0000

the new test:
oeqa.runtime.systemd.SystemdJournalTests.test_systemd_boot_time
will query the target boot time from journactl and will
compare it against the default systemd's unit start timeout:
(TimeoutStartSec)

if the boot time is greater than the timeout, it will fail

the reason is because once the boot time exceeds the unit start
timeout then it is uncertain that the systemd units are able to
properly come up and function

when this test fails, the rest of the systemd units (services) should be
skipped

this test also prints the startup time in the test log like:
...
test_systemd_boot_time (oeqa.runtime.systemd.SystemdJournalTests) ...
Startup finished in 6.922s (kernel) + 52.089s (userspace) = 59.011s.
...

[YOCTO#8141]

Signed-off-by: Benjamin Esquivel <benjamin.esquivel@linux.intel.com>
---
 meta/lib/oeqa/runtime/systemd.py | 73 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 73 insertions(+)

diff --git a/meta/lib/oeqa/runtime/systemd.py b/meta/lib/oeqa/runtime/systemd.py
index c74394c..251d06e 100644
--- a/meta/lib/oeqa/runtime/systemd.py
+++ b/meta/lib/oeqa/runtime/systemd.py
@@ -21,6 +21,33 @@ class SystemdTest(oeRuntimeTest):
         self.assertEqual(status, expected, message)
         return output
 
+    def journalctl(self, args='',l_match_units=[]):
+        """
+        Request for the journalctl output to the current target system
+
+        Arguments:
+        -args, an optional argument pass through argument
+        -l_match_units, an optional list of units to filter the output
+        Returns:
+        -string output of the journalctl command
+        Raises:
+        -AssertionError, on remote commands that fail
+        -ValueError, on a journalctl call with filtering by l_match_units that
+        returned no entries
+        """
+        query_units=""
+        if len(l_match_units):
+            query_units = ['_SYSTEMD_UNIT='+unit for unit in l_match_units]
+            query_units = " ".join(query_units)
+        command = 'journalctl %s %s' %(args, query_units)
+        status, output = self.target.run(command)
+        if status:
+            raise AssertionError("Command '%s' returned non-zero exit \
+                    code %d:\n%s" % (command, status, output))
+        if len(output) == 1 and "-- No entries --" in output:
+            raise ValueError("List of units to match: %s, returned no entries"
+                    % l_match_units)
+        return output
 
 class SystemdBasicTests(SystemdTest):
 
@@ -99,3 +126,49 @@ class SystemdJournalTests(SystemdTest):
     def test_systemd_journal(self):
         (status, output) = self.target.run('journalctl')
         self.assertEqual(status, 0, output)
+
+    @skipUnlessPassed('test_systemd_basic')
+    def test_systemd_boot_time(self, systemd_TimeoutStartSec=90):
+        """
+        Compare the target boot time from journalctl against TimeoutStartSec
+
+        Arguments:
+        -systemd_TimeoutStartSec, an optional argument containing systemd's
+        unit start timeout
+        """
+
+        expr_items=["Startup finished","kernel", "userspace","\.$"]
+        try:
+            output = self.journalctl(args="-o cat --reverse")
+        except AssertionError:
+            self.fail("Error occurred while calling journalctl")
+        if not len(output):
+            self.fail("Error: unable to obtain the startup time from\
+                    systemd journal")
+
+        # check for the regular expression items that match the startup time
+        for line in output.split('\n'):
+            check_match = "".join(re.findall(".*".join(expr_items), line))
+            if check_match: break
+        # put the startup time in the test log
+        if check_match:
+            print "\n%s" % check_match
+        else:
+            self.fail("Error while obtaining the boot time from journalctl")
+        boot_time_sec = 0
+
+        # get the numeric values from the string and convert them to seconds
+        # same data will be placed in list and string for manipulation
+        l_boot_time = check_match.split(" ")[-2:]
+        s_boot_time = " ".join(l_boot_time)
+        # Obtain the minutes it took to boot
+        if l_boot_time[0].endswith('min') and l_boot_time[0][0].isdigit():
+            boot_time_min = s_boot_time.split("min")[0]
+            # convert to seconds and accumulate it
+            boot_time_sec += int(boot_time_min) * 60
+        # Obtain the seconds it took to boot and accumulate
+        boot_time_sec += float(l_boot_time[1].split("s")[0])
+        #Assert the target boot time against systemd's unit start timeout
+        msg = "Target boot time %s exceeds systemd's TimeoutStartSec %s"\
+                %(boot_time_sec, systemd_TimeoutStartSec)
+        self.assertTrue(boot_time_sec < systemd_TimeoutStartSec, msg = msg)
-- 
1.8.4.5


