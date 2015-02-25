Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 2EACD736E7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Feb 2015 11:22:34 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga101.fm.intel.com with ESMTP; 25 Feb 2015 03:22:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.09,644,1418112000"; d="scan'208";a="690514692"
Received: from gcattani-mobl.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.20.5])
	by orsmga002.jf.intel.com with ESMTP; 25 Feb 2015 03:22:33 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 25 Feb 2015 11:22:24 +0000
Message-Id: <2bd620b63263036d2e9f9e0040c86fb90f2279b4.1424863308.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <cover.1424863308.git.paul.eggleton@linux.intel.com>
References: <cover.1424863308.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1424863308.git.paul.eggleton@linux.intel.com>
References: <cover.1424863308.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 1/2] lib/oe/terminal: fix regressions
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
X-List-Received-Date: Wed, 25 Feb 2015 11:22:36 -0000

Fix up some issues introduced by OE-Core commit
818c94f5b9882c2028ef9f056714a0a3c9045551:

* If we want to support versions with more than two parts, versions with
  only one part, or versions with non-integer parts, then we have to
  stay with strings. We can use distutils.version.LooseVersion() to help
  with comparisons.
* We don't want a warning when launching gnome-terminal 3.10+ and
  logger.warn() doesn't take a first integer parameter anyway
  (logger.debug() does).
* Also clean up tabs.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/lib/oe/terminal.py | 20 ++++++++------------
 1 file changed, 8 insertions(+), 12 deletions(-)

diff --git a/meta/lib/oe/terminal.py b/meta/lib/oe/terminal.py
index 01c0ccc..fdfdde2 100644
--- a/meta/lib/oe/terminal.py
+++ b/meta/lib/oe/terminal.py
@@ -2,6 +2,7 @@ import logging
 import oe.classutils
 import shlex
 from bb.process import Popen, ExecutionError
+from distutils.version import LooseVersion
 
 logger = logging.getLogger('BitBake.OE.Terminal')
 
@@ -57,9 +58,9 @@ class Gnome(XTerminal):
 
     def __init__(self, sh_cmd, title=None, env=None, d=None):
         # Check version
-        (major, minor) = check_terminal_version("gnome-terminal")
-        if major >= 3 and minor >= 10:
-            logger.warn(1, 'Gnome-Terminal >3.10 does not support --disable-factory')
+        vernum = check_terminal_version("gnome-terminal")
+        if vernum and LooseVersion(vernum) >= '3.10':
+            logger.debug(1, 'Gnome-Terminal 3.10 or later does not support --disable-factory')
             self.command = 'gnome-terminal -t "{title}" -x {command}'
         XTerminal.__init__(self, sh_cmd, title, env, d)
 
@@ -81,8 +82,8 @@ class Konsole(XTerminal):
 
     def __init__(self, sh_cmd, title=None, env=None, d=None):
         # Check version
-        (major, minor) = check_terminal_version("konsole")
-        if major == 2:
+        vernum = check_terminal_version("konsole")
+        if vernum and LooseVersion(vernum) >= '2.0.0':
             logger.debug(1, 'Konsole from KDE 4.x will not work as devshell, skipping')
             raise UnsupportedTerminal(self.name)
         XTerminal.__init__(self, sh_cmd, title, env, d)
@@ -239,17 +240,12 @@ def check_terminal_version(terminalName):
         else:
             raise
     vernum = None
-    major = int(0)
-    minor = int(0)
     for ver in ver_info:
         if ver.startswith('Konsole'):
             vernum = ver.split(' ')[-1]
-	if ver.startswith('GNOME Terminal'):
+        if ver.startswith('GNOME Terminal'):
             vernum = ver.split(' ')[-1]
-    if vernum:
-	major = int(vernum.split('.')[0])
-	minor = int(vernum.split('.')[1])
-    return major, minor
+    return vernum
 
 def distro_name():
     try:
-- 
1.9.3


