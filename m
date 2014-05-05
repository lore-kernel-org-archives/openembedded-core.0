Return-Path: <tylerwhall@gmail.com>
Received: from mail-ig0-f172.google.com (mail-ig0-f172.google.com
	[209.85.213.172])
	by mail.openembedded.org (Postfix) with ESMTP id CF9CD65EC9
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 May 2014 00:06:48 +0000 (UTC)
Received: by mail-ig0-f172.google.com with SMTP id uy17so4051646igb.17
	for <openembedded-core@lists.openembedded.org>;
	Sun, 04 May 2014 17:06:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=+9ghWFyRaJ/NojRTaWFl29TratBERqBmTf8ozYUZZjA=;
	b=Ivl6Gm1Mc4L+mg0VLx5vrEbiSKNOnufTr/f2CQ+13Y5CpBRBL0X1DTOV+dgVcQq7n+
	5thVNQCuM328JkgevSFVqHUUeq8gyLbPEkZder2NrkdiOG5YPgxx157ehJnuI537GxHc
	T48Dg6baaO980H2jLoO6gw0O741I8ojTJQJXvVXOn+eF0swNCZx8VMtNwZXFc05NjO8F
	N9+VZF+kjkD/Soc9atIK9RcdK82aeSdtgoRH8ZxDXgrs30/STQXkNTrkS7atiRY2szha
	7z54KcCL0an+4lWDr/O54qcrASl2dws/gFBHYGA0PyFdjpnfBn40IZlgjjcytwlS+Le8
	Xccw==
X-Received: by 10.50.61.235 with SMTP id t11mr18945813igr.44.1399248409263;
	Sun, 04 May 2014 17:06:49 -0700 (PDT)
Received: from localhost.localdomain (CPE-76-177-97-210.natcky.res.rr.com.
	[76.177.97.210])
	by mx.google.com with ESMTPSA id s1sm20925869igr.14.2014.05.04.17.06.48
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 04 May 2014 17:06:48 -0700 (PDT)
From: Tyler Hall <tylerwhall@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun,  4 May 2014 20:06:43 -0400
Message-Id: <1399248403-26514-1-git-send-email-tylerwhall@gmail.com>
X-Mailer: git-send-email 1.9.2
Subject: [RFC][PATCH] python3: Revert python-config to distutils.sysconfig
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
X-List-Received-Date: Mon, 05 May 2014 00:06:50 -0000

The newer sysconfig module shares some code with distutils.sysconfig,
but the same modifications as in

12-distutils-prefix-is-inside-staging-area.patch

makes distutils.sysconfig affect the native runtime as well as cross
building.  Use the old, patched implementation which returns paths in
the staging directory and for the target, as appropriate.

This change reverts this upstream patch
http://hg.python.org/cpython/diff/712970b019f7/Misc/python-config.in

Signed-off-by: Tyler Hall <tylerwhall@gmail.com>
---

Right now, python3-config returns paths in the native sysroot regardless of
whether the recipe is native or cross. This will cause cross compiled C python
modules to use native headers.

I tried making a similar change in the new sysconfig module as in the
referenced distutils.sysconfig patch above, but that broke autotools' ability
to detect the native python3 correctly.

I think making python3-config get its info from distutils will work for now,
but since this distutils interface appears to be deprecated it will probably
have to be revisted later.

 .../python/python3-native_3.3.3.bb                 |  1 +
 .../python/python3/python-config.patch             | 46 ++++++++++++++++++++++
 meta/recipes-devtools/python/python3_3.3.3.bb      |  1 +
 3 files changed, 48 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3/python-config.patch

diff --git a/meta/recipes-devtools/python/python3-native_3.3.3.bb b/meta/recipes-devtools/python/python3-native_3.3.3.bb
index 0fd7349..9ae2a0b 100644
--- a/meta/recipes-devtools/python/python3-native_3.3.3.bb
+++ b/meta/recipes-devtools/python/python3-native_3.3.3.bb
@@ -6,6 +6,7 @@ DISTRO_SRC_URI ?= "file://sitecustomize.py"
 DISTRO_SRC_URI_linuxstdbase = ""
 SRC_URI = "http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.bz2 \
 file://12-distutils-prefix-is-inside-staging-area.patch \
+file://python-config.patch \
 file://000-cross-compile.patch \
 file://020-dont-compile-python-files.patch \
 file://030-fixup-include-dirs.patch \
diff --git a/meta/recipes-devtools/python/python3/python-config.patch b/meta/recipes-devtools/python/python3/python-config.patch
new file mode 100644
index 0000000..f23b8b7
--- /dev/null
+++ b/meta/recipes-devtools/python/python3/python-config.patch
@@ -0,0 +1,46 @@
+python-config: Revert to using distutils.sysconfig
+
+The newer sysconfig module shares some code with distutils.sysconfig, but the same modifications as in
+
+12-distutils-prefix-is-inside-staging-area.patch makes distutils.sysconfig
+
+affect the native runtime as well as cross building. Use the old, patched
+implementation which returns paths in the staging directory and for the target,
+as appropriate.
+
+Upstream-Status: Inappropriate [Embedded Specific]
+
+Signed-off-by: Tyler Hall <tylerwhall@gmail.com>
+:
+Index: Python-3.3.3/Misc/python-config.in
+===================================================================
+--- Python-3.3.3.orig/Misc/python-config.in
++++ Python-3.3.3/Misc/python-config.in
+@@ -4,7 +4,7 @@
+ import getopt
+ import os
+ import sys
+-import sysconfig
++from distutils import sysconfig
+ 
+ valid_opts = ['prefix', 'exec-prefix', 'includes', 'libs', 'cflags',
+               'ldflags', 'extension-suffix', 'help', 'abiflags', 'configdir']
+@@ -32,14 +32,14 @@ if '--help' in opt_flags:
+ 
+ for opt in opt_flags:
+     if opt == '--prefix':
+-        print(sysconfig.get_config_var('prefix'))
++        print(sysconfig.PREFIX)
+ 
+     elif opt == '--exec-prefix':
+-        print(sysconfig.get_config_var('exec_prefix'))
++        print(sysconfig.EXEC_PREFIX)
+ 
+     elif opt in ('--includes', '--cflags'):
+-        flags = ['-I' + sysconfig.get_path('include'),
+-                 '-I' + sysconfig.get_path('platinclude')]
++        flags = ['-I' + sysconfig.get_python_inc(),
++                 '-I' + sysconfig.get_python_inc(plat_specific=True)]
+         if opt == '--cflags':
+             flags.extend(getvar('CFLAGS').split())
+         print(' '.join(flags))
diff --git a/meta/recipes-devtools/python/python3_3.3.3.bb b/meta/recipes-devtools/python/python3_3.3.3.bb
index 2dd5116..fe9824c 100644
--- a/meta/recipes-devtools/python/python3_3.3.3.bb
+++ b/meta/recipes-devtools/python/python3_3.3.3.bb
@@ -8,6 +8,7 @@ DISTRO_SRC_URI ?= "file://sitecustomize.py"
 DISTRO_SRC_URI_linuxstdbase = ""
 SRC_URI = "http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.bz2 \
 file://12-distutils-prefix-is-inside-staging-area.patch \
+file://python-config.patch \
 file://000-cross-compile.patch \
 file://020-dont-compile-python-files.patch \
 file://030-fixup-include-dirs.patch \
-- 
1.9.2


