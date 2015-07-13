Return-Path: <Rongqing.Li@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 99CF37391D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Jul 2015 01:53:48 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.1/8.15.1) with ESMTPS id t6D1rmnp021178
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 12 Jul 2015 18:53:48 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.235.1; Sun, 12 Jul 2015 18:53:47 -0700
From: <rongqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 13 Jul 2015 09:52:36 +0800
Message-ID: <1436752356-6508-1-git-send-email-rongqing.li@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH][resend] elfutils: fix stack usage warning
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
X-List-Received-Date: Mon, 13 Jul 2015 01:53:50 -0000
Content-Type: text/plain

From: Roy Li <rongqing.li@windriver.com>

Signed-off-by: Roy Li <rongqing.li@windriver.com>
---
 .../0001-fix-a-stack-usage-warning.patch           | 28 ++++++++++++++++++++++
 meta/recipes-devtools/elfutils/elfutils_0.163.bb   |  1 +
 2 files changed, 29 insertions(+)
 create mode 100644 meta/recipes-devtools/elfutils/elfutils-0.163/0001-fix-a-stack-usage-warning.patch

diff --git a/meta/recipes-devtools/elfutils/elfutils-0.163/0001-fix-a-stack-usage-warning.patch b/meta/recipes-devtools/elfutils/elfutils-0.163/0001-fix-a-stack-usage-warning.patch
new file mode 100644
index 0000000..6923bf7
--- /dev/null
+++ b/meta/recipes-devtools/elfutils/elfutils-0.163/0001-fix-a-stack-usage-warning.patch
@@ -0,0 +1,28 @@
+[PATCH] fix a stack-usage warning
+
+Upstream-Status: Pending
+
+not use a variable to as a array size, otherwise the warning to error that
+stack usage might be unbounded [-Werror=stack-usage=] will happen
+
+Signed-off-by: Roy Li <rongqing.li@windriver.com>
+---
+ backends/ppc_initreg.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/backends/ppc_initreg.c b/backends/ppc_initreg.c
+index 64f5379..52dde3e 100644
+--- a/backends/ppc_initreg.c
++++ b/backends/ppc_initreg.c
+@@ -93,7 +93,7 @@ ppc_set_initial_registers_tid (pid_t tid __attribute__ ((unused)),
+ 	return false;
+     }
+   const size_t gprs = sizeof (user_regs.r.gpr) / sizeof (*user_regs.r.gpr);
+-  Dwarf_Word dwarf_regs[gprs];
++  Dwarf_Word dwarf_regs[sizeof (user_regs.r.gpr) / sizeof (*user_regs.r.gpr)];
+   for (unsigned gpr = 0; gpr < gprs; gpr++)
+     dwarf_regs[gpr] = user_regs.r.gpr[gpr];
+   if (! setfunc (0, gprs, dwarf_regs, arg))
+-- 
+1.9.1
+
diff --git a/meta/recipes-devtools/elfutils/elfutils_0.163.bb b/meta/recipes-devtools/elfutils/elfutils_0.163.bb
index c4fdabd..e391813 100644
--- a/meta/recipes-devtools/elfutils/elfutils_0.163.bb
+++ b/meta/recipes-devtools/elfutils/elfutils_0.163.bb
@@ -17,6 +17,7 @@ SRC_URI += "\
         file://fixheadercheck.patch \
         file://0001-elf_getarsym-Silence-Werror-maybe-uninitialized-fals.patch \
         file://0001-remove-the-unneed-checking.patch \
+        file://0001-fix-a-stack-usage-warning.patch \
 "
 
 # pick the patch from debian
-- 
1.9.1


