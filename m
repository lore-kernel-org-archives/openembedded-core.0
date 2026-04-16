Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14A63F8808B
	for <webhook@archiver.kernel.org>; Thu, 16 Apr 2026 06:48:43 +0000 (UTC)
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com [209.85.128.65])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7721.1776322111939921639
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Apr 2026 23:48:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=wN+tz5M1;
 spf=pass (domain: smile.fr, ip: 209.85.128.65, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f65.google.com with SMTP id 5b1f17b1804b1-488a88aeec9so101082735e9.2
        for <openembedded-core@lists.openembedded.org>; Wed, 15 Apr 2026 23:48:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1776322110; x=1776926910; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=szp4dFfHWgjV6v2/N/AVo3ctLJaHSGVnwRidzPVQiO0=;
        b=wN+tz5M1tP6TPVg/qpQWKiWZX+pGRpsKXqHWlTNNwB5XRuSJQOC3MzDePyGtJ8trIA
         9gEiPDxSrAFxxgaQ/XjrAOskB1B7KvEjOAXKGuUDxJ+nTfMN3ZVn4/UDJNg43cweugzw
         vxy34fQEuvlP7IMbGTaijnWT7f3oza5kusLEI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776322110; x=1776926910;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=szp4dFfHWgjV6v2/N/AVo3ctLJaHSGVnwRidzPVQiO0=;
        b=A/0i54S1G8dfvMBn8IoFgOUTd5AqRdua+aInXYt1NnCZq3B8y0Xhf3FB45B+IeSfBp
         FI7vf3ZF6lZAIeFGUwYm1J8F8WscRGZOoXrWb/Ieo3lZWtAZdmGe9+UoZupkM7rlqVb+
         Te+K4uQ4crkgHM1dqchE92u5GtAbsF/ZKshf9eKbQPFKX+oghWPoRhihedfY7hgm5Mcl
         IAI21T+OCHaW6ZGlXIBTrkZEmCvzL8IAucNdAm/B8Cb8TTwI8QzP9+M8RAxJ7JUGgD9r
         ig9SWU8lKkYu4TvUrpYsWVtrkOOOBp8rYwsKJbh9HQ1vv5FLHkAN5KDHZJKgQrnpCMeV
         /pdg==
X-Gm-Message-State: AOJu0YzY3paq4EcRROZ9tragMzEbLuvUQSoIklwrjnV4n4cPyCYNijfR
	4esaZcA4Y3jjDVuA7DE7lH6P1+8IsxVWNMUmO8pynIiKG4MC/waiXGB5PTBIeEf8kurBQ5zfe6S
	PluTq0Ii5s1+B
X-Gm-Gg: AeBDietVu+fLmeIhwiSiJ8oYf5hn/na79mNGk5t9EZb8thnrNEfO7jsbLmiEqP5mbci
	x/e7lyl8kd/a0Hl2LdFfkg9zH/eyYn7d7yScfnX1eef78CPhIp/3DK0pae6DhB2bf/ywPW7uQtZ
	tC690J1aMDntQzTwVZZG8WxA36tqq9mfUTr5pl6v54pavut0MI689obwLFqKL+QAfUM7YEeqBIi
	9dH7Q05tSvfdwAIxWxFQ4femGo9p4ChE4hbKjvzm+rFwVAf4SGsuXCBGX1bKHT/R/7Bt50dFT9n
	k7/5Gf7ao3V6X1GeDAMZHBDJwkrEVJScfgPQzOdSMbyuEKGGMYMs7iQjsj+J1qtacqjvQGbyM+1
	ecy1C+Aq7SzbehzbtXdN3UCaMvQp61/762/lIOKyBApwBeNK3MR05uZpyeL6/jwgtBXga/XUM4l
	DeC0CTHh0ti+z4qmUxD82+FqRnwMuQZOqy7/JuL7prTo8kOEVj+DE3lfsL7LrwelgHuC3NWbMFJ
	AE41KqMZIQOECUq3AXKOHnzQRph8jIky+yerQ==
X-Received: by 2002:a05:600c:c0da:b0:487:1fc:14f9 with SMTP id 5b1f17b1804b1-488d685b7c9mr289610385e9.15.1776322109877;
        Wed, 15 Apr 2026 23:48:29 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43ead3d5ea9sm11200017f8f.21.2026.04.15.23.48.29
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2026 23:48:29 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][whinlatter 18/47] dtc: backport fix for build with glibc-2.43
Date: Thu, 16 Apr 2026 08:47:19 +0200
Message-ID: <47668754cd6829c8687d1ceebce35ba4442fd40f.1776321810.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1776321810.git.yoann.congal@smile.fr>
References: <cover.1776321810.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Apr 2026 06:48:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235360

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
(cherry picked from commit 28552a7b6c94060c7ab3899619ab8afb74124d02)
[YC: fixed the Upstream-Status Backport URL]
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../0001-Fix-discarded-const-qualifiers.patch | 83 +++++++++++++++++++
 meta/recipes-kernel/dtc/dtc_1.7.2.bb          |  1 +
 2 files changed, 84 insertions(+)
 create mode 100644 meta/recipes-kernel/dtc/dtc/0001-Fix-discarded-const-qualifiers.patch

diff --git a/meta/recipes-kernel/dtc/dtc/0001-Fix-discarded-const-qualifiers.patch b/meta/recipes-kernel/dtc/dtc/0001-Fix-discarded-const-qualifiers.patch
new file mode 100644
index 00000000000..de06ab37231
--- /dev/null
+++ b/meta/recipes-kernel/dtc/dtc/0001-Fix-discarded-const-qualifiers.patch
@@ -0,0 +1,83 @@
+From c58beee7bec0774f12202511c97beb741ff2b534 Mon Sep 17 00:00:00 2001
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
+Upstream-Status: Backport [https://git.kernel.org/pub/scm/utils/dtc/dtc.git/commit/?h=main&id=9a1c801a1a3c102bf95c5339c9e985b26b823a21]
+---
+ fdtput.c             | 8 +++++---
+ libfdt/fdt_overlay.c | 3 ++-
+ meson.build          | 1 +
+ 3 files changed, 8 insertions(+), 4 deletions(-)
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
+index 28b667f..5f8aa62 100644
+--- a/libfdt/fdt_overlay.c
++++ b/libfdt/fdt_overlay.c
+@@ -409,7 +409,8 @@ static int overlay_fixup_phandle(void *fdt, void *fdto, int symbols_off,
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
+index 310699f..2966b06 100644
+--- a/meson.build
++++ b/meson.build
+@@ -18,6 +18,7 @@ add_project_arguments(
+     '-Wshadow',
+     '-Wsuggest-attribute=format',
+     '-Wwrite-strings',
++    '-Wdiscarded-qualifiers',
+   ]),
+   language: 'c'
+ )
diff --git a/meta/recipes-kernel/dtc/dtc_1.7.2.bb b/meta/recipes-kernel/dtc/dtc_1.7.2.bb
index 92e83a94044..b8b79542c5d 100644
--- a/meta/recipes-kernel/dtc/dtc_1.7.2.bb
+++ b/meta/recipes-kernel/dtc/dtc_1.7.2.bb
@@ -10,6 +10,7 @@ LIC_FILES_CHKSUM = "file://GPL;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
 
 SRC_URI = " \
     git://git.kernel.org/pub/scm/utils/dtc/dtc.git;branch=main;protocol=https \
+    file://0001-Fix-discarded-const-qualifiers.patch \
 "
 SRCREV = "2d10aa2afe35527728db30b35ec491ecb6959e5c"
 

