Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26948C531F9
	for <webhook@archiver.kernel.org>; Fri, 24 Jul 2026 07:29:54 +0000 (UTC)
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14280.1784878186142307318
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Jul 2026 00:29:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=K7whpYTo;
 spf=pass (domain: gmail.com, ip: 209.85.215.177, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-c981c2c37cbso115008a12.0
        for <openembedded-core@lists.openembedded.org>; Fri, 24 Jul 2026 00:29:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784878185; x=1785482985; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hToJqclZJjUS/y10vPDgiGP8bIQtWf/N0tlK5X/cjuA=;
        b=K7whpYToPLS9fF7v3tt+E6rlt10NW5w/Vbi6C4ee0PlfJzdrwQkUt3M4sHMM8i6vFH
         EoC01wNNRPy0MmmdTXaf5UI5/oc/aYZfy4K455IAXKiHCZlanOZsP8XBm00zSv0uRqNX
         mnj8vI4gFkJr4RIf2HDcSHvT1jOiXw+R5+mH1hDJVm7GfBLURxTdkmKwwJnKlbMqfW32
         C4J5nCe2TxCBl7dY/Y9CVA+Q64NiBz4qbRigv6TKPfwga5NS/UOLs1+sHL3E3HhNLgNS
         Tb6heoR9Ee1YRQi/A0VNHgfmdzeDI3qnUOoaqspcmkM1JFv3sNSRcDO86CTaPQR7+UIp
         hqAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784878185; x=1785482985;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hToJqclZJjUS/y10vPDgiGP8bIQtWf/N0tlK5X/cjuA=;
        b=Uuig5MF3Mdy1oQexEw+vt2IwXCm+uAaj1IPprhRM28awunv1DNhkLT4Yhb4ghS0F42
         r7VD9GQZt6YCknZzPwXnq76g6HpSq1Si+Fz/4Pu+8aQOUZtvU87qg587OANSe2uL4ZbX
         7rbm6mDwowMms993vEgrMIWEDpY8ZZCtqTie+hMaVf/7E2I9T6rW+KLAjCScKsvQSihG
         K4HKqA9HPnLFdFq0jR4pjDvaenNBZJ+I+heDeuFx10q99yspyRR707MhHmQO+0AbE3gE
         tmyFvItR0AaZ+MeJ5D18gEeDtbvuUanPniK/nQBJgqUElfRRdldY6aIStBpR5rRD8K+F
         V/Aw==
X-Gm-Message-State: AOJu0YzMyjw1OjQATYaxaFywXDHcjuezdC76J/sMcEkyb4LBvoX9hCWu
	KvFt+dowEcyNi9QstRw0Jb7qSAMVRHXJkhWse6VX9k+Smj5+Bc0vbJSMwhiCvA==
X-Gm-Gg: AR+sD12nKJsyS4ZDskbrigIBcxmu4dEa4o5qlbpruQwXkOKiAWIV8lCn66JW7cBG0Yb
	xD34BmO2FUlVMNVsuVdeEfol/Q9V4w7lMX3MoX8OsDpv3i74gWuIor/Sbi2ooFBw192Q+Cr4ka/
	oN3il41Gh01eB1ft9RZNqh429mozF/NKhixEND9MsKh4ZCmnQaSy26wX8OAVocIm3no+0Zs22sN
	49Kh7BggUb4fPga6j5Z6+j/30n3k5mDIddKmtgJCiVh0zVo0FmSlS4sLDYuCLh4i1F7twoB7NXk
	oU/tDGM9xA5duFXIOtmy+gmZulY8dGnuhXPvMUKKgoskFz7O8YeCY1SK1fBmOM/OFjxwL9KVNHJ
	fQeOdUXV6mhppRSx6UibHYWLV/0EPJcRsh6WU6jSt1HN6pVBDZBv+Hq8wkTDypbROyqmAJUuq0d
	v9vsAP0WZSyL7cPy+wY+L8HGT4NQYgMyyWrXfCQStA/SnVIxCADPi0Lfc4Ab4KPrkbMzD3sICQ7
	NCRJQkGnMT73pd6g37YpgakXHb3rnc9uE2g3tqOZFgLpWa5w+BgRPZK6Qgr262oLlaI8ZF0MeaB
	XyCVXZgpd3hwZ8MlFF8=
X-Received: by 2002:a05:6a21:7008:b0:3c3:8de3:8eee with SMTP id adf61e73a8af0-3c44b222849mr7226765637.61.1784878185357;
        Fri, 24 Jul 2026 00:29:45 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3147dc193f8sm45091397eec.1.2026.07.24.00.29.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 00:29:44 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [PATCH v3 2/4] libpsl: convert to meson build system
Date: Fri, 24 Jul 2026 00:29:37 -0700
Message-ID: <20260724072940.2807849-2-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260724072940.2807849-1-khem.raj@oss.qualcomm.com>
References: <20260724072940.2807849-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 Jul 2026 07:29:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241903

From: Khem Raj <raj.khem@gmail.com>

Switch the recipe from autotools to meson:

- inherit meson instead of autotools; drop gettext (the meson build has
  no i18n)
- Map the PACKAGECONFIG knobs to meson options: --enable-runtime=X
  becomes -Druntime=X, and builtin PSL data stays enabled via meson's
  default (-Dbuiltin=true), matching the previous --enable-builtin.
- Disable the bundled tests and fuzzers with -Dtests=false.
- The gtk-doc class drives -Ddocs on its own via GTKDOC_MESON_OPTION.

Unlike the autotools tarball, meson regenerates psl.1 at build time and
stamps it with `date +%B %Y`, which is not reproducible. Backport the
proposed upstream fix to honour SOURCE_DATE_EPOCH.

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../0001-Support-reproducible-builds.patch    | 50 +++++++++++++++++++
 meta/recipes-support/libpsl/libpsl_0.23.0.bb  | 11 ++--
 2 files changed, 57 insertions(+), 4 deletions(-)
 create mode 100644 meta/recipes-support/libpsl/libpsl/0001-Support-reproducible-builds.patch

diff --git a/meta/recipes-support/libpsl/libpsl/0001-Support-reproducible-builds.patch b/meta/recipes-support/libpsl/libpsl/0001-Support-reproducible-builds.patch
new file mode 100644
index 0000000000..16a3ed37db
--- /dev/null
+++ b/meta/recipes-support/libpsl/libpsl/0001-Support-reproducible-builds.patch
@@ -0,0 +1,50 @@
+From deaa74f9dea55d4dbf1ef98879049c02d23749e8 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Tim=20R=C3=BChsen?= <tim.ruehsen@gmx.de>
+Date: Thu, 16 Jul 2026 13:20:21 +0200
+Subject: [PATCH] Support reproducible builds
+
+Co-authored-by: Chris Lamb <lamby@debian.org>
+Upstream-Status: Backport [https://github.com/rockdaboot/libpsl/commit/1d28619bde704d5b5037e0680e72c1c326663234]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ configure.ac |  4 ++--
+ meson.build  | 11 ++++++++++-
+ 2 files changed, 12 insertions(+), 3 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 8b7ccc8..3f8158d 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -42,8 +42,8 @@ AC_SUBST([LIBPSL_VERSION_MAJOR], [$(echo $VERSION | cut -d'.' -f1)])
+ AC_SUBST([LIBPSL_VERSION_MINOR], [$(echo $VERSION | cut -d'.' -f2)])
+ AC_SUBST([LIBPSL_VERSION_PATCH], [$(echo $VERSION | cut -d'.' -f3)])
+ AC_SUBST([LIBPSL_VERSION_NUMBER], [$(printf '0x%02x%02x%02x' $LIBPSL_VERSION_MAJOR $LIBPSL_VERSION_MINOR $LIBPSL_VERSION_PATCH)])
+-AC_SUBST([COPYRIGHT_MONTH], [$(date +%B)])
+-AC_SUBST([COPYRIGHT_YEAR], [$(date +%Y)])
++AC_SUBST([COPYRIGHT_MONTH], [m4_esyscmd([LC_ALL=C date -u -d "@$SOURCE_DATE_EPOCH" +%B 2>/dev/null || LC_ALL=C date -u -r "$SOURCE_DATE_EPOCH" +%B 2>/dev/null || LC_ALL=C date -u +%B])])
++AC_SUBST([COPYRIGHT_YEAR], [m4_esyscmd([LC_ALL=Cdate -u -d "@$SOURCE_DATE_EPOCH" +%Y 2>/dev/null || LC_ALL=C date -u -r "$SOURCE_DATE_EPOCH" +%Y 2>/dev/null || LC_ALL=C date -u +%Y])])
+ AC_CONFIG_FILES([include/libpsl.h tools/psl.1])
+
+ dnl
+diff --git a/meson.build b/meson.build
+index 1e46d06..06c36c6 100644
+--- a/meson.build
++++ b/meson.build
+@@ -157,7 +157,16 @@ endif
+ # Shared configuration data for copyright date and version
+ _cdata = configuration_data()
+ _cdata.set('PACKAGE_VERSION', meson.project_version())
+-copyright_date = run_command(['date', '+%B %Y'], check: true).stdout().strip()
++date_exe = find_program('date')
++epoch_cmd = run_command('sh', '-c', 'LC_ALL=C echo "${SOURCE_DATE_EPOCH:-$(date +%s)}"', check: true)
++source_date_epoch = epoch_cmd.stdout().strip()
++copyright_cmd = run_command('sh', '-c',
++  'date -u -d "@' + source_date_epoch + '" "+%B %Y" 2>/dev/null || ' +
++  'date -u -r "' + source_date_epoch + '" "+%B %Y" 2>/dev/null || ' +
++  'date -u "+%B %Y"',
++  check: true
++)
++copyright_date = copyright_cmd.stdout().strip()
+ _cdata.set('COPYRIGHT_MONTH', copyright_date.split()[0])
+ _cdata.set('COPYRIGHT_YEAR', copyright_date.split()[1])
+
diff --git a/meta/recipes-support/libpsl/libpsl_0.23.0.bb b/meta/recipes-support/libpsl/libpsl_0.23.0.bb
index 793fe0d73b..5060e3d863 100644
--- a/meta/recipes-support/libpsl/libpsl_0.23.0.bb
+++ b/meta/recipes-support/libpsl/libpsl_0.23.0.bb
@@ -12,15 +12,18 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=49296c1806ef92c28297fb264163d81e \
                     "
 
 SRC_URI = "${GITHUB_BASE_URI}/download/${PV}/${BP}.tar.gz \
+           file://0001-Support-reproducible-builds.patch \
            "
 SRC_URI[sha256sum] = "f39b9631b3d369a21259ea4654f8875c0ec6995ce9551c0eb5d423e4c011f911"
 
 GITHUB_BASE_URI = "https://github.com/rockdaboot/libpsl/releases"
 
-inherit autotools gettext gtk-doc manpages pkgconfig lib_package github-releases
+inherit meson gtk-doc pkgconfig lib_package github-releases gtk-doc
+
+# Do not build the bundled tests and fuzzers.
+EXTRA_OEMESON = "-Dtests=false"
 
 PACKAGECONFIG ?= "idn2"
-PACKAGECONFIG[manpages] = "--enable-man,--disable-man,libxslt-native"
-PACKAGECONFIG[icu] = "--enable-runtime=libicu --enable-builtin=libicu,,icu"
-PACKAGECONFIG[idn2] = "--enable-runtime=libidn2 --enable-builtin=libidn2,,libidn2 libunistring"
+PACKAGECONFIG[icu] = "-Druntime=libicu,,icu"
+PACKAGECONFIG[idn2] = "-Druntime=libidn2,,libidn2 libunistring"
 BBCLASSEXTEND = "native nativesdk"

