Received: from mga14.intel.com (mga14.intel.com [])
 by mx.groups.io with SMTP id smtpd.web12.909.1619398455294766979
 for <openembedded-core@lists.openembedded.org>;
 Sun, 25 Apr 2021 17:54:18 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: U2hKm9wLWy/HkP5RhhATTEnhcxWwzQTou9wGPy+XBz4pzTOcXGC2NJ9yScNER0liWOcUgysMwb
 PgmE2UL6Tg9g==
X-IronPort-AV: E=McAfee;i="6200,9189,9965"; a="195818087"
X-IronPort-AV: E=Sophos;i="5.82,251,1613462400"; 
   d="scan'208";a="195818087"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2021 17:54:18 -0700
IronPort-SDR: BgIaDqY/5GYGxUnp5/sCznufkzZl0y1TgF/MWceiusEW0S1A+5Qlpc/+crgXfMfpznlPhZF4oX
 FHVyWf6A5Fhg==
X-IronPort-AV: E=Sophos;i="5.82,251,1613462400"; 
   d="scan'208";a="454067306"
Received: from wsan-mobl1.ccr.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.213.45.138])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2021 17:54:17 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 17/64] linux-yocto/5.10: fix arm defconfig warnings
Date: Mon, 26 Apr 2021 08:52:48 +0800
Message-Id: <70515be581fef634a96a72a892dcff3ec4f890c0.1619397968.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1619397968.git.anuj.mittal@intel.com>
References: <cover.1619397968.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

A recent fix to the kern-tools promoted some previously unseen
issues to warnings. This commit fixes them by tagging some BT
options as non-hardware so they won't generate warnings if they
don't appear in the final .config. These are sub BT options and
shouldn't warn when/if their controlling option is disabled by
a fragment.

    40a967b115f base: exclude some BT options as non-hardware

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit fc7875ce3c68a253f8b8e5d8855c1814731b5a45)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb   |  2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb |  2 +-
 meta/recipes-kernel/linux/linux-yocto_5.10.bb      | 12 ++++++------
 3 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
index 20faff811a..dacff74bce 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
@@ -12,7 +12,7 @@ python () {
 }
 
 SRCREV_machine ?= "ac98a75ef2bc550f67454bd738ede581c8846ff3"
-SRCREV_meta ?= "b7125842b7ce188e7846a49fcb15a71c54806d6c"
+SRCREV_meta ?= "40a967b115fdbac34fc980d0e27ac2373a031189"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.10;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
index 54575a7917..21a2e89115 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
@@ -17,7 +17,7 @@ KCONF_BSP_AUDIT_LEVEL = "2"
 
 SRCREV_machine_qemuarm ?= "ee7efde0c94e8b2eba1a5a2709f2d21874ac7525"
 SRCREV_machine ?= "8465e471f5b4855d01012a18cd5fa516061c0358"
-SRCREV_meta ?= "b7125842b7ce188e7846a49fcb15a71c54806d6c"
+SRCREV_meta ?= "40a967b115fdbac34fc980d0e27ac2373a031189"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.10.bb b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
index e93e41c69b..e6859a2319 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
@@ -17,13 +17,13 @@ SRCREV_machine_qemuarm ?= "4f13e8499f2bfc9d95dcc70b981ea16351ff088b"
 SRCREV_machine_qemuarm64 ?= "8465e471f5b4855d01012a18cd5fa516061c0358"
 SRCREV_machine_qemumips ?= "64f8949180b1a6375abef20eebf735e853701c71"
 SRCREV_machine_qemuppc ?= "8465e471f5b4855d01012a18cd5fa516061c0358"
-SRCREV_machine_qemuriscv64 ?= "8465e471f5b4855d01012a18cd5fa516061c0358"
-SRCREV_machine_qemuriscv32 ?= "8465e471f5b4855d01012a18cd5fa516061c0358"
-SRCREV_machine_qemux86 ?= "8465e471f5b4855d01012a18cd5fa516061c0358"
-SRCREV_machine_qemux86-64 ?= "8465e471f5b4855d01012a18cd5fa516061c0358"
+SRCREV_machine_qemuriscv64 ?= "d6e20b2257ecfa6e796a45a4175863862a28fa11"
+SRCREV_machine_qemuriscv32 ?= "d6e20b2257ecfa6e796a45a4175863862a28fa11"
+SRCREV_machine_qemux86 ?= "d6e20b2257ecfa6e796a45a4175863862a28fa11"
+SRCREV_machine_qemux86-64 ?= "d6e20b2257ecfa6e796a45a4175863862a28fa11"
 SRCREV_machine_qemumips64 ?= "6bf49ed9b223173d918b7c0140b8d0561bc2674c"
-SRCREV_machine ?= "8465e471f5b4855d01012a18cd5fa516061c0358"
-SRCREV_meta ?= "b7125842b7ce188e7846a49fcb15a71c54806d6c"
+SRCREV_machine ?= "d6e20b2257ecfa6e796a45a4175863862a28fa11"
+SRCREV_meta ?= "40a967b115fdbac34fc980d0e27ac2373a031189"
 
 # remap qemuarm to qemuarma15 for the 5.8 kernel
 # KMACHINE_qemuarm ?= "qemuarma15"
-- 
2.30.2

