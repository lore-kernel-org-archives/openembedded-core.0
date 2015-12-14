Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 5E160700FD
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Dec 2015 15:08:10 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga101.jf.intel.com with ESMTP; 14 Dec 2015 07:08:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,427,1444719600"; d="scan'208";a="707064182"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by orsmga003.jf.intel.com with ESMTP; 14 Dec 2015 07:08:11 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 14 Dec 2015 17:05:21 +0200
Message-Id: <3c6aad0ceff281ee906af21540d632b9eb3ca811.1450104283.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.6.2
In-Reply-To: <cover.1450104283.git.alexander.kanavin@linux.intel.com>
References: <cover.1450104283.git.alexander.kanavin@linux.intel.com>
In-Reply-To: <cover.1450104283.git.alexander.kanavin@linux.intel.com>
References: <cover.1450104283.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 09/20] unfs3: update to r497
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
X-List-Received-Date: Mon, 14 Dec 2015 15:08:10 -0000

Drop fix_warnings.patch as it's been merged upstream.

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 .../unfs3/unfs3/fix_warnings.patch                 | 53 ----------------------
 .../{unfs3_0.9.22.r490.bb => unfs3_0.9.22.r497.bb} | 11 ++---
 2 files changed, 5 insertions(+), 59 deletions(-)
 delete mode 100644 meta/recipes-devtools/unfs3/unfs3/fix_warnings.patch
 rename meta/recipes-devtools/unfs3/{unfs3_0.9.22.r490.bb => unfs3_0.9.22.r497.bb} (88%)

diff --git a/meta/recipes-devtools/unfs3/unfs3/fix_warnings.patch b/meta/recipes-devtools/unfs3/unfs3/fix_warnings.patch
deleted file mode 100644
index cda8655..0000000
--- a/meta/recipes-devtools/unfs3/unfs3/fix_warnings.patch
+++ /dev/null
@@ -1,53 +0,0 @@
-exports.*: fix warnings.
-
-Fix these warnings:
-lex.yy.c:1207: warning: 'yyunput' defined but not used
-lex.yy.c:1248: warning: 'input' defined but not used
-exports.y: In function 'set_hostname':
-exports.y:334: warning: large integer implicitly truncated to unsigned type
-exports.y: In function 'set_ipaddr':
-exports.y:350: warning: large integer implicitly truncated to unsigned type
-
-Signed-off-by: Jason Wessel <jason.wessel@windriver.com>
-
-Upstream-Status: Submitted http://sourceforge.net/p/unfs3/bugs/5/
-
----
- Config/exports.l |    3 +++
- Config/exports.y |    6 ++++--
- 2 files changed, 7 insertions(+), 2 deletions(-)
-
---- a/Config/exports.l
-+++ b/Config/exports.l
-@@ -48,6 +48,9 @@ NETCOMP [0-9]{1,2}
- NET {IP}"/"{NETCOMP}
- OLDNET {IP}"/"{IP}
- 
-+%option nounput
-+%option noinput
-+
- %%
- 
- ^{WHITE}*\n		{ /* eat empty line */ }
---- a/Config/exports.y
-+++ b/Config/exports.y
-@@ -331,7 +331,8 @@ static void set_hostname(const char *nam
- 	if (ent) {
- 		memcpy(&cur_host.addr, ent->h_addr_list[0],
- 		       sizeof(struct in_addr));
--		cur_host.mask.s_addr = ~0UL;
-+		cur_host.mask.s_addr = 0;
-+		cur_host.mask.s_addr = ~cur_host.mask.s_addr;
- 	} else {
- 		logmsg(LOG_CRIT, "could not resolve hostname '%s'", name);
- 		e_error = TRUE;
-@@ -347,7 +348,8 @@ static void set_ipaddr(const char *addr)
- 	
- 	if (!inet_aton(addr, &cur_host.addr))
- 		e_error = TRUE;
--	cur_host.mask.s_addr = ~0UL;
-+	cur_host.mask.s_addr = 0;
-+	cur_host.mask.s_addr = ~cur_host.mask.s_addr;
- }
- 
- /*
diff --git a/meta/recipes-devtools/unfs3/unfs3_0.9.22.r490.bb b/meta/recipes-devtools/unfs3/unfs3_0.9.22.r497.bb
similarity index 88%
rename from meta/recipes-devtools/unfs3/unfs3_0.9.22.r490.bb
rename to meta/recipes-devtools/unfs3/unfs3_0.9.22.r497.bb
index 5130895..7e9d659 100644
--- a/meta/recipes-devtools/unfs3/unfs3_0.9.22.r490.bb
+++ b/meta/recipes-devtools/unfs3/unfs3_0.9.22.r497.bb
@@ -4,9 +4,9 @@ LICENSE = "unfs3"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=9475885294e17c0cc0067820d042792e"
 
 # SVN support for upstream version check isn't implemented yet
-RECIPE_UPSTREAM_VERSION = "0.9.22.r495"
-RECIPE_UPSTREAM_DATE = "Feb 05, 2015"
-CHECK_DATE = "Jun 10, 2015"
+RECIPE_UPSTREAM_VERSION = "0.9.22.r497"
+RECIPE_UPSTREAM_DATE = "Oct 08, 2015"
+CHECK_DATE = "Dec 10, 2015"
 
 DEPENDS = "flex-native bison-native flex"
 DEPENDS_append_class-nativesdk += "flex-nativesdk"
@@ -14,16 +14,15 @@ DEPENDS_append_class-nativesdk += "flex-nativesdk"
 SRC_URI[md5sum] = "3687acc4ee992e536472365dd99712a7"
 SRC_URI[sha256sum] = "274b43ada9c6eea1da26eb7010d72889c5278984ba0b50dff4e093057d4d64f8"
 
-MOD_PV = "490"
+MOD_PV = "497"
 S = "${WORKDIR}/trunk"
-SRC_URI = "svn://svn.code.sf.net/p/unfs3/code;module=trunk;rev=${MOD_PV} \
+SRC_URI = "svn://svn.code.sf.net/p/unfs3/code;module=trunk;rev=${MOD_PV};protocol=http \
            file://unfs3_parallel_build.patch \
            file://alternate_rpc_ports.patch \
            file://fix_pid_race_parent_writes_child_pid.patch \
            file://fix_compile_warning.patch \
            file://rename_fh_cache.patch \
            file://relative_max_socket_path_len.patch \
-           file://fix_warnings.patch \
            file://tcp_no_delay.patch \
           "
 BBCLASSEXTEND = "native nativesdk"
-- 
2.6.2


