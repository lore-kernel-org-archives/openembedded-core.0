Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Xiaofeng.Yan@windriver.com>) id 1RNjdA-0007gt-Tg
	for openembedded-core@lists.openembedded.org;
	Tue, 08 Nov 2011 12:14:19 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id pA8B7ueT014949
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 8 Nov 2011 03:07:56 -0800 (PST)
Received: from localhost (128.224.162.28) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Tue, 8 Nov 2011 03:07:56 -0800
Message-ID: <9ea7163eddba63fcbba0b3cd36558064e0f35f32.1320750179.git.xiaofeng.yan@windriver.com>
In-Reply-To: <cover.1320750179.git.xiaofeng.yan@windriver.com>
References: <cover.1320750179.git.xiaofeng.yan@windriver.com>
Old-Date: Tue, 8 Nov 2011 18:48:45 +0800
Date: Tue, 8 Nov 2011 19:15:58 +0800
To: <openembedded-core@lists.openembedded.org>
From: Xiaofeng Yan <xiaofeng.yan@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 6/7] core-image-gtk-directfb: Fix bug 1674
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
X-List-Received-Date: Tue, 08 Nov 2011 11:14:24 -0000
Content-Type: text/plain

From: Xiaofeng Yan <xiaofeng.yan@windriver.com>

[YOCTO #1674]
Two recipes can build an image based on gtk+directfb

Signed-off-by: Xiaofeng Yan <xiaofeng.yan@windriver.com>
---
 .../images/core-image-gtk-directfb.bb              |   21 +++++++++++++++
 meta/recipes-graphics/tasks/task-gtk-directfb.bb   |   28 ++++++++++++++++++++
 2 files changed, 49 insertions(+), 0 deletions(-)
 create mode 100644 meta/recipes-graphics/images/core-image-gtk-directfb.bb
 create mode 100644 meta/recipes-graphics/tasks/task-gtk-directfb.bb

diff --git a/meta/recipes-graphics/images/core-image-gtk-directfb.bb b/meta/recipes-graphics/images/core-image-gtk-directfb.bb
new file mode 100644
index 0000000..00ba5cf
--- /dev/null
+++ b/meta/recipes-graphics/images/core-image-gtk-directfb.bb
@@ -0,0 +1,21 @@
+LICENSE = "MIT"
+PR="r0"
+
+LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58 \
+                    file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
+
+
+DEPENDS += "task-gtk-directfb"
+
+RDEPENDS_${PN} += " \
+	task-gtk-directfb-base \
+	"
+
+inherit core-image
+
+IMAGE_INSTALL += "\
+	${POKY_BASE_INSTALL} \
+	task-core-basic \
+	module-init-tools \
+	task-gtk-directfb-base \
+"
diff --git a/meta/recipes-graphics/tasks/task-gtk-directfb.bb b/meta/recipes-graphics/tasks/task-gtk-directfb.bb
new file mode 100644
index 0000000..991b179
--- /dev/null
+++ b/meta/recipes-graphics/tasks/task-gtk-directfb.bb
@@ -0,0 +1,28 @@
+DESCRIPTION = "gkt+ over directfb without x11"
+PR = "r0"
+LICENSE = "MIT"
+
+LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58 \
+                    file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
+
+inherit task
+
+TOUCH = ' ${@base_contains("MACHINE_FEATURES", "touchscreen", "tslib tslib-calibrate tslib-tests", "",d)}'
+
+PACKAGES += " \
+	${PN}-base \
+"
+
+RDEPENDS_${PN}-base = " \
+	directfb \
+        directfb-examples \
+        pango \
+        pango-modules \
+        fontconfig \
+        gtk+ \
+        gtk+-demo \
+        dropbear \
+	${TOUCH} \
+"
+
+
-- 
1.7.0.4



