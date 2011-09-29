Received: from tx2ehsobe001.messaging.microsoft.com ([65.55.88.11]
	helo=TX2EHSOBE002.bigfish.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1R98Cr-0000DU-Ei
	for openembedded-core@lists.openembedded.org;
	Thu, 29 Sep 2011 06:26:45 +0200
Received: from mail26-tx2-R.bigfish.com (10.9.14.240) by
	TX2EHSOBE002.bigfish.com (10.9.40.22) with Microsoft SMTP Server id
	14.1.225.22; Thu, 29 Sep 2011 04:21:17 +0000
Received: from mail26-tx2 (localhost.localdomain [127.0.0.1])	by
	mail26-tx2-R.bigfish.com (Postfix) with ESMTP id 4D5A5580385	for
	<openembedded-core@lists.openembedded.org>;
	Thu, 29 Sep 2011 04:21:17 +0000 (UTC)
X-SpamScore: 11
X-BigFish: VS11(zza1fflb922lzz1202h1082kzz8275bh8275dhz2dh2a8h668h839h)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null);
	IPVD:NLI; H:mail.freescale.net; RD:none; EFVD:NLI
X-FB-SS: 13,
Received: from mail26-tx2 (localhost.localdomain [127.0.0.1]) by mail26-tx2
	(MessageSwitch) id 1317270076274843_16702;
	Thu, 29 Sep 2011 04:21:16 +0000 (UTC)
Received: from TX2EHSMHS022.bigfish.com (unknown [10.9.14.238])	by
	mail26-tx2.bigfish.com (Postfix) with ESMTP id 23752130004C	for
	<openembedded-core@lists.openembedded.org>;
	Thu, 29 Sep 2011 04:21:16 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by TX2EHSMHS022.bigfish.com
	(10.9.99.122) with Microsoft SMTP Server (TLS) id 14.1.225.22;
	Thu, 29 Sep 2011 04:21:15 +0000
Received: from az33smr01.freescale.net (10.64.34.199) by
	039-SN1MMR1-002.039d.mgd.msft.net (10.84.1.15) with Microsoft SMTP
	Server id 14.1.323.7; Wed, 28 Sep 2011 23:21:15 -0500
Received: from right.am.freescale.net (right.am.freescale.net [10.82.193.13])
	by az33smr01.freescale.net (8.13.1/8.13.0) with ESMTP id
	p8T4LAL2024559	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Sep 2011 23:21:14 -0500 (CDT)
From: Matthew McClintock <msm@freescale.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 28 Sep 2011 23:21:07 -0500
Message-ID: <1317270070-14250-13-git-send-email-msm@freescale.com>
X-Mailer: git-send-email 1.7.6.1
In-Reply-To: <1317270070-14250-1-git-send-email-msm@freescale.com>
References: <1317270070-14250-1-git-send-email-msm@freescale.com>
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Subject: [PATCH 13/16] Fix HAL on newer kernels without header file
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
X-List-Received-Date: Thu, 29 Sep 2011 04:26:45 -0000
Content-Type: text/plain

Signed-off-by: Matthew McClintock <msm@freescale.com>
---
 .../hal/files/probe-video4linux.c.patch            |   60 ++++++++++++++++++++
 meta/recipes-support/hal/hal_0.5.14.bb             |    4 +-
 2 files changed, 63 insertions(+), 1 deletions(-)
 create mode 100644 meta/recipes-support/hal/files/probe-video4linux.c.patch

diff --git a/meta/recipes-support/hal/files/probe-video4linux.c.patch b/meta/recipes-support/hal/files/probe-video4linux.c.patch
new file mode 100644
index 0000000..0f8140b
--- /dev/null
+++ b/meta/recipes-support/hal/files/probe-video4linux.c.patch
@@ -0,0 +1,60 @@
+Upstream-Status: Backport
+
+From ae13d96fa2a0612b6000f4b8f6ed9d3564035703 Mon Sep 17 00:00:00 2001
+From: Michael Biebl <biebl@debian.org>
+Date: Sun, 10 Apr 2011 12:54:53 +0000
+Subject: Build hald-probe-video4linux on current kernels again
+
+The hald-probe-video4linux prober supports both v4l1 and v4l2. Support for v4l1
+has been removed from Linux kernel 2.6.38. Instead of disabling the prober
+altogether, #ifdef the v4l1 parts when building on a newer kernel.
+
+Signed-off-by: Martin Pitt <martin.pitt@ubuntu.com>
+---
+(limited to 'hald/linux/probing/probe-video4linux.c')
+
+diff --git a/hald/linux/probing/probe-video4linux.c b/hald/linux/probing/probe-video4linux.c
+index 7bc13e8..b055720 100644
+--- a/hald/linux/probing/probe-video4linux.c
++++ b/hald/linux/probing/probe-video4linux.c
+@@ -30,7 +30,9 @@
+ #include <sys/types.h>
+ #include <sys/time.h>
+ #include <sys/ioctl.h>
++#ifdef HAVE_LINUX_VIDEODEV_H
+ #include <linux/videodev.h>
++#endif
+ #include <linux/videodev2.h>
+ #include <errno.h>
+ #include <fcntl.h>
+@@ -50,7 +52,9 @@ main (int argc, char *argv[])
+ 	int ret = -1;
+ 	char *udi;
+ 	char *device_file;
++#ifdef HAVE_LINUX_VIDEODEV_H
+ 	struct video_capability v1cap;
++#endif
+ 	struct v4l2_capability v2cap;
+ 	LibHalContext *ctx = NULL;
+ 	LibHalChangeSet *cset;
+@@ -107,7 +111,9 @@ main (int argc, char *argv[])
+ 			LIBHAL_FREE_DBUS_ERROR (&error);
+ 			libhal_device_add_capability (ctx, udi, "video4linux.radio", &error);
+ 		}
+-	} else {
++	}
++#ifdef HAVE_LINUX_VIDEODEV_H
++	else {
+ 		HAL_DEBUG (("ioctl VIDIOC_QUERYCAP failed"));
+ 
+ 		if (ioctl (fd, VIDIOCGCAP, &v1cap) == 0) {
+@@ -134,6 +140,7 @@ main (int argc, char *argv[])
+ 			HAL_DEBUG (("ioctl VIDIOCGCAP failed"));
+ 		}
+ 	}
++#endif
+ 
+ 	LIBHAL_FREE_DBUS_ERROR (&error);
+ 	libhal_device_commit_changeset (ctx, cset, &error);
+--
+cgit v0.9.0.2-2-gbebe
diff --git a/meta/recipes-support/hal/hal_0.5.14.bb b/meta/recipes-support/hal/hal_0.5.14.bb
index aa67ae6..858e685 100644
--- a/meta/recipes-support/hal/hal_0.5.14.bb
+++ b/meta/recipes-support/hal/hal_0.5.14.bb
@@ -1,6 +1,6 @@
 require hal.inc
 
-PR = "r4"
+PR = "r5"
 
 EXTRA_OECONF += "--with-linux-input-header=${STAGING_INCDIR}/linux/input.h"
 EXTRA_OEMAKE += "-e 'udevrulesdir=$(sysconfdir)/udev/rules.d'"
@@ -15,3 +15,5 @@ FILES_${PN} =+ "${bindir}/hal-disable-polling \
 
 SRC_URI[md5sum] = "e9163df591a6f38f59fdbfe33e73bf20"
 SRC_URI[sha256sum] = "323aacfa52f12def3b0d1e76456e34f027c345adc344aad19a8cc0c59c1a8d02"
+
+SRC_URI += "file://probe-video4linux.c.patch"
-- 
1.7.6.1




