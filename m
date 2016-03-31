Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 59AAE6FEE0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Mar 2016 08:47:55 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga102.fm.intel.com with ESMTP; 31 Mar 2016 01:47:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,421,1455004800"; d="scan'208";a="922433255"
Received: from unknown (HELO peggleto-mobl.ger.corp.intel.com)
	([10.255.133.74])
	by orsmga001.jf.intel.com with ESMTP; 31 Mar 2016 01:47:53 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 31 Mar 2016 21:47:02 +1300
Message-Id: <e821fe90eb5b650d5e43b3465ce4eaffee766a5d.1459413941.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <cover.1459413941.git.paul.eggleton@linux.intel.com>
References: <cover.1459413941.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1459413941.git.paul.eggleton@linux.intel.com>
References: <cover.1459413941.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 1/1] linux-yocto: add patch in existing SRC_URI value rather than using _append
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
X-List-Received-Date: Thu, 31 Mar 2016 08:47:55 -0000

Of course SRC_URI_append works just fine for building here, but it does
introduce two problems:

1) It's not really very tidy and you could look at the SRC_URI value and
   miss the fact that there's a patch appended at the end.
2) devtool update-recipe will end up duplicating the appended item
   (covered under [YOCTO #9360]).

Given the above it seems reasonable to squash the appended value into
the main SRC_URI value.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/recipes-kernel/linux/linux-yocto_4.4.bb | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto_4.4.bb b/meta/recipes-kernel/linux/linux-yocto_4.4.bb
index 3d6991e..2832876 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.4.bb
@@ -22,7 +22,9 @@ SRCREV_machine ?= "c43425f73287757a166d74464fddf1f5389c9f59"
 SRCREV_meta ?= "770996a263e22562c81f48fde0f0dc647156abce"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.4.git;name=machine;branch=${KBRANCH}; \
-           git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.4;destsuffix=${KMETA}"
+           git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.4;destsuffix=${KMETA} \
+           file://0001-Fix-qemux86-pat-issue.patch \
+           "
 
 LINUX_VERSION ?= "4.4.3"
 
@@ -41,4 +43,3 @@ KERNEL_FEATURES_append_qemux86=" cfg/sound.scc cfg/paravirt_kvm.scc"
 KERNEL_FEATURES_append_qemux86-64=" cfg/sound.scc cfg/paravirt_kvm.scc"
 KERNEL_FEATURES_append = " ${@bb.utils.contains("TUNE_FEATURES", "mx32", " cfg/x32.scc", "" ,d)}"
 
-SRC_URI_append = " file://0001-Fix-qemux86-pat-issue.patch"
-- 
2.5.5


