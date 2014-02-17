Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 7E17D6E7CF
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Feb 2014 15:08:52 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 17 Feb 2014 07:08:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.95,861,1384329600"; d="scan'208";a="456901760"
Received: from nithyasr-mobl.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.123.246])
	by orsmga001.jf.intel.com with ESMTP; 17 Feb 2014 07:08:52 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 17 Feb 2014 15:08:43 +0000
Message-Id: <42232782b9a3aa0ed03c5dda84fc0b865b74b2dd.1392649689.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.8.5.3
In-Reply-To: <cover.1392649689.git.paul.eggleton@linux.intel.com>
References: <cover.1392649689.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1392649689.git.paul.eggleton@linux.intel.com>
References: <cover.1392649689.git.paul.eggleton@linux.intel.com>
Subject: [dylan][PATCH 1/1] subversion: fix build problem when sysroot contains '-D' or '-I'
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
X-List-Received-Date: Mon, 17 Feb 2014 15:08:52 -0000

From: Chen Qi <Qi.Chen@windriver.com>

If sysroot contains '-D' or '-I' characters, the SVN_NEON_INCLUDES and
the corresponding CFLAGS will not get the correct value.

This will cause build failures.

This patch fixes the above problem.

[YOCTO #5458]

(From OE-Core master rev: 7078397ef39de43244fca7e24683b2a83913cbbf)

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
Signed-off-by: Saul Wold <sgw@linux.intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../neon.m4-fix-includes-and-cflags.patch          | 32 ++++++++++++++++++++++
 .../subversion/subversion_1.7.8.bb                 |  1 +
 2 files changed, 33 insertions(+)
 create mode 100644 meta/recipes-devtools/subversion/subversion-1.7.8/neon.m4-fix-includes-and-cflags.patch

diff --git a/meta/recipes-devtools/subversion/subversion-1.7.8/neon.m4-fix-includes-and-cflags.patch b/meta/recipes-devtools/subversion/subversion-1.7.8/neon.m4-fix-includes-and-cflags.patch
new file mode 100644
index 0000000..013d0c3
--- /dev/null
+++ b/meta/recipes-devtools/subversion/subversion-1.7.8/neon.m4-fix-includes-and-cflags.patch
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
diff --git a/meta/recipes-devtools/subversion/subversion_1.7.8.bb b/meta/recipes-devtools/subversion/subversion_1.7.8.bb
index 6aced28..0e3d844 100644
--- a/meta/recipes-devtools/subversion/subversion_1.7.8.bb
+++ b/meta/recipes-devtools/subversion/subversion_1.7.8.bb
@@ -12,6 +12,7 @@ inherit gettext
 SRC_URI = "${APACHE_MIRROR}/${BPN}/${BPN}-${PV}.tar.bz2 \
            file://libtool2.patch \
            file://fix-install-depends.patch \
+           file://neon.m4-fix-includes-and-cflags.patch \
 "
 SRC_URI[md5sum] = "454b9f398415c3504435bf8c3f6ed127"
 SRC_URI[sha256sum] = "fc83d4d98ccea8b7bfa8f5c20fff545c8baa7d035db930977550c51c6ca23686"
-- 
1.8.5.3


