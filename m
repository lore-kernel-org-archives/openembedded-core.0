Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 22B3377D64
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Apr 2017 14:28:26 +0000 (UTC)
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	27 Apr 2017 07:28:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.37,384,1488873600"; d="scan'208";a="94884560"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by fmsmga006.fm.intel.com with ESMTP; 27 Apr 2017 07:28:27 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 27 Apr 2017 17:28:02 +0300
Message-Id: <3d94dca4686fa708d0c762cdf4458ceccf2f6d89.1493302527.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1493302527.git.alexander.kanavin@linux.intel.com>
References: <cover.1493302527.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 03/13] mesa: remove the git recipe
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
X-List-Received-Date: Thu, 27 Apr 2017 14:28:26 -0000

It hasn't been touched in almost two years; clearly the idea of
providing separate _git.bb recipes is not working.

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/recipes-graphics/mesa/mesa_git.bb | 22 ----------------------
 1 file changed, 22 deletions(-)
 delete mode 100644 meta/recipes-graphics/mesa/mesa_git.bb

diff --git a/meta/recipes-graphics/mesa/mesa_git.bb b/meta/recipes-graphics/mesa/mesa_git.bb
deleted file mode 100644
index c0345178c4f..00000000000
--- a/meta/recipes-graphics/mesa/mesa_git.bb
+++ /dev/null
@@ -1,22 +0,0 @@
-require ${BPN}.inc
-
-DEFAULT_PREFERENCE = "-1"
-
-SRCREV = "ea0d1f575c214c09ba3df12644a960e86e031766"
-PV = "10.5.4+git${SRCPV}"
-
-SRC_URI = "git://anongit.freedesktop.org/git/mesa/mesa;branch=10.5"
-
-S = "${WORKDIR}/git"
-
-DEPENDS += "python-mako-native"
-
-inherit pythonnative
-
-#because we cannot rely on the fact that all apps will use pkgconfig,
-#make eglplatform.h independent of MESA_EGL_NO_X11_HEADER
-do_install_append() {
-    if ${@bb.utils.contains('PACKAGECONFIG', 'egl', 'true', 'false', d)}; then
-        sed -i -e 's/^#if defined(MESA_EGL_NO_X11_HEADERS)$/#if defined(MESA_EGL_NO_X11_HEADERS) || ${@bb.utils.contains('PACKAGECONFIG', 'x11', '0', '1', d)}/' ${D}${includedir}/EGL/eglplatform.h
-    fi
-}
-- 
2.11.0


