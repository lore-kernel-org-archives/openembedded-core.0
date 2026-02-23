Return-Path: <adam.duskett@amarulasolutions.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62E40E7BDA2
	for <webhook@archiver.kernel.org>; Mon, 23 Feb 2026 15:39:36 +0000 (UTC)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.37944.1771861174129028882
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Feb 2026 07:39:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@amarulasolutions.com header.s=google header.b=Xdb7f3qX;
 spf=pass (domain: amarulasolutions.com, ip: 209.85.218.54, mailfrom: adam.duskett@amarulasolutions.com)
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-b8dd0168b90so69911766b.0
        for <openembedded-core@lists.openembedded.org>; Mon, 23 Feb 2026 07:39:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1771861172; x=1772465972; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GfgoIg7N9TW3MJu/8LLyzMQz+3nbJqvUQXDbORYVfBI=;
        b=Xdb7f3qXZdSsnDTxOd+Kqmg4Z03lJdE3S1Xq+ftVbfj28FUtLPmzBSbLiEeStyZ2h/
         07rTq5x7d67xdmje3gEj0xy7tvQ08MiK7PW0LHPmcu7NO0SVcV6MrMDZkCwhG6BhqvPy
         cVEZ1ZK4PHiH8Aeufg0E+W5Tb3xTye7RtqjXY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771861172; x=1772465972;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GfgoIg7N9TW3MJu/8LLyzMQz+3nbJqvUQXDbORYVfBI=;
        b=B+mU/5aJyIoBxwB9MpAgU/do8y4QzxXhaN4xoq+oiys28XP3sMbdYSeTjvccv5CcKm
         UFpEDPCOBOsOZUmAoR5jVBPL3P8PFF2SdJcvpydjXkJ+1y0w/rE6r2hVj4/54hMLcnVP
         BDrSNGJ4HeSlVIXlNt4wyt4z9AuZnFM3SqyLNuBEEAGSMyoZkJnJa7UWH0dwtIP5lVJX
         Udm6DuuW3Qmx8gNibXnh6n3Me7KSpCY6DAG2fBgOG2CioL4Q/5CjaU+MjsFU3fMv28nl
         voN07ODR0QzNPUHCPgdwsnw/OnKMOoe+zUQ42JFF0lAw1oQImXSM72FKX9YuozJyGt/l
         wmeQ==
X-Gm-Message-State: AOJu0Yy+FZxIUX+lLnr6NqANmv/UsbOaXJ6Xli3z5gDPmAVxqWDsaB9N
	HL+cSRKWoOU0xaKs9vQ4gXhpxI4ak15GJZ84wMgoQ/T/HJjr98D1JrnN5K+Stsfk/wNTj0VOVLr
	cYc09Xss=
X-Gm-Gg: AZuq6aIgqd7OMKLdiJvZlLT0QeAX165ReYygFD6RGuaDgu9P4SEf3Ja9wKvOqgBsufC
	IgvjwUIOvT1CNkEpflC+qqjjyao6gJd49Oo18vEiepdiE7x6vs7JhSvmFJrNlUaHpql0uMtwxHK
	/7owZhM3GGphEsfE0UuLp1Jx9jK7GbboydwAM6CBBDamWaotxJXm5U8sWtMHwbjjm3539RnofXd
	ZbJStm7j6jlT1Q9XiEsZwvC5Hlx6T7XT7R2tcwOoAxAU2kjIWtN0XyewInh7MERYQnr6V2dYcpQ
	5fsYUU2yGWXb7i+cIRnfDfdqsPI90mg/ee6JRpQ6Thwu+mMb+OIsm9MzCTJJLBXbKDyPACiM7PB
	YHJLJK4e3yCfpPxsUYPSI3RvmYo2tX2tVBuXFHtWviVQxQk7bA2aubpNHVkGi3caLhVGfXWZgKu
	+Lgcl3yKMkSQ68vZEBtLGDtdH5o8EEbCg1YO0t8FFSCsKgpBytsutYIx3x0BlnN8eCgCFGuKkDT
	mPQNuMu+es3Cn75PSGuCp8YVXIjcZHPSZ/J3gVzgI95czB7aCnoWHn2q3khuAG6678nAQ==
X-Received: by 2002:a17:907:3f18:b0:b87:3087:54f0 with SMTP id a640c23a62f3a-b9081b449d0mr304857066b.3.1771861172396;
        Mon, 23 Feb 2026 07:39:32 -0800 (PST)
Received: from adam.amarulasolutions.com (2001-1c00-8101-1200-3ddc-5bb8-0efa-16f1.cable.dynamic.v6.ziggo.nl. [2001:1c00:8101:1200:3ddc:5bb8:efa:16f1])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b90ba281d69sm33643666b.28.2026.02.23.07.39.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 07:39:32 -0800 (PST)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: openembedded-core@lists.openembedded.org
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>
Subject: [PATCH v5 3/8] libtoml11: new recipe
Date: Mon, 23 Feb 2026 16:39:24 +0100
Message-ID: <20260223153929.2641007-3-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260223153929.2641007-1-adam.duskett@amarulasolutions.com>
References: <20260223153929.2641007-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 23 Feb 2026 15:39:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231675

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
index b5ab35d92a..25edb6eae2 100644
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
index 1bb7458fc9..fd301f03e0 100644
--- a/meta/conf/distro/include/ptest-packagelists.inc
+++ b/meta/conf/distro/include/ptest-packagelists.inc
@@ -46,6 +46,7 @@ PTESTS_FAST = "\
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


