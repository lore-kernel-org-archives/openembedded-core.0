Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 997B173731
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Feb 2015 11:22:35 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga101.fm.intel.com with ESMTP; 25 Feb 2015 03:22:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.09,644,1418112000"; d="scan'208";a="690514697"
Received: from gcattani-mobl.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.20.5])
	by orsmga002.jf.intel.com with ESMTP; 25 Feb 2015 03:22:36 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 25 Feb 2015 11:22:25 +0000
Message-Id: <265b590e63111e0279747b9beb9ead4014dcec1d.1424863308.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <cover.1424863308.git.paul.eggleton@linux.intel.com>
References: <cover.1424863308.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1424863308.git.paul.eggleton@linux.intel.com>
References: <cover.1424863308.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 2/2] lib/oe/terminal: fix konsole terminal support for KDE 4.x
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

It seems that the --nofork option genuinely stops konsole from going
into the background now; I'm not sure when this changed but it does seem
to be working so we can use it. (Tested with Konsole 2.10 and 2.14.2).

Fixes [YOCTO #4934].

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/lib/oe/terminal.py | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/lib/oe/terminal.py b/meta/lib/oe/terminal.py
index fdfdde2..4f5c611 100644
--- a/meta/lib/oe/terminal.py
+++ b/meta/lib/oe/terminal.py
@@ -77,15 +77,15 @@ class Terminology(XTerminal):
     priority = 2
 
 class Konsole(XTerminal):
-    command = 'konsole -T "{title}" -e {command}'
+    command = 'konsole --nofork -p tabtitle="{title}" -e {command}'
     priority = 2
 
     def __init__(self, sh_cmd, title=None, env=None, d=None):
         # Check version
         vernum = check_terminal_version("konsole")
-        if vernum and LooseVersion(vernum) >= '2.0.0':
-            logger.debug(1, 'Konsole from KDE 4.x will not work as devshell, skipping')
-            raise UnsupportedTerminal(self.name)
+        if vernum and LooseVersion(vernum) < '2.0.0':
+            # Konsole from KDE 3.x
+            self.command = 'konsole -T "{title}" -e {command}'
         XTerminal.__init__(self, sh_cmd, title, env, d)
 
 class XTerm(XTerminal):
-- 
1.9.3


