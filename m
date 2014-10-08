Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id CE72F71624
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Oct 2014 12:16:41 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s98CGgwA001335
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 8 Oct 2014 05:16:42 -0700 (PDT)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.194) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Wed, 8 Oct 2014 05:16:41 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <mark.hatle@windriver.com>,
	<paul@paulbarker.me.uk>
Date: Wed, 8 Oct 2014 20:16:36 +0800
Message-ID: <241e2535b1e3f4544e31fdc40406337b26e8f8d9.1412770325.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1412770325.git.hongxu.jia@windriver.com>
References: <cover.1412770325.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] opkg: fix remove pkg with --force-removal-of-dependent-packages failed
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
X-List-Received-Date: Wed, 08 Oct 2014 12:16:47 -0000
Content-Type: text/plain

opkg remove perl --force-removal-of-dependent-packages
...
Removing package perl-module-extutils-mm-dos from root...
...
Removing package perl-module-extutils-mm-dos from root...
You can force removal of packages with failed prerm scripts with the option:
	--force-remove
No packages removed.
Collected errors:
 * pkg_run_script: Internal error: perl-module-extutils-mm-dos has a
NULL tmp_unpack_dir.
 * opkg_remove_pkg: not removing package "perl-module-extutils-mm-dos",
prerm script failed
...

While remove pkg with '--force-removal-of-dependent-packages',
pkg may be added to remove list multiple times, add status
check to make sure pkg only be removed once.

[YOCTO #6819]

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 ...g_remove.c-avoid-remove-pkg-repeatly-with.patch | 39 ++++++++++++++++++++++
 meta/recipes-devtools/opkg/opkg_0.2.2.bb           |  1 +
 2 files changed, 40 insertions(+)
 create mode 100644 meta/recipes-devtools/opkg/opkg/libopkg-opkg_remove.c-avoid-remove-pkg-repeatly-with.patch

diff --git a/meta/recipes-devtools/opkg/opkg/libopkg-opkg_remove.c-avoid-remove-pkg-repeatly-with.patch b/meta/recipes-devtools/opkg/opkg/libopkg-opkg_remove.c-avoid-remove-pkg-repeatly-with.patch
new file mode 100644
index 0000000..08433a9
--- /dev/null
+++ b/meta/recipes-devtools/opkg/opkg/libopkg-opkg_remove.c-avoid-remove-pkg-repeatly-with.patch
@@ -0,0 +1,39 @@
+From 41425d67d3589b1912416a17f740d6407c7834f2 Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Wed, 8 Oct 2014 19:53:13 +0800
+Subject: [PATCH] libopkg/opkg_remove.c: avoid remove pkg repeatly with option
+ --force-removal-of-dependent-packages
+
+While remove pkg with '--force-removal-of-dependent-packages',
+pkg may be added to pkgs remove list multiple times, add status
+check to make sure pkg only be removed once.
+
+Upstream-Status: Pending
+
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ libopkg/opkg_remove.c | 8 ++++++++
+ 1 file changed, 8 insertions(+)
+
+diff --git a/libopkg/opkg_remove.c b/libopkg/opkg_remove.c
+index 34f9154..a225e41 100644
+--- a/libopkg/opkg_remove.c
++++ b/libopkg/opkg_remove.c
+@@ -250,6 +250,14 @@ opkg_remove_pkg(pkg_t *pkg, int from_upgrade)
+      if ((parent_pkg = pkg->parent) == NULL)
+ 	  return 0;
+ 
++     /* While remove pkg with '--force-removal-of-dependent-packages',
++        pkg may be added to remove list multiple times, add status
++        check to make sure pkg only be removed once. */
++     if (conf->force_removal_of_dependent_packages &&
++             pkg->state_flag & SF_FILELIST_CHANGED &&
++             pkg->state_status == SS_NOT_INSTALLED)
++         return 0;
++
+      /* only attempt to remove dependent installed packages if
+       * force_depends is not specified or the package is being
+       * replaced.
+-- 
+1.9.1
+
diff --git a/meta/recipes-devtools/opkg/opkg_0.2.2.bb b/meta/recipes-devtools/opkg/opkg_0.2.2.bb
index 3dd7489..867ff7a 100644
--- a/meta/recipes-devtools/opkg/opkg_0.2.2.bb
+++ b/meta/recipes-devtools/opkg/opkg_0.2.2.bb
@@ -4,6 +4,7 @@ SRC_URI = "http://downloads.yoctoproject.org/releases/${BPN}/${BPN}-${PV}.tar.gz
            file://no-install-recommends.patch \
            file://add-exclude.patch \
            file://opkg-configure.service \
+           file://libopkg-opkg_remove.c-avoid-remove-pkg-repeatly-with.patch \
 "
 
 S = "${WORKDIR}/${BPN}-${PV}"
-- 
1.9.1


