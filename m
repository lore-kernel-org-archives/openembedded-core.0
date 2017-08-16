Return-Path: <cinly.ooi@intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id B66AC784BC
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Aug 2017 01:17:50 +0000 (UTC)
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by orsmga104.jf.intel.com with ESMTP; 15 Aug 2017 18:17:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.41,380,1498546800"; d="scan'208";a="119429257"
Received: from cinlyooi-mac03.png.intel.com (HELO ubuntu.png.intel.com)
	([10.221.16.21])
	by orsmga004.jf.intel.com with ESMTP; 15 Aug 2017 18:17:51 -0700
From: cinly.ooi@intel.com
To: openembedded-core@lists.openembedded.org
Date: Wed, 16 Aug 2017 09:17:50 +0800
Message-Id: <1502846270-32249-1-git-send-email-cinly.ooi@intel.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] libtool: remove /absolute/path/to/host references
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
X-List-Received-Date: Wed, 16 Aug 2017 01:17:50 -0000

From: Ooi Cinly <cinly.ooi@intel.com>

Removed all instances of -fdebug-prefix-map in LTCFLAGS
declaration because they contain references to host system
and are not needed.

/absolute/path/to/host/dd was replaced with 'dd' in
lt_truncate_bin declaration.

Please take note that the location of regex is important
for DEBUG_PREFIX_MAP. Removal of DEBUG_PREFIX_MAP has to be
done before other regex command modify its option value.

Both are modified because they affect binary reproducibility.

[YOCTO #11656]

Signed-off-by: Ooi Cinly <cinly.ooi@intel.com>
---
 meta/recipes-devtools/libtool/libtool_2.4.6.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/libtool/libtool_2.4.6.bb b/meta/recipes-devtools/libtool/libtool_2.4.6.bb
index 06abb05..b02620b 100644
--- a/meta/recipes-devtools/libtool/libtool_2.4.6.bb
+++ b/meta/recipes-devtools/libtool/libtool_2.4.6.bb
@@ -15,6 +15,7 @@ ACLOCALEXTRAPATH_class-target = ""
 
 do_install_append () {
         sed -e 's@--sysroot=${STAGING_DIR_HOST}@@g' \
+            -e "s@${DEBUG_PREFIX_MAP}@@g" \
             -e 's@${STAGING_DIR_HOST}@@g' \
             -e 's@${STAGING_DIR_NATIVE}@@g' \
             -e 's@^\(sys_lib_search_path_spec="\).*@\1${libdir} ${base_libdir}"@' \
@@ -22,5 +23,6 @@ do_install_append () {
             -e 's@^\(compiler_lib_search_path="\).*@\1${libdir} ${base_libdir}"@' \
             -e 's@^\(predep_objects="\).*@\1"@' \
             -e 's@^\(postdep_objects="\).*@\1"@' \
+            -e "s@${HOSTTOOLS_DIR}/@@g" \
             -i ${D}${bindir}/libtool
 }
-- 
2.7.4


