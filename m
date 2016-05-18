Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id E9A8C62136
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 May 2016 16:24:47 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga104.fm.intel.com with ESMTP; 18 May 2016 09:24:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,329,1459839600"; d="scan'208";a="969723036"
Received: from linux.intel.com ([10.23.219.25])
	by fmsmga001.fm.intel.com with ESMTP; 18 May 2016 09:24:48 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.51])
	by linux.intel.com (Postfix) with ESMTP id 81C616A4007
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 May 2016 10:12:19 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 18 May 2016 19:24:16 +0300
Message-Id: <9072365525948a5a61eb7c011a7fce0063319902.1463588057.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1463588057.git.ed.bartosh@linux.intel.com>
References: <cover.1463588057.git.ed.bartosh@linux.intel.com>
In-Reply-To: <cover.1463588057.git.ed.bartosh@linux.intel.com>
References: <cover.1463588057.git.ed.bartosh@linux.intel.com>
Subject: [PATCH v2 3/6] image.bbclass: additional output in create_symlinks
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
X-List-Received-Date: Wed, 18 May 2016 16:24:48 -0000

From: Patrick Ohly <patrick.ohly@intel.com>

When a symlink does not get created, it is useful for debugging to log
what would have been created and why it was skipped.

Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
Signed-off-by: Ed Bartosh <eduard.bartosh@intel.com>
Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 meta/classes/image.bbclass | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index 06f2211..46a4d03 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -512,9 +512,9 @@ python create_symlinks() {
     if not link_name:
         return
     for type in subimages:
-        if os.path.exists(img_name + imgsuffix + type):
-            dst = deploy_dir + "/" + link_name + "." + type
-            src = img_name + imgsuffix + type
+        dst = deploy_dir + "/" + link_name + "." + type
+        src = img_name + imgsuffix + type
+        if os.path.exists(src):
             bb.note("Creating symlink: %s -> %s" % (dst, src))
             if os.path.islink(dst):
                 if d.getVar('RM_OLD_IMAGE', True) == "1" and \
@@ -522,6 +522,8 @@ python create_symlinks() {
                     os.remove(os.path.realpath(dst))
                 os.remove(dst)
             os.symlink(src, dst)
+        else:
+            bb.note("Skipping symlink, source does not exist: %s -> %s" % (dst, src))
 }
 
 MULTILIBRE_ALLOW_REP =. "${base_bindir}|${base_sbindir}|${bindir}|${sbindir}|${libexecdir}|${sysconfdir}|${nonarch_base_libdir}/udev|/lib/modules/[^/]*/modules.*|"
-- 
2.1.4


