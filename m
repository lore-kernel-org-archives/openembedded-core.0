Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 232A9C4332F
	for <webhook@archiver.kernel.org>; Wed, 27 Apr 2022 08:40:37 +0000 (UTC)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com
 [209.85.208.52])
 by mx.groups.io with SMTP id smtpd.web12.5856.1651048826920243008
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Apr 2022 01:40:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=PPnd4BPK;
 spf=pass (domain: gmail.com, ip: 209.85.208.52,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f52.google.com with SMTP id g20so1090081edw.6
        for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Apr 2022 01:40:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=EawDs59+qVBMncqzTviwYKGCmqdnKNsAlIotb6V7JTY=;
        b=PPnd4BPKhFIrJq/+BIBjvXW59hL2che0vVdSfWkqPOWRMbWrrWZIlwoPFjhp+3BcmF
         SBfbJdyI3dZpazbO3wPnb3z0pu1oixDBdYhNP7YhGqRnMJCfUmJAUlyMGv7QUTC0qQkR
         gpXah70uewfG26IpYsZ/HyUH3+j8j03YpNsDYvonk93EKPXxdRk5A305cuc8bpX3FDO6
         OLHlbLKh7pahqCG8hCwswDmPq/xBnJ8uB//YbVjHjAs1CvV7gTH+VD9bI1sg85yTqnI8
         1XnPcvFTyFU0gA0nCB5rSoN+3jN2WiscEATVX+8lvbBTfFXQhJGJnFUr9J+geYWSz/FN
         Q0vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=EawDs59+qVBMncqzTviwYKGCmqdnKNsAlIotb6V7JTY=;
        b=iZncCvWhu/hLQSt/gNie/zKmR8Pd7m4PVES3Soz++86sPfkfUPGZK6ZC9YGRnvWBO9
         nfcToLi2+smFH2BcpP//TBQPVpliDJ45dr1f+SJi9D4o7GrSEUDJISfibXBm0HBe52Fg
         Qm+LYWJpd9pC2xgoJTpgv2nJxrCfNjfKFxvB9/x0WfnisBTJL5/Ac8GBTDWm+F3jLWRO
         nzanSfx0yNyAx0D/hHLmSwK6n8n3bpWVHfm/ECLrcc3CBy6Pr0sGBGffDzdVu3nsv2Wf
         mJhlt8Ej5sOEQnY/KHq3bzFI1fwj90FVdrfDyGch08u0CgoWrdGhcDXegtJnhtO8Ik0C
         iF0A==
X-Gm-Message-State: AOAM531ULMSOqEDd8JbqbHGnACXH7qooj0LQt1C5E/O+dGlBqw2dhPA4
	GmaZbk+sSmPWLZp+hYUyuTa0K0BY2B8=
X-Google-Smtp-Source: 
 ABdhPJxbj+UKcGVZJwQTSS5TLX49gqZZR/1Ka2la8vMC+HibuHjdIfcgj33o3lTIFDRNg45RkL7hlg==
X-Received: by 2002:a05:6402:d0e:b0:413:3d99:f2d6 with SMTP id
 eb14-20020a0564020d0e00b004133d99f2d6mr29202218edb.189.1651048825459;
        Wed, 27 Apr 2022 01:40:25 -0700 (PDT)
Received: from Zen2.lab.linutronix.de.
 (ip-109-090-143-203.um36.pools.vodafone-ip.de. [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 p14-20020a05640210ce00b00413211746d4sm7893024edu.51.2022.04.27.01.40.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Apr 2022 01:40:24 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 15/18] libcap-ng: update 0.8.2 -> 0.8.3
Date: Wed, 27 Apr 2022 10:40:06 +0200
Message-Id: <20220427084009.3406717-15-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220427084009.3406717-1-alex@linutronix.de>
References: <20220427084009.3406717-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Apr 2022 08:40:37 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164906

Remove upstreamed patch.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...hon_0.8.2.bb => libcap-ng-python_0.8.3.bb} |  0
 meta/recipes-support/libcap-ng/libcap-ng.inc  |  6 +-
 .../libcap-ng/libcap-ng/determinism.patch     | 59 -------------------
 ...{libcap-ng_0.8.2.bb => libcap-ng_0.8.3.bb} |  0
 4 files changed, 2 insertions(+), 63 deletions(-)
 rename meta/recipes-support/libcap-ng/{libcap-ng-python_0.8.2.bb => libcap-ng-python_0.8.3.bb} (100%)
 delete mode 100644 meta/recipes-support/libcap-ng/libcap-ng/determinism.patch
 rename meta/recipes-support/libcap-ng/{libcap-ng_0.8.2.bb => libcap-ng_0.8.3.bb} (100%)

diff --git a/meta/recipes-support/libcap-ng/libcap-ng-python_0.8.2.bb b/meta/recipes-support/libcap-ng/libcap-ng-python_0.8.3.bb
similarity index 100%
rename from meta/recipes-support/libcap-ng/libcap-ng-python_0.8.2.bb
rename to meta/recipes-support/libcap-ng/libcap-ng-python_0.8.3.bb
diff --git a/meta/recipes-support/libcap-ng/libcap-ng.inc b/meta/recipes-support/libcap-ng/libcap-ng.inc
index 57fcd50d9f..55e3287396 100644
--- a/meta/recipes-support/libcap-ng/libcap-ng.inc
+++ b/meta/recipes-support/libcap-ng/libcap-ng.inc
@@ -7,11 +7,9 @@ LICENSE = "GPL-2.0-or-later & LGPL-2.1-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
 		    file://COPYING.LIB;md5=e3eda01d9815f8d24aae2dbd89b68b06"
 
-SRC_URI = "https://people.redhat.com/sgrubb/libcap-ng/libcap-ng-${PV}.tar.gz \
-           file://determinism.patch \
-"
+SRC_URI = "https://people.redhat.com/sgrubb/libcap-ng/libcap-ng-${PV}.tar.gz"
 
-SRC_URI[sha256sum] = "52c083b77c2b0d8449dee141f9c3eba76e6d4c5ad44ef05df25891126cb85ae9"
+SRC_URI[sha256sum] = "bed6f6848e22bb2f83b5f764b2aef0ed393054e803a8e3a8711cb2a39e6b492d"
 
 EXTRA_OECONF:append:class-target = " --with-capability_header=${STAGING_INCDIR}/linux/capability.h"
 EXTRA_OECONF:append:class-nativesdk = " --with-capability_header=${STAGING_INCDIR}/linux/capability.h"
diff --git a/meta/recipes-support/libcap-ng/libcap-ng/determinism.patch b/meta/recipes-support/libcap-ng/libcap-ng/determinism.patch
deleted file mode 100644
index fbb7380f56..0000000000
--- a/meta/recipes-support/libcap-ng/libcap-ng/determinism.patch
+++ /dev/null
@@ -1,59 +0,0 @@
-[PATCH] bindings/python: Allow hardcoded path to capability.h to be overridden
-
-Currently the path to capability.h is hardcoded. When cross compiling
-the host capabiity.h may be different to the target copy, leading
-to different options being encoded in the python bindings than
-expected. This causes a reproducibility issue amongst other potential
-problems.
-
-Add a configure option to optionally specify the right path to the
-correct header as its probably safer/more reliable than trying to
-query the compiler to get the header path.
-
-Signed-off-by: Richard Purdie richard.purdie@linuxfoundation.org
-Upstream-Status: Submitted [https://github.com/stevegrubb/libcap-ng/pull/30]
-
-Index: libcap-ng-0.8.2/configure.ac
-===================================================================
---- libcap-ng-0.8.2.orig/configure.ac
-+++ libcap-ng-0.8.2/configure.ac
-@@ -63,6 +63,13 @@ AC_CHECK_HEADERS(sys/vfs.h, [
- 	AC_CHECK_HEADERS(linux/magic.h, [] [AC_MSG_WARN(linux/magic.h is required in order to verify procfs.)])
- 	], [AC_MSG_WARN(sys/vfs.h is required in order to verify procfs.)])
- 
-+
-+AC_ARG_WITH([capability_header],
-+        [AS_HELP_STRING([--with-capability_header=path : path to cpapbility.h])],
-+        [CAPABILITY_HEADER=$withval],
-+        [CAPABILITY_HEADER=/usr/include/linux/capability.h])
-+AC_SUBST(CAPABILITY_HEADER)
-+
- AC_C_CONST
- AC_C_INLINE
- AM_PROG_CC_C_O
-Index: libcap-ng-0.8.2/bindings/python3/Makefile.am
-===================================================================
---- libcap-ng-0.8.2.orig/bindings/python3/Makefile.am
-+++ libcap-ng-0.8.2/bindings/python3/Makefile.am
-@@ -41,7 +41,7 @@ nodist__capng_la_SOURCES  = capng_wrap.c
- capng.py capng_wrap.c: ${srcdir}/../src/capng_swig.i caps.h capng.h
- 	swig -o capng_wrap.c ${SWIG_FLAGS} ${SWIG_INCLUDES} ${srcdir}/../src/capng_swig.i
- caps.h:
--	cat /usr/include/linux/capability.h | grep '^#define CAP'  | grep -v '[()]' > caps.h
-+	cat $(CAPABILITY_HEADER) | grep '^#define CAP'  | grep -v '[()]' > caps.h
- capng.h:
- 	cat ${top_srcdir}/src/cap-ng.h | grep -v '_state' > capng.h
- 
-Index: libcap-ng-0.8.2/bindings/python/Makefile.am
-===================================================================
---- libcap-ng-0.8.2.orig/bindings/python/Makefile.am
-+++ libcap-ng-0.8.2/bindings/python/Makefile.am
-@@ -38,7 +38,7 @@ nodist__capng_la_SOURCES  = capng_wrap.c
- capng.py capng_wrap.c: ${srcdir}/../src/capng_swig.i caps.h capng.h
- 	swig -o capng_wrap.c ${SWIG_FLAGS} ${SWIG_INCLUDES} ${srcdir}/../src/capng_swig.i 
- caps.h:
--	cat /usr/include/linux/capability.h | grep '^#define CAP'  | grep -v '[()]' > caps.h
-+	cat $(CAPABILITY_HEADER) | grep '^#define CAP'  | grep -v '[()]' > caps.h
- capng.h:
- 	cat ${top_srcdir}/src/cap-ng.h | grep -v '_state' > capng.h
- 
diff --git a/meta/recipes-support/libcap-ng/libcap-ng_0.8.2.bb b/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb
similarity index 100%
rename from meta/recipes-support/libcap-ng/libcap-ng_0.8.2.bb
rename to meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb
-- 
2.30.2


