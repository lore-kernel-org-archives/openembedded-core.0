Return-Path: <joe.slater@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 9438D77891
	for <openembedded-core@lists.openembedded.org>;
	Tue,  7 Mar 2017 22:53:20 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v27MrKUj027793
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 7 Mar 2017 14:53:21 -0800 (PST)
Received: from ala-jslater-lx3.wrs.com (147.11.152.42) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.294.0; Tue, 7 Mar 2017 14:53:20 -0800
From: Joe Slater <jslater@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 7 Mar 2017 14:53:19 -0800
Message-ID: <1488927199-28009-1-git-send-email-jslater@windriver.com>
X-Mailer: git-send-email 1.7.3.4
MIME-Version: 1.0
Subject: [PATCH 1/1] e2fsprogs: expand @mkdir_p@ during configuration
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
X-List-Received-Date: Tue, 07 Mar 2017 22:53:20 -0000
Content-Type: text/plain

If we do not do this, locale data will not be put
into /usr/share/locale.

Signed-off-by: Joe Slater <jslater@windriver.com>
---
 .../e2fsprogs/e2fsprogs/mkdir_p.patch              |   20 ++++++++++++++++++++
 .../recipes-devtools/e2fsprogs/e2fsprogs_1.43.4.bb |    1 +
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
diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.43.4.bb b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.43.4.bb
index 95ebc3a..153b3a1 100644
--- a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.43.4.bb
+++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.43.4.bb
@@ -8,6 +8,7 @@ SRC_URI += "file://acinclude.m4 \
             file://mkdir.patch \
             file://Revert-mke2fs-enable-the-metadata_csum-and-64bit-fea.patch \
             file://e2fsprogs-1.43-sysmacros.patch \
+            file://mkdir_p.patch \
 "
 
 SRC_URI_append_class-native = " file://e2fsprogs-fix-missing-check-for-permission-denied.patch"
-- 
1.7.9.5


