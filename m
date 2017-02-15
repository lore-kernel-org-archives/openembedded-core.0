Return-Path: <geoffrey.levillain@smile.fr>
Received: from idris.smile.fr (idris.smile.fr [91.216.209.19])
	by mail.openembedded.org (Postfix) with ESMTP id CA48C71E15
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Feb 2017 17:33:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by idris.smile.fr (Postfix) with ESMTP id 3D6ED1EE19B4;
	Wed, 15 Feb 2017 18:33:54 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at smile.fr
Received: from idris.smile.fr ([127.0.0.1])
	by localhost (bluemind-mta.prod.vitry.intranet [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id RDXLvxXGRWn7; Wed, 15 Feb 2017 18:33:54 +0100 (CET)
Received: from Mirage.daviel.idf.intranet (fw-alt.idf.smile.fr
	[109.190.187.143])
	by idris.smile.fr (Postfix) with ESMTPA id DA2EA1EE199A;
	Wed, 15 Feb 2017 18:33:53 +0100 (CET)
From: Geoffrey Levillain <geoffrey.levillain@smile.fr>
To: openembedded-core@lists.openembedded.org
Date: Wed, 15 Feb 2017 18:33:22 +0100
Message-Id: <20170215173323.10466-3-geoffrey.levillain@smile.fr>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20170215173323.10466-1-geoffrey.levillain@smile.fr>
References: <20170215173323.10466-1-geoffrey.levillain@smile.fr>
Subject: [PATCH v2 2/3] image_overlay.bbclass: Add possibility to install overlays to image
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
X-List-Received-Date: Wed, 15 Feb 2017 17:33:54 -0000

There is often a need to add configuration files specific to an image,
to simplify this process we can use a task.

Fetching is set as noexec for images, but there is a need to fetch files
here. This class permit to use do_fetch, do_unpack and do_patch in order
to get your image-specific overlays to install.

Signed-off-by: Geoffrey Levillain <geoffrey.levillain@smile.fr>
---
 meta/classes/image_overlay.bbclass | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)
 create mode 100644 meta/classes/image_overlay.bbclass

diff --git a/meta/classes/image_overlay.bbclass b/meta/classes/image_overlay.bbclass
new file mode 100644
index 0000000000..93c1ea6f9f
--- /dev/null
+++ b/meta/classes/image_overlay.bbclass
@@ -0,0 +1,24 @@
+# Enable SRC_URI for images and use it to install overlays
+
+# Let these task be executed to fetch overlay
+unset do_fetch[noexec]
+unset do_unpack[noexec]
+unset do_patch[noexec]
+
+# Add a task to install the overlay
+# (content of folders listed in OVERLAY_ROOT_DIRS is copied in rootfs)
+addtask install_overlay after do_unpack do_patch do_rootfs before do_image
+fakeroot do_install_overlay() {
+    for dir in ${OVERLAY_ROOT_DIRS}; do
+        if [ ! -d "${WORKDIR}/${dir}" ] ; then
+            bbfatal "${dir} not found, please check your OVERLAY_ROOT_DIRS and SRC_URI variables."
+        fi
+        cp -dr --no-preserve=ownership "${WORKDIR}/${dir}"/* "${IMAGE_ROOTFS}"
+    done
+}
+do_install_overlay[depends] += "virtual/fakeroot-native:do_populate_sysroot"
+do_install_overlay[dirs] = "${IMAGE_ROOTFS}"
+do_install_overlay[umask] = "022"
+do_install_overlay[vardeps] += "OVERLAY_ROOT_DIRS"
+
+SSTATETASKS += "do_install_overlay"
-- 
2.11.0


