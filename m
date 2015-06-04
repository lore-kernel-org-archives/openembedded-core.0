Return-Path: <anibal.limon@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 4EAAE757B2
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Jun 2015 18:41:28 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga103.fm.intel.com with ESMTP; 04 Jun 2015 11:41:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,554,1427785200"; d="scan'208";a="737234168"
Received: from alimon-thinkpad-w540.zpn.intel.com ([10.219.4.173])
	by fmsmga002.fm.intel.com with ESMTP; 04 Jun 2015 11:41:28 -0700
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  4 Jun 2015 13:42:56 -0500
Message-Id: <3665eead1ec3642c00bdcc9eb91e5bf70d93aaa7.1433443273.git.anibal.limon@linux.intel.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1433443273.git.anibal.limon@linux.intel.com>
References: <cover.1433443273.git.anibal.limon@linux.intel.com>
In-Reply-To: <cover.1433443273.git.anibal.limon@linux.intel.com>
References: <cover.1433443273.git.anibal.limon@linux.intel.com>
MIME-Version: 1.0
Subject: [PATCHv2 1/4] recipeutils: Improve get_recipe_pv_without_srcpv function
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
X-List-Received-Date: Thu, 04 Jun 2015 18:41:31 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Use pv instead of rd this make the function more generic and
avoid copy recipe data.

Signed-off-by: Aníbal Limón <anibal.limon@linux.intel.com>
---
 meta/lib/oe/recipeutils.py | 12 ++----------
 1 file changed, 2 insertions(+), 10 deletions(-)

diff --git a/meta/lib/oe/recipeutils.py b/meta/lib/oe/recipeutils.py
index 37efefb..26bbf3e 100644
--- a/meta/lib/oe/recipeutils.py
+++ b/meta/lib/oe/recipeutils.py
@@ -626,23 +626,17 @@ def replace_dir_vars(path, d):
         path = path.replace(dirpath, '${%s}' % dirvars[dirpath])
     return path
 
-def get_recipe_pv_without_srcpv(rd, uri_type):
+def get_recipe_pv_without_srcpv(pv, uri_type):
     """
     Get PV without SRCPV common in SCM's for now only
     support git.
 
     Returns tuple with pv, prefix and suffix.
     """
-    pv = ''
     pfx = ''
     sfx = ''
 
     if uri_type == 'git':
-        rd_tmp = rd.createCopy()
-
-        rd_tmp.setVar('SRCPV', '')
-        pv = rd_tmp.getVar('PV', True)
-
         git_regex = re.compile("(?P<pfx>(v|))(?P<ver>((\d+[\.\-_]*)+))(?P<sfx>(\+|)(git|)(r|)(AUTOINC|)(\+|))(?P<rev>.*)")
         m = git_regex.match(pv)
 
@@ -650,8 +644,6 @@ def get_recipe_pv_without_srcpv(rd, uri_type):
             pv = m.group('ver')
             pfx = m.group('pfx')
             sfx = m.group('sfx')
-    else:
-        pv = rd.getVar('PV', True)
 
     return (pv, pfx, sfx)
 
@@ -704,7 +696,7 @@ def get_recipe_upstream_version(rd):
         pupver = ud.method.latest_versionstring(ud, rd)
 
         if uri_type == 'git':
-            (pv, pfx, sfx) = get_recipe_pv_without_srcpv(rd, uri_type)
+            (pv, pfx, sfx) = get_recipe_pv_without_srcpv(pv, uri_type)
 
             latest_revision = ud.method.latest_revision(ud, rd, ud.names[0])
 
-- 
1.9.1


