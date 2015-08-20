Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id A4E0876A6A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Aug 2015 11:56:44 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 20 Aug 2015 04:56:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,714,1432623600"; d="scan'208";a="772375894"
Received: from linux.intel.com ([10.23.219.25])
	by fmsmga001.fm.intel.com with ESMTP; 20 Aug 2015 04:56:44 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.65])
	by linux.intel.com (Postfix) with ESMTP id AC7996A4005
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Aug 2015 04:55:55 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 20 Aug 2015 14:56:14 +0300
Message-Id: <db48ab408d16d06aa46cbae805d88217f24f64c2.1440071413.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1440071413.git.ed.bartosh@linux.intel.com>
References: <cover.1440071413.git.ed.bartosh@linux.intel.com>
In-Reply-To: <cover.1440071413.git.ed.bartosh@linux.intel.com>
References: <cover.1440071413.git.ed.bartosh@linux.intel.com>
Subject: [PATCH 01/17] image.py: write bitbake variables to .env file
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
X-List-Received-Date: Thu, 20 Aug 2015 11:56:45 -0000

Write set of bitbake variables associated with the image into
build/tmp/sysroots/<machine>/imagedata/<image>.env

This is needed for wic to be able to get bitbake variables without
running 'bitbake -e'.

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 meta/lib/oe/image.py | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/meta/lib/oe/image.py b/meta/lib/oe/image.py
index 699c30f..a7fdefa 100644
--- a/meta/lib/oe/image.py
+++ b/meta/lib/oe/image.py
@@ -321,6 +321,27 @@ class Image(ImageDepGraph):
 
         return image_cmd_groups
 
+    def _write_env(self):
+        """
+        Write environment variables
+        to tmp/sysroots/<machine>/imgdata/<image>.env
+        """
+        stdir = self.d.getVar('STAGING_DIR_TARGET', True)
+        outdir = os.path.join(stdir, 'imgdata')
+        if not os.path.exists(outdir):
+            os.makedirs(outdir)
+        basename = self.d.getVar('IMAGE_BASENAME', True)
+        with open(os.path.join(outdir, basename) + '.env', 'w') as envf:
+            for var in sorted(self.d.keys()):
+                # filter out as much as we can to reduce file size
+                if var.startswith('_') or var.startswith('BB_') \
+                   or not var.isupper() or self.d.getVarFlag(var, "func") \
+                   or var in ('BBINCLUDED', 'SRCPV', 'MIRRORS'):
+                    continue
+                value = self.d.getVar(var, True)
+                if value:
+                    envf.write('%s="%s"\n' % (var, value.strip()))
+
     def create(self):
         bb.note("###### Generate images #######")
         pre_process_cmds = self.d.getVar("IMAGE_PREPROCESS_COMMAND", True)
@@ -332,6 +353,8 @@ class Image(ImageDepGraph):
 
         image_cmd_groups = self._get_imagecmds()
 
+        self._write_env()
+
         for image_cmds in image_cmd_groups:
             # create the images in parallel
             nproc = multiprocessing.cpu_count()
-- 
2.1.4


