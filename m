Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBA57C87FD1
	for <webhook@archiver.kernel.org>; Tue,  5 Aug 2025 06:39:33 +0000 (UTC)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
 by mx.groups.io with SMTP id smtpd.web10.16075.1754375969504768655
 for <openembedded-core@lists.openembedded.org>;
 Mon, 04 Aug 2025 23:39:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=MweTNW1I;
 spf=pass (domain: gmail.com, ip: 209.85.218.50, mailfrom: skandigraun@gmail.com)
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-ae9c2754a00so1266192266b.2
        for <openembedded-core@lists.openembedded.org>; Mon, 04 Aug 2025 23:39:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754375968; x=1754980768; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ArKYwAQmm++0rlY45N+QZXm3oK79D0kt5KAjtdysCg8=;
        b=MweTNW1II6Kewy+iryXiBd8IGTrg+Onwaa4hzjDo52t/6h8DTCatiu/cGnh/OJLwg/
         j4PR/DPNb16eS2hI5sUATJ0J4/XaYnSmxtS7sStvg6zjJepcDhFz0HVmbWurfaKcI9Si
         BJ4/WsaiPeQhFJsg4fuEUPSQxh4GxL/3lS4szX+W4N6ej1njOksR8J4UmtGdzwJ8uY5D
         k7vRYjf7rVQSSss1hCPOEXspMCcKYHmUDPOdCJiUZikRuNWqE3p1rhf68GJocakjaz2j
         /FC6YP9a6s+V8Loq+qZ/6FEGWICUjOVCbD6DOOEqChygYpdzUFK31w5A8lFYC89zWSWR
         SC2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754375968; x=1754980768;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ArKYwAQmm++0rlY45N+QZXm3oK79D0kt5KAjtdysCg8=;
        b=w9OgLFR5GZ7SLXu42ZljxkWnzjA7qa5/o1KDnad9phdTzvaZROk9Eja17mP8twz7gB
         +eUxq8OcfQkN3bkyO++u5hjqDDVVHdgj8D3RiE8LDxtreEKbDvR7hSKxSRPUpOAIAWG4
         HdexAQvUjDsMk5Jc5qofr8JQ6vMhudrooxV7VEn4uQB2bvlY7LA9DaS9DY809IE9SPF8
         GLss+TDowV0OF+e9JNfSnv4IHSVe6RAuYKM6UO7QnDzwfHZY/nAeVgY98xgt7WhSfOj/
         uWfksFGhMfDK4f1zTmiJoEOQRolTPYIcgD/UTmH+QEM+ZEMNPohQFSCE5fASYwPXYSLn
         q3mQ==
X-Gm-Message-State: AOJu0Yx++Vk3gT3Wn7r6It6NzM6cRY0/dW07dUPewfVGQIBXSj1HHaAS
	y9D5BNc9nHjjtlXf6wzET0zOiAA4DSqFESEdbXsDhA0U66O2DLU/eDbUog3TpQ==
X-Gm-Gg: ASbGncsBD+WB/+3SetftZ30n8EbVprjy20PkaZ9IRSj9XOH+PV3GefGNB110uQriPTs
	Cfh4Q0WnsPv1+QhzACNgQVMvC1Eyi3RsAiedJUdwVFjFzsqBn/ce2PCkOunA5N/W8oxCkE9VQNr
	HFGQ2oECNbAJEePLt61v28psjQomlTYfDvuOuWMop1MBLbenGMmrcBJlP5AEcsNzoF90LKbmRzD
	Y2TqRgfiJOo17xq+Sc0PFqUO6MjuLcT7mNDUqXLlnKNYIzHPk+LwCyov7FRHotiCaxiEIgWVE16
	z54vfI6AvD91A8wN48EN0YhbkWXHSVYUt0Wn2YBfnRIkgV9K5UECay6IaKpe62O9eayTmbu/pbx
	vSs/LjQ2PGn2tWk7X2Gw=
X-Google-Smtp-Source: AGHT+IE1Y9TwINY3e0ucshCoGNzxF2tIxNv6MuoMWAdDOi7fyN1RXlJ/TcDFU7PQzxqR5/jzgWaZaQ==
X-Received: by 2002:a17:906:730e:b0:ad5:777d:83d8 with SMTP id a640c23a62f3a-af94016a3e8mr1203894666b.29.1754375967464;
        Mon, 04 Aug 2025 23:39:27 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af91a243728sm851773966b.138.2025.08.04.23.39.26
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Aug 2025 23:39:27 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] librsvg: add ptest support
Date: Tue,  5 Aug 2025 08:39:25 +0200
Message-ID: <20250805063925.771875-2-skandigraun@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250805063925.771875-1-skandigraun@gmail.com>
References: <20250805063925.771875-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 05 Aug 2025 06:39:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221454

The tests execution is quick, on my machine it's ~5 seconds.

One test looks broken, for which a patch was submitted upstream:
the test tries to load a file using a local URL, however it uses
a relative path (including ".."), while the base is not root, but
the current directory. Strictly speaking this is not a valid
file:// url, and Rust's url crate does transforms it by removing
the ".." and "." sections, thus pointing to a non-existing file.

To solve it, the change detects the absolute path of the resource before
loading it as a url.

One note about the installation location: the test executable
looks for the other resources by a hardcoded relative path always,
which starts with "../..", so the test binary needs to be 2 directory
deep compared to the testdata folder, this is why it is embedded in
./tests/bin folder (the naming is arbitrary, but the depth is specific).

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../distro/include/ptest-packagelists.inc     |  1 +
 ...01-fix-handle_new_from_file-api-test.patch | 56 +++++++++++++++++++
 meta/recipes-gnome/librsvg/librsvg/run-ptest  |  2 +
 meta/recipes-gnome/librsvg/librsvg_2.60.0.bb  | 30 +++++++++-
 4 files changed, 86 insertions(+), 3 deletions(-)
 create mode 100644 meta/recipes-gnome/librsvg/librsvg/0001-fix-handle_new_from_file-api-test.patch
 create mode 100644 meta/recipes-gnome/librsvg/librsvg/run-ptest

diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/conf/distro/include/ptest-packagelists.inc
index e3099439f4..a85f4c8a5d 100644
--- a/meta/conf/distro/include/ptest-packagelists.inc
+++ b/meta/conf/distro/include/ptest-packagelists.inc
@@ -33,6 +33,7 @@ PTESTS_FAST = "\
     libgpg-error\
     libnl \
     libpcre \
+    librsvg \
     libssh2 \
     libtest-fatal-perl \
     libtest-needs-perl \
diff --git a/meta/recipes-gnome/librsvg/librsvg/0001-fix-handle_new_from_file-api-test.patch b/meta/recipes-gnome/librsvg/librsvg/0001-fix-handle_new_from_file-api-test.patch
new file mode 100644
index 0000000000..1e0d9e3d96
--- /dev/null
+++ b/meta/recipes-gnome/librsvg/librsvg/0001-fix-handle_new_from_file-api-test.patch
@@ -0,0 +1,56 @@
+From 061a87860995f89f091ca63fe88b630549f78b0f Mon Sep 17 00:00:00 2001
+From: Gyorgy Sarvari <skandigraun@gmail.com>
+Date: Sun, 3 Aug 2025 20:50:30 +0200
+Subject: [PATCH] fix handle_new_from_file api test
+
+The test that verifies that files can be loaded using an url (file://)
+constructs a url using relative path, using the current directory as
+the base (e.g. file://./tests/bin/../../rsvg/tests/foo..svg).
+
+Since the base is not "/", this makes this url invalid, and the test fails.
+
+Instead of the relative path, determine the absolute path of the test file,
+and construct the url from that.
+
+Upstream-Status: Submitted [https://gitlab.gnome.org/GNOME/librsvg/-/merge_requests/1122]
+
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ librsvg-c/tests-c/api.c | 10 +++++++++-
+ 1 file changed, 9 insertions(+), 1 deletion(-)
+
+diff --git a/librsvg-c/tests-c/api.c b/librsvg-c/tests-c/api.c
+index 79b5357d..7b0e1295 100644
+--- a/librsvg-c/tests-c/api.c
++++ b/librsvg-c/tests-c/api.c
+@@ -13,6 +13,7 @@
+ #include <stdio.h>
+ #include <glib.h>
+ #include <cairo.h>
++#include <stdlib.h>
+ 
+ #define RSVG_DISABLE_DEPRECATION_WARNINGS /* so we can test deprecated API */
+ #include <librsvg/rsvg.h>
+@@ -426,7 +427,13 @@ static void
+ handle_new_from_file (void)
+ {
+     char *filename = get_test_filename ("dpi.svg");
+-    char *uri = g_strconcat ("file://", filename, NULL);
++#ifdef _WIN32
++    char abs_path[1024];
++    _fullpath(abs_path, filename, 1024);
++#else
++    char *abs_path = realpath(filename, NULL);
++#endif
++    char *uri = g_strconcat ("file://", abs_path, NULL);
+ 
+     RsvgHandle *handle;
+     GError *error = NULL;
+@@ -444,6 +451,7 @@ handle_new_from_file (void)
+     g_object_unref (handle);
+ 
+     g_free (filename);
++    g_free (abs_path);
+     g_free (uri);
+ }
+ 
diff --git a/meta/recipes-gnome/librsvg/librsvg/run-ptest b/meta/recipes-gnome/librsvg/librsvg/run-ptest
new file mode 100644
index 0000000000..c2daf916b0
--- /dev/null
+++ b/meta/recipes-gnome/librsvg/librsvg/run-ptest
@@ -0,0 +1,2 @@
+#!/bin/sh
+./tests/bin/api
diff --git a/meta/recipes-gnome/librsvg/librsvg_2.60.0.bb b/meta/recipes-gnome/librsvg/librsvg_2.60.0.bb
index 5cf0a46fd1..5d049a6871 100644
--- a/meta/recipes-gnome/librsvg/librsvg_2.60.0.bb
+++ b/meta/recipes-gnome/librsvg/librsvg_2.60.0.bb
@@ -13,7 +13,7 @@ SECTION = "x11/utils"
 DEPENDS = "cairo gdk-pixbuf glib-2.0 libxml2 pango python3-docutils-native cargo-c-native"
 BBCLASSEXTEND = "native nativesdk"
 
-inherit cargo_common gnomebase pixbufcache gobject-introspection rust vala gi-docgen cargo-update-recipe-crates
+inherit cargo_common gnomebase pixbufcache gobject-introspection rust vala gi-docgen cargo-update-recipe-crates ptest
 GIR_MESON_ENABLE_FLAG = 'enabled'
 GIR_MESON_DISABLE_FLAG = 'disabled'
 GIDOCGEN_MESON_OPTION = 'docs'
@@ -22,7 +22,9 @@ GIDOCGEN_MESON_DISABLE_FLAG = 'disabled'
 
 require ${BPN}-crates.inc
 
-SRC_URI += "file://0001-query-rustc-append-RUSTFLAGS-to-rustc-executable.patch"
+SRC_URI += "file://0001-query-rustc-append-RUSTFLAGS-to-rustc-executable.patch \
+            file://0001-fix-handle_new_from_file-api-test.patch \
+            file://run-ptest"
 
 SRC_URI[archive.sha256sum] = "0b6ffccdf6e70afc9876882f5d2ce9ffcf2c713cbaaf1ad90170daa752e1eec3"
 
@@ -58,17 +60,39 @@ LDFLAGS += " -L${B}/rsvg"
 # needed on ubuntu 20.04/debian 11 to avoid 'undefined reference to `dlsym'' errors
 BUILD_LDFLAGS += " -ldl"
 
-PACKAGECONFIG ??= "gdkpixbuf"
+PACKAGECONFIG ??= "gdkpixbuf ${@bb.utils.contains('PTEST_ENABLED', '1', 'tests', '', d)}"
 PACKAGECONFIG:append:class-target = " ${@bb.utils.contains('GI_DATA_ENABLED', 'True', 'vala', '', d)}"
 # The gdk-pixbuf loader
 PACKAGECONFIG[gdkpixbuf] = "-Dpixbuf-loader=enabled,-Dpixbuf-loader=disabled,gdk-pixbuf-native"
 PACKAGECONFIG[vala] = "-Dvala=enabled,-Dvala=disabled"
+PACKAGECONFIG[tests] = "-Dtests=true,-Dtests=false"
 
 do_install:append() {
 	# Loadable modules don't need .a or .la on Linux
 	rm -f ${D}${libdir}/gdk-pixbuf-2.0/*/loaders/*.a ${D}${libdir}/gdk-pixbuf-2.0/*/loaders/*.la
 }
 
+do_install_ptest(){
+       install -d  ${D}${PTEST_PATH}/tests/bin \
+                   ${D}${PTEST_PATH}/rsvg/tests/fixtures/api \
+                   ${D}${PTEST_PATH}/rsvg/tests/fixtures/dimensions \
+                   ${D}${PTEST_PATH}/rsvg/tests/fixtures/loading
+
+       install ${B}/librsvg-c/tests-c/api ${D}${PTEST_PATH}/tests/bin/
+       install ${S}/rsvg/tests/fixtures/api/* ${D}${PTEST_PATH}/rsvg/tests/fixtures/api/
+
+       install ${S}/rsvg/tests/fixtures/dimensions/bug608102.svg ${D}${PTEST_PATH}/rsvg/tests/fixtures/dimensions
+       install ${S}/rsvg/tests/fixtures/dimensions/bug612951.svg ${D}${PTEST_PATH}/rsvg/tests/fixtures/dimensions
+       install ${S}/rsvg/tests/fixtures/dimensions/bug614018.svg ${D}${PTEST_PATH}/rsvg/tests/fixtures/dimensions
+       install ${S}/rsvg/tests/fixtures/dimensions/sub-rect-no-unit.svg ${D}${PTEST_PATH}/rsvg/tests/fixtures/dimensions
+       install ${S}/rsvg/tests/fixtures/dimensions/bug521-with-viewbox.svg ${D}${PTEST_PATH}/rsvg/tests/fixtures/dimensions
+       install ${S}/rsvg/tests/fixtures/dimensions/bug823-position-sub.svg ${D}${PTEST_PATH}/rsvg/tests/fixtures/dimensions
+
+       install ${S}/rsvg/tests/fixtures/loading/bar.svg ${D}${PTEST_PATH}/rsvg/tests/fixtures/loading/
+       install ${S}/rsvg/tests/fixtures/loading/gnome-cool.svg ${D}${PTEST_PATH}/rsvg/tests/fixtures/loading/
+       install ${S}/rsvg/tests/fixtures/loading/gnome-cool.svgz ${D}${PTEST_PATH}/rsvg/tests/fixtures/loading/
+}
+
 PACKAGES =+ "librsvg-gtk rsvg"
 FILES:rsvg = "${bindir}/rsvg* \
 	      ${datadir}/pixmaps/svg-viewer.svg \

