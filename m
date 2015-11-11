Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f49.google.com (mail-wm0-f49.google.com [74.125.82.49])
	by mail.openembedded.org (Postfix) with ESMTP id D4E3A76B7C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Nov 2015 13:48:31 +0000 (UTC)
Received: by wmec201 with SMTP id c201so47340646wme.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Nov 2015 05:48:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel_com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=Ay7E3okzQ3AHoQ1FkjRqJ0pgLIyN7W8OHFdl4huqnKw=;
	b=LEIwG9VlPExDTCg3PGbD045yNnwDP2w1XnbjKqxKztzVmRfni5CBzMYjcZDar5voK/
	GsQ6RAp4hinQCYJGHJXxA84soybDRr7hozsFNVSKs8/P/QoW0v/pXRF8GrKGzXsQ8Rh4
	VkTajn9tFM/GQ+i0Qa+9crafeOo+7CzYHBhf9NtKn2MLmxIZ5ekFXWHV28LVKPXjB3mm
	YLdiPEVL15DXkRAipJ+6Rv7LpvUrSv1ZNCCTef6esokmCaFV/X9RxZR1shaVad8bDeWs
	fJZxGSsbRNY00AhJkCuyBKhOPt87KO72/+9PB4HOd9QCOtXGRFI/GjWxR7cEXUmFOUFC
	6LDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=Ay7E3okzQ3AHoQ1FkjRqJ0pgLIyN7W8OHFdl4huqnKw=;
	b=bfhXbBTsOo0Tol3NnPv1utnqPDP6lD56ePQWzG1LAivfcuD+lHdRNc2DJXTwi7ENGk
	pmGWkt30K21sTSCtQ6af9r8CvXee0kexk+wkPonDCvk7I9t7tGUQIxLFst9jFZ4WM6f6
	KHi+GhUv0WEajcTY++w1Hl4mtYKMkh4OFHoViyf7KOno60kKSWBF0uZmUzlebl6TjALE
	vmSPOdk1zanTqrZBf1nei5N3v17LmW1oVxk9ISHup4iTMZe+5v7mArVD/shyb4GofSQZ
	NTHydjKopr6Bg5jigXE4ejmOv5I6VLUisBCyzbA1AzJuE2ZWc6XK0W4WPiD4WUXOmbcM
	lZ3Q==
X-Gm-Message-State: ALoCoQlWw+dpnHFpO/xiCSBTHTDIv83I+nvIFiwxskZPLKq9hxVo7j9bkmN+Ua2yq/F7YvJpYbr6
X-Received: by 10.28.226.86 with SMTP id z83mr18484524wmg.77.1447249711197;
	Wed, 11 Nov 2015 05:48:31 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	c194sm9689912wmd.13.2015.11.11.05.48.30
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 11 Nov 2015 05:48:30 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 11 Nov 2015 13:40:13 +0000
Message-Id: <1447249213-28910-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH] libsdl2: require GLES when building Wayland support
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
X-List-Received-Date: Wed, 11 Nov 2015 13:48:32 -0000

The Wayland support requires GLES2 to be enabled as otherwise the EGL support
code in SDL2 isn't enabled.

| In file included from .../SDL2-2.0.3/src/video/wayland/SDL_waylandvideo.c:34:0:
| .../SDL2-2.0.3/src/video/wayland/SDL_waylandvideo.c: In function 'Wayland_CreateDevice':
| .../SDL2-2.0.3/src/video/wayland/SDL_waylandopengles.h:38:38: error: 'SDL_EGL_GetSwapInterval' undeclared (first use in this function)
|  #define Wayland_GLES_GetSwapInterval SDL_EGL_GetSwapInterval

Solve this by adding gles2 to the Wayland PACKAGECONFIG option.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-graphics/libsdl2/libsdl2_2.0.3.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/libsdl2/libsdl2_2.0.3.bb b/meta/recipes-graphics/libsdl2/libsdl2_2.0.3.bb
index 97f64f3..f138f97 100644
--- a/meta/recipes-graphics/libsdl2/libsdl2_2.0.3.bb
+++ b/meta/recipes-graphics/libsdl2/libsdl2_2.0.3.bb
@@ -39,7 +39,7 @@ PACKAGECONFIG ??= " \
     ${@bb.utils.contains('DISTRO_FEATURES', 'alsa', 'alsa', '', d)} \
     ${@bb.utils.contains('DISTRO_FEATURES', 'directfb', 'directfb', '', d)} \
     ${@bb.utils.contains('DISTRO_FEATURES', 'pulseaudio', 'pulseaudio', '', d)} \
-    ${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'wayland', '', d)} \
+    ${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'wayland gles2', '', d)} \
     ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11', '', d)} \
 "
 PACKAGECONFIG[alsa]       = "--enable-alsa --disable-alsatest,--disable-alsa,alsa-lib,"
-- 
2.1.4


