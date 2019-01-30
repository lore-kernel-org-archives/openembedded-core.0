Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	by mail.openembedded.org (Postfix) with ESMTP id 043B87C2D5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Jan 2019 11:00:06 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id m22so21227041wml.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Jan 2019 03:00:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=VVMITTOzRtP3YRODncwFDJsmd1fGPspHTq5IvWmHZI0=;
	b=TB+MAjJMtG6J+eRd/Fs2J/JNFgek5Wf83/oRFZ+oYNeYRVk3rVDQqR8B1AAjfc+kMW
	FRL72K85jJH3Kvh+qtlnU4Vv4RCGIkgAYlu1ddvudEb98CYcYYnRN3otI2zbwD29+5R7
	C9rocSyonJdH+7R+vCDOClAP/IIdzpTf4CdYqOpqaR3xJ9xZkqQQ9bUsDMUMqvxxWyqZ
	bVH9AO8wOfzReB4CpIaXnUm4JahWUhYw/ZV208KbCosd5jPOIsCWltU52/dr9StztCIN
	WVX/5BcKetz8o+tVOL+OSPXKKs5dvinXXM6Cj5hHeidiKDxJIoGK2DtZM/fmIBvtBS6z
	0qhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=VVMITTOzRtP3YRODncwFDJsmd1fGPspHTq5IvWmHZI0=;
	b=nOw+UzbbeUWbFAE/FSRIOD+u0g9fPRoGDfiThAY3Em+qtKlyP1or1jzOf+vFUmK8QM
	CsukKrD4RGntaUideYEAKMY6hQJlGAMe1H8NkRfVAe8OGgdFM8vpE9k9UoTHtEYcYaU0
	1FSA8XZb3rJb0ii92J34MrI/agphsZ0OivKILHieqfqexwEwBYgvaFODSEjLGgAJQLch
	NzUg8ntHV4bD0oBfCzBKTVyAq/YdFiGpqGxnzNsAtwE9ynePVdBPuZazkYS67w+Oihue
	7kmjqR2qR2oLctBeI5uBBlB6goLrqfqWrdzT37Dn6W3GX1coBS2oFK+nFKApIRtBqoFW
	vLeQ==
X-Gm-Message-State: AJcUukcxBQDSCnus11hWcwreCzc2Sx8X+p66e9lf9ezOffcbZy2F1/ar
	jMUh5amywv7OSg1Us+faMlenZQgd
X-Google-Smtp-Source: AHgI3IasD99MS+QG/VTHQnKeD1jI/d1qkTB6pNHc1GvEhfMQuOiLGoWP9u6PtmKIY6Pm9xUlhm58Tg==
X-Received: by 2002:a1c:c282:: with SMTP id
	s124mr14164136wmf.105.1548846006988; 
	Wed, 30 Jan 2019 03:00:06 -0800 (PST)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	a18sm1127705wrp.13.2019.01.30.03.00.06
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 30 Jan 2019 03:00:06 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 30 Jan 2019 11:59:38 +0100
Message-Id: <9f6a4f9779ce9d955102c70d19dd3bd93d69cf7e.1548845917.git.alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1548845917.git.alex.kanavin@gmail.com>
References: <cover.1548845917.git.alex.kanavin@gmail.com>
Subject: [PATCH 15/20] qemu: add environment variable wrappers to make qemu look good with gtk frontend
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
X-List-Received-Date: Wed, 30 Jan 2019 11:00:07 -0000

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


