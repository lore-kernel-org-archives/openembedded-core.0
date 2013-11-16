Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id A51606DABA
	for <openembedded-core@lists.openembedded.org>;
	Sat, 16 Nov 2013 03:19:42 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id rAG3Ji49004453
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Nov 2013 19:19:44 -0800 (PST)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.213) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.347.0; Fri, 15 Nov 2013 19:19:44 -0800
From: <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sat, 16 Nov 2013 11:19:55 +0800
Message-ID: <cb4533215083bb4031c9bece55d526c54494e3d6.1384571787.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1384571787.git.Qi.Chen@windriver.com>
References: <cover.1384571787.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] subversion: fix build problem when sysroot contains '-D' or '-I'
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
X-List-Received-Date: Sat, 16 Nov 2013 03:19:42 -0000
Content-Type: text/plain

From: Chen Qi <Qi.Chen@windriver.com>

If sysroot contains '-D' or '-I' characters, the SVN_NEON_INCLUDES and
the corresponding CFLAGS will not get the correct value.

This will cause build failures.

This patch fixes the above problem.

[YOCTO #5458]

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 .../neon.m4-fix-includes-and-cflags.patch          |   32 ++++++++++++++++++++
 .../subversion/subversion_1.7.10.bb                |    1 +
 2 files changed, 33 insertions(+)
 create mode 100644 meta/recipes-devtools/subversion/subversion-1.7.10/neon.m4-fix-includes-and-cflags.patch

diff --git a/meta/recipes-devtools/subversion/subversion-1.7.10/neon.m4-fix-includes-and-cflags.patch b/meta/recipes-devtools/subversion/subversion-1.7.10/neon.m4-fix-includes-and-cflags.patch
new file mode 100644
index 0000000..013d0c3
--- /dev/null
+++ b/meta/recipes-devtools/subversion/subversion-1.7.10/neon.m4-fix-includes-and-cflags.patch
@@ -0,0 +1,32 @@
+Fix to get correct SVN_NEON_CONFIG and CFLAGS when sysroot path contains '-D' and '-I'
+characters.
+
+Upstream-Status: Pending
+
+Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
+
+index f951039..a813145 100644
+--- a/build/ac-macros/neon.m4
++++ b/build/ac-macros/neon.m4
+@@ -105,8 +105,8 @@ AC_DEFUN(SVN_NEON_CONFIG,
+            test "$svn_allowed_neon" = "any"; then
+             svn_allowed_neon_on_system="yes"
+             if test "$NEON_PKG_CONFIG" = "yes"; then
+-              SVN_NEON_INCLUDES=[`$PKG_CONFIG neon --cflags | $SED -e 's/-D[^ ]*//g'`]
+-              CFLAGS=["$CFLAGS `$PKG_CONFIG neon --cflags | $SED -e 's/-I[^ ]*//g'`"]
++              SVN_NEON_INCLUDES=["`$PKG_CONFIG neon --cflags | $SED -e 's/^-D[^ ]*//g' -e 's/ -D[^ ]*//g'`"]
++              CFLAGS=["$CFLAGS `$PKG_CONFIG neon --cflags | $SED -e 's/^-I[^ ]*//g' -e 's/ -I[^ ]*//g'`"]
+               old_CFLAGS="$CFLAGS"
+               old_LIBS="$LIBS"
+               NEON_LIBS=`$PKG_CONFIG neon --libs`
+@@ -126,8 +126,8 @@ int main()
+               CFLAGS="$old_CFLAGS"
+               LIBS="$old_LIBS"
+             else
+-              SVN_NEON_INCLUDES=[`$neon_config --cflags | $SED -e 's/-D[^ ]*//g'`]
+-              CFLAGS=["$CFLAGS `$neon_config --cflags | $SED -e 's/-I[^ ]*//g'`"]
++              SVN_NEON_INCLUDES=[`$neon_config --cflags | $SED -e 's/^-D[^ ]*//g' -e 's/ -D[^ ]*//g'`]
++              CFLAGS=["$CFLAGS `$neon_config --cflags | $SED -e 's/^-I[^ ]*//g' -e 's/ -I[^ ]*//g'`"]
+               NEON_LIBS=`$neon_config --libs`
+             fi
+             svn_lib_neon="yes"
diff --git a/meta/recipes-devtools/subversion/subversion_1.7.10.bb b/meta/recipes-devtools/subversion/subversion_1.7.10.bb
index 4acd70b..489bddf 100644
--- a/meta/recipes-devtools/subversion/subversion_1.7.10.bb
+++ b/meta/recipes-devtools/subversion/subversion_1.7.10.bb
@@ -13,6 +13,7 @@ SRC_URI = "${APACHE_MIRROR}/${BPN}/${BPN}-${PV}.tar.bz2 \
            file://libtool2.patch \
            file://fix-install-depends.patch \
            file://allow-updated-neon.patch \
+           file://neon.m4-fix-includes-and-cflags.patch \
 "
 SRC_URI[md5sum] = "4088a77e14232876c9b4ff1541e6e200"
 SRC_URI[sha256sum] = "c1df222bec83d014d17785e2ceba6bc80962f64b280967de0285836d8d77a8e7"
-- 
1.7.9.5


