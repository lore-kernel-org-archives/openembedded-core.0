Return-Path: <anibal.limon@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id C952375F17
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Jul 2015 00:44:02 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga103.jf.intel.com with ESMTP; 14 Jul 2015 17:43:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,476,1432623600"; d="scan'208";a="606330209"
Received: from alimon-thinkpad-w540.zpn.intel.com ([10.219.5.54])
	by orsmga003.jf.intel.com with ESMTP; 14 Jul 2015 17:44:00 -0700
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 14 Jul 2015 19:43:56 -0500
Message-Id: <1436921037-32378-3-git-send-email-anibal.limon@linux.intel.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1436921037-32378-1-git-send-email-anibal.limon@linux.intel.com>
References: <1436921037-32378-1-git-send-email-anibal.limon@linux.intel.com>
MIME-Version: 1.0
Subject: [PATCHv2 2/3] oe/recipeutils.py: get_recipe_upstream_info update to get revision
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
X-List-Received-Date: Wed, 15 Jul 2015 00:44:03 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Bitbake fetcher latest_versionstring now returns a tuple with (version,
 revision) that helps SCM's like git to build current upstream version.

[YOCTO #7605]

Signed-off-by: Aníbal Limón <anibal.limon@linux.intel.com>
---
 meta/lib/oe/recipeutils.py | 28 +++++++++++++++-------------
 1 file changed, 15 insertions(+), 13 deletions(-)

diff --git a/meta/lib/oe/recipeutils.py b/meta/lib/oe/recipeutils.py
index ab50686..f3da864 100644
--- a/meta/lib/oe/recipeutils.py
+++ b/meta/lib/oe/recipeutils.py
@@ -703,28 +703,30 @@ def get_recipe_upstream_version(rd):
     else:
         ud = bb.fetch2.FetchData(src_uri, rd)
         pupver = ud.method.latest_versionstring(ud, rd)
+        (upversion, revision) = pupver
 
+        # format git version version+gitAUTOINC+HASH
         if uri_type == 'git':
             (pv, pfx, sfx) = get_recipe_pv_without_srcpv(pv, uri_type)
 
-            revision = ud.method.latest_revision(ud, rd, ud.names[0])
+            # if contains revision but not upversion use current pv
+            if upversion == '' and revision:
+                upversion = pv
 
-            # if contains revision but not pupver use current pv
-            if pupver == '' and revision:
-                pupver = pv
-
-            if pupver != '':
-                tmp = pupver
-                pupver = ''
+            if upversion:
+                tmp = upversion
+                upversion = ''
 
                 if pfx:
-                    pupver = pfx
-                pupver = pupver + tmp
+                    upversion = pfx + tmp
+                else:
+                    upversion = tmp
+
                 if sfx:
-                    pupver = pupver + sfx + revision[:10]
+                    upversion = upversion + sfx + revision[:10]
 
-        if pupver != '':
-            ru['version'] = pupver
+        if upversion:
+            ru['version'] = upversion
             ru['type'] = 'A'
 
         ru['datetime'] = datetime.now()
-- 
1.9.1


