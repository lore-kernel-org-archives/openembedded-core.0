Return-Path: <daniel.alexandrux.istrate@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 5637B607F8
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Feb 2016 14:37:46 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga102.jf.intel.com with ESMTP; 26 Feb 2016 06:37:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,498,1449561600"; d="scan'208";a="924525680"
Received: from linux.intel.com ([10.23.219.25])
	by fmsmga002.fm.intel.com with ESMTP; 26 Feb 2016 06:37:11 -0800
Received: from fedora-ws.localdomain (unknown [10.237.112.240])
	by linux.intel.com (Postfix) with ESMTP id 471322C8001;
	Fri, 26 Feb 2016 07:24:58 -0800 (PST)
From: Daniel Istrate <daniel.alexandrux.istrate@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 26 Feb 2016 16:40:50 +0200
Message-Id: <1456497651-23161-8-git-send-email-daniel.alexandrux.istrate@intel.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1456497651-23161-1-git-send-email-daniel.alexandrux.istrate@intel.com>
References: <1456497651-23161-1-git-send-email-daniel.alexandrux.istrate@intel.com>
Subject: [PATCH 8/9] oeqa/utils/commands: Added method - get_all_bbappends
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
X-List-Received-Date: Fri, 26 Feb 2016 14:37:46 -0000

This method runs 'bitbake-layers show-appends' and
returns a dictionary {recipe: [bbappends], ..}

Signed-off-by: Daniel Istrate <daniel.alexandrux.istrate@intel.com>
---
 meta/lib/oeqa/utils/commands.py | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/meta/lib/oeqa/utils/commands.py b/meta/lib/oeqa/utils/commands.py
index 6ae09d2..8fdb80d 100644
--- a/meta/lib/oeqa/utils/commands.py
+++ b/meta/lib/oeqa/utils/commands.py
@@ -184,6 +184,28 @@ def get_tasks_for_recipe(recipe):
 
     return tasks
 
+def get_all_bbappends():
+    """ Get all bbappends (bitbake-layers show-appends)
+    :return:a dict with {recipe: [bbappends]}
+    """
+    ret_dict = {}
+    ret = runCmd('bitbake-layers show-appends')
+
+    for line in ret.output.splitlines():
+        bb = re.findall('^(\S+\.bb.*):', line)
+        bbappend = re.findall('^\s+(\S+\.bbappend)', line)
+        if bb:
+            key = bb[0]
+            value_list = []
+            continue
+        if bbappend:
+            value = bbappend[0]
+            value_list.append(value)
+            ret_dict[key] = value_list
+            continue
+
+    return ret_dict
+
 
 def create_temp_layer(templayerdir, templayername, priority=999, recipepathspec='recipes-*/*'):
     os.makedirs(os.path.join(templayerdir, 'conf'))
-- 
2.1.0


