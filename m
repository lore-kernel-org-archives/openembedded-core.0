Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05344EE14B8
	for <webhook@archiver.kernel.org>; Wed,  6 Sep 2023 16:56:52 +0000 (UTC)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
 by mx.groups.io with SMTP id smtpd.web10.4102.1694019403207804831
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Sep 2023 09:56:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=kzNI6zwL;
 spf=pass (domain: gmail.com, ip: 209.85.218.52, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-9a2a4a5472dso253862166b.1
        for <openembedded-core@lists.openembedded.org>; Wed, 06 Sep 2023 09:56:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694019401; x=1694624201; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XwRmHnMHnVhbnI1LqQEfRJitSyifYzUYxPPqsYy2c9g=;
        b=kzNI6zwLiume7JDBqV2ShzFgQsTazt2trA9Cpea5JllLU+iarI0t7XwxW4EwgQk1RE
         8rMLbXwWCKvozCFUtrKuX1UEFVDUBWOTi+yfX4zRsHbpzG/Cszj4imeGKRbcLBw+YPRx
         1S6QJSsDkPQIiHHjSW/xZmlxKzLzd1/wRgD4Ml7EensbPTOeXYDoRLvhsX09gXgeog4P
         o8q5zHlCKK51+S4gC3EhciguUGODagesX0WbTzed275YHzP73JNqO7AWpsnIVDRQSsyM
         j+hRoSOUznGFQC12qTyjge713cMSH2/pJiwISl1sDCHLWw22VHMDktoc3qZEFvTXN3mT
         8ygQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1694019401; x=1694624201;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XwRmHnMHnVhbnI1LqQEfRJitSyifYzUYxPPqsYy2c9g=;
        b=LsviVr2bkp/XBcHRLDDL5MIoeNgacRG7lOQH00qOdwYHNEY9zlhDu0hcIOwdT7PXbD
         uWULn+5wyEB/G+U3AW4rr+qdbRgtGZIP3G9T2SzbRRj6W5HqgHLm0bjMLy0UoptJqNfS
         WI6OV+55F+1HSt4miRx7Q1xdBJ1+e3x1HtDfz4Ku7CA8qyjxXIxZf2GHWtn5YlANBrLO
         OrdZLawzbl8vBtMjKAjF9T0WC5i9azGFLRS8YagqK6PKVnpbAQpqE3UMj//CIAC3Yy3l
         Y2Ej5fbDqOcMNK9jNBGgGi+LA04yqvQw22dFKXHtcUW75G/uPcRQ6rwRcg6snSLVCyQ1
         1V8w==
X-Gm-Message-State: AOJu0YzgfSetoK0kVzl2c2km0H+4jjJKejYNoZh51wFH9uxi8LdeK8TU
	EM5N6/FEHC+Jq7jD8A9tHp8etCBW7Z4=
X-Google-Smtp-Source: AGHT+IEcumRNslxMHbCx9xNK0n/l/Aeb7e9FAa9hQkd1C5N7BxdqtV8RhlKUfTEzB3uQUT6mHkxMoQ==
X-Received: by 2002:a17:906:cc45:b0:9a5:bceb:1cf8 with SMTP id mm5-20020a170906cc4500b009a5bceb1cf8mr211031ejb.3.1694019401321;
        Wed, 06 Sep 2023 09:56:41 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id lh7-20020a170906f8c700b0098e34446464sm9284848ejb.25.2023.09.06.09.56.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Sep 2023 09:56:40 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 04/17] libcgroup: update 3.0.0 -> 3.1.0
Date: Wed,  6 Sep 2023 18:56:20 +0200
Message-Id: <20230906165633.2382629-4-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230906165633.2382629-1-alex@linutronix.de>
References: <20230906165633.2382629-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Sep 2023 16:56:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187326

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...pi-Use-GNU-strerror_r-when-available.patch | 55 -------------------
 ...{libcgroup_3.0.0.bb => libcgroup_3.1.0.bb} |  8 +--
 2 files changed, 4 insertions(+), 59 deletions(-)
 delete mode 100644 meta/recipes-core/libcgroup/libcgroup/0001-api-Use-GNU-strerror_r-when-available.patch
 rename meta/recipes-core/libcgroup/{libcgroup_3.0.0.bb => libcgroup_3.1.0.bb} (78%)

diff --git a/meta/recipes-core/libcgroup/libcgroup/0001-api-Use-GNU-strerror_r-when-available.patch b/meta/recipes-core/libcgroup/libcgroup/0001-api-Use-GNU-strerror_r-when-available.patch
deleted file mode 100644
index 96321d29707..00000000000
--- a/meta/recipes-core/libcgroup/libcgroup/0001-api-Use-GNU-strerror_r-when-available.patch
+++ /dev/null
@@ -1,55 +0,0 @@
-From d190c0c548b3219b75e4c399aa89186e77bbe270 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Tue, 23 Aug 2022 20:03:09 -0700
-Subject: [PATCH] api: Use GNU strerror_r when available
-
-GNU strerror_r is only available in glibc, musl impelents the XSI
-version which is slightly different, therefore check if GNU version is
-available before using it, otherwise use the XSI compliant version.
-
-Upstream-Status: Submitted [https://github.com/libcgroup/libcgroup/pull/236]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- configure.ac | 5 +++++
- src/api.c    | 8 ++++++--
- 2 files changed, 11 insertions(+), 2 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index b68c655..831866d 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -183,6 +183,11 @@ AC_FUNC_REALLOC
- AC_FUNC_STAT
- AC_CHECK_FUNCS([getmntent hasmntopt memset mkdir rmdir strdup])
- 
-+orig_CFLAGS="$CFLAGS"
-+CFLAGS="$CFLAGS -D_GNU_SOURCE"
-+AC_FUNC_STRERROR_R
-+CFLAGS="$orig_CFLAGS"
-+
- AC_SEARCH_LIBS(
- 	[fts_open],
- 	[fts],
-diff --git a/src/api.c b/src/api.c
-index 5c6de11..06aa1d6 100644
---- a/src/api.c
-+++ b/src/api.c
-@@ -4571,9 +4571,13 @@ const char *cgroup_strerror(int code)
- {
- 	int idx = code % ECGROUPNOTCOMPILED;
- 
--	if (code == ECGOTHER)
-+	if (code == ECGOTHER) {
-+#ifdef STRERROR_R_CHAR_P
- 		return strerror_r(cgroup_get_last_errno(), errtext, MAXLEN);
--
-+#else
-+		return strerror_r(cgroup_get_last_errno(), errtext, sizeof (errtext)) ? "unknown error" : errtext;
-+#endif
-+	}
- 	if (idx >= sizeof(cgroup_strerror_codes)/sizeof(cgroup_strerror_codes[0]))
- 		return "Invalid error code";
- 
--- 
-2.37.2
-
diff --git a/meta/recipes-core/libcgroup/libcgroup_3.0.0.bb b/meta/recipes-core/libcgroup/libcgroup_3.1.0.bb
similarity index 78%
rename from meta/recipes-core/libcgroup/libcgroup_3.0.0.bb
rename to meta/recipes-core/libcgroup/libcgroup_3.1.0.bb
index 457b965481d..4b4f19e36fb 100644
--- a/meta/recipes-core/libcgroup/libcgroup_3.0.0.bb
+++ b/meta/recipes-core/libcgroup/libcgroup_3.1.0.bb
@@ -12,15 +12,15 @@ inherit autotools pkgconfig github-releases
 DEPENDS = "bison-native flex-native"
 DEPENDS:append:libc-musl = " fts"
 
-SRC_URI = "${GITHUB_BASE_URI}/download/v3.0/${BP}.tar.gz \
-           file://0001-api-Use-GNU-strerror_r-when-available.patch \
+SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/${BP}.tar.gz \
 "
 UPSTREAM_CHECK_URI = "https://github.com/libcgroup/libcgroup/tags"
 
-SRC_URI[sha256sum] = "8d284d896fca1c981b55850e92acd3ad9648a69227c028dda7ae3402af878edd"
+SRC_URI[sha256sum] = "976ec4b1e03c0498308cfd28f1b256b40858f636abc8d1f9db24f0a7ea9e1258"
 
-PACKAGECONFIG = "${@bb.utils.filter('DISTRO_FEATURES', 'pam', d)}"
+PACKAGECONFIG = "${@bb.utils.filter('DISTRO_FEATURES', 'pam systemd', d)}"
 PACKAGECONFIG[pam] = "--enable-pam-module-dir=${base_libdir}/security --enable-pam=yes,--enable-pam=no,libpam"
+PACKAGECONFIG[systemd] = "--enable-systemd,--disable-systemd,systemd"
 
 PACKAGES =+ "cgroups-pam-plugin"
 FILES:cgroups-pam-plugin = "${base_libdir}/security/pam_cgroup.so*"
-- 
2.30.2


