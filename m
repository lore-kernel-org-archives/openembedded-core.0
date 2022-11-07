Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3E32C43219
	for <webhook@archiver.kernel.org>; Mon,  7 Nov 2022 14:56:12 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web09.4350.1667832964997525125
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Nov 2022 06:56:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=pjEv/KM5;
 spf=pass (domain: gmail.com, ip: 209.85.128.51, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f51.google.com with SMTP id l39-20020a05600c1d2700b003cf93c8156dso5784440wms.4
        for <openembedded-core@lists.openembedded.org>; Mon, 07 Nov 2022 06:56:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v0nvCs4niIajyN3XrAIk0Ia4TjmQvNlJCD7hyX1sjyM=;
        b=pjEv/KM59DEOZJwhFaDOWlfnWklCbHeKTvaRR5VxOz36NXZfPpQMxtItSj2LQGLikA
         p5oKfSbt1Jhb6XSaFaVfdf/zzVod7qNuk1ZTfU66gq3sRu3esIZLyF7eXbxQ05/i7q4O
         r4cMoP8zb+RtgtIbV5DUmUXgNN5i2KLRNhh+Vd5P8p4lv1JKuDoj4aK06Uk5rEaskMXG
         TlMA2TYjLM3GZQ7Eh8FM+tuKpIIsnO46qz5ycmkJU7pBdbKrwi8b6Sy41TgzV7aUyzMX
         +t3qH7R0TNuXAdjBPWlH14EF/kSPRXQKuUEROVO5RPyOtUXDdfdr1D2kaaDNs+dXXHCg
         1cng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=v0nvCs4niIajyN3XrAIk0Ia4TjmQvNlJCD7hyX1sjyM=;
        b=5JI3TnQhWUFX7G/g4CpDBKZ1tx1rOc9xRJMKRepTdgsD9d/Xiv0qZoey6s0xAbwrUT
         OGfBaVhGM80tkYwS69J/g0BH8+MA9C3NEKOnVfa2cSeJCzXfonpHD1S1nP6LJZk8ZSVF
         x4er7imf5IDv5qlfe7VpSe1GxrHyumzAdAV2SELaAOStIvUJQRNvAaAX0/GhKGk71L2X
         yhEF7lRTnTy8I38PA+VaDGgPkG9zZZYUXaXgmT/xhSQ0p6K3n7WbpGzHBBcmGDzaKDMD
         sRI/Im2fmoTlohmky3rD0Emm8gHowZ9eOFj1PA9cCpf6+cGrPaKxSrdCxsVl54ZbF6KU
         8y/A==
X-Gm-Message-State: ACrzQf0dv/DMf0tmN/UVhU1Bpdr+cbv0ChBbh+WmXQYEIKo2viVyLspn
	o4I5noi7+TffsrhyjtSj2SqiyEpDdTo=
X-Google-Smtp-Source: AMsMyM59IOxiXFtb3275uA3+Zlbnb30o+Do+T6Lt+McZfvbNw+m17wODhkNfousvdDMXsR6u0PfaKQ==
X-Received: by 2002:a05:600c:3b10:b0:3cf:9320:175 with SMTP id m16-20020a05600c3b1000b003cf93200175mr14098311wms.166.1667832963411;
        Mon, 07 Nov 2022 06:56:03 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id s13-20020a5d69cd000000b0023659925b2asm7460440wrw.51.2022.11.07.06.56.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Nov 2022 06:56:02 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 44/48] selftest: add a copy of previous mtd-utils version to meta-selftest
Date: Mon,  7 Nov 2022 15:55:04 +0100
Message-Id: <20221107145508.1051404-44-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221107145508.1051404-1-alex@linutronix.de>
References: <20221107145508.1051404-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Nov 2022 14:56:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172895

The latest version update eliminated all custom patches, and the selftest
expects them.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...used-linux-fs.h-header-from-includes.patch | 31 ++++++++
 .../mtd/mtd-utils-selftest_git.bb             | 77 +++++++++++++++++++
 meta/lib/oeqa/selftest/cases/devtool.py       |  4 +-
 3 files changed, 110 insertions(+), 2 deletions(-)
 create mode 100644 meta-selftest/recipes-devtools/mtd/mtd-utils-selftest/0001-tests-Remove-unused-linux-fs.h-header-from-includes.patch
 create mode 100644 meta-selftest/recipes-devtools/mtd/mtd-utils-selftest_git.bb

diff --git a/meta-selftest/recipes-devtools/mtd/mtd-utils-selftest/0001-tests-Remove-unused-linux-fs.h-header-from-includes.patch b/meta-selftest/recipes-devtools/mtd/mtd-utils-selftest/0001-tests-Remove-unused-linux-fs.h-header-from-includes.patch
new file mode 100644
index 0000000000..73d4a8475f
--- /dev/null
+++ b/meta-selftest/recipes-devtools/mtd/mtd-utils-selftest/0001-tests-Remove-unused-linux-fs.h-header-from-includes.patch
@@ -0,0 +1,31 @@
+From 6fb10bd18488ed84776675bc1b2982800a51d839 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 6 Aug 2022 20:14:38 -0700
+Subject: [mtd-utils][PATCH] tests: Remove unused linux/fs.h header from includes
+
+This header is not needed, moreover it includes linux/mount.h which is
+now in conflict[1] with glibc provided sys/mount.h from glibc 2.36 onwards
+
+[1] https://sourceware.org/glibc/wiki/Release/2.36
+
+Upstream-Status: Submitted [https://lists.infradead.org/pipermail/linux-mtd/2022-August/094667.html]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ tests/fs-tests/lib/tests.c | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/tests/fs-tests/lib/tests.c b/tests/fs-tests/lib/tests.c
+index d1a2e0c..3db0426 100644
+--- a/tests/fs-tests/lib/tests.c
++++ b/tests/fs-tests/lib/tests.c
+@@ -35,7 +35,6 @@
+ #include <sys/vfs.h>
+ #include <sys/mount.h>
+ #include <sys/statvfs.h>
+-#include <linux/fs.h>
+ #include <linux/jffs2.h>
+ 
+ #include "tests.h"
+-- 
+2.37.1
+
diff --git a/meta-selftest/recipes-devtools/mtd/mtd-utils-selftest_git.bb b/meta-selftest/recipes-devtools/mtd/mtd-utils-selftest_git.bb
new file mode 100644
index 0000000000..ca2141c972
--- /dev/null
+++ b/meta-selftest/recipes-devtools/mtd/mtd-utils-selftest_git.bb
@@ -0,0 +1,77 @@
+SUMMARY = "Tools for managing memory technology devices"
+HOMEPAGE = "http://www.linux-mtd.infradead.org/"
+DESCRIPTION = "mtd-utils tool is a generic Linux subsystem for memory devices, especially Flash devices."
+SECTION = "base"
+LICENSE = "GPL-2.0-or-later"
+LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3 \
+                    file://include/common.h;beginline=1;endline=17;md5=ba05b07912a44ea2bf81ce409380049c"
+
+inherit autotools pkgconfig update-alternatives
+
+DEPENDS = "zlib e2fsprogs util-linux"
+RDEPENDS:mtd-utils-tests += "bash"
+
+PV = "2.1.4"
+
+SRCREV = "c7f1bfa44a84d02061787e2f6093df5cc40b9f5c"
+SRC_URI = "git://git.infradead.org/mtd-utils.git;branch=master \
+           file://0001-tests-Remove-unused-linux-fs.h-header-from-includes.patch \
+           "
+
+S = "${WORKDIR}/git"
+
+# xattr support creates an additional compile-time dependency on acl because
+# the sys/acl.h header is needed. libacl is not needed and thus enabling xattr
+# regardless whether acl is enabled or disabled in the distro should be okay.
+PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'xattr', d)} lzo jffs ubifs"
+PACKAGECONFIG[lzo] = "--with-lzo,--without-lzo,lzo"
+PACKAGECONFIG[xattr] = "--with-xattr,--without-xattr,acl"
+PACKAGECONFIG[crypto] = "--with-crypto,--without-crypto,openssl"
+PACKAGECONFIG[jffs] = "--with-jffs,--without-jffs"
+PACKAGECONFIG[ubifs] = "--with-ubifs,--without-ubifs"
+PACKAGECONFIG[zstd] = "--with-zstd,--without-zstd,zstd"
+
+CPPFLAGS:append:riscv64  = " -pthread -D_REENTRANT"
+
+EXTRA_OEMAKE = "'CC=${CC}' 'RANLIB=${RANLIB}' 'AR=${AR}' 'CFLAGS=${CFLAGS} ${@bb.utils.contains('PACKAGECONFIG', 'xattr', '', '-DWITHOUT_XATTR', d)} -I${S}/include' 'BUILDDIR=${S}'"
+
+# Use higher priority than corresponding BusyBox-provided applets
+ALTERNATIVE_PRIORITY = "100"
+
+ALTERNATIVE:${PN} = "flashcp flash_eraseall flash_lock flash_unlock nanddump nandwrite"
+ALTERNATIVE:${PN}-ubifs = "ubiattach ubidetach ubimkvol ubirename ubirmvol ubirsvol ubiupdatevol"
+
+ALTERNATIVE_LINK_NAME[nandwrite] = "${sbindir}/nandwrite"
+ALTERNATIVE_LINK_NAME[nanddump] = "${sbindir}/nanddump"
+ALTERNATIVE_LINK_NAME[ubiattach] = "${sbindir}/ubiattach"
+ALTERNATIVE_LINK_NAME[ubidetach] = "${sbindir}/ubidetach"
+ALTERNATIVE_LINK_NAME[ubimkvol] = "${sbindir}/ubimkvol"
+ALTERNATIVE_LINK_NAME[ubirename] = "${sbindir}/ubirename"
+ALTERNATIVE_LINK_NAME[ubirmvol] = "${sbindir}/ubirmvol"
+ALTERNATIVE_LINK_NAME[ubirsvol] = "${sbindir}/ubirsvol"
+ALTERNATIVE_LINK_NAME[ubiupdatevol] = "${sbindir}/ubiupdatevol"
+ALTERNATIVE_LINK_NAME[flash_eraseall] = "${sbindir}/flash_eraseall"
+ALTERNATIVE_LINK_NAME[flash_lock] = "${sbindir}/flash_lock"
+ALTERNATIVE_LINK_NAME[flash_unlock] = "${sbindir}/flash_unlock"
+ALTERNATIVE_LINK_NAME[flashcp] = "${sbindir}/flashcp"
+
+do_install () {
+	oe_runmake install DESTDIR=${D} SBINDIR=${sbindir} MANDIR=${mandir} INCLUDEDIR=${includedir}
+}
+
+PACKAGES =+ "mtd-utils-misc mtd-utils-tests"
+PACKAGES =+ "${@bb.utils.contains("PACKAGECONFIG", "jffs", "mtd-utils-jffs2", "", d)}"
+PACKAGES =+ "${@bb.utils.contains("PACKAGECONFIG", "ubifs", "mtd-utils-ubifs", "", d)}"
+
+FILES:mtd-utils-jffs2 = "${sbindir}/mkfs.jffs2 ${sbindir}/jffs2dump ${sbindir}/jffs2reader ${sbindir}/sumtool"
+FILES:mtd-utils-ubifs = "${sbindir}/mkfs.ubifs ${sbindir}/ubi*"
+FILES:mtd-utils-misc = "${sbindir}/nftl* ${sbindir}/ftl* ${sbindir}/rfd* ${sbindir}/doc* ${sbindir}/serve_image ${sbindir}/recv_image"
+FILES:mtd-utils-tests = "${libexecdir}/mtd-utils/*"
+
+BBCLASSEXTEND = "native nativesdk"
+
+# git/.compr.c.dep:46: warning: NUL character seen; rest of line ignored
+# git/.compr.c.dep:47: *** missing separator.  Stop.
+PARALLEL_MAKE = ""
+
+EXCLUDE_FROM_WORLD = "1"
diff --git a/meta/lib/oeqa/selftest/cases/devtool.py b/meta/lib/oeqa/selftest/cases/devtool.py
index 142932e12f..0cb7403f16 100644
--- a/meta/lib/oeqa/selftest/cases/devtool.py
+++ b/meta/lib/oeqa/selftest/cases/devtool.py
@@ -954,7 +954,7 @@ class DevtoolUpdateTests(DevtoolBase):
 
     def test_devtool_update_recipe_git(self):
         # Check preconditions
-        testrecipe = 'mtd-utils'
+        testrecipe = 'mtd-utils-selftest'
         bb_vars = get_bb_vars(['FILE', 'SRC_URI'], testrecipe)
         recipefile = bb_vars['FILE']
         src_uri = bb_vars['SRC_URI']
@@ -1075,7 +1075,7 @@ class DevtoolUpdateTests(DevtoolBase):
 
     def test_devtool_update_recipe_append_git(self):
         # Check preconditions
-        testrecipe = 'mtd-utils'
+        testrecipe = 'mtd-utils-selftest'
         bb_vars = get_bb_vars(['FILE', 'SRC_URI'], testrecipe)
         recipefile = bb_vars['FILE']
         src_uri = bb_vars['SRC_URI']
-- 
2.30.2


