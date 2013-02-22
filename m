Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jason.wessel@windriver.com>) id 1U900M-0006M9-8O
	for Openembedded-core@lists.openembedded.org;
	Fri, 22 Feb 2013 22:18:17 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r1ML1pbR006806
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <Openembedded-core@lists.openembedded.org>;
	Fri, 22 Feb 2013 13:01:51 -0800 (PST)
Received: from ord-lpggp2.wrs.com (128.224.65.244) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.318.4;
	Fri, 22 Feb 2013 13:01:50 -0800
From: Jason Wessel <jason.wessel@windriver.com>
To: <Openembedded-core@lists.openembedded.org>
Date: Fri, 22 Feb 2013 15:01:42 -0600
Message-ID: <1361566902-362-1-git-send-email-jason.wessel@windriver.com>
X-Mailer: git-send-email 1.7.1
MIME-Version: 1.0
Subject: [denzil] qemu-0.15.1: Fix fault with v86d when using -nographic
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
X-List-Received-Date: Fri, 22 Feb 2013 21:18:18 -0000
Content-Type: text/plain

When using the qemu-0.15.1 with -nographic and a typical OE image, you
will get a segmentation fault in v86d when the guest OS is booting.
It will look like:

v86d[42]: segfault at 0 ip 000000000040171a sp 00007fff5d11bad8 error 4 in v86d[400000+1a000]

Sometimes this is fatal to the guest, sometimes it is not, either way
it was fixed by the upstream qemu commit: 6023d832480e6713e5ae81d3b74f53e6306f3a1b
(disable automatic loading of sgabios when -nographic)

Signed-off-by: Jason Wessel <jason.wessel@windriver.com>
---
 ...tomatic-loading-of-sgabios-when-nographic.patch |   38 ++++++++++++++++++++
 meta/recipes-devtools/qemu/qemu_0.15.1.bb          |    3 +-
 2 files changed, 40 insertions(+), 1 deletions(-)
 create mode 100644 meta/recipes-devtools/qemu/qemu-0.15.1/qemu-disable-automatic-loading-of-sgabios-when-nographic.patch

diff --git a/meta/recipes-devtools/qemu/qemu-0.15.1/qemu-disable-automatic-loading-of-sgabios-when-nographic.patch b/meta/recipes-devtools/qemu/qemu-0.15.1/qemu-disable-automatic-loading-of-sgabios-when-nographic.patch
new file mode 100644
index 0000000..6908b08
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu-0.15.1/qemu-disable-automatic-loading-of-sgabios-when-nographic.patch
@@ -0,0 +1,38 @@
+From 6023d832480e6713e5ae81d3b74f53e6306f3a1b Mon Sep 17 00:00:00 2001
+From: Paolo Bonzini <pbonzini@redhat.com>
+Date: Thu, 3 Nov 2011 16:00:22 +0100
+Subject: [PATCH] disable automatic loading of sgabios when -nographic
+
+sgabios hasn't gotten a lot of coverage since it was not shipped.  For 1.0,
+let's disable the automatic loading of the option ROM in -nographic
+mode.  We can put it back for 1.1.
+
+Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
+Signed-off-by: Anthony Liguori <aliguori@us.ibm.com>
+---
+ hw/pc.c |    9 ---------
+ 1 files changed, 0 insertions(+), 9 deletions(-)
+
+diff --git a/hw/pc.c b/hw/pc.c
+index 25bfa85..3015671 100644
+--- a/hw/pc.c
++++ b/hw/pc.c
+@@ -1103,15 +1103,6 @@ void pc_vga_init(PCIBus *pci_bus)
+             isa_vga_init();
+         }
+     }
+-
+-    /*
+-     * sga does not suppress normal vga output. So a machine can have both a
+-     * vga card and sga manually enabled. Output will be seen on both.
+-     * For nographic case, sga is enabled at all times
+-     */
+-    if (display_type == DT_NOGRAPHIC) {
+-        isa_create_simple("sga");
+-    }
+ }
+ 
+ static void cpu_request_exit(void *opaque, int irq, int level)
+-- 
+1.7.1
+
diff --git a/meta/recipes-devtools/qemu/qemu_0.15.1.bb b/meta/recipes-devtools/qemu/qemu_0.15.1.bb
index 54f746b..4abe13d 100644
--- a/meta/recipes-devtools/qemu/qemu_0.15.1.bb
+++ b/meta/recipes-devtools/qemu/qemu_0.15.1.bb
@@ -3,7 +3,7 @@ require qemu.inc
 LIC_FILES_CHKSUM = "file://COPYING;md5=441c28d2cf86e15a37fa47e15a72fbac \
                     file://COPYING.LIB;endline=24;md5=c04def7ae38850e7d3ef548588159913"
 
-PR = "r7"
+PR = "r8"
 
 FILESPATH = "${FILE_DIRNAME}/qemu-${PV}"
 FILESDIR = "${WORKDIR}"
@@ -20,6 +20,7 @@ SRC_URI = "\
     file://arm-bgr.patch \
     file://a4d1f142542935b90d2eb30f3aead4edcf455fe6.patch \
     file://0001-ppc64-Fix-linker-script.patch \
+    file://qemu-disable-automatic-loading-of-sgabios-when-nographic.patch \
     "
 
 # Only use the GL passthrough patches for native/nativesdk versions
-- 
1.7.1



