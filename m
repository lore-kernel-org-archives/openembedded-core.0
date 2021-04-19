Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
 by mx.groups.io with SMTP id smtpd.web08.6431.1618822854107306262
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 Apr 2021 02:00:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=jLRf194u;
 spf=pass (domain: gmail.com, ip: 209.85.218.41, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f41.google.com with SMTP id v6so50407274ejo.6
        for <openembedded-core@lists.openembedded.org>; Mon, 19 Apr 2021 02:00:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Wx9gRpjUffOu+B37FV5xssG9JsWbRx461kNxXYfOSi8=;
        b=jLRf194uJ6mZsaAvRGR9k990Rtz21/wHXHMLya9oSyBDbW2Ha4XvZnVYow7W8qYeO9
         wopiFSFOVmYNSXZ8Tvlc3MsZZa9xf6kHUiH3K1/WKdMV5mEyiXid/IACn7wv2Oyu7o4Z
         vhh+WlIegSYIKqiAMLB1CJ0ORFoaLvm92AZr4kL/21TZXozQHTfznDVv0sJAcRslIi10
         7hJs3u/HTOzPig1EBj1zNlqldlEnlFva/Tux1udgWZDWLxHCnO0oLMlWk8YL04yiuOpu
         PSNKMzywx/g82KAOx4eScEpF2OJ/INZpP4hURtCzjL1fWRNaTOpiFo5PLQhV0xe1M3Tz
         2Fjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Wx9gRpjUffOu+B37FV5xssG9JsWbRx461kNxXYfOSi8=;
        b=XtEKlYWBZftLgETPpUunXw8MFpMQSRots0L0TJnqk9wiObk0ydl3nh321d4nL945Cv
         T4cQwNS3/HE55uIueOu/wEmZqIqGGLmqqVcKfH9fRWv0j17q/Eh1Vz6ES4XB9xkh5Hio
         Vo4hupLJL/GJt2oxY3jKI6Z7FVDT0QXuOWpsEIEMw31cHA11H4+FAE5fd75yeqJlocjN
         r1P1NoTB20IcLD3rBjAm0LstBKfeSHqPM+0AdcOo/xJjIgtbvtSBLZwaAEbL/7+Vqf/M
         6AWxW2+B/Y4YEZ5fj5CENYw7K9CpNQ9+vUXY08sP73l7ZqYqGgcUzT5xDZRCCJmugiqG
         LDXw==
X-Gm-Message-State: AOAM533TUNqZfFqEMqZY/xKIkX/Bh4dZBUbWhTEp9+oCqEhyso9RhY9I
	Dg/O5acjUvEsEMVkefTXyq/31YErOBzvLw==
X-Google-Smtp-Source: ABdhPJxX8PoA9AIp215UBa8KuahV+SOMtHVTqrl+zvClSMZkziRZZsT5+l9HmBBvAMzeV4/T6VQBSA==
X-Received: by 2002:a17:906:28c9:: with SMTP id p9mr21726149ejd.111.1618822852715;
        Mon, 19 Apr 2021 02:00:52 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2454:2a0:cb00:eb83:2e01:3dda:5d46])
        by smtp.gmail.com with ESMTPSA id dc24sm3596474ejb.123.2021.04.19.02.00.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Apr 2021 02:00:52 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 3/4] default-distrovars.inc: add debuginfod to default DISTRO_FEATURES
Date: Mon, 19 Apr 2021 11:00:43 +0200
Message-Id: <20210419090044.582453-3-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210419090044.582453-1-alex.kanavin@gmail.com>
References: <20210419090044.582453-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Obtaining debug information by having it served automatically via http
is far more pleasant than messing about with debugfs and gdbserver or
transferring and installing -dbg packages by hand.

I believe we should follow the desktop distros and have it enabled
out of the box. Please see the following commit for the description
of how it works.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/conf/distro/include/default-distrovars.inc  | 2 +-
 meta/recipes-devtools/binutils/binutils_2.36.bb  | 2 +-
 meta/recipes-devtools/elfutils/elfutils_0.183.bb | 2 +-
 meta/recipes-devtools/gdb/gdb-common.inc         | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/conf/distro/include/default-distrovars.inc b/meta/conf/distro/include/default-distrovars.inc
index 433d4b6651..9fcc10f83a 100644
--- a/meta/conf/distro/include/default-distrovars.inc
+++ b/meta/conf/distro/include/default-distrovars.inc
@@ -10,7 +10,7 @@ LOCALE_UTF8_ONLY ?= "0"
 LOCALE_UTF8_IS_DEFAULT ?= "1"
 LOCALE_UTF8_IS_DEFAULT_class-nativesdk = "0"
 
-DISTRO_FEATURES_DEFAULT ?= "acl alsa argp bluetooth ext2 ipv4 ipv6 largefile pcmcia usbgadget usbhost wifi xattr nfs zeroconf pci 3g nfc x11 vfat"
+DISTRO_FEATURES_DEFAULT ?= "acl alsa argp bluetooth debuginfod ext2 ipv4 ipv6 largefile pcmcia usbgadget usbhost wifi xattr nfs zeroconf pci 3g nfc x11 vfat"
 DISTRO_FEATURES ?= "${DISTRO_FEATURES_DEFAULT}"
 IMAGE_FEATURES ?= ""
 
diff --git a/meta/recipes-devtools/binutils/binutils_2.36.bb b/meta/recipes-devtools/binutils/binutils_2.36.bb
index a50d2ee7ee..ee9617de1d 100644
--- a/meta/recipes-devtools/binutils/binutils_2.36.bb
+++ b/meta/recipes-devtools/binutils/binutils_2.36.bb
@@ -25,7 +25,7 @@ EXTRA_OECONF_class-native = "--enable-targets=all \
                              --disable-sim \
                              --disable-werror"
 
-PACKAGECONFIG ??= ""
+PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'debuginfod', d)}"
 PACKAGECONFIG[debuginfod] = "--with-debuginfod, --without-debuginfod, elfutils"
 # gcc9.0 end up mis-compiling libbfd.so with O2 which then crashes on target
 # So remove -O2 and use -Os as workaround
diff --git a/meta/recipes-devtools/elfutils/elfutils_0.183.bb b/meta/recipes-devtools/elfutils/elfutils_0.183.bb
index c0833686de..8b1dece200 100644
--- a/meta/recipes-devtools/elfutils/elfutils_0.183.bb
+++ b/meta/recipes-devtools/elfutils/elfutils_0.183.bb
@@ -38,7 +38,7 @@ EXTRA_OECONF = "--program-prefix=eu-"
 DEPENDS_BZIP2 = "bzip2-replacement-native"
 DEPENDS_BZIP2_class-target = "bzip2"
 
-PACKAGECONFIG ??= ""
+PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'debuginfod', 'debuginfod libdebuginfod', '', d)}"
 PACKAGECONFIG[bzip2] = "--with-bzlib,--without-bzlib,${DEPENDS_BZIP2}"
 PACKAGECONFIG[xz] = "--with-lzma,--without-lzma,xz"
 PACKAGECONFIG[libdebuginfod] = "--enable-libdebuginfod,--disable-libdebuginfod,curl"
diff --git a/meta/recipes-devtools/gdb/gdb-common.inc b/meta/recipes-devtools/gdb/gdb-common.inc
index 6e04552034..a2a6364daf 100644
--- a/meta/recipes-devtools/gdb/gdb-common.inc
+++ b/meta/recipes-devtools/gdb/gdb-common.inc
@@ -29,7 +29,7 @@ EXTRA_OECONF = "--disable-gdbtk --disable-x --disable-werror \
                 --disable-gprof \
 "
 
-PACKAGECONFIG ??= "readline"
+PACKAGECONFIG ??= "readline ${@bb.utils.filter('DISTRO_FEATURES', 'debuginfod', d)}"
 # Use --without-system-readline to compile with readline 5.
 PACKAGECONFIG[readline] = "--with-system-readline,--without-system-readline,readline"
 PACKAGECONFIG[python] = "--with-python=${WORKDIR}/python,--without-python,python3,python3 python3-codecs"
-- 
2.30.2

