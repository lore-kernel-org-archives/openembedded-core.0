Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFCCCC4167B
	for <webhook@archiver.kernel.org>; Fri, 15 Dec 2023 20:51:56 +0000 (UTC)
Received: from mail-oa1-f53.google.com (mail-oa1-f53.google.com [209.85.160.53])
 by mx.groups.io with SMTP id smtpd.web11.77250.1702673509556686444
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Dec 2023 12:51:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=HNx6ZEV+;
 spf=pass (domain: gmail.com, ip: 209.85.160.53, mailfrom: jpewhacker@gmail.com)
Received: by mail-oa1-f53.google.com with SMTP id 586e51a60fabf-1fab887fab8so750288fac.0
        for <openembedded-core@lists.openembedded.org>; Fri, 15 Dec 2023 12:51:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702673508; x=1703278308; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sQ3qJG1RRgG4T9ZVpIE8dQ2QsKRv6SoL1dkV2E6mB/0=;
        b=HNx6ZEV+4KXHaDeWGt5AMGoTDySNAD/VEa23Yco1TKGeZDxak4X6b1xmOAkXhNG0Nm
         w/hOl/oX9GGbybhKyXREnjziQ+apxZI2FJeQt0l9Cv/2AVlk3e68BbNXUvqXiS5V6WlP
         pa4Gbj0lhK9eGkKMumIepiAzY7EKQH5AmnQicLhfZJShyE3Mlh60C3kgbHTgK4mHQVtY
         7HZF8ott7K61+34rVcQCPxtSu6gFgwq/r0HY36reAJ2K8msFTVLfr2DB9FQDn2I4hirH
         o+t5YzeO/waYKNs1xY5oTnLdhLqYYk8tclU9AyyCX1JtxGcBQlE9AOYK1R+/Ot8/af+R
         HoUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702673508; x=1703278308;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sQ3qJG1RRgG4T9ZVpIE8dQ2QsKRv6SoL1dkV2E6mB/0=;
        b=stMug3MfD2E+tdmq5C7o2IUp95Fjl7wlOo02A3LLyi9Pdmk1N9SBvkf7f3zzLcJOR7
         CmSYzwY7pNAAJUDcxqZ9x5ZDU9fSU4gVq87MMLQfx5YP5bmbyrMhFwDhHHT2fgFz0dCV
         7TM5ugA2ELT6WoQLc4tlRv/xeDXvCB8pdY5cfKGucsPo86BIN71pW1ZxFbXphEilgV5j
         aIbRa5sZ9Qv1A+QdnbGe4VaeRxIso8dQdmWfw2UOOYIKbA9XstTGIETeAuYmEcIwScKU
         tjNLUK9T0TpE9coucdvYqY3zleHePfLqGFB8Xpjvs+sPA9jQC1jVOPSDZ9mQyaRw1UKh
         0ZUA==
X-Gm-Message-State: AOJu0Yw3+gVA1RKLk7tnalFd33pDpIeisds0xVJlk1tqjDSJrFbA1wTs
	x/IYNXu7GeWJ0XE/q3fAfDOh1hYdZyo=
X-Google-Smtp-Source: AGHT+IF4d4t0S/BwcHl/YbVoLAGqZ0mQfqmD59oqxb7IFIZFLH4zt7HT+7jM9kpzkX0OwHoC8ijpRA==
X-Received: by 2002:a05:6870:b027:b0:1fb:75c:3fee with SMTP id y39-20020a056870b02700b001fb075c3feemr14929607oae.78.1702673507722;
        Fri, 15 Dec 2023 12:51:47 -0800 (PST)
Received: from localhost.localdomain ([2601:282:4300:19e0::35cb])
        by smtp.gmail.com with ESMTPSA id gz4-20020a056870280400b002033d97a51bsm1267701oab.57.2023.12.15.12.51.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Dec 2023 12:51:47 -0800 (PST)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: ross.burton@arm.com,
	raj.khem@gmail.com,
	Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH] ipk: Switch to using zstd compression
Date: Fri, 15 Dec 2023 13:51:40 -0700
Message-Id: <20231215205140.2948964-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 Dec 2023 20:51:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192546

Converts IPK package generation to use zstd instead of xz. zstd has a
much larger compression/speed tradeoff range allowing users to choose
what suits them best. In addition, it support parallel compression for
additional compression speed up.

A new variable called ZSTD_DEFAULTS is provided to set the defaults for
places that want to use zstd for compression; the zst image conversion
command is also modified to use this.

Finally, in order for this to function properly, opkg must include zstd
support, so it is enabled all the time with no PACKAGECONFIG to turn it
off.

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/classes-global/package_ipk.bbclass     | 2 +-
 meta/classes-recipe/image_types.bbclass     | 4 +---
 meta/conf/bitbake.conf                      | 4 ++++
 meta/lib/oe/package_manager/ipk/__init__.py | 4 ++--
 meta/recipes-devtools/opkg/opkg_0.6.2.bb    | 6 +++---
 5 files changed, 11 insertions(+), 9 deletions(-)

diff --git a/meta/classes-global/package_ipk.bbclass b/meta/classes-global/package_ipk.bbclass
index 71ffdd522ac..025dba49313 100644
--- a/meta/classes-global/package_ipk.bbclass
+++ b/meta/classes-global/package_ipk.bbclass
@@ -15,7 +15,7 @@ IPKGCONF_SDK_TARGET = "${WORKDIR}/opkg-sdk-target.conf"
 PKGWRITEDIRIPK = "${WORKDIR}/deploy-ipks"
 
 # Program to be used to build opkg packages
-OPKGBUILDCMD ??= 'opkg-build -Z xz -a "${XZ_DEFAULTS}"'
+OPKGBUILDCMD ??= 'opkg-build -Z zstd -a "${ZSTD_DEFAULTS}"'
 
 OPKG_ARGS += "--force_postinstall --prefer-arch-to-version"
 OPKG_ARGS += "${@['', '--no-install-recommends'][d.getVar("NO_RECOMMENDATIONS") == "1"]}"
diff --git a/meta/classes-recipe/image_types.bbclass b/meta/classes-recipe/image_types.bbclass
index d615b41ed1e..3733bdfc20c 100644
--- a/meta/classes-recipe/image_types.bbclass
+++ b/meta/classes-recipe/image_types.bbclass
@@ -63,8 +63,6 @@ ZIP_COMPRESSION_LEVEL ?= "-9"
 7ZIP_COMPRESSION_METHOD ?= "BZip2"
 7ZIP_EXTENSION ?= "7z"
 
-ZSTD_COMPRESSION_LEVEL ?= "-3"
-
 JFFS2_SUM_EXTRA_ARGS ?= ""
 IMAGE_CMD:jffs2 = "mkfs.jffs2 --root=${IMAGE_ROOTFS} --faketime --output=${IMGDEPLOYDIR}/${IMAGE_NAME}.jffs2 ${EXTRA_IMAGECMD}"
 
@@ -337,7 +335,7 @@ CONVERSION_CMD:lz4 = "lz4 -9 -z -l ${IMAGE_NAME}.${type} ${IMAGE_NAME}.${type}.l
 CONVERSION_CMD:lzo = "lzop -9 ${IMAGE_NAME}.${type}"
 CONVERSION_CMD:zip = "zip ${ZIP_COMPRESSION_LEVEL} ${IMAGE_NAME}.${type}.zip ${IMAGE_NAME}.${type}"
 CONVERSION_CMD:7zip = "7za a -mx=${7ZIP_COMPRESSION_LEVEL} -mm=${7ZIP_COMPRESSION_METHOD} ${IMAGE_NAME}.${type}.${7ZIP_EXTENSION} ${IMAGE_NAME}.${type}"
-CONVERSION_CMD:zst = "zstd -f -k -T0 -c ${ZSTD_COMPRESSION_LEVEL} ${IMAGE_NAME}.${type} > ${IMAGE_NAME}.${type}.zst"
+CONVERSION_CMD:zst = "zstd -f -k -c ${ZSTD_DEFAULTS} ${IMAGE_NAME}.${type} > ${IMAGE_NAME}.${type}.zst"
 CONVERSION_CMD:sum = "sumtool -i ${IMAGE_NAME}.${type} -o ${IMAGE_NAME}.${type}.sum ${JFFS2_SUM_EXTRA_ARGS}"
 CONVERSION_CMD:md5sum = "md5sum ${IMAGE_NAME}.${type} > ${IMAGE_NAME}.${type}.md5sum"
 CONVERSION_CMD:sha1sum = "sha1sum ${IMAGE_NAME}.${type} > ${IMAGE_NAME}.${type}.sha1sum"
diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 55166d01784..4b1fe28c85a 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -878,6 +878,10 @@ XZ_DEFAULTS[vardepsexclude] += "XZ_MEMLIMIT XZ_THREADS"
 ZSTD_THREADS ?= "${@oe.utils.cpu_count(at_least=2)}"
 ZSTD_THREADS[vardepvalue] = "1"
 
+ZSTD_COMPRESSION_LEVEL ?= "-3"
+ZSTD_DEFAULTS ?= "--threads=${ZSTD_THREADS} ${ZSTD_COMPRESSION_LEVEL}"
+ZSTD_DEFAULTS[vardepsexclude] = "ZSTD_COMPRESSION_LEVEL ZSTD_THREADS"
+
 # Limit the number of threads that OpenMP libraries will use. Otherwise they
 # may fallback to using all CPUs
 export OMP_NUM_THREADS = "${BB_NUMBER_THREADS}"
diff --git a/meta/lib/oe/package_manager/ipk/__init__.py b/meta/lib/oe/package_manager/ipk/__init__.py
index e6f9c08e2b6..8fcbad56aab 100644
--- a/meta/lib/oe/package_manager/ipk/__init__.py
+++ b/meta/lib/oe/package_manager/ipk/__init__.py
@@ -133,7 +133,7 @@ class OpkgDpkgPM(PackageManager):
         tmp_dir = tempfile.mkdtemp()
         current_dir = os.getcwd()
         os.chdir(tmp_dir)
-        data_tar = 'data.tar.xz'
+        data_tar = 'data.tar.zst'
 
         try:
             cmd = [ar_cmd, 'x', pkg_path]
@@ -505,6 +505,6 @@ class OpkgPM(OpkgDpkgPM):
                      "trying to extract the package."  % pkg)
 
         tmp_dir = super(OpkgPM, self).extract(pkg, pkg_info)
-        bb.utils.remove(os.path.join(tmp_dir, "data.tar.xz"))
+        bb.utils.remove(os.path.join(tmp_dir, "data.tar.zst"))
 
         return tmp_dir
diff --git a/meta/recipes-devtools/opkg/opkg_0.6.2.bb b/meta/recipes-devtools/opkg/opkg_0.6.2.bb
index b2e675ae48b..71c0b44aed0 100644
--- a/meta/recipes-devtools/opkg/opkg_0.6.2.bb
+++ b/meta/recipes-devtools/opkg/opkg_0.6.2.bb
@@ -8,7 +8,7 @@ LICENSE = "GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
                     file://src/opkg.c;beginline=4;endline=18;md5=d6200b0f2b41dee278aa5fad333eecae"
 
-DEPENDS = "libarchive"
+DEPENDS = "libarchive zstd"
 
 PE = "1"
 
@@ -40,10 +40,10 @@ PACKAGECONFIG[gpg] = "--enable-gpg,--disable-gpg,\
 PACKAGECONFIG[curl] = "--enable-curl,--disable-curl,curl"
 PACKAGECONFIG[ssl-curl] = "--enable-ssl-curl,--disable-ssl-curl,curl openssl"
 PACKAGECONFIG[sha256] = "--enable-sha256,--disable-sha256"
-PACKAGECONFIG[zstd] = "--enable-zstd,--disable-zstd,zstd"
 PACKAGECONFIG[libsolv] = "--with-libsolv,--without-libsolv,libsolv"
 
-EXTRA_OECONF:class-native = "--localstatedir=/${@os.path.relpath('${localstatedir}', '${STAGING_DIR_NATIVE}')} --sysconfdir=/${@os.path.relpath('${sysconfdir}', '${STAGING_DIR_NATIVE}')}"
+EXTRA_OECONF = "--enable-zstd"
+EXTRA_OECONF:append:class-native = " --localstatedir=/${@os.path.relpath('${localstatedir}', '${STAGING_DIR_NATIVE}')} --sysconfdir=/${@os.path.relpath('${sysconfdir}', '${STAGING_DIR_NATIVE}')}"
 
 do_install:append () {
 	install -d ${D}${sysconfdir}/opkg
-- 
2.34.1


