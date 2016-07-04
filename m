Return-Path: <sergeimir@emcraft.com>
Received: from ocean.emcraft.com (ocean.emcraft.com [185.75.190.205])
	by mail.openembedded.org (Postfix) with ESMTP id B59E860119
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Jul 2016 09:18:59 +0000 (UTC)
Received: from sergmir.emcraft.com ([172.17.0.19] helo=sergmir.localdomain)
	by ocean.emcraft.com with esmtps (TLSv1:AES256-SHA:256) (Exim 4.76)
	(envelope-from <sergeimir@emcraft.com>)
	id 1bJzDC-00033l-HY; Mon, 04 Jul 2016 11:26:38 +0300
From: Sergei Miroshnichenko <sergeimir@emcraft.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  4 Jul 2016 11:25:48 +0300
Message-Id: <1467620748-20129-2-git-send-email-sergeimir@emcraft.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1467620748-20129-1-git-send-email-sergeimir@emcraft.com>
References: <1467620748-20129-1-git-send-email-sergeimir@emcraft.com>
Cc: WolfgangDenkwd@denx.de, Alexander Dyachenko <sasha_d@emcraft.com>,
	Roger Meier <r.meier@siemens.com>,
	Sergei Miroshnichenko <sergeimir@emcraft.com>
Subject: [PATCH v2 1/1] license: Add support for SPDX 2.0 operators
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
X-List-Received-Date: Mon, 04 Jul 2016 09:19:00 -0000

LICENSE can contain "OR", "AND" and "WITH" operators of SPDX: map
them to "|" and "&" accordingly.

Signed-off-by: Sergei Miroshnichenko <sergeimir@emcraft.com>
---
 meta/classes/license.bbclass | 17 ++++++++++-------
 meta/lib/oe/license.py       | 21 ++++++++++++++++-----
 2 files changed, 26 insertions(+), 12 deletions(-)

diff --git a/meta/classes/license.bbclass b/meta/classes/license.bbclass
index c543637..8efb545 100644
--- a/meta/classes/license.bbclass
+++ b/meta/classes/license.bbclass
@@ -643,20 +643,23 @@ def check_license_format(d):
     """
     pn = d.getVar('PN', True)
     licenses = d.getVar('LICENSE', True)
-    from oe.license import license_operator, license_operator_chars, license_pattern
+    from oe.license import license_operator, license_pattern
 
     elements = list(filter(lambda x: x.strip(), license_operator.split(licenses)))
     for pos, element in enumerate(elements):
-        if license_pattern.match(element):
-            if pos > 0 and license_pattern.match(elements[pos - 1]):
+        operator_match = license_operator.match(element)
+        license_match = license_pattern.match(element)
+
+        if license_match and not operator_match:
+            if pos > 0 and license_pattern.match(elements[pos - 1]) and not license_operator.match(elements[pos - 1]):
                 bb.warn('%s: LICENSE value "%s" has an invalid format - license names ' \
-                        'must be separated by the following characters to indicate ' \
+                        'must be separated by the following operators to indicate ' \
                         'the license selection: %s' %
-                        (pn, licenses, license_operator_chars))
-        elif not license_operator.match(element):
+                        (pn, licenses, license_operator.pattern))
+        elif not operator_match:
             bb.warn('%s: LICENSE value "%s" has an invalid separator "%s" that is not ' \
                     'in the valid list of separators (%s)' %
-                    (pn, licenses, element, license_operator_chars))
+                    (pn, licenses, element, license_operator.pattern))
 
 SSTATETASKS += "do_populate_lic"
 do_populate_lic[sstate-inputdirs] = "${LICSSTATEDIR}"
diff --git a/meta/lib/oe/license.py b/meta/lib/oe/license.py
index 39ef965..6769c55 100644
--- a/meta/lib/oe/license.py
+++ b/meta/lib/oe/license.py
@@ -40,8 +40,13 @@ class InvalidLicense(LicenseError):
         return "invalid characters in license '%s'" % self.license
 
 license_operator_chars = '&|() '
-license_operator = re.compile('([' + license_operator_chars + '])')
-license_pattern = re.compile('[a-zA-Z0-9.+_\-]+$')
+license_operator = re.compile('([' + license_operator_chars + ']|AND|OR|WITH)')
+license_pattern = re.compile('^(?:DocumentRef-[a-zA-Z0-9.\-]+:)?(?:LicenseRef-)?([a-zA-Z0-9_.+\-]+)$')
+
+license_operator_map = {}
+license_operator_map["OR"] = '|'
+license_operator_map["AND"] = '&'
+license_operator_map["WITH"] = '&'
 
 class LicenseVisitor(ast.NodeVisitor):
     """Get elements based on OpenEmbedded license strings"""
@@ -49,11 +54,17 @@ class LicenseVisitor(ast.NodeVisitor):
         new_elements = []
         elements = list([x for x in license_operator.split(licensestr) if x.strip()])
         for pos, element in enumerate(elements):
-            if license_pattern.match(element):
-                if pos > 0 and license_pattern.match(elements[pos-1]):
+            operator_match = license_operator.match(element)
+            license_match = license_pattern.match(element)
+            if operator_match:
+                if license_operator_map.get(element, None) != None:
+                    element = license_operator_map.get(element)
+            elif license_match:
+                if pos > 0 and license_pattern.match(elements[pos-1]) and not license_operator.match(elements[pos-1]):
                     new_elements.append('&')
+                element = license_match.group(1)
                 element = '"' + element + '"'
-            elif not license_operator.match(element):
+            else:
                 raise InvalidLicense(element)
             new_elements.append(element)
 
-- 
2.1.0


