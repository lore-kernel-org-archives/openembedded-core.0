Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 002BD79603
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Aug 2018 15:00:06 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w7OF02qr012329
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 24 Aug 2018 08:00:02 -0700
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.399.0; Fri, 24 Aug 2018 08:00:01 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Fri, 24 Aug 2018 10:59:48 -0400
Message-ID: <d47d5ff09e4c6a778651686c2ed85abb768a906e.1535118570.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1535118570.git.bruce.ashfield@windriver.com>
References: <cover.1535118570.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 01/12] linux-yocto/4.14: rt: Revert mm/vmstat.c: fix vmstat_update() preemption BUG
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
X-List-Received-Date: Fri, 24 Aug 2018 15:00:07 -0000
Content-Type: text/plain

Reverting mm/vmstat.c: fix vmstat_update() preemption BUG, to fix
failures in the 4.14 -rt kernel.

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_4.14.bb   | 4 ++--
 meta/recipes-kernel/linux/linux-yocto-tiny_4.14.bb | 2 +-
 meta/recipes-kernel/linux/linux-yocto_4.14.bb      | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.14.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.14.bb
index c5cb7b419ac6..4963612aacc5 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.14.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.14.bb
@@ -11,8 +11,8 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "7e0d6d525a8deb7329c0d8f844880c5ec6c0b84a"
-SRCREV_meta ?= "d64aec9793d558ff49993ff6076be6d4daf101c2"
+SRCREV_machine ?= "0f7a6d5209e60e88f9bc39298229113e58db1b82"
+SRCREV_meta ?= "49e24e3e2cad518ae1fd7eff05f3228201b54a33"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.14;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.14.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.14.bb
index da1ba6193f6c..85f3ce1d99f3 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.14.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.14.bb
@@ -13,7 +13,7 @@ KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
 SRCREV_machine ?= "dd893e600276f4e05e416cf5be73a5fd5752e0cb"
-SRCREV_meta ?= "d64aec9793d558ff49993ff6076be6d4daf101c2"
+SRCREV_meta ?= "49e24e3e2cad518ae1fd7eff05f3228201b54a33"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.14.bb b/meta/recipes-kernel/linux/linux-yocto_4.14.bb
index 9ea313515171..1d038a91513b 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.14.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.14.bb
@@ -19,7 +19,7 @@ SRCREV_machine_qemux86 ?= "97c8063d2df381b828b37608f88efa9b4dd9e379"
 SRCREV_machine_qemux86-64 ?= "97c8063d2df381b828b37608f88efa9b4dd9e379"
 SRCREV_machine_qemumips64 ?= "346488cf46ac4045fe257eb63836eb93c7c09859"
 SRCREV_machine ?= "97c8063d2df381b828b37608f88efa9b4dd9e379"
-SRCREV_meta ?= "d64aec9793d558ff49993ff6076be6d4daf101c2"
+SRCREV_meta ?= "49e24e3e2cad518ae1fd7eff05f3228201b54a33"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.14;destsuffix=${KMETA}"
-- 
2.5.0


