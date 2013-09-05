Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id CB1EC615E4
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Sep 2013 02:20:28 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r852KS0x026007
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 4 Sep 2013 19:20:28 -0700 (PDT)
Received: from yow-bashfiel-d3.wrs.com (128.224.147.67) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.347.0; Wed, 4 Sep 2013 19:20:27 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Wed, 4 Sep 2013 22:20:22 -0400
Message-ID: <7ca990d4a580b065c7e9e4eb093b728be01edba4.1378347409.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1378347409.git.bruce.ashfield@windriver.com>
References: <cover.1378347409.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/3] linux-yocto/3.10: fix YAFFS2 build issues
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
X-List-Received-Date: Thu, 05 Sep 2013 02:20:29 -0000
Content-Type: text/plain

The 3.10 yaffs2 refresh caused several build errors. One due the single kernel
version support being incomplete, and two others due to core kernel changes
creating incompatbilies with the yaffs2 code.

The following three commits fix the issues.

  b76f445 yaffs2: disable procfs support
  ecfe5ed yaffs2: convert to kuid_t and kgid_t
  fa8efc9 yaffs2: restore multi-kernel version functionality

bumping the SRCREVs for all BSPs to import the fix.

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_3.10.bb   |    4 ++--
 meta/recipes-kernel/linux/linux-yocto-tiny_3.10.bb |    2 +-
 meta/recipes-kernel/linux/linux-yocto_3.10.bb      |   14 +++++++-------
 3 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_3.10.bb b/meta/recipes-kernel/linux/linux-yocto-rt_3.10.bb
index cfcb711..797cad7 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_3.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_3.10.bb
@@ -3,8 +3,8 @@ require recipes-kernel/linux/linux-yocto.inc
 KBRANCH = "standard/preempt-rt/base"
 KBRANCH_qemuppc = "standard/preempt-rt/qemuppc"
 
-SRCREV_machine ?= "8a9b4902683f586f7d656c2e6747e314a5e1ed0e"
-SRCREV_machine_qemuppc ?= "655d20d4f64dc053b40ac8d8fe44b82dec5e130a"
+SRCREV_machine ?= "94e63f0640ef3680a605e82ee19f3de688f0ec59"
+SRCREV_machine_qemuppc ?= "2c0455935f1964ce69c70d0f7980a656040e50ea"
 SRCREV_meta ?= "cd502a88148ab214b54860f97a96f41858fd6446"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.10.git;bareclone=1;branch=${KBRANCH},meta;name=machine,meta"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_3.10.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_3.10.bb
index 5b84620..2d85537 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_3.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_3.10.bb
@@ -9,7 +9,7 @@ LINUX_VERSION ?= "3.10.9"
 
 KMETA = "meta"
 
-SRCREV_machine ?= "7144bcc4b8091675bfcf1941479067857b6242da"
+SRCREV_machine ?= "b76f4452b72080a538406abc9b290a5d811d61f8"
 SRCREV_meta ?= "cd502a88148ab214b54860f97a96f41858fd6446"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
diff --git a/meta/recipes-kernel/linux/linux-yocto_3.10.bb b/meta/recipes-kernel/linux/linux-yocto_3.10.bb
index 7121881..b6d9eae 100644
--- a/meta/recipes-kernel/linux/linux-yocto_3.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_3.10.bb
@@ -3,13 +3,13 @@ require recipes-kernel/linux/linux-yocto.inc
 KBRANCH_DEFAULT = "standard/base"
 KBRANCH = "${KBRANCH_DEFAULT}"
 
-SRCREV_machine_qemuarm ?= "24d53cd6ca4c3ae8f5dd2ff840f9275327d955ee"
-SRCREV_machine_qemumips  ?= "0480771238bb87031b79ecb1ee6bce7bfe6ffb1c"
-SRCREV_machine_qemuppc ?= "a9c383957f69e70fd2cb27d885160303a305cf57"
-SRCREV_machine_qemux86 ?= "7144bcc4b8091675bfcf1941479067857b6242da"
-SRCREV_machine_qemux86-64 ?= "7144bcc4b8091675bfcf1941479067857b6242da"
-SRCREV_machine_qemumips64 ?= "10a8db0603d7186633a6bf90e2308710763e718e"
-SRCREV_machine ?= "7144bcc4b8091675bfcf1941479067857b6242da"
+SRCREV_machine_qemuarm ?= "d8c48090a1272c69e009c4ef5fa675fc8db178cc"
+SRCREV_machine_qemumips  ?= "181188440e96896fbc69fa2c5ea5d2ee43304da0"
+SRCREV_machine_qemuppc ?= "c0a23bc4b4d6be3d2f09a81dfeb3456f51b8d439"
+SRCREV_machine_qemux86 ?= "b76f4452b72080a538406abc9b290a5d811d61f8"
+SRCREV_machine_qemux86-64 ?= "b76f4452b72080a538406abc9b290a5d811d61f8"
+SRCREV_machine_qemumips64 ?= "3a0d015e9908b69666c7f7780502aed4d115de1d"
+SRCREV_machine ?= "b76f4452b72080a538406abc9b290a5d811d61f8"
 SRCREV_meta ?= "cd502a88148ab214b54860f97a96f41858fd6446"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.10.git;bareclone=1;branch=${KBRANCH},${KMETA};name=machine,meta"
-- 
1.7.10.4


