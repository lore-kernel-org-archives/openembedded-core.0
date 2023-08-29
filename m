Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4CB2C71153
	for <webhook@archiver.kernel.org>; Tue, 29 Aug 2023 21:06:00 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web10.2470.1693343151794996864
 for <openembedded-core@lists.openembedded.org>;
 Tue, 29 Aug 2023 14:05:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=AlgqY2Jv;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.47, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4013454fa93so42901835e9.0
        for <openembedded-core@lists.openembedded.org>; Tue, 29 Aug 2023 14:05:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1693343150; x=1693947950; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=fO3AyV91g49gEEgvLeD0oaYCXvZ1/nt0aAN3623C+Vo=;
        b=AlgqY2JvqZp1Kfmoypy9H0v6w3/MDMTZHIUbzG7hJdTkMFTHX1z+sgYirSvQTgMwHp
         JaDA+sAiM2lQ6XKYIB4bTX0w6qjSAfNnbvTG5vM5fAgBpwCdA4QdT8Fj4uW12iEbfgsn
         JhEm2MHqD8SN8bd6WqbfO0YuQ5qtnqdKAZ7Y4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693343150; x=1693947950;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fO3AyV91g49gEEgvLeD0oaYCXvZ1/nt0aAN3623C+Vo=;
        b=SaXL2KNX1fXuF0wK7CYr35DOiHvz4TwHSiSDSy+icsCw34/8K9/rv+meidrLjjBWbq
         0aumZsF7Cc0K2QtaVvZMnYti90RdIWaoufXuNXyD6QR4AtAQ0pjzU/vJKngSUr5E1jyV
         kGSENRcKrdMb9ux6/+vntauXjxHQls3M8QUZw7jg5l+2ociCeLPt/pKsXqa0PP1SE/r5
         vApmwEH4/asno5U8mYT1ilCbLl6k2Go4z0SsoM8MJ9ohwr/jNIkmH3cYCuMUDEPoLbhK
         7m+mYTEiJ8TXNbk67CD3A+SiLh4tWBJdO4NxyXGFfeDcwHe2Zrdj/nWZ9JgWHUwzdy8v
         iYPQ==
X-Gm-Message-State: AOJu0YzGC63U1RR8PqN6lUCG5LshL0PXdKhngo2mSS0lHRPWILHh667U
	11+VPohbYebo3ietr9Q9vr1h/NM2hUf2FEQCbUU=
X-Google-Smtp-Source: AGHT+IFSsbxGXTD8/YcrmDI2R7rfMHiO0CI6tGvh9G5oHYPlUDWZkOahUw/HZfLawoHwSGwq5qhQ/w==
X-Received: by 2002:a05:600c:28c:b0:400:57d1:4910 with SMTP id 12-20020a05600c028c00b0040057d14910mr309910wmk.17.1693343149422;
        Tue, 29 Aug 2023 14:05:49 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:15ec:a052:9304:60a5])
        by smtp.gmail.com with ESMTPSA id o10-20020a1c750a000000b003fee7b67f67sm69736wmc.31.2023.08.29.14.05.48
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Aug 2023 14:05:48 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] qemu: Upgrade 8.0.4 -> 8.1.0
Date: Tue, 29 Aug 2023 22:05:47 +0100
Message-Id: <20230829210547.1881374-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 29 Aug 2023 21:06:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186866

This upgrade isn't straighforward as upstream made changes. A pyenv
is now needed containing meson. This doesn't work for us for reasons
as yet unclear however it does mean we need python3native inherited
for that to stand a chance of working as otherwise host system
dependencies may be missing. For now, allow meson to work from our
sysroot via a patch. Our meson is always deterministic anyway so
we don't need their help for that.

The submodules approach used previously has changed, switch the options
for new ones to disable downloads and docs.

Some of the images binaries shipped for s390 show QA warnings for
relocations in code sections. Drop those binaries to avoid the QA
warnings since we don't need them anyway.

Drop a backported patch and refresh another.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/conf/distro/include/tcmode-default.inc   |  2 +-
 ...u-native_8.0.4.bb => qemu-native_8.1.0.bb} |  0
 ...e_8.0.4.bb => qemu-system-native_8.1.0.bb} |  0
 meta/recipes-devtools/qemu/qemu.inc           | 17 ++--
 ...lative-paths-for-line-preprocessor-d.patch | 84 -------------------
 ...dd-pkg-config-handling-for-libgcrypt.patch | 12 +--
 .../qemu/qemu/fixedmeson.patch                | 20 +++++
 .../qemu/{qemu_8.0.4.bb => qemu_8.1.0.bb}     |  0
 8 files changed, 38 insertions(+), 97 deletions(-)
 rename meta/recipes-devtools/qemu/{qemu-native_8.0.4.bb => qemu-native_8.1.0.bb} (100%)
 rename meta/recipes-devtools/qemu/{qemu-system-native_8.0.4.bb => qemu-system-native_8.1.0.bb} (100%)
 delete mode 100644 meta/recipes-devtools/qemu/qemu/0001-tracetool-use-relative-paths-for-line-preprocessor-d.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/fixedmeson.patch
 rename meta/recipes-devtools/qemu/{qemu_8.0.4.bb => qemu_8.1.0.bb} (100%)

diff --git a/meta/conf/distro/include/tcmode-default.inc b/meta/conf/distro/include/tcmode-default.inc
index 660ca5f72d6..2e403ce9808 100644
--- a/meta/conf/distro/include/tcmode-default.inc
+++ b/meta/conf/distro/include/tcmode-default.inc
@@ -22,7 +22,7 @@ BINUVERSION ?= "2.41%"
 GDBVERSION ?= "13.%"
 GLIBCVERSION ?= "2.38"
 LINUXLIBCVERSION ?= "6.4%"
-QEMUVERSION ?= "8.0%"
+QEMUVERSION ?= "8.1%"
 GOVERSION ?= "1.20%"
 LLVMVERSION ?= "16.%"
 RUSTVERSION ?= "1.70%"
diff --git a/meta/recipes-devtools/qemu/qemu-native_8.0.4.bb b/meta/recipes-devtools/qemu/qemu-native_8.1.0.bb
similarity index 100%
rename from meta/recipes-devtools/qemu/qemu-native_8.0.4.bb
rename to meta/recipes-devtools/qemu/qemu-native_8.1.0.bb
diff --git a/meta/recipes-devtools/qemu/qemu-system-native_8.0.4.bb b/meta/recipes-devtools/qemu/qemu-system-native_8.1.0.bb
similarity index 100%
rename from meta/recipes-devtools/qemu/qemu-system-native_8.0.4.bb
rename to meta/recipes-devtools/qemu/qemu-system-native_8.1.0.bb
diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index 82a7b361b13..131162dd62f 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -9,7 +9,9 @@ LICENSE = "GPL-2.0-only & LGPL-2.1-only"
 RDEPENDS:${PN}-ptest = "bash"
 
 require qemu-targets.inc
-inherit pkgconfig ptest update-rc.d systemd
+# https://gitlab.com/qemu-project/qemu/-/commit/81e2b198a8cb4ee5fdf108bd438f44b193ee3a36 means
+# we need a full python3-native setup
+inherit pkgconfig ptest update-rc.d systemd python3native
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=441c28d2cf86e15a37fa47e15a72fbac \
                     file://COPYING.LIB;endline=24;md5=8c5efda6cf1e1b03dcfd0e6c0d271c7f"
@@ -27,13 +29,13 @@ SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
            file://0009-Define-MAP_SYNC-and-MAP_SHARED_VALIDATE-on-needed-li.patch \
            file://0010-hw-pvrdma-Protect-against-buggy-or-malicious-guest-d.patch \
            file://0002-linux-user-Replace-use-of-lfs64-related-functions-an.patch \
-           file://0001-tracetool-use-relative-paths-for-line-preprocessor-d.patch \
+           file://fixedmeson.patch \
            file://qemu-guest-agent.init \
            file://qemu-guest-agent.udev \
            "
 UPSTREAM_CHECK_REGEX = "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
 
-SRC_URI[sha256sum] = "81c817dda38af958be5bef1a6cf55b658bb2d3fb87c1e6a571de6b7b2c44516c"
+SRC_URI[sha256sum] = "710c101198e334d4762eef65f649bc43fa8a5dd75303554b8acfec3eb25f0e55"
 
 SRC_URI:append:class-target = " file://cross.patch"
 SRC_URI:append:class-nativesdk = " file://cross.patch"
@@ -104,9 +106,8 @@ EXTRA_OECONF = " \
     --disable-werror \
     --extra-cflags='${CFLAGS}' \
     --extra-ldflags='${LDFLAGS}' \
-    --with-git=/bin/false \
-    --with-git-submodules=ignore \
-    --meson=meson \
+    --disable-download \
+    --disable-docs \
     ${PACKAGECONFIG_CONFARGS} \
     "
 
@@ -144,6 +145,10 @@ do_install () {
 		install -m 0644 ${S}/contrib/systemd/qemu-guest-agent.service ${D}${systemd_unitdir}/system
 		sed -i -e 's,-/usr/bin/,-${bindir}/,g' ${D}${systemd_unitdir}/system/qemu-guest-agent.service
 	fi
+	# ELF binary /usr/share/qemu/s390-netboot.img has relocations in .text
+	rm ${D}${datadir}/qemu/s390-netboot.img -f
+	# ELF binary /usr/share/qemu/s390-ccw.img has relocations in .text [textrel]
+	rm ${D}${datadir}/qemu/s390-ccw.img -f
 }
 
 # The following fragment will create a wrapper for qemu-mips user emulation
diff --git a/meta/recipes-devtools/qemu/qemu/0001-tracetool-use-relative-paths-for-line-preprocessor-d.patch b/meta/recipes-devtools/qemu/qemu/0001-tracetool-use-relative-paths-for-line-preprocessor-d.patch
deleted file mode 100644
index 049b9a51052..00000000000
--- a/meta/recipes-devtools/qemu/qemu/0001-tracetool-use-relative-paths-for-line-preprocessor-d.patch
+++ /dev/null
@@ -1,84 +0,0 @@
-From 348ea441db84a211d4fca7ef5544b5cd06a8a872 Mon Sep 17 00:00:00 2001
-From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
-Date: Tue, 4 Apr 2023 15:26:07 +0200
-Subject: [PATCH] tracetool: use relative paths for '#line' preprocessor
- directives
-
-The event filename is an absolute path. Convert it to a relative path when
-writing '#line' directives, to preserve reproducibility of the generated
-output when different base paths are used.
-
-Upstream-Status: Accepted [https://gitlab.com/qemu-project/qemu/-/commit/9d672e290475001fcecdcc9dc79ad088ff89d17f]
-
----
- scripts/tracetool/backend/ftrace.py | 4 +++-
- scripts/tracetool/backend/log.py    | 4 +++-
- scripts/tracetool/backend/syslog.py | 4 +++-
- 3 files changed, 9 insertions(+), 3 deletions(-)
-
-Index: qemu-8.0.0/scripts/tracetool/backend/ftrace.py
-===================================================================
---- qemu-8.0.0.orig/scripts/tracetool/backend/ftrace.py
-+++ qemu-8.0.0/scripts/tracetool/backend/ftrace.py
-@@ -12,6 +12,8 @@ __maintainer__ = "Stefan Hajnoczi"
- __email__      = "stefanha@redhat.com"
- 
- 
-+import os.path
-+
- from tracetool import out
- 
- 
-@@ -45,7 +47,7 @@ def generate_h(event, group):
-         args=event.args,
-         event_id="TRACE_" + event.name.upper(),
-         event_lineno=event.lineno,
--        event_filename=event.filename,
-+        event_filename=os.path.relpath(event.filename),
-         fmt=event.fmt.rstrip("\n"),
-         argnames=argnames)
- 
-Index: qemu-8.0.0/scripts/tracetool/backend/log.py
-===================================================================
---- qemu-8.0.0.orig/scripts/tracetool/backend/log.py
-+++ qemu-8.0.0/scripts/tracetool/backend/log.py
-@@ -12,6 +12,8 @@ __maintainer__ = "Stefan Hajnoczi"
- __email__      = "stefanha@redhat.com"
- 
- 
-+import os.path
-+
- from tracetool import out
- 
- 
-@@ -53,7 +55,7 @@ def generate_h(event, group):
-         '    }',
-         cond=cond,
-         event_lineno=event.lineno,
--        event_filename=event.filename,
-+        event_filename=os.path.relpath(event.filename),
-         name=event.name,
-         fmt=event.fmt.rstrip("\n"),
-         argnames=argnames)
-Index: qemu-8.0.0/scripts/tracetool/backend/syslog.py
-===================================================================
---- qemu-8.0.0.orig/scripts/tracetool/backend/syslog.py
-+++ qemu-8.0.0/scripts/tracetool/backend/syslog.py
-@@ -12,6 +12,8 @@ __maintainer__ = "Stefan Hajnoczi"
- __email__      = "stefanha@redhat.com"
- 
- 
-+import os.path
-+
- from tracetool import out
- 
- 
-@@ -41,7 +43,7 @@ def generate_h(event, group):
-         '    }',
-         cond=cond,
-         event_lineno=event.lineno,
--        event_filename=event.filename,
-+        event_filename=os.path.relpath(event.filename),
-         name=event.name,
-         fmt=event.fmt.rstrip("\n"),
-         argnames=argnames)
diff --git a/meta/recipes-devtools/qemu/qemu/0004-configure-Add-pkg-config-handling-for-libgcrypt.patch b/meta/recipes-devtools/qemu/qemu/0004-configure-Add-pkg-config-handling-for-libgcrypt.patch
index 02f22143c13..f981a64a543 100644
--- a/meta/recipes-devtools/qemu/qemu/0004-configure-Add-pkg-config-handling-for-libgcrypt.patch
+++ b/meta/recipes-devtools/qemu/qemu/0004-configure-Add-pkg-config-handling-for-libgcrypt.patch
@@ -14,16 +14,16 @@ Signed-off-by: He Zhe <zhe.he@windriver.com>
  meson.build | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
-Index: qemu-8.0.0/meson.build
+Index: qemu-8.1.0/meson.build
 ===================================================================
---- qemu-8.0.0.orig/meson.build
-+++ qemu-8.0.0/meson.build
-@@ -1213,7 +1213,7 @@ endif
+--- qemu-8.1.0.orig/meson.build
++++ qemu-8.1.0/meson.build
+@@ -1481,7 +1481,7 @@ endif
  if not gnutls_crypto.found()
    if (not get_option('gcrypt').auto() or have_system) and not get_option('nettle').enabled()
      gcrypt = dependency('libgcrypt', version: '>=1.8',
 -                        method: 'config-tool',
 +                        method: 'pkg-config',
-                         required: get_option('gcrypt'),
-                         kwargs: static_kwargs)
+                         required: get_option('gcrypt'))
      # Debian has removed -lgpg-error from libgcrypt-config
+     # as it "spreads unnecessary dependencies" which in
diff --git a/meta/recipes-devtools/qemu/qemu/fixedmeson.patch b/meta/recipes-devtools/qemu/qemu/fixedmeson.patch
new file mode 100644
index 00000000000..0cbaea07ca6
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/fixedmeson.patch
@@ -0,0 +1,20 @@
+Upstream-Status: Inappropriate [workaround, would need a real fix for upstream]
+
+Index: qemu-8.1.0/configure
+===================================================================
+--- qemu-8.1.0.orig/configure
++++ qemu-8.1.0/configure
+@@ -1032,12 +1032,7 @@ then
+     exit 1
+ fi
+ 
+-# At this point, we expect Meson to be installed and available.
+-# We expect mkvenv or pip to have created pyvenv/bin/meson for us.
+-# We ignore PATH completely here: we want to use the venv's Meson
+-# *exclusively*.
+-
+-meson="$(cd pyvenv/bin; pwd)/meson"
++meson=`which meson`
+ 
+ # Conditionally ensure Sphinx is installed.
+ 
diff --git a/meta/recipes-devtools/qemu/qemu_8.0.4.bb b/meta/recipes-devtools/qemu/qemu_8.1.0.bb
similarity index 100%
rename from meta/recipes-devtools/qemu/qemu_8.0.4.bb
rename to meta/recipes-devtools/qemu/qemu_8.1.0.bb
-- 
2.39.2


