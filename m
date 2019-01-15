Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
	[209.85.221.50])
	by mail.openembedded.org (Postfix) with ESMTP id ED2CA7C124
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Jan 2019 16:39:23 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id t6so3664145wrr.12
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Jan 2019 08:39:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=28IJKQqOB2dcUo3ZqP31SebEclPKGQ4evGx2c8oljIk=;
	b=bzh7DHhcq7Gfo2sijdtBc0PiDZ8J6VjfXciFBABID2PkSDn2QeMRoUcSL/pB1NX2Ib
	RMRk0A5DginH3erxh4tqSiRHiwPkWwLjEbZtyEZsVsXlu1ubcXJpDxOsJjzSM5dqMoK6
	yYTKLXDhKzQWWOeU4O1ua74jwhfd4axH6xaQp2YWnk95SnUdkmWXKOEfolJ51MqbQvzT
	DIYO9i1KmpuoQD29/xSBnj3r7QBaBYjztnV6Wr0YDxLUffnz4X3GEJLxwyPg5+hRk4pJ
	3diyZapbWYL4ixSSgqRPR5ZV8+t8pdJgf7vR1jkw25OC/7f2L5R1FJFcC0Hxxce0T8QL
	m1gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=28IJKQqOB2dcUo3ZqP31SebEclPKGQ4evGx2c8oljIk=;
	b=qiHvOT63fMvDKXTgEEOuxfD4e5dOl6G14diDu1DAoEWZtzbyfjeUZhds2SEPFUCn3v
	Ps4lbvztdyV3As68tetW3j+Zuq91oypWbpANCCKxEQkLT6A8XrklEpiGYn9R8Go6oGQv
	EgMdADwuyZS+wOhCYXhh3tW1q240KLW2VUJ/wHB2SRhFNvdyz1JGKRTrO/R4R76RLr3K
	JGJZPSAtgsVK+ahPn7ueg7J60d8k2rUeIRg/7pZDbYMB5f1QO7bSku+E2n4sOSAUdACP
	fWLagLtyBvhiDbZn8evahdieDHj0hddE6krLQ3xLo6aWdPK3idIno/iKR7bl8O/Wv62u
	bdkw==
X-Gm-Message-State: AJcUukfTwzWomowYl7C0vD9DHVkbNmg8WJjJoDCB9KxLeBijo2r9eq89
	rjuOrpi5nBWv2AOHVZAbz5efNXInYnE=
X-Google-Smtp-Source: ALg8bN5rb4KaI/OQs2qt8k6bdIaLVVuOLgOy6Yu7UwIOS9QUjkgour+B+JYPMj5iYA1tVXu16iZHow==
X-Received: by 2002:adf:9c8a:: with SMTP id d10mr3751728wre.244.1547570364379; 
	Tue, 15 Jan 2019 08:39:24 -0800 (PST)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	f15sm77594927wrt.10.2019.01.15.08.39.23
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 15 Jan 2019 08:39:23 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 15 Jan 2019 17:38:56 +0100
Message-Id: <8d5b8f2c8689eb5cc2f974c837f2983ce9c30df3.1547570285.git.alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1547570285.git.alex.kanavin@gmail.com>
References: <cover.1547570285.git.alex.kanavin@gmail.com>
Subject: [PATCHv2 21/22] qemu: add environment variable wrappers to make qemu look good with gtk frontend
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
X-List-Received-Date: Tue, 15 Jan 2019 16:39:24 -0000

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
 meta/recipes-devtools/qemu/qemu.inc | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index 08ae9eca2bd..11f658e80ac 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -48,6 +48,28 @@ do_install () {
 	oe_runmake 'DESTDIR=${D}' install
 }
 
+do_install_append_class-native() {
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
+do_install_append_class-nativesdk() {
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
 # The following fragment will create a wrapper for qemu-mips user emulation
 # binary in order to work around a segmentation fault issue. Basically, by
 # default, the reserved virtual address space for 32-on-64 bit is set to 4GB.
-- 
2.17.1


