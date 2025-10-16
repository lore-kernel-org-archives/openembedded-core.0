Return-Path: <ecordonnier@snap.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80CC8CCD183
	for <webhook@archiver.kernel.org>; Thu, 16 Oct 2025 11:18:12 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web10.5608.1760613485037643085
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Oct 2025 04:18:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@snap.com header.s=google header.b=aAdPGC5G;
 spf=pass (domain: snapchat.com, ip: 209.85.128.45, mailfrom: ecordonnier@snapchat.com)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-46e5980471eso5067625e9.2
        for <openembedded-core@lists.openembedded.org>; Thu, 16 Oct 2025 04:18:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=snap.com; s=google; t=1760613483; x=1761218283; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yH0vH1M0nkpsrnefiwAwxuD+yqFYpcrtuY/7tXIAQVg=;
        b=aAdPGC5GSXTKDPeG1YLy5dQTCQGff5pj+8WJCfhml20d05sO3uL8JzG+i4boHbtvS9
         CHXeiDiEf896gt6WBgoyqRDAw8AZ+EJ1frphFiS9O9lCuiKvjVnCaTmwrcMZ2qADun4p
         uifYCVA9IDcyw8jBAIQJw7He+8Zss4kyqIFHs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760613483; x=1761218283;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yH0vH1M0nkpsrnefiwAwxuD+yqFYpcrtuY/7tXIAQVg=;
        b=GDK/9XyieN8aOLvwPH0m8N/fz7FKTmAvDWiTxQQOWhGfZ/264PX0pNuZ+LyyO6lr8W
         mFD1NPlb1cpD0wOhDmseo1GGFPCtaR56ggKBtiHqHYj4WY8v1S+vS4vj6Ubi/uTNQz5+
         3Pf/GvulZc/M/g14lYMxkKCdxNTLgA7p8zsvoBS0l7ILcjkr0nUHLkThnZf/Y0TNgkGC
         hmAz3aRY/ElRg5o4KtsS0S6P91LBfPwf2Y3/Urk/PexJam0XOP0rZZ5e1n78DFuG2WtJ
         BPzVhFp3F6Ix01algzATxiCYkEiCCrm2BLgZOqD2M+LhQ8G9GQ6kHaC4YkyJX+7KhJs/
         3nIw==
X-Gm-Message-State: AOJu0YwPG0P8z3LCtrAU7tiCA8w480AA0H0/1rCp93yfI9SPvlUZldtN
	pkRchNCBYL0OlI2hI7ctbpOIA+FzpdLlcYdeThownNUGLrLW/W/+sVEvrhwAkjDpffs6YsLD2td
	8GcZOVo4=
X-Gm-Gg: ASbGncsRpayAQ24QyJke+MjymJupdDvgOIXagVNuYl3X0LylBo7OGXhKyYR7MJxEpJ8
	Yg/iuayGkTyT+SgVsuRxtqL8B+Hv6FLiRf4SBhq940+jKbJdfBWg+uAKfgyJ8vISHU21Zembhxd
	PSo/NnmFOHqLvzp9cgrubHnZXbrfynmu69OtVvRMHypKQO5yA5uWdtAHLNnky8e2ETTiWVTRtNO
	6C3eBUCWaXagARpRfen164BzVdI7/Vnu79POmTY+npkrpWh6MFczKvL3L0R9U3+JtneeQyOv/Co
	a2qffXzOOu2+d0rfvBx3OBwEvrY3+KEkPoz51SYJ8SbknbfJtlSPTaz4+JItBqE26CEmc2+q9ih
	/Q1zNn0o0sndPRfmpG+4p6P5jpsD5EjAUizRth5rXL7Fhl862ie/mkzHKpgy7sFT1bDUMD/0caU
	rdHB2CTKcutCIOo1BCO69+mwkixYehwAPXJlo24ErbkEU3Z0q+S2ztuPdsH/enBdQO0w==
X-Google-Smtp-Source: AGHT+IHa/5lwqH0yNpuwsOFQIBdUBVVObiVmWWLFyCbbQwzWdlbRHqqGVRLBSzY+bGjr6pgnZWCVww==
X-Received: by 2002:a05:600c:6090:b0:471:13dd:baef with SMTP id 5b1f17b1804b1-47113ddbf1fmr9999485e9.26.1760613483127;
        Thu, 16 Oct 2025 04:18:03 -0700 (PDT)
Received: from lj8k2dq3.sc-core.net ([213.249.125.50])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47114423862sm20614555e9.1.2025.10.16.04.18.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Oct 2025 04:18:02 -0700 (PDT)
From: ecordonnier@snap.com
To: openembedded-core@lists.openembedded.org
Cc: Etienne Cordonnier <ecordonnier@snap.com>
Subject: [OE-core][PATCH v2] opkg: upgrade 0.7.0 -> 0.9.0
Date: Thu, 16 Oct 2025 13:16:28 +0200
Message-ID: <20251016111628.3050999-1-ecordonnier@snap.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Oct 2025 11:18:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224962

From: Etienne Cordonnier <ecordonnier@snap.com>

See release notes at
- http://downloads.yoctoproject.org/releases/opkg/opkg-0.9.0.release-notes
- http://downloads.yoctoproject.org/releases/opkg/opkg-0.8.0.release-notes

[0.9.0] - 2025-06-27

Semiannual opkg release.
Bumping the minor version as a result of the project build tooling changing from autotools to cmake.

- Added a Dockerfile container definition (`:docker/`) for a valid developer build environment for opkg.
  - It's recommended that project contributors use this container to build and test their changes.
- The AutoTools-based build framework has [been replaced](https://git.yoctoproject.org/opkg/commit/?id=3f6040e321634471ec442fb0e80f140f1437e90b) with a more modern, CMake framework.
  - Refer to the `docs/CONTRIBUTING.md` documentation for updated build instructions.

[0.8.0] - 2025-01-10

The minor version bump in this release is due to the changes to cURL error output line format.

- [Changed](https://git.yoctoproject.org/opkg/commit/?id=ab03377868256427279b36c4b2a298edae4260b8) the error output for the curl download backend, to now report the HTTP error code for failed requests.
  - e.g. `error: log_curl_download_error: Failed to download headers of https://foo.bar/all/Packages.gz: The requested URL returned error: 401`
- Enabling debug-verbosity, while using the cURL backend, [will now](https://git.yoctoproject.org/opkg/commit/?id=ce6fede3db931bb0da70d1334cdc4101d0aec702) print cURL's verbose error log to stderr when there is a download failure.
  - The verbose output may contain confidential information about your cURL transactions. So this is your reminder that debug-verbosity should not be enabled in production systems or sensitive security environments.
- The commandline configuration file option (`-f`) [can now](https://git.yoctoproject.org/opkg/commit/?id=36d08b93d2859992b624a4ba2f412cfa5c766050) be specified multiple times, and each configuration file will be loaded and their settings merged.
- [Fixed](https://git.yoctoproject.org/opkg/commit/?id=c87188d7535684fddb8cf80993c147b215602b63) a bug in control field parsing where custom fields whose keys are similar to other fields could be confused by the parser.

Signed-off-by: Etienne Cordonnier <ecordonnier@snap.com>
---
 meta/recipes-devtools/opkg/opkg/run-ptest     |  3 +--
 .../opkg/{opkg_0.7.0.bb => opkg_0.9.0.bb}     | 21 +++++++++++--------
 2 files changed, 13 insertions(+), 11 deletions(-)
 rename meta/recipes-devtools/opkg/{opkg_0.7.0.bb => opkg_0.9.0.bb} (77%)

diff --git a/meta/recipes-devtools/opkg/opkg/run-ptest b/meta/recipes-devtools/opkg/opkg/run-ptest
index 5fb7077eec9..8cf09adba57 100644
--- a/meta/recipes-devtools/opkg/opkg/run-ptest
+++ b/meta/recipes-devtools/opkg/opkg/run-ptest
@@ -1,5 +1,4 @@
 #!/bin/sh
 
 OPKG_PATH=$(which opkg)
-
-make OPKG_PATH=$OPKG_PATH run-tests
+make -C tests DATADIR=/share SYSCONFDIR=/etc VARDIR=/var OPKG_PATH=$OPKG_PATH
diff --git a/meta/recipes-devtools/opkg/opkg_0.7.0.bb b/meta/recipes-devtools/opkg/opkg_0.9.0.bb
similarity index 77%
rename from meta/recipes-devtools/opkg/opkg_0.7.0.bb
rename to meta/recipes-devtools/opkg/opkg_0.9.0.bb
index 95480b47164..9fa32268541 100644
--- a/meta/recipes-devtools/opkg/opkg_0.7.0.bb
+++ b/meta/recipes-devtools/opkg/opkg_0.9.0.bb
@@ -18,31 +18,31 @@ SRC_URI = "http://downloads.yoctoproject.org/releases/${BPN}/${BPN}-${PV}.tar.gz
            file://run-ptest \
            "
 
-SRC_URI[sha256sum] = "d973fd0f1568f58f87d6aecd9aa95e3e1f60214a45cee26704bf8fe757c54567"
+SRC_URI[sha256sum] = "440ef321862e01f83da4d02884a0cbb4d9d7b32f82faa81a6a85493f0c89d0f5"
 
 # This needs to be before ptest inherit, otherwise all ptest files end packaged
 # in libopkg package if OPKGLIBDIR == libdir, because default
 # PTEST_PATH ?= "${libdir}/${BPN}/ptest"
 PACKAGES =+ "libopkg"
 
-inherit autotools pkgconfig ptest
+inherit cmake pkgconfig ptest
 
 target_localstatedir := "${localstatedir}"
 OPKGLIBDIR ??= "${target_localstatedir}/lib"
 
 PACKAGECONFIG ??= "libsolv"
 
-PACKAGECONFIG[gpg] = "--enable-gpg,--disable-gpg,\
+PACKAGECONFIG[gpg] = "-DWITH_GPGME=ON,-DWITH_GPGME=OFF,\
     gnupg gpgme libgpg-error,\
     ${@ "gnupg" if ("native" in d.getVar("PN")) else "gnupg-gpg"}\
     "
-PACKAGECONFIG[curl] = "--enable-curl,--disable-curl,curl"
-PACKAGECONFIG[ssl-curl] = "--enable-ssl-curl,--disable-ssl-curl,curl openssl"
-PACKAGECONFIG[sha256] = "--enable-sha256,--disable-sha256"
-PACKAGECONFIG[libsolv] = "--with-libsolv,--without-libsolv,libsolv"
+PACKAGECONFIG[curl] = "-DWITH_CURL=0N,-DWITH_CURL=OFF,curl"
+PACKAGECONFIG[ssl-curl] = "-DWITH_SSLCURL=ON,-DWITH_SSLCURL=OFF,curl openssl"
+PACKAGECONFIG[sha256] = "-DWITH_SHA256=ON,-DWITH_SHA256=OFF"
+PACKAGECONFIG[libsolv] = "-DUSE_SOLVER_LIBSOLV=ON,-DUSE_SOLVER_LIBSOLV=OFF,libsolv"
 
-EXTRA_OECONF = "--enable-zstd"
-EXTRA_OECONF:append:class-native = " --localstatedir=/${@os.path.relpath('${localstatedir}', '${STAGING_DIR_NATIVE}')} --sysconfdir=/${@os.path.relpath('${sysconfdir}', '${STAGING_DIR_NATIVE}')}"
+EXTRA_OECMAKE = "-DWITH_ZSTD=ON"
+EXTRA_OECMAKE:append:class-native = " -DVARDIR=/${@os.path.relpath('${localstatedir}', '${STAGING_DIR_NATIVE}')} -DSYSCONFDIR=/${@os.path.relpath('${sysconfdir}', '${STAGING_DIR_NATIVE}')}"
 
 do_install:append () {
 	install -d ${D}${sysconfdir}/opkg
@@ -56,6 +56,9 @@ do_install:append () {
 }
 
 do_install_ptest () {
+	# the ptest class uses a Makefile for installation, but cmake uses Ninja per default so we need to install ptests manually:
+	cp -r ${S}/tests ${D}${PTEST_PATH}
+
 	sed -i -e '/@echo $^/d' ${D}${PTEST_PATH}/tests/Makefile
 	sed -i -e '/@PYTHONPATH=. $(PYTHON) $^/a\\t@if [ "$$?" != "0" ];then echo "FAIL:"$^;else echo "PASS:"$^;fi' ${D}${PTEST_PATH}/tests/Makefile
 }
-- 
2.43.0


