Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web09.27140.1613945840720059391
 for <openembedded-core@lists.openembedded.org>;
 Sun, 21 Feb 2021 14:17:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=SfanR1BJ;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.44, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f44.google.com with SMTP id n4so17144125wrx.1
        for <openembedded-core@lists.openembedded.org>; Sun, 21 Feb 2021 14:17:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=aXaE1ej4B8DmA1isUati49BcIX6NYIx1LwarUt/MY2Y=;
        b=SfanR1BJEV3cOOr1BOZv/pT7W9Kuz0flk0U+HZHJmKpBXo8igCJd35SYg5uB5PS7Nf
         nrDmieOHNsyKOLZOXWnh3afYm7b7mdeUpf++yF6Up6i0eoUNRDtw/CyW9MQt/fHw7Jqv
         xmi1giMzYvdCDUHm+4u4rNysl/oratdSBGb3o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=aXaE1ej4B8DmA1isUati49BcIX6NYIx1LwarUt/MY2Y=;
        b=XhuWu5kLWrmeV/yqtQ3CFyciEPLXOGilon6i+khbWnTKoLxrC4F8sfDF5BVCOMj6P5
         N0i/Garu7+bXnh74jmwK/uBiRXynpWFsEO/w+yLyz8ivDcEhUa66cciCBK+R0zt4uHpd
         3Rd0mwBLeFCGTr+EGWD1nYj4Qx5X7NNfDnjQQuTTqlSmBvSaO8b+QNXBeH0T5g4rg5sz
         Kwjwe/tVerEf81hK9YOB04FmEKlzQh+DkSZk6awLHE+aWNA/CyCuAQGWNAcsPxVpjC5s
         KKq26gTG76PBDoU5UGMo62g282d+Om6bfTqYJR0jhmNhCy/qbttKW6BD58E8mRfAlQwH
         rxmg==
X-Gm-Message-State: AOAM530EffviaeriBi+Jtc5iqlw3KR6sDDw0g9pqecr1lsEGAbdkKX+Y
	j/xnqhO9K3M1ctbvgPVNisZUpVgpZ1xJLQ==
X-Google-Smtp-Source: ABdhPJwR3pSKu/T6TUxPq5icnwGREhAwclYjy//79CFBDj0Ft0eTYyF7T/5q79+SHBkPgtS0wljaEg==
X-Received: by 2002:adf:e5c2:: with SMTP id a2mr18521205wrn.287.1613945839174;
        Sun, 21 Feb 2021 14:17:19 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:6747:849:8224:46bc])
        by smtp.gmail.com with ESMTPSA id m4sm10196612wrb.87.2021.02.21.14.17.18
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Feb 2021 14:17:18 -0800 (PST)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/7] libcap-ng: Fix python bindings determinism issue
Date: Sun, 21 Feb 2021 22:17:13 +0000
Message-Id: <20210221221717.3714714-3-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210221221717.3714714-1-richard.purdie@linuxfoundation.org>
References: <20210221221717.3714714-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-support/libcap-ng/libcap-ng.inc  |  4 ++
 .../libcap-ng/libcap-ng/determinism.patch     | 59 +++++++++++++++++++
 .../libcap-ng/libcap-ng/python.patch          | 20 +++----
 3 files changed, 72 insertions(+), 11 deletions(-)
 create mode 100644 meta/recipes-support/libcap-ng/libcap-ng/determinism.patch

diff --git a/meta/recipes-support/libcap-ng/libcap-ng.inc b/meta/recipes-support/libcap-ng/libcap-ng.inc
index 8c52b5d0b9f..016d8e51746 100644
--- a/meta/recipes-support/libcap-ng/libcap-ng.inc
+++ b/meta/recipes-support/libcap-ng/libcap-ng.inc
@@ -8,9 +8,13 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
 		    file://COPYING.LIB;md5=e3eda01d9815f8d24aae2dbd89b68b06"
 
 SRC_URI = "https://people.redhat.com/sgrubb/libcap-ng/libcap-ng-${PV}.tar.gz \
+           file://determinism.patch \
            file://python.patch \
 "
 
 SRC_URI[sha256sum] = "52c083b77c2b0d8449dee141f9c3eba76e6d4c5ad44ef05df25891126cb85ae9"
 
+EXTRA_OECONF_append_class-target = " --with-capability_header=${STAGING_INCDIR}/linux/capability.h"
+EXTRA_OECONF_append_class-nativesdk = " --with-capability_header=${STAGING_INCDIR}/linux/capability.h"
+
 BBCLASSEXTEND = "native nativesdk"
diff --git a/meta/recipes-support/libcap-ng/libcap-ng/determinism.patch b/meta/recipes-support/libcap-ng/libcap-ng/determinism.patch
new file mode 100644
index 00000000000..fbb7380f56e
--- /dev/null
+++ b/meta/recipes-support/libcap-ng/libcap-ng/determinism.patch
@@ -0,0 +1,59 @@
+[PATCH] bindings/python: Allow hardcoded path to capability.h to be overridden
+
+Currently the path to capability.h is hardcoded. When cross compiling
+the host capabiity.h may be different to the target copy, leading
+to different options being encoded in the python bindings than
+expected. This causes a reproducibility issue amongst other potential
+problems.
+
+Add a configure option to optionally specify the right path to the
+correct header as its probably safer/more reliable than trying to
+query the compiler to get the header path.
+
+Signed-off-by: Richard Purdie richard.purdie@linuxfoundation.org
+Upstream-Status: Submitted [https://github.com/stevegrubb/libcap-ng/pull/30]
+
+Index: libcap-ng-0.8.2/configure.ac
+===================================================================
+--- libcap-ng-0.8.2.orig/configure.ac
++++ libcap-ng-0.8.2/configure.ac
+@@ -63,6 +63,13 @@ AC_CHECK_HEADERS(sys/vfs.h, [
+ 	AC_CHECK_HEADERS(linux/magic.h, [] [AC_MSG_WARN(linux/magic.h is required in order to verify procfs.)])
+ 	], [AC_MSG_WARN(sys/vfs.h is required in order to verify procfs.)])
+ 
++
++AC_ARG_WITH([capability_header],
++        [AS_HELP_STRING([--with-capability_header=path : path to cpapbility.h])],
++        [CAPABILITY_HEADER=$withval],
++        [CAPABILITY_HEADER=/usr/include/linux/capability.h])
++AC_SUBST(CAPABILITY_HEADER)
++
+ AC_C_CONST
+ AC_C_INLINE
+ AM_PROG_CC_C_O
+Index: libcap-ng-0.8.2/bindings/python3/Makefile.am
+===================================================================
+--- libcap-ng-0.8.2.orig/bindings/python3/Makefile.am
++++ libcap-ng-0.8.2/bindings/python3/Makefile.am
+@@ -41,7 +41,7 @@ nodist__capng_la_SOURCES  = capng_wrap.c
+ capng.py capng_wrap.c: ${srcdir}/../src/capng_swig.i caps.h capng.h
+ 	swig -o capng_wrap.c ${SWIG_FLAGS} ${SWIG_INCLUDES} ${srcdir}/../src/capng_swig.i
+ caps.h:
+-	cat /usr/include/linux/capability.h | grep '^#define CAP'  | grep -v '[()]' > caps.h
++	cat $(CAPABILITY_HEADER) | grep '^#define CAP'  | grep -v '[()]' > caps.h
+ capng.h:
+ 	cat ${top_srcdir}/src/cap-ng.h | grep -v '_state' > capng.h
+ 
+Index: libcap-ng-0.8.2/bindings/python/Makefile.am
+===================================================================
+--- libcap-ng-0.8.2.orig/bindings/python/Makefile.am
++++ libcap-ng-0.8.2/bindings/python/Makefile.am
+@@ -38,7 +38,7 @@ nodist__capng_la_SOURCES  = capng_wrap.c
+ capng.py capng_wrap.c: ${srcdir}/../src/capng_swig.i caps.h capng.h
+ 	swig -o capng_wrap.c ${SWIG_FLAGS} ${SWIG_INCLUDES} ${srcdir}/../src/capng_swig.i 
+ caps.h:
+-	cat /usr/include/linux/capability.h | grep '^#define CAP'  | grep -v '[()]' > caps.h
++	cat $(CAPABILITY_HEADER) | grep '^#define CAP'  | grep -v '[()]' > caps.h
+ capng.h:
+ 	cat ${top_srcdir}/src/cap-ng.h | grep -v '_state' > capng.h
+ 
diff --git a/meta/recipes-support/libcap-ng/libcap-ng/python.patch b/meta/recipes-support/libcap-ng/libcap-ng/python.patch
index fcd6f9cd334..8db03ca31fe 100644
--- a/meta/recipes-support/libcap-ng/libcap-ng/python.patch
+++ b/meta/recipes-support/libcap-ng/libcap-ng/python.patch
@@ -13,10 +13,10 @@ Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
  configure.ac                | 17 ++---------------
  2 files changed, 5 insertions(+), 16 deletions(-)
 
-diff --git a/bindings/python/Makefile.am b/bindings/python/Makefile.am
-index 999b184..c8e49db 100644
---- a/bindings/python/Makefile.am
-+++ b/bindings/python/Makefile.am
+Index: libcap-ng-0.8.2/bindings/python/Makefile.am
+===================================================================
+--- libcap-ng-0.8.2.orig/bindings/python/Makefile.am
++++ libcap-ng-0.8.2/bindings/python/Makefile.am
 @@ -23,7 +23,9 @@
  SUBDIRS = test
  CONFIG_CLEAN_FILES = *.loT *.rej *.orig
@@ -28,11 +28,11 @@ index 999b184..c8e49db 100644
  SWIG_FLAGS = -python
  SWIG_INCLUDES = ${AM_CPPFLAGS}
  pyexec_PYTHON = capng.py
-diff --git a/configure.ac b/configure.ac
-index 8b46f51..2d7e00c 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -141,21 +141,8 @@ fi
+Index: libcap-ng-0.8.2/configure.ac
+===================================================================
+--- libcap-ng-0.8.2.orig/configure.ac
++++ libcap-ng-0.8.2/configure.ac
+@@ -169,21 +169,8 @@ fi
  
  # Setup Python2 with the interpreter found previously.
  AM_PATH_PYTHON
@@ -56,5 +56,3 @@ index 8b46f51..2d7e00c 100644
  fi
  AM_CONDITIONAL(HAVE_PYTHON, test ${python_found} = "yes")
  
--- 
-2.25.1
-- 
2.27.0

