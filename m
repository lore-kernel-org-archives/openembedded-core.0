Return-Path: <ecordonnier@snap.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6DF9CCD1BC
	for <webhook@archiver.kernel.org>; Thu, 23 Oct 2025 13:47:22 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web11.21518.1761227235967577924
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Oct 2025 06:47:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@snap.com header.s=google header.b=NKJjotFZ;
 spf=pass (domain: snapchat.com, ip: 209.85.221.47, mailfrom: ecordonnier@snapchat.com)
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-42701b29a7eso461285f8f.0
        for <openembedded-core@lists.openembedded.org>; Thu, 23 Oct 2025 06:47:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=snap.com; s=google; t=1761227234; x=1761832034; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y3hUMH4P6Al6iY+gPPhRtiqFgIK0sykutot0vDuKAP8=;
        b=NKJjotFZOPtUTdBsPEhLLZBGg6zzuGqt8y6Cd4LKZ01FFAmz+2LMxRknIUkedwiTFR
         JZe6IR+3DOFDbsdZF+v2+UqHn4f7dRf1i3cU225v+XOsIMoo+1Fr8859jTBv//2FbAMW
         sxIsCDtcKjQiNzS8Iuluk96ydsMLEzJAqXYTI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761227234; x=1761832034;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y3hUMH4P6Al6iY+gPPhRtiqFgIK0sykutot0vDuKAP8=;
        b=ShePpO1qp6YxIPiujwqoXofUDc1vBZdaAf0VFiTNjEL/KIUuuwtAN4R7+GC7H2GATm
         jCkcSx9iRJLjtacOmYnzjknx2CpKTsVgEPwPPrkWGyKuUulN6ysjXx2Xly8xJOwNzVmM
         QyMekoB0hm6zn5S7nlzmQNZFBh6gfKnW7/B/YX32qF2GUg7TlgO+D/kfkBZBnbBnyyVq
         Tj1/42Rvw/1PTeqEZzZXE/uPsJTAtOaJ16k6AwlQLdjyQAvTdU1kX+6iu92TCtXmfDm1
         BCdqS8PgYYgUDogRESRl30UQ7jagg3h8divWVO+udotiOWshv4ocd1gQoEIXBVDQ8F8p
         Su+g==
X-Gm-Message-State: AOJu0Yzak8G16sTC4HrHFatqLXPz2jvvi2dm+0W7sXTMsZMh6xMpTsp6
	PPt+Pl0i1HIPjqj5089up3WIGx+p2mtn2OAMexefoujtu/vx0jbyBpKL3YRnAcwY7hOewQYqKk7
	gCnxXfSg=
X-Gm-Gg: ASbGnctS/u/Fflu03PLAHwtj9NpOIWXO3cA706BqAf5dn7BqlTgBZxZsrhukj8wbf7O
	6Cs1qPk8SQIAG114Y1H7PhVPDiF2T4k8fI/kCHv+0mQEruGdwGWcgSp7hVHWSMeYIoqn72jrt51
	WbdoPGHQQTUM7m2BS8/kTjixUds/ewBjEaqlIbOeud9ib8kStRx8WyF+BJqpBq5OQQ2dEYd5Bga
	zToGH5CTRCYQL9EM6ChPWIhG0UUn3BYhQbTqSrn4kphb8oIujaHQbIzL6y7w25fv6SDMYtbR+D+
	0jT8eQXzFfYWWY91VzbwdEx+O4uOt2qaRkeKMtzFv0HgxIGlbCGS4TWt0lRX8KsvrjKp9qC2g4e
	jyk0GHhPNmAYvhYH4zQMvhjx0mOEoGXqW4P8T5NXTpLroEs5Jo5bIlmGUrMETG4fXzjTBjnnx86
	GE2eELuGTqkhImP09DMCV9lwIak2/ad339mmvqIiECnDsd
X-Google-Smtp-Source: AGHT+IF1oYtmp5TUjdOKByvXjYhSFN7wB5WjyvKNG2qsKPZAGhjaf5YJsvC67ueoYhIxbXwNBwfN/g==
X-Received: by 2002:a05:6000:2006:b0:429:8bb2:d0ce with SMTP id ffacd0b85a97d-4298bb2d287mr1343789f8f.18.1761227234011;
        Thu, 23 Oct 2025 06:47:14 -0700 (PDT)
Received: from lj8k2dq3.sc-core.net ([213.249.125.50])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4298b996aaasm2406691f8f.3.2025.10.23.06.47.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Oct 2025 06:47:12 -0700 (PDT)
From: ecordonnier@snap.com
To: openembedded-core@lists.openembedded.org
Cc: Etienne Cordonnier <ecordonnier@snap.com>
Subject: [OE-core][PATCH v4 2/2] opkg: upgrade 0.8.0 -> 0.9.0
Date: Thu, 23 Oct 2025 15:46:56 +0200
Message-ID: <20251023134656.2059483-2-ecordonnier@snap.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251023134656.2059483-1-ecordonnier@snap.com>
References: <20251023134656.2059483-1-ecordonnier@snap.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Oct 2025 13:47:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225260

From: Etienne Cordonnier <ecordonnier@snap.com>

See release notes at
- http://downloads.yoctoproject.org/releases/opkg/opkg-0.9.0.release-notes

[0.9.0] - 2025-06-27

Semiannual opkg release.
Bumping the minor version as a result of the project build tooling changing from autotools to cmake.

- Added a Dockerfile container definition (`:docker/`) for a valid developer build environment for opkg.
  - It's recommended that project contributors use this container to build and test their changes.
- The AutoTools-based build framework has [been replaced](https://git.yoctoproject.org/opkg/commit/?id=3f6040e321634471ec442fb0e80f140f1437e90b) with a more modern, CMake framework.
  - Refer to the `docs/CONTRIBUTING.md` documentation for updated build instructions.

Signed-off-by: Etienne Cordonnier <ecordonnier@snap.com>
---
 .../opkg/opkg/0002-config.h.in-fix-typo.patch | 27 +++++++++++++++++++
 meta/recipes-devtools/opkg/opkg/run-ptest     |  2 +-
 .../opkg/{opkg_0.8.0.bb => opkg_0.9.0.bb}     | 22 ++++++++-------
 3 files changed, 41 insertions(+), 10 deletions(-)
 create mode 100644 meta/recipes-devtools/opkg/opkg/0002-config.h.in-fix-typo.patch
 rename meta/recipes-devtools/opkg/{opkg_0.8.0.bb => opkg_0.9.0.bb} (76%)

diff --git a/meta/recipes-devtools/opkg/opkg/0002-config.h.in-fix-typo.patch b/meta/recipes-devtools/opkg/opkg/0002-config.h.in-fix-typo.patch
new file mode 100644
index 00000000000..626bbd01b68
--- /dev/null
+++ b/meta/recipes-devtools/opkg/opkg/0002-config.h.in-fix-typo.patch
@@ -0,0 +1,27 @@
+From 5a81faadbc2397d554bc598d535fd2d44cbc8d10 Mon Sep 17 00:00:00 2001
+From: Etienne Cordonnier <ecordonnier@snap.com>
+Date: Mon, 20 Oct 2025 18:57:56 +0200
+Subject: [PATCH] config.h.in: fix typo
+
+Upstream-Status: Backport [https://git.yoctoproject.org/opkg/commit/?id=d723a90bfe6409c7ad983ed911225d4aefbfd09e]
+Signed-off-by: Etienne Cordonnier <ecordonnier@snap.com>
+---
+ config.h.in | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/config.h.in b/config.h.in
+index 4fa9842..877b8c7 100644
+--- a/config.h.in
++++ b/config.h.in
+@@ -2,7 +2,7 @@
+ #cmakedefine01 WITH_XZ
+ #cmakedefine01 WITH_BZIP2
+ #cmakedefine01 WITH_LZ4
+-#cmakedefine01 WITH_LZSTD
++#cmakedefine01 WITH_ZSTD
+ #cmakedefine01 WITH_CURL
+ #cmakedefine01 WITH_SSLCURL
+ #cmakedefine01 WITH_ACL
+-- 
+2.43.0
+
diff --git a/meta/recipes-devtools/opkg/opkg/run-ptest b/meta/recipes-devtools/opkg/opkg/run-ptest
index 5fb7077eec9..d485a4aace5 100644
--- a/meta/recipes-devtools/opkg/opkg/run-ptest
+++ b/meta/recipes-devtools/opkg/opkg/run-ptest
@@ -2,4 +2,4 @@
 
 OPKG_PATH=$(which opkg)
 
-make OPKG_PATH=$OPKG_PATH run-tests
+make -C tests DATADIR=/share SYSCONFDIR=/etc VARDIR=/var OPKG_PATH=$OPKG_PATH
diff --git a/meta/recipes-devtools/opkg/opkg_0.8.0.bb b/meta/recipes-devtools/opkg/opkg_0.9.0.bb
similarity index 76%
rename from meta/recipes-devtools/opkg/opkg_0.8.0.bb
rename to meta/recipes-devtools/opkg/opkg_0.9.0.bb
index 12e2edf7e3f..ed2f36d636b 100644
--- a/meta/recipes-devtools/opkg/opkg_0.8.0.bb
+++ b/meta/recipes-devtools/opkg/opkg_0.9.0.bb
@@ -15,34 +15,35 @@ PE = "1"
 SRC_URI = "http://downloads.yoctoproject.org/releases/${BPN}/${BPN}-${PV}.tar.gz \
            file://opkg.conf \
            file://0001-opkg_conf-create-opkg.lock-in-run-instead-of-var-run.patch \
+           file://0002-config.h.in-fix-typo.patch \
            file://run-ptest \
            "
 
-SRC_URI[sha256sum] = "582a4c9e220cce0b7d08a0915c95db9f24ae43ad372ed5d42d5ec5f6cd413f0c"
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
+PACKAGECONFIG[curl] = "-DWITH_CURL=ON,-DWITH_CURL=OFF,curl"
+PACKAGECONFIG[ssl-curl] = "-DWITH_SSLCURL=ON,-DWITH_SSLCURL=OFF,curl openssl"
+PACKAGECONFIG[sha256] = "-DWITH_SHA256=ON,-DWITH_SHA256=OFF"
+PACKAGECONFIG[libsolv] = "-DUSE_SOLVER_LIBSOLV=ON,-DUSE_SOLVER_LIBSOLV=OFF,libsolv"
 
-EXTRA_OECONF = "--enable-zstd"
-EXTRA_OECONF:append:class-native = " --localstatedir=/${@os.path.relpath('${localstatedir}', '${STAGING_DIR_NATIVE}')} --sysconfdir=/${@os.path.relpath('${sysconfdir}', '${STAGING_DIR_NATIVE}')}"
+EXTRA_OECMAKE = "-DWITH_ZSTD=ON"
+EXTRA_OECMAKE:append:class-native = " -DVARDIR=/${@os.path.relpath('${localstatedir}', '${STAGING_DIR_NATIVE}')} -DSYSCONFDIR=/${@os.path.relpath('${sysconfdir}', '${STAGING_DIR_NATIVE}')}"
 
 do_install:append () {
 	install -d ${D}${sysconfdir}/opkg
@@ -56,6 +57,9 @@ do_install:append () {
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


