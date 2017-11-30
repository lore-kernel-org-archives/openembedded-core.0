Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id C0174784DC
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Nov 2017 01:45:46 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id vAU1jkHI014250
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Nov 2017 17:45:47 -0800 (PST)
Received: from pek-lpg-core1.wrs.com (128.224.156.132) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.361.1; Wed, 29 Nov 2017 17:45:46 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 30 Nov 2017 09:45:12 +0800
Message-ID: <218a504a761a852ee5013166b6c2b91c6db7ad05.1512006081.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1512006081.git.liezhi.yang@windriver.com>
References: <cover.1512006081.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/5] go-native: fix import error when len(TMPDIR) == 410
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
X-List-Received-Date: Thu, 30 Nov 2017 01:45:46 -0000
Content-Type: text/plain

It is used for saving file path, 500 is a little small when building in deep
path, for example, it would be failed when oe-coe's len(TMPDIR) == 410, use
1000 can fix the problem.

Fixed:
$ bitbake go-native
[snip]
gcc -isystem/workspace2/lyang1/aaaaaaaa/[snip]
exec gcc: No such file or directory
[snip]

Only go-native needs this patch since only it uses go1.4 which has src/cmd/gc/go.h.

[YOCTO #11351]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 .../go/files/0002-cmd-gc-go.h-NSYMB-500-1000.patch | 35 ++++++++++++++++++++++
 meta/recipes-devtools/go/go-native.inc             |  1 +
 2 files changed, 36 insertions(+)
 create mode 100644 meta/recipes-devtools/go/files/0002-cmd-gc-go.h-NSYMB-500-1000.patch

diff --git a/meta/recipes-devtools/go/files/0002-cmd-gc-go.h-NSYMB-500-1000.patch b/meta/recipes-devtools/go/files/0002-cmd-gc-go.h-NSYMB-500-1000.patch
new file mode 100644
index 0000000..73aff0c
--- /dev/null
+++ b/meta/recipes-devtools/go/files/0002-cmd-gc-go.h-NSYMB-500-1000.patch
@@ -0,0 +1,35 @@
+From 7228802277fa97bf3b3988eeef1ff5b8e97ab082 Mon Sep 17 00:00:00 2001
+From: Robert Yang <liezhi.yang@windriver.com>
+Date: Wed, 15 Nov 2017 14:23:48 +0800
+Subject: [PATCH] cmd/gc/go.h: NSYMB: 500 -> 1000
+
+It is used for saving file path, 500 is a little small when building in deep
+path, for example, it would be failed when oe-coe's len(TMPDIR) == 410, use
+1000 can fix the problem.
+
+Fixed:
+cmd/internal/objfile/disasm.go:18: can't find import: "cmd/internal/rsc.io/arm/armasm"
+
+Upstream-Status: Pending
+
+Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
+---
+ go/src/cmd/gc/go.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/go/src/cmd/gc/go.h b/go/src/cmd/gc/go.h
+index bbb8835..caa326c 100644
+--- a/go/src/cmd/gc/go.h
++++ b/go/src/cmd/gc/go.h
+@@ -27,7 +27,7 @@ enum
+ {
+ 	NHUNK		= 50000,
+ 	BUFSIZ		= 8192,
+-	NSYMB		= 500,
++	NSYMB		= 1000,
+ 	NHASH		= 1024,
+ 	STRINGSZ	= 200,
+ 	MAXALIGN	= 7,
+-- 
+2.7.4
+
diff --git a/meta/recipes-devtools/go/go-native.inc b/meta/recipes-devtools/go/go-native.inc
index 0791b6d..43426c0 100644
--- a/meta/recipes-devtools/go/go-native.inc
+++ b/meta/recipes-devtools/go/go-native.inc
@@ -6,6 +6,7 @@ inherit native
 
 SRC_URI_append = " http://golang.org/dl/go1.4.3.src.tar.gz;name=bootstrap;subdir=go1.4 \
                    file://0001-cmd-dist-unix.c-bprintf-use-larger-buf.patch;patchdir=../go1.4 \
+                   file://0002-cmd-gc-go.h-NSYMB-500-1000.patch;patchdir=../go1.4 \
 "
 SRC_URI[bootstrap.md5sum] = "dfb604511115dd402a77a553a5923a04"
 SRC_URI[bootstrap.sha256sum] = "9947fc705b0b841b5938c48b22dc33e9647ec0752bae66e50278df4f23f64959"
-- 
2.7.4


