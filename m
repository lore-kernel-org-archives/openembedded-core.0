Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1RkejB-0007FC-Tk
	for openembedded-core@lists.openembedded.org;
	Tue, 10 Jan 2012 17:39:14 +0100
Received: by yhjj51 with SMTP id j51so847259yhj.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Jan 2012 08:31:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=raOqUX25iaVeyQgNyDDPeWrb0WxgOtnc9PpVxlS3T0w=;
	b=JHeOvqpLyPB759kLAN3XNDvSpCDJ5Hl6pn5+x/EG+cYDVyY6Wn/ia8515UQ+I+FEWF
	KMpn0J0WsenJNXAXwRMUELvKZFVdRVs5NnWQupW9yOuZLPWQQSkD4hvdgUGF5adduM8f
	l9wuk9+ztTo4AAQ/f22q2sFdVMtwgQl1eULfc=
Received: by 10.236.181.198 with SMTP id l46mr1269103yhm.40.1326213104657;
	Tue, 10 Jan 2012 08:31:44 -0800 (PST)
Received: from sb-u1004lts-64bit.alm.mentorg.com (hsvwanfw1-nat.mentorg.com.
	[139.181.24.34])
	by mx.google.com with ESMTPS id j11sm133124022anl.8.2012.01.10.08.31.43
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 10 Jan 2012 08:31:44 -0800 (PST)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 10 Jan 2012 10:31:45 -0600
Message-Id: <96d36e3110e0a13688b2bd6c90bcef1ff70d756e.1326213043.git.chris_larson@mentor.com>
X-Mailer: git-send-email 1.7.8.rc4
In-Reply-To: <cover.1326213043.git.chris_larson@mentor.com>
References: <cover.1326213043.git.chris_larson@mentor.com>
In-Reply-To: <cover.1326213043.git.chris_larson@mentor.com>
References: <cover.1326213043.git.chris_larson@mentor.com>
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [PATCH 2/4] copyleft_compliance: add debug message with the reason for exclusion
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
X-List-Received-Date: Tue, 10 Jan 2012 16:39:14 -0000

From: Christopher Larson <chris_larson@mentor.com>

Signed-off-by: Christopher Larson <chris_larson@mentor.com>
---
 meta/classes/copyleft_compliance.bbclass |   24 +++++++++++++++++-------
 1 files changed, 17 insertions(+), 7 deletions(-)

diff --git a/meta/classes/copyleft_compliance.bbclass b/meta/classes/copyleft_compliance.bbclass
index 37ed09e..fd04638 100644
--- a/meta/classes/copyleft_compliance.bbclass
+++ b/meta/classes/copyleft_compliance.bbclass
@@ -39,8 +39,9 @@ def copyleft_should_include(d):
     import oe.license
     from fnmatch import fnmatchcase as fnmatch
 
-    if d.getVar('COPYLEFT_RECIPE_TYPE', True) not in oe.data.typed_value('COPYLEFT_RECIPE_TYPES', d):
-        return False
+    recipe_type = d.getVar('COPYLEFT_RECIPE_TYPE', True)
+    if recipe_type not in oe.data.typed_value('COPYLEFT_RECIPE_TYPES', d):
+        return False, 'recipe type "%s" is excluded' % recipe_type
 
     include = oe.data.typed_value('COPYLEFT_LICENSE_INCLUDE', d)
     exclude = oe.data.typed_value('COPYLEFT_LICENSE_EXCLUDE', d)
@@ -63,18 +64,27 @@ def copyleft_should_include(d):
         licenses = oe.license.flattened_licenses(d.getVar('LICENSE', True), choose_licenses)
     except oe.license.InvalidLicense as exc:
         bb.fatal('%s: %s' % (d.getVar('PF', True), exc))
-    except SyntaxError:
-        bb.warn("%s: Failed to parse it's LICENSE field." % (d.getVar('PF', True)))
-
-    return all(include_license(lic) for lic in licenses)
+    except SyntaxError as exc:
+        bb.warn('%s: error when parsing the LICENSE variable: %s' % (d.getVar('P', True), exc))
+    else:
+        excluded = filter(lambda lic: not include_license(lic), licenses)
+        if excluded:
+            return False, 'recipe has excluded licenses: %s' % ', '.join(excluded)
+        else:
+            return True, None
 
 python do_prepare_copyleft_sources () {
     """Populate a tree of the recipe sources and emit patch series files"""
     import os.path
     import shutil
 
-    if not copyleft_should_include(d):
+    p = d.getVar('P', True)
+    included, reason = copyleft_should_include(d)
+    if not included:
+        bb.debug(1, 'copyleft: %s is excluded: %s' % (p, reason))
         return
+    else:
+        bb.debug(1, 'copyleft: %s is included' % p)
 
     sources_dir = d.getVar('COPYLEFT_SOURCES_DIR', 1)
     src_uri = d.getVar('SRC_URI', 1).split()
-- 
1.7.8.rc4



