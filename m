Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 4609C601A0
	for <openembedded-core@lists.openembedded.org>;
	Sat, 16 Aug 2014 05:15:02 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s7G5F3UH005948
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Aug 2014 22:15:03 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.174.1;
	Fri, 15 Aug 2014 22:15:03 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 15 Aug 2014 22:15:02 -0700
Message-ID: <ff7a9e4f5b0e1149f7a16194f6055e9eb4c67d08.1408166066.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1408166066.git.liezhi.yang@windriver.com>
References: <cover.1408166066.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] syslinux: fix race issue
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
X-List-Received-Date: Sat, 16 Aug 2014 05:15:07 -0000
Content-Type: text/plain

Fixed do_install failed:
cp -r syslinux-6.01/com32/libupload/*.h image/usr/share/syslinux/com32/include/
[snip]
rm -rf image/usr/share/syslinux/com32/include
[snip]
cp: cannot create regular file `image/usr/share/syslinux/com32/include/serial.h': No such file or directory

The cp is happened in the "libupload" dir, while "rm -fr" is happend in
"lib" dir, let "libupload" depend "lib" will fix the problem.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 .../files/syslinux-libupload-depend-lib.patch      |   34 ++++++++++++++++++++
 meta/recipes-devtools/syslinux/syslinux_6.01.bb    |    1 +
 2 files changed, 35 insertions(+)
 create mode 100644 meta/recipes-devtools/syslinux/files/syslinux-libupload-depend-lib.patch

diff --git a/meta/recipes-devtools/syslinux/files/syslinux-libupload-depend-lib.patch b/meta/recipes-devtools/syslinux/files/syslinux-libupload-depend-lib.patch
new file mode 100644
index 0000000..c0714b5
--- /dev/null
+++ b/meta/recipes-devtools/syslinux/files/syslinux-libupload-depend-lib.patch
@@ -0,0 +1,34 @@
+From 490fc3bbd65c2c252c1fdf3da0fac9898aa9eea6 Mon Sep 17 00:00:00 2001
+From: Robert Yang <liezhi.yang@windriver.com>
+Date: Fri, 15 Aug 2014 21:09:16 -0700
+Subject: [PATCH] com32/Makefile: fix parallel issue
+
+Fixed:
+cp -r syslinux-6.01/com32/libupload/*.h image/usr/share/syslinux/com32/include/
+[snip]
+rm -rf image/usr/share/syslinux/com32/include
+[snip]
+cp: cannot create regular file `image/usr/share/syslinux/com32/include/serial.h': No such file or directory
+
+The cp is happened in the "libupload" dir, while "rm -fr" is happend in
+"lib" dir, let "libupload" depend "lib" will fix the problem.
+
+Upstream-Status: Pending
+
+Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
+---
+ com32/Makefile |    1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/com32/Makefile b/com32/Makefile
+index 9a1721b..f172db2 100644
+--- a/com32/Makefile
++++ b/com32/Makefile
+@@ -21,3 +21,4 @@ rosh: lib libutil
+ samples: libutil elflink/ldlinux
+ sysdump: libupload gpllib
+ gpllib: lib
++libupload: lib
+-- 
+1.7.9.5
+
diff --git a/meta/recipes-devtools/syslinux/syslinux_6.01.bb b/meta/recipes-devtools/syslinux/syslinux_6.01.bb
index 2377cc0..7885390 100644
--- a/meta/recipes-devtools/syslinux/syslinux_6.01.bb
+++ b/meta/recipes-devtools/syslinux/syslinux_6.01.bb
@@ -15,6 +15,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/boot/syslinux/6.xx/syslinux-${PV}.tar
            file://0004-pxe-use-bios_fbm-and-real_base_mem-to-calculate-free.patch \
            file://syslinux-fix-parallel-building-issue.patch \
            file://isohybrid-fix-overflow-on-32-bit-system.patch \
+           file://syslinux-libupload-depend-lib.patch \
            "
 
 SRC_URI[md5sum] = "6945ee89e29119d459baed4937bbc534"
-- 
1.7.9.5


