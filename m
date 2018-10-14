Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 0DDEB74596
	for <openembedded-core@lists.openembedded.org>;
	Sun, 14 Oct 2018 09:46:01 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w9E9k0e6016059
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 14 Oct 2018 02:46:00 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.408.0;
	Sun, 14 Oct 2018 02:45:59 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>,
	<richard.purdie@linuxfoundation.org>
Date: Sun, 14 Oct 2018 02:45:59 -0700
Message-ID: <20181014094559.27640-1-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.10.2
MIME-Version: 1.0
Subject: [PATCH V2] nasm: fix CVE-2018-10016
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
X-List-Received-Date: Sun, 14 Oct 2018 09:46:02 -0000
Content-Type: text/plain

Previously fix of CVE-2018-10016 caused ovmf build failure,
I reported the failure to upstream and it replied with
this V2 fix.

Details at:
https://bugzilla.nasm.us/show_bug.cgi?id=3392473

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 .../0001-eval-Eliminate-division-by-zero.patch     | 40 ++++++++++++++++++++++
 meta/recipes-devtools/nasm/nasm_2.13.03.bb         |  1 +
 2 files changed, 41 insertions(+)
 create mode 100644 meta/recipes-devtools/nasm/nasm/0001-eval-Eliminate-division-by-zero.patch

diff --git a/meta/recipes-devtools/nasm/nasm/0001-eval-Eliminate-division-by-zero.patch b/meta/recipes-devtools/nasm/nasm/0001-eval-Eliminate-division-by-zero.patch
new file mode 100644
index 0000000..6c33249
--- /dev/null
+++ b/meta/recipes-devtools/nasm/nasm/0001-eval-Eliminate-division-by-zero.patch
@@ -0,0 +1,40 @@
+From ceec0d818798aeaa75ed4907e6135b0247ed46b2 Mon Sep 17 00:00:00 2001
+From: Cyrill Gorcunov <gorcunov@gmail.com>
+Date: Sun, 14 Oct 2018 01:26:19 +0300
+Subject: [PATCH] eval: Eliminate division by zero
+
+When doing division we should detect if the value we're
+divided by is not zero. Instead of is_unknown() helper
+we should use is_just_unknown().
+
+https://bugzilla.nasm.us/show_bug.cgi?id=3392515
+https://bugzilla.nasm.us/show_bug.cgi?id=3392473
+
+Reported-by: Jun <jxx13@psu.edu>
+Reported-by: stuartly <situlingyun@gmail.com>
+Signed-off-by: Cyrill Gorcunov <gorcunov@gmail.com>
+
+Upstream-Status: Backport [https://github.com/netwide-assembler/nasm/commit/ceec0d818798aeaa75ed4907e6135b0247ed46b2.patch]
+CVE: CVE-2018-10016
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+
+---
+ asm/eval.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/asm/eval.c b/asm/eval.c
+index 1a6680f..7e727a4 100644
+--- a/asm/eval.c
++++ b/asm/eval.c
+@@ -580,7 +580,7 @@ static expr *expr5(int critical)
+                   " scalar values");
+             return NULL;
+         }
+-        if (j != '*' && !is_unknown(f) && reloc_value(f) == 0) {
++        if (j != '*' && !is_just_unknown(f) && reloc_value(f) == 0) {
+             nasm_error(ERR_NONFATAL, "division by zero");
+             return NULL;
+         }
+-- 
+2.10.2
+
diff --git a/meta/recipes-devtools/nasm/nasm_2.13.03.bb b/meta/recipes-devtools/nasm/nasm_2.13.03.bb
index 6a02df4..730db1d 100644
--- a/meta/recipes-devtools/nasm/nasm_2.13.03.bb
+++ b/meta/recipes-devtools/nasm/nasm_2.13.03.bb
@@ -8,6 +8,7 @@ SRC_URI = "http://www.nasm.us/pub/nasm/releasebuilds/${PV}/nasm-${PV}.tar.bz2 \
            file://0001-assemble-Check-global-line-limit.patch \
            file://0001-fix-CVE-2018-8882.patch \
            file://0001-Verify-that-we-are-not-reading-past-end-of-a-buffer.patch \
+           file://0001-eval-Eliminate-division-by-zero.patch \
            "
 
 SRC_URI[md5sum] = "0c581d482f39d5111879ca9601938f74"
-- 
2.10.2


