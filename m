Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id CA78770EEC
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Aug 2014 16:21:45 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s7KGLZUM024547
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 20 Aug 2014 09:21:36 -0700 (PDT)
Received: from yow-bashfiel-d3.wrs.com (128.224.56.46) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Wed, 20 Aug 2014 09:21:35 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Wed, 20 Aug 2014 12:21:27 -0400
Message-ID: <3f8565e722a4381ee7fe74937fc46accac160634.1408551509.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1408551509.git.bruce.ashfield@windriver.com>
References: <cover.1408551509.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/7] linux-yocto/3.14: add ARM kprobes support
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
X-List-Received-Date: Wed, 20 Aug 2014 16:21:46 -0000
Content-Type: text/plain

Adding the following commits to the 3.14 tree for ARM kprobe support:

   c1750e55eb75 ARM: add uprobes support
   33e8a1334afe ARM: Make arch_specific_insn a define for new arch_probes_insn structure
   b1d3feead083 ARM: Add an emulate flag to the kprobes/uprobes instruction decode functions
   84b5b70a01a2 ARM: Change the remaining shared kprobes/uprobes symbols to something generic
   624e5e9aab5a ARM: Rename the shared kprobes/uprobe return value enum
   7741eac39c2e ARM: Change more ARM kprobes symbol names to something more generic
   47f51bac6a2d ARM: Make the kprobes condition_check symbol names more generic
   3af2f454bb8e ARM: Remove use of struct kprobe from generic probes code
   a31964d3143a ARM: use a function table for determining instruction interpreter action
   6de77767abfc ARM: move generic thumb instruction parsing code to new files for use by other feature
   eb2db188b856 ARM: Move generic arm instruction parsing code to new files for sharing between features
   bbc0a43ff46e ARM: move shared uprobe/kprobe definitions into new include file
   f5f2896020e6 uprobes: allow ignoring of probe hits
   cb133db6bd60 ARM: Fix missing includes in kprobes sources

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_3.14.bb   |  4 ++--
 meta/recipes-kernel/linux/linux-yocto-tiny_3.14.bb |  2 +-
 meta/recipes-kernel/linux/linux-yocto_3.14.bb      | 14 +++++++-------
 3 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_3.14.bb b/meta/recipes-kernel/linux/linux-yocto-rt_3.14.bb
index 78209b1070ef..4a91638c55b4 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_3.14.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_3.14.bb
@@ -3,8 +3,8 @@ require recipes-kernel/linux/linux-yocto.inc
 KBRANCH = "standard/preempt-rt/base"
 KBRANCH_qemuppc = "standard/preempt-rt/qemuppc"
 
-SRCREV_machine ?= "8ef1733b66a1646b85338a310f787e0057a6a4e9"
-SRCREV_machine_qemuppc ?= "3079c794c30b0de82bc87b19cf477d82405a9094"
+SRCREV_machine ?= "9e6a44f2c638dc94692a8094eda3919cbc53cdb7"
+SRCREV_machine_qemuppc ?= "04464fbce3be9894f0752d3fbd5c1bf3fb14ebcf"
 SRCREV_meta ?= "54d07ec2566afe2a4c1eee4995781aab5599b5d5"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.14.git;bareclone=1;branch=${KBRANCH},meta;name=machine,meta"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_3.14.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_3.14.bb
index 47be35769d0d..8cc1d5660849 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_3.14.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_3.14.bb
@@ -8,7 +8,7 @@ LINUX_VERSION ?= "3.14.5"
 
 KMETA = "meta"
 
-SRCREV_machine ?= "5724bf17acbf54cf61003ab242448fd96d189384"
+SRCREV_machine ?= "c1750e55eb751d4773ea4c3e924e1858feb15e4e"
 SRCREV_meta ?= "54d07ec2566afe2a4c1eee4995781aab5599b5d5"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
diff --git a/meta/recipes-kernel/linux/linux-yocto_3.14.bb b/meta/recipes-kernel/linux/linux-yocto_3.14.bb
index 1e397e902648..52ba9336dc16 100644
--- a/meta/recipes-kernel/linux/linux-yocto_3.14.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_3.14.bb
@@ -10,13 +10,13 @@ KBRANCH_qemux86  = "standard/common-pc/base"
 KBRANCH_qemux86-64  = "standard/common-pc-64/base"
 KBRANCH_qemumips64 = "standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "b38b84aebf889d84e65e81ac11122b977f0c5155"
-SRCREV_machine_qemumips ?= "c9d827207d8dfab330787659b2842485dbd36d77"
-SRCREV_machine_qemuppc ?= "58b7cb00580985410ba8491c61e80d2572552ed9"
-SRCREV_machine_qemux86 ?= "5b327970eb1dba02c65cb8330dc8f3049c4fa580"
-SRCREV_machine_qemux86-64 ?= "5724bf17acbf54cf61003ab242448fd96d189384"
-SRCREV_machine_qemumips64 ?= "34837892b66eaa034cd3e3d339cab0ea6f594511"
-SRCREV_machine ?= "5724bf17acbf54cf61003ab242448fd96d189384"
+SRCREV_machine_qemuarm ?= "b91ab4c1bf0dccef4c93aeb184fca3a933682ba0"
+SRCREV_machine_qemumips ?= "1fdf6bfb5ecefccddead6e1d53b6e19d52da092e"
+SRCREV_machine_qemuppc ?= "8a44bd5e4fca2260d2e24e2cb4a5f276d000fae8"
+SRCREV_machine_qemux86 ?= "984636272f33a48803e1b0f8f48553894306b4e2"
+SRCREV_machine_qemux86-64 ?= "c1750e55eb751d4773ea4c3e924e1858feb15e4e"
+SRCREV_machine_qemumips64 ?= "a240524ebe0051faf7ada3cdb3241dda6d8d3ba3"
+SRCREV_machine ?= "c1750e55eb751d4773ea4c3e924e1858feb15e4e"
 SRCREV_meta ?= "54d07ec2566afe2a4c1eee4995781aab5599b5d5"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.14.git;bareclone=1;branch=${KBRANCH},${KMETA};name=machine,meta"
-- 
1.8.1.2


