Return-Path: <Ming.Liu@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id ABE8260CF1
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Jan 2014 09:57:09 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s099vAxV020271
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 9 Jan 2014 01:57:10 -0800 (PST)
Received: from pek-lpgbuild1.wrs.com (128.224.153.21) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.347.0; Thu, 9 Jan 2014 01:57:09 -0800
From: Ming Liu <ming.liu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 9 Jan 2014 17:57:07 +0800
Message-ID: <1389261427-5971-1-git-send-email-ming.liu@windriver.com>
X-Mailer: git-send-email 1.7.1
MIME-Version: 1.0
Subject: [PATCH] busybox: lineedit: initialize delptr
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
X-List-Received-Date: Thu, 09 Jan 2014 09:57:10 -0000
Content-Type: text/plain

In vi mode, the 'p' and 'P' commands caused a segfault when nothing had
been put in the buffer yet because the delptr was not initialized.

Signed-off-by: Ming Liu <ming.liu@windriver.com>
---
 .../busybox-lineedit-initialize-delptr.patch       |   23 ++++++++++++++++++++
 meta/recipes-core/busybox/busybox_1.21.1.bb        |    1 +
 2 files changed, 24 insertions(+), 0 deletions(-)
 create mode 100644 meta/recipes-core/busybox/busybox/busybox-lineedit-initialize-delptr.patch

diff --git a/meta/recipes-core/busybox/busybox/busybox-lineedit-initialize-delptr.patch b/meta/recipes-core/busybox/busybox/busybox-lineedit-initialize-delptr.patch
new file mode 100644
index 0000000..e59211b
--- /dev/null
+++ b/meta/recipes-core/busybox/busybox/busybox-lineedit-initialize-delptr.patch
@@ -0,0 +1,23 @@
+Derived from:
+http://git.busybox.net/busybox/commit/?id=46031da862a60422f80050a905cea0b67026b021.
+
+In vi mode, the 'p' and 'P' commands caused a segfault when nothing had
+been put in the buffer yet because the delptr was not initialized.
+
+Upstream-Status: Backport
+
+Signed-off-by: Shawn J. Goff <shawn7400@gmail.com>
+Signed-off-by: Denys Vlasenko <vda.linux@googlemail.com>
+Signed-off-by: Ming Liu <ming.liu@windriver.com>
+
+diff -urpN a/libbb/lineedit.c b/libbb/lineedit.c
+--- a/libbb/lineedit.c
++++ b/libbb/lineedit.c
+@@ -187,6 +187,7 @@ extern struct lineedit_statics *const li
+ 	cmdedit_termw = 80; \
+ 	IF_FEATURE_EDITING_FANCY_PROMPT(num_ok_lines = 1;) \
+ 	IF_USERNAME_OR_HOMEDIR(home_pwd_buf = (char*)null_str;) \
++	IF_FEATURE_EDITING_VI(delptr = delbuf;) \
+ } while (0)
+ 
+ static void deinit_S(void)
diff --git a/meta/recipes-core/busybox/busybox_1.21.1.bb b/meta/recipes-core/busybox/busybox_1.21.1.bb
index 267604a..cf59f58 100644
--- a/meta/recipes-core/busybox/busybox_1.21.1.bb
+++ b/meta/recipes-core/busybox/busybox_1.21.1.bb
@@ -35,6 +35,7 @@ SRC_URI = "http://www.busybox.net/downloads/busybox-${PV}.tar.bz2;name=tarball \
            file://busybox-list-suid-and-non-suid-app-configs.patch \
            file://busybox-sed-fix-sed-clusternewline-testcase.patch \
            file://find-get-rid-of-nested-functions.patch \
+           file://busybox-lineedit-initialize-delptr.patch \
 "
 
 SRC_URI[tarball.md5sum] = "795394f83903b5eec6567d51eebb417e"
-- 
1.7.1


