Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 293EF75CF1
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 May 2016 17:19:19 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga104.fm.intel.com with ESMTP; 06 May 2016 10:19:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,587,1455004800"; d="scan'208";a="960405566"
Received: from linux.intel.com ([10.23.219.25])
	by fmsmga001.fm.intel.com with ESMTP; 06 May 2016 10:19:20 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.51])
	by linux.intel.com (Postfix) with ESMTP id C69E46A4007
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 May 2016 11:06:53 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  6 May 2016 17:58:47 +0300
Message-Id: <6a96d06c39fc500342b7ffdf9d7c06f43df21581.1462545440.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1462545440.git.ed.bartosh@linux.intel.com>
References: <cover.1462545440.git.ed.bartosh@linux.intel.com>
In-Reply-To: <cover.1462545440.git.ed.bartosh@linux.intel.com>
References: <cover.1462545440.git.ed.bartosh@linux.intel.com>
Subject: [RFC][PATCH 4/7] image.bbclass: additional output in create_symlinks
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
X-List-Received-Date: Fri, 06 May 2016 17:19:19 -0000

From: Patrick Ohly <patrick.ohly@intel.com>

When a symlink does not get created, it is useful for debugging to log
what would have been created and why it was skipped.

Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 meta/classes/image.bbclass | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index 7b79e3a..37fb33c 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -552,9 +552,9 @@ python create_symlinks() {
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
@@ -562,6 +562,8 @@ python create_symlinks() {
                     os.remove(os.path.realpath(dst))
                 os.remove(dst)
             os.symlink(src, dst)
+        else:
+            bb.note("Skipping symlink, source does not exist: %s -> %s" % (dst, src))
 }
 
 MULTILIBRE_ALLOW_REP =. "${base_bindir}|${base_sbindir}|${bindir}|${sbindir}|${libexecdir}|${sysconfdir}|${nonarch_base_libdir}/udev|/lib/modules/[^/]*/modules.*|"
-- 
2.1.4


