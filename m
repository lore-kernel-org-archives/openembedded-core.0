Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 627FA757CE
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Jun 2015 14:48:55 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.1/8.15.1) with ESMTPS id t52EmuU5010810
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 2 Jun 2015 07:48:56 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.224.2;
	Tue, 2 Jun 2015 07:48:56 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 2 Jun 2015 07:48:53 -0700
Message-ID: <5e37a85d107e8ef172d9c0ff60c90978cf408408.1433256486.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1433256486.git.liezhi.yang@windriver.com>
References: <cover.1433256486.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 6/6] glib-2.0: 2.44.0 -> 2.44.1
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
X-List-Received-Date: Tue, 02 Jun 2015 14:48:57 -0000
Content-Type: text/plain

Removed 0001-GListModel-roll-back-use-of-type-redefinition.patch since
it is a backport patch.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 ...tModel-roll-back-use-of-type-redefinition.patch |   42 --------------------
 .../{glib-2.0_2.44.0.bb => glib-2.0_2.44.1.bb}     |    5 +--
 2 files changed, 2 insertions(+), 45 deletions(-)
 delete mode 100644 meta/recipes-core/glib-2.0/glib-2.0/0001-GListModel-roll-back-use-of-type-redefinition.patch
 rename meta/recipes-core/glib-2.0/{glib-2.0_2.44.0.bb => glib-2.0_2.44.1.bb} (76%)

diff --git a/meta/recipes-core/glib-2.0/glib-2.0/0001-GListModel-roll-back-use-of-type-redefinition.patch b/meta/recipes-core/glib-2.0/glib-2.0/0001-GListModel-roll-back-use-of-type-redefinition.patch
deleted file mode 100644
index 7d95743..0000000
--- a/meta/recipes-core/glib-2.0/glib-2.0/0001-GListModel-roll-back-use-of-type-redefinition.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-From 4a292721bcf2943bfc05c6a1c859992f28e3efec Mon Sep 17 00:00:00 2001
-From: Ryan Lortie <desrt@desrt.ca>
-Date: Wed, 25 Mar 2015 09:29:49 -0400
-Subject: [PATCH] GListModel: roll back use of type redefinition
-
-We declare the typedefs for GListModel and GListStore in giotypes.h, as
-a matter of convention.  This is not actually required, since the
-typedef is emitted as part of the G_DECLARE_* macros.
-
-The giotypes.h approach is only used to avoid cyclic dependencies
-between headers, which is not a problem in this case.
-
-Type redefinition is a C11 feature, and although it was around in some
-compilers before then, gcc 4.2.1 (from 2007) is apparently still in wide
-use, being the default compiler for OpenBSD.
-
-Eventually, we will probably hit a case where we actually need to
-redefine a type, but since we're not there yet, let's back off a bit.
-
-Upstream-Status: Backport
-
-Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
----
- gio/giotypes.h |    2 --
- 1 file changed, 2 deletions(-)
-
-diff --git a/gio/giotypes.h b/gio/giotypes.h
-index 4342d47..53f8cc9 100644
---- a/gio/giotypes.h
-+++ b/gio/giotypes.h
-@@ -61,8 +61,6 @@ typedef struct _GPermission                   GPermission;
- 
- typedef struct _GMenuModel                    GMenuModel;
- typedef struct _GNotification                 GNotification;
--typedef struct _GListModel                    GListModel;
--typedef struct _GListStore                    GListStore;
- 
- /**
-  * GDrive:
--- 
-1.7.9.5
-
diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.44.0.bb b/meta/recipes-core/glib-2.0/glib-2.0_2.44.1.bb
similarity index 76%
rename from meta/recipes-core/glib-2.0/glib-2.0_2.44.0.bb
rename to meta/recipes-core/glib-2.0/glib-2.0_2.44.1.bb
index 227e1b4..8eaccfb 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0_2.44.0.bb
+++ b/meta/recipes-core/glib-2.0/glib-2.0_2.44.1.bb
@@ -14,10 +14,9 @@ SRC_URI = "${GNOME_MIRROR}/glib/${SHRT_VER}/glib-${PV}.tar.xz \
            file://uclibc.patch \
            file://0001-configure.ac-Do-not-use-readlink-when-cross-compilin.patch \
            file://allow-run-media-sdX-drive-mount-if-username-root.patch \
-           file://0001-GListModel-roll-back-use-of-type-redefinition.patch \
           "
 
 SRC_URI_append_class-native = " file://glib-gettextize-dir.patch"
 
-SRC_URI[md5sum] = "74cf7b4ea200b76e42a4c22c8daf0f93"
-SRC_URI[sha256sum] = "f2d362b106a08fa801770d41829a06fcfe287a00421018869eebf5efc796f5b9"
+SRC_URI[md5sum] = "83efba4722a9674b97437d1d99af79db"
+SRC_URI[sha256sum] = "8811deacaf8a503d0a9b701777ea079ca6a4277be10e3d730d2112735d5eca07"
-- 
1.7.9.5


