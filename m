Received: from mail-io1-f44.google.com (mail-io1-f44.google.com [209.85.166.44])
 by mx.groups.io with SMTP id smtpd.web08.9881.1614349689114672191
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Feb 2021 06:28:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=Lo1P01Oy;
 spf=softfail (domain: sakoman.com, ip: 209.85.166.44, mailfrom: steve@sakoman.com)
Received: by mail-io1-f44.google.com with SMTP id s24so9790997iob.6
        for <openembedded-core@lists.openembedded.org>; Fri, 26 Feb 2021 06:28:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=151cXRWtWR+njmd/QcszUffkjZA2BcBKtk5AoYjud3E=;
        b=Lo1P01Oy+sJnOc5W8hr+HJyXyasjX/cDBynh2OKRDbPCTnsU9bLbBI9p65CYlhWcgU
         WOmcBoRxiGXMYZy/Afrx1lNWcwscJZ1DRnuyZ77wv3SbnVH9G4Z/1cRV7swIJMh5W/wx
         y0uK+2dAU5ph0DR9tTOwrLc0dSrgGQ/FyWAKsIYpEfR5TAn4NTHC/VJFdR9RnyuBjaNB
         tYDCN8o2ghLuDStT0YOa+2I9UFCxeVs6tscl/keTmNQrYZOJG0brBH6/zIRhZknK+AdZ
         Lpn7zxHlEG5ijArw3XSIo8Yyx5tkwegscOE7N+6XrZ29MEPZLJTfH6NKAsDox7Fz94Zs
         OS9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=151cXRWtWR+njmd/QcszUffkjZA2BcBKtk5AoYjud3E=;
        b=MdTd1tFzhSHJpgtiOKokaxyjjk5xiSEsrB6lUgvXlgzTskEznWHJsrhvxkp94svryK
         kPz2YUXgJytcsczHnOgP0z42ZDOhY3dcTVzVfQ85BSdZct1HSlycwnDtmVFs7S4D9Qyi
         K/GOT5nWfN7Q7vhY/tqWT36lX2uIdRjlnk9N2DJIno0zF9iSWbuRJqVp9CKBJr7kdCXA
         72zeh1NC49zqgHMqQam+HgOcrHtbdHmNR6xQ9A969MtTLKPyrF8/iTwDKG+bc5AAjMyv
         zDPVonzjkh80yGFU2hD+xR7OpkG0sdiPiSTlY+MZ+uxpnc/dqBub5kTXS+To4vYOvKir
         ajZQ==
X-Gm-Message-State: AOAM530i7zLyCru2DtKRhuQfJx5zrC+mf+GCsYjaZsom1tyVKt8v17as
	M3cR/4V2keVxkTljP45jLfB706vkVEk/4XH2
X-Google-Smtp-Source: ABdhPJzeiPAfNGxNtf594is3Ksr7mBRl5wKC2v2sz+bnioFrTU9t6apuhq/YjKFlFakWm14KIpFzVw==
X-Received: by 2002:a05:6638:96c:: with SMTP id o12mr3176803jaj.24.1614349688003;
        Fri, 26 Feb 2021 06:28:08 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from hexa.router0800d9.com ([72.173.249.164])
        by smtp.gmail.com with ESMTPSA id i3sm5383377ioq.13.2021.02.26.06.28.04
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Feb 2021 06:28:07 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 37/40] icu: backport fix for rare random genrb segmentation fault
Date: Fri, 26 Feb 2021 04:24:20 -1000
Message-Id: <e60747844bff13dcafed709f84eb43b41c93cee0.1614348990.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1614348990.git.steve@sakoman.com>
References: <cover.1614348990.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

From: Martin Jansa <Martin.Jansa@gmail.com>

* sometimes I've seen it also reporting "Bus error" instead of segmentation=
 fault

* upstream bug report:
  https://unicode-org.atlassian.net/browse/ICU-21175

* on 80 core machine it failed 11 times in 1000 rebuilds of icu in various =
files:
  icu.019.stderr.compile:make[1]: *** [out/build/icudt66l/windowsZones.res]=
 Segmentation fault
  icu.035.stderr.compile:make[1]: *** [out/build/icudt66l/supplementalData.=
res] Segmentation fault
  icu.095.stderr.compile:make[1]: *** [out/build/icudt66l/plurals.res] Segm=
entation fault
  icu.116.stderr.compile:make[1]: *** [out/build/icudt66l/curr/supplemental=
Data.res] Segmentation fault
  icu.313.stderr.compile:make[1]: *** [out/build/icudt66l/supplementalData.=
res] Segmentation fault
  icu.415.stderr.compile:make[1]: *** [out/build/icudt66l/supplementalData.=
res] Segmentation fault
  icu.476.stderr.compile:make[1]: *** [out/build/icudt66l/metadata.res] Seg=
mentation fault
  icu.495.stderr.compile:make[1]: *** [out/build/icudt66l/supplementalData.=
res] Segmentation fault
  icu.496.stderr.compile:make[1]: *** [out/build/icudt66l/supplementalData.=
res] Segmentation fault
  icu.505.stderr.compile:make[1]: *** [out/build/icudt66l/pluralRanges.res]=
 Segmentation fault
  icu.756.stderr.compile:make[1]: *** [out/build/icudt66l/numberingSystems.=
res] Segmentation fault

* apply 0001-Fix-big-endian-build.patch in do_patch like this new patch

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...cnvalias-as-a-dependency-of-misc_res.patch | 24 +++++++++++++++++++
 meta/recipes-support/icu/icu_66.1.bb          |  4 ++--
 2 files changed, 26 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-support/icu/icu/0002-ICU-21175-Add-cnvalia=
s-as-a-dependency-of-misc_res.patch

diff --git a/meta/recipes-support/icu/icu/0002-ICU-21175-Add-cnvalias-as-a-=
dependency-of-misc_res.patch b/meta/recipes-support/icu/icu/0002-ICU-21175-=
Add-cnvalias-as-a-dependency-of-misc_res.patch
new file mode 100644
index 0000000000..d7ddf33bce
--- /dev/null
+++ b/meta/recipes-support/icu/icu/0002-ICU-21175-Add-cnvalias-as-a-depende=
ncy-of-misc_res.patch
@@ -0,0 +1,24 @@
+From f2bc064e0d70ac068de4539d069bfab6cdccc48d Mon Sep 17 00:00:00 2001
+From: "Shane F. Carr" <shane@unicode.org>
+Date: Fri, 10 Jul 2020 14:28:22 -0500
+Subject: [PATCH] ICU-21175 Add cnvalias as a dependency of misc_res
+
+Upstream-Status: Backport [https://github.com/unicode-org/icu/commit/ee2d8=
b01034c3101de2bd58f9328daa076995e9e]
+Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
+---
+ data/BUILDRULES.py | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/data/BUILDRULES.py b/data/BUILDRULES.py
+index 2338afd1f7..63b6e09273 100644
+--- a/data/BUILDRULES.py
++++ b/data/BUILDRULES.py
+@@ -361,7 +361,7 @@ def generate_misc(config, io, common_vars):=0D
+         RepeatedExecutionRequest(=0D
+             name =3D "misc_res",=0D
+             category =3D "misc",=0D
+-            dep_targets =3D [],=0D
++            dep_targets =3D [DepTarget("cnvalias")], # ICU-21175=0D
+             input_files =3D input_files,=0D
+             output_files =3D output_files,=0D
+             tool =3D IcuTool("genrb"),=0D
diff --git a/meta/recipes-support/icu/icu_66.1.bb b/meta/recipes-support/ic=
u/icu_66.1.bb
index 08254648e4..6ba88595df 100644
--- a/meta/recipes-support/icu/icu_66.1.bb
+++ b/meta/recipes-support/icu/icu_66.1.bb
@@ -21,10 +21,11 @@ BASE_SRC_URI =3D "https://github.com/unicode-org/icu/re=
leases/download/release-${I
 DATA_SRC_URI =3D "https://github.com/unicode-org/icu/releases/download/rel=
ease-${ICU_FOLDER}/icu4c-${ICU_PV}-data.zip"
 SRC_URI =3D "${BASE_SRC_URI};name=3Dcode \
            ${DATA_SRC_URI};name=3Ddata \
+           file://0001-Fix-big-endian-build.patch;patchdir=3D${WORKDIR} \
+           file://0002-ICU-21175-Add-cnvalias-as-a-dependency-of-misc_res.=
patch;patchdir=3D${WORKDIR} \
            file://filter.json \
            file://icu-pkgdata-large-cmd.patch \
            file://fix-install-manx.patch \
-           file://0001-Fix-big-endian-build.patch;apply=3Dno \
            file://0001-icu-Added-armeb-support.patch \
            file://CVE-2020-10531.patch \
            "
@@ -47,7 +48,6 @@ do_make_icudata_class-target () {
     cd ${S}
     rm -rf data
     cp -a ${WORKDIR}/data .
-    patch -p1 < ${WORKDIR}/0001-Fix-big-endian-build.patch
     ${@bb.utils.contains('PACKAGECONFIG', 'make-icudata', '', 'exit 0', d)}
     AR=3D'${BUILD_AR}' \
     CC=3D'${BUILD_CC}' \
--=20
2.25.1

