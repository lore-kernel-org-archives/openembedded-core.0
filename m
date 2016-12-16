Return-Path: <Dengke.Du@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 049E86E688
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Dec 2016 02:49:23 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id uBG2nOFm002579
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Dec 2016 18:49:24 -0800
Received: from pek-lpgtest20.wrs.com (128.224.179.28) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.294.0; Thu, 15 Dec 2016 18:49:23 -0800
From: Dengke Du <dengke.du@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 16 Dec 2016 10:49:19 +0800
Message-ID: <46f2559616e1f79721500cb2ada13657aa67e225.1481856470.git.dengke.du@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1481856470.git.dengke.du@windriver.com>
References: <cover.1481856470.git.dengke.du@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/2] Revert "subversion: fix "svnadmin create" fail on x86"
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
X-List-Received-Date: Fri, 16 Dec 2016 02:49:24 -0000
Content-Type: text/plain

This reverts commit cfe6f3e251240c9d9a70354be0501600357f0b87.
---
 .../0001-fix-svnadmin-create-fail-on-x86.patch     | 56 ----------------------
 .../subversion/subversion_1.9.4.bb                 |  1 -
 2 files changed, 57 deletions(-)
 delete mode 100644 meta/recipes-devtools/subversion/subversion/0001-fix-svnadmin-create-fail-on-x86.patch

diff --git a/meta/recipes-devtools/subversion/subversion/0001-fix-svnadmin-create-fail-on-x86.patch b/meta/recipes-devtools/subversion/subversion/0001-fix-svnadmin-create-fail-on-x86.patch
deleted file mode 100644
index d440528..0000000
--- a/meta/recipes-devtools/subversion/subversion/0001-fix-svnadmin-create-fail-on-x86.patch
+++ /dev/null
@@ -1,56 +0,0 @@
-From 09475e0befca8d120c957177ce8568fa2209a1a9 Mon Sep 17 00:00:00 2001
-From: Dengke Du <dengke.du@windriver.com>
-Date: Wed, 2 Nov 2016 11:09:44 +0800
-Subject: [PATCH] fix "svnadmin create" fail on x86
-
-When run the following command on x86:
-
-        svnadmin create /var/test_repo
-
-It cause segmentation fault error like the following:
-
-        [16499.751837] svnadmin[21117]: segfault at 83 ip 00000000f74bf7f6 sp 00000000ffdd9b34 error 4 in libc-2.24.so[f7441000+1af000]
-        Segmentation fault (core dumped)
-
-This is because in source code ./subversion/libsvn_fs_fs/low_level.c,
-function svn_fs_fs__unparse_footer, when:
-
-        target arch:    x86
-        apr_off_t:      4 bytes
-
-if the "APR_OFF_T_FMT" is "lld", it still use type "apr_off_t" to pass
-data to apr, but in apr source code file apr_snprintf.c the function
-apr_vformatter meet "lld", it would use the:
-
-        i_quad = va_arg(ap, apr_int64_t);
-
-It uses the apr_int64_t to deal data, it read 8 bytes, so the follow-up
-data may be error.
-
-Upstream-Status: Pending
-
-Signed-off-by: Dengke Du <dengke.du@windriver.com>
----
- subversion/libsvn_fs_fs/low_level.c | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/subversion/libsvn_fs_fs/low_level.c b/subversion/libsvn_fs_fs/low_level.c
-index a27bbcc..6ddbe28 100644
---- a/subversion/libsvn_fs_fs/low_level.c
-+++ b/subversion/libsvn_fs_fs/low_level.c
-@@ -250,10 +250,10 @@ svn_fs_fs__unparse_footer(apr_off_t l2p_offset,
- {
-   return svn_stringbuf_createf(result_pool,
-                                "%" APR_OFF_T_FMT " %s %" APR_OFF_T_FMT " %s",
--                               l2p_offset,
-+                               (APR_OFF_T_FMT=="lld") ? (apr_int64_t)l2p_offset : l2p_offset,
-                                svn_checksum_to_cstring(l2p_checksum,
-                                                        scratch_pool),
--                               p2l_offset,
-+                               (APR_OFF_T_FMT=="lld") ? (apr_int64_t)p2l_offset : p2l_offset,
-                                svn_checksum_to_cstring(p2l_checksum,
-                                                        scratch_pool));
- }
--- 
-2.7.4
-
diff --git a/meta/recipes-devtools/subversion/subversion_1.9.4.bb b/meta/recipes-devtools/subversion/subversion_1.9.4.bb
index 3e35940..460f8d0 100644
--- a/meta/recipes-devtools/subversion/subversion_1.9.4.bb
+++ b/meta/recipes-devtools/subversion/subversion_1.9.4.bb
@@ -14,7 +14,6 @@ SRC_URI = "${APACHE_MIRROR}/${BPN}/${BPN}-${PV}.tar.bz2 \
            file://disable_macos.patch \
            file://serf.m4-Regex-modified-to-allow-D-in-paths.patch \
            file://0001-Fix-libtool-name-in-configure.ac.patch \
-           file://0001-fix-svnadmin-create-fail-on-x86.patch \
            file://serfmacro.patch \
            "
 
-- 
2.7.4


