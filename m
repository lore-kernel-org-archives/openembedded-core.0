Return-Path: <Rongqing.Li@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id BE05373BB8
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Sep 2015 05:12:27 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id t8P5CRVo012632
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Sep 2015 22:12:27 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.235.1; Thu, 24 Sep 2015 22:12:26 -0700
From: <rongqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 25 Sep 2015 13:05:56 +0800
Message-ID: <1443157556-467-1-git-send-email-rongqing.li@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] busybox: fix a ash memory leak
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
X-List-Received-Date: Fri, 25 Sep 2015 05:12:30 -0000
Content-Type: text/plain

From: Roy Li <rongqing.li@windriver.com>

Signed-off-by: Roy Li <rongqing.li@windriver.com>
---
 .../busybox/0001-ash-fix-memory-leak-in-ash.patch  | 54 ++++++++++++++++++++++
 meta/recipes-core/busybox/busybox_1.23.2.bb        |  1 +
 meta/recipes-core/busybox/busybox_git.bb           |  1 +
 3 files changed, 56 insertions(+)
 create mode 100644 meta/recipes-core/busybox/busybox/0001-ash-fix-memory-leak-in-ash.patch

diff --git a/meta/recipes-core/busybox/busybox/0001-ash-fix-memory-leak-in-ash.patch b/meta/recipes-core/busybox/busybox/0001-ash-fix-memory-leak-in-ash.patch
new file mode 100644
index 0000000..87c7ffa
--- /dev/null
+++ b/meta/recipes-core/busybox/busybox/0001-ash-fix-memory-leak-in-ash.patch
@@ -0,0 +1,54 @@
+From 8dc9fef3ba088604527b067310c6da64221b3570 Mon Sep 17 00:00:00 2001
+From: Signed-off-by: Hu <yadi.hu@windriver.com>
+Date: Fri, 25 Sep 2015 12:36:07 +0800
+Subject: [PATCH] ash: fix memory leak in ash
+
+Upstream-Status: Submitted: https://bugs.busybox.net/show_bug.cgi?id=7748
+
+The script triggers the memory leak:
+   while true
+   do
+       while true
+       do
+           break;
+       done</dev/null
+   done
+
+adding stackmark resolve this issue.
+
+Signed-off-by: Hu <yadi.hu@windriver.com>
+---
+ shell/ash.c | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/shell/ash.c b/shell/ash.c
+index 42c9125..f5e7153 100644
+--- a/shell/ash.c
++++ b/shell/ash.c
+@@ -8336,6 +8336,7 @@ evaltree(union node *n, int flags)
+ 	void (*evalfn)(union node *, int);
+ 	int status;
+ 	int int_level;
++	struct stackmark smark;
+ 
+ 	SAVE_INT(int_level);
+ 
+@@ -8375,6 +8376,7 @@ evaltree(union node *n, int flags)
+ 		status = !exitstatus;
+ 		goto setstatus;
+ 	case NREDIR:
++		setstackmark(&smark);
+ 		expredir(n->nredir.redirect);
+ 		status = redirectsafe(n->nredir.redirect, REDIR_PUSH);
+ 		if (!status) {
+@@ -8382,6 +8384,7 @@ evaltree(union node *n, int flags)
+ 			status = exitstatus;
+ 		}
+ 		popredir(/*drop:*/ 0, /*restore:*/ 0 /* not sure */);
++		popstackmark(&smark);
+ 		goto setstatus;
+ 	case NCMD:
+ 		evalfn = evalcommand;
+-- 
+1.9.1
+
diff --git a/meta/recipes-core/busybox/busybox_1.23.2.bb b/meta/recipes-core/busybox/busybox_1.23.2.bb
index e4d9f97..54f3314 100644
--- a/meta/recipes-core/busybox/busybox_1.23.2.bb
+++ b/meta/recipes-core/busybox/busybox_1.23.2.bb
@@ -36,6 +36,7 @@ SRC_URI = "http://www.busybox.net/downloads/busybox-${PV}.tar.bz2;name=tarball \
            file://sha1sum.cfg \
            file://sha256sum.cfg \
            file://getopts.cfg \
+           file://0001-ash-fix-memory-leak-in-ash.patch \
 "
 
 SRC_URI[tarball.md5sum] = "7925683d7dd105aabe9b6b618d48cc73"
diff --git a/meta/recipes-core/busybox/busybox_git.bb b/meta/recipes-core/busybox/busybox_git.bb
index ade72f4..71b725f 100644
--- a/meta/recipes-core/busybox/busybox_git.bb
+++ b/meta/recipes-core/busybox/busybox_git.bb
@@ -41,6 +41,7 @@ SRC_URI = "git://busybox.net/busybox.git \
            file://mount-via-label.cfg \
            file://sha1sum.cfg \
            file://sha256sum.cfg \
+           file://0001-ash-fix-memory-leak-in-ash.patch \
 "
 
 EXTRA_OEMAKE += "V=1 ARCH=${TARGET_ARCH} CROSS_COMPILE=${TARGET_PREFIX} SKIP_STRIP=y"
-- 
1.9.1


