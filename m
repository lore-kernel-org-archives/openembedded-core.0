Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1U3bAB-0004Qz-RQ
	for openembedded-core@lists.openembedded.org;
	Fri, 08 Feb 2013 00:46:08 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r17NU2Uw026867
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 7 Feb 2013 15:30:02 -0800 (PST)
Received: from msp-mhatle-lx2.wrs.com (172.25.34.61) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.2.318.4; Thu, 7 Feb 2013 15:30:01 -0800
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 7 Feb 2013 17:56:45 -0600
Message-ID: <7d5d458f6bda29fe12b817f4a9f3bed979060d3b.1360270199.git.mark.hatle@windriver.com>
X-Mailer: git-send-email 1.8.1.2.545.g2f19ada
In-Reply-To: <cover.1360270199.git.mark.hatle@windriver.com>
References: <cover.1360270199.git.mark.hatle@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [172.25.34.61]
Subject: [denzil 18/18] qemu-0.15.1: Add addition environment space to boot loader qemu-system-mips
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 07 Feb 2013 23:46:19 -0000
Content-Type: text/plain

From: Jason Wessel <jason.wessel@windriver.com>

[ CQID: WIND00401085 ]

The qemu mips malta base board boot loader uses environment strings
with a max length of 256 bytes which is not long enough to accommodate
a long NFS path in addition to the normal kernel boot command line
arguments.

The solution is to expand the environment string length to 512 bytes.

Signed-off-by: Jason Wessel <jason.wessel@windriver.com>
Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 .../qemu/qemu-0.15.1/extra_mips_env_space.patch    | 24 ++++++++++++++++++++++
 meta/recipes-devtools/qemu/qemu_0.15.1.bb          |  3 ++-
 2 files changed, 26 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/qemu/qemu-0.15.1/extra_mips_env_space.patch

diff --git a/meta/recipes-devtools/qemu/qemu-0.15.1/extra_mips_env_space.patch b/meta/recipes-devtools/qemu/qemu-0.15.1/extra_mips_env_space.patch
new file mode 100644
index 0000000..62483a9
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu-0.15.1/extra_mips_env_space.patch
@@ -0,0 +1,24 @@
+If you create a project with very long directory names like 128 characters
+deep and use NFS, the kernel arguments will be truncated.  The kernel will
+accept longer strings such as 512 bytes, but the qemu boot loader defaulted
+to only 256 bytes.  This patch expands the limit.
+
+Upstream-Status: Inappropriate - OE uses deep paths
+
+Signed-off-by: Jason Wessel <jason.wessel@windriver.com>
+
+---
+ hw/mips_malta.c |    2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+--- a/hw/mips_malta.c
++++ b/hw/mips_malta.c
+@@ -51,7 +51,7 @@
+ 
+ #define ENVP_ADDR		0x80002000l
+ #define ENVP_NB_ENTRIES	 	16
+-#define ENVP_ENTRY_SIZE	 	256
++#define ENVP_ENTRY_SIZE	 	512
+ 
+ #define MAX_IDE_BUS 2
+ 
diff --git a/meta/recipes-devtools/qemu/qemu_0.15.1.bb b/meta/recipes-devtools/qemu/qemu_0.15.1.bb
index 75d3d8e..4567118 100644
--- a/meta/recipes-devtools/qemu/qemu_0.15.1.bb
+++ b/meta/recipes-devtools/qemu/qemu_0.15.1.bb
@@ -3,7 +3,7 @@ require qemu.inc
 LIC_FILES_CHKSUM = "file://COPYING;md5=441c28d2cf86e15a37fa47e15a72fbac \
                     file://COPYING.LIB;endline=24;md5=c04def7ae38850e7d3ef548588159913"
 
-PR = "r12"
+PR = "r13"
 
 FILESPATH = "${FILE_DIRNAME}/qemu-${PV}"
 FILESDIR = "${WORKDIR}"
@@ -24,6 +24,7 @@ SRC_URI = "\
     file://ppc-s500-set-invalid-mask.patch \
     file://hw-pl031-Actually-raise-interrupt-on-timer-expiry.patch \
     file://qemu-CVE-2012-3515.patch \
+    file://extra_mips_env_space.patch \
     "
 
 # Only use the GL passthrough patches for native/nativesdk versions
-- 
1.8.1.2.545.g2f19ada



