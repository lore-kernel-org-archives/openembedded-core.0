Return-Path: <adam.duskett@amarulasolutions.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75C5CD2CE17
	for <webhook@archiver.kernel.org>; Wed, 10 Dec 2025 11:03:52 +0000 (UTC)
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13163.1765364625599147788
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Dec 2025 03:03:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@amarulasolutions.com header.s=google header.b=Yw0zA0Nl;
 spf=pass (domain: amarulasolutions.com, ip: 209.85.208.53, mailfrom: adam.duskett@amarulasolutions.com)
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-6415bc0cab2so933836a12.3
        for <openembedded-core@lists.openembedded.org>; Wed, 10 Dec 2025 03:03:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1765364624; x=1765969424; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zsqSbxo77XNoGSJXrabmstKROjJqGUQ72cb3wgjuVeY=;
        b=Yw0zA0NlOr5XGmOvEwm9igvrnj8TJ0aCK+XJCg6VV3jyuk8z/IYdH73+pAvgCCZiqg
         TPOg1cCEeZI4flIyA2bmwYPSW4S+aDmcSNEHvu7yfE5PJRTozDj++p3wIBnThwCxQ3tm
         NvgqtYabMwF5lqEKNqKu7itcDA4GEegG0jrn8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765364624; x=1765969424;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zsqSbxo77XNoGSJXrabmstKROjJqGUQ72cb3wgjuVeY=;
        b=Le6x31t6iBSHBVNJSoUpobEHQpl5dMg9uZSmcL0t0mvVcaDFYM1v6LuXSyYBD+tEp7
         W8Zw+2xrmQs16ianmwNQZRwOmyIT4Zp+W34dsTTS9GPvOfoYo4pARgx3jH4dE4r1GYaN
         5KoLJC0K8UbE3wC5dolTS5XCoxe+aaMWpP3N4UzlOteIbjtAt3TqzJMS/815OUOLO5Oq
         kdXXcUms4enErVe28uUtPDA8doB6eLn+ztE12DtJoJFuciF4sEKVJFAmj7ztTSz+7gN3
         75T+h/0O5Wte8zN5BjqEyVxxQJcjbU6LfZNZqbWMoLV49iQ3MHXaR8Y7qmuOeh2CBb7y
         1opQ==
X-Gm-Message-State: AOJu0YxBVL89A35A4VdOYiGuPeE9sQ6F6SkXcM9MgXquku3KfRRxm+PE
	y64ysDJWNF+NY3cl+l2as5jYpFN5XzcXg324iQIVbhyCjhxwFBBjR0ONBKS7jlbFa6Nsmj8q03k
	ERQ7n
X-Gm-Gg: AY/fxX4rR6qpg9OBp4y8XNGgZP7jqLMoR6CX6dxPfN8Db+V+EvIcHqX+rVn6XZONHWp
	L0EKTqdTLgQOhsENMP34Gfji7MrKHJ9IRwYXIMF7VxFPdUVcvUoQWeYmuDnACWiA6hF85zNZVJF
	LORn0Yz3+ZVlLufOXkUlwyUqMB/v1wlhzLrZn/T+0ZzhOJNm18EFfalvYvRGvBdajBhF+3INPgV
	MY6a8TMCoQxexfaT6IGh6dsAoJpMqNmejcl9Io2mjRn/4jDTihncJib7Wl9cbvqa/zOvhOq1Dpk
	kbGgCeTxuDKkto63jiVfFi1ML30X7PjWaQSAY69h4zrgJBUCI+bV0lSYem1FjQ7Cj0/brxvkAO2
	J0HyjyGucSsxi65VLnq6t2u88MGeeu0YgkGGEIVaBJHXb2WFJRvBsuuP89bgvqoDtopP76AbOql
	XpaQP7LjkUR4vpE7x9IoN7TCjYkhbkLXUMi4qSXRajuSFbXhUoLTdhaUa0wVGYiY/dnmMNgK7eN
	Xh+V4oTytvibd30D53PEHMTuFwAvAU32FNIWNi1zu/O52RxGiqz
X-Google-Smtp-Source: AGHT+IE5+EYadALhnMKbex4MypSuqpXm1vuGzZ+F4zVarotaosNIYQ6Tdk9nrm5srzRgwwuIJ6nkUA==
X-Received: by 2002:a05:6402:40c1:b0:647:a2eb:7640 with SMTP id 4fb4d7f45d1cf-6496db20da9mr1115052a12.8.1765364623966;
        Wed, 10 Dec 2025 03:03:43 -0800 (PST)
Received: from adam.arnhem.chello.nl (2001-1c00-8101-1200-3ddc-5bb8-0efa-16f1.cable.dynamic.v6.ziggo.nl. [2001:1c00:8101:1200:3ddc:5bb8:efa:16f1])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-647b2ec31a7sm16227636a12.2.2025.12.10.03.03.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Dec 2025 03:03:43 -0800 (PST)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: openembedded-core@lists.openembedded.org
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>
Subject: [PATCH 2/5] libtoml: new recipe
Date: Wed, 10 Dec 2025 12:03:37 +0100
Message-ID: <20251210110340.3631065-2-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251210110340.3631065-1-adam.duskett@amarulasolutions.com>
References: <20251210110340.3631065-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Dec 2025 11:03:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227467

DNF5 requires libtoml. As such, copy libtoml from
meta-openembedded to openembedded-core.

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
 .../0001-Remove-whitespace-in-operator.patch  | 46 +++++++++++++++++++
 .../libtoml11/files/run-ptest                 | 12 +++++
 .../libtoml11/libtoml11_4.4.0.bb              | 40 ++++++++++++++++
 3 files changed, 98 insertions(+)
 create mode 100644 meta/recipes-devtools/libtoml11/files/0001-Remove-whitespace-in-operator.patch
 create mode 100755 meta/recipes-devtools/libtoml11/files/run-ptest
 create mode 100644 meta/recipes-devtools/libtoml11/libtoml11_4.4.0.bb

diff --git a/meta/recipes-devtools/libtoml11/files/0001-Remove-whitespace-in-operator.patch b/meta/recipes-devtools/libtoml11/files/0001-Remove-whitespace-in-operator.patch
new file mode 100644
index 0000000000..c8c9922d55
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
+Upstream-Status: Submitted [https://github.com/ToruNiina/toml11/pull/285]
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
index 0000000000..9bc480aa7f
--- /dev/null
+++ b/meta/recipes-devtools/libtoml11/files/run-ptest
@@ -0,0 +1,12 @@
+#!/bin/sh
+
+cd tests
+for atest in test_* ; do
+    rm -rf tests.log
+    ./${atest} > tests.log 2>&1
+    if [ $? = 0 ] ; then
+        echo "PASS: ${atest}"
+    else
+        echo "FAIL: ${atest}"
+    fi
+done
diff --git a/meta/recipes-devtools/libtoml11/libtoml11_4.4.0.bb b/meta/recipes-devtools/libtoml11/libtoml11_4.4.0.bb
new file mode 100644
index 0000000000..b68e787e03
--- /dev/null
+++ b/meta/recipes-devtools/libtoml11/libtoml11_4.4.0.bb
@@ -0,0 +1,40 @@
+SUMMARY = "TOML for Modern C++"
+DESCRIPTION = "toml11 is a feature-rich TOML language library for \
+               C++11/14/17/20."
+
+HOMEPAGE = "https://github.com/ToruNiina/toml11"
+
+SECTION = "libs"
+
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=44d1fcf70c7aa6991533c38daf7befa3"
+
+PE = "1"
+
+SRCREV = "be08ba2be2a964edcdb3d3e3ea8d100abc26f286"
+SRCREV_json = "8c391e04fe4195d8be862c97f38cfe10e2a3472e"
+SRCREV_doctest = "ae7a13539fb71f270b87eb2e874fbac80bc8dda2"
+
+SRC_URI = "git://github.com/ToruNiina/toml11;branch=main;protocol=https \
+           git://github.com/nlohmann/json;destsuffix=${BB_GIT_DEFAULT_DESTSUFFIX}/tests/extlib/json;name=json;branch=develop;protocol=https \
+           git://github.com/doctest/doctest;destsuffix=${BB_GIT_DEFAULT_DESTSUFFIX}/tests/extlib/doctest;name=doctest;branch=master;protocol=https \
+           file://0001-Remove-whitespace-in-operator.patch \
+           file://run-ptest \
+"
+SRCREV_FORMAT = "json_doctest"
+
+
+inherit cmake ptest
+
+EXTRA_OECMAKE += "-DTOML11_PRECOMPILE=ON \
+                  -DTOML11_BUILD_TESTS=${@bb.utils.contains("DISTRO_FEATURES", "ptest", "ON", "OFF", d)} \
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
2.52.0


