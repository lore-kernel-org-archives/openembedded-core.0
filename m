Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 3D70970100
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 May 2016 17:53:18 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u44HrIgE027110
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 4 May 2016 10:53:18 -0700 (PDT)
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.248.2; Wed, 4 May 2016 10:53:17 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Wed, 4 May 2016 13:53:05 -0400
Message-ID: <4ba20d3b5c3d70e9c3c5ef63675c806d26cbe189.1462383941.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1462383941.git.bruce.ashfield@windriver.com>
References: <cover.1462383941.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 02/11] linux-yocto/4.4: sched/cgroup: Fix/cleanup cgroup teardown/init
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
X-List-Received-Date: Wed, 04 May 2016 17:53:19 -0000
Content-Type: text/plain

backporting a mainline commit to address splats that have been
seen on the 4.4 kernel:

Signed-off-by: Mikko Ylinen <mikko.ylinen@intel.com>
Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb   |  2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb |  2 +-
 meta/recipes-kernel/linux/linux-yocto_4.4.bb      | 16 ++++++++--------
 3 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb
index c4da9588c8f5..cc94f230c3a7 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb
@@ -2,7 +2,7 @@ KBRANCH ?= "standard/preempt-rt"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-SRCREV_machine ?= "a7044110183dad1ac8467c572d6bcdc673c2a217"
+SRCREV_machine ?= "2c4d23062464d6decf8b43b27d011f7b124243c6"
 SRCREV_meta ?= "e1515ef98cec975df218363e28c2abe3a71c6a59"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.4.git;branch=${KBRANCH};name=machine \
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb
index 96ed8221d932..dd07c4b98a6a 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb
@@ -9,7 +9,7 @@ LINUX_VERSION ?= "4.4.3"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "5a562b765837414416d609058c4e8dd7a8072dab"
+SRCREV_machine ?= "7a073202d4d47b5ffecf1e8f57b036f83b1fe2e0"
 SRCREV_meta ?= "e1515ef98cec975df218363e28c2abe3a71c6a59"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.4.bb b/meta/recipes-kernel/linux/linux-yocto_4.4.bb
index 88c003acbf85..ed1d04edb7bb 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.4.bb
@@ -11,14 +11,14 @@ KBRANCH_qemux86  ?= "standard/base"
 KBRANCH_qemux86-64 ?= "standard/base"
 KBRANCH_qemumips64 ?= "standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "373384988d421dfc209175c1ffc691e12ec55e23"
-SRCREV_machine_qemuarm64 ?= "5a562b765837414416d609058c4e8dd7a8072dab"
-SRCREV_machine_qemumips ?= "87b2d0c1f001650016ec13290c3e2de7b34cf468"
-SRCREV_machine_qemuppc ?= "5a562b765837414416d609058c4e8dd7a8072dab"
-SRCREV_machine_qemux86 ?= "5a562b765837414416d609058c4e8dd7a8072dab"
-SRCREV_machine_qemux86-64 ?= "5a562b765837414416d609058c4e8dd7a8072dab"
-SRCREV_machine_qemumips64 ?= "ed3c898c537dee36adc713bd30ec3ef6035ed95a"
-SRCREV_machine ?= "5a562b765837414416d609058c4e8dd7a8072dab"
+SRCREV_machine_qemuarm ?= "8f6d6325fdb8c561804af8c13456e372d6bd3b5b"
+SRCREV_machine_qemuarm64 ?= "7a073202d4d47b5ffecf1e8f57b036f83b1fe2e0"
+SRCREV_machine_qemumips ?= "4bf7bd3c7df18f51bf422f625f1a6650bb456abd"
+SRCREV_machine_qemuppc ?= "7a073202d4d47b5ffecf1e8f57b036f83b1fe2e0"
+SRCREV_machine_qemux86 ?= "7a073202d4d47b5ffecf1e8f57b036f83b1fe2e0"
+SRCREV_machine_qemux86-64 ?= "7a073202d4d47b5ffecf1e8f57b036f83b1fe2e0"
+SRCREV_machine_qemumips64 ?= "91c6f056a0fd3bada9f67c0276107b37fd3f6846"
+SRCREV_machine ?= "7a073202d4d47b5ffecf1e8f57b036f83b1fe2e0"
 SRCREV_meta ?= "e1515ef98cec975df218363e28c2abe3a71c6a59"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.4.git;name=machine;branch=${KBRANCH}; \
-- 
2.5.0


