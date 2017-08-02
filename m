Return-Path: <mark.d.horn@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 280136011C
	for <openembedded-core@lists.openembedded.org>;
	Wed,  2 Aug 2017 23:11:33 +0000 (UTC)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	02 Aug 2017 16:11:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.41,313,1498546800"; d="scan'208";a="132771666"
Received: from mhorn-dev.jf.intel.com ([10.7.159.65])
	by orsmga005.jf.intel.com with ESMTP; 02 Aug 2017 16:11:23 -0700
From: Mark D Horn <mark.d.horn@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  2 Aug 2017 16:09:45 -0700
Message-Id: <1501715385-17089-1-git-send-email-mark.d.horn@intel.com>
X-Mailer: git-send-email 2.7.4
Cc: Mark D Horn <mark.d.horn@intel.com>
Subject: [PATCH] recipetool: create: allow handers to set license
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
X-List-Received-Date: Wed, 02 Aug 2017 23:11:34 -0000

Recipetool plugins set through register_recipe_handlers were not able
to impact the license type via setting extravalues['LICENSE']. This is
due to caching the license variables in create_recipe before the handlers
have been executed.

This change moves the call to handle_license_vars well after the
registered plugins (and extravalue functions) have been called.

Signed-off-by: Mark D Horn <mark.d.horn@intel.com>
---
 scripts/lib/recipetool/create.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/lib/recipetool/create.py b/scripts/lib/recipetool/create.py
index 359eb9adfc26..6dd1a81369bb 100644
--- a/scripts/lib/recipetool/create.py
+++ b/scripts/lib/recipetool/create.py
@@ -549,8 +549,6 @@ def create_recipe(args):
     lines_before.append('')
 
     handled = []
-    licvalues = handle_license_vars(srctree_use, lines_before, handled, extravalues, tinfoil.config_data)
-
     classes = []
 
     # FIXME This is kind of a hack, we probably ought to be using bitbake to do this
@@ -769,6 +767,8 @@ def create_recipe(args):
         outlines.append('')
     outlines.extend(lines_after)
 
+    licvalues = handle_license_vars(srctree_use, lines_before, handled, extravalues, tinfoil.config_data)
+
     if extravalues:
         if 'LICENSE' in extravalues and not licvalues:
             # Don't blow away 'CLOSED' value that comments say we set
-- 
2.7.4


