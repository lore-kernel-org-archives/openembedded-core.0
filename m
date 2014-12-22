Return-Path: <anibal.limon@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id DC7B07274F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Dec 2014 23:30:25 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga103.jf.intel.com with ESMTP; 22 Dec 2014 15:27:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.07,627,1413270000"; d="scan'208";a="627935336"
Received: from alimon-thinkpad-w540.zpn.intel.com ([10.219.4.60])
	by orsmga001.jf.intel.com with ESMTP; 22 Dec 2014 15:30:20 -0800
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 22 Dec 2014 17:30:46 -0600
Message-Id: <603319d77c3d720e430df8f42fdc01d544cab29b.1419290780.git.anibal.limon@linux.intel.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1419290780.git.anibal.limon@linux.intel.com>
References: <cover.1419290780.git.anibal.limon@linux.intel.com>
In-Reply-To: <cover.1419290780.git.anibal.limon@linux.intel.com>
References: <cover.1419290780.git.anibal.limon@linux.intel.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] license: Validate if LICENSE is well defined.
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
X-List-Received-Date: Mon, 22 Dec 2014 23:30:28 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add check_license_format function that shows warning if LICENSE don't have
valid operators and also if have space separated entries without operator,
add check_license_format validation into base class.

[YOCTO #6758]

Signed-off-by: Aníbal Limón <anibal.limon@linux.intel.com>
---
 meta/classes/base.bbclass    |  1 +
 meta/classes/license.bbclass | 22 ++++++++++++++++++++++
 2 files changed, 23 insertions(+)

diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
index 06cfe26..b8f61f3 100644
--- a/meta/classes/base.bbclass
+++ b/meta/classes/base.bbclass
@@ -390,6 +390,7 @@ python () {
         bb.fatal('This recipe does not have the LICENSE field set (%s)' % pn)
 
     if bb.data.inherits_class('license', d):
+        check_license_format(d)
         unmatched_license_flag = check_license_flags(d)
         if unmatched_license_flag:
             bb.debug(1, "Skipping %s because it has a restricted license not"
diff --git a/meta/classes/license.bbclass b/meta/classes/license.bbclass
index c55ee77..f85d4f9 100644
--- a/meta/classes/license.bbclass
+++ b/meta/classes/license.bbclass
@@ -409,6 +409,28 @@ def check_license_flags(d):
             return unmatched_flag
     return None
 
+def check_license_format(d):
+    """
+    This function checks if LICENSE is well defined,
+        Validate operators in LICENSES.
+        No spaces are allowed between LICENSES.
+    """
+    pn = d.getVar('PN', True)
+    licenses = d.getVar('LICENSE', True)
+    from oe.license import license_operator
+    from oe.license import license_pattern
+
+    elements = filter(lambda x: x.strip(), license_operator.split(licenses))
+    for pos, element in enumerate(elements):
+        if license_pattern.match(element):
+            if pos > 0 and license_pattern.match(elements[pos - 1]):
+                bb.warn("Recipe %s, LICENSE (%s) has invalid format, " \
+                        "LICENSES must have operator \"%s\" between them." %
+                        (pn, licenses, license_operator.pattern))
+        elif not license_operator.match(element):
+            bb.warn("Recipe %s, LICENSE (%s) has invalid operator (%s) not in" \
+                  " \"%s\"." % (pn, licenses, element, license_operator.pattern))
+
 SSTATETASKS += "do_populate_lic"
 do_populate_lic[sstate-inputdirs] = "${LICSSTATEDIR}"
 do_populate_lic[sstate-outputdirs] = "${LICENSE_DIRECTORY}/"
-- 
1.9.1


