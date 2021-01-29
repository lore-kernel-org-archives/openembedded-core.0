Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
 by mx.groups.io with SMTP id smtpd.web11.7462.1611915865242513213
 for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Jan 2021 02:24:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=YToV7wgd;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.218.50, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-ej1-f50.google.com with SMTP id gx5so12197657ejb.7
        for <openembedded-core@lists.openembedded.org>; Fri, 29 Jan 2021 02:24:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=lOoDvjWLpggte2klKANMAJZbB83hkWW/dkmU5IcsTA4=;
        b=YToV7wgdY63a5/FI6/qdCEwV/L/9LmSjvy429yHuOAoNBeymFWGotYRU1QsCUDEntI
         yoZ1vkpaPDux3RFOYErej2zM2BnaqGECsyQOjnBrqDX/i5vtgnZxZpXWvBfteM1+T5yQ
         KXmSmMzSMXQTUiS3b49lCvlYEEsIrLHi3cxPs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=lOoDvjWLpggte2klKANMAJZbB83hkWW/dkmU5IcsTA4=;
        b=N838Dxzr1oDz4tmDQvN4EsElt+BArDFwRJ/FDlF6U02k4/9qlSy38yYYLooPuxcEr0
         yZ7+8NKdn18VhkfHYkwzQT4qfv91FuK0AdKwbYQ+vXGnFAXEe+Zfp+iNUTr8HLF43rdt
         i4vGX31CVbPX0qCcwVCPefxPbYa0sYdlLd5dI35GEMGP2Na5YGSWhaqfAEFOhewoa6hF
         2F2QuvNHfy21mx7KiXJzsVjISD8tpBA4L7xrDzjziC+03TMV9xNVkoWEQUTpH0U2S15a
         9CORnn652mmrZN2m7ZwxuE9J9D/PEzayig54coNCZbnjtOkEQybw0pzHZcq/bw7DloGL
         d2VQ==
X-Gm-Message-State: AOAM530ggVE+v08uvl1KVisr4DQVRVPIxWlMh8yPdCSkHmEtsjGTo9Vv
	WVBw0yieAqoBZoymTnb4lhoz3U77onwOJg==
X-Google-Smtp-Source: ABdhPJxoSmlTJmgXl660BigWZnfFvZMO86YNdCgS5ZJyzU2Oh8pH9oDqaqwSvLm1KIpfwK+yiiZdzw==
X-Received: by 2002:a17:906:dbf2:: with SMTP id yd18mr3800059ejb.45.1611915863551;
        Fri, 29 Jan 2021 02:24:23 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:93ef:509c:4f16:14ff])
        by smtp.gmail.com with ESMTPSA id k22sm3554574eji.101.2021.01.29.02.24.23
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Jan 2021 02:24:23 -0800 (PST)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 06/13] meta: Clean up various class-native* RDEPENDS overrides
Date: Fri, 29 Jan 2021 10:24:12 +0000
Message-Id: <20210129102419.1360572-6-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210129102419.1360572-1-richard.purdie@linuxfoundation.org>
References: <20210129102419.1360572-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

With PACKAGES functioning more correctly for native recipes combined
with classextend improvements over the years, there are various overrides
of RDEPENDS which look unecessary now, clean them up.

There some some minor changes in dependencies, specifically:

"python3-numpy-native.do_populate_sysroot" -> "python3-native.do_populate_sysroot"
"python3-mako-native.do_populate_sysroot" -> "python3-native.do_populate_sysroot"
"itstool-native.do_populate_sysroot" -> "libxml2-native.do_populate_sysroot"

however there are already:

XXX-native.do_prepare_recipe_ssysroot -> YYY-native.do_populate_sysroot

mappings from DEPENDS so this is effectively a null op.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-core/dbus/dbus_1.12.20.bb        |  2 --
 meta/recipes-devtools/autoconf/autoconf.inc   | 29 +------------------
 .../automake/automake_1.16.2.bb               |  1 -
 .../python-numpy/python3-numpy_1.19.5.bb      |  2 --
 .../python/python3-mako_1.1.4.bb              |  2 --
 meta/recipes-devtools/tcltk/tcl_8.6.11.bb     |  1 -
 .../perl/libtimedate-perl_2.30.bb             |  1 -
 meta/recipes-support/itstool/itstool_2.0.6.bb |  1 -
 8 files changed, 1 insertion(+), 38 deletions(-)

diff --git a/meta/recipes-core/dbus/dbus_1.12.20.bb b/meta/recipes-core/dbus/dbus_1.12.20.bb
index 09049301cc7..32e7d9cfa38 100644
--- a/meta/recipes-core/dbus/dbus_1.12.20.bb
+++ b/meta/recipes-core/dbus/dbus_1.12.20.bb
@@ -6,8 +6,6 @@ SECTION = "base"
 require dbus.inc
 
 DEPENDS = "expat virtual/libintl autoconf-archive"
-RDEPENDS_dbus_class-native = ""
-RDEPENDS_dbus_class-nativesdk = ""
 PACKAGES += "${@bb.utils.contains('DISTRO_FEATURES', 'ptest', '${PN}-ptest', '', d)}"
 ALLOW_EMPTY_dbus-ptest = "1"
 RDEPENDS_dbus-ptest_class-target = "dbus-test-ptest"
diff --git a/meta/recipes-devtools/autoconf/autoconf.inc b/meta/recipes-devtools/autoconf/autoconf.inc
index 868e1c8256d..03e4ca8a3ed 100644
--- a/meta/recipes-devtools/autoconf/autoconf.inc
+++ b/meta/recipes-devtools/autoconf/autoconf.inc
@@ -34,34 +34,7 @@ RDEPENDS_${PN} = "m4 gnu-config \
 		  perl-module-thread-queue \
 		  perl-module-threads \
 		 "
-RDEPENDS_${PN}_class-native = "m4-native gnu-config-native"
-RDEPENDS_${PN}_class-nativesdk = "\
-		  nativesdk-gnu-config \
-		  nativesdk-m4 \
-		  nativesdk-perl \
-		  nativesdk-perl-module-bytes \
-		  nativesdk-perl-module-carp \
-		  nativesdk-perl-module-constant \
-		  nativesdk-perl-module-data-dumper \
-		  nativesdk-perl-module-errno \
-		  nativesdk-perl-module-exporter \
-		  nativesdk-perl-module-file-basename \
-		  nativesdk-perl-module-file-compare \
-		  nativesdk-perl-module-file-copy \
-		  nativesdk-perl-module-file-find \
-		  nativesdk-perl-module-file-glob \
-		  nativesdk-perl-module-file-path \
-		  nativesdk-perl-module-file-spec \
-		  nativesdk-perl-module-file-spec-unix \
-		  nativesdk-perl-module-file-stat \
-		  nativesdk-perl-module-getopt-long \
-		  nativesdk-perl-module-io-file \
-		  nativesdk-perl-module-overloading \
-		  nativesdk-perl-module-posix \
-		  nativesdk-perl-module-symbol \
-		  nativesdk-perl-module-thread-queue \
-		  nativesdk-perl-module-threads \
-                  "
+RDEPENDS_${PN}_class-native = "m4-native gnu-config-native hostperl-runtime-native"
 
 inherit autotools texinfo
 
diff --git a/meta/recipes-devtools/automake/automake_1.16.2.bb b/meta/recipes-devtools/automake/automake_1.16.2.bb
index fd8ed0ed3b8..08ec0346263 100644
--- a/meta/recipes-devtools/automake/automake_1.16.2.bb
+++ b/meta/recipes-devtools/automake/automake_1.16.2.bb
@@ -17,7 +17,6 @@ RDEPENDS_${PN} += "\
     perl-module-vars "
 
 RDEPENDS_${PN}_class-native = "autoconf-native hostperl-runtime-native"
-RDEPENDS_${PN}_class-nativesdk = "nativesdk-autoconf"
 
 SRC_URI += "file://python-libdir.patch \
             file://buildtest.patch \
diff --git a/meta/recipes-devtools/python-numpy/python3-numpy_1.19.5.bb b/meta/recipes-devtools/python-numpy/python3-numpy_1.19.5.bb
index 5037d2a4221..b619bf6f32a 100644
--- a/meta/recipes-devtools/python-numpy/python3-numpy_1.19.5.bb
+++ b/meta/recipes-devtools/python-numpy/python3-numpy_1.19.5.bb
@@ -53,6 +53,4 @@ RDEPENDS_${PN}-ptest += "${PYTHON_PN}-pytest \
                          ldd \
 "
 
-RDEPENDS_${PN}_class-native = ""
-
 BBCLASSEXTEND = "native nativesdk"
diff --git a/meta/recipes-devtools/python/python3-mako_1.1.4.bb b/meta/recipes-devtools/python/python3-mako_1.1.4.bb
index 531fc6a3c0e..1645f37da44 100644
--- a/meta/recipes-devtools/python/python3-mako_1.1.4.bb
+++ b/meta/recipes-devtools/python/python3-mako_1.1.4.bb
@@ -15,6 +15,4 @@ RDEPENDS_${PN} = "${PYTHON_PN}-html \
                   ${PYTHON_PN}-threading \
 "
 
-RDEPENDS_${PN}_class-native = ""
-
 BBCLASSEXTEND = "native nativesdk"
diff --git a/meta/recipes-devtools/tcltk/tcl_8.6.11.bb b/meta/recipes-devtools/tcltk/tcl_8.6.11.bb
index 74bdb098c6f..d0112020813 100644
--- a/meta/recipes-devtools/tcltk/tcl_8.6.11.bb
+++ b/meta/recipes-devtools/tcltk/tcl_8.6.11.bb
@@ -69,7 +69,6 @@ ALTERNATIVE_LINK_NAME[Thread.3] = "${mandir}/man3/Thread.3"
 
 # isn't getting picked up by shlibs code
 RDEPENDS_${PN} += "tcl-lib"
-RDEPENDS_${PN}_class-native = ""
 RDEPENDS_${PN}-ptest += "libgcc"
 
 BBCLASSEXTEND = "native nativesdk"
diff --git a/meta/recipes-extended/perl/libtimedate-perl_2.30.bb b/meta/recipes-extended/perl/libtimedate-perl_2.30.bb
index 7219c7d11eb..d42eadb586e 100644
--- a/meta/recipes-extended/perl/libtimedate-perl_2.30.bb
+++ b/meta/recipes-extended/perl/libtimedate-perl_2.30.bb
@@ -13,7 +13,6 @@ inherit cpan ptest-perl
 
 BBCLASSEXTEND = "native"
 
-RDEPENDS_${PN}_class-native = ""
 RDEPENDS_${PN} += "perl-module-carp perl-module-exporter perl-module-strict perl-module-time-local"
 RDEPENDS_${PN}-ptest += "perl-module-test-more perl-module-utf8"
 
diff --git a/meta/recipes-support/itstool/itstool_2.0.6.bb b/meta/recipes-support/itstool/itstool_2.0.6.bb
index 5f358f463d0..c52aa7941a3 100644
--- a/meta/recipes-support/itstool/itstool_2.0.6.bb
+++ b/meta/recipes-support/itstool/itstool_2.0.6.bb
@@ -18,4 +18,3 @@ SRC_URI[sha256sum] = "6233cc22726a9a5a83664bf67d1af79549a298c23185d926c3677afa91
 BBCLASSEXTEND = "native nativesdk"
 
 RDEPENDS_${PN} += "libxml2-python"
-RDEPENDS_${PN}_class-native = ""
-- 
2.27.0

