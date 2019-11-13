Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com
	[209.85.215.174])
	by mail.openembedded.org (Postfix) with ESMTP id 710DC7F74C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Nov 2019 15:20:00 +0000 (UTC)
Received: by mail-pg1-f174.google.com with SMTP id 15so1576832pgh.5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Nov 2019 07:20:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=rEhCTZf2EgkNTTP+hUTAr+vjNypAyskFbJrVrjhz94M=;
	b=bKYW+RgdvLrpiYDSXbGo2CePp/W50M2J7hh0cxaXSplHV8IsOWSQUmNDWd7TQawt2v
	sbUpEdrMKVoKnnq75cc+/8y9/EaJ8nF9H4gjLs9bxEsbGttwaNbdyF7FiAXIS8hZjKBz
	UXy/8XL1CRyarEGRLonZ7Kjklrbhx4f3R0ZlxKVmQeLkYg3atDPZO53lOKRrdx/TQIsi
	DoL7g3wPdu7KFmqCeA/cHeRM9LLNayJ7chjPAxofNY1euXSa7fhbJTU07Q3kOwHU+g2S
	KuWRxe+bjTs/4vT7gACS3LYYRxc/SBR9Kk5I+BhEKcNERedIKqJo1A6Idj7sdsEDROEH
	covw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=rEhCTZf2EgkNTTP+hUTAr+vjNypAyskFbJrVrjhz94M=;
	b=mjLp2stUVHpQcUqMnKErbmialVIS6lN6+2rTb/xpJiD7mHxIOpGIs233NishlkRVNV
	p99TqrpdMjJWj4tKvqsm+4YCWHWKIaaaBtOqX58j7xSnUWjt/qdaNRVWiN31kWcQ5Tgl
	r5eYMLgyzVeLPZNR4RCpGAIvIaiSn2YdCiuuUP4mSl3eALwi/7NtvTufDFdJgKRfEv3b
	FvQB0Xkvqlj6VVbCn579RcrS5pMAuZp9+JIsETyZsLZvVJZbZgf8ckzYyABUQrtfLjS2
	u9721j7Nu5MkSmRoHgHt33Pd4AebuDKf4bLEb2u6PKwbZ5aGHNCJCjM41ixsIdyKnX93
	+7gg==
X-Gm-Message-State: APjAAAWfYCr8LhxKgZS+CEd31EZrvJWF8M0gQ5By6iKAN0TgkWhuRsAb
	ACdKakw+bRl5Mq4eXAefwYDfDGBu
X-Google-Smtp-Source: APXvYqxs6TEkVys1srAUGrO//njddq4odgBEgZbw70W5ndIcbJqmCA5lixdiLJgb7JgoZemMzrq7ug==
X-Received: by 2002:a63:da47:: with SMTP id l7mr4263017pgj.34.1573658401247;
	Wed, 13 Nov 2019 07:20:01 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:2cf9:53ea:e6ab:d378])
	by smtp.gmail.com with ESMTPSA id t8sm2622242pjr.25.2019.11.13.07.20.00
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 13 Nov 2019 07:20:00 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 13 Nov 2019 07:19:18 -0800
Message-Id: <2f8086ce87bbb62ef971be4da80c2c2b9d8c9c66.1573658232.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1573658232.git.akuster808@gmail.com>
References: <cover.1573658232.git.akuster808@gmail.com>
Subject: [warrior 15/25] python3: python3: Fix build error x86->x86
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 13 Nov 2019 15:20:00 -0000

From: Ricardo Ribalda Delgado <ricardo@ribalda.com>

When building x86->x86 the system will try to execute .so and related items
from the default PYTHONPATH.  This will fail if the target CPU contains
instructions that the host CPU does not have, add CROSSPYTHONPATH
into PYTHONPATH so we can prepend the list to find correct libs.

Fixes:

Illegal instruction (core dumped)
Makefile:625: recipe for target 'sharedmods' failed
make: *** [sharedmods] Error 132
make: *** Waiting for unfinished jobs....

Signed-off-by: Ricardo Ribalda Delgado <ricardo@ribalda.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../python/python3/crosspythonpath.patch           | 25 ++++++++++++++++++++++
 meta/recipes-devtools/python/python3_3.7.4.bb      |  2 ++
 2 files changed, 27 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3/crosspythonpath.patch

diff --git a/meta/recipes-devtools/python/python3/crosspythonpath.patch b/meta/recipes-devtools/python/python3/crosspythonpath.patch
new file mode 100644
index 0000000..d789ab5
--- /dev/null
+++ b/meta/recipes-devtools/python/python3/crosspythonpath.patch
@@ -0,0 +1,25 @@
+configure.ac: add CROSSPYTHONPATH into PYTHONPATH for PYTHON_FOR_BUILD
+
+When building x86->x86 the system will try to execute .so and related items
+from the default PYTHONPATH.  This will fail if the target CPU contains
+instructions that the host CPU does not have, add CROSSPYTHONPATH
+into PYTHONPATH so we can prepend the list to find correct libs.
+
+Upstream-Status: Inappropriate [OE-Core integration specific]
+
+Credits-to: Mark Hatle <mark.hatle@windriver.com>
+Credits-to: Jackie Huang <jackie.huang@windriver.com>
+Signed-off-by: Ricardo Ribalda <ricardo@ribalda.com>
+diff --git a/configure.ac b/configure.ac
+index 4ab19a6..7036a53 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -76,7 +76,7 @@ if test "$cross_compiling" = yes; then
+ 	    AC_MSG_ERROR([python$PACKAGE_VERSION interpreter not found])
+ 	fi
+         AC_MSG_RESULT($interp)
+-	PYTHON_FOR_BUILD='_PYTHON_PROJECT_BASE=$(abs_builddir) _PYTHON_HOST_PLATFORM=$(_PYTHON_HOST_PLATFORM) PYTHONPATH=$(shell test -f pybuilddir.txt && echo $(abs_builddir)/`cat pybuilddir.txt`:)$(srcdir)/Lib _PYTHON_SYSCONFIGDATA_NAME=_sysconfigdata_$(ABIFLAGS)_$(MACHDEP)_$(MULTIARCH) '$interp
++	PYTHON_FOR_BUILD='_PYTHON_PROJECT_BASE=$(abs_builddir) _PYTHON_HOST_PLATFORM=$(_PYTHON_HOST_PLATFORM) PYTHONPATH=$(CROSSPYTHONPATH):$(shell test -f pybuilddir.txt && echo $(abs_builddir)/`cat pybuilddir.txt`:)$(srcdir)/Lib _PYTHON_SYSCONFIGDATA_NAME=_sysconfigdata_$(ABIFLAGS)_$(MACHDEP)_$(MULTIARCH) '$interp
+     fi
+ elif test "$cross_compiling" = maybe; then
+     AC_MSG_ERROR([Cross compiling required --host=HOST-TUPLE and --build=ARCH])
diff --git a/meta/recipes-devtools/python/python3_3.7.4.bb b/meta/recipes-devtools/python/python3_3.7.4.bb
index c21fe90..c5a5db1 100644
--- a/meta/recipes-devtools/python/python3_3.7.4.bb
+++ b/meta/recipes-devtools/python/python3_3.7.4.bb
@@ -24,6 +24,7 @@ SRC_URI = "http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz \
            file://0001-Lib-sysconfig.py-fix-another-place-where-lib-is-hard.patch \
            file://0001-Makefile-fix-Issue36464-parallel-build-race-problem.patch \
 	   file://0001-bpo-36852-proper-detection-of-mips-architecture-for-.patch \
+	   file://crosspythonpath.patch \
            "
 
 SRC_URI_append_class-native = " \
@@ -65,6 +66,7 @@ DEPENDS_append_class-nativesdk = " python3-native"
 EXTRA_OECONF = " --without-ensurepip --enable-shared"
 EXTRA_OECONF_append_class-native = " --bindir=${bindir}/${PN}"
 
+export CROSSPYTHONPATH="${STAGING_LIBDIR_NATIVE}/python${PYTHON_MAJMIN}/lib-dynload/"
 
 EXTRANATIVEPATH += "python3-native"
 
-- 
2.7.4


