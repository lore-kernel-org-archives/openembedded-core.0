Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail5.wrs.com (unknown [64.129.254.146])
	by mail.openembedded.org (Postfix) with ESMTP id DA11C7680C
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Oct 2015 21:19:44 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id t9NKIaRn008854
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Fri, 23 Oct 2015 13:18:36 -0700
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.248.2; Fri, 23 Oct 2015 13:18:36 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Fri, 23 Oct 2015 16:18:29 -0400
Message-ID: <cccedafdc0245df4e0dd6f39b64510653a0f5cf6.1445631234.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <cover.1445631234.git.bruce.ashfield@windriver.com>
References: <cover.1445631234.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: saul.wold@intel.com, openembedded-core@lists.openembedded.org
Subject: [PATCH 2/6] linux-yocto/4.1: drm/i915: Fix the VBT child device parsing for BSW
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
X-List-Received-Date: Fri, 23 Oct 2015 21:19:46 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Updating the 4.1 SRCREVs to integrate the following fix:

[
    drm/i915: Fix the VBT child device parsing for BSW

    Recent BSW VBT has a VBT child device size 37 bytes instead of the 33
    bytes our code assumes. This means we fail to parse the VBT and thus
    fail to detect eDP ports properly and just register them as DP ports
    instead.

    Fix it up by using the reported child device size from the VBT instead
    of assuming it matches out struct defintions.

    The latest spec I have shows that the child device size should be 36
    bytes for rev >= 195, however on my BSW the size is actually 37 bytes.
    And our current struct definition is 33 bytes.

    Feels like the entire VBT parses would need to be rewritten to handle
    changes in the layout better, but for now I've decided to do just the
    bare minimum to get my eDP port back.

    Cc: Vijay Purushothaman <vijay.a.purushothaman@linux.intel.com>
    Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
    Reviewed-by: Damien Lespiau <damien.lespiau@intel.com>
    Signed-off-by: Daniel Vetter <daniel.vetter@ffwll.ch>
    (cherry picked from commit 90e4f1592bb6e82f6690f0e05a8aadcf04d7bce7)
    Signed-off-by: abdul arif abdul muttalib
    <abdul.arif.b.abdul.muttalib@intel.com>
    Signed-off-by: Tan Jui Nee <jui.nee.tan@intel.com>
    Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
]

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb   |  2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb |  2 +-
 meta/recipes-kernel/linux/linux-yocto_4.1.bb      | 16 ++++++++--------
 3 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb
index fe3eab5a555a..ce20eb2e46b5 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb
@@ -2,7 +2,7 @@ KBRANCH ?= "standard/preempt-rt/base"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-SRCREV_machine ?= "8acaa791408f146069473a96e3d98bed8be86244"
+SRCREV_machine ?= "f7e4bbfef684e29b1257eaf2d7f534b38e2e1b1e"
 SRCREV_meta ?= "d8bbf59771fb915fa71debc8591bf6c69d8fa49c"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.1.git;branch=${KBRANCH};name=machine \
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb
index da12edb106df..13a940db37bd 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb
@@ -9,7 +9,7 @@ LINUX_VERSION ?= "4.1.8"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "52a4a9f4a2b408ef3a0745372e44cc362832d86d"
+SRCREV_machine ?= "dbe692d91c8e55d1430f2c45fd578c8e4e71e482"
 SRCREV_meta ?= "d8bbf59771fb915fa71debc8591bf6c69d8fa49c"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.1.bb b/meta/recipes-kernel/linux/linux-yocto_4.1.bb
index 44c34ece8309..84352d95ccaa 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.1.bb
@@ -11,14 +11,14 @@ KBRANCH_qemux86  ?= "standard/base"
 KBRANCH_qemux86-64 ?= "standard/base"
 KBRANCH_qemumips64 ?= "standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "187e28708b478b5d01a7df9e6410a340347e4819"
-SRCREV_machine_qemuarm64 ?= "52a4a9f4a2b408ef3a0745372e44cc362832d86d"
-SRCREV_machine_qemumips ?= "dd6b1f0940dbffd5e0feef2beecbc89a25da8e8f"
-SRCREV_machine_qemuppc ?= "52a4a9f4a2b408ef3a0745372e44cc362832d86d"
-SRCREV_machine_qemux86 ?= "52a4a9f4a2b408ef3a0745372e44cc362832d86d"
-SRCREV_machine_qemux86-64 ?= "52a4a9f4a2b408ef3a0745372e44cc362832d86d"
-SRCREV_machine_qemumips64 ?= "8458e792e2c595f48bc5b2924e20e844f2a96522"
-SRCREV_machine ?= "52a4a9f4a2b408ef3a0745372e44cc362832d86d"
+SRCREV_machine_qemuarm ?= "bc11ecf659e30c8687604e086450ae1ff90c0169"
+SRCREV_machine_qemuarm64 ?= "dbe692d91c8e55d1430f2c45fd578c8e4e71e482"
+SRCREV_machine_qemumips ?= "181e2c553ffaae19d08a6730e98d288c7e337d39"
+SRCREV_machine_qemuppc ?= "dbe692d91c8e55d1430f2c45fd578c8e4e71e482"
+SRCREV_machine_qemux86 ?= "dbe692d91c8e55d1430f2c45fd578c8e4e71e482"
+SRCREV_machine_qemux86-64 ?= "dbe692d91c8e55d1430f2c45fd578c8e4e71e482"
+SRCREV_machine_qemumips64 ?= "2684711a16ed21f114d834742f860cee532f7438"
+SRCREV_machine ?= "dbe692d91c8e55d1430f2c45fd578c8e4e71e482"
 SRCREV_meta ?= "d8bbf59771fb915fa71debc8591bf6c69d8fa49c"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.1.git;name=machine;branch=${KBRANCH}; \
-- 
2.1.0


