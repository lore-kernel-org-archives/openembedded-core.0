Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@windriver.com>) id 1T8scv-0008Rr-K6
	for openembedded-core@lists.openembedded.org;
	Tue, 04 Sep 2012 14:53:10 +0200
Received: from yow-bashfiel-l1.wrs.com (yow-bashfiel-d3.wrs.com
	[128.224.147.67])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id q84Cecwu008783;
	Tue, 4 Sep 2012 05:40:43 -0700 (PDT)
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: richard.purdie@linuxfoundation.org
Date: Tue,  4 Sep 2012 08:40:37 -0400
Message-Id: <dac070c123493f75cba3be84c460e3c91140dbd9.1346762109.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1346762109.git.bruce.ashfield@windriver.com>
References: <cover.1346762109.git.bruce.ashfield@windriver.com>
In-Reply-To: <cover.1346762109.git.bruce.ashfield@windriver.com>
References: <cover.1346762109.git.bruce.ashfield@windriver.com>
Cc: openembedded-core@lists.openembedded.org, saul.wold@intel.com
Subject: [PATCH 6/6] linux-yocto/3.2/3.4: arm: Fix linking errors with binutils 2.23
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 04 Sep 2012 12:53:11 -0000

Updating the 3.2/3.4 linux-yocto SRCREVs to pickup the following fix:

    arm: Fix linking errors with binutils 2.23

    We end up with linking errors on arm using latest binutils
    because we are linking asm generated objects which use -march=all
    generating different attributes into object and use some c objects
    e.g. misc.o which use different march therefore generating a
    different set of attributes into object. When linking is done
    the ld complains since it finds incompatible attributes and ends
    up with errors like

    error: DIV usage mismatch between arch/arm/boot/compressed/head.o and
    output
    error: DIV usage mismatch between arch/arm/boot/compressed/misc.o and
    output
    error: DIV usage mismatch between arch/arm/boot/compressed/decompress.o
    and output
    error: DIV usage mismatch between arch/arm/boot/compressed/lib1funcs.o
    and output

    This patch fixes it by providing correct march to assembly routines
    which than matches with output of ld.

    Signed-off-by: Khem Raj <raj.khem@gmail.com>

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_3.2.bb   |    4 ++--
 meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb   |    4 ++--
 meta/recipes-kernel/linux/linux-yocto-tiny_3.2.bb |    2 +-
 meta/recipes-kernel/linux/linux-yocto_3.2.bb      |   12 ++++++------
 meta/recipes-kernel/linux/linux-yocto_3.4.bb      |   12 ++++++------
 5 files changed, 17 insertions(+), 17 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_3.2.bb b/meta/recipes-kernel/linux/linux-yocto-rt_3.2.bb
index e2aa67d..05362ef 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_3.2.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_3.2.bb
@@ -8,8 +8,8 @@ LINUX_KERNEL_TYPE = "preempt-rt"
 
 KMETA = "meta"
 
-SRCREV_machine ?= "01c5c310886e87e785db5c3bb776deb5ed2e03b2"
-SRCREV_machine_qemuppc ?= "9f5b45a730b902ed8a0809c9542512188e8fcabf"
+SRCREV_machine ?= "c094363010bd4645e65cc8845dd23e513ac894d1"
+SRCREV_machine_qemuppc ?= "8e63a7522e4901c1312f7f53e490027070ffc057"
 SRCREV_meta ?= "486f7aec824b4127e91ef53228823e996b3696f0"
 
 PR = "${INC_PR}.0"
diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb b/meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb
index 322ee5c..9cc7e99 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb
@@ -8,8 +8,8 @@ LINUX_KERNEL_TYPE = "preempt-rt"
 
 KMETA = "meta"
 
-SRCREV_machine ?= "e8b22d297b61fb6f107f769042d47235c571da74"
-SRCREV_machine_qemuppc ?= "9cdefb26d9a263430f98d642aff6551ae925fce8"
+SRCREV_machine ?= "eb9c0669c66041eeae72b853011ec31ad81cc35d"
+SRCREV_machine_qemuppc ?= "76add8441a2b6ed26bcc9268819782b2eec99001"
 SRCREV_meta ?= "463299bc2e533e1bd38b0053ae7b210980f269c3"
 
 PR = "${INC_PR}.0"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_3.2.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_3.2.bb
index 38a4e6c..2bd7eee 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_3.2.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_3.2.bb
@@ -12,7 +12,7 @@ LINUX_VERSION ?= "3.2.18"
 
 KMETA = "meta"
 
-SRCREV_machine ?= "2f986ab91c08c16f8d201518b11be0e367eb0e14"
+SRCREV_machine ?= "da6291c46f37e2fb799d964c807d8d57ea89c375"
 SRCREV_meta ?= "486f7aec824b4127e91ef53228823e996b3696f0"
 
 PR = "${INC_PR}.0"
diff --git a/meta/recipes-kernel/linux/linux-yocto_3.2.bb b/meta/recipes-kernel/linux/linux-yocto_3.2.bb
index b17e479..ba4b536 100644
--- a/meta/recipes-kernel/linux/linux-yocto_3.2.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_3.2.bb
@@ -9,12 +9,12 @@ KBRANCH_qemuarm  = "standard/default/arm-versatile-926ejs"
 
 LINUX_VERSION ?= "3.2.18"
 
-SRCREV_machine_qemuarm ?= "2ea2477e2965569517671ec03fa9496214e8bff1"
-SRCREV_machine_qemumips  ?= "17eb00dec08ef91acfb6d7adca81cb6e344b6c68"
-SRCREV_machine_qemuppc ?= "14be92545abd339033570620e84ec2ae6780be29"
-SRCREV_machine_qemux86 ?= "34e76349ed6cb7cadbbf94a5b34712d139703c8a"
-SRCREV_machine_qemux86-64 ?= "f3625121d459b8e38f7528c2f5d2feb6078d0de9"
-SRCREV_machine ?= "7cc31a952f78b8f8e8469eed93c23e9675a8eeb5"
+SRCREV_machine_qemuarm ?= "c721e94f7cd1b1ae7da5edc52076c771b2e9d134"
+SRCREV_machine_qemumips  ?= "2172812072c372cc704dac5e1654da81d6eabad3"
+SRCREV_machine_qemuppc ?= "800615ccdce45f6900b841954fa2f47987bb2a95"
+SRCREV_machine_qemux86 ?= "9e23973679d82a54dda697f539243fdea612e878"
+SRCREV_machine_qemux86-64 ?= "d7823aebcf7f724f50e30f245e5e71b3b4db1a0b"
+SRCREV_machine ?= "06882fc16a4e965872e7faacb91da1497efd9ac3"
 SRCREV_meta ?= "486f7aec824b4127e91ef53228823e996b3696f0"
 
 PR = "${INC_PR}.1"
diff --git a/meta/recipes-kernel/linux/linux-yocto_3.4.bb b/meta/recipes-kernel/linux/linux-yocto_3.4.bb
index edb87da..06bcb9a 100644
--- a/meta/recipes-kernel/linux/linux-yocto_3.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_3.4.bb
@@ -3,12 +3,12 @@ require recipes-kernel/linux/linux-yocto.inc
 KBRANCH_DEFAULT = "standard/base"
 KBRANCH = "${KBRANCH_DEFAULT}"
 
-SRCREV_machine_qemuarm ?= "67376c621baf82ce51657246896647ababf5aa7c"
-SRCREV_machine_qemumips  ?= "7a8c1836ce33d49ff68e549e9415538a7419e3dc"
-SRCREV_machine_qemuppc ?= "5a3c4cf87fd94add818880a158e8e5a9e07303c9"
-SRCREV_machine_qemux86 ?= "a4c7a048fe3407e8eea0020db4a9c41d3feb8247"
-SRCREV_machine_qemux86-64 ?= "a4c7a048fe3407e8eea0020db4a9c41d3feb8247"
-SRCREV_machine ?= "a4c7a048fe3407e8eea0020db4a9c41d3feb8247"
+SRCREV_machine_qemuarm ?= "84d8ee32265eea5d60f57a2f70bd3b9a0fb9213d"
+SRCREV_machine_qemumips  ?= "ba0e336d4527080233c3c410989d4f351529ee4e"
+SRCREV_machine_qemuppc ?= "e82b8a111430e3820b11f507863c4b8e8734ed8e"
+SRCREV_machine_qemux86 ?= "0985844fa6235422c67ef269952fa4e765f252f9"
+SRCREV_machine_qemux86-64 ?= "0985844fa6235422c67ef269952fa4e765f252f9"
+SRCREV_machine ?= "0985844fa6235422c67ef269952fa4e765f252f9"
 SRCREV_meta ?= "463299bc2e533e1bd38b0053ae7b210980f269c3"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.4.git;protocol=git;nocheckout=1;branch=${KBRANCH},meta;name=machine,meta"
-- 
1.7.5.4



