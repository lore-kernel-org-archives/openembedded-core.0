Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83886F31E33
	for <webhook@archiver.kernel.org>; Thu,  9 Apr 2026 15:28:47 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.134993.1775748523994677874
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Apr 2026 08:28:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=JgfmAthr;
 spf=pass (domain: gmail.com, ip: 209.85.221.43, mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-43d5ec211abso450873f8f.0
        for <openembedded-core@lists.openembedded.org>; Thu, 09 Apr 2026 08:28:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775748522; x=1776353322; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=c7Ntv5WlGXlL27P/RsBAxjbVszcLFVitE0WPg10Pytc=;
        b=JgfmAthrRR6dVGtogV16JWoX2HcWtsUWgwxgYL6Dslxe59lcXrlmU1cL7vhTrpelRr
         L3rF9siyVLKutq2WgdE31DU1Bv+KZAUmRLnzKIy9/08mgdRLjiqPmnB0n+8+NcLsffxn
         pytmCMCTjaLCtpK6Ue7rek3iXg2+z28i2HLCgDd68oMmKiY7/fFpvnJlHra5WAdiLhOT
         8WhQfZUFEgYlyM2TT4n470DszQM5vQ1yb/UKK1p1tGLe9b1ceV0jMTaVFgff0HPJfSIW
         ozHZuwbuYBW0RbDcu6W41lgzXFuewIMM7FvLPEuD0uLiQ50rb+lfOkvfBkNB+Mu+N+c2
         C3xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775748522; x=1776353322;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c7Ntv5WlGXlL27P/RsBAxjbVszcLFVitE0WPg10Pytc=;
        b=W8nx82wzLxyDWxqFmAoZ7I4uIQH3bZB8YgRvOiceEXUY1x7lyouRGE9M5/UAmNw3aR
         LwaNl8g8meQO4ldwpwrFq8L/R3CpLrtuJsNSErMN17BIFZclbdtqwH1uZUM4tgQLTL5s
         NB7GmsBk5DZiMZj/t7qNKt7/cgp+T98L2umdabU3xZGKp8MZd0+YkpX/cjQ9AMwyqbFH
         FdYet0D5q+FtNG1YjEZ/Z3V3odkslC1vaVL/Rz26YraQ4S0xVmYZUsCKDa9dt2hj1b2C
         aJK9vBHocoeWHkJPOVlHo+zpaddVftY7DscEac4ioLzgI4AtzBtb40JXqxKgtlnZ3RG4
         3V2Q==
X-Gm-Message-State: AOJu0Yy8RhqIb837dUkb3iICWuub47Ixm3YjogrNQVr2DaUIwRC/pai9
	Kc9sUJss/DaEED04H+SDm6mL/HjRvl9k1AyHIsBGgipZHcMkGsMPCazgPgwzZg==
X-Gm-Gg: AeBDiesBXs8Uz8vOChkUnxVfhUDCVfbTlUfqKbtce57Ai7xb6q2NckNBOebNYVuQatI
	4KuhtnA/U4TAxljXY8IWQetEpbEB67wew/kVl42sZgstHfrAQf2OzG5Z/pKWxWm+Ocd9NvhwH0E
	zO6MOLOyObvgwq8fpPY8FBFCsaAw0Rw0TjDKcfIb9RRAXM8MghiWSQhAk/SuzNBYVkZzvR9ECy+
	HydqoFHPsC3HPFgTx/554H4y3c23xP+dFfnzVbIw9lx3P7fazjJQ9vsmXHavupz2WFfV3bUB5Gb
	fSSFaRD7yMD2lBOfdR5h3LHmz3yeKZ7es0WOSEE+X+ZcqPY+OwSWaDFaCDJH4EtUY1ZfQhe5iq2
	PXdM6IDMXm3VnXT+Ia6KZRrgiN0rXTJP6ddaIfZG9FZiZFagYymrgQG9149t97ln4oNQpyUILmb
	wmiORnMen3gWkAoCe3zq8aZyxBDQ==
X-Received: by 2002:a5d:5d05:0:b0:43c:fbcd:4b4f with SMTP id ffacd0b85a97d-43d292e800dmr38331668f8f.47.1775748522008;
        Thu, 09 Apr 2026 08:28:42 -0700 (PDT)
Received: from localhost ([109.238.218.228])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d1e4f52easm68970449f8f.36.2026.04.09.08.28.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 08:28:41 -0700 (PDT)
From: martin.jansa@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Martin Jansa <martin.jansa@gmail.com>,
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [whinlatter][PATCH 1/9] dtc: backport fix for build with glibc-2.43
Date: Thu,  9 Apr 2026 17:28:20 +0200
Message-ID: <20260409152839.2894434-1-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Apr 2026 15:28:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234917

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
 

