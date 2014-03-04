Return-Path: <nitin.a.kamble@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id B1F466EA1C
	for <Openembedded-core@lists.openembedded.org>;
	Tue,  4 Mar 2014 23:33:16 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 04 Mar 2014 15:33:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,589,1389772800"; d="scan'208";a="466688152"
Received: from yocto-hm1.jf.intel.com ([10.23.232.34])
	by orsmga001.jf.intel.com with ESMTP; 04 Mar 2014 15:33:06 -0800
From: nitin.a.kamble@intel.com
To: pb@pbcl.net, saul.wold@intel.com, Openembedded-core@lists.openembedded.org
Date: Tue,  4 Mar 2014 15:28:40 -0800
Message-Id: <48a8043e42837082df9858ed6f4e33c2cb4c1596.1393975557.git.nitin.a.kamble@intel.com>
X-Mailer: git-send-email 1.8.1.4
In-Reply-To: <cover.1393975557.git.nitin.a.kamble@intel.com>
References: <cover.1393975557.git.nitin.a.kamble@intel.com>
Subject: [Patch v2 1/1] QA_check: special case kernel modules for x32 targets
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
X-List-Received-Date: Tue, 04 Mar 2014 23:33:16 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

The Kernel module packages for x32 target have 64 bit binaries, which
breaks the QA_check expecting all the packages to be 32bit.

Make a special case for kernel module packages for x32 targets, to avoid
this false error.

Fixes Bug:
[YOCTO #5903]

Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
---
 meta/classes/insane.bbclass | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
index cf00e12..1195c10 100644
--- a/meta/classes/insane.bbclass
+++ b/meta/classes/insane.bbclass
@@ -443,11 +443,11 @@ def package_qa_check_arch(path,name,d, elf, messages):
 
     # Check the architecture and endiannes of the binary
     if not ((machine == elf.machine()) or \
-        ("virtual/kernel" in provides) and (target_os == "linux-gnux32")):
+        ((("virtual/kernel" in provides) or bb.data.inherits_class("module", d) ) and (target_os == "linux-gnux32"))):
         messages.append("Architecture did not match (%d to %d) on %s" % \
                  (machine, elf.machine(), package_qa_clean_path(path,d)))
     elif not ((bits == elf.abiSize()) or  \
-        ("virtual/kernel" in provides) and (target_os == "linux-gnux32")):
+        ((("virtual/kernel" in provides) or bb.data.inherits_class("module", d) ) and (target_os == "linux-gnux32"))):
         messages.append("Bit size did not match (%d to %d) %s on %s" % \
                  (bits, elf.abiSize(), bpn, package_qa_clean_path(path,d)))
     elif not littleendian == elf.isLittleEndian():
-- 
1.8.1.4


