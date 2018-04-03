Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qk0-f195.google.com (mail-qk0-f195.google.com
	[209.85.220.195])
	by mail.openembedded.org (Postfix) with ESMTP id DD2E674A46
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Apr 2018 21:01:54 +0000 (UTC)
Received: by mail-qk0-f195.google.com with SMTP id g7so8034307qkm.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 03 Apr 2018 14:01:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:organization;
	bh=RiKFtTnuUvVxLMwK4uJxadjYfG/sN4kP4m/3LfIKyxE=;
	b=OxySHOlfSoaQT/6h04el0Vi2F13RQBcpnHxNuUuSE0pmgwTkObyNM9bD0dyd+ubhIO
	RByPD1XpMH2ktPxFXoBDa2hBfPLHzTCEdqMlmGH6Ei7OoLDGCHIAJCtu7p9gnFBerp/a
	yRHjO+YB1srND0FMVLlFytYIHjasRdn+qlMgYsehpJc7lfwkEiHOTNvGz0iF8UOLJfal
	jo5GXELNZD7Vhl/Pk1fGKqgpXrSA3eHLg6Mb/4cp99Wuq7H1eXnQhefxmxuJD4bFwnGk
	8ihSGIoeI/oH2m8WWiFVIHyAx3Tfml6E+eX6OokdgIMHm8Vq33Gv6vnC62CzuvEiXQyc
	ZPNA==
X-Gm-Message-State: ALQs6tBxVfvoUUb06Ln1xpzTSLrd/dKIrzYmBnbt35bkuvEQM3tQR0mU
	3i7WbGFZwcbXBHsuT2JE81GtLA==
X-Google-Smtp-Source: AIpwx48Ifa0M9JdCYQvD0ohccqTAdnOUSao9R3b2q4v5Hsf/7L9BsaYmG01SKgWIUIEuQuICLhslDw==
X-Received: by 10.55.21.27 with SMTP id f27mr21200154qkh.252.1522789315239;
	Tue, 03 Apr 2018 14:01:55 -0700 (PDT)
Received: from localhost.localdomain ([181.220.79.73])
	by smtp.gmail.com with ESMTPSA id
	c40sm3164864qtk.61.2018.04.03.14.01.52
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 03 Apr 2018 14:01:54 -0700 (PDT)
Received: by localhost.localdomain (sSMTP sendmail emulation);
	Tue, 03 Apr 2018 18:01:47 -0300
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Tue,  3 Apr 2018 18:01:46 -0300
Message-Id: <20180403210146.6040-1-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.16.3
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH] mesa: Upgrade 17.3.7 -> 17.3.8
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
X-List-Received-Date: Tue, 03 Apr 2018 21:01:55 -0000

This version has been published at April 03, 2018, and it is a bugfix
only release.

The release includes several important fixes that were made as part of
18.0.1 development cycle. Full list of bug fixes can be see online at:

  https://www.mesa3d.org/relnotes/17.3.8.html

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

 .../files/replace_glibc_check_with_linux.patch     | 28 ----------------------
 .../mesa/{mesa-gl_17.3.7.bb => mesa-gl_17.3.8.bb}  |  0
 .../mesa/{mesa_17.3.7.bb => mesa_17.3.8.bb}        |  5 ++--
 3 files changed, 2 insertions(+), 31 deletions(-)
 delete mode 100644 meta/recipes-graphics/mesa/files/replace_glibc_check_with_linux.patch
 rename meta/recipes-graphics/mesa/{mesa-gl_17.3.7.bb => mesa-gl_17.3.8.bb} (100%)
 rename meta/recipes-graphics/mesa/{mesa_17.3.7.bb => mesa_17.3.8.bb} (83%)

diff --git a/meta/recipes-graphics/mesa/files/replace_glibc_check_with_linux.patch b/meta/recipes-graphics/mesa/files/replace_glibc_check_with_linux.patch
deleted file mode 100644
index 30f55f4dac5..00000000000
--- a/meta/recipes-graphics/mesa/files/replace_glibc_check_with_linux.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From: Otavio Salvador <otavio@ossystems.com.br>
-Subject: [PATCH] endianness check is OS wide and not specific to libc
-
-Upstream-Status: Accepted [https://cgit.freedesktop.org/mesa/mesa/commit/?id=cbee1bfb34274668a05995b9d4c78ddec9e5ea4c]
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
-Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
----
- src/util/u_endian.h | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/util/u_endian.h b/src/util/u_endian.h
-index 9e09f80181..3148033fae 100644
---- a/src/util/u_endian.h
-+++ b/src/util/u_endian.h
-@@ -27,7 +27,7 @@
- #ifndef U_ENDIAN_H
- #define U_ENDIAN_H
- 
--#if defined(__GLIBC__) || defined(ANDROID) || defined(__CYGWIN__)
-+#if defined(__linux__)
- #include <endian.h>
- 
- #if __BYTE_ORDER == __LITTLE_ENDIAN
--- 
-2.15.1
-
diff --git a/meta/recipes-graphics/mesa/mesa-gl_17.3.7.bb b/meta/recipes-graphics/mesa/mesa-gl_17.3.8.bb
similarity index 100%
rename from meta/recipes-graphics/mesa/mesa-gl_17.3.7.bb
rename to meta/recipes-graphics/mesa/mesa-gl_17.3.8.bb
diff --git a/meta/recipes-graphics/mesa/mesa_17.3.7.bb b/meta/recipes-graphics/mesa/mesa_17.3.8.bb
similarity index 83%
rename from meta/recipes-graphics/mesa/mesa_17.3.7.bb
rename to meta/recipes-graphics/mesa/mesa_17.3.8.bb
index 9c75d6c6931..2d3fd3ca388 100644
--- a/meta/recipes-graphics/mesa/mesa_17.3.7.bb
+++ b/meta/recipes-graphics/mesa/mesa_17.3.8.bb
@@ -1,7 +1,6 @@
 require ${BPN}.inc
 
 SRC_URI = "https://mesa.freedesktop.org/archive/mesa-${PV}.tar.xz \
-           file://replace_glibc_check_with_linux.patch \
            file://disable-asm-on-non-gcc.patch \
 	   file://Use-Python-3-to-execute-the-scripts.patch \
            file://0001-Use-wayland-scanner-in-the-path.patch \
@@ -12,8 +11,8 @@ SRC_URI = "https://mesa.freedesktop.org/archive/mesa-${PV}.tar.xz \
            file://0001-st-dri-Initialise-modifier-to-INVALID-for-DRI2.patch \
            "
 
-SRC_URI[md5sum] = "769137f2538562c300c4b76bcb097377"
-SRC_URI[sha256sum] = "0595904a8fba65a8fe853a84ad3c940205503b94af41e8ceed245fada777ac1e"
+SRC_URI[md5sum] = "203d1a79156ab6926f2d253b377e9d9d"
+SRC_URI[sha256sum] = "8f9d9bf281c48e4a8f5228816577263b4c655248dc7666e75034ab422951a6b1"
 
 #because we cannot rely on the fact that all apps will use pkgconfig,
 #make eglplatform.h independent of MESA_EGL_NO_X11_HEADER
-- 
2.16.3


