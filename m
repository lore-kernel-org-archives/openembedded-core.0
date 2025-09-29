Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03AA0CAC5B9
	for <webhook@archiver.kernel.org>; Mon, 29 Sep 2025 15:36:53 +0000 (UTC)
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
 by mx.groups.io with SMTP id smtpd.web10.1249.1759160212255171896
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Sep 2025 08:36:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=JxMXfHlC;
 spf=pass (domain: gmail.com, ip: 209.85.215.169, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-b55517e74e3so5044050a12.2
        for <openembedded-core@lists.openembedded.org>; Mon, 29 Sep 2025 08:36:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759160211; x=1759765011; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TL5psP0lBDMMkqKcplbiUYsBeKZ56TsCoDSjIwbVxvE=;
        b=JxMXfHlCSPxzPtBwfUk2uFfJlP/+PV065bmvijdVOUBy6UDZSHkwSnrP8ZCcJZQGKR
         nxkt/45wTbd/gBJ/ZSf2zE+15570Sz/he0ZTRlkOitWJ3qVcmqDjbu5qZCuGMP20MjWV
         UuQWfwyA5gdUq+Hk+ZnMfZm6hljTkrmIXrBdhFCS1FM7x8jULPcbdjFhTzRBom7QNQwL
         aPgiGzluGACVqsH+t9pKJPsjDNJVJDQQ+8KZszSFSaHCqE3tseo8wEqWXWncNWUL40d4
         8EvPr64BNv3z0Lw79ZrSPWhWW3j/VR9RyBIRyoceIzFDMGxq/r/7zAerEMw8Yq9OKc/P
         pPtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759160211; x=1759765011;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TL5psP0lBDMMkqKcplbiUYsBeKZ56TsCoDSjIwbVxvE=;
        b=rTLtrnYIm9/PEMplXMGjYQlDyMa56dCSaeQxmpftZoKduN1gXETQ1GSunHaV0zJpr4
         wNj5piZi2RGLaPWWd4C1GVHLg3VYelW+VZwWSqjxEh8K9iCI6safW3u/J6tZSydgGTqq
         obi07IZ4Y/MmVXsZysoik3Xgvzc7FxvGirBcDhiXxMPlyC/u59V/UuDj+4wxm6ovjvva
         BxZQ0XbuGuOLEgHhm/Av8m198HM4O22Zjimjsej7zBpB8gOZJgAkFtGo74douWmXU0Da
         ABszPSfN3AvFWzedPBr/aMIsMCKfGP4xJvt8ody6T8yOsjqvE50+O1bZys8hcL0idmPH
         q0Gg==
X-Gm-Message-State: AOJu0Yw4uTplWzpfiB20wwT38vEWY5dupLcF5p1tYwdy9b9RoDElMb3Q
	SApKhmBquy+5D7f9SK6OX3XX7WoJbRB+FBh86THUs835q3sqtSRhY24YdFF8RzA3
X-Gm-Gg: ASbGncuoGfJO8CG/DJeMNvyIpjNNrq6RgEUvm9jvHvDu3FqfNVizRQOVnGsPMwFWpCO
	3fiPkRXZcEU/f6Ug3wN/Y6bUnwBIXq0biknwm6PCapKwboRCpi6k2fxP7EuJNMSGxgUD3/FNV8G
	DJlCH5MhtZzbru2UBdHvWzpZlyY1efPFTShfcv19s1bVv7kYao+jcgnr5gFhqCPF/SsR7zOD+Gc
	8myTBybGN+ulJ2fwMKPTB0zkDb9YdRuU8LBmIpxtkXFWVfYdOzvPRJo94Jl65mdgx9ovN8bGBuO
	ig1nreXqi5JHjLfz7a06z98fF+qJrUVT4UOcGCd83LmUk5hsuf69HgM2O/KWeOBGavSwem8Xy85
	Rxh8YNReH3jCKaJpRh03X5vzgH/8gstx38rial+fo0FduObPA/e3ShYMDc0jDf/0MUHa+q0BBLi
	2AXdLQdqA5tlc6S31L/K/5phiLI9/TQ2VTo9ud7zoh
X-Google-Smtp-Source: AGHT+IFa7cmXPokqdHC+HFa6ELYo+Og2bqMYrz8x2qJP0U4Ah/bi4PzYgARrK2vAkoegEXA+7bogeg==
X-Received: by 2002:a17:903:1b46:b0:28d:190a:1913 with SMTP id d9443c01a7336-28d190a1963mr4802385ad.38.1759160211221;
        Mon, 29 Sep 2025 08:36:51 -0700 (PDT)
Received: from apollo.tail3ccdd3.ts.net ([2601:646:8201:fd20::fa7e])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-27ed6881fd6sm134175105ad.87.2025.09.29.08.36.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Sep 2025 08:36:50 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v3] gn: Add recipe
Date: Mon, 29 Sep 2025 08:36:47 -0700
Message-ID: <20250929153647.1258488-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 29 Sep 2025 15:36:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224149

gn is a commonly used build tool to generate ninja files, used
in a lot of recipes e.g. chromium, qtwebengine, perfetto, hafnium etc.
these recipes come from different layers e.g. meta-qt6/meta-arm/meta-oe

since not all layers depend on meta-oe ( meta-arm does not ), its not
a possible option.

Given the usecases, putting it in core will benefit the ecosystem
and reduce some duplication. This recipe is taken from meta-arm

Disable maybe-initialized is a gcc specific option as error

Disable format warnings as errors, it adds -Wno-format explictly in
its build system

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v2:
 * Disable shallow clone, build fails gen.py does not work with it
 * Add build progress for do_compile
 * Update to latest commit on main
v3:
 * Make maybe-intialized opton to be gcc specific
 * Disable format string warnings as errors

 meta/conf/distro/include/maintainers.inc    |  1 +
 meta/conf/distro/include/security_flags.inc |  1 +
 meta/recipes-devtools/gn/gn_git.bb          | 52 +++++++++++++++++++++
 3 files changed, 54 insertions(+)
 create mode 100644 meta/recipes-devtools/gn/gn_git.bb

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index 0988bf50a72..85a9914469b 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -224,6 +224,7 @@ RECIPE_MAINTAINER:pn-glibc-scripts = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-glibc-testsuite = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-gmp = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-glslang = "Jose Quaresma <quaresma.jose@gmail.com>"
+RECIPE_MAINTAINER:pn-gn = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-gnome-desktop-testing = "Ross Burton <ross.burton@arm.com>"
 RECIPE_MAINTAINER:pn-gnu-config = "Robert Yang <liezhi.yang@windriver.com>"
 RECIPE_MAINTAINER:pn-gnu-efi = "Yi Zhao <yi.zhao@windriver.com>"
diff --git a/meta/conf/distro/include/security_flags.inc b/meta/conf/distro/include/security_flags.inc
index f713a994651..824ba2c0e3f 100644
--- a/meta/conf/distro/include/security_flags.inc
+++ b/meta/conf/distro/include/security_flags.inc
@@ -46,6 +46,7 @@ SECURITY_LDFLAGS:pn-sysklogd = ""
 # Recipes which fail to compile when elevating -Wformat-security to an error
 SECURITY_STRINGFORMAT:pn-busybox = ""
 SECURITY_STRINGFORMAT:pn-gcc = ""
+SECURITY_STRINGFORMAT:pn-gn = ""
 
 TARGET_CC_ARCH:append:class-target = " ${SECURITY_CFLAGS}"
 TARGET_LDFLAGS:append:class-target = " ${SECURITY_LDFLAGS}"
diff --git a/meta/recipes-devtools/gn/gn_git.bb b/meta/recipes-devtools/gn/gn_git.bb
new file mode 100644
index 00000000000..d8896609b19
--- /dev/null
+++ b/meta/recipes-devtools/gn/gn_git.bb
@@ -0,0 +1,52 @@
+SUMMARY = "GN is a meta-build system that generates build files for Ninja"
+HOMEPAGE = "https://gn.googlesource.com/gn/"
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=0fca02217a5d49a14dfe2d11837bb34d"
+
+DEPENDS += "ninja-native"
+UPSTREAM_CHECK_COMMITS = "1"
+
+SRC_URI = "git://gn.googlesource.com/gn;protocol=https;branch=main"
+SRCREV = "81b24e01531ecf0eff12ec9359a555ec3944ec4e"
+PV = "0+git"
+
+BB_GIT_SHALLOW = ""
+
+B = "${WORKDIR}/build"
+
+# Map from our _OS strings to the GN's platform values.
+def gn_platform(variable, d):
+    os = d.getVar(variable)
+    if "linux" in os:
+        return "linux"
+    elif "mingw" in os:
+        return "mingw"
+    else:
+        return os
+
+do_configure[cleandirs] += "${B}"
+do_configure() {
+    python3 ${S}/build/gen.py \
+        --platform=${@gn_platform("TARGET_OS", d)} \
+        --out-path=${B} \
+        --no-static-libstdc++ \
+        --no-strip
+}
+
+# Catch build progress from ninja
+do_compile[progress] = "outof:^\[(\d+)/(\d+)\]\s+"
+
+do_compile() {
+    ninja -C ${B} --verbose
+}
+
+do_install() {
+    install -d ${D}${bindir}
+    install ${B}/gn ${D}${bindir}
+}
+
+BBCLASSEXTEND = "native"
+
+COMPATIBLE_HOST = "^(?!riscv32).*"
+
+CFLAGS:append:toolchain-gcc = " -Wno-error=maybe-uninitialized"

