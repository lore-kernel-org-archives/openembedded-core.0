Received: from mail9.pr.hu (mail9.pr.hu [87.242.0.9])
 by mx.groups.io with SMTP id smtpd.web11.5941.1588858409300848832
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 May 2020 06:33:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pr.hu header.s=pr20170203 header.b=Ko6LeBnW;
 spf=pass (domain: pr.hu, ip: 87.242.0.9, mailfrom: zboszor@pr.hu)
Received: from [2a02:808:3:101::5] (helo=mail.pr.hu)
	by frontdoor.pr.hu with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.89)
	(envelope-from <zboszor@pr.hu>)
	id 1jWgeV-0005yS-Sv
	for openembedded-core@lists.openembedded.org; Thu, 07 May 2020 15:33:27 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=pr.hu;
	s=pr20170203; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=oCm+56yEFskIlYDpdMHO/PUGsTCogFtlGIO8ccm/h+I=; b=Ko6LeBnWqQWNkx6eHywNrMQOoh
	cAxwUeNwU4LaTlyNpwlZbq0YaMWdTsuHoJ8GC5CwjK0sQ/K3KlkIzJsXtITxz55HXLJzjcgx6X/03
	6oGB2MTkY9vJdKno4TLKhFONWFl1lWVnA2qMU1OMDkpcEirF9NXHYWRVU1ySUpDEwLSvyBruznqf7
	BjdUyLNvoYFK2Ew6JIxM9CFS4oicvh4VYLUiepti0+XOLwnMfOcvPPccjoQKbNf+Jzwf/sp+V4CSt
	Zh681WBhR9prpOtk9rZzn0py525uJ8U4oOirG2htwS5kGd6EN/avy+L0kPjaEoxYEex0G5g/aEcGx
	rtMyiXEA==;
Received: from host-87-242-33-197.prtelecom.hu ([87.242.33.197] helo=zolilaptop.sicom.com)
	by mail.pr.hu with esmtpa (Exim 4.89)
	(envelope-from <zboszor@pr.hu>)
	id 1jWgeR-00055M-Ii; Thu, 07 May 2020 15:33:25 +0200
From: "Zoltan Boszormenyi" <zboszor@pr.hu>
To: openembedded-core@lists.openembedded.org
Cc: =?UTF-8?q?B=C3=B6sz=C3=B6rm=C3=A9nyi=20Zolt=C3=A1n?= <zboszor@pr.hu>
Subject: [PATCH v3 1/4] libva: Factor out base parts into an include file
Date: Thu,  7 May 2020 15:32:58 +0200
Message-Id: <20200507133301.4336-2-zboszor@pr.hu>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200507133301.4336-1-zboszor@pr.hu>
References: <20200227052448.65435-1-zboszor@pr.hu>
 <20200507133301.4336-1-zboszor@pr.hu>
MIME-Version: 1.0
X-Spam-Score: -1.0 (-)
X-Scan-Signature: dbe59d53eea3b47fe6629620c210aed7
X-Spam-Tracer: backend.mail.pr.hu -1.0 20200507133325Z
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

To enable the VAAPI state tracker and drivers in mesa, it needs
libva.pc and the libva headers. To enable GLX support in libva,
it needs mesa to be compiled first. At the recipe level, this
would create a circular dependency between libva and mesa.

This is a preparation step before introducing a new libva recipe
variant to break the circular dependency.

Signed-off-by: Böszörményi Zoltán <zboszor@pr.hu>
---
v2: The include file is not versioned, verbose commit message
v3: Rebased to current master

 meta/recipes-graphics/libva/libva.inc      | 25 ++++++++++++++++++++++
 meta/recipes-graphics/libva/libva_2.6.1.bb | 25 +---------------------
 2 files changed, 26 insertions(+), 24 deletions(-)
 create mode 100644 meta/recipes-graphics/libva/libva.inc

diff --git a/meta/recipes-graphics/libva/libva.inc b/meta/recipes-graphics/libva/libva.inc
new file mode 100644
index 0000000000..e03451240c
--- /dev/null
+++ b/meta/recipes-graphics/libva/libva.inc
@@ -0,0 +1,25 @@
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
diff --git a/meta/recipes-graphics/libva/libva_2.6.1.bb b/meta/recipes-graphics/libva/libva_2.6.1.bb
index 071be345d2..e8cb8678bc 100644
--- a/meta/recipes-graphics/libva/libva_2.6.1.bb
+++ b/meta/recipes-graphics/libva/libva_2.6.1.bb
@@ -1,32 +1,9 @@
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
-DEPENDS = "libdrm"
-
-inherit meson pkgconfig features_check
-
 PACKAGECONFIG ??= " \
     ${@bb.utils.contains('DISTRO_FEATURES', 'x11 opengl', 'glx', '', d)} \
     ${@bb.utils.filter('DISTRO_FEATURES', 'x11 wayland', d)} \
-- 
2.26.2

