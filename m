Received: from fanzine.igalia.com (fanzine.igalia.com [178.60.130.6])
 by mx.groups.io with SMTP id smtpd.web11.2064.1632387963895338008
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Sep 2021 02:06:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@igalia.com header.s=20170329 header.b=gzRhkJAZ;
 spf=pass (domain: igalia.com, ip: 178.60.130.6, mailfrom: psaavedra@igalia.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; s=20170329;
	h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From; bh=K6sKxWXRsRNWahiAc3u6yvSXtbCWmAa92fGzucmzwCw=;
	b=gzRhkJAZdnrXiiJJSWeYlH0Iw8Dq3ojIf0Kc0gW8dxV+2dUBATs7XN6MNSLuPXOcjGCFrei08TYBJnpzdf9Ssqs4r9zmADhM5g0Wd8tkc0eLv4CmDM7z7PRUKQMXfW8x4U94p5MBch7LiuIymDhIFXGzD/J8kyGEKe2LpSQZo7klzSW4JTOuHnwOt5PV9IwdupVpAlaExPcjqaU+LkRF9oNY3pXbsvK5Z6IvBGEGOt7xLpiu58QnCcPOp0wMZCjita/a7RjXWCiTBsSLQsGHRPGjY2e7Ecs+UhvS4mvVYEs6FGy8mF925CPxajqqMWXwdqDRGNkKKvzQxl5rjBQB9w==;
Received: from 164.25.165.83.dynamic.reverse-mundo-r.com ([83.165.25.164] helo=golpe.local.igalia.com)
	by fanzine.igalia.com with esmtpsa 
	(Cipher TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim)
	id 1mTKg3-0001DO-Kn; Thu, 23 Sep 2021 11:05:59 +0200
From: "Pablo Saavedra Rodi?o" <psaavedra@igalia.com>
To: openembedded-core@lists.openembedded.org
Cc: Pablo Saavedra <psaavedra@igalia.com>
Subject: [hardknott][PATCH] mesa: Add patches for red label issues on video for VC4 and Freedreno
Date: Thu, 23 Sep 2021 11:05:47 +0200
Message-Id: <20210923090547.3260456-1-psaavedra@igalia.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

freedreno,v3d: YUV formats are supported as external-only dmabuf
modifiers.

This patch fix red label issues on video for Raspberry 4-64 Mesa VC4
driver and for iMX53 Adreno A200 GPU using the Mesa Freedreno driver

Issue was originally reported in meta-webkit [1] and later contributed
in Mesa [2]  where it was already merged in master.

* Commits for VC4 [3] had been nominated for stable 21.1 and already in
  21.2 (available in honister).
* Commit for Freedreno [4] also reported (not merged yet).

[1] https://github.com/Igalia/meta-webkit/issues/185
[2] https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/10524
[3] https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/10534
[4] https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/12991

Signed-off-by: Pablo Saavedra <psaavedra@igalia.com>
---
 ...rmats-are-supported-as-external-only.patch | 31 +++++++++++++++++
 ...at-is_dmabuf_modifier_supported-are-.patch | 32 +++++++++++++++++
 ...at-query_dmabuf_modifiers-are-extern.patch | 31 +++++++++++++++++
 ...OD_BROADCOM_SAND128-only-available-f.patch | 34 +++++++++++++++++++
 meta/recipes-graphics/mesa/mesa.inc           |  4 +++
 5 files changed, 132 insertions(+)
 create mode 100644 meta/recipes-graphics/mesa/files/0001-freedreno-YUV-formats-are-supported-as-external-only.patch
 create mode 100644 meta/recipes-graphics/mesa/files/0001-v3d-YUV-formats-at-is_dmabuf_modifier_supported-are-.patch
 create mode 100644 meta/recipes-graphics/mesa/files/0002-v3d-YUV-formats-at-query_dmabuf_modifiers-are-extern.patch
 create mode 100644 meta/recipes-graphics/mesa/files/0003-v3d-DRM_FORMAT_MOD_BROADCOM_SAND128-only-available-f.patch

diff --git a/meta/recipes-graphics/mesa/files/0001-freedreno-YUV-formats-are-supported-as-external-only.patch b/meta/recipes-graphics/mesa/files/0001-freedreno-YUV-formats-are-supported-as-external-only.patch
new file mode 100644
index 0000000000..92f4b40997
--- /dev/null
+++ b/meta/recipes-graphics/mesa/files/0001-freedreno-YUV-formats-are-supported-as-external-only.patch
@@ -0,0 +1,31 @@
+From e5b33a4b744a3114ff054ae577ac7802d9221490 Mon Sep 17 00:00:00 2001
+From: Pablo Saavedra <psaavedra@igalia.com>
+Date: Thu, 23 Sep 2021 10:23:56 +0200
+Subject: [PATCH] freedreno: YUV formats are supported as external-only dmabuf
+ modifiers
+
+Based on https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/10524
+
+Co-authored-by: Alberto Garcia <berto@igalia.com>
+Co-authored-by: Jose Maria Casanova Crespo <jmcasanova@igalia.com>
+Signed-off-by: Pablo Saavedra <psaavedra@igalia.com>
+---
+ src/gallium/drivers/freedreno/freedreno_screen.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/gallium/drivers/freedreno/freedreno_screen.c b/src/gallium/drivers/freedreno/freedreno_screen.c
+index a9cd0e2..dc2b79d 100644
+--- a/src/gallium/drivers/freedreno/freedreno_screen.c
++++ b/src/gallium/drivers/freedreno/freedreno_screen.c
+@@ -804,7 +804,7 @@ fd_screen_query_dmabuf_modifiers(struct pipe_screen *pscreen,
+ 			modifiers[num] = screen->supported_modifiers[i];
+ 
+ 		if (external_only)
+-			external_only[num] = 0;
++			external_only[num] = util_format_is_yuv(format);
+ 
+ 		num++;
+ 	}
+-- 
+2.30.2
+
diff --git a/meta/recipes-graphics/mesa/files/0001-v3d-YUV-formats-at-is_dmabuf_modifier_supported-are-.patch b/meta/recipes-graphics/mesa/files/0001-v3d-YUV-formats-at-is_dmabuf_modifier_supported-are-.patch
new file mode 100644
index 0000000000..c2e5462dd1
--- /dev/null
+++ b/meta/recipes-graphics/mesa/files/0001-v3d-YUV-formats-at-is_dmabuf_modifier_supported-are-.patch
@@ -0,0 +1,32 @@
+From 389bffa0981bba60f9d081063c150fb17e497c4a Mon Sep 17 00:00:00 2001
+From: Jose Maria Casanova Crespo <jmcasanova@igalia.com>
+Date: Thu, 29 Apr 2021 18:15:27 +0200
+Subject: [PATCH] v3d: YUV formats at is_dmabuf_modifier_supported are
+ external_only
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+This fixes Issue https://github.com/Igalia/meta-webkit/issues/185
+"Issue Raspberry 4-64 + Mesa VC4 driver + Gstreamer = red Label on video"
+
+Fixes: 6ee10ab3de86 "gallium: Add pipe_screen::is_dmabuf_modifier_supported"
+Reviewed-by: Alejandro Piñeiro <apinheiro@igalia.com>
+Part-of: <https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/10524>
+---
+ src/gallium/drivers/v3d/v3d_screen.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/gallium/drivers/v3d/v3d_screen.c b/src/gallium/drivers/v3d/v3d_screen.c
+index 4f69c20..a5c94db 100644
+--- a/src/gallium/drivers/v3d/v3d_screen.c
++++ b/src/gallium/drivers/v3d/v3d_screen.c
+@@ -670,7 +670,7 @@ v3d_screen_is_dmabuf_modifier_supported(struct pipe_screen *pscreen,
+         for (i = 0; i < ARRAY_SIZE(v3d_available_modifiers); i++) {
+                 if (v3d_available_modifiers[i] == modifier) {
+                         if (external_only)
+-                                *external_only = false;
++                                *external_only = util_format_is_yuv(format);
+ 
+                         return true;
+                 }
diff --git a/meta/recipes-graphics/mesa/files/0002-v3d-YUV-formats-at-query_dmabuf_modifiers-are-extern.patch b/meta/recipes-graphics/mesa/files/0002-v3d-YUV-formats-at-query_dmabuf_modifiers-are-extern.patch
new file mode 100644
index 0000000000..dfbe994048
--- /dev/null
+++ b/meta/recipes-graphics/mesa/files/0002-v3d-YUV-formats-at-query_dmabuf_modifiers-are-extern.patch
@@ -0,0 +1,31 @@
+From a5f74e140cce671dd9a04d3b3541cd3faf91916b Mon Sep 17 00:00:00 2001
+From: Jose Maria Casanova Crespo <jmcasanova@igalia.com>
+Date: Thu, 29 Apr 2021 18:37:25 +0200
+Subject: [PATCH] v3d: YUV formats at query_dmabuf_modifiers are external_only
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+This fixes Issue https://github.com/Igalia/meta-webkit/issues/185
+"Issue Raspberry 4-64 + Mesa VC4 driver + Gstreamer = red Label on video"
+
+Fixes: 95c4f0f91098 "v3d: Enables DRM_FORMAT_MOD_BROADCOM_SAND128 support"
+Reviewed-by: Alejandro Piñeiro <apinheiro@igalia.com>
+Part-of: <https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/10524>
+---
+ src/gallium/drivers/v3d/v3d_screen.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/gallium/drivers/v3d/v3d_screen.c b/src/gallium/drivers/v3d/v3d_screen.c
+index a5c94db..edde17d 100644
+--- a/src/gallium/drivers/v3d/v3d_screen.c
++++ b/src/gallium/drivers/v3d/v3d_screen.c
+@@ -655,7 +655,7 @@ v3d_screen_query_dmabuf_modifiers(struct pipe_screen *pscreen,
+         for (i = 0; i < *count; i++) {
+                 modifiers[i] = v3d_available_modifiers[i];
+                 if (external_only)
+-                        external_only[i] = false;
++                        external_only[i] = util_format_is_yuv(format);
+        }
+ }
+ 
diff --git a/meta/recipes-graphics/mesa/files/0003-v3d-DRM_FORMAT_MOD_BROADCOM_SAND128-only-available-f.patch b/meta/recipes-graphics/mesa/files/0003-v3d-DRM_FORMAT_MOD_BROADCOM_SAND128-only-available-f.patch
new file mode 100644
index 0000000000..7d60a31f53
--- /dev/null
+++ b/meta/recipes-graphics/mesa/files/0003-v3d-DRM_FORMAT_MOD_BROADCOM_SAND128-only-available-f.patch
@@ -0,0 +1,34 @@
+From cd2dce0257608fde2b9dd21429d1d7356e37abe1 Mon Sep 17 00:00:00 2001
+From: Jose Maria Casanova Crespo <jmcasanova@igalia.com>
+Date: Thu, 29 Apr 2021 18:47:53 +0200
+Subject: [PATCH] v3d: DRM_FORMAT_MOD_BROADCOM_SAND128 only available for NV12
+ format.
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+We were exposing as available DRM_FORMAT_MOD_BROADCOM_SAND128 for
+any format.
+
+Fixes: 95c4f0f91098 "v3d: Enables DRM_FORMAT_MOD_BROADCOM_SAND128 support"
+Reviewed-by: Alejandro Piñeiro <apinheiro@igalia.com>
+Part-of: <https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/10524>
+---
+ src/gallium/drivers/v3d/v3d_screen.c | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/src/gallium/drivers/v3d/v3d_screen.c b/src/gallium/drivers/v3d/v3d_screen.c
+index edde17d..684f912 100644
+--- a/src/gallium/drivers/v3d/v3d_screen.c
++++ b/src/gallium/drivers/v3d/v3d_screen.c
+@@ -646,6 +646,10 @@ v3d_screen_query_dmabuf_modifiers(struct pipe_screen *pscreen,
+         int i;
+         int num_modifiers = ARRAY_SIZE(v3d_available_modifiers);
+ 
++        /* Expose DRM_FORMAT_MOD_BROADCOM_SAND128 only for PIPE_FORMAT_NV12 */
++        if (format != PIPE_FORMAT_NV12)
++                num_modifiers--;
++
+         if (!modifiers) {
+                 *count = num_modifiers;
+                 return;
diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index a85f94c75e..8d8871aa5d 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -19,6 +19,10 @@ SRC_URI = "https://mesa.freedesktop.org/archive/mesa-${PV}.tar.xz \
            file://0002-meson.build-make-TLS-ELF-optional.patch \
            file://0001-meson-misdetects-64bit-atomics-on-mips-clang.patch \
            file://0001-futex.h-Define-__NR_futex-if-it-does-not-exist.patch \
+           file://0001-v3d-YUV-formats-at-is_dmabuf_modifier_supported-are-.patch \
+           file://0002-v3d-YUV-formats-at-query_dmabuf_modifiers-are-extern.patch \
+           file://0003-v3d-DRM_FORMAT_MOD_BROADCOM_SAND128-only-available-f.patch \
+           file://0001-freedreno-YUV-formats-are-supported-as-external-only.patch \
            "
 
 SRC_URI[sha256sum] = "565c6f4bd2d5747b919454fc1d439963024fc78ca56fd05158c3b2cde2f6912b"
-- 
2.30.2

