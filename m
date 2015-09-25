Return-Path: <mariano.lopez@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 9127E77043
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Sep 2015 14:42:45 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga102.fm.intel.com with ESMTP; 25 Sep 2015 07:42:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,587,1437462000"; d="scan'208";a="652205316"
Received: from yctb01.ostc.intel.com (HELO yctb01.otcr.intel.com)
	([10.23.219.46])
	by orsmga003.jf.intel.com with ESMTP; 25 Sep 2015 07:42:45 -0700
From: mariano.lopez@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Fri, 25 Sep 2015 06:33:08 +0000
Message-Id: <62b26729361a797eff29928054777d7a5aebdead.1443162720.git.mariano.lopez@linux.intel.com>
X-Mailer: git-send-email 1.8.4.5
In-Reply-To: <cover.1443162720.git.mariano.lopez@linux.intel.com>
References: <cover.1443162720.git.mariano.lopez@linux.intel.com>
Subject: [PATCH 1/1] qemurunner: Sanitize output from qemu and qemu pid
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
X-List-Received-Date: Fri, 25 Sep 2015 14:42:48 -0000

From: Mariano Lopez <mariano.lopez@linux.intel.com>

Currently the output from qemu could contain control
or Unicode characters; having such characters in the
log will cause an internal server error when sending
the report to error reporting web. Control characters
can be found in the command line used to run quemu too.

This change sanitize the output from qemu and the
command line used to run qemu, this way the logs doesn't
contain control or Unicode characters and this will solve
the issue of error reporting web and generate better
logs.

[YOCTO #8225]

Signed-off-by: Mariano Lopez <mariano.lopez@linux.intel.com>
---
 meta/lib/oeqa/utils/qemurunner.py | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/meta/lib/oeqa/utils/qemurunner.py b/meta/lib/oeqa/utils/qemurunner.py
index 0357f99..845a57b 100644
--- a/meta/lib/oeqa/utils/qemurunner.py
+++ b/meta/lib/oeqa/utils/qemurunner.py
@@ -13,6 +13,7 @@ import re
 import socket
 import select
 import errno
+import string
 import threading
 from oeqa.utils.dump import HostDumper
 
@@ -61,6 +62,9 @@ class QemuRunner:
 
     def log(self, msg):
         if self.logfile:
+            # It is needed to sanitize the data received from qemu
+            # because is possible to have control characters or Unicode
+            msg = cmdline = "".join(filter(lambda x:x in string.printable, msg))
             with open(self.logfile, "a") as f:
                 f.write("%s" % msg)
 
@@ -170,6 +174,9 @@ class QemuRunner:
             cmdline = ''
             with open('/proc/%s/cmdline' % self.qemupid) as p:
                 cmdline = p.read()
+                # It is needed to sanitize the data received
+                # because is possible to have control characters
+                cmdline = "".join(filter(lambda x:x in string.printable, cmdline))
             try:
                 ips = re.findall("((?:[0-9]{1,3}\.){3}[0-9]{1,3})", cmdline.split("ip=")[1])
                 if not ips or len(ips) != 3:
-- 
1.8.4.5


