Return-Path: <todor.minchev@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id F272F71AD7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Oct 2016 17:06:01 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga102.fm.intel.com with ESMTP; 26 Oct 2016 10:06:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,551,1473145200"; d="scan'208";a="1050577597"
Received: from unknown (HELO localhost.localdomain) ([10.7.197.100])
	by orsmga001.jf.intel.com with ESMTP; 26 Oct 2016 10:06:03 -0700
From: Todor Minchev <todor.minchev@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 26 Oct 2016 10:05:59 -0700
Message-Id: <20161026170559.9444-1-todor.minchev@linux.intel.com>
X-Mailer: git-send-email 2.10.1
Subject: [PATCH 1/1] runqemu: add user mode (SLIRP) support to x86 QEMU targets
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
X-List-Received-Date: Wed, 26 Oct 2016 17:06:04 -0000

Using 'slirp' as a command line option to runqemu will start QEMU
with user mode networking instead of creating tun/tap devices.
SLIRP does not require root access. By default port 2222 on the
host will be mapped to port 22 in the guest. The default port
mapping can be overwritten with the QB_SLIRP_OPT variable e.g.

QB_SLIRP_OPT = "-net nic,model=e1000 -net user,hostfwd=tcp::2222-:22"

Signed-off-by: Todor Minchev <todor.minchev@linux.intel.com>
---
 meta/conf/machine/include/qemuboot-x86.inc | 1 +
 scripts/runqemu                            | 3 ++-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/conf/machine/include/qemuboot-x86.inc b/meta/conf/machine/include/qemuboot-x86.inc
index 06ac983..0870294 100644
--- a/meta/conf/machine/include/qemuboot-x86.inc
+++ b/meta/conf/machine/include/qemuboot-x86.inc
@@ -13,3 +13,4 @@ QB_AUDIO_OPT = "-soundhw ac97,es1370"
 QB_KERNEL_CMDLINE_APPEND = "vga=0 uvesafb.mode_option=640x480-32 oprofile.timer=1 uvesafb.task_timeout=-1"
 # Add the 'virtio-rng-pci' device otherwise the guest may run out of entropy
 QB_OPT_APPEND = "-vga vmware -show-cursor -usb -usbdevice tablet -device virtio-rng-pci"
+QB_SLIRP_OPT = "-net nic,model=e1000 -net user,hostfwd=tcp::2222-:22"
diff --git a/scripts/runqemu b/scripts/runqemu
index dbe17ab..6952f32 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -542,7 +542,8 @@ class BaseConfig(object):
     def check_and_set(self):
         """Check configs sanity and set when needed"""
         self.validate_paths()
-        check_tun()
+        if not self.slirp_enabled:
+            check_tun()
         # Check audio
         if self.audio_enabled:
             if not self.get('QB_AUDIO_DRV'):
-- 
2.10.1


