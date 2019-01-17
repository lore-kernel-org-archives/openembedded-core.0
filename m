Return-Path: <alex.kanavin@gmail.com>
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com
	[209.85.208.174])
	by mail.openembedded.org (Postfix) with ESMTP id B0DD87C242
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Jan 2019 16:40:45 +0000 (UTC)
Received: by mail-lj1-f174.google.com with SMTP id n18-v6so9126653lji.7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Jan 2019 08:40:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=28IJKQqOB2dcUo3ZqP31SebEclPKGQ4evGx2c8oljIk=;
	b=gnYCmQgnOcfU4o/lwl7WCtv94kt7FsCErRlYulp9AdImin5J6S59zDgNS/VpfuZRoN
	jE24cqQZjMQCa9LB4CPOw/Bt3mh8h7QnnWEkZk9pI+BKCU9hobYcrxX8ZNtrsDtzoK4t
	FqZ9HzldqIQbFZxZ732wMnis9R6mlw6PKihR0ubL+nptFk3ZqIpl3oK5OoUktt8crbHe
	sk2Kpj0tXpCiXS3FFnUfS3DPsbdoctGXKzEqigwI9prgTpwK+EVQLq+9vdOoGycrgYmS
	dSxnzzpWwXLVGW1QEhNS1hDfUl2I28APjTeuSw00eTHgSGIXISLl/zebKYD8ctI32F0p
	MwRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=28IJKQqOB2dcUo3ZqP31SebEclPKGQ4evGx2c8oljIk=;
	b=uhj04FrmCknaMUxKbpzO8eMHasV1anDbXir6z7bB+EuU4oKOAABxcfXswjfiSBRfll
	R7C/jgYjAIGti886Phbf7XGHmKyna4Jils7tmLGDV/hvXH04TVx8d4x0aa09mD7Ly0j/
	KZhYYEyW4/EC/Zu3H4AFuh1s99ebEOuFlgDM4kbie7jNBjfcaQJi3h2ejHTUxk8Jtggb
	Z0Na0+rBBdul2gQGWmbrIRVNJNwLZrYj32hEJsXNJqJIPvGugPFBs5RmaVOqgVKaqTOP
	R+zNRi6gFK8TMbXCiJagjkUb0bCWon8UwcdgghzOchjh43WUs50uQCIScg5AyKT/odYp
	dY9w==
X-Gm-Message-State: AJcUukdeHB5uMr7YPCQKqAdyW5ehIpmD0aRs2LzjTvny5i9ynmrP/qau
	BuIn+YDyEV6IMMvDmB1VVh+154ud
X-Google-Smtp-Source: ALg8bN4ln4cb+OhpS/hYLy48Amm12wI7wdtzSS1XkP+XUKjZ/kjdSXCaV3nD7d1UKnPb3JaF4Obl7Q==
X-Received: by 2002:a2e:4601:: with SMTP id
	t1-v6mr10679263lja.111.1547743245868; 
	Thu, 17 Jan 2019 08:40:45 -0800 (PST)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id k14sm373098lfc.70.2019.01.17.08.40.44
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 17 Jan 2019 08:40:45 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 17 Jan 2019 17:40:04 +0100
Message-Id: <9ae7a8e29456041793f974f6accd25d22456da80.1547743126.git.alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1547743126.git.alex.kanavin@gmail.com>
References: <cover.1547743126.git.alex.kanavin@gmail.com>
Subject: [PATCHv3 19/27] qemu: add environment variable wrappers to make qemu look good with gtk frontend
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
X-List-Received-Date: Thu, 17 Jan 2019 16:40:46 -0000

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


