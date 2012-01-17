Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Rn4au-0006gw-9y
	for openembedded-core@lists.openembedded.org;
	Tue, 17 Jan 2012 09:40:41 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 17 Jan 2012 00:32:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="96632941"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.14.6])
	by azsmga001.ch.intel.com with ESMTP; 17 Jan 2012 00:32:59 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 17 Jan 2012 00:32:11 -0800
Message-Id: <9ec2e13e3e552d3687b6fbd83177ea13581d3ff1.1326786989.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <cover.1326786989.git.sgw@linux.intel.com>
References: <cover.1326786989.git.sgw@linux.intel.com>
In-Reply-To: <cover.1326786989.git.sgw@linux.intel.com>
References: <cover.1326786989.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 26/62] oe.license: avoid the need to catch SyntaxError
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
X-List-Received-Date: Tue, 17 Jan 2012 08:40:43 -0000

From: Christopher Larson <chris_larson@mentor.com>

Signed-off-by: Christopher Larson <chris_larson@mentor.com>
---
 meta/classes/copyleft_compliance.bbclass |    4 +---
 meta/lib/oe/license.py                   |   23 +++++++++++++++++++----
 2 files changed, 20 insertions(+), 7 deletions(-)

diff --git a/meta/classes/copyleft_compliance.bbclass b/meta/classes/copyleft_compliance.bbclass
index 6f058e0..2eb9ded 100644
--- a/meta/classes/copyleft_compliance.bbclass
+++ b/meta/classes/copyleft_compliance.bbclass
@@ -48,10 +48,8 @@ def copyleft_should_include(d):
 
     try:
         is_included, excluded = oe.license.is_included(d.getVar('LICENSE', True), include, exclude)
-    except oe.license.InvalidLicense as exc:
+    except oe.license.LicenseError as exc:
         bb.fatal('%s: %s' % (d.getVar('PF', True), exc))
-    except SyntaxError as exc:
-        bb.warn('%s: error when parsing the LICENSE variable: %s' % (d.getVar('P', True), exc))
     else:
         if is_included:
             return True, None
diff --git a/meta/lib/oe/license.py b/meta/lib/oe/license.py
index 3543cfe..5914506 100644
--- a/meta/lib/oe/license.py
+++ b/meta/lib/oe/license.py
@@ -5,13 +5,25 @@ import ast
 import re
 from fnmatch import fnmatchcase as fnmatch
 
-class InvalidLicense(StandardError):
+class LicenseError(StandardError):
+    pass
+
+class LicenseSyntaxError(LicenseError):
+    def __init__(self, licensestr, exc):
+        self.licensestr = licensestr
+        self.exc = exc
+        LicenseError.__init__(self)
+
+    def __str__(self):
+        return "error in '%s': %s" % (self.licensestr, self.exc)
+
+class InvalidLicense(LicenseError):
     def __init__(self, license):
         self.license = license
-        StandardError.__init__(self)
+        LicenseError.__init__(self)
 
     def __str__(self):
-        return "invalid license '%s'" % self.license
+        return "invalid characters in license '%s'" % self.license
 
 license_operator = re.compile('([&|() ])')
 license_pattern = re.compile('[a-zA-Z0-9.+_\-]+$')
@@ -59,7 +71,10 @@ class FlattenVisitor(LicenseVisitor):
 def flattened_licenses(licensestr, choose_licenses):
     """Given a license string and choose_licenses function, return a flat list of licenses"""
     flatten = FlattenVisitor(choose_licenses)
-    flatten.visit_string(licensestr)
+    try:
+        flatten.visit_string(licensestr)
+    except SyntaxError as exc:
+        raise LicenseSyntaxError(licensestr, exc)
     return flatten.licenses
 
 def is_included(licensestr, whitelist=None, blacklist=None):
-- 
1.7.6.5



