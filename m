Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id 8BE206D666
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Oct 2019 11:18:56 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id j18so7368577wrq.10
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Oct 2019 04:18:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=UbVPcpALdilDbEY6SlG0r0kJBsyog7me411K8oPFhdY=;
	b=ZPqmAy5IrTay95eW9wavpcPrnbTzv55i2s6fbpPn96D62KTPMNxMC4mYLPXMu2S6C8
	gADwZGli1wUdp0nITaOm1siWRUoLZOG9vh2UJHJzBlffFjeIWp+gidCJf7NHzF/B/6mQ
	EjGsdZrvfQP7IxF4zMqcZRTmxn63Ptk/Lg+DhBaPdab56hgAfqvP2EQc3K7h842YOayj
	cvOjBaTQ4sLd+8fmYxSBkuuHv3sNx3SfgMm7qjk1l6A5MLbBHxZ88qe8rjHA3kXrBHBF
	2sYP2PmjBK6Qhji0cyefmqjk0SVeoGWuxateY+i6nOXDVcQggjjgNDnjFilwGsbscsWT
	rzpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=UbVPcpALdilDbEY6SlG0r0kJBsyog7me411K8oPFhdY=;
	b=NfOgdkzbiy+JNw4dSwRPMuPEWddSqwm6jBJgTp31F5sqtlsQglYLqp24FKsqtnU6TO
	kt8h3ZVEp7D7IEuPi2YGHQGwkmsPNhkMcjaZ3gQYb9L9D81ceDQ2hsRC1FU/r0N30JI1
	AboIPeAp/R/GGzZxqmJWJqPX7fG0zch09TfAkRX2kcd70t/vL/5Tul7aubL1/CdVyrHL
	XGRnejMufap9Rbion0a+Wc3ArZt32pLTU6QtLGkGhybY4L6Z3SpeLfDsZRqUhHJEJFx6
	f2BRAcsCP8asHPKW+BaTQlcSmY2/iddJYxJ3wwMXz5xa0rGirP2/jhxOT67q28pk3jL8
	SrLQ==
X-Gm-Message-State: APjAAAXfQ0qc5JiNZ3rjGBZ/WgrOg8QWPGOl3OK8nNnlQ5WtRSWssjou
	ItDhYkHhDD4IIaBaYJidlJ0RSMaKXYE=
X-Google-Smtp-Source: APXvYqwH6sRIUhjT4vl18leyWNPxzpomBTL5neqIsslFWYgUfol0Q+4qTUWCDifg3qoCj2RdR5tFXA==
X-Received: by 2002:a5d:674e:: with SMTP id l14mr7732012wrw.45.1570706337082; 
	Thu, 10 Oct 2019 04:18:57 -0700 (PDT)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	l13sm5831372wmj.25.2019.10.10.04.18.56
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 10 Oct 2019 04:18:56 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 10 Oct 2019 13:18:41 +0200
Message-Id: <20191010111848.3825-3-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191010111848.3825-1-alex.kanavin@gmail.com>
References: <20191010111848.3825-1-alex.kanavin@gmail.com>
Subject: [PATCH 03/10] python3: make gdbm optional
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
X-List-Received-Date: Thu, 10 Oct 2019 11:18:56 -0000

The use case is building a gpl3-free image, without having
to rely on outdated recipes from meta-gplv2 layer.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 ...fig-append-STAGING_LIBDIR-python-sys.patch | 10 +++---
 ...ON3HOME-is-set-use-instead-of-PYTHON.patch | 10 +++---
 ...report-missing-dependencies-for-disa.patch | 31 +++++++++++++++++++
 ...tutils-prefix-is-inside-staging-area.patch |  2 +-
 meta/recipes-devtools/python/python3_3.7.4.bb | 22 +++++++++----
 5 files changed, 57 insertions(+), 18 deletions(-)
 create mode 100644 meta/recipes-devtools/python/python3/0017-setup.py-do-not-report-missing-dependencies-for-disa.patch

diff --git a/meta/recipes-devtools/python/python3/0001-distutils-sysconfig-append-STAGING_LIBDIR-python-sys.patch b/meta/recipes-devtools/python/python3/0001-distutils-sysconfig-append-STAGING_LIBDIR-python-sys.patch
index 1741f5753b4..1709011be8a 100644
--- a/meta/recipes-devtools/python/python3/0001-distutils-sysconfig-append-STAGING_LIBDIR-python-sys.patch
+++ b/meta/recipes-devtools/python/python3/0001-distutils-sysconfig-append-STAGING_LIBDIR-python-sys.patch
@@ -1,4 +1,4 @@
-From 17796e353acf08acd604610f34840a4a9d2f4b54 Mon Sep 17 00:00:00 2001
+From eff903c600f4c40f5753e95ab1557126fc6e0c9c Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Thu, 31 Jan 2019 16:46:30 +0100
 Subject: [PATCH] distutils/sysconfig: append
@@ -15,10 +15,10 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  2 files changed, 4 insertions(+)
 
 diff --git a/Lib/distutils/sysconfig.py b/Lib/distutils/sysconfig.py
-index e07a6c8..6b8c129 100644
+index 0a034ee..3dfd0a3 100644
 --- a/Lib/distutils/sysconfig.py
 +++ b/Lib/distutils/sysconfig.py
-@@ -421,6 +421,8 @@ def _init_posix():
+@@ -439,6 +439,8 @@ def _init_posix():
          platform=sys.platform,
          multiarch=getattr(sys.implementation, '_multiarch', ''),
      ))
@@ -28,10 +28,10 @@ index e07a6c8..6b8c129 100644
      build_time_vars = _temp.build_time_vars
      global _config_vars
 diff --git a/Lib/sysconfig.py b/Lib/sysconfig.py
-index 9ee4d31..e586abd 100644
+index 87fa5e6..756a41c 100644
 --- a/Lib/sysconfig.py
 +++ b/Lib/sysconfig.py
-@@ -412,6 +412,8 @@ def _init_posix(vars):
+@@ -419,6 +419,8 @@ def _init_posix(vars):
      """Initialize the module as appropriate for POSIX systems."""
      # _sysconfigdata is generated at build time, see _generate_posix_vars()
      name = _get_sysconfigdata_name()
diff --git a/meta/recipes-devtools/python/python3/0001-main.c-if-OEPYTHON3HOME-is-set-use-instead-of-PYTHON.patch b/meta/recipes-devtools/python/python3/0001-main.c-if-OEPYTHON3HOME-is-set-use-instead-of-PYTHON.patch
index a0ed7cc830e..a146c747f83 100644
--- a/meta/recipes-devtools/python/python3/0001-main.c-if-OEPYTHON3HOME-is-set-use-instead-of-PYTHON.patch
+++ b/meta/recipes-devtools/python/python3/0001-main.c-if-OEPYTHON3HOME-is-set-use-instead-of-PYTHON.patch
@@ -1,4 +1,4 @@
-From ffe7797637f08cd6ee4c82e2d67462c5e194d30a Mon Sep 17 00:00:00 2001
+From 5ce3ac59531828ff682646fbba59b2126b28a8aa Mon Sep 17 00:00:00 2001
 From: Jaewon Lee <jaewon.lee@xilinx.com>
 Date: Thu, 25 Apr 2019 15:34:26 -0700
 Subject: [PATCH] main.c: if OEPYTHON3HOME is set use instead of PYTHONHOME
@@ -12,15 +12,16 @@ to set a different path for python3
 Signed-off-by: Jaewon Lee <jaewon.lee@xilinx.com>
 
 Upstream-Status: Inappropriate [OE specific configuration]
+
 ---
  Modules/main.c | 17 +++++++++++++----
  1 file changed, 13 insertions(+), 4 deletions(-)
 
 diff --git a/Modules/main.c b/Modules/main.c
-index a745381..b553e30 100644
+index acc59c6..407085a 100644
 --- a/Modules/main.c
 +++ b/Modules/main.c
-@@ -1855,10 +1855,19 @@ config_init_home(_PyCoreConfig *config)
+@@ -1834,10 +1834,19 @@ config_init_home(_PyCoreConfig *config)
          }
          return _Py_INIT_OK();
      }
@@ -44,6 +45,3 @@ index a745381..b553e30 100644
      }
      config->home = home;
      return _Py_INIT_OK();
--- 
-2.7.4
-
diff --git a/meta/recipes-devtools/python/python3/0017-setup.py-do-not-report-missing-dependencies-for-disa.patch b/meta/recipes-devtools/python/python3/0017-setup.py-do-not-report-missing-dependencies-for-disa.patch
new file mode 100644
index 00000000000..c15295c034c
--- /dev/null
+++ b/meta/recipes-devtools/python/python3/0017-setup.py-do-not-report-missing-dependencies-for-disa.patch
@@ -0,0 +1,31 @@
+From e3b59cb9658e1d3efa3535840939a0fa92a70a5a Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex.kanavin@gmail.com>
+Date: Mon, 7 Oct 2019 13:22:14 +0200
+Subject: [PATCH] setup.py: do not report missing dependencies for disabled
+ modules
+
+Reporting those missing dependencies is misleading as the modules would not
+have been built anyway. This particularly matters in oe-core's automated
+build completeness checker which relies on the report.
+
+Upstream-Status: Inappropriate [oe-core specific]
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+---
+ setup.py | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/setup.py b/setup.py
+index 4b53668..0097643 100644
+--- a/setup.py
++++ b/setup.py
+@@ -365,6 +365,10 @@ class PyBuildExt(build_ext):
+                 print("%-*s   %-*s   %-*s" % (longest, e, longest, f,
+                                               longest, g))
+ 
++        # There is no need to report missing module dependencies,
++        # if the modules have been disabled in the first place.
++        missing = list(set(missing) - set(sysconf_dis))
++
+         if missing:
+             print()
+             print("Python build finished successfully!")
diff --git a/meta/recipes-devtools/python/python3/12-distutils-prefix-is-inside-staging-area.patch b/meta/recipes-devtools/python/python3/12-distutils-prefix-is-inside-staging-area.patch
index 0bafec73c0c..d49604ba4d9 100644
--- a/meta/recipes-devtools/python/python3/12-distutils-prefix-is-inside-staging-area.patch
+++ b/meta/recipes-devtools/python/python3/12-distutils-prefix-is-inside-staging-area.patch
@@ -1,4 +1,4 @@
-From 6229502e5ae6cbb22240594f002638e9ef78f831 Mon Sep 17 00:00:00 2001
+From a274ba778838824efcacaba57c415b7262f779ec Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Tue, 14 May 2013 15:00:26 -0700
 Subject: [PATCH] python3: Add target and native recipes
diff --git a/meta/recipes-devtools/python/python3_3.7.4.bb b/meta/recipes-devtools/python/python3_3.7.4.bb
index 8693c446c25..58e2fa5abff 100644
--- a/meta/recipes-devtools/python/python3_3.7.4.bb
+++ b/meta/recipes-devtools/python/python3_3.7.4.bb
@@ -23,11 +23,12 @@ SRC_URI = "http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz \
            file://0003-setup.py-pass-missing-libraries-to-Extension-for-mul.patch \
            file://0001-Lib-sysconfig.py-fix-another-place-where-lib-is-hard.patch \
            file://0001-Makefile-fix-Issue36464-parallel-build-race-problem.patch \
-	   file://0001-bpo-36852-proper-detection-of-mips-architecture-for-.patch \
-	   file://crosspythonpath.patch \
+           file://0001-bpo-36852-proper-detection-of-mips-architecture-for-.patch \
+           file://crosspythonpath.patch \
            file://reformat_sysconfig.py \
            file://0001-Use-FLAG_REF-always-for-interned-strings.patch \
            file://0001-test_locale.py-correct-the-test-output-format.patch \
+           file://0017-setup.py-do-not-report-missing-dependencies-for-disa.patch \
            "
 
 SRC_URI_append_class-native = " \
@@ -62,7 +63,7 @@ ALTERNATIVE_LINK_NAME[python-config] = "${bindir}/python${PYTHON_BINABI}-config"
 ALTERNATIVE_TARGET[python-config] = "${bindir}/python${PYTHON_BINABI}-config-${MULTILIB_SUFFIX}"
 
 
-DEPENDS = "bzip2-replacement-native libffi bzip2 gdbm openssl sqlite3 zlib virtual/libintl xz virtual/crypt util-linux libtirpc libnsl2"
+DEPENDS = "bzip2-replacement-native libffi bzip2 openssl sqlite3 zlib virtual/libintl xz virtual/crypt util-linux libtirpc libnsl2"
 DEPENDS_append_class-target = " python3-native"
 DEPENDS_append_class-nativesdk = " python3-native"
 
@@ -87,13 +88,22 @@ python() {
         d.setVar('PACKAGECONFIG_PGO', '')
 }
 
-PACKAGECONFIG_class-target ??= "readline ${PACKAGECONFIG_PGO}"
-PACKAGECONFIG_class-native ??= "readline"
-PACKAGECONFIG_class-nativesdk ??= "readline"
+PACKAGECONFIG_class-target ??= "readline ${PACKAGECONFIG_PGO} gdbm"
+PACKAGECONFIG_class-native ??= "readline gdbm"
+PACKAGECONFIG_class-nativesdk ??= "readline gdbm"
 PACKAGECONFIG[readline] = ",,readline"
 # Use profile guided optimisation by running PyBench inside qemu-user
 PACKAGECONFIG[pgo] = "--enable-optimizations,,qemu-native"
 PACKAGECONFIG[tk] = ",,tk"
+PACKAGECONFIG[gdbm] = ",,gdbm"
+
+do_configure_prepend () {
+    mkdir -p ${B}/Modules
+    cat > ${B}/Modules/Setup.local << EOF
+*disabled*
+${@bb.utils.contains('PACKAGECONFIG', 'gdbm', '', '_gdbm _dbm', d)}
+EOF
+}
 
 CPPFLAGS_append = " -I${STAGING_INCDIR}/ncursesw -I${STAGING_INCDIR}/uuid"
 
-- 
2.17.1


