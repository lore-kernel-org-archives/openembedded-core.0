Return-Path: <pjtexier@koncepto.io>
Received: from koncepto.io (koncepto.io [195.154.119.111])
	by mail.openembedded.org (Postfix) with ESMTP id 44471601D9
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Feb 2020 17:35:16 +0000 (UTC)
Received: from menoah.home (lfbn-bor-1-1500-88.w193-250.abo.wanadoo.fr
	[193.250.66.88]) by koncepto.io (Postfix) with ESMTPSA id 48569600A9;
	Wed, 26 Feb 2020 18:35:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=koncepto.io;
	s=default; t=1582738514;
	bh=iNhyl9PwGVlY62GwToGi9i4KjTtaTjtcHpA8EZNWTJs=;
	h=From:To:Cc:Subject:Date:From;
	b=JetFRQ85HuhUBWPwQ24tDeQe0UcVIKonWUCHGVS+z+d11P+6BamSmID5Xt9FVprXr
	c+FiIpCMAXgfM4Cn7pA7SL4xWAo1Ld4vE9Mx4bvhYr161UsDKynZXmN/qOpgRauZbz
	6Xe7Bo27csG1x7/LqA0wwzLVdGO7TIJCPLtESxCu8j9+XnfJo3c/MbeQnSIxCT0CnQ
	NLg2lcfIIhfrM48gXGLdch2uK1ikRylPrYxAM8X8GIvj3XW/pLA3x0p3tAd3+3vHsK
	vz4oru/kDOpQXnglqkQoz60GXba4K2NnOmqQQXp2QZ1w1JdzexqNR2wvxtp+cXu4Ob
	arEOr7rCrS8fg==
From: Pierre-Jean Texier <pjtexier@koncepto.io>
To: openembedded-core@lists.openembedded.org
Date: Wed, 26 Feb 2020 18:35:06 +0100
Message-Id: <1582738506-3389-1-git-send-email-pjtexier@koncepto.io>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH v2] util-linux: upgrade 2.34 -> 2.35.1
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
X-List-Received-Date: Wed, 26 Feb 2020 17:35:16 -0000

License-Update: add GPLv3 text in README.licensing

Also:
 - Drop upstreamed patch
 - Use 'disable-hwclock-gplv3' explicitly.

Since commit 7a3000f7ba548cf7d74ac77cc63fe8de228a669e ("hwclock: use parse_date function") hwclock is linked
with parse_date.y from gnullib. This gnulib code is distributed with GPLv3.
So, we have to use '--disable-hwclock-gplv3' to exclude this code.

See full changelog https://lore.kernel.org/util-linux/20200131095846.ogjtqrs7ai774tka@ws.net.home/T/#u

Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
---
Changes v1 -> v2
 - bump to 2.35.1 instead of 2.35
 - use disable-hwclock-gplv3 option to not use datetime parsing GPLv3 code
 
FYI, hwclock will be made GPLv2-only again in v2.36, see:

 - https://lore.kernel.org/util-linux/20200127202152.4jh2w4chch37wgee@ws.net.home/T/#e0c176440ca3f7b10693ff8f0afaf114b4b94405d

 meta/recipes-core/util-linux/util-linux.inc        |  3 +-
 ...lsblk-force-to-print-PKNAME-for-partition.patch | 36 ----------------------
 meta/recipes-core/util-linux/util-linux_2.34.bb    | 14 ---------
 meta/recipes-core/util-linux/util-linux_2.35.1.bb  | 13 ++++++++
 4 files changed, 15 insertions(+), 51 deletions(-)
 delete mode 100644 meta/recipes-core/util-linux/util-linux/0001-lsblk-force-to-print-PKNAME-for-partition.patch
 delete mode 100644 meta/recipes-core/util-linux/util-linux_2.34.bb
 create mode 100644 meta/recipes-core/util-linux/util-linux_2.35.1.bb

diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-core/util-linux/util-linux.inc
index 179cb3d..0566569 100644
--- a/meta/recipes-core/util-linux/util-linux.inc
+++ b/meta/recipes-core/util-linux/util-linux.inc
@@ -8,7 +8,7 @@ SECTION = "base"
 
 LICENSE = "GPLv2+ & LGPLv2.1+ & BSD-3-Clause & BSD-4-Clause"
 
-LIC_FILES_CHKSUM = "file://README.licensing;md5=972a134f1e14b2b060e365df2fab0099 \
+LIC_FILES_CHKSUM = "file://README.licensing;md5=0fd5c050c6187d2bf0a4492b7f4e33da \
                     file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     file://Documentation/licenses/COPYING.GPL-2.0-or-later;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     file://Documentation/licenses/COPYING.LGPL-2.1-or-later;md5=4fbd65380cdd255951079008b364516c \
@@ -105,6 +105,7 @@ EXTRA_OECONF = "\
 EXTRA_OECONF_append_class-target = " --enable-setpriv"
 EXTRA_OECONF_append_class-native = " --without-cap-ng --disable-setpriv"
 EXTRA_OECONF_append_class-nativesdk = " --without-cap-ng --disable-setpriv"
+EXTRA_OECONF_append = " --disable-hwclock-gplv3"
 
 # enable pcre2 for native/nativesdk to match host distros
 # this helps to keep same expectations when using the SDK or
diff --git a/meta/recipes-core/util-linux/util-linux/0001-lsblk-force-to-print-PKNAME-for-partition.patch b/meta/recipes-core/util-linux/util-linux/0001-lsblk-force-to-print-PKNAME-for-partition.patch
deleted file mode 100644
index 5d4c148..0000000
--- a/meta/recipes-core/util-linux/util-linux/0001-lsblk-force-to-print-PKNAME-for-partition.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From e3bb9bfb76c17b1d05814436ced62c05c4011f48 Mon Sep 17 00:00:00 2001
-From: Karel Zak <kzak@redhat.com>
-Date: Thu, 27 Jun 2019 09:22:18 +0200
-Subject: [PATCH] lsblk: force to print PKNAME for partition
-
-PKNAME (parent kernel device name) is based on printed tree according
-to parent -> child relationship. The tree is optional and not printed
-if partition specified (.e.g "lsblk -o+PKNAME /dev/sda1"), but old
-versions print the PKNAME also in this case.
-
-Upstream-Status: Backport [https://github.com/karelzak/util-linux/commit/e3bb9bfb76c17b1d05814436ced62c05c4011f48]
-
-Addresses: https://github.com/karelzak/util-linux/issues/813
-Signed-off-by: Karel Zak <kzak@redhat.com>
-Signed-off-by: Liwei Song <liwei.song@windriver.com>
----
- misc-utils/lsblk.c | 3 +++
- 1 file changed, 3 insertions(+)
-
-diff --git a/misc-utils/lsblk.c b/misc-utils/lsblk.c
-index e95af7af0256..3ce6da730264 100644
---- a/misc-utils/lsblk.c
-+++ b/misc-utils/lsblk.c
-@@ -1019,6 +1019,9 @@ static void device_to_scols(
- 	DBG(DEV, ul_debugobj(dev, "add '%s' to scols", dev->name));
- 	ON_DBG(DEV, if (ul_path_isopen_dirfd(dev->sysfs)) ul_debugobj(dev, " %s ---> is open!", dev->name));
- 
-+	if (!parent && dev->wholedisk)
-+		parent = dev->wholedisk;
-+
- 	/* Do not print device more than one in --list mode */
- 	if (!(lsblk->flags & LSBLK_TREE) && dev->is_printed)
- 		return;
--- 
-2.17.1
-
diff --git a/meta/recipes-core/util-linux/util-linux_2.34.bb b/meta/recipes-core/util-linux/util-linux_2.34.bb
deleted file mode 100644
index 557449d..0000000
--- a/meta/recipes-core/util-linux/util-linux_2.34.bb
+++ /dev/null
@@ -1,14 +0,0 @@
-require util-linux.inc
-
-SRC_URI += "file://configure-sbindir.patch \
-            file://runuser.pamd \
-            file://runuser-l.pamd \
-            file://ptest.patch \
-            file://run-ptest \
-            file://display_testname_for_subtest.patch \
-            file://avoid_parallel_tests.patch \
-            file://0001-lsblk-force-to-print-PKNAME-for-partition.patch \
-            file://0001-hwclock-fix-for-glibc-2.31-settimeofday.patch \
-"
-SRC_URI[md5sum] = "a78cbeaed9c39094b96a48ba8f891d50"
-SRC_URI[sha256sum] = "743f9d0c7252b6db246b659c1e1ce0bd45d8d4508b4dfa427bbb4a3e9b9f62b5"
diff --git a/meta/recipes-core/util-linux/util-linux_2.35.1.bb b/meta/recipes-core/util-linux/util-linux_2.35.1.bb
new file mode 100644
index 0000000..03afd2a
--- /dev/null
+++ b/meta/recipes-core/util-linux/util-linux_2.35.1.bb
@@ -0,0 +1,13 @@
+require util-linux.inc
+
+SRC_URI += "file://configure-sbindir.patch \
+            file://runuser.pamd \
+            file://runuser-l.pamd \
+            file://ptest.patch \
+            file://run-ptest \
+            file://display_testname_for_subtest.patch \
+            file://avoid_parallel_tests.patch \
+            file://0001-hwclock-fix-for-glibc-2.31-settimeofday.patch \
+"
+SRC_URI[md5sum] = "7f64882f631225f0295ca05080cee1bf"
+SRC_URI[sha256sum] = "d9de3edd287366cd908e77677514b9387b22bc7b88f45b83e1922c3597f1d7f9"
-- 
2.7.4


