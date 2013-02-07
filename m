Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1U3bA8-0004Pn-6E
	for openembedded-core@lists.openembedded.org;
	Fri, 08 Feb 2013 00:45:54 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r17NTwBr026795
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 7 Feb 2013 15:29:58 -0800 (PST)
Received: from msp-mhatle-lx2.wrs.com (172.25.34.61) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.2.318.4; Thu, 7 Feb 2013 15:29:57 -0800
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 7 Feb 2013 17:56:41 -0600
Message-ID: <8e5bb50c8a1a63f45e1b16872cc93043199004d4.1360270199.git.mark.hatle@windriver.com>
X-Mailer: git-send-email 1.8.1.2.545.g2f19ada
In-Reply-To: <cover.1360270199.git.mark.hatle@windriver.com>
References: <cover.1360270199.git.mark.hatle@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [172.25.34.61]
Subject: [denzil 14/18] nativesdk-qemu: fix SDK relocation issue
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

From: Laurentiu Palcu <laurentiu.palcu@intel.com>

User mode emulation binaries are linked using a local linker script. The
nativesdk ones were not used and the resulting binaries did not have the
interp section resized. Hence, those binaries could not be relocated.

[YOCTO #3083]

(master rev: da014e900adfe96f01290c5a8f5fb08e295ca204)

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
Signed-off-by: Saul Wold <sgw@linux.intel.com>

ported to qemu 0.15.1

Signed-off-by: Jason Wessel <jason.wessel@windriver.com>
Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 .../qemu/qemu-0.15.1/relocatable_sdk.patch         | 34 ++++++++++++++++++++++
 meta/recipes-devtools/qemu/qemu_0.15.1.bb          |  3 +-
 2 files changed, 36 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/qemu/qemu-0.15.1/relocatable_sdk.patch

diff --git a/meta/recipes-devtools/qemu/qemu-0.15.1/relocatable_sdk.patch b/meta/recipes-devtools/qemu/qemu-0.15.1/relocatable_sdk.patch
new file mode 100644
index 0000000..0a01a8a
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu-0.15.1/relocatable_sdk.patch
@@ -0,0 +1,34 @@
+Upstream-Status: Inappropriate [SDK specific]
+
+In order to be able to change the dynamic loader path when relocating
+binaries, the interp section has to be made big enough to accomodate
+the new path (4096 is the maximum path length in Linux).
+
+Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
+
+Index: qemu-1.2.0/i386.ld
+===================================================================
+--- qemu-1.2.0.orig/i386.ld
++++ qemu-1.2.0/i386.ld
+@@ -8,7 +8,7 @@ SECTIONS
+ {
+   /* Read-only sections, merged into text segment: */
+   . = 0x60000000 + SIZEOF_HEADERS;
+-  .interp     : { *(.interp) 	}
++  .interp     : { *(.interp); . = 0x1000; }
+   .hash          : { *(.hash)		}
+   .dynsym        : { *(.dynsym)		}
+   .dynstr        : { *(.dynstr)		}
+Index: qemu-1.2.0/x86_64.ld
+===================================================================
+--- qemu-1.2.0.orig/x86_64.ld
++++ qemu-1.2.0/x86_64.ld
+@@ -6,7 +6,7 @@ SECTIONS
+ {
+   /* Read-only sections, merged into text segment: */
+   . = 0x60000000 + SIZEOF_HEADERS;
+-  .interp         : { *(.interp) }
++  .interp         : { *(.interp); . = 0x1000; }
+   .hash           : { *(.hash) }
+   .dynsym         : { *(.dynsym) }
+   .dynstr         : { *(.dynstr) }
diff --git a/meta/recipes-devtools/qemu/qemu_0.15.1.bb b/meta/recipes-devtools/qemu/qemu_0.15.1.bb
index 0d0ef71..cb0e5dd 100644
--- a/meta/recipes-devtools/qemu/qemu_0.15.1.bb
+++ b/meta/recipes-devtools/qemu/qemu_0.15.1.bb
@@ -3,7 +3,7 @@ require qemu.inc
 LIC_FILES_CHKSUM = "file://COPYING;md5=441c28d2cf86e15a37fa47e15a72fbac \
                     file://COPYING.LIB;endline=24;md5=c04def7ae38850e7d3ef548588159913"
 
-PR = "r10"
+PR = "r11"
 
 FILESPATH = "${FILE_DIRNAME}/qemu-${PV}"
 FILESDIR = "${WORKDIR}"
@@ -44,6 +44,7 @@ SRC_URI_append_virtclass-native = "\
 
 SRC_URI_append_virtclass-nativesdk = "\
     ${@base_contains('DISTRO_FEATURES', 'x11', '${QEMUGLPATCHES} file://glflags.patch', '', d)}  \
+    file://relocatable_sdk.patch \
     "
 SRC_URI[md5sum] = "34f17737baaf1b3495c89cd6d4a607ed"
 SRC_URI[sha256sum] = "7705b14d9b8e4df4a0b1790980e618084261e8daef0672a1aa7a830a0f3db5ba"
-- 
1.8.1.2.545.g2f19ada



