Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id EB6C376AB3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Aug 2015 11:56:55 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga103.jf.intel.com with ESMTP; 20 Aug 2015 04:56:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,714,1432623600"; d="scan'208";a="787700984"
Received: from linux.intel.com ([10.23.219.25])
	by orsmga002.jf.intel.com with ESMTP; 20 Aug 2015 04:56:56 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.65])
	by linux.intel.com (Postfix) with ESMTP id 3FC116A4005
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Aug 2015 04:56:07 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 20 Aug 2015 14:56:24 +0300
Message-Id: <e4f76f2b3520c825d4d2542fd781008ae56b9970.1440071413.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1440071413.git.ed.bartosh@linux.intel.com>
References: <cover.1440071413.git.ed.bartosh@linux.intel.com>
In-Reply-To: <cover.1440071413.git.ed.bartosh@linux.intel.com>
References: <cover.1440071413.git.ed.bartosh@linux.intel.com>
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
X-List-Received-Date: Thu, 20 Aug 2015 11:56:57 -0000

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


