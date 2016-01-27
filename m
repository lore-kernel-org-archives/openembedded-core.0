Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 85DC87706E
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Jan 2016 08:45:31 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u0R8jUH8009993
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 27 Jan 2016 00:45:30 -0800 (PST)
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.248.2;
	Wed, 27 Jan 2016 00:45:29 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <liezhi.yang@windriver.com>,
	<ross.burton@intel.com>, <richard.purdie@linuxfoundation.org>
Date: Wed, 27 Jan 2016 03:45:16 -0500
Message-ID: <be19e4a4529ff007c210a60768874e7c37cab02f.1453882496.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1453882496.git.hongxu.jia@windriver.com>
References: <cover.1453882496.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/4] base/bbclass: disallow appending the compile options in debugging info
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
X-List-Received-Date: Wed, 27 Jan 2016 08:45:31 -0000
Content-Type: text/plain

In order to drop TMPDIR in debugging info, add option '-gno-record-gcc-switches'
to disallow appending the compile options to the DW_AT_producer attribute in
DWARF debugging information.

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

Compile with '-gno-record-gcc-switches' and '-fdebug-prefix-map':
objdump -g packages-split/lib32-glibc-dev/usr/lib/gcrt1.o
...
|    <5f>   DW_AT_producer    : (indirect string, offset: 0x1b): GNU C99 5.3.0
|    <64>   DW_AT_name        : (indirect string, offset: 0xb9): init.c
|    <68>   DW_AT_comp_dir    : (indirect string, offset: 0x6e): /usr/src/glibc/csu
...

[YOCTO #7058]

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/classes/base.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
index 3159587..e05552c 100644
--- a/meta/classes/base.bbclass
+++ b/meta/classes/base.bbclass
@@ -91,6 +91,7 @@ def debug_prefix_map(d):
         buildsrc = d.getVar("S", True)
         targetsrc = "/usr/src/%s" % d.getVar("BPN", True)
         opts += " -fdebug-prefix-map=%s=%s" % (buildsrc, targetsrc)
+        opts += " -gno-record-gcc-switches"
     return opts
 
 TARGET_CFLAGS += "${@debug_prefix_map(d)}"
-- 
1.9.1


