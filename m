Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D183BC3DA6E
	for <webhook@archiver.kernel.org>; Wed, 20 Dec 2023 21:31:33 +0000 (UTC)
Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
 by mx.groups.io with SMTP id smtpd.web10.33203.1703107892170608218
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Dec 2023 13:31:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=PbExgQ3r;
 spf=pass (domain: gmail.com, ip: 209.85.210.45, mailfrom: jpewhacker@gmail.com)
Received: by mail-ot1-f45.google.com with SMTP id 46e09a7af769-6da2db096bcso520983a34.0
        for <openembedded-core@lists.openembedded.org>; Wed, 20 Dec 2023 13:31:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703107891; x=1703712691; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t47JGoNpI0NrL3oHgypA526QUsw5GjWVLvzAJE6e92w=;
        b=PbExgQ3rIjZfOgNxXP8oY7rpU7nKgCHUGSQyZnFNuayTnEVzpmRXodVXdA2t5JY3wd
         swFWq44c5iWBKBr2y++3AnefyAs1DXQxXEOy5s/joBYWphDA8gr02EoebeDIaX43PmEE
         jpYIKskqMeH4RHrufKoIMG8cSC8ftmpGnj374baFWPdg8vUgaWn566glz0/QnINFacEz
         c5RSqcktq7Y3Dtv8r3VCNlh8sEzT5SrbEi7/OzFkf1leoxZDphlgU+fX442LLF65gOSc
         gVmqeXlvTUWUHgCaAedJ6Ur21ZypRiqEKJTfYgBxacpPc2lzY1M1Ex7vqs2QRtTDXzQq
         EYsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703107891; x=1703712691;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=t47JGoNpI0NrL3oHgypA526QUsw5GjWVLvzAJE6e92w=;
        b=R3OOvhF1FGC1Fx0vSwTqWxHfxZzQrcCxaNdVv8fPJfLx7OlH1jfzvSFq5cXDUK8wOO
         +6cbBqZxiUOq3z9MeLh/J/ARaPtq1Xby3r9T4vha1Ewvf4BVmdU+lLPMS6jR/tVNBZFD
         v4O08iQAcxmj+cRMDd5nM2g+gzEG8s6vBhNXek7zTjLGeEvgjTwqp1pmqdpKS8KDWHmx
         qrp91uQ7U5UoaDlWbpXnUpJyJKqcS6UG/8VsbKoDwR5dvclfBcRQca9JQfyzHx98l4/u
         3akAl+GxtzZWJJw1krrAUYUQQ7dp0+FQJfeTrI/3iu8C6b0MEIPfnJgDdtm97M7fFtx3
         ZXpA==
X-Gm-Message-State: AOJu0YzZpa8BYlva+dmjKocmmlq818fBA0D0SSzKJC0ssw4TI6rO8xXM
	xGaC0UCBhgAtyDBWoxTgz6hJnPTjfD8=
X-Google-Smtp-Source: AGHT+IFRyv/fRHgywIsBnzP4yaUMYl/k7aUkapfISb4cDDtuPhHK+vQOEo6VjbenVuh6eoAC2qgzBg==
X-Received: by 2002:a9d:6b03:0:b0:6d9:9e18:1eb6 with SMTP id g3-20020a9d6b03000000b006d99e181eb6mr1568463otp.10.1703107890757;
        Wed, 20 Dec 2023 13:31:30 -0800 (PST)
Received: from localhost.localdomain ([2601:282:4300:19e0::d6e0])
        by smtp.gmail.com with ESMTPSA id q3-20020a9d4b03000000b006dba40457casm103219otf.6.2023.12.20.13.31.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Dec 2023 13:31:30 -0800 (PST)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH v3] ipk: Switch to using zstd compression
Date: Wed, 20 Dec 2023 14:31:19 -0700
Message-Id: <20231220213119.964517-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231215205140.2948964-1-JPEWhacker@gmail.com>
References: <20231215205140.2948964-1-JPEWhacker@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 Dec 2023 21:31:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192811

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
 meta/classes-global/package_ipk.bbclass     | 4 ++--
 meta/classes-recipe/image_types.bbclass     | 4 +---
 meta/conf/bitbake.conf                      | 4 ++++
 meta/lib/oe/package_manager/ipk/__init__.py | 4 ++--
 meta/recipes-devtools/opkg/opkg_0.6.2.bb    | 6 +++---
 5 files changed, 12 insertions(+), 10 deletions(-)

diff --git a/meta/classes-global/package_ipk.bbclass b/meta/classes-global/package_ipk.bbclass
index 71ffdd522ac..209568ae5f1 100644
--- a/meta/classes-global/package_ipk.bbclass
+++ b/meta/classes-global/package_ipk.bbclass
@@ -15,7 +15,7 @@ IPKGCONF_SDK_TARGET = "${WORKDIR}/opkg-sdk-target.conf"
 PKGWRITEDIRIPK = "${WORKDIR}/deploy-ipks"
 
 # Program to be used to build opkg packages
-OPKGBUILDCMD ??= 'opkg-build -Z xz -a "${XZ_DEFAULTS}"'
+OPKGBUILDCMD ??= 'opkg-build -Z zstd -a "${ZSTD_DEFAULTS}"'
 
 OPKG_ARGS += "--force_postinstall --prefer-arch-to-version"
 OPKG_ARGS += "${@['', '--no-install-recommends'][d.getVar("NO_RECOMMENDATIONS") == "1"]}"
@@ -277,7 +277,7 @@ addtask do_package_write_ipk_setscene
 
 python () {
     if d.getVar('PACKAGES') != '':
-        deps = ' opkg-utils-native:do_populate_sysroot virtual/fakeroot-native:do_populate_sysroot xz-native:do_populate_sysroot'
+        deps = ' opkg-utils-native:do_populate_sysroot virtual/fakeroot-native:do_populate_sysroot zstd-native:do_populate_sysroot'
         d.appendVarFlag('do_package_write_ipk', 'depends', deps)
         d.setVarFlag('do_package_write_ipk', 'fakeroot', "1")
 
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


