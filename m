Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1RkejD-0007Gh-Ve
	for openembedded-core@lists.openembedded.org;
	Tue, 10 Jan 2012 17:39:16 +0100
Received: by yenm12 with SMTP id m12so2085706yen.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Jan 2012 08:31:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=6Gnhl+zKRSBnV/dzbIJTumiap+uOWjJFIECZ1d0kHBU=;
	b=ENhryidOOcZSpAhiUQ25YBwUUeVStfRzXJDHPR5hKJylMeEiEJ+eR3htUefBGtPgX+
	bqJN8TcJ0WCwHSAj8Z1ollx84/Pfi/TTgyQ/JQheJLYiBX7QP3zXobR199mYQ2/gYtmJ
	aCiwJbyRUjew0bBhGvGGwDj4uYlkM3jhhB5x4=
Received: by 10.236.175.36 with SMTP id y24mr27525974yhl.64.1326213106857;
	Tue, 10 Jan 2012 08:31:46 -0800 (PST)
Received: from sb-u1004lts-64bit.alm.mentorg.com (hsvwanfw1-nat.mentorg.com.
	[139.181.24.34])
	by mx.google.com with ESMTPS id j11sm133124022anl.8.2012.01.10.08.31.45
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 10 Jan 2012 08:31:46 -0800 (PST)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 10 Jan 2012 10:31:47 -0600
Message-Id: <9ad5b4ce4a4454fa9d5e41850edf43b75f260985.1326213043.git.chris_larson@mentor.com>
X-Mailer: git-send-email 1.7.8.rc4
In-Reply-To: <cover.1326213043.git.chris_larson@mentor.com>
References: <cover.1326213043.git.chris_larson@mentor.com>
In-Reply-To: <cover.1326213043.git.chris_larson@mentor.com>
References: <cover.1326213043.git.chris_larson@mentor.com>
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [PATCH 4/4] oe.license: avoid the need to catch SyntaxError
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
X-List-Received-Date: Tue, 10 Jan 2012 16:39:16 -0000

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
1.7.8.rc4



