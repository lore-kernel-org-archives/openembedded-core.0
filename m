Return-Path: <Wenzong.Fan@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 57CAB75CD0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Oct 2015 09:33:49 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id t9M9XmLY013633
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Oct 2015 02:33:49 -0700 (PDT)
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.248.2;
	Thu, 22 Oct 2015 02:33:48 -0700
From: <wenzong.fan@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 22 Oct 2015 05:33:47 -0400
Message-ID: <1445506427-15720-1-git-send-email-wenzong.fan@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] gnupg: set development_version as no
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
X-List-Received-Date: Thu, 22 Oct 2015 09:33:51 -0000
Content-Type: text/plain

From: Wenzong Fan <wenzong.fan@windriver.com>

The development_version used to mark if gnupg is a beta version. The
checking logic in autogen.sh always assume that gnupg is beta if below
command is not run in gnupg's git-repo:

  './autogen.sh --find-version 2 1 7'

This does not work for integration. Set development_version as no to
fix runtime issue:

  $gpg --list-sigs
  gpg: NOTE: THIS IS A DEVELOPMENT VERSION!
  gpg: It is only intended for test purposes and should NOT be
  gpg: used in a production environment or with production keys!

Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
---
 .../configure-set-development_version-as-no.patch  | 36 ++++++++++++++++++++++
 meta/recipes-support/gnupg/gnupg_2.1.7.bb          |  1 +
 2 files changed, 37 insertions(+)
 create mode 100644 meta/recipes-support/gnupg/gnupg/configure-set-development_version-as-no.patch

diff --git a/meta/recipes-support/gnupg/gnupg/configure-set-development_version-as-no.patch b/meta/recipes-support/gnupg/gnupg/configure-set-development_version-as-no.patch
new file mode 100644
index 0000000..3c71040
--- /dev/null
+++ b/meta/recipes-support/gnupg/gnupg/configure-set-development_version-as-no.patch
@@ -0,0 +1,36 @@
+From 6cdc55816048afb52f1c3a706c0ba99dfc069b89 Mon Sep 17 00:00:00 2001
+From: Wenzong Fan <wenzong.fan@windriver.com>
+Date: Thu, 22 Oct 2015 02:51:46 -0400
+Subject: [PATCH] gnupg: set development_version as no
+
+The development_version used to mark if gnupg is a beta version. The
+checking logic in autogen.sh always assume that gnupg is beta if below
+command is not run in gnupg's git-repo:
+
+  './autogen.sh --find-version 2 1 7'
+
+This does not work for integration.
+
+Upstream-Status: Inappropriate [configuration]
+
+Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
+---
+ configure.ac | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index b38aa06..ea40c19 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -70,7 +70,7 @@ NEED_NPTH_VERSION=0.91
+ NEED_GNUTLS_VERSION=3.0
+ 
+ 
+-development_version=mym4_isbeta
++development_version=no
+ PACKAGE=$PACKAGE_NAME
+ PACKAGE_GT=${PACKAGE_NAME}2
+ VERSION=$PACKAGE_VERSION
+-- 
+1.9.1
+
diff --git a/meta/recipes-support/gnupg/gnupg_2.1.7.bb b/meta/recipes-support/gnupg/gnupg_2.1.7.bb
index 48c7c96..638af6d 100644
--- a/meta/recipes-support/gnupg/gnupg_2.1.7.bb
+++ b/meta/recipes-support/gnupg/gnupg_2.1.7.bb
@@ -12,6 +12,7 @@ SRC_URI = "ftp://ftp.gnupg.org/gcrypt/${BPN}/${BPN}-${PV}.tar.bz2 \
            file://pkgconfig.patch \
            file://use-pkgconfig-instead-of-npth-config.patch \
            file://dirmngr-uses-libgpg-error.patch \
+           file://configure-set-development_version-as-no.patch \
           "
 
 SRC_URI[md5sum] = "ebdf92b15b8bcd8579b643c7f41a3238"
-- 
1.9.1


