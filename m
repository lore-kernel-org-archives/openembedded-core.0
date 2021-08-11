Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web11.12887.1628711986897496523
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Aug 2021 12:59:47 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: 0leil.net, ip: 217.70.183.197, mailfrom: foss@0leil.net)
Received: (Authenticated sender: foss@0leil.net)
	by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id 920751C0002;
	Wed, 11 Aug 2021 19:59:44 +0000 (UTC)
From: "Quentin Schulz" <foss@0leil.net>
To: 
Cc: openembedded-core@lists.openembedded.org,
	Quentin Schulz <foss@0leil.net>
Subject: [PATCH] insane.bbclass: fix new override syntax migration
Date: Wed, 11 Aug 2021 21:59:39 +0200
Message-Id: <20210811195939.11817-1-foss@0leil.net>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A few variables and messages were not migrated over to the new override
syntax (_ to :).

Let's fix that.

Signed-off-by: Quentin Schulz <foss@0leil.net>
---

Note: this has not been tested. But all variables listed in the list do
use : instead of _ for overrides now. Other changes apply to log
messages only.

 meta/classes/insane.bbclass | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
index be5ec60146..810459d432 100644
--- a/meta/classes/insane.bbclass
+++ b/meta/classes/insane.bbclass
@@ -835,11 +835,11 @@ def package_qa_check_deps(pkg, pkgdest, d):
         try:
             rvar = bb.utils.explode_dep_versions2(localdata.getVar(var) or "")
         except ValueError as e:
-            bb.fatal("%s_%s: %s" % (var, pkg, e))
+            bb.fatal("%s:%s: %s" % (var, pkg, e))
         for dep in rvar:
             for v in rvar[dep]:
                 if v and not v.startswith(('< ', '= ', '> ', '<= ', '>=')):
-                    error_msg = "%s_%s is invalid: %s (%s)   only comparisons <, =, >, <=, and >= are allowed" % (var, pkg, dep, v)
+                    error_msg = "%s:%s is invalid: %s (%s)   only comparisons <, =, >, <=, and >= are allowed" % (var, pkg, dep, v)
                     package_qa_handle_error("dep-cmp", error_msg, d)
 
     check_valid_deps('RDEPENDS')
@@ -888,7 +888,7 @@ def package_qa_check_expanded_d(package, d, messages):
     expanded_d = d.getVar('D')
 
     for var in 'FILES','pkg_preinst', 'pkg_postinst', 'pkg_prerm', 'pkg_postrm':
-        bbvar = d.getVar(var + "_" + package) or ""
+        bbvar = d.getVar(var + ":" + package) or ""
         if expanded_d in bbvar:
             if var == 'FILES':
                 package_qa_add_message(messages, "expanded-d", "FILES in %s recipe should not contain the ${D} variable as it references the local build directory not the target filesystem, best solution is to remove the ${D} reference" % package)
@@ -1325,10 +1325,10 @@ python () {
     if prog.search(pn):
         package_qa_handle_error("uppercase-pn", 'PN: %s is upper case, this can result in unexpected behavior.' % pn, d)
 
-    # Some people mistakenly use DEPENDS_${PN} instead of DEPENDS and wonder
+    # Some people mistakenly use DEPENDS:${PN} instead of DEPENDS and wonder
     # why it doesn't work.
-    if (d.getVar(d.expand('DEPENDS_${PN}'))):
-        package_qa_handle_error("pkgvarcheck", "recipe uses DEPENDS_${PN}, should use DEPENDS", d)
+    if (d.getVar(d.expand('DEPENDS:${PN}'))):
+        package_qa_handle_error("pkgvarcheck", "recipe uses DEPENDS:${PN}, should use DEPENDS", d)
 
     issues = []
     if (d.getVar('PACKAGES') or "").split():
-- 
2.20.1

