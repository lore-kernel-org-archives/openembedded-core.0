Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19704FC980E
	for <webhook@archiver.kernel.org>; Sun, 29 Mar 2026 22:38:09 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.38376.1774823887126862030
 for <openembedded-core@lists.openembedded.org>;
 Sun, 29 Mar 2026 15:38:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=ytXFk5q1;
 spf=pass (domain: smile.fr, ip: 209.85.221.43, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-43b9144790dso2053406f8f.1
        for <openembedded-core@lists.openembedded.org>; Sun, 29 Mar 2026 15:38:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1774823885; x=1775428685; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0dMej7lmszqTsa6UScljJ48enl+M0n1Z9R80lxhs580=;
        b=ytXFk5q1vvxaKVF02inO7mVwnw4uN5rp2bBCAImJUozejHpwOf8rN7OYpF4DwD9FtV
         EBYj/anxJvc9IxF+gGjJFOdcAySga4ROK72X6feKjdeYte/PWOOnKEb3jfl0YBw6oyT5
         pgKj7NL5zJKx0rI0A5Ji/ebXu7/kBm7N+lvnM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774823885; x=1775428685;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=0dMej7lmszqTsa6UScljJ48enl+M0n1Z9R80lxhs580=;
        b=AU0F6ptMWdywm5DygdWfsJ2uliTIiYFVSUEgRWHXA5KB4I0Yg2CueYais3G2BwbMe4
         6c21htbmRtQN4W4oDbv+0FScauBKrfnY/W1jO/oVqNXJDiB3Y2AzuJ7Q/2UWCma0olAC
         Mm2LgMr0V7ZDRz9SjgkfS+suzc17of/m3ztSvQiwPsQXhtiQay68cuPBNrpfWo+wAGwa
         J77X1xbh1fHg977jqDGWjDuS8UCZGIcKNGSaxglGS666YWEQatG5ZJBk8/5EV2kqeCro
         BEnHWIlaFG6C9rbZe79mKrFF+ijghHA42PnUbNwwNtlUd1nV2/qa6xKMO7lNhM0ylFWR
         heiA==
X-Gm-Message-State: AOJu0YzG5NHNENhjZa2VmOGoTZUGE42f7Gom1x2W7mshayA8pi7WzE49
	lNf9YwpyglT2CyJyNbQpPOSUcRFibPANP9d8H5ApITMdES8e7YTDBXsj/kQUgcBqsxHMsXA57DU
	91F+b5Zs=
X-Gm-Gg: ATEYQzyO98/8PDwQRYiQiDPUX9PBg/+t74CFZS9kMwfxF9tQ+KFtAc4Kol03n5F4aHH
	AKbIZWt6XOhqz0FcgMOHkiTQrbyuvO3jOfbkHYB3JN6UDq2+hU4qGpo2/2tra2PI4D/iUQO1vhI
	wnMzCWCEZAM/56moz1Ha8TX3ZVUIAJjT/PYl8kPxMs/bYlM0ZMZ4hPRoDALgi9HsJ6swgaEhXSH
	rNEmFgb2Kz3Dc0UCbKKuURwerHd/F+do/xAY2co2Mzvwv6gPDpi7n+dslslWNIKJacd3tb7xCzI
	LBFLjvhDhSwp5ffB6pshx6H2z1Xr/JL8+naoyaYVkvhmCmSAEcDPFZsWjNlWVceXSObqjdrN20U
	d3ueJCqp3Eom9Q0KU2imIvAxKSIRrEkXhxpGWaPe32Vbr++XYvwjmMGNwsW7NTw0CdqFsLDW2Sn
	ARmXeNr5OeV+LctQG6nz0sEKy++mulBX8glDT0f9H9xX3JcwR4DgsATVER/qyFsV0dQYTryF0aD
	YsXVuf0sW6yDCUHUjAzmQGSRdI=
X-Received: by 2002:a05:6000:1448:b0:43b:4f0c:aefd with SMTP id ffacd0b85a97d-43b9e9a0c82mr15783139f8f.23.1774823885195;
        Sun, 29 Mar 2026 15:38:05 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43cf2471ee2sm13038542f8f.29.2026.03.29.15.38.04
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Mar 2026 15:38:04 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 04/16] dtc: backport fix for build with glibc-2.43
Date: Mon, 30 Mar 2026 00:37:36 +0200
Message-ID: <58ef52e9ee33c76689a57e6c39e91c00c257c43f.1774823430.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1774823430.git.yoann.congal@smile.fr>
References: <cover.1774823430.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 29 Mar 2026 22:38:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234162

From: Martin Jansa <martin.jansa@gmail.com>

glibc-2.43 isn't used in OE builds yet, but this fixes dtc-native:
https://errors.yoctoproject.org/Errors/Details/903983/

../sources/dtc-1.7.2/libfdt/fdt_overlay.c: In function ‘overlay_fixup_phandle’:
../sources/dtc-1.7.2/libfdt/fdt_overlay.c:424:21: error: assignment discards ‘const’ qualifier from pointer target type [-Werror=discarded-qualifiers]
  424 |                 sep = memchr(fixup_str, ':', fixup_len);
      |                     ^
../sources/dtc-1.7.2/libfdt/fdt_overlay.c:434:21: error: assignment discards ‘const’ qualifier from pointer target type [-Werror=discarded-qualifiers]
  434 |                 sep = memchr(name, ':', fixup_len);
      |                     ^
cc1: all warnings being treated as errors

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
[YC: upstream commit 28552a7b6c94060c7ab3899619ab8afb74124d02]
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../0001-Fix-discarded-const-qualifiers.patch | 85 +++++++++++++++++++
 meta/recipes-kernel/dtc/dtc_1.7.0.bb          |  1 +
 2 files changed, 86 insertions(+)
 create mode 100644 meta/recipes-kernel/dtc/dtc/0001-Fix-discarded-const-qualifiers.patch

diff --git a/meta/recipes-kernel/dtc/dtc/0001-Fix-discarded-const-qualifiers.patch b/meta/recipes-kernel/dtc/dtc/0001-Fix-discarded-const-qualifiers.patch
new file mode 100644
index 00000000000..c643410ae9b
--- /dev/null
+++ b/meta/recipes-kernel/dtc/dtc/0001-Fix-discarded-const-qualifiers.patch
@@ -0,0 +1,85 @@
+From 861cb43eb53afff83e28ba0e0f88ffa464ebe8ca Mon Sep 17 00:00:00 2001
+From: Stephen Gallagher <sgallagh@redhat.com>
+Date: Tue, 6 Jan 2026 14:19:30 -0500
+Subject: [PATCH] Fix discarded const qualifiers
+
+It's unsafe to implicitly discard the const qualifier on a pointer. In
+overlay_fixup_phandle(), this was probably just an oversight, and making
+the "sep" variable a const char * is sufficient to fix it.
+
+In create_node(), however, the "p" variable is directly modifying the
+buffer pointed to by "const char* node_name". To fix this, we need to
+actually make a duplicate of the buffer and operate on that instead.
+
+This introduces a malloc()/free()  and an unbounded strdup() into the
+operation, but fdtput isn't a long-running service and the node_name
+argument comes directly from argv, so this shouldn't introduce a
+significant performance impact.
+
+Signed-off-by: Stephen Gallagher <sgallagh@redhat.com>
+Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
+Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
+Upstream-Status: Backport [https://git.kernel.org/pub/scm/utils/dtc/dtc.git/commit/libfdt/fdt_overlay.c?h=main&id=9a1c801a1a3c102bf95c5339c9e985b26b823a21]
+---
+ fdtput.c             | 8 +++++---
+ libfdt/fdt_overlay.c | 3 ++-
+ meson.build          | 3 ++-
+ 3 files changed, 9 insertions(+), 5 deletions(-)
+
+diff --git a/fdtput.c b/fdtput.c
+index c2fecf4..8deec7e 100644
+--- a/fdtput.c
++++ b/fdtput.c
+@@ -230,19 +230,21 @@ static int create_paths(char **blob, const char *in_path)
+ static int create_node(char **blob, const char *node_name)
+ {
+ 	int node = 0;
+-	char *p;
++	const char *p;
++	char *path = NULL;
+ 
+ 	p = strrchr(node_name, '/');
+ 	if (!p) {
+ 		report_error(node_name, -1, -FDT_ERR_BADPATH);
+ 		return -1;
+ 	}
+-	*p = '\0';
+ 
+ 	*blob = realloc_node(*blob, p + 1);
+ 
+ 	if (p > node_name) {
+-		node = fdt_path_offset(*blob, node_name);
++		path = xstrndup(node_name, (size_t)(p - node_name));
++		node = fdt_path_offset(*blob, path);
++		free(path);
+ 		if (node < 0) {
+ 			report_error(node_name, -1, node);
+ 			return -1;
+diff --git a/libfdt/fdt_overlay.c b/libfdt/fdt_overlay.c
+index 5c0c398..75b0619 100644
+--- a/libfdt/fdt_overlay.c
++++ b/libfdt/fdt_overlay.c
+@@ -431,7 +431,8 @@ static int overlay_fixup_phandle(void *fdt, void *fdto, int symbols_off,
+ 		const char *fixup_str = value;
+ 		uint32_t path_len, name_len;
+ 		uint32_t fixup_len;
+-		char *sep, *endptr;
++		const char *sep;
++		char *endptr;
+ 		int poffset, ret;
+ 
+ 		fixup_end = memchr(value, '\0', len);
+diff --git a/meson.build b/meson.build
+index 8952e8a..ecb0ae0 100644
+--- a/meson.build
++++ b/meson.build
+@@ -14,7 +14,8 @@ add_project_arguments(
+     '-Wstrict-prototypes',
+     '-Wmissing-prototypes',
+     '-Wredundant-decls',
+-    '-Wshadow'
++    '-Wshadow',
++    '-Wdiscarded-qualifiers'
+   ]),
+   language: 'c'
+ )
diff --git a/meta/recipes-kernel/dtc/dtc_1.7.0.bb b/meta/recipes-kernel/dtc/dtc_1.7.0.bb
index 0702fc16dfa..a2f41197fda 100644
--- a/meta/recipes-kernel/dtc/dtc_1.7.0.bb
+++ b/meta/recipes-kernel/dtc/dtc_1.7.0.bb
@@ -12,6 +12,7 @@ SRC_URI = " \
     git://git.kernel.org/pub/scm/utils/dtc/dtc.git;branch=main;protocol=https \
     file://0001-meson.build-bump-version-to-1.7.0.patch \
     file://0002-meson-allow-building-from-shallow-clones.patch \
+    file://0001-Fix-discarded-const-qualifiers.patch \
 "
 SRCREV = "039a99414e778332d8f9c04cbd3072e1dcc62798"
 

