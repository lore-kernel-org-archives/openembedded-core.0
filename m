Received: from db3ehsobe006.messaging.microsoft.com ([213.199.154.144]
	helo=DB3EHSOBE006.bigfish.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1R98RW-0000XO-3G
	for openembedded-core@lists.openembedded.org;
	Thu, 29 Sep 2011 06:41:54 +0200
Received: from mail70-db3-R.bigfish.com (10.3.81.240) by
	DB3EHSOBE006.bigfish.com (10.3.84.26) with Microsoft SMTP Server id
	14.1.225.22; Thu, 29 Sep 2011 04:21:20 +0000
Received: from mail70-db3 (localhost.localdomain [127.0.0.1])	by
	mail70-db3-R.bigfish.com (Postfix) with ESMTP id 3BB3A1D83E1	for
	<openembedded-core@lists.openembedded.org>;
	Thu, 29 Sep 2011 04:21:20 +0000 (UTC)
X-SpamScore: -1
X-BigFish: VS-1(zz936eK13e6Qa1fflb922lzz1202h1082kzz8275bh8275dhz2dh2a8h668h839h61h)
X-Spam-TCS-SCL: 0:0
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null);
	IPVD:NLI; H:mail.freescale.net; RD:none; EFVD:NLI
Received: from mail70-db3 (localhost.localdomain [127.0.0.1]) by mail70-db3
	(MessageSwitch) id 1317270079869319_12968;
	Thu, 29 Sep 2011 04:21:19 +0000 (UTC)
Received: from DB3EHSMHS014.bigfish.com (unknown [10.3.81.249])	by
	mail70-db3.bigfish.com (Postfix) with ESMTP id C6CD015E004F	for
	<openembedded-core@lists.openembedded.org>;
	Thu, 29 Sep 2011 04:21:19 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by DB3EHSMHS014.bigfish.com
	(10.3.87.114) with Microsoft SMTP Server (TLS) id 14.1.225.22;
	Thu, 29 Sep 2011 04:21:16 +0000
Received: from az33smr01.freescale.net (10.64.34.199) by
	039-SN1MMR1-001.039d.mgd.msft.net (10.84.1.13) with Microsoft SMTP
	Server id 14.1.323.7; Wed, 28 Sep 2011 23:21:15 -0500
Received: from right.am.freescale.net (right.am.freescale.net [10.82.193.13])
	by az33smr01.freescale.net (8.13.1/8.13.0) with ESMTP id
	p8T4LAL3024559	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Sep 2011 23:21:14 -0500 (CDT)
From: Matthew McClintock <msm@freescale.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 28 Sep 2011 23:21:08 -0500
Message-ID: <1317270070-14250-14-git-send-email-msm@freescale.com>
X-Mailer: git-send-email 1.7.6.1
In-Reply-To: <1317270070-14250-1-git-send-email-msm@freescale.com>
References: <1317270070-14250-1-git-send-email-msm@freescale.com>
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Subject: [PATCH 14/16] Add udev patch to compile against newer kernels
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
X-List-Received-Date: Thu, 29 Sep 2011 04:41:54 -0000
Content-Type: text/plain

This patch is needed to compile against newer kernels which have
changed their API

Signed-off-by: Matthew McClintock <msm@freescale.com>
---
 meta/recipes-core/udev/files/udev-166-v4l1-1.patch |   50 ++++++++++++++++++++
 meta/recipes-core/udev/udev_164.bb                 |    4 +-
 2 files changed, 53 insertions(+), 1 deletions(-)
 create mode 100644 meta/recipes-core/udev/files/udev-166-v4l1-1.patch

diff --git a/meta/recipes-core/udev/files/udev-166-v4l1-1.patch b/meta/recipes-core/udev/files/udev-166-v4l1-1.patch
new file mode 100644
index 0000000..2086fe1
--- /dev/null
+++ b/meta/recipes-core/udev/files/udev-166-v4l1-1.patch
@@ -0,0 +1,50 @@
+Upstream-Status: Backport
+
+Submitted By:            Matt Burgess <matthew_at_linuxfromscratch_dot_org>
+Date:                    2011-03-26
+Initial Package Version: 166
+Upstream Status:         From upstream
+Origin:                  http://git.kernel.org/?p=linux/hotplug/udev.git;a=commitdiff;h=4ace8a43ac2cbbd4d6f5c29fc461c3caa8f8545b
+Description:             Fixes a compilation error caused by the removal of the
+                         Video for Linux 1 API from Linux kernels from 2.6.38
+                         onwards.
+
+diff -Naur udev-166.orig/extras/v4l_id/v4l_id.c udev-166/extras/v4l_id/v4l_id.c
+--- udev-166.orig/extras/v4l_id/v4l_id.c	2009-12-03 12:45:03.000000000 +0000
++++ udev-166/extras/v4l_id/v4l_id.c	2011-03-25 20:26:33.000000000 +0000
+@@ -28,7 +28,6 @@
+ #include <sys/types.h>
+ #include <sys/time.h>
+ #include <sys/ioctl.h>
+-#include <linux/videodev.h>
+ #include <linux/videodev2.h>
+ 
+ int main (int argc, char *argv[])
+@@ -39,7 +38,6 @@
+ 	};
+ 	int fd;
+ 	char *device;
+-	struct video_capability v1cap;
+ 	struct v4l2_capability v2cap;
+ 
+ 	while (1) {
+@@ -82,19 +80,6 @@
+ 		if ((v2cap.capabilities & V4L2_CAP_RADIO) > 0)
+ 			printf("radio:");
+ 		printf("\n");
+-	} else if (ioctl (fd, VIDIOCGCAP, &v1cap) == 0) {
+-		printf("ID_V4L_VERSION=1\n");
+-		printf("ID_V4L_PRODUCT=%s\n", v1cap.name);
+-		printf("ID_V4L_CAPABILITIES=:");
+-		if ((v1cap.type & VID_TYPE_CAPTURE) > 0)
+-			printf("capture:");
+-		if ((v1cap.type & VID_TYPE_OVERLAY) > 0)
+-			printf("video_overlay:");
+-		if (v1cap.audios > 0)
+-			printf("audio:");
+-		if ((v1cap.type & VID_TYPE_TUNER) > 0)
+-			printf("tuner:");
+-		printf("\n");
+ 	}
+ 
+ 	close (fd);
diff --git a/meta/recipes-core/udev/udev_164.bb b/meta/recipes-core/udev/udev_164.bb
index 567e62e..f20da27 100644
--- a/meta/recipes-core/udev/udev_164.bb
+++ b/meta/recipes-core/udev/udev_164.bb
@@ -1,6 +1,8 @@
 include udev-new.inc
 
-PR = "r3"
+PR = "r4"
+
+SRC_URI += "file://udev-166-v4l1-1.patch"
 
 SRC_URI[md5sum] = "fddac2d54761ea34865af9467377ca9f"
 SRC_URI[sha256sum] = "c12e66280b5e1465f6587a8cfa47d7405c4caa7e52ce5dd13478d04f6ec05e5c"
-- 
1.7.6.1




