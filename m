Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 17F7978AB9
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Mar 2018 18:11:23 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w26IBOHI012916
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Tue, 6 Mar 2018 10:11:24 -0800
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.361.1; Tue, 6 Mar 2018 10:10:50 -0800
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Tue, 6 Mar 2018 13:11:13 -0500
Message-ID: <ea063bce924ee86da44ae4842733663d25bc9d6d.1520359364.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1520359364.git.bruce.ashfield@windriver.com>
References: <cover.1520359364.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 5/9] linux-yocto/4.12: fix aufs compile warning
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
X-List-Received-Date: Tue, 06 Mar 2018 18:11:24 -0000
Content-Type: text/plain

   From: "Kexin(Casey) Chen" <Casey.Chen@windriver.com>

   Forward port linux-yocto-4.8's patch to fix the build warning.

       http://git.yoctoproject.org/cgit/cgit.cgi/linux-yocto-4.8/commit/?h=standard/base&id=7e0dd2f2b0971f0e3191e1ddc088e09eb9855567

   fs/aufs/debug.h:95:19: warning: comparison of constant '0'
   with boolean expression is always false [-Wbool-compare]
      if (unlikely((e) < 0)) \
                    ^

   fs/aufs/vdir.c:852:2: note: in expansion of macro 'AuTraceErr'
      AuTraceErr(!valid);
      ^~~~~~~~~~

   In expansion of AuTraceErr(!valid), comparison of (!valid)
   and constant '0' always passes unlikely(x) false. function
   'static int seek_vdir(struct file *file, struct dir_context *ctx)'
   is to find whether there is a valid vd_deblk following ctx->pos.
   return 1 means valid, 0 for not. Change to AuTraceErr(valid - 1)
   makes more sense.

   Signed-off-by: Kexin(Casey) Chen <Casey.Chen@windriver.com>
   Signed-off-by: Dengke Du <dengke.du@windriver.com>

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_4.12.bb   |  4 ++--
 meta/recipes-kernel/linux/linux-yocto-tiny_4.12.bb |  4 ++--
 meta/recipes-kernel/linux/linux-yocto_4.12.bb      | 18 +++++++++---------
 3 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.12.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.12.bb
index a31c3559e9d9..722315e84372 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.12.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.12.bb
@@ -11,8 +11,8 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "ba4e0e2d358124def579da9ba5992f6dcb94eea8"
-SRCREV_meta ?= "19d815d5a34bfaad95d87cc097cef18b594daac8"
+SRCREV_machine ?= "7a02176b872012f95036453dfd2e12dc0c02a612"
+SRCREV_meta ?= "ca1bda8dfd3325db04dda19a531edeb66ac0d84b"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.12.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.12;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.12.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.12.bb
index 79bd962b943e..998c017515c0 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.12.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.12.bb
@@ -9,8 +9,8 @@ LINUX_VERSION ?= "4.12.20"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "22f73c1fe99198a7b37aa5c76978fe19d301fd88"
-SRCREV_meta ?= "19d815d5a34bfaad95d87cc097cef18b594daac8"
+SRCREV_machine ?= "392959d6dad698bfb62de561164c2d19e17841dd"
+SRCREV_meta ?= "ca1bda8dfd3325db04dda19a531edeb66ac0d84b"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.12.bb b/meta/recipes-kernel/linux/linux-yocto_4.12.bb
index 57ef700d05d6..ca664fec5de0 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.12.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.12.bb
@@ -11,15 +11,15 @@ KBRANCH_qemux86  ?= "standard/base"
 KBRANCH_qemux86-64 ?= "standard/base"
 KBRANCH_qemumips64 ?= "standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "7122a8d189df29393419b3352ea11482efaa417a"
-SRCREV_machine_qemuarm64 ?= "22f73c1fe99198a7b37aa5c76978fe19d301fd88"
-SRCREV_machine_qemumips ?= "1cff37b7a2bbee4bb99118e57d228ac301fb880b"
-SRCREV_machine_qemuppc ?= "22f73c1fe99198a7b37aa5c76978fe19d301fd88"
-SRCREV_machine_qemux86 ?= "22f73c1fe99198a7b37aa5c76978fe19d301fd88"
-SRCREV_machine_qemux86-64 ?= "22f73c1fe99198a7b37aa5c76978fe19d301fd88"
-SRCREV_machine_qemumips64 ?= "3879cb9ed592f8d5db6b35c51761818ad60494da"
-SRCREV_machine ?= "22f73c1fe99198a7b37aa5c76978fe19d301fd88"
-SRCREV_meta ?= "19d815d5a34bfaad95d87cc097cef18b594daac8"
+SRCREV_machine_qemuarm ?= "6155fbae7a6b42a7608b9f251fa46cef28c0fe67"
+SRCREV_machine_qemuarm64 ?= "392959d6dad698bfb62de561164c2d19e17841dd"
+SRCREV_machine_qemumips ?= "d46a4aebe29dcced0fea9718c249c536ab06977f"
+SRCREV_machine_qemuppc ?= "392959d6dad698bfb62de561164c2d19e17841dd"
+SRCREV_machine_qemux86 ?= "392959d6dad698bfb62de561164c2d19e17841dd"
+SRCREV_machine_qemux86-64 ?= "392959d6dad698bfb62de561164c2d19e17841dd"
+SRCREV_machine_qemumips64 ?= "10216660f9d902f76f36514ea4ef04530e87702d"
+SRCREV_machine ?= "392959d6dad698bfb62de561164c2d19e17841dd"
+SRCREV_meta ?= "ca1bda8dfd3325db04dda19a531edeb66ac0d84b"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.12.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.12;destsuffix=${KMETA}"
-- 
2.5.0


