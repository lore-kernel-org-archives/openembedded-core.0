Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9AF1CC02198
	for <webhook@archiver.kernel.org>; Tue, 18 Feb 2025 10:47:20 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web11.16646.1739875636124128412
 for <openembedded-core@lists.openembedded.org>;
 Tue, 18 Feb 2025 02:47:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=C+A8MZGE;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.46, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-439714a799aso27685465e9.2
        for <openembedded-core@lists.openembedded.org>; Tue, 18 Feb 2025 02:47:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1739875634; x=1740480434; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=34QkeJNGNVbl5DurtGWUqHp+RhdJlllAmQIjN7v/WtU=;
        b=C+A8MZGEK44YbuThiM4pUNXppkUCMn8s/AfNVBUg9u4uWG/lVqdu9Jv0ktNBI7M0eR
         xQ6hOXPSIWgpyManNziPy/jCTxC6NmwWSW38rKRFzfSs8I0T8fowYbZvG6CraS2K+eIr
         BKC8ronyHM7OckiXjldRiEKHcUCye4KWoahzo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739875634; x=1740480434;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=34QkeJNGNVbl5DurtGWUqHp+RhdJlllAmQIjN7v/WtU=;
        b=GcMmHJ0rUJsvf4owirQF2+GkS1hqDBxUn4i7mlyjvcJEM9r6lGELqPaA6pBhWNPw9+
         Tl3eZ37TnEFHjAbkTgHrEE5WM05wWQWxVrl6xiSipLSmZ6rM0yngfs37xd6yOppBxVAm
         esvPVDC1qRSieO6KQzNycwtX7zr1BHcPckThXfLej4CA8AI/Xj5PluKlNIl0IuSgQdT4
         xErFCpymTDjkexvi2bEZwYWMcN4z5GFRUIDTnNUPZep7YrhE62IE+o4T5JHoqFY4cGM/
         VZXGFFA9cPKrCb7mnRH/NDAYgM1o/1whTwlzp00WeUHSvxBRi6BG/CUZzF3souNt2glv
         B14A==
X-Gm-Message-State: AOJu0Yybvyb9LAorrIiKmlXhGvGP5mqVL7an2F8bn7u/h/VVUhdi7H/t
	dkvj3yXPsCxTuucUnhp/QZTxfnI5mjp1TJ/BqsXd1+fQOPXvvTE6NenbHjO2gEyTRzzYuViqA83
	m
X-Gm-Gg: ASbGnctqRw4MC1u5nZMNcl/7b2d4xDdCpAortY55B769ojsaSYaghArakGLK2CEJ+wn
	STHJ/yWyaKSHBjeiwm+7RXTBS1tSIam6ZFu6H+xuPuyDcelgMy6x95Mo4NL8Y52XJBB+Gcl4Ukd
	VY82GaQG+TsW32WmVyWEFyteLobetcFm4C82uuEiYTO+c7RYJSPldZ8j3HdmslCfKhVNOW29YPg
	QqJgh4r3Kqe75f5c2pKN1MeASNq9x5t5xEILxPssCQAgvp0Bsw8bJXoIo3VzT9LfR4E6R46sDry
	33MfFmDmEP996M0S8qPSMk2GacWKZeklfWr/9rAGzA==
X-Google-Smtp-Source: AGHT+IG9EDaEtaKLkT1a97xRsw2yT70/Y2Eon0z/hQtbuHIVifkL7cUpEO7SJLuKI2fACT/9jQyAUQ==
X-Received: by 2002:a05:600c:1d95:b0:439:88bb:d02f with SMTP id 5b1f17b1804b1-43988bbd25amr59595155e9.5.1739875633954;
        Tue, 18 Feb 2025 02:47:13 -0800 (PST)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:a6c8:42:fd4f:69d2])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38f258b432asm14364490f8f.6.2025.02.18.02.47.12
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Feb 2025 02:47:13 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/4] gdb: Include xz support by default and clean up PACKAGECONFIG
Date: Tue, 18 Feb 2025 10:47:09 +0000
Message-ID: <20250218104712.1362661-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 18 Feb 2025 10:47:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211600

Firstly, just include xz support in all gdb configurations to simplify config.
Most systems would already have the shared library so this isn't a big problem
for a larger debugging tool.

The PACKAGECONFIG duplication is also confusing. The only PACKAGECONFIG which
needs special handking is the python one due to the differing modules needed
in the nativesdk case. Remove all the other duplicate entries which should work
through our usual class extension code.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/gdb/gdb-common.inc         | 4 +---
 meta/recipes-devtools/gdb/gdb-cross-canadian.inc | 6 +-----
 meta/recipes-devtools/gdb/gdb-cross.inc          | 6 ------
 3 files changed, 2 insertions(+), 14 deletions(-)

diff --git a/meta/recipes-devtools/gdb/gdb-common.inc b/meta/recipes-devtools/gdb/gdb-common.inc
index ea1fc27a61b..c0312f0f05c 100644
--- a/meta/recipes-devtools/gdb/gdb-common.inc
+++ b/meta/recipes-devtools/gdb/gdb-common.inc
@@ -30,9 +30,7 @@ EXTRA_OECONF = "--disable-gdbtk --disable-x --disable-werror \
                 --with-libgmp-prefix=${STAGING_EXECPREFIXDIR} \
 "
 
-PACKAGECONFIG ??= "readline ${@bb.utils.filter('DISTRO_FEATURES', 'debuginfod', d)} python \
-                   ${@bb.utils.contains('DISTRO_FEATURES', 'minidebuginfo', 'xz', '', d)} \
-                  "
+PACKAGECONFIG ??= "readline ${@bb.utils.filter('DISTRO_FEATURES', 'debuginfod', d)} python xz"
 # Use --without-system-readline to compile with readline 5.
 PACKAGECONFIG[readline] = "--with-system-readline,--without-system-readline,readline"
 PACKAGECONFIG[python] = "--with-python=${WORKDIR}/python,--without-python,python3,python3-codecs"
diff --git a/meta/recipes-devtools/gdb/gdb-cross-canadian.inc b/meta/recipes-devtools/gdb/gdb-cross-canadian.inc
index 9150c196a85..7b4a7719e44 100644
--- a/meta/recipes-devtools/gdb/gdb-cross-canadian.inc
+++ b/meta/recipes-devtools/gdb/gdb-cross-canadian.inc
@@ -12,13 +12,9 @@ DEPENDS = "nativesdk-ncurses nativesdk-expat nativesdk-gettext nativesdk-gmp nat
 GDBPROPREFIX = "--program-prefix='${TARGET_PREFIX}'"
 
 # Overrides PACKAGECONFIG variables in gdb-common.inc
-PACKAGECONFIG ??= "python readline ${@bb.utils.filter('DISTRO_FEATURES', 'debuginfod', d)}"
 PACKAGECONFIG[python] = "--with-python=${WORKDIR}/python,--without-python,nativesdk-python3, \
                          nativesdk-python3-core \
-                         nativesdk-python3-codecs nativesdk-python3-netclient \
-                         "
-PACKAGECONFIG[readline] = "--with-system-readline,--without-system-readline,nativesdk-readline"
-PACKAGECONFIG[debuginfod] = "--with-debuginfod, --without-debuginfod, nativesdk-elfutils"
+                         nativesdk-python3-codecs nativesdk-python3-netclient"
 
 SSTATE_ALLOW_OVERLAP_FILES += "${STAGING_DATADIR}/gdb"
 
diff --git a/meta/recipes-devtools/gdb/gdb-cross.inc b/meta/recipes-devtools/gdb/gdb-cross.inc
index 399f4bba97a..acdb7317c17 100644
--- a/meta/recipes-devtools/gdb/gdb-cross.inc
+++ b/meta/recipes-devtools/gdb/gdb-cross.inc
@@ -4,12 +4,6 @@ DEPENDS = "expat-native gmp-native mpfr-native ncurses-native flex-native bison-
 
 inherit python3native pkgconfig
 
-# Overrides PACKAGECONFIG variables in gdb-common.inc
-PACKAGECONFIG ??= "python readline ${@bb.utils.filter('DISTRO_FEATURES', 'debuginfod', d)}"
-PACKAGECONFIG[python] = "--with-python=${PYTHON},--without-python,python3-native"
-PACKAGECONFIG[readline] = "--with-system-readline,--without-system-readline,readline-native"
-PACKAGECONFIG[debuginfod] = "--with-debuginfod, --without-debuginfod, elfutils-native"
-
 do_compile:prepend() {
     export STAGING_LIBDIR="${STAGING_LIBDIR_NATIVE}"
     export STAGING_INCDIR="${STAGING_INCDIR_NATIVE}"

