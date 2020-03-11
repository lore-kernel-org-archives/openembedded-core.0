Return-Path: <ssajal@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 790F961134
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Mar 2020 14:58:38 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.2) with ESMTPS id 02BEwdhL024484
	(version=TLSv1 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Mar 2020 07:58:39 -0700 (PDT)
Received: from ala-lpggp3.wrs.com (147.11.105.124) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.487.0;
	Wed, 11 Mar 2020 07:58:39 -0700
Received: by ala-lpggp3.wrs.com (Postfix, from userid 20885)	id 53C399001C9;
	Wed, 11 Mar 2020 07:58:39 -0700 (PDT)
From: Sakib Sajal <sakib.sajal@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 11 Mar 2020 07:58:38 -0700
Message-ID: <20200311145838.129361-1-sakib.sajal@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Subject: [meta-oe][PATCH] openjpeg: Fix CVE-2020-6851
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
X-List-Received-Date: Wed, 11 Mar 2020 14:58:38 -0000
Content-Type: text/plain

From: Yue Tao <Yue.Tao@windriver.com>

Backport patch from upstream to fix heap-based buffer overflow

Signed-off-by: Yue Tao <Yue.Tao@windriver.com>
Signed-off-by: Sakib Sajal <Sakib.Sajal@windriver.com>
---
 .../openjpeg/openjpeg/CVE-2020-6851.patch     | 32 +++++++++++++++++++
 .../openjpeg/openjpeg_2.3.1.bb                |  1 +
 2 files changed, 33 insertions(+)
 create mode 100644 meta-oe/recipes-graphics/openjpeg/openjpeg/CVE-2020-6851.patch

diff --git a/meta-oe/recipes-graphics/openjpeg/openjpeg/CVE-2020-6851.patch b/meta-oe/recipes-graphics/openjpeg/openjpeg/CVE-2020-6851.patch
new file mode 100644
index 000000000..9f2fc901f
--- /dev/null
+++ b/meta-oe/recipes-graphics/openjpeg/openjpeg/CVE-2020-6851.patch
@@ -0,0 +1,32 @@
+From 024b8407392cb0b82b04b58ed256094ed5799e04 Mon Sep 17 00:00:00 2001
+From: Even Rouault <even.rouault@spatialys.com>
+Date: Sat, 11 Jan 2020 01:51:19 +0100
+Subject: [PATCH] opj_j2k_update_image_dimensions(): reject images whose
+ coordinates are beyond INT_MAX (fixes #1228)
+
+---
+ src/lib/openjp2/j2k.c | 8 ++++++++
+ 1 file changed, 8 insertions(+)
+
+diff --git a/src/lib/openjp2/j2k.c b/src/lib/openjp2/j2k.c
+index 14f6ff41..922550eb 100644
+--- a/src/lib/openjp2/j2k.c
++++ b/src/lib/openjp2/j2k.c
+@@ -9236,6 +9236,14 @@ static OPJ_BOOL opj_j2k_update_image_dim
+     l_img_comp = p_image->comps;
+     for (it_comp = 0; it_comp < p_image->numcomps; ++it_comp) {
+         OPJ_INT32 l_h, l_w;
++        if (p_image->x0 > (OPJ_UINT32)INT_MAX ||
++                p_image->y0 > (OPJ_UINT32)INT_MAX ||
++                p_image->x1 > (OPJ_UINT32)INT_MAX ||
++                p_image->y1 > (OPJ_UINT32)INT_MAX) {
++            opj_event_msg(p_manager, EVT_ERROR,
++                          "Image coordinates above INT_MAX are not supported\n");
++            return OPJ_FALSE;
++        }
+ 
+         l_img_comp->x0 = (OPJ_UINT32)opj_int_ceildiv((OPJ_INT32)p_image->x0,
+                          (OPJ_INT32)l_img_comp->dx);
+-- 
+2.17.1
+
diff --git a/meta-oe/recipes-graphics/openjpeg/openjpeg_2.3.1.bb b/meta-oe/recipes-graphics/openjpeg/openjpeg_2.3.1.bb
index ffd4099b4..4045148dd 100644
--- a/meta-oe/recipes-graphics/openjpeg/openjpeg_2.3.1.bb
+++ b/meta-oe/recipes-graphics/openjpeg/openjpeg_2.3.1.bb
@@ -8,6 +8,7 @@ DEPENDS = "libpng tiff lcms zlib"
 SRC_URI = " \
     git://github.com/uclouvain/openjpeg.git \
     file://0002-Do-not-ask-cmake-to-export-binaries-they-don-t-make-.patch \
+    file://CVE-2020-6851.patch \
 "
 SRCREV = "57096325457f96d8cd07bd3af04fe81d7a2ba788"
 S = "${WORKDIR}/git"
-- 
2.24.1


