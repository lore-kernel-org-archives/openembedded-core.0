Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id C903D77072
	for <openembedded-core@lists.openembedded.org>;
	Fri,  2 Sep 2016 12:08:18 +0000 (UTC)
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by orsmga101.jf.intel.com with ESMTP; 02 Sep 2016 05:08:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.30,270,1470726000"; 
   d="scan'208";a="3965501"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.49])
	by fmsmga006.fm.intel.com with ESMTP; 02 Sep 2016 05:08:17 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  2 Sep 2016 15:06:45 +0300
Message-Id: <20160902120645.5271-3-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <20160902120645.5271-1-alexander.kanavin@linux.intel.com>
References: <20160902120645.5271-1-alexander.kanavin@linux.intel.com>
Subject: [PATCH 3/3] gtk+3: disable gtk-doc when x11 is not available
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
X-List-Received-Date: Fri, 02 Sep 2016 12:08:18 -0000

gtk-doc requires gdk/x11/gdkx.h which is not available if gdk x11 backend is disabled
(due to jku's patch).

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/recipes-gnome/gtk+/gtk+3.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-gnome/gtk+/gtk+3.inc b/meta/recipes-gnome/gtk+/gtk+3.inc
index 1329557..83e9b92 100644
--- a/meta/recipes-gnome/gtk+/gtk+3.inc
+++ b/meta/recipes-gnome/gtk+/gtk+3.inc
@@ -32,6 +32,7 @@ EXTRA_OECONF += " \
                  --disable-cups \
                  --disable-colord \
                  WAYLAND_PROTOCOLS_SYSROOT_DIR=${STAGING_DIR}/${MACHINE} \
+                 ${@bb.utils.contains("DISTRO_FEATURES", "x11", "", "--disable-gtk-doc", d)} \
                  "
 EXTRA_OECONF[vardepsexclude] = "MACHINE"
 
-- 
2.9.3


