Return-Path: <stefan@agner.ch>
Received: from mail.kmu-office.ch (mail.kmu-office.ch [178.209.48.109])
	by mail.openembedded.org (Postfix) with ESMTP id BC2CC65C8A
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Apr 2016 18:04:56 +0000 (UTC)
Received: from seahawk.toradex.int
	(75-146-58-181-Washington.hfc.comcastbusiness.net [75.146.58.181])
	by mail.kmu-office.ch (Postfix) with ESMTPSA id 6D5095C11EA;
	Mon, 25 Apr 2016 20:03:12 +0200 (CEST)
From: Stefan Agner <stefan@agner.ch>
To: openembedded-core@lists.openembedded.org
Date: Mon, 25 Apr 2016 11:05:51 -0700
Message-Id: <1461607551-14750-1-git-send-email-stefan@agner.ch>
X-Mailer: git-send-email 1.9.1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agner.ch; s=dkim;
	t=1461607393; bh=bBTorrMKdh194FwQ7ynYYIHtyDC4O82i3M1ImNb6vIg=;
	h=From:To:Cc:Subject:Date:Message-Id;
	b=DbJhLg2qlO1wqTW2iuVUI7rWvfPho4RSiVM+GXm7vP+ObfQy1fk3LpwstmTcgzsLiJ67opdOmJZISOPO4T2GvOT+uUDvZr0POUE4kGQAv452ihxYY4PXyz5u/HJOZ8XVy6Y4zenKduCBqtA6bDCMD8uimYT8LKc9cKXNz55an0U=
Cc: Stefan Agner <stefan.agner@toradex.com>
Subject: [PATCH][krogoth] opkg: backport fix for double remove of packges
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
X-List-Received-Date: Mon, 25 Apr 2016 18:04:57 -0000

From: Stefan Agner <stefan.agner@toradex.com>

Backport the fix 7885da3974 ("pkg_get_provider_replacees: do not
add installed pkg to replacee list"). This avoids opkg trying to
remove a package twice e.g. when upgrading.

Suggested-by: Alejandro del Castillo <alejandro.delcastillo@ni.com>
Signed-off-by: Stefan Agner <stefan.agner@toradex.com>
---
 ...vider_replacees-do-not-add-installed-pkg-.patch | 112 +++++++++++++++++++++
 meta/recipes-devtools/opkg/opkg_0.3.1.bb           |   1 +
 2 files changed, 113 insertions(+)
 create mode 100644 meta/recipes-devtools/opkg/opkg/0001-pkg_get_provider_replacees-do-not-add-installed-pkg-.patch

diff --git a/meta/recipes-devtools/opkg/opkg/0001-pkg_get_provider_replacees-do-not-add-installed-pkg-.patch b/meta/recipes-devtools/opkg/opkg/0001-pkg_get_provider_replacees-do-not-add-installed-pkg-.patch
new file mode 100644
index 0000000..248b40a
--- /dev/null
+++ b/meta/recipes-devtools/opkg/opkg/0001-pkg_get_provider_replacees-do-not-add-installed-pkg-.patch
@@ -0,0 +1,112 @@
+From 711b86dc7046322cc9f2ab8250c9fe1b2a06d505 Mon Sep 17 00:00:00 2001
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
+index 975d9c6..efbe0e4 100644
+--- a/libopkg/opkg_install.c
++++ b/libopkg/opkg_install.c
+@@ -1355,10 +1355,15 @@ static void pkg_get_provider_replacees(pkg_t * pkg,
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
+index 201e5ab..f6ba076 100644
+--- a/tests/Makefile
++++ b/tests/Makefile
+@@ -57,6 +57,7 @@ REGRESSION_TESTS := core/01_install.py \
+ 		    regress/issue165.py \
+ 		    regress/issue165a.py \
+ 		    regress/issue165b.py \
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
diff --git a/meta/recipes-devtools/opkg/opkg_0.3.1.bb b/meta/recipes-devtools/opkg/opkg_0.3.1.bb
index 577f495..27cc5a1 100644
--- a/meta/recipes-devtools/opkg/opkg_0.3.1.bb
+++ b/meta/recipes-devtools/opkg/opkg_0.3.1.bb
@@ -17,6 +17,7 @@ SRC_URI = "http://downloads.yoctoproject.org/releases/${BPN}/${BPN}-${PV}.tar.gz
            file://0001-opkg_conf-create-opkg.lock-in-run-instead-of-var-run.patch \
            file://0001-libsolv_solver_set_arch_policy-use-correct-logic-dur.patch \
            file://0001-configure.ac-use-pkg-config-for-libsolv.patch \
+           file://0001-pkg_get_provider_replacees-do-not-add-installed-pkg-.patch \
 "
 
 SRC_URI[md5sum] = "43735e5dc1ebf46bd6ce56a7cdfdc720"
-- 
1.9.1


