Received: from mail-gg0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SmnKl-0005sT-T5
	for openembedded-core@lists.openembedded.org;
	Thu, 05 Jul 2012 16:47:08 +0200
Received: by mail-gg0-f175.google.com with SMTP id p4so7047695ggn.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 05 Jul 2012 07:36:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=9CpqyajQ37LZO8YCYDJFHukh9TwTHIreumyGXKUsNE4=;
	b=ltMe0unbkqRCU3sIgN4pVofdM9vWLB6cbA7l5G1Mi/gtJXrl3E87gQ3yOj2K7L4v+F
	HpJGCSrRL56L2hga/Egko6d/j/nnNkxqkpPuOhfdcddTeMrZ2+WhSJdmKIzVWL/hRXGu
	B83czTW13oMv9nDNxWoD+3aWEOjIf96FrwGCR84rjQUC3/rBkznRKVj/GZqqxoxKhpoU
	qkhXK67hQQWWfPC9R3bxsVPBfqa0/Ht/7ChNF0hCtvE/MSwHk6pX5USS07JLV+aLOUg0
	x9Vs/kKKFHQwC8EgcZVKa29wXYN6LRWiIxanZ3NnZktwhhz2BJaJ9qUC8zF/imwxN47A
	Iefw==
Received: by 10.68.131.10 with SMTP id oi10mr28295719pbb.122.1341498965143;
	Thu, 05 Jul 2012 07:36:05 -0700 (PDT)
Received: from agate.agate.openembedded.org (oldbuilder.nslu2-linux.org.
	[140.211.169.168])
	by mx.google.com with ESMTPS id ru10sm9521262pbc.50.2012.07.05.07.36.03
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 05 Jul 2012 07:36:04 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  5 Jul 2012 07:35:25 -0700
Message-Id: <682ba6282a10e8027bcb9dec5e529dc5f17b44ff.1341498745.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <48ef71f7c5eea25278a5a9c9befd01123369e2f9.1341498745.git.raj.khem@gmail.com>
References: <48ef71f7c5eea25278a5a9c9befd01123369e2f9.1341498745.git.raj.khem@gmail.com>
In-Reply-To: <cover.1341498745.git.raj.khem@gmail.com>
References: <cover.1341498745.git.raj.khem@gmail.com>
Subject: [PATCH 06/14] udev: Fix build with eglibc 2.16
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
X-List-Received-Date: Thu, 05 Jul 2012 14:47:08 -0000

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



