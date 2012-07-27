Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Rongqing.Li@windriver.com>) id 1SujRI-0004BP-Ps
	for openembedded-core@lists.openembedded.org;
	Fri, 27 Jul 2012 14:14:41 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id q6RC37Ut025788
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Jul 2012 05:03:07 -0700 (PDT)
Received: from lirq-OptiPlex-780.corp.ad.wrs.com (128.224.162.163) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.1.255.0; Fri, 27 Jul 2012 05:03:06 -0700
From: <rongqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 27 Jul 2012 20:03:07 +0800
Message-ID: <1343390587-27506-1-git-send-email-rongqing.li@windriver.com>
X-Mailer: git-send-email 1.7.4.1
MIME-Version: 1.0
Subject: [PATCH 1/1] usbutils 0.91: Fix NULL pointer crash.
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
X-List-Received-Date: Fri, 27 Jul 2012 12:14:41 -0000
Content-Type: text/plain

From: Roy.Li <rongqing.li@windriver.com>

[YOCTO #2847]

Before use usbbuslist, we should check if it is valid.

Signed-off-by: Roy.Li <rongqing.li@windriver.com>
---
 .../usbutils/usbutils/Fix-NULL-pointer-crash.patch |   28 ++++++++++++++++++++
 meta/recipes-bsp/usbutils/usbutils_0.91.bb         |    5 ++-
 2 files changed, 31 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-bsp/usbutils/usbutils/Fix-NULL-pointer-crash.patch

diff --git a/meta/recipes-bsp/usbutils/usbutils/Fix-NULL-pointer-crash.patch b/meta/recipes-bsp/usbutils/usbutils/Fix-NULL-pointer-crash.patch
new file mode 100644
index 0000000..f5ad2b2
--- /dev/null
+++ b/meta/recipes-bsp/usbutils/usbutils/Fix-NULL-pointer-crash.patch
@@ -0,0 +1,28 @@
+Fix NULL pointer crash.
+
+Before use usbbuslist, we should check if it is valid.
+
+Upstream-Status: Pending
+Signed-off-by: Roy.Li <rongqing.li@windriver.com>
+---
+ lsusb-t.c |    4 ++++
+ 1 files changed, 4 insertions(+), 0 deletions(-)
+
+diff --git a/lsusb-t.c b/lsusb-t.c
+index f604155..583a46a 100644
+--- a/lsusb-t.c
++++ b/lsusb-t.c
+@@ -643,6 +643,10 @@ static void sort_busses(void)
+ 	/* need to reverse sort bus numbers */
+ 	struct usbbusnode *t, *p, **pp;
+ 	int swapped;
++
++	if (!usbbuslist)
++		return;
++
+ 	do {
+ 		p = usbbuslist;
+ 		pp = &usbbuslist;
+-- 
+1.7.4.1
+
diff --git a/meta/recipes-bsp/usbutils/usbutils_0.91.bb b/meta/recipes-bsp/usbutils/usbutils_0.91.bb
index 04d1681..abe807c 100644
--- a/meta/recipes-bsp/usbutils/usbutils_0.91.bb
+++ b/meta/recipes-bsp/usbutils/usbutils_0.91.bb
@@ -7,10 +7,11 @@ LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 
 DEPENDS = "libusb zlib"
-PR = "r4"
+PR = "r5"
 
 SRC_URI = "${KERNELORG_MIRROR}/linux/utils/usb/usbutils/usbutils-${PV}.tar.gz \
-           file://usb-devices-avoid-dependency-on-bash.patch"
+           file://usb-devices-avoid-dependency-on-bash.patch \
+           file://Fix-NULL-pointer-crash.patch"
 
 SRC_URI[md5sum] = "49de2403b40bf3a9863faaa8d3858deb"
 SRC_URI[sha256sum] = "c122346b0225121bcf159abf804116f826a4a3462c94ce7b8871f7559e6b3a46"
-- 
1.7.4.1



