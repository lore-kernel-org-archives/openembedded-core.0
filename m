Received: from mail-pj1-f68.google.com (mail-pj1-f68.google.com [209.85.216.68])
 by mx.groups.io with SMTP id smtpd.web11.614.1592590166848510727
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Jun 2020 11:09:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=hNI3yUqG;
 spf=pass (domain: linaro.org, ip: 209.85.216.68, mailfrom: arthur.she@linaro.org)
Received: by mail-pj1-f68.google.com with SMTP id s88so4595613pjb.5
        for <openembedded-core@lists.openembedded.org>; Fri, 19 Jun 2020 11:09:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/HX2dUkCIWMUO6HTuK1rPSmzbW+JzfARPUkyVvcZIKU=;
        b=hNI3yUqG2+EFu1Jk+d0ZoZ26+KUEGdM3iA7isAmcPHyQD/cuceomL/vuYWGzOM7UvS
         j+2tPE/Rt3mHLh6UPcEpoBCtNdae3nvja3UcPda+Y5ryHRKtdWZ49kMU6Qi+iF5IGq6y
         /d6fpRh/JqzYaFKBA8DPzoH7qWI0o+zsETcilfyM7bPdrCIpHmSEBBVIMDE7p8xnixjH
         aW5GMxPFQ/POuV7tkdsBvgv2+5QcJrCdxanCViRO0DkP3yp0ZCdmqQD1BCmIdLrKsLzI
         V+u3/sX4QlL6ktf17WwmnN7WPerC1AU56g4gjoJGVLXYJE0nbxLtFZkEWV+9ycVN0LhA
         f4VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/HX2dUkCIWMUO6HTuK1rPSmzbW+JzfARPUkyVvcZIKU=;
        b=tiBkPeWcNb40CGWK9ptojzsC9WvsCoAeY7b4Q2Dc9Z0R9uhZCGZ58tDAQdoUKHUuvi
         5rXDvl7jswmAALsC+KPWiuwDCS0qwYeXuFj7YV6x+eGoWTFzeYMwg0VzLJZBkYQvkGmE
         tlmSQd5CIsSzVnjClv+l3kxKr/ctDZGFycKVG4b8OFrnZ2E7NREoiFU0+Oe0oWOHUWCe
         eVqPYuwUgzx9Vva3etx/kSFULjfX1a1jQhC+bZgFTAwBlXEOUoASWGOJR1tvvu+j5ktH
         +UHSAuGJN+WLIyypYEw2VrL93+Ge1FgEKf6ICFlIrjCkNqbSh4JkL7x54IjGG5H2blk4
         T7Hw==
X-Gm-Message-State: AOAM533hvTi846DavsWJ5MUtaq6Yj5dLee+6+r0nV29tEYqG0AbkDMLA
	2BYRxTzGoF/KhScHTecnMpKNm0BBbu53YA==
X-Google-Smtp-Source: ABdhPJxrKs91wuKRPjhSQgKkBkRWUWqrMxFLSBzN+hQ9X+W9cDHnr0L0eNjlN6yQv1zzST4DVLG9Yw==
X-Received: by 2002:a17:902:9683:: with SMTP id n3mr8912046plp.311.1592590165295;
        Fri, 19 Jun 2020 11:09:25 -0700 (PDT)
Return-Path: <arthur.she@linaro.org>
Received: from arthur-X1E.hitronhub.home (S0106a84e3f840fe3.vn.shawcable.net. [50.68.230.12])
        by smtp.gmail.com with ESMTPSA id e12sm6867511pfj.137.2020.06.19.11.09.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jun 2020 11:09:24 -0700 (PDT)
From: "Arthur She" <arthur.she@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: Arthur She <arthur.she@linaro.org>
Subject: [OE-core][PATCH v3] igt-gpu-tools: add new package
Date: Fri, 19 Jun 2020 11:09:22 -0700
Message-Id: <20200619180922.57663-1-arthur.she@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

igt-gpu-tools is a collection of tools for development and testing of the DRM
drivers. (https://gitlab.freedesktop.org/drm/igt-gpu-tools)
This recipe is originally copied from meta-intel and added the following
modifications
1. Enable ARM architecture
2. Enable igt-runner and Chamelium
3. Build git HEAD code instead of a specific version
The original recipe in the meta-intel will be removed and replaced by
this one to avoid having a duplicate recipe.
It is applicable to be submitted to oe-core, because it provides
a core validation functionality that is needed by all providing DRM
drivers and not just to a single arch.

Signed-off-by: Arthur She <arthur.she@linaro.org>
---
 meta/conf/distro/include/maintainers.inc      |  1 +
 .../igt-gpu-tools/igt-gpu-tools_git.bb        | 47 +++++++++++++++++++
 2 files changed, 48 insertions(+)
 create mode 100644 meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools_git.bb

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index 6496a48e40..2751375acc 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -262,6 +262,7 @@ RECIPE_MAINTAINER_pn-i2c-tools = "Anuj Mittal <anuj.mittal@intel.com>"
 RECIPE_MAINTAINER_pn-icecc-create-env = "Joshua Watt <JPEWhacker@gmail.com>"
 RECIPE_MAINTAINER_pn-icu = "Alexander Kanavin <alex.kanavin@gmail.com>"
 RECIPE_MAINTAINER_pn-ifupdown = "Anuj Mittal <anuj.mittal@intel.com>"
+RECIPE_MAINTAINER_pn-igt-gpu-tools = "Anuj Mittal <anuj.mittal@intel.com>"
 RECIPE_MAINTAINER_pn-inetutils = "Tom Rini <trini@konsulko.com>"
 RECIPE_MAINTAINER_pn-init-ifupdown = "Anuj Mittal <anuj.mittal@intel.com>"
 RECIPE_MAINTAINER_pn-init-system-helpers = "Anuj Mittal <anuj.mittal@intel.com>"
diff --git a/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools_git.bb b/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools_git.bb
new file mode 100644
index 0000000000..dc9537c9e3
--- /dev/null
+++ b/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools_git.bb
@@ -0,0 +1,47 @@
+SUMMARY = "IGT GPU Tools"
+DESCRIPTION = "IGT GPU Tools is a collection of tools for development and testing of the DRM drivers"
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=67bfee4df38fa6ecbe3a675c552d4c08"
+
+LICENSE = "MIT"
+
+inherit meson
+
+SRCREV = "d16ad07e7f2a028e14d61f570931c87fa5ce404c"
+PV = "1.25+git${SRCPV}"
+
+SRC_URI = "git://gitlab.freedesktop.org/drm/igt-gpu-tools.git;protocol=https"
+
+S = "${WORKDIR}/git"
+
+DEPENDS += "libdrm libpciaccess cairo udev glib-2.0 procps libunwind kmod openssl xmlrpc-c gsl elfutils alsa-lib json-c bison-native"
+RDEPENDS_${PN} += "bash"
+RDEPENDS_${PN}-tests += "bash"
+
+PACKAGE_BEFORE_PN = "${PN}-benchmarks ${PN}-tests"
+
+EXTRA_OEMESON = "-Ddocs=disabled -Drunner=enabled -Dchamelium=enabled"
+COMPATIBLE_HOST = "(x86_64.*|i.86.*|arm.*|aarch64).*-linux"
+COMPATIBLE_HOST_libc-musl_class-target = "null"
+SECURITY_LDFLAGS = "${SECURITY_X_LDFLAGS}"
+
+gputools_sysroot_preprocess() {
+	rm -f ${SYSROOT_DESTDIR}${libdir}/pkgconfig/intel-gen4asm.pc
+}
+SYSROOT_PREPROCESS_FUNCS += "gputools_sysroot_preprocess"
+
+do_install_append() {
+    install -d ${D}/usr/share/${BPN}/scripts
+    install ${S}/scripts/run-tests.sh ${D}/usr/share/${BPN}/scripts
+    install -d ${D}/usr/share/${BPN}/runner
+    install -D ${B}/runner/igt_runner ${D}/usr/share/${BPN}/runner
+    install -D ${B}/runner/igt_resume ${D}/usr/share/${BPN}/runner
+}
+
+FILES_${PN}-benchmarks += "${libexecdir}/${BPN}/benchmarks"
+FILES_${PN}-tests += "\
+        ${libexecdir}/${BPN}/*\
+        ${datadir}/${BPN}/1080p-right.png\
+        ${datadir}/${BPN}/1080p-left.png\
+        ${datadir}/${BPN}/pass.png\
+        ${datadir}/${BPN}/test-list.txt"
-- 
2.25.1

