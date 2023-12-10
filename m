Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2949C10F09
	for <webhook@archiver.kernel.org>; Sun, 10 Dec 2023 20:25:59 +0000 (UTC)
Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com [209.85.167.177])
 by mx.groups.io with SMTP id smtpd.web11.63106.1702239953610270668
 for <openembedded-core@lists.openembedded.org>;
 Sun, 10 Dec 2023 12:25:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=knxYG5lN;
 spf=pass (domain: gmail.com, ip: 209.85.167.177, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f177.google.com with SMTP id 5614622812f47-3b9e2d50e61so2398227b6e.2
        for <openembedded-core@lists.openembedded.org>; Sun, 10 Dec 2023 12:25:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702239952; x=1702844752; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qAdmjhhhgXLoGcCy+ctTj6LXTzx70lj9iRAExEe49/8=;
        b=knxYG5lNaUvjox3JKm1/H6y41Lfk/gpn5+SE0dm0gXq6Dmdg726C0mTz9b1ASCSrLg
         DGyP+sscZKVbp6XL6d4X/EwzwdmPaH52xmM787Okcp7JrAwJf42o8MAklWyRTz8Jr68y
         PHtyqlVOJwwbWDFY1tviDLHXNKl3JXWud5mCelfFA1UES+cMe44RiJitS6lYfbhz+pw3
         CBnebxHA9y0iOSGeDi7gpZHgM14DSeIrN/tt4BJcCKrYQMo19hYZkPl8IQqpkH8jUXtw
         ySEJrEZG88YFLdcr+tpIzWCf2YUsOTEvL2VAl2BimDo975j4prBAv5+9tth23kdnlW/6
         UJ2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702239952; x=1702844752;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qAdmjhhhgXLoGcCy+ctTj6LXTzx70lj9iRAExEe49/8=;
        b=ItBZQdms4NQuOptAZxAUat2U42iAIfwElwZmdWMHit97kYYOurGyPAvCK8/Tz+/Gs2
         T3i6fwJzGpgj6FV4kHnvg8Edur86Yk0QnWj95tXrNODHqbTj44VJpUo7bqtujMKa1mQR
         YEIzsmnmBQbh/VvVlw2jZw9kPniJQ+7NnVrylI9veVfXHgUpvtbuZ1uztng0Swnn0Adm
         7IWLu91jTAN38heRanFXh/wyMswgix4qrrBU3T1yVOc+gtR1+3tf9rovOsUvnPSLhB/4
         tG4U0zpn0xtuT+Ourz/UKHyDtLg6LTMYsz4cY4K4mgo2jygsCLKXDwKrGuZ36QJk5jcV
         xFvg==
X-Gm-Message-State: AOJu0Yzz4lgtzEqg0HKis+59CVJdi98HCHRcQooUM7owN54HZWkC9/5M
	YZ3Nau7+b2rw5q/MSJQpbbA06tmsHKY=
X-Google-Smtp-Source: AGHT+IGHzxawLBLmgqRxb0xNsWeAW3Txdr4HT+62MXvPa1TxL5wBv5aNLg6m7I/QzDwC0DV+WZ4LzA==
X-Received: by 2002:a05:6808:198e:b0:3b9:e3a2:16e5 with SMTP id bj14-20020a056808198e00b003b9e3a216e5mr3756289oib.77.1702239952515;
        Sun, 10 Dec 2023 12:25:52 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9100:3d00::76f0])
        by smtp.gmail.com with ESMTPSA id y24-20020aa78558000000b006cee23e7677sm4246487pfn.210.2023.12.10.12.25.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Dec 2023 12:25:51 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 2/6] kmod: Fix build with latest musl
Date: Sun, 10 Dec 2023 12:25:45 -0800
Message-ID: <20231210202549.155550-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231210202549.155550-1-raj.khem@gmail.com>
References: <20231210202549.155550-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 10 Dec 2023 20:25:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192120

implement glibc compatible basename() funciton for portability

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...able-implementation-for-basename-API.patch | 136 ++++++++++++++++++
 meta/recipes-kernel/kmod/kmod_31.bb           |   1 +
 2 files changed, 137 insertions(+)
 create mode 100644 meta/recipes-kernel/kmod/kmod/0001-Use-portable-implementation-for-basename-API.patch

diff --git a/meta/recipes-kernel/kmod/kmod/0001-Use-portable-implementation-for-basename-API.patch b/meta/recipes-kernel/kmod/kmod/0001-Use-portable-implementation-for-basename-API.patch
new file mode 100644
index 00000000000..6a7f9ded4fa
--- /dev/null
+++ b/meta/recipes-kernel/kmod/kmod/0001-Use-portable-implementation-for-basename-API.patch
@@ -0,0 +1,136 @@
+From 721ed6040c7aa47070faf6378c433089e178bd43 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 9 Dec 2023 17:35:59 -0800
+Subject: [PATCH] Use portable implementation for basename API
+
+musl has removed the non-prototype declaration of basename from
+string.h [1] which now results in build errors with clang-17+ compiler
+
+Implement GNU basename behavior using strchr which is portable across libcs
+
+Fixes
+../git/tools/kmod.c:71:19: error: call to undeclared function 'basename'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
+71 | "Commands:\n", basename(argv[0]));
+| ^
+
+[1] https://git.musl-libc.org/cgit/musl/commit/?id=725e17ed6dff4d0cd22487bb64470881e86a92e7
+
+Upstream-Status: Submitted [https://github.com/kmod-project/kmod/pull/32]
+
+Suggested-by: Rich Felker
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ libkmod/libkmod-config.c | 2 +-
+ shared/util.c            | 4 ++--
+ shared/util.h            | 7 +++++++
+ testsuite/testsuite.c    | 2 +-
+ tools/depmod.c           | 2 +-
+ tools/kmod.c             | 4 ++--
+ 6 files changed, 14 insertions(+), 7 deletions(-)
+
+diff --git a/libkmod/libkmod-config.c b/libkmod/libkmod-config.c
+index e83621b..8aa555a 100644
+--- a/libkmod/libkmod-config.c
++++ b/libkmod/libkmod-config.c
+@@ -794,7 +794,7 @@ static int conf_files_insert_sorted(struct kmod_ctx *ctx,
+ 	bool is_single = false;
+ 
+ 	if (name == NULL) {
+-		name = basename(path);
++		name = gnu_basename(path);
+ 		is_single = true;
+ 	}
+ 
+diff --git a/shared/util.c b/shared/util.c
+index e2bab83..0e16670 100644
+--- a/shared/util.c
++++ b/shared/util.c
+@@ -172,9 +172,9 @@ char *modname_normalize(const char *modname, char buf[static PATH_MAX], size_t *
+ 
+ char *path_to_modname(const char *path, char buf[static PATH_MAX], size_t *len)
+ {
+-	char *modname;
++	const char *modname;
+ 
+-	modname = basename(path);
++	modname = gnu_basename(path);
+ 	if (modname == NULL || modname[0] == '\0')
+ 		return NULL;
+ 
+diff --git a/shared/util.h b/shared/util.h
+index c4a3916..073dc5a 100644
+--- a/shared/util.h
++++ b/shared/util.h
+@@ -5,6 +5,7 @@
+ #include <stdbool.h>
+ #include <stdlib.h>
+ #include <stdio.h>
++#include <string.h>
+ #include <sys/types.h>
+ #include <sys/stat.h>
+ #include <time.h>
+@@ -76,6 +77,12 @@ do {						\
+ 	__p->__v = (val);			\
+ } while(0)
+ 
++static _always_inline_ const char *gnu_basename(const char *s)
++{
++  const char *p = strrchr(s, '/');
++  return p ? p+1 : s;
++}
++
+ static _always_inline_ unsigned int ALIGN_POWER2(unsigned int u)
+ {
+ 	return 1 << ((sizeof(u) * 8) - __builtin_clz(u - 1));
+diff --git a/testsuite/testsuite.c b/testsuite/testsuite.c
+index 318343a..aafc987 100644
+--- a/testsuite/testsuite.c
++++ b/testsuite/testsuite.c
+@@ -70,7 +70,7 @@ static void help(void)
+ 
+ 	printf("Usage:\n"
+ 	       "\t%s [options] <test>\n"
+-	       "Options:\n", basename(progname));
++	       "Options:\n", gnu_basename(progname));
+ 
+ 	for (itr = options, itr_short = options_short;
+ 				itr->name != NULL; itr++, itr_short++)
+diff --git a/tools/depmod.c b/tools/depmod.c
+index 43fc354..cfb15b1 100644
+--- a/tools/depmod.c
++++ b/tools/depmod.c
+@@ -762,7 +762,7 @@ static int cfg_files_insert_sorted(struct cfg_file ***p_files, size_t *p_n_files
+ 	if (name != NULL)
+ 		namelen = strlen(name);
+ 	else {
+-		name = basename(dir);
++		name = gnu_basename(dir);
+ 		namelen = strlen(name);
+ 		dirlen -= namelen + 1;
+ 	}
+diff --git a/tools/kmod.c b/tools/kmod.c
+index 55689c0..df91e5c 100644
+--- a/tools/kmod.c
++++ b/tools/kmod.c
+@@ -68,7 +68,7 @@ static int kmod_help(int argc, char *argv[])
+ 			"Options:\n"
+ 			"\t-V, --version     show version\n"
+ 			"\t-h, --help        show this help\n\n"
+-			"Commands:\n", basename(argv[0]));
++			"Commands:\n", gnu_basename(argv[0]));
+ 
+ 	for (i = 0; i < ARRAY_SIZE(kmod_cmds); i++) {
+ 		if (kmod_cmds[i]->help != NULL) {
+@@ -156,7 +156,7 @@ static int handle_kmod_compat_commands(int argc, char *argv[])
+ 	const char *cmd;
+ 	size_t i;
+ 
+-	cmd = basename(argv[0]);
++	cmd = gnu_basename(argv[0]);
+ 
+ 	for (i = 0; i < ARRAY_SIZE(kmod_compat_cmds); i++) {
+ 		if (streq(kmod_compat_cmds[i]->name, cmd))
+-- 
+2.43.0
+
diff --git a/meta/recipes-kernel/kmod/kmod_31.bb b/meta/recipes-kernel/kmod/kmod_31.bb
index 934a678a062..c11ce456f21 100644
--- a/meta/recipes-kernel/kmod/kmod_31.bb
+++ b/meta/recipes-kernel/kmod/kmod_31.bb
@@ -20,6 +20,7 @@ SRCREV = "aff617ea871d0568cc491bd116c0be1e857463bb"
 SRC_URI = "git://git.kernel.org/pub/scm/utils/kernel/kmod/kmod.git;branch=master;protocol=https \
            file://depmod-search.conf \
            file://avoid_parallel_tests.patch \
+           file://0001-Use-portable-implementation-for-basename-API.patch \
            "
 
 S = "${WORKDIR}/git"
-- 
2.43.0


