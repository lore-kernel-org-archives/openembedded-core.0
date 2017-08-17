Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f65.google.com (mail-pg0-f65.google.com [74.125.83.65])
	by mail.openembedded.org (Postfix) with ESMTP id 31A6577E48
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Aug 2017 02:20:48 +0000 (UTC)
Received: by mail-pg0-f65.google.com with SMTP id 83so7352086pgb.4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Aug 2017 19:20:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=Df13howS50J5jLZ70g15iCJ0BqI/lycUeOllorJjmZc=;
	b=vNqCv7KPxmhQUd7Vwzf23VaX7e/sSbOlOj/NsI6togVf92R6wG3tbxITa6L/bOl4Se
	J0UrpwjusA9SRAddSxcMSkXNPI1gbUaetZWIXCDBbc5Rsk30tdvPOI6TC4435y0jXEK5
	WTOwIX8bMXSTWMlBSQ4JQrkHYpcMTJofYDUJEksCMgLviFhqW3iHh8b9xYYrRS6rhqWe
	uMXNG+Gl8q4zLCJhtqiICNkQ+suhSk4N/6NX980kLFx+DoH4g37xQDEKJuOZSTgqrmyi
	napHWwqxZUat7TydtlVvh6ZcAfldMkdLLbXrO9/mrKq/PwDmTDDzVGrvVWLmEQxS+KGq
	GuCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=Df13howS50J5jLZ70g15iCJ0BqI/lycUeOllorJjmZc=;
	b=PJWO9/k7GkRqyKdXV+c0/mmpWIus9/dl3cy/jKw75royc1lODR0zlajuQ0eSQpwjpQ
	Y/kS2vPy+vIgU2YUlW/Sl+cOaqrc8G9eJtuJWxURHSP1txCY5xMjeQWdEbdStySgPhAU
	v/jqal2t/zW1gZM2LTgpRJVhenpqMgkNR617aSlJflrD3IXWNU3paWpYF9BFHwQh6UGa
	fwAb2e1TaLaP4mDlcMaTUzNQURCnc8RkN08O/Cq0d2ejzk6EWbumTfJn254lBp/8gGgW
	IlSVgItKg0DPG95BqoLmEWwxbtkoiVX52TsCJyIzSjQGef/cla0ANJvoqHyo6PTxAJA/
	QgJw==
X-Gm-Message-State: AHYfb5hBB7sHimaQoJFi+RY+k7+NQHvnRxdAA04bWf1cuP2VjYMHrCNq
	5lXF54gEcl5Ncwpz
X-Received: by 10.98.129.3 with SMTP id t3mr3643776pfd.167.1502936450192;
	Wed, 16 Aug 2017 19:20:50 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::8319])
	by smtp.gmail.com with ESMTPSA id
	e128sm4245613pfg.114.2017.08.16.19.20.49
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 16 Aug 2017 19:20:49 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 16 Aug 2017 19:20:41 -0700
Message-Id: <20170817022041.17673-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.14.1
Subject: [PATCH] mesa: Fix build with llvmpipe enabled on musl
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
X-List-Received-Date: Thu, 17 Aug 2017 02:20:49 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../0001-winsys-svga-drm-Include-sys-types.h.patch | 34 ++++++++++++++++++++++
 meta/recipes-graphics/mesa/mesa_17.1.5.bb          |  3 +-
 2 files changed, 36 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-graphics/mesa/files/0001-winsys-svga-drm-Include-sys-types.h.patch

diff --git a/meta/recipes-graphics/mesa/files/0001-winsys-svga-drm-Include-sys-types.h.patch b/meta/recipes-graphics/mesa/files/0001-winsys-svga-drm-Include-sys-types.h.patch
new file mode 100644
index 0000000000..549b8671ab
--- /dev/null
+++ b/meta/recipes-graphics/mesa/files/0001-winsys-svga-drm-Include-sys-types.h.patch
@@ -0,0 +1,34 @@
+From d8750776404b1031d762966d0f551d13d2fe05a7 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 16 Aug 2017 18:58:20 -0700
+Subject: [PATCH] winsys/svga/drm: Include sys/types.h
+
+vmw_screen.h uses dev_t which is defines in sys/types.h
+this header is required to be included for getting dev_t
+definition. This issue happens on musl C library, it is hidden
+on glibc since sys/types.h is included through another
+system headers
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+
+Upstream-Status: Submitted
+
+ src/gallium/winsys/svga/drm/vmw_screen.h | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/gallium/winsys/svga/drm/vmw_screen.h b/src/gallium/winsys/svga/drm/vmw_screen.h
+index 0ef8e84..2eda97e 100644
+--- a/src/gallium/winsys/svga/drm/vmw_screen.h
++++ b/src/gallium/winsys/svga/drm/vmw_screen.h
+@@ -41,6 +41,7 @@
+ #include "svga_winsys.h"
+ #include "pipebuffer/pb_buffer_fenced.h"
+ #include <os/os_thread.h>
++#include <sys/types.h>
+ 
+ #define VMW_GMR_POOL_SIZE (16*1024*1024)
+ #define VMW_QUERY_POOL_SIZE (8192)
+-- 
+2.14.1
+
diff --git a/meta/recipes-graphics/mesa/mesa_17.1.5.bb b/meta/recipes-graphics/mesa/mesa_17.1.5.bb
index 36b0377453..4d82452b07 100644
--- a/meta/recipes-graphics/mesa/mesa_17.1.5.bb
+++ b/meta/recipes-graphics/mesa/mesa_17.1.5.bb
@@ -10,7 +10,8 @@ SRC_URI = "https://mesa.freedesktop.org/archive/mesa-${PV}.tar.xz \
            file://llvm-config-version.patch \
            file://0001-ac-fix-build-after-LLVM-5.0-SVN-r300718.patch \
            file://0002-gallivm-Fix-build-against-LLVM-SVN-r302589.patch \
-"
+           file://0001-winsys-svga-drm-Include-sys-types.h.patch \
+           "
 SRC_URI[md5sum] = "6cf936fbcaadd98924298a7009e8265d"
 SRC_URI[sha256sum] = "378516b171712687aace4c7ea8b37c85895231d7a6d61e1e27362cf6034fded9"
 
-- 
2.14.1


