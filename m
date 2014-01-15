Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-ea0-f175.google.com (mail-ea0-f175.google.com
	[209.85.215.175])
	by mail.openembedded.org (Postfix) with ESMTP id 3C2676B4F7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Jan 2014 10:11:17 +0000 (UTC)
Received: by mail-ea0-f175.google.com with SMTP id z10so343967ead.20
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Jan 2014 02:11:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:mime-version:content-type
	:content-transfer-encoding;
	bh=iqUqfQ5iISVT1OzcHRoSbnr5oWnh1y46yI9053hUm/o=;
	b=E9AZjqIxqeeCGPSxk9ZDf7XnLO/jQQ8F62ajH/cGDINW1aiIfTXe/+w3Ya3arzcqup
	+YIwVS8Ziq5PhLV1fxQM+q84HZwW1mC/8QqTuWEJTlPn9RkNIO5eC3DVH7onZXbIVkrR
	QoPXfBmtUZW3ceMKmOSPlHlVhT/wSmHP+yWy+tpSUJKiJje/pUGqoDEgNNrqrRHx4WAT
	l0zvD//hzb2jh62sRWFlC5RCljwttpL4NzxC/DNrGP6hAl8+ASECR59YBIuESQu5Rrzg
	ns2AadGy8h1daIacqNu32WAnb2/Lkg4dTnjMtCna1qgQUrC4tXQzEmgZN5Ho+PUuLy35
	lFBQ==
X-Received: by 10.15.32.73 with SMTP id z49mr2364922eeu.27.1389780677889;
	Wed, 15 Jan 2014 02:11:17 -0800 (PST)
Received: from localhost.localdomain (ip-109-91-251-248.unitymediagroup.de.
	[109.91.251.248])
	by mx.google.com with ESMTPSA id v1sm8933076eef.9.2014.01.15.02.11.16
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 15 Jan 2014 02:11:17 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 15 Jan 2014 11:11:10 +0100
Message-Id: <1389780670-29935-1-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Subject: [PATCH] weston: cleanup mesa depends
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
X-List-Received-Date: Wed, 15 Jan 2014 10:11:19 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

* do not depend by default
* depend on virtual/mesa instead of mesa

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta/recipes-graphics/wayland/weston_1.3.1.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-graphics/wayland/weston_1.3.1.bb b/meta/recipes-graphics/wayland/weston_1.3.1.bb
index d97f6af..8e555ee 100644
--- a/meta/recipes-graphics/wayland/weston_1.3.1.bb
+++ b/meta/recipes-graphics/wayland/weston_1.3.1.bb
@@ -15,7 +15,7 @@ SRC_URI[sha256sum] = "f7141334b141ae1a6435bd03bfdb01b7fb628f39259164f201e7e71c8d
 inherit autotools pkgconfig useradd
 
 DEPENDS = "libxkbcommon gdk-pixbuf pixman cairo glib-2.0 jpeg"
-DEPENDS += "wayland virtual/mesa virtual/egl pango"
+DEPENDS += "wayland virtual/egl pango"
 
 EXTRA_OECONF = "--enable-setuid-install \
                 --disable-tablet-shell \
@@ -37,9 +37,9 @@ PACKAGECONFIG ??= "${@base_contains('DISTRO_FEATURES', 'wayland', 'kms wayland',
 # Compositor choices
 #
 # Weston on KMS
-PACKAGECONFIG[kms] = "--enable-drm-compositor,--disable-drm-compositor,drm udev mesa mtdev"
+PACKAGECONFIG[kms] = "--enable-drm-compositor,--disable-drm-compositor,drm udev virtual/mesa mtdev"
 # Weston on Wayland (nested Weston)
-PACKAGECONFIG[wayland] = "--enable-wayland-compositor,--disable-wayland-compositor,mesa"
+PACKAGECONFIG[wayland] = "--enable-wayland-compositor,--disable-wayland-compositor,virtual/mesa"
 # Weston on X11
 PACKAGECONFIG[x11] = "--enable-x11-compositor,--disable-x11-compositor,virtual/libx11 libxcb libxcb libxcursor cairo"
 # Headless Weston
-- 
1.8.3.1


