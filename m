Return-Path: <ross.burton@intel.com>
Received: from mail-wi0-f174.google.com (mail-wi0-f174.google.com
	[209.85.212.174])
	by mail.openembedded.org (Postfix) with ESMTP id C35696A96A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Jun 2013 16:12:02 +0000 (UTC)
Received: by mail-wi0-f174.google.com with SMTP id k10so2006066wiv.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Jun 2013 09:12:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references:x-gm-message-state;
	bh=4qdwLi+pIhcHCyZRgsVLDYXQTqhBgaq6btqBnH+srhA=;
	b=RXJbz2s/JJENDpwhVUepQVcwl7ArTK+3y8mY7SQwevbNSHZhCY1CWODcKkiNeJ8XH5
	d1wZezz0ut6CZZS1x77ntWqxxdUt11i9ZXWkXOV4j/tGmjup7uOD2NrRkCGqXLRDBUSx
	KQw+v1QjKW6takcxg8mFEZeB344c/jeJ5+v5GNOxj1i3yGWiVVntDZaXOynhiY4vMTVY
	oF3TsHMvFyxTZ/5dL3kIqjsF9taPp7bn0EAQCUG7oYbWSp4BNWHzQwbJMThtUbfzLWLb
	P4RwPCVL+tMRasUVJjma06ZXraPz+tV7lK8f0UfOJ7u8TyNKis1TeZ6OVRtVmop8MtKA
	1b6Q==
X-Received: by 10.180.100.35 with SMTP id ev3mr103687wib.12.1371744723481;
	Thu, 20 Jun 2013 09:12:03 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id k10sm1508166wia.4.2013.06.20.09.12.02
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 20 Jun 2013 09:12:02 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 20 Jun 2013 17:08:26 +0100
Message-Id: <88ef57b8f20c548e835fe1487843e6e8d1c4d99c.1371744428.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1371744428.git.ross.burton@intel.com>
References: <cover.1371744428.git.ross.burton@intel.com>
In-Reply-To: <cover.1371744428.git.ross.burton@intel.com>
References: <cover.1371744428.git.ross.burton@intel.com>
X-Gm-Message-State: ALoCoQmWYiw3YhFjCuVocYsZ/vZc4Z2eAHoMnvrXb1IJYWCPBZ9P9mDGgwDaDrVmla9jEddSU/T0
Subject: [PATCH 4/7] weston: move mtdev dependency to the DRM backend, where it belongs
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
X-List-Received-Date: Thu, 20 Jun 2013 16:12:03 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-graphics/wayland/weston_1.1.0.bb |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-graphics/wayland/weston_1.1.0.bb b/meta/recipes-graphics/wayland/weston_1.1.0.bb
index ee33be6..7327b98 100644
--- a/meta/recipes-graphics/wayland/weston_1.1.0.bb
+++ b/meta/recipes-graphics/wayland/weston_1.1.0.bb
@@ -17,7 +17,7 @@ SRC_URI[sha256sum] = "e7715d2c731f77a729c994a599ffdaebac1307b2dd9336136706869fa5
 
 inherit autotools pkgconfig useradd
 
-DEPENDS = "libxkbcommon gdk-pixbuf pixman cairo glib-2.0 mtdev jpeg"
+DEPENDS = "libxkbcommon gdk-pixbuf pixman cairo glib-2.0 jpeg"
 DEPENDS += "wayland mesa virtual/egl"
 
 EXTRA_OECONF = "--disable-android-compositor \
@@ -40,7 +40,7 @@ PACKAGECONFIG ??= "${@base_contains('DISTRO_FEATURES', 'wayland', 'kms wayland',
 # Compositor choices
 #
 # Weston on KMS
-PACKAGECONFIG[kms] = "--enable-drm-compositor --enable-weston-launch,--disable-drm-compositor --disable-weston-launch,drm udev mesa libpam"
+PACKAGECONFIG[kms] = "--enable-drm-compositor --enable-weston-launch,--disable-drm-compositor --disable-weston-launch,drm udev mesa mtdev libpam"
 # Weston on Wayland (nested Weston)
 PACKAGECONFIG[wayland] = "--enable-wayland-compositor,--disable-wayland-compositor,mesa"
 # Weston on X11
-- 
1.7.10.4


