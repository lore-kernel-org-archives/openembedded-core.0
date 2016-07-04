Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 2F2FD601D4
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Jul 2016 21:59:03 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga102.jf.intel.com with ESMTP; 04 Jul 2016 14:59:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,576,1459839600"; d="scan'208";a="1000892584"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga001.fm.intel.com with ESMTP; 04 Jul 2016 14:59:05 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.68])
	by linux.intel.com (Postfix) with ESMTP id C733D6A4080
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Jul 2016 14:58:58 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  5 Jul 2016 00:48:11 +0300
Message-Id: <c6bf58abfcbbc404d832df4f25fe68c60bfbeb2a.1467668390.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1467668390.git.ed.bartosh@linux.intel.com>
References: <cover.1467668390.git.ed.bartosh@linux.intel.com>
In-Reply-To: <cover.1467668390.git.ed.bartosh@linux.intel.com>
References: <cover.1467668390.git.ed.bartosh@linux.intel.com>
Subject: [PATCH 3/4] devpyshell: python3: flush stdout explicitly
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
X-List-Received-Date: Mon, 04 Jul 2016 21:59:04 -0000

Opening text sream in unbuffered mode raises the following
exception In Python 3:
    ValueError: can't have unbuffered text I/O

Fixed by leaving std* streams in text mode and flushing
stdout explicitly.

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 meta/classes/devshell.bbclass    | 2 ++
 scripts/oepydevshell-internal.py | 4 +---
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/classes/devshell.bbclass b/meta/classes/devshell.bbclass
index ce76ffe..be71aff 100644
--- a/meta/classes/devshell.bbclass
+++ b/meta/classes/devshell.bbclass
@@ -90,6 +90,7 @@ def devpyshell(d):
             else:
                 prompt = ps1
             sys.stdout.write(prompt)
+            sys.stdout.flush()
 
         # Restore Ctrl+C since bitbake masks this
         def signal_handler(signal, frame):
@@ -111,6 +112,7 @@ def devpyshell(d):
                         continue
                 except EOFError as e:
                     sys.stdout.write("\n")
+                    sys.stdout.flush()
                 except (OSError, IOError) as e:
                     if e.errno == 11:
                         continue
diff --git a/scripts/oepydevshell-internal.py b/scripts/oepydevshell-internal.py
index 7761f66..31a75ac 100755
--- a/scripts/oepydevshell-internal.py
+++ b/scripts/oepydevshell-internal.py
@@ -29,9 +29,6 @@ if len(sys.argv) != 3:
 pty = open(sys.argv[1], "w+b", 0)
 parent = int(sys.argv[2])
 
-# Don't buffer output by line endings
-sys.stdout = os.fdopen(sys.stdout.fileno(), 'w', 0)
-sys.stdin = os.fdopen(sys.stdin.fileno(), 'r', 0)
 nonblockingfd(pty)
 nonblockingfd(sys.stdin)
 
@@ -64,6 +61,7 @@ try:
                     # Write a page at a time to avoid overflowing output 
                     # d.keys() is a good way to do that
                     sys.stdout.write(i[:4096])
+                    sys.stdout.flush()
                     i = i[4096:]
                 if sys.stdin in ready:
                     echonocbreak(sys.stdin.fileno())
-- 
2.1.4


