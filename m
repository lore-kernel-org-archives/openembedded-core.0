Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f67.google.com (mail-pg0-f67.google.com [74.125.83.67])
	by mail.openembedded.org (Postfix) with ESMTP id B6048749A2
	for <openembedded-core@lists.openembedded.org>;
	Thu,  3 May 2018 15:27:06 +0000 (UTC)
Received: by mail-pg0-f67.google.com with SMTP id j11-v6so13384674pgf.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 03 May 2018 08:27:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=LUB9Fzdy6S+xaou0fmwv9Jcr43JzPn8Z+wVMlq+5p44=;
	b=KEt5ZlE7w70IF+NOHJx7RIo2itLxFaU5XELy/1yEXYJZKKaXer2okDhM/o5PPadrwn
	9HkHNQMmIbhjAn6L/WzBxlgQ6WNzy7khtv/SM3rGyzCl5jg16ID1lVw21F1GeUn44IWf
	R+r8S4Gm8IDl2f7KPcy7MYHLQq4Pem9nlVp75n4nGHHtZeMmcupWpC6hQTrPDpYtsERg
	C0YWPiv1rYdgbZ6fVhHVXA/qAncrzHarsd4BZdR4kPzxt/eFjQ6jbihqeWea/XKSptSn
	Fymfc1XPQ4PMkW+isjGr0AeCoFzoFXd3l85AcWVwbxe/f/QpcS+PXKp+Nl5i77QJHSck
	hu1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=LUB9Fzdy6S+xaou0fmwv9Jcr43JzPn8Z+wVMlq+5p44=;
	b=fR/dNbBljg1D0KrixS1X2jfa7zr7zRgvOHMzBqgmHxrlJcED2OootD5Yd462/BxNXq
	IeGNjLd8nEdcwta1LICTgRQlFpVnIOJ4YRaH50Vuj2oQzQFDbMfiH/qj1l4krHSzcPih
	KrRBdE2VE8I2zpk6u+2atyY/oJlo3/N27b9lNXzZQGYiOF2r2wBEDeiXUi1U1EfC3RqB
	r4yLUP+YkmrsctUvMgyC1vuaAinyauQe1IyuaTbn9d4faPmRWB5CuxeJIJEajx7vac2a
	VI3kq3Y0acxgfFgKYxNErCyYz8SydOjLeaaJL+ErJ+c+3QX8iMIA74XUqSCYfYaPmttH
	XxGw==
X-Gm-Message-State: ALQs6tC8JhToxoB6XIOw+fwJ5pH727MPUnQ79OfDCm4qvqv/TTd1P9SX
	7Gz/Qnr0BTE4PIhnf678y0ob/g==
X-Google-Smtp-Source: AB8JxZqnBMA3YkIOnAM9wDi6+s78A595TIucgNTCyFVDkHfJ1m6hBzPcybyQ0xS3OXkJk+48/LARvQ==
X-Received: by 2002:a17:902:9a9:: with SMTP id
	38-v6mr24732525pln.114.1525361227408; 
	Thu, 03 May 2018 08:27:07 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::52a0])
	by smtp.gmail.com with ESMTPSA id
	5sm21396840pfx.140.2018.05.03.08.27.06
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 03 May 2018 08:27:06 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  3 May 2018 08:27:02 -0700
Message-Id: <20180503152702.4684-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.17.0
Subject: [PATCH V3 01/28] libssp-nonshared: Add recipe
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
X-List-Received-Date: Thu, 03 May 2018 15:27:07 -0000

libssp-nonshared is a minimal gcc runtime piece which is needed
on non-glibc systems which do implement libssp APIs in libc

Use PIE flags to compile libssp_nonshared.a so it works with
security flags on as well

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
Changes since v1:
- Compile as PIC
Changes since v2:
- Use -fPIE instead of -fPIC, this makes it work with poky-lsb

 meta/recipes-core/musl/libssp-nonshared.bb    | 39 ++++++++++++++++
 .../musl/libssp-nonshared/ssp-local.c         | 45 +++++++++++++++++++
 2 files changed, 84 insertions(+)
 create mode 100644 meta/recipes-core/musl/libssp-nonshared.bb
 create mode 100644 meta/recipes-core/musl/libssp-nonshared/ssp-local.c

diff --git a/meta/recipes-core/musl/libssp-nonshared.bb b/meta/recipes-core/musl/libssp-nonshared.bb
new file mode 100644
index 0000000000..458eafef52
--- /dev/null
+++ b/meta/recipes-core/musl/libssp-nonshared.bb
@@ -0,0 +1,39 @@
+# Copyright (C) 2018 Khem Raj <raj.khem@gmail.com>
+# Released under the MIT license (see COPYING.MIT for the terms)
+
+SUMMARY = "Minimal libssp_nonshared.a must needed for ssp to work with gcc on musl"
+LICENSE = "GPL-3.0-with-GCC-exception"
+LIC_FILES_CHKSUM = "file://ssp-local.c;beginline=1;endline=32;md5=c06d391208c0cfcbc541a6728ed65cc4"
+SECTION = "libs"
+
+SRC_URI = "file://ssp-local.c"
+
+PATH_prepend = "${STAGING_BINDIR_TOOLCHAIN}.${STAGINGCC}:"
+
+INHIBIT_DEFAULT_DEPS = "1"
+
+STAGINGCC = "gcc-cross-initial-${TARGET_ARCH}"
+STAGINGCC_class-nativesdk = "gcc-crosssdk-initial-${SDK_SYS}"
+
+DEPENDS = "virtual/${TARGET_PREFIX}binutils \
+           virtual/${TARGET_PREFIX}gcc-initial \
+"
+
+do_configure[noexec] = "1"
+
+S = "${WORKDIR}"
+
+do_compile() {
+	${CC} ${CPPFLAGS} ${CFLAGS} -fPIE -c ssp-local.c -o ssp-local.o
+	${AR} r libssp_nonshared.a ssp-local.o
+}
+do_install() {
+	install -Dm 0644 ${B}/libssp_nonshared.a ${D}${base_libdir}/libssp_nonshared.a
+}
+#
+# We will skip parsing for non-musl systems
+#
+COMPATIBLE_HOST = ".*-musl.*"
+RDEPENDS_${PN}-staticdev = ""
+RDEPENDS_${PN}-dev = ""
+RRECOMMENDS_${PN}-dbg = "${PN}-staticdev (= ${EXTENDPKGV})"
diff --git a/meta/recipes-core/musl/libssp-nonshared/ssp-local.c b/meta/recipes-core/musl/libssp-nonshared/ssp-local.c
new file mode 100644
index 0000000000..8f51afa2c1
--- /dev/null
+++ b/meta/recipes-core/musl/libssp-nonshared/ssp-local.c
@@ -0,0 +1,45 @@
+/* Stack protector support.
+   Copyright (C) 2005-2018 Free Software Foundation, Inc.
+
+This file is part of GCC.
+
+GCC is free software; you can redistribute it and/or modify it under
+the terms of the GNU General Public License as published by the Free
+Software Foundation; either version 3, or (at your option) any later
+version.
+
+In addition to the permissions in the GNU General Public License, the
+Free Software Foundation gives you unlimited permission to link the
+compiled version of this file into combinations with other programs,
+and to distribute those combinations without any restriction coming
+from the use of this file.  (The General Public License restrictions
+do apply in other respects; for example, they cover modification of
+the file, and distribution when not linked into a combine
+executable.)
+
+GCC is distributed in the hope that it will be useful, but WITHOUT ANY
+WARRANTY; without even the implied warranty of MERCHANTABILITY or
+FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License
+for more details.
+
+Under Section 7 of GPL version 3, you are granted additional
+permissions described in the GCC Runtime Library Exception, version
+3.1, as published by the Free Software Foundation.
+
+You should have received a copy of the GNU General Public License and
+a copy of the GCC Runtime Library Exception along with this program;
+see the files COPYING3 and COPYING.RUNTIME respectively.  If not, see
+<http://www.gnu.org/licenses/>.  */
+
+extern void __stack_chk_fail (void);
+
+/* Some targets can avoid loading a GP for calls to hidden functions.
+   Using this entry point may avoid the load of a GP entirely for the
+   function, making the overall code smaller.  */
+
+void
+__attribute__((visibility ("hidden")))
+__stack_chk_fail_local (void)
+{
+  __stack_chk_fail ();
+}
-- 
2.17.0


