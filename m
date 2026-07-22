Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57F2FC4453A
	for <webhook@archiver.kernel.org>; Wed, 22 Jul 2026 21:57:51 +0000 (UTC)
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11278.1784757465096121503
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Jul 2026 14:57:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=itaekLG3;
 spf=pass (domain: gmail.com, ip: 209.85.215.173, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-cbb662575d3so10463a12.0
        for <openembedded-core@lists.openembedded.org>; Wed, 22 Jul 2026 14:57:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784757464; x=1785362264; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BIyFVzQxmZcQ6lyJrFkYj0rMXXvYuZnfMiFDGWZ4jmM=;
        b=itaekLG3RL1UCIgITvjzzsQ3ZghvuwZ2vVBLBRKpwUnkpdslDHFawoW4aGANTAXqFg
         3wD+7H4TZYQw8Opr7gYfQS0ZBFF6Fk/ZU2uUORJE+Kwn39cjr3Df9us+r94oXIav5ol7
         fR+omb+qTNADDekWbC8BjezjgJqX+6e2b0smxVWQcurRWWWX0WVxRodp5OWKJRFP/8OQ
         bCr9AD1yekb9EIu0PkS05sbcId73+mgEYegXwbcmCeEadO1lRQ0AATnru8ltMN89ngWi
         7qIKhG6ulGRiCiytxht1x3+KnCcR8g/sNNtNnQazs4NkUa7gtf+hzSwS+ZW7j1Uf69zs
         dQdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784757464; x=1785362264;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=BIyFVzQxmZcQ6lyJrFkYj0rMXXvYuZnfMiFDGWZ4jmM=;
        b=EIc52w1lhoXXlhSRkyapTFChQ6ntDhpaAGmS73gIn7tj2yN72Dq3oT2jMmHWyNyVkc
         L9b5DyjL/dua8xpISY4gKxmas7+r3m3G+D5YAdxmf5526kMhjiYGJLyEW5Hwr7SJrsLk
         ivhRt/FvpLMxqqvkoSkHW1PIgNXhRdfvZM37de47j9aAi8X34zPIjX7HBUE/pvC1Dfp6
         H/hmy/eGWNvzQl8pkIZgj4HwyYnZpBMM3BjePs7hvkNIDIYIkud9vWikBi+DL5sqbqDo
         LDTUtdDRojd8rFGecnir1mZ6SkhrOLfY7gX9s31gktrshLVXC4l03wiHsfoopirdGxfh
         c7Vw==
X-Gm-Message-State: AOJu0YyHe+TQX6qTJgh3Dm4Xu822IiumwjmFrw1gCr8VE3qDQ4RtXjZD
	eGvx0GtxYmmOe2EkDihduo0pIpmOS25VVkTUfwMWA3e0SeAgiHhqRBw1zZpg/w==
X-Gm-Gg: AR+sD13znrbzBWXbLXawqrbWcvtzoZT+VDWTt1RsbphOXjF4tn4SPA7BtPvpSN1gUPK
	Um8/YIs7C9Fh+Sy4qKaJUPPct5WtIYXrGgRI8qJ8Yq+v8PiSJdBG0ghU9dlAxxeyOGc7vMxAP4L
	3bS2SH9o0Qt/nzNkHuucY3AjEX4JhCU6NJsld8pD2UTCyajs5JRfJbyRo/CudwHL3IsFf1ojE2B
	6ADPt4LfiSFR9s/9x07mDCc/MzSiwi/HdB2f3e3It0eVkEYtRKJ7jnd/phF75NeWKnM/4qamy7q
	R6uYavSjxZuQQhdo4slROafvCCRV3a3NVUF+RuGObQNijixml99mNeDsgEdTpw0zgDbbEdZ2EFI
	tzuVXm5und6RIZs1SyZvey2n2FQpBSYAKEw0ayReTqsH4Kpuh+z5b24Yqw4LI6SxDzsPNrC3NoE
	Hf8X7AaHoxzr4ciyEtYqnn22/FgERxxJWqITLvT46LNsNDOk2MaSzldKPBAbFP0nW32+4rjvSG+
	8qC6yaFWqgBF7T7y8MpJpV4UfncyyGgdQbfn/cu5uD0WdDsE1ylZGAWYLCN4SyJKCR6E6hIDQv/
	caNa/v834rLYrlD2rX4=
X-Received: by 2002:a05:6a20:6a06:b0:3c3:a17c:1f77 with SMTP id adf61e73a8af0-3c44b245a28mr281195637.51.1784757464271;
        Wed, 22 Jul 2026 14:57:44 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3147dc9f2f0sm13264388eec.13.2026.07.22.14.57.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 14:57:43 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [PATCH v2 3/4] libpsl: Do not embed the build path in suffixes_dafsa.h
Date: Wed, 22 Jul 2026 14:57:34 -0700
Message-ID: <20260722215737.1940382-3-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260722215737.1940382-1-khem.raj@oss.qualcomm.com>
References: <20260722215737.1940382-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Jul 2026 21:57:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241760

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
index 0000000000..32dfc02983
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
+Upstream-Status: Backport [https://github.com/rockdaboot/libpsl/commit/b16a2c4d66e94acc3388088c7a13ae62dbacb71d]
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
index f915fae621..6026adad9f 100644
--- a/meta/recipes-support/libpsl/libpsl_0.23.0.bb
+++ b/meta/recipes-support/libpsl/libpsl_0.23.0.bb
@@ -13,6 +13,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=49296c1806ef92c28297fb264163d81e \
 
 SRC_URI = "${GITHUB_BASE_URI}/download/${PV}/${BP}.tar.gz \
            file://0001-Support-reproducible-builds.patch \
+           file://0002-psl-make-dafsa-embed-only-the-basename-of-the-input-.patch \
            "
 SRC_URI[sha256sum] = "f39b9631b3d369a21259ea4654f8875c0ec6995ce9551c0eb5d423e4c011f911"
 

