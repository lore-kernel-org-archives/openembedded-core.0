Return-Path: <mikko.ylinen@linux.intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id A5CF177A8A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Apr 2017 10:09:03 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga105.fm.intel.com with ESMTP; 13 Apr 2017 03:09:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.37,194,1488873600"; d="scan'208";a="1155306868"
Received: from summit.tm.intel.com ([10.237.55.181])
	by fmsmga002.fm.intel.com with ESMTP; 13 Apr 2017 03:09:03 -0700
From: Mikko Ylinen <mikko.ylinen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 13 Apr 2017 13:09:07 +0300
Message-Id: <20170413100907.11140-1-mikko.ylinen@linux.intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] classes/populate_sdk_ext: reset TCLIBCAPPEND to get consistent TMPDIR
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
X-List-Received-Date: Thu, 13 Apr 2017 10:09:03 -0000

populate_sdk_ext sets TMPDIR to a known static value with '/tmp' directory
name and that name is hard coded in a few places (e.g., in
meta-environment-extsdk.bb that writes the eSDK environment variables).

Distros that do not reset TCLIBCAPPEND (poky does) end up getting
TMPDIR = /tmp-${TCLIBCAPPEND} via defaultsetup.conf and that breaks
the functionality in eSDK that expects everything is in /tmp.

To get TMPDIR consistent, we also need to reset TCLIBCAPPEND in
populate_sdk_ext.bbclass.

Fixes: [YOCTO #11298]

Signed-off-by: Mikko Ylinen <mikko.ylinen@linux.intel.com>
---
 meta/classes/populate_sdk_ext.bbclass | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/classes/populate_sdk_ext.bbclass b/meta/classes/populate_sdk_ext.bbclass
index db822bf771..21fd122468 100644
--- a/meta/classes/populate_sdk_ext.bbclass
+++ b/meta/classes/populate_sdk_ext.bbclass
@@ -114,6 +114,7 @@ def create_filtered_tasklist(d, sdkbasepath, tasklistfile, conf_initpath):
             f.write('SSTATE_MIRRORS_forcevariable = ""\n')
             # Ensure TMPDIR is the default so that clean_esdk_builddir() can delete it
             f.write('TMPDIR_forcevariable = "${TOPDIR}/tmp"\n')
+            f.write('TCLIBCAPPEND_forcevariable = ""\n')
             # Drop uninative if the build isn't using it (or else NATIVELSBSTRING will
             # be different and we won't be able to find our native sstate)
             if not bb.data.inherits_class('uninative', d):
@@ -289,6 +290,7 @@ python copy_buildsystem () {
             f.write('\n')
 
             f.write('TMPDIR = "${TOPDIR}/tmp"\n')
+            f.write('TCLIBCAPPEND = ""\n')
             f.write('DL_DIR = "${TOPDIR}/downloads"\n')
 
             f.write('INHERIT += "%s"\n' % 'uninative')
-- 
2.11.0


