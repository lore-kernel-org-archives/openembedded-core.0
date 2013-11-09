Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id CEFF16D200
	for <openembedded-core@lists.openembedded.org>;
	Sat,  9 Nov 2013 07:21:44 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id rA97LjwK022969
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 8 Nov 2013 23:21:46 -0800 (PST)
Received: from pek-hostel-vm02.wrs.com (128.224.153.172) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.347.0; Fri, 8 Nov 2013 23:21:45 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sat, 9 Nov 2013 02:21:41 -0500
Message-ID: <26b1c0d91a264f6977eeb4d22ebb15c285c057c2.1383981651.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1383981651.git.liezhi.yang@windriver.com>
References: <cover.1383981651.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] e2fsprogs: fix tests/f_extent_oobounds
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
X-List-Received-Date: Sat, 09 Nov 2013 07:21:45 -0000
Content-Type: text/plain

tests/f_extent_oobounds runs debugfs from the system, not from the
source tree, and if the system's debugfs doesn't have the extent_open
command it fails silently.

Use $DEBUGFS and $MKE2FS to get the in-tree executables for this test,
just like other test scripts do.

(Build machines which run make check shouldn't need to have e2fsprogs
installed, and we should be testing just-built versions of the tools
anyway)

This patch is from:
http://www.spinics.net/lists/linux-ext4/msg38880.html

Eric Sandeen had sent it to the linux-ext4 mailing list, but haven't
been merge by now.

[YOCTO #5511]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 .../e2fsprogs-fix-tests-f_extent_oobounds.patch    |   43 ++++++++++++++++++++
 .../recipes-devtools/e2fsprogs/e2fsprogs_1.42.8.bb |    1 +
 2 files changed, 44 insertions(+)
 create mode 100644 meta/recipes-devtools/e2fsprogs/e2fsprogs-1.42.8/e2fsprogs-fix-tests-f_extent_oobounds.patch

diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs-1.42.8/e2fsprogs-fix-tests-f_extent_oobounds.patch b/meta/recipes-devtools/e2fsprogs/e2fsprogs-1.42.8/e2fsprogs-fix-tests-f_extent_oobounds.patch
new file mode 100644
index 0000000..a4f7077
--- /dev/null
+++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs-1.42.8/e2fsprogs-fix-tests-f_extent_oobounds.patch
@@ -0,0 +1,43 @@
+From 1bfd0e015be7dd22a44995dd2a7002328aedc0e6 Mon Sep 17 00:00:00 2001
+From: Robert Yang <liezhi.yang@windriver.com>
+Date: Sat, 9 Nov 2013 22:24:37 +0800
+Subject: [PATCH] e2fsprogs: fix tests/f_extent_oobounds
+
+Use $DEBUGFS and $MKE2FS to get the in-tree executables
+for this test.
+
+(Build machines which run make check shouldn't need to have
+e2fsprogs installed, and we should be testing just-built versions
+of the tools anyway)
+
+This patch is from:
+http://www.spinics.net/lists/linux-ext4/msg38880.html
+
+Eric Sandeen had sent it to the upstream, but haven't been merge by now.
+
+Upstream-Status: Backport
+
+Signed-off-by: Eric Sandeen <sandeen@xxxxxxxxxx>
+Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
+---
+ tests/f_extent_oobounds/script | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/tests/f_extent_oobounds/script b/tests/f_extent_oobounds/script
+index 31ac6c9..b00b031 100644
+--- a/tests/f_extent_oobounds/script
++++ b/tests/f_extent_oobounds/script
+@@ -4,8 +4,8 @@ SKIP_GUNZIP="true"
+ TEST_DATA="$test_name.tmp"
+ 
+ dd if=/dev/zero of=$TMPFILE bs=1k count=256 > /dev/null 2>&1
+-mke2fs -Ft ext4 $TMPFILE > /dev/null 2>&1
+-debugfs -w $TMPFILE << EOF  > /dev/null 2>&1
++$MKE2FS -Ft ext4 $TMPFILE > /dev/null 2>&1
++$DEBUGFS -w $TMPFILE << EOF  > /dev/null 2>&1
+ write /dev/null testfile
+ extent_open testfile
+   insert_node 0 15 100
+-- 
+1.8.3.1
+
diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.42.8.bb b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.42.8.bb
index 154b864..22ad925 100644
--- a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.42.8.bb
+++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.42.8.bb
@@ -8,6 +8,7 @@ SRC_URI += "file://acinclude.m4 \
             file://fix-icache.patch \
             file://debugfs-extent-header.patch \
             file://populate-extfs.sh \
+            file://e2fsprogs-fix-tests-f_extent_oobounds.patch \
 "
 
 SRC_URI[md5sum] = "8ef664b6eb698aa6b733df59b17b9ed4"
-- 
1.7.10.4


