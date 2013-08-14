Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 9DA1B60017
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Aug 2013 15:46:43 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga101.jf.intel.com with ESMTP; 14 Aug 2013 08:46:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,877,1367996400"; d="scan'208";a="380923356"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.122.240])
	by fmsmga001.fm.intel.com with ESMTP; 14 Aug 2013 08:46:43 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 14 Aug 2013 16:46:38 +0100
Message-Id: <1376495198-23621-1-git-send-email-paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.8.1.2
Subject: [dylan][PATCH] classes/terminal: fix pseudo exiting when launching devshell
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
X-List-Received-Date: Wed, 14 Aug 2013 15:46:43 -0000

In dylan, since the entire bitbake process is run under pseudo,
LD_PRELOAD is set when we collect BB_ORIGENV and thus when we construct
the devshell environment from the latter, LD_PRELOAD is included.
However, for a fakeroot task we explicitly run the devshell under pseudo
(e.g. "pseudo /bin/bash"), and if LD_PRELOAD is set to preload
libpseudo.so when pseudo is run, it seems to exit immediately without
error. Since LD_PRELOAD shouldn't be exported anyway, exclude this from
the environment so it doesn't prevent running the shell.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/classes/terminal.bbclass | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/classes/terminal.bbclass b/meta/classes/terminal.bbclass
index ae338e9..96d2d2a 100644
--- a/meta/classes/terminal.bbclass
+++ b/meta/classes/terminal.bbclass
@@ -62,6 +62,10 @@ def oe_terminal(command, title, d):
             envdata.setVar(key, str(value))
             envdata.setVarFlag(key, 'export', 1)
 
+    # LD_PRELOAD of pseudo will cause problems if this is a fakeroot task
+    # and we shouldn't be exporting it anyway
+    envdata.delVar('LD_PRELOAD')
+
     # Replace command with an executable wrapper script
     command = emit_terminal_func(command, envdata, d)
 
-- 
1.8.1.2


