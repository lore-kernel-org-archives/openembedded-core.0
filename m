Return-Path: <otavio.salvador@gmail.com>
Received: from mail-ua0-f178.google.com (mail-ua0-f178.google.com
	[209.85.217.178])
	by mail.openembedded.org (Postfix) with ESMTP id 99E2A78071
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Jun 2017 21:10:37 +0000 (UTC)
Received: by mail-ua0-f178.google.com with SMTP id j53so80723069uaa.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Jun 2017 14:10:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:organization;
	bh=xFFtYLf79km9qCaXa0JZmY84+IBicRugfP6xjq3uknI=;
	b=BiGySwL1G//K0+u9Oqfrd9p8y2RoviwD98ChnjAXqGoM8DhvY4DrRzKtrAJ/fzIytM
	o0azyjwb6LpedbOpgZeBSRFpSDsSJA7XoAVWf1/21L2KgSvEqrcNczBWiK6iTi6fBZ9S
	yV4RFU0li0UO4gki7CE7LeMyQ1Cb+JjUCZADLArBnUh30FEWPuZZpMrp5OYxmLeHbZq3
	5tIgPhPiA2lWX1lPQC1pOI/mgy076QG19q6Z/GQbl0GYADzba1+8xDPKlOVExQQtfWl+
	aFRVB8/p+gq/A3zlFHX15GgpJzmW1eyhksWt+Kxgz73LUB80TKKS3VmVlP1XOeUdce4T
	vK8g==
X-Gm-Message-State: AKS2vOxEX0jGbGizH4XD69nEaiVS7Z15u4BZ0i4/PwIRgp7lEYZEPghk
	R96QCIZtRPChKSlN
X-Received: by 10.176.92.45 with SMTP id q45mr9938207uaf.137.1497993038223;
	Tue, 20 Jun 2017 14:10:38 -0700 (PDT)
Received: from localhost.localdomain ([189.35.69.200])
	by smtp.gmail.com with ESMTPSA id
	k70sm5225632vke.14.2017.06.20.14.10.34
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 20 Jun 2017 14:10:37 -0700 (PDT)
Received: by localhost.localdomain (sSMTP sendmail emulation);
	Tue, 20 Jun 2017 18:10:29 -0300
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Tue, 20 Jun 2017 18:10:28 -0300
Message-Id: <20170620211028.5533-1-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.13.1
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH v3] mesa: Update to 17.1.3 release
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
X-List-Received-Date: Tue, 20 Jun 2017 21:10:38 -0000

17.1.2 release includes fixes for:

  Bug 98833 - [REGRESSION, bisected] Wayland revert commit breaks
              non-Vsync fullscreen frame updates
  Bug 100741 - Chromium - Memory leak
  Bug 100877 - vulkan/tests/block_pool_no_free regression
  Bug 101110 - Build failure in GNOME Continuous

17.1.3 release includes fixes for:

  Bug 100988 - glXGetCurrentDisplay() no longer works for FakeGLX
               contexts?

The 17.1.3 release includes the "util/rand_xor: add missing include
statements" which is now merged upstream (thanks Nicolas Dechesne);
the referred patch is then dropped from the recipe.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

Changes in v3:
- update to 17.1.3 release

Changes in v2:
- rebase on top of master

 ...l-rand_xor-add-missing-include-statements.patch | 35 ----------------------
 .../mesa/{mesa-gl_17.1.1.bb => mesa-gl_17.1.3.bb}  |  0
 .../mesa/{mesa_17.1.1.bb => mesa_17.1.3.bb}        |  5 ++--
 3 files changed, 2 insertions(+), 38 deletions(-)
 delete mode 100644 meta/recipes-graphics/mesa/files/0001-util-rand_xor-add-missing-include-statements.patch
 rename meta/recipes-graphics/mesa/{mesa-gl_17.1.1.bb => mesa-gl_17.1.3.bb} (100%)
 rename meta/recipes-graphics/mesa/{mesa_17.1.1.bb => mesa_17.1.3.bb} (77%)

diff --git a/meta/recipes-graphics/mesa/files/0001-util-rand_xor-add-missing-include-statements.patch b/meta/recipes-graphics/mesa/files/0001-util-rand_xor-add-missing-include-statements.patch
deleted file mode 100644
index ffe8b96163..0000000000
--- a/meta/recipes-graphics/mesa/files/0001-util-rand_xor-add-missing-include-statements.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From a8a1081ec05634e667d6670ab7c128d536cc60a9 Mon Sep 17 00:00:00 2001
-From: Nicolas Dechesne <nicolas.dechesne@linaro.org>
-Date: Thu, 1 Jun 2017 11:59:42 +0200
-Subject: [PATCH] util/rand_xor: add missing include statements
-
-Fixes for:
-
-src/util/rand_xor.c:60:13: error: implicit declaration of function 'open' [-Werror=implicit-function-declaration]
-    int fd = open("/dev/urandom", O_RDONLY);
-             ^~~~
-src/util/rand_xor.c:60:34: error: 'O_RDONLY' undeclared (first use in this function)
-    int fd = open("/dev/urandom", O_RDONLY);
-                                  ^~~~~~~~
-
-Upstream-Status: Submitted [ https://lists.freedesktop.org/archives/mesa-dev/2017-June/157542.html ]
-Signed-off-by: Nicolas Dechesne <nicolas.dechesne@linaro.org>
----
- src/util/rand_xor.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/src/util/rand_xor.c b/src/util/rand_xor.c
-index de05fa64b3..de04bbc284 100644
---- a/src/util/rand_xor.c
-+++ b/src/util/rand_xor.c
-@@ -25,6 +25,7 @@
- #if defined(__linux__)
- #include <sys/file.h>
- #include <unistd.h>
-+#include <fcntl.h>
- #else
- #include <time.h>
- #endif
--- 
-2.13.0
-
diff --git a/meta/recipes-graphics/mesa/mesa-gl_17.1.1.bb b/meta/recipes-graphics/mesa/mesa-gl_17.1.3.bb
similarity index 100%
rename from meta/recipes-graphics/mesa/mesa-gl_17.1.1.bb
rename to meta/recipes-graphics/mesa/mesa-gl_17.1.3.bb
diff --git a/meta/recipes-graphics/mesa/mesa_17.1.1.bb b/meta/recipes-graphics/mesa/mesa_17.1.3.bb
similarity index 77%
rename from meta/recipes-graphics/mesa/mesa_17.1.1.bb
rename to meta/recipes-graphics/mesa/mesa_17.1.3.bb
index 55c6f71ab4..d9860213f2 100644
--- a/meta/recipes-graphics/mesa/mesa_17.1.1.bb
+++ b/meta/recipes-graphics/mesa/mesa_17.1.3.bb
@@ -4,12 +4,11 @@ SRC_URI = "https://mesa.freedesktop.org/archive/mesa-${PV}.tar.xz \
            file://replace_glibc_check_with_linux.patch \
            file://disable-asm-on-non-gcc.patch \
            file://0001-Use-wayland-scanner-in-the-path.patch \
-           file://0001-util-rand_xor-add-missing-include-statements.patch \
            file://0002-hardware-gloat.patch \
 "
 
-SRC_URI[md5sum] = "a4844bc6052578574f9629458bcbb749"
-SRC_URI[sha256sum] = "aed503f94c0c1630a162a3e276f4ee12a86764cee4cb92338ea2dea99a04e7ef"
+SRC_URI[md5sum] = "1946a93d543bc219427e2bebe2ac4752"
+SRC_URI[sha256sum] = "5f1ee9a8aea2880f887884df2dea0c16dd1b13eb42fd2e52265db0dc1b380e8c"
 
 #because we cannot rely on the fact that all apps will use pkgconfig,
 #make eglplatform.h independent of MESA_EGL_NO_X11_HEADER
-- 
2.13.1


