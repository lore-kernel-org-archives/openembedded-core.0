Return-Path: <adam.duskett@amarulasolutions.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C721FB3CFD
	for <webhook@archiver.kernel.org>; Mon, 30 Mar 2026 09:58:59 +0000 (UTC)
Received: from mail-ej1-f67.google.com (mail-ej1-f67.google.com [209.85.218.67])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.47735.1774864734312078345
 for <openembedded-core@lists.openembedded.org>;
 Mon, 30 Mar 2026 02:58:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@amarulasolutions.com header.s=google header.b=o0l3v/IJ;
 spf=pass (domain: amarulasolutions.com, ip: 209.85.218.67, mailfrom: adam.duskett@amarulasolutions.com)
Received: by mail-ej1-f67.google.com with SMTP id a640c23a62f3a-b977165c465so63294266b.3
        for <openembedded-core@lists.openembedded.org>; Mon, 30 Mar 2026 02:58:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1774864733; x=1775469533; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/sTtqbeZbMjPZSH/9nVCt5tEt48zH3omv+N5HwcY210=;
        b=o0l3v/IJTLJnkYtIl1asYx//AgrWNG1Dyw/r/Mij+ytj0yvhwfXHUj9HKQpry/L4tv
         e8mjjsWalr+CPlTF30bPAtJlOTJK/Owp2BJ/+PmB4dtLwHplSQh8ow/7hS9tg4rOEHvD
         +FKm5IzmtPE1RpGKQfXGZc0pT/27PQNfYlwfk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774864733; x=1775469533;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/sTtqbeZbMjPZSH/9nVCt5tEt48zH3omv+N5HwcY210=;
        b=TdmAf5b7mfFP8ajBwds1Ewe5KxRdrhKiEMMUtdrSmJPKJvOW5GwUyLFGeBfXUNwO6Y
         0Pg+gh2G+wJ/YAQAi8v35CEa9c2OMKsnHtbIIHdW9aSRR8kfx8go0buCk+vUUDbFUJbz
         ySpnMAwFfruGKLfZoduMJBQip3mh8/5SIoUFwf2NKqcfN3PntPp9bfvXUmMZ/CPq0/p+
         najbNt0oi70UfRzbr2/z0a2juFiSGidc18sJMmqpmXRMsqKBGIIvWV0lsefdIepZ0oJq
         KjhSSLorCKxBm1iAKHpTmDJ3+wVUhFdVUVknhXQLEg8TtgpDXKAig9lXOEjaHALArTNS
         qzvg==
X-Gm-Message-State: AOJu0YzTR05SRz4nn6zNoCALkUsPusSAWW6kX75Hf3TTvudOzgtqOQOT
	RRBQD0zD1MvqGCZ550LKG449h1mvtOxyzqGWGKsNp09viPgTx9f1jt6vSTBA0nS0hUI+/GyR58f
	03Froe4utrg==
X-Gm-Gg: ATEYQzyhgisQgabABcupkjL0C9zC39qGKwtZa3dM+lt9LogpwJT8InAiLDsfbva/Qub
	JjMW4nI2huAD3i/W8/AU6RZlz2cIjR4UQ+kYyoEKRnRVxKIqW/hWbDvk8dFmbVwoxp5FiVYbmLl
	hPgKBrSrsbhjM+zejF/CNVmvaKUxGeVxlzxUawlIFIXhu6sj29OiTkElz5Th/9yJBjrADfOKjwp
	waT4SIiHliFi2w5pI9G7hBbbYQhG8VZdKJwtJrvm5GsBLtntQUMR6cDNCryy4Fy3Mrut0H9NBj1
	0e+MpZnXVBGKuM48AqGqAB9BpJHJ1ZAHhcpoV9Hx9WvDjVupzKR5QLpSh+dn723mi9c5cqtoirU
	RFSPR8Oop0nziFNywDZTlVydkfzyt2U/3xkQYzXczE4yG/o8dBG50XUdE17g4GBa5CYUk46uKVL
	dAi6fKtq1UxucZ0oD+oIoPBupRPn9qbFZNe4tzGDBxIuShUx6UGanv07izzlRKHIjPGdDIeySQ5
	0sG3mMprt4i/qJh088065JE//59aZk6beVsgQXEqlWWva8rJYboXuLfli+GiW7kLw==
X-Received: by 2002:a17:907:608d:b0:b94:5c6c:cb88 with SMTP id a640c23a62f3a-b9b50b10101mr265159766b.7.1774864732487;
        Mon, 30 Mar 2026 02:58:52 -0700 (PDT)
Received: from adam.arnhem.chello.nl (2001-1c00-8183-9900-1333-c39e-a751-6a95.cable.dynamic.v6.ziggo.nl. [2001:1c00:8183:9900:1333:c39e:a751:6a95])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9b7ae23f0dsm272839366b.11.2026.03.30.02.58.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 02:58:51 -0700 (PDT)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: openembedded-core@lists.openembedded.org
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>
Subject: [PATCH v7 2/6] libtoml11: new recipe
Date: Mon, 30 Mar 2026 11:58:45 +0200
Message-ID: <20260330095849.119621-2-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260330095849.119621-1-adam.duskett@amarulasolutions.com>
References: <20260330095849.119621-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 30 Mar 2026 09:58:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234215

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


