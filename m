Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RVJ8H-0005pP-4H
	for openembedded-core@openembedded.org; Tue, 29 Nov 2011 09:33:41 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 29 Nov 2011 00:26:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.69,590,1315206000"; d="scan'208";a="96419457"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.15.251])
	by fmsmga002.fm.intel.com with ESMTP; 29 Nov 2011 00:26:57 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@openembedded.org
Date: Tue, 29 Nov 2011 00:26:41 -0800
Message-Id: <f5546a175384de338edc23a248b19a23fb7d7017.1322554983.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <cover.1322554983.git.sgw@linux.intel.com>
References: <cover.1322554983.git.sgw@linux.intel.com>
In-Reply-To: <cover.1322554983.git.sgw@linux.intel.com>
References: <cover.1322554983.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 10/23] xserver-xorg: only use --disable-dga in xserver-xorg-lite
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 29 Nov 2011 08:33:41 -0000

From: Otavio Salvador <otavio@ossystems.com.br>

Xorg VESA driver calls DGAInit enforcing this symbol to be available
to the driver to work so we revert back to only disable DGA for lite
flavor of Xorg.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 .../xorg-xserver/xserver-xorg-1.11.1.inc           |    2 +-
 .../xorg-xserver/xserver-xorg-common.inc           |    1 -
 .../xorg-xserver/xserver-xorg-lite.inc             |    1 +
 3 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg-1.11.1.inc b/meta/recipes-graphics/xorg-xserver/xserver-xorg-1.11.1.inc
index 2c5bb0a..8b0808d 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg-1.11.1.inc
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg-1.11.1.inc
@@ -3,7 +3,7 @@ SRC_URI += "file://crosscompile.patch"
 # Misc build failure for master HEAD
 SRC_URI += "file://fix_open_max_preprocessor_error.patch"
 
-PR = "r1"
+PR = "r2"
 
 SRC_URI[md5sum] = "4cdf54dc569b6a5548257c93a45dcd3d"
 SRC_URI[sha256sum] = "c069c177d9a80bca2ee1d49aa1af6d9f996c83e4ff12393cab2ca3f8817276f6"
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg-common.inc b/meta/recipes-graphics/xorg-xserver/xserver-xorg-common.inc
index 2559397..c1a552e 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg-common.inc
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg-common.inc
@@ -100,7 +100,6 @@ EXTRA_OECONF += "--with-fop=no \
                  --disable-acfb \
                  --disable-ccfb \
                  --disable-mcfb \
-                 --disable-dga \
                  --disable-xinerama \
                  --disable-xf86misc \
                  --disable-xorgcfg \
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg-lite.inc b/meta/recipes-graphics/xorg-xserver/xserver-xorg-lite.inc
index be84e9e..57615f5 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg-lite.inc
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg-lite.inc
@@ -3,4 +3,5 @@ require xserver-xorg-common.inc
 EXTRA_OECONF += "\
                  --disable-dri \
                  --disable-glx \
+                 --disable-dga \
 "
-- 
1.7.6.4



