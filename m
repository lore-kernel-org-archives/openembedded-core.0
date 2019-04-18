Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
	[209.85.128.44])
	by mail.openembedded.org (Postfix) with ESMTP id 8C55D7D293
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Apr 2019 15:59:26 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id w15so3466857wmc.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Apr 2019 08:59:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=HdC3mSPSn4io1DD45C/721wSe2UF8hbdhasfg3aZ8+I=;
	b=Lr9fUhSq21SUHeCtbTf8cyiniQE9x8JTJno3x9puqIOg8dZl9npKIJ6OhBUc65b75W
	2U8GpSWm36TUL1rf/rAwmOGO7mtQXoKNFwef138b4JeiEb9mhqTyf8FnwLhxDgDXoUUK
	xEXUKGGTkRgAofx9cW/Bs66/cw6pINdlMAOw7tqWfhGbR91I75iphHBHytQlZ8fkYHpk
	3PGtG2+YtEGim8v5n7iWs5jVNlGSesRHyHimMe3cXi8tXFFRIOoHxtx949bwbr/3YbHX
	FReO/tTRWFp3/m85C2u8koL7j81oAV/RjqUMmN0hlUGPWwOhvMn8wUXV7c06tG7VCFPr
	0iug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=HdC3mSPSn4io1DD45C/721wSe2UF8hbdhasfg3aZ8+I=;
	b=bBa/Di6PrQIxVpjk9Uv0nQAmV+FDmmAps8gK7JI5SS7+9JVi6X8TYQ7U7k/HOfXN8f
	A2UdpeWfqKPtjREKjUe2kb7z3BWnqsw9CBUQkf+moQNnCqUWbFHukw0O3iBYeOmhwYTI
	1Mbn0/bRHLfN5xbZi/YECEBKBQLbTxSoDMZ8q4oh2TKtsUrcQRgqyVpit19G+RVNuuOm
	LyAIg+nvnsjwHIcuVw2U1aeSm8xDtRpFVxPPYTX7AeAT5QnWNSwzzg6y4fJSDRHn4Gx8
	JPI32K12mkQOJJSoNdKox2Dg/QLMC1A8IvxtZYQHSuiZGaT/p8ywd3ymbLPx66CYt7Go
	8ANA==
X-Gm-Message-State: APjAAAWeGNdi7lV7pBLVBsKVCF1CNE/s0qTaSD6HgzLzvuQTVq0GFwCp
	IOUdYBxg4t6TYvjfaLZePSynBA9RI8c=
X-Google-Smtp-Source: APXvYqwMM2+YouLRL6L/KYQLZ6/OMJs8d+uzRMf6wbtbeG2UBBOcZncTw/33R2fB32VybmJYLw00AA==
X-Received: by 2002:a1c:dc09:: with SMTP id t9mr3718274wmg.142.1555603167085; 
	Thu, 18 Apr 2019 08:59:27 -0700 (PDT)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	r196sm1761006wmf.22.2019.04.18.08.59.25
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 18 Apr 2019 08:59:26 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 18 Apr 2019 17:59:17 +0200
Message-Id: <20190418155918.40653-4-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190418155918.40653-1-alex.kanavin@gmail.com>
References: <20190418155918.40653-1-alex.kanavin@gmail.com>
Subject: [PATCH 4/5] meson: do not try to substitute the prefix in python supplied paths
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
X-List-Received-Date: Thu, 18 Apr 2019 15:59:26 -0000

The prefix should be correct in the first place, and substitution breaks
with our custom patched Python.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-devtools/meson/meson.inc         |  1 +
 .../0001-Make-CPU-family-warnings-fatal.patch |  6 +--
 ...y-do-not-substitute-python-s-install.patch | 44 +++++++++++++++++++
 ...pport-building-allarch-recipes-again.patch |  4 +-
 4 files changed, 50 insertions(+), 5 deletions(-)
 create mode 100644 meta/recipes-devtools/meson/meson/0001-modules-python.py-do-not-substitute-python-s-install.patch

diff --git a/meta/recipes-devtools/meson/meson.inc b/meta/recipes-devtools/meson/meson.inc
index 6d743fbe142..21d34da6adf 100644
--- a/meta/recipes-devtools/meson/meson.inc
+++ b/meta/recipes-devtools/meson/meson.inc
@@ -16,6 +16,7 @@ SRC_URI = "https://github.com/mesonbuild/meson/releases/download/${PV}/meson-${P
            file://0001-environment.py-detect-windows-also-if-the-system-str.patch \
            file://0001-mesonbuild-environment.py-do-not-determine-whether-a.patch \
            file://0001-mesonbuild-environment.py-check-environment-for-vari.patch \
+           file://0001-modules-python.py-do-not-substitute-python-s-install.patch \
            "
 SRC_URI[sha256sum] = "2a1bc42dda58206fb922cda5e1ca95cc03ad126321d26acc47d3493ec4e7021f"
 SRC_URI[md5sum] = "433483107fda4616eaf33de7e7083a84"
diff --git a/meta/recipes-devtools/meson/meson/0001-Make-CPU-family-warnings-fatal.patch b/meta/recipes-devtools/meson/meson/0001-Make-CPU-family-warnings-fatal.patch
index 2580b1e366e..9e90b72f313 100644
--- a/meta/recipes-devtools/meson/meson/0001-Make-CPU-family-warnings-fatal.patch
+++ b/meta/recipes-devtools/meson/meson/0001-Make-CPU-family-warnings-fatal.patch
@@ -1,4 +1,4 @@
-From f76d2bf09f7ffd871d068c4ac4c4be083f5fb07f Mon Sep 17 00:00:00 2001
+From 1ec44c955f45f3787aaf92edd70dec5bcf03f665 Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@intel.com>
 Date: Tue, 3 Jul 2018 13:59:09 +0100
 Subject: [PATCH] Make CPU family warnings fatal
@@ -12,7 +12,7 @@ Signed-off-by: Ross Burton <ross.burton@intel.com>
  2 files changed, 2 insertions(+), 4 deletions(-)
 
 diff --git a/mesonbuild/envconfig.py b/mesonbuild/envconfig.py
-index f2510c1..b9841fe 100644
+index 5309ef4..3f0a399 100644
 --- a/mesonbuild/envconfig.py
 +++ b/mesonbuild/envconfig.py
 @@ -178,7 +178,7 @@ class MachineInfo:
@@ -25,7 +25,7 @@ index f2510c1..b9841fe 100644
          endian = literal['endian']
          if endian not in ('little', 'big'):
 diff --git a/mesonbuild/environment.py b/mesonbuild/environment.py
-index 4c1c5ac..a5a7461 100644
+index 3031a82..ecd18d0 100644
 --- a/mesonbuild/environment.py
 +++ b/mesonbuild/environment.py
 @@ -242,9 +242,7 @@ def detect_cpu_family(compilers):
diff --git a/meta/recipes-devtools/meson/meson/0001-modules-python.py-do-not-substitute-python-s-install.patch b/meta/recipes-devtools/meson/meson/0001-modules-python.py-do-not-substitute-python-s-install.patch
new file mode 100644
index 00000000000..a25c392270e
--- /dev/null
+++ b/meta/recipes-devtools/meson/meson/0001-modules-python.py-do-not-substitute-python-s-install.patch
@@ -0,0 +1,44 @@
+From 1d178fb2928d325e339b15972890ceced863d3ec Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex.kanavin@gmail.com>
+Date: Thu, 18 Apr 2019 17:36:11 +0200
+Subject: [PATCH] modules/python.py: do not substitute python's install prefix
+ with meson's
+
+Not sure why this is being done, but it
+a) relies on Python's internal variable substitution which may break in the future
+b) shouldn't be necessary as Python's prefix ought to be correct in the first place
+
+Upstream-Status: Pending
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+---
+ mesonbuild/modules/python.py | 7 +++----
+ 1 file changed, 3 insertions(+), 4 deletions(-)
+
+diff --git a/mesonbuild/modules/python.py b/mesonbuild/modules/python.py
+index 6e2c63b..f5a37ac 100644
+--- a/mesonbuild/modules/python.py
++++ b/mesonbuild/modules/python.py
+@@ -254,7 +254,7 @@ import sysconfig
+ import json
+ import sys
+ 
+-install_paths = sysconfig.get_paths(scheme='posix_prefix', vars={'base': '', 'platbase': '', 'installed_base': ''})
++install_paths = sysconfig.get_paths(scheme='posix_prefix')
+ 
+ def links_against_libpython():
+     from distutils.core import Distribution, Extension
+@@ -279,12 +279,11 @@ class PythonInstallation(ExternalProgramHolder):
+         ExternalProgramHolder.__init__(self, python)
+         self.interpreter = interpreter
+         self.subproject = self.interpreter.subproject
+-        prefix = self.interpreter.environment.coredata.get_builtin_option('prefix')
+         self.variables = info['variables']
+         self.paths = info['paths']
+         install_paths = info['install_paths']
+-        self.platlib_install_path = os.path.join(prefix, install_paths['platlib'][1:])
+-        self.purelib_install_path = os.path.join(prefix, install_paths['purelib'][1:])
++        self.platlib_install_path = install_paths['platlib']
++        self.purelib_install_path = install_paths['purelib']
+         self.version = info['version']
+         self.platform = info['platform']
+         self.is_pypy = info['is_pypy']
diff --git a/meta/recipes-devtools/meson/meson/0002-Support-building-allarch-recipes-again.patch b/meta/recipes-devtools/meson/meson/0002-Support-building-allarch-recipes-again.patch
index f0ea61bac55..323e21d8f6e 100644
--- a/meta/recipes-devtools/meson/meson/0002-Support-building-allarch-recipes-again.patch
+++ b/meta/recipes-devtools/meson/meson/0002-Support-building-allarch-recipes-again.patch
@@ -1,4 +1,4 @@
-From 755902910ad124095c671b3c7f057e6513d9c0c6 Mon Sep 17 00:00:00 2001
+From a4bce582c1f13f48b329526aa81710405c4c691e Mon Sep 17 00:00:00 2001
 From: Peter Kjellerstedt <pkj@axis.com>
 Date: Thu, 26 Jul 2018 16:32:49 +0200
 Subject: [PATCH] Support building allarch recipes again
@@ -13,7 +13,7 @@ Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
  1 file changed, 1 insertion(+)
 
 diff --git a/mesonbuild/envconfig.py b/mesonbuild/envconfig.py
-index b9841fe..9c0487e 100644
+index 3f0a399..4509e09 100644
 --- a/mesonbuild/envconfig.py
 +++ b/mesonbuild/envconfig.py
 @@ -34,6 +34,7 @@ from . import mlog
-- 
2.17.1


