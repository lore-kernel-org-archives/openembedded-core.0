Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web12.26680.1613945841399151852
 for <openembedded-core@lists.openembedded.org>;
 Sun, 21 Feb 2021 14:17:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=DMEG3bqX;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.42, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f42.google.com with SMTP id i9so1866136wml.5
        for <openembedded-core@lists.openembedded.org>; Sun, 21 Feb 2021 14:17:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=IC7ZmXQYTUN8+AvKQTpqi604uBsgCI+hvPndE3VAem0=;
        b=DMEG3bqXrYhvlwfbW8dxU+1rRXZLXlCv0lDEOm/OC6wWz+dEM9AivKmKgybAwgwfHi
         0J96i1qE6m0b+3NeW6UCSUKiZkt/ZamH77tD5RzP3du/o3+4fxgRudqL+q8rO2dojspw
         NGTbH4IyFUtT8Ote3SdW3avjgvIVFtyvchlrk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=IC7ZmXQYTUN8+AvKQTpqi604uBsgCI+hvPndE3VAem0=;
        b=egTSKRHqGb9QT/cJjrdsiIIRI0I8hwYCSshDoxfUrbeLiPxeBCtEqLn3z3IG8qDGpx
         QXgTdswTGy9VmqfVtAX7raf8oUIGbGYvYOXUf0dokNjeILlC061WtyRa5lv9borZj2jU
         FPQosz/EOb+66UI4gMoG6gDpwzKDWqkjLPGYa6H+u2iRJg0mFD2XLSHX8ot4JHLFh5DK
         ZYlGyxY4BkIEo7ZHHIcSAG/+zGHfKuGu3vFQdc/PZlKJWA1wX/1qjY8pp/t5Iat0J8Xc
         Owf3xxUnjze560yIo3ZHJWMRMIov1UIogUmtX03HpdBj5X8hg5qLnucre3shWJ9Nb81G
         MB8A==
X-Gm-Message-State: AOAM533emT+sdxDSX+Fmb4qC9nJypIdeb1aRHR2zsMzRcb7sEkQNjwI/
	sXovvR96HptIWCc0vuc2zt5bhE/l5o6wQA==
X-Google-Smtp-Source: ABdhPJx69nJuMie94dulmbLsAqa+l8rRdFKMH5pZMknfK3O+3QzufFrYsufQWEQLYMhpMSRvZ2f7YA==
X-Received: by 2002:a1c:4d0d:: with SMTP id o13mr840720wmh.147.1613945839733;
        Sun, 21 Feb 2021 14:17:19 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:6747:849:8224:46bc])
        by smtp.gmail.com with ESMTPSA id m4sm10196612wrb.87.2021.02.21.14.17.19
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Feb 2021 14:17:19 -0800 (PST)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 4/7] libcap-ng: Replace python patch with a better fix
Date: Sun, 21 Feb 2021 22:17:14 +0000
Message-Id: <20210221221717.3714714-4-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210221221717.3714714-1-richard.purdie@linuxfoundation.org>
References: <20210221221717.3714714-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

By using the python3targetconfig class we can drop the existing python
patch and the extra make parameters.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../libcap-ng/libcap-ng-python_0.8.2.bb       |  3 +-
 meta/recipes-support/libcap-ng/libcap-ng.inc  |  1 -
 .../libcap-ng/libcap-ng/python.patch          | 58 -------------------
 3 files changed, 1 insertion(+), 61 deletions(-)
 delete mode 100644 meta/recipes-support/libcap-ng/libcap-ng/python.patch

diff --git a/meta/recipes-support/libcap-ng/libcap-ng-python_0.8.2.bb b/meta/recipes-support/libcap-ng/libcap-ng-python_0.8.2.bb
index 43f76dc561a..6cea422d113 100644
--- a/meta/recipes-support/libcap-ng/libcap-ng-python_0.8.2.bb
+++ b/meta/recipes-support/libcap-ng/libcap-ng-python_0.8.2.bb
@@ -4,14 +4,13 @@ FILESEXTRAPATHS_prepend := "${THISDIR}/libcap-ng:"
 
 SUMMARY .= " - python"
 
-inherit lib_package autotools python3native
+inherit lib_package autotools python3targetconfig
 
 DEPENDS += "libcap-ng python3 swig-native"
 
 S = "${WORKDIR}/libcap-ng-${PV}"
 
 EXTRA_OECONF += "--with-python --with-python3"
-EXTRA_OEMAKE += "PYLIBVER='python${PYTHON_BASEVERSION}${PYTHON_ABI}' PYINC='${STAGING_INCDIR}/${PYLIBVER}'"
 
 do_install_append() {
     rm -rf ${D}${bindir}
diff --git a/meta/recipes-support/libcap-ng/libcap-ng.inc b/meta/recipes-support/libcap-ng/libcap-ng.inc
index 016d8e51746..64bc62de241 100644
--- a/meta/recipes-support/libcap-ng/libcap-ng.inc
+++ b/meta/recipes-support/libcap-ng/libcap-ng.inc
@@ -9,7 +9,6 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
 
 SRC_URI = "https://people.redhat.com/sgrubb/libcap-ng/libcap-ng-${PV}.tar.gz \
            file://determinism.patch \
-           file://python.patch \
 "
 
 SRC_URI[sha256sum] = "52c083b77c2b0d8449dee141f9c3eba76e6d4c5ad44ef05df25891126cb85ae9"
diff --git a/meta/recipes-support/libcap-ng/libcap-ng/python.patch b/meta/recipes-support/libcap-ng/libcap-ng/python.patch
deleted file mode 100644
index 8db03ca31fe..00000000000
--- a/meta/recipes-support/libcap-ng/libcap-ng/python.patch
+++ /dev/null
@@ -1,58 +0,0 @@
-Subject: [PATCH] configure.ac - Avoid an incorrect check for python.
- Makefile.am - avoid hard coded host include paths.
-
-Upstream-Status: pending
-
-Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
-Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
-Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
-Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
-
----
- bindings/python/Makefile.am |  4 +++-
- configure.ac                | 17 ++---------------
- 2 files changed, 5 insertions(+), 16 deletions(-)
-
-Index: libcap-ng-0.8.2/bindings/python/Makefile.am
-===================================================================
---- libcap-ng-0.8.2.orig/bindings/python/Makefile.am
-+++ libcap-ng-0.8.2/bindings/python/Makefile.am
-@@ -23,7 +23,9 @@
- SUBDIRS = test
- CONFIG_CLEAN_FILES = *.loT *.rej *.orig
- AM_CFLAGS = -fPIC -DPIC
--AM_CPPFLAGS = -I. -I$(top_builddir) -I@PYINCLUDEDIR@
-+PYLIBVER ?= python$(PYTHON_VERSION)
-+PYINC ?= /usr/include/$(PYLIBVER)
-+AM_CPPFLAGS = -I. -I$(top_builddir) -I$(PYINC)
- SWIG_FLAGS = -python
- SWIG_INCLUDES = ${AM_CPPFLAGS}
- pyexec_PYTHON = capng.py
-Index: libcap-ng-0.8.2/configure.ac
-===================================================================
---- libcap-ng-0.8.2.orig/configure.ac
-+++ libcap-ng-0.8.2/configure.ac
-@@ -169,21 +169,8 @@ fi
- 
- # Setup Python2 with the interpreter found previously.
- AM_PATH_PYTHON
--PYINCLUDEDIR=`python${am_cv_python_version} -c "from distutils import sysconfig; print(sysconfig.get_config_var('INCLUDEPY'))"`
--if test -f ${PYINCLUDEDIR}/Python.h ; then
--	python_found="yes"
--	AC_SUBST(PYINCLUDEDIR)
--	pybind_dir="python"
--	AC_SUBST(pybind_dir)
--	AC_MSG_NOTICE(Python bindings will be built)
--else
--	python_found="no"
--	if test "x$use_python" = xyes ; then
--		AC_MSG_ERROR([Python explicitly requested and python headers were not found])
--	else
--		AC_MSG_WARN("Python headers not found - python bindings will not be made")
--	fi
--fi
-+python_found="yes"
-+AC_MSG_NOTICE(Python bindings will be built)
- fi
- AM_CONDITIONAL(HAVE_PYTHON, test ${python_found} = "yes")
- 
-- 
2.27.0

