Return-Path: <geoffrey.levillain@smile.fr>
Received: from idris.smile.fr (idris.smile.fr [91.216.209.19])
	by mail.openembedded.org (Postfix) with ESMTP id B603D7783D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Mar 2017 16:58:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by idris.smile.fr (Postfix) with ESMTP id E00FB1EE20C2;
	Tue, 14 Mar 2017 17:58:41 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at smile.fr
Received: from idris.smile.fr ([127.0.0.1])
	by localhost (bluemind-mta.prod.vitry.intranet [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id eu4YgV7Z-zGg; Tue, 14 Mar 2017 17:58:41 +0100 (CET)
Received: from Mirage.daviel.idf.intranet
	(lns-bzn-39-82-255-32-23.adsl.proxad.net [82.255.32.23])
	by idris.smile.fr (Postfix) with ESMTPA id C202A1EE1738;
	Tue, 14 Mar 2017 17:58:41 +0100 (CET)
From: Geoffrey Levillain <geoffrey.levillain@smile.fr>
To: openembedded-core@lists.openembedded.org
Date: Tue, 14 Mar 2017 17:58:16 +0100
Message-Id: <20170314165816.25512-2-geoffrey.levillain@smile.fr>
X-Mailer: git-send-email 2.12.0
In-Reply-To: <20170314165816.25512-1-geoffrey.levillain@smile.fr>
References: <20170314165816.25512-1-geoffrey.levillain@smile.fr>
Subject: [PATCH v3 1/1] image_overlay.bbclass: Add possibility to install overlays to image
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
X-List-Received-Date: Tue, 14 Mar 2017 16:58:41 -0000

There is often a need to add configuration files specific to an image,
with this class it's possible to fetch and install files from the
image recipe.

Fetching is set as noexec for images, but there is a need to fetch files
here. This class permit to fetch and unpack without the use of these
tasks in order to get your image-specific overlays to install.

This class must be inherited beside an image class (such as core-image).

Small example of usage in image recipe as it help to understand :
----------------------------------------------------------
FILESEXTRAPATHS_prepend := "${THISDIR}:"

DESCRIPTION = "An overlayable image"

OVERLAY_SRC_URI = "file://overlay.tar.gz file://overlay2"

OVERLAY_ROOT_DIRS = "overlay1 overlay2"

inherit core-image image_overlay
----------------------------------------------------------
(Where file://overlay2 refer to a directory, and overlay.tar.gz
cointain a directory named overlay1)

Signed-off-by: Geoffrey Levillain <geoffrey.levillain@smile.fr>
---
 meta/classes/image_overlay.bbclass | 38 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 38 insertions(+)
 create mode 100644 meta/classes/image_overlay.bbclass

diff --git a/meta/classes/image_overlay.bbclass b/meta/classes/image_overlay.bbclass
new file mode 100644
index 0000000000..ade2911410
--- /dev/null
+++ b/meta/classes/image_overlay.bbclass
@@ -0,0 +1,38 @@
+# When inherited by an image recipe, this class provide simple way to
+# put configuration files into rootfs.
+
+ROOTFS_POSTPROCESS_COMMAND_append = "install_overlay ; "
+
+python install_overlay() {
+    """Fetch and install overlays into rootfs
+    
+       Fetch overlays from OVERLAY_SRC_URI and copy the files
+       inside the folders listed in OVERLAY_ROOT_DIRS to rootfs.
+       
+       OVERLAY_ROOT_DIRS contains only names of folders, no path.
+       
+       OVERLAY_SRC_URI must be used to get dirs in OVERLAY_ROOT_DIRS
+       imported to the workdir, it's the same as SRC_URI, so it's 
+       possible to use distant repository, tarballs, etc.
+    """
+    workdir = d.getVar('WORKDIR', True)
+    rootfs = d.getVar('IMAGE_ROOTFS', True)
+    srcs = (d.getVar("OVERLAY_SRC_URI", True) or "").split()
+    overlay_root_dirs = (d.getVar('OVERLAY_ROOT_DIRS', True) or '').split()
+
+    fetcher = bb.fetch2.Fetch(srcs, d)
+    fetcher.download()
+    fetcher.unpack(workdir)
+
+    for i in range(len(overlay_root_dirs)):
+        fullpath = os.path.join(workdir, overlay_root_dirs[i])
+        
+        if not os.path.isdir(fullpath):
+            bb.fatal(fullpath +
+                     " : directory not found, please check your"\
+                     " OVERLAY_ROOT_DIRS and OVERLAY_SRC_URI variables.")
+            break
+        os.system("cp -dr " + os.path.join(fullpath, "*") + " " + rootfs)
+}
+
+do_rootfs[vardeps] += "OVERLAY_ROOT_DIRS OVERLAY_SRC_URI"
-- 
2.12.0


