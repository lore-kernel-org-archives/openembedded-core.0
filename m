Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 3DD3D6FFED
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Feb 2016 09:15:04 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u1G9F1V0018176
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 16 Feb 2016 01:15:02 -0800 (PST)
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.248.2;
	Tue, 16 Feb 2016 01:15:00 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <liezhi.yang@windriver.com>,
	<raj.khem@gmail.com>, <richard.purdie@linuxfoundation.org>
Date: Tue, 16 Feb 2016 04:14:54 -0500
Message-ID: <22470324a442ff79afe44d6438415c917d97501e.1455612645.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1455612645.git.hongxu.jia@windriver.com>
References: <cover.1455612645.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/2] gcc-4.9/5.3: Ignore -fdebug-prefix-map in producer string
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
X-List-Received-Date: Tue, 16 Feb 2016 09:15:04 -0000
Content-Type: text/plain

Backport from upstream master. The discussion detail:
https://gcc.gnu.org/bugzilla/show_bug.cgi?id=69821

Compile without this fix:
objdump -g packages-split/lib32-glibc-dev/usr/lib/gcrt1.o
...
|    <5f>   DW_AT_producer    : (indirect string, offset: 0x1b): GNU C99 5.3.0
-m32-march=core2 -mtune=core2 -msse3 -mfpmath=sse -mpreferred-stack-boundary=4
-g -O2 -std=gnu99 -fgnu89-inline -fdebug-prefix-map=/buildarea/raid0/hjia/buil
d-20160127-yocto-buildpath-2/tmp/sysroots/lib32-qemux86-64=
-feliminate-unused-debug-types -fmerge-all-constants -frounding-math
-ftls-model=initial-exec
...

Compile with this fix:
objdump -g packages-split/lib32-glibc-dev/usr/lib/gcrt1.o
...
|    <5f>   DW_AT_producer    : (indirect string, offset: 0xa1): GNU C99 5.3.0
-m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -mpreferred-stack-boundary=4
-g -O2 -std=gnu99 -fgnu89-inline -feliminate-unused-debug-types -fmerge-all-constants
-frounding-math -ftls-model=initial-exec
...

[YOCTO #7058]

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/recipes-devtools/gcc/gcc-4.9.inc              |  1 +
 ...ug-prefix-map-in-producer-string-by-Danie.patch | 31 ++++++++++++++++++++++
 meta/recipes-devtools/gcc/gcc-5.3.inc              |  1 +
 ...ug-prefix-map-in-producer-string-by-Danie.patch | 31 ++++++++++++++++++++++
 4 files changed, 64 insertions(+)
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.9/0071-Ignore-fdebug-prefix-map-in-producer-string-by-Danie.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-5.3/0051-Ignore-fdebug-prefix-map-in-producer-string-by-Danie.patch

diff --git a/meta/recipes-devtools/gcc/gcc-4.9.inc b/meta/recipes-devtools/gcc/gcc-4.9.inc
index 736c956..6412490 100644
--- a/meta/recipes-devtools/gcc/gcc-4.9.inc
+++ b/meta/recipes-devtools/gcc/gcc-4.9.inc
@@ -86,6 +86,7 @@ SRC_URI = "\
     file://0068-musl-dynamic-linker.patch \
     file://0069-musl-no-fixincludes.patch \
     file://0070-libstdc-musl.patch \
+    file://0071-Ignore-fdebug-prefix-map-in-producer-string-by-Danie.patch \
 "
 SRC_URI[md5sum] = "6f831b4d251872736e8e9cc09746f327"
 SRC_URI[sha256sum] = "2332b2a5a321b57508b9031354a8503af6fdfb868b8c1748d33028d100a8b67e"
diff --git a/meta/recipes-devtools/gcc/gcc-4.9/0071-Ignore-fdebug-prefix-map-in-producer-string-by-Danie.patch b/meta/recipes-devtools/gcc/gcc-4.9/0071-Ignore-fdebug-prefix-map-in-producer-string-by-Danie.patch
new file mode 100644
index 0000000..e8f79b5
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-4.9/0071-Ignore-fdebug-prefix-map-in-producer-string-by-Danie.patch
@@ -0,0 +1,31 @@
+From 32593b38082ea65f4c82159254adf1e0dc2423be Mon Sep 17 00:00:00 2001
+From: bernds <bernds@138bc75d-0d04-0410-961f-82ee72b054a4>
+Date: Tue, 16 Feb 2016 03:15:15 -0500
+Subject: [PATCH] Ignore -fdebug-prefix-map in producer string (by Daniel Kahn
+ Gillmor)
+
+* dwarf2out.c (gen_producer_string): Ignore -fdebug-prefix-map.
+
+git-svn-id: svn+ssh://gcc.gnu.org/svn/gcc/trunk@231835 138bc75d-0d04-0410-961f-82ee72b054a4
+
+Upstream-Status: Backport
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ gcc/dwarf2out.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/gcc/dwarf2out.c b/gcc/dwarf2out.c
+index 3614c10..526f114 100644
+--- a/gcc/dwarf2out.c
++++ b/gcc/dwarf2out.c
+@@ -19670,6 +19670,7 @@ gen_producer_string (void)
+       case OPT_fpreprocessed:
+       case OPT_fltrans_output_list_:
+       case OPT_fresolution_:
++      case OPT_fdebug_prefix_map_:
+ 	/* Ignore these.  */
+ 	continue;
+       default:
+-- 
+1.9.1
+
diff --git a/meta/recipes-devtools/gcc/gcc-5.3.inc b/meta/recipes-devtools/gcc/gcc-5.3.inc
index 214af10..a653e5c 100644
--- a/meta/recipes-devtools/gcc/gcc-5.3.inc
+++ b/meta/recipes-devtools/gcc/gcc-5.3.inc
@@ -80,6 +80,7 @@ SRC_URI = "\
            file://0048-ssp_nonshared.patch \
            file://0049-Disable-the-weak-reference-logic-in-gthr.h-for-os-ge.patch \
            file://0050-powerpc-pass-secure-plt-to-the-linker.patch \
+           file://0051-Ignore-fdebug-prefix-map-in-producer-string-by-Danie.patch \
           "
 
 BACKPORTS = ""
diff --git a/meta/recipes-devtools/gcc/gcc-5.3/0051-Ignore-fdebug-prefix-map-in-producer-string-by-Danie.patch b/meta/recipes-devtools/gcc/gcc-5.3/0051-Ignore-fdebug-prefix-map-in-producer-string-by-Danie.patch
new file mode 100644
index 0000000..e8f79b5
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-5.3/0051-Ignore-fdebug-prefix-map-in-producer-string-by-Danie.patch
@@ -0,0 +1,31 @@
+From 32593b38082ea65f4c82159254adf1e0dc2423be Mon Sep 17 00:00:00 2001
+From: bernds <bernds@138bc75d-0d04-0410-961f-82ee72b054a4>
+Date: Tue, 16 Feb 2016 03:15:15 -0500
+Subject: [PATCH] Ignore -fdebug-prefix-map in producer string (by Daniel Kahn
+ Gillmor)
+
+* dwarf2out.c (gen_producer_string): Ignore -fdebug-prefix-map.
+
+git-svn-id: svn+ssh://gcc.gnu.org/svn/gcc/trunk@231835 138bc75d-0d04-0410-961f-82ee72b054a4
+
+Upstream-Status: Backport
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ gcc/dwarf2out.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/gcc/dwarf2out.c b/gcc/dwarf2out.c
+index 3614c10..526f114 100644
+--- a/gcc/dwarf2out.c
++++ b/gcc/dwarf2out.c
+@@ -19670,6 +19670,7 @@ gen_producer_string (void)
+       case OPT_fpreprocessed:
+       case OPT_fltrans_output_list_:
+       case OPT_fresolution_:
++      case OPT_fdebug_prefix_map_:
+ 	/* Ignore these.  */
+ 	continue;
+       default:
+-- 
+1.9.1
+
-- 
1.9.1


