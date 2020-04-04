Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com [209.85.215.195])
 by mx.groups.io with SMTP id smtpd.web10.1769.1586020800125971901
 for <openembedded-core@lists.openembedded.org>;
 Sat, 04 Apr 2020 10:20:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=fxcdVfRD;
 spf=pass (domain: gmail.com, ip: 209.85.215.195, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f195.google.com with SMTP id k191so5274180pgc.13
        for <openembedded-core@lists.openembedded.org>; Sat, 04 Apr 2020 10:20:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=uAXPOtyK+8KpNe9/qAtsEF72UtOQC6oxgM5/bCZc0Hw=;
        b=fxcdVfRDe/lTH0FxMAqEHNqXJJ4aUEC0fkcxKgq0K5UmT7vmrsH0OtZ0bInX/n6E3l
         GjIT9A2KbvZletuW+OaMa1lhyr6GBRY1XpZYOj6S/HRqbjioAk00aX+oFxk54/dL4Gq1
         9Q1AhtS8jLKaeS654YrR3R+Uwbua+ouTxu1L8dRMjrnzOAKcIIKxZcBmmrFYrDp794c1
         wHKD3SQUdo8LlahVKVENof4eoWK3WXxsU4dBr6swVCD3IBusntyPOMCJ2sADwrqGRe0t
         hSfVWRJ1ugAT6k64ZSvX4qqJFyscp4lQNtxWUBLYrt8kb4fGL+RQSH/B7d1gdMK4P4/0
         TtMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=uAXPOtyK+8KpNe9/qAtsEF72UtOQC6oxgM5/bCZc0Hw=;
        b=Mc85ev9Vg7YVQSrPjLkX/VOJOyT14bRh1VI+87o5YfHIgr3Tv2AXHl12sSNXZYTxaw
         6H1Hk34dgYRK5uWkcYMMRqtaIsD58rVRCK0s9G88TLpyIgbv2BrqXO8hE2R/sL1G8jmh
         wEdlX0iQBpx75NBB2bpQlqtgiHKm/7bRLnEfHkw8c0S1vy/FReRP/rgIOgZyMqFX5lx+
         0n5trFebso3Lkp+T78ppK+jwZN6haqGfEkWUUDPeMJUhJPLYTUeRaPhRsN/TMgflyz03
         faS/rWRWAYnFBwjiZVtzySTubLp7c5zA436HsOIUWdK5riR7badRF+J/p4BIEN4l6bUP
         U9DA==
X-Gm-Message-State: AGi0Puag/102TrFxfgofyNPhooD+5JZDc7vA7t+z11JiNxtgH1yQp4/B
	UXbN35sLkSW0Xa/rca205MAn9T1hjSs=
X-Google-Smtp-Source: APiQypJ4SknQyl43C/zi5vcMewAEr+cLknNIdGTznYOTCsHADuIPh0JkKCF/BSohcfvrGiAGKyBf6A==
X-Received: by 2002:aa7:8bdc:: with SMTP id s28mr14702970pfd.110.1586020798994;
        Sat, 04 Apr 2020 10:19:58 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::3e84])
        by smtp.gmail.com with ESMTPSA id v20sm7418641pgo.34.2020.04.04.10.19.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Apr 2020 10:19:58 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Wouter Meek <w.meek@metrological.com>
Subject: [PATCH V4] icu: Add knobs to generate a subset of ICU data
Date: Sat,  4 Apr 2020 10:20:12 -0700
Message-Id: <20200404172012.2978960-1-raj.khem@gmail.com>
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

[1] https://github.com/unicode-org/icu/blob/master/docs/userguide/icu_data/buildtool.md

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Suggested-by: Wouter Meek <w.meek@metrological.com>
---
v2: Fix build for BE systems
v3: Unset AR and RANLIB too
v4: Install fresh icudata back into data/in folder

 meta/recipes-support/icu/icu/filter.json |  2 ++
 meta/recipes-support/icu/icu_66.1.bb     | 26 +++++++++++++++++++++---
 2 files changed, 25 insertions(+), 3 deletions(-)
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
index 5018464c14..736bec4605 100644
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
@@ -28,8 +31,25 @@ SRC_URI = "${BASE_SRC_URI} \
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

