Return-Path: <Catalin.Enache@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id A751660068
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 May 2017 13:44:24 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v48DiP8C014865
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 8 May 2017 06:44:25 -0700 (PDT)
Received: from no3.corp.ad.wrs.com (128.224.125.152) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.294.0; Mon, 8 May 2017 06:44:24 -0700
From: Catalin Enache <catalin.enache@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 8 May 2017 16:42:59 +0300
Message-ID: <1494250979-24800-1-git-send-email-catalin.enache@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH] ghostscript: CVE-2016-8602, CVE-2017-7975
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
X-List-Received-Date: Mon, 08 May 2017 13:44:24 -0000
Content-Type: text/plain

The .sethalftone5 function in psi/zht2.c in Ghostscript before 9.21 allows remote
attackers to cause a denial of service (application crash) or possibly execute
arbitrary code via a crafted Postscript document that calls .sethalftone5 with an
empty operand stack.

Artifex jbig2dec 0.13, as used in Ghostscript, allows out-of-bounds writes because
of an integer overflow in the jbig2_build_huffman_table function in jbig2_huffman.c
during operations on a crafted JBIG2 file, leading to a denial of service (application
crash) or possibly execution of arbitrary code.

References:
https://nvd.nist.gov/vuln/detail/CVE-2016-8602
https://nvd.nist.gov/vuln/detail/CVE-2017-7975

Upstream patches:
http://git.ghostscript.com/?p=ghostpdl.git;a=commitdiff;h=f5c7555c303
http://git.ghostscript.com/?p=ghostpdl.git;a=commitdiff;h=5e57e483298

Signed-off-by: Catalin Enache <catalin.enache@windriver.com>
---
 .../ghostscript/ghostscript/CVE-2016-8602.patch    | 47 ++++++++++++++++++++++
 .../ghostscript/ghostscript/CVE-2017-7975.patch    | 36 +++++++++++++++++
 .../ghostscript/ghostscript_9.20.bb                |  2 +
 3 files changed, 85 insertions(+)
 create mode 100644 meta/recipes-extended/ghostscript/ghostscript/CVE-2016-8602.patch
 create mode 100644 meta/recipes-extended/ghostscript/ghostscript/CVE-2017-7975.patch

diff --git a/meta/recipes-extended/ghostscript/ghostscript/CVE-2016-8602.patch b/meta/recipes-extended/ghostscript/ghostscript/CVE-2016-8602.patch
new file mode 100644
index 0000000..e58567c
--- /dev/null
+++ b/meta/recipes-extended/ghostscript/ghostscript/CVE-2016-8602.patch
@@ -0,0 +1,47 @@
+From f5c7555c30393e64ec1f5ab0dfae5b55b3b3fc78 Mon Sep 17 00:00:00 2001
+From: Chris Liddell <chris.liddell@artifex.com>
+Date: Sat, 8 Oct 2016 16:10:27 +0100
+Subject: [PATCH] Bug 697203: check for sufficient params in .sethalftone5
+
+and param types
+
+Upstream-Status: Backport
+CVE: CVE-2016-8602
+
+Signed-off-by: Catalin Enache <catalin.enache@windriver.com>
+---
+ psi/zht2.c | 12 ++++++++++--
+ 1 file changed, 10 insertions(+), 2 deletions(-)
+
+diff --git a/psi/zht2.c b/psi/zht2.c
+index fb4a264..dfa27a4 100644
+--- a/psi/zht2.c
++++ b/psi/zht2.c
+@@ -82,14 +82,22 @@ zsethalftone5(i_ctx_t *i_ctx_p)
+     gs_memory_t *mem;
+     uint edepth = ref_stack_count(&e_stack);
+     int npop = 2;
+-    int dict_enum = dict_first(op);
++    int dict_enum;
+     ref rvalue[2];
+     int cname, colorant_number;
+     byte * pname;
+     uint name_size;
+     int halftonetype, type = 0;
+     gs_gstate *pgs = igs;
+-    int space_index = r_space_index(op - 1);
++    int space_index;
++
++    if (ref_stack_count(&o_stack) < 2)
++        return_error(gs_error_stackunderflow);
++    check_type(*op, t_dictionary);
++    check_type(*(op - 1), t_dictionary);
++
++    dict_enum = dict_first(op);
++    space_index = r_space_index(op - 1);
+ 
+     mem = (gs_memory_t *) idmemory->spaces_indexed[space_index];
+ 
+-- 
+2.10.2
+
diff --git a/meta/recipes-extended/ghostscript/ghostscript/CVE-2017-7975.patch b/meta/recipes-extended/ghostscript/ghostscript/CVE-2017-7975.patch
new file mode 100644
index 0000000..d0886c9
--- /dev/null
+++ b/meta/recipes-extended/ghostscript/ghostscript/CVE-2017-7975.patch
@@ -0,0 +1,36 @@
+From 5e57e483298dae8b8d4ec9aab37a526736ac2e97 Mon Sep 17 00:00:00 2001
+From: Shailesh Mistry <shailesh.mistry@hotmail.co.uk>
+Date: Wed, 26 Apr 2017 22:12:14 +0100
+Subject: [PATCH] Bug 697693: Prevent SEGV due to integer overflow.
+
+While building a Huffman table, the start and end points were susceptible
+to integer overflow.
+
+Thank you to Jiaqi for finding this issue and suggesting a patch.
+
+Upstream-Status: Backport
+CVE: CVE-2017-7975
+
+Signed-off-by: Catalin Enache <catalin.enache@windriver.com>
+---
+ jbig2dec/jbig2_huffman.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/jbig2dec/jbig2_huffman.c b/jbig2dec/jbig2_huffman.c
+index 511e461..b4189a1 100644
+--- a/jbig2dec/jbig2_huffman.c
++++ b/jbig2dec/jbig2_huffman.c
+@@ -421,8 +421,8 @@ jbig2_build_huffman_table(Jbig2Ctx *ctx, const Jbig2HuffmanParams *params)
+ 
+             if (PREFLEN == CURLEN) {
+                 int RANGELEN = lines[CURTEMP].RANGELEN;
+-                int start_j = CURCODE << shift;
+-                int end_j = (CURCODE + 1) << shift;
++                uint32_t start_j = CURCODE << shift;
++                uint32_t end_j = (CURCODE + 1) << shift;
+                 byte eflags = 0;
+ 
+                 if (end_j > max_j) {
+-- 
+2.10.2
+
diff --git a/meta/recipes-extended/ghostscript/ghostscript_9.20.bb b/meta/recipes-extended/ghostscript/ghostscript_9.20.bb
index 3c8a2e6..87a7a55 100644
--- a/meta/recipes-extended/ghostscript/ghostscript_9.20.bb
+++ b/meta/recipes-extended/ghostscript/ghostscript_9.20.bb
@@ -35,6 +35,8 @@ SRC_URI = "${SRC_URI_BASE} \
            file://CVE-2016-10219.patch \
            file://CVE-2016-10220.patch \
            file://CVE-2017-5951.patch \
+           file://CVE-2016-8602.patch \
+           file://CVE-2017-7975.patch \
            "
 
 SRC_URI_class-native = "${SRC_URI_BASE} \
-- 
2.10.2


