Received: from mail-gx0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1RitG1-000871-91
	for openembedded-core@lists.openembedded.org;
	Thu, 05 Jan 2012 20:45:49 +0100
Received: by ggnh1 with SMTP id h1so397667ggn.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 05 Jan 2012 11:38:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=sender:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references;
	bh=uYcV2wBJZZKmL+bndhxqRoMyi8IV2xduwPQptfy2grU=;
	b=gB7bq7OxrbNlM5oUrzHS8RX1bJGaV5HQhhdVPMfSAfCgu6F3LQ6fSP9qREwAMqWZYN
	qVs2DUmgbWIKXMt1/L6WLDGErdg2LZsjGgaNq6rfm74QBMKkVVJNrQpvst3+nHA8ZxE/
	fe2KpgXsZ1XnghOesdNhJ9BF0Plt9FairmSEk=
Received: by 10.101.21.20 with SMTP id y20mr1633024ani.24.1325792300936;
	Thu, 05 Jan 2012 11:38:20 -0800 (PST)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id n5sm83398402yhk.1.2012.01.05.11.38.18
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 05 Jan 2012 11:38:19 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-core@lists.openembedded.org
Date: Thu,  5 Jan 2012 19:37:51 +0000
Message-Id: <268ead6ebfc8fbfdb9f6bf55352103b984bdf341.1325792209.git.otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <cover.1325792209.git.otavio@ossystems.com.br>
References: <cover.1325792209.git.otavio@ossystems.com.br>
In-Reply-To: <cover.1325792209.git.otavio@ossystems.com.br>
References: <cover.1325792209.git.otavio@ossystems.com.br>
Subject: [PATCH 01/10] qt4-graphics-system: add
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
X-List-Received-Date: Thu, 05 Jan 2012 19:45:50 -0000

Allow setting default runtime graphics system engine for Qt4
applications per machine.

Depending on the GPU and Xorg driver, this can boost and impact
significantly the drawing performance. The default setting is to
'raster' as this offer best performance for most machines GPUs.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 .../qt4-graphics-system/qt4-graphics-system_1.0.bb |   27 ++++++++++++++++++++
 1 files changed, 27 insertions(+), 0 deletions(-)
 create mode 100644 meta/recipes-qt/qt4-graphics-system/qt4-graphics-system_1.0.bb

diff --git a/meta/recipes-qt/qt4-graphics-system/qt4-graphics-system_1.0.bb b/meta/recipes-qt/qt4-graphics-system/qt4-graphics-system_1.0.bb
new file mode 100644
index 0000000..b3aa1e5
--- /dev/null
+++ b/meta/recipes-qt/qt4-graphics-system/qt4-graphics-system_1.0.bb
@@ -0,0 +1,27 @@
+DESCRIPTION = "Set default Qt4 Graphics System to ${QT_GRAPHICS_SYSTEM}"
+SECTION = "x11/base"
+LICENSE = "MIT-X"
+LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
+
+QT_GRAPHICS_SYSTEM ?= "raster"
+
+# xserver-common, x11-common
+VIRTUAL-RUNTIME_xserver_common ?= "x11-common"
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
+RDEPENDS_${PN} = "${VIRTUAL-RUNTIME_xserver_common} ${@_get_extra_rdepends(d)}"
+
+PACKAGE_ARCH = "${MACHINE_ARCH}"
-- 
1.7.2.5



