Received: from mail-ea0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TbheC-0005fB-Hf
	for openembedded-core@lists.openembedded.org;
	Fri, 23 Nov 2012 02:01:37 +0100
Received: by mail-ea0-f175.google.com with SMTP id h11so3319904eaa.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Nov 2012 16:47:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=jrsBuib3nOC0/VqtiWbeEXE1EkV9lIvlgTUHrb6r3sU=;
	b=mqAs/UAPX7H91J53HTMXneZhXvBD85s2NU3xLLgJXwnfgi99EKFCMe2E+aGD1Qnx+X
	puPzG+nG9PgNpuYwzOyNrYeSgZKFWHPAiGSsu4MoIU1e8xyAhy5VE9vO5MbzI8EGRa+4
	g/zJUbmYJc3nLgvLImomqukxetlWRETaHTj585OpNMZS2TdiLlFLFCerxu31p+KuX0Fy
	vGsNGr5X6lSw0Z8VU8DaP9KisoVAjtyWL+0NxMJrlBeBIOqynmkJi29AzE/leKtr6Cz2
	qSNdiTlAcpdiikB4andiTpBovtCfagypNho19ST9dEHZCBZgmhVjPxFk0RU81/x8omCg
	n/Cw==
Received: by 10.14.205.65 with SMTP id i41mr7272479eeo.2.1353631649770;
	Thu, 22 Nov 2012 16:47:29 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id o49sm10285133eep.5.2012.11.22.16.47.29
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 22 Nov 2012 16:47:29 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 23 Nov 2012 01:47:15 +0100
Message-Id: <07143fcfc10a82a506227ab7979f13451c8efb12.1353631583.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.0
In-Reply-To: <cover.1353631583.git.Martin.Jansa@gmail.com>
References: <cover.1353631583.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1353631583.git.Martin.Jansa@gmail.com>
References: <cover.1353631583.git.Martin.Jansa@gmail.com>
Subject: [PATCH 1/4] xf86-video-omap: add xf86driproto dependency, drop --enable-neon and improve DESCRIPTION
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 23 Nov 2012 01:01:37 -0000

* xf86driproto was missing
* --enable-neon isn't supported by omap driver
* DESCRIPTION merged from meta-ti
  http://git.yoctoproject.org/cgit/cgit.cgi/meta-ti/tree/recipes-graphics/xorg-driver/xf86-video-omap_git.bb?id=410dc026f2ee24a2346e7563a83f0181c79809cf
* this driver also depends PACKAGECONFIG[glx] used in xserver-xorg,
  without it dri2.h sometimes isn't built (it is autodetected only
  when dri2proto is built before xserver-xorg) and without dri2.h it now
  passes do_configure but fails later in do_compile

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../xorg-driver/xf86-video-omap_git.bb             | 24 +++++++++++++++++-----
 1 file changed, 19 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-graphics/xorg-driver/xf86-video-omap_git.bb b/meta/recipes-graphics/xorg-driver/xf86-video-omap_git.bb
index 2371f96..a965859 100644
--- a/meta/recipes-graphics/xorg-driver/xf86-video-omap_git.bb
+++ b/meta/recipes-graphics/xorg-driver/xf86-video-omap_git.bb
@@ -2,19 +2,34 @@ require xorg-driver-video.inc
 
 SUMMARY = "X.Org X server -- Texas Instruments OMAP framebuffer driver"
 
-DESCRIPTION = "omap driver supports the basic Texas Instruments OMAP \
-framebuffer."
+SUMMARY = "X.Org X server -- TI OMAP integrated graphics chipsets driver"
+
+DESCRIPTION = "Open-source X.org graphics driver for TI OMAP graphics \
+Currently relies on a closed-source submodule for EXA acceleration on \
+the following chipsets: \
+  + OMAP3430 \
+  + OMAP3630 \
+  + OMAP4430 \
+  + OMAP4460 \
+  + OMAP5430 \
+  + OMAP5432 \
+\
+NOTE: this driver is work in progress..  you probably don't want to try \
+and use it yet.  The API/ABI between driver and kernel, and driver and \
+acceleration submodules is not stable yet.  This driver requires the \
+omapdrm kernel driver w/ GEM support. \
+"
 
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=10ce5de3b111315ea652a5f74ec0c602"
-DEPENDS += "virtual/libx11 libdrm"
+DEPENDS += "virtual/libx11 libdrm xf86driproto"
 
 RPROVIDES = "xf86-video-omapfb"
 RCONFLICTS = "xf86-video-omapfb"
 RREPLACES = "xf86-video-omapfb"
 
 SRCREV = "ae0394e687f1a77e966cf72f895da91840dffb8f"
-PR = "${INC_PR}.1"
+PR = "${INC_PR}.2"
 PV = "0.4.2+gitr${SRCPV}"
 
 SRC_URI = "git://anongit.freedesktop.org/xorg/driver/xf86-video-omap;protocol=git \
@@ -23,7 +38,6 @@ SRC_URI = "git://anongit.freedesktop.org/xorg/driver/xf86-video-omap;protocol=gi
 
 S = "${WORKDIR}/git"
 
-EXTRA_OECONF_armv7a = " --enable-neon "
 CFLAGS += " -I${STAGING_INCDIR}/xorg "
 
 # Use overlay 2 on omap3 to enable other apps to use overlay 1 (e.g. dmai or omapfbplay)
-- 
1.8.0



