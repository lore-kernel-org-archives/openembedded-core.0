Received: from mail-pj1-f67.google.com (mail-pj1-f67.google.com [209.85.216.67])
 by mx.groups.io with SMTP id smtpd.web12.3022.1585878818967791870
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Apr 2020 18:53:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=vgtA4hQ6;
 spf=pass (domain: gmail.com, ip: 209.85.216.67, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f67.google.com with SMTP id l36so2316632pjb.3
        for <openembedded-core@lists.openembedded.org>; Thu, 02 Apr 2020 18:53:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hpV4U4dE1cLmzLsusOPsTQ6RzNA3a3bH1u4IvCjnjG8=;
        b=vgtA4hQ6u7ReKQlJkfWLjnWre4pcUK0rT6Ln5IM7uZqKTSaM1mqo3uz9TOktO225SB
         IhuQ4hWPpbIaWcH7651NWWNJFbXxIBd1jQ6ZhFKYBsYryPnbJxi9HfpgCKqLpcCYHxiw
         LeAvv0yKWR1WRLtk79Y26cX+dRcLcjOEs6VxzJiemAm4Ry5re6rdmiJBfhcvg2Wsro3I
         ZLAweF/4HCu+WLFwjEPMIfbqYQeJ8jJeEcTLs6AOz3wWVw6vhKKxgdXmIUzZ68ef6CwJ
         o8m4k49NlGT1vRWjDGqWLrC4IlSTX4LrFp6sbracxTaiXE9HXZmIcBoX0usR3H6Aq0gV
         3sng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hpV4U4dE1cLmzLsusOPsTQ6RzNA3a3bH1u4IvCjnjG8=;
        b=MZx+6TKKApL8ZGxK6zHE3iIyi1JJGLBcKB4z13QhDvR3bOACfqXl+NNvfwnQF7GFnk
         yiIzqPDXN/kq843y1HXSApwr4bvfXNBK4f1TbHoaPfmb1dJzsASItF5Csiw/dZeoXxWj
         opHnTW5MqJ3k26bu0rHCYx6l14r0RjCV2iMQf63mcOovMP80WeJPmoV3cqJc4r3ukXEJ
         jgxDGz7d8iepRv90Ov+IReRMi7XlTHHb8i7vfthjYaJeBhCCGmAame6ypwoyUQGXd46w
         u//Y5iEoE3mcq/I9sdRQ9T0QnLyW/eBfOuHs5anL+TTm35UKh0Nt/fMl60jQ2QSmHCg2
         2mBg==
X-Gm-Message-State: AGi0PuZ3StlxLuEREBL536deVu/Y0cfMHqt+T04FC9MTlEdSink6YRfP
	/0WLHPbPPOm8sxePf64GzcIyB9159Ik=
X-Google-Smtp-Source: APiQypITDuR+DeIjoE2Fe60uxZBbfrunP1dOx64wV5U/AS1bMIHRaSCJYHkZOVY6UoclB+bwUHiDyw==
X-Received: by 2002:a17:90a:db4a:: with SMTP id u10mr6857434pjx.101.1585878817845;
        Thu, 02 Apr 2020 18:53:37 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::3e84])
        by smtp.gmail.com with ESMTPSA id iq14sm4581722pjb.43.2020.04.02.18.53.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Apr 2020 18:53:37 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Wouter Meek <w.meek@metrological.com>
Subject: [PATCH] icu: Add knobs to generate a subset of ICU data
Date: Thu,  2 Apr 2020 18:53:50 -0700
Message-Id: <20200403015350.1002891-1-raj.khem@gmail.com>
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

[1] https://github.com/unicode-org/icu/blob/master/docs/userguide/icu_data/buildtool.md

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Suggested-by: Wouter Meek <w.meek@metrological.com>
---
 meta/recipes-support/icu/icu/filter.json |  2 ++
 meta/recipes-support/icu/icu_66.1.bb     | 19 ++++++++++++++++---
 2 files changed, 18 insertions(+), 3 deletions(-)
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
index 5018464c14..a8cfdf9eed 100644
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
@@ -28,8 +31,18 @@ SRC_URI = "${BASE_SRC_URI} \
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
+CONFIGURE_SCRIPT_class-target = "${S}/runConfigureICU"
+CONFIGUREOPTS_prepend_class-target = "Linux "
+CACHED_CONFIGUREVARS_append_class-target = "ICU_DATA_FILTER_FILE=${WORKDIR}/filter.json"
+
+do_configure_prepend_class-target () {
+    rm -rf ${S}/data
+    cp -a ${WORKDIR}/data ${S}/
+}
+
-- 
2.26.0

