Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 771BFC35274
	for <webhook@archiver.kernel.org>; Mon, 18 Dec 2023 15:37:16 +0000 (UTC)
Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com [209.85.167.181])
 by mx.groups.io with SMTP id smtpd.web10.46406.1702913832835356239
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Dec 2023 07:37:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=bhZSxMy3;
 spf=pass (domain: gmail.com, ip: 209.85.167.181, mailfrom: jpewhacker@gmail.com)
Received: by mail-oi1-f181.google.com with SMTP id 5614622812f47-3ba4850f65dso1720854b6e.2
        for <openembedded-core@lists.openembedded.org>; Mon, 18 Dec 2023 07:37:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702913831; x=1703518631; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YbDp4vphYvXSB+wopW09jBQ60Dmg0RN7EOxtO5ZxzWU=;
        b=bhZSxMy3nsxfKiDEaVRhb9vVKQ/rrIAPxvs5yttNrlwi9zv4mtTULflMo5UG8sNvem
         4Cq/GZdQLzByb8ZPqPwFzv72y7AMLo6BjH0ukQfHEJwGSGKPooynPPJA3REt49nIx4qd
         eE/aAx5sOB9Ve2cFOkbG+SpTEmQKoQ2xGbAbuqJF3x3Zm9CSAC80EaowUy2x0GJOwHUQ
         Ici1Ull5o/GB02yDo/yC79/mPZPrJsIGBbN4mEKNj2ARX/+BmybiZ+3pyciXE0+qftc3
         OAo523Y8xr9Y2hX9SgEUk/QQMjqlPp8qU+abuIrsD/WG2rmFsG4AQ+K0XxzXWDJeI+yJ
         PWlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702913831; x=1703518631;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YbDp4vphYvXSB+wopW09jBQ60Dmg0RN7EOxtO5ZxzWU=;
        b=Xp9D1thXHgItIdHSHQjTdK/UgrnYcTxkZC53wdM4+BUUKiMPe++jbEhzbV0WuSaXWo
         KdpAJvs53sz14SR3FX5Nnc8R3OZOUFmxzAfuQDBYlkU0t3P8aEuTDIQMNXAu8X9spfVD
         dY8q0csuS1uhBhjXGb3C48hHtWp19A2k29eFkWC2yXKLIEiv1ZYwUSsJGl0izeXkcHn1
         UdI1OlTkypqmDViWk9vnrDMSL0CPr3WoEG4VsnEUZoF/lOJlhI0mNlb8p8ynS8YcQm63
         JrVBmdAASBjTiWPYMHiiQRMI/tMG6Dkm+3eR/sLo9vuiAm4gABYUPcc9dH1g6oeK6vXi
         LOVw==
X-Gm-Message-State: AOJu0YxaGGWZ/vEEjQVMGf0QFLlDrn3CoILaWHw9nmbyx4kjgw9CpAju
	FN5gO4VYj70QSSak8HWcmoV1DkIytys=
X-Google-Smtp-Source: AGHT+IHBqHHYnDhprMNyI3JMJKqXVacntCROzD3qTY8kqOv0JKgJl9byj1FTkFjSCt5KkcNcrVMu1Q==
X-Received: by 2002:a05:6808:1924:b0:3b9:e73b:6b with SMTP id bf36-20020a056808192400b003b9e73b006bmr21548659oib.58.1702913831003;
        Mon, 18 Dec 2023 07:37:11 -0800 (PST)
Received: from localhost.localdomain ([2601:282:4300:19e0::35cb])
        by smtp.gmail.com with ESMTPSA id q11-20020a056808200b00b003b85dd815bbsm4850852oiw.53.2023.12.18.07.37.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Dec 2023 07:37:10 -0800 (PST)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH v2] ipk: Switch to using zstd compression
Date: Mon, 18 Dec 2023 08:37:00 -0700
Message-Id: <20231218153700.3897302-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231215205140.2948964-1-JPEWhacker@gmail.com>
References: <20231215205140.2948964-1-JPEWhacker@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Dec 2023 15:37:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192657

Converts IPK package generation to use zstd instead of xz. zstd has a
much larger compression/speed tradeoff range allowing users to choose
what suits them best, and fast decompression speeds. It also continues
to support parallel compression as xz did.

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
index 83b12cbc158..b3f1f18a0d7 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -878,6 +878,10 @@ XZ_DEFAULTS[vardepsexclude] += "XZ_MEMLIMIT XZ_THREADS"
 ZSTD_THREADS ?= "${@oe.utils.cpu_count(at_least=2)}"
 ZSTD_THREADS[vardepvalue] = "1"
 
+ZSTD_COMPRESSION_LEVEL ?= "-3"
+ZSTD_DEFAULTS ?= "--threads=${ZSTD_THREADS} ${ZSTD_COMPRESSION_LEVEL}"
+ZSTD_DEFAULTS[vardepsexclude] = "ZSTD_THREADS"
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


