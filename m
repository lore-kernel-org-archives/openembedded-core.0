Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 05A6D788EE
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Mar 2018 15:10:31 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w2EFAV0F019967
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 14 Mar 2018 08:10:31 -0700 (PDT)
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.361.1; Wed, 14 Mar 2018 08:09:50 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Wed, 14 Mar 2018 11:10:27 -0400
Message-ID: <f092dbf7c8d8fd0faa89ce61f73e3c57a039afec.1521040068.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1521040068.git.bruce.ashfield@windriver.com>
References: <cover.1521040068.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/3] linux-yocto/4.14/4.15: revert "features/systemtap/systemtap.cfg: enable CONFIG_KERNEL_DEBUG"
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
X-List-Received-Date: Wed, 14 Mar 2018 15:10:32 -0000
Content-Type: text/plain

The following commit:

   Author: California Sullivan <california.l.sullivan@intel.com>
   Date:   Wed Feb 17 16:47:10 2016 -0800

       ktypes: add developer ktype

       The developer ktype enables EMBEDDED, EXPERT, and DEBUG_KERNEL,
       opening up more kernel options and setting some defaults.

      Signed-off-by: California Sullivan <california.l.sullivan@intel.com>
      Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>

Was created to address the kernel footprint related issues that are related
to many of the kernel debug options.

When this commit was merged, it re-enabled CONFIG_DEBUG_KERNEL for the
standard kernel, since it includes the systemtap fragment. The correct thing
to do is to move systemtap properly into the developer kernel type.

For now, you can build the developer kernel type, or add the developer kernel
configuration fragment via a bbappend, and you'll have a functional systemtap.

[YOCTO #12603]

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_4.14.bb   | 2 +-
 meta/recipes-kernel/linux/linux-yocto-rt_4.15.bb   | 2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_4.14.bb | 2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_4.15.bb | 2 +-
 meta/recipes-kernel/linux/linux-yocto_4.14.bb      | 2 +-
 meta/recipes-kernel/linux/linux-yocto_4.15.bb      | 2 +-
 6 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.14.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.14.bb
index fd003e4d2bec..8a6371625ee0 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.14.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.14.bb
@@ -12,7 +12,7 @@ python () {
 }
 
 SRCREV_machine ?= "4832801a14130645d2251a368cba79d937a775ab"
-SRCREV_meta ?= "54b3e9b768651ca15bf65ae1c72dfe6d957285f0"
+SRCREV_meta ?= "5f6c3e32365bffb1993c0c62abf2c5bb8916a57f"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.14;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.15.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.15.bb
index 38589927037d..9f03c98cffad 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.15.bb
@@ -12,7 +12,7 @@ python () {
 }
 
 SRCREV_machine ?= "3247d5a26cab529bd4acc137c119bcdf71c3d5ae"
-SRCREV_meta ?= "40cef533a17de9d7a1de9b6e3578ac9125486a4a"
+SRCREV_meta ?= "65e0a9654f69241d0e6b18162289dabec877039e"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.15;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.14.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.14.bb
index 1ccbf6283e43..494d80aa4886 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.14.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.14.bb
@@ -10,7 +10,7 @@ KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
 SRCREV_machine ?= "09828ddd8d8c91b2d68afdcd8eb99a48e0253582"
-SRCREV_meta ?= "54b3e9b768651ca15bf65ae1c72dfe6d957285f0"
+SRCREV_meta ?= "5f6c3e32365bffb1993c0c62abf2c5bb8916a57f"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.15.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.15.bb
index 0c0abf38f286..6ec6371b7420 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.15.bb
@@ -19,7 +19,7 @@ SRCREV_machine_qemux86 ?= "9c2e6c0fc71526c45fc7ddf3ec91e2e2f27e3da0"
 SRCREV_machine_qemux86-64 ?= "9c2e6c0fc71526c45fc7ddf3ec91e2e2f27e3da0"
 SRCREV_machine_qemumips64 ?= "f9a3a72209bde080e4ecb4fbe7a0f99954643131"
 SRCREV_machine ?= "3247d5a26cab529bd4acc137c119bcdf71c3d5ae"
-SRCREV_meta ?= "40cef533a17de9d7a1de9b6e3578ac9125486a4a"
+SRCREV_meta ?= "65e0a9654f69241d0e6b18162289dabec877039e"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.15;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.14.bb b/meta/recipes-kernel/linux/linux-yocto_4.14.bb
index a714e39751ae..ba5e35625eba 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.14.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.14.bb
@@ -19,7 +19,7 @@ SRCREV_machine_qemux86 ?= "edc90f45a716ffe8e16cebaaf3b5db070af0280a"
 SRCREV_machine_qemux86-64 ?= "edc90f45a716ffe8e16cebaaf3b5db070af0280a"
 SRCREV_machine_qemumips64 ?= "6d7fbdbb7e466be645c34eed7bb2b532a9431a85"
 SRCREV_machine ?= "edc90f45a716ffe8e16cebaaf3b5db070af0280a"
-SRCREV_meta ?= "54b3e9b768651ca15bf65ae1c72dfe6d957285f0"
+SRCREV_meta ?= "5f6c3e32365bffb1993c0c62abf2c5bb8916a57f"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.14;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.15.bb b/meta/recipes-kernel/linux/linux-yocto_4.15.bb
index 50be40d9e928..6bd578b931b2 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.15.bb
@@ -19,7 +19,7 @@ SRCREV_machine_qemux86 ?= "3247d5a26cab529bd4acc137c119bcdf71c3d5ae"
 SRCREV_machine_qemux86-64 ?= "3247d5a26cab529bd4acc137c119bcdf71c3d5ae"
 SRCREV_machine_qemumips64 ?= "38face5dfd94733484822f392f9469fed18cca7e"
 SRCREV_machine ?= "3247d5a26cab529bd4acc137c119bcdf71c3d5ae"
-SRCREV_meta ?= "40cef533a17de9d7a1de9b6e3578ac9125486a4a"
+SRCREV_meta ?= "65e0a9654f69241d0e6b18162289dabec877039e"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.15;destsuffix=${KMETA}"
-- 
2.5.0


