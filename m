Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 9C66878825
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Jan 2018 13:59:30 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w0QDxVLP011519
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Fri, 26 Jan 2018 05:59:31 -0800
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.361.1; Fri, 26 Jan 2018 05:59:31 -0800
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Fri, 26 Jan 2018 08:59:17 -0500
Message-ID: <485ef3e2a427bdbbbc5e23672fa7e15141557395.1516973739.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1516973739.git.bruce.ashfield@windriver.com>
References: <cover.1516973739.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 06/12] linux-yocto/4.12: drm & mips fixes
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
X-List-Received-Date: Fri, 26 Jan 2018 13:59:30 -0000
Content-Type: text/plain

Integrating the following bug fixes (mainline backports):

  d572780c455f Mips kernel warining:resolve some warning when compiling arch/mips/math-emu/cp1emu.c
  f79ac7203257 drm/tilcdc: Precalculate total frametime in tilcdc_crtc_set_mode()

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_4.12.bb   |  2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_4.12.bb |  2 +-
 meta/recipes-kernel/linux/linux-yocto_4.12.bb      | 16 ++++++++--------
 3 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.12.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.12.bb
index d20e6c614b64..1907db3e5ae8 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.12.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.12.bb
@@ -11,7 +11,7 @@ python () {
         raise bb.parse.SkipPackage("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "1b4229c4ef99843401ec2f522b63c9a64ed219a4"
+SRCREV_machine ?= "6cfdf8e22b784e169254ee6e306ea08bcac5be2b"
 SRCREV_meta ?= "358b2bb4d2bc8e790f69ea1778d7d16184b1ae34"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.12.git;branch=${KBRANCH};name=machine \
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.12.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.12.bb
index 97b90daa1d54..30b4fd134c3b 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.12.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.12.bb
@@ -9,7 +9,7 @@ LINUX_VERSION ?= "4.12.18"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "e0256c639caf7fb1b977cf34c5e15c86dd643c85"
+SRCREV_machine ?= "d572780c455fcd055baf1e6ff6fd4ea2dece9df2"
 SRCREV_meta ?= "358b2bb4d2bc8e790f69ea1778d7d16184b1ae34"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.12.bb b/meta/recipes-kernel/linux/linux-yocto_4.12.bb
index c27801a080e0..f60e4845585f 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.12.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.12.bb
@@ -11,14 +11,14 @@ KBRANCH_qemux86  ?= "standard/base"
 KBRANCH_qemux86-64 ?= "standard/base"
 KBRANCH_qemumips64 ?= "standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "e984c8a333b87570a3d28384f0473884134e9535"
-SRCREV_machine_qemuarm64 ?= "e0256c639caf7fb1b977cf34c5e15c86dd643c85"
-SRCREV_machine_qemumips ?= "a81c25e8409d8a1dfdb353a03553a57c25e50755"
-SRCREV_machine_qemuppc ?= "e0256c639caf7fb1b977cf34c5e15c86dd643c85"
-SRCREV_machine_qemux86 ?= "e0256c639caf7fb1b977cf34c5e15c86dd643c85"
-SRCREV_machine_qemux86-64 ?= "e0256c639caf7fb1b977cf34c5e15c86dd643c85"
-SRCREV_machine_qemumips64 ?= "a39650a75fbd15424c51963d893e7806d9fdbe8b"
-SRCREV_machine ?= "e0256c639caf7fb1b977cf34c5e15c86dd643c85"
+SRCREV_machine_qemuarm ?= "8dff23316c2c8a291541c94f615205a0e6cc547c"
+SRCREV_machine_qemuarm64 ?= "d572780c455fcd055baf1e6ff6fd4ea2dece9df2"
+SRCREV_machine_qemumips ?= "fbe79a19f0f14e46a8ac62de9ebb5691a5084e00"
+SRCREV_machine_qemuppc ?= "d572780c455fcd055baf1e6ff6fd4ea2dece9df2"
+SRCREV_machine_qemux86 ?= "d572780c455fcd055baf1e6ff6fd4ea2dece9df2"
+SRCREV_machine_qemux86-64 ?= "d572780c455fcd055baf1e6ff6fd4ea2dece9df2"
+SRCREV_machine_qemumips64 ?= "e6d567b4c476ec7edfc6721e6912daa5fa672add"
+SRCREV_machine ?= "d572780c455fcd055baf1e6ff6fd4ea2dece9df2"
 SRCREV_meta ?= "358b2bb4d2bc8e790f69ea1778d7d16184b1ae34"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.12.git;name=machine;branch=${KBRANCH}; \
-- 
2.5.0


