Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id CBA9D74A32
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Aug 2018 09:16:43 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w7M9GiDo026863
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 22 Aug 2018 02:16:44 -0700 (PDT)
Received: from pek-lpg-core1-vm2.wrs.com (128.224.156.107) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.399.0; Wed, 22 Aug 2018 02:16:43 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 22 Aug 2018 17:16:42 +0800
Message-ID: <1534929402-6673-1-git-send-email-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH] mtools: fix race issue while mtools invoked frequently
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
X-List-Received-Date: Wed, 22 Aug 2018 09:16:43 -0000
Content-Type: text/plain

While invoking mtools frequently, the unblocking request
caused race issue. Here is an example of syslinux
[snip]
dd if=/dev/zero of=floppy.img bs=1024 count=144
losetup /dev/loop1 floppy.img
mkdosfs /dev/loop1
syslinux -i /dev/loop1
|plain floppy: device "/proc/6351/fd/3" busy (Resource temporarily unavailable):
|Cannot initialize 'S:'
|Bad target s:/ldlinux.sys
[snip]

The idea is from:
https://bugzilla.redhat.com/show_bug.cgi?id=1235016
https://groups.google.com/a/chromium.org/forum/#!msg/chromium-os-dev/bRPUCFHoBTQ/ZjB8kjjx1vUJ

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 ...01-remove-LOCK_NB-to-use-blocking-request.patch | 44 ++++++++++++++++++++++
 meta/recipes-devtools/mtools/mtools_4.0.18.bb      |  1 +
 2 files changed, 45 insertions(+)
 create mode 100644 meta/recipes-devtools/mtools/mtools/0001-remove-LOCK_NB-to-use-blocking-request.patch

diff --git a/meta/recipes-devtools/mtools/mtools/0001-remove-LOCK_NB-to-use-blocking-request.patch b/meta/recipes-devtools/mtools/mtools/0001-remove-LOCK_NB-to-use-blocking-request.patch
new file mode 100644
index 0000000..47385a5
--- /dev/null
+++ b/meta/recipes-devtools/mtools/mtools/0001-remove-LOCK_NB-to-use-blocking-request.patch
@@ -0,0 +1,44 @@
+From 5bdbfe0a63fed48104b17412854b26ee2275869a Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Wed, 22 Aug 2018 16:54:39 +0800
+Subject: [PATCH] remove LOCK_NB to use blocking request
+
+While invoking mtools frequently, the unblocking request
+caused race issue. Here is an example of syslinux
+[snip]
+dd if=/dev/zero of=floppy.img bs=1024 count=144
+losetup /dev/loop1 floppy.img
+mkdosfs /dev/loop1
+syslinux -i /dev/loop1
+|plain floppy: device "/proc/6351/fd/3" busy (Resource temporarily unavailable):
+|Cannot initialize 'S:'
+|Bad target s:/ldlinux.sys
+[snip]
+
+The idea is from:
+https://bugzilla.redhat.com/show_bug.cgi?id=1235016
+https://groups.google.com/a/chromium.org/forum/#!msg/chromium-os-dev/bRPUCFHoBTQ/ZjB8kjjx1vUJ
+
+Upstream-Status: Pending
+
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ lockdev.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/lockdev.h b/lockdev.h
+index 4467bc2..5a135ad 100644
+--- a/lockdev.h
++++ b/lockdev.h
+@@ -43,7 +43,7 @@ int lock_dev(int fd, int mode, struct device *dev)
+ 		return 0;
+ 
+ #if (defined(HAVE_FLOCK) && defined (LOCK_EX) && defined(LOCK_NB))
+-	if (flock(fd, (mode ? LOCK_EX : LOCK_SH)|LOCK_NB) < 0)
++	if (flock(fd, (mode ? LOCK_EX : LOCK_SH)) < 0)
+ #else /* FLOCK */
+ 
+ #if (defined(HAVE_LOCKF) && defined(F_TLOCK))
+-- 
+2.7.4
+
diff --git a/meta/recipes-devtools/mtools/mtools_4.0.18.bb b/meta/recipes-devtools/mtools/mtools_4.0.18.bb
index dcd32ed..91f7b7c 100644
--- a/meta/recipes-devtools/mtools/mtools_4.0.18.bb
+++ b/meta/recipes-devtools/mtools/mtools_4.0.18.bb
@@ -31,6 +31,7 @@ SRC_URI = "${GNU_MIRROR}/mtools/mtools-${PV}.tar.bz2 \
            file://mtools-makeinfo.patch \
            file://no-x11.gplv3.patch \
            file://0001-Continue-even-if-fs-size-is-not-divisible-by-sectors.patch \
+           file://0001-remove-LOCK_NB-to-use-blocking-request.patch \
            "
 
 SRC_URI_append_class-native = " file://disable-hardcoded-configs.patch"
-- 
2.7.4


