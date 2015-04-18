Return-Path: <armccurdy@gmail.com>
Received: from mail-ob0-f172.google.com (mail-ob0-f172.google.com
	[209.85.214.172])
	by mail.openembedded.org (Postfix) with ESMTP id C9DF3605D2
	for <openembedded-core@lists.openembedded.org>;
	Sat, 18 Apr 2015 00:26:10 +0000 (UTC)
Received: by obfe9 with SMTP id e9so81964155obf.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Apr 2015 17:26:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=Ii3vZPuw+Gbt6aGlPkZZML/8NAXuHdL/GphushFEDHY=;
	b=Ns413lCcRzPx5wNl0pBzGDA619gho/rTG3yfYZR/B+iTmamoPgKg+taGLn2jdUIz9g
	P24vKYNYr0lXvLQIVPodO5rJM1VO3N28GaVmBFwBDNQpHjhpxpPyydQhiEiOOcZCN7tw
	g+IKJC4LWC6JVhJTcq1YgGwOclGjrN7Lqj6+7Wp8bDVIe5bB4iwhCZ0tQCNLh/RFU3WX
	XZwQcFYvftLhz9TsU1xNJikv1QEziq79aeHW1L0L9vYjEH7ok6NWarrvE162ZfrTlYwH
	VWwKp5vODQS+DZBja1Dw7AIYFDuC4v+1jMoK/nFvBPMdtNvnv8hhb6XFQqxuv1DyXbcf
	Iobg==
X-Received: by 10.202.12.142 with SMTP id 136mr4945132oim.30.1429316770977;
	Fri, 17 Apr 2015 17:26:10 -0700 (PDT)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by mx.google.com with ESMTPSA id cd3sm7394199oec.2.2015.04.17.17.26.09
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 17 Apr 2015 17:26:10 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 17 Apr 2015 17:25:36 -0700
Message-Id: <1429316736-21917-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH] strace: fixes for compilation failures with musl
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
X-List-Received-Date: Sat, 18 Apr 2015 00:26:11 -0000

Backports from upstream:

  http://sourceforge.net/p/strace/code/ci/d34e00b293942b1012ddc49ed3ab379a32337611
  http://sourceforge.net/p/strace/code/ci/3460dc486d333231998de0f19918204aacee9ae3

Expected to be released officially as part of strace 4.11

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 .../Include-linux-ioctl.h-for-_IOC_-macros.patch   | 69 ++++++++++++++++++++++
 .../strace/Include-sys-stat.h-for-S_I-macros.patch | 52 ++++++++++++++++
 meta/recipes-devtools/strace/strace_4.10.bb        |  2 +
 3 files changed, 123 insertions(+)
 create mode 100644 meta/recipes-devtools/strace/strace/Include-linux-ioctl.h-for-_IOC_-macros.patch
 create mode 100644 meta/recipes-devtools/strace/strace/Include-sys-stat.h-for-S_I-macros.patch

diff --git a/meta/recipes-devtools/strace/strace/Include-linux-ioctl.h-for-_IOC_-macros.patch b/meta/recipes-devtools/strace/strace/Include-linux-ioctl.h-for-_IOC_-macros.patch
new file mode 100644
index 0000000..d9346a8
--- /dev/null
+++ b/meta/recipes-devtools/strace/strace/Include-linux-ioctl.h-for-_IOC_-macros.patch
@@ -0,0 +1,69 @@
+Upstream-Status: Backport
+
+  http://sourceforge.net/p/strace/code/ci/3460dc486d333231998de0f19918204aacee9ae3
+
+Expected to be released officially as part of strace 4.11
+
+Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
+
+From 3460dc486d333231998de0f19918204aacee9ae3 Mon Sep 17 00:00:00 2001
+From: Felix Janda <felix.janda@posteo.de>
+Date: Sat, 28 Mar 2015 18:40:13 +0100
+Subject: [PATCH] Include <linux/ioctl.h> for _IOC_* macros
+
+Fix a compilation failure with musl libc.
+
+* evdev.c: Include <linux/ioctl.h>.
+* ioctl.c: Include <linux/ioctl.h> instead of <asm/ioctl.h>.
+* ioctlsort.c: Likewise.
+
+Reported-by: Dima Krasner <dima@dimakrasner.com>
+Acked-by: Mike Frysinger <vapier@gentoo.org>
+---
+ evdev.c     | 2 ++
+ ioctl.c     | 2 +-
+ ioctlsort.c | 2 +-
+ 3 files changed, 4 insertions(+), 2 deletions(-)
+
+diff --git a/evdev.c b/evdev.c
+index 9a7430d..e06f9c1 100644
+--- a/evdev.c
++++ b/evdev.c
+@@ -28,6 +28,8 @@
+ 
+ #include "defs.h"
+ 
++#include <linux/ioctl.h>
++
+ #ifdef HAVE_LINUX_INPUT_H
+ #include <linux/input.h>
+ #include "xlat/evdev_abs.h"
+diff --git a/ioctl.c b/ioctl.c
+index 46f8334..c67d048 100644
+--- a/ioctl.c
++++ b/ioctl.c
+@@ -29,7 +29,7 @@
+  */
+ 
+ #include "defs.h"
+-#include <asm/ioctl.h>
++#include <linux/ioctl.h>
+ #include "xlat/ioctl_dirs.h"
+ 
+ #ifdef HAVE_LINUX_INPUT_H
+diff --git a/ioctlsort.c b/ioctlsort.c
+index 333556c..9c31691 100644
+--- a/ioctlsort.c
++++ b/ioctlsort.c
+@@ -33,7 +33,7 @@
+ #include <stdio.h>
+ #include <stdlib.h>
+ #include <string.h>
+-#include <asm/ioctl.h>
++#include <linux/ioctl.h>
+ 
+ struct ioctlent {
+ 	const char *info;
+-- 
+1.9.1
+
diff --git a/meta/recipes-devtools/strace/strace/Include-sys-stat.h-for-S_I-macros.patch b/meta/recipes-devtools/strace/strace/Include-sys-stat.h-for-S_I-macros.patch
new file mode 100644
index 0000000..0b072fe
--- /dev/null
+++ b/meta/recipes-devtools/strace/strace/Include-sys-stat.h-for-S_I-macros.patch
@@ -0,0 +1,52 @@
+Upstream-Status: Backport
+
+  http://sourceforge.net/p/strace/code/ci/d34e00b293942b1012ddc49ed3ab379a32337611
+
+Expected to be released officially as part of strace 4.11
+
+Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
+
+From d34e00b293942b1012ddc49ed3ab379a32337611 Mon Sep 17 00:00:00 2001
+From: Felix Janda <felix.janda@posteo.de>
+Date: Sat, 28 Mar 2015 18:21:09 +0100
+Subject: [PATCH] Include <sys/stat.h> for S_I* macros
+
+Fix a compilation failure with musl libc.
+
+* mknod.c: Include <sys/stat.h>.
+* printmode.c: Likewise.
+
+Reported-by: Dima Krasner <dima@dimakrasner.com>
+Acked-by: Mike Frysinger <vapier@gentoo.org>
+---
+ mknod.c     | 1 +
+ printmode.c | 1 +
+ 2 files changed, 2 insertions(+)
+
+diff --git a/mknod.c b/mknod.c
+index 07e9a45..1463232 100644
+--- a/mknod.c
++++ b/mknod.c
+@@ -1,6 +1,7 @@
+ #include "defs.h"
+ 
+ #include <fcntl.h>
++#include <sys/stat.h>
+ 
+ #ifdef MAJOR_IN_SYSMACROS
+ # include <sys/sysmacros.h>
+diff --git a/printmode.c b/printmode.c
+index 4df1b9f..a721936 100644
+--- a/printmode.c
++++ b/printmode.c
+@@ -1,6 +1,7 @@
+ #include "defs.h"
+ 
+ #include <fcntl.h>
++#include <sys/stat.h>
+ 
+ #include "xlat/modetypes.h"
+ 
+-- 
+1.9.1
+
diff --git a/meta/recipes-devtools/strace/strace_4.10.bb b/meta/recipes-devtools/strace/strace_4.10.bb
index 416c387..bc09619 100644
--- a/meta/recipes-devtools/strace/strace_4.10.bb
+++ b/meta/recipes-devtools/strace/strace_4.10.bb
@@ -9,6 +9,8 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/strace/strace-${PV}.tar.xz \
            file://strace-add-configure-options.patch \
            file://Makefile-ptest.patch \
            file://run-ptest \
+           file://Include-sys-stat.h-for-S_I-macros.patch \
+           file://Include-linux-ioctl.h-for-_IOC_-macros.patch \
           "
 
 SRC_URI[md5sum] = "107a5be455493861189e9b57a3a51912"
-- 
1.9.1


