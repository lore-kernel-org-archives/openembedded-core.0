Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com [209.85.215.196])
 by mx.groups.io with SMTP id smtpd.web12.11459.1592200842383808781
 for <openembedded-core@lists.openembedded.org>;
 Sun, 14 Jun 2020 23:00:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=CSk9v8Qa;
 spf=pass (domain: linaro.org, ip: 209.85.215.196, mailfrom: arthur.she@linaro.org)
Received: by mail-pg1-f196.google.com with SMTP id v14so2149297pgl.1
        for <openembedded-core@lists.openembedded.org>; Sun, 14 Jun 2020 23:00:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2/sAQOlErMZumqSovmBm73sWB2C+lKoNRaKttknx0QI=;
        b=CSk9v8Qadr0CPnryibmDqjONd//PHuaUOTXZTy2QvwsZC4F3Ax7G46KTufwpeYzZhJ
         0XP/Hnmx5cA4NytuR9Kj35BxFyuIPmudF9OZ7HlyDESx8ss7b/ZR/G79tDC6ZFZ8CWHU
         EQMrCLIleRqcdIvKPQIRWLMrHC2x6t1inyNSCzWwZdP7ivPk+oUj1c3bMpqwaeqEUzH2
         LPfqrKdwz3Oq+MgGYnG1/VAR9zmofsZW7laD9x740MTVvzP43kwLvBK3x3PjtnqVdJ5m
         zPLJPhLyGzb4vF4dOLGKJdb4uCnwlPbXccMOZfHTDIsSMSLEbvuqxeFUk21CTHX/x7B7
         PCuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2/sAQOlErMZumqSovmBm73sWB2C+lKoNRaKttknx0QI=;
        b=UyQItfixVBUp3ljORFb6RY8l0/yY+enjHhNza1vSzxXS27/XWtHtlN0kqfL+tRzj3v
         kE+TDkJ9ha2gw0cg7/Y/kPtHdrGWGd2QyMCwxGNVcgqQ20vbJ96iR7C/sjvf+RPHPbpf
         fUF7oSY/gXsl4pCrdGS61N3Jua2UIRT3++9kn6JLJWqu33wl2xFg7qDDrAWOFw3kGL5G
         N77K2vAMw1eBujEjcGPhW2/fo6MdHOLhc1bWGEWuCp+N/dtDmjFwhmKqZI2fPkyucaHh
         bUq1srDAWBhBah30FwcevXfg5nez/4UNyazWgUKS9K9VMg4HUceAWUVHuEaaZzkVKmoi
         ZeEw==
X-Gm-Message-State: AOAM533lqYt8O3BiVcXcA8ZpmyZihdVeALe8SijXIPkwGA/Y2JyKRQMV
	l6MlBKHJXcUY9Znc8A45kYC7hDntYIRhfA==
X-Google-Smtp-Source: ABdhPJxHxq70quHsPRB0iniyaGqVLzfITNHc4K+A/XjJDQgwkKNfssH/qwjoHwOHpACqIr/1JXEohw==
X-Received: by 2002:aa7:8283:: with SMTP id s3mr11805674pfm.90.1592200841532;
        Sun, 14 Jun 2020 23:00:41 -0700 (PDT)
Return-Path: <arthur.she@linaro.org>
Received: from arthur-X1E.hitronhub.home (S0106a84e3f840fe3.vn.shawcable.net. [50.68.230.12])
        by smtp.gmail.com with ESMTPSA id c12sm10738530pgm.73.2020.06.14.23.00.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Jun 2020 23:00:41 -0700 (PDT)
From: "Arthur She" <arthur.she@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: Arthur She <arthur.she@linaro.org>
Subject: [OE-core][PATCH] igt-gpu-tools: add new package
Date: Sun, 14 Jun 2020 23:00:25 -0700
Message-Id: <20200615060025.171354-1-arthur.she@linaro.org>
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
this one once it get merged.

Signed-off-by: Arthur She <arthur.she@linaro.org>
---
 .../igt-gpu-tools/igt-gpu-tools_git.bb        | 47 +++++++++++++++++++
 1 file changed, 47 insertions(+)
 create mode 100644 meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools_git.bb

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

