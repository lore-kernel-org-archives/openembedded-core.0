Return-Path: <Qi.Chen@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 0CC8378287
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Oct 2017 09:42:48 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v9R9gotX030226
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Oct 2017 02:42:50 -0700
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.163.189) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.361.1; Fri, 27 Oct 2017 02:42:49 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 27 Oct 2017 17:43:51 +0800
Message-ID: <4a6127f002e0fa3552e1dbdec8b8d9f94265384a.1509097263.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1509097262.git.Qi.Chen@windriver.com>
References: <cover.1509097262.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] gcc: fix miscompilation on mips64
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
X-List-Received-Date: Fri, 27 Oct 2017 09:42:49 -0000
Content-Type: text/plain

We've observed strange behaviour of `systemctl status <xxx> on qemumips64.
The output of the command is like `systemctl show <xxx>', which is incorrect.

This patch is from gcc bugzilla's attachment.
https://gcc.gnu.org/bugzilla/show_bug.cgi?id=81803

The patch hasn't been merged into gcc. But it does solve the above problem.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-devtools/gcc/gcc-7.2.inc              |  1 +
 .../fix-miscompilation-for-O1-on-mips64el.patch    | 35 ++++++++++++++++++++++
 2 files changed, 36 insertions(+)
 create mode 100644 meta/recipes-devtools/gcc/gcc-7.2/fix-miscompilation-for-O1-on-mips64el.patch

diff --git a/meta/recipes-devtools/gcc/gcc-7.2.inc b/meta/recipes-devtools/gcc/gcc-7.2.inc
index 5883bc6..04edad7 100644
--- a/meta/recipes-devtools/gcc/gcc-7.2.inc
+++ b/meta/recipes-devtools/gcc/gcc-7.2.inc
@@ -75,6 +75,7 @@ SRC_URI = "\
            file://0048-gcc-Enable-static-PIE.patch \
            file://fix-segmentation-fault-precompiled-hdr.patch \
            file://0050-RISC-V-Handle-non-legitimate-address-in-riscv_legiti.patch \
+           file://fix-miscompilation-for-O1-on-mips64el.patch \
            ${BACKPORTS} \
 "
 BACKPORTS = "\
diff --git a/meta/recipes-devtools/gcc/gcc-7.2/fix-miscompilation-for-O1-on-mips64el.patch b/meta/recipes-devtools/gcc/gcc-7.2/fix-miscompilation-for-O1-on-mips64el.patch
new file mode 100644
index 0000000..28020b0
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-7.2/fix-miscompilation-for-O1-on-mips64el.patch
@@ -0,0 +1,35 @@
+This patch comes from https://gcc.gnu.org/bugzilla/show_bug.cgi?id=81803
+
+Author: mpf <mpf@138bc75d-0d04-0410-961f-82ee72b054a4>
+
+This patch hasn't been merged into gcc. But it does solve the problem of
+strange behaviour of `systemd status <xxx>' on qemumips64.
+
+Upstream-Status: Pending [Taken from gcc bugzilla's attachment]
+
+Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
+---
+ gcc/lra-constraints.c | 7 ++++++-
+ 1 file changed, 6 insertions(+), 1 deletion(-)
+
+diff --git a/gcc/lra-constraints.c b/gcc/lra-constraints.c
+index c8bc9b9a66f..6d319662b09 100644
+--- a/gcc/lra-constraints.c
++++ b/gcc/lra-constraints.c
+@@ -4235,7 +4235,12 @@ curr_insn_transform (bool check_only_p)
+ 			  && (goal_alt[i] == NO_REGS
+ 			      || (simplify_subreg_regno
+ 				  (ira_class_hard_regs[goal_alt[i]][0],
+-				   GET_MODE (reg), byte, mode) >= 0)))))
++				   GET_MODE (reg), byte, mode) >= 0))))
++		      || (type != OP_IN
++			  && GET_MODE_PRECISION (mode)
++			  < GET_MODE_PRECISION (GET_MODE (reg))
++			  && GET_MODE_SIZE (GET_MODE (reg)) <= UNITS_PER_WORD
++			  && WORD_REGISTER_OPERATIONS))
+ 		{
+ 		  /* An OP_INOUT is required when reloading a subreg of a
+ 		     mode wider than a word to ensure that data beyond the
+-- 
+2.13.0
+
-- 
1.9.1


