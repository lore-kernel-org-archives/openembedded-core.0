Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A57F4C4451C
	for <webhook@archiver.kernel.org>; Tue, 21 Jul 2026 07:21:09 +0000 (UTC)
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17309.1784618462521295201
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Jul 2026 00:21:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=DlJBadqJ;
 spf=pass (domain: gmail.com, ip: 209.85.210.180, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-8487214ad2bso9989726b3a.1
        for <openembedded-core@lists.openembedded.org>; Tue, 21 Jul 2026 00:21:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784618462; x=1785223262; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=RaJ0AR7otN2FuC5ZaXI/12tHisvEQIsXwRGlf8XiqTM=;
        b=DlJBadqJFxpNrrZ+DdP/67bcFxaRCSr0nugcmCi0EB2xpUnh+txr+60xier25Sxd5H
         n7rUmsc2K1VrPWh6UxUxlRr8ovOzVuHHmLdHBvvsnYEdIzLbaxuyyrpwsrQveFgEJrqj
         jkD20AegL99hhmMrOwtJr/3Sa16UZlQ0/jhSfYfXJwMvxoQ0FzKdl0Hbf6AIvtBaNHvJ
         S8l88kAIVPn3Kr+9osKZN7FHteR1kB8hR/dCwxOvNe587jJvwLpdCvYvz7Ia5pKiPCiU
         GfaJShBtMRGY/sdT/ZdXElSd91maFJObU5jfzs4aLVtkODTnNO2gkF2zS37zgeUPBabg
         40SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784618462; x=1785223262;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RaJ0AR7otN2FuC5ZaXI/12tHisvEQIsXwRGlf8XiqTM=;
        b=ab7MTwM1kDdjeCC7z1GcywVgekY0eelHx527S3JRdDKL6uhw0PhnUU9s4+9crVJBdN
         NbuJuDsfItditXp4EtvWEjh4MraAQmijJZRHWbN7ZrlbZRRe7lnAkIK/gV5xz47KalTU
         Mmy8SQiYAdSw98JvjDq4IJtlR3w+OlAuTTVv1bToSDMLZZ/PrAStnR1W6B+cjNtnObx+
         nUCfGDQDCbUMDXEGbsgOf95Q9OB9Xk+jUtzv+2Hm5JGRY/903SJvXA+4iWyUkSmJbm6J
         PPfSbzTNbeS674fgI2b0PiIvW31536SVgP1M4JoHEuT5BUxPS5B9D/mJXo2UzrA7UwvI
         UFtw==
X-Gm-Message-State: AOJu0YxuCwzzFoy9fdhMUsLYhLK2mi0dLrnIFUtukqh8BN5Hz2LHkvQF
	yHPkWoaCSyn9SRNKyDnMIRbaU9X+ALcvqZyjeZD3sY+S4L/RUAOB6dRv4LPXWg==
X-Gm-Gg: AR+sD10gUjDaOgBrIW166xQEI5pvWvNYgZiYy1r5quYV9Fo4RYgtsj9vc/wk9MRb0SB
	4K3CpVlCv0uk0tLwSn9ZlG+HtSpTfzftzfgW19nr2pIbwWwN4uW2URKe6kDha+HQFWb2DHniEwU
	ncGYHG5ifH02cIWBlED12MB/nprjPZKdRXHM0POul77eTD0c6QFJQRXy6M6OP42ZWKnLyT4uwsX
	VYASloAZ+7CbXUVyCOYVRDLUL+agQEKj1ZIV+b6938HMFxSOmI/lFLxhyVucOVgxWOYCn3Swpk6
	eVVvs+pVkv6FY5om1SMyy0KGbr3o1Vd/Xtk2Vl4btUKXAdpu4Mz38rQBFeQn24LKc1YeN29XwAt
	7sP9XSCEGfMMx5TarAxfI0qfN9aMdW3VY8WJSgMxBKO+oW5zLdb41OhqWiTU3w3/bEQOSC3JOBB
	4vLk+bfSk/uS3yzPUGOncKULCq4HVFVTA86M9t++a6XLazj2YGj/CCrwQhU1FRwaqke5kOf/BEt
	A0mxUl1MoZ82XqnibYyraw/yzeqoCP6aRr4wlJY4zEz4eL+khtoO/E0k+xpLyl106vX2VLgM+6G
	zerDAKp1mr+Du9vAilg=
X-Received: by 2002:a05:6a00:44c5:b0:848:2f77:e2d7 with SMTP id d2e1a72fcca58-84c2951e95amr17666579b3a.64.1784618461714;
        Tue, 21 Jul 2026 00:21:01 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cb519aeb6c2sm5523431a12.21.2026.07.21.00.21.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 00:21:01 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [PATCH] libpsl: Do not embed the build path in suffixes_dafsa.h
Date: Tue, 21 Jul 2026 00:20:58 -0700
Message-ID: <20260721072058.3106645-1-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Jul 2026 07:21:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241508

The generated src/suffixes_dafsa.h records the public suffix list it was
built from in _psl_filename[]. meson feeds psl-make-dafsa an absolute
input path, so the full build directory gets baked into the header and,
through it, into the library and its -src/-dbg packages. On an
autobuilder whose build tree lives under $HOME/TMPDIR this trips the
buildpaths QA check with references to both TMPDIR and the build host
HOME directory, and it makes the build non-reproducible.

The absolute path is useless on the target: it is only consumed by
psl_builtin_outdated() to stat() the source list, which never exists on
the running system. psl_builtin_filename() is documented to return "the
file name", so embed only the basename.

Fixes

ERROR: libpsl-0.23.0-r0 do_package_qa: QA Issue: File /usr/src/debug/libpsl/0.23.0/src/suffixes_dafsa.h in package libpsl-src contains reference to TMPDIR [buildpaths]
ERROR: libpsl-0.23.0-r0 do_package_qa: QA Issue: File /usr/src/debug/libpsl/0.23.0/src/suffixes_dafsa.h in package libpsl-src contains a reference to the build host HOME directory. If upstream hardcodes a directory path that matches your home, you can set OEQA_BUILDPATHS_SKIP = "/srv/pokybuild" in the recipe. [buildpaths]

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...mbed-only-the-basename-of-the-input-.patch | 46 +++++++++++++++++++
 meta/recipes-support/libpsl/libpsl_0.23.0.bb  |  1 +
 2 files changed, 47 insertions(+)
 create mode 100644 meta/recipes-support/libpsl/libpsl/0002-psl-make-dafsa-embed-only-the-basename-of-the-input-.patch

diff --git a/meta/recipes-support/libpsl/libpsl/0002-psl-make-dafsa-embed-only-the-basename-of-the-input-.patch b/meta/recipes-support/libpsl/libpsl/0002-psl-make-dafsa-embed-only-the-basename-of-the-input-.patch
new file mode 100644
index 0000000000..3627f2d63e
--- /dev/null
+++ b/meta/recipes-support/libpsl/libpsl/0002-psl-make-dafsa-embed-only-the-basename-of-the-input-.patch
@@ -0,0 +1,46 @@
+From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Mon, 20 Jul 2026 09:00:00 -0700
+Subject: [PATCH] psl-make-dafsa: embed only the basename of the input file
+
+The generated suffixes_dafsa.h records the path of the public suffix
+list it was built from in _psl_filename[]. meson passes this input as an
+absolute path (meson.current_source_dir()/list/public_suffix_list.dat),
+so the full build directory ends up baked into the header and, through
+it, into the compiled library and its -src/-dbg packages. This is not
+reproducible and trips the OE buildpaths QA check (references to TMPDIR
+and to the build host HOME directory) when the build tree lives under
+those prefixes on an autobuilder.
+
+The absolute path is useless on the target anyway: it is only consumed
+by psl_builtin_outdated(), which stat()s _psl_filename and compares its
+mtime; the build-host path never exists on the running system so the
+stat always fails. psl_builtin_filename() is documented to return "the
+file name of the Public Suffix List file", so a basename is in fact the
+more faithful value.
+
+Embed only os.path.basename() of the input. The unmodified path is still
+used to open, stat and checksum the file, so only the leaked string
+changes.
+
+Upstream-Status: Submitted [https://github.com/rockdaboot/libpsl/pull/291]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/psl-make-dafsa | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/psl-make-dafsa b/src/psl-make-dafsa
+index 1111111..2222222 100755
+--- a/src/psl-make-dafsa
++++ b/src/psl-make-dafsa
+@@ -518,7 +518,7 @@ def to_cxx_plus(data, codecs):
+   text += b'static int _psl_nexceptions = %d;\n' % psl_nexceptions
+   text += b'static int _psl_nwildcards = %d;\n' % psl_nwildcards
+   text += b'static const char _psl_sha1_checksum[] = "%s";\n' % bytes(sha1_file(psl_input_file), **codecs)
+-  text += b'static const char _psl_filename[] = "%s";\n' % bytes(psl_input_file, **codecs)
++  text += b'static const char _psl_filename[] = "%s";\n' % bytes(os.path.basename(psl_input_file), **codecs)
+   return text
+
+ def words_to_whatever(words, converter, utf_mode, codecs):
+--
+2.51.0
diff --git a/meta/recipes-support/libpsl/libpsl_0.23.0.bb b/meta/recipes-support/libpsl/libpsl_0.23.0.bb
index f434806e1b..26c023e73e 100644
--- a/meta/recipes-support/libpsl/libpsl_0.23.0.bb
+++ b/meta/recipes-support/libpsl/libpsl_0.23.0.bb
@@ -13,6 +13,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=49296c1806ef92c28297fb264163d81e \
 
 SRC_URI = "${GITHUB_BASE_URI}/download/${PV}/${BP}.tar.gz \
            file://0001-Support-reproducible-builds.patch \
+           file://0002-psl-make-dafsa-embed-only-the-basename-of-the-input-.patch \
            "
 SRC_URI[sha256sum] = "f39b9631b3d369a21259ea4654f8875c0ec6995ce9551c0eb5d423e4c011f911"
 

