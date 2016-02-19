Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 33A0677040
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Feb 2016 05:55:01 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u1J5t1jJ018680
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 18 Feb 2016 21:55:01 -0800 (PST)
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.248.2;
	Thu, 18 Feb 2016 21:55:00 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <liezhi.yang@windriver.com>,
	<ross.burton@intel.com>, <richard.purdie@linuxfoundation.org>
Date: Fri, 19 Feb 2016 00:54:43 -0500
Message-ID: <bee51e21136f7b960565b1d52a9e428dff4c7895.1455860789.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1455860789.git.hongxu.jia@windriver.com>
References: <cover.1455860789.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 5/6] btrfs-tools: fix symlink creation multiple times
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
X-List-Received-Date: Fri, 19 Feb 2016 05:55:01 -0000
Content-Type: text/plain

The rule to create symlink in Makefile caused parallel issue:
$ make -j 40 DESTDIR=/image install BUILD_VERBOSE=1
...
  1     [LN]     libbtrfs.so.0
  2     [LN]     libbtrfs.so
  3 ln -s -f libbtrfs.so.0.1 libbtrfs.so.0
  4 ln -s -f libbtrfs.so.0.1 libbtrfs.so.0
  5 ln -s -f libbtrfs.so.0.1 libbtrfs.so
  6 ln -s -f libbtrfs.so.0.1 libbtrfs.so
...

It failed occasionally:
...
|symlinkat: couldn't stat 'git/libbtrfs.so' even though symlink
creation succeeded (No such file or directory).
|ln: failed to create symbolic link 'libbtrfs.so': No such file or directory
...

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 .../fix-symlink-creation-multiple-times.patch      | 46 ++++++++++++++++++++++
 .../btrfs-tools/btrfs-tools_4.4.bb                 |  1 +
 2 files changed, 47 insertions(+)
 create mode 100644 meta/recipes-devtools/btrfs-tools/btrfs-tools/fix-symlink-creation-multiple-times.patch

diff --git a/meta/recipes-devtools/btrfs-tools/btrfs-tools/fix-symlink-creation-multiple-times.patch b/meta/recipes-devtools/btrfs-tools/btrfs-tools/fix-symlink-creation-multiple-times.patch
new file mode 100644
index 0000000..a945496
--- /dev/null
+++ b/meta/recipes-devtools/btrfs-tools/btrfs-tools/fix-symlink-creation-multiple-times.patch
@@ -0,0 +1,46 @@
+From 05ab78e9183575e38f342e05a056cb7bcd1e52e1 Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Thu, 18 Feb 2016 20:41:28 -0500
+Subject: [PATCH] btrfs-progs: fix symlink creation multiple times
+
+The rule to create symlink in Makefile caused parallel issue:
+$ make -j 40 DESTDIR=/image install BUILD_VERBOSE=1
+...
+  1     [LN]     libbtrfs.so.0
+  2     [LN]     libbtrfs.so
+  3 ln -s -f libbtrfs.so.0.1 libbtrfs.so.0
+  4 ln -s -f libbtrfs.so.0.1 libbtrfs.so.0
+  5 ln -s -f libbtrfs.so.0.1 libbtrfs.so
+  6 ln -s -f libbtrfs.so.0.1 libbtrfs.so
+...
+
+It failed occasionally:
+...
+|symlinkat: couldn't stat 'git/libbtrfs.so' even though symlink
+creation succeeded (No such file or directory).
+|ln: failed to create symbolic link 'libbtrfs.so': No such file or directory
+...
+
+Upstream-Status: Submitted [linux-btrfs@vger.kernel.org]
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ Makefile.in | 3 +--
+ 1 file changed, 1 insertion(+), 2 deletions(-)
+
+diff --git a/Makefile.in b/Makefile.in
+index 1f4002e..16eeaf9 100644
+--- a/Makefile.in
++++ b/Makefile.in
+@@ -236,8 +236,7 @@ $(libs_static): $(libbtrfs_objects)
+ 
+ $(lib_links):
+ 	@echo "    [LN]     $@"
+-	$(Q)$(LN_S) -f libbtrfs.so.0.1 libbtrfs.so.0
+-	$(Q)$(LN_S) -f libbtrfs.so.0.1 libbtrfs.so
++	$(Q)$(LN_S) -f libbtrfs.so.0.1 $@
+ 
+ # keep intermediate files from the below implicit rules around
+ .PRECIOUS: $(addsuffix .o,$(progs))
+-- 
+1.9.1
+
diff --git a/meta/recipes-devtools/btrfs-tools/btrfs-tools_4.4.bb b/meta/recipes-devtools/btrfs-tools/btrfs-tools_4.4.bb
index 5ca9bb0..9b68edc 100644
--- a/meta/recipes-devtools/btrfs-tools/btrfs-tools_4.4.bb
+++ b/meta/recipes-devtools/btrfs-tools/btrfs-tools_4.4.bb
@@ -15,6 +15,7 @@ DEPENDS = "util-linux attr e2fsprogs lzo acl"
 SRCREV = "21258fab2caeade405a15ba932d373b364aa6e8c"
 SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/kdave/btrfs-progs.git \
            file://fix-parallel.patch \
+           file://fix-symlink-creation-multiple-times.patch \
 "
 
 inherit autotools-brokensep pkgconfig
-- 
1.9.1


