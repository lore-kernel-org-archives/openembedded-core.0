Received: from mga02.intel.com (mga02.intel.com [])
 by mx.groups.io with SMTP id smtpd.web08.4062.1623383461856029952
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Jun 2021 20:51:05 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: /9cYmHuYM6BFvNvReFdxFgemwqVCWZHCQvADBYRyv17K0kerMQVzTw5JhA8KApkP6OTFrV6uhQ
 c0/5EXmdbEiQ==
X-IronPort-AV: E=McAfee;i="6200,9189,10011"; a="192566030"
X-IronPort-AV: E=Sophos;i="5.83,265,1616482800"; 
   d="scan'208";a="192566030"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2021 20:51:05 -0700
IronPort-SDR: IXEPiRPOqxSRS147IUqq1e0sbHBATGIfgo9tIMZsfDM3/7kvZtiB1q0TOlHUO2efW7j9PMuOKH
 4etsWEmdMX3g==
X-IronPort-AV: E=Sophos;i="5.83,265,1616482800"; 
   d="scan'208";a="403091614"
Received: from dlau-mobl.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.215.151.154])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2021 20:51:04 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 07/17] linux-yocto/5.10: ktypes/standard: disable obsolete crypto options by default
Date: Fri, 11 Jun 2021 11:50:40 +0800
Message-Id: <f506cef3b671a659c9cee30b41591116552f74da.1623383318.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1623383318.git.anuj.mittal@intel.com>
References: <cover.1623383318.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Integrating the following commit(s) to linux-yocto/5.10.:

    ktypes/standard: disable obsolete crypto options by default

    CONFIG_CRYPTO_USER_API_ENABLE_OBSOLETE is on by default, but really
    shouldn't be on in our kernels for a safe set of baseline options.

    This is almost never used, so we disable it by default. If something
    needs it, they can turn it on in a board specific config.

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit f29be437290a960decdc2d8be8e505e8179c2f58)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../linux/linux-yocto-rt_5.10.bb              |  4 ++--
 .../linux/linux-yocto-tiny_5.10.bb            |  6 ++---
 meta/recipes-kernel/linux/linux-yocto_5.10.bb | 22 +++++++++----------
 3 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
index 69571df047..424dc83e15 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
@@ -11,8 +11,8 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "eb1ac5022eed244fb3943b3e48b48bc863aaf5a3"
-SRCREV_meta ?= "50c2d69f24f02336c9c6d65c3201d1d6dd105f52"
+SRCREV_machine ?= "fd84ed4cd5f8671db5ff31c00712c607c379a924"
+SRCREV_meta ?= "6dbd5491f4b9592d6332fd8e1bcf29ab01901274"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.10;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
index 2e0d1b20d4..ea41d74add 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
@@ -15,9 +15,9 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine_qemuarm ?= "5bd2421ef6048de205cd3a86c6f14b6296dc79d9"
-SRCREV_machine ?= "24719054cf85a9c66df020b10b6d2b7c6926a4e6"
-SRCREV_meta ?= "50c2d69f24f02336c9c6d65c3201d1d6dd105f52"
+SRCREV_machine_qemuarm ?= "9d4af32a2486acf5feb473b0d5656155cf80f115"
+SRCREV_machine ?= "ddac76981cb3a53de4f2feb2746661a02a6763bd"
+SRCREV_meta ?= "6dbd5491f4b9592d6332fd8e1bcf29ab01901274"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.10.bb b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
index cf6d19010a..1200cba942 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
@@ -13,17 +13,17 @@ KBRANCH_qemux86  ?= "v5.10/standard/base"
 KBRANCH_qemux86-64 ?= "v5.10/standard/base"
 KBRANCH_qemumips64 ?= "v5.10/standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "71d9798b63a9d5a62708f746bb0a53583a8dfb5d"
-SRCREV_machine_qemuarm64 ?= "24719054cf85a9c66df020b10b6d2b7c6926a4e6"
-SRCREV_machine_qemumips ?= "4bad40a510831446b777042df43e349989ecbef7"
-SRCREV_machine_qemuppc ?= "24719054cf85a9c66df020b10b6d2b7c6926a4e6"
-SRCREV_machine_qemuriscv64 ?= "24719054cf85a9c66df020b10b6d2b7c6926a4e6"
-SRCREV_machine_qemuriscv32 ?= "24719054cf85a9c66df020b10b6d2b7c6926a4e6"
-SRCREV_machine_qemux86 ?= "24719054cf85a9c66df020b10b6d2b7c6926a4e6"
-SRCREV_machine_qemux86-64 ?= "24719054cf85a9c66df020b10b6d2b7c6926a4e6"
-SRCREV_machine_qemumips64 ?= "554408244bec4f2121f4ec63b170ca38430b8f9b"
-SRCREV_machine ?= "24719054cf85a9c66df020b10b6d2b7c6926a4e6"
-SRCREV_meta ?= "50c2d69f24f02336c9c6d65c3201d1d6dd105f52"
+SRCREV_machine_qemuarm ?= "f3a20db821a8802c1b3e71c0cccded36d89671b5"
+SRCREV_machine_qemuarm64 ?= "ddac76981cb3a53de4f2feb2746661a02a6763bd"
+SRCREV_machine_qemumips ?= "c64120ac8b71098f6356a992f7e302caa75d4bae"
+SRCREV_machine_qemuppc ?= "ddac76981cb3a53de4f2feb2746661a02a6763bd"
+SRCREV_machine_qemuriscv64 ?= "ddac76981cb3a53de4f2feb2746661a02a6763bd"
+SRCREV_machine_qemuriscv32 ?= "ddac76981cb3a53de4f2feb2746661a02a6763bd"
+SRCREV_machine_qemux86 ?= "ddac76981cb3a53de4f2feb2746661a02a6763bd"
+SRCREV_machine_qemux86-64 ?= "ddac76981cb3a53de4f2feb2746661a02a6763bd"
+SRCREV_machine_qemumips64 ?= "b9a0cc14b51ac1bc5f2bcdcc0f53f6913e877e20"
+SRCREV_machine ?= "ddac76981cb3a53de4f2feb2746661a02a6763bd"
+SRCREV_meta ?= "6dbd5491f4b9592d6332fd8e1bcf29ab01901274"
 
 # remap qemuarm to qemuarma15 for the 5.8 kernel
 # KMACHINE_qemuarm ?= "qemuarma15"
-- 
2.31.1

