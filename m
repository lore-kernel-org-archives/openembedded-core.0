Return-Path: <alejandro.hernandez@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 02CE27147D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Jan 2015 23:37:00 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga103.fm.intel.com with ESMTP; 27 Jan 2015 15:30:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.09,477,1418112000"; d="scan'208";a="668666488"
Received: from aehernan-devstation.zpn.intel.com ([10.219.4.43])
	by fmsmga002.fm.intel.com with ESMTP; 27 Jan 2015 15:36:59 -0800
From: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 27 Jan 2015 17:36:59 -0600
Message-Id: <1422401819-24209-1-git-send-email-alejandro.hernandez@linux.intel.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH] terminal.py: fixes launching multiple windows of gnome-terminal
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
X-List-Received-Date: Tue, 27 Jan 2015 23:37:02 -0000

When resolving a patch, a new process of gnome-terminal

is created for every patch to be resolved, it "waits"

for the previous one to end, instead of launching

multiple windows at the same time.

[YOCTO #7254]

Signed-off-by: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
---
 meta/lib/oe/terminal.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oe/terminal.py b/meta/lib/oe/terminal.py
index 0a623c7..273590b 100644
--- a/meta/lib/oe/terminal.py
+++ b/meta/lib/oe/terminal.py
@@ -52,7 +52,7 @@ class XTerminal(Terminal):
             raise UnsupportedTerminal(self.name)
 
 class Gnome(XTerminal):
-    command = 'gnome-terminal -t "{title}" -x {command}'
+    command = 'gnome-terminal -t "{title}" --disable-factory -x {command}'
     priority = 2
 
 class Mate(XTerminal):
-- 
1.9.1


