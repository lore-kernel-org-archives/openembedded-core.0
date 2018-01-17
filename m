Return-Path: <maxin.john@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id BEF5378745
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Jan 2018 14:51:58 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	17 Jan 2018 06:52:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.46,372,1511856000"; d="scan'208";a="23103593"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga001.fm.intel.com with ESMTP; 17 Jan 2018 06:52:00 -0800
Received: from mbabyjoh-desk.fi.intel.com (mbabyjoh-desk.fi.intel.com
	[10.237.72.84])
	by linux.intel.com (Postfix) with ESMTP id 0617C580328
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Jan 2018 06:51:59 -0800 (PST)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 17 Jan 2018 16:53:30 +0200
Message-Id: <1516200810-25661-2-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
In-Reply-To: <1516200810-25661-1-git-send-email-maxin.john@intel.com>
References: <1516200810-25661-1-git-send-email-maxin.john@intel.com>
Subject: [PATCH 2/2] mesa: improve build reproducibility
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
X-List-Received-Date: Wed, 17 Jan 2018 14:51:58 -0000

Sort the output to ensure reproducibility.

Fixes [YOCTO #12479]

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 ...01-anv_icd.py-improve-reproducible-builds.patch | 27 ++++++++++++++++++++++
 meta/recipes-graphics/mesa/mesa_17.3.2.bb          |  1 +
 2 files changed, 28 insertions(+)
 create mode 100644 meta/recipes-graphics/mesa/files/0001-anv_icd.py-improve-reproducible-builds.patch

diff --git a/meta/recipes-graphics/mesa/files/0001-anv_icd.py-improve-reproducible-builds.patch b/meta/recipes-graphics/mesa/files/0001-anv_icd.py-improve-reproducible-builds.patch
new file mode 100644
index 0000000..da7a81f
--- /dev/null
+++ b/meta/recipes-graphics/mesa/files/0001-anv_icd.py-improve-reproducible-builds.patch
@@ -0,0 +1,27 @@
+From b474abdd91158a52821c34865277d7de38880529 Mon Sep 17 00:00:00 2001
+From: "Maxin B. John" <maxin.john@intel.com>
+Date: Wed, 17 Jan 2018 15:53:29 +0200
+Subject: [PATCH] anv_icd.py: improve reproducible builds
+
+Sort the output to ensure reproducibility
+
+Upstream-Status: Pending
+
+Signed-off-by: Maxin B. John <maxin.john@intel.com>
+---
+ src/intel/vulkan/anv_icd.py | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/intel/vulkan/anv_icd.py b/src/intel/vulkan/anv_icd.py
+index 4ed01fa..31bb068 100644
+--- a/src/intel/vulkan/anv_icd.py
++++ b/src/intel/vulkan/anv_icd.py
+@@ -44,4 +44,4 @@ if __name__ == '__main__':
+     }
+ 
+     with open(args.out, 'w') as f:
+-        json.dump(json_data, f, indent = 4)
++        json.dump(json_data, f, indent = 4, sort_keys=True)
+-- 
+2.4.0
+
diff --git a/meta/recipes-graphics/mesa/mesa_17.3.2.bb b/meta/recipes-graphics/mesa/mesa_17.3.2.bb
index 9e9b233..c2143ad 100644
--- a/meta/recipes-graphics/mesa/mesa_17.3.2.bb
+++ b/meta/recipes-graphics/mesa/mesa_17.3.2.bb
@@ -9,6 +9,7 @@ SRC_URI = "https://mesa.freedesktop.org/archive/mesa-${PV}.tar.xz \
            file://llvm-config-version.patch \
            file://0001-winsys-svga-drm-Include-sys-types.h.patch \
            file://0001-Makefile.vulkan.am-explictly-add-lib-expat-to-intel-.patch \
+           file://0001-anv_icd.py-improve-reproducible-builds.patch \
            "
 
 SRC_URI[md5sum] = "5c59b779925f504ffd0f13c7dcd29ac6"
-- 
2.4.0


