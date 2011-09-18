Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1R5QTW-00028g-J2
	for openembedded-core@lists.openembedded.org;
	Mon, 19 Sep 2011 01:08:39 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 18 Sep 2011 16:03:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.68,402,1312182000"; d="scan'208";a="52989593"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.14.150])
	by fmsmga001.fm.intel.com with ESMTP; 18 Sep 2011 16:03:20 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 18 Sep 2011 16:03:17 -0700
Message-Id: <ee57cd7deb778dc72e58668d8c71cf840a3bc0d9.1316386910.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6
In-Reply-To: <cover.1316386910.git.sgw@linux.intel.com>
References: <cover.1316386910.git.sgw@linux.intel.com>
In-Reply-To: <cover.1316386910.git.sgw@linux.intel.com>
References: <cover.1316386910.git.sgw@linux.intel.com>
Subject: [RC3 FIXES 3/4] lib/oe/terminal.py: declare konsole from KDE 4.x as unsupported
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 18 Sep 2011 23:08:39 -0000

From: Paul Eggleton <paul.eggleton@linux.intel.com>

Konsole 2.x (from KDE 4.x) does not work as devshell - it does not pass
the environment or current working directory through among other issues,
so do a version check and disable it if it is found (skipping to the
next available terminal application.)

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/lib/oe/terminal.py |   27 +++++++++++++++++++++++++++
 1 files changed, 27 insertions(+), 0 deletions(-)

diff --git a/meta/lib/oe/terminal.py b/meta/lib/oe/terminal.py
index 3965462..1455e8e 100644
--- a/meta/lib/oe/terminal.py
+++ b/meta/lib/oe/terminal.py
@@ -61,6 +61,15 @@ class Konsole(XTerminal):
     command = 'konsole -T "{title}" -e {command}'
     priority = 2
 
+    def __init__(self, command, title=None, env=None):
+        # Check version
+        vernum = check_konsole_version("konsole")
+        if vernum:
+            if vernum.split('.')[0] == "2":
+                logger.debug(1, 'Konsole from KDE 4.x will not work as devshell, skipping')
+                raise UnsupportedTerminal(self.name)
+        XTerminal.__init__(self, command, title, env)
+
 class XTerm(XTerminal):
     command = 'xterm -T "{title}" -e {command}'
     priority = 1
@@ -104,3 +113,21 @@ def spawn(name, command, title=None, env=None):
     output = pipe.communicate()[0]
     if pipe.returncode != 0:
         raise ExecutionError(pipe.command, pipe.returncode, output)
+
+def check_konsole_version(konsole):
+    import subprocess as sub
+    try:
+        p = sub.Popen(['sh', '-c', '%s --version' % konsole],stdout=sub.PIPE,stderr=sub.PIPE)
+        out, err = p.communicate()
+        ver_info = out.rstrip().split('\n')
+    except OSError as exc:
+        import errno
+        if exc.errno == errno.ENOENT:
+            return None
+        else:
+            raise
+    vernum = None
+    for ver in ver_info:
+        if ver.startswith('Konsole'):
+            vernum = ver.split(' ')[-1]
+    return vernum
-- 
1.7.6



