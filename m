Return-Path: <reinette.chatre@intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 4AE2177261
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 Sep 2016 05:48:40 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga104.fm.intel.com with ESMTP; 04 Sep 2016 22:48:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.30,285,1470726000"; d="scan'208";a="757204260"
Received: from rchatre-builder.jf.intel.com ([10.54.39.160])
	by FMSMGA003.fm.intel.com with ESMTP; 04 Sep 2016 22:48:41 -0700
From: Reinette Chatre <reinette.chatre@intel.com>
To: akuster808@gmail.com
Date: Sun,  4 Sep 2016 22:39:35 -0700
Message-Id: <dab710df735a64356168e89f751ea1104031936c.1473053756.git.reinette.chatre@intel.com>
X-Mailer: git-send-email 2.7.4
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH][krogoth] binutils: advance SRCREV to obtain versioned symbols
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
X-List-Received-Date: Mon, 05 Sep 2016 05:48:42 -0000

Libraries needing versioned symbols, for example mysql, are not
supported by current version of binutils in krogoth.

When mysql library from MariaDB is compiled with the current
version of binutils we encounter errors at runtime as seen
below where php linked to mysql tries to run:

php: relocation error: php: symbol mysql_server_init, version
 libmysqlclient_16 not defined in file libmysqlclient.so.18
 with link time reference

Above error appears even though symbols exist in library:

   245: 000000000001ecc0     0 FUNC    GLOBAL DEFAULT   13 mysql_server_init@@libmysqlclient_16
   279: 000000000001ecc0   297 FUNC    GLOBAL DEFAULT   13 mysql_server_init@@libmysqlclient_18

The problem results from a bug in binutils that has already been
fixed upstream as well as on the 2.26 and 2.27 branches. We advance
the SRCREV on the 2.26 branch used in krogoth release to pick up the fix.

Details about bug: https://sourceware.org/bugzilla/show_bug.cgi?id=19698

Signed-off-by: Reinette Chatre <reinette.chatre@intel.com>
---
Hi Armin,

This is not a backport of a fix on master since binutils recipe in master
builds from binutils v2.27 branch that already contains this fix.

Please do consider it for the krogoth stable branch.

Thank you

Reinette

 meta/recipes-devtools/binutils/binutils-2.26.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/binutils/binutils-2.26.inc b/meta/recipes-devtools/binutils/binutils-2.26.inc
index 703eac2..06ce245 100644
--- a/meta/recipes-devtools/binutils/binutils-2.26.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.26.inc
@@ -18,7 +18,7 @@ BINUPV = "${@binutils_branch_version(d)}"
 
 UPSTREAM_CHECK_GITTAGREGEX = "binutils-(?P<pver>\d+_(\d_?)*)"
 
-SRCREV = "71fa566a9cf2597b60a58c1d7c148bab637454a6"
+SRCREV = "544ddf9322b1b83982e5cb84a54d084ee7e718ea"
 SRC_URI = "\
      git://sourceware.org/git/binutils-gdb.git;branch=binutils-${BINUPV}-branch;protocol=git \
      file://0002-configure-widen-the-regexp-for-SH-architectures.patch \
-- 
2.7.4


