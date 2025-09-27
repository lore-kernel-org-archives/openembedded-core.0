Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ECF82CAC5B9
	for <webhook@archiver.kernel.org>; Sat, 27 Sep 2025 05:49:25 +0000 (UTC)
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
 by mx.groups.io with SMTP id smtpd.web10.6581.1758952160358830354
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Sep 2025 22:49:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=HaspVm8l;
 spf=pass (domain: gmail.com, ip: 209.85.216.44, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-3304a57d842so2311167a91.3
        for <openembedded-core@lists.openembedded.org>; Fri, 26 Sep 2025 22:49:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758952159; x=1759556959; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=iBsv/SpPa5mRHqgDASpLChGVEzxcLxduDFqNo0JfCBY=;
        b=HaspVm8l42nCzwy6L/dn4AZ9sOkGJR3kc0+U47ZVEbwlefR0vzGT0YF1Lra4UBWhFz
         Te4IOgQSCWngrE70Z5KdReUklIS1KifykEOQwrgn8Ln7+0oogFEsB5Bhr5D3ieDgwWR3
         3rei7p8nszQqxqeVeXyXvXyreQ003ZIcG0O619pwRXvMAMUjbarxOMIV0eFT4x+dJ2s8
         NRMywTSNJaVCaSJ86N/jwjfz9DzFR/QQW5PczByih23wA9jVBsvozq41gtPP9XrOK0PI
         nZFus+PeUcJr4WDw/l/6+XzVCANx41HTmwddugP4xq4blX4DNIKmLPXe6OFdNwPARMB6
         6ovw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758952159; x=1759556959;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iBsv/SpPa5mRHqgDASpLChGVEzxcLxduDFqNo0JfCBY=;
        b=n3xqexKOgOg/MlAJSWw1eV8zTvt/q5INqYrgXVoytbalaBimtnXVdP94zbdnN9eOGF
         TG9/+WRXgZX0fTA9NAtASnqvUdwDPKOecFme9dD/4HUsEVfm0xxYwzvkkHdO3MzTT87p
         KeYOdPiz+MNx491u1LrIV0Tm+yoZjqPbrkwH4BTF6gpGfYd3q8BBXfKBzxbYL0IViYck
         OBiqADN/I6USruiFqDKMbExFXb8ywVtdsUQZTjTN4HXMx54tjcGLig/XDncsUwgXqO4I
         eA3pN52O572BLExyxN3EQlcva92osN1trSW1so5gr/fAChPSUE3IlcHlPij6r5RH4QcT
         6BuA==
X-Gm-Message-State: AOJu0YzWkVoSxaYrUdbrabf3Sm4xS02Y41LiOoWoBqPXjxjU86VQdXHz
	lT/DP1mr5o3rVLGfCKMqetdLlXfPMq9/ezQ4lDAy+tVW5ZSb7n96B+KbZFFMKHjD
X-Gm-Gg: ASbGnct/VEKjqK263Z3gd1Af6TaYp+pE7Md6s4lufX7iJwt4O6NELt6kiVyRbTH1qrx
	ztbTy58aaMemvjW0zCL8k2aJ36Aimp/w/b+bkwjFvwghmlNMBoRygdwkNJ+zQrSF4v7qRDLe6Uw
	qeg9Bro9GcpUaFsZorVaRkTaJjiYJ7KYHYf7FKrtWnpXSCjoYmj2R4YOI7XmBnh4f8kpMHa+zFl
	C1hclMGeAFfQoISWmWuOugDtZzKsFY//+QN0zLy9BeuZFoU/751vUW1Czq3foXU//egjtsE1JgC
	KpUbQtuPl7FFVwbCsp7jST1iMrFpvnkG/6OvVCMrLnyrCuiZFYxSqhsvzIzEm+gjkLGUk2LydQz
	Osw6UDi8NfecH13etDxKSB7ObnTzk0dq8+BqrWtVq+fbdiy9MvVwLvyvHxIlhNv7EZ0UUZn6bNc
	eLZncOldPbQ9ZpJu2hprPLKI7EGFbymBen0Qk0X5NGRasfgCdFup6b00TX+II7f4GQcVGqNw==
X-Google-Smtp-Source: AGHT+IH+R3Ox+rVKthQ6NO9P+KmrbrRR9kwxEi3ewjqxQi/drKwD/J9Ha55bIc3CbFvS/yN8aQXTTA==
X-Received: by 2002:a17:90b:4f4b:b0:32e:859:c79 with SMTP id 98e67ed59e1d1-3342a15e6b6mr11117440a91.0.1758952159357;
        Fri, 26 Sep 2025 22:49:19 -0700 (PDT)
Received: from apollo.tail3ccdd3.ts.net ([2601:646:8201:fd20::fa7e])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3341bda71bdsm10673372a91.11.2025.09.26.22.49.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Sep 2025 22:49:18 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] gn: Add recipe
Date: Fri, 26 Sep 2025 22:49:16 -0700
Message-ID: <20250927054916.363249-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 27 Sep 2025 05:49:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224093

gn is a commonly used build tool to generate ninja files, used
in a lot of recipes e.g. chromium, qtwebengine, perfetto, hafnium etc.
these recipes come from different layers e.g. meta-qt6/meta-arm/meta-oe

since not all layers depend on meta-oe ( meta-arm does not ), its not
a possible option.

Given the usecases, putting it in core will benefit the ecosystem
and reduce some duplication. This recipe is taken from meta-arm

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/conf/distro/include/maintainers.inc |  1 +
 meta/recipes-devtools/gn/gn_git.bb       | 46 ++++++++++++++++++++++++
 2 files changed, 47 insertions(+)
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
index 00000000000..abc81a9549f
--- /dev/null
+++ b/meta/recipes-devtools/gn/gn_git.bb
@@ -0,0 +1,46 @@
+SUMMARY = "GN is a meta-build system that generates build files for Ninja"
+DEPENDS += "ninja-native"
+
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=0fca02217a5d49a14dfe2d11837bb34d"
+
+UPSTREAM_CHECK_COMMITS = "1"
+
+SRC_URI = "git://gn.googlesource.com/gn;protocol=https;branch=main"
+SRCREV = "4ce861fc06ec87ff74eb6a17ebbd55e4755ebdeb"
+PV = "0+git"
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

