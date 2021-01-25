Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
 by mx.groups.io with SMTP id smtpd.web12.360.1611586401726990423
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Jan 2021 06:53:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=FvSs6Dw4;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.47, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f47.google.com with SMTP id gx1so3176557pjb.1
        for <openembedded-core@lists.openembedded.org>; Mon, 25 Jan 2021 06:53:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=ea6+coAJMwM7HS/x6AVJXTkSr1ySygQ/YCclgsmRirY=;
        b=FvSs6Dw4PN/3MR7O1BsqdLrK/hEZQfFhWLw0Mkjqngt+ViyCvYOo4+za61clSHnTbt
         SV4zoLjcqCa5ilC8VCmmU3Gnj9g4mUIZcKEAIyPiQsB74BD/Ufp4htihz3PKs/BrlzME
         SCCrCnquloSUXDEZqGcOKNwTQjOyI55vUkRt/TVXej48eQdrBwsnfYFctLJr619ZWECQ
         RAwUZSEArOl73O9qitw3uJtTfTILqXv+VVhNxuJCa0RYqDiVErqTMR/f0lNBwypLulH3
         N6QGilefO+SSpfLvYRKYEs0KX3d31qIbzxbgtu80x2pD0YJmfa4akqTcMvupNNh9PaXv
         xPNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ea6+coAJMwM7HS/x6AVJXTkSr1ySygQ/YCclgsmRirY=;
        b=cPby8YNwtki1b5nJObWnMfbL2yqbkP+h2Nf+yfhybI0r5k4NgZqHPRauusZScwm4GC
         B/U8vukK8NFYiqh5u8N6aUpbDN8BIeRwltik7bIkuNMAd/QyRuXys/9ebSgOaTJOOooW
         xcNRXVolaFomKePeZ+onch1hO9g/0OSA0KRW4e+jHsHj+LvbHTeuDqBBn+jogjVGWGwT
         HFFZu0Z6ReQZY6Ju1KA5UAemIfcaM7vSkCWChR8KPUXQ4RuauinVA77yL0cY03df58Bs
         5H4TimDXHAsvAYaXuRXoW4T59bwnU52oCt9k+Rta5JSMILIMezZcaeFllZvWBj7Ja2CR
         ehMQ==
X-Gm-Message-State: AOAM531fhKvgVfDmgcFsDqPnctMx0U6VL8UaZa6WszXmjh62juBPHMdN
	79eVPAapCNCLyhZ/phMi6CzpcAmlGOW3XxuNEvA=
X-Google-Smtp-Source: ABdhPJwO7vBbMqRyKY9loBE6I7orJQ8OmqIoXkHt4BLsIqWc4f5CgAlAQ/xKSY1Z7CgV0NtuxQRMyA==
X-Received: by 2002:a17:90b:17c7:: with SMTP id me7mr532280pjb.205.1611586400709;
        Mon, 25 Jan 2021 06:53:20 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from hexa.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id x8sm17574354pfn.27.2021.01.25.06.53.19
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Jan 2021 06:53:20 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 35/47] bitbake.conf: Prevent pyc file generation in pseudo context
Date: Mon, 25 Jan 2021 04:51:07 -1000
Message-Id: <ce36c8d70a6cf44e5426efddddd5980bdd4065a4.1611585425.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1611585425.git.steve@sakoman.com>
References: <cover.1611585425.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Paul Barker <pbarker@konsulko.com>

This also effectively reverts commit b6d30c21b0:
    bitbake.conf: Extend PSEUDO_IGNORE_PATHS to ${COREBASE}/meta

The contents of ${COREBASE}/meta were ignored as pyc files could be
generated for the contents of the lib subdirectory if python modules
were imported within a pseudo context. However this doesn't protect us
from pyc files being generated in the lib directories for other layers.
It's far better to tell python not to produce pyc files when running
under pseudo (by setting the PYTHONDONTWRITEBYTECODE variable) as this
will cover any location where pyc files could possibly be created. This
variable is set in FAKEROOTBASEENV so that it applies to the
bitbake-worker instance for fakeroot tasks, preventing pyc files from
being generated for imports in python tasks themselves.

Also add a test case to ensure that pyc files are not created in tasks
which are executed under pseudo.

Signed-off-by: Paul Barker <pbarker@konsulko.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 73d538f20743017a44cea4c20dbe09a0327cfc71)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta-selftest/lib/pseudo_pyc_test1.py         |  1 +
 meta-selftest/lib/pseudo_pyc_test2.py         |  1 +
 .../pseudo-pyc-test/pseudo-pyc-test.bb        | 15 +++++++++++
 meta/conf/bitbake.conf                        |  4 +--
 meta/lib/oeqa/selftest/cases/pseudo.py        | 27 +++++++++++++++++++
 5 files changed, 46 insertions(+), 2 deletions(-)
 create mode 100644 meta-selftest/lib/pseudo_pyc_test1.py
 create mode 100644 meta-selftest/lib/pseudo_pyc_test2.py
 create mode 100644 meta-selftest/recipes-test/pseudo-pyc-test/pseudo-pyc-test.bb
 create mode 100644 meta/lib/oeqa/selftest/cases/pseudo.py

diff --git a/meta-selftest/lib/pseudo_pyc_test1.py b/meta-selftest/lib/pseudo_pyc_test1.py
new file mode 100644
index 0000000000..b59abdd536
--- /dev/null
+++ b/meta-selftest/lib/pseudo_pyc_test1.py
@@ -0,0 +1 @@
+STRING = "pseudo_pyc_test1"
diff --git a/meta-selftest/lib/pseudo_pyc_test2.py b/meta-selftest/lib/pseudo_pyc_test2.py
new file mode 100644
index 0000000000..fb67a978e0
--- /dev/null
+++ b/meta-selftest/lib/pseudo_pyc_test2.py
@@ -0,0 +1 @@
+STRING = "pseudo_pyc_test2"
diff --git a/meta-selftest/recipes-test/pseudo-pyc-test/pseudo-pyc-test.bb b/meta-selftest/recipes-test/pseudo-pyc-test/pseudo-pyc-test.bb
new file mode 100644
index 0000000000..12dc91a8f3
--- /dev/null
+++ b/meta-selftest/recipes-test/pseudo-pyc-test/pseudo-pyc-test.bb
@@ -0,0 +1,15 @@
+SUMMARY = "pseudo env test"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
+
+INHIBIT_DEFAULT_DEPS = "1"
+
+python do_compile() {
+    import pseudo_pyc_test1
+    print(pseudo_pyc_test1.STRING)
+}
+
+python do_install() {
+    import pseudo_pyc_test2
+    print(pseudo_pyc_test2.STRING)
+}
diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 94a643ccc7..9257987f2a 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -686,13 +686,13 @@ SRC_URI = ""
 PSEUDO_LOCALSTATEDIR ?= "${WORKDIR}/pseudo/"
 PSEUDO_PASSWD ?= "${STAGING_DIR_TARGET}:${PSEUDO_SYSROOT}"
 PSEUDO_SYSROOT = "${COMPONENTS_DIR}/${BUILD_ARCH}/pseudo-native"
-PSEUDO_IGNORE_PATHS = "/usr/,/etc/,/lib,/dev/,${T},${WORKDIR}/recipe-sysroot,${SSTATE_DIR},${STAMPS_DIR},${WORKDIR}/pkgdata-sysroot,${TMPDIR}/sstate-control,${DEPLOY_DIR},${WORKDIR}/deploy-,${TMPDIR}/buildstats,${WORKDIR}/sstate-build-package_,${WORKDIR}/sstate-install-package_,${WORKDIR}/sstate-build-image_complete,${TMPDIR}/sysroots-components,${BUILDHISTORY_DIR},${TMPDIR}/pkgdata,${TOPDIR}/cache,${COREBASE}/scripts,${COREBASE}/meta,${CCACHE_DIR}"
+PSEUDO_IGNORE_PATHS = "/usr/,/etc/,/lib,/dev/,${T},${WORKDIR}/recipe-sysroot,${SSTATE_DIR},${STAMPS_DIR},${WORKDIR}/pkgdata-sysroot,${TMPDIR}/sstate-control,${DEPLOY_DIR},${WORKDIR}/deploy-,${TMPDIR}/buildstats,${WORKDIR}/sstate-build-package_,${WORKDIR}/sstate-install-package_,${WORKDIR}/sstate-build-image_complete,${TMPDIR}/sysroots-components,${BUILDHISTORY_DIR},${TMPDIR}/pkgdata,${TOPDIR}/cache,${COREBASE}/scripts,${CCACHE_DIR}"
 
 export PSEUDO_DISABLED = "1"
 #export PSEUDO_PREFIX = "${STAGING_DIR_NATIVE}${prefix_native}"
 #export PSEUDO_BINDIR = "${STAGING_DIR_NATIVE}${bindir_native}"
 #export PSEUDO_LIBDIR = "${STAGING_DIR_NATIVE}$PSEUDOBINDIR/../lib/pseudo/lib
-FAKEROOTBASEENV = "PSEUDO_BINDIR=${PSEUDO_SYSROOT}${bindir_native} PSEUDO_LIBDIR=${PSEUDO_SYSROOT}${prefix_native}/lib/pseudo/lib PSEUDO_PREFIX=${PSEUDO_SYSROOT}${prefix_native} PSEUDO_IGNORE_PATHS=${@oe.path.canonicalize(d.getVar('PSEUDO_IGNORE_PATHS'))} PSEUDO_DISABLED=1"
+FAKEROOTBASEENV = "PSEUDO_BINDIR=${PSEUDO_SYSROOT}${bindir_native} PSEUDO_LIBDIR=${PSEUDO_SYSROOT}${prefix_native}/lib/pseudo/lib PSEUDO_PREFIX=${PSEUDO_SYSROOT}${prefix_native} PSEUDO_IGNORE_PATHS=${@oe.path.canonicalize(d.getVar('PSEUDO_IGNORE_PATHS'))} PSEUDO_DISABLED=1 PYTHONDONTWRITEBYTECODE=1"
 FAKEROOTCMD = "${PSEUDO_SYSROOT}${bindir_native}/pseudo"
 FAKEROOTENV = "PSEUDO_PREFIX=${PSEUDO_SYSROOT}${prefix_native} PSEUDO_LOCALSTATEDIR=${PSEUDO_LOCALSTATEDIR} PSEUDO_PASSWD=${PSEUDO_PASSWD} PSEUDO_NOSYMLINKEXP=1 PSEUDO_IGNORE_PATHS=${@oe.path.canonicalize(d.getVar('PSEUDO_IGNORE_PATHS'))} PSEUDO_DISABLED=0"
 FAKEROOTNOENV = "PSEUDO_UNLOAD=1"
diff --git a/meta/lib/oeqa/selftest/cases/pseudo.py b/meta/lib/oeqa/selftest/cases/pseudo.py
new file mode 100644
index 0000000000..33593d5ce9
--- /dev/null
+++ b/meta/lib/oeqa/selftest/cases/pseudo.py
@@ -0,0 +1,27 @@
+#
+# SPDX-License-Identifier: MIT
+#
+
+import glob
+import os
+import shutil
+from oeqa.utils.commands import bitbake, get_test_layer
+from oeqa.selftest.case import OESelftestTestCase
+
+class Pseudo(OESelftestTestCase):
+
+    def test_pseudo_pyc_creation(self):
+        self.write_config("")
+
+        metaselftestpath = get_test_layer()
+        pycache_path = os.path.join(metaselftestpath, 'lib/__pycache__')
+        if os.path.exists(pycache_path):
+            shutil.rmtree(pycache_path)
+
+        bitbake('pseudo-pyc-test -c install')
+
+        test1_pyc_present = len(glob.glob(os.path.join(pycache_path, 'pseudo_pyc_test1.*.pyc')))
+        self.assertTrue(test1_pyc_present, 'test1 pyc file missing, should be created outside of pseudo context.')
+
+        test2_pyc_present = len(glob.glob(os.path.join(pycache_path, 'pseudo_pyc_test2.*.pyc')))
+        self.assertFalse(test2_pyc_present, 'test2 pyc file present, should not be created in pseudo context.')
-- 
2.25.1

