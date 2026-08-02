Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3F83C55175
	for <webhook@archiver.kernel.org>; Sun,  2 Aug 2026 12:56:19 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.22813.1785675376181201166
 for <openembedded-core@lists.openembedded.org>;
 Sun, 02 Aug 2026 05:56:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=CTBu/nFd;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.49, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-471eeac43bfso2518761f8f.3
        for <openembedded-core@lists.openembedded.org>; Sun, 02 Aug 2026 05:56:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1785675374; x=1786280174; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yhoZVRzpMbtWALja/meL34UUwtejMdGm2mO11lAsXE8=;
        b=CTBu/nFd14wib/gUm/6RdkzA7TW58jG3qBbQq2sZEJDo1zbXjshc7nCtQzZle/8/eE
         pX8M2QkWcfHNFwtS7WdNUhXF/IsQRCTVgaw8zY6prSamb2Urbu5/ihSlS6hBoBPYuQe7
         quv0gnHHav2rGsB8ASFLJ3/muY18x9bvsX5MY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785675374; x=1786280174;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yhoZVRzpMbtWALja/meL34UUwtejMdGm2mO11lAsXE8=;
        b=solnTplTttKsCyxH8nyYFheocThefRxUTsWPNb+uemAam8hAjsSU2R+OpQv8k26bqS
         6eGNNG66wAO96dSbhL9tgUo15bhDLy8pwew2lGbX0Sr7tKad5J2jjGZfDEGM+hEL82uV
         jcr6Rzd4U7fAZtaaTJEIa5P6fQjxBmIZWNl0L6fpHKB381sPm5bRdeOcj02/Fe01C0mI
         QCEQQPltAiBFrAs65IpPRA5a8zrPMh/AxDAEl4CUSmYBTB4QjPF9O3PcL079qWIg+gmM
         7qdcRg15HN2WcD5ux4k28dRqNCOdUDWhtZwIqt0zgTFvaWZryQPz12dtvrWDuL9cqbTo
         w1jQ==
X-Gm-Message-State: AOJu0Yzfj9qgA3Yy3Uzv7vGePqhfjpfH/R0l7tfMgF/FQVM3RG2YOes7
	WkBkrT9yBvmH0rGLtZfrH/obZq28PkNNafvgg29oqpJtIOKhMdPBP6c4TxbXspqkLR24I0rH4RE
	3RL3ug5Y=
X-Gm-Gg: AR+sD13q9+CGV6LKWrgSUdaOSiTrb5AlTsuxl2I9ZetSjUJzW3IfriHoc102OwFui64
	mwWXOdANoiXSw0SWdzeB+0b94TvzTkH8J3KXFhnRbV3T7nROYDC+17b6Ah7Eo0ezPBoxk1ReoLR
	pUf8SYctfUBU7iQCD32yeCIV431Q0G+FIyHv5aKUxAFLZ0txDAACp/fzoZN7NcsKKrdiGfWgr/C
	r2NxHLUv0XxLMaNhrSVyZMPMYm5BexSbaHK4rEXO7bIshQHq8JuQX8ssLqtsYUWNdwJsHqY3wU5
	bTDd2WdO8QaCxcBF65NRiUPA/SL1E1dzP4t7HGrUml2raD20SeNu6Vw4+mjYFU8YcZmQfuAGEN4
	XCCcYYosIp1qZ9YYWUqCHvAo/LHeQDQvHR/pPUKJhYUc9ZNyOE1qEYMeMwspwYbAg11DenFJQVu
	fVkMpk2EZupmnjZje5NSawqoVJNs1SU5LoiML8jrPLgz5d412eJ58ERveEHTPKXBNiGCuPQk9mx
	G91d67LTBKpq7wkW14=
X-Received: by 2002:a05:6000:2489:b0:475:3a97:8e2c with SMTP id ffacd0b85a97d-47fd72a8634mr15521174f8f.16.1785675374006;
        Sun, 02 Aug 2026 05:56:14 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:11e3:e7fc:e526:8a64])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fd458b73asm21911934f8f.29.2026.08.02.05.56.13
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Aug 2026 05:56:13 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/5] libpsl: upgrade 0.23.0 -> 0.23.1
Date: Sun,  2 Aug 2026 13:56:05 +0100
Message-ID: <20260802125609.4049666-3-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260802125609.4049666-1-richard.purdie@linuxfoundation.org>
References: <20260802125609.4049666-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 02 Aug 2026 12:56:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242557

Source: NEWS

01.08.2026 Release V0.23.1
  * configure: Allow explicitly disabling fuzzing
  * configure/meson: Fix reproducible builds (regression introduced in V0.23.0)
  * psl-make-dafsa: embed only the basename of the input file
  * meson: also rename cdata to _cdata in docs/libpsl/meson.build

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../0001-Support-reproducible-builds.patch    | 50 -------------------
 ...mbed-only-the-basename-of-the-input-.patch | 46 -----------------
 ...ta-to-_cdata-in-docs-libpsl-meson.bu.patch | 38 --------------
 .../{libpsl_0.23.0.bb => libpsl_0.23.1.bb}    |  8 +--
 4 files changed, 2 insertions(+), 140 deletions(-)
 delete mode 100644 meta/recipes-support/libpsl/libpsl/0001-Support-reproducible-builds.patch
 delete mode 100644 meta/recipes-support/libpsl/libpsl/0002-psl-make-dafsa-embed-only-the-basename-of-the-input-.patch
 delete mode 100644 meta/recipes-support/libpsl/libpsl/0003-meson-rename-cdata-to-_cdata-in-docs-libpsl-meson.bu.patch
 rename meta/recipes-support/libpsl/{libpsl_0.23.0.bb => libpsl_0.23.1.bb} (70%)

diff --git a/meta/recipes-support/libpsl/libpsl/0001-Support-reproducible-builds.patch b/meta/recipes-support/libpsl/libpsl/0001-Support-reproducible-builds.patch
deleted file mode 100644
index 16a3ed37db3..00000000000
--- a/meta/recipes-support/libpsl/libpsl/0001-Support-reproducible-builds.patch
+++ /dev/null
@@ -1,50 +0,0 @@
-From deaa74f9dea55d4dbf1ef98879049c02d23749e8 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Tim=20R=C3=BChsen?= <tim.ruehsen@gmx.de>
-Date: Thu, 16 Jul 2026 13:20:21 +0200
-Subject: [PATCH] Support reproducible builds
-
-Co-authored-by: Chris Lamb <lamby@debian.org>
-Upstream-Status: Backport [https://github.com/rockdaboot/libpsl/commit/1d28619bde704d5b5037e0680e72c1c326663234]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- configure.ac |  4 ++--
- meson.build  | 11 ++++++++++-
- 2 files changed, 12 insertions(+), 3 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index 8b7ccc8..3f8158d 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -42,8 +42,8 @@ AC_SUBST([LIBPSL_VERSION_MAJOR], [$(echo $VERSION | cut -d'.' -f1)])
- AC_SUBST([LIBPSL_VERSION_MINOR], [$(echo $VERSION | cut -d'.' -f2)])
- AC_SUBST([LIBPSL_VERSION_PATCH], [$(echo $VERSION | cut -d'.' -f3)])
- AC_SUBST([LIBPSL_VERSION_NUMBER], [$(printf '0x%02x%02x%02x' $LIBPSL_VERSION_MAJOR $LIBPSL_VERSION_MINOR $LIBPSL_VERSION_PATCH)])
--AC_SUBST([COPYRIGHT_MONTH], [$(date +%B)])
--AC_SUBST([COPYRIGHT_YEAR], [$(date +%Y)])
-+AC_SUBST([COPYRIGHT_MONTH], [m4_esyscmd([LC_ALL=C date -u -d "@$SOURCE_DATE_EPOCH" +%B 2>/dev/null || LC_ALL=C date -u -r "$SOURCE_DATE_EPOCH" +%B 2>/dev/null || LC_ALL=C date -u +%B])])
-+AC_SUBST([COPYRIGHT_YEAR], [m4_esyscmd([LC_ALL=Cdate -u -d "@$SOURCE_DATE_EPOCH" +%Y 2>/dev/null || LC_ALL=C date -u -r "$SOURCE_DATE_EPOCH" +%Y 2>/dev/null || LC_ALL=C date -u +%Y])])
- AC_CONFIG_FILES([include/libpsl.h tools/psl.1])
-
- dnl
-diff --git a/meson.build b/meson.build
-index 1e46d06..06c36c6 100644
---- a/meson.build
-+++ b/meson.build
-@@ -157,7 +157,16 @@ endif
- # Shared configuration data for copyright date and version
- _cdata = configuration_data()
- _cdata.set('PACKAGE_VERSION', meson.project_version())
--copyright_date = run_command(['date', '+%B %Y'], check: true).stdout().strip()
-+date_exe = find_program('date')
-+epoch_cmd = run_command('sh', '-c', 'LC_ALL=C echo "${SOURCE_DATE_EPOCH:-$(date +%s)}"', check: true)
-+source_date_epoch = epoch_cmd.stdout().strip()
-+copyright_cmd = run_command('sh', '-c',
-+  'date -u -d "@' + source_date_epoch + '" "+%B %Y" 2>/dev/null || ' +
-+  'date -u -r "' + source_date_epoch + '" "+%B %Y" 2>/dev/null || ' +
-+  'date -u "+%B %Y"',
-+  check: true
-+)
-+copyright_date = copyright_cmd.stdout().strip()
- _cdata.set('COPYRIGHT_MONTH', copyright_date.split()[0])
- _cdata.set('COPYRIGHT_YEAR', copyright_date.split()[1])
-
diff --git a/meta/recipes-support/libpsl/libpsl/0002-psl-make-dafsa-embed-only-the-basename-of-the-input-.patch b/meta/recipes-support/libpsl/libpsl/0002-psl-make-dafsa-embed-only-the-basename-of-the-input-.patch
deleted file mode 100644
index 32dfc029838..00000000000
--- a/meta/recipes-support/libpsl/libpsl/0002-psl-make-dafsa-embed-only-the-basename-of-the-input-.patch
+++ /dev/null
@@ -1,46 +0,0 @@
-From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Mon, 20 Jul 2026 09:00:00 -0700
-Subject: [PATCH] psl-make-dafsa: embed only the basename of the input file
-
-The generated suffixes_dafsa.h records the path of the public suffix
-list it was built from in _psl_filename[]. meson passes this input as an
-absolute path (meson.current_source_dir()/list/public_suffix_list.dat),
-so the full build directory ends up baked into the header and, through
-it, into the compiled library and its -src/-dbg packages. This is not
-reproducible and trips the OE buildpaths QA check (references to TMPDIR
-and to the build host HOME directory) when the build tree lives under
-those prefixes on an autobuilder.
-
-The absolute path is useless on the target anyway: it is only consumed
-by psl_builtin_outdated(), which stat()s _psl_filename and compares its
-mtime; the build-host path never exists on the running system so the
-stat always fails. psl_builtin_filename() is documented to return "the
-file name of the Public Suffix List file", so a basename is in fact the
-more faithful value.
-
-Embed only os.path.basename() of the input. The unmodified path is still
-used to open, stat and checksum the file, so only the leaked string
-changes.
-
-Upstream-Status: Backport [https://github.com/rockdaboot/libpsl/commit/b16a2c4d66e94acc3388088c7a13ae62dbacb71d]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- src/psl-make-dafsa | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/psl-make-dafsa b/src/psl-make-dafsa
-index 1111111..2222222 100755
---- a/src/psl-make-dafsa
-+++ b/src/psl-make-dafsa
-@@ -518,7 +518,7 @@ def to_cxx_plus(data, codecs):
-   text += b'static int _psl_nexceptions = %d;\n' % psl_nexceptions
-   text += b'static int _psl_nwildcards = %d;\n' % psl_nwildcards
-   text += b'static const char _psl_sha1_checksum[] = "%s";\n' % bytes(sha1_file(psl_input_file), **codecs)
--  text += b'static const char _psl_filename[] = "%s";\n' % bytes(psl_input_file, **codecs)
-+  text += b'static const char _psl_filename[] = "%s";\n' % bytes(os.path.basename(psl_input_file), **codecs)
-   return text
-
- def words_to_whatever(words, converter, utf_mode, codecs):
---
-2.51.0
diff --git a/meta/recipes-support/libpsl/libpsl/0003-meson-rename-cdata-to-_cdata-in-docs-libpsl-meson.bu.patch b/meta/recipes-support/libpsl/libpsl/0003-meson-rename-cdata-to-_cdata-in-docs-libpsl-meson.bu.patch
deleted file mode 100644
index 8aecf34e4a9..00000000000
--- a/meta/recipes-support/libpsl/libpsl/0003-meson-rename-cdata-to-_cdata-in-docs-libpsl-meson.bu.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-From 3e02f2cd038209e873c970709a9eeeead4d70afa Mon Sep 17 00:00:00 2001
-From: Tim Rühsen <tim.ruehsen@gmx.de>
-Date: Mon, 22 Jul 2026 09:00:00 +0200
-Subject: [PATCH] meson: also rename cdata to _cdata in docs/libpsl/meson.build
-
-The 0.23.0 release ships docs/libpsl/meson.build referencing a
-configuration data object named "cdata", but the top-level meson.build
-(and include/meson.build, which sets LIBPSL_VERSION on it) only defines
-"_cdata". Meson shares the interpreter scope across subdir(), so once the
-docs are enabled (get_option('docs'), which OE turns on via gtk-doc) the
-configure step fails with:
-
-  docs/libpsl/meson.build:7:20: ERROR: Unknown variable "cdata".
-
-Reference the existing "_cdata", which already carries LIBPSL_VERSION as
-needed by version.xml.in.
-
-Upstream-Status: Backport [https://github.com/rockdaboot/libpsl/commit/3e02f2cd038209e873c970709a9eeeead4d70afa]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- docs/libpsl/meson.build | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/docs/libpsl/meson.build b/docs/libpsl/meson.build
-index 1111111..2222222 100644
---- a/docs/libpsl/meson.build
-+++ b/docs/libpsl/meson.build
-@@ -4,7 +4,7 @@ if get_option('docs')
-   configure_file(
-     input : 'version.xml.in',
-     output : 'version.xml',
--    configuration : cdata)
-+    configuration : _cdata)
-
-   docs = gnome.gtkdoc('libpsl',
-     main_sgml: 'libpsl-docs.sgml',
---
-2.51.0
diff --git a/meta/recipes-support/libpsl/libpsl_0.23.0.bb b/meta/recipes-support/libpsl/libpsl_0.23.1.bb
similarity index 70%
rename from meta/recipes-support/libpsl/libpsl_0.23.0.bb
rename to meta/recipes-support/libpsl/libpsl_0.23.1.bb
index 193f5607723..3baeb9d77aa 100644
--- a/meta/recipes-support/libpsl/libpsl_0.23.0.bb
+++ b/meta/recipes-support/libpsl/libpsl_0.23.1.bb
@@ -11,12 +11,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=49296c1806ef92c28297fb264163d81e \
                     file://COPYING;md5=49296c1806ef92c28297fb264163d81e \
                     "
 
-SRC_URI = "${GITHUB_BASE_URI}/download/${PV}/${BP}.tar.gz \
-           file://0001-Support-reproducible-builds.patch \
-           file://0002-psl-make-dafsa-embed-only-the-basename-of-the-input-.patch \
-           file://0003-meson-rename-cdata-to-_cdata-in-docs-libpsl-meson.bu.patch \
-           "
-SRC_URI[sha256sum] = "f39b9631b3d369a21259ea4654f8875c0ec6995ce9551c0eb5d423e4c011f911"
+SRC_URI = "${GITHUB_BASE_URI}/download/${PV}/${BP}.tar.gz"
+SRC_URI[sha256sum] = "8fbb03054556498ba9c4cc48fcaa36a4483748c6504a65bdb9ba348f555b0e56"
 
 GITHUB_BASE_URI = "https://github.com/rockdaboot/libpsl/releases"
 

