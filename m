Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com
	[209.85.210.170])
	by mail.openembedded.org (Postfix) with ESMTP id 1810360D24
	for <openembedded-core@openembedded.org>;
	Sun,  9 Feb 2020 16:10:17 +0000 (UTC)
Received: by mail-pf1-f170.google.com with SMTP id p14so2421925pfn.4
	for <openembedded-core@openembedded.org>;
	Sun, 09 Feb 2020 08:10:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=s3TaewR9NLb94JkopkW2bzNcpPCDI1EBvzmcx4Dk79M=;
	b=QDHvvthpHKfHJcmcwlckQ0c1JIrjODslWAeqeaOYuWvr8goNRvSnW0joQF1MrnAY3+
	9Qh5D0SiCHCx1ygAGPW3Hv1gK7T9lpppmXV+OV57KIbIIZjOQ/b0IOGhevVB0VWc1kmY
	+yX1HxnZH604U0bpqApLDHo7UDu7VdWwQf/qshGlrKPWJ98qGGLf2p9ezaKlNNe0ENBU
	OzxqXJTc8yT2V/X4MrWRYa+GzwVP1oBzDG5G64Jmleo16sxGHrl9JOoJ6TUGqBx/EWSN
	IwRJlOKil9J7g/J+cGYRsWu4HjJMj9N34ERAud1WwZp1KkYYtKXQbtMkjrCX953ekCC3
	ceog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=s3TaewR9NLb94JkopkW2bzNcpPCDI1EBvzmcx4Dk79M=;
	b=FQnZDfkUJGuB3rgwDinoLhTKoO0Q1dK1LcmgkADNhudpU1fFn8BDCMl8erlBiWQpDB
	lFvod+H5sRgxKycMnIs5tGXqD0kRqxcOcBFnFB0Y7FtGiydufntgYY5O/7L6HqPnQTDt
	V1EVUOduHoXj9sWSVYq86/tBOwcEdAjjWbaZUL+uRkXnn7ZLp1s/Pu3J2KaOhmq5R5yO
	qANKUZYUea/aaKAxoCA/yS14Jem/DlYT5biceMr4VXY0PalWBaa5LEOq8UIXL3JhOHDp
	Tf+gRFWslSe2RrkkvW1oYjlciL0nnWGF/jP+OLXeId3MisMvOZ8CUqiRawYQZBTG3Clw
	cs0g==
X-Gm-Message-State: APjAAAU/4+LXRZiJTiMaQjVrrmgRzcplwUrW/p5FVGVHpT09JLBSV8FA
	oOOJXpElgH0ScArcmhBZB6X0HtQM
X-Google-Smtp-Source: APXvYqyIzcyCq1nGLEKEbjedc9/b/Wicar5JMUzy90g3cpjoaSVKZeb3iYbh+4Fii74Zjk1N3xhCNg==
X-Received: by 2002:a63:7c4d:: with SMTP id l13mr9869052pgn.275.1581264618962; 
	Sun, 09 Feb 2020 08:10:18 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:154b:3780:5122:4aa9])
	by smtp.gmail.com with ESMTPSA id
	u126sm9408153pfu.182.2020.02.09.08.10.18
	for <openembedded-core@openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 09 Feb 2020 08:10:18 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@openembedded.org
Date: Sun,  9 Feb 2020 08:09:47 -0800
Message-Id: <79ea42840c82f3c14d4c735b6c6f5827195d1612.1581264380.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1581264380.git.akuster808@gmail.com>
References: <cover.1581264380.git.akuster808@gmail.com>
Subject: [zeus 19/29] gtk+3: sort resources for reproducible binaries
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
X-List-Received-Date: Sun, 09 Feb 2020 16:10:18 -0000

From: Ross Burton <ross.burton@intel.com>

The list of resources is gathered with $(wildcard) in Make, which isn't
sorted. If this order changes then the generated libraries will differ.

(From OE-Core rev: f3675be6be29426688187a135221431a0941d007)

(From OE-Core rev: a2a6d9fa4df66a1f52c1c1fec45eedb4199e8162)

Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../gtk+/gtk+3/sort-resources.patch           | 19 +++++++++++++++++++
 meta/recipes-gnome/gtk+/gtk+3_3.24.8.bb       |  1 +
 2 files changed, 20 insertions(+)
 create mode 100644 meta/recipes-gnome/gtk+/gtk+3/sort-resources.patch

diff --git a/meta/recipes-gnome/gtk+/gtk+3/sort-resources.patch b/meta/recipes-gnome/gtk+/gtk+3/sort-resources.patch
new file mode 100644
index 0000000000..7f87372c52
--- /dev/null
+++ b/meta/recipes-gnome/gtk+/gtk+3/sort-resources.patch
@@ -0,0 +1,19 @@
+If the resources file isn't sorted in some way then libgdk.so will differ
+depending on the inode order of the resource files.
+
+Upstream-Status: Pending
+Signed-off-by: Ross Burton <ross.burton@intel.com>
+
+diff --git a/gdk/Makefile.am b/gdk/Makefile.am
+index e25b57ba50..26f2d57c6e 100644
+--- a/gdk/Makefile.am
++++ b/gdk/Makefile.am
+@@ -465,7 +465,7 @@ stamp-gc-h: $(top_builddir)/config.status
+ # Resources
+ #
+ 
+-glsl_sources := $(wildcard $(srcdir)/resources/glsl/*.glsl)
++glsl_sources := $(sort $(wildcard $(srcdir)/resources/glsl/*.glsl))
+ 
+ gdk.gresource.xml: Makefile.am
+ 	$(AM_V_GEN) echo "<?xml version='1.0' encoding='UTF-8'?>" > $@; \
diff --git a/meta/recipes-gnome/gtk+/gtk+3_3.24.8.bb b/meta/recipes-gnome/gtk+/gtk+3_3.24.8.bb
index d79b18bee0..596dee6264 100644
--- a/meta/recipes-gnome/gtk+/gtk+3_3.24.8.bb
+++ b/meta/recipes-gnome/gtk+/gtk+3_3.24.8.bb
@@ -7,6 +7,7 @@ SRC_URI = "http://ftp.gnome.org/pub/gnome/sources/gtk+/${MAJ_VER}/gtk+-${PV}.tar
            file://0002-Do-not-try-to-initialize-GL-without-libGL.patch \
            file://0003-Add-disable-opengl-configure-option.patch \
            file://link_fribidi.patch \
+           file://sort-resources.patch \
           "
 SRC_URI[md5sum] = "eeedde01856238114dcf4df3ebc942a5"
 SRC_URI[sha256sum] = "666962de9b9768fe9ca785b0e2f42c8b9db3868a12fa9b356b167238d70ac799"
-- 
2.17.1


