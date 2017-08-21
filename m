Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 32AD3782C5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Aug 2017 05:41:15 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	20 Aug 2017 22:41:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.41,407,1498546800"; d="scan'208";a="1208228373"
Received: from ssen-mobl.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.129.109])
	by fmsmga002.fm.intel.com with ESMTP; 20 Aug 2017 22:41:13 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 21 Aug 2017 17:39:48 +1200
Message-Id: <1c1348170c55cd98df026428e4567337386682c1.1503293342.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.9.5
In-Reply-To: <cover.1503293342.git.paul.eggleton@linux.intel.com>
References: <cover.1503293342.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 09/10] recipetool: allow plugins to set PN / PV more easily
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
X-List-Received-Date: Mon, 21 Aug 2017 05:41:15 -0000

Previously if we were able to auto-determine the name from the URL, that
took precedence over any name that might be set in extravalues by a
plugin. Some plugins might be able to get a better idea of the name and
thus we should move defaulting of the name further down after the
plugins have had a chance to set it.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 scripts/lib/recipetool/create.py | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/scripts/lib/recipetool/create.py b/scripts/lib/recipetool/create.py
index 3abdad0..40bd3c8 100644
--- a/scripts/lib/recipetool/create.py
+++ b/scripts/lib/recipetool/create.py
@@ -656,13 +656,6 @@ def create_recipe(args):
     else:
         realpv = None
 
-    if srcuri and not realpv or not pn:
-        name_pn, name_pv = determine_from_url(srcuri)
-        if name_pn and not pn:
-            pn = name_pn
-        if name_pv and not realpv:
-            realpv = name_pv
-
     if not srcuri:
         lines_before.append('# No information for SRC_URI yet (only an external source tree was specified)')
     lines_before.append('SRC_URI = "%s"' % srcuri)
@@ -671,6 +664,7 @@ def create_recipe(args):
     if srcuri and supports_srcrev(srcuri):
         lines_before.append('')
         lines_before.append('# Modify these as desired')
+        # Note: we have code to replace realpv further down if it gets set to some other value
         lines_before.append('PV = "%s+git${SRCPV}"' % (realpv or '1.0'))
         pv_srcpv = True
         if not args.autorev and srcrev == '${AUTOREV}':
@@ -750,6 +744,13 @@ def create_recipe(args):
             if '_' in pn:
                 pn = pn.replace('_', '-')
 
+    if srcuri and not realpv or not pn:
+        name_pn, name_pv = determine_from_url(srcuri)
+        if name_pn and not pn:
+            pn = name_pn
+        if name_pv and not realpv:
+            realpv = name_pv
+
     if not outfile:
         if not pn:
             log_error_cond('Unable to determine short program name from source tree - please specify name with -N/--name or output file name with -o/--outfile', args.devtool)
@@ -803,6 +804,7 @@ def create_recipe(args):
                 line = line.replace(realpv, '${PV}')
         elif line.startswith('PV = '):
             if realpv:
+                # Replace the first part of the PV value
                 line = re.sub('"[^+]*\+', '"%s+' % realpv, line)
         lines_before.append(line)
 
-- 
2.9.5


