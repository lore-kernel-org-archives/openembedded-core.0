Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 1EDD662131
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Nov 2015 02:11:13 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga103.fm.intel.com with ESMTP; 22 Nov 2015 18:10:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,334,1444719600"; d="scan'208";a="692213431"
Received: from echoo1-mobl1.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.170.181])
	by orsmga003.jf.intel.com with ESMTP; 22 Nov 2015 18:10:57 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 23 Nov 2015 15:09:31 +1300
Message-Id: <c20a1d49e8cb32d5beef497475876090341de549.1448244474.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <cover.1448244474.git.paul.eggleton@linux.intel.com>
References: <cover.1448244474.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1448244474.git.paul.eggleton@linux.intel.com>
References: <cover.1448244474.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 12/18] lib/oe/recipeutils: check in validate_pn() for names instead of filenames
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
X-List-Received-Date: Mon, 23 Nov 2015 02:11:14 -0000

Ensure that the user specifies just the name portion instead of a file
name with extension. (We can't just look for . since there are recipe
names such as "glib-2.0" that legitimately contain .).

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/lib/oe/recipeutils.py | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/lib/oe/recipeutils.py b/meta/lib/oe/recipeutils.py
index 119a688..8918fac 100644
--- a/meta/lib/oe/recipeutils.py
+++ b/meta/lib/oe/recipeutils.py
@@ -398,6 +398,8 @@ def validate_pn(pn):
         return 'Recipe name "%s" is invalid: is a reserved keyword' % pn
     elif pn.startswith('pn-'):
         return 'Recipe name "%s" is invalid: names starting with "pn-" are reserved' % pn
+    elif pn.endswith(('.bb', '.bbappend', '.bbclass', '.inc', '.conf')):
+        return 'Recipe name "%s" is invalid: should be just a name, not a file name' % pn
     return ''
 
 
-- 
2.1.0


