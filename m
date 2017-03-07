Return-Path: <joe.slater@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id B8280776F2
	for <openembedded-core@lists.openembedded.org>;
	Tue,  7 Mar 2017 23:00:55 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v27N0t2Z017057
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 7 Mar 2017 15:00:56 -0800
Received: from ala-jslater-lx3.wrs.com (147.11.152.42) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.294.0; Tue, 7 Mar 2017 15:00:55 -0800
From: Joe Slater <jslater@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 7 Mar 2017 15:00:55 -0800
Message-ID: <1488927655-28080-1-git-send-email-jslater@windriver.com>
X-Mailer: git-send-email 1.7.3.4
MIME-Version: 1.0
Subject: [morty][PATCH 1/1] e2fsprogs: have configure expand @mkdir_p@
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
X-List-Received-Date: Tue, 07 Mar 2017 23:00:56 -0000
Content-Type: text/plain

Without doing this, locale data is not written
into usr/src/locale.

We could also just use MKDIR_P instead of mkdir_p.

Signed-off-by: Joe Slater <jslater@windriver.com>
---
 .../e2fsprogs/e2fsprogs/mkdir_p.patch              |   20 ++++++++++++++++++++
 meta/recipes-devtools/e2fsprogs/e2fsprogs_1.43.bb  |    1 +
 2 files changed, 21 insertions(+)
 create mode 100644 meta/recipes-devtools/e2fsprogs/e2fsprogs/mkdir_p.patch

diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs/mkdir_p.patch b/meta/recipes-devtools/e2fsprogs/e2fsprogs/mkdir_p.patch
new file mode 100644
index 0000000..b0fa4b8
--- /dev/null
+++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs/mkdir_p.patch
@@ -0,0 +1,20 @@
+e2fsprogs: expand @mkdir_p@
+
+Add AC_SUBST to configure.ac.  @mkdir_p@ is currently
+not expanded so no locale data is written into usr/share/locale. 
+
+Upstream-Status: Pending
+
+Signed-off-by: Joe Slater <jslater@windriver.com>
+
+--- a/configure.ac
++++ b/configure.ac
+@@ -811,6 +811,8 @@ AC_SUBST(PACKAGE)
+ AC_SUBST(VERSION)
+ 
+ AM_GNU_GETTEXT
++dnl @MKDIR_P@ is expanded in AM_GNU_GETTEXT
++AC_SUBST([mkdir_p],['$(MKDIR_P)'])
+ dnl
+ dnl End of configuration options
+ dnl
diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.43.bb b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.43.bb
index f4855bc..5e30ec9 100644
--- a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.43.bb
+++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.43.bb
@@ -9,6 +9,7 @@ SRC_URI += "file://acinclude.m4 \
             file://ptest.patch \
             file://mkdir.patch \
             file://Revert-mke2fs-enable-the-metadata_csum-and-64bit-fea.patch \
+            file://mkdir_p.patch \
 "
 
 SRC_URI_append_class-native = " file://e2fsprogs-fix-missing-check-for-permission-denied.patch"
-- 
1.7.9.5


