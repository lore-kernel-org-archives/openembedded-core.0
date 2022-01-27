Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4BAAC433EF
	for <webhook@archiver.kernel.org>; Thu, 27 Jan 2022 10:20:59 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
 [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web10.26990.1643278858506392025
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Jan 2022 02:20:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=SO21pmal;
 spf=pass (domain: gmail.com, ip: 209.85.128.47,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f47.google.com with SMTP id
 bg19-20020a05600c3c9300b0034565e837b6so3045807wmb.1
        for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Jan 2022 02:20:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=l3RsAnRYjUGj0sUrr6h8igLyMPrpogLlQx168istpAY=;
        b=SO21pmalNMTiIBhaI+xcWMtSBMbc4QYzv6Rc2eFifpBYdH2GPi/C1/cfQsk4cudjMa
         E+eVxIcKJ3c3qyi1jKQwOFAoWSHKUTC5Fc86rXl6OAd/aDZixwpWfTTxZi33aSYTqBdt
         ctTKRWQoCm5g/453tsPPB5mg48BeGaq0h6NRxclPQAok7XjnEtE+m2AgCULqVLgMWqcC
         KY8vIhsU7dL1hEjX5j1dX1C7z73GcoMSbMWdzxi8M5PfLKWA5PF6U+6dIMaIl8SADcYq
         b1KuxihVMFQ2pCRK1AnR5WQltnIAPWDCe5jW9TBt+XCNGs7Nf7dWIg4YXDnTpOM4WoZP
         WFeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=l3RsAnRYjUGj0sUrr6h8igLyMPrpogLlQx168istpAY=;
        b=W+Dq8feDCLZftHgcQaXlHfAH8Tg3jyJJMJnEPZsWlcnK03X7vygK2GhZOFDu2erGDU
         PHr/UZrOebeqj6YonsyJyYnNhEvfeWWq0jNy5bIETVed3QbUc/ttk4EdK+Y7RgreXx61
         MlFioI+UYZ+ajg5G/tuqt9TWFh4azLGd110S6G+3TAgog8D20c2tVMij7060SzUSBly2
         iFUYQP6XjQf0G76Rjy/HMtYynTaLm64c7tvnsXAZCx0cZ/x9V4egcCRmKfemx5xHH9+z
         hDQo0+p0sy53EvTFgDMEOEUAB9/1f1I6AdXgU5XFx27AzPubD/8OFDS3wJHJXd2PfFVU
         biBQ==
X-Gm-Message-State: AOAM533yAMEQV3KsQQTYYuolgQqzf8PgtemIlCWF8ZZDP1gDkxcJ8+Y1
	dFRhDW01oJY3RJw3ABFTkeSLXhyAjL4=
X-Google-Smtp-Source: 
 ABdhPJw+YkW7Hw2bJd1jE69mVRp0xndU6e9jesGtvC4cbGUMZ78bHEsz2qywvDteVOBWH9lxyijPhw==
X-Received: by 2002:a1c:4604:: with SMTP id t4mr2617407wma.191.1643278857042;
        Thu, 27 Jan 2022 02:20:57 -0800 (PST)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 t14sm4060849wmq.43.2022.01.27.02.20.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jan 2022 02:20:56 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>,
	Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 17/17] gobject-introspection: replace prelink-rtld with
 objdump -p
Date: Thu, 27 Jan 2022 11:20:05 +0100
Message-Id: <20220127102005.3050843-17-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220127102005.3050843-1-alex@linutronix.de>
References: <20220127102005.3050843-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Jan 2022 10:20:59 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161039

g-i internally processes the output with regexes, and seems
happy with what objdump is printing. It only needs to resolve
the library name as passed to the linker to the library file name.
Also recursive resolution (that ldd is doing and objdump is not)
is not necessary.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/classes/gobject-introspection.bbclass    |  2 +-
 ...-error-return-codes-from-ldd-wrapper.patch | 28 -------------------
 .../gobject-introspection_1.70.0.bb           | 14 ++--------
 3 files changed, 3 insertions(+), 41 deletions(-)
 delete mode 100644 meta/recipes-gnome/gobject-introspection/gobject-introspection/0001-giscanner-ignore-error-return-codes-from-ldd-wrapper.patch

diff --git a/meta/classes/gobject-introspection.bbclass b/meta/classes/gobject-introspection.bbclass
index 4db1b362d9..7bf9feb0d6 100644
--- a/meta/classes/gobject-introspection.bbclass
+++ b/meta/classes/gobject-introspection.bbclass
@@ -29,7 +29,7 @@ EXTRA_OEMESON:prepend:class-nativesdk = "${@['', '${GIRMESONBUILD}'][d.getVar('G
 
 # Generating introspection data depends on a combination of native and target
 # introspection tools, and qemu to run the target tools.
-DEPENDS:append:class-target = " gobject-introspection gobject-introspection-native qemu-native prelink-native"
+DEPENDS:append:class-target = " gobject-introspection gobject-introspection-native qemu-native"
 
 # Even though introspection is disabled on -native, gobject-introspection package is still
 # needed for m4 macros.
diff --git a/meta/recipes-gnome/gobject-introspection/gobject-introspection/0001-giscanner-ignore-error-return-codes-from-ldd-wrapper.patch b/meta/recipes-gnome/gobject-introspection/gobject-introspection/0001-giscanner-ignore-error-return-codes-from-ldd-wrapper.patch
deleted file mode 100644
index b484b5e9e6..0000000000
--- a/meta/recipes-gnome/gobject-introspection/gobject-introspection/0001-giscanner-ignore-error-return-codes-from-ldd-wrapper.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From f742da8b3913f4818d3f419117076afe62f4dbf4 Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex.kanavin@gmail.com>
-Date: Wed, 5 Sep 2018 16:46:52 +0200
-Subject: [PATCH] giscanner: ignore error return codes from ldd-wrapper
-
-prelink-rtld, which we use instead of ldd returns 127 when it can't find a library.
-It is not an error per se, but it breaks subprocess.check_output().
-
-Upstream-Status: Inappropriate [oe-core specific]
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
-
----
- giscanner/shlibs.py | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/giscanner/shlibs.py b/giscanner/shlibs.py
-index d67df95..80352a6 100644
---- a/giscanner/shlibs.py
-+++ b/giscanner/shlibs.py
-@@ -102,7 +102,7 @@ def _resolve_non_libtool(options, binary, libraries):
-             args.extend(['otool', '-L', binary.args[0]])
-         else:
-             args.extend(['ldd', binary.args[0]])
--        output = subprocess.check_output(args)
-+        output = subprocess.run(args, check=False, stdout=subprocess.PIPE).stdout
-         if isinstance(output, bytes):
-             output = output.decode("utf-8", "replace")
- 
diff --git a/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.70.0.bb b/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.70.0.bb
index d4ee03d33c..4f72a33bfa 100644
--- a/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.70.0.bb
+++ b/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.70.0.bb
@@ -14,7 +14,6 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=c434e8128a68bedd59b80b2ac1eb1c4a \
                     "
 
 SRC_URI = "${GNOME_MIRROR}/${BPN}/${@oe.utils.trim_version("${PV}", 2)}/${BPN}-${PV}.tar.xz \
-           file://0001-giscanner-ignore-error-return-codes-from-ldd-wrapper.patch \
            file://0001-build-Avoid-the-doctemplates-hack.patch \
            "
 
@@ -33,9 +32,7 @@ DEPENDS += " libffi zlib glib-2.0 python3 flex-native bison-native autoconf-arch
 # target build needs qemu to run temporary introspection binaries created
 # on the fly by g-ir-scanner and a native version of itself to run
 # native versions of its own tools during build.
-# Also prelink-rtld is used to find out library dependencies of introspection binaries
-# (standard ldd doesn't work when cross-compiling).
-DEPENDS:append:class-target = " gobject-introspection-native qemu-native prelink-native"
+DEPENDS:append:class-target = " gobject-introspection-native qemu-native"
 
 # needed for writing out the qemu wrapper script
 export STAGING_DIR_HOST
@@ -55,13 +52,6 @@ EXTRA_OEMESON:class-target = " \
     ${@'-Dgir_dir_prefix=${libdir}' if d.getVar('MULTILIBS') else ''} \
 "
 
-# Need to ensure ld.so.conf exists so prelink-native works
-# both before we build and if we install from sstate
-do_configure[prefuncs] += "gobject_introspection_preconfigure"
-python gobject_introspection_preconfigure () {
-    oe.utils.write_ld_so_conf(d)
-}
-
 do_configure:prepend:class-native() {
         # Tweak the native python scripts so that they don't refer to the
         # full path of native python binary (the solution is taken from glib-2.0 recipe)
@@ -113,7 +103,7 @@ EOF
         # for a different architecture
         cat > ${B}/g-ir-scanner-lddwrapper << EOF
 #!/bin/sh
-prelink-rtld --root=$STAGING_DIR_HOST "\$@"
+$OBJDUMP -p "\$@"
 EOF
         chmod +x ${B}/g-ir-scanner-lddwrapper
 
-- 
2.20.1


