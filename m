Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 590377887D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Dec 2017 15:49:25 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id vBLFnQ62012707
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 21 Dec 2017 07:49:26 -0800 (PST)
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.361.1; Thu, 21 Dec 2017 07:49:25 -0800
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Thu, 21 Dec 2017 10:49:14 -0500
Message-ID: <d369cb946dd23f9bb16c860c061b48a16bddaa35.1513871125.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1513871125.git.bruce.ashfield@windriver.com>
References: <cover.1513871125.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/9] linux-yocto/4.12: ipv4 stable backport and config changes
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
X-List-Received-Date: Thu, 21 Dec 2017 15:49:25 -0000
Content-Type: text/plain

Integrating the following ipv4 backport:

    ipv4: net namespace does not inherit network configurations

    patch from https://lkml.org/lkml/2014/7/29/119

    Ipv4 net namespace requires a similar logic change as commit a79ca223e029
    [ipv6: fix bad free of addrconf_init_net] introduces for newer kernels.

    Since a net namespace is independent to another. That is, there
    is no any relationship between the net namespaces. So a new net
    namespace should not inherit network configurations from another
    net namespace including the host.

    CC: Hong Zhiguo <honkiko@gmail.com>
    CC: David S. Miller <davem@davemloft.net>
    Signed-off-by: Zhu Yanjun <zyjzyj2000@gmail.com>
    Signed-off-by: yzhu1 <yanjun.zhu@windriver.com>
    Signed-off-by: Liwei Song <liwei.song@windriver.com>
    Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>

And the following configuration changes:

  3574bb061c1b mti-malta32: enable CONFIG_HIGHMEM for qemumips to support up to 2GiB RAM
  f187df8fca31 features/i915/i915.cfg: compile i915 as a module
  332b38cb83a2 common-pc*.scc: Add igb to common-pc drivers

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_4.12.bb   |  4 ++--
 meta/recipes-kernel/linux/linux-yocto-tiny_4.12.bb |  4 ++--
 meta/recipes-kernel/linux/linux-yocto_4.12.bb      | 18 +++++++++---------
 3 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.12.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.12.bb
index adbb0ccbad5b..efa4f05bb0b6 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.12.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.12.bb
@@ -11,8 +11,8 @@ python () {
         raise bb.parse.SkipPackage("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "82dfc739621af193e6b5cb8f27f55c66db8e631b"
-SRCREV_meta ?= "e3c9041f48ae980cc4461f969d0e3ed9bb43be5b"
+SRCREV_machine ?= "51c45f6489df4cdbce78e9c90b8a26fa7e7c875c"
+SRCREV_meta ?= "3574bb061c1bfbdcf4df8308870c03f88ef0788f"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.12.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.12;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.12.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.12.bb
index 4e18d413ce5d..78056ee83183 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.12.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.12.bb
@@ -9,8 +9,8 @@ LINUX_VERSION ?= "4.12.16"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "1d685baca196583254d75f5cc7bc0ffedb8753ad"
-SRCREV_meta ?= "e3c9041f48ae980cc4461f969d0e3ed9bb43be5b"
+SRCREV_machine ?= "4226b065fca4f630901d99b99d18c395ae3866fb"
+SRCREV_meta ?= "3574bb061c1bfbdcf4df8308870c03f88ef0788f"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.12.bb b/meta/recipes-kernel/linux/linux-yocto_4.12.bb
index 0df702e4703f..90a00a513dd6 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.12.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.12.bb
@@ -11,15 +11,15 @@ KBRANCH_qemux86  ?= "standard/base"
 KBRANCH_qemux86-64 ?= "standard/base"
 KBRANCH_qemumips64 ?= "standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "9f857972035c7e3ae237d25a581eb695ffe78249"
-SRCREV_machine_qemuarm64 ?= "1d685baca196583254d75f5cc7bc0ffedb8753ad"
-SRCREV_machine_qemumips ?= "6527cf00278f043ba8f874ac7262261dd57e9a79"
-SRCREV_machine_qemuppc ?= "1d685baca196583254d75f5cc7bc0ffedb8753ad"
-SRCREV_machine_qemux86 ?= "1d685baca196583254d75f5cc7bc0ffedb8753ad"
-SRCREV_machine_qemux86-64 ?= "1d685baca196583254d75f5cc7bc0ffedb8753ad"
-SRCREV_machine_qemumips64 ?= "ad347d33914f66c4b2aa6fca0c9f0a92773885cc"
-SRCREV_machine ?= "1d685baca196583254d75f5cc7bc0ffedb8753ad"
-SRCREV_meta ?= "e3c9041f48ae980cc4461f969d0e3ed9bb43be5b"
+SRCREV_machine_qemuarm ?= "6227bf7bc958840e020930ac250634129919571b"
+SRCREV_machine_qemuarm64 ?= "4226b065fca4f630901d99b99d18c395ae3866fb"
+SRCREV_machine_qemumips ?= "16b69ee760d800e7f16a01476a24a87b66702dc6"
+SRCREV_machine_qemuppc ?= "4226b065fca4f630901d99b99d18c395ae3866fb"
+SRCREV_machine_qemux86 ?= "4226b065fca4f630901d99b99d18c395ae3866fb"
+SRCREV_machine_qemux86-64 ?= "4226b065fca4f630901d99b99d18c395ae3866fb"
+SRCREV_machine_qemumips64 ?= "4eb2f843b67a8e97619689991b566808212a3677"
+SRCREV_machine ?= "4226b065fca4f630901d99b99d18c395ae3866fb"
+SRCREV_meta ?= "3574bb061c1bfbdcf4df8308870c03f88ef0788f"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.12.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.12;destsuffix=${KMETA}"
-- 
2.5.0


