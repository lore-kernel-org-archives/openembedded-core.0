Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id D123A609B2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 May 2015 19:09:00 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.9) with ESMTP id t4LJ8xxW025022
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 21 May 2015 12:09:00 -0700 (PDT)
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.224.2; Thu, 21 May 2015 12:08:59 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Thu, 21 May 2015 15:08:52 -0400
Message-ID: <76d44860133ce89845e08b173af4907968403114.1432235097.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <cover.1432235097.git.bruce.ashfield@windriver.com>
References: <cover.1432235097.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/7] linux-yocto/3.19: braswell DRM/i915 Graphics fixes
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
X-List-Received-Date: Thu, 21 May 2015 19:09:02 -0000
Content-Type: text/plain

Updating the SRCREVs to integrate the following fixes:

   0befa35f4099 drm/i915/chv: Remove DPIO force latency causing interpair skew issue
   184e0374e4eb drm/i915: Fix chv cdclk support
   e2a99b9cd086 drm/i915: Increase the range of sideband address.
   9d5d55ede53b drm/i915: Disable DDR DVFS on CHV
   96cce945ac97 drm/i915: Enable the maxfifo PM5 mode when appropriate on CHV
   b5005319da56 drm/i915: Program PFI credits for VLV
   c7aa33eb3697 drm/i915: Rewrite VLV/CHV watermark code
   a421d8bcaa6d drm/i915: Make sure PND deadline mode is enabled on VLV/CHV
   631afc98c4b5 drm/i915: Read out display FIFO size on VLV/CHV
   e0dcdc019b8a drm/i915: Pass plane to vlv_compute_drain_latency()
   a6a5562b7754 drm/i915: Reorganize VLV DDL setup
   bb662a47ec0c drm/i915: Hide VLV DDL precision handling
   3d2d93239cd7 drm/i915: Simplify VLV drain latency computation
   f68614743b92 drm/i915: Kill DRAIN_LATENCY_PRECISION_* defines
   86c658c06ede drm/i915: Reduce CHV DDL multiplier to 16/8
   8c4cdd96a3f2 drm/i915: Allow pixel clock up to 95% of cdclk on CHV
   d9d4fb889c2a drm/i915: Reduce CHV DPLL min vco frequency to 4.8 GHz

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-tiny_3.19.bb |  2 +-
 meta/recipes-kernel/linux/linux-yocto_3.19.bb      | 16 ++++++++--------
 2 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_3.19.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_3.19.bb
index 50a426d665bf..d8f8d498ad27 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_3.19.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_3.19.bb
@@ -9,7 +9,7 @@ LINUX_VERSION ?= "3.19.5"
 KMETA = "meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "0a0d499541e2bb13ecc1001d0947bed6106c26a6"
+SRCREV_machine ?= "0befa35f40997c90936047e57fbbdd7edbf7e525"
 SRCREV_meta ?= "7215fe431391a322c7e39f410e7b8f2a2b507892"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
diff --git a/meta/recipes-kernel/linux/linux-yocto_3.19.bb b/meta/recipes-kernel/linux/linux-yocto_3.19.bb
index 429c019ece79..b6ec61a43b98 100644
--- a/meta/recipes-kernel/linux/linux-yocto_3.19.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_3.19.bb
@@ -11,14 +11,14 @@ KBRANCH_qemux86  ?= "standard/common-pc"
 KBRANCH_qemux86-64 ?= "standard/common-pc-64/base"
 KBRANCH_qemumips64 ?= "standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "060c6306d0be2726638ab18bd68977de4c7a38e5"
-SRCREV_machine_qemuarm64 ?= "0a0d499541e2bb13ecc1001d0947bed6106c26a6"
-SRCREV_machine_qemumips ?= "4b206f611f6d4c35a27a44e24ba0cedfc71301ec"
-SRCREV_machine_qemuppc ?= "18e00694ed76d18bf020e3288a6fdce63412887d"
-SRCREV_machine_qemux86 ?= "0a0d499541e2bb13ecc1001d0947bed6106c26a6"
-SRCREV_machine_qemux86-64 ?= "0a0d499541e2bb13ecc1001d0947bed6106c26a6"
-SRCREV_machine_qemumips64 ?= "0e31a9b3e54a2c87645f34bcbbe704ac62c04602"
-SRCREV_machine ?= "0a0d499541e2bb13ecc1001d0947bed6106c26a6"
+SRCREV_machine_qemuarm ?= "123f12cf162082802442d70701d83749376c45df"
+SRCREV_machine_qemuarm64 ?= "0befa35f40997c90936047e57fbbdd7edbf7e525"
+SRCREV_machine_qemumips ?= "c6bc6e6a10b188f96b9761411421be78ee67aa75"
+SRCREV_machine_qemuppc ?= "b79584c854f875890d708d7fb3cda85430a9d3ec"
+SRCREV_machine_qemux86 ?= "0befa35f40997c90936047e57fbbdd7edbf7e525"
+SRCREV_machine_qemux86-64 ?= "0befa35f40997c90936047e57fbbdd7edbf7e525"
+SRCREV_machine_qemumips64 ?= "b25c62fa52d51dac118b0eed20b8d5971434fa80"
+SRCREV_machine ?= "0befa35f40997c90936047e57fbbdd7edbf7e525"
 SRCREV_meta ?= "7215fe431391a322c7e39f410e7b8f2a2b507892"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.19.git;bareclone=1;branch=${KBRANCH},${KMETA};name=machine,meta"
-- 
2.1.0


