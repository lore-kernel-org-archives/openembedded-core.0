Return-Path: <Qi.Chen@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 9146C7317E
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Feb 2016 07:05:37 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u1G75brA027699
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Feb 2016 23:05:37 -0800
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.163.141) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.248.2; Mon, 15 Feb 2016 23:05:37 -0800
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 16 Feb 2016 15:06:05 +0800
Message-ID: <9b7f64a99c4d7183273e27a0f4634f27a8c2149a.1455606321.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1455606321.git.Qi.Chen@windriver.com>
References: <cover.1455606321.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] coreutils: fix problem with acl for 6.9 version
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
X-List-Received-Date: Tue, 16 Feb 2016 07:05:38 -0000
Content-Type: text/plain

If 'acl' is not in DISTRO_FEATURES, building coreutils 6.9 would sometimes
fail. The problem could be reproduced by executing the following command.

`bitbake acl && bitbake coreutils -c configure && bitbake acl -c cleansstate
&& bitbake coreutils -c compile'

Fix this problem by setting the correct value for the 'acl' PACKAGECONFIG.

[YOCTO #8906]

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 .../coreutils-6.9/coreutils-build-with-acl.patch   | 28 ----------------------
 meta/recipes-core/coreutils/coreutils_6.9.bb       |  3 +--
 2 files changed, 1 insertion(+), 30 deletions(-)
 delete mode 100644 meta/recipes-core/coreutils/coreutils-6.9/coreutils-build-with-acl.patch

diff --git a/meta/recipes-core/coreutils/coreutils-6.9/coreutils-build-with-acl.patch b/meta/recipes-core/coreutils/coreutils-6.9/coreutils-build-with-acl.patch
deleted file mode 100644
index 8273d78..0000000
--- a/meta/recipes-core/coreutils/coreutils-6.9/coreutils-build-with-acl.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-Upstream-Status: Inappropriate [embedded specific]
-
-Fix the following issue so that coreutils can build with ACL:
-
-configure: WARNING: libacl development library was not found or not usable.
-configure: WARNING: GNU coreutils will be built without ACL support.
-
-Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
----
- m4/acl.m4 |    2 +-
- 1 files changed, 1 insertions(+), 1 deletions(-)
-
-diff --git a/m4/acl.m4 b/m4/acl.m4
-index d6a448a..a9d4836 100644
---- a/m4/acl.m4
-+++ b/m4/acl.m4
-@@ -159,7 +159,7 @@ AC_DEFUN([gl_ACL_GET_FILE],
-           ]])],
-        [gl_cv_func_working_acl_get_file=yes],
-        [gl_cv_func_working_acl_get_file=no],
--       [gl_cv_func_working_acl_get_file=cross-compiling])])
-+       [gl_cv_func_working_acl_get_file=yes])])
- 
-   AS_IF([test $gl_cv_func_working_acl_get_file = yes], [$1], [$2])
- ])
--- 
-1.7.7
-
diff --git a/meta/recipes-core/coreutils/coreutils_6.9.bb b/meta/recipes-core/coreutils/coreutils_6.9.bb
index e9f82ab..9ce717d 100644
--- a/meta/recipes-core/coreutils/coreutils_6.9.bb
+++ b/meta/recipes-core/coreutils/coreutils_6.9.bb
@@ -23,7 +23,6 @@ SRC_URI = "${GNU_MIRROR}/coreutils/${BP}.tar.bz2 \
            file://coreutils-fix-install.patch \
            file://man-touch.patch \
            file://coreutils_fix_for_automake-1.12.patch \
-           file://coreutils-build-with-acl.patch \
            file://coreutils-fix-texinfo.patch \
            file://fix_for_manpage_building.patch \
            file://loadavg.patch \
@@ -41,7 +40,7 @@ PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'acl', 'acl', '', d)}
 
 # with, without, depends, rdepends
 #
-PACKAGECONFIG[acl] = "ac_cv_header_sys_acl_h=yes,ac_cv_header_sys_acl_h=no,acl,"
+PACKAGECONFIG[acl] = "ac_cv_header_sys_acl_h=yes ac_cv_header_acl_libacl_h=yes ac_cv_search_acl_get_file=-lacl,ac_cv_header_sys_acl_h=no ac_cv_header_acl_libacl_h=no ac_cv_search_acl_get_file=,acl,"
 
 
 # [ gets a special treatment and is not included in this
-- 
1.9.1


