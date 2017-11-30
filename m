Return-Path: <danismostlikely@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 7B96E78258
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Nov 2017 16:29:14 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id l141so14155179wmg.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Nov 2017 08:29:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id;
	bh=zSuG4EFLMQmkWgfR5Xqzk1MKgSH+WtaYeHXGW+17Rq8=;
	b=IWVu7THmbGI7m+Ic/L1+hdg6BKAnzbKf2pTt5aKxBVIGWlj1QuyvqWhn95uKUulO4t
	0QT+3wSXs9BxgjEo6yWumpxcyeQfKVQ5EX3xnpLwMHUDENbxFBtJ51RQNqKK8037r3Sx
	W3hMh2EzE9sLtboc3TeVIMo0E6FFlY3AjkAfyDV2spOjGGl0yEeqHQfHkmYqOXzeAzY6
	j55Hv/JgNr2aF11YDIpApM2Wp3MSqO2TuM9pclSEaic4ExMXBhld1Ni2V71ExdphbTsq
	0Qhf4ULNiJ/UvVzfyfW3iX6OyCIbgiKrWckYL9ZJWHoqXKz/IMOLrHH67OY2GCev1Cib
	HsCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=zSuG4EFLMQmkWgfR5Xqzk1MKgSH+WtaYeHXGW+17Rq8=;
	b=SMh0exwDhVyDfRQbTGBIN0LK221CmZPIb13zX+fDA6cv8AwbHlP+uj/pNTEfof2264
	7Yj5CQKdB0mPbRjSjr+WRJtSbhX5v41LfEPUrp0F3hFoep++inMYMG/vhpYkV3ZV//aS
	rP0jVs5oaz2wvBfMK1XSgpPKIwPiVfnzGl1aLHZgC1HuVDa1PCFv/rCm2hxyKe8mXkBm
	QfizLQ4PWigh2eVVmXPn2ASy+l8Vo2x2sLQ1+w9GAS2Xkt9WqP+T9vbtf9Z7UNYN0z0I
	HdAH9yiZxwA/OeQw8ov8cRyprXjD9jQLupv7+ZAc1OiU0hB3m6N49aat/rrqP9i7MvUD
	S3XQ==
X-Gm-Message-State: AJaThX6AsGxaNtnidesz46bMnftWdPHfRVL9KSHwx2s1c3rEAxEzU/C2
	J3dVmoei+13pg0C2e9S4LId9MlWh
X-Google-Smtp-Source: AGs4zMYsyJZnRH+oFLlOwCWm9QcNJvnPrLw068SxNknH6wFRpamMfnrFozOxYAsYKMvFc9DfPI+QnA==
X-Received: by 10.28.111.15 with SMTP id k15mr2473338wmc.139.1512059354847;
	Thu, 30 Nov 2017 08:29:14 -0800 (PST)
Received: from mediabox.local ([2001:470:30f3:1:922b:34ff:fe5d:d4b3])
	by smtp.gmail.com with ESMTPSA id
	o22sm6859068wrb.40.2017.11.30.08.29.12
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 30 Nov 2017 08:29:13 -0800 (PST)
From: Dan McGregor <danismostlikely@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 30 Nov 2017 10:28:57 -0600
Message-Id: <20171130162857.24082-1-danismostlikely@gmail.com>
X-Mailer: git-send-email 2.14.1
Subject: [PATCH] python3: fix multilib in distutils
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
X-List-Received-Date: Thu, 30 Nov 2017 16:29:14 -0000

From: Dan McGregor <dan.mcgregor@usask.ca>

Update the multilib patch to also use sys.lib in distutils.

Signed-off-by: Dan McGregor <dan.mcgregor@usask.ca>
---
 meta/recipes-devtools/python/python3-native_3.5.3.bb    |  2 +-
 .../12-distutils-prefix-is-inside-staging-area.patch    | 10 +++++-----
 .../python/python3/python-3.3-multilib.patch            | 17 ++++++++++++++++-
 3 files changed, 22 insertions(+), 7 deletions(-)

diff --git a/meta/recipes-devtools/python/python3-native_3.5.3.bb b/meta/recipes-devtools/python/python3-native_3.5.3.bb
index 8cd9c88a821..da67801a05d 100644
--- a/meta/recipes-devtools/python/python3-native_3.5.3.bb
+++ b/meta/recipes-devtools/python/python3-native_3.5.3.bb
@@ -5,7 +5,6 @@ PYTHON_MAJMIN = "3.5"
 DISTRO_SRC_URI ?= "file://sitecustomize.py"
 DISTRO_SRC_URI_linuxstdbase = ""
 SRC_URI = "http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz \
-file://12-distutils-prefix-is-inside-staging-area.patch \
 file://python-config.patch \
 file://0001-cross-compile-support.patch \
 file://030-fixup-include-dirs.patch \
@@ -14,6 +13,7 @@ file://080-distutils-dont_adjust_files.patch \
 file://130-readline-setup.patch \
 file://150-fix-setupterm.patch \
 file://python-3.3-multilib.patch \
+file://12-distutils-prefix-is-inside-staging-area.patch \
 file://03-fix-tkinter-detection.patch \
 file://avoid_warning_about_tkinter.patch \
 file://shutil-follow-symlink-fix.patch \
diff --git a/meta/recipes-devtools/python/python3/12-distutils-prefix-is-inside-staging-area.patch b/meta/recipes-devtools/python/python3/12-distutils-prefix-is-inside-staging-area.patch
index c53ec0cfc85..57aca2e76f2 100644
--- a/meta/recipes-devtools/python/python3/12-distutils-prefix-is-inside-staging-area.patch
+++ b/meta/recipes-devtools/python/python3/12-distutils-prefix-is-inside-staging-area.patch
@@ -18,7 +18,7 @@ Upstream-Status: Inappropriate [embedded specific]
  1 file changed, 8 insertions(+), 2 deletions(-)
 
 diff --git a/Lib/distutils/sysconfig.py b/Lib/distutils/sysconfig.py
-index 573724d..390c485 100644
+index 217ec94c37..a55e722fed 100644
 --- a/Lib/distutils/sysconfig.py
 +++ b/Lib/distutils/sysconfig.py
 @@ -84,7 +84,9 @@ def get_python_inc(plat_specific=0, prefix=None):
@@ -43,12 +43,12 @@ index 573724d..390c485 100644
      if prefix is None:
          if standard_lib:
              prefix = plat_specific and BASE_EXEC_PREFIX or BASE_PREFIX
-@@ -133,7 +139,7 @@ def get_python_lib(plat_specific=0, standard_lib=0, prefix=None):
+@@ -132,7 +138,7 @@ def get_python_lib(plat_specific=0, standard_lib=0, prefix=None):
+             prefix = plat_specific and EXEC_PREFIX or PREFIX
  
      if os.name == "posix":
-         libpython = os.path.join(prefix,
--                                 "lib", "python" + get_python_version())
-+                                 lib_basename, "python" + get_python_version())
+-        libpython = os.path.join(prefix, sys.lib, "python" + get_python_version())
++        libpython = os.path.join(prefix, lib_basename, "python" + get_python_version())
          if standard_lib:
              return libpython
          else:
diff --git a/meta/recipes-devtools/python/python3/python-3.3-multilib.patch b/meta/recipes-devtools/python/python3/python-3.3-multilib.patch
index 08c4403cbfa..dd44aa63782 100644
--- a/meta/recipes-devtools/python/python3/python-3.3-multilib.patch
+++ b/meta/recipes-devtools/python/python3/python-3.3-multilib.patch
@@ -13,6 +13,7 @@ Signed-off-by: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
 ---
  Include/pythonrun.h              |  3 +++
  Lib/distutils/command/install.py |  4 +++-
+ Lib/distutils/sysconfig.py       |  3 +--
  Lib/pydoc.py                     |  2 +-
  Lib/site.py                      |  4 ++--
  Lib/sysconfig.py                 | 18 +++++++++---------
@@ -23,7 +24,7 @@ Signed-off-by: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
  Python/sysmodule.c               |  4 ++++
  configure.ac                     | 35 +++++++++++++++++++++++++++++++++++
  setup.py                         |  9 ++++-----
- 12 files changed, 97 insertions(+), 23 deletions(-)
+ 13 files changed, 98 insertions(+), 25 deletions(-)
 
 diff --git a/Include/pythonrun.h b/Include/pythonrun.h
 index 9c2e813..2f79cb6 100644
@@ -61,6 +62,20 @@ index 67db007..b46b45b 100644
          'headers': '$base/include/python$py_version_short$abiflags/$dist_name',
          'scripts': '$base/bin',
          'data'   : '$base',
+diff --git a/Lib/distutils/sysconfig.py b/Lib/distutils/sysconfig.py
+index 573724ddd7..217ec94c37 100644
+--- a/Lib/distutils/sysconfig.py
++++ b/Lib/distutils/sysconfig.py
+@@ -132,8 +132,7 @@ def get_python_lib(plat_specific=0, standard_lib=0, prefix=None):
+             prefix = plat_specific and EXEC_PREFIX or PREFIX
+ 
+     if os.name == "posix":
+-        libpython = os.path.join(prefix,
+-                                 "lib", "python" + get_python_version())
++        libpython = os.path.join(prefix, sys.lib, "python" + get_python_version())
+         if standard_lib:
+             return libpython
+         else:
 diff --git a/Lib/pydoc.py b/Lib/pydoc.py
 index 3ca08c9..6528730 100755
 --- a/Lib/pydoc.py
-- 
2.14.1


