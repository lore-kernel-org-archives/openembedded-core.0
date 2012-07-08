Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SnuFZ-0001HK-BN
	for openembedded-core@lists.openembedded.org;
	Sun, 08 Jul 2012 18:22:21 +0200
Received: by mail-pb0-f47.google.com with SMTP id rq2so16966652pbb.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 08 Jul 2012 09:11:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=9CpqyajQ37LZO8YCYDJFHukh9TwTHIreumyGXKUsNE4=;
	b=SheburvOukWQMtg43DTQE36+GN9C1NwqUwWmMYCRRdXm0vExzZS5SeAUpbtia9y62g
	s5ba+f/XQx83QlRDgP2YDw9pTiXnnw5Plwrs9IYHH1kGYki8U9WIvbKZE/JlahyxyiAJ
	dI661ptSpLdUK3BG5VIP5deZ4cfidD8alY4z+nJmExUsBdakVXbT8C+V3LY+JNuPkE0j
	qIUYL+ScO3h3EF7cCULDOUaKNFJmPUAM3h2awtWYhLZ2h93BXSLk18bMgPtjX2+PxwcF
	ZtuuTlGo3On2K4ghf3ksVFCAdxqoCzyy8cNSEssGwf9mOpJDy7ElzC4r3wvPmr94qmN8
	4sNw==
Received: by 10.68.217.166 with SMTP id oz6mr53061667pbc.136.1341763875054;
	Sun, 08 Jul 2012 09:11:15 -0700 (PDT)
Received: from agate.agate.openembedded.org (oldbuilder.nslu2-linux.org.
	[140.211.169.168])
	by mx.google.com with ESMTPS id qp9sm25927714pbc.9.2012.07.08.09.11.13
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 08 Jul 2012 09:11:14 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun,  8 Jul 2012 09:10:24 -0700
Message-Id: <d271187be49818f446cff93067c9a114c0c46be8.1341763346.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <8e3806df2f45dfaf6bf86ce7591b8d09b873c27e.1341763346.git.raj.khem@gmail.com>
References: <8e3806df2f45dfaf6bf86ce7591b8d09b873c27e.1341763346.git.raj.khem@gmail.com>
In-Reply-To: <cover.1341763345.git.raj.khem@gmail.com>
References: <cover.1341763345.git.raj.khem@gmail.com>
Subject: [PATCH 06/19] udev: Fix build with eglibc 2.16
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 08 Jul 2012 16:22:21 -0000

Include sys/resource.h to get definition of
PRIO_PROCESS

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/udev/udev/include_resource.patch |   31 ++++++++++++++++++++
 meta/recipes-core/udev/udev_164.bb                 |    7 +++--
 2 files changed, 35 insertions(+), 3 deletions(-)
 create mode 100644 meta/recipes-core/udev/udev/include_resource.patch

diff --git a/meta/recipes-core/udev/udev/include_resource.patch b/meta/recipes-core/udev/udev/include_resource.patch
new file mode 100644
index 0000000..a46ce59
--- /dev/null
+++ b/meta/recipes-core/udev/udev/include_resource.patch
@@ -0,0 +1,31 @@
+Fixes errors like below with eglibc 2.16
+
+libudev/libudev-util-private.c:348:16: error: 'PRIO_PROCESS' undeclared (first use in this function)
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Upstream-Status: Pending
+
+Index: udev-164/libudev/libudev-util-private.c
+===================================================================
+--- udev-164.orig/libudev/libudev-util-private.c	2010-08-03 02:42:26.000000000 -0700
++++ udev-164/libudev/libudev-util-private.c	2012-07-03 10:53:35.082346684 -0700
+@@ -21,6 +21,7 @@
+ #include <grp.h>
+ #include <sys/wait.h>
+ #include <sys/param.h>
++#include <sys/resource.h>
+ 
+ #include "libudev.h"
+ #include "libudev-private.h"
+Index: udev-164/udev/udevd.c
+===================================================================
+--- udev-164.orig/udev/udevd.c	2010-10-13 04:08:29.000000000 -0700
++++ udev-164/udev/udevd.c	2012-07-03 10:53:19.214345914 -0700
+@@ -43,6 +43,7 @@
+ #include <sys/ioctl.h>
+ #include <sys/inotify.h>
+ #include <sys/utsname.h>
++#include <sys/resource.h>
+ 
+ #include "udev.h"
+ #include "sd-daemon.h"
diff --git a/meta/recipes-core/udev/udev_164.bb b/meta/recipes-core/udev/udev_164.bb
index c5813ec..2a8dd83 100644
--- a/meta/recipes-core/udev/udev_164.bb
+++ b/meta/recipes-core/udev/udev_164.bb
@@ -1,8 +1,9 @@
 include udev.inc
 
-PR = "r13"
-
-SRC_URI += "file://udev-166-v4l1-1.patch"
+PR = "r14"
 
+SRC_URI += "file://udev-166-v4l1-1.patch \
+            file://include_resource.patch \
+           "
 SRC_URI[md5sum] = "fddac2d54761ea34865af9467377ca9f"
 SRC_URI[sha256sum] = "c12e66280b5e1465f6587a8cfa47d7405c4caa7e52ce5dd13478d04f6ec05e5c"
-- 
1.7.9.5



