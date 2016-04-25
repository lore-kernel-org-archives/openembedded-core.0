Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 450B57001D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Apr 2016 01:10:43 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u3P1Aill001420
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 24 Apr 2016 18:10:44 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Sun, 24 Apr 2016 18:10:43 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sun, 24 Apr 2016 18:10:37 -0700
Message-ID: <24e71ab8bff2739edf11ef7c5d5cd7079e0e1022.1461546574.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.8.0
In-Reply-To: <cover.1461546574.git.liezhi.yang@windriver.com>
References: <cover.1461546574.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 5/6] opkg: backport fix for double remove of packges
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
X-List-Received-Date: Mon, 25 Apr 2016 01:10:44 -0000
Content-Type: text/plain

From: Stefan Agner <stefan.agner@toradex.com>

Backport the fix 7885da3974 ("pkg_get_provider_replacees: do not
add installed pkg to replacee list"). This avoids opkg trying to
remove a package twice e.g. when upgrading.

Suggested-by: Alejandro del Castillo <alejandro.delcastillo@ni.com>
Signed-off-by: Stefan Agner <stefan.agner@toradex.com>
Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 ...vider_replacees-do-not-add-installed-pkg-.patch | 112 +++++++++++++++++++++
 meta/recipes-devtools/opkg/opkg_0.3.0.bb           |   1 +
 2 files changed, 113 insertions(+)
 create mode 100644 meta/recipes-devtools/opkg/opkg/0001-pkg_get_provider_replacees-do-not-add-installed-pkg-.patch

diff --git a/meta/recipes-devtools/opkg/opkg/0001-pkg_get_provider_replacees-do-not-add-installed-pkg-.patch b/meta/recipes-devtools/opkg/opkg/0001-pkg_get_provider_replacees-do-not-add-installed-pkg-.patch
new file mode 100644
index 0000000..29a9f59
--- /dev/null
+++ b/meta/recipes-devtools/opkg/opkg/0001-pkg_get_provider_replacees-do-not-add-installed-pkg-.patch
@@ -0,0 +1,112 @@
+From c5acac4ca0633088ea3f2d92dc236a43593e13b7 Mon Sep 17 00:00:00 2001
+From: Alejandro del Castillo <alejandro.delcastillo@ni.com>
+Date: Tue, 12 Jan 2016 17:12:18 -0600
+Subject: [PATCH] pkg_get_provider_replacees: do not add installed pkg to
+ replacee list
+
+If package A replaces provider B, and B is provided by A,
+pkg_get_provider_replacees incorrectly adds A to the list of B replacees
+when A is installed. During an upgrade, pacakge A is removed during
+pkg_remove_installed_replacees, then once more during the package
+upgrade.
+
+Add check to skip the insertion of package A into the replacees vector
+in pkg_get_provider_replacees.
+
+Signed-off-by: Alejandro del Castillo <alejandro.delcastillo@ni.com>
+---
+ libopkg/opkg_install.c     | 13 +++++++++----
+ tests/Makefile             |  1 +
+ tests/regress/issue8913.py | 44 ++++++++++++++++++++++++++++++++++++++++++++
+ 3 files changed, 54 insertions(+), 4 deletions(-)
+ create mode 100755 tests/regress/issue8913.py
+
+diff --git a/libopkg/opkg_install.c b/libopkg/opkg_install.c
+index dbfafa5..c2db870 100644
+--- a/libopkg/opkg_install.c
++++ b/libopkg/opkg_install.c
+@@ -427,10 +427,15 @@ static void pkg_get_provider_replacees(pkg_t * pkg,
+             continue;
+         for (j = 0; j < ap->pkgs->len; j++) {
+             pkg_t *replacee = ap->pkgs->pkgs[j];
+-            int installed = (replacee->state_status == SS_INSTALLED)
+-                    || (replacee->state_status == SS_UNPACKED);
+-            if (installed)
+-                pkg_vec_insert(replacees, replacee);
++            pkg_t *old = pkg_hash_fetch_installed_by_name(pkg->name);
++            /* skip pkg if installed: it  will be removed during upgrade
++             * issue 8913 */
++            if (old != replacee) {
++                int installed = (replacee->state_status == SS_INSTALLED)
++                        || (replacee->state_status == SS_UNPACKED);
++                if (installed)
++                    pkg_vec_insert(replacees, replacee);
++            }
+         }
+     }
+ }
+diff --git a/tests/Makefile b/tests/Makefile
+index 707434f..d01e97b 100644
+--- a/tests/Makefile
++++ b/tests/Makefile
+@@ -39,6 +39,7 @@ REGRESSION_TESTS := core/01_install.py \
+ 		    regress/issue127.py \
+ 		    regress/issue152.py \
+ 		    regress/issue154.py \
++		    regress/issue8913.py \
+ 		    misc/filehash.py \
+ 		    misc/update_loses_autoinstalled_flag.py
+ RUN_TESTS := $(REGRESSION_TESTS:%.py=run-%.py)
+diff --git a/tests/regress/issue8913.py b/tests/regress/issue8913.py
+new file mode 100755
+index 0000000..aaa940f
+--- /dev/null
++++ b/tests/regress/issue8913.py
+@@ -0,0 +1,44 @@
++#! /usr/bin/env python3
++#
++# Reporter: alejandro.delcastillo@ni.com
++#
++# What steps will reproduce the problem?
++# ======================================
++#
++# 1.- Create package a (v 1.0) that Provides b and c, Replaces b, Conflicts with b.
++#         install it
++# 2.- Create package a (v 2.0) that Provides b and c, Replaces b, Conflicts with b.
++#         upgrade
++#
++# What is the expected output? What do you see instead?
++# =====================================================
++#
++# Upgrade fails
++#
++
++import os
++import opk, cfg, opkgcl
++
++opk.regress_init()
++
++o = opk.OpkGroup()
++o.add(Package="a", Version="1.0", Provides="b, c", Replaces="b", Conflicts="b")
++o.write_opk()
++o.write_list()
++
++opkgcl.update()
++
++opkgcl.install("a", "--force-postinstall")
++
++o = opk.OpkGroup()
++o.add(Package="a", Version="2.0", Provides="b, c", Replaces="b", Conflicts="b")
++o.write_opk()
++o.write_list()
++
++opkgcl.update()
++status = opkgcl.upgrade("--force-postinstall")
++
++if not opkgcl.is_installed("a", "2.0"):
++	opk.fail("New version of package 'a' available during upgrade but was not installed")
++
++opkgcl.remove("a")
+-- 
+2.8.0
+
diff --git a/meta/recipes-devtools/opkg/opkg_0.3.0.bb b/meta/recipes-devtools/opkg/opkg_0.3.0.bb
index 5ad3e92..70110d5 100644
--- a/meta/recipes-devtools/opkg/opkg_0.3.0.bb
+++ b/meta/recipes-devtools/opkg/opkg_0.3.0.bb
@@ -21,6 +21,7 @@ SRC_URI = "http://downloads.yoctoproject.org/releases/${BPN}/${BPN}-${PV}.tar.gz
            file://0002-md5-Add-md5_to_string-function.patch \
            file://0003-sha256-Add-sha256_to_string-function.patch \
            file://0004-opkg_download-Use-short-cache-file-name.patch \
+           file://0001-pkg_get_provider_replacees-do-not-add-installed-pkg-.patch \
 "
 
 SRC_URI[md5sum] = "3412cdc71d78b98facc84b19331ec64e"
-- 
2.8.0


