Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68ED4C44514
	for <webhook@archiver.kernel.org>; Wed, 15 Jul 2026 16:48:00 +0000 (UTC)
Received: from mail-oo1-f44.google.com (mail-oo1-f44.google.com [209.85.161.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12401.1784134074477067632
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Jul 2026 09:47:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Jxdg8z4m;
 spf=pass (domain: gmail.com, ip: 209.85.161.44, mailfrom: jpewhacker@gmail.com)
Received: by mail-oo1-f44.google.com with SMTP id 006d021491bc7-6a31c05e092so1594300eaf.0
        for <openembedded-core@lists.openembedded.org>; Wed, 15 Jul 2026 09:47:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784134073; x=1784738873; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sE7ZlMTiQyhWCtgSo9A3oA5ww9ZBkylrgwBq8iRw9ag=;
        b=Jxdg8z4majK5VmsBu15Mury25vy9vEdL+SiQTSQv5co8tA+ZUdWLALF7NGZh3vVvy3
         rEg+Hxg0/9wAA0oF1L/mahXac9rRlBLTG6L0E8JKSwFBlf1YIDC/rBDunU5BYAivZ2Wj
         r8E3zEFxUZkLSg375cFlxEoBdOTDr32s+39WSca0KMTk/YE+mnGUX5umBNpp+S7f4agD
         GhwkZvJh3r7qAHOcZeeXuwPnR56jCLtoRlOgwkHhFtr1qzZlaqH2+uFxYXOxtcsBLVaS
         aL7Sc/GFbtt2BLUDp/R/gwO+B80s7+RE9qaTkI8nBocS3KzWFEyS0+qMydgSv3mB2LtV
         fFWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784134073; x=1784738873;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=sE7ZlMTiQyhWCtgSo9A3oA5ww9ZBkylrgwBq8iRw9ag=;
        b=GUnXZ7p0AArUUXUrWMfT8c9EV6sbCkpDN9Bv3xpS24II1yXl0M74+AC6NGPKQqkhur
         KrnRv+RmNo595GmWNIKrczjKed3mHTg0vNdeRhniXEBYgFGUnmSL9W4HnuqA0OTQ3T6H
         VTPp5uuZ48UZYCUr+IX1gFy9A5uXe8hVU6ruAv7CiHT/hguP1Q7ItG98gBsKXiQPrrHW
         YHV4AQ/JclRyRrNXjQoQg+eo3zW1/Ukmojq048RocFPUKtakaGPyHqU9qFIy0Y2zIF6a
         lw4XZAiifNygTOqdA6WsCkFWbsAEZtal/so079CJC8wkVYzRZ6GhdOBcpDrczHR9hWaW
         CMnA==
X-Gm-Message-State: AOJu0YxBE/F4ps2obHrBFuKotzNyxo+MM5fj+VJmhK9ngC+105dI+lBO
	XrvkVkyX0y+3IJsXQowRNqmn2YxxZeGPEmyi72+R7EpOVVi8e7B2ELRjqdCSjg==
X-Gm-Gg: AfdE7cmi5SDN0W3CPY0dugwbfP+xez5bIF/IrA7Qi1v3m6HCM59sSwKfxUTTs9Uw7C6
	dUrrvAq8a8+9OBTKRbYZO46sZtYXhwCK4xWCa8slqoDu/V8a01EvxVfKJKvrcmkria5t/ttVFOg
	9DhJ9mYeA4Mzzgk4dq4n8LQZF2E/fwHb8/z8RpMrW1abQQ1IZalkpHcVtPvZFMTeqB9+pjvW+N8
	4T3XcgVkwv8hR/cLRGM5Y27VoFOejjEubxBCea0F665M2tYrsXs0Cq5tUgQuhzFZgQ269hSHdgV
	HpYwUvaYWrlFG15PQ0fTYdVsiGOCq36eO3JtRs0h3/O+IZru/pGOrt5OKwlK920JQRFW+cpo3au
	ByBN/6vQUN56OINuR0zLH5224SIVk9Zifu8ABJfw9kGMbB5Opwjfbk+Y4C2AI1BkGUbhSy4oWpQ
	VEE6fvx1Ho
X-Received: by 2002:a05:6820:188f:b0:6a3:695b:ba5 with SMTP id 006d021491bc7-6a3da0f5446mr1952657eaf.70.1784134073534;
        Wed, 15 Jul 2026 09:47:53 -0700 (PDT)
Received: from localhost.localdomain ([2601:283:4b02:22d0::eb5])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-451b64192adsm17354179fac.18.2026.07.15.09.47.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 09:47:53 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH v2 16/25] Fix up licenses
Date: Wed, 15 Jul 2026 10:45:12 -0600
Message-ID: <20260715164739.364323-17-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260715164739.364323-1-JPEWhacker@gmail.com>
References: <20260714190405.3328796-1-JPEWhacker@gmail.com>
 <20260715164739.364323-1-JPEWhacker@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Jul 2026 16:48:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241009

Fixes up several locations where the convert-spdx-license script could
not automatically fix up the license

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/recipes-core/gettext/gettext_1.0.bb          | 2 +-
 meta/recipes-core/util-linux/util-linux_2.42.2.bb | 4 ++--
 meta/recipes-devtools/cmake/cmake-native_4.4.0.bb | 2 +-
 meta/recipes-devtools/cmake/cmake_4.4.0.bb        | 2 +-
 meta/recipes-devtools/fmt/fmt_12.2.0.bb           | 2 +-
 meta/recipes-graphics/cairo/cairo_1.18.4.bb       | 4 ++--
 meta/recipes-graphics/libsdl2/libsdl2_2.32.10.bb  | 2 +-
 meta/recipes-support/libcap/libcap_2.78.bb        | 6 +++---
 8 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/meta/recipes-core/gettext/gettext_1.0.bb b/meta/recipes-core/gettext/gettext_1.0.bb
index 08b4819f27..8a11a55570 100644
--- a/meta/recipes-core/gettext/gettext_1.0.bb
+++ b/meta/recipes-core/gettext/gettext_1.0.bb
@@ -8,7 +8,7 @@ LICENSE = "GPL-3.0-or-later & LGPL-2.1-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=c678957b0c8e964aa6c70fd77641a71e"
 
 # without libxml in PACKAGECONFIG vendor copy of the lib will be used
-LICENSE:append = " ${@bb.utils.contains('PACKAGECONFIG', 'libxml', '', '& MIT', d)}"
+LICENSE:append = " ${@bb.utils.contains('PACKAGECONFIG', 'libxml', '', 'AND MIT', d)}"
 LIC_FILES_CHKSUM:append = " ${@bb.utils.contains('PACKAGECONFIG', 'libxml', '', 'file://libtextstyle/lib/libxml/COPYING;md5=2044417e2e5006b65a8b9067b683fcf1', d)}"
 # without glib in PACKAGECONFIG vendor copy of the lib will be used
 LIC_FILES_CHKSUM:append = " ${@bb.utils.contains('PACKAGECONFIG', 'glib', '', 'file://libtextstyle/lib/glib/ghash.c;md5=e3159f5ac38dfe77af5cc0ee104dab2d;beginline=10;endline=27', d)}"
diff --git a/meta/recipes-core/util-linux/util-linux_2.42.2.bb b/meta/recipes-core/util-linux/util-linux_2.42.2.bb
index 4943d5c7ab..b3d466dc80 100644
--- a/meta/recipes-core/util-linux/util-linux_2.42.2.bb
+++ b/meta/recipes-core/util-linux/util-linux_2.42.2.bb
@@ -2,10 +2,10 @@ require util-linux.inc
 
 # Most of the applications and the libraries are linked with libcommon.la,
 # which uses these licenses
-LIBCOMMON_LICENSES = "LGPL-2.1-or-later & BSD-2-Clause & BSD-3-Clause & MIT"
+LIBCOMMON_LICENSES = "LGPL-2.1-or-later AND BSD-2-Clause AND BSD-3-Clause AND MIT"
 
 # The default license is GPL-2.0-or-later
-DEFAULT_LICENSES = "GPL-2.0-or-later & ${LIBCOMMON_LICENSES}"
+DEFAULT_LICENSES = "GPL-2.0-or-later AND ${LIBCOMMON_LICENSES}"
 
 LICENSE = "GPL-1.0-or-later & GPL-2.0-only & GPL-2.0-or-later & LGPL-2.1-or-later & BSD-2-Clause & BSD-3-Clause & BSD-4-Clause-UC & MIT & EUPL-1.2"
 LICENSE:${PN}-bash-completion = "GPL-2.0-or-later"
diff --git a/meta/recipes-devtools/cmake/cmake-native_4.4.0.bb b/meta/recipes-devtools/cmake/cmake-native_4.4.0.bb
index 840a2fddb9..fe1136bd6c 100644
--- a/meta/recipes-devtools/cmake/cmake-native_4.4.0.bb
+++ b/meta/recipes-devtools/cmake/cmake-native_4.4.0.bb
@@ -7,7 +7,7 @@ SRC_URI += "file://OEToolchainConfig.cmake \
             file://environment.d-cmake.sh \
             "
 
-LICENSE:append = " & BSD-1-Clause & MIT & BSD-2-Clause & curl & Apache-2.0"
+LICENSE:append = " AND BSD-1-Clause AND MIT AND BSD-2-Clause AND curl AND Apache-2.0"
 LIC_FILES_CHKSUM:append = " \
     file://Utilities/cmjsoncpp/LICENSE;md5=5d73c165a0f9e86a1342f32d19ec5926 \
     file://Utilities/cmlibarchive/COPYING;md5=7ce08437ff7f5e24d72e666313ae4084 \
diff --git a/meta/recipes-devtools/cmake/cmake_4.4.0.bb b/meta/recipes-devtools/cmake/cmake_4.4.0.bb
index e6abc06c85..6265316fd9 100644
--- a/meta/recipes-devtools/cmake/cmake_4.4.0.bb
+++ b/meta/recipes-devtools/cmake/cmake_4.4.0.bb
@@ -11,7 +11,7 @@ SRC_URI:append:class-nativesdk = " \
     file://environment.d-cmake.sh \
 "
 
-LICENSE:append = " & BSD-1-Clause & MIT"
+LICENSE:append = " AND BSD-1-Clause AND MIT"
 LIC_FILES_CHKSUM:append = " \
     file://Utilities/cmjsoncpp/LICENSE;md5=5d73c165a0f9e86a1342f32d19ec5926 \
     file://Utilities/cmlibrhash/COPYING;md5=a8c2a557a5c53b1c12cddbee98c099af \
diff --git a/meta/recipes-devtools/fmt/fmt_12.2.0.bb b/meta/recipes-devtools/fmt/fmt_12.2.0.bb
index ca8fcb66ec..d68684e4f6 100644
--- a/meta/recipes-devtools/fmt/fmt_12.2.0.bb
+++ b/meta/recipes-devtools/fmt/fmt_12.2.0.bb
@@ -1,7 +1,7 @@
 SUMMARY = "open-source formatting library for C++"
 DESCRIPTION = "{fmt} is an open-source formatting library for C++. It can be used as a safe and fast alternative to (s)printf and iostreams."
 HOMEPAGE = "https://fmt.dev"
-LICENSE = "MIT-with-fmt-exception"
+LICENSE = "MIT WITH fmt-exception"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=6ec080902ed8f82f5a97ed13e8042634 \
                     file://doc/LICENSE-exception;md5=b9257785fc4f3803a4b71b76c1412729"
 
diff --git a/meta/recipes-graphics/cairo/cairo_1.18.4.bb b/meta/recipes-graphics/cairo/cairo_1.18.4.bb
index 3f6d02f8d4..0ed81166b5 100644
--- a/meta/recipes-graphics/cairo/cairo_1.18.4.bb
+++ b/meta/recipes-graphics/cairo/cairo_1.18.4.bb
@@ -19,8 +19,8 @@ LICENSE:${PN}-script-interpreter = "MPL-1.1 | LGPL-2.1-only"
 LICENSE:${PN}-perf-utils = "GPL-3.0-or-later"
 # Adapt the licenses for cairo-dbg and cairo-src depending on whether
 # cairo-trace is being built.
-LICENSE:${PN}-dbg = "(MPL-1.1 | LGPL-2.1-only)${@bb.utils.contains('PACKAGECONFIG', 'trace', ' & GPL-3.0-or-later', '', d)}"
-LICENSE:${PN}-src = "(MPL-1.1 | LGPL-2.1-only)${@bb.utils.contains('PACKAGECONFIG', 'trace', ' & GPL-3.0-or-later', '', d)}"
+LICENSE:${PN}-dbg = "(MPL-1.1 OR LGPL-2.1-only)${@bb.utils.contains('PACKAGECONFIG', 'trace', ' AND GPL-3.0-or-later', '', d)}"
+LICENSE:${PN}-src = "(MPL-1.1 OR LGPL-2.1-only)${@bb.utils.contains('PACKAGECONFIG', 'trace', ' AND GPL-3.0-or-later', '', d)}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=e73e999e0c72b5ac9012424fa157ad77 \
                     ${@bb.utils.contains('PACKAGECONFIG', 'trace', 'file://util/cairo-trace/COPYING-GPL-3;md5=d32239bcb673463ab874e80d47fae504', '', d)}"
diff --git a/meta/recipes-graphics/libsdl2/libsdl2_2.32.10.bb b/meta/recipes-graphics/libsdl2/libsdl2_2.32.10.bb
index 880bf56167..091ce8ed8b 100644
--- a/meta/recipes-graphics/libsdl2/libsdl2_2.32.10.bb
+++ b/meta/recipes-graphics/libsdl2/libsdl2_2.32.10.bb
@@ -16,7 +16,7 @@ LIC_FILES_CHKSUM = "\
 "
 
 # arm-neon adds MIT license
-LICENSE:append = " ${@bb.utils.contains('PACKAGECONFIG', 'arm-neon', '& MIT', '', d)}"
+LICENSE:append = " ${@bb.utils.contains('PACKAGECONFIG', 'arm-neon', 'AND MIT', '', d)}"
 LIC_FILES_CHKSUM:append = " ${@bb.utils.contains('PACKAGECONFIG', 'arm-neon', 'file://src/video/arm/pixman-arm-neon-asm.h;md5=9a9cc1e51abbf1da58f4d9528ec9d49b;beginline=1;endline=24', '', d)}"
 
 PROVIDES = "virtual/libsdl2"
diff --git a/meta/recipes-support/libcap/libcap_2.78.bb b/meta/recipes-support/libcap/libcap_2.78.bb
index 85cd8004f1..d804e94244 100644
--- a/meta/recipes-support/libcap/libcap_2.78.bb
+++ b/meta/recipes-support/libcap/libcap_2.78.bb
@@ -5,7 +5,7 @@ users, without giving them full root permissions."
 HOMEPAGE = "http://sites.google.com/site/fullycapable/"
 
 # The library is BSD | GPLv2, the PAM module is BSD | LGPLv2+
-LICENSE = "(BSD-3-Clause | GPL-2.0-only) & (BSD-3-Clause | LGPL-2.0-or-later)"
+LICENSE = "(BSD-3-Clause OR GPL-2.0-only) AND (BSD-3-Clause OR LGPL-2.0-or-later)"
 LIC_FILES_CHKSUM = "file://License;md5=2965a646645b72ecee859b43c592dcaa \
                     file://pam_cap/License;md5=905326f41d3d1f8df21943f9a4ed6b50 \
                     "
@@ -108,8 +108,8 @@ do_install_ptest() {
 FILES:${PN} += "${base_libdir}/security/*.so"
 
 # The license of the main package depends on whether PAM is enabled or not
-LICENSE:${PN} = "(BSD-3-Clause | GPL-2.0-only)${@bb.utils.contains('PACKAGECONFIG', 'pam', ' & (BSD-3-Clause | LGPL-2.0-or-later)', '', d)}"
-LICENSE:${PN}-dev = "(BSD-3-Clause | GPL-2.0-only)"
+LICENSE:${PN} = "(BSD-3-Clause OR GPL-2.0-only)${@bb.utils.contains('PACKAGECONFIG', 'pam', ' AND (BSD-3-Clause OR LGPL-2.0-or-later)', '', d)}"
+LICENSE:${PN}-dev = "BSD-3-Clause OR GPL-2.0-only"
 
 BBCLASSEXTEND = "native nativesdk"
 
-- 
2.54.0


