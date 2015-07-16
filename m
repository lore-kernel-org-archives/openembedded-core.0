Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 94EB175F18
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Jul 2015 05:03:10 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.1/8.15.1) with ESMTPS id t6G5380V005014
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 15 Jul 2015 22:03:08 -0700 (PDT)
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.235.1; Wed, 15 Jul 2015 22:03:08 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Thu, 16 Jul 2015 01:03:05 -0400
Message-ID: <9919265d4332429119131217ffc71cac070156a3.1437022827.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <cover.1437022827.git.bruce.ashfield@windriver.com>
References: <cover.1437022827.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] linux-yocto/3.14: fix gcc 4.9.4/5.1 build issues, yaffs2 memory leak
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
X-List-Received-Date: Thu, 16 Jul 2015 05:03:12 -0000
Content-Type: text/plain

Updating the 3.14 SRCREVs for the following commits:

  7534aeb01883 yaffs2: fix memory leak in mount/umount
  4287412436cb MIPS: Fix build with binutils 2.24.51+

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_3.14.bb   |  6 +++---
 meta/recipes-kernel/linux/linux-yocto-tiny_3.14.bb |  4 ++--
 meta/recipes-kernel/linux/linux-yocto_3.14.bb      | 18 +++++++++---------
 3 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_3.14.bb b/meta/recipes-kernel/linux/linux-yocto-rt_3.14.bb
index 7da7f83b3ad0..9bdbc49ffeb2 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_3.14.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_3.14.bb
@@ -3,9 +3,9 @@ KBRANCH_qemuppc ?= "standard/preempt-rt/qemuppc"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-SRCREV_machine ?= "3428de71031ede23682dd0842b9cfc23ae465f39"
-SRCREV_machine_qemuppc ?= "32c44a56a8218c3349f50d8151a10252d5e85dd1"
-SRCREV_meta ?= "a996d95104b72c422a56e7d9bc8615ec4219ac74"
+SRCREV_machine ?= "863ba0912f559ba9d64ab94bf04f0226fdf0cb49"
+SRCREV_machine_qemuppc ?= "9d464d6696a0fc755c65a2cf75ad7a4656ac6e1e"
+SRCREV_meta ?= "94fa1d7e980c97fcd59b37daedcd863bd6daaee4"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.14.git;bareclone=1;branch=${KBRANCH},meta;name=machine,meta"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_3.14.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_3.14.bb
index 000f288fb3e1..bd7b6da28c2c 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_3.14.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_3.14.bb
@@ -9,8 +9,8 @@ LINUX_VERSION ?= "3.14.36"
 KMETA = "meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "bda175966009d5a94103559e6e6ae51279952f39"
-SRCREV_meta ?= "a996d95104b72c422a56e7d9bc8615ec4219ac74"
+SRCREV_machine ?= "7534aeb01883b48cc42eb4900d0a8c64e8160e14"
+SRCREV_meta ?= "94fa1d7e980c97fcd59b37daedcd863bd6daaee4"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_3.14.bb b/meta/recipes-kernel/linux/linux-yocto_3.14.bb
index c809d2e29f60..7f32c7a1b52c 100644
--- a/meta/recipes-kernel/linux/linux-yocto_3.14.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_3.14.bb
@@ -11,15 +11,15 @@ KBRANCH_qemux86  ?= "standard/common-pc/base"
 KBRANCH_qemux86-64 ?= "standard/common-pc-64/base"
 KBRANCH_qemumips64 ?= "standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "dbd8e70653ffb6b63a1b8b7134813d3a93975ff5"
-SRCREV_machine_qemuarm64 ?= "bda175966009d5a94103559e6e6ae51279952f39"
-SRCREV_machine_qemumips ?= "b985d5039e5b14f5acac135a84f2d6541b531552"
-SRCREV_machine_qemuppc ?= "dbbdaf47fae37664ea30181b18a436b3d5401293"
-SRCREV_machine_qemux86 ?= "d3943ebf24457188669472c85d82ab32e2f95f6b"
-SRCREV_machine_qemux86-64 ?= "bda175966009d5a94103559e6e6ae51279952f39"
-SRCREV_machine_qemumips64 ?= "a594ff1fef248d72bf4ef929fa4497cf54a04500"
-SRCREV_machine ?= "bda175966009d5a94103559e6e6ae51279952f39"
-SRCREV_meta ?= "a996d95104b72c422a56e7d9bc8615ec4219ac74"
+SRCREV_machine_qemuarm ?= "bc2e4081f235174c696cc4b30dbea51555a1c3d6"
+SRCREV_machine_qemuarm64 ?= "7534aeb01883b48cc42eb4900d0a8c64e8160e14"
+SRCREV_machine_qemumips ?= "cbbe5f1b5477507aa668b4117a8dedcb407a0571"
+SRCREV_machine_qemuppc ?= "038bbef0f64321a0f9d77e9b07dff3ae1e51b51a"
+SRCREV_machine_qemux86 ?= "48833301518748d82cbc2412fea3617eeee6d01b"
+SRCREV_machine_qemux86-64 ?= "7534aeb01883b48cc42eb4900d0a8c64e8160e14"
+SRCREV_machine_qemumips64 ?= "c910c6d8338ab7291f066edc06de83de5b645d8f"
+SRCREV_machine ?= "7534aeb01883b48cc42eb4900d0a8c64e8160e14"
+SRCREV_meta ?= "94fa1d7e980c97fcd59b37daedcd863bd6daaee4"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.14.git;bareclone=1;branch=${KBRANCH},${KMETA};name=machine,meta"
 
-- 
2.1.0


