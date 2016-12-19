Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f68.google.com (mail-pg0-f68.google.com [74.125.83.68])
	by mail.openembedded.org (Postfix) with ESMTP id 18DBE755C2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Dec 2016 06:40:07 +0000 (UTC)
Received: by mail-pg0-f68.google.com with SMTP id w68so1431418pgw.3
	for <openembedded-core@lists.openembedded.org>;
	Sun, 18 Dec 2016 22:40:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=k707jF/N7hRIjpuP00MNWqCfLwjJzl4Cl8SUVurxcVg=;
	b=B4Wnl3DLbrqRmMOLnjhU3SprhsnYY/eZ/mA4BUSTbX9yZqAlbXtc7/5YTNu1o0YlCl
	vXWzlmgQekK2n/B89IDXFXAnhSno4qRZcXI1+vnFJ6U2dpJHD1xo95I6cb5lkH1TX0b9
	FCJ6aEgHq9/tZhoAl3YqX+iqrevfGgi9ESEQ1UDuBmm32i6UhOdhpQh2n+41dUnKViSJ
	0X+mJtz3n1rrv+lUMN6FjGtDwlqWKry5+6yXfN74CyzbHtlw0wH3yWssIDujAAu7pR0G
	pxUWTXC6eLeRVuD68B77wuSiQAOwt3GflSR1THG+xYUE5YlzWz9I9vyZ/CuWvzIBQujM
	WdVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=k707jF/N7hRIjpuP00MNWqCfLwjJzl4Cl8SUVurxcVg=;
	b=BbILtQPV2QLcyR6b+z5+Og74S2XCAbJTBDB3oKUAm93G0yzGHc4OCnQMM9WVmHlTLe
	SW/wAnlqB1lIlEOi1djFvdmaZfEvoxZ36J1Cjml1Zs0NGyiSnicJ2kq+mfskL+eby5EZ
	KoPiNffPsNH4juAdO13pNI30u6cfmrXSRYn6qY5t9On8HzwAWmgk4/vT19Gvj+2oR5tx
	TCqzKO4vCKL6pgBXcRXNpK310PTFWNjq74wCN1Abb7NnxwLSvtrRA9HvnDT6yR03W+9M
	qnsu9NIC9GAripcfZK88Wh8I0yfAv/p+AuEtXUqjwLtVVR5wqIHEK11e9Ss04SM1rA5k
	PwrQ==
X-Gm-Message-State: AIkVDXLJUqQYAXYuAfAkiV8whl4ej8oOxLs4WSRSwCoCH72fTK4kFSsOOaIuHcOmVsl6yA==
X-Received: by 10.84.225.6 with SMTP id t6mr389651plj.168.1482129609411;
	Sun, 18 Dec 2016 22:40:09 -0800 (PST)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	72sm28238304pfw.37.2016.12.18.22.40.08
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 18 Dec 2016 22:40:08 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 18 Dec 2016 22:39:52 -0800
Message-Id: <20161219063957.18716-5-raj.khem@gmail.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20161219063957.18716-1-raj.khem@gmail.com>
References: <20161219063957.18716-1-raj.khem@gmail.com>
Subject: [V2 05/10] mdadm: Fix build with glibc 2.25
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
X-List-Received-Date: Mon, 19 Dec 2016 06:40:09 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...ys-sysmacros.h-for-major-minor-defintions.patch | 48 ++++++++++++++++++++++
 meta/recipes-extended/mdadm/mdadm_3.4.bb           |  1 +
 2 files changed, 49 insertions(+)
 create mode 100644 meta/recipes-extended/mdadm/files/0001-include-sys-sysmacros.h-for-major-minor-defintions.patch

diff --git a/meta/recipes-extended/mdadm/files/0001-include-sys-sysmacros.h-for-major-minor-defintions.patch b/meta/recipes-extended/mdadm/files/0001-include-sys-sysmacros.h-for-major-minor-defintions.patch
new file mode 100644
index 0000000000..acd64ada22
--- /dev/null
+++ b/meta/recipes-extended/mdadm/files/0001-include-sys-sysmacros.h-for-major-minor-defintions.patch
@@ -0,0 +1,48 @@
+From 943616e5dffb79f307e4bd9b249d316212998750 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sun, 18 Dec 2016 08:30:51 +0000
+Subject: [PATCH] include <sys/sysmacros.h> for major/minor defintions
+
+glibc 2.25 is warning about it if applications depend on
+sys/types.h for these macros, it expects to be included
+from <sys/sysmacros.h>
+
+Fixes
+| Grow.c:3534:13: error: In the GNU C Library, "minor" is defined
+|  by <sys/sysmacros.h>. For historical compatibility, it is
+|  currently defined by <sys/types.h> as well, but we plan to
+|  remove this soon. To use "minor", include <sys/sysmacros.h>
+|  directly. If you did not intend to use a system-defined macro
+|  "minor", you should undefine it after including <sys/types.h>. [-Werror]
+| Query.c: In function 'Query':
+| Query.c:105:13: error: In the GNU C Library, "makedev" is defined
+|  by <sys/sysmacros.h>. For historical compatibility, it is
+|  currently defined by <sys/types.h> as well, but we plan to
+|  remove this soon. To use "makedev", include <sys/sysmacros.h>
+|  directly. If you did not intend to use a system-defined macro
+|  "makedev", you should undefine it after including <sys/types.h>. [-Werror]
+|           makedev((unsigned)disc.major,(unsigned)disc.minor) == stb.st_rdev)
+|              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+Upstream-Status: Pending
+
+ mdadm.h | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/mdadm.h b/mdadm.h
+index 8c8f4d1..3ce13b5 100755
+--- a/mdadm.h
++++ b/mdadm.h
+@@ -34,6 +34,7 @@ extern __off64_t lseek64 __P ((int __fd, __off64_t __offset, int __whence));
+ #endif
+ 
+ #include	<sys/types.h>
++#include	<sys/sysmacros.h>
+ #include	<sys/stat.h>
+ #include	<stdint.h>
+ #include	<stdlib.h>
+-- 
+1.9.1
+
diff --git a/meta/recipes-extended/mdadm/mdadm_3.4.bb b/meta/recipes-extended/mdadm/mdadm_3.4.bb
index d34b885076..7bf15b51be 100644
--- a/meta/recipes-extended/mdadm/mdadm_3.4.bb
+++ b/meta/recipes-extended/mdadm/mdadm_3.4.bb
@@ -21,6 +21,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/raid/mdadm/${BPN}-${PV}.tar.xz \
            file://run-ptest \
            file://0001-raid6check-Fix-if-else-indentation.patch \
            file://0001-mdadm.h-Undefine-dprintf-before-redefining.patch \
+           file://0001-include-sys-sysmacros.h-for-major-minor-defintions.patch \
            "
 SRC_URI[md5sum] = "04b8b21f637540350f8517c7e68d3c63"
 SRC_URI[sha256sum] = "27d0be4627d38a12ddcd1c1c3721d649d4e89e1093914497e22b57245cda8808"
-- 
2.11.0


