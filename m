Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	by mail.openembedded.org (Postfix) with ESMTP id 6C8F37C5DE
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Feb 2019 14:46:07 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id m1so3692119wml.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 Feb 2019 06:46:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=VVMITTOzRtP3YRODncwFDJsmd1fGPspHTq5IvWmHZI0=;
	b=AWDT0z44LT7Sf2Y04jqmyOC8qf5oZoJuexKvNElkGLtoIjbb7/P5WvqSxAemvg+P5T
	RU+VjCucfYC2l2c/GCuHYqu8vPuKdKIf58WyknHYxqGAbKOrbA2OZzyYHB64BRp3THvD
	Gs1EXYeXmFSxj7iLQ5LsPfTzKNIy86M3XDA8NhXyyaq8tN2QfTJbaVQUq7YUGIdcNIB9
	ezG/zZROJQH3SxxotffaQuOQhcQ0Y1NdXErqoTn+RQmolioGeTgBCwJQowg7qJoaHsyb
	MNtZLzpQCBdgZwq3f/32nFcE1OzcL1MjbyPgeINJURX32havl9tEuyQ9t/rOZj/SqVIY
	t5Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=VVMITTOzRtP3YRODncwFDJsmd1fGPspHTq5IvWmHZI0=;
	b=aAUxBg5CO9mrkhI4K92VlGCb6r6H2nYXXJiJIKijfxE8dFe0OMv1r5aM/7Zq9rdMNq
	FTjHpHuFFADjoytvzgZG1qkskvmt3v91S4dRd/iIr9+N3F7AdJ78Ga+vfSyDr4XlGfsv
	Kgumcul2dQiBy+UH2XT1EmBzEari6GsUDeL7J52/yw6oaDucQy1qz2zRIurfViguEvfa
	z80hMj+gSvTKLo4ANdfk/faK3bZS2boEpcCIy5WLdXNEI4v01ad24efsJaZClvIIqFGZ
	1Bv/roftNzQsCG17nphxxoS9d+BoDXbxvoEnFXYwAIng/Kv9cTzdPg0A0ycgScDRFWpw
	Zljg==
X-Gm-Message-State: AHQUAuaWWvcZcr9Pk/HUqldvxkGec3PZaGgf+Q9G4v65uoU7uPwSivYe
	hxV/dyEaO3AZ872yPs3IcQExW2NO
X-Google-Smtp-Source: AHgI3Ib+DR8J8j9EcXBmJdaIaKhPd9VbBiFHkzwxdSHGfMixg+HRB29RePFHbiVCUfiepHHOOla6OA==
X-Received: by 2002:a1c:6442:: with SMTP id y63mr11315409wmb.143.1549637167959;
	Fri, 08 Feb 2019 06:46:07 -0800 (PST)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id j3sm3365709wmb.39.2019.02.08.06.46.07
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 08 Feb 2019 06:46:07 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  8 Feb 2019 15:45:49 +0100
Message-Id: <bdc23978df8d01f3e9bc70a6a9fa4bd29a969b87.1549637121.git.alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1549637121.git.alex.kanavin@gmail.com>
References: <cover.1549637121.git.alex.kanavin@gmail.com>
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
X-List-Received-Date: Fri, 08 Feb 2019 14:46:07 -0000

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


