Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id CB7A87706E
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Jan 2016 08:45:30 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u0R8jR2G006170
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 27 Jan 2016 00:45:28 -0800 (PST)
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.248.2;
	Wed, 27 Jan 2016 00:45:27 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <liezhi.yang@windriver.com>,
	<ross.burton@intel.com>, <richard.purdie@linuxfoundation.org>
Date: Wed, 27 Jan 2016 03:45:15 -0500
Message-ID: <7625a0ca2295417a37fa3b9e222362d645156b8c.1453882496.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1453882496.git.hongxu.jia@windriver.com>
References: <cover.1453882496.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/4] base/bbclass: use target path as compile dir in debugging info
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
X-List-Received-Date: Wed, 27 Jan 2016 08:45:32 -0000
Content-Type: text/plain

In debugging information, it uses target paths rather than
build ones as compile dir.
...
 -fdebug-prefix-map=old=new
   When compiling files in directory old, record debugging
   information describing them as in new instead.
...

Compile without '-fdebug-prefix-map':
objdump -g packages-split/lib32-glibc-dev/usr/lib/gcrt1.o
...
| <0><5e>: Abbrev Number: 1 (DW_TAG_compile_unit)
|    <5f>   DW_AT_producer    : (indirect string, offset: 0xbb): GNU C99 5.3.0 -m32
-march=core2 -mtune=core2 -msse3 -mfpmath=sse -mpreferred-stack-boundary=4 -g -O2
-std=gnu99 -fgnu89-inline -feliminate-unused-debug-types -fmerge-all-constants
-frounding-math -ftls-model=initial-exec
|    <64>   DW_AT_name        : (indirect string, offset: 0xb9): init.c
|    <68>   DW_AT_comp_dir    : (indirect string, offset: 0x60): /buildarea/raid0/hjia/
build-20160119-yocto-buildpath/tmp/work/core2-32-pokymllib32-linux/lib32-glibc/2.22-r0/git/csu
...

Compile with '-fdebug-prefix-map':
objdump -g packages-split/lib32-glibc-dev/usr/lib/gcrt1.o
...
| <0><5e>: Abbrev Number: 1 (DW_TAG_compile_unit)
|    <5f>   DW_AT_producer    : (indirect string, offset: 0xbb): GNU C99 5.3.0 -m32
-march=core2 -mtune=core2 -msse3 -mfpmath=sse -mpreferred-stack-boundary=4 -g -O2
-std=gnu99 -fgnu89-inline -fdebug-prefix-map=/buildarea/raid0/hjia/build-20160119-
yocto-buildpath/tmp/work/core2-32-pokymllib32-linux/lib32-glibc/2.22-r0/git=/usr/src/glibc
-feliminate-unused-debug-types -fmerge-all-constants -frounding-math -ftls-model=initial-exec
|    <64>   DW_AT_name        : (indirect string, offset: 0xb9): init.c
|    <68>   DW_AT_comp_dir    : (indirect string, offset: 0x60): /usr/src/glibc/csu
...

[YOCTO #7058]

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/classes/base.bbclass | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
index 5fc9271..3159587 100644
--- a/meta/classes/base.bbclass
+++ b/meta/classes/base.bbclass
@@ -85,6 +85,16 @@ FILESPATH = "${@base_set_filespath(["${FILE_DIRNAME}/${BP}", "${FILE_DIRNAME}/${
 # in the context of the location its used (:=)
 THISDIR = "${@os.path.dirname(d.getVar('FILE', True))}"
 
+def debug_prefix_map(d):
+    opts = ""
+    if "-g" in (d.getVar("SELECTED_OPTIMIZATION", True) or "").split():
+        buildsrc = d.getVar("S", True)
+        targetsrc = "/usr/src/%s" % d.getVar("BPN", True)
+        opts += " -fdebug-prefix-map=%s=%s" % (buildsrc, targetsrc)
+    return opts
+
+TARGET_CFLAGS += "${@debug_prefix_map(d)}"
+
 def extra_path_elements(d):
     path = ""
     elements = (d.getVar('EXTRANATIVEPATH', True) or "").split()
-- 
1.9.1


