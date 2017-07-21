Return-Path: <brian.avery@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id B29587843E
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Jul 2017 19:36:45 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	21 Jul 2017 12:36:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.40,391,1496127600"; d="scan'208";a="1153972963"
Received: from bavery-ws-desk.jf.intel.com ([10.54.74.28])
	by orsmga001.jf.intel.com with ESMTP; 21 Jul 2017 12:36:26 -0700
From: brian avery <brian.avery@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 21 Jul 2017 12:39:53 -0700
Message-Id: <e40c61433b997ae031341cb88367f64beb403698.1500665624.git.brian.avery@intel.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1500665624.git.brian.avery@intel.com>
References: <cover.1500665624.git.brian.avery@intel.com>
Subject: [PATCH 2/2] poky: Remove machine specific kernel overrides
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
X-List-Received-Date: Fri, 21 Jul 2017 19:36:45 -0000

This patch removes the machine specific overrides in poky.conf for all
the qemu machines.  With this patch, if you set
PREFERRED_VERSION_linux-yocto="X%" then all the qemu machines as well as
the sample hardware boards will use that version. Without this patch,
the hardware boards would have used version X but the qemu machines
would have needed to have a PREFERRED_VERSION_linux-yocto_qemuarm="X%"
for qemuarm to use that version, for example.  If we need to force a
specific machine (hardware or qemu) to a particular default version we
should add it to the machine conf files for that machine, not in the
distro conf.

Signed-off-by: brian avery <brian.avery@intel.com>
---
 meta-poky/conf/distro/poky.conf | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/meta-poky/conf/distro/poky.conf b/meta-poky/conf/distro/poky.conf
index c907969..d15e50e 100644
--- a/meta-poky/conf/distro/poky.conf
+++ b/meta-poky/conf/distro/poky.conf
@@ -22,12 +22,6 @@ POKY_DEFAULT_EXTRA_RRECOMMENDS = "kernel-module-af-packet"
 DISTRO_FEATURES ?= "${DISTRO_FEATURES_DEFAULT} ${DISTRO_FEATURES_LIBC} ${POKY_DEFAULT_DISTRO_FEATURES}"
 
 PREFERRED_VERSION_linux-yocto ?= "4.10%"
-PREFERRED_VERSION_linux-yocto_qemux86 ?= "4.10%"
-PREFERRED_VERSION_linux-yocto_qemux86-64 ?= "4.10%"
-PREFERRED_VERSION_linux-yocto_qemuarm ?= "4.10%"
-PREFERRED_VERSION_linux-yocto_qemumips ?= "4.10%"
-PREFERRED_VERSION_linux-yocto_qemumips64 ?= "4.10%"
-PREFERRED_VERSION_linux-yocto_qemuppc ?= "4.10%"
 
 SDK_NAME = "${DISTRO}-${TCLIBC}-${SDK_ARCH}-${IMAGE_BASENAME}-${TUNE_PKGARCH}"
 SDKPATH = "/opt/${DISTRO}/${SDK_VERSION}"
@@ -84,9 +78,9 @@ SANITY_TESTED_DISTROS ?= " \
             opensuse-42.2 \n \
             "
 #
-# OELAYOUT_ABI allows us to notify users when the format of TMPDIR changes in 
+# OELAYOUT_ABI allows us to notify users when the format of TMPDIR changes in
 # an incompatible way. Such changes should usually be detailed in the commit
-# that breaks the format and have been previously discussed on the mailing list 
+# that breaks the format and have been previously discussed on the mailing list
 # with general agreement from the core team.
 #
 OELAYOUT_ABI = "12"
-- 
1.9.1


