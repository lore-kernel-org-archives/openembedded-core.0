Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 42BEE6E6BE
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Feb 2015 15:29:10 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga102.jf.intel.com with ESMTP; 03 Feb 2015 07:25:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,862,1389772800"; d="scan'208";a="449227168"
Received: from unknown (HELO peggleto-mobl5.ger.corp.intel.com)
	([10.252.17.39])
	by FMSMGA003.fm.intel.com with ESMTP; 03 Feb 2015 07:15:00 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  3 Feb 2015 15:28:52 +0000
Message-Id: <980b9bf346b983139bde5cee265c5f4f07267264.1422977092.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <cover.1422977092.git.paul.eggleton@linux.intel.com>
References: <cover.1422977092.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1422977092.git.paul.eggleton@linux.intel.com>
References: <cover.1422977092.git.paul.eggleton@linux.intel.com>
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [PATCH 1/1] classes/license: tweak license format messages
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
X-List-Received-Date: Tue, 03 Feb 2015 15:29:17 -0000

Strictly speaking not all of these characters are operators, so reword
the message to describe them as separators. Also use the standard
"recipename: message" format.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/classes/license.bbclass | 15 ++++++++-------
 meta/lib/oe/license.py       |  3 ++-
 2 files changed, 10 insertions(+), 8 deletions(-)

diff --git a/meta/classes/license.bbclass b/meta/classes/license.bbclass
index d659b76..21465d8 100644
--- a/meta/classes/license.bbclass
+++ b/meta/classes/license.bbclass
@@ -417,19 +417,20 @@ def check_license_format(d):
     """
     pn = d.getVar('PN', True)
     licenses = d.getVar('LICENSE', True)
-    from oe.license import license_operator
-    from oe.license import license_pattern
+    from oe.license import license_operator, license_operator_chars, license_pattern
 
     elements = filter(lambda x: x.strip(), license_operator.split(licenses))
     for pos, element in enumerate(elements):
         if license_pattern.match(element):
             if pos > 0 and license_pattern.match(elements[pos - 1]):
-                bb.warn("Recipe %s, LICENSE (%s) has invalid format, " \
-                        "LICENSES must have operator \"%s\" between them." %
-                        (pn, licenses, license_operator.pattern))
+                bb.warn('%s: LICENSE value "%s" has an invalid format - license names ' \
+                        'must be separated by the following characters to indicate ' \
+                        'the license selection: %s' %
+                        (pn, licenses, license_operator_chars))
         elif not license_operator.match(element):
-            bb.warn("Recipe %s, LICENSE (%s) has invalid operator (%s) not in" \
-                  " \"%s\"." % (pn, licenses, element, license_operator.pattern))
+            bb.warn('%s: LICENSE value "%s" has an invalid separator "%s" that is not ' \
+                    'in the valid list of separators (%s)' %
+                    (pn, licenses, element, license_operator_chars))
 
 SSTATETASKS += "do_populate_lic"
 do_populate_lic[sstate-inputdirs] = "${LICSSTATEDIR}"
diff --git a/meta/lib/oe/license.py b/meta/lib/oe/license.py
index 340da61..31ca15b 100644
--- a/meta/lib/oe/license.py
+++ b/meta/lib/oe/license.py
@@ -25,7 +25,8 @@ class InvalidLicense(LicenseError):
     def __str__(self):
         return "invalid characters in license '%s'" % self.license
 
-license_operator = re.compile('([&|() ])')
+license_operator_chars = '&|() '
+license_operator = re.compile('([' + license_operator_chars + '])')
 license_pattern = re.compile('[a-zA-Z0-9.+_\-]+$')
 
 class LicenseVisitor(ast.NodeVisitor):
-- 
1.9.3


