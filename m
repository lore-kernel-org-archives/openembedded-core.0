Return-Path: <Zhe.He@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 3E7A07ED59
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Aug 2019 06:25:39 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x7S6PEZc016789
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Aug 2019 23:25:30 -0700
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.468.0; Tue, 27 Aug 2019 23:25:12 -0700
From: <zhe.he@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 28 Aug 2019 14:25:10 +0800
Message-ID: <1566973510-225469-1-git-send-email-zhe.he@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH v2] ltp: cve/meltdown.c: Fix kernel symbol finding
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
X-List-Received-Date: Wed, 28 Aug 2019 06:25:39 -0000
Content-Type: text/plain

From: He Zhe <zhe.he@windriver.com>

Backport a patch to fix the following error.
safe_file_ops.c:219: BROK: Expected 3 conversions got 2 at meltdown.c:272

Signed-off-by: He Zhe <zhe.he@windriver.com>
---
v2: Adjust context based on top of ltp in oe-core

 ...-cve-meltdown.c-Fix-kernel-symbol-finding.patch | 81 ++++++++++++++++++++++
 meta/recipes-extended/ltp/ltp_20190517.bb          |  1 +
 2 files changed, 82 insertions(+)
 create mode 100644 meta/recipes-extended/ltp/ltp/0001-cve-meltdown.c-Fix-kernel-symbol-finding.patch

diff --git a/meta/recipes-extended/ltp/ltp/0001-cve-meltdown.c-Fix-kernel-symbol-finding.patch b/meta/recipes-extended/ltp/ltp/0001-cve-meltdown.c-Fix-kernel-symbol-finding.patch
new file mode 100644
index 0000000..94f6f5a
--- /dev/null
+++ b/meta/recipes-extended/ltp/ltp/0001-cve-meltdown.c-Fix-kernel-symbol-finding.patch
@@ -0,0 +1,81 @@
+From fbeda82f440a0098be42dd668cbc47212a86ab48 Mon Sep 17 00:00:00 2001
+From: He Zhe <zhe.he@windriver.com>
+Date: Wed, 21 Aug 2019 16:27:24 +0800
+Subject: [PATCH] cve/meltdown.c: Fix kernel symbol finding
+
+meltdown case fails as below.
+safe_file_ops.c:219: BROK: Expected 3 conversions got 2 at meltdown.c:272
+
+find_kernel_symbol is defined to try twice with each of /proc/kallsyms and
+/boot/System.map-%s. Currently if the symbol is not found in /proc/kallsyms,
+when kernel option CONFIG_KALLSYMS_ALL is disabled, it would stop the case
+immediately due to SAFE_FILE_LINES_SCANF.
+
+This patch turns to use FILE_LINES_SCANF to give find_kernel_symbol second
+chance.
+
+[jstancek] Fix also condition introduced in 7709d2ae92ea, even if
+           /proc/kallsyms is disabled, we still want to try System.map.
+
+Signed-off-by: He Zhe <zhe.he@windriver.com>
+Signed-off-by: Jan Stancek <jstancek@redhat.com>
+
+Upstream-Status: Backport
+[https://github.com/linux-test-project/ltp/commit/c2049b5c874bc071f8185bffb5fd7dcb042d9ec8]
+
+Remove the hunk for upstream 7709d2ae92ea ("cve/meltdown.c: abort the test if kallsyms was not enabled")
+that has been covered by this patch.
+
+Signed-off-by: He Zhe <zhe.he@windriver.com>
+---
+ testcases/cve/meltdown.c | 13 ++++++++++---
+ 1 file changed, 10 insertions(+), 3 deletions(-)
+
+diff --git a/testcases/cve/meltdown.c b/testcases/cve/meltdown.c
+index a53ea9b..22651a6 100644
+--- a/testcases/cve/meltdown.c
++++ b/testcases/cve/meltdown.c
+@@ -267,9 +267,15 @@ find_symbol_in_file(const char *filename, const char *symname)
+ 	int ret, read;
+ 	char fmt[strlen(symname) + 64];
+ 
++	tst_res(TINFO, "Looking for %s in %s", symname, filename);
++	if (access(filename, F_OK) == -1) {
++		tst_res(TINFO, "%s not available", filename);
++		return 0;
++	}
++
+ 	sprintf(fmt, "%%lx %%c %s%%c", symname);
+ 
+-	ret = SAFE_FILE_LINES_SCANF(filename, fmt, &addr, &type, &read);
++	ret = FILE_LINES_SCANF(filename, fmt, &addr, &type, &read);
+ 	if (ret)
+ 		return 0;
+ 
+@@ -287,13 +293,11 @@ find_kernel_symbol(const char *name)
+ 	if (addr)
+ 		return addr;
+ 
+-	tst_res(TINFO, "not found '%s' in /proc/kallsyms", name);
+ 	if (uname(&utsname) < 0)
+ 		tst_brk(TBROK | TERRNO, "uname");
+ 
+ 	sprintf(systemmap, "/boot/System.map-%s", utsname.release);
+ 
+-	tst_res(TINFO, "looking in '%s'\n", systemmap);
+ 	addr = find_symbol_in_file(systemmap, name);
+ 	return addr;
+ }
+@@ -308,6 +312,9 @@ static void setup(void)
+ 	saved_cmdline_addr = find_kernel_symbol("saved_command_line");
+ 	tst_res(TINFO, "&saved_command_line == 0x%lx", saved_cmdline_addr);
+ 
++	if (!saved_cmdline_addr)
++		tst_brk(TCONF, "saved_command_line not found");
++
+ 	spec_fd = SAFE_OPEN("/proc/cmdline", O_RDONLY);
+ 
+ 	memset(target_array, 1, sizeof(target_array));
+-- 
+2.7.4
+
diff --git a/meta/recipes-extended/ltp/ltp_20190517.bb b/meta/recipes-extended/ltp/ltp_20190517.bb
index b0e2f96..76c45f0 100644
--- a/meta/recipes-extended/ltp/ltp_20190517.bb
+++ b/meta/recipes-extended/ltp/ltp_20190517.bb
@@ -45,6 +45,7 @@ SRC_URI = "git://github.com/linux-test-project/ltp.git \
            file://0002-check-for-RES_USE_INET6-during-configure.patch \
            file://0001-syscalls-tgkill03-wait-for-defunct-tid-to-get-detach.patch \
            file://0001-ustat02-Fix-EFAULT-in-32bit-compatibility-mode.patch \
+           file://0001-cve-meltdown.c-Fix-kernel-symbol-finding.patch \
            "
 
 S = "${WORKDIR}/git"
-- 
2.7.4


