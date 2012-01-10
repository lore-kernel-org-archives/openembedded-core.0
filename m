Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1RkejA-0007E1-Qc
	for openembedded-core@lists.openembedded.org;
	Tue, 10 Jan 2012 17:39:13 +0100
Received: by yhjj51 with SMTP id j51so847244yhj.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Jan 2012 08:31:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=sTjQlhtwj1qvQeNOJxQ4kJam0cej/jrp1manyMd9UQQ=;
	b=vymu70YKh8aJkiBvWjs51g4vtbDGt+IdsiIrmfpUbNUcxQ9yTotmydoCoGP4ZOdNww
	b+kzOaeb33aGZNzP58N57jXYcnbQvgZShf+EmpN7Kcn2dxqrE+DawNj8lw/3ugL7qZqz
	1oocwV0KIanVp9w/240k2q9TptRb/c390YXxU=
Received: by 10.236.186.9 with SMTP id v9mr28007170yhm.32.1326213103436;
	Tue, 10 Jan 2012 08:31:43 -0800 (PST)
Received: from sb-u1004lts-64bit.alm.mentorg.com (hsvwanfw1-nat.mentorg.com.
	[139.181.24.34])
	by mx.google.com with ESMTPS id j11sm133124022anl.8.2012.01.10.08.31.42
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 10 Jan 2012 08:31:42 -0800 (PST)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 10 Jan 2012 10:31:44 -0600
Message-Id: <4d98cd368431bc99b9947106b064629970d3ba2b.1326213043.git.chris_larson@mentor.com>
X-Mailer: git-send-email 1.7.8.rc4
In-Reply-To: <cover.1326213043.git.chris_larson@mentor.com>
References: <cover.1326213043.git.chris_larson@mentor.com>
In-Reply-To: <cover.1326213043.git.chris_larson@mentor.com>
References: <cover.1326213043.git.chris_larson@mentor.com>
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [PATCH 1/4] copyleft_compliance: add control of recipe types to include
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
X-List-Received-Date: Tue, 10 Jan 2012 16:39:13 -0000

From: Christopher Larson <chris_larson@mentor.com>

In this context, recipe "type" refers to whether it is 'target', 'native',
'cross', etc. COPYLEFT_RECIPE_TYPES is a space separated list of types to
include. It defaults to 'target'.

Signed-off-by: Christopher Larson <chris_larson@mentor.com>
---
 meta/classes/copyleft_compliance.bbclass |   21 ++++++++++++++++++---
 1 files changed, 18 insertions(+), 3 deletions(-)

diff --git a/meta/classes/copyleft_compliance.bbclass b/meta/classes/copyleft_compliance.bbclass
index 2fe524b..37ed09e 100644
--- a/meta/classes/copyleft_compliance.bbclass
+++ b/meta/classes/copyleft_compliance.bbclass
@@ -16,6 +16,22 @@ COPYLEFT_LICENSE_EXCLUDE ?= 'CLOSED Proprietary'
 COPYLEFT_LICENSE_EXCLUDE[type] = 'list'
 COPYLEFT_LICENSE_INCLUDE[doc] = 'Space separated list of globs which exclude licenses'
 
+COPYLEFT_RECIPE_TYPE ?= '${@copyleft_recipe_type(d)}'
+COPYLEFT_RECIPE_TYPE[doc] = 'The "type" of the current recipe (e.g. target, native, cross)'
+
+COPYLEFT_RECIPE_TYPES ?= 'target'
+COPYLEFT_RECIPE_TYPES[type] = 'list'
+COPYLEFT_RECIPE_TYPES[doc] = 'Space separated list of recipe types to include'
+
+COPYLEFT_AVAILABLE_RECIPE_TYPES = 'target native nativesdk cross crosssdk cross-canadian'
+COPYLEFT_AVAILABLE_RECIPE_TYPES[type] = 'list'
+COPYLEFT_AVAILABLE_RECIPE_TYPES[doc] = 'Space separated list of available recipe types'
+
+def copyleft_recipe_type(d):
+    for recipe_type in oe.data.typed_value('COPYLEFT_AVAILABLE_RECIPE_TYPES', d):
+        if oe.utils.inherits(d, recipe_type):
+            return recipe_type
+    return 'target'
 
 def copyleft_should_include(d):
     """Determine if this recipe's sources should be deployed for compliance"""
@@ -23,9 +39,8 @@ def copyleft_should_include(d):
     import oe.license
     from fnmatch import fnmatchcase as fnmatch
 
-    if oe.utils.inherits(d, 'native', 'nativesdk', 'cross', 'crossdk'):
-        # not a target recipe
-        return
+    if d.getVar('COPYLEFT_RECIPE_TYPE', True) not in oe.data.typed_value('COPYLEFT_RECIPE_TYPES', d):
+        return False
 
     include = oe.data.typed_value('COPYLEFT_LICENSE_INCLUDE', d)
     exclude = oe.data.typed_value('COPYLEFT_LICENSE_EXCLUDE', d)
-- 
1.7.8.rc4



