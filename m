Return-Path: <zboszor@pr.hu>
Received: from mail9.pr.hu (mail9.pr.hu [87.242.0.9])
	by mail.openembedded.org (Postfix) with ESMTP id 3A6E1615FD
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Feb 2020 14:08:16 +0000 (UTC)
Received: from [2a02:808:3:101::5] (helo=mail.pr.hu)
	by frontdoor.pr.hu with esmtps
	(TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
	(envelope-from <zboszor@pr.hu>) id 1j6xC3-0006ng-Cu
	for openembedded-core@lists.openembedded.org;
	Wed, 26 Feb 2020 14:57:43 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=pr.hu;
	s=pr20170203; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=0B6MFAMqpwquwOpi/avWzLGhmSknZ7PyueUsJvQnXKM=;
	b=LRJmr8eukPABhF83vLVadU+9n/
	vPNUEUy+1VDfY3y3xedoScM0nOjVqJohvvnF1ogSnec55rer6yizFbJcNOqgUdt11/nDcbV3o3JF7
	Y6X8vFJM6mZv/pggGycw0+KjaQTzorpEBcFGbAq/VdP4CfEaDqJUZv6J7AEkPm1iFo7nRUG0eVrHh
	99MmnuQi29r2jZ7lfzmk2ZvgeaDvCb8WoPIACoiFBbZAdDH4QxhyUZ7xqzUSGbQmka+/eX5Y98TOh
	prS40LggtPh9mC2dzrCGeGrNlvD/TOE/hWmidTlYCX8+azjhopMSW83V3SABonl9rDJjBbRkTBO3e
	QLNwSegw==;
Received: from host-87-242-33-197.prtelecom.hu ([87.242.33.197]
	helo=zolilaptop.sicom.com) by mail.pr.hu with esmtpa (Exim 4.89)
	(envelope-from <zboszor@pr.hu>)
	id 1j6xBz-0007hR-3H; Wed, 26 Feb 2020 14:57:41 +0100
From: =?UTF-8?q?B=C3=B6sz=C3=B6rm=C3=A9nyi=20Zolt=C3=A1n?= <zboszor@pr.hu>
To: openembedded-core@lists.openembedded.org
Date: Wed, 26 Feb 2020 14:57:12 +0100
Message-Id: <20200226135716.49255-1-zboszor@pr.hu>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
X-Spam-Score: -1.9 (-)
X-Scan-Signature: f16ceeb48273012bc971706f5906bca3
X-Spam-Tracer: backend.mail.pr.hu -1.9 20200226135741Z
Subject: [PATCH 1/5] libva: Split out the base parts into an include file
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
X-List-Received-Date: Wed, 26 Feb 2020 14:08:16 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Böszörményi Zoltán <zboszor@pr.hu>
---
 meta/recipes-graphics/libva/libva-2.6.1.inc | 30 ++++++++++++++++++++
 meta/recipes-graphics/libva/libva_2.6.1.bb  | 31 ++-------------------
 2 files changed, 32 insertions(+), 29 deletions(-)
 create mode 100644 meta/recipes-graphics/libva/libva-2.6.1.inc

diff --git a/meta/recipes-graphics/libva/libva-2.6.1.inc b/meta/recipes-graphics/libva/libva-2.6.1.inc
new file mode 100644
index 0000000000..ca1386d80b
--- /dev/null
+++ b/meta/recipes-graphics/libva/libva-2.6.1.inc
@@ -0,0 +1,30 @@
+SUMMARY = "Video Acceleration (VA) API for Linux"
+DESCRIPTION = "Video Acceleration API (VA API) is a library (libVA) \
+and API specification which enables and provides access to graphics \
+hardware (GPU) acceleration for video processing on Linux and UNIX \
+based operating systems. Accelerated processing includes video \
+decoding, video encoding, subpicture blending and rendering. The \
+specification was originally designed by Intel for its GMA (Graphics \
+Media Accelerator) series of GPU hardware, the API is however not \
+limited to GPUs or Intel specific hardware, as other hardware and \
+manufacturers can also freely use this API for hardware accelerated \
+video decoding."
+
+HOMEPAGE = "https://01.org/linuxmedia/vaapi"
+BUGTRACKER = "https://github.com/intel/libva/issues"
+
+SECTION = "x11"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://COPYING;md5=2e48940f94acb0af582e5ef03537800f"
+
+SRC_URI = "https://github.com/intel/${BPN}/releases/download/${PV}/${BP}.tar.bz2"
+SRC_URI[md5sum] = "aef13eb48e01a47d1416d97462a22a11"
+SRC_URI[sha256sum] = "6c57eb642d828af2411aa38f55dc10111e8c98976dbab8fd62e48629401eaea5"
+
+UPSTREAM_CHECK_URI = "https://github.com/intel/libva/releases"
+
+DEPENDS = "libdrm"
+
+inherit meson pkgconfig features_check
+
+REQUIRED_DISTRO_FEATURES = "opengl"
diff --git a/meta/recipes-graphics/libva/libva_2.6.1.bb b/meta/recipes-graphics/libva/libva_2.6.1.bb
index 92cea83bc1..af4c1c98ab 100644
--- a/meta/recipes-graphics/libva/libva_2.6.1.bb
+++ b/meta/recipes-graphics/libva/libva_2.6.1.bb
@@ -1,33 +1,6 @@
-SUMMARY = "Video Acceleration (VA) API for Linux"
-DESCRIPTION = "Video Acceleration API (VA API) is a library (libVA) \
-and API specification which enables and provides access to graphics \
-hardware (GPU) acceleration for video processing on Linux and UNIX \
-based operating systems. Accelerated processing includes video \
-decoding, video encoding, subpicture blending and rendering. The \
-specification was originally designed by Intel for its GMA (Graphics \
-Media Accelerator) series of GPU hardware, the API is however not \
-limited to GPUs or Intel specific hardware, as other hardware and \
-manufacturers can also freely use this API for hardware accelerated \
-video decoding."
+require libva-${PV}.inc
 
-HOMEPAGE = "https://01.org/linuxmedia/vaapi"
-BUGTRACKER = "https://github.com/intel/libva/issues"
-
-SECTION = "x11"
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://COPYING;md5=2e48940f94acb0af582e5ef03537800f"
-
-SRC_URI = "https://github.com/intel/${BPN}/releases/download/${PV}/${BP}.tar.bz2"
-SRC_URI[md5sum] = "aef13eb48e01a47d1416d97462a22a11"
-SRC_URI[sha256sum] = "6c57eb642d828af2411aa38f55dc10111e8c98976dbab8fd62e48629401eaea5"
-
-UPSTREAM_CHECK_URI = "https://github.com/intel/libva/releases"
-
-DEPENDS = "libdrm virtual/mesa"
-
-inherit meson pkgconfig features_check
-
-REQUIRED_DISTRO_FEATURES = "opengl"
+DEPENDS += "virtual/mesa"
 
 PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'wayland x11', d)}"
 PACKAGECONFIG[x11] = "-Dwith_x11=yes, -Dwith_x11=no,virtual/libx11 libxext libxfixes"
-- 
2.24.1


