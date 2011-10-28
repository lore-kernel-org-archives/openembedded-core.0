Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <josh@linux.intel.com>) id 1RJw9h-0000F1-DB
	for openembedded-core@lists.openembedded.org;
	Sat, 29 Oct 2011 01:48:09 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 28 Oct 2011 16:42:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="68744794"
Received: from unknown (HELO shamshir.amr.corp.intel.com) ([10.255.15.141])
	by orsmga002.jf.intel.com with ESMTP; 28 Oct 2011 16:42:05 -0700
From: Joshua Lock <josh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 28 Oct 2011 16:42:00 -0700
Message-Id: <988279ad6b90b50cf85426709540ce19b00745e6.1319844419.git.josh@linux.intel.com>
X-Mailer: git-send-email 1.7.7
In-Reply-To: <cover.1319844419.git.josh@linux.intel.com>
References: <cover.1319844419.git.josh@linux.intel.com>
In-Reply-To: <cover.1319844419.git.josh@linux.intel.com>
References: <cover.1319844419.git.josh@linux.intel.com>
Subject: [PATCH 1/4] lib/oe/terminal: add support for XFCE's terminal emulator
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
X-List-Received-Date: Fri, 28 Oct 2011 23:48:09 -0000

That's Terminal on Fedora and xfce4-terminal on Ubuntu/Debian... This
could get interesting!

Signed-off-by: Joshua Lock <josh@linux.intel.com>
---
 meta/lib/oe/terminal.py |   21 +++++++++++++++++++++
 1 files changed, 21 insertions(+), 0 deletions(-)

diff --git a/meta/lib/oe/terminal.py b/meta/lib/oe/terminal.py
index 1455e8e..b90a1f2 100644
--- a/meta/lib/oe/terminal.py
+++ b/meta/lib/oe/terminal.py
@@ -57,6 +57,27 @@ class Gnome(XTerminal):
     command = 'gnome-terminal --disable-factory -t "{title}" -x {command}'
     priority = 2
 
+class Xfce(XTerminal):
+    def distro_name():
+        import subprocess as sub
+        try:
+            p = sub.Popen(['lsb_release', '-i'], stdout=sub.PIPE,
+                          stderr=sub.PIPE)
+            out, err = p.communicate()
+            distro = out.split(':').strip()
+        except:
+            distro = "unknown"
+        return distro
+
+    # Upstream binary name is Terminal but Debian/Ubuntu use
+    # xfce4-terminal to avoid possible(?) conflicts
+    distro = distro_name()
+    if distro == 'Ubuntu' or distro == 'Debian':
+        command = 'xfce4-terminal -T "{title}" -e "{command}"'
+    else:
+        command = 'Terminal -T "{title}" -e "{command}"'
+    priority = 2
+
 class Konsole(XTerminal):
     command = 'konsole -T "{title}" -e {command}'
     priority = 2
-- 
1.7.7



