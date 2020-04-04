Received: from mail-pj1-f65.google.com (mail-pj1-f65.google.com [209.85.216.65])
 by mx.groups.io with SMTP id smtpd.web11.5885.1586033250999011727
 for <openembedded-core@lists.openembedded.org>;
 Sat, 04 Apr 2020 13:47:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=rKZPx8DI;
 spf=pass (domain: gmail.com, ip: 209.85.216.65, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f65.google.com with SMTP id fh8so4694217pjb.5
        for <openembedded-core@lists.openembedded.org>; Sat, 04 Apr 2020 13:47:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=1p5FBqM7NIwNEW1IS5NV4BiKdyqawSjBbfDMD9zsjp4=;
        b=rKZPx8DI/MI8BHQsMc1r+T6I9LcZwZeA+v70oJ7glvAHxzlw/3u7WeqDkPU2JkEaWA
         UKCVPU2FhkUnJBOlADxIfUzWdgI0dwPRNLxNKf3Pf6iQI8X5Ds8QQFQIYeEuvNIzc5Mg
         2bJHYYXSIsP8kS0zdWyv/rhXVQIK56lYYuG7cAxpA6Siokx8cosVOMzAFqrFBM7pxdTZ
         Ruav+HD/JcGdGPWcNfdbJ77+93ylkLkkDGEjw92O79AXs2pcBM12YA73D05BOHf74aFg
         yEoH28nVxve5H1ktJqYhU7Pote/3VThqNa6D8o4au7FQSK3Snl7NzYQok73szfjW58Y5
         ob7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=1p5FBqM7NIwNEW1IS5NV4BiKdyqawSjBbfDMD9zsjp4=;
        b=DeoWxsUBdfiv7SguQpSQPu6+GDEEsSuQ/TPcGabmJJdodHntIXQu3aFwBGokgjdbZE
         iYWFYegtKK5Mfqg6Ot3vKpe0uwRqdUTLnAIERGdlqrSKz6AqmzrX9FZSOGq62tVU0+oS
         J1GX5psnT72aKsznRfkdMBEHfAF55FFYxoZx0DYVtNTnHBNSjPggfm7dUesUDNc+ORc3
         klUchF20iJRXFa7CbZJvmjZr3joabJ+WoswlmEATB0HWe8iYIPzXBfXaW/tIPHqhmGzx
         eYH+AAtMf6kuFCU5gHEIKn9h1nDJikdAwnYKUx6DEod8xow+CL+eDKKSxTSn/4qcjzaL
         6o1w==
X-Gm-Message-State: AGi0PuYnyfr5u1BsANwKR859ESYpdrEcTFXzNmsCQScvbkhLtUGBOSNd
	EDwwM3ExXRzJzAc2lQ4FDykAkH0oPmQ=
X-Google-Smtp-Source: APiQypIZRWr5Dm0FT50kMBSGYsTspPL2G3sDOBikP67XJJ1tLhfajWB9+oZatepqLRTxxNiR1YUzyQ==
X-Received: by 2002:a17:902:7d84:: with SMTP id a4mr12448904plm.31.1586033249943;
        Sat, 04 Apr 2020 13:47:29 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::3e84])
        by smtp.gmail.com with ESMTPSA id d126sm721043pga.18.2020.04.04.13.47.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Apr 2020 13:47:29 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Wouter Meek <w.meek@metrological.com>
Subject: [PATCH V5] icu: Add knobs to generate a subset of ICU data
Date: Sat,  4 Apr 2020 13:47:42 -0700
Message-Id: <20200404204742.3121273-1-raj.khem@gmail.com>
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

install the icudtata file back into in/ folder so that main build
can now pickup this data file instead of regenerating it and wiping
out the filter changes that are expected to take effect

Use native compiler tools

[1] https://github.com/unicode-org/icu/blob/master/docs/userguide/icu_data/buildtool.md

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Suggested-by: Wouter Meek <w.meek@metrological.com>
---
v2: Fix build for BE systems
v3: Unset AR and RANLIB too
v4: Install fresh icudata back into data/in folder
v5: Use BUILD_CC and ilk instead of compiler on build host directly

 meta/recipes-support/icu/icu/filter.json |  2 ++
 meta/recipes-support/icu/icu_66.1.bb     | 34 +++++++++++++++++++++---
 2 files changed, 33 insertions(+), 3 deletions(-)
 create mode 100644 meta/recipes-support/icu/icu/filter.json

diff --git a/meta/recipes-support/icu/icu/filter.json b/meta/recipes-support/icu/icu/filter.json
new file mode 100644
index 0000000000..2c63c08510
--- /dev/null
+++ b/meta/recipes-support/icu/icu/filter.json
@@ -0,0 +1,2 @@
+{
+}
diff --git a/meta/recipes-support/icu/icu_66.1.bb b/meta/recipes-support/icu/icu_66.1.bb
index 5018464c14..68927ba352 100644
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
@@ -28,8 +31,33 @@ SRC_URI = "${BASE_SRC_URI} \
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
+    AR='${BUILD_AR}' \
+    CC='${BUILD_CC}' \
+    CPP='${BUILD_CPP}' \
+    CXX='${BUILD_CXX}' \
+    RANLIB='${BUILD_RANLIB}' \
+    CFLAGS='${BUILD_CFLAGS}' \
+    CPPFLAGS='${BUILD_CPPFLAGS}' \
+    CXXFLAGS='${BUILD_CXXFLAGS}' \
+    LDFLAGS='${BUILD_LDFLAGS}' \
+    ICU_DATA_FILTER_FILE=${WORKDIR}/filter.json \
+    ./runConfigureICU Linux --with-data-packaging=archive
+    oe_runmake ${PARALLEL_MAKE}
+    install -Dm644 ${S}/data/out/icudt${ICU_MAJOR_VER}l.dat ${S}/data/in/icudt${ICU_MAJOR_VER}l.dat
+}
+
+do_make_icudata() {
+    :
+}
+
+addtask make_icudata before do_configure after do_patch
-- 
2.26.0

