Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <josh@linux.intel.com>) id 1RKzt6-0000KL-9w
	for openembedded-core@lists.openembedded.org;
	Mon, 31 Oct 2011 22:59:24 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 31 Oct 2011 14:53:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="69521505"
Received: from unknown (HELO shamshir.jf.intel.com) ([10.7.199.77])
	by orsmga002.jf.intel.com with ESMTP; 31 Oct 2011 14:53:17 -0700
From: Joshua Lock <josh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 31 Oct 2011 14:53:14 -0700
Message-Id: <a80b8487fb7e392cfc167f427e7a00e9d035a7e0.1320097805.git.josh@linux.intel.com>
X-Mailer: git-send-email 1.7.7
In-Reply-To: <cover.1320097805.git.josh@linux.intel.com>
References: <cover.1320097805.git.josh@linux.intel.com>
In-Reply-To: <cover.1320097805.git.josh@linux.intel.com>
References: <cover.1320097805.git.josh@linux.intel.com>
Subject: [PATCH 1/1] lib/oe/terminal: add support for XFCE's terminal emulator
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
X-List-Received-Date: Mon, 31 Oct 2011 21:59:24 -0000

That's Terminal on Fedora and xfce4-terminal on Ubuntu/Debian... This
could get interesting!

Signed-off-by: Joshua Lock <josh@linux.intel.com>
---
 meta/lib/oe/terminal.py |   23 +++++++++++++++++++++++
 1 files changed, 23 insertions(+), 0 deletions(-)

diff --git a/meta/lib/oe/terminal.py b/meta/lib/oe/terminal.py
index 1455e8e..43639d5 100644
--- a/meta/lib/oe/terminal.py
+++ b/meta/lib/oe/terminal.py
@@ -57,6 +57,20 @@ class Gnome(XTerminal):
     command = 'gnome-terminal --disable-factory -t "{title}" -x {command}'
     priority = 2
 
+class Xfce(XTerminal):
+    command = 'Terminal -T "{title}" -e "{command}"'
+    priority = 2
+
+    def __init__(self, command, title=None, env=None):
+        # Upstream binary name is Terminal but Debian/Ubuntu use
+        # xfce4-terminal to avoid possible(?) conflicts
+        distro = distro_name()
+        if distro == 'ubuntu' or distro == 'debian':
+            cmd = 'xfce4-terminal -T "{title}" -e "{command}"'
+        else:
+            cmd = command
+        XTerminal.__init__(self, cmd, title, env)
+
 class Konsole(XTerminal):
     command = 'konsole -T "{title}" -e {command}'
     priority = 2
@@ -131,3 +145,12 @@ def check_konsole_version(konsole):
         if ver.startswith('Konsole'):
             vernum = ver.split(' ')[-1]
     return vernum
+
+def distro_name():
+    try:
+        p = Popen(['lsb_release', '-i'])
+        out, err = p.communicate()
+        distro = out.split(':')[1].strip().lower()
+    except:
+        distro = "unknown"
+    return distro
-- 
1.7.7



