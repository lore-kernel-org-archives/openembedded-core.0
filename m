Received: from mail-pj1-f66.google.com (mail-pj1-f66.google.com [209.85.216.66])
 by mx.groups.io with SMTP id smtpd.web10.8431.1586041367719009651
 for <openembedded-core@lists.openembedded.org>;
 Sat, 04 Apr 2020 16:02:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=IDboWDN8;
 spf=pass (domain: gmail.com, ip: 209.85.216.66, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f66.google.com with SMTP id g9so4763107pjp.0
        for <openembedded-core@lists.openembedded.org>; Sat, 04 Apr 2020 16:02:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=TOH0xsW9R5P4b2QwPgrKrDbqQZN93QyBD75MgnbsVBk=;
        b=IDboWDN8mCGn0u1A53RYMfuHgOSbXdBW1X7bssFHhgelxoncPAfQRYe9RzymyBZq6+
         dGX2A58SbkCMm0V+rxhlk4sEL8hJP+mKEeKM4Z/+6ebxoBc8AwKZ6Dc10GcGLYWGc2V9
         Ekm5OIoGUCOebbXf21WpNU1FTPiTYBx3XFp/Xwb0AKd9ruIEWFW2pmLCttm8MSBcDjKQ
         0ryAutwiebMxci8VypQpqo8VjjWK4XPuiO1jmVSem99sS8ZBzDmL2ugc1fmwyXyWxS6x
         vSyd4Le3POn1MFQ9u3JMNGdyPbtuDH+YojaE1F5uc+B3uPp9w1IcQV5NQV11a23adfqE
         qMNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=TOH0xsW9R5P4b2QwPgrKrDbqQZN93QyBD75MgnbsVBk=;
        b=EvGtWemSuhmxQ9kqdtCTXZBu1BuhGKhWKlC/s5dTMyM0b/yCgHgVT07OpJ8Es/6Nkn
         oGvqtarMLhUAv//UUF8UAaE8vLxxUZV1soGALifnXBqf/g0J+S3RMpoCjsOx2o8gawsn
         ONI34VQpa1NcC/pSpv2JJW2P6XlIeqstEZuTp4EF/gkzQeG6loGea09YaX9FKZvdfZvJ
         oLPNBVxES4H0dlKYHp00NPwESSdc8F5AjHRD+gWetp2yMADDGirLhNcgue0BhD9k4q91
         BGRxICAGQq17PFZxSuRIJzo+sH/mGv/CbXVFJiirsjELbFHUTvFvpCrdk+fkwuWLxZPU
         ecCA==
X-Gm-Message-State: AGi0PuakiBIpA06I2FLxbw50qqo31vFcFiX9+K0bQot4+HXnC+iA6eUk
	GUdXlHE0dJKdPg7LiDjxomcQoROV7LM=
X-Google-Smtp-Source: APiQypLZwEAcJ50gMoBJt3yFtOzFabR/r1LLBAaGIqpWMdkXICt4J3JTCkuQtYUuxR9Z1vT/eUt8fw==
X-Received: by 2002:a17:90a:da03:: with SMTP id e3mr2762925pjv.61.1586041366665;
        Sat, 04 Apr 2020 16:02:46 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::3e84])
        by smtp.gmail.com with ESMTPSA id w15sm8398429pfj.28.2020.04.04.16.02.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Apr 2020 16:02:45 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Wouter Meek <w.meek@metrological.com>
Subject: [PATCH V7] icu: Add knobs to generate a subset of ICU data
Date: Sat,  4 Apr 2020 16:02:57 -0700
Message-Id: <20200404230257.371957-1-raj.khem@gmail.com>
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

defer applying 0001-Fix-big-endian-build.patch after moving new data/ in

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
v7: Defer big-endian build patch which is applied data dir after copying
    new data dir in

 .../icu/icu/0001-Fix-big-endian-build.patch   | 26 ++++++-------
 meta/recipes-support/icu/icu/filter.json      |  2 +
 meta/recipes-support/icu/icu_66.1.bb          | 37 +++++++++++++++++--
 3 files changed, 48 insertions(+), 17 deletions(-)
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
index 5018464c14..0d26f52f20 100644
--- a/meta/recipes-support/icu/icu_66.1.bb
+++ b/meta/recipes-support/icu/icu_66.1.bb
@@ -18,18 +18,47 @@ ARM_INSTRUCTION_SET_armv4 =3D "arm"
 ARM_INSTRUCTION_SET_armv5 =3D "arm"
=20
 BASE_SRC_URI =3D "https://github.com/unicode-org/icu/releases/download/rel=
ease-${ICU_FOLDER}/icu4c-${ICU_PV}-src.tgz"
-SRC_URI =3D "${BASE_SRC_URI} \
+DATA_SRC_URI =3D "https://github.com/unicode-org/icu/releases/download/rel=
ease-${ICU_FOLDER}/icu4c-${ICU_PV}-data.zip"
+SRC_URI =3D "${BASE_SRC_URI};name=3Dcode \
+           ${DATA_SRC_URI};name=3Ddata \
+           file://filter.json \
            file://icu-pkgdata-large-cmd.patch \
            file://fix-install-manx.patch \
-           file://0001-Fix-big-endian-build.patch \
+           file://0001-Fix-big-endian-build.patch;apply=3Dno \
            file://0001-icu-Added-armeb-support.patch \
            "
=20
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
+    rm -rf data
+    cp -a ${WORKDIR}/data .
+    patch -p1 < ${WORKDIR}/0001-Fix-big-endian-build.patch
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

