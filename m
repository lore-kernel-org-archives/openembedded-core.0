Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 679B1CAC5B9
	for <webhook@archiver.kernel.org>; Sat, 27 Sep 2025 06:37:16 +0000 (UTC)
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
 by mx.groups.io with SMTP id smtpd.web10.6946.1758955035992783457
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Sep 2025 23:37:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=LsdVFobZ;
 spf=pass (domain: gmail.com, ip: 209.85.216.51, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-3304dd2f119so2314117a91.2
        for <openembedded-core@lists.openembedded.org>; Fri, 26 Sep 2025 23:37:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758955035; x=1759559835; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RSLgZTyaKLZtxpN8OYBanQ/QZJtzJiozyJSRiiZp82o=;
        b=LsdVFobZ8OT/unB1b93RAMZQWlwsKUc9ezttxK4WJ53uF1bv69HfZIT5BZW8nljY9N
         oxEDPXFhdeJPMHLjLH12M9A3YP3nmHDTQNncp93z6XRbNnKXs50CtdDk7PUtE0A5Zi+d
         lzvm2wXrqN+seHWMZX/UR0TABeKD61M+odFpnVLsEKvM4kVoaJgOl7pte1ZyqnzWNfq7
         x5aE21C7MKeYpV/3gQFIngnFd6NPbXF6071mCTD6WUMD4oPGHffJ9J3iLOhen4a6+dQu
         33uFDpxiHJq12cdCyqsIecGnD3pPUaCLIJiE1A6rgH7nwWh3ljg3gViJoyXZsuOn8dt8
         E1rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758955035; x=1759559835;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RSLgZTyaKLZtxpN8OYBanQ/QZJtzJiozyJSRiiZp82o=;
        b=L0y9WT7UKr7xRAfXwaUDKw96y539+KmgpO5v5u+1lkvbDO+u907Ba2qV8KSDuDv5XC
         41Bstj80LGvPRlchiS6j5IxbhDmOFy0XF5LSijVrUvxW7yXGnHleufo5Il9ZJixcj5nn
         RNiS+AXAEV0out6fA7oZ129XVqraS5TqN+FVDeA/SG2d0+ohERwgfeZlZ/jxBr7ZyoU/
         cLQpmoYh/AzXkLkQisa1Qjr9dPd53fuaiDkL768+WPBBZ+518yoiZoyyKlQDyuKCyiFP
         NX9PGR5qYUIHGUJ+Lz6yf2oeXVXyGQ9pSlM+nyQ8zHn37T5eTXTfCXU4AxBMKDCC4ezk
         HfmQ==
X-Gm-Message-State: AOJu0YySUaOw+GZBaMtp4fO17Ckx+yLXBjHY2RbVdZ1RsuBPCXoOtvJl
	4KHGESpQ94eRm1cahHrOzeti7Uv7/iR5vYt5Xt/dhUPWxMqLpt/5MUVBJdO72wZr
X-Gm-Gg: ASbGnctvAXnfcTKMti3VYSVLKNImj6/K9+G4FL7GgXEwcSMv78eJcYh4lzNeJMLVJHK
	OFSytWnVRZO8k4ZlcRGRZzHSxJ6v8i/SOwHnkg171NDeASrXzUubokWimGRK6ka54izhgwSu27q
	+GQ5N2dv7N1ujCVATzIzlObBhdILoCBBcu/Hjz72END2MyoLLI8dfdUsjpdyJzGezcznwF/xCUm
	NygLd8OPHwdecLVdA3w2kD5WBUqbWL9T+iDDhLqEBgxzw/VQk5A6jR3C5AKIriXJYo6iAqRghwy
	f3sUpUKPR4mjkeHNkr72+k2p5XOxHluHzpqWkeKVw0aQbXPdBe4rSGCrhsWlkG+8a3xO9D3nXLK
	GfZEGghb7podr4aE/o9ExWvZDVSac8d0iPHkSQw7vWHZGH1ikP0f8BdAQB+OI32NpVPz96JAmYg
	2d57TV+ZweoeRfRMG26l29BXiraywFudIHb/vqwzpijQIPuY/mq4Q=
X-Google-Smtp-Source: AGHT+IFSnc9ZzRja2JR/B+dNNRnH62J9aTBi09V5XUYuwqOhJo8mXGfqKhxL3TQYShfv+phGiF/Nzg==
X-Received: by 2002:a17:90a:dfd0:b0:32e:18fb:f05f with SMTP id 98e67ed59e1d1-3342a2bed85mr11146845a91.20.1758955034866;
        Fri, 26 Sep 2025 23:37:14 -0700 (PDT)
Received: from apollo.tail3ccdd3.ts.net ([2601:646:8201:fd20::fa7e])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3341bda71bdsm10789990a91.11.2025.09.26.23.37.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Sep 2025 23:37:14 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v2] gn: Add recipe
Date: Fri, 26 Sep 2025 23:37:12 -0700
Message-ID: <20250927063712.387453-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 27 Sep 2025 06:37:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224095

gn is a commonly used build tool to generate ninja files, used
in a lot of recipes e.g. chromium, qtwebengine, perfetto, hafnium etc.
these recipes come from different layers e.g. meta-qt6/meta-arm/meta-oe

since not all layers depend on meta-oe ( meta-arm does not ), its not
a possible option.

Given the usecases, putting it in core will benefit the ecosystem
and reduce some duplication. This recipe is taken from meta-arm

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v2:
 * Disable shallow clone, build fails gen.py does not work with it
 * Add build progress for do_compile
 * Update to latest commit on main
    
 meta/conf/distro/include/maintainers.inc |  1 +
 meta/recipes-devtools/gn/gn_git.bb       | 51 ++++++++++++++++++++++++
 2 files changed, 52 insertions(+)
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
diff --git a/meta/recipes-devtools/gn/gn_git.bb b/meta/recipes-devtools/gn/gn_git.bb
new file mode 100644
index 00000000000..0bd4320b635
--- /dev/null
+++ b/meta/recipes-devtools/gn/gn_git.bb
@@ -0,0 +1,51 @@
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
+CFLAGS += "-Wno-error=maybe-uninitialized"

