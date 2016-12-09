Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 4038B601F6
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Dec 2016 15:02:55 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 09 Dec 2016 07:02:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,324,1477983600"; d="scan'208";a="15941987"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga002.jf.intel.com with ESMTP; 09 Dec 2016 07:02:47 -0800
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.38])
	by linux.intel.com (Postfix) with ESMTP id DD05B6A4006;
	Fri,  9 Dec 2016 07:02:00 -0800 (PST)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  9 Dec 2016 17:02:30 +0200
Message-Id: <1481295750-8585-1-git-send-email-ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH] oepydevshell-internal.py: standardize usage output
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
X-List-Received-Date: Fri, 09 Dec 2016 15:03:00 -0000

Made usage output of oepydevshell-internal.py to look
similar to the output of other oe scripts.

[YOCTO #10751]

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 scripts/oepydevshell-internal.py | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/scripts/oepydevshell-internal.py b/scripts/oepydevshell-internal.py
index a22bec3..04621ae 100755
--- a/scripts/oepydevshell-internal.py
+++ b/scripts/oepydevshell-internal.py
@@ -22,9 +22,16 @@ def cbreaknoecho(fd):
     old[3] = old[3] &~ termios.ECHO &~ termios.ICANON
     termios.tcsetattr(fd, termios.TCSADRAIN, old)
 
-if len(sys.argv) != 3:
-    print("Incorrect parameters")
-    sys.exit(1)
+if len(sys.argv) != 3 or sys.argv[1] in ('-h', '--help'):
+    print('oepydevshell-internal.py: error: the following arguments are required: pty, pid\n'
+          'Usage: oepydevshell-internal.py pty pid\n\n'
+          'OpenEmbedded oepydevshell-internal.py - internal script called from meta/classes/devshell.bbclass\n\n'
+          'arguments:\n'
+          '  pty                   pty device name\n'
+          '  pid                   parent process id\n\n'
+          'options:\n'
+          '  -h, --help            show this help message and exit\n')
+    sys.exit(2)
 
 pty = open(sys.argv[1], "w+b", 0)
 parent = int(sys.argv[2])
@@ -38,7 +45,7 @@ readline.parse_and_bind("tab: complete")
 try:
     readline.read_history_file(histfile)
 except IOError:
-    pass 
+    pass
 
 try:
 
-- 
2.1.4


