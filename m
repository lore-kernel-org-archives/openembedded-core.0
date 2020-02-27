Return-Path: <zboszor@pr.hu>
Received: from mail9.pr.hu (mail9.pr.hu [87.242.0.9])
	by mail.openembedded.org (Postfix) with ESMTP id 24A3B605DE
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Feb 2020 05:24:59 +0000 (UTC)
Received: from [2a02:808:3:101::5] (helo=mail.pr.hu)
	by frontdoor.pr.hu with esmtps
	(TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
	(envelope-from <zboszor@pr.hu>) id 1j7BfQ-00075n-C0
	for openembedded-core@lists.openembedded.org;
	Thu, 27 Feb 2020 06:25:00 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=pr.hu;
	s=pr20170203; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=Og6JFvTWAHyXVTETk0h0DZmpD+IzMsLr136RTddszWA=;
	b=Q9j0CGBt/4vpXJ5B66bpR36/is
	4jZO9Rg8cNHpj7/Epx4lAumUxKFo3MRj/U8Bk7bLrtP6MTFU+fq2kdCUMym0zy/Ciiu6wI8iVFeJ3
	7+ZVwYbI4NEyt8T1YQwyrfnXeIa17uQrR68xJfxv4/UQISWbfeDXAYXDuQU9rtSgcE12IPkDitq7c
	LIxX7nQHOjTaeaiVZYWN5kHXsS5kBYYekVGB787DhexMGtoCKFqNG/1bnVm2kPtcdW47EzlFR16pW
	VFlwoBhahMDP+vKNavMSuCX1BIjkLuvUAHLvQn1/MV8CdJ12+8y4xvf6T0lz85jmlHYDCAX1FYIQu
	nfoFWw1w==;
Received: from host-87-242-33-197.prtelecom.hu ([87.242.33.197]
	helo=zolilaptop.sicom.com) by mail.pr.hu with esmtpa (Exim 4.89)
	(envelope-from <zboszor@pr.hu>)
	id 1j7BfM-00020C-1q; Thu, 27 Feb 2020 06:24:58 +0100
From: =?UTF-8?q?B=C3=B6sz=C3=B6rm=C3=A9nyi=20Zolt=C3=A1n?= <zboszor@pr.hu>
To: openembedded-core@lists.openembedded.org
Date: Thu, 27 Feb 2020 06:24:45 +0100
Message-Id: <20200227052448.65435-2-zboszor@pr.hu>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200227052448.65435-1-zboszor@pr.hu>
References: <20200227052448.65435-1-zboszor@pr.hu>
MIME-Version: 1.0
X-Spam-Score: -1.9 (-)
X-Scan-Signature: 08c82354370271ea4c0136332ae213e8
X-Spam-Tracer: backend.mail.pr.hu -1.9 20200227052458Z
Subject: [PATCH v2 1/4] libva: Factor out base parts into an include file
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
X-List-Received-Date: Thu, 27 Feb 2020 05:25:04 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

To enable the VAAPI state tracker and drivers in mesa, it needs
libva.pc and the libva headers. At the recipe level, this would
create a circular dependency between libva and mesa.

This is a preparation step before introducing a new libva recipe
variant to break the circular dependency.

Signed-off-by: Böszörményi Zoltán <zboszor@pr.hu>
---
v2: The include file is not versioned, verbose commit message

 meta/recipes-graphics/libva/libva.inc      | 27 ++++++++++++++++++++++
 meta/recipes-graphics/libva/libva_2.6.1.bb | 27 ++--------------------
 2 files changed, 29 insertions(+), 25 deletions(-)
 create mode 100644 meta/recipes-graphics/libva/libva.inc

diff --git a/meta/recipes-graphics/libva/libva.inc b/meta/recipes-graphics/libva/libva.inc
new file mode 100644
index 0000000000..058581f7d1
--- /dev/null
+++ b/meta/recipes-graphics/libva/libva.inc
@@ -0,0 +1,27 @@
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
+
+SRC_URI = "https://github.com/intel/${BPN}/releases/download/${PV}/${BP}.tar.bz2"
+
+UPSTREAM_CHECK_URI = "https://github.com/intel/libva/releases"
+
+DEPENDS = "libdrm"
+
+inherit meson pkgconfig features_check
+
+REQUIRED_DISTRO_FEATURES = "opengl"
diff --git a/meta/recipes-graphics/libva/libva_2.6.1.bb b/meta/recipes-graphics/libva/libva_2.6.1.bb
index 92cea83bc1..b68fb27136 100644
--- a/meta/recipes-graphics/libva/libva_2.6.1.bb
+++ b/meta/recipes-graphics/libva/libva_2.6.1.bb
@@ -1,33 +1,10 @@
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
+require libva.inc
 
-HOMEPAGE = "https://01.org/linuxmedia/vaapi"
-BUGTRACKER = "https://github.com/intel/libva/issues"
-
-SECTION = "x11"
-LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=2e48940f94acb0af582e5ef03537800f"
-
-SRC_URI = "https://github.com/intel/${BPN}/releases/download/${PV}/${BP}.tar.bz2"
 SRC_URI[md5sum] = "aef13eb48e01a47d1416d97462a22a11"
 SRC_URI[sha256sum] = "6c57eb642d828af2411aa38f55dc10111e8c98976dbab8fd62e48629401eaea5"
 
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


