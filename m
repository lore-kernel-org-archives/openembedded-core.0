Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 4B7F971A49
	for <openembedded-core@lists.openembedded.org>;
	Mon, 31 Oct 2016 04:00:27 +0000 (UTC)
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by orsmga103.jf.intel.com with ESMTP; 30 Oct 2016 21:00:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,573,1473145200"; d="scan'208";a="25576843"
Received: from mbi370x-mobl.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.185.81])
	by fmsmga005.fm.intel.com with ESMTP; 30 Oct 2016 21:00:27 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 31 Oct 2016 16:59:47 +1300
Message-Id: <daa1ccf7c131f983aa98b7dd64676251a9f0cf6b.1477886344.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <cover.1477886344.git.paul.eggleton@linux.intel.com>
References: <cover.1477886344.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1477886344.git.paul.eggleton@linux.intel.com>
References: <cover.1477886344.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 5/7] recipetool: create: separate LICENSE items with & by default
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
X-List-Received-Date: Mon, 31 Oct 2016 04:00:27 -0000

recipetool sets the LICENSE value based on licenses detected from the
source tree. If there are multiple licenses then they were being
separated by spaces, but this isn't actually legal formatting and if
you're using "devtool add" you get a warning printed when devtool
parses the recipe internally.

Earlier I had made a conscious decision to do it this way since it's up
to the user to figure out whether the multiple licenses should all apply
(in which case they'd be separated with &) or if there is a choice of
license (in which case | is the correct separator). However, I've come
to the conclusion that we can just default to & and then the ugly
warning goes away, and it's the safest alternative of the two (and most
likely to be correct, since it's more common to have a codebase which is
made up of code with different licenses, i.e. all of them apply to the
combined work).

I've tweaked the comment that we add to the recipe to explicitly state
that we've used & and that the user needs to change that if that's not
accurate.

Fixes [YOCTO #10413].

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/lib/oeqa/selftest/devtool.py |  5 ++++-
 scripts/lib/recipetool/create.py  | 12 +++++++-----
 2 files changed, 11 insertions(+), 6 deletions(-)

diff --git a/meta/lib/oeqa/selftest/devtool.py b/meta/lib/oeqa/selftest/devtool.py
index e992dcf..713f2c5 100644
--- a/meta/lib/oeqa/selftest/devtool.py
+++ b/meta/lib/oeqa/selftest/devtool.py
@@ -46,7 +46,10 @@ class DevtoolBase(oeSelfTest):
                     if needvalue is None:
                         self.fail('Variable %s should not appear in recipe')
                     if isinstance(needvalue, set):
-                        value = set(value.split())
+                        if var == 'LICENSE':
+                            value = set(value.split(' & '))
+                        else:
+                            value = set(value.split())
                     self.assertEqual(value, needvalue, 'values for %s do not match' % var)
 
 
diff --git a/scripts/lib/recipetool/create.py b/scripts/lib/recipetool/create.py
index c1819b6..cb1c804 100644
--- a/scripts/lib/recipetool/create.py
+++ b/scripts/lib/recipetool/create.py
@@ -787,10 +787,12 @@ def handle_license_vars(srctree, lines_before, handled, extravalues, d):
         lines_before.append('# your responsibility to verify that the values are complete and correct.')
         if len(licvalues) > 1:
             lines_before.append('#')
-            lines_before.append('# NOTE: multiple licenses have been detected; if that is correct you should separate')
-            lines_before.append('# these in the LICENSE value using & if the multiple licenses all apply, or | if there')
-            lines_before.append('# is a choice between the multiple licenses. If in doubt, check the accompanying')
-            lines_before.append('# documentation to determine which situation is applicable.')
+            lines_before.append('# NOTE: multiple licenses have been detected; they have been separated with &')
+            lines_before.append('# in the LICENSE value for now since it is a reasonable assumption that all')
+            lines_before.append('# of the licenses apply. If instead there is a choice between the multiple')
+            lines_before.append('# licenses then you should change the value to separate the licenses with |')
+            lines_before.append('# instead of &. If there is any doubt, check the accompanying documentation')
+            lines_before.append('# to determine which situation is applicable.')
         if lic_unknown:
             lines_before.append('#')
             lines_before.append('# The following license files were not able to be identified and are')
@@ -814,7 +816,7 @@ def handle_license_vars(srctree, lines_before, handled, extravalues, d):
             licenses = [pkg_license]
         else:
             lines_before.append('# NOTE: Original package metadata indicates license is: %s' % pkg_license)
-    lines_before.append('LICENSE = "%s"' % ' '.join(licenses))
+    lines_before.append('LICENSE = "%s"' % ' & '.join(licenses))
     lines_before.append('LIC_FILES_CHKSUM = "%s"' % ' \\\n                    '.join(lic_files_chksum))
     lines_before.append('')
     handled.append(('license', licvalues))
-- 
2.5.5


