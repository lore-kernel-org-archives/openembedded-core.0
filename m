Return-Path: <alejandro.hernandez@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id CAB4173223
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 May 2015 16:16:07 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga101.fm.intel.com with ESMTP; 21 May 2015 09:16:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,470,1427785200"; d="scan'208";a="733176208"
Received: from yctb02.ostc.intel.com (HELO yctb02.otcr.intel.com)
	([10.23.219.47])
	by orsmga002.jf.intel.com with ESMTP; 21 May 2015 09:16:08 -0700
From: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 21 May 2015 09:15:37 +0000
Message-Id: <08e1326f2da93780f39d97def138dd43319f014e.1432199284.git.alejandro.hernandez@linux.intel.com>
X-Mailer: git-send-email 1.8.4.5
In-Reply-To: <cover.1432199284.git.alejandro.hernandez@linux.intel.com>
References: <cover.1432199284.git.alejandro.hernandez@linux.intel.com>
In-Reply-To: <cover.1432199284.git.alejandro.hernandez@linux.intel.com>
References: <cover.1432199284.git.alejandro.hernandez@linux.intel.com>
Subject: [PATCH 3/5] python3-io: Fixes compilation of python3 ssl module
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
X-List-Received-Date: Thu, 21 May 2015 16:16:08 -0000

During python3 compilation, the module ssl was being skippped due to
the fact that the compilation script couldnt find the required files,
this patch fixes setup.py so it looks for the files in the correct
directory, hence fixing its compilation and installation.

[YOCTO #7768]

Signed-off-by: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
---
 .../python/python3/fix_ssl_include_dir.patch       | 29 ++++++++++++++++++++++
 meta/recipes-devtools/python/python3_3.4.3.bb      |  1 +
 2 files changed, 30 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3/fix_ssl_include_dir.patch

diff --git a/meta/recipes-devtools/python/python3/fix_ssl_include_dir.patch b/meta/recipes-devtools/python/python3/fix_ssl_include_dir.patch
new file mode 100644
index 0000000..01ee9da
--- /dev/null
+++ b/meta/recipes-devtools/python/python3/fix_ssl_include_dir.patch
@@ -0,0 +1,29 @@
+Index: Python-3.4.3/setup.py
+===================================================================
+--- Python-3.4.3.orig/setup.py
++++ Python-3.4.3/setup.py
+@@ -726,10 +726,9 @@ class PyBuildExt(build_ext):
+         exts.append( Extension('_socket', ['socketmodule.c'],
+                                depends = ['socketmodule.h']) )
+         # Detect SSL support for the socket module (via _ssl)
+-        search_for_ssl_incs_in = [
+-                              '/usr/local/ssl/include',
+-                              '/usr/contrib/ssl/include/'
+-                             ]
++        search_for_ssl_incs_in = []
++        for dir in [os.getenv("STAGING_INCDIR")]:
++                search_for_ssl_incs_in.append(dir)
+         ssl_incs = find_file('openssl/ssl.h', inc_dirs,
+                              search_for_ssl_incs_in
+                              )
+@@ -739,9 +738,7 @@ class PyBuildExt(build_ext):
+             if krb5_h:
+                 ssl_incs += krb5_h
+         ssl_libs = find_library_file(self.compiler, 'ssl',lib_dirs,
+-                                     ['/usr/local/ssl/lib',
+-                                      '/usr/contrib/ssl/lib/'
+-                                     ] )
++                                     [os.getenv("STAGING_LIBDIR")])
+ 
+         if (ssl_incs is not None and
+             ssl_libs is not None):
diff --git a/meta/recipes-devtools/python/python3_3.4.3.bb b/meta/recipes-devtools/python/python3_3.4.3.bb
index 120b594..f7f68cb 100644
--- a/meta/recipes-devtools/python/python3_3.4.3.bb
+++ b/meta/recipes-devtools/python/python3_3.4.3.bb
@@ -36,6 +36,7 @@ SRC_URI += "\
             file://python3-setup.py-no-host-headers-libs.patch \
             file://sysconfig.py-add-_PYTHON_PROJECT_SRC.patch \
             file://setup.py-check-cross_compiling-when-get-FLAGS.patch \
+            file://fix_ssl_include_dir.patch \
            "
 SRC_URI[md5sum] = "7d092d1bba6e17f0d9bd21b49e441dd5"
 SRC_URI[sha256sum] = "b5b3963533768d5fc325a4d7a6bd6f666726002d696f1d399ec06b043ea996b8"
-- 
1.8.4.5


