Return-Path: <ricardo.ribalda@gmail.com>
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com
	[209.85.208.45])
	by mail.openembedded.org (Postfix) with ESMTP id C5A9A6011A
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Jun 2019 09:45:11 +0000 (UTC)
Received: by mail-ed1-f45.google.com with SMTP id k8so26212818edr.11
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Jun 2019 02:45:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=ptOJkaWG81fAJcY46nqWyMXqrzvT7WPrMVMl938Zuzs=;
	b=rePyVCNeSjlBGFmPoy3a+QA6Zxk2dUiuR55NqnuOJT1g/UDF8uR4+hL04JynIlmrTv
	sECirVS9UHZ0x5ZM+k/6DgasCv8DV26P2zwPnLrjOmchNO5uPqVeYGPpsMbMsYgiK19e
	DP/HVt6coo8sGT6VFHn0dPqGN59HcKuKj1SH0ItHU38JEP4I4e18TQcqmvM4XrgIIXWb
	YvCvuZPpVf1vlFk+jXIVcGSL63BWDVC5zm/dFGBayv/jx6XEzRFJtEQUI5xN3QabEwhb
	SBOxjEj7opxh2DlLpCU7ojgES7/AuUkJ1p81kCrt6egWVAtggTcPNQLlMXu3Sx1Picyi
	FWow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding;
	bh=ptOJkaWG81fAJcY46nqWyMXqrzvT7WPrMVMl938Zuzs=;
	b=kUvgnX5co6odkG3423WiGzWCPeSvQrhKwfeUBx2rUxK75khyx0gGbdn6nvcaBazK2L
	19v+ZC8CrLxJHjXMdgdXuIDX8isH7qw+bce0XTdBVm2u5n73V6qj2aphG+H5evkxrUeA
	Ao+qzVK6SnPh+8xQJ7CIx/iHwxNPf7Lc2jvQaw/hh1fWrTh7cIHeCdiDjYDlh2HhDnAg
	8ER7EBROfff9aVX4XvlVFL5/e7eDcWbTYAjqzMY2ht0Dqm5aUNQDGkeglnfiqGUeNHl1
	v9NKig6sTyvMH7W7EoUBMvIsxsGlFsOjKuUYqwX7Gu1hQ5ZZodSIBvYVSxwXzkstIlV6
	nXkw==
X-Gm-Message-State: APjAAAU6T4gC+Oz+7Qu6e0f+h5vR2izQjxlu2pVKO1383Gs15rWopHoz
	jH7HiI0EYoEKo4miIk2qm947xhsDwy8=
X-Google-Smtp-Source: APXvYqxGY8OS8WgmyPuvnASOOIF/SyRlNiDvRZir71RHkUFJChEqf6ARfMa3Le1CMVm+kxNctuUSzw==
X-Received: by 2002:a05:6402:1459:: with SMTP id
	d25mr17139992edx.235.1560937512333; 
	Wed, 19 Jun 2019 02:45:12 -0700 (PDT)
Received: from neopili.qtec.com
	(cpe.xe-3-0-1-778.vbrnqe10.dk.customer.tdc.net. [80.197.57.18])
	by smtp.gmail.com with ESMTPSA id
	b53sm5581060edd.45.2019.06.19.02.45.11
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Wed, 19 Jun 2019 02:45:11 -0700 (PDT)
Sender: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
From: Ricardo Ribalda Delgado <ricardo@ribalda.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 19 Jun 2019 11:44:55 +0200
Message-Id: <20190619094455.5488-1-ricardo@ribalda.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Cc: Ricardo Ribalda Delgado <ricardo@ribalda.com>
Subject: [PATCH] python3: python3: Fix build error x86->x86
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
X-List-Received-Date: Wed, 19 Jun 2019 09:45:12 -0000
Content-Transfer-Encoding: 8bit

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
---
 .../python/python3/crosspythonpath.patch      | 25 +++++++++++++++++++
 meta/recipes-devtools/python/python3_3.7.3.bb |  2 ++
 2 files changed, 27 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3/crosspythonpath.patch

diff --git a/meta/recipes-devtools/python/python3/crosspythonpath.patch b/meta/recipes-devtools/python/python3/crosspythonpath.patch
new file mode 100644
index 0000000000..d789ab57d4
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
diff --git a/meta/recipes-devtools/python/python3_3.7.3.bb b/meta/recipes-devtools/python/python3_3.7.3.bb
index 832ef1b3c3..2444296142 100644
--- a/meta/recipes-devtools/python/python3_3.7.3.bb
+++ b/meta/recipes-devtools/python/python3_3.7.3.bb
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
2.20.1


