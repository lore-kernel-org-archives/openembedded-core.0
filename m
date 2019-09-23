Return-Path: <Quanyang.Wang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id B9BAC7CDAC
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Sep 2019 02:26:52 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x8N2Qri1006575
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 22 Sep 2019 19:26:53 -0700 (PDT)
Received: from pek-qwang2-d1.wrs.com (128.224.162.137) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.468.0; Sun, 22 Sep 2019 19:26:53 -0700
From: <quanyang.wang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 23 Sep 2019 10:26:52 +0800
Message-ID: <20190923022652.25379-1-quanyang.wang@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Subject: [PATCH v2] kexec-tools: fix arm kexec failure for __NR_kexec_file_load
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
X-List-Received-Date: Mon, 23 Sep 2019 02:26:52 -0000
Content-Type: text/plain

From: Wang Quanyang <quanyang.wang@windriver.com>

Once use kexec in arm arch, it will throw out the error info as below:

Could not find a free area of memory of 0xc78e744 bytes... 

This is because that kexec use kexec_file_load to load image by default
but arm doesn't support it. So add this patch to avoid use kexec_file_load
in arm platforms.

Signed-off-by: Quanyang Wang <quanyang.wang@windriver.com>
---
 ...ndefine-__NR_kexec_file_load-for-arm.patch | 39 +++++++++++++++++++
 .../kexec/kexec-tools_2.0.19.bb               |  1 +
 2 files changed, 40 insertions(+)
 create mode 100644 meta/recipes-kernel/kexec/kexec-tools/0006-kexec-arm-undefine-__NR_kexec_file_load-for-arm.patch

diff --git a/meta/recipes-kernel/kexec/kexec-tools/0006-kexec-arm-undefine-__NR_kexec_file_load-for-arm.patch b/meta/recipes-kernel/kexec/kexec-tools/0006-kexec-arm-undefine-__NR_kexec_file_load-for-arm.patch
new file mode 100644
index 0000000000..1b11363191
--- /dev/null
+++ b/meta/recipes-kernel/kexec/kexec-tools/0006-kexec-arm-undefine-__NR_kexec_file_load-for-arm.patch
@@ -0,0 +1,40 @@
+From b54816eff272324320c490d62dc36b27d2838732 Mon Sep 17 00:00:00 2001
+From: Quanyang Wang <quanyang.wang@windriver.com>
+Date: Mon, 16 Sep 2019 10:49:05 +0800
+Subject: [PATCH] kexec/arm: undefine __NR_kexec_file_load for arm
+
+In the kernel upstream commit 4ab65ba7a5cb
+("ARM: add kexec_file_load system call number"),
+__NR_kexec_file_load for arm has been defined to be 401.
+This results that even if kexec_file_load isn't implemented
+for arm but the function is_kexec_file_load_implemented()
+will still return true. So undef __NR_kexec_file_load for
+arm architecture.
+
+Upstream-Status: Backport
+[https://git.kernel.org/pub/scm/utils/kernel/kexec/kexec-tools.git/commit/kexec/kexec-syscall.h?id=b54816eff272324320c490d62dc36b27d2838732]
+
+Signed-off-by: Quanyang Wang <quanyang.wang@windriver.com>
+Signed-off-by: Simon Horman <horms@verge.net.au>
+---
+ kexec/kexec-syscall.h | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/kexec/kexec-syscall.h b/kexec/kexec-syscall.h
+index dac1c1f..92d51d3 100644
+--- a/kexec/kexec-syscall.h
++++ b/kexec/kexec-syscall.h
+@@ -56,6 +56,10 @@
+ #endif
+ #endif /*ifndef __NR_kexec_load*/
+ 
++#ifdef __arm__
++#undef __NR_kexec_file_load
++#endif
++
+ #ifndef __NR_kexec_file_load
+ 
+ #ifdef __x86_64__
+-- 
+2.17.1
+
diff --git a/meta/recipes-kernel/kexec/kexec-tools_2.0.19.bb b/meta/recipes-kernel/kexec/kexec-tools_2.0.19.bb
index 3439899070..c3f74359f1 100644
--- a/meta/recipes-kernel/kexec/kexec-tools_2.0.19.bb
+++ b/meta/recipes-kernel/kexec/kexec-tools_2.0.19.bb
@@ -18,6 +18,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/kernel/kexec/kexec-tools-${PV}.tar.gz
     file://0003-kexec-ARM-Fix-add_buffer_phys_virt-align-issue.patch \
     file://0004-x86_64-Add-support-to-build-kexec-tools-with-x32-ABI.patch \
     file://0005-Disable-PIE-during-link.patch \
+    file://0006-kexec-arm-undefine-__NR_kexec_file_load-for-arm.patch \
 "
 
 SRC_URI[md5sum] = "052458f0a35c2a3b0d2302caa3318e9f"
-- 
2.22.0


