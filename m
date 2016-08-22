Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 2F4C9731CB
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Aug 2016 07:52:49 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u7M7qorb023622
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Aug 2016 00:52:50 -0700 (PDT)
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Mon, 22 Aug 2016 00:52:49 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 22 Aug 2016 00:52:38 -0700
Message-ID: <f9dc96bb51e2d344407d689fdb4528a1f4597fae.1471850849.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.9.0
In-Reply-To: <cover.1471850849.git.liezhi.yang@windriver.com>
References: <cover.1471850849.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH V4 01/11] qemuboot.bbclass: add it for runqemu
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
X-List-Received-Date: Mon, 22 Aug 2016 07:52:51 -0000
Content-Type: text/plain

It saves vars in ${DEPLOY_DIR_IMAGE}/qemuboot.py, and runqemu will
import it.

The bsp which can be boot by runqemu will inherit it.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/classes/qemuboot.bbclass | 67 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 67 insertions(+)
 create mode 100644 meta/classes/qemuboot.bbclass

diff --git a/meta/classes/qemuboot.bbclass b/meta/classes/qemuboot.bbclass
new file mode 100644
index 0000000..2e5e9f4
--- /dev/null
+++ b/meta/classes/qemuboot.bbclass
@@ -0,0 +1,67 @@
+# Help runqemu boot target board, "QB" means Qemu Boot, the following
+# vars can be set in conf files, such as <bsp.conf> to make it can be
+# boot by runqemu:
+#
+# QB_SYSTEM_NAME: qemu name, e.g., "qemu-system-i386"
+# QB_OPT_APPEND: options to append to qemu, e.g., "-show-cursor"
+# QB_DEFAULT_KERNEL: default kernel to boot, e.g., "bzImage"
+# QB_DEFAULT_FSTYPE: default FSTYPE to boot, e.g., "ext4"
+# QB_MEM: memory, e.g., "-m 512"
+# QB_MACHINE: qemu machine, e.g., "-machine virt"
+# QB_CPU: qemu cpu, e.g., "-cpu qemu32"
+# QB_CPU_KVM: the similar to QB_CPU, but used when kvm, e.g., '-cpu kvm64',
+#             set it when support kvm.
+# QB_KERNEL_CMDLINE_APPEND: options to append to kernel's -append
+#                           option, e.g., "console=ttyS0 console=tty"
+# QB_DTB: qemu dtb name
+# QB_AUDIO_DRV: qemu audio driver, e.g., "alsa", set it when support audio
+# QB_AUDIO_OPT: qemu audio option, e.g., "-soundhw ac97,es1370", used
+#               when QB_AUDIO_DRV is set.
+# QB_KERNEL_ROOT: kernel's root, e.g., /dev/vda
+# QB_TAP_OPT: netowrk option for 'tap' mode, e.g.,
+#             "-netdev tap,id=net0,ifname=@TAP@,script=no,downscript=no -device virtio-net-device,netdev=net0"
+#              Note, runqemu will replace "@TAP@" with the one which is used, such as tap0, tap1 ...
+# QB_SLIRP_OPT: network option for SLIRP mode, e.g.,
+#             "-netdev user,id=net0 -device virtio-net-device,netdev=net0"
+# QB_ROOTFS_OPT: used as rootfs, e.g.,
+#               "-drive id=disk0,file=@ROOTFS@,if=none,format=raw -device virtio-blk-device,drive=disk0"
+#              Note, runqemu will replace "@ROOTFS@" with the one which is used, such as core-image-minimal-qemuarm64.ext4.
+# QB_SERIAL_OPT: serial port, e.g., "-serial mon:stdio"
+# QB_TCPSERIAL_OPT: tcp serial port option, e.g.,
+#                   " -device virtio-serial-device -chardev socket,id=virtcon,port=@PORT@,host=127.0.0.1 -device virtconsole,chardev=virtcon"
+#                   Note, runqemu will replace "@PORT@" with the port number which is used.
+#
+# Usage:
+# IMAGE_CLASSES += "qemuboot"
+# See "runqemu help" for more info
+
+do_qemuboot_vars[nostamp] = "1"
+
+QB_MEM ?= "-m 256"
+QB_SERIAL_OPT ?= "-serial mon:stdio -serial null"
+QB_DEFAULT_KERNEL ?= "${KERNEL_IMAGETYPE}"
+QB_DEFAULT_FSTYPE ?= "ext4"
+QB_OPT_APPEND ?= "-show-cursor"
+
+do_qemuboot_vars[dirs] = "${DEPLOY_DIR_IMAGE}"
+python do_qemuboot_vars() {
+    build_vars = ['MACHINE', 'TUNE_ARCH', 'DEPLOY_DIR_IMAGE', \
+                'IMAGE_LINK_NAME', 'STAGING_DIR_NATIVE', \
+                'STAGING_BINDIR_NATIVE', 'STAGING_DIR_HOST']
+
+    # Vars from bsp
+    qb_vars = []
+
+    for k in d.keys():
+        if k.startswith('QB_'):
+            qb_vars.append(k)
+
+    out_file = "%s/%s" % (d.getVar('DEPLOY_DIR_IMAGE', True), 'qemuboot.py')
+    with open(out_file, 'w') as f:
+        f.write('config_bsp = {\n')
+        for k in build_vars + qb_vars:
+            f.write("    '%s': '%s',\n" % (k, d.getVar(k, True)))
+        f.write('}\n')
+}
+
+addtask do_qemuboot_vars before do_build
-- 
2.9.0


