Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id B91066ED4C
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Mar 2014 09:43:06 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s2S9h7JG004527
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 28 Mar 2014 02:43:07 -0700 (PDT)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.194) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.169.1; Fri, 28 Mar 2014 02:43:06 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 28 Mar 2014 17:42:43 +0800
Message-ID: <c454b69f16c1c880e68fe1593add1674286dc06d.1395996041.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1395996041.git.hongxu.jia@windriver.com>
References: <cover.1395996041.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Cc: saul.wold@intel.com
Subject: [PATCH 4/6] qemu: Add addition environment space to boot loader qemu-system-mips
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
X-List-Received-Date: Fri, 28 Mar 2014 09:43:06 -0000
Content-Type: text/plain

From: Jeff Polk <jeff.polk@windriver.com>

The qemu mips malta base board boot loader uses environment strings
with a max length of 256 bytes which is not long enough to accommodate
a long NFS path in addition to the normal kernel boot command line
arguments.

The solution is to expand the environment string length to 1024 bytes.

Signed-off-by: Jason Wessel <jason.wessel@windriver.com>
Signed-off-by: Roy Li <rongqing.li@windriver.com>
Signed-off-by: Jeff Polk <jeff.polk@windriver.com>
Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 .../qemu/files/qemu-enlarge-env-entry-size.patch   | 31 ++++++++++++++++++++++
 meta/recipes-devtools/qemu/qemu_1.7.0.bb           |  3 ++-
 2 files changed, 33 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/qemu/files/qemu-enlarge-env-entry-size.patch

diff --git a/meta/recipes-devtools/qemu/files/qemu-enlarge-env-entry-size.patch b/meta/recipes-devtools/qemu/files/qemu-enlarge-env-entry-size.patch
new file mode 100644
index 0000000..c7425ab
--- /dev/null
+++ b/meta/recipes-devtools/qemu/files/qemu-enlarge-env-entry-size.patch
@@ -0,0 +1,31 @@
+qemu: Add addition environment space to boot loader qemu-system-mips 
+
+Upstream-Status: Inappropriate - OE uses deep paths
+
+If you create a project with very long directory names like 128 characters
+deep and use NFS, the kernel arguments will be truncated. The kernel will
+accept longer strings such as 1024 bytes, but the qemu boot loader defaulted
+to only 256 bytes. This patch expands the limit.
+
+Signed-off-by: Jason Wessel <jason.wessel@windriver.com>
+Signed-off-by: Roy Li <rongqing.li@windriver.com>
+---
+ hw/mips/mips_malta.c    |    2 +-
+ 1 files changed, 1 insertions(+), 1 deletions(-)
+
+diff --git a/hw/mips/mips_malta.c b/hw/mips/mips_malta.c
+index 9d521cc..17c0391 100644
+--- a/hw/mips/mips_malta.c
++++ b/hw/mips/mips_malta.c
+@@ -53,7 +53,7 @@
+ 
+ #define ENVP_ADDR		0x80002000l
+ #define ENVP_NB_ENTRIES	 	16
+-#define ENVP_ENTRY_SIZE	 	256
++#define ENVP_ENTRY_SIZE	 	1024
+ 
+ /* Hardware addresses */
+ #define FLASH_ADDRESS 0x1e000000ULL
+-- 
+1.7.10.4
+
diff --git a/meta/recipes-devtools/qemu/qemu_1.7.0.bb b/meta/recipes-devtools/qemu/qemu_1.7.0.bb
index c0e8b55..be6dd51 100644
--- a/meta/recipes-devtools/qemu/qemu_1.7.0.bb
+++ b/meta/recipes-devtools/qemu/qemu_1.7.0.bb
@@ -3,7 +3,8 @@ require qemu.inc
 LIC_FILES_CHKSUM = "file://COPYING;md5=441c28d2cf86e15a37fa47e15a72fbac \
                     file://COPYING.LIB;endline=24;md5=c04def7ae38850e7d3ef548588159913"
 
-SRC_URI += "file://fxrstorssefix.patch"
+SRC_URI += "file://fxrstorssefix.patch \
+            file://qemu-enlarge-env-entry-size.patch"
 
 SRC_URI_prepend = "http://wiki.qemu.org/download/qemu-${PV}.tar.bz2"
 SRC_URI[md5sum] = "32893941d40d052a5e649efcf06aca06"
-- 
1.8.1.2


