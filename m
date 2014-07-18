Return-Path: <nicolas.dechesne@linaro.org>
Received: from mail-wg0-f51.google.com (mail-wg0-f51.google.com [74.125.82.51])
	by mail.openembedded.org (Postfix) with ESMTP id 99A8570245
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Jul 2014 10:33:06 +0000 (UTC)
Received: by mail-wg0-f51.google.com with SMTP id b13so3289125wgh.10
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Jul 2014 03:33:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=JypGZr+HkatDvJQsff12vnRaxrzLfKaUUrWMRyHdTP4=;
	b=RhUT2txo2b1ShkIuvxvSeALItX1gxqBBd6Vh5VRp2AXBXdoOBCzxnB2gk4tLznFCXL
	HQglNjEoOFqcD2wHrzDmzKuG8YiVDGE5TMn4M7vw9jfpC2zIM/P0xum4wgCfrp2HT/L0
	oJ2YniwUSbuoQD+ijlAJZJ6qajIjVmm2oZfxPr+wScyExn3IkRhDQ6ykyxUn3DIA5d4S
	AYkcIONH/MzqZOD53MTonc3X4OiCZCFPgWrahWLjCoyh5HRljvPavvzNOYVxGY7mN9h7
	8ZnRrwR8kU7Auo4/YO41OcMrXsVrtO3B00OvCwyKmnTuEADfLl7fd7Za9AxZ7Io7WDu0
	X7UQ==
X-Gm-Message-State: ALoCoQnN6zlUwo86GCh7In9PaXZuqKUGUQZx7WS+jrhFRQldS5ku1YgR9YnP6kdmX8ZQQksmTmmS
X-Received: by 10.180.89.143 with SMTP id bo15mr6274265wib.78.1405679587147;
	Fri, 18 Jul 2014 03:33:07 -0700 (PDT)
Received: from localhost.localdomain (gau06-1-78-243-126-63.fbx.proxad.net.
	[78.243.126.63])
	by mx.google.com with ESMTPSA id bg2sm5188043wib.21.2014.07.18.03.33.05
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 18 Jul 2014 03:33:06 -0700 (PDT)
From: Nicolas Dechesne <nicolas.dechesne@linaro.org>
To: openembedded-core@lists.openembedded.org
Date: Fri, 18 Jul 2014 12:33:01 +0200
Message-Id: <1405679581-32482-1-git-send-email-nicolas.dechesne@linaro.org>
X-Mailer: git-send-email 2.0.1
Cc: Nicolas Dechesne <nicolas.dechesne@linaro.org>, patches@linaro.org
Subject: [PATCH] libdrm: enable freedreno experimental support
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
X-List-Received-Date: Fri, 18 Jul 2014 10:33:10 -0000

The freedreno project is a free and open source linux driver for the 2D/3D GPUs
in Qualcomm snapdragon SoCs.

Support for freedreno in libdrm was added around 2.4.43.

Signed-off-by: Nicolas Dechesne <nicolas.dechesne@linaro.org>
---
 meta/recipes-graphics/drm/libdrm.inc | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-graphics/drm/libdrm.inc b/meta/recipes-graphics/drm/libdrm.inc
index 1b2ffeb..5ec6307 100644
--- a/meta/recipes-graphics/drm/libdrm.inc
+++ b/meta/recipes-graphics/drm/libdrm.inc
@@ -21,14 +21,15 @@ inherit autotools pkgconfig
 
 EXTRA_OECONF += "--disable-cairo-tests \
                  --enable-omap-experimental-api \
+                 --enable-freedreno-experimental-api \
                  --enable-install-test-programs \
                 "
 ALLOW_EMPTY_${PN}-drivers = "1"
 PACKAGES =+ "${PN}-tests ${PN}-drivers ${PN}-radeon ${PN}-nouveau ${PN}-omap \
-             ${PN}-intel ${PN}-exynos ${PN}-kms"
+             ${PN}-intel ${PN}-exynos ${PN}-kms ${PN}-freedreno"
 
 RRECOMMENDS_${PN}-drivers = "${PN}-radeon ${PN}-nouveau ${PN}-omap ${PN}-intel \
-                             ${PN}-exynos"
+                             ${PN}-exynos ${PN}-freedreno"
 
 FILES_${PN}-tests = "${bindir}/dr* ${bindir}/mode* ${bindir}/*test"
 FILES_${PN}-radeon = "${libdir}/libdrm_radeon.so.*"
@@ -37,3 +38,4 @@ FILES_${PN}-omap = "${libdir}/libdrm_omap.so.*"
 FILES_${PN}-intel = "${libdir}/libdrm_intel.so.*"
 FILES_${PN}-exynos = "${libdir}/libdrm_exynos.so.*"
 FILES_${PN}-kms = "${libdir}/libkms*.so.*"
+FILES_${PN}-freedreno = "${libdir}/libdrm_freedreno.so.*"
-- 
2.0.1


