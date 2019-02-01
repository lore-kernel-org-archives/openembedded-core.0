Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id A40A17C4A6
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Feb 2019 13:06:11 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id l9so6957526wrt.13
	for <openembedded-core@lists.openembedded.org>;
	Fri, 01 Feb 2019 05:06:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=VVMITTOzRtP3YRODncwFDJsmd1fGPspHTq5IvWmHZI0=;
	b=NtPrJFbiZdQ3qouGA5+pcChBeQfaazgCa3fHrEutrpVTY5aJ0geJp8cJVKyYtVQKUx
	dq+YNHx69tcM3a66Xbr6OAbwndVroWtfCKXmpfYK6sILpfoQ4nwul4dtcYSwfwozts/N
	kwC+clpTUN/UBR+1WzYd3idRusbR7vWJEBjP6DfwLxrIco581vfxmFqFpqQ4+tL37/Vs
	+iR1xzIOzypuiY/2n6xvlI0Xo8iK+LUmmIdtrlAswznDHKOlO9aAQekRgcMMNd5Awlgy
	KZrgazFSMndxXoaM2ezkqm4C7rX0+kmSgdtAwgfRZ694w1oKkQEVdYWJBj7HJ8FvEbQN
	Vt7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=VVMITTOzRtP3YRODncwFDJsmd1fGPspHTq5IvWmHZI0=;
	b=brSe/AmnmaXKZIhUbfM/s0M/lyyEy0YFkHaCytLUs7pjvb2PE6gEQNg3zdXP4yM890
	6Up/M63UTS3pcpPdhZLijlO6yAGVI6tvIwsK8K6X5KU/neSSLy5aNA2EEkSy560W3InB
	MywStBdoixkZD/0FCSNohzBwCHM8lSGh27wmB4/bv01TuwExFEeBe2CFmtNQzKjNvVqK
	iD1TtcQIBWjznjO9GNLZ4zbTUmBdmacvI8BFOc3V3jduv/3KckjWS7KNCy8pBorKc7nx
	FOiIOYzmCQYTf97VsbOat7ykQSPZlWSDY//rHDsa1VQqTmoL7wOqYlkO5HW1FkHAdE/5
	VuEQ==
X-Gm-Message-State: AJcUukeHff3oFDZOkLV8W1Rb71aUjTtu2DRPyTNLkXrJEwJyeSVyBi7t
	9CHmvc56R9627L7B8JCn1TXw4a1i
X-Google-Smtp-Source: ALg8bN4M4yStmBJDSYJFeD4KkbaWYKs0knbAS8WtBA5zSgfBACc4uVy3xMfIIDLPPIyAmhphT74/Ug==
X-Received: by 2002:a5d:44d1:: with SMTP id z17mr37546371wrr.271.1549026372122;
	Fri, 01 Feb 2019 05:06:12 -0800 (PST)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	a14sm1273972wrr.13.2019.02.01.05.06.11
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 01 Feb 2019 05:06:11 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  1 Feb 2019 14:05:50 +0100
Message-Id: <20190201130554.90094-9-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190201130554.90094-1-alex.kanavin@gmail.com>
References: <20190201130554.90094-1-alex.kanavin@gmail.com>
Subject: [PATCH 09/13] qemu: add environment variable wrappers to make qemu look good with gtk frontend
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
X-List-Received-Date: Fri, 01 Feb 2019 13:06:12 -0000

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


