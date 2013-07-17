Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id F1B976B2AC
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Jul 2013 18:07:44 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r6HI7jwZ029942
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Jul 2013 11:07:46 -0700 (PDT)
Received: from yow-bashfiel-d3.corp.ad.wrs.com (128.224.130.143) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.342.3; Wed, 17 Jul 2013 11:07:45 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 17 Jul 2013 14:07:40 -0400
Message-ID: <bc1a9f81cb27301909fdbfd3eb80dda73a121766.1374084357.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1374084357.git.bruce.ashfield@windriver.com>
References: <cover.1374084357.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/3] linux-yocto/3.4: mips: fix gcc 4.8 compilation
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
X-List-Received-Date: Wed, 17 Jul 2013 18:07:45 -0000
Content-Type: text/plain

Updating the SRCREVs to enable the following fix for gcc 4.8 mips
compilation:

    Author: Steven J. Hill <sjhill@mips.com>
    Date:   Fri Jul 6 21:56:01 2012 +0200

    MIPS: Refactor 'clear_page' and 'copy_page' functions.

    Remove usage of the '__attribute__((alias("...")))' hack that aliased
    to integer arrays containing micro-assembled instructions. This hack
    breaks when building a microMIPS kernel. It also makes the code much
    easier to understand.

    [ralf@linux-mips.org: Added back export of the clear_page and copy_page
    symbols so certain modules will work again.  Also fixed build with
    CONFIG_SIBYTE_DMA_PAGEOPS enabled.]

    Signed-off-by: Steven J. Hill <sjhill@mips.com>
    Cc: linux-mips@linux-mips.org
    Patchwork: https://patchwork.linux-mips.org/patch/3866/
    Acked-by: David Daney <david.daney@cavium.com>
    Signed-off-by: Ralf Baechle <ralf@linux-mips.org>
    (cherry picked from commit c022630633624a75b3b58f43dd3c6cc896a56cff)

    Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb   |    4 ++--
 meta/recipes-kernel/linux/linux-yocto-tiny_3.4.bb |    2 +-
 meta/recipes-kernel/linux/linux-yocto_3.4.bb      |   12 ++++++------
 3 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb b/meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb
index 5e50cde..ec53206 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb
@@ -8,8 +8,8 @@ LINUX_KERNEL_TYPE = "preempt-rt"
 
 KMETA = "meta"
 
-SRCREV_machine ?= "1a7a6b495dd6f68e3e2a8a716ceabd283da7f480"
-SRCREV_machine_qemuppc ?= "0ce0666df1e29a74ccfd65bbcf8286b2e632cc3f"
+SRCREV_machine ?= "516cc41b2f9a93d77fe6713bb6dfec20aa24f5ce"
+SRCREV_machine_qemuppc ?= "a96230572ba5bc05decb7bcaa81b02e972d6841b"
 SRCREV_meta ?= "7250de4d4afc2558082cd42b8a0d151903436e8f"
 
 PR = "${INC_PR}.1"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_3.4.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_3.4.bb
index a61fe70..18c469c 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_3.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_3.4.bb
@@ -12,7 +12,7 @@ LINUX_VERSION ?= "3.4.52"
 
 KMETA = "meta"
 
-SRCREV_machine ?= "cdd7a546922ca1c46c94adeec3b9c90dc9aaad2d"
+SRCREV_machine ?= "4122d6cf3f9e1fd6d54f6e13af29c4c589289fdc"
 SRCREV_meta ?= "7250de4d4afc2558082cd42b8a0d151903436e8f"
 
 PR = "${INC_PR}.1"
diff --git a/meta/recipes-kernel/linux/linux-yocto_3.4.bb b/meta/recipes-kernel/linux/linux-yocto_3.4.bb
index beb67ee..8db015a 100644
--- a/meta/recipes-kernel/linux/linux-yocto_3.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_3.4.bb
@@ -3,12 +3,12 @@ require recipes-kernel/linux/linux-yocto.inc
 KBRANCH_DEFAULT = "standard/base"
 KBRANCH = "${KBRANCH_DEFAULT}"
 
-SRCREV_machine_qemuarm ?= "89c1e24271fba1c235959cb96c91dba98c542821"
-SRCREV_machine_qemumips  ?= "99e87eb8b1e985eb6addf7590c4e837ff7c7e873"
-SRCREV_machine_qemuppc ?= "62f5c50609c93c5b70736a4374cee8075ab82566"
-SRCREV_machine_qemux86 ?= "cdd7a546922ca1c46c94adeec3b9c90dc9aaad2d"
-SRCREV_machine_qemux86-64 ?= "cdd7a546922ca1c46c94adeec3b9c90dc9aaad2d"
-SRCREV_machine ?= "cdd7a546922ca1c46c94adeec3b9c90dc9aaad2d"
+SRCREV_machine_qemuarm ?= "a3bd53305c7dcd11a2683fbe5d830d44236f4cd4"
+SRCREV_machine_qemumips  ?= "e142ba98038a697e3a96b8f30a16e93602eff3c7"
+SRCREV_machine_qemuppc ?= "290c3dd687145104d4e3f0e7732669c1c42b19fe"
+SRCREV_machine_qemux86 ?= "4122d6cf3f9e1fd6d54f6e13af29c4c589289fdc"
+SRCREV_machine_qemux86-64 ?= "4122d6cf3f9e1fd6d54f6e13af29c4c589289fdc"
+SRCREV_machine ?= "4122d6cf3f9e1fd6d54f6e13af29c4c589289fdc"
 SRCREV_meta ?= "7250de4d4afc2558082cd42b8a0d151903436e8f"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.4.git;protocol=git;bareclone=1;branch=${KBRANCH},${KMETA};name=machine,meta"
-- 
1.7.10.4


