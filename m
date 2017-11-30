Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id A2D917808D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Nov 2017 01:45:44 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id vAU1jjRN031831
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Nov 2017 17:45:45 -0800
Received: from pek-lpg-core1.wrs.com (128.224.156.132) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.361.1; Wed, 29 Nov 2017 17:45:44 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 30 Nov 2017 09:45:11 +0800
Message-ID: <12c2694b20a9198d2d4f02100ced3dbdc1351f75.1512006081.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1512006081.git.liezhi.yang@windriver.com>
References: <cover.1512006081.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/5] go-native: fix PATH issue when len(TMPDIR) == 410
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
X-List-Received-Date: Thu, 30 Nov 2017 01:45:44 -0000
Content-Type: text/plain

The buf is used for saving PATH, 4096 is a little small when building in deep
path, for example, it would be failed when oe-coe's len(TMPDIR) == 410, use
8192 can fix the problem.

Fixed:
$ bitbake go-native
[snip]
gcc -isystem/workspace2/lyang1/aaaaaaaa/[snip]
exec gcc: No such file or directory
[snip]

Only go-native needs this patch since only it uses go1.4 which has unix.c.

[YOCTO #11351]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 ...01-cmd-dist-unix.c-bprintf-use-larger-buf.patch | 38 ++++++++++++++++++++++
 meta/recipes-devtools/go/go-native.inc             |  4 ++-
 2 files changed, 41 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/go/files/0001-cmd-dist-unix.c-bprintf-use-larger-buf.patch

diff --git a/meta/recipes-devtools/go/files/0001-cmd-dist-unix.c-bprintf-use-larger-buf.patch b/meta/recipes-devtools/go/files/0001-cmd-dist-unix.c-bprintf-use-larger-buf.patch
new file mode 100644
index 0000000..82c1fc1
--- /dev/null
+++ b/meta/recipes-devtools/go/files/0001-cmd-dist-unix.c-bprintf-use-larger-buf.patch
@@ -0,0 +1,38 @@
+From 443724ac952aa9b7550dc89ac14dbea1c2cd05b0 Mon Sep 17 00:00:00 2001
+From: Robert Yang <liezhi.yang@windriver.com>
+Date: Wed, 15 Nov 2017 10:49:03 +0800
+Subject: [PATCH] cmd/dist/unix.c: bprintf(): use larger buf
+
+The buf is used for saving PATH, 4096 is a little small when building in deep
+path, for example, it would be failed when oe-coe's len(TMPDIR) == 410, use
+8192 can fix the problem.
+
+Fixed:
+[snip]
+gcc -isystem/workspace2/lyang1/aaaaaaaa/[snip]
+exec gcc: No such file or directory
+[snip]
+
+Upstream-Status: Pending
+
+Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
+---
+ go/src/cmd/dist/unix.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/go/src/cmd/dist/unix.c b/go/src/cmd/dist/unix.c
+index 4a78684..fa41964 100644
+--- a/go/src/cmd/dist/unix.c
++++ b/go/src/cmd/dist/unix.c
+@@ -32,7 +32,7 @@ char*
+ bprintf(Buf *b, char *fmt, ...)
+ {
+ 	va_list arg;
+-	char buf[4096];
++	char buf[8192];
+ 	
+ 	breset(b);
+ 	va_start(arg, fmt);
+-- 
+2.7.4
+
diff --git a/meta/recipes-devtools/go/go-native.inc b/meta/recipes-devtools/go/go-native.inc
index 95db1c2..0791b6d 100644
--- a/meta/recipes-devtools/go/go-native.inc
+++ b/meta/recipes-devtools/go/go-native.inc
@@ -4,7 +4,9 @@ nonstaging_libdir := "${libdir}"
 
 inherit native
 
-SRC_URI_append = " http://golang.org/dl/go1.4.3.src.tar.gz;name=bootstrap;subdir=go1.4"
+SRC_URI_append = " http://golang.org/dl/go1.4.3.src.tar.gz;name=bootstrap;subdir=go1.4 \
+                   file://0001-cmd-dist-unix.c-bprintf-use-larger-buf.patch;patchdir=../go1.4 \
+"
 SRC_URI[bootstrap.md5sum] = "dfb604511115dd402a77a553a5923a04"
 SRC_URI[bootstrap.sha256sum] = "9947fc705b0b841b5938c48b22dc33e9647ec0752bae66e50278df4f23f64959"
 
-- 
2.7.4


