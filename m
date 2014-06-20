Return-Path: <Kai.Kang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 0470260889
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Jun 2014 06:06:40 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s5K66evX003952
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Jun 2014 23:06:41 -0700 (PDT)
Received: from pek-kkang-d1.corp.ad.wrs.com (128.224.162.231) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.3.169.1; Thu, 19 Jun 2014 23:06:40 -0700
From: Kai Kang <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 20 Jun 2014 14:06:30 +0800
Message-ID: <1403244390-5074-1-git-send-email-kai.kang@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [128.224.162.231]
Subject: [PATCH] syslinux: fix isohybird overflows on 32 bit system
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
X-List-Received-Date: Fri, 20 Jun 2014 06:06:49 -0000
Content-Type: text/plain

When call isohybrid with option '-u', it overflows on a 32 bits host. It
seeks to 512 bytes before the end of the image to install gpt header. If
the size of image is larger than LONG_MAX, it overflows fseek() and
cause error:

isohybrid: wrlinux-image-x86-64-20140505110100.iso: seek error - 8: Invalid argument

Replace fseek with fseeko to fix this issue.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 .../isohybrid-fix-overflow-on-32-bit-system.patch  | 40 ++++++++++++++++++++++
 meta/recipes-devtools/syslinux/syslinux_6.01.bb    |  4 ++-
 2 files changed, 43 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/syslinux/files/isohybrid-fix-overflow-on-32-bit-system.patch

diff --git a/meta/recipes-devtools/syslinux/files/isohybrid-fix-overflow-on-32-bit-system.patch b/meta/recipes-devtools/syslinux/files/isohybrid-fix-overflow-on-32-bit-system.patch
new file mode 100644
index 0000000..09a6945
--- /dev/null
+++ b/meta/recipes-devtools/syslinux/files/isohybrid-fix-overflow-on-32-bit-system.patch
@@ -0,0 +1,40 @@
+Upstream-Status: Backport
+
+Signed-off-by: Kai Kang <kai.kang@windriver.com>
+
+From bc360f8dbdf27bff07bb5db8d0ea9a7b10d8e3d1 Mon Sep 17 00:00:00 2001
+From: Kai Kang <kai.kang@windriver.com>
+Date: Fri, 20 Jun 2014 11:32:11 +0800
+Subject: [PATCH 1/2] isohybrid: fix overflow on 32 bit system
+
+When call isohybrid with option '-u', it overflows on a 32 bits host. It
+seeks to 512 bytes before the end of the image to install gpt header. If
+the size of image is larger than LONG_MAX, it overflows fseek() and
+cause error:
+
+isohybrid: image-x86-64-20140505110100.iso: seek error - 8: Invalid argument
+
+Replace fseek with fseeko to fix this issue.
+
+Signed-off-by: Kai Kang <kai.kang@windriver.com>
+Signed-off-by: H. Peter Anvin <hpa@zytor.com>
+---
+ utils/isohybrid.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/utils/isohybrid.c b/utils/isohybrid.c
+index 410bb60..23fc6c0 100644
+--- a/utils/isohybrid.c
++++ b/utils/isohybrid.c
+@@ -1126,7 +1126,7 @@ main(int argc, char *argv[])
+ 	 * end of the image
+ 	 */
+ 
+-	if (fseek(fp, (isostat.st_size + padding) - orig_gpt_size - 512,
++	if (fseeko(fp, (isostat.st_size + padding) - orig_gpt_size - 512,
+ 		  SEEK_SET))
+ 	    err(1, "%s: seek error - 8", argv[0]);
+ 
+-- 
+1.9.1
+
diff --git a/meta/recipes-devtools/syslinux/syslinux_6.01.bb b/meta/recipes-devtools/syslinux/syslinux_6.01.bb
index 89204b0..e8a1fd4 100644
--- a/meta/recipes-devtools/syslinux/syslinux_6.01.bb
+++ b/meta/recipes-devtools/syslinux/syslinux_6.01.bb
@@ -13,7 +13,9 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/boot/syslinux/6.xx/syslinux-${PV}.tar
            file://0002-memscan-build-a-linked-list-of-memory-scanners.patch \
            file://0003-PXELINUX-Add-bios-memscan-function.patch \
            file://0004-pxe-use-bios_fbm-and-real_base_mem-to-calculate-free.patch \
-           file://syslinux-fix-parallel-building-issue.patch"
+           file://syslinux-fix-parallel-building-issue.patch \
+           file://isohybrid-fix-overflow-on-32-bit-system.patch \
+           "
 
 SRC_URI[md5sum] = "6945ee89e29119d459baed4937bbc534"
 SRC_URI[sha256sum] = "83a04cf81e6a46b80ee5a321926eea095af3498b04317e3674b46c125c7a5b43"
-- 
1.9.1


