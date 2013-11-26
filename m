Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 229A26DD4F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Nov 2013 17:33:51 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id rAQHXnp5029325
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 26 Nov 2013 09:33:49 -0800 (PST)
Received: from yow-bashfiel-d3.wrs.com (128.224.147.67) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.347.0; Tue, 26 Nov 2013 09:33:49 -0800
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Tue, 26 Nov 2013 12:33:45 -0500
Message-ID: <0a6c3273f6af3ec8efdf76216af21ad428b021d7.1385487115.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1385487115.git.bruce.ashfield@windriver.com>
References: <cover.1385487115.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/3] linux-yocto/3.10: -rt, ebtables and e1000 fixes
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
X-List-Received-Date: Tue, 26 Nov 2013 17:33:51 -0000
Content-Type: text/plain

Updating the 3.10 SRCREVs for the following fixes:

  f47ea28 bridge: enable EBTABLES
  a9ec82e e1000: prevent oops when adapter is being closed and reset simultaneously
  a4e1bd7 Revert "arm: add dummy swizzle for versatile with qemu"

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_3.10.bb   |  6 +++---
 meta/recipes-kernel/linux/linux-yocto-tiny_3.10.bb |  4 ++--
 meta/recipes-kernel/linux/linux-yocto_3.10.bb      | 16 ++++++++--------
 3 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_3.10.bb b/meta/recipes-kernel/linux/linux-yocto-rt_3.10.bb
index d040e3e..d9c5afa 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_3.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_3.10.bb
@@ -3,9 +3,9 @@ require recipes-kernel/linux/linux-yocto.inc
 KBRANCH = "standard/preempt-rt/base"
 KBRANCH_qemuppc = "standard/preempt-rt/qemuppc"
 
-SRCREV_machine ?= "a9b2df9bd27b137408d627ce1f75f1177eae647e"
-SRCREV_machine_qemuppc ?= "601746ed79b7ccc79e31166dea9b2906c915a7e3"
-SRCREV_meta ?= "41072c6288b1ab468670ebf7b3d411fbc177317c"
+SRCREV_machine ?= "ee9480cd91b2b46325a2da9aa6ae779d8e4163c0"
+SRCREV_machine_qemuppc ?= "5c126504c0a2f72d80bae9d96cea7eb9d7854290"
+SRCREV_meta ?= "f47ea2844543c8ebf4572cfe23e4cfd6cb94d887"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.10.git;bareclone=1;branch=${KBRANCH},meta;name=machine,meta"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_3.10.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_3.10.bb
index 0939ce6..a866421 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_3.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_3.10.bb
@@ -9,8 +9,8 @@ LINUX_VERSION ?= "3.10.19"
 
 KMETA = "meta"
 
-SRCREV_machine ?= "2d96adf459037aec2c0027503c3eddfc20de9ad4"
-SRCREV_meta ?= "41072c6288b1ab468670ebf7b3d411fbc177317c"
+SRCREV_machine ?= "a9ec82e355130160f9094e670bd5be0022a84194"
+SRCREV_meta ?= "f47ea2844543c8ebf4572cfe23e4cfd6cb94d887"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_3.10.bb b/meta/recipes-kernel/linux/linux-yocto_3.10.bb
index c678a8b..d85c6c4 100644
--- a/meta/recipes-kernel/linux/linux-yocto_3.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_3.10.bb
@@ -3,14 +3,14 @@ require recipes-kernel/linux/linux-yocto.inc
 KBRANCH_DEFAULT = "standard/base"
 KBRANCH = "${KBRANCH_DEFAULT}"
 
-SRCREV_machine_qemuarm ?= "9aac62bcd594648a7da61fa89e7da14eb2747e31"
-SRCREV_machine_qemumips  ?= "141675948177bed049477ea53203dd0fc3c105c4"
-SRCREV_machine_qemuppc ?= "ebcaee076da19ffe0e317089566d22c199f16fad"
-SRCREV_machine_qemux86 ?= "2d96adf459037aec2c0027503c3eddfc20de9ad4"
-SRCREV_machine_qemux86-64 ?= "2d96adf459037aec2c0027503c3eddfc20de9ad4"
-SRCREV_machine_qemumips64 ?= "7acc7b9b44fb0b97a50e75387a11a24dfd5c242a"
-SRCREV_machine ?= "2d96adf459037aec2c0027503c3eddfc20de9ad4"
-SRCREV_meta ?= "41072c6288b1ab468670ebf7b3d411fbc177317c"
+SRCREV_machine_qemuarm ?= "7744145fcc3e4b6b6e308a1b86dc1c8b237b7575"
+SRCREV_machine_qemumips  ?= "2b8e8c694c38729ce724facdb0ab20751d061a2e"
+SRCREV_machine_qemuppc ?= "9a7537cb9bcc5c835dae6ac84fbbe7298473f69c"
+SRCREV_machine_qemux86 ?= "a9ec82e355130160f9094e670bd5be0022a84194"
+SRCREV_machine_qemux86-64 ?= "a9ec82e355130160f9094e670bd5be0022a84194"
+SRCREV_machine_qemumips64 ?= "0cd8e958d0ec7e01fd21fc7891da7eed688b0d37"
+SRCREV_machine ?= "a9ec82e355130160f9094e670bd5be0022a84194"
+SRCREV_meta ?= "f47ea2844543c8ebf4572cfe23e4cfd6cb94d887"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.10.git;bareclone=1;branch=${KBRANCH},${KMETA};name=machine,meta"
 
-- 
1.8.1.2


