Received: from bsmtp.bon.at (bsmtp.bon.at [213.33.87.14])
 by mx.groups.io with SMTP id smtpd.web11.13183.1587062388288655865
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Apr 2020 11:39:48 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: streamunlimited.com, ip: 213.33.87.14, mailfrom: quentin.schulz@streamunlimited.com)
Received: from qschulz.suevie (vpn.streamunlimited.com [91.114.0.140])
	by bsmtp.bon.at (Postfix) with ESMTPSA id 4937LT6TMPz5tlB;
	Thu, 16 Apr 2020 20:39:45 +0200 (CEST)
From: "Quentin Schulz" <quentin.schulz@streamunlimited.com>
To: openembedded-core@lists.openembedded.org
Cc: bluelightning@bluelightning.org,
	Quentin Schulz <quentin.schulz@streamunlimited.com>
Subject: [PATCH] classes: base|package: check pkgs lics are subset of recipe lics only once
Date: Thu, 16 Apr 2020 20:39:21 +0200
Message-Id: <20200416183921.3032-1-quentin.schulz@streamunlimited.com>
X-Mailer: git-send-email 2.17.1

Yocto bug: https://bugzilla.yoctoproject.org/show_bug.cgi?id=10130

Move logic checking that all packages licenses are only a subset of
recipe licenses from base.bbclass to the package.bbclass so that it's
evaluated only once, during packaging.

As explained in the linked bugzilla entry, if a package license is not
part of the recipe license, the warning message gets shown an
unreasonable amount of time because it's evaluated every time a recipe
is parsed.

Signed-off-by: Quentin Schulz <quentin.schulz@streamunlimited.com>
---

- We may not want this patch if we find it important that this warning is
displayed at parsing time and not only after packaging has been done
(which means dryruns aren't going to detect this issue anymore).
- Do we want separate patches for each class?
- The original bug report isn't very explicit, so hopefully I'm actually
fixing it :) adding Paul, the reporter, in Cc so he can confirm.

 meta/classes/base.bbclass    | 13 -------------
 meta/classes/package.bbclass | 13 ++++++++++++-
 2 files changed, 12 insertions(+), 14 deletions(-)

diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
index 45f9435fd8..7aa2e144eb 100644
--- a/meta/classes/base.bbclass
+++ b/meta/classes/base.bbclass
@@ -584,19 +584,6 @@ python () {
                         bb.debug(1, "Skipping recipe %s because of incompatible license(s): %s" % (pn, ' '.join(incompatible_lic)))
                         raise bb.parse.SkipRecipe("it has incompatible license(s): %s" % ' '.join(incompatible_lic))
 
-        # Try to verify per-package (LICENSE_<pkg>) values. LICENSE should be a
-        # superset of all per-package licenses. We do not do advanced (pattern)
-        # matching of license expressions - just check that all license strings
-        # in LICENSE_<pkg> are found in LICENSE.
-        license_set = oe.license.list_licenses(license)
-        for pkg in d.getVar('PACKAGES').split():
-            pkg_license = d.getVar('LICENSE_' + pkg)
-            if pkg_license:
-                unlisted = oe.license.list_licenses(pkg_license) - license_set
-                if unlisted:
-                    bb.warn("LICENSE_%s includes licenses (%s) that are not "
-                            "listed in LICENSE" % (pkg, ' '.join(unlisted)))
-
     needsrcrev = False
     srcuri = d.getVar('SRC_URI')
     for uri in srcuri.split():
diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index d4c6a90e84..1e87108e43 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -1322,9 +1322,20 @@ python populate_packages () {
     os.umask(oldumask)
     os.chdir(workdir)
 
-    # Handle LICENSE_EXCLUSION
+    license_set = oe.license.list_licenses(d.getVar('LICENSE'))
     package_list = []
     for pkg in packages:
+        # Try to verify per-package (LICENSE_<pkg>) values. LICENSE should be a
+        # superset of all per-package licenses. We do not do advanced (pattern)
+        # matching of license expressions - just check that all license strings
+        # in LICENSE_<pkg> are found in LICENSE.
+        pkg_license = d.getVar('LICENSE_' + pkg)
+        if pkg_license:
+            unlisted = oe.license.list_licenses(pkg_license) - license_set
+            if unlisted:
+                bb.warn("LICENSE_%s includes licenses (%s) that are not "
+                        "listed in LICENSE" % (pkg, ' '.join(unlisted)))
+        # Handle LICENSE_EXCLUSION
         licenses = d.getVar('LICENSE_EXCLUSION-' + pkg)
         if licenses:
             msg = "Excluding %s from packaging as it has incompatible license(s): %s" % (pkg, licenses)
-- 
2.17.1

