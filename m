Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web11.30.1608142582540215477
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Dec 2020 10:16:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=oJlIHxJv;
 spf=pass (domain: konsulko.com, ip: 209.85.128.51, mailfrom: pbarker@konsulko.com)
Received: by mail-wm1-f51.google.com with SMTP id 190so3263376wmz.0
        for <openembedded-core@lists.openembedded.org>; Wed, 16 Dec 2020 10:16:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=uWPdGuJyoINw/UPkw6sJ9kCk29NwY8xFy/M7ax0eJiQ=;
        b=oJlIHxJv/Bjha1IaY9GBUeccGjbvpuWZqPBpFsh3J5ydpFFsP1QnnGdVp5EJ5Uiq/1
         RWd7978v1qoq+yRKO83IoEbTYLjhisv0D2P0jZwTkpBOA9vgHCm2v2vEQZrX0g9ygKq9
         X8TEiaFnnxf+qkJXELUKZncUd181tY6U989p4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=uWPdGuJyoINw/UPkw6sJ9kCk29NwY8xFy/M7ax0eJiQ=;
        b=U2S9KKgA41Vv6dkySwU7Crqz8NX/LKQKiL9u+Lr1z0lVfM07Z8Aa92fuKUv1Oy5kxe
         D7ozxJ9P31rxU1vGVe27fuAdIbcupeSj9zsUiUt42/dQJNlinnqe4gMl8yR3kM2wS3UE
         taSFnkhIh5HyG9ykgdD0JOcdJeWMErT2R4IrRbBt1QcjemXUw0M1R4WgeHVB4USr+h85
         mG8zrzXwangFaJFWQ7xlWHFZWlY8Pk8XracavlXoM0FuXXMVHz0IIX1xjaorx+nP6xWN
         fNOjw97BVoUE7+zOYw96GucXtvxRWu9bwOtv8WstxHaXfltCIQLFZX+VYK3gF9dStlnd
         8ilA==
X-Gm-Message-State: AOAM531VrtASGB4EJ1avDM0s1GhzTdY4gYXYUUFBu/tGHn9UfAQmFirp
	9QlrUdQPjhsS1FRE+H/08tC2R4IAcviQfQ==
X-Google-Smtp-Source: ABdhPJzCRxbM6+nMFtNnYtGl2jz0ilCrp9SdYFeWOtHrh9JI0IjnaTcb/Q6VepCUPtRzP8j55wKlNw==
X-Received: by 2002:a7b:c3d1:: with SMTP id t17mr4500726wmj.11.1608142580614;
        Wed, 16 Dec 2020 10:16:20 -0800 (PST)
Return-Path: <pbarker@konsulko.com>
Received: from alpha.home.b5net.uk (cpc76148-clif11-2-0-cust524.12-4.cable.virginm.net. [82.1.54.13])
        by smtp.gmail.com with ESMTPSA id c1sm3603496wml.8.2020.12.16.10.16.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Dec 2020 10:16:20 -0800 (PST)
From: "Paul Barker" <pbarker@konsulko.com>
To: openembedded-core@lists.openembedded.org,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Paul Barker <pbarker@konsulko.com>
Subject: [PATCH] bitbake.conf: Prevent pyc file generation in pseudo context
Date: Wed, 16 Dec 2020 18:16:16 +0000
Message-Id: <20201216181616.32727-1-pbarker@konsulko.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

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
index 0d38eac094..4ce224a90c 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -685,13 +685,13 @@ SRC_URI = ""
 PSEUDO_LOCALSTATEDIR ?= "${WORKDIR}/pseudo/"
 PSEUDO_PASSWD ?= "${STAGING_DIR_TARGET}:${PSEUDO_SYSROOT}"
 PSEUDO_SYSROOT = "${COMPONENTS_DIR}/${BUILD_ARCH}/pseudo-native"
-PSEUDO_IGNORE_PATHS = "/usr/,/etc/,/lib,/dev/,${T},${WORKDIR}/recipe-sysroot,${SSTATE_DIR},${STAMPS_DIR},${WORKDIR}/pkgdata-sysroot,${TMPDIR}/sstate-control,${DEPLOY_DIR},${WORKDIR}/deploy-,${TMPDIR}/buildstats,${WORKDIR}/sstate-build-package_,${WORKDIR}/sstate-install-package_,${WORKDIR}/sstate-build-image_complete,${TMPDIR}/sysroots-components,${BUILDHISTORY_DIR},${TMPDIR}/pkgdata,${TOPDIR}/cache,${COREBASE}/scripts,${COREBASE}/meta,${CCACHE_DIR}"
+PSEUDO_IGNORE_PATHS = "/usr/,/etc/,/lib,/dev/,${T},${WORKDIR}/recipe-sysroot,${SSTATE_DIR},${STAMPS_DIR},${WORKDIR}/pkgdata-sysroot,${TMPDIR}/sstate-control,${DEPLOY_DIR},${WORKDIR}/deploy-,${TMPDIR}/buildstats,${WORKDIR}/sstate-build-package_,${WORKDIR}/sstate-install-package_,${WORKDIR}/sstate-build-image_complete,${TMPDIR}/sysroots-components,${BUILDHISTORY_DIR},${TMPDIR}/pkgdata,${TOPDIR}/cache,${COREBASE}/scripts,${CCACHE_DIR}"
 
 export PSEUDO_DISABLED = "1"
 #export PSEUDO_PREFIX = "${STAGING_DIR_NATIVE}${prefix_native}"
 #export PSEUDO_BINDIR = "${STAGING_DIR_NATIVE}${bindir_native}"
 #export PSEUDO_LIBDIR = "${STAGING_DIR_NATIVE}$PSEUDOBINDIR/../lib/pseudo/lib
-FAKEROOTBASEENV = "PSEUDO_BINDIR=${PSEUDO_SYSROOT}${bindir_native} PSEUDO_LIBDIR=${PSEUDO_SYSROOT}${prefix_native}/lib/pseudo/lib PSEUDO_PREFIX=${PSEUDO_SYSROOT}${prefix_native} PSEUDO_IGNORE_PATHS=${PSEUDO_IGNORE_PATHS} PSEUDO_DISABLED=1"
+FAKEROOTBASEENV = "PSEUDO_BINDIR=${PSEUDO_SYSROOT}${bindir_native} PSEUDO_LIBDIR=${PSEUDO_SYSROOT}${prefix_native}/lib/pseudo/lib PSEUDO_PREFIX=${PSEUDO_SYSROOT}${prefix_native} PSEUDO_IGNORE_PATHS=${PSEUDO_IGNORE_PATHS} PSEUDO_DISABLED=1 PYTHONDONTWRITEBYTECODE=1"
 FAKEROOTCMD = "${PSEUDO_SYSROOT}${bindir_native}/pseudo"
 FAKEROOTENV = "PSEUDO_PREFIX=${PSEUDO_SYSROOT}${prefix_native} PSEUDO_LOCALSTATEDIR=${PSEUDO_LOCALSTATEDIR} PSEUDO_PASSWD=${PSEUDO_PASSWD} PSEUDO_NOSYMLINKEXP=1 PSEUDO_IGNORE_PATHS=${PSEUDO_IGNORE_PATHS} PSEUDO_DISABLED=0"
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
2.26.2

