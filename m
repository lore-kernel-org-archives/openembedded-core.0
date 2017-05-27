Return-Path: <Li.Zhou@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id E806160939
	for <openembedded-core@lists.openembedded.org>;
	Sat, 27 May 2017 09:47:10 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v4R9lBQ2008038
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sat, 27 May 2017 02:47:11 -0700 (PDT)
Received: from pek-lpggp2.wrs.com (128.224.153.75) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server (TLS) id 14.3.294.0;
	Sat, 27 May 2017 02:47:10 -0700
From: Li Zhou <li.zhou@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sat, 27 May 2017 17:46:15 +0800
Message-ID: <1495878376-29266-1-git-send-email-li.zhou@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [128.224.153.75]
Subject: [PATCH V2 1/2] python3: Use _sysconfigdata.py to initialize distutils.sysconfig
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
X-List-Received-Date: Sat, 27 May 2017 09:47:11 -0000
Content-Type: text/plain

Porting patch from
<https://github.com/python/cpython/commit/409482251b06fe75c4ee56e85ffbb4b23d934159>
to use _sysconfigdata.py to initialize distutils.sysconfig.

This patch makes that distutils.sysconfig doesn't need config-*/Makefile
in libdir any more. Next we can move it from python3-misc to python3-dev
package.

Signed-off-by: Li Zhou <li.zhou@windriver.com>
---
 ...-Use-_sysconfigdata.py-to-initialize-dist.patch | 66 ++++++++++++++++++++++
 meta/recipes-devtools/python/python3_3.5.3.bb      |  1 +
 2 files changed, 67 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3/0001-Issue-21272-Use-_sysconfigdata.py-to-initialize-dist.patch

diff --git a/meta/recipes-devtools/python/python3/0001-Issue-21272-Use-_sysconfigdata.py-to-initialize-dist.patch b/meta/recipes-devtools/python/python3/0001-Issue-21272-Use-_sysconfigdata.py-to-initialize-dist.patch
new file mode 100644
index 0000000..d1c92e9
--- /dev/null
+++ b/meta/recipes-devtools/python/python3/0001-Issue-21272-Use-_sysconfigdata.py-to-initialize-dist.patch
@@ -0,0 +1,66 @@
+From bcddbf40c7f1b80336268cdddacc17369fb0ccea Mon Sep 17 00:00:00 2001
+From: Libin Dang <libin.dang@windriver.com>
+Date: Tue, 11 Apr 2017 14:12:15 +0800
+Subject: [PATCH] Issue #21272: Use _sysconfigdata.py to initialize
+ distutils.sysconfig
+
+Backport upstream commit
+https://github.com/python/cpython/commit/409482251b06fe75c4ee56e85ffbb4b23d934159
+
+Upstream-Status: Backport
+
+Signed-off-by: Li Zhou <li.zhou@windriver.com>
+---
+ Lib/distutils/sysconfig.py | 35 ++++-------------------------------
+ 1 file changed, 4 insertions(+), 31 deletions(-)
+
+diff --git a/Lib/distutils/sysconfig.py b/Lib/distutils/sysconfig.py
+index 6d5cfd0..9925d24 100644
+--- a/Lib/distutils/sysconfig.py
++++ b/Lib/distutils/sysconfig.py
+@@ -424,38 +424,11 @@ _config_vars = None
+ 
+ def _init_posix():
+     """Initialize the module as appropriate for POSIX systems."""
+-    g = {}
+-    # load the installed Makefile:
+-    try:
+-        filename = get_makefile_filename()
+-        parse_makefile(filename, g)
+-    except OSError as msg:
+-        my_msg = "invalid Python installation: unable to open %s" % filename
+-        if hasattr(msg, "strerror"):
+-            my_msg = my_msg + " (%s)" % msg.strerror
+-
+-        raise DistutilsPlatformError(my_msg)
+-
+-    # load the installed pyconfig.h:
+-    try:
+-        filename = get_config_h_filename()
+-        with open(filename) as file:
+-            parse_config_h(file, g)
+-    except OSError as msg:
+-        my_msg = "invalid Python installation: unable to open %s" % filename
+-        if hasattr(msg, "strerror"):
+-            my_msg = my_msg + " (%s)" % msg.strerror
+-
+-        raise DistutilsPlatformError(my_msg)
+-
+-    # On AIX, there are wrong paths to the linker scripts in the Makefile
+-    # -- these paths are relative to the Python source, but when installed
+-    # the scripts are in another directory.
+-    if python_build:
+-        g['LDSHARED'] = g['BLDSHARED']
+-
++    # _sysconfigdata is generated at build time, see the sysconfig module
++    from _sysconfigdata import build_time_vars
+     global _config_vars
+-    _config_vars = g
++    _config_vars = {}
++    _config_vars.update(build_time_vars)
+ 
+ 
+ def _init_nt():
+-- 
+1.8.3.1
+
diff --git a/meta/recipes-devtools/python/python3_3.5.3.bb b/meta/recipes-devtools/python/python3_3.5.3.bb
index 3b3cfeb..d7c29f2 100644
--- a/meta/recipes-devtools/python/python3_3.5.3.bb
+++ b/meta/recipes-devtools/python/python3_3.5.3.bb
@@ -36,6 +36,7 @@ SRC_URI += "\
             file://setup.py-find-libraries-in-staging-dirs.patch \
             file://configure.ac-fix-LIBPL.patch \
             file://upstream-random-fixes.patch \
+            file://0001-Issue-21272-Use-_sysconfigdata.py-to-initialize-dist.patch \
            "
 SRC_URI[md5sum] = "57d1f8bfbabf4f2500273fb0706e6f21"
 SRC_URI[sha256sum] = "eefe2ad6575855423ab630f5b51a8ef6e5556f774584c06beab4926f930ddbb0"
-- 
1.9.1


