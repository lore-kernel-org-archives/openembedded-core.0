Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Xiaofeng.Yan@windriver.com>) id 1RbT7V-0005nb-V7
	for openembedded-core@lists.openembedded.org;
	Fri, 16 Dec 2011 09:26:22 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id pBG8J4WA013759
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Dec 2011 00:19:04 -0800 (PST)
Received: from localhost (128.224.162.28) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Fri, 16 Dec 2011 00:19:03 -0800
Message-ID: <f3e64282a610ee0dc8b4190e936709f909491d8c.1324022816.git.xiaofeng.yan@windriver.com>
In-Reply-To: <cover.1324022816.git.xiaofeng.yan@windriver.com>
References: <cover.1324022816.git.xiaofeng.yan@windriver.com>
Old-Date: Fri, 16 Dec 2011 15:59:14 +0800
Date: Fri, 16 Dec 2011 16:12:38 +0800
To: <openembedded-core@lists.openembedded.org>
From: Xiaofeng Yan <xiaofeng.yan@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] core-image-gtk-directfb: add a bb file to build an image for gtk over directfb
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
X-List-Received-Date: Fri, 16 Dec 2011 08:26:22 -0000
Content-Type: text/plain

From: Xiaofeng Yan <xiaofeng.yan@windriver.com>

This file can make an image to run gtk over directfb.

[YOCTO #1674]

Signed-off-by: Xiaofeng Yan <xiaofeng.yan@windriver.com>
---
 .../images/core-image-gtk-directfb.bb              |   28 ++++++++++++++++++++
 1 files changed, 28 insertions(+), 0 deletions(-)
 create mode 100644 meta/recipes-graphics/images/core-image-gtk-directfb.bb

diff --git a/meta/recipes-graphics/images/core-image-gtk-directfb.bb b/meta/recipes-graphics/images/core-image-gtk-directfb.bb
new file mode 100644
index 0000000..87b3a86
--- /dev/null
+++ b/meta/recipes-graphics/images/core-image-gtk-directfb.bb
@@ -0,0 +1,28 @@
+LICENSE = "MIT"
+PR="r0"
+
+
+LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58 \
+                    file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
+
+
+DEPENDS += "task-core-gtk-directfb"
+
+RDEPENDS_${PN} += " \
+	task-core-gtk-directfb-base \
+	"
+
+inherit core-image
+
+IMAGE_INSTALL += "\
+	${POKY_BASE_INSTALL} \
+	task-core-basic \
+	module-init-tools \
+	task-core-gtk-directfb-base \
+"
+
+python __anonymous () {
+	packages = d.getVar('DISTRO_FEATURES', True).split()
+	if "x11" in packages:
+		raise bb.parse.SkipPackage("FEATURE \"x11\" is in DISTRO_FEATURES, Please remove \"x11\" from DISTRO_FEATURES, use \"gtk-directfb\" instead of it\n")
+}
-- 
1.7.0.4



