Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1RQl3U-0007yL-79
	for openembedded-core@lists.openembedded.org;
	Wed, 16 Nov 2011 20:21:57 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 16 Nov 2011 11:14:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.69,522,1315206000"; d="scan'208";a="86068973"
Received: from nbuild0.sc.intel.com ([172.25.110.36])
	by fmsmga001.fm.intel.com with ESMTP; 16 Nov 2011 11:14:53 -0800
From: nitin.a.kamble@intel.com
To: openembedded-core@lists.openembedded.org
Date: Wed, 16 Nov 2011 11:14:43 -0800
Message-Id: <819eacfcb191817adb70e29d57deaf958924c653.1321470759.git.nitin.a.kamble@intel.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <806c47069d2d344d0fe814b50b495f535de2e924.1321470758.git.nitin.a.kamble@intel.com>
References: <806c47069d2d344d0fe814b50b495f535de2e924.1321470758.git.nitin.a.kamble@intel.com>
In-Reply-To: <cover.1321470758.git.nitin.a.kamble@intel.com>
References: <cover.1321470758.git.nitin.a.kamble@intel.com>
Subject: [PATCH 8/8] insane.bbclass: avoid errors for x32 kernel
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 16 Nov 2011 19:21:59 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

x32 abi of x86_64 has 32bit userspace and the kernel is 64bit.

The qa checking code was reporting this as errors for x32 kernel
files and modules.

This commit extends the condition in the checking code to avoid
throwing the bitsize not matched error for x32 kernel files.

Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
---
 meta/classes/insane.bbclass |    8 +++++---
 1 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
index a65f3ee..5726e69 100644
--- a/meta/classes/insane.bbclass
+++ b/meta/classes/insane.bbclass
@@ -211,6 +211,7 @@ def package_qa_check_arch(path,name,d, elf, messages):
 
     target_os   = d.getVar('TARGET_OS', True)
     target_arch = d.getVar('TARGET_ARCH', True)
+    provides = d.getVar('PROVIDES', d, True)
 
     # FIXME: Cross package confuse this check, so just skip them
     for s in ['cross', 'nativesdk', 'cross-canadian']:
@@ -230,9 +231,10 @@ def package_qa_check_arch(path,name,d, elf, messages):
     if not machine == elf.machine():
         messages.append("Architecture did not match (%d to %d) on %s" % \
                  (machine, elf.machine(), package_qa_clean_path(path,d)))
-    elif not bits == elf.abiSize():
-        messages.append("Bit size did not match (%d to %d) on %s" % \
-                 (bits, elf.abiSize(), package_qa_clean_path(path,d)))
+    elif not ((bits == elf.abiSize()) or  \
+	("virtual/kernel" in provides) and (target_os == "linux-gnux32")):
+        messages.append("Bit size did not match (%d to %d) %s on %s" % \
+                 (bits, elf.abiSize(), bpn, package_qa_clean_path(path,d)))
     elif not littleendian == elf.isLittleEndian():
         messages.append("Endiannes did not match (%d to %d) on %s" % \
                  (littleendian, elf.isLittleEndian(), package_qa_clean_path(path,d)))
-- 
1.7.6.4



