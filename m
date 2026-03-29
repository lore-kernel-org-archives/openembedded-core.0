Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E06BCFF4923
	for <webhook@archiver.kernel.org>; Sun, 29 Mar 2026 22:46:40 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.38744.1774824393619180750
 for <openembedded-core@lists.openembedded.org>;
 Sun, 29 Mar 2026 15:46:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=kgujxQjd;
 spf=pass (domain: smile.fr, ip: 209.85.128.47, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-48541edecf9so49044395e9.1
        for <openembedded-core@lists.openembedded.org>; Sun, 29 Mar 2026 15:46:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1774824392; x=1775429192; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0dMej7lmszqTsa6UScljJ48enl+M0n1Z9R80lxhs580=;
        b=kgujxQjdPH/hxbT1X7UAf4HqQpzaAmKSGRNZPYkC4FWhTJWPqJhyuLjnP7KNwT0qqZ
         od0Y/or5qsxxdLfGt1vb+WHW/3AioWweLWBMMN6A9OCFitIrocnEwr8pY4A+3prDLryJ
         mYvF5H3O2Z97L+EufJ/sQybDT2p4KvgjNDPsc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774824392; x=1775429192;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=0dMej7lmszqTsa6UScljJ48enl+M0n1Z9R80lxhs580=;
        b=pWJ9pAIgHmpfoMIZbeReYkKxxRRSrmGVn+ShJglaP7ALkUTmUUZrTa7rWBly7p7B2a
         DlWCuMtAfnYXTYuOlwNB207wr5ZyAu/AAViNxr2B9ugr90AsbzQk750MpUwWGifS5xTV
         dgDkUch+MWUjqkXZtflUAQGc06iBRz9MHBYGnIRiTabFIed3A9bz5GgZTQHI71tUpNmM
         qTMUvhjt9U1t0ovQhNoTvPNywmpxoFc4TIIqOS12qEUgYEhCWgByQr9J1C679LmvxYZt
         Xo1KHu3TtveE17hRTCQL2Jg1WnpIbabvht1kLrcNkUKXmxgJm2HNXlc23IVbouPfw2Ig
         KapA==
X-Gm-Message-State: AOJu0YyBHLk34PDUMzv0+UqDEla+Na3UuxM+xSFvHJclRlC17cwd1WfA
	U9IzDG3g1TxcStMZwoY3UudGLTDZceYiwwxohLzIqHbU+N80JDYE0sxdel2ivqSMrP2bsFCAsMl
	8kbsXoV8=
X-Gm-Gg: ATEYQzzr8+2gX2Z1kueYJgpWmJ6fE+FHJvnXvsP3GGtpJGR7O0oFuQBmtTUMu7p3DOw
	W/VvuH3EQpwieoxqMPp4HT+t+P4Ff1ALetsnBz8YDqsQKqI76Um2brD6M29DaaGG4i7p47LJFvT
	8hLZT23rcTez3UbvL11EsxILHqILXT4H3qYm0dMY/GOCxxHxECzQEmwK7bYj4PY9wDOK9BdYHm6
	7+KZ2YotfbBcdK/uICptJV3Dbxj7UGmyIez+S66yZHeWBDnot4lmU0gYLoUa/vEZx0ScktMX4UU
	WSuyuvMlT8hwqxHVdYlzwmOJnfJ7l8RVhqmlwnA9NQctb/ShChUzixsPtB6uIWvR8j+2KIpW1Hw
	1GVCZWHfsEZhAKzXj6RMCxL8KKRzSpKwTpyqZInJhfzkvrwazIvAI4Efr43FR369tuvjrsknaZc
	ijqvn27nTVEtCxEFHvXViQKbhSWqNzPbN0ZPytJTHzpD0T7ETbFcsT/f3yK2YL27x1z1fH28NXK
	1GLOfIuoq4HWK3Ig4EdBYTn0uc=
X-Received: by 2002:a05:600c:46c4:b0:485:3a03:ceca with SMTP id 5b1f17b1804b1-48727f0e53bmr188831305e9.23.1774824391603;
        Sun, 29 Mar 2026 15:46:31 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4873061eeeasm133760375e9.2.2026.03.29.15.46.31
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Mar 2026 15:46:31 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 04/11] dtc: backport fix for build with glibc-2.43
Date: Mon, 30 Mar 2026 00:46:11 +0200
Message-ID: <58ef52e9ee33c76689a57e6c39e91c00c257c43f.1774824253.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1774824253.git.yoann.congal@smile.fr>
References: <cover.1774824253.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 29 Mar 2026 22:46:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234185

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
 

