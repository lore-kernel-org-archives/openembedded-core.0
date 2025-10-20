Return-Path: <ecordonnier@snap.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA2F3CCD199
	for <webhook@archiver.kernel.org>; Mon, 20 Oct 2025 17:10:44 +0000 (UTC)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
 by mx.groups.io with SMTP id smtpd.web11.2841.1760980235231031325
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Oct 2025 10:10:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@snap.com header.s=google header.b=MGbQTNGr;
 spf=pass (domain: snapchat.com, ip: 209.85.218.45, mailfrom: ecordonnier@snapchat.com)
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-b463f986f80so901639466b.2
        for <openembedded-core@lists.openembedded.org>; Mon, 20 Oct 2025 10:10:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=snap.com; s=google; t=1760980233; x=1761585033; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=elBuc8dqGKROd2C0A61Ae8UYvjA5le2q1A8jjlUW4ak=;
        b=MGbQTNGrMq3XViusVDEDpd40RhdBSWqELbdpcwRfJTfSp2yIWDvaAcQAf4VH4HMlrl
         lndgb0NBa/YHDuDXI8IDW6CV3Js7FhbmdyIK2M4L1pWzASWScobUNWZeIEkmEl1vwCmu
         +rsXY+XktiD8x/garB4CQBKz8ONMCvsevbLvs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760980233; x=1761585033;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=elBuc8dqGKROd2C0A61Ae8UYvjA5le2q1A8jjlUW4ak=;
        b=hF9w+EbdIPTDrCY9DzGpMKR8yMIjqq+vjvB4FT8pkYqggbPpli2ea+7ZjoT+2pda+s
         XskDTu4vO8tuMsbyS7YQEkuVOOlQR5F8Uh96dByi6uStqKDzTWa/du3ppA9lgjcoCrW1
         QbTkR4rNY/H9qDUIXDt/Mtqa/yWoDo19DJI66CTlLBRGMo5qqTGkVM7zEn43YYw8jjno
         ke7G9//Jq11Jjfxan/5EL/BdNHCRcBhwsLmyy+2raWlQwSDU1BJAF6nfiYjlZCq0AmV0
         6Jw5hUeWjsteSC8eDPzmK4kv5py7XBNCbGRqw5y9pcyGhRjPnv0PRL9W2zavX6Jxn9vf
         P4dw==
X-Gm-Message-State: AOJu0YyMqivgVMF8Obd3MsfI3yI32hPFRX5uO6Md7PmBMlBeZ22jmAZ0
	4jk0LYwi2nj0JONu/ZARIiODiEWPgWYKFpGM4f+zygY60/HVES51EOS9J+0yzMRqU0SxEMuuSmt
	lhl0Z7KA=
X-Gm-Gg: ASbGncu1ry8rBzz6Xgt2BDLFfaF1aYHCdeUfK1raazg16QH8wezcs/Zzh1vAh0c5XB7
	SI0ljuxKlxsw6FC/k4v3TtZDqqFu5slWa0fBY8GgQ3MiEDi46oAejqdG5VD+aw92TG7so8KnhrH
	iXPFIQqRhbgEzxx/Lh+DbtgHAvxFhMZYJv1mXvXprBD9sNukQsG3h7HeueBzDwtcy/bokU73wF/
	Bk8zADK0LJkVj+wZ4zuCMjmPyBa04z4PfeXzQz1k05eKmRHcVBfs0f98KqTHlyOfM+ePqo9zNzJ
	PPXIVaXJqF9yHBV1VDiBMsAXnThujyAR2HGL7TIp3rOFWUAi3+WuvszEniHfeOUyY1FbVm2zWj4
	XZQU9uZBPeDC30Cy1sLV9DtD66X/hjcNJAt/6wtA7zysppcPbH5uZ2++qsALjoOo9pAzenv2ocI
	GP7X1CrGNCcnA2zyNleDY3p7kTnnkG4TnuKO5nCCiFd6Ahqf9N8Ram0rk=
X-Google-Smtp-Source: AGHT+IEvcEAEriDhOIuG9lAE7R42IZEl40MyTjTz5e9osvgWd5J84j1vQ5Fbg5825xJVlL/mOFF+oA==
X-Received: by 2002:a17:907:3f8d:b0:b04:32ff:5d3a with SMTP id a640c23a62f3a-b646fc8ab8bmr1557728566b.0.1760980233155;
        Mon, 20 Oct 2025 10:10:33 -0700 (PDT)
Received: from lj8k2dq3.sc-core.net ([213.249.125.50])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b6aaf93a32asm387935866b.51.2025.10.20.10.10.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Oct 2025 10:10:32 -0700 (PDT)
From: ecordonnier@snap.com
To: openembedded-core@lists.openembedded.org
Cc: Etienne Cordonnier <ecordonnier@snap.com>
Subject: [OE-core][PATCH v3 2/2] opkg: upgrade 0.8.0 -> 0.9.0
Date: Mon, 20 Oct 2025 19:10:26 +0200
Message-ID: <20251020171026.2965650-2-ecordonnier@snap.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251020171026.2965650-1-ecordonnier@snap.com>
References: <20251020171026.2965650-1-ecordonnier@snap.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Oct 2025 17:10:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225129

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
index 00000000000..2dd01e67599
--- /dev/null
+++ b/meta/recipes-devtools/opkg/opkg/0002-config.h.in-fix-typo.patch
@@ -0,0 +1,27 @@
+From 5a81faadbc2397d554bc598d535fd2d44cbc8d10 Mon Sep 17 00:00:00 2001
+From: Etienne Cordonnier <ecordonnier@snap.com>
+Date: Mon, 20 Oct 2025 18:57:56 +0200
+Subject: [PATCH] config.h.in: fix typo
+
+Upstream-Status: Pending
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


