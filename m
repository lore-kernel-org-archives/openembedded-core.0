Return-Path: <adam.duskett@amarulasolutions.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1AEB1C79FA7
	for <webhook@archiver.kernel.org>; Mon,  7 Sep 2026 13:56:18 +0000 (UTC)
Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com [74.125.228.140])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.35392.1788789373930594978
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Sep 2026 06:56:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@amarulasolutions.com header.s=google header.b=oPvRmIj8;
 spf=pass (domain: amarulasolutions.com, ip: 74.125.228.140, mailfrom: adam.duskett@amarulasolutions.com)
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c25085f2426so34664066b.3
        for <openembedded-core@lists.openembedded.org>; Mon, 07 Sep 2026 06:56:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1788789372; x=1789394172; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eN8D2QhacD7fDZqtkrRq4ynhP03QK6VUzNicK+E4WgM=;
        b=oPvRmIj81zk4o4uqc0b34T0P59ZS/juWOQIg3mwSC9rf76oaXXRd+NOsy77lAMC4GK
         UIaq2oGJzL0k7G1Ja0tRQKWKVVqHC+uJBsTN1DKobkHhhUfEpxJct5PUzD0iqCslyHjX
         eV5pFUCq1InI0WLa/ExUT5TKTzbhhJZM+Px2E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788789372; x=1789394172;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=eN8D2QhacD7fDZqtkrRq4ynhP03QK6VUzNicK+E4WgM=;
        b=UcPDf9PHSZxjAB1rilZlRWrjjrNQmupNUTW5pUydmJrTfHPQPAzpRk93BUfwDdAWB7
         oqUTeHBn1oZ4iOxHDqC+fSkrwI5ZHBkPbUPcqEbu0xSFvxOYBNxoxpVHA0wFVDuBl0QW
         0qm7OtmcUT+XjlZxffMf7bpjFDV/t8DAr5c53/fQXm2kTdiAsaCtXYmz64v3R/In6xha
         4R8GOqZKIelzCz8w/h+TdgVfbeXKZBW1aAAdwS5/tUSD/P7oODKY2QKRntFBukxVVoZF
         4I+4WUGubmtzesPwL/s/hus+qoXbx9BQhWLuJAa9RiWZBOMM010IcATkLvgQKz/XTUWf
         onJg==
X-Gm-Message-State: AFuF++l/r+rqTKZKRVfKv0XmPDNeRu/adjUVj3LsR6s03SXUJr896Umt
	4JOFxdBKGjt0zp2CYH4V2hgYvEurQL2taMFyLsZDAh4X51subsxmOFpueSN2pyKE+oqBz0ctecq
	EZJTZMh0=
X-Gm-Gg: AYBFou1+6HF/lLqcF3ifXOmTkzrI45uG+tlNuDB20gi+ZpdN3sD/oUyHNPnVs3+F5OC
	8+tuBEBTf2v2RxRl3VdDRKqGEaXgPEXMnQozVqSIVwGA6GHYWa8GBNkOX6ojdFgNypS7E6uhmkM
	BXjQlacIru+eeSGv90GYuQT1PNirL1a/YueHp4nLw6N9DyCRS7NIA3CJujRtoMN3ROFaonUWuPf
	oJYpbqp1DEl6GUwBvk0+TKzTpgdeM4oP1jwBiHZz3+qyvHE8KRnYTxaM9in2OqIyyVUcIzDXB0m
	4rn9fKzcda7cREK9KQrCozFLjscLVjRT6Q+DF4L0IjVwyVKsoDCWLCAl1htDHY/tOofHmGIXbYP
	0KIQYX0y3LazznWazyQ7YpxD8UNqxjWS38K4X+ofkHgkeI8xqsZuaPb5sLmVGSIvuRO8AcpXYWC
	y+k1YVrzmIqAD2e8fkj7O0+nIZ+bj/gPCILGjaxvOUqlbhHD2sxSnceKKE2mmjW+gYWV450VR4Q
	E2nsg61XlH9umUYqrVr4qGUDUBSXUK4IhwfS0zIuSPafHl4XiQKODzMXyWrWZb1Gjcvl0OgNrQO
	SiWX+95Q9sQBNUbGLHXVWgN3Ivo7hue1rWqEg3FHKQrmihYF6Bwi5yMwj9D1zM28Ry/p
X-Received: by 2002:a17:907:1c24:b0:c12:6db4:4bf4 with SMTP id a640c23a62f3a-c2624cfedbemr528904466b.0.1788789371933;
        Mon, 07 Sep 2026 06:56:11 -0700 (PDT)
Received: from adam-linux.tail032493.ts.net (2001-1c00-8181-e800-030c-182b-b2a8-e89d.cable.dynamic.v6.ziggo.nl. [2001:1c00:8181:e800:30c:182b:b2a8:e89d])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c260d5497cbsm478290566b.34.2026.09.07.06.56.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 06:56:11 -0700 (PDT)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: openembedded-core@lists.openembedded.org
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>
Subject: [PATCH v9 2/5] libtoml11: new recipe
Date: Mon,  7 Sep 2026 15:56:01 +0200
Message-ID: <20260907135607.4132821-2-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260907135607.4132821-1-adam.duskett@amarulasolutions.com>
References: <20260907135607.4132821-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Sep 2026 13:56:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245295

DNF5 requires libtoml. As such, copy libtoml verbatim from
meta-openembedded to openembedded-core.

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
 meta/conf/distro/include/maintainers.inc      |  1 +
 .../distro/include/ptest-packagelists.inc     |  1 +
 ...move-more-whitespaces-after-operator.patch | 34 ++++++++++++++
 .../0001-Remove-whitespace-in-operator.patch  | 46 +++++++++++++++++++
 .../libtoml11/files/run-ptest                 | 13 ++++++
 .../libtoml11/libtoml11_4.4.0.bb              | 39 ++++++++++++++++
 6 files changed, 134 insertions(+)
 create mode 100644 meta/recipes-devtools/libtoml11/files/0001-Remove-more-whitespaces-after-operator.patch
 create mode 100644 meta/recipes-devtools/libtoml11/files/0001-Remove-whitespace-in-operator.patch
 create mode 100755 meta/recipes-devtools/libtoml11/files/run-ptest
 create mode 100644 meta/recipes-devtools/libtoml11/libtoml11_4.4.0.bb

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index 3c1a4ffa43..8f47ea6001 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -403,6 +403,7 @@ RECIPE_MAINTAINER:pn-libssh2 = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-libssp-nonshared = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-libstd-rs = "Randy MacLeod <Randy.MacLeod@windriver.com>"
 RECIPE_MAINTAINER:pn-libtasn1 = "Unassigned <unassigned@yoctoproject.org>"
+RECIPE_MAINTAINER:pn-libtoml11 = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-libtest-fatal-perl = "Tim Orling <tim.orling@konsulko.com>"
 RECIPE_MAINTAINER:pn-libtest-needs-perl = "Tim Orling <tim.orling@konsulko.com>"
 RECIPE_MAINTAINER:pn-libtest-warnings-perl = "Tim Orling <tim.orling@konsulko.com>"
diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/conf/distro/include/ptest-packagelists.inc
index ce6c0a2d76..351d47d6ee 100644
--- a/meta/conf/distro/include/ptest-packagelists.inc
+++ b/meta/conf/distro/include/ptest-packagelists.inc
@@ -48,6 +48,7 @@ PTESTS_FAST = "\
     libtest-needs-perl \
     libtest-warnings-perl \
     libtimedate-perl \
+    libtoml11 \
     libtry-tiny-perl \
     libusb1 \
     libxml-namespacesupport-perl \
diff --git a/meta/recipes-devtools/libtoml11/files/0001-Remove-more-whitespaces-after-operator.patch b/meta/recipes-devtools/libtoml11/files/0001-Remove-more-whitespaces-after-operator.patch
new file mode 100644
index 0000000000..5bff81eaf6
--- /dev/null
+++ b/meta/recipes-devtools/libtoml11/files/0001-Remove-more-whitespaces-after-operator.patch
@@ -0,0 +1,34 @@
+From 6af7de3d5eaae59c53c42aab8eca1e1e9a365da5 Mon Sep 17 00:00:00 2001
+From: Steffen Winter <steffen.winter@proton.me>
+Date: Thu, 25 Dec 2025 20:48:02 +0100
+Subject: [PATCH] Remove more whitespaces after operator""
+
+Upstream-Status: Submitted [https://github.com/ToruNiina/toml11/pull/306]
+Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
+---
+ include/toml11/fwd/literal_fwd.hpp   | 4 ++--
+ include/toml11/impl/literal_impl.hpp | 4 ++--
+ 2 files changed, 4 insertions(+), 4 deletions(-)
+
+--- a/include/toml11/fwd/literal_fwd.hpp
++++ b/include/toml11/fwd/literal_fwd.hpp
+@@ -24,7 +24,7 @@ inline namespace toml_literals
+ #if defined(TOML11_HAS_CHAR8_T)
+ // value of u8"" literal has been changed from char to char8_t and char8_t is
+ // NOT compatible to char
+-::toml::value operator"" _toml(const char8_t* str, std::size_t len);
++::toml::value operator""_toml(const char8_t* str, std::size_t len);
+ #endif
+ 
+ } // toml_literals
+--- a/include/toml11/impl/literal_impl.hpp
++++ b/include/toml11/impl/literal_impl.hpp
+@@ -146,7 +146,7 @@ operator""_toml(const char* str, std::si
+ // value of u8"" literal has been changed from char to char8_t and char8_t is
+ // NOT compatible to char
+ TOML11_INLINE ::toml::value
+-operator"" _toml(const char8_t* str, std::size_t len)
++operator""_toml(const char8_t* str, std::size_t len)
+ {
+     if(len == 0)
+     {
diff --git a/meta/recipes-devtools/libtoml11/files/0001-Remove-whitespace-in-operator.patch b/meta/recipes-devtools/libtoml11/files/0001-Remove-whitespace-in-operator.patch
new file mode 100644
index 0000000000..9516ee5cb1
--- /dev/null
+++ b/meta/recipes-devtools/libtoml11/files/0001-Remove-whitespace-in-operator.patch
@@ -0,0 +1,46 @@
+From dee78f822d8a5b985e565e5c1ef42a59557aa8fc Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 7 Mar 2025 11:35:46 -0800
+Subject: [PATCH] Remove whitespace in operator""
+
+Clang 20+ errors about this whitespace.
+
+Fixes
+include/toml11/impl/../fwd/literal_fwd.hpp:22:26: error: identifier '_toml' preceded by whitespace in a literal operator declaration is deprecated [-Werror,-Wdeprecated-literal-operator]
+|    22 | ::toml::value operator"" _toml(const char* str, std::size_t len);
+|       |               ~~~~~~~~~~~^~~~~
+|       |               operator""_toml
+
+Upstream-Status: Backport [https://github.com/ToruNiina/toml11/commit/dee78f822d8a5b985e565e5c1ef42a59557aa8fc]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ include/toml11/fwd/literal_fwd.hpp   | 2 +-
+ include/toml11/impl/literal_impl.hpp | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/include/toml11/fwd/literal_fwd.hpp b/include/toml11/fwd/literal_fwd.hpp
+index e46612c..82f62b7 100644
+--- a/include/toml11/fwd/literal_fwd.hpp
++++ b/include/toml11/fwd/literal_fwd.hpp
+@@ -19,7 +19,7 @@ inline namespace literals
+ inline namespace toml_literals
+ {
+ 
+-::toml::value operator"" _toml(const char* str, std::size_t len);
++::toml::value operator""_toml(const char* str, std::size_t len);
+ 
+ #if defined(TOML11_HAS_CHAR8_T)
+ // value of u8"" literal has been changed from char to char8_t and char8_t is
+diff --git a/include/toml11/impl/literal_impl.hpp b/include/toml11/impl/literal_impl.hpp
+index e8298c2..067d4ed 100644
+--- a/include/toml11/impl/literal_impl.hpp
++++ b/include/toml11/impl/literal_impl.hpp
+@@ -115,7 +115,7 @@ inline namespace toml_literals
+ {
+ 
+ TOML11_INLINE ::toml::value
+-operator"" _toml(const char* str, std::size_t len)
++operator""_toml(const char* str, std::size_t len)
+ {
+     if(len == 0)
+     {
diff --git a/meta/recipes-devtools/libtoml11/files/run-ptest b/meta/recipes-devtools/libtoml11/files/run-ptest
new file mode 100755
index 0000000000..4da9e68cc5
--- /dev/null
+++ b/meta/recipes-devtools/libtoml11/files/run-ptest
@@ -0,0 +1,13 @@
+#!/usr/bin/env sh
+
+cd tests || exit 1
+
+rm -rf tests.log
+
+for atest in test_* ; do
+    if ./"${atest}" >> tests.log 2>&1; then
+        echo "PASS: ${atest}"
+    else
+        echo "FAIL: ${atest}"
+    fi
+done
diff --git a/meta/recipes-devtools/libtoml11/libtoml11_4.4.0.bb b/meta/recipes-devtools/libtoml11/libtoml11_4.4.0.bb
new file mode 100644
index 0000000000..49f9840f06
--- /dev/null
+++ b/meta/recipes-devtools/libtoml11/libtoml11_4.4.0.bb
@@ -0,0 +1,39 @@
+SUMMARY = "TOML for Modern C++"
+DESCRIPTION = "toml11 is a feature-rich TOML language library for \
+               C++11/14/17/20."
+
+HOMEPAGE = "https://github.com/ToruNiina/toml11"
+BUGTRACKER = "https://github.com/ToruNiina/toml11/issues"
+CVE_PRODUCT = "libtoml11"
+
+SECTION = "libs"
+
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=44d1fcf70c7aa6991533c38daf7befa3"
+
+PE = "1"
+
+SRC_URI = "\
+    gitsm://github.com/ToruNiina/toml11.git;protocol=https;branch=main;tag=v${PV} \
+    file://0001-Remove-whitespace-in-operator.patch \
+    file://0001-Remove-more-whitespaces-after-operator.patch \
+    file://run-ptest \
+"
+SRCREV = "be08ba2be2a964edcdb3d3e3ea8d100abc26f286"
+
+inherit cmake ptest
+
+CXXFLAGS:append:toolchain-clang = " -Wno-error=c2y-extensions"
+
+EXTRA_OECMAKE += "-DTOML11_PRECOMPILE=ON \
+                  -DTOML11_BUILD_TESTS=${@bb.utils.contains("PTEST_ENABLED", "1", "ON", "OFF", d)} \
+"
+
+ALLOW_EMPTY:${PN} = "1"
+
+do_install_ptest () {
+    install -d ${D}${PTEST_PATH}/tests
+    cp -r ${B}/tests/test_* ${D}${PTEST_PATH}/tests
+}
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.55.0


