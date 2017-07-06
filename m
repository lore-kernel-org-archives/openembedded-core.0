Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id 64E467780E
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Jul 2017 08:09:32 +0000 (UTC)
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by orsmga105.jf.intel.com with ESMTP; 06 Jul 2017 01:09:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.40,316,1496127600"; d="scan'208";a="123460455"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga006.fm.intel.com with ESMTP; 06 Jul 2017 01:09:34 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.38])
	by linux.intel.com (Postfix) with ESMTP id 520E5580571
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Jul 2017 01:09:33 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  6 Jul 2017 10:56:46 +0300
Message-Id: <127a3f2f2aa014f0812693f2a323113837a3e345.1499326977.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1499326977.git.ed.bartosh@linux.intel.com>
References: <cover.1499326977.git.ed.bartosh@linux.intel.com>
Subject: [PATCH 5/8] wic-tools: don't create wic-tools.env
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
X-List-Received-Date: Thu, 06 Jul 2017 08:09:32 -0000

wic-tools.env was uses only when wic is run from bitbake.
As wic doesn't use wic-tools anymore in this mode there is
no need for this file.

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 meta/recipes-core/meta/wic-tools.bb | 10 +---------
 1 file changed, 1 insertion(+), 9 deletions(-)

diff --git a/meta/recipes-core/meta/wic-tools.bb b/meta/recipes-core/meta/wic-tools.bb
index cd494ec..c416a2e 100644
--- a/meta/recipes-core/meta/wic-tools.bb
+++ b/meta/recipes-core/meta/wic-tools.bb
@@ -11,6 +11,7 @@ DEPENDS_append_x86 = " syslinux grub-efi systemd-boot"
 DEPENDS_append_x86-64 = " syslinux grub-efi systemd-boot"
 
 INHIBIT_DEFAULT_DEPS = "1"
+
 inherit nopackages
 
 # The sysroot of wic-tools is needed for wic, but if rm_work is enabled, it will
@@ -19,14 +20,5 @@ RM_WORK_EXCLUDE += "${PN}"
 
 python do_build_sysroot () {
     bb.build.exec_func("extend_recipe_sysroot", d)
-
-    # Write environment variables used by wic
-    # to tmp/sysroots/<machine>/imgdata/wictools.env
-    outdir = os.path.join(d.getVar('STAGING_DIR'), d.getVar('MACHINE'), 'imgdata')
-    bb.utils.mkdirhier(outdir)
-    with open(os.path.join(outdir, "wic-tools.env"), 'w') as envf:
-        for var in ('RECIPE_SYSROOT_NATIVE', 'STAGING_DATADIR', 'STAGING_LIBDIR'):
-            envf.write('%s="%s"\n' % (var, d.getVar(var).strip()))
-
 }
 addtask do_build_sysroot after do_prepare_recipe_sysroot before do_build
-- 
2.1.4


