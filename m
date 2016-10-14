Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 3F288719DB
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Oct 2016 10:08:38 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u9EA8eR6012940
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Oct 2016 03:08:40 -0700 (PDT)
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Fri, 14 Oct 2016 03:08:39 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 14 Oct 2016 03:08:37 -0700
Message-ID: <d38506d21e4dc09a2bcc97661642b67d2fff1cf2.1476439242.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.9.0
In-Reply-To: <cover.1476439242.git.liezhi.yang@windriver.com>
References: <cover.1476439242.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] insane.bbclass: fix package_qa_check_arch() for mips64-o32
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
X-List-Received-Date: Fri, 14 Oct 2016 10:08:42 -0000
Content-Type: text/plain

Fixed:
MACHINE = "qemumips64"
DEFAULTTUNE = "mips64-o32"

$ bitbake linux-yocto
ERROR: linux-yocto-4.8+gitAUTOINC+03bf3dd731_674818dad5-r0 do_package_qa: QA Issue: Bit size did not match (32 to 64) linux-yocto on
    /work/qemumips64-poky-linux/linux-yocto/4.8+gitAUTOINC+03bf3dd731_674818dad5-r0/packages-split/kernel-module-parport/lib/modules/4.8.0-yocto-standard/kernel/drivers/parport/parport.ko [arch]

The mips64-n32 works since it would set ABIEXTENSION to "n32" so that
TARGET_OS is linux-gnun32, and it will skip the check, but "mips64-o32"
doesn't set ABIEXTENSION to "o32", "n32" or "32", so the error happend.

Skip the check if mips64.*32 matches DEFAULTTUNE can fix the problem.
Another way to fix the problem is define ABIEXTENSION to "o32" or "32"
for mips64-o32, but that may make things confused since "o32" is purely
32 bit.

[YOCTO #10305]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/classes/insane.bbclass | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
index 17c9284..ff2bcfe 100644
--- a/meta/classes/insane.bbclass
+++ b/meta/classes/insane.bbclass
@@ -513,6 +513,8 @@ def package_qa_check_arch(path,name,d, elf, messages):
     """
     Check if archs are compatible
     """
+    import re
+
     if not elf:
         return
 
@@ -541,12 +543,12 @@ def package_qa_check_arch(path,name,d, elf, messages):
         = package_qa_get_machine_dict(d)[target_os][target_arch]
 
     # Check the architecture and endiannes of the binary
-    if not ((machine == elf.machine()) or \
-        ((("virtual/kernel" in provides) or bb.data.inherits_class("module", d) ) and (target_os == "linux-gnux32" or target_os == "linux-gnun32"))):
+    is_32 = (("virtual/kernel" in provides) or bb.data.inherits_class("module", d)) and \
+            (target_os == "linux-gnux32" or re.match('mips64.*32', d.getVar('DEFAULTTUNE', True)))
+    if not ((machine == elf.machine()) or is_32):
         package_qa_add_message(messages, "arch", "Architecture did not match (%s, expected %s) on %s" % \
                  (oe.qa.elf_machine_to_string(elf.machine()), oe.qa.elf_machine_to_string(machine), package_qa_clean_path(path,d)))
-    elif not ((bits == elf.abiSize()) or  \
-        ((("virtual/kernel" in provides) or bb.data.inherits_class("module", d) ) and (target_os == "linux-gnux32" or target_os == "linux-gnun32"))):
+    elif not ((bits == elf.abiSize()) or is_32):
         package_qa_add_message(messages, "arch", "Bit size did not match (%d to %d) %s on %s" % \
                  (bits, elf.abiSize(), bpn, package_qa_clean_path(path,d)))
     elif not littleendian == elf.isLittleEndian():
-- 
2.9.0


