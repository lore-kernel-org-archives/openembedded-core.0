Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1RfziM-0007Xe-92
	for openembedded-core@lists.openembedded.org;
	Wed, 28 Dec 2011 21:03:06 +0100
Received: by yenm12 with SMTP id m12so6849838yen.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Dec 2011 11:55:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=sender:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references;
	bh=wzh4MS+YpRUwGIT8uoGvuSH6Wxv3BetIW+G1qm8CNmg=;
	b=TVu1IyTKM+WAqaE0wZ9d27WiDVy10yUYsSLKPhmTGoDxvALVtlfHnX2G/rnmiIkwWc
	BZvhzwCTmk3x8Gt41UCc7oEsDhVxlHVip+jdTaVEpR8vxJqKElDPXpKSfCwjKlblMgpl
	IeCUJfN0JfUzx2NJFxHjOZYxhGrkpqV5Ifvj8=
Received: by 10.236.177.67 with SMTP id c43mr44337219yhm.54.1325102151808;
	Wed, 28 Dec 2011 11:55:51 -0800 (PST)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id m14sm9949232anh.11.2011.12.28.11.55.49
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 28 Dec 2011 11:55:50 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-core@lists.openembedded.org
Date: Wed, 28 Dec 2011 19:55:22 +0000
Message-Id: <fde24903e4f56091470e1e7f2fc00a63a8b86f22.1325101673.git.otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <cover.1325101673.git.otavio@ossystems.com.br>
References: <cover.1325101673.git.otavio@ossystems.com.br>
In-Reply-To: <cover.1325101673.git.otavio@ossystems.com.br>
References: <cover.1325101673.git.otavio@ossystems.com.br>
Subject: [PATCH 01/16] qt4-graphics-system: add
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
X-List-Received-Date: Wed, 28 Dec 2011 20:03:06 -0000

Allow setting default runtime graphics system engine for Qt4
applications per machine.

Depending on the GPU and Xorg driver, this can boost and impact
significantly the drawing performance. The default setting is to
'raster' as this offer best performance for most machines GPUs.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 .../qt4-graphics-system/qt4-graphics-system_1.0.bb |   24 ++++++++++++++++++++
 1 files changed, 24 insertions(+), 0 deletions(-)
 create mode 100644 meta/recipes-qt/qt4-graphics-system/qt4-graphics-system_1.0.bb

diff --git a/meta/recipes-qt/qt4-graphics-system/qt4-graphics-system_1.0.bb b/meta/recipes-qt/qt4-graphics-system/qt4-graphics-system_1.0.bb
new file mode 100644
index 0000000..e3a3a1d
--- /dev/null
+++ b/meta/recipes-qt/qt4-graphics-system/qt4-graphics-system_1.0.bb
@@ -0,0 +1,24 @@
+DESCRIPTION = "Set default Qt4 Graphics System to ${QT_GRAPHICS_SYSTEM}"
+SECTION = "x11/base"
+LICENSE = "MIT-X"
+LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
+
+QT_GRAPHICS_SYSTEM ?= "raster"
+
+def _get_extra_rdepends(d):
+    gs = d.getVar('QT_GRAPHICS_SYSTEM', 1)
+    if gs == "opengl":
+        return "qt4-plugin-graphicssystems-glgraphicssystem"
+
+    return ""
+
+do_install () {
+	install -d ${D}/${sysconfdir}/X11/Xsession.d/
+	cfg_file=${D}/${sysconfdir}/X11/Xsession.d/85xqt-graphicssystem
+	echo "export QT_GRAPHICSSYSTEM=${QT_GRAPHICS_SYSTEM}" > $cfg_file
+	chmod +x $cfg_file
+}
+
+RDEPENDS_${PN} = "xserver-common ${@_get_extra_rdepends(d)}"
+
+PACKAGE_ARCH = "${MACHINE_ARCH}"
-- 
1.7.2.5



