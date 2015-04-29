Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id B196B716CE
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Apr 2015 09:09:18 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.9) with ESMTP id t3T99Jdw015283
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Apr 2015 02:09:19 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.224.2;
	Wed, 29 Apr 2015 02:09:19 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 29 Apr 2015 02:09:18 -0700
Message-ID: <881e4e95f8952b62d2da41070849cffb2228f2a1.1430298535.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1430298535.git.liezhi.yang@windriver.com>
References: <cover.1430298535.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] python-numpy: remove 2 dangling patches
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
X-List-Received-Date: Wed, 29 Apr 2015 09:09:20 -0000
Content-Type: text/plain

Removed:
- unbreak-assumptions.diff
  This patch changs the dir to /non-existant-dir, the source code has
  changed the dir to /deadir, so it is not needed any more.

- trycompile.diff
  There is no try_compile or try_run in numpy/core/setup.py any more, so
  assumed that it is not needed.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 .../python/python-numpy/trycompile.diff            |   36 --------------------
 .../python/python-numpy/unbreak-assumptions.diff   |   19 -----------
 2 files changed, 55 deletions(-)
 delete mode 100644 meta/recipes-devtools/python/python-numpy/trycompile.diff
 delete mode 100644 meta/recipes-devtools/python/python-numpy/unbreak-assumptions.diff

diff --git a/meta/recipes-devtools/python/python-numpy/trycompile.diff b/meta/recipes-devtools/python/python-numpy/trycompile.diff
deleted file mode 100644
index 6824227..0000000
--- a/meta/recipes-devtools/python/python-numpy/trycompile.diff
+++ /dev/null
@@ -1,36 +0,0 @@
-Upstream-Status: Pending
-Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
-
---- /tmp/setup.py	2008-09-01 10:37:44.000000000 +0200
-+++ numpy-1.1.1/numpy/core/setup.py	2008-09-01 10:38:20.373198000 +0200
-@@ -80,8 +80,7 @@
-                 raise SystemError,\
-                       "Non-existing %s. Perhaps you need to install"\
-                       " python-dev|python-devel." % (python_h)
--            result = config_cmd.try_run(tc,include_dirs=[python_include],
--                                        library_dirs = default_lib_dirs)
-+            result = config_cmd.try_compile(tc)
-             if not result:
-                 raise SystemError,"Failed to test configuration. "\
-                       "See previous error messages for more information."
-@@ -95,7 +94,7 @@
-             if mathlib:
-                 mathlibs_choices.insert(0,mathlib.split(','))
-             for libs in mathlibs_choices:
--                if config_cmd.try_run(tc,libraries=libs):
-+                if config_cmd.try_compile(tc):
-                     mathlibs = libs
-                     break
-             else:
-@@ -180,10 +179,7 @@
-                       " python-dev|python-devel." % (python_h)
- 
-             config.numpy_include_dirs
--            result = config_cmd.try_run(testcode,
--                                include_dirs = [python_include] + \
--                                                       config.numpy_include_dirs,
--                                        library_dirs = default_lib_dirs)
-+            result = config_cmd.try_compile(testcode)
- 
-             if not result:
-                 raise SystemError,"Failed to generate numpy configuration. "\
diff --git a/meta/recipes-devtools/python/python-numpy/unbreak-assumptions.diff b/meta/recipes-devtools/python/python-numpy/unbreak-assumptions.diff
deleted file mode 100644
index 20ec6fd..0000000
--- a/meta/recipes-devtools/python/python-numpy/unbreak-assumptions.diff
+++ /dev/null
@@ -1,19 +0,0 @@
-Upstream-Status: Inappropriate
-Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
-
---- /tmp/system_info.py	2008-08-22 00:38:16.000000000 +0200
-+++ numpy-1.1.1/numpy/distutils/system_info.py	2008-08-22 00:40:33.013198000 +0200
-@@ -137,11 +137,8 @@
-     default_x11_lib_dirs = []
-     default_x11_include_dirs = []
- else:
--    default_lib_dirs = ['/usr/local/lib', '/opt/lib', '/usr/lib',
--                        '/opt/local/lib', '/sw/lib']
--    default_include_dirs = ['/usr/local/include',
--                            '/opt/include', '/usr/include',
--                            '/opt/local/include', '/sw/include']
-+    default_lib_dirs = ['/non-existant-dir']
-+    default_include_dirs = ['non-existant-dir']
-     default_src_dirs = ['.','/usr/local/src', '/opt/src','/sw/src']
- 
-     try:
-- 
1.7.9.5


