Return-Path: <Yanjun.Zhu@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 536776E901
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Feb 2014 10:17:34 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s1HAHY5X011722
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Feb 2014 02:17:34 -0800 (PST)
Received: from wind-OptiPlex-780.corp.ad.wrs.com (128.224.162.219) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.347.0; Mon, 17 Feb 2014 02:17:34 -0800
From: Zhu Yanjun <yanjun.zhu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 17 Feb 2014 18:17:37 +0800
Message-ID: <1392632257-4669-1-git-send-email-yanjun.zhu@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH] pseudo-1.5.1: keep install command directory mode
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
X-List-Received-Date: Mon, 17 Feb 2014 10:17:34 -0000
Content-Type: text/plain

From: "yanjun.zhu" <yanjun.zhu@windriver.com>

CQID:LIN5-17788

when install command sets the created directory mode, pseudo will change
the mode of the directory to 0700 incorrectly.

Signed-off-by: yanjun.zhu <yanjun.zhu@windriver.com>
---
 .../pseudo-1.5.1-install-directory-mode.patch      |   10 ++++++++++
 meta/recipes-devtools/pseudo/pseudo_1.5.1.bb       |    3 ++-
 2 files changed, 12 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/pseudo/files/pseudo-1.5.1-install-directory-mode.patch

diff --git a/meta/recipes-devtools/pseudo/files/pseudo-1.5.1-install-directory-mode.patch b/meta/recipes-devtools/pseudo/files/pseudo-1.5.1-install-directory-mode.patch
new file mode 100644
index 0000000..02e3da2
--- /dev/null
+++ b/meta/recipes-devtools/pseudo/files/pseudo-1.5.1-install-directory-mode.patch
@@ -0,0 +1,10 @@
+--- a/ports/unix/guts/mkdirat.c
++++ b/ports/unix/guts/mkdirat.c
+@@ -25,6 +25,7 @@
+ 		stat_rc = base_fstatat(dirfd, path, &buf, AT_SYMLINK_NOFOLLOW);
+ #endif
+ 		if (stat_rc != -1) {
++			buf.st_mode = PSEUDO_DB_MODE(buf.st_mode, mode);
+ 			pseudo_client_op(OP_MKDIR, 0, -1, dirfd, path, &buf);
+ 		} else {
+ 			pseudo_debug(1, "mkdir of %s succeeded, but stat failed: %s\n",
diff --git a/meta/recipes-devtools/pseudo/pseudo_1.5.1.bb b/meta/recipes-devtools/pseudo/pseudo_1.5.1.bb
index bc92856..64115ca 100644
--- a/meta/recipes-devtools/pseudo/pseudo_1.5.1.bb
+++ b/meta/recipes-devtools/pseudo/pseudo_1.5.1.bb
@@ -1,11 +1,12 @@
 require pseudo.inc
 
-PR = "r4"
+PR = "r5"
 
 SRC_URI = " \
     http://www.yoctoproject.org/downloads/${BPN}/${BPN}-${PV}.tar.bz2 \
     file://0001-pseudo_has_unload-add-function.patch \
     file://shutdownping.patch \
+    file://pseudo-1.5.1-install-directory-mode.patch \
 "
 
 SRC_URI[md5sum] = "5ec67c7bff5fe68c56de500859c19172"
-- 
1.7.9.5


