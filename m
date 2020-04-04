Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com [209.85.214.195])
 by mx.groups.io with SMTP id smtpd.web10.7891.1586039490689589687
 for <openembedded-core@lists.openembedded.org>;
 Sat, 04 Apr 2020 15:31:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=SmYvBGXf;
 spf=pass (domain: gmail.com, ip: 209.85.214.195, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f195.google.com with SMTP id c12so4339172plz.2
        for <openembedded-core@lists.openembedded.org>; Sat, 04 Apr 2020 15:31:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ip5ga8SccJ9YIb1caSrbDvqEAOS18Gph29tYOyfRNAQ=;
        b=SmYvBGXfb6eZva+JlECLMR49Jyw0nR6+dsuZSRWDpWifqJl9xo0Y5hji2H/lM9zGtu
         CNwA3w1QY/sUiLmHM68NuuSl58XFrQ4FIlciciI5F77uYUDbXdWT5uHK/AfCmOyQ2hHo
         SlXI5S07G3ve7Z14iMz9b4nsfky5sZDUsxBC5NkxUsb2onBhC5JEgmbD/u5NPnUVJBY4
         Wa6ljhLlqicTO7OkRXzohVq1n4gsCzBMRlbILe8prSBt4wIzrWkiT60OFnPF4GjWOwrM
         ZMdMYxugjHEfMwUgkC95K97dzp4vid9w6dt3xwAND5/+7jQ0lP36kBzP2vOK2w1Ccut0
         T2/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ip5ga8SccJ9YIb1caSrbDvqEAOS18Gph29tYOyfRNAQ=;
        b=holRsysJZTfAN9c8WM+X75Zm3phPad5xielZct+0OR1gTagWw9e/lnNL+iLKMVubyO
         v4cgi2fiJVCx28/xYY4sEEWEmLLcmVtHv0Ak2HXylkyVglg64r1USPYQ4Jp5KjHC3gmd
         IYnY+Fi5YDEbtwUfnv1T73HtDkK1zpZBaqRqMOI8rmlWMRq07froGsdC4ShEj2YlF9bR
         HvfMj1iFqRnD4akDKyQRCNxi8BuG43h2xPMb8h+L/QtLZnjVj9AVV4fs0TMQI4DQcXwx
         REdq9uJvNJdUX2NXq0LHSzxPmU07ASjaey/OJcJ1d9D65RtiYU7S2NzJ39Pp2EpLsEXo
         QQBQ==
X-Gm-Message-State: AGi0Puas1ioN1kVZwst0zS9vf7cIIMaEjBaSVAvnF5u3tElh11DG7x//
	amweJsOnwJgpPnhaM7XG5ge6YWwjiHo=
X-Google-Smtp-Source: APiQypIeob0EDLM9O/Hwy5js7c4XjDFW7snvyH+E6oWXA+fgZYSSjWXZDkD+WN+h4aH8Xzb9eIaiTw==
X-Received: by 2002:a17:90a:198b:: with SMTP id 11mr18659810pji.23.1586039489495;
        Sat, 04 Apr 2020 15:31:29 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::3e84])
        by smtp.gmail.com with ESMTPSA id i34sm7659683pgm.83.2020.04.04.15.31.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Apr 2020 15:31:28 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Wouter Meek <w.meek@metrological.com>
Subject: [PATCH V6] icu: Add knobs to generate a subset of ICU data
Date: Sat,  4 Apr 2020 15:31:43 -0700
Message-Id: <20200404223143.277864-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.26.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Recent versions of ICU (64+) provides a tool for configuring ICU
locale data file with finer granularity [1]

Default generated size for libicudata.so.66.1 is ~27M, which is quite
large for embedded systems and all of them may not even need all locale
data.

This patch calls the icudata buildtool during configure on the icudata
and utilizes a filter called 'filter.json` ( empty by default) to
create the data, default behavior should remain same but someone can
add a filter.json in own layer to configure this data, e.g.

{
  "localeFilter": {
    "filterType": "language",
    "whitelist": [
      "en",
      "de",
      "it"
    ]
  }
}

would only generate the locale data for english/german/italian

This would reduce the size of libicudata.so.66.1 to 12M

Ensure that icudata is generated using host-tools so it can deal with
endianness correctly, when host and target systems have different
endianness

install the icudtata file back into in/ folder so that main build
can now pickup this data file instead of regenerating it and wiping
out the filter changes that are expected to take effect

Use native compiler tools

Update the big-endian support patch to apply to latest Makefile.in
from icudata source and mark it as backport

[1] https://github.com/unicode-org/icu/blob/master/docs/userguide/icu_data/=
buildtool.md

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Suggested-by: Wouter Meek <w.meek@metrological.com>
---
v2: Fix build for BE systems
v3: Unset AR and RANLIB too
v4: Install fresh icudata back into data/in folder
v5: Use BUILD_CC and ilk instead of compiler on build host directly
v6: Unpackage data tarball directly into its final location, so it can
    be patched

 .../icu/icu/0001-Fix-big-endian-build.patch   | 26 +++++++--------
 meta/recipes-support/icu/icu/filter.json      |  2 ++
 meta/recipes-support/icu/icu_66.1.bb          | 32 +++++++++++++++++--
 3 files changed, 44 insertions(+), 16 deletions(-)
 create mode 100644 meta/recipes-support/icu/icu/filter.json

diff --git a/meta/recipes-support/icu/icu/0001-Fix-big-endian-build.patch b=
/meta/recipes-support/icu/icu/0001-Fix-big-endian-build.patch
index efb27ae4e3..91d68848c7 100644
--- a/meta/recipes-support/icu/icu/0001-Fix-big-endian-build.patch
+++ b/meta/recipes-support/icu/icu/0001-Fix-big-endian-build.patch
@@ -6,23 +6,23 @@ Subject: [PATCH] Fix big-endian build
 Bug-report: https://unicode-org.atlassian.net/browse/ICU-20533
 Patch taken from: https://bugs.gentoo.org/682170
=20
-Upstream-Status: Pending
+it is applied upstream and will be in version 67+
+
+Upstream-Status: Backport [https://github.com/unicode-org/icu/commit/4a3a4=
57b38cd828b7b3fa4fdbc6e2504a57275e9]
 Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
 ---
  data/Makefile.in | 3 ++-
  1 file changed, 2 insertions(+), 1 deletion(-)
=20
-diff --git a/source/data/Makefile.in b/source/data/Makefile.in
-index 778b6c7..67203e7 100644
 --- a/data/Makefile.in
 +++ b/data/Makefile.in
-@@ -148,7 +148,8 @@ ICUDATA_ARCHIVE =3D $(firstword $(wildcard $(srcdir)/i=
n/$(ICUDATA_BASENAME_VERSION
- # and convert it to the current type.
- ifneq ($(ICUDATA_ARCHIVE),)
- ICUDATA_SOURCE_ARCHIVE =3D $(OUTDIR)/$(ICUDATA_PLATFORM_NAME).dat
--$(ICUDATA_SOURCE_ARCHIVE): $(ICUDATA_ARCHIVE) $(OUTDIR)
-+$(ICUDATA_SOURCE_ARCHIVE): $(ICUDATA_ARCHIVE)
-+	$(MKINSTALLDIRS) $(OUTDIR)
- 	$(INVOKE) $(TOOLBINDIR)/icupkg -t$(ICUDATA_CHAR) $(ICUDATA_ARCHIVE) $(IC=
UDATA_SOURCE_ARCHIVE)
- endif
- else
+@@ -148,7 +148,8 @@ ICUDATA_ARCHIVE =3D $(firstword $(wildcard
+ # and convert it to the current type.=0D
+ ifneq ($(ICUDATA_ARCHIVE),)=0D
+ ICUDATA_SOURCE_ARCHIVE =3D $(OUTDIR)/$(ICUDATA_PLATFORM_NAME).dat=0D
+-$(ICUDATA_SOURCE_ARCHIVE): $(ICUDATA_ARCHIVE) $(OUTDIR)=0D
++$(ICUDATA_SOURCE_ARCHIVE): $(ICUDATA_ARCHIVE)=0D
++	$(MKINSTALLDIRS) $(OUTDIR)=0D
+ 	$(INVOKE) $(TOOLBINDIR)/icupkg -t$(ICUDATA_CHAR) $(ICUDATA_ARCHIVE) $(IC=
UDATA_SOURCE_ARCHIVE)=0D
+ endif=0D
+ else=0D
diff --git a/meta/recipes-support/icu/icu/filter.json b/meta/recipes-suppor=
t/icu/icu/filter.json
new file mode 100644
index 0000000000..2c63c08510
--- /dev/null
+++ b/meta/recipes-support/icu/icu/filter.json
@@ -0,0 +1,2 @@
+{
+}
diff --git a/meta/recipes-support/icu/icu_66.1.bb b/meta/recipes-support/ic=
u/icu_66.1.bb
index 5018464c14..c6471d51d4 100644
--- a/meta/recipes-support/icu/icu_66.1.bb
+++ b/meta/recipes-support/icu/icu_66.1.bb
@@ -18,7 +18,10 @@ ARM_INSTRUCTION_SET_armv4 =3D "arm"
 ARM_INSTRUCTION_SET_armv5 =3D "arm"
=20
 BASE_SRC_URI =3D "https://github.com/unicode-org/icu/releases/download/rel=
ease-${ICU_FOLDER}/icu4c-${ICU_PV}-src.tgz"
-SRC_URI =3D "${BASE_SRC_URI} \
+DATA_SRC_URI =3D "https://github.com/unicode-org/icu/releases/download/rel=
ease-${ICU_FOLDER}/icu4c-${ICU_PV}-data.zip"
+SRC_URI =3D "${BASE_SRC_URI};name=3Dcode \
+           ${DATA_SRC_URI};name=3Ddata;subdir=3D${S}/ \
+           file://filter.json \
            file://icu-pkgdata-large-cmd.patch \
            file://fix-install-manx.patch \
            file://0001-Fix-big-endian-build.patch \
@@ -28,8 +31,31 @@ SRC_URI =3D "${BASE_SRC_URI} \
 SRC_URI_append_class-target =3D "\
            file://0001-Disable-LDFLAGSICUDT-for-Linux.patch \
           "
-SRC_URI[md5sum] =3D "b33dc6766711517c98d318447e5110f8"
-SRC_URI[sha256sum] =3D "52a3f2209ab95559c1cf0a14f24338001f389615bf00e2585e=
f3dbc43ecf0a2e"
+SRC_URI[code.sha256sum] =3D "52a3f2209ab95559c1cf0a14f24338001f389615bf00e=
2585ef3dbc43ecf0a2e"
+SRC_URI[data.sha256sum] =3D "8be647f738891d2beb79d48f99077b3499948430eae6f=
1be112553b15ab0243e"
=20
 UPSTREAM_CHECK_REGEX =3D "icu4c-(?P<pver>\d+(_\d+)+)-src"
 UPSTREAM_CHECK_URI =3D "https://github.com/unicode-org/icu/releases"
+
+do_make_icudata_class-target () {
+    cd ${S}
+    AR=3D'${BUILD_AR}' \
+    CC=3D'${BUILD_CC}' \
+    CPP=3D'${BUILD_CPP}' \
+    CXX=3D'${BUILD_CXX}' \
+    RANLIB=3D'${BUILD_RANLIB}' \
+    CFLAGS=3D'${BUILD_CFLAGS}' \
+    CPPFLAGS=3D'${BUILD_CPPFLAGS}' \
+    CXXFLAGS=3D'${BUILD_CXXFLAGS}' \
+    LDFLAGS=3D'${BUILD_LDFLAGS}' \
+    ICU_DATA_FILTER_FILE=3D${WORKDIR}/filter.json \
+    ./runConfigureICU Linux --with-data-packaging=3Darchive
+    oe_runmake ${PARALLEL_MAKE}
+    install -Dm644 ${S}/data/out/icudt${ICU_MAJOR_VER}l.dat ${S}/data/in/i=
cudt${ICU_MAJOR_VER}l.dat
+}
+
+do_make_icudata() {
+    :
+}
+
+addtask make_icudata before do_configure after do_patch
--=20
2.26.0

