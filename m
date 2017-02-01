Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id E6A6F7732B
	for <openembedded-core@lists.openembedded.org>;
	Wed,  1 Feb 2017 15:30:42 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v11FUhbA000029
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 1 Feb 2017 07:30:43 -0800 (PST)
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.294.0; Wed, 1 Feb 2017 07:30:42 -0800
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Wed, 1 Feb 2017 10:30:31 -0500
Message-ID: <f0e569bd3fcf0a99db4b9065c72f12042a22c80d.1485962567.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1485962567.git.bruce.ashfield@windriver.com>
References: <cover.1485962567.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 05/10] ver_linux: Use /usr/bin/awk instead of /bin/awk
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
X-List-Received-Date: Wed, 01 Feb 2017 15:30:44 -0000
Content-Type: text/plain

To avoid kernel-devsrc failing with missing a dependency on "/bin/awk".
Due to the way this script is invoked, using #!/usr/bin/env can run into
issue when invoked.

Since most distros have awk in /usr/bin and not /bin, we change the
script while this is sorted out upstream.

Signed-off-by: Saul Wold <sgw@linux.intel.com>
Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_4.9.bb   |  4 ++--
 meta/recipes-kernel/linux/linux-yocto-tiny_4.9.bb |  4 ++--
 meta/recipes-kernel/linux/linux-yocto_4.9.bb      | 18 +++++++++---------
 3 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.9.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.9.bb
index a0adb3830c41..904a8465b32c 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.9.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.9.bb
@@ -11,8 +11,8 @@ python () {
         raise bb.parse.SkipPackage("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "628a985d1bb4d992b76c727afd373788bd496c90"
-SRCREV_meta ?= "39aa01a6d4332a8ef746a03246e56a41a69fae99"
+SRCREV_machine ?= "0898601446c6bde63cb97fb6236d114886ed5f2a"
+SRCREV_meta ?= "8c71361007816dcabe297f40cd5a38ed5d7d7599"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.9.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.9;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.9.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.9.bb
index 8d8c082612a5..c2931df20188 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.9.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.9.bb
@@ -9,8 +9,8 @@ LINUX_VERSION ?= "4.9.4"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "6fdf2bca12625c67b64f39e08b1b4ae7c610f8bd"
-SRCREV_meta ?= "39aa01a6d4332a8ef746a03246e56a41a69fae99"
+SRCREV_machine ?= "087b65ddac049813eef2513c4440cb1d02971357"
+SRCREV_meta ?= "8c71361007816dcabe297f40cd5a38ed5d7d7599"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.9.bb b/meta/recipes-kernel/linux/linux-yocto_4.9.bb
index 0ca3d2c8f77c..eb3f027e70e9 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.9.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.9.bb
@@ -11,15 +11,15 @@ KBRANCH_qemux86  ?= "standard/base"
 KBRANCH_qemux86-64 ?= "standard/base"
 KBRANCH_qemumips64 ?= "standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "9027d6fa2661251146c08851a13ca623bc2c1156"
-SRCREV_machine_qemuarm64 ?= "6fdf2bca12625c67b64f39e08b1b4ae7c610f8bd"
-SRCREV_machine_qemumips ?= "ce10acbd809335dd0c6f697770b3279ae168d145"
-SRCREV_machine_qemuppc ?= "6fdf2bca12625c67b64f39e08b1b4ae7c610f8bd"
-SRCREV_machine_qemux86 ?= "6fdf2bca12625c67b64f39e08b1b4ae7c610f8bd"
-SRCREV_machine_qemux86-64 ?= "6fdf2bca12625c67b64f39e08b1b4ae7c610f8bd"
-SRCREV_machine_qemumips64 ?= "303f51499cfe9f770c4a843a2042228897cea1b4"
-SRCREV_machine ?= "6fdf2bca12625c67b64f39e08b1b4ae7c610f8bd"
-SRCREV_meta ?= "39aa01a6d4332a8ef746a03246e56a41a69fae99"
+SRCREV_machine_qemuarm ?= "ebd7956fb8f43632fff9537579d2788532ec5dad"
+SRCREV_machine_qemuarm64 ?= "087b65ddac049813eef2513c4440cb1d02971357"
+SRCREV_machine_qemumips ?= "2e81d7a5cc2cbfae377f4d07d85c34800c04e3c2"
+SRCREV_machine_qemuppc ?= "087b65ddac049813eef2513c4440cb1d02971357"
+SRCREV_machine_qemux86 ?= "087b65ddac049813eef2513c4440cb1d02971357"
+SRCREV_machine_qemux86-64 ?= "087b65ddac049813eef2513c4440cb1d02971357"
+SRCREV_machine_qemumips64 ?= "af223adb1634de8cb279ff809c6d13266b87e5dc"
+SRCREV_machine ?= "087b65ddac049813eef2513c4440cb1d02971357"
+SRCREV_meta ?= "8c71361007816dcabe297f40cd5a38ed5d7d7599"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.9.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.9;destsuffix=${KMETA}"
-- 
2.5.0


