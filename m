Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 2115D60939
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Aug 2017 11:48:27 +0000 (UTC)
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	07 Aug 2017 04:48:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.41,337,1498546800"; d="scan'208";a="136607096"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by fmsmga005.fm.intel.com with ESMTP; 07 Aug 2017 04:48:28 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  7 Aug 2017 14:44:58 +0300
Message-Id: <20170807114504.28410-1-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.13.2
Subject: [PATCH 1/7] dnf: update to 2.6.3
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
X-List-Received-Date: Mon, 07 Aug 2017 11:48:28 -0000

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 ...ever-check-after-the-etc-dnf-vars-substit.patch | 37 ----------------------
 .../dnf/0030-Run-python-scripts-using-env.patch    | 13 +-------
 .../dnf/{dnf_2.5.1.bb => dnf_2.6.3.bb}             |  3 +-
 3 files changed, 2 insertions(+), 51 deletions(-)
 delete mode 100644 meta/recipes-devtools/dnf/dnf/0001-Move-releasever-check-after-the-etc-dnf-vars-substit.patch
 rename meta/recipes-devtools/dnf/{dnf_2.5.1.bb => dnf_2.6.3.bb} (94%)

diff --git a/meta/recipes-devtools/dnf/dnf/0001-Move-releasever-check-after-the-etc-dnf-vars-substit.patch b/meta/recipes-devtools/dnf/dnf/0001-Move-releasever-check-after-the-etc-dnf-vars-substit.patch
deleted file mode 100644
index daf058bbae7..00000000000
--- a/meta/recipes-devtools/dnf/dnf/0001-Move-releasever-check-after-the-etc-dnf-vars-substit.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From 3d0cdd8af1b415712eeb00e377c307001684ad06 Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex.kanavin@gmail.com>
-Date: Wed, 21 Jun 2017 15:35:20 +0300
-Subject: [PATCH] Move releasever check after the etc/dnf/vars substitutions.
-
-The substitutions may actually set the releasever correctly,
-and so the check is premature.
-
-Upstream-Status: Submitted [https://github.com/rpm-software-management/dnf/pull/868]
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
----
- dnf/cli/cli.py | 6 +++---
- 1 file changed, 3 insertions(+), 3 deletions(-)
-
-diff --git a/dnf/cli/cli.py b/dnf/cli/cli.py
-index c53c2a52..f9f2c13a 100644
---- a/dnf/cli/cli.py
-+++ b/dnf/cli/cli.py
-@@ -882,12 +882,12 @@ class Cli(object):
-             releasever = dnf.rpm.detect_releasever(conf.installroot)
-         elif releasever == '/':
-             releasever = dnf.rpm.detect_releasever(releasever)
--        if releasever is None:
--            logger.warning(_("Unable to detect release version (use '--releasever' to specify "
--                             "release version)"))
-         conf.releasever = releasever
-         subst = conf.substitutions
-         subst.update_from_etc(conf.installroot)
-+        if releasever is None:
-+            logger.warning(_("Unable to detect release version (use '--releasever' to specify "
-+                             "release version)"))
- 
-         for opt in ('cachedir', 'logdir', 'persistdir'):
-             conf.prepend_installroot(opt)
--- 
-2.11.0
-
diff --git a/meta/recipes-devtools/dnf/dnf/0030-Run-python-scripts-using-env.patch b/meta/recipes-devtools/dnf/dnf/0030-Run-python-scripts-using-env.patch
index 61328e6ec5b..1abd880da9b 100644
--- a/meta/recipes-devtools/dnf/dnf/0030-Run-python-scripts-using-env.patch
+++ b/meta/recipes-devtools/dnf/dnf/0030-Run-python-scripts-using-env.patch
@@ -10,8 +10,7 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
 ---
  bin/dnf-automatic.in | 2 +-
  bin/dnf.in           | 2 +-
- bin/yum.in           | 2 +-
- 3 files changed, 3 insertions(+), 3 deletions(-)
+ 2 files changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/bin/dnf-automatic.in b/bin/dnf-automatic.in
 index 5b06aa26..9f6f703e 100755
@@ -33,16 +32,6 @@ index 645d0f06..ab141abd 100755
  # The dnf executable script.
  #
  # Copyright (C) 2012-2016 Red Hat, Inc.
-diff --git a/bin/yum.in b/bin/yum.in
-index f1fee071..013dc8c5 100755
---- a/bin/yum.in
-+++ b/bin/yum.in
-@@ -1,4 +1,4 @@
--#!@PYTHON_EXECUTABLE@
-+#!/usr/bin/env python3
- # The dnf executable script.
- #
- # Copyright (C) 2016 Red Hat, Inc.
 -- 
 2.11.0
 
diff --git a/meta/recipes-devtools/dnf/dnf_2.5.1.bb b/meta/recipes-devtools/dnf/dnf_2.6.3.bb
similarity index 94%
rename from meta/recipes-devtools/dnf/dnf_2.5.1.bb
rename to meta/recipes-devtools/dnf/dnf_2.6.3.bb
index cdc2a8549fb..ade55ea0a80 100644
--- a/meta/recipes-devtools/dnf/dnf_2.5.1.bb
+++ b/meta/recipes-devtools/dnf/dnf_2.6.3.bb
@@ -5,7 +5,6 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                    "
 
 SRC_URI = "git://github.com/rpm-software-management/dnf.git \
-           file://0001-Move-releasever-check-after-the-etc-dnf-vars-substit.patch \
            file://0029-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch \
            file://0030-Run-python-scripts-using-env.patch \
            file://0001-Do-not-prepend-installroot-to-logdir.patch \
@@ -13,7 +12,7 @@ SRC_URI = "git://github.com/rpm-software-management/dnf.git \
            file://0001-Corretly-install-tmpfiles.d-configuration.patch \
            "
 
-SRCREV = "32e6ffdc8902b868cd8f98f9c399c98c9de0c7b8"
+SRCREV = "be2585183ec4485ee4d5e121f242d8669296f065"
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+(\.\d+)+)"
 
 S = "${WORKDIR}/git"
-- 
2.13.2


