Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	by mail.openembedded.org (Postfix) with ESMTP id 550197C080
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Jan 2019 15:03:45 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id y8so9144219wmi.4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Jan 2019 07:03:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=IwLpiGqUE53ZS2GYlU9JOZaoYGSGlKHKtTvNQz7Q1sI=;
	b=jfkLFKN9Yf6jitjX4B6ZnOZV6kYsLdPovwplQ+MRmAktBivfAgBw/eUP+h5GDO3XMw
	MRzYn6Y2So0b6cy3o6wZtbchUXjOzMhsKoK0u2eO0nQJYlQY3I/Et0Pmn4moetCCqYyA
	atCgjgWzAclSByqK/d6JCuzDuy81fnBuNk7Zh59DTT2MscGShOvG2a5esqQgOJfhj9Ew
	Il86RA4vKpT3qWhBDm9rL2Q8676eH4sL7oJ4t0noFPnr9HN8dfbIQuOjUxyyeQhrN06x
	4xsBgFmS7r7jpVkVbDErGb9xCw5qyeyqok6HDh+0ZeLr26S58NI62gmaCk3ZqX3gfImJ
	3u/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=IwLpiGqUE53ZS2GYlU9JOZaoYGSGlKHKtTvNQz7Q1sI=;
	b=ViWf0TCoUc2mZPeaoYJbbQ15fwrKH1axWjg4MW8SOjWrLNwuo4wG+affKZsemJ8kek
	kSSxplKeU+3p09tdsTm5MXOQnHaWfR9/AHnLzgoTRzOPlyqOfJnPd5vaVqoukrN3bp0d
	xID6Meg1XGX/m0k9gJbbjtgs3D7jg9ezIQW7snLkXy3V4vhTq7jyOKidjcGXH/MdU0Vw
	BbH1iqFZujdoUxhQHscMGsuB1tMFwuuev0b8rAqZATkpkOK9sbv3qwCGswehlax03/jn
	fnbC5Vp6UV+c+zg3DjqG1NZ10zEOO7/9w9NNtTUyGbSp0a5qdBfUQcbmKNyBJ2tYbXc4
	eMmA==
X-Gm-Message-State: AJcUukfA8i39LveKZAvZnEVgyX57IdIoHYIo8dojJyeJkGm+5rc3mJ35
	NQpp/WnASUSvy/SdnnFpiJrCZ7NN
X-Google-Smtp-Source: ALg8bN6hqdiQpbJGnUPpBX230/7efNLqeUilpBwGX24w0j4WLBUomMdIIgtanhYCUPOjfpDVemPwbw==
X-Received: by 2002:a1c:dd04:: with SMTP id u4mr12174243wmg.84.1547478225686; 
	Mon, 14 Jan 2019 07:03:45 -0800 (PST)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	y34sm201725236wrd.68.2019.01.14.07.03.44
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 14 Jan 2019 07:03:44 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 14 Jan 2019 16:03:18 +0100
Message-Id: <1557891163152272e4aaf49797cb95e8cf9b0b0f.1547477793.git.alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1547477793.git.alex.kanavin@gmail.com>
References: <cover.1547477793.git.alex.kanavin@gmail.com>
Subject: [PATCH 22/23] qemu: add environment variable wrappers to make qemu look good with gtk frontend
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
X-List-Received-Date: Mon, 14 Jan 2019 15:03:45 -0000

GTK_THEME instructs gtk to use its built-in theme. Otherwise
gtk attempts to use the theme from the host, which may be from
a totally mismatching gtk version.

On the other hand FONTCONFIG_PATH tells it to use the host fonts,
as providing fonts in the native sysroot and instructing the components
to use them is a lot more tricky.

GDK_PIXBUF_MODULE_FILE is set, because otherwise qemu works but
fills stdout with error messages, which eventually fill the pipe
stdout is redirected to by runqemuscript , which causes the qemu process
to lock up.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-devtools/qemu/qemu.inc | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index 6937bbc87b4..23da51b5938 100644
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


