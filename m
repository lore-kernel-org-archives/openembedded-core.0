Return-Path: <benjamin.esquivel@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 164FB6FFFB
	for <openembedded-core@lists.openembedded.org>;
	Thu,  3 Dec 2015 22:02:51 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga101.fm.intel.com with ESMTP; 03 Dec 2015 14:02:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,378,1444719600"; d="scan'208";a="699800821"
Received: from besquive-mobl2.amr.corp.intel.com (HELO
	besquive-mobl2.zpn.intel.com) ([10.219.128.114])
	by orsmga003.jf.intel.com with ESMTP; 03 Dec 2015 14:02:51 -0800
From: Benjamin Esquivel <benjamin.esquivel@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  3 Dec 2015 16:02:27 -0600
Message-Id: <1449180147-17523-2-git-send-email-benjamin.esquivel@linux.intel.com>
X-Mailer: git-send-email 2.4.3
In-Reply-To: <1449180147-17523-1-git-send-email-benjamin.esquivel@linux.intel.com>
References: <1449180147-17523-1-git-send-email-benjamin.esquivel@linux.intel.com>
Subject: [PATCH 2/2] oeqa/systemd get runtest target boot time and log
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
X-List-Received-Date: Thu, 03 Dec 2015 22:02:55 -0000

oeqa.runtime.systemd.SystemdJournalTests.test_systemd_boot_time
this test will query the target boot time from journactl and will
print it to the output, if the time is obtained, the test passes

it then compares the boot time against the default systemd's
timeout TimeoutStartSec and if the boot time is greater than the
it will print it too

this test prints the startup time in the test log like:
...
test_systemd_boot_time (oeqa.runtime.systemd.SystemdJournalTests) ...
Startup finished in 6.922s (kernel) + 52.089s (userspace) = 59.011s.

Signed-off-by: Benjamin Esquivel <benjamin.esquivel@linux.intel.com>
---
 meta/lib/oeqa/runtime/systemd.py | 47 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 47 insertions(+)

diff --git a/meta/lib/oeqa/runtime/systemd.py b/meta/lib/oeqa/runtime/systemd.py
index d0b9b2f..03c56ef 100644
--- a/meta/lib/oeqa/runtime/systemd.py
+++ b/meta/lib/oeqa/runtime/systemd.py
@@ -127,3 +127,50 @@ class SystemdJournalTests(SystemdTest):
     def test_systemd_journal(self):
         (status, output) = self.target.run('journalctl')
         self.assertEqual(status, 0, output)
+
+    @skipUnlessPassed('test_systemd_basic')
+    def test_systemd_boot_time(self, systemd_TimeoutStartSec=90):
+        """
+        Get the target boot time from journalctl and log it
+
+        Arguments:
+        -systemd_TimeoutStartSec, an optional argument containing systemd's
+        unit start timeout to compare against
+        """
+
+        # the expression chain that uniquely identifies the time boot message
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
+            print "%s" % check_match
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
+        if boot_time_sec > systemd_TimeoutStartSec:
+            print "Target boot time %s exceeds systemd's TimeoutStartSec %s"\
+                    %(boot_time_sec, systemd_TimeoutStartSec)
-- 
2.4.3


