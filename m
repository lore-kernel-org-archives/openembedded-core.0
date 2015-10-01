Return-Path: <mariano.lopez@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 7227D770A3
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Oct 2015 18:50:48 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga102.fm.intel.com with ESMTP; 01 Oct 2015 11:50:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,619,1437462000"; d="scan'208";a="572293197"
Received: from yctb01.ostc.intel.com (HELO yctb01.otcr.intel.com)
	([10.23.219.46])
	by FMSMGA003.fm.intel.com with ESMTP; 01 Oct 2015 11:50:48 -0700
From: mariano.lopez@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Thu,  1 Oct 2015 10:40:47 +0000
Message-Id: <0ca448595fcb896c7e9bfeaf00f51fd2145c4309.1443694820.git.mariano.lopez@linux.intel.com>
X-Mailer: git-send-email 1.8.4.5
In-Reply-To: <cover.1443694820.git.mariano.lopez@linux.intel.com>
References: <cover.1443694820.git.mariano.lopez@linux.intel.com>
In-Reply-To: <cover.1443694820.git.mariano.lopez@linux.intel.com>
References: <cover.1443694820.git.mariano.lopez@linux.intel.com>
Subject: [PATCH 2/2] oeqa/utils/qemurunner: Add support for Unicode from qemu
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
X-List-Received-Date: Thu, 01 Oct 2015 18:50:48 -0000

From: Mariano Lopez <mariano.lopez@linux.intel.com>

The current state of qemurunner will drop the Unicode
characters received from qemu, this is because error
report web had problems with Unicode characters; now
that the server support Unicode, it is possible to
log all the output from qemu. So far the only Unicode
character seen is the copyright symbol.

This patch allows to get Unicode characters from the qemu
target and save the log in an UTF-8 file for latter use.

[YOCTO #8225]

Signed-off-by: Mariano Lopez <mariano.lopez@linux.intel.com>
---
 meta/lib/oeqa/utils/qemurunner.py | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/meta/lib/oeqa/utils/qemurunner.py b/meta/lib/oeqa/utils/qemurunner.py
index 9c878bc..6fe75b8 100644
--- a/meta/lib/oeqa/utils/qemurunner.py
+++ b/meta/lib/oeqa/utils/qemurunner.py
@@ -15,11 +15,18 @@ import select
 import errno
 import string
 import threading
+import codecs
 from oeqa.utils.dump import HostDumper
 
 import logging
 logger = logging.getLogger("BitBake.QemuRunner")
 
+# Get Unicode non printable control chars
+control_range = range(0,32)+range(127,160)
+control_chars = [unichr(x) for x in control_range
+                if unichr(x) not in string.printable]
+re_control_char = re.compile('[%s]' % re.escape("".join(control_chars)))
+
 class QemuRunner:
 
     def __init__(self, machine, rootfs, display, tmpdir, deploy_dir_image, logfile, boottime, dump_dir, dump_host_cmds):
@@ -63,9 +70,9 @@ class QemuRunner:
     def log(self, msg):
         if self.logfile:
             # It is needed to sanitize the data received from qemu
-            # because is possible to have control characters or Unicode
-            msg = "".join(filter(lambda x:x in string.printable, msg))
-            with open(self.logfile, "a") as f:
+            # because is possible to have control characters
+            msg = re_control_char.sub('', unicode(msg, 'utf-8'))
+            with codecs.open(self.logfile, "a", encoding="utf-8") as f:
                 f.write("%s" % msg)
 
     def getOutput(self, o):
@@ -176,7 +183,7 @@ class QemuRunner:
                 cmdline = p.read()
                 # It is needed to sanitize the data received
                 # because is possible to have control characters
-                cmdline = "".join(filter(lambda x:x in string.printable, cmdline))
+                cmdline = re_control_char.sub('', cmdline)
             try:
                 ips = re.findall("((?:[0-9]{1,3}\.){3}[0-9]{1,3})", cmdline.split("ip=")[1])
                 if not ips or len(ips) != 3:
-- 
1.8.4.5


