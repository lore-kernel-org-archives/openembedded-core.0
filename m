Return-Path: <Ming.Liu@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 5162C7027F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Jul 2014 05:27:02 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s6F5R2n9006318
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Jul 2014 22:27:03 -0700 (PDT)
Received: from PEK-MLIU3-D1.corp.ad.wrs.com (128.224.163.186) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.169.1; Mon, 14 Jul 2014 22:27:02 -0700
From: Ming Liu <ming.liu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 15 Jul 2014 13:26:59 +0800
Message-ID: <1405402019-31886-1-git-send-email-ming.liu@windriver.com>
X-Mailer: git-send-email 1.8.4.1
MIME-Version: 1.0
Subject: [PATCH] insane.bbclass: avoid QA errors for n32 kernel
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
X-List-Received-Date: Tue, 15 Jul 2014 05:27:03 -0000
Content-Type: text/plain

A series of commits had been integrated to avoid qa checking code
throwing the bitsize not matched error for x32 kernel files, the
same logic is also needed by n32 kernel which was not addressed in
that series.

This commit extends the condition for n32 kernel files.

Signed-off-by: Ming Liu <ming.liu@windriver.com>
---
 meta/classes/insane.bbclass | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
index 106ace7..0fb568f 100644
--- a/meta/classes/insane.bbclass
+++ b/meta/classes/insane.bbclass
@@ -461,11 +461,11 @@ def package_qa_check_arch(path,name,d, elf, messages):
 
     # Check the architecture and endiannes of the binary
     if not ((machine == elf.machine()) or \
-        ((("virtual/kernel" in provides) or bb.data.inherits_class("module", d) ) and (target_os == "linux-gnux32"))):
+        ((("virtual/kernel" in provides) or bb.data.inherits_class("module", d) ) and (target_os == "linux-gnux32" or target_os == "linux-gnun32"))):
         messages.append("Architecture did not match (%d to %d) on %s" % \
                  (machine, elf.machine(), package_qa_clean_path(path,d)))
     elif not ((bits == elf.abiSize()) or  \
-        ((("virtual/kernel" in provides) or bb.data.inherits_class("module", d) ) and (target_os == "linux-gnux32"))):
+        ((("virtual/kernel" in provides) or bb.data.inherits_class("module", d) ) and (target_os == "linux-gnux32" or target_os == "linux-gnun32"))):
         messages.append("Bit size did not match (%d to %d) %s on %s" % \
                  (bits, elf.abiSize(), bpn, package_qa_clean_path(path,d)))
     elif not littleendian == elf.isLittleEndian():
-- 
1.8.4.1


