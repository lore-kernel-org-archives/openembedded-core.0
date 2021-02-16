Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
 by mx.groups.io with SMTP id smtpd.web10.16667.1613516496451205510
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Feb 2021 15:01:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=tVyYESkU;
 spf=pass (domain: gmail.com, ip: 209.85.208.53, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f53.google.com with SMTP id y18so14166910edw.13
        for <openembedded-core@lists.openembedded.org>; Tue, 16 Feb 2021 15:01:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=OduX0T9lRJGNcaLhlH3onOKszRxRH6JlIJihTU0bMIs=;
        b=tVyYESkU+jXBaL4BIlG8AJCHQIFjL+r49yHLmcm0Vjfjc1hD53jzZFJmGWhoyHQXrR
         k2VSmBmOPrcE0mV1/VggsD5Fq4etOi30qJn7prBVvAat2bQUg+cpbHnHJxvToIGDbKb0
         tY5DKu8/VbRzgs0OHg9BCXHqvaSh3oGQMdxWTp4r/gzeRGoQfYyjDX65XAktVjGTfHOx
         4fTpKu+XlUrC8aWENwOeau/vaWqUJdiExkuS1FAInAL6uHchZ30nR1S1dmIqqJxR4sER
         5NUrHBPoM66TgGphZ1yXiaPLGWCzv3HfnZVgy3p7gyd234zZ4JelPUZV9WkcltrR8ob8
         EUpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=OduX0T9lRJGNcaLhlH3onOKszRxRH6JlIJihTU0bMIs=;
        b=LbTDzE3BAwLXthcDidAyl7gi3ZFFnIXeRIptOuVOrBYTJO2UQoakw9Eotc4/AFBmTD
         C6h1vWCGkmUWhVjnZNBgemzmU8nmdAbL5HdBZ1eOLQZlMxWIwL+X0Wj44SFsFcFl07gu
         CGFvMwPEjqnfkVMo4SYZQ7vdzhtRYASR3M7TlISFTOdRvjj41wWLwKQSk1Z2xuhkwMDZ
         eYW9QMVA+Px52rHl/JHLdGieueevxWizhkjzPoAVFsAIzGJfAIY4pxiX7iIGytz/ua/v
         qCNQ9Eyd2WNO97yvCRY6DjnH2LyUGGNt1K6ZgVIo1JY4FJ/NXMRrN2X9GHvAMlJADLzC
         zrHA==
X-Gm-Message-State: AOAM532vjwdGBli5FjJ8OIHG0l4vxlgSn1YJC5xGWqQlxfAwa0ncG4MS
	0389BoYp9ArGKU7UdEBy+Q60lTF870OV7A==
X-Google-Smtp-Source: ABdhPJwYLdeOZaRFpgRfh22viY0sXmxR4K/Jo9rtOjNQg+fCvbMcVGbB/toQgumk6UN7oT43uZxYgA==
X-Received: by 2002:aa7:c259:: with SMTP id y25mr17514481edo.306.1613516494886;
        Tue, 16 Feb 2021 15:01:34 -0800 (PST)
Return-Path: <martin.jansa@gmail.com>
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id h24sm132119edt.25.2021.02.16.15.01.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Feb 2021 15:01:34 -0800 (PST)
From: "Martin Jansa" <Martin.Jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [dunfell][PATCH] icu: backport fix for rare random genrb segmentation fault
Date: Wed, 17 Feb 2021 00:01:30 +0100
Message-Id: <20210216230130.1516657-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

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
2.27.0

