Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9F00F47CA6
	for <webhook@archiver.kernel.org>; Thu,  5 Mar 2026 18:03:44 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.50786.1772733822576141964
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Mar 2026 10:03:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=PZ+9tzOR;
 spf=pass (domain: gmail.com, ip: 209.85.221.42, mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-439cd6b09f8so993505f8f.3
        for <openembedded-core@lists.openembedded.org>; Thu, 05 Mar 2026 10:03:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772733821; x=1773338621; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u/UBbG1r77KOm1LhFcycLL3fpoZb6ulUCjEjEvOnjm4=;
        b=PZ+9tzOR4H+NnoZYobCSyD6y8HkNMaikWtRRxRerJCrH/dxrarEs6UtZS8wmG3yn6N
         SMjeABlg4y5PMoWY4oxmslD84ql5QYHtyntNtmNlWBp5lAvGeoLQZU7N5av3Rltmrm17
         XF4VYZFwViw85OSO3wtk0UPjHpFWult6wZ2Axf3R1QLC9+X6450AnnfjBtAUdNr0lwTN
         LC1FQh0L8nDkyQjAMIGsCIGLauVxXdNywguPZYBALfvzwl2KozHStD8zBMywzFKfHTkC
         zJAYcwykpj+xOCiU2rpFtgZ5xLPLgSDgIGcIMX9zY7xNXrk+371b58mrW156kVXk7ijx
         rH3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772733821; x=1773338621;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=u/UBbG1r77KOm1LhFcycLL3fpoZb6ulUCjEjEvOnjm4=;
        b=BJ9/jv9z1Yiy1fHoXF7KAfXqdRjh4wyEEld8hESe09y3eYmd0jYha74J9iPLCwe1L2
         nu6B1/X0r2sCzcX2SqeIDNiFjheCxfvqFGgHUuMLpsmOVUn63Iqix5kWua5tdEZHjgtC
         +as+Ehk19gG+JRFW3SuF7nztY3YZ8/7tcdhpqCY7uI1V504kNEDm9D67c+9EDsn8gH3J
         3YdBEdkKdnJs+Mloq1thfXN4yt0Ftz1ZPcb3BgIQRU1PqvJ5YtS2WBpw1MOiXX/5jXl2
         e2TdaPBaXuHThlyMSSIpo+GYLyToujqGUhl6ZvYtUXNy4j/Do1UbwVHsmG3z0H1jjQWr
         Kc0Q==
X-Gm-Message-State: AOJu0YyoJqst9Wfp4JUP3XVlRMlL3NR2s/PGze73bY5j0f8Yb3A9/Hn4
	MQaSryjNipOOfpXa+bIvki3jN8bo5V4ysz0BTg+bmTEow2Xrw2myVnZ2M9jVz8jD
X-Gm-Gg: ATEYQzzjy8KYoS0NnAin6xpBH57kZLElzAELX9fMqAOYBuXN9UzD5Nf/6gbDERa0jZd
	dSWUBWCKwD+UzLJXCHvM5AnOk7FUgDHD+5D7AeGopZYm7JnS38gDs4cIsQagS/2Hfile9XQbdvN
	4mSb1rO347FOEXyqlA8Rtyvlo5Xnjv/IupPSeyD1U2zw2CXc8ptjMxQ6ej0SPXic917eoOD210c
	nH4wnjw9cUQoiEotG6sBn8fmhELckX08ziGbtQun8AzVaToY2JBXmG43KLqaWkaSzh0dlhlBkO9
	/2jotZ1eQqnw6yA/YNmdzlav7KHjhHQ/S9SyCYM1gDMjQ7jXMwoIaXNS4cCpZt63BYcdk1L3xn3
	byoe51mm52anGMbZcRi2rwIXkHNjrH5v8exwV/joSiMkF9dtfcAPR3SUmhcOkgTTdvZFm0ryX8O
	q+LcCx9cK9jyIdfnotgOqiVOm1malbGdYFtqbY
X-Received: by 2002:a05:6000:1152:b0:439:c9d6:4313 with SMTP id ffacd0b85a97d-439c9d64396mr9454641f8f.44.1772733820579;
        Thu, 05 Mar 2026 10:03:40 -0800 (PST)
Received: from localhost ([109.238.218.228])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439b6d540b2sm32296612f8f.36.2026.03.05.10.03.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2026 10:03:40 -0800 (PST)
From: martin.jansa@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: [PATCH 2/3] dtc: backport fix for build with glibc-2.43
Date: Thu,  5 Mar 2026 19:03:30 +0100
Message-ID: <20260305180333.306176-2-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260305180333.306176-1-martin.jansa@gmail.com>
References: <20260305180333.306176-1-martin.jansa@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 05 Mar 2026 18:03:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232504

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
---
 .../0001-Fix-discarded-const-qualifiers.patch | 83 +++++++++++++++++++
 meta/recipes-kernel/dtc/dtc_1.7.2.bb          |  1 +
 2 files changed, 84 insertions(+)
 create mode 100644 meta/recipes-kernel/dtc/dtc/0001-Fix-discarded-const-qualifiers.patch

diff --git a/meta/recipes-kernel/dtc/dtc/0001-Fix-discarded-const-qualifiers.patch b/meta/recipes-kernel/dtc/dtc/0001-Fix-discarded-const-qualifiers.patch
new file mode 100644
index 0000000000..053a94f0bf
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
+Upstream-Status: Backport [https://git.kernel.org/pub/scm/utils/dtc/dtc.git/commit/libfdt/fdt_overlay.c?h=main&id=9a1c801a1a3c102bf95c5339c9e985b26b823a21]
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
index 92e83a9404..b8b79542c5 100644
--- a/meta/recipes-kernel/dtc/dtc_1.7.2.bb
+++ b/meta/recipes-kernel/dtc/dtc_1.7.2.bb
@@ -10,6 +10,7 @@ LIC_FILES_CHKSUM = "file://GPL;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
 
 SRC_URI = " \
     git://git.kernel.org/pub/scm/utils/dtc/dtc.git;branch=main;protocol=https \
+    file://0001-Fix-discarded-const-qualifiers.patch \
 "
 SRCREV = "2d10aa2afe35527728db30b35ec491ecb6959e5c"
 

