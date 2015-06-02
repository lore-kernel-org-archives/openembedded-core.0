Return-Path: <anibal.limon@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id D8B28757E5
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Jun 2015 19:48:20 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga103.jf.intel.com with ESMTP; 02 Jun 2015 12:48:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,541,1427785200"; d="scan'208";a="719544795"
Received: from krithika-mobl2.amr.corp.intel.com (HELO
	alimon-ThinkPad-W540.amr.corp.intel.com) ([10.254.180.132])
	by fmsmga001.fm.intel.com with ESMTP; 02 Jun 2015 12:48:22 -0700
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  2 Jun 2015 14:49:45 -0500
Message-Id: <63a065761fab93027934b89c41c4f8c2b0f1f08a.1433274434.git.anibal.limon@linux.intel.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1433274434.git.anibal.limon@linux.intel.com>
References: <cover.1433274434.git.anibal.limon@linux.intel.com>
In-Reply-To: <cover.1433274434.git.anibal.limon@linux.intel.com>
References: <cover.1433274434.git.anibal.limon@linux.intel.com>
MIME-Version: 1.0
Subject: [PATCH 1/4] recipeutils: Add get_recipe_upstream_version and get_recipe_pv_without_srcpv functions
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
X-List-Received-Date: Tue, 02 Jun 2015 19:48:21 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The get_recipe_upstream_version functions tries to get the current
version of recipe in upstream it uses bb.fetch2 latest_versionstring
method also latest_revision when is SCM.

The get_recipe_pv_without_srcpv discards the SRCPV in SCM's recipe like
git it returns a tuple with the version, prefix and suffix of a PV.

Signed-off-by: Aníbal Limón <anibal.limon@linux.intel.com>
---
 meta/lib/oe/recipeutils.py | 88 ++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 88 insertions(+)

diff --git a/meta/lib/oe/recipeutils.py b/meta/lib/oe/recipeutils.py
index f05b6c0..26bbf3e 100644
--- a/meta/lib/oe/recipeutils.py
+++ b/meta/lib/oe/recipeutils.py
@@ -626,3 +626,91 @@ def replace_dir_vars(path, d):
         path = path.replace(dirpath, '${%s}' % dirvars[dirpath])
     return path
 
+def get_recipe_pv_without_srcpv(pv, uri_type):
+    """
+    Get PV without SRCPV common in SCM's for now only
+    support git.
+
+    Returns tuple with pv, prefix and suffix.
+    """
+    pfx = ''
+    sfx = ''
+
+    if uri_type == 'git':
+        git_regex = re.compile("(?P<pfx>(v|))(?P<ver>((\d+[\.\-_]*)+))(?P<sfx>(\+|)(git|)(r|)(AUTOINC|)(\+|))(?P<rev>.*)")
+        m = git_regex.match(pv)
+
+        if m:
+            pv = m.group('ver')
+            pfx = m.group('pfx')
+            sfx = m.group('sfx')
+
+    return (pv, pfx, sfx)
+
+def get_recipe_upstream_version(rd):
+    """
+        Get upstream version of recipe using bb.fetch2 methods with support for
+        http, https, ftp and git.
+
+        bb.fetch2 exceptions can be raised,
+            FetchError when don't have network access or upstream site don't response.
+            NoMethodError when uri latest_versionstring method isn't implemented.
+
+        Returns a dictonary with version, type and datetime.
+        Type can be A for Automatic, M for Manual and U for Unknown.
+    """
+    from bb.fetch2 import decodeurl
+    from datetime import datetime
+
+    ru = {}
+    ru['version'] = ''
+    ru['type'] = 'U'
+    ru['datetime'] = ''
+
+    # XXX: we suppose that the first entry points to the upstream sources
+    src_uri = rd.getVar('SRC_URI', True).split()[0] 
+    uri_type, _, _, _, _, _ =  decodeurl(src_uri)
+
+    pv = rd.getVar('PV', True)
+
+    manual_upstream_version = rd.getVar("RECIPE_UPSTREAM_VERSION", True)
+    if manual_upstream_version:
+        # manual tracking of upstream version.
+        ru['version'] = manual_upstream_version
+        ru['type'] = 'M'
+
+        manual_upstream_date = rd.getVar("CHECK_DATE", True)
+        if manual_upstream_date:
+            date = datetime.strptime(manual_upstream_date, "%b %d, %Y")
+        else:
+            date = datetime.now()
+        ru['datetime'] = date
+
+    elif uri_type == "file":
+        # files are always up-to-date
+        ru['version'] =  pv
+        ru['type'] = 'A'
+        ru['datetime'] = datetime.now()
+    else:
+        ud = bb.fetch2.FetchData(src_uri, rd)
+        pupver = ud.method.latest_versionstring(ud, rd)
+
+        if uri_type == 'git':
+            (pv, pfx, sfx) = get_recipe_pv_without_srcpv(pv, uri_type)
+
+            latest_revision = ud.method.latest_revision(ud, rd, ud.names[0])
+
+            # if contains revision but not pupver use current pv
+            if pupver == '' and latest_revision:
+                pupver = pv
+
+            if pupver != '':
+                pupver = pfx + pupver + sfx + latest_revision[:10]
+
+        if pupver != '':
+            ru['version'] = pupver
+            ru['type'] = 'A'
+
+        ru['datetime'] = datetime.now()
+
+    return ru
-- 
1.9.1


