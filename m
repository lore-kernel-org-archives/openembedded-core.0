Return-Path: <mikko.ylinen@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id D172C77EA6
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 Jun 2017 14:42:36 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	05 Jun 2017 07:42:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.39,300,1493708400"; d="scan'208";a="270372926"
Received: from summit.tm.intel.com ([10.237.55.31])
	by fmsmga004.fm.intel.com with ESMTP; 05 Jun 2017 07:42:37 -0700
From: Mikko Ylinen <mikko.ylinen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  5 Jun 2017 17:42:51 +0300
Message-Id: <20170605144251.15173-1-mikko.ylinen@linux.intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] archiver.bbclass: adapt do_unpack_and_patch to RSS
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
X-List-Received-Date: Mon, 05 Jun 2017 14:42:38 -0000

do_unpack_and_patch was not correctly run until recently
("archiver.bbclass: various fixes for original+diff mode") but
with the fix applied, the errors we get indicate the function
is not adapted to work with recipe specific sysroots.

do_unpack_and_patch sets WORKDIR to ARCHIVER_WORKDIR which
affects all path settings relative to WORKDIR, inluding the paths
to recipes' sysroots. IOW, when do_unpack and do_patch are run, they
cannot find the necessary native tools and files located in the
sysroot (e.g., quiltrc) because the paths point to ARCHIVER_WORKDIR.

Adapt do_unpack_and_patch to RSS by restoring the original
STAGING_DIR_NATIVE after WORKDIR is changed to ARCHIVER_WORKDIR.

Signed-off-by: Mikko Ylinen <mikko.ylinen@linux.intel.com>
---
 meta/classes/archiver.bbclass | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/classes/archiver.bbclass b/meta/classes/archiver.bbclass
index 37a21fe61b..1319f4df08 100644
--- a/meta/classes/archiver.bbclass
+++ b/meta/classes/archiver.bbclass
@@ -315,12 +315,15 @@ python do_unpack_and_patch() {
         return
     ar_outdir = d.getVar('ARCHIVER_OUTDIR')
     ar_workdir = d.getVar('ARCHIVER_WORKDIR')
+    ar_sysroot_native = d.getVar('STAGING_DIR_NATIVE')
     pn = d.getVar('PN')
 
     # The kernel class functions require it to be on work-shared, so we dont change WORKDIR
     if not (bb.data.inherits_class('kernel-yocto', d) or pn.startswith('gcc-source')):
         # Change the WORKDIR to make do_unpack do_patch run in another dir.
         d.setVar('WORKDIR', ar_workdir)
+        # Restore the original path to recipe's native sysroot (it's relative to WORKDIR).
+        d.setVar('STAGING_DIR_NATIVE', ar_sysroot_native)
 
         # The changed 'WORKDIR' also caused 'B' changed, create dir 'B' for the
         # possibly requiring of the following tasks (such as some recipes's
-- 
2.11.0


