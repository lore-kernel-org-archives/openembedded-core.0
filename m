Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id BFA5B7002B
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Mar 2016 16:48:27 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u2GGmQgC027740
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 16 Mar 2016 09:48:27 -0700 (PDT)
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.248.2; Wed, 16 Mar 2016 09:48:25 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Wed, 16 Mar 2016 12:48:19 -0400
Message-ID: <50cbd5e9ce7602a919c6228906cfe654ed3186c1.1458146315.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1458146315.git.bruce.ashfield@windriver.com>
References: <cover.1458146315.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/5] linux-yocto/4.1: powercap/RAPL: Backport powercap/RAPL
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
X-List-Received-Date: Wed, 16 Mar 2016 16:48:28 -0000
Content-Type: text/plain

backporting the following powercap commits:

  24e2e14aa446 powercap / RAPL: Enable Broxton RAPL support
  6be05b47d625 powercap / RAPL: Add support for Skylake H/S
  879e8d02e07d powercap / RAPL: Support Knights Landing
  ec583656ad93 powercap / RAPL: Floor frequency setting in Atom SoC

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb   |  2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb |  2 +-
 meta/recipes-kernel/linux/linux-yocto_4.1.bb      | 16 ++++++++--------
 3 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb
index 025aff1a1eb9..7a24b98151a3 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb
@@ -2,7 +2,7 @@ KBRANCH ?= "standard/preempt-rt/base"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-SRCREV_machine ?= "da361d8a72a039a08e497b095a91905ccc8ae1d2"
+SRCREV_machine ?= "3216ec88ce3221d8f4744c84b6314458163493d9"
 SRCREV_meta ?= "b9023d4c8fbbb854c26f158a079a5f54dd61964d"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.1.git;branch=${KBRANCH};name=machine \
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb
index e7facd253831..76fdf0dae4e0 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb
@@ -9,7 +9,7 @@ LINUX_VERSION ?= "4.1.18"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "00c73599b59d497539f10d6a61a419abb4183f2e"
+SRCREV_machine ?= "24e2e14aa446f6e4e127f2a0a004a72c430f337e"
 SRCREV_meta ?= "b9023d4c8fbbb854c26f158a079a5f54dd61964d"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.1.bb b/meta/recipes-kernel/linux/linux-yocto_4.1.bb
index 0eecf99933fb..4c16873a27a5 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.1.bb
@@ -11,14 +11,14 @@ KBRANCH_qemux86  ?= "standard/base"
 KBRANCH_qemux86-64 ?= "standard/base"
 KBRANCH_qemumips64 ?= "standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "c20a22ffa386e548069809884d9f0a20f9499469"
-SRCREV_machine_qemuarm64 ?= "00c73599b59d497539f10d6a61a419abb4183f2e"
-SRCREV_machine_qemumips ?= "b6e13683017f0e9b53df799e13bce196fdbbe665"
-SRCREV_machine_qemuppc ?= "00c73599b59d497539f10d6a61a419abb4183f2e"
-SRCREV_machine_qemux86 ?= "00c73599b59d497539f10d6a61a419abb4183f2e"
-SRCREV_machine_qemux86-64 ?= "00c73599b59d497539f10d6a61a419abb4183f2e"
-SRCREV_machine_qemumips64 ?= "ccfd34d494cbccfce581972fa348077d9257070d"
-SRCREV_machine ?= "00c73599b59d497539f10d6a61a419abb4183f2e"
+SRCREV_machine_qemuarm ?= "6b5ee65b1f353c9b6a61402bfa6919f8f7a1969b"
+SRCREV_machine_qemuarm64 ?= "24e2e14aa446f6e4e127f2a0a004a72c430f337e"
+SRCREV_machine_qemumips ?= "fb0ec85bc42dc0893440e825cbdb709c15bc1704"
+SRCREV_machine_qemuppc ?= "24e2e14aa446f6e4e127f2a0a004a72c430f337e"
+SRCREV_machine_qemux86 ?= "24e2e14aa446f6e4e127f2a0a004a72c430f337e"
+SRCREV_machine_qemux86-64 ?= "24e2e14aa446f6e4e127f2a0a004a72c430f337e"
+SRCREV_machine_qemumips64 ?= "b9ee3a1ff68fbb978864203735b4d0e200ee50f4"
+SRCREV_machine ?= "24e2e14aa446f6e4e127f2a0a004a72c430f337e"
 SRCREV_meta ?= "b9023d4c8fbbb854c26f158a079a5f54dd61964d"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.1.git;name=machine;branch=${KBRANCH}; \
-- 
2.5.0


