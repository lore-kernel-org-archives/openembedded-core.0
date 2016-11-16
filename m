Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id A425971A08
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Nov 2016 14:24:37 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id uAGEObS2031747
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Wed, 16 Nov 2016 06:24:38 -0800
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.294.0; Wed, 16 Nov 2016 06:24:37 -0800
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Wed, 16 Nov 2016 09:24:31 -0500
Message-ID: <9bcb015e814a89ba0299df2791e6644d97423233.1479306112.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1479306112.git.bruce.ashfield@windriver.com>
References: <cover.1479306112.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/5] linux-yocto/4.8: fix cryptodev compilation error
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
X-List-Received-Date: Wed, 16 Nov 2016 14:24:39 -0000
Content-Type: text/plain

It was reported that compilation was broken for the in tree variant of
cryptodev. This commit integrates two patches that fix the issue:

  efbdfa1ed95f cryptodev: stomp dynamic version numbering for in tree builds
  32f54070205f cryptodev: fix compile error when enable CONFIG_CRYPTODEV

Signed-off-by: Liwei Song <liwei.song@windriver.com>
Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_4.8.bb   |  4 ++--
 meta/recipes-kernel/linux/linux-yocto-tiny_4.8.bb |  4 ++--
 meta/recipes-kernel/linux/linux-yocto_4.8.bb      | 18 +++++++++---------
 3 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.8.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.8.bb
index 26b309d8b8f4..e70523a30784 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.8.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.8.bb
@@ -11,8 +11,8 @@ python () {
         raise bb.parse.SkipPackage("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "b99b6fac437104e206d30540a5cb12103049af1e"
-SRCREV_meta ?= "87e5fc8b7cb387f197cdd098cdde4e96e9e8ed0d"
+SRCREV_machine ?= "ab1036645c083ebb30fee3eab591b0c3b5040ebb"
+SRCREV_meta ?= "d7a58814eee97e7bf410e418ad087a1f7bb05ab9"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.8.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.8;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.8.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.8.bb
index 63dd11baa19e..ab7a47ef7f63 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.8.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.8.bb
@@ -9,8 +9,8 @@ LINUX_VERSION ?= "4.8.6"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "9d5f74f941c3ca234f58ff8e539f5ca64458c0a7"
-SRCREV_meta ?= "87e5fc8b7cb387f197cdd098cdde4e96e9e8ed0d"
+SRCREV_machine ?= "efbdfa1ed95f7f0b4243351ffdb2d30e58308aeb"
+SRCREV_meta ?= "d7a58814eee97e7bf410e418ad087a1f7bb05ab9"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.8.bb b/meta/recipes-kernel/linux/linux-yocto_4.8.bb
index 03691982b1f0..a92e9cff87e8 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.8.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.8.bb
@@ -11,15 +11,15 @@ KBRANCH_qemux86  ?= "standard/base"
 KBRANCH_qemux86-64 ?= "standard/base"
 KBRANCH_qemumips64 ?= "standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "94d3e8675e2fcb09f29814a33ccf79df06149104"
-SRCREV_machine_qemuarm64 ?= "9d5f74f941c3ca234f58ff8e539f5ca64458c0a7"
-SRCREV_machine_qemumips ?= "046ff6344eee25dcc0eea1214e0ad8771ddfabfb"
-SRCREV_machine_qemuppc ?= "9d5f74f941c3ca234f58ff8e539f5ca64458c0a7"
-SRCREV_machine_qemux86 ?= "9d5f74f941c3ca234f58ff8e539f5ca64458c0a7"
-SRCREV_machine_qemux86-64 ?= "9d5f74f941c3ca234f58ff8e539f5ca64458c0a7"
-SRCREV_machine_qemumips64 ?= "edcb167f91abc071cc98cbd762418ff7ab9d839b"
-SRCREV_machine ?= "9d5f74f941c3ca234f58ff8e539f5ca64458c0a7"
-SRCREV_meta ?= "87e5fc8b7cb387f197cdd098cdde4e96e9e8ed0d"
+SRCREV_machine_qemuarm ?= "ae6282e4c25529f2649f8fa31d45c1b5bf5daf42"
+SRCREV_machine_qemuarm64 ?= "efbdfa1ed95f7f0b4243351ffdb2d30e58308aeb"
+SRCREV_machine_qemumips ?= "87fd523e80256e404710624b5c45d76da369f9b5"
+SRCREV_machine_qemuppc ?= "efbdfa1ed95f7f0b4243351ffdb2d30e58308aeb"
+SRCREV_machine_qemux86 ?= "efbdfa1ed95f7f0b4243351ffdb2d30e58308aeb"
+SRCREV_machine_qemux86-64 ?= "efbdfa1ed95f7f0b4243351ffdb2d30e58308aeb"
+SRCREV_machine_qemumips64 ?= "13669dd21e6c8e0cfccc1c6ccc3f83e272f0f6d1"
+SRCREV_machine ?= "efbdfa1ed95f7f0b4243351ffdb2d30e58308aeb"
+SRCREV_meta ?= "d7a58814eee97e7bf410e418ad087a1f7bb05ab9"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.8.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.8;destsuffix=${KMETA}"
-- 
2.5.0


