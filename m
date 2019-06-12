Return-Path: <ross.burton@intel.com>
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	by mail.openembedded.org (Postfix) with ESMTP id 232967E588
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Jun 2019 20:35:40 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id 207so10364wma.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Jun 2019 13:35:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=tvqjCwepKNgmTmQeUp65FL5sZ7UnnkEwxIFOrg3hOwE=;
	b=GQ9wZE/NEKfAQu27M5ZudH/M8YZkwy/zxkWT1mwdVuiR7VHSJUEibpnFtZgovWFKU2
	HveWSw2KxEBW4EoQjDrk2BombVDul0/C7S0UHxyd6WQJ48nD4UQ+F2zdu6/k6k8EgXeZ
	BedNoGiPjtBLcBsqQb585fDzswy2G6VWEiT9Ue7RRFk3oemi1TDxXyUoRVxF+Z8rWyIK
	rKC39cLXhceKdwTsjmsP/89exBSsguNg0KvDFSLk/+5kG1/7QWvqZNr7z3LI0tz2jthu
	U86IKSztQY4AWlPVI8EGQpCMK6HzjZAZXbzMComqW89Aeq6hD3gebb74x2visWDqGhfv
	CG+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=tvqjCwepKNgmTmQeUp65FL5sZ7UnnkEwxIFOrg3hOwE=;
	b=MS0QDciSVRhm+mLJdTNsZPLkMWTh1qTce6p70/4rrVNa+1DpfQVV5l2wVa0H0vF32Z
	DryGymQ20xnROXw+O78ykyLMEN5rwI18R8WgSGClLfQv1/IvWUuo2Dj8HMXv419MZceM
	ai+8HP79mV0VBrvjP0uaCeDAiBkFF6VJhxB4L0+GR1n+AhMIZNWPjJU8gGxjalnVvGd4
	Xxv1rFyHBhlborKalGxeHma1weAvQx/E5eW/MCrhAmTkHKl9daNM0nU3VD5/LlfBNHGh
	iLfGxagNYjYxtMSdYK8tzjje8/BN3GLlFsUNZOvGfh63l4f8mKJI+3wTcIjDIkqEsJ+c
	VKJg==
X-Gm-Message-State: APjAAAW/4TTVeu8D7ovzA/wEtc8Q4hdYCnUEZmmUtP3xkBACazp9O9J7
	kHpDsZx7VoTRQ738Wh9nEP3d0C0apZ8=
X-Google-Smtp-Source: APXvYqxVs8AIJuKPwJp8E2h6OJijz1yKr5IXaLxarfjGZLP4Oyd3e+q7NzxI4jqzRNLBCESwhwzlww==
X-Received: by 2002:a7b:c356:: with SMTP id l22mr690256wmj.97.1560371741321;
	Wed, 12 Jun 2019 13:35:41 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	j189sm1156818wmb.48.2019.06.12.13.35.39
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 12 Jun 2019 13:35:39 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 12 Jun 2019 21:35:35 +0100
Message-Id: <20190612203536.32162-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH v2 1/2] efivar: add
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
X-List-Received-Date: Wed, 12 Jun 2019 20:35:41 -0000

This was in meta-oe but EFI is sufficiently wide spread now that we need it in
core.

The recipe is based on the one in meta-oe but with several updates.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-bsp/efivar/efivar/no-werror.patch | 18 +++++++++++++
 meta/recipes-bsp/efivar/efivar_37.bb           | 37 ++++++++++++++++++++++++++
 2 files changed, 55 insertions(+)
 create mode 100644 meta/recipes-bsp/efivar/efivar/no-werror.patch
 create mode 100644 meta/recipes-bsp/efivar/efivar_37.bb

diff --git a/meta/recipes-bsp/efivar/efivar/no-werror.patch b/meta/recipes-bsp/efivar/efivar/no-werror.patch
new file mode 100644
index 00000000000..50a0b1023a5
--- /dev/null
+++ b/meta/recipes-bsp/efivar/efivar/no-werror.patch
@@ -0,0 +1,18 @@
+Don't use -Werror because newer compilers introduce newer warnings.
+
+Upstream-Status: Inappropriate [https://github.com/rhboot/efivar/issues/131]
+Signed-off-by: Ross Burton <ross.burton@intel.com>
+
+diff --git a/gcc.specs b/gcc.specs
+index 45d43d1..1baf11a 100644
+--- a/gcc.specs
++++ b/gcc.specs
+@@ -2,7 +2,7 @@
+ + -D_GNU_SOURCE
+ 
+ *efivar_cpp_options:
+- -Werror -Wall -std=gnu11 -Wextra
++ -Wall -std=gnu11 -Wextra
+ 
+ *cpp_options:
+ + %(efivar_cpp_options)
diff --git a/meta/recipes-bsp/efivar/efivar_37.bb b/meta/recipes-bsp/efivar/efivar_37.bb
new file mode 100644
index 00000000000..c4254c70d91
--- /dev/null
+++ b/meta/recipes-bsp/efivar/efivar_37.bb
@@ -0,0 +1,37 @@
+SUMMARY = "Tools to manipulate UEFI variables"
+DESCRIPTION = "efivar provides a simple command line interface to the UEFI variable facility"
+HOMEPAGE = "https://github.com/rhboot/efivar"
+
+LICENSE = "LGPLv2.1+"
+LIC_FILES_CHKSUM = "file://COPYING;md5=6626bb1e20189cfa95f2c508ba286393"
+
+COMPATIBLE_HOST = "(i.86|x86_64|arm|aarch64).*-linux"
+
+SRC_URI = "git://github.com/rhinstaller/efivar.git \
+           file://no-werror.patch"
+SRCREV = "c1d6b10e1ed4ba2be07f385eae5bceb694478a10"
+
+S = "${WORKDIR}/git"
+
+inherit pkgconfig
+
+export CCLD_FOR_BUILD = "${BUILD_CCLD}"
+
+# Upstream uses --add-needed in gcc.specs which gold doesn't support, so
+# enforce BFD.
+LDFLAGS += "-fuse-ld=bfd"
+
+do_compile_prepend() {
+    # Remove when https://github.com/rhboot/efivar/issues/130 is fixed
+    oe_runmake CFLAGS="${BUILD_CFLAGS}" -C src makeguids
+}
+
+do_install() {
+    oe_runmake install DESTDIR=${D}
+}
+
+BBCLASSEXTEND = "native"
+
+RRECOMMENDS_${PN}_class-target = "kernel-module-efivarfs"
+
+CLEANBROKEN = "1"
-- 
2.11.0


