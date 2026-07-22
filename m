Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67C2CC44536
	for <webhook@archiver.kernel.org>; Wed, 22 Jul 2026 21:57:51 +0000 (UTC)
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11276.1784757463614949042
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Jul 2026 14:57:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=aRpopa19;
 spf=pass (domain: gmail.com, ip: 209.85.216.50, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-38e071ed6aeso8622557a91.0
        for <openembedded-core@lists.openembedded.org>; Wed, 22 Jul 2026 14:57:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784757463; x=1785362263; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VlCApHEtHAWFE8cCFZ289I03S7g63wlHpzPBWpc7I0k=;
        b=aRpopa19RTi250GHNWxvqIGWznYlUNpBmevN+74muroAPziaOWQzUCs8xNU4nljIAJ
         QYCoxhNjvLznudX1Z8j8rrXQhOZ6hmPmBhToH2VvJlBBIT9ffMVcw1bsSDa88ztuwKmC
         MAiHa3QdkdSY/jk9nPG2HhMT8HuzhGa7jSfv2pBK9yah+1RmbtAPpPMvBbHNSVKbPY8V
         I0uVG74zc8TKLtNFE1kdCFn9oiBEv0y0LPNgKxQTvDGotheDhLDVjL8UolyLYntSCsL9
         hdWrhG2C5iGCcstj/XVQGBkShe8+oE9SJvoT3Y4UxWH/G7NDyPuubf/7oioaEr3On1SP
         nyew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784757463; x=1785362263;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=VlCApHEtHAWFE8cCFZ289I03S7g63wlHpzPBWpc7I0k=;
        b=rJvJDCE2Q5od9ksFaSTdne2gMsyT5mcN6V26R8OekFkAXc4lRE4M06wpWKOC7RPRwj
         KFdbG4qav8TWU/HBR6INk8o7jquJtZkObgKe/Q3pGSZ9sTwVyXlvi8Lic6kIX83LMinp
         11dXfVSeWiUm/BxZgd0rFEXrzoEdh6gY1rZw/jzDoreGRIb3fm8BDf0MTKid2uqOspik
         lppH6tM/kZeEFfmJZr5CB7giXUgIa4nYZrkhPeOoJvltHIsUGlhQenuUq74lU98S6lQb
         uu5HKjMlAwulAPIgi1pLPqj4FFbEbDewZzATQ9F2dbRTlUclP+xmQW4wQkzuc1Nreg5t
         xmKw==
X-Gm-Message-State: AOJu0YwhSkaQdQPl0boPG+j3gRumlv2POh1IKo/lH3PbnCfTcMXART0l
	qGuwDNVViD7ae0e+rm9bUKS3qwmbJTQb+RFW5h8QIceEMIWf5u6UHYPWV93nig==
X-Gm-Gg: AR+sD10u+ng5CkaGyfgeMwDf9MgyDi5Cpfg+FagU9NJp94+7BL0H/V5BUvNMZBqT4wT
	OYl5R1EsINbIyEXZE77xpZWt1cgXlT8LnNTBbMBPALZzwWZspxDLXM9JPESoMrCb6ibSsFQVW1H
	O7rGqFKUX3Gs4q3gNOaSflfs9/4tuKkKqr4RP/zxWFBzSD2wjBRFKw8LFzLkv+QN2ZmngxMFiyz
	jV8XEHFVMo5AW/TRYtVq0Lbx2k9P4WYfc5l4FL3GAe4ZZ2ri/1w3b5/jtwF2AhAPYeneAuwv7zo
	uStiZ51mhGyIT0qqJxNR8fbkGGWiPeqfAdJVXHcxZRNaUVJeewsSdIAGEKAyn/KtOB7CNTNPBwd
	hdGI5LRrivHyz68FWR6614Yt0mbEtaWHvmjnQQgbvyJ3juyPSFDD21k055f4qZM4iDLFRYVnFpx
	jk9/jwu/m1pfn2od6IZfF9Dr0FMIYA0MPKoxg19BfZ4nzD4o7Qm2J0GJ1o+foS9N+UO2zHFGmNB
	C7i+RPZr7bOlQ0YOqyYhsok+6wvhELFoNEG50yGwUlJoN9KcQ+mtZClHkb5e8+fHLaHZsQZT5jn
	RCJtmMi4bSoTcq1IAbU=
X-Received: by 2002:a05:6a20:9148:b0:3c3:83e6:c6e6 with SMTP id adf61e73a8af0-3c44b1ee701mr295259637.55.1784757462916;
        Wed, 22 Jul 2026 14:57:42 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3147dc9f2f0sm13264388eec.13.2026.07.22.14.57.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 14:57:41 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [PATCH v2 2/4] libpsl: convert to meson build system
Date: Wed, 22 Jul 2026 14:57:33 -0700
Message-ID: <20260722215737.1940382-2-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260722215737.1940382-1-khem.raj@oss.qualcomm.com>
References: <20260722215737.1940382-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Jul 2026 21:57:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241759

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
v2: Inherit manpages

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
index 793fe0d73b..f915fae621 100644
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
+inherit meson gtk-doc pkgconfig lib_package github-releases manpages
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

