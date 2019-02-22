Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	by mail.openembedded.org (Postfix) with ESMTP id 72F4E7CBE4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Feb 2019 14:34:02 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id v26so2166668wmh.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Feb 2019 06:34:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=VVMITTOzRtP3YRODncwFDJsmd1fGPspHTq5IvWmHZI0=;
	b=SkoXBddDX+zP2IRaWZ2QK0d6ljp7aimP2TLa0l5O+yK9BEcmCrvGSlyM4Rt2eSM4jb
	dPF9pywf5EUMr/8yV2OEAjAOW84Fw3i0nrNxvXKTlz+3mll2JMB06eo23/Qe9gjtgx0J
	C1uPy7Q79+1udYKisBwk4QYx0JTdxN+zCA3s839l0QnEwS4mKANpWwAig66cSgwr08pq
	jIFh07pND/zjNpDZG18FGeRcqkdhKL2PeQlKGRW0OHYcfB2419JitB/+yUosgLijhBrI
	yLdFl/MaNpEzBMGwikOMFWJJJxg0ITnuGNxG8p352cMx4yCqHT0DppqJPCllexSkK3CK
	s39Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=VVMITTOzRtP3YRODncwFDJsmd1fGPspHTq5IvWmHZI0=;
	b=hJRzvQ/Wj5fGFG5ab13RC2D42KqQFHH6mVd+0tLHYyUQ2rAiOMJN7KAz60J0GcvMfT
	ICGyGy4h9frEpdfPiFA1adoTDq9fWGk1N0BoY9bwUIoife0rhvr81/6kymXIDKymWLT5
	58U0W4U8Pz3UevKCzx2YQNztDgEC2jJoDWOlIg9P6xbSAemmClt2q1OSkN5wuq/Y/rwT
	Ev61jhGd86GH6B0JwMsIbv/d8fQt3E+VAG874Bnh1nQdIMCuOrnbeuoUTwXXPSJW1dSJ
	JP1N8kDqanr8C8/e48jyDlDOj18NnQCXVDrKWCLSLuCo3/KaOwMwtXGMgQXx47z4kQaR
	w4hw==
X-Gm-Message-State: AHQUAubkikQgTAhPKTRyzcFjEld0KMt1oDZRnXkYhZL1yp0c9fqwOmDp
	L0yJPBY4gZzY9iJfz4kyae7TVDpJ
X-Google-Smtp-Source: AHgI3IZ4xVZYSLbIM1p4VQNl9PqEe8Ye7CFPrS4G91ToQYM6UMFiqFLxGTRaSbaxJn7FNCz6ELgh8Q==
X-Received: by 2002:a1c:c102:: with SMTP id r2mr2674672wmf.126.1550846042587; 
	Fri, 22 Feb 2019 06:34:02 -0800 (PST)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id p1sm2085184wrx.50.2019.02.22.06.34.01
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 22 Feb 2019 06:34:01 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 22 Feb 2019 15:33:43 +0100
Message-Id: <747db1b0bfbc82b8c43f0c9c32ccd26ebb494768.1550845989.git.alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1550845989.git.alex.kanavin@gmail.com>
References: <cover.1550845989.git.alex.kanavin@gmail.com>
Subject: [PATCH 08/12] qemu: add environment variable wrappers to make qemu look good with gtk frontend
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
X-List-Received-Date: Fri, 22 Feb 2019 14:34:02 -0000

GTK_THEME instructs gtk to use its built-in theme. Otherwise
gtk attempts to use the theme from the host, which may be from
a totally mismatching gtk version.

On the other hand FONTCONFIG_PATH tells it to use the host fonts,
as providing fonts in the native sysroot and instructing the components
to use them is a lot more tricky.

GDK_PIXBUF_MODULE_FILE is set, because otherwise qemu works but
fills stdout with error messages, which eventually fill the pipe
they go into. That pipe is read from only when qemu exits (to
collect any error messages) by runqemu script. The pipe fill-up
causes the qemu process to lock up.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-devtools/qemu/qemu.inc | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index b80b9e131a1..9a989f00b0b 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -48,6 +48,25 @@ do_install () {
 	oe_runmake 'DESTDIR=${D}' install
 }
 
+make_qemu_wrapper() {
+        gdk_pixbuf_module_file=`pkg-config --variable=gdk_pixbuf_cache_file gdk-pixbuf-2.0`
+
+        for tool in `ls ${D}${bindir}/qemu-system-*`; do
+                create_wrapper $tool \
+                        GDK_PIXBUF_MODULE_FILE=$gdk_pixbuf_module_file \
+                        FONTCONFIG_PATH=/etc/fonts \
+                        GTK_THEME=Adwaita
+        done
+}
+
+do_install_append_class-native() {
+     ${@bb.utils.contains('PACKAGECONFIG', 'gtk+', 'make_qemu_wrapper', '', d)}
+}
+
+do_install_append_class-nativesdk() {
+     ${@bb.utils.contains('PACKAGECONFIG', 'gtk+', 'make_qemu_wrapper', '', d)}
+}
+
 # The following fragment will create a wrapper for qemu-mips user emulation
 # binary in order to work around a segmentation fault issue. Basically, by
 # default, the reserved virtual address space for 32-on-64 bit is set to 4GB.
-- 
2.17.1


