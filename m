Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8320DC4332F
	for <webhook@archiver.kernel.org>; Sun, 20 Nov 2022 14:16:10 +0000 (UTC)
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
 by mx.groups.io with SMTP id smtpd.web11.13221.1668953767537605476
 for <openembedded-core@lists.openembedded.org>;
 Sun, 20 Nov 2022 06:16:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=Y/omjUJX;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.177, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f177.google.com with SMTP id f3so9014764pgc.2
        for <openembedded-core@lists.openembedded.org>; Sun, 20 Nov 2022 06:16:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=a4UdipuwROKHdVzXciwSYvdW7yOc19pYKWyNyKfmRxY=;
        b=Y/omjUJXjxgyhs6kPWBFZDEPuieyaI4L4tyywJ4tUjbppD0ru0hW9XkamD0VjX2Nrt
         206YnHWD4pnrY22c99L+vQspUg2h/iv4LxKFjtLZ5+H7V9pvhzeCRdbPjjB3+ar9zhf+
         94ur9Ev06h1c958nWI8wIataLsqtPxZX8eHYCS8x7D+Clm9FdvhoYYEs4MYpbjjhX3wY
         zmDDcpwL9amvw1V/FqPqg2bljNrQmW2H9n63b9KxP/7jUF5+v5V5I+Yw3Y+4UVETNl1A
         Sgs+lCqMx5YRAv6+65CLv2kt30kJl8deOOk3vuRxz1zaKZKvxnHJCZJm5H1v4FoKcqKz
         HQkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a4UdipuwROKHdVzXciwSYvdW7yOc19pYKWyNyKfmRxY=;
        b=1kU/0fg5q0pRdNdeZlB1PSBxOc+EvxHfx9W0MKT/X8LfO+CwXrzeW8Lp+LBBcXFeRO
         UJsi0ZpDWac9KC8QA2b0/hqest7ONFMeH3IBhJXrPbhXmXBjCc/pB/HDoJ0o3mEUY/ww
         o2GLNq6JZ4dJqsvCFH5ZuUp6BOyCxSQ5nJg7B2y2CpuaX4l4lu3jIA1gqQqtgouULggu
         XCuZHvBYlLQAzjCwYqBnKnlYu0q9IfGYfE+4YfLt0yqzdBaQEa+Fb5Qx53dj5mQxDWsy
         ayj34pZBvCsT7ekI9LItvGg33V1RXtZiI7KmKG2T5rZpDT/0eLdLy2gJgNpSdun5a+6G
         PKGQ==
X-Gm-Message-State: ANoB5pmC8w88Ga0BqGOk24HUhZWw61KkQ/vfBJX8i/4FnJFAbJ4f/gbd
	IOoeqqgkEfB/Gnnq+g2XKCbEEqmabNVZJdmKq0A=
X-Google-Smtp-Source: AA0mqf7MhbCZzs/fWtNcWdJSNEPSttY3yknvPUUz7XZMnPljOE+k3xjqbg5U/uIr80h+7MB35FVPLQ==
X-Received: by 2002:a62:3142:0:b0:56d:8d19:f331 with SMTP id x63-20020a623142000000b0056d8d19f331mr16390768pfx.7.1668953766533;
        Sun, 20 Nov 2022 06:16:06 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id x15-20020aa78f0f000000b0056be4dbd4besm6721379pfr.111.2022.11.20.06.16.05
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Nov 2022 06:16:06 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 16/35] glibc-locale: Do not INHIBIT_DEFAULT_DEPS
Date: Sun, 20 Nov 2022 04:15:05 -1000
Message-Id: <97020ee9912663196a7e8a524a23b0b70d8cf686.1668952942.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1668952942.git.steve@sakoman.com>
References: <cover.1668952942.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 20 Nov 2022 14:16:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173616

From: Nathan Rossi <nathan.rossi@digi.com>

The glibc-locale recipe already partially depends on the base depends in
order to satisfy the do_package dependency on binutils. However since
commit d6ffd683bf6 NM has defaulted to gcc-nm, meaning do_package
depends on gcc (for minidebuginfo).

Whilst the do_package task could handle having the dependencies
explicitly defined (either in glibc-locale or in package.bbclass),
setting these would require some amount of conditional dependency
configuration (cross/crosssdk/etc.). Since both binutils and gcc are
already dependencies of virtual/libc (although compilerlibs is not),
having glibc-locale not inhibit the default depends simplifies the
handling of this situation for both glibc-locale and package.bbclass.

Signed-off-by: Nathan Rossi <nathan.rossi@digi.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit 8a40d0a6039e87a5b4b26a0e84dd797fe5c75cba)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-core/glibc/glibc-locale.inc | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/meta/recipes-core/glibc/glibc-locale.inc b/meta/recipes-core/glibc/glibc-locale.inc
index 7c14abfe99..7f70b3ca4f 100644
--- a/meta/recipes-core/glibc/glibc-locale.inc
+++ b/meta/recipes-core/glibc/glibc-locale.inc
@@ -5,14 +5,9 @@ SUMMARY = "Locale data from glibc"
 BPN = "glibc"
 LOCALEBASEPN = "${MLPREFIX}glibc"
 
-# glibc-collateral.inc inhibits all default deps, but do_package needs objcopy
-# ERROR: objcopy failed with exit code 127 (cmd was 'i586-webos-linux-objcopy' --only-keep-debug 'glibc-locale/2.17-r0/package/usr/lib/gconv/IBM1166.so' 'glibc-locale/2.17-r0/package/usr/lib/gconv/.debug/IBM1166.so')
-# ERROR: Function failed: split_and_strip_files
-BINUTILSDEP = "virtual/${MLPREFIX}${TARGET_PREFIX}binutils:do_populate_sysroot"
-BINUTILSDEP:class-nativesdk = "virtual/${TARGET_PREFIX}binutils-crosssdk:do_populate_sysroot"
-do_package[depends] += "${BINUTILSDEP}"
-
-DEPENDS += "virtual/libc"
+# Do not inhibit default deps, do_package requires binutils/gcc for
+# objcopy/gcc-nm and glibc-locale depends on virtual/libc directly.
+INHIBIT_DEFAULT_DEPS = ""
 
 # Binary locales are generated at build time if ENABLE_BINARY_LOCALE_GENERATION
 # is set. The idea is to avoid running localedef on the target (at first boot)
-- 
2.25.1


