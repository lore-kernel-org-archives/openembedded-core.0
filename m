Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id C203C73223
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 May 2015 19:09:02 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.9) with ESMTP id t4LJ92Oi025031
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 21 May 2015 12:09:02 -0700 (PDT)
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.224.2; Thu, 21 May 2015 12:09:02 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Thu, 21 May 2015 15:08:56 -0400
Message-ID: <b36c8a68c82eb1454e0c842ab2a390fc772a159e.1432235097.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <cover.1432235097.git.bruce.ashfield@windriver.com>
References: <cover.1432235097.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 6/7] linux-yocto/3.19: CONFIG_ATA_BMDMA and gcc5 ARM64
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
X-List-Received-Date: Thu, 21 May 2015 19:09:02 -0000
Content-Type: text/plain

Integrating the following commit to remove a ATA configuration warning:

    common-pc-drivers: Enable CONFIG_ATA_BMDMA

    Enabling the ATA_BMDMA re-enables ATA_PIIX which was getting
    disabled

    Signed-off-by: Saul Wold <sgw@linux.intel.com>

And the following to fix the ARM64 gcc5 boot:

    arm64: psci: move psci firmware calls out of line

    An arm64 allmodconfig fails to build with GCC 5 due to __asmeq
    assertions in the PSCI firmware calling code firing due to mcount
    preambles breaking our assumptions about register allocation of
    function
    arguments:

      /tmp/ccDqJsJ6.s: Assembler messages:
      /tmp/ccDqJsJ6.s:60: Error: .err encountered
      /tmp/ccDqJsJ6.s:61: Error: .err encountered
      /tmp/ccDqJsJ6.s:62: Error: .err encountered
      /tmp/ccDqJsJ6.s:99: Error: .err encountered
      /tmp/ccDqJsJ6.s:100: Error: .err encountered
      /tmp/ccDqJsJ6.s:101: Error: .err encountered

    This patch fixes the issue by moving the PSCI calls out-of-line into
    their own assembly files, which are safe from the compiler's
    meddling
    fingers.

    Reported-by: Andy Whitcroft <apw@canonical.com>
    Signed-off-by: Will Deacon <will.deacon@arm.com>
    Signed-off-by: Catalin Marinas <catalin.marinas@arm.com>
    Signed-off-by: Armin Kuter <akuster@mvista.com>

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-tiny_3.19.bb |  4 ++--
 meta/recipes-kernel/linux/linux-yocto_3.19.bb      | 18 +++++++++---------
 2 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_3.19.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_3.19.bb
index e55a75a74e4e..bb567d67a3fd 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_3.19.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_3.19.bb
@@ -9,8 +9,8 @@ LINUX_VERSION ?= "3.19.5"
 KMETA = "meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "374b5d0e09ea016975f3d5ab5544968f31054f52"
-SRCREV_meta ?= "7215fe431391a322c7e39f410e7b8f2a2b507892"
+SRCREV_machine ?= "a3f6f39fc369dba2816908bc1b324e0170aaa27d"
+SRCREV_meta ?= "44879ee54dce8e11695dcb476d1b178a48a71f6a"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_3.19.bb b/meta/recipes-kernel/linux/linux-yocto_3.19.bb
index 72fe25ac867f..8d8a8c5901d1 100644
--- a/meta/recipes-kernel/linux/linux-yocto_3.19.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_3.19.bb
@@ -11,15 +11,15 @@ KBRANCH_qemux86  ?= "standard/common-pc"
 KBRANCH_qemux86-64 ?= "standard/common-pc-64/base"
 KBRANCH_qemumips64 ?= "standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "00d625a9e909ff5cbf138cb20dc54e10f30638b3"
-SRCREV_machine_qemuarm64 ?= "374b5d0e09ea016975f3d5ab5544968f31054f52"
-SRCREV_machine_qemumips ?= "76bf3763b224e6d15c060206015f787e8968a4d7"
-SRCREV_machine_qemuppc ?= "6188d8bb5f774f0f760225f34371e94fcf8615d4"
-SRCREV_machine_qemux86 ?= "374b5d0e09ea016975f3d5ab5544968f31054f52"
-SRCREV_machine_qemux86-64 ?= "374b5d0e09ea016975f3d5ab5544968f31054f52"
-SRCREV_machine_qemumips64 ?= "623f6699ea6c4148579c8ede54ccfe0f3784b531"
-SRCREV_machine ?= "374b5d0e09ea016975f3d5ab5544968f31054f52"
-SRCREV_meta ?= "7215fe431391a322c7e39f410e7b8f2a2b507892"
+SRCREV_machine_qemuarm ?= "97428dbb2231f8a715de9db66f3c2358e4927716"
+SRCREV_machine_qemuarm64 ?= "a3f6f39fc369dba2816908bc1b324e0170aaa27d"
+SRCREV_machine_qemumips ?= "a4573b23f8fa35a6e93131fac2f1c0f1d5115fea"
+SRCREV_machine_qemuppc ?= "8bbd8a1369c773dbe8bed27b613aa4b7dd175670"
+SRCREV_machine_qemux86 ?= "a3f6f39fc369dba2816908bc1b324e0170aaa27d"
+SRCREV_machine_qemux86-64 ?= "a3f6f39fc369dba2816908bc1b324e0170aaa27d"
+SRCREV_machine_qemumips64 ?= "62681c2cfa32bee03aee368b704228bc91c2483f"
+SRCREV_machine ?= "a3f6f39fc369dba2816908bc1b324e0170aaa27d"
+SRCREV_meta ?= "44879ee54dce8e11695dcb476d1b178a48a71f6a"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.19.git;bareclone=1;branch=${KBRANCH},${KMETA};name=machine,meta"
 
-- 
2.1.0


