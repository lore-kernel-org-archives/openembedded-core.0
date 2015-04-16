Return-Path: <raj.khem@gmail.com>
Received: from mail-pd0-f177.google.com (mail-pd0-f177.google.com
	[209.85.192.177])
	by mail.openembedded.org (Postfix) with ESMTP id B456E73D3A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Apr 2015 02:00:37 +0000 (UTC)
Received: by pdbnk13 with SMTP id nk13so73370405pdb.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Apr 2015 19:00:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=7H/c09x2ENWbCcsf9xLOnBrMyrHHkNiFRXZMGEtBsmY=;
	b=m19CoKZih0lc0NfoDPjsPYpzUVrLxmFyrOBFsOBFwzoxceDHc1uh35Q4Vmsclf7nuf
	7+KFgwQestIY2Z2ljdFrPSR8C5sOyIfP507tIqOSYo4BMHWTpVGvtmfFOlHiimV8yuJ2
	9CvpAHd5vyiKNy6e1xtwG5nFH7oocqsCCld43uEgJU7ZBkGZFKbRYUs5lQbWexb73vip
	/G0kCYBmyKi8FDFkQiqyWPk/A5W8CX6PyprrKpmbi13UoeO3CSQBYM1TU94x5KGBUjrC
	4yA14qLxzkgO4y9LpTHD/uBS4F2eBnhOEdZYtYAACyPxdM+pPvvz9GuP9WLvA4TTf3HT
	yqYw==
X-Received: by 10.70.33.67 with SMTP id p3mr30092567pdi.126.1429149638875;
	Wed, 15 Apr 2015 19:00:38 -0700 (PDT)
Received: from iMac.hsd1.ca.comcast.net (c-24-130-225-169.hsd1.ca.comcast.net.
	[24.130.225.169]) by mx.google.com with ESMTPSA id
	nt15sm5371563pdb.14.2015.04.15.19.00.37
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 15 Apr 2015 19:00:37 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 15 Apr 2015 19:00:21 -0700
Message-Id: <352b36a36b94c54044799b470fae66c8c844680d.1429149397.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <0302d234e93ab28cac466dd5eb96deb9dca3bf41.1429149397.git.raj.khem@gmail.com>
References: <0302d234e93ab28cac466dd5eb96deb9dca3bf41.1429149397.git.raj.khem@gmail.com>
In-Reply-To: <cover.1429149397.git.raj.khem@gmail.com>
References: <cover.1429149397.git.raj.khem@gmail.com>
Subject: [PATCH 04/10] dosfstools: Fix build with musl
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
X-List-Received-Date: Thu, 16 Apr 2015 02:00:41 -0000

We need to pass _GNU_SOURCE and include fcntl.h

Change-Id: Ice0597ddac3b275400880d85793ece4b300bec9b
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...ude-fcntl.h-for-getting-loff_t-definition.patch | 41 ++++++++++++++++++++++
 .../recipes-devtools/dosfstools/dosfstools_2.11.bb |  5 ++-
 2 files changed, 45 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/dosfstools/dosfstools/0001-Include-fcntl.h-for-getting-loff_t-definition.patch

diff --git a/meta/recipes-devtools/dosfstools/dosfstools/0001-Include-fcntl.h-for-getting-loff_t-definition.patch b/meta/recipes-devtools/dosfstools/dosfstools/0001-Include-fcntl.h-for-getting-loff_t-definition.patch
new file mode 100644
index 0000000..06f5b7a
--- /dev/null
+++ b/meta/recipes-devtools/dosfstools/dosfstools/0001-Include-fcntl.h-for-getting-loff_t-definition.patch
@@ -0,0 +1,41 @@
+From b7c42c6a9829bea911b22201edd7df2a9bec1a14 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Mon, 13 Apr 2015 17:52:34 -0700
+Subject: [PATCH] Include fcntl.h for getting loff_t definition
+
+Upstream-Status: Pending
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ dosfsck/dosfsck.h | 2 ++
+ dosfsck/lfn.c     | 1 +
+ 2 files changed, 3 insertions(+)
+
+diff --git a/dosfsck/dosfsck.h b/dosfsck/dosfsck.h
+index d9314b1..2076d5f 100644
+--- a/dosfsck/dosfsck.h
++++ b/dosfsck/dosfsck.h
+@@ -50,6 +50,8 @@
+ #define CT_LE_L(v) (v)
+ #endif /* __BIG_ENDIAN */
+ 
++#include <fcntl.h>
++
+ #define VFAT_LN_ATTR (ATTR_RO | ATTR_HIDDEN | ATTR_SYS | ATTR_VOLUME)
+ 
+ /* ++roman: Use own definition of boot sector structure -- the kernel headers'
+diff --git a/dosfsck/lfn.c b/dosfsck/lfn.c
+index 9b2cfc3..bb04fda 100644
+--- a/dosfsck/lfn.c
++++ b/dosfsck/lfn.c
+@@ -7,6 +7,7 @@
+ #include <string.h>
+ #include <limits.h>
+ #include <time.h>
++#include <fcntl.h>
+ 
+ #include "common.h"
+ #include "io.h"
+-- 
+2.1.4
+
diff --git a/meta/recipes-devtools/dosfstools/dosfstools_2.11.bb b/meta/recipes-devtools/dosfstools/dosfstools_2.11.bb
index d1c24b8..beec488 100644
--- a/meta/recipes-devtools/dosfstools/dosfstools_2.11.bb
+++ b/meta/recipes-devtools/dosfstools/dosfstools_2.11.bb
@@ -17,7 +17,9 @@ SRC_URI = "http://pkgs.fedoraproject.org/repo/pkgs/${BPN}/${BP}.src.tar.gz/407d4
            file://dosfstools-msdos_fs-types.patch \
            file://include-linux-types.patch \
            file://nofat32_autoselect.patch \
-           file://fix_populated_dosfs_creation.patch "
+           file://fix_populated_dosfs_creation.patch \
+	   file://0001-Include-fcntl.h-for-getting-loff_t-definition.patch \
+	   "
 
 SRC_URI[md5sum] = "407d405ade410f7597d364ab5dc8c9f6"
 SRC_URI[sha256sum] = "0eac6d12388b3d9ed78684529c1b0d9346fa2abbe406c4d4a3eb5a023c98a484"
@@ -26,6 +28,7 @@ SRC_URI[sha256sum] = "0eac6d12388b3d9ed78684529c1b0d9346fa2abbe406c4d4a3eb5a023c
 # add this in here to for sure allow for big files.
 #
 CFLAGS_append = " -D_FILE_OFFSET_BITS=64"
+CFLAGS_append_libc-musl = " -D_GNU_SOURCE"
 
 do_install () {
 	oe_runmake "PREFIX=${D}" "SBINDIR=${D}${base_sbindir}" \
-- 
2.1.4


