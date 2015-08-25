Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id B794C76C4B
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Aug 2015 09:05:08 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga101.fm.intel.com with ESMTP; 25 Aug 2015 02:04:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,744,1432623600"; d="scan'208";a="790452349"
Received: from linux.intel.com ([10.23.219.25])
	by orsmga002.jf.intel.com with ESMTP; 25 Aug 2015 02:04:49 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.65])
	by linux.intel.com (Postfix) with ESMTP id 448406A4083;
	Tue, 25 Aug 2015 02:03:59 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 25 Aug 2015 12:04:22 +0300
Message-Id: <87c25db971bc38c316c9c8ffd9d7f3600a5fcdd0.1440492980.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <65da9b2235891726ab3697e6aaab30453277f2f4.1440492980.git.ed.bartosh@linux.intel.com>
References: <65da9b2235891726ab3697e6aaab30453277f2f4.1440492980.git.ed.bartosh@linux.intel.com>
In-Reply-To: <cover.1440492980.git.ed.bartosh@linux.intel.com>
References: <cover.1440492980.git.ed.bartosh@linux.intel.com>
Subject: [PATCH 11/17] wic: deferred call of hlp.get_wic_plugins_help()
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
X-List-Received-Date: Tue, 25 Aug 2015 09:05:08 -0000

If get_wic_plugins_help is called from wic main module
it calls git_bitbake_var at some point. This fails when
wic is called from bitbake as 'bitbake -e' can't be
run.

Moved call of this method to help.py in order to call it
later, when BitbakeVariables singleton is properly initialized
to get variables from .env files.

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 scripts/lib/image/help.py | 2 ++
 scripts/wic               | 2 +-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/scripts/lib/image/help.py b/scripts/lib/image/help.py
index dc6ff36..717d847 100644
--- a/scripts/lib/image/help.py
+++ b/scripts/lib/image/help.py
@@ -42,6 +42,8 @@ def display_help(subcommand, subcommands):
         return False
 
     hlp = subcommands.get(subcommand, subcommand_error)[2]
+    if callable(hlp):
+        hlp = hlp()
     pager = subprocess.Popen('less', stdin=subprocess.PIPE)
     pager.communicate(hlp)
 
diff --git a/scripts/wic b/scripts/wic
index 815b84e..25b0d67 100755
--- a/scripts/wic
+++ b/scripts/wic
@@ -288,7 +288,7 @@ subcommands = {
                   hlp.wic_list_help],
     "plugins":   [wic_help_topic_subcommand,
                   wic_help_topic_usage,
-                  hlp.get_wic_plugins_help()],
+                  hlp.get_wic_plugins_help],
     "overview":  [wic_help_topic_subcommand,
                   wic_help_topic_usage,
                   hlp.wic_overview_help],
-- 
2.1.4


