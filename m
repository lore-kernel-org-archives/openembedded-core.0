Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 39928744AC
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Oct 2018 08:36:20 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w9N8aKQ6008059
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 23 Oct 2018 01:36:20 -0700 (PDT)
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.408.0;
	Tue, 23 Oct 2018 01:36:18 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>,
	<richard.purdie@linuxfoundation.org>
Date: Tue, 23 Oct 2018 04:35:06 -0400
Message-ID: <1540283706-172519-1-git-send-email-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.8.1
MIME-Version: 1.0
Subject: [PATCH] nasm: fix CVE-2018-1000667
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
X-List-Received-Date: Tue, 23 Oct 2018 08:36:21 -0000
Content-Type: text/plain

Since the latest nasm is  2.14rc16 (not formal release),
so backport a patch to 2.13 to fix CVE-2018-1000667.

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 ...proc-parse_size-Check-for-string-provided.patch | 37 ++++++++++++++++++++++
 meta/recipes-devtools/nasm/nasm_2.13.03.bb         |  1 +
 2 files changed, 38 insertions(+)
 create mode 100644 meta/recipes-devtools/nasm/nasm/0001-preproc-parse_size-Check-for-string-provided.patch

diff --git a/meta/recipes-devtools/nasm/nasm/0001-preproc-parse_size-Check-for-string-provided.patch b/meta/recipes-devtools/nasm/nasm/0001-preproc-parse_size-Check-for-string-provided.patch
new file mode 100644
index 0000000..2121fd1
--- /dev/null
+++ b/meta/recipes-devtools/nasm/nasm/0001-preproc-parse_size-Check-for-string-provided.patch
@@ -0,0 +1,37 @@
+From a2f43331a853b7cc449cae3361ee1fb54c7fad8d Mon Sep 17 00:00:00 2001
+From: Cyrill Gorcunov <gorcunov@gmail.com>
+Date: Sat, 29 Sep 2018 14:30:14 +0300
+Subject: [PATCH] preproc: parse_size -- Check for string provided
+
+In case if the string is nil we will have sigsegv.
+
+https://bugzilla.nasm.us/show_bug.cgi?id=3392507
+
+Signed-off-by: Cyrill Gorcunov <gorcunov@gmail.com>
+
+CVE: CVE-2018-1000667
+Upstream-Status: Backport
+https://repo.or.cz/nasm/nasm.git/commit/c713b5f994cf7b29164c3b6838b91f0499591434
+
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ asm/preproc.c | 3 +--
+ 1 file changed, 1 insertion(+), 2 deletions(-)
+
+diff --git a/asm/preproc.c b/asm/preproc.c
+index 475926d..1d770a5 100644
+--- a/asm/preproc.c
++++ b/asm/preproc.c
+@@ -2216,8 +2216,7 @@ static int parse_size(const char *str) {
+         { "byte", "dword", "oword", "qword", "tword", "word", "yword" };
+     static const int sizes[] =
+         { 0, 1, 4, 16, 8, 10, 2, 32 };
+-
+-    return sizes[bsii(str, size_names, ARRAY_SIZE(size_names))+1];
++    return str ? sizes[bsii(str, size_names, ARRAY_SIZE(size_names))+1] : 0;
+ }
+ 
+ /*
+-- 
+2.8.1
+
diff --git a/meta/recipes-devtools/nasm/nasm_2.13.03.bb b/meta/recipes-devtools/nasm/nasm_2.13.03.bb
index 730db1d..de4c554 100644
--- a/meta/recipes-devtools/nasm/nasm_2.13.03.bb
+++ b/meta/recipes-devtools/nasm/nasm_2.13.03.bb
@@ -9,6 +9,7 @@ SRC_URI = "http://www.nasm.us/pub/nasm/releasebuilds/${PV}/nasm-${PV}.tar.bz2 \
            file://0001-fix-CVE-2018-8882.patch \
            file://0001-Verify-that-we-are-not-reading-past-end-of-a-buffer.patch \
            file://0001-eval-Eliminate-division-by-zero.patch \
+           file://0001-preproc-parse_size-Check-for-string-provided.patch \
            "
 
 SRC_URI[md5sum] = "0c581d482f39d5111879ca9601938f74"
-- 
2.8.1


