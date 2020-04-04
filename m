Received: from mail-pj1-f66.google.com (mail-pj1-f66.google.com [209.85.216.66])
 by mx.groups.io with SMTP id smtpd.web11.2231.1585965859366131561
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Apr 2020 19:04:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Nqw15Sxv;
 spf=pass (domain: gmail.com, ip: 209.85.216.66, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f66.google.com with SMTP id k3so3857414pjj.2
        for <openembedded-core@lists.openembedded.org>; Fri, 03 Apr 2020 19:04:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=9Fd08u/snIbDpKoInsnzCKWJPmlWtML1Udv8YdOcyKE=;
        b=Nqw15SxvYgGg6l9olLDN/1tVyUix1rnhs/z4TiHoxpQvh87pvqc/GCfpCZaMk/2B4H
         BOCIfYgPb78+aiLNlN2J/LBIq8ADDCxg6Qu1EOXpUM5kn2UeD9xNtFZOJlko1ubmopB4
         cl51ncux1P0VLctyiXQnckLgdErintOI9Diz0i3VPY7cu5zDcf5BbIaCE7+cvH0meNkZ
         qqgAnfhu4qDQsbvL9UGsaQLOfBlrCBkmXVvvybQrarfJcjWxfoRY2VAhnFdBmI3bQ5RB
         xsCj3sqHNpsDW2YkSovEMQUMFnt+Bs/SHNyfi/O1k9OnZ87ez3o5VGF5+NXHwkYvU9L4
         ZXqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=9Fd08u/snIbDpKoInsnzCKWJPmlWtML1Udv8YdOcyKE=;
        b=sqa2dkSL3acM7Sl6rcb/BZSGdJWYvRe+0cIwndcw8my8pSqDJfoZKGSJlJ/SFkNCLu
         CFS1ihrztJIKJrNS+2rc8isavT6tAmmqq0a6GjQKN29kMfKqEuJVOnbQJYVprXNeZRKr
         4S/tvnEAdx0WcmdyPAPFP1C9MEob1QtJOkSwk5ldRM9/YPtJYawituC02+vAGkWU4m8M
         uf8jIhN5ts7YLcTooKBaJaS7TVmMI0Gjc21PExC50sYWeoqUwQl8rHaDLJ0po7UW9wHq
         4ucXhigaQmmxPQSZwJEyX++yAbye35DC3bIbetsJjan8sVavNIVyR+6IlKPfm1JNQQpv
         wwIQ==
X-Gm-Message-State: AGi0PuaecCNVoLIvEuLtSwXWG+mfCjurYl0i8rPOgELgMrAFLxzW2Wa0
	pyLLMizbnHT/dcsz7+y/QWn1php0ye4=
X-Google-Smtp-Source: APiQypKtlc+64mNCQYFPHLNuzFOKTHi1zEL/Acq2wEuR6gTcxOZMehjrbXatdC//CgOhciq0y+Iahg==
X-Received: by 2002:a17:90a:9742:: with SMTP id i2mr13673956pjw.194.1585965857852;
        Fri, 03 Apr 2020 19:04:17 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::3e84])
        by smtp.gmail.com with ESMTPSA id 74sm6545276pfy.120.2020.04.03.19.04.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2020 19:04:16 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Wouter Meek <w.meek@metrological.com>
Subject: [PATCH V3] icu: Add knobs to generate a subset of ICU data
Date: Fri,  3 Apr 2020 19:04:30 -0700
Message-Id: <20200404020430.2124681-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.26.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

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

[1] https://github.com/unicode-org/icu/blob/master/docs/userguide/icu_data/buildtool.md

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Suggested-by: Wouter Meek <w.meek@metrological.com>
---
v2: Fix build for BE systems
v3: Unset AR and RANLIB too

 meta/recipes-support/icu/icu.inc         |  2 +-
 meta/recipes-support/icu/icu/filter.json |  2 ++
 meta/recipes-support/icu/icu_66.1.bb     | 25 +++++++++++++++++++++---
 3 files changed, 25 insertions(+), 4 deletions(-)
 create mode 100644 meta/recipes-support/icu/icu/filter.json

diff --git a/meta/recipes-support/icu/icu.inc b/meta/recipes-support/icu/icu.inc
index 6d9728903d..d6ff82926e 100644
--- a/meta/recipes-support/icu/icu.inc
+++ b/meta/recipes-support/icu/icu.inc
@@ -59,7 +59,7 @@ do_install_append_class-target() {
     # Use icupkg to re-generate it.
     if [ "${SITEINFO_ENDIANNESS}" = "be" ] ; then
         rm -f ${D}/${datadir}/${BPN}/${PV}/icudt${ICU_MAJOR_VER}b.dat
-        icupkg -tb ${S}/data/in/icudt${ICU_MAJOR_VER}l.dat ${D}/${datadir}/${BPN}/${PV}/icudt${ICU_MAJOR_VER}b.dat
+        icupkg -tb ${S}/data/out/icudt${ICU_MAJOR_VER}l.dat ${D}/${datadir}/${BPN}/${PV}/icudt${ICU_MAJOR_VER}b.dat
     fi
 	
 	# Remove build host references...
diff --git a/meta/recipes-support/icu/icu/filter.json b/meta/recipes-support/icu/icu/filter.json
new file mode 100644
index 0000000000..2c63c08510
--- /dev/null
+++ b/meta/recipes-support/icu/icu/filter.json
@@ -0,0 +1,2 @@
+{
+}
diff --git a/meta/recipes-support/icu/icu_66.1.bb b/meta/recipes-support/icu/icu_66.1.bb
index 5018464c14..7b205c51cf 100644
--- a/meta/recipes-support/icu/icu_66.1.bb
+++ b/meta/recipes-support/icu/icu_66.1.bb
@@ -18,7 +18,10 @@ ARM_INSTRUCTION_SET_armv4 = "arm"
 ARM_INSTRUCTION_SET_armv5 = "arm"
 
 BASE_SRC_URI = "https://github.com/unicode-org/icu/releases/download/release-${ICU_FOLDER}/icu4c-${ICU_PV}-src.tgz"
-SRC_URI = "${BASE_SRC_URI} \
+DATA_SRC_URI = "https://github.com/unicode-org/icu/releases/download/release-${ICU_FOLDER}/icu4c-${ICU_PV}-data.zip"
+SRC_URI = "${BASE_SRC_URI};name=code \
+           ${DATA_SRC_URI};name=data \
+           file://filter.json \
            file://icu-pkgdata-large-cmd.patch \
            file://fix-install-manx.patch \
            file://0001-Fix-big-endian-build.patch \
@@ -28,8 +31,24 @@ SRC_URI = "${BASE_SRC_URI} \
 SRC_URI_append_class-target = "\
            file://0001-Disable-LDFLAGSICUDT-for-Linux.patch \
           "
-SRC_URI[md5sum] = "b33dc6766711517c98d318447e5110f8"
-SRC_URI[sha256sum] = "52a3f2209ab95559c1cf0a14f24338001f389615bf00e2585ef3dbc43ecf0a2e"
+SRC_URI[code.sha256sum] = "52a3f2209ab95559c1cf0a14f24338001f389615bf00e2585ef3dbc43ecf0a2e"
+SRC_URI[data.sha256sum] = "8be647f738891d2beb79d48f99077b3499948430eae6f1be112553b15ab0243e"
 
 UPSTREAM_CHECK_REGEX = "icu4c-(?P<pver>\d+(_\d+)+)-src"
 UPSTREAM_CHECK_URI = "https://github.com/unicode-org/icu/releases"
+
+do_make_icudata_class-target () {
+    rm -rf ${S}/data
+    cp -a ${WORKDIR}/data ${S}
+    cd ${S}
+    unset AR CC CPP CXX RANLIB CFLAGS CPPFLAGS CXXFLAGS LDFLAGS
+    ICU_DATA_FILTER_FILE=${WORKDIR}/filter.json \
+    ./runConfigureICU Linux --with-data-packaging=archive
+    oe_runmake ${PARALLEL_MAKE}
+}
+
+do_make_icudata() {
+    :
+}
+
+addtask make_icudata before do_configure after do_patch
-- 
2.26.0

