Return-Path: <Jackie.Huang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 8944C60169
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Oct 2014 02:34:05 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s9T2Y6x5025054
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Oct 2014 19:34:06 -0700 (PDT)
Received: from pek-hostel-vm11.wrs.com (128.224.153.181) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Tue, 28 Oct 2014 19:34:05 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 28 Oct 2014 22:34:04 -0400
Message-ID: <1414550044-1427-1-git-send-email-jackie.huang@windriver.com>
X-Mailer: git-send-email 2.0.0
MIME-Version: 1.0
Subject: [PATCH] gcc: fix ICE in dwarf2out_var_location
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
X-List-Received-Date: Wed, 29 Oct 2014 02:34:08 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

Fixed the ICE:
internal compiler error: in dwarf2out_var_location, at dwarf2out.c:21261

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 meta/recipes-devtools/gcc/gcc-4.9.inc              |  1 +
 .../0058-gcc-ice-dwarf2out_var_location.patch      | 31 ++++++++++++++++++++++
 2 files changed, 32 insertions(+)
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.9/0058-gcc-ice-dwarf2out_var_location.patch

diff --git a/meta/recipes-devtools/gcc/gcc-4.9.inc b/meta/recipes-devtools/gcc/gcc-4.9.inc
index 9a66cd2..89c405a 100644
--- a/meta/recipes-devtools/gcc/gcc-4.9.inc
+++ b/meta/recipes-devtools/gcc/gcc-4.9.inc
@@ -71,6 +71,7 @@ SRC_URI = "\
     file://0054-gcc-Makefile.in-fix-parallel-building-failure.patch \
     file://0055-PR-rtl-optimization-61801.patch \
     file://0056-top-level-reorder_gcc-bug-61144.patch \
+    file://0058-gcc-ice-dwarf2out_var_location.patch \
 "
 SRC_URI[md5sum] = "fddf71348546af523353bd43d34919c1"
 SRC_URI[sha256sum] = "d334781a124ada6f38e63b545e2a3b8c2183049515a1abab6d513f109f1d717e"
diff --git a/meta/recipes-devtools/gcc/gcc-4.9/0058-gcc-ice-dwarf2out_var_location.patch b/meta/recipes-devtools/gcc/gcc-4.9/0058-gcc-ice-dwarf2out_var_location.patch
new file mode 100644
index 0000000..28e7756
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-4.9/0058-gcc-ice-dwarf2out_var_location.patch
@@ -0,0 +1,31 @@
+From d358f8ba2e530850795adce19bd00b57139d9397 Mon Sep 17 00:00:00 2001
+From: Baoshan Pang <baoshan.pang@windriver.com>
+Date: Tue, 16 Sep 2014 13:32:13 -0700
+Subject: [PATCH] Fix ICE in dwarf2out_var_location
+
+Upstream-Status: Backport
+
+Signed-off-by: Baoshan Pang <baoshan.pang@windriver.com>
+---
+ gcc/dwarf2out.c |    5 +++++
+ 1 file changed, 5 insertions(+)
+
+diff --git a/gcc/dwarf2out.c b/gcc/dwarf2out.c
+index 1df565b..0e1557d 100644
+--- a/gcc/dwarf2out.c
++++ b/gcc/dwarf2out.c
+@@ -21255,6 +21255,11 @@ dwarf2out_var_location (rtx loc_note)
+       ca_loc->call_arg_loc_note = loc_note;
+       ca_loc->next = NULL;
+       ca_loc->label = last_label;
++      while(prev && !CALL_P(prev) && !(GET_CODE (PATTERN (prev)) == SEQUENCE
++				       && CALL_P (XVECEXP (PATTERN (prev), 0, 0)))){
++	gcc_assert(NONJUMP_INSN_P (prev));
++	prev = prev_real_insn (prev);
++      }
+       gcc_assert (prev
+ 		  && (CALL_P (prev)
+ 		      || (NONJUMP_INSN_P (prev)
+-- 
+1.7.9.5
+
-- 
2.0.0


