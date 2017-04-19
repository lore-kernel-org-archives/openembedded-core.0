Return-Path: <brian.avery@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 78EA071C7A
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Apr 2017 19:46:15 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	19 Apr 2017 12:46:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.37,222,1488873600"; d="scan'208";a="76410978"
Received: from bavery-ws-desk.jf.intel.com ([10.54.74.5])
	by orsmga002.jf.intel.com with ESMTP; 19 Apr 2017 12:46:16 -0700
From: brian avery <brian.avery@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 19 Apr 2017 12:49:02 -0700
Message-Id: <aa964cc32c1285466bca7a952e4c173b644e19c5.1492631156.git.brian.avery@intel.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1492631156.git.brian.avery@intel.com>
References: <cover.1492631156.git.brian.avery@intel.com>
Subject: [PATCH 1/3] meta: add search, replace strings to export2json
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
X-List-Received-Date: Wed, 19 Apr 2017 19:46:15 -0000

We want to be able to save relative paths so that we can relocate the
deploy dir images and kernels, yet still have qemu and testimage work
correctly.  This extends export2json with 2 named arguments so a
search/replace operation can be done to remove the leading path.

[YOCTO #11375]

Signed-off-by: brian avery <brian.avery@intel.com>
---
 meta/lib/oe/data.py | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oe/data.py b/meta/lib/oe/data.py
index 80bba2b..b8901e6 100644
--- a/meta/lib/oe/data.py
+++ b/meta/lib/oe/data.py
@@ -17,7 +17,7 @@ def typed_value(key, d):
     except (TypeError, ValueError) as exc:
         bb.msg.fatal("Data", "%s: %s" % (key, str(exc)))
 
-def export2json(d, json_file, expand=True):
+def export2json(d, json_file, expand=True, searchString="",replaceString=""):
     data2export = {}
     keys2export = []
 
@@ -37,9 +37,11 @@ def export2json(d, json_file, expand=True):
 
     for key in keys2export:
         try:
-            data2export[key] = d.getVar(key, expand)
+            data2export[key] = d.getVar(key, expand).replace(searchString,replaceString)
         except bb.data_smart.ExpansionError:
             data2export[key] = ''
+        except AttributeError:
+            pass
 
     with open(json_file, "w") as f:
         json.dump(data2export, f, skipkeys=True, indent=4, sort_keys=True)
-- 
1.9.1


