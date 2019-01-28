Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id 3C23F7C495
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Jan 2019 12:47:26 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id f7so17966465wrp.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Jan 2019 04:47:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=VVMITTOzRtP3YRODncwFDJsmd1fGPspHTq5IvWmHZI0=;
	b=oEEOlsE0Jv1tcaicpiciw4GdcQJHAeWqTePsgblRBX6nQsXVQTvgqLhuAvUB6A7miT
	RdYH0GGeJX72BJsgTfgL7ZyRLhgeLsqaNsTWwGNAUBnHvJ74kFGekxkIln74iCjVKjoA
	5/lMSwXHmhg4XpnTz6BcNAdRZZ4aAo/HsxkyUXhoEOC4nrOAqGn4td7OKklhkkF79273
	0BBPKdmplzlggPvNUd6KPdZ5reydLzZH0jUVdOhsByzxpfoQG3byqJ5XU+Og2xZp/OjP
	pANOXrcQ+sEtxTxA+cw/55nHyHCxTJEIO1vueQpaKSWgJnQDrO9UFIaLFYyvVjyy05oy
	0xWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=VVMITTOzRtP3YRODncwFDJsmd1fGPspHTq5IvWmHZI0=;
	b=DWcANi5o0//wCll3uY9QueuZjP6xNNfm8la9k/3KIihJZVpgnoU/m/EUu446UZ2GCZ
	UrQ6o6o/1ACl1kimFFJe7dVFx+yJSlu2kxSSr8/ueNXxyRnrCNT56TPKFvTijAvNE+ab
	5PkfXoCdbcFViBpfEDRd3IE4DGHFIPyRwH5acKeq/NFRJQcXegtX4Ve6bpNo6vyT2q0b
	NjfKxl81BQ7+lQ5X9V9jkqjI0q8a/NpXhWZa3e88MYHT1Ju92vjfhfSPE9OwLMYwONj0
	hQhXK/OBL5KXVMjYFbh3SjVJSC8kEEi6X+UXjt51mLsZwrEPK5du8TmLHmBzpXQqLiXa
	RJYg==
X-Gm-Message-State: AJcUukfcfvCAxTu5zpbxPYOWgJfXyy8wRGcExbvik7krOX5YwdaXFq7Y
	9j5qCRXLpjg+lLVXhsgw8XU5LCR3
X-Google-Smtp-Source: ALg8bN58RdScO2DTfT05HjCsqM0dbr1nq/Vj8cycvksib8/06l0a/GVof64AjSatsf+KdhEfm8YaRQ==
X-Received: by 2002:adf:81c6:: with SMTP id 64mr22654304wra.186.1548679647478; 
	Mon, 28 Jan 2019 04:47:27 -0800 (PST)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	j33sm186026218wre.91.2019.01.28.04.47.26
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 28 Jan 2019 04:47:26 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 28 Jan 2019 13:46:50 +0100
Message-Id: <da6a3f924cdb7b5b1bb5adb1762321907866985f.1548679462.git.alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1548679462.git.alex.kanavin@gmail.com>
References: <cover.1548679462.git.alex.kanavin@gmail.com>
Subject: [PATCH 19/24] qemu: add environment variable wrappers to make qemu look good with gtk frontend
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
X-List-Received-Date: Mon, 28 Jan 2019 12:47:27 -0000

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


