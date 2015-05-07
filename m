Return-Path: <anibal.limon@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id BC61173F6F
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 May 2015 21:38:53 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga101.fm.intel.com with ESMTP; 07 May 2015 14:38:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,386,1427785200"; d="scan'208";a="568026462"
Received: from yctb03.ostc.intel.com (HELO yctb03.otcr.jf.intel.com)
	([10.23.219.52])
	by orsmga003.jf.intel.com with ESMTP; 07 May 2015 14:38:53 -0700
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  7 May 2015 21:38:54 +0000
Message-Id: <ee0edd3ff715775da7d7d265d0c56ea7e70ea6b6.1431034430.git.anibal.limon@linux.intel.com>
X-Mailer: git-send-email 1.8.4.5
In-Reply-To: <cover.1431034430.git.anibal.limon@linux.intel.com>
References: <cover.1431034430.git.anibal.limon@linux.intel.com>
In-Reply-To: <cover.1431034430.git.anibal.limon@linux.intel.com>
References: <cover.1431034430.git.anibal.limon@linux.intel.com>
MIME-Version: 1.0
Cc: richard.purdie@liuxfoundation.org
Subject: [PATCHv2 3/4] license: Split visit_string in LicenseVisitor
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
X-List-Received-Date: Thu, 07 May 2015 21:38:55 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Create get_elements and visit_elements in LicenseVisitor based
on visit_string this allow to do modifications on elements before
parsing with AST.

Signed-off-by: Aníbal Limón <anibal.limon@linux.intel.com>
---
 meta/lib/oe/license.py | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/meta/lib/oe/license.py b/meta/lib/oe/license.py
index bc146a28..254279d 100644
--- a/meta/lib/oe/license.py
+++ b/meta/lib/oe/license.py
@@ -44,8 +44,8 @@ license_operator = re.compile('([' + license_operator_chars + '])')
 license_pattern = re.compile('[a-zA-Z0-9.+_\-]+$')
 
 class LicenseVisitor(ast.NodeVisitor):
-    """Syntax tree visitor which can accept OpenEmbedded license strings"""
-    def visit_string(self, licensestr):
+    """Get elements based on OpenEmbedded license strings"""
+    def get_elements(self, licensestr):
         new_elements = []
         elements = filter(lambda x: x.strip(), license_operator.split(licensestr))
         for pos, element in enumerate(elements):
@@ -57,7 +57,16 @@ class LicenseVisitor(ast.NodeVisitor):
                 raise InvalidLicense(element)
             new_elements.append(element)
 
-        self.visit(ast.parse(' '.join(new_elements)))
+        return new_elements
+
+    """Syntax tree visitor which can accept elements previously generated with
+    OpenEmbedded license string"""
+    def visit_elements(self, elements):
+        self.visit(ast.parse(' '.join(elements)))
+
+    """Syntax tree visitor which can accept OpenEmbedded license strings"""
+    def visit_string(self, licensestr):
+        self.visit_elements(self.get_elements(licensestr))
 
 class FlattenVisitor(LicenseVisitor):
     """Flatten a license tree (parsed from a string) by selecting one of each
-- 
1.8.4.5


