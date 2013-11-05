Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id B28A36D2C4
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Nov 2013 18:47:52 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id rA5IlqaK020150
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 5 Nov 2013 10:47:53 -0800 (PST)
Received: from yow-bashfiel-d3.corp.ad.wrs.com (128.224.130.89) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.347.0; Tue, 5 Nov 2013 10:47:52 -0800
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Tue, 5 Nov 2013 13:47:50 -0500
Message-ID: <d838b0deb3866d2dd09d78cdc6d1e29429a8a373.1383677174.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1383677174.git.bruce.ashfield@windriver.com>
References: <cover.1383677174.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/1] linux-yocto/3.10: fix qemuarm boot and spurious mips build warning
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
X-List-Received-Date: Tue, 05 Nov 2013 18:47:53 -0000
Content-Type: text/plain

This update fixes two issues:

a) qemuarm boot failure

v3.10.13 picked up a patch for arm versatile interrupt mappings that fixes
the emulator boot out of the box. But it interacts badly with our previous
fix for the issue. Reverting the existing patch and going with the mainline
solution fixes the boot.

b) qemumips build warning and failure

Depending on the build host and compiler, the build of menuconfig throws
an potentially uninitialized variable warning. That warning causes an
error on archs with -Werror. We can do a trivial change to avoid the
warning all together (initilize it to null), and keep everyone happy.

[YOCTO #5460]

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_3.10.bb   |  4 ++--
 meta/recipes-kernel/linux/linux-yocto-tiny_3.10.bb |  2 +-
 meta/recipes-kernel/linux/linux-yocto_3.10.bb      | 14 +++++++-------
 3 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_3.10.bb b/meta/recipes-kernel/linux/linux-yocto-rt_3.10.bb
index 53d546c..ab95ad1 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_3.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_3.10.bb
@@ -3,8 +3,8 @@ require recipes-kernel/linux/linux-yocto.inc
 KBRANCH = "standard/preempt-rt/base"
 KBRANCH_qemuppc = "standard/preempt-rt/qemuppc"
 
-SRCREV_machine ?= "919b378578a8f931ee87092f1ce2608a6c2815db"
-SRCREV_machine_qemuppc ?= "be60fd54789f04941b51665970ef121089f9b93e"
+SRCREV_machine ?= "97499dfaea61934719b91f1347f468c6f0125b2c"
+SRCREV_machine_qemuppc ?= "54cb4efa033af86301934d58d890a5324cc95a75"
 SRCREV_meta ?= "f1c9080cd27f99700fa59b5375d1ddd0afe625ad"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.10.git;bareclone=1;branch=${KBRANCH},meta;name=machine,meta"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_3.10.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_3.10.bb
index c769517..c15c311 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_3.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_3.10.bb
@@ -9,7 +9,7 @@ LINUX_VERSION ?= "3.10.17"
 
 KMETA = "meta"
 
-SRCREV_machine ?= "375aee37c2508899b6a8c0bdff7d4d67cb75fb36"
+SRCREV_machine ?= "c03195ed6e3066494e3fb4be69154a57066e845b"
 SRCREV_meta ?= "f1c9080cd27f99700fa59b5375d1ddd0afe625ad"
 
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_3.10.bb b/meta/recipes-kernel/linux/linux-yocto_3.10.bb
index af50b5c..eff245d 100644
--- a/meta/recipes-kernel/linux/linux-yocto_3.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_3.10.bb
@@ -3,13 +3,13 @@ require recipes-kernel/linux/linux-yocto.inc
 KBRANCH_DEFAULT = "standard/base"
 KBRANCH = "${KBRANCH_DEFAULT}"
 
-SRCREV_machine_qemuarm ?= "47ba9c54bfa38b70e2c7500a7e30a738c667cb95"
-SRCREV_machine_qemumips  ?= "b9d36bdb86b595d9823392402b31bdb76439054c"
-SRCREV_machine_qemuppc ?= "e13586324a05aba0f0cf2523ad9eecda2edd3b94"
-SRCREV_machine_qemux86 ?= "375aee37c2508899b6a8c0bdff7d4d67cb75fb36"
-SRCREV_machine_qemux86-64 ?= "375aee37c2508899b6a8c0bdff7d4d67cb75fb36"
-SRCREV_machine_qemumips64 ?= "44eaa7b02aa1e4b8e539c2227702f74f9fcbcfea"
-SRCREV_machine ?= "375aee37c2508899b6a8c0bdff7d4d67cb75fb36"
+SRCREV_machine_qemuarm ?= "5714b747cf0087bb964cbb962db8d3d2041f3177"
+SRCREV_machine_qemumips  ?= "e87d2cb44bc5d10f3619871541849064bf0d79b1"
+SRCREV_machine_qemuppc ?= "3e99f981fea427696f63af7fd8e99bf05039efee"
+SRCREV_machine_qemux86 ?= "c03195ed6e3066494e3fb4be69154a57066e845b"
+SRCREV_machine_qemux86-64 ?= "c03195ed6e3066494e3fb4be69154a57066e845b"
+SRCREV_machine_qemumips64 ?= "8d21f71847640fc052bda1bf1f3792634cae5bb1"
+SRCREV_machine ?= "c03195ed6e3066494e3fb4be69154a57066e845b"
 SRCREV_meta ?= "f1c9080cd27f99700fa59b5375d1ddd0afe625ad"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.10.git;bareclone=1;branch=${KBRANCH},${KMETA};name=machine,meta"
-- 
1.8.1.2


