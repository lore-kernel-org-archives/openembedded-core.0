Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 0895760144
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Mar 2014 07:01:32 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s2Q71XAE023056
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Mar 2014 00:01:33 -0700 (PDT)
Received: from pek-hostel-vm02.wrs.com (128.224.153.172) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.169.1; Wed, 26 Mar 2014 00:01:32 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 26 Mar 2014 03:01:29 -0400
Message-ID: <7bb935ada71d07f3496a2ff8d2d73fe003e09a4f.1395816581.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1395816581.git.liezhi.yang@windriver.com>
References: <cover.1395816581.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] util-linux-native: fix qsort_r for CentOS 5.10
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
X-List-Received-Date: Wed, 26 Mar 2014 07:01:34 -0000
Content-Type: text/plain

The qsort_r() was added to glibc in version 2.8, so there is no qsort_r() on
the host like CentOS 5.x, use qsort() to fix it since they are nearly
identical.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 .../util-linux/util-linux-native-qsort.patch       |   34 ++++++++++++++++++++
 meta/recipes-core/util-linux/util-linux_2.24.1.bb  |    4 ++-
 2 files changed, 37 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-core/util-linux/util-linux/util-linux-native-qsort.patch

diff --git a/meta/recipes-core/util-linux/util-linux/util-linux-native-qsort.patch b/meta/recipes-core/util-linux/util-linux/util-linux-native-qsort.patch
new file mode 100644
index 0000000..1707683
--- /dev/null
+++ b/meta/recipes-core/util-linux/util-linux/util-linux-native-qsort.patch
@@ -0,0 +1,34 @@
+From f220d809be1baa654503bf6ff52f3630b0d7015c Mon Sep 17 00:00:00 2001
+From: Robert Yang <liezhi.yang@windriver.com>
+Date: Wed, 26 Mar 2014 01:30:29 +0000
+Subject: [PATCH] sun.c: use qsort() to instead of qsort_r()
+
+qsort_r() was added to glibc in version 2.8, so there is no qsort_r() on
+the host like CentOS 5.x.
+
+Upstream-Status: Inappropriate [Other]
+
+Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
+---
+ libfdisk/src/sun.c | 5 ++---
+ 1 file changed, 2 insertions(+), 3 deletions(-)
+
+diff --git a/libfdisk/src/sun.c b/libfdisk/src/sun.c
+index e73c701..f7899ec 100644
+--- a/libfdisk/src/sun.c
++++ b/libfdisk/src/sun.c
+@@ -427,9 +427,8 @@ static int sun_verify_disklabel(struct fdisk_context *cxt)
+         else
+             array[i] = -1;
+     }
+-    qsort_r(array,ARRAY_SIZE(array),sizeof(array[0]),
+-	  (int (*)(const void *,const void *,void *)) verify_sun_cmp,
+-	  verify_sun_starts);
++    qsort(array,ARRAY_SIZE(array),sizeof(array[0]),
++	  (int (*)(const void *,const void *)) verify_sun_cmp);
+ 
+     if (array[0] == -1) {
+ 	fdisk_info(cxt, _("No partitions defined."));
+-- 
+1.8.2.1
+
diff --git a/meta/recipes-core/util-linux/util-linux_2.24.1.bb b/meta/recipes-core/util-linux/util-linux_2.24.1.bb
index aa98b65..ab80ab6 100644
--- a/meta/recipes-core/util-linux/util-linux_2.24.1.bb
+++ b/meta/recipes-core/util-linux/util-linux_2.24.1.bb
@@ -4,7 +4,9 @@ require util-linux.inc
 # To support older hosts, we need to patch and/or revert
 # some upstream changes.  Only do this for native packages.
 OLDHOST = ""
-OLDHOST_class-native = "file://util-linux-native.patch"
+OLDHOST_class-native = "file://util-linux-native.patch \
+                        file://util-linux-native-qsort.patch \
+			"
 
 SRC_URI += "file://util-linux-ng-replace-siginterrupt.patch \
             file://util-linux-ng-2.16-mount_lock_path.patch \
-- 
1.7.10.4


