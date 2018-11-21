Return-Path: <Qi.Chen@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 4A4AE6C4BA
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Nov 2018 05:35:33 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id wAL5ZEsx007857
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Nov 2018 21:35:24 -0800
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.163.141) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.408.0; Tue, 20 Nov 2018 21:35:03 -0800
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 21 Nov 2018 13:41:08 +0800
Message-ID: <1cc9b301a2a191221617cd893f58ef66fd669a7f.1542778410.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1542778410.git.Qi.Chen@windriver.com>
References: <cover.1542778410.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 7/8] busybox: fix du-l-works test case
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
X-List-Received-Date: Wed, 21 Nov 2018 05:35:33 -0000
Content-Type: text/plain

64 + 64 + 16 = 144K
144 + sizeof_a_directory >= 145
So fix to use 145 instead of 144.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 ...-du-l-works-fix-to-use-145-instead-of-144.patch | 32 ++++++++++++++++++++++
 meta/recipes-core/busybox/busybox_1.29.2.bb        |  1 +
 2 files changed, 33 insertions(+)
 create mode 100644 meta/recipes-core/busybox/busybox/0001-du-l-works-fix-to-use-145-instead-of-144.patch

diff --git a/meta/recipes-core/busybox/busybox/0001-du-l-works-fix-to-use-145-instead-of-144.patch b/meta/recipes-core/busybox/busybox/0001-du-l-works-fix-to-use-145-instead-of-144.patch
new file mode 100644
index 0000000..bb5f753
--- /dev/null
+++ b/meta/recipes-core/busybox/busybox/0001-du-l-works-fix-to-use-145-instead-of-144.patch
@@ -0,0 +1,32 @@
+From c69feb2fdb755d6db34d0eb0a9e9994386c15e3a Mon Sep 17 00:00:00 2001
+From: Chen Qi <Qi.Chen@windriver.com>
+Date: Wed, 14 Nov 2018 15:19:57 +0800
+Subject: [PATCH] du-l-works: fix to use 145 instead of 144
+
+64 + 64 + 16 = 144
+144 + size_of_directory >= 145
+So fix to use 145 instead of 144.
+
+Upstream-Status: Submitted [http://lists.busybox.net/pipermail/busybox/2018-November/086836.html]
+
+Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
+---
+ testsuite/du/du-l-works | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/testsuite/du/du-l-works b/testsuite/du/du-l-works
+index af87345..575064a 100644
+--- a/testsuite/du/du-l-works
++++ b/testsuite/du/du-l-works
+@@ -5,7 +5,7 @@ cd du.testdir
+ dd if=/dev/zero of=file1 bs=1k count=64 2>/dev/null
+ ln file1 file1.1
+ dd if=/dev/zero of=file2 bs=1k count=16 2>/dev/null
+-test x"`busybox du -l .`" = x"144	." \
++test x"`busybox du -l .`" = x"145	." \
+   -o x"`busybox du -l .`" = x"146	." \
+   -o x"`busybox du -l .`" = x"148	." \
+   -o x"`busybox du -l .`" = x"152	." \
+-- 
+2.7.4
+
diff --git a/meta/recipes-core/busybox/busybox_1.29.2.bb b/meta/recipes-core/busybox/busybox_1.29.2.bb
index 98767f0..f38db2a 100644
--- a/meta/recipes-core/busybox/busybox_1.29.2.bb
+++ b/meta/recipes-core/busybox/busybox_1.29.2.bb
@@ -43,6 +43,7 @@ SRC_URI = "http://www.busybox.net/downloads/busybox-${PV}.tar.bz2;name=tarball \
            file://makefile-libbb-race.patch \
            file://0001-testsuite-check-uudecode-before-using-it.patch \
            file://0001-testsuite-use-www.example.org-for-wget-test-cases.patch \
+           file://0001-du-l-works-fix-to-use-145-instead-of-144.patch \
 "
 SRC_URI_append_libc-musl = " file://musl.cfg "
 
-- 
1.9.1


