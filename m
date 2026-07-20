Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE5F6C44515
	for <webhook@archiver.kernel.org>; Mon, 20 Jul 2026 05:35:40 +0000 (UTC)
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2708.1784525733007401914
 for <openembedded-core@lists.openembedded.org>;
 Sun, 19 Jul 2026 22:35:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=eGSnFa5F;
 spf=pass (domain: gmail.com, ip: 209.85.210.178, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-8487b7b3fc8so9696699b3a.3
        for <openembedded-core@lists.openembedded.org>; Sun, 19 Jul 2026 22:35:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784525732; x=1785130532; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vVuo2za3soUrLkHeoozrFhd3b1fy43i7n+kAXnqioHA=;
        b=eGSnFa5FDr/k9lkNRe35ymW2IpRDiNouaxMORS8WFuxkX52OtoMr/VXGKVY5YBXxHH
         hCz+oMBzAiDxy9luInTvjXvHcvnuyxMpSkhorfWC/j8V+/zt9WIoL1V6WA0fKsNFDDfC
         bxygQKQHGDWTMxaG/IW3OlARN10DiBiH1F1T+LryTB/UY4cTe9XBaRlv6e5fGI5Ng9ZS
         WeVOPLlYop7nUOuZ/PVwMBaMpQKt0U/i+JZdAk9aOlraPMLnXUzp43CZyoQMAmBoAJ1M
         UhlMpkVyz0fzsM9P8sSQZtG/oJdWm4L8dO1QiP+cP+nxKfNwylBvEodFUGYc5tD9YWNm
         FChA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784525732; x=1785130532;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vVuo2za3soUrLkHeoozrFhd3b1fy43i7n+kAXnqioHA=;
        b=lUIQDzwYZqbsUXHX9Jo/+GbKYld06EJi23c3R9wckT6umgzbizkNXyiEhshiIaICHs
         G7Syqen+t3P99+xbsqD9tlIwxYjHtAOiNoDBvgypUr7Q0wZATcVItbgmrBmlGEyjFED8
         jQUEUhczzGoLiZSXe98nKX2gud5dmxliiJxKDbNyBdHPZTepue4Se+P1MfR7+7D9HwDa
         UQjLvoa2Nu7PF42S61caClGj1wiqGo7Ie47tBRo4Rds7YeuF+zQMFQbZVbcHX+YP3w+F
         tQ7LYmAyQT2byo1oPA1JGu7VQplIH/vC/ev5Q1bhYe+uWvcS5rMIk0pZGB7SplA4Yzdp
         BZfg==
X-Gm-Message-State: AOJu0Yya9wvBEFInjk57qA9SIqcDTjwPg9+iSvhdPfOQc28sakKMrpXG
	ZkoNOB/jgi28LOzxiiet1RLXPQOJkLDjPNPKtAjJcPCKNmY0bqNbW0RYBsdl5Q==
X-Gm-Gg: AfdE7cm7b/K1CWZEH4WBOF/PMqtjCmhiJeCSIS2q0uH3cAaO+hd2bFDinXFRWOQFC4t
	s14nHzfrHN6H7E26jUhIq62NK3paEhJICie/PicgoxAtOmHU2Wpmq+t2aoTOlNniyiO9TM3BOs2
	eloaS9d5HHCXaukTuBvJVIuvvcFUpfoK7oWUQexHecgOoKnUEH0F5nXXJ+QCWNnNXbXd5A5vnOQ
	W8VXrE5qIpnVfEhO45qBrcBFMGFnDGBQTIkmoU6GNiXy4qVqnV3y8Js6BzMBxt9iGEIl+7ShEWJ
	+itKl78gXy5fZAN5kg4y5v8uKfRrs0YYLEnF1giLVGLX22rwST4m2HaRVh91xmrpSHSRoDC0ZY/
	Z/xgMArh51ucog9LdVH7XCn1NmnrGQq153pekf1wWScM/hRQerZ/+jUWQdZvmFkekGcU2hB2Uyd
	qEx/W6tNyb2VoVMBlS2wHrRO1EPU15HLn+D7Vtxa9iD2jfhNn/h3b8B9D39GH3EKBQckvp4KvcD
	BhxbQJZvpx9d6sT1fChaSiTlbjaizgoeNNG50Do6axlZRAaHnr2chRDtuvBy3pzQzBjO5i+qqZY
	IG2Rt4duHyH6e64PlOk=
X-Received: by 2002:a05:6a21:400d:b0:3c1:fbf:1e2e with SMTP id adf61e73a8af0-3c3ad6682b2mr13449931637.10.1784525732387;
        Sun, 19 Jul 2026 22:35:32 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13ce29c2dcdsm28450119c88.1.2026.07.19.22.35.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jul 2026 22:35:31 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [PATCH 2/2] libpsl: convert to meson build system
Date: Sun, 19 Jul 2026 22:35:26 -0700
Message-ID: <20260720053526.1992240-2-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260720053526.1992240-1-khem.raj@oss.qualcomm.com>
References: <20260720053526.1992240-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Jul 2026 05:35:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241321

Switch the recipe from autotools to meson:

- inherit meson instead of autotools; drop gettext (the meson build has
  no i18n) and manpages (meson installs psl.1 unconditionally, without
  needing libxslt-native).
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
index 0000000000..13a244c169
--- /dev/null
+++ b/meta/recipes-support/libpsl/libpsl/0001-Support-reproducible-builds.patch
@@ -0,0 +1,50 @@
+From deaa74f9dea55d4dbf1ef98879049c02d23749e8 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Tim=20R=C3=BChsen?= <tim.ruehsen@gmx.de>
+Date: Thu, 16 Jul 2026 13:20:21 +0200
+Subject: [PATCH] Support reproducible builds
+
+Co-authored-by: Chris Lamb <lamby@debian.org>
+Upstream-Status: Backport [https://github.com/rockdaboot/libpsl/pull/290]
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
index 793fe0d73b..f434806e1b 100644
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
+inherit meson gtk-doc pkgconfig lib_package github-releases
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

