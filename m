Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Liezhi.Yang@windriver.com>) id 1T5Wo7-0007Li-5Y
	for openembedded-core@lists.openembedded.org;
	Sun, 26 Aug 2012 08:58:51 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id q7Q6keXk025985
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sat, 25 Aug 2012 23:46:40 -0700 (PDT)
Received: from localhost.localdomain (128.224.163.124) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.309.2; Sat, 25 Aug 2012 23:46:40 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sun, 26 Aug 2012 14:52:00 +0800
Message-ID: <dde22f4853c452d4624a5b4e09067fe23d58d4df.1345963712.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.11.2
In-Reply-To: <cover.1345963712.git.liezhi.yang@windriver.com>
References: <cover.1345963712.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Cc: Zhenfeng.Zhao@windriver.com
Subject: [PATCH 5/6] copyleft_compliance.bbclass: remove the duplicated code
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 26 Aug 2012 06:58:51 -0000
Content-Type: text/plain

A part of the code in copyleft_compliance.bbclass is duplicated to
archiver.bbclass, remove the duplicated lines.

[YOCTO #2619]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/classes/copyleft_compliance.bbclass | 51 ++------------------------------
 1 file changed, 3 insertions(+), 48 deletions(-)

diff --git a/meta/classes/copyleft_compliance.bbclass b/meta/classes/copyleft_compliance.bbclass
index c59cb7a..e68942d 100644
--- a/meta/classes/copyleft_compliance.bbclass
+++ b/meta/classes/copyleft_compliance.bbclass
@@ -6,55 +6,10 @@
 #
 # vi:sts=4:sw=4:et
 
-COPYLEFT_SOURCES_DIR ?= '${DEPLOY_DIR}/copyleft_sources'
-
-COPYLEFT_LICENSE_INCLUDE ?= 'GPL* LGPL*'
-COPYLEFT_LICENSE_INCLUDE[type] = 'list'
-COPYLEFT_LICENSE_INCLUDE[doc] = 'Space separated list of globs which include licenses'
-
-COPYLEFT_LICENSE_EXCLUDE ?= 'CLOSED Proprietary'
-COPYLEFT_LICENSE_EXCLUDE[type] = 'list'
-COPYLEFT_LICENSE_INCLUDE[doc] = 'Space separated list of globs which exclude licenses'
-
-COPYLEFT_RECIPE_TYPE ?= '${@copyleft_recipe_type(d)}'
-COPYLEFT_RECIPE_TYPE[doc] = 'The "type" of the current recipe (e.g. target, native, cross)'
-
-COPYLEFT_RECIPE_TYPES ?= 'target'
-COPYLEFT_RECIPE_TYPES[type] = 'list'
-COPYLEFT_RECIPE_TYPES[doc] = 'Space separated list of recipe types to include'
-
-COPYLEFT_AVAILABLE_RECIPE_TYPES = 'target native nativesdk cross crosssdk cross-canadian'
-COPYLEFT_AVAILABLE_RECIPE_TYPES[type] = 'list'
-COPYLEFT_AVAILABLE_RECIPE_TYPES[doc] = 'Space separated list of available recipe types'
-
-def copyleft_recipe_type(d):
-    for recipe_type in oe.data.typed_value('COPYLEFT_AVAILABLE_RECIPE_TYPES', d):
-        if oe.utils.inherits(d, recipe_type):
-            return recipe_type
-    return 'target'
+# Need the copyleft_should_include
+inherit archiver
 
-def copyleft_should_include(d):
-    """Determine if this recipe's sources should be deployed for compliance"""
-    import ast
-    import oe.license
-    from fnmatch import fnmatchcase as fnmatch
-
-    recipe_type = d.getVar('COPYLEFT_RECIPE_TYPE', True)
-    if recipe_type not in oe.data.typed_value('COPYLEFT_RECIPE_TYPES', d):
-        return False, 'recipe type "%s" is excluded' % recipe_type
-
-    include = oe.data.typed_value('COPYLEFT_LICENSE_INCLUDE', d)
-    exclude = oe.data.typed_value('COPYLEFT_LICENSE_EXCLUDE', d)
-
-    try:
-        is_included, reason = oe.license.is_included(d.getVar('LICENSE', True), include, exclude)
-    except oe.license.LicenseError as exc:
-        bb.fatal('%s: %s' % (d.getVar('PF', True), exc))
-    else:
-        if is_included:
-            return True, 'recipe has included licenses: %s' % ', '.join(reason)
-        else:
-            return False, 'recipe has excluded licenses: %s' % ', '.join(reason)
+COPYLEFT_SOURCES_DIR ?= '${DEPLOY_DIR}/copyleft_sources'
 
 python do_prepare_copyleft_sources () {
     """Populate a tree of the recipe sources and emit patch series files"""
-- 
1.7.11.2



