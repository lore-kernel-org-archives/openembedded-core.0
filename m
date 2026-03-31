Return-Path: <adam.duskett@amarulasolutions.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B56241061B21
	for <webhook@archiver.kernel.org>; Tue, 31 Mar 2026 09:57:29 +0000 (UTC)
Received: from mail-ed1-f68.google.com (mail-ed1-f68.google.com [209.85.208.68])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16609.1774951039986516600
 for <openembedded-core@lists.openembedded.org>;
 Tue, 31 Mar 2026 02:57:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@amarulasolutions.com header.s=google header.b=luFv+kyF;
 spf=pass (domain: amarulasolutions.com, ip: 209.85.208.68, mailfrom: adam.duskett@amarulasolutions.com)
Received: by mail-ed1-f68.google.com with SMTP id 4fb4d7f45d1cf-66ba5eb2f4aso217867a12.1
        for <openembedded-core@lists.openembedded.org>; Tue, 31 Mar 2026 02:57:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1774951038; x=1775555838; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/sTtqbeZbMjPZSH/9nVCt5tEt48zH3omv+N5HwcY210=;
        b=luFv+kyFNJ2fIMXGHW5smSQy3uczh1QK96y7+DGgY/pe26yOM3gI74s7jfBW5kVEPf
         EwFE/0DIg0j+6ScGfKpdhpAj2jYn1xg4V9DIWE3yUCKfwPa9Y8QWoDvqLjuGW+Nt0Pp1
         Jadnx32tbr3zrE+Ms0EaablYU7FIdrLWCqCVE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774951038; x=1775555838;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/sTtqbeZbMjPZSH/9nVCt5tEt48zH3omv+N5HwcY210=;
        b=ev/YNgMmmW0iDI0KcYC82KMK8zGfqCMBlj9uF+4NyEmG0EiTGg+NiX4pMTOGnvtNIR
         BcGShPhy9YJ4qFqE1T6WiV8G0wtPjfCq5ygpI/tLtFubSrumKl/zb6W4n9mm0c76vUzS
         KxFYyy4ubc3260gw5RzUoLfe3wFb/QZlwXWpGhEKbVpcSGqnSneYTNE/wc3tT0DVd0vv
         RTFYdDJBgbrezkogscKEW/NlOJ1JGEFXS4bv5GyCx2dhCsUFR4nCSjOYRYn9iOWQ7AAF
         NH1L4l7XQrkUP2RlA8Y+YLL5iwajWZruL0yCPv00Wdo1LSxiYTRD0BTth8B95SFlRtq8
         Dv5A==
X-Gm-Message-State: AOJu0YxlSZQEpIdVy0jmeISvxqf88KwZvNL1cHK1h2/ciS632212uebk
	TWG9BGVfMlCC0x2Owv/UIhWDQlf1chQtS3WbibE+/g4TEei975HioeJ/BQF+vqDuv05AFF9gjFM
	AAcH1jtZYzg==
X-Gm-Gg: ATEYQzz6uhyDGc54V1z4e1C4N7hBnbm/uRsf0amExgjvUyPtj/eCLbPGFi5yBXaLinZ
	pF9SsH1vurXeZAoepWl61Imb9UFwzufDZvRk2dcFTZjil5RxFbPA+FqDfqeW86B6Nn5NPDEK6pw
	mvNsXO2yOIBycD92ixYvzlqVlqv4GwUJk0JXa70O/Xe1rLzq3zMFawegj3j8y3ukzacMtaWYUd6
	aUpj4y7NiUfIFdt3+MVq7cxwIhoTD8hr2vnWrVgCMG12PZ3MwS2oiWi4FX7oh2u+wL70eF0rdqh
	S4+36F0LZMizsKUvK+osrf5flaKinLt4HpgxZ0mQOHoWXNL4n9F9Kqqs+HXpZknSOMb5dJdC0gu
	IGYLApI0IxLQuHKS5ZMs/KCA5EaA7zlLIwz/hVqQDlFyYWxOcU3mi0elSXw1Ze4UDOsuIm6kOPg
	mNrBei61rvDPfB3vNiRi/FOIHaiL7nxPXLUO35Wwiae7E1gvwwenPqpucWbCa2LfrVgueu2cEQC
	ouuwgFHHKo=
X-Received: by 2002:a05:6402:3595:b0:66b:3e6c:4772 with SMTP id 4fb4d7f45d1cf-66b3e6c47cbmr4244643a12.3.1774951037494;
        Tue, 31 Mar 2026 02:57:17 -0700 (PDT)
Received: from adam.ipgroup.local (212-57-59-66.xdsl.deanconnect.nl. [212.57.59.66])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-66b7607a653sm3413599a12.24.2026.03.31.02.57.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 02:57:16 -0700 (PDT)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: openembedded-core@lists.openembedded.org
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>
Subject: [PATCH v8 2/7] libtoml11: new recipe
Date: Tue, 31 Mar 2026 11:57:08 +0200
Message-ID: <20260331095714.1285106-2-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260331095714.1285106-1-adam.duskett@amarulasolutions.com>
References: <20260331095714.1285106-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 31 Mar 2026 09:57:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234275

DNF5 requires libtoml. As such, copy libtoml verbatim from
meta-openembedded to openembedded-core.

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
 meta/conf/distro/include/maintainers.inc      |  1 +
 .../distro/include/ptest-packagelists.inc     |  1 +
 .../0001-Remove-whitespace-in-operator.patch  | 46 +++++++++++++++++++
 .../libtoml11/files/run-ptest                 | 13 ++++++
 .../libtoml11/libtoml11_4.4.0.bb              | 36 +++++++++++++++
 5 files changed, 97 insertions(+)
 create mode 100644 meta/recipes-devtools/libtoml11/files/0001-Remove-whitespace-in-operator.patch
 create mode 100755 meta/recipes-devtools/libtoml11/files/run-ptest
 create mode 100644 meta/recipes-devtools/libtoml11/libtoml11_4.4.0.bb

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index 9acf2da0a6..0ff519d54e 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -410,6 +410,7 @@ RECIPE_MAINTAINER:pn-libtest-fatal-perl = "Tim Orling <tim.orling@konsulko.com>"
 RECIPE_MAINTAINER:pn-libtest-needs-perl = "Tim Orling <tim.orling@konsulko.com>"
 RECIPE_MAINTAINER:pn-libtest-warnings-perl = "Tim Orling <tim.orling@konsulko.com>"
 RECIPE_MAINTAINER:pn-libtheora = "Unassigned <unassigned@yoctoproject.org>"
+RECIPE_MAINTAINER:pn-libtoml11 = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-libtimedate-perl = "Tim Orling <tim.orling@konsulko.com>"
 RECIPE_MAINTAINER:pn-libtirpc = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-libtool = "Robert Yang <liezhi.yang@windriver.com>"
diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/conf/distro/include/ptest-packagelists.inc
index 31fd5ae7ce..9bf0db0be3 100644
--- a/meta/conf/distro/include/ptest-packagelists.inc
+++ b/meta/conf/distro/include/ptest-packagelists.inc
@@ -47,6 +47,7 @@ PTESTS_FAST = "\
     libtest-needs-perl \
     libtest-warnings-perl \
     libtimedate-perl \
+    libtoml11 \
     libtry-tiny-perl \
     libusb1 \
     libxml-namespacesupport-perl \
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
index 0000000000..7e097e4612
--- /dev/null
+++ b/meta/recipes-devtools/libtoml11/libtoml11_4.4.0.bb
@@ -0,0 +1,36 @@
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
+    file://run-ptest \
+"
+SRCREV = "be08ba2be2a964edcdb3d3e3ea8d100abc26f286"
+
+inherit cmake ptest
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
2.53.0


