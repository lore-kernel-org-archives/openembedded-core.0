Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 687B876086
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Jun 2018 02:08:55 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w5728Fgq011962
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 6 Jun 2018 19:08:30 -0700
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.399.0; Wed, 6 Jun 2018 19:08:05 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Wed, 6 Jun 2018 22:07:25 -0400
Message-ID: <12e847b13c9ab811a4910f1807c186f285556d07.1528336755.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1528336755.git.bruce.ashfield@windriver.com>
References: <cover.1528336755.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 4/9] linux-yocto/4.12: fix ppc cryptodev build
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
X-List-Received-Date: Thu, 07 Jun 2018 02:08:55 -0000
Content-Type: text/plain

commit 6e36719fbe9 [crypto: aes-generic - fix aes-generic regression on
powerpc] addresses a build regression by 4.14-stable. So we cherry pick
it onto our branches while it works through the -stable process.

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_4.14.bb   |  4 ++--
 meta/recipes-kernel/linux/linux-yocto-tiny_4.14.bb |  4 ++--
 meta/recipes-kernel/linux/linux-yocto_4.14.bb      | 18 +++++++++---------
 3 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.14.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.14.bb
index db7941abd178..39236d90d98a 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.14.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.14.bb
@@ -11,8 +11,8 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "5518de2bf72df8f5274f7fd6a909db8bb09e9216"
-SRCREV_meta ?= "d1e170692e978b08f4736375cafccd58e331feb1"
+SRCREV_machine ?= "cc0ac94a962306ff5867e1d3c2988d2004f50c8c"
+SRCREV_meta ?= "b577f9a0bd658b9468080514f68b18fe37daff9c"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.14;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.14.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.14.bb
index ae459761f9cc..3171bb9d78a3 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.14.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.14.bb
@@ -12,8 +12,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "ebe519f7ad579fedcdff91c2e32c4eef976299a6"
-SRCREV_meta ?= "d1e170692e978b08f4736375cafccd58e331feb1"
+SRCREV_machine ?= "f0905017bae82f733812b3e1a31abbf6d51f67c7"
+SRCREV_meta ?= "b577f9a0bd658b9468080514f68b18fe37daff9c"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.14.bb b/meta/recipes-kernel/linux/linux-yocto_4.14.bb
index c8f31a6ebcd3..1993ac788ac8 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.14.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.14.bb
@@ -11,15 +11,15 @@ KBRANCH_qemux86  ?= "v4.14/standard/base"
 KBRANCH_qemux86-64 ?= "v4.14/standard/base"
 KBRANCH_qemumips64 ?= "v4.14/standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "493254190708d94e0bd22f6eb6e6c17cbdbf9764"
-SRCREV_machine_qemuarm64 ?= "eeba95930402de2c0290b423c69e86b84955bf09"
-SRCREV_machine_qemumips ?= "42b5e2db78595024d2fddfcadc8cd8af1266b52b"
-SRCREV_machine_qemuppc ?= "b87ce52358105e318fbdb7087185de9622b420b3"
-SRCREV_machine_qemux86 ?= "0e21580445573276ec320da0c36d56f8921f682b"
-SRCREV_machine_qemux86-64 ?= "0e21580445573276ec320da0c36d56f8921f682b"
-SRCREV_machine_qemumips64 ?= "c8885bcf579812bd6cfbb58b96d5d3423ccc45fc"
-SRCREV_machine ?= "0e21580445573276ec320da0c36d56f8921f682b"
-SRCREV_meta ?= "d1e170692e978b08f4736375cafccd58e331feb1"
+SRCREV_machine_qemuarm ?= "8b98d346387e7d12941a2c0450c3c5ebc653da66"
+SRCREV_machine_qemuarm64 ?= "5eceba0e988844c64cc1d0b2a7b428b9765da9b0"
+SRCREV_machine_qemumips ?= "e596816df1c06fb68f751736bb2e9216f93e4a5d"
+SRCREV_machine_qemuppc ?= "34cc4f2e3b441f52455832580c79b886ad47c71b"
+SRCREV_machine_qemux86 ?= "ccd823982533ea9d36df09766f3a7d645b95ca7d"
+SRCREV_machine_qemux86-64 ?= "ccd823982533ea9d36df09766f3a7d645b95ca7d"
+SRCREV_machine_qemumips64 ?= "c50abb0247af8362692d6776139dfff03d754ff9"
+SRCREV_machine ?= "ccd823982533ea9d36df09766f3a7d645b95ca7d"
+SRCREV_meta ?= "b577f9a0bd658b9468080514f68b18fe37daff9c"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.14;destsuffix=${KMETA}"
-- 
2.5.0


