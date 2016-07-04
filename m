Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id BBD6F601D4
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Jul 2016 22:18:54 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga104.fm.intel.com with ESMTP; 04 Jul 2016 15:18:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,576,1459839600"; d="scan'208";a="1010879426"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga002.jf.intel.com with ESMTP; 04 Jul 2016 15:18:55 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.68])
	by linux.intel.com (Postfix) with ESMTP id 667456A4080
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Jul 2016 15:18:49 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  5 Jul 2016 01:08:15 +0300
Message-Id: <d627746f60929f5cc128a340d0ac9ae3ebe4a2a6.1467669922.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1467669922.git.ed.bartosh@linux.intel.com>
References: <cover.1467669922.git.ed.bartosh@linux.intel.com>
In-Reply-To: <cover.1467669922.git.ed.bartosh@linux.intel.com>
References: <cover.1467669922.git.ed.bartosh@linux.intel.com>
Subject: [PATCH v2 3/3] oepydevshell-internal: python3: encode/decode pty content
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
X-List-Received-Date: Mon, 04 Jul 2016 22:18:56 -0000

As /dev/pty opened in binary mode its content has to
be decoded when reading from it and encoded when writing to it.

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 scripts/oepydevshell-internal.py | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/scripts/oepydevshell-internal.py b/scripts/oepydevshell-internal.py
index 31a75ac..a22bec3 100755
--- a/scripts/oepydevshell-internal.py
+++ b/scripts/oepydevshell-internal.py
@@ -47,7 +47,7 @@ try:
     # Need cbreak/noecho whilst in select so we trigger on any keypress
     cbreaknoecho(sys.stdin.fileno())
     # Send our PID to the other end so they can kill us.
-    pty.write(str(os.getpid()) + "\n")
+    pty.write(str(os.getpid()).encode('utf-8') + b"\n")
     while True:
         try:
             writers = []
@@ -56,7 +56,7 @@ try:
             (ready, _, _) = select.select([pty, sys.stdin], writers , [], 0)
             try:
                 if pty in ready:
-                    i = i + pty.read()
+                    i = i + pty.read().decode('utf-8')
                 if i:
                     # Write a page at a time to avoid overflowing output 
                     # d.keys() is a good way to do that
@@ -65,9 +65,9 @@ try:
                     i = i[4096:]
                 if sys.stdin in ready:
                     echonocbreak(sys.stdin.fileno())
-                    o = input()
+                    o = input().encode('utf-8')
                     cbreaknoecho(sys.stdin.fileno())
-                    pty.write(o + "\n")
+                    pty.write(o + b"\n")
             except (IOError, OSError) as e:
                 if e.errno == 11:
                     continue
-- 
2.1.4


