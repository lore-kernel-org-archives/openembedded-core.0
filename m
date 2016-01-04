Return-Path: <anibal.limon@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id C4330731C0
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Jan 2016 18:27:49 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga101.jf.intel.com with ESMTP; 04 Jan 2016 10:27:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,521,1444719600"; d="scan'208";a="874414283"
Received: from alimonb-mobl1.zpn.intel.com ([10.219.5.151])
	by fmsmga001.fm.intel.com with ESMTP; 04 Jan 2016 10:27:43 -0800
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  4 Jan 2016 12:29:15 -0600
Message-Id: <1451932157-3190-2-git-send-email-anibal.limon@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1451932157-3190-1-git-send-email-anibal.limon@linux.intel.com>
References: <1451932157-3190-1-git-send-email-anibal.limon@linux.intel.com>
MIME-Version: 1.0
Cc: paul.eggleton@linux.intel.com, georgex.l.musat@intel.com,
	poky@yoctoproject.org, benjamin.esquivel@intel.com
Subject: [PATCH v3 1/3] ptest-runner: Add version 2.0 re-implementation in python.
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
X-List-Received-Date: Mon, 04 Jan 2016 18:27:50 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The new ptest-runner supports timeout of upstream tests executed,
it looks for stdout of process and if no information is available
in certain time (defaults to 5m) the process is treaty as blocked
and ptest-runner kills it, this handles problems of ptest-runner
being blocked indefinitly for upstream test suites.

Also an options was added for list test available, specify directory
of ptests and run only certain tests.

[YOCTO #8021]

Signed-off-by: Aníbal Limón <anibal.limon@linux.intel.com>
---
 .../ptest-runner/files/ptest-runner_2.0.py         | 162 +++++++++++++++++++++
 1 file changed, 162 insertions(+)
 create mode 100755 meta/recipes-support/ptest-runner/files/ptest-runner_2.0.py

diff --git a/meta/recipes-support/ptest-runner/files/ptest-runner_2.0.py b/meta/recipes-support/ptest-runner/files/ptest-runner_2.0.py
new file mode 100755
index 0000000..2b71970
--- /dev/null
+++ b/meta/recipes-support/ptest-runner/files/ptest-runner_2.0.py
@@ -0,0 +1,162 @@
+#!/usr/bin/env python
+
+# Ptest-runner
+#
+# Copyright (C) 2014-2015 Intel Corporation
+#
+# This program is free software; you can redistribute it and/or modify
+# it under the terms of the GNU General Public License version 2 as
+# published by the Free Software Foundation.
+#
+# This program is distributed in the hope that it will be useful,
+# but WITHOUT ANY WARRANTY; without even the implied warranty of
+# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+# GNU General Public License for more details.
+#
+# You should have received a copy of the GNU General Public License along
+# with this program; if not, write to the Free Software Foundation, Inc.,
+# 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
+
+import os
+import sys
+import fcntl
+import time
+
+import argparse
+import logging 
+from datetime import datetime
+
+import subprocess
+
+DEFAULT_LIBDIR='/usr/lib'
+DEFAULT_TIMEOUT_SECS = 300
+
+logging.basicConfig(format="%(message)s")
+logger = logging.getLogger()
+logger.setLevel(logging.INFO)
+
+def get_available_ptests(libdir):
+    ptests = {}
+
+    if os.path.exists(libdir) and os.path.isdir(libdir):
+        for d in os.listdir(libdir):
+            full_d = os.path.join(libdir, d)
+            if os.path.isdir(full_d) and not os.path.islink(full_d):
+                run_ptest = os.path.join(full_d, 'ptest', 'run-ptest')
+                if os.path.exists(run_ptest):
+                    ptests[d] = run_ptest
+
+    return ptests
+
+def print_ptests(ptests):
+    if ptests.keys():
+        logger.info("Available ptests:\n")
+        for p in ptests.keys():
+            logger.info("%s\t%s" % (p, ptests[p]))
+        return 0
+    else:
+        logger.error("No ptests found.\n")
+        return 1
+
+def get_ptests_to_run(available_ptests, requested_ptests):
+    if requested_ptests:
+        for rp in requested_ptests:
+            if not rp in available_ptests.keys():
+                logger.error("%s ptest isn't available." % rp)
+                return 1
+
+        for ap in available_ptests.keys():
+            if not ap in requested_ptests:
+                del available_ptests[ap]
+    return 0
+
+def run_ptests(ptests, timeout):
+    def _set_nonblocking(fp):
+        fd = process.stdout.fileno()
+        fl = fcntl.fcntl(fd, fcntl.F_GETFL)
+        fcntl.fcntl(fd, fcntl.F_SETFL, fl | os.O_NONBLOCK)
+
+    def _write_output(stdout):
+        import select
+        data_written = False
+
+        rlist = [stdout.fileno()]
+        (rrlist, _, _) = select.select(rlist, [], [], 0)
+
+        for fd in rrlist:
+            try:
+                sys.stdout.write(stdout.read())
+                data_written = True
+            except:
+                pass
+
+        return data_written
+
+    exit_code = 0
+
+    print "START: %s" % sys.argv[0]
+    for p in ptests.keys():
+        run_ptest = ptests[p]
+
+        print datetime.strftime(datetime.now(), "%Y-%m-%dT%H:%M")
+        print "BEGIN: %s" % run_ptest
+
+        os.chdir(os.path.dirname(run_ptest))
+
+        process = subprocess.Popen([run_ptest], stdout=subprocess.PIPE,
+                stderr=subprocess.STDOUT, shell=True, close_fds=True,
+                bufsize=-1)
+        _set_nonblocking(process.stdout)
+
+        sentinel = datetime.now()
+        while True:
+            if _write_output(process.stdout):
+                sentinel = datetime.now()
+            elif timeout >= 0 and \
+                ((datetime.now() - sentinel).total_seconds() > timeout):
+                    print "\nTIMEOUT: %s" % run_ptest
+                    process.kill()
+                    break
+
+            if process.poll() is not None:
+                break
+
+            time.sleep(0.5)
+
+        if process.returncode:
+            exit_code = process.returncode
+
+        print "END: %s" % run_ptest
+        print datetime.strftime(datetime.now(), "%Y-%m-%dT%H:%M")
+    print "STOP: %s" % sys.argv[0]
+
+    return exit_code
+
+if __name__ == '__main__':
+    parser = argparse.ArgumentParser(description="ptest-runner runs ptests from upstream packages",
+            add_help=False,
+            epilog="Use %(prog)s [ptest1 ptest2 ...] --help to get help on a specific command")
+    parser.add_argument('ptests', metavar='ptests', help='ptests to run',
+            nargs='*')
+    parser.add_argument('-d', '--directory', help='Directory for search ptests',
+            action='store', default=DEFAULT_LIBDIR)
+    parser.add_argument('-l', '--list', help='List available ptests',
+            action='store_true')
+    parser.add_argument('-t', '--timeout',
+            help='Timeout (secs) for use when run ptests, -1 waits indefinitely', action='store', type=int,
+            default=DEFAULT_TIMEOUT_SECS)
+    parser.add_argument('-h', '--help', action='help', default=argparse.SUPPRESS,
+                        help='show this help message and exit')
+
+    global_args, unparsed_args = parser.parse_known_args()
+
+    ptests = get_available_ptests(global_args.directory)
+    if global_args.list:
+        exit_code = print_ptests(ptests)
+        sys.exit(exit_code)
+
+    exit_code = get_ptests_to_run(ptests, global_args.ptests)
+    if exit_code:
+        sys.exit(exit_code)
+
+    sys.exit(run_ptests(ptests, global_args.timeout))
-- 
2.1.4


