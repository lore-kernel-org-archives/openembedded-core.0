Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <lianhao.lu@intel.com>) id 1S0lXf-0002j9-Fv
	for openembedded-core@lists.openembedded.org;
	Fri, 24 Feb 2012 04:09:55 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 23 Feb 2012 19:01:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="111409368"
Received: from llu-piketon.sh.intel.com (HELO localhost) ([10.239.36.62])
	by orsmga001.jf.intel.com with ESMTP; 23 Feb 2012 19:01:33 -0800
From: Lianhao Lu <lianhao.lu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 24 Feb 2012 11:00:40 +0800
Message-Id: <f52803bfc127eb77b31587e998f91f296254a205.1330051744.git.lianhao.lu@intel.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <cover.1330051744.git.lianhao.lu@intel.com>
References: <cover.1330051744.git.lianhao.lu@intel.com>
Subject: [PATCH 1/1] bitbake.conf: Added new variable BBINCLUDES
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
X-List-Received-Date: Fri, 24 Feb 2012 03:09:55 -0000

The new variable BBINCLUDES contains the file dependency information. It
exposes the bitbake internal variable '__depends' and '__base_depends'.

Signed-off-by: Lianhao Lu <lianhao.lu@intel.com>
---
 meta/conf/bitbake.conf |    2 ++
 meta/lib/oe/utils.py   |    9 +++++++++
 2 files changed, 11 insertions(+), 0 deletions(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 90e5f7a..04851e5 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -731,3 +731,5 @@ BB_HASHBASE_WHITELIST ?= "TMPDIR FILE PATH PWD BB_TASKHASH BBPATH DL_DIR SSTATE_
 
 MLPREFIX ??= ""
 MULTILIB_VARIANTS ??= ""
+
+BBINCLUDES = "${@oe.utils.get_file_depends(d)}"
diff --git a/meta/lib/oe/utils.py b/meta/lib/oe/utils.py
index 02d5442..b4dcc4f 100644
--- a/meta/lib/oe/utils.py
+++ b/meta/lib/oe/utils.py
@@ -88,3 +88,12 @@ def param_bool(cfg, field, dflt = None):
 def inherits(d, *classes):
     """Return True if the metadata inherits any of the specified classes"""
     return any(bb.data.inherits_class(cls, d) for cls in classes)
+
+def get_file_depends(d):
+    '''Return the dependent files'''
+    dep_files = []
+    depends = d.getVar('__depends', True) or set()
+    depends = depends.union(d.getVar('__base_depends', True) or set())
+    for (fn, ctime) in depends:
+        dep_files.append(os.path.abspath(fn))
+    return " ".join(dep_files)
-- 
1.7.0.4



