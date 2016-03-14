Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f53.google.com (mail-wm0-f53.google.com [74.125.82.53])
	by mail.openembedded.org (Postfix) with ESMTP id BAE9762135
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Mar 2016 20:35:38 +0000 (UTC)
Received: by mail-wm0-f53.google.com with SMTP id l68so125021916wml.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Mar 2016 13:35:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=U8GIiMJHVFPT+ViG4Qa7TezCvUC/itGiGTGgD+8ASuM=;
	b=s63Nq5wCO7dwCtyx/FmAJccepquvmhkaE+N9SMdRCtI69Gaa3LLsIyZbP8lFRePbXD
	52328urlRvyOjnP1XzrIuNun4F1rn2+oxpmPPwp294Shsas+EIrFX9DLYgSun0vFE4/6
	iQ5D930e3dvO1hT7+aPljcbP1un379UJDRMBZZx0kInm7YU+Wzt3ghYGoRauVu+NzNLH
	fCKj5E/ZN5yE4nNpwi9jvBan94/RsdVt+LmMZ7SqvvjsTkEqcQzp0HhBq0z2OGgImrN1
	NEdChWOh3v26FpY4W5jpcPMrdpvdUTXLOn8Is6YTH6UuJhZYQ6lOGw/sSPeR6mDIHNrS
	MKQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=U8GIiMJHVFPT+ViG4Qa7TezCvUC/itGiGTGgD+8ASuM=;
	b=Fr9gRQs6+gNH+Be1ZJmjnie1ux03JXyJdBA8DfUCpeKxmb5sswjBHPV5DlUCLX8vd8
	E4d6gNuJbg07fF1uqz5nfJslgWqdvKI/2c/Lq4baXZWGcFHlDDwIK6AtOQRAsJqolh+/
	Lr64UK6jPO0XM9qhFybF+lOhKBoj7VYhvPmuUAq3NW53VMw1utXG7GG0AmZmuB00ejuO
	Tr/Yiuo6JtDDdga+sC7AGTglAV8K+u0X/n1pvCrOfkWKXecLSp7hiLq12zzSamfXcqP+
	WGJ2ScdsZeI2lWBKFN+JvNvWZEsUsSYbafLV3v5BjGzkbqHXsBMD7NjY9AGuqj2EZqeD
	Vkyw==
X-Gm-Message-State: AD7BkJITy/uHyyd4TSQ0sPyQcY045uUXDOOcx2fGH1dKk2agSHi8Z+sdCcNV8v8zco15BsLM
X-Received: by 10.28.4.75 with SMTP id 72mr19870094wme.78.1457987738681;
	Mon, 14 Mar 2016 13:35:38 -0700 (PDT)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id 63sm17756007wms.1.2016.03.14.13.35.37
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 14 Mar 2016 13:35:38 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 14 Mar 2016 20:35:35 +0000
Message-Id: <1457987735-23523-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.7.0
Subject: [PATCH][jethro] xorg-lib: allow native building without x11 DISTRO_FEATURES
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
X-List-Received-Date: Mon, 14 Mar 2016 20:35:40 -0000

The Xorg libraries use REQUIRED_DISTRO_FEATURES to stop building on
distributions without the x11 feature but this stops people building native
tooling that uses libX11, such as libsdl-native.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-graphics/xorg-lib/libxcb.inc          | 1 +
 meta/recipes-graphics/xorg-lib/xorg-lib-common.inc | 1 +
 2 files changed, 2 insertions(+)

diff --git a/meta/recipes-graphics/xorg-lib/libxcb.inc b/meta/recipes-graphics/xorg-lib/libxcb.inc
index e40ae77..b02efd2 100644
--- a/meta/recipes-graphics/xorg-lib/libxcb.inc
+++ b/meta/recipes-graphics/xorg-lib/libxcb.inc
@@ -26,6 +26,7 @@ inherit autotools pkgconfig pythonnative distro_features_check
 
 # The libxau and others requires x11 in DISTRO_FEATURES
 REQUIRED_DISTRO_FEATURES = "x11"
+REQUIRED_DISTRO_FEATURES_class-native = ""
 
 python populate_packages_prepend () {
     do_split_packages(d, '${libdir}', '^libxcb-(.*)\.so\..*$', 'libxcb-%s', 'XCB library module for %s', allow_links=True)
diff --git a/meta/recipes-graphics/xorg-lib/xorg-lib-common.inc b/meta/recipes-graphics/xorg-lib/xorg-lib-common.inc
index 09df010..6f4e444 100644
--- a/meta/recipes-graphics/xorg-lib/xorg-lib-common.inc
+++ b/meta/recipes-graphics/xorg-lib/xorg-lib-common.inc
@@ -24,3 +24,4 @@ UNKNOWN_CONFIGURE_WHITELIST += "--enable-malloc0returnsnull --disable-malloc0ret
 "
 
 REQUIRED_DISTRO_FEATURES ?= "x11"
+REQUIRED_DISTRO_FEATURES_class-native = ""
-- 
2.7.0


