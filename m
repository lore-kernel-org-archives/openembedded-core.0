Return-Path: <daniel.alexandrux.istrate@intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 0D8E2607F8
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Feb 2016 14:37:04 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga103.jf.intel.com with ESMTP; 26 Feb 2016 06:37:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,498,1449561600"; d="scan'208";a="895498820"
Received: from linux.intel.com ([10.23.219.25])
	by orsmga001.jf.intel.com with ESMTP; 26 Feb 2016 06:37:05 -0800
Received: from fedora-ws.localdomain (unknown [10.237.112.240])
	by linux.intel.com (Postfix) with ESMTP id 3A80E6A4002;
	Fri, 26 Feb 2016 07:24:53 -0800 (PST)
From: Daniel Istrate <daniel.alexandrux.istrate@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 26 Feb 2016 16:40:46 +0200
Message-Id: <1456497651-23161-4-git-send-email-daniel.alexandrux.istrate@intel.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1456497651-23161-1-git-send-email-daniel.alexandrux.istrate@intel.com>
References: <1456497651-23161-1-git-send-email-daniel.alexandrux.istrate@intel.com>
Subject: [PATCH 4/9] oeqa/utils/commands: Added 3 new methods for recipes
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
X-List-Received-Date: Fri, 26 Feb 2016 14:37:04 -0000

get_all_available_recipes, is_recipe_valid, get_tasks_for_recipe

Signed-off-by: Daniel Istrate <daniel.alexandrux.istrate@intel.com>
---
 meta/lib/oeqa/utils/commands.py | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/meta/lib/oeqa/utils/commands.py b/meta/lib/oeqa/utils/commands.py
index 32e001c..6ae09d2 100644
--- a/meta/lib/oeqa/utils/commands.py
+++ b/meta/lib/oeqa/utils/commands.py
@@ -165,6 +165,26 @@ def get_test_layer():
             break
     return testlayer
 
+
+def get_all_available_recipes():
+    ret = bitbake('-s')
+    available_recipes = re.findall(r'\n(\S+)\s+:', ret.output)
+
+    return available_recipes
+
+
+def is_recipe_valid(recipe):
+    return recipe in get_all_available_recipes()
+
+
+def get_tasks_for_recipe(recipe):
+    """ Get available tasks for recipe """
+    ret = bitbake('-c listtasks %s' % recipe)
+    tasks = re.findall(':\s+do_(\S+)\s+', ret.output)
+
+    return tasks
+
+
 def create_temp_layer(templayerdir, templayername, priority=999, recipepathspec='recipes-*/*'):
     os.makedirs(os.path.join(templayerdir, 'conf'))
     with open(os.path.join(templayerdir, 'conf', 'layer.conf'), 'w') as f:
-- 
2.1.0


