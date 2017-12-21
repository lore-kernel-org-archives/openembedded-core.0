Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id D02AC78865
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Dec 2017 15:49:29 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id vBLFnUkY007294
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Thu, 21 Dec 2017 07:49:30 -0800
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.361.1; Thu, 21 Dec 2017 07:49:30 -0800
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Thu, 21 Dec 2017 10:49:19 -0500
Message-ID: <462b692379f6c0ef9a1d2ff7a0821e4c1707c5c8.1513871125.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1513871125.git.bruce.ashfield@windriver.com>
References: <cover.1513871125.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 8/9] linux-yocto/4.12: common-pc*: enable X2APIC by default
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
X-List-Received-Date: Thu, 21 Dec 2017 15:49:30 -0000
Content-Type: text/plain

Enabling CONFIG_X86_X2APIC=y by default for common-pc* (and hence
qemux86*) to work around interrupt delivery issues when running on some
host kernels.

There's little overhead with this, and no impact to non x2apic
platforms, so we enable it for all builds.

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_4.12.bb   | 2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_4.12.bb | 2 +-
 meta/recipes-kernel/linux/linux-yocto_4.12.bb      | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.12.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.12.bb
index 267f730c60e2..7fe078b17a40 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.12.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.12.bb
@@ -12,7 +12,7 @@ python () {
 }
 
 SRCREV_machine ?= "8f6a2f93758166ef40e56f907a067801fee88d75"
-SRCREV_meta ?= "0eb9d6eb80a2bc3c42a351b747c319ef40df08db"
+SRCREV_meta ?= "b66a4f9730339b3c0c4af1db03dd26da71e419d5"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.12.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.12;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.12.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.12.bb
index 79fa38ba49a6..784efc07f42f 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.12.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.12.bb
@@ -10,7 +10,7 @@ KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
 SRCREV_machine ?= "79394be8305b3c3ba2d6711ae48e08bf015fbae9"
-SRCREV_meta ?= "0eb9d6eb80a2bc3c42a351b747c319ef40df08db"
+SRCREV_meta ?= "b66a4f9730339b3c0c4af1db03dd26da71e419d5"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.12.bb b/meta/recipes-kernel/linux/linux-yocto_4.12.bb
index 42672b78d3af..771c8b262c16 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.12.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.12.bb
@@ -19,7 +19,7 @@ SRCREV_machine_qemux86 ?= "79394be8305b3c3ba2d6711ae48e08bf015fbae9"
 SRCREV_machine_qemux86-64 ?= "79394be8305b3c3ba2d6711ae48e08bf015fbae9"
 SRCREV_machine_qemumips64 ?= "8c0a56e5a553ac3a985949ae8d0fc35d54779756"
 SRCREV_machine ?= "79394be8305b3c3ba2d6711ae48e08bf015fbae9"
-SRCREV_meta ?= "0eb9d6eb80a2bc3c42a351b747c319ef40df08db"
+SRCREV_meta ?= "b66a4f9730339b3c0c4af1db03dd26da71e419d5"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.12.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.12;destsuffix=${KMETA}"
-- 
2.5.0


