Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 1A34661479
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Sep 2013 18:24:47 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r8IIOlwp029322
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 18 Sep 2013 11:24:47 -0700 (PDT)
Received: from yow-bashfiel-d3.wrs.com (128.224.130.112) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.347.0; Wed, 18 Sep 2013 11:24:46 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Wed, 18 Sep 2013 14:24:41 -0400
Message-ID: <bdf93a2582ab9d112a2861db3be49d659a9e5157.1379528498.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1379528498.git.bruce.ashfield@windriver.com>
References: <cover.1379528498.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/3] linux-yocto/3.10: fix long perf compile times
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
X-List-Received-Date: Wed, 18 Sep 2013 18:24:47 -0000
Content-Type: text/plain

perf's builtin-sched.c triggers extremly long build times on some
architectures due to gcc 4.7+ var-tracking functionality.

To fix this, we can cherry pick the 3.12 commit:

  f36f83f94 [perf sched: Move struct perf_sched definition out of cmd_sched()]

With this change build times are reduced from 15 to 20 minutes for qemuarm to:

  real    2m19.940s
  user    1m35.438s
  sys     0m11.165s

For kernel's that are not carrying this patch, the following can be added
to the perf recipe to also fix the issue:

    +++ b/meta/recipes-kernel/perf/perf.bb
    @@ -68,6 +68,7 @@ EXTRA_OEMAKE = \
		    CC="${CC}" \
		    AR="${AR}" \
		    perfexecdir=${libexecdir} \
    +               EXTRA_CFLAGS="-fno-var-tracking" \
		    NO_GTK2=1 ${TUI_DEFINES} NO_DWARF=1 ${SCRIPTING_DEFINES} \

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_3.10.bb   |    4 ++--
 meta/recipes-kernel/linux/linux-yocto-tiny_3.10.bb |    2 +-
 meta/recipes-kernel/linux/linux-yocto_3.10.bb      |   14 +++++++-------
 3 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_3.10.bb b/meta/recipes-kernel/linux/linux-yocto-rt_3.10.bb
index 65fb5f0..b6ad4d4 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_3.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_3.10.bb
@@ -3,8 +3,8 @@ require recipes-kernel/linux/linux-yocto.inc
 KBRANCH = "standard/preempt-rt/base"
 KBRANCH_qemuppc = "standard/preempt-rt/qemuppc"
 
-SRCREV_machine ?= "4de6b6b24c44ef644b46405a85c550128d4a779a"
-SRCREV_machine_qemuppc ?= "24a1786e5ed0d479638af5738375e396bf4c922c"
+SRCREV_machine ?= "f1e003e9441f0366d7b9a2209ef3108438745ea3"
+SRCREV_machine_qemuppc ?= "12be459359d5b20dbf856aa3649304c6f618d420"
 SRCREV_meta ?= "4f689aa30a2c9cf5dceb2fa3696d2cb208ee9173"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.10.git;bareclone=1;branch=${KBRANCH},meta;name=machine,meta"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_3.10.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_3.10.bb
index 4b33f3c..15ae4c5 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_3.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_3.10.bb
@@ -9,7 +9,7 @@ LINUX_VERSION ?= "3.10.11"
 
 KMETA = "meta"
 
-SRCREV_machine ?= "702040ac7c7ec66a29b4d147665ccdd0ff015577"
+SRCREV_machine ?= "e1aa804148370cda6f85640281af156ffa007d52"
 SRCREV_meta ?= "4f689aa30a2c9cf5dceb2fa3696d2cb208ee9173"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
diff --git a/meta/recipes-kernel/linux/linux-yocto_3.10.bb b/meta/recipes-kernel/linux/linux-yocto_3.10.bb
index 3e8b476..5dea36f 100644
--- a/meta/recipes-kernel/linux/linux-yocto_3.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_3.10.bb
@@ -3,13 +3,13 @@ require recipes-kernel/linux/linux-yocto.inc
 KBRANCH_DEFAULT = "standard/base"
 KBRANCH = "${KBRANCH_DEFAULT}"
 
-SRCREV_machine_qemuarm ?= "4901b46258e7195bd4d4ff14a618a2cb71395bf3"
-SRCREV_machine_qemumips  ?= "bc6be45f32ef091ff13b16ba0f74f611232e5d21"
-SRCREV_machine_qemuppc ?= "789d821269f0496e95ed953f2d1126c4eb39c591"
-SRCREV_machine_qemux86 ?= "702040ac7c7ec66a29b4d147665ccdd0ff015577"
-SRCREV_machine_qemux86-64 ?= "702040ac7c7ec66a29b4d147665ccdd0ff015577"
-SRCREV_machine_qemumips64 ?= "6b3a777e3724d30ba03d88d75698fa0734c5a73f"
-SRCREV_machine ?= "702040ac7c7ec66a29b4d147665ccdd0ff015577"
+SRCREV_machine_qemuarm ?= "aa1fa3cec7bd6e47f29acc5b5fbffddc16569883"
+SRCREV_machine_qemumips  ?= "5b908fd12f60de1e51e932c5df477a49b0ab2b40"
+SRCREV_machine_qemuppc ?= "e80029ac30022c554e916ed438435ecc03cc2cea"
+SRCREV_machine_qemux86 ?= "e1aa804148370cda6f85640281af156ffa007d52"
+SRCREV_machine_qemux86-64 ?= "e1aa804148370cda6f85640281af156ffa007d52"
+SRCREV_machine_qemumips64 ?= "6973844d304411893420a7e57545edc4dc854bd7"
+SRCREV_machine ?= "e1aa804148370cda6f85640281af156ffa007d52"
 SRCREV_meta ?= "4f689aa30a2c9cf5dceb2fa3696d2cb208ee9173"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.10.git;bareclone=1;branch=${KBRANCH},${KMETA};name=machine,meta"
-- 
1.7.10.4


