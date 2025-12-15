Return-Path: <adam.duskett@amarulasolutions.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4202DD5B174
	for <webhook@archiver.kernel.org>; Mon, 15 Dec 2025 10:20:54 +0000 (UTC)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.45414.1765794045941081399
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Dec 2025 02:20:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@amarulasolutions.com header.s=google header.b=KwgSrzk/;
 spf=pass (domain: amarulasolutions.com, ip: 209.85.218.46, mailfrom: adam.duskett@amarulasolutions.com)
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-b79f698aa91so58779266b.1
        for <openembedded-core@lists.openembedded.org>; Mon, 15 Dec 2025 02:20:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1765794044; x=1766398844; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6zk6gwaQfzuC7Z8mPtylj14JajUNqVWdxX4jr1MbhPI=;
        b=KwgSrzk/Jj+IJpma2ilWH9GxiLb3pd/aVovWTjA5+G7km9Y4RmvJBLINJ0aIHitPKm
         7uROC3z6R5u6pRoqf8aodlwTQxUqWPe8hoKIg8dnCKEDi9ntqfSe8MLYny4XJklPygmf
         ft8n2KfnuUNa5NQ4v8NjhYdH3Q5EDO/BdLLWs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765794044; x=1766398844;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6zk6gwaQfzuC7Z8mPtylj14JajUNqVWdxX4jr1MbhPI=;
        b=WtQNZG247Ryvw0zbdUETq/0pwE+ndPfa4uauJ7yjM9QUhd0pgCJ64nF+II9K5fipxs
         n0SjviN9WoWR2t2Rv0lVwqd+aoIwgbJdZysyVWWYosDzt/g9fNLX1+s1cDbtpsLhB9Te
         /m9n1TzvIVksYRH8IxL5uvrcAnaZAPaVEOUBJ5t+Wx56p9SSseJ+R8kTadeP4JQ7YKb5
         gZKeLhkBKXfF9mTc9j7L7WzIbsdyefIdkjFhQR7zTMWAiXeJpK6KXcSRSwVOniqoODwp
         SsJU5zpbx0kHvUZALKHRLPqHBJD7WHt9/I8gCve+qSFpbBnk8iwqvigPrOz6eWL+je2Z
         xueQ==
X-Gm-Message-State: AOJu0YwEcM/7bj2o/kFb6rE30KLewquIFDjCWabrxtEshFc6SztyzpI8
	cMHITyiO7ZxRNVZqKiOAtK086co/JK3cdW7d7zefp+GvwhS9R3SPrqdCqTY7w0I8NxfMbsBdeBA
	QJ92y
X-Gm-Gg: AY/fxX7FiO08BsJWF5KvGiPv4+SVmgrQ8YRC73EjrytUEknvV0V8cqXdvntfZtwi+Ef
	5ourKWORf1vxMfnasc4YJXx6sed6yN9BPKv8def02Td+u3BoEybcPpaEyZb1VdDjgQkSmxttNBl
	sTQxrXo88ffl2fOjv4ql3EnXHeOW7AC/ikMaHowCFXhlMgw73IKp0vJ7w0KPstIyiPYcXPelBHn
	ejuLBjVf/t9vE3FofcZ9Vm/YcXIRhdBHB6cySgiotl845Ok7SKb6QvZqoqzIwt+FjXoBmaePZMF
	vqkqDBWbRhaUXieELI5Jki/oVv7H2sayIwqg8f40ltNhKjwIB05sViyxtiwhZCVCJ8u2+y+4qn0
	uLjCeQKwJHOUsnVgoZykDsLBoiXJDgqAZee+AGHzIjXvKBw3Czs1ab/EoovSYu+V0D9LOKPRXaG
	qUpgn9iQgMuc47E1bPvSDns2KnjWqCwJr1KA/dQEgAmW5yG/hpyPy2LGeR4vi/Si/NCHmqLhwUu
	cibVB3s0mIwPSJu8gJNG9aJPosGfT/d25Tg3SBqhTCJ2rJptH53/rwFJA==
X-Google-Smtp-Source: AGHT+IGT3twZanZHX1M/ujPbt3llR4I9Hl0LDBMdGNFHlanSczbSU++xNwDqrlPvP2AVdZ3rRx8DgQ==
X-Received: by 2002:a17:907:72c8:b0:b79:fb42:111c with SMTP id a640c23a62f3a-b7d235afc32mr681374066b.1.1765794044294;
        Mon, 15 Dec 2025 02:20:44 -0800 (PST)
Received: from adam.amarulasolutions.com (2001-1c00-8101-1200-3ddc-5bb8-0efa-16f1.cable.dynamic.v6.ziggo.nl. [2001:1c00:8101:1200:3ddc:5bb8:efa:16f1])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b7cfa51757asm1357193566b.45.2025.12.15.02.20.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Dec 2025 02:20:43 -0800 (PST)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: openembedded-core@lists.openembedded.org
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>
Subject: [PATCH v4 2/7] libtoml: new recipe
Date: Mon, 15 Dec 2025 11:20:36 +0100
Message-ID: <20251215102041.1630567-2-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251215102041.1630567-1-adam.duskett@amarulasolutions.com>
References: <20251215102041.1630567-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Dec 2025 10:20:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227718

DNF5 requires libtoml. As such, copy libtoml verbatim from
meta-openembedded to openembedded-core.

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
 meta/conf/distro/include/maintainers.inc      |  1 +
 .../distro/include/ptest-packagelists.inc     |  1 +
 .../0001-Remove-whitespace-in-operator.patch  | 46 +++++++++++++++++++
 .../libtoml11/files/run-ptest                 | 12 +++++
 .../libtoml11/libtoml11_4.4.0.bb              | 38 +++++++++++++++
 5 files changed, 98 insertions(+)
 create mode 100644 meta/recipes-devtools/libtoml11/files/0001-Remove-whitespace-in-operator.patch
 create mode 100755 meta/recipes-devtools/libtoml11/files/run-ptest
 create mode 100644 meta/recipes-devtools/libtoml11/libtoml11_4.4.0.bb

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index 8971b9b552..da642ac3c5 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -405,6 +405,7 @@ RECIPE_MAINTAINER:pn-libsoup = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-libssh2 = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-libssp-nonshared = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-libtasn1 = "Unassigned <unassigned@yoctoproject.org>"
+RECIPE_MAINTAINER:pn-libtoml11 = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-libtest-fatal-perl = "Tim Orling <tim.orling@konsulko.com>"
 RECIPE_MAINTAINER:pn-libtest-needs-perl = "Tim Orling <tim.orling@konsulko.com>"
 RECIPE_MAINTAINER:pn-libtest-warnings-perl = "Tim Orling <tim.orling@konsulko.com>"
diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/conf/distro/include/ptest-packagelists.inc
index 09613294d6..ec0e2d1637 100644
--- a/meta/conf/distro/include/ptest-packagelists.inc
+++ b/meta/conf/distro/include/ptest-packagelists.inc
@@ -40,6 +40,7 @@ PTESTS_FAST = "\
     libtest-needs-perl \
     libtest-warnings-perl \
     libtimedate-perl \
+    libtoml11 \
     libtry-tiny-perl \
     libusb1 \
     libxml-namespacesupport-perl \
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
index 0000000000..38786b79ed
--- /dev/null
+++ b/meta/recipes-devtools/libtoml11/libtoml11_4.4.0.bb
@@ -0,0 +1,38 @@
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
-- 
2.52.0


