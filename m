Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com [209.85.215.193])
 by mx.groups.io with SMTP id smtpd.web11.19231.1592837400251516968
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Jun 2020 07:50:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=F1noRtRL;
 spf=pass (domain: linaro.org, ip: 209.85.215.193, mailfrom: arthur.she@linaro.org)
Received: by mail-pg1-f193.google.com with SMTP id h10so8235512pgq.10
        for <openembedded-core@lists.openembedded.org>; Mon, 22 Jun 2020 07:50:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=WfnUDLD7SL7uLMpzAbhVQYnHqESS/9/AEhtzxeO6l80=;
        b=F1noRtRL/uty0fcr7uTXSTd9f6I/FkoHLyXNRlt30CzyZxFTwLH7b5ngDk0JlMckua
         koTVQbS5ivf0fcJwTACvgDPR/hZv9WrddW9ZjnSPo131mYZTg92s171+pzMthQFNw/sC
         aWzgec2f0o+xXGy9L/Gqcn6ED/H4gWebOch+3dkcTuFvJaXoR0OmDu+2wnTjy5zqxc1g
         rGV+WGh+rNBWELGG8FzeJOtyZBjjtFghrunjzbYGJqJ6//BDOAobqbPzpX3tz92UZMZ/
         QNET0nEixvuDmh4aVRbZB8l59IPzscw9QmungKD5wB1WEu5RqKUd34mPzl+b4ojIX5dy
         3EYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=WfnUDLD7SL7uLMpzAbhVQYnHqESS/9/AEhtzxeO6l80=;
        b=hiUQM3AEY6+uZze1SPno7ur0H/5QNmOTMd8vfRGnLv1ZmnTHQoM/7R0E+Irrt1AQoC
         O37ozQxfKK/dXpoTAmCu0iBYBw+WQhyCx4Z0xhkHxQIzeFj0Hkg9mDs6JGHp+/NIhWfp
         sCILfJtVxlz8f+Q/RSU2v9C4Zc1dYLowxbpiMkJ9gOBdT9AWbUOmUh2tjM3Ymd91FBaO
         +0a+ek5wy8lpxPgw/n7ZXS7jfofP8BTU03ufSGDkRrJ2oxVHUtwSxGOjiRTwuTtKagt5
         ZKWjN3M1ICnHfdlVPJs795UHgHnLyidzuD5CbjtN51FluflQme/RoqYCNsHoB3EzLaZ1
         YRig==
X-Gm-Message-State: AOAM532dhdqHP79nPamXQGwVJENheR21Xns73TXXec1oy52EtUrW0b2N
	xuCAgufrKn/OZrx2TrZ1Vgls2fK3bajjlA==
X-Google-Smtp-Source: ABdhPJyg6A4LTovWe5UgBG9k+0AFUNw+Bhc8vSspXwuhZsyzJuShcBYOu8txleOHJexdE7p8yTaa/w==
X-Received: by 2002:a63:181f:: with SMTP id y31mr13305530pgl.47.1592837399520;
        Mon, 22 Jun 2020 07:49:59 -0700 (PDT)
Return-Path: <arthur.she@linaro.org>
Received: from arthur-X1E.hitronhub.home (S0106a84e3f840fe3.vn.shawcable.net. [50.68.230.12])
        by smtp.gmail.com with ESMTPSA id cm13sm13690485pjb.5.2020.06.22.07.49.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2020 07:49:58 -0700 (PDT)
From: "Arthur She" <arthur.she@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: Arthur She <arthur.she@linaro.org>
Subject: [OE-core][PATCH v4] igt-gpu-tools: add new package
Date: Mon, 22 Jun 2020 07:49:55 -0700
Message-Id: <20200622144955.4122143-1-arthur.she@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

igt-gpu-tools is a collection of tools for development and testing of the DRM
drivers. (https://gitlab.freedesktop.org/drm/igt-gpu-tools)
This recipe is originally copied from meta-intel and added the following
modifications
1. Enable ARM architecture
2. Enable igt-runner
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
index 0000000000..f60880c292
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
+DEPENDS += "libdrm libpciaccess cairo udev glib-2.0 procps libunwind kmod openssl elfutils alsa-lib json-c bison-native"
+RDEPENDS_${PN} += "bash"
+RDEPENDS_${PN}-tests += "bash"
+
+PACKAGE_BEFORE_PN = "${PN}-benchmarks ${PN}-tests"
+
+EXTRA_OEMESON = "-Ddocs=disabled -Drunner=enabled"
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

