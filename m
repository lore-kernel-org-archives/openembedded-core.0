Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 8D0E9750F9
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Aug 2018 15:00:03 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w7OF046P008929
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 24 Aug 2018 08:00:04 -0700 (PDT)
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.399.0; Fri, 24 Aug 2018 08:00:03 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Fri, 24 Aug 2018 10:59:49 -0400
Message-ID: <0f3a29fa7c1f9ab1329041f60198a2a816741f23.1535118570.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1535118570.git.bruce.ashfield@windriver.com>
References: <cover.1535118570.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 02/12] linux-yocto/standard: enable bpf configs in standard kernel
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
X-List-Received-Date: Fri, 24 Aug 2018 15:00:03 -0000
Content-Type: text/plain

Enabling the bpf feature for the standard kernel configurations
by default. Systemd (and other) userspace applications are looking
for BPF more often, and we get warnings such as this:

  [   12.810554] systemd[1]: File
    /lib/systemd/system/systemd-journald.service:36 configures an IP
    firewall (IPAddressDeny=any), but the local system does not support
    BPF/cgroup based firewalling.

The configs don't add much overhead to the kernel, so we enable them
by default.

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_4.12.bb   | 2 +-
 meta/recipes-kernel/linux/linux-yocto-rt_4.15.bb   | 2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_4.12.bb | 2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_4.15.bb | 2 +-
 meta/recipes-kernel/linux/linux-yocto_4.12.bb      | 2 +-
 meta/recipes-kernel/linux/linux-yocto_4.15.bb      | 2 +-
 6 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.12.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.12.bb
index cf6a733ceb69..afd76c2272bc 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.12.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.12.bb
@@ -12,7 +12,7 @@ python () {
 }
 
 SRCREV_machine ?= "7ba09f891939cbf2c58801a7a4a740365896d6ba"
-SRCREV_meta ?= "367bd3633d5a661035f90f0b8daa38e97da1a587"
+SRCREV_meta ?= "99bef6252a7b9b5e38ea15112e9466ed6974a3fe"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.12.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.12;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.15.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.15.bb
index e2b45fa3e140..26d8382b38e0 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.15.bb
@@ -12,7 +12,7 @@ python () {
 }
 
 SRCREV_machine ?= "3373c0cf71f2812eeb9694839456df6f67fd32ac"
-SRCREV_meta ?= "d35642f0b65f7772a45e1457fd60de6d1bff8e58"
+SRCREV_meta ?= "3b43c318d9dca8858e0ec402db8a99ab2b79f16f"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.15;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.12.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.12.bb
index 9d5e1582b531..870e7662fb46 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.12.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.12.bb
@@ -10,7 +10,7 @@ KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
 SRCREV_machine ?= "bd8f931e213614bc5fdc6aeaa132d273caa002af"
-SRCREV_meta ?= "367bd3633d5a661035f90f0b8daa38e97da1a587"
+SRCREV_meta ?= "99bef6252a7b9b5e38ea15112e9466ed6974a3fe"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.15.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.15.bb
index 3738e623c74b..d3759b0582f0 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.15.bb
@@ -11,7 +11,7 @@ KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
 SRCREV_machine ?= "3373c0cf71f2812eeb9694839456df6f67fd32ac"
-SRCREV_meta ?= "d35642f0b65f7772a45e1457fd60de6d1bff8e58"
+SRCREV_meta ?= "3b43c318d9dca8858e0ec402db8a99ab2b79f16f"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.12.bb b/meta/recipes-kernel/linux/linux-yocto_4.12.bb
index ac98ca85fc3f..57f29949c743 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.12.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.12.bb
@@ -19,7 +19,7 @@ SRCREV_machine_qemux86 ?= "bd8f931e213614bc5fdc6aeaa132d273caa002af"
 SRCREV_machine_qemux86-64 ?= "bd8f931e213614bc5fdc6aeaa132d273caa002af"
 SRCREV_machine_qemumips64 ?= "38da8c72733da9619bbbddf14140204631faf488"
 SRCREV_machine ?= "bd8f931e213614bc5fdc6aeaa132d273caa002af"
-SRCREV_meta ?= "367bd3633d5a661035f90f0b8daa38e97da1a587"
+SRCREV_meta ?= "99bef6252a7b9b5e38ea15112e9466ed6974a3fe"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.12.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.12;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.15.bb b/meta/recipes-kernel/linux/linux-yocto_4.15.bb
index 84d46c418dd3..238d35a3c8f5 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.15.bb
@@ -19,7 +19,7 @@ SRCREV_machine_qemux86 ?= "3373c0cf71f2812eeb9694839456df6f67fd32ac"
 SRCREV_machine_qemux86-64 ?= "3373c0cf71f2812eeb9694839456df6f67fd32ac"
 SRCREV_machine_qemumips64 ?= "b98c113571c72a0d34832dd6fe5585529b32988b"
 SRCREV_machine ?= "3373c0cf71f2812eeb9694839456df6f67fd32ac"
-SRCREV_meta ?= "d35642f0b65f7772a45e1457fd60de6d1bff8e58"
+SRCREV_meta ?= "3b43c318d9dca8858e0ec402db8a99ab2b79f16f"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.15;destsuffix=${KMETA}"
-- 
2.5.0


