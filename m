Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1RkejC-0007GE-Ra
	for openembedded-core@lists.openembedded.org;
	Tue, 10 Jan 2012 17:39:15 +0100
Received: by ghrr17 with SMTP id r17so2090691ghr.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Jan 2012 08:31:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=BvLLblVueij7B57QIeMBABaXCDvkG+1tfEMPIinL7N8=;
	b=hwx2QFEpExB7c9q6KWYriq8OIeaAQOROXDuTeDtmj9+hGb4EVIA8AiRmBdortpWQGT
	80RbJJRhbioaf3V+lLQYzubkzpaQrqQa5d059nASijIVRqBNxdeJ16Rhd2emQmjPrdU3
	XLwl/8o/YpbyfbijnQGGNzdx9bFnK34JUIrxk=
Received: by 10.100.199.10 with SMTP id w10mr9283246anf.29.1326213105744;
	Tue, 10 Jan 2012 08:31:45 -0800 (PST)
Received: from sb-u1004lts-64bit.alm.mentorg.com (hsvwanfw1-nat.mentorg.com.
	[139.181.24.34])
	by mx.google.com with ESMTPS id j11sm133124022anl.8.2012.01.10.08.31.44
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 10 Jan 2012 08:31:45 -0800 (PST)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 10 Jan 2012 10:31:46 -0600
Message-Id: <3e27bba7364827ad64c5aef71d66d6c9ba29d060.1326213043.git.chris_larson@mentor.com>
X-Mailer: git-send-email 1.7.8.rc4
In-Reply-To: <cover.1326213043.git.chris_larson@mentor.com>
References: <cover.1326213043.git.chris_larson@mentor.com>
In-Reply-To: <cover.1326213043.git.chris_larson@mentor.com>
References: <cover.1326213043.git.chris_larson@mentor.com>
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [PATCH 3/4] oe.license: add is_included convenience function
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 10 Jan 2012 16:39:15 -0000

From: Christopher Larson <chris_larson@mentor.com>

Given a license string and whitelist and blacklist, determine if the
license string matches the whitelist and does not match the blacklist.

When encountering an OR, it prefers the side with the highest weight (more
included licenses). It then checks the inclusion of the flattened list of
licenses from there.

Returns a tuple holding the boolean state and a list of the applicable
licenses which were excluded (or None, if the state is True)

Examples:

    is_included, excluded = oe.license.is_included(licensestr, ['GPL*', 'LGPL*'])
    is_included, excluded = oe.license.is_included(licensestr, blacklist=['Proprietary', 'CLOSED'])

Signed-off-by: Christopher Larson <chris_larson@mentor.com>
---
 meta/classes/copyleft_compliance.bbclass |   23 +++---------------
 meta/lib/oe/license.py                   |   36 ++++++++++++++++++++++++++++++
 meta/lib/test.py                         |    3 ++
 3 files changed, 43 insertions(+), 19 deletions(-)
 create mode 100644 meta/lib/test.py

diff --git a/meta/classes/copyleft_compliance.bbclass b/meta/classes/copyleft_compliance.bbclass
index fd04638..6f058e0 100644
--- a/meta/classes/copyleft_compliance.bbclass
+++ b/meta/classes/copyleft_compliance.bbclass
@@ -46,32 +46,17 @@ def copyleft_should_include(d):
     include = oe.data.typed_value('COPYLEFT_LICENSE_INCLUDE', d)
     exclude = oe.data.typed_value('COPYLEFT_LICENSE_EXCLUDE', d)
 
-    def include_license(license):
-        if any(fnmatch(license, pattern) for pattern in exclude):
-            return False
-        if any(fnmatch(license, pattern) for pattern in include):
-            return True
-        return False
-
-    def choose_licenses(a, b):
-        """Select the left option in an OR if all its licenses are to be included"""
-        if all(include_license(lic) for lic in a):
-            return a
-        else:
-            return b
-
     try:
-        licenses = oe.license.flattened_licenses(d.getVar('LICENSE', True), choose_licenses)
+        is_included, excluded = oe.license.is_included(d.getVar('LICENSE', True), include, exclude)
     except oe.license.InvalidLicense as exc:
         bb.fatal('%s: %s' % (d.getVar('PF', True), exc))
     except SyntaxError as exc:
         bb.warn('%s: error when parsing the LICENSE variable: %s' % (d.getVar('P', True), exc))
     else:
-        excluded = filter(lambda lic: not include_license(lic), licenses)
-        if excluded:
-            return False, 'recipe has excluded licenses: %s' % ', '.join(excluded)
-        else:
+        if is_included:
             return True, None
+        else:
+            return False, 'recipe has excluded licenses: %s' % ', '.join(excluded)
 
 python do_prepare_copyleft_sources () {
     """Populate a tree of the recipe sources and emit patch series files"""
diff --git a/meta/lib/oe/license.py b/meta/lib/oe/license.py
index 7ab66e7..3543cfe 100644
--- a/meta/lib/oe/license.py
+++ b/meta/lib/oe/license.py
@@ -3,6 +3,7 @@
 
 import ast
 import re
+from fnmatch import fnmatchcase as fnmatch
 
 class InvalidLicense(StandardError):
     def __init__(self, license):
@@ -60,3 +61,38 @@ def flattened_licenses(licensestr, choose_licenses):
     flatten = FlattenVisitor(choose_licenses)
     flatten.visit_string(licensestr)
     return flatten.licenses
+
+def is_included(licensestr, whitelist=None, blacklist=None):
+    """Given a license string and whitelist and blacklist, determine if the
+    license string matches the whitelist and does not match the blacklist.
+
+    Returns a tuple holding the boolean state and a list of the applicable
+    licenses which were excluded (or None, if the state is True)
+    """
+
+    def include_license(license):
+        return (any(fnmatch(license, pattern) for pattern in whitelist) and not
+                any(fnmatch(license, pattern) for pattern in blacklist))
+
+    def choose_licenses(alpha, beta):
+        """Select the option in an OR which is the 'best' (has the most
+        included licenses)."""
+        alpha_weight = len(filter(include_license, alpha))
+        beta_weight = len(filter(include_license, beta))
+        if alpha_weight > beta_weight:
+            return alpha
+        else:
+            return beta
+
+    if not whitelist:
+        whitelist = ['*']
+
+    if not blacklist:
+        blacklist = []
+
+    licenses = flattened_licenses(licensestr, choose_licenses)
+    excluded = filter(lambda lic: not include_license(lic), licenses)
+    if excluded:
+        return False, excluded
+    else:
+        return True, None
diff --git a/meta/lib/test.py b/meta/lib/test.py
new file mode 100644
index 0000000..12f4d83
--- /dev/null
+++ b/meta/lib/test.py
@@ -0,0 +1,3 @@
+import oe.license
+
+print(oe.license.is_included('LGPLv2.1 | GPLv3', ['*'], []))
-- 
1.7.8.rc4



