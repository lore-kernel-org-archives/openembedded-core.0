Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 842B56AE37
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Dec 2013 15:16:27 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id rBAFGMf3007050
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 10 Dec 2013 07:16:22 -0800 (PST)
Received: from yow-bashfiel-d3.wrs.com (128.224.147.67) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.347.0; Tue, 10 Dec 2013 07:16:22 -0800
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Tue, 10 Dec 2013 10:16:15 -0500
Message-ID: <7caaf1465b9b4799abf2fd03a05f427da7526b50.1386688151.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1386688151.git.bruce.ashfield@windriver.com>
References: <cover.1386688151.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/1] linux-libc-headers: fix MIPS klibc build error
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
X-List-Received-Date: Tue, 10 Dec 2013 15:16:27 -0000
Content-Type: text/plain

As reported by Andrea Adami, klibc fails to build for MIPS with the 3.10 libc-headers

commit ca044f9a [UAPI: fix endianness conditionals in linux/raid/md_p.h] is the root
cause of the breakage.

This is fixed in the kernel source itself, but we must also carry the
change in the linux-libc-headers recipe, until we update past the
3.13 kernel.

With this change, we can again build klibc for mips, with no impact
on the rest of the system.

cc: Andrea Adami <andrea.adami@gmail.com>
Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 ...lude-asm-byteorder.h-in-linux-raid-md_p.h.patch | 34 ++++++++++++++++++++++
 .../linux-libc-headers/linux-libc-headers_3.10.bb  |  3 ++
 2 files changed, 37 insertions(+)
 create mode 100644 meta/recipes-kernel/linux-libc-headers/linux-libc-headers/UAPI-include-asm-byteorder.h-in-linux-raid-md_p.h.patch

diff --git a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers/UAPI-include-asm-byteorder.h-in-linux-raid-md_p.h.patch b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers/UAPI-include-asm-byteorder.h-in-linux-raid-md_p.h.patch
new file mode 100644
index 000000000000..1bf0e7ec85f0
--- /dev/null
+++ b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers/UAPI-include-asm-byteorder.h-in-linux-raid-md_p.h.patch
@@ -0,0 +1,34 @@
+From c0f8bd146a8b3e630798561c605f5669823107af Mon Sep 17 00:00:00 2001
+From: Aurelien Jarno <aurelien@aurel32.net>
+Date: Thu, 14 Nov 2013 15:16:19 +1100
+Subject: [PATCH] UAPI: include <asm/byteorder.h> in linux/raid/md_p.h
+
+linux/raid/md_p.h is using conditionals depending on endianess and fails
+with an error if neither of __BIG_ENDIAN, __LITTLE_ENDIAN or
+__BYTE_ORDER are defined, but it doesn't include any header which can
+define these constants. This make this header unusable alone.
+
+This patch adds a #include <asm/byteorder.h> at the beginning of this
+header to make it usable alone. This is needed to compile klibc on MIPS.
+
+Signed-off-by: Aurelien Jarno <aurelien@aurel32.net>
+Signed-off-by: NeilBrown <neilb@suse.de>
+---
+ include/uapi/linux/raid/md_p.h | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/include/uapi/linux/raid/md_p.h b/include/uapi/linux/raid/md_p.h
+index fe1a540..f7cf7f3 100644
+--- a/include/uapi/linux/raid/md_p.h
++++ b/include/uapi/linux/raid/md_p.h
+@@ -16,6 +16,7 @@
+ #define _MD_P_H
+ 
+ #include <linux/types.h>
++#include <asm/byteorder.h>
+ 
+ /*
+  * RAID superblock.
+-- 
+1.8.1.2
+
diff --git a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_3.10.bb b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_3.10.bb
index 65df230c4b0c..a78d4ba59a62 100644
--- a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_3.10.bb
+++ b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_3.10.bb
@@ -3,6 +3,9 @@ require linux-libc-headers.inc
 SRC_URI += "file://0001-ptrace.h-remove-ptrace_peeksiginfo_args.patch"
 SRC_URI += "file://scripts-Makefile.headersinst-install-headers-from-sc.patch"
 
+# fixes klibc build for MIPS, drop when libc-headers > 3.13
+SRC_URI += "file://UAPI-include-asm-byteorder.h-in-linux-raid-md_p.h.patch"
+
 SRC_URI[md5sum] = "72d0a9b3e60cd86fabcd3f24b1708944"
 SRC_URI[sha256sum] = "46c9e55e1fddf40813b8d697d5645037a8e2af5c1a8dff52b3fe82b5021582b8"
 
-- 
1.8.1.2


