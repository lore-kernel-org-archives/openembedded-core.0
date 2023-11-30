Return-Path: <ecordonnier@snap.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90331C4167B
	for <webhook@archiver.kernel.org>; Thu, 30 Nov 2023 10:59:12 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web11.69773.1701341951092415951
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Nov 2023 02:59:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@snap.com header.s=google header.b=aqU8bRhD;
 spf=pass (domain: snapchat.com, ip: 209.85.128.54, mailfrom: ecordonnier@snapchat.com)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-409299277bbso6210895e9.2
        for <openembedded-core@lists.openembedded.org>; Thu, 30 Nov 2023 02:59:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=snap.com; s=google; t=1701341948; x=1701946748; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xbFPayfL5SrgY1m8mLE7U05jgZaZeN66iJQuhKKBxfs=;
        b=aqU8bRhD1mLtFLeuyZH1iF+5M7umpUSSzDyZECl8ntzY46F8OIBGs5Vicd8u0UlErW
         8H6LWJBqTw1kspMmQyGBVyOdMpFjU/fDLlpjaqA1qV8mj5JUr19BK0DFzTf/TubelDTn
         5nSFE98+sQ/De/3A6DjuMr8VupRN7a1Yo9u/w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701341948; x=1701946748;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xbFPayfL5SrgY1m8mLE7U05jgZaZeN66iJQuhKKBxfs=;
        b=At1i05MpRZZeMS9qab/e0xqSW7a3iD7hV0emwsFhgEuh5MnWYnH32tqNalb/PFYYca
         5163Eocaq06kA8CY1xrNhFJaLOwg91RsvZVyFu9ZODphdorG1mBssS3Hp5cLEtznKAc0
         osyj+o325hUxrNIs6tF95gNtC5DDsxyYDyQjMvjTBu5pu/+bPkUgriRhPS01flIQYJbn
         sPYrkgPKebsWKxZ3c0CxnSeRBm0usb0Rz7kxRZozSw9K4wpKtT7+Kr9YrtuggNe4gaBu
         ERRq4lgGit8hgfwE08AXris/KgovMMXK7jbYAAJlAbc+h2rW7c3N0JfuC5nwYWgfvwNd
         P3FQ==
X-Gm-Message-State: AOJu0YxJaLCIti7YP7FOL5r71Fj5L3QddBk5/nuTTfA4iuPr7O/c3wv5
	NbI4tSgvXJoEGMsMqrYlpGz0x5YOFzbux2xXzrA7/Q==
X-Google-Smtp-Source: AGHT+IEOl0QsO1wcQUfeIPt8+teTPIM9y7WHuZLVVzCjiod9lYZdqL4S3KapAl+rWp/xqFCSXdOM6A==
X-Received: by 2002:adf:ec90:0:b0:332:f889:39ef with SMTP id z16-20020adfec90000000b00332f88939efmr11409487wrn.11.1701341948475;
        Thu, 30 Nov 2023 02:59:08 -0800 (PST)
Received: from lj8k2dq3.sc-core.net ([85.237.126.22])
        by smtp.gmail.com with ESMTPSA id z4-20020a5d6404000000b00332e5624a31sm1194415wru.84.2023.11.30.02.59.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Nov 2023 02:59:08 -0800 (PST)
From: ecordonnier@snap.com
To: openembedded-core@lists.openembedded.org
Cc: Etienne Cordonnier <ecordonnier@snap.com>
Subject: [PATCH] gdb/systemd: enable minidebuginfo support conditionally
Date: Thu, 30 Nov 2023 11:59:01 +0100
Message-Id: <20231130105901.369788-1-ecordonnier@snap.com>
X-Mailer: git-send-email 2.36.1.vfs.0.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Nov 2023 10:59:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191493

From: Etienne Cordonnier <ecordonnier@snap.com>

Enabling minidebuginfo is not useful if gdb and systemd-coredump
are unable to parse it.

In order to parse it, gdb needs xz support. Systemd needs coredump enabled, as
well as elfutil enabled as well (systemd-coredump loads libdw which is part of elfutils using dlopen).

Signed-off-by: Etienne Cordonnier <ecordonnier@snap.com>
---
 meta/recipes-core/systemd/systemd_254.4.bb       | 1 +
 meta/recipes-devtools/elfutils/elfutils_0.189.bb | 3 ++-
 meta/recipes-devtools/gdb/gdb-common.inc         | 3 ++-
 3 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/systemd/systemd_254.4.bb b/meta/recipes-core/systemd/systemd_254.4.bb
index ecf693ef92..f3e56bf94c 100644
--- a/meta/recipes-core/systemd/systemd_254.4.bb
+++ b/meta/recipes-core/systemd/systemd_254.4.bb
@@ -70,6 +70,7 @@ PACKAGECONFIG ??= " \
     ${@bb.utils.contains('DISTRO_FEATURES', 'wifi', 'rfkill', '', d)} \
     ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'xkbcommon', '', d)} \
     ${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', '', 'link-udev-shared', d)} \
+    ${@'coredump elfutils' if d.getVar('PACKAGE_MINIDEBUGINFO') == '1' else ''} \
     backlight \
     binfmt \
     gshadow \
diff --git a/meta/recipes-devtools/elfutils/elfutils_0.189.bb b/meta/recipes-devtools/elfutils/elfutils_0.189.bb
index d8bf82b022..4f097e5b5c 100644
--- a/meta/recipes-devtools/elfutils/elfutils_0.189.bb
+++ b/meta/recipes-devtools/elfutils/elfutils_0.189.bb
@@ -39,7 +39,8 @@ BUILD_CFLAGS += "-Wno-error=stringop-overflow"
 DEPENDS_BZIP2 = "bzip2-replacement-native"
 DEPENDS_BZIP2:class-target = "bzip2"
 
-PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'debuginfod', 'debuginfod libdebuginfod', '', d)}"
+PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'debuginfod', 'debuginfod libdebuginfod', '', d)} \
+                   ${@'xz' if d.getVar('PACKAGE_MINIDEBUGINFO') == '1' else ''}"
 PACKAGECONFIG[bzip2] = "--with-bzlib,--without-bzlib,${DEPENDS_BZIP2}"
 PACKAGECONFIG[xz] = "--with-lzma,--without-lzma,xz"
 PACKAGECONFIG[zstd] = "--with-zstd,--without-zstd,zstd"
diff --git a/meta/recipes-devtools/gdb/gdb-common.inc b/meta/recipes-devtools/gdb/gdb-common.inc
index 3349719a6b..c444af62b3 100644
--- a/meta/recipes-devtools/gdb/gdb-common.inc
+++ b/meta/recipes-devtools/gdb/gdb-common.inc
@@ -30,7 +30,8 @@ EXTRA_OECONF = "--disable-gdbtk --disable-x --disable-werror \
                 --with-libgmp-prefix=${STAGING_EXECPREFIXDIR} \
 "
 
-PACKAGECONFIG ??= "readline ${@bb.utils.filter('DISTRO_FEATURES', 'debuginfod', d)} python"
+PACKAGECONFIG ??= "readline ${@bb.utils.filter('DISTRO_FEATURES', 'debuginfod', d)} python \
+                   ${@'xz' if d.getVar('PACKAGE_MINIDEBUGINFO') == '1' else ''}"
 # Use --without-system-readline to compile with readline 5.
 PACKAGECONFIG[readline] = "--with-system-readline,--without-system-readline,readline"
 PACKAGECONFIG[python] = "--with-python=${WORKDIR}/python,--without-python,python3,python3-codecs"
-- 
2.36.1.vfs.0.0


