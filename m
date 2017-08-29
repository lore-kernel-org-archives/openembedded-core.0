Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id D7FA171A5A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Aug 2017 09:58:32 +0000 (UTC)
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	29 Aug 2017 02:58:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.41,444,1498546800"; d="scan'208";a="123608158"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by orsmga004.jf.intel.com with ESMTP; 29 Aug 2017 02:58:32 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 29 Aug 2017 12:55:32 +0300
Message-Id: <20170829095532.7446-1-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.14.1
Subject: [PATCH] gettext.bbclass: do not add virtual/gettext to DEPENDS
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
X-List-Received-Date: Tue, 29 Aug 2017 09:58:33 -0000

gettext has a notoriously slow configuration step, and so in my testing
this  greatly speeds up building core-image-minimal: from 21m36s to 19m2s
(empty sstate and tmp, but pre-populated downloads).

I have also built world, and core-image-sato to make sure it doesn't break
or modify the build, and there is no difference whatsoever in packages
and images content. Target gettext not seems to be used for anything.

Also fix up insane.bbclass to remove the corresponding QA check.

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/classes/gettext.bbclass | 2 +-
 meta/classes/insane.bbclass  | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/classes/gettext.bbclass b/meta/classes/gettext.bbclass
index 689ef55ed1f..da68e632424 100644
--- a/meta/classes/gettext.bbclass
+++ b/meta/classes/gettext.bbclass
@@ -13,7 +13,7 @@ def gettext_oeconf(d):
         return '--disable-nls'
     return "--enable-nls"
 
-DEPENDS_GETTEXT ??= "virtual/gettext gettext-native"
+DEPENDS_GETTEXT ??= "gettext-native"
 
 BASEDEPENDS_append = " ${@gettext_dependencies(d)}"
 EXTRA_OECONF_append = " ${@gettext_oeconf(d)}"
diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
index b7177c9b329..a2ec466775f 100644
--- a/meta/classes/insane.bbclass
+++ b/meta/classes/insane.bbclass
@@ -1183,9 +1183,9 @@ Rerun configure task after fixing this.""")
         elif bb.data.inherits_class('cross-canadian', d):
             gt = "nativesdk-gettext"
         else:
-            gt = "virtual/" + ml + "gettext"
+            gt = None
         deps = bb.utils.explode_deps(d.getVar('DEPENDS') or "")
-        if gt not in deps:
+        if gt is not None and gt not in deps:
             for config in configs:
                 gnu = "grep \"^[[:space:]]*AM_GNU_GETTEXT\" %s >/dev/null" % config
                 if subprocess.call(gnu, shell=True) == 0:
-- 
2.14.1


