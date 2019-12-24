Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 111F77F85F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Dec 2019 07:20:32 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id xBO7K8mR006558
	(version=TLSv1 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Dec 2019 23:20:24 -0800
Received: from pek-lpg-core1.wrs.com (128.224.156.132) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.468.0; Mon, 23 Dec 2019 23:20:19 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 24 Dec 2019 15:21:09 +0800
Message-ID: <b763cef4b8957d8140800d46391150599ef56c55.1577171808.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1577171808.git.liezhi.yang@windriver.com>
References: <cover.1577171808.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH v2 1/1] pseudo: Make realpath() remove trailing slashes
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
X-List-Received-Date: Tue, 24 Dec 2019 07:20:33 -0000
Content-Type: text/plain

Linux system's realpath() remove trailing slashes, but pseudo's doesn't, need
make them identical.

E.g., the following code (rel.c) prints '/tmp' with system's realpath, but
pseudo's realpath prints '/tmp/':

    #include <stdio.h>
    #include <limits.h>
    #include <stdlib.h>

    int main() {
        char out[PATH_MAX];
        printf("%s\n", realpath("/tmp/", out));
        return 0;
    }

$ bitbake base-passwd -cdevshell # For pseudo env
$ gcc rel.c
$ ./a.out
/tmp/ (but should be /tmp)

This patch fixes the problem.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 .../0001-realpath.c-Remove-trailing-slashes.patch  | 57 ++++++++++++++++++++++
 meta/recipes-devtools/pseudo/pseudo_git.bb         |  1 +
 2 files changed, 58 insertions(+)
 create mode 100644 meta/recipes-devtools/pseudo/files/0001-realpath.c-Remove-trailing-slashes.patch

diff --git a/meta/recipes-devtools/pseudo/files/0001-realpath.c-Remove-trailing-slashes.patch b/meta/recipes-devtools/pseudo/files/0001-realpath.c-Remove-trailing-slashes.patch
new file mode 100644
index 0000000..17829ef
--- /dev/null
+++ b/meta/recipes-devtools/pseudo/files/0001-realpath.c-Remove-trailing-slashes.patch
@@ -0,0 +1,57 @@
+From 86c9a5610e3333ad6aaadb1ac1e8b5a2c948d119 Mon Sep 17 00:00:00 2001
+From: Robert Yang <liezhi.yang@windriver.com>
+Date: Mon, 25 Nov 2019 18:46:45 +0800
+Subject: [PATCH] realpath.c: Remove trailing slashes
+
+Linux system's realpath() remove trailing slashes, but pseudo's doesn't, need
+make them identical.
+
+E.g., the following code (rel.c) prints '/tmp' with system's realpath, but
+pseudo's realpath prints '/tmp/':
+
+    #include <stdio.h>
+    #include <limits.h>
+    #include <stdlib.h>
+
+    int main() {
+        char out[PATH_MAX];
+        printf("%s\n", realpath("/tmp/", out));
+        return 0;
+    }
+
+$ bitbake base-passwd -cdevshell # For pseudo env
+$ gcc rel.c
+$ ./a.out
+/tmp/ (but should be /tmp)
+
+This patch fixes the problem.
+
+Upstream-Status: Submitted [https://lists.yoctoproject.org/g/poky/message/11879]
+
+Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
+---
+ ports/unix/guts/realpath.c |    9 ++++++++-
+ 1 file changed, 8 insertions(+), 1 deletion(-)
+
+diff --git a/ports/unix/guts/realpath.c b/ports/unix/guts/realpath.c
+--- a/ports/unix/guts/realpath.c
++++ b/ports/unix/guts/realpath.c
+@@ -14,7 +14,14 @@
+ 		errno = ENAMETOOLONG;
+ 		return NULL;
+ 	}
+-	if ((len = strlen(rname)) >= pseudo_sys_path_max()) {
++		len = strlen(rname);
++		char *ep = rname + len - 1;
++		while (ep > rname && *ep == '/') {
++			--len;
++			*(ep--) = '\0';
++		}
++
++		if (len >= pseudo_sys_path_max()) {
+ 		errno = ENAMETOOLONG;
+ 		return NULL;
+ 	}
+-- 
+2.7.4
+
diff --git a/meta/recipes-devtools/pseudo/pseudo_git.bb b/meta/recipes-devtools/pseudo/pseudo_git.bb
index 1f2df4a..7c75293 100644
--- a/meta/recipes-devtools/pseudo/pseudo_git.bb
+++ b/meta/recipes-devtools/pseudo/pseudo_git.bb
@@ -8,6 +8,7 @@ SRC_URI = "git://git.yoctoproject.org/pseudo \
            file://toomanyfiles.patch \
            file://0001-maketables-wrappers-use-Python-3.patch \
            file://0001-Add-statx.patch \
+           file://0001-realpath.c-Remove-trailing-slashes.patch \
            "
 
 SRCREV = "060058bb29f70b244e685b3c704eb0641b736f73"
-- 
2.7.4


