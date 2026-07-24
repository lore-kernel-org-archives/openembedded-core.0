Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 328DFC531FA
	for <webhook@archiver.kernel.org>; Fri, 24 Jul 2026 07:29:54 +0000 (UTC)
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14460.1784878187289657750
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Jul 2026 00:29:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=U7f8CRaF;
 spf=pass (domain: gmail.com, ip: 209.85.215.176, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-ca7c1176317so113065a12.1
        for <openembedded-core@lists.openembedded.org>; Fri, 24 Jul 2026 00:29:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784878187; x=1785482987; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fvDVmTcA6xwj+YU+84NPdzfkCbuWmNpWUl+xCB6EE5g=;
        b=U7f8CRaFv+0/2y3gPsxHzIbkHacCLiZXCW3hkZURv2DMqXgCmfyaCRABxU9ogssToJ
         sGivAkFUDVev0Gkh17fDC/0sKciG11on7G5IT7nj5bcxmNQAenVOHa+5E1UY2Hx9hKQZ
         D46/IVSafrkQpvSVoq35vDdUWphcctZMR0ezYHIgHkgLO12I3mO1T4tXvnABnwv9AXoy
         gmYtOb0JDoyHVTBg7yU+FuYFfV5gVS0utorh2bTUVAQiw+mfh9t6Gkcp8/EROSJjlmd9
         6GFxPe5HoPoukXcXFl6v1iRVgQjN+qOC5SzDG7r+DVAtAcbJNlpT2m2vnVqftvt6NwQG
         eaQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784878187; x=1785482987;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fvDVmTcA6xwj+YU+84NPdzfkCbuWmNpWUl+xCB6EE5g=;
        b=rZva1uzipCKUgqYEQz5ObcBQgk6mKU1GmIT4V2svDUud6/O7aRbK/y8Z13drNz3VRx
         puAtDiY0Pogk5aSjYz137jqZYz4ssWnxxBn4MHa45httbBNNiElBnp++8GdMij5kWVJt
         6y8qRYqlju73lWl8XsjsOBcxcz+lG3W3Xptyz0dxEFRBK0hYm38sm0zZUn9bbziZS5sj
         euR3ctLMy/jbOpiQh1uuR46vzucO5qYGRxXR38MfvgqNmVhMOFEPyUK0V7WQskV3OYP7
         ae1FuYEquxymMDaiXi3w9oY5AG1uyzJe2gbMTnV5RxqMfEYAYJ3j8XCnvsPDCewBrBpa
         uvJA==
X-Gm-Message-State: AOJu0YxPX7VC2MIW3zojnLk38+KEWed/IYmdz6Zm0zmENP1GYD3PinHr
	PgXipxef61DjRdMAZh141LQXsnkQ/Y9K3+CVW2YP0XwTR0Ay+LPX/xmHWrb/VQ==
X-Gm-Gg: AR+sD13oCLvnsG6STTcPef/NmOdBFFzJ+F2AP2BAK4TJBXKktuxuuB9HxtiOvZtT1U+
	23d1jIMN8ck6YNq2jFov/w1ZaGxXWoeMW8xeQ7oeaaMWt36YgUI/JKEU+SKEOHhNhPIi4ptkhqn
	oqwAegZWDvoqX/Z2TBrhxf8k7FDYRsNfhWuq8KBp1i+B6VEkRNPvywXGDQ3viNH9DYHMrFu+FQb
	vQtddyJf+TDvZdq5/1a1OegBYTWWgklylIIenitCJwa6BLF04LpYDyJZWtr1ixDZFYT11WunpQ4
	+MMDXUJdOoMgl2VyxGYcwSZbSdu0kdArYdm4rnYaLn/iwgoYSlr8H8nSSuB/A4Ql6u9lgjFA7at
	LLS0lW1wuDYTt9rpoE3T9OXazcamfiKSXZHr/JzF9FQhcoFcgu/A67QtsFNoPeS3mi6RJ3TaznG
	G3P2Zn9tS5g62Ru38Y+MEyiq8t3JB9A4pVTuUUrwKUQwM70KhN2bXWGd+Vh0laisQLOxXLIStrS
	jKjFHSOR9N46kIyM4k0Ljhuendkrj23pMDJP6bwRvwinvjlko/3zJj8dPrY7yTHrLfIYpSIS05U
	RZ3aK6oiMGTaK/borVE=
X-Received: by 2002:a05:6a21:7008:b0:3bf:7081:9356 with SMTP id adf61e73a8af0-3c44affe1afmr7012432637.17.1784878186548;
        Fri, 24 Jul 2026 00:29:46 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3147dc193f8sm45091397eec.1.2026.07.24.00.29.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 00:29:46 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [PATCH v3 3/4] libpsl: Do not embed the build path in suffixes_dafsa.h
Date: Fri, 24 Jul 2026 00:29:38 -0700
Message-ID: <20260724072940.2807849-3-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260724072940.2807849-1-khem.raj@oss.qualcomm.com>
References: <20260724072940.2807849-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 Jul 2026 07:29:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241904

From: Khem Raj <raj.khem@gmail.com>

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
index 5060e3d863..0994b5a030 100644
--- a/meta/recipes-support/libpsl/libpsl_0.23.0.bb
+++ b/meta/recipes-support/libpsl/libpsl_0.23.0.bb
@@ -13,6 +13,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=49296c1806ef92c28297fb264163d81e \
 
 SRC_URI = "${GITHUB_BASE_URI}/download/${PV}/${BP}.tar.gz \
            file://0001-Support-reproducible-builds.patch \
+           file://0002-psl-make-dafsa-embed-only-the-basename-of-the-input-.patch \
            "
 SRC_URI[sha256sum] = "f39b9631b3d369a21259ea4654f8875c0ec6995ce9551c0eb5d423e4c011f911"
 

