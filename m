Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id B6BB562134
	for <openembedded-core@lists.openembedded.org>;
	Sun, 12 Nov 2017 22:00:59 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	12 Nov 2017 14:01:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.44,385,1505804400"; d="scan'208";a="1243245098"
Received: from mintingh-mobl.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.249.67.199])
	by fmsmga002.fm.intel.com with ESMTP; 12 Nov 2017 14:00:59 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 13 Nov 2017 11:00:25 +1300
Message-Id: <5c396e4795c8314caa84c2f6cc2842f53f59dfaf.1510524005.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.9.5
In-Reply-To: <cover.1510524005.git.paul.eggleton@linux.intel.com>
References: <cover.1510524005.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 1/1] recipetool: create: fix failure handling included dicts
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
X-List-Received-Date: Sun, 12 Nov 2017 22:00:59 -0000

If a setup dict in a python setup.py file pulled in the contents of
another dict (e.g.  **otherdict), then we got an error when mapping
the keys because the key is None in that case. Skip those keys to avoid
the error (we pick up the values directly in any case).

A quick reproducer for this issue:

recipetool create https://files.pythonhosted.org/packages/source/p/pyqtgraph/pyqtgraph-0.10.0.tar.gz

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 scripts/lib/recipetool/create_buildsys_python.py | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/scripts/lib/recipetool/create_buildsys_python.py b/scripts/lib/recipetool/create_buildsys_python.py
index ec5449b..5bd2aa3 100644
--- a/scripts/lib/recipetool/create_buildsys_python.py
+++ b/scripts/lib/recipetool/create_buildsys_python.py
@@ -356,6 +356,8 @@ class PythonRecipeHandler(RecipeHandler):
         # Naive mapping of setup() arguments to PKG-INFO field names
         for d in [info, non_literals]:
             for key, value in list(d.items()):
+                if key is None:
+                    continue
                 new_key = _map(key)
                 if new_key != key:
                     del d[key]
-- 
2.9.5


