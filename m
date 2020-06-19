Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com [209.85.214.194])
 by mx.groups.io with SMTP id smtpd.web12.2162.1592532672012804927
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Jun 2020 19:11:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=M6ZgDvlA;
 spf=pass (domain: linaro.org, ip: 209.85.214.194, mailfrom: arthur.she@linaro.org)
Received: by mail-pl1-f194.google.com with SMTP id j4so3298579plk.3
        for <openembedded-core@lists.openembedded.org>; Thu, 18 Jun 2020 19:11:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=PuSih0xtZ41VECF4/eRxTK4DJBGX7FuFzVo/Sia582U=;
        b=M6ZgDvlATvWc0n4iV35/crcwWJKFdAZVYx6fbzQug1DUEQ4BOj+cU5LTGvakcCtxCT
         srXIQGdWpbQoMqg4+GmhlBice6RQvzkuTnKaZyx+3dwz682sMN/0QZXGuPX7Lmkej8JH
         uKqQiyw5vM1kI3TBFX6rMrhQ7fszBgCXW8a6HeCHv9waXsqwdG98EbT+9pdp5Q5T5s/U
         86kDAt30PL9za7Ag80/ovWgrLjKrROXuxRIBJ2L8Z2LhV3CrVt7Y33CM8oEPf4umXu44
         TWNtLal8W8UgrNUq4syI4axyUHcAB9UUrhHYELyuBc6EFW2xioJWf2H8aL7BidKHOpgS
         2QOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=PuSih0xtZ41VECF4/eRxTK4DJBGX7FuFzVo/Sia582U=;
        b=UUo9hdnfTMw1nmWofM91oE/c9K9RxMq9+wb6Si2o2Cz6o7JhLDpdLVUYMJsAMWld03
         jU/OnB49IGNKhUTbhTJRALbWq+UJiT4X7K45mOzlEZ9372N9dQHEYdTo1sumQVgwgAJF
         r5sxgVLCQUDHupGKMZghyHT+f55bGIe7eKsA8FyeKq6sQ3hspvrXQrW8L48fK/vpLe05
         epzrwf9JiN4VcYuSFPFrOvEaK7la9L1Y7k2kAy8DCRiYGfDZNqcsa5q6vizmL05KdpLk
         Fd2GJbx+wu5ankR0gM4t66mIKVR5+RkDHRxK5AiCRY1nU0sJFlMxtXUhnT3R5iPYzZun
         ZAjQ==
X-Gm-Message-State: AOAM5317ivqJJqTKJeDq+b2X9D3+xDdV33+9Y/RN9+VZPt6x/yyDZBjw
	PZsi4wjNHJnDzMqWERvup0a2Ly8OmoIoaA==
X-Google-Smtp-Source: ABdhPJwVerKdP9w4NoEfmkBaHrtqEmK9MRdH4bfSJzzeyCexbubU9dAqgIpqLRYbYbiJnR7pf3LaqA==
X-Received: by 2002:a17:90a:e398:: with SMTP id b24mr1188658pjz.235.1592532671289;
        Thu, 18 Jun 2020 19:11:11 -0700 (PDT)
Return-Path: <arthur.she@linaro.org>
Received: from arthur-X1E.hitronhub.home (S0106a84e3f840fe3.vn.shawcable.net. [50.68.230.12])
        by smtp.gmail.com with ESMTPSA id w17sm4440185pff.27.2020.06.18.19.11.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2020 19:11:10 -0700 (PDT)
From: "Arthur She" <arthur.she@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: Arthur She <arthur.she@linaro.org>
Subject: [OE-core][PATCH v2] igt-gpu-tools: add new package
Date: Thu, 18 Jun 2020 19:10:57 -0700
Message-Id: <20200619021057.18734-1-arthur.she@linaro.org>
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

