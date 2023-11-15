Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D172C2BB3F
	for <webhook@archiver.kernel.org>; Wed, 15 Nov 2023 18:24:28 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.web11.20960.1700072663152724374
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Nov 2023 10:24:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=NszxCfRY;
 spf=pass (domain: gmail.com, ip: 209.85.214.169, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-1cc0d0a0355so55102145ad.3
        for <openembedded-core@lists.openembedded.org>; Wed, 15 Nov 2023 10:24:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700072662; x=1700677462; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YwnbFEowCOIPXHVnTy11nqwwrucONumx37RdmdwMisc=;
        b=NszxCfRYbVmFKKmRHy70XEznWdtnFogF29v1Q8thLm/NxSAYONipTNjbS0q8FqOkq+
         Yf5hX78i7bBnkb26UDL9YhI153AGcIg+P4D6i/ZAWMdTahNAu400CRRWprTI/Lj37hwj
         YqMQODr2lHtVI3+2chuTbinaxaR3Njs2mkrCnZ5x+VFmFzeB6KJnYEwe+Wv4/iGHb+Qs
         g1zIpRakeuBxBxWZy1Mn/B5OfMUebM0MdwA4elsVMxHd66x8oHiCACyJlXAl2W2gPjwz
         CJJeZIyfH0agiBoaF6ttBuqcToMAQHxqNTG3ysWp/Xo4mUc2T9un8F0Nd/BVcPDVhb0T
         ebaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700072662; x=1700677462;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YwnbFEowCOIPXHVnTy11nqwwrucONumx37RdmdwMisc=;
        b=gsX5Gx/vA3tGH+eGNHJokC3hOcMezrzgzQlBYtvKZ2bMreMyNqJhLerTvh8UjeVT1B
         vRNf3f2j17CYStzcuZSlAmQBjQRLwoiZs4706Iwkjhk33YVr3x+y29Z2j/cU1kAOf2dW
         E3M34t1hFutsq0xzWmaPuqERSahVBcFHNnHrW05kZzhcaifEJ44tzQbVcfHo9j+SFMnn
         tgXzfuuxvMAlnboCk0Y9jDOP43JDi1acY3gZe4KLmq5O9ml1KznC5zTR+EHwWB2YqQiV
         IDgaDBidGk1ZQGmBuE+6op2R6Eo2rwDAyENPOijTZ+z2gp/CMDVtY7X8c6hQB6A6XJon
         UbIQ==
X-Gm-Message-State: AOJu0Ywvhi+/vLpm0liEB+j/RKvGaiPaLIoKOFMDhHvXNcZw9dnOdsvt
	D1BS+yiDFYdEBLvaKwX4pXQqoz/qEuUn7A==
X-Google-Smtp-Source: AGHT+IG6nSMrtCP9lRD0Y6AhL0fo2d691Y7EYRbNL46WppHhIKZ1BO5fhcnZoGVQzMWvfY7fk/qyUQ==
X-Received: by 2002:a17:902:dad1:b0:1cc:70e4:28c7 with SMTP id q17-20020a170902dad100b001cc70e428c7mr6971757plx.18.1700072662135;
        Wed, 15 Nov 2023 10:24:22 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9100:2cb0::62f8])
        by smtp.gmail.com with ESMTPSA id 13-20020a170902c20d00b001a9b29b6759sm7628161pll.183.2023.11.15.10.24.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Nov 2023 10:24:21 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>,
	Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v8 1/2] vte: upgrade 2.72.2 -> 2.74.0
Date: Wed, 15 Nov 2023 10:24:15 -0800
Message-ID: <20231115182417.415940-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.42.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Nov 2023 18:24:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190739

From: Markus Volk <f_l_k@t-online.de>

Rework recipe

- remove legacy of the autotools buildsystem
- remove BBCLASSEXTEND
- build	vapi dependent on gi-data
- docs require gir, add	a EXTRA_OEMESON:append to avoid	fail in
  a combination	where docs=true	and gir=false
- gtk+3 and gtk4 are requested by default-> add gtk4 depending
  on DISTRO_FEATURE
- install systemd support files	depending on DISTRO_FEATURE
- update 0001-Add-W_EXITCODE-macro-for-non-glibc-systems.patch

Signed-off-by: Markus Volk <f_l_k@t-online.de>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v8: Rebased on latest tip of trunk

 ...EXITCODE-macro-for-non-glibc-systems.patch | 35 ++++++++-----------
 .../vte/{vte_0.72.2.bb => vte_0.74.0.bb}      | 29 ++++++---------
 2 files changed, 25 insertions(+), 39 deletions(-)
 rename meta/recipes-support/vte/{vte_0.72.2.bb => vte_0.74.0.bb} (66%)

diff --git a/meta/recipes-support/vte/vte/0001-Add-W_EXITCODE-macro-for-non-glibc-systems.patch b/meta/recipes-support/vte/vte/0001-Add-W_EXITCODE-macro-for-non-glibc-systems.patch
index b4100fc381e..8934d5f80a6 100644
--- a/meta/recipes-support/vte/vte/0001-Add-W_EXITCODE-macro-for-non-glibc-systems.patch
+++ b/meta/recipes-support/vte/vte/0001-Add-W_EXITCODE-macro-for-non-glibc-systems.patch
@@ -11,32 +11,25 @@ Upstream-Status: Submitted [1]
 Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
 
 [1] https://gitlab.gnome.org/GNOME/vte/issues/72
-
 ---
- src/missing.hh | 4 ++++
- src/widget.cc  | 1 +
- 2 files changed, 5 insertions(+)
+ src/widget.cc  | 4 +++
+ 1 files changed, 4 insertions(+)
 
---- a/src/missing.hh
-+++ b/src/missing.hh
-@@ -24,6 +24,10 @@
- #define NSIG (8 * sizeof(sigset_t))
- #endif
+diff --git a/src/widget.cc b/src/widget.cc
+index 07f7cabf..31a77f68 100644
+--- a/src/widget.cc
++++ b/src/widget.cc
+@@ -16,6 +16,10 @@
+  * along with this library.  If not, see <https://www.gnu.org/licenses/>.
+  */
  
 +#ifndef W_EXITCODE
 +#define W_EXITCODE(ret, sig) ((ret) << 8 | (sig))
 +#endif
 +
- #ifndef HAVE_FDWALK
- int fdwalk(int (*cb)(void* data, int fd),
-            void* data);
---- a/src/widget.cc
-+++ b/src/widget.cc
-@@ -21,6 +21,7 @@
- #include "widget.hh"
- 
- #include <sys/wait.h> // for W_EXITCODE
-+#include "missing.hh" // for W_EXITCODE on non-glibc systems
+ #include "config.h"
  
- #include <exception>
- #include <new>
+ #include "widget.hh"
+-- 
+2.42.0
+
diff --git a/meta/recipes-support/vte/vte_0.72.2.bb b/meta/recipes-support/vte/vte_0.74.0.bb
similarity index 66%
rename from meta/recipes-support/vte/vte_0.72.2.bb
rename to meta/recipes-support/vte/vte_0.74.0.bb
index 44e71491f62..21203adcf79 100644
--- a/meta/recipes-support/vte/vte_0.72.2.bb
+++ b/meta/recipes-support/vte/vte_0.74.0.bb
@@ -16,32 +16,27 @@ DEPENDS = "glib-2.0 glib-2.0-native gtk+3 libpcre2 libxml2-native gperf-native i
 GIR_MESON_OPTION = 'gir'
 GIDOCGEN_MESON_OPTION = "docs"
 
-inherit gnomebase gi-docgen features_check upstream-version-is-even gobject-introspection
+inherit gnomebase gi-docgen features_check upstream-version-is-even gobject-introspection vala
 
-# vapigen.m4 is required when vala is not present (but the one from vala should be used normally)
 SRC_URI += "file://0001-Add-W_EXITCODE-macro-for-non-glibc-systems.patch"
-SRC_URI[archive.sha256sum] = "f7966fd185a6981f53964162b71cfef7e606495155d6f5827b72aa0dd6741c9e"
+SRC_URI[archive.sha256sum] = "9ae08f777952ba793221152d360550451580f42d3b570e3341ebb6841984c76b"
 
 ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
 
-# Help g-ir-scanner find the .so for linking
-do_compile:prepend() {
-    export GIR_EXTRA_LIBS_PATH="${B}/src/.libs"
-}
+EXTRA_OEMESON += "${@bb.utils.contains('GI_DATA_ENABLED', 'True', '-Dvapi=true', '-Dvapi=false', d)}"
+EXTRA_OEMESON:append = " ${@bb.utils.contains('GI_DATA_ENABLED', 'False', '-Ddocs=false', '', d)}"
 
-# Package additional files
-FILES:${PN}-dev += "${datadir}/vala/vapi/*"
-
-PACKAGECONFIG ??= "gnutls"
-PACKAGECONFIG[vala] = "-Dvapi=true,-Dvapi=false,vala-native vala"
+PACKAGECONFIG ??= " \
+	gnutls \
+	${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)} \
+	${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'gtk4', '', d)} \
+"
+PACKAGECONFIG[gtk4] = "-Dgtk4=true,-Dgtk4=false,gtk4"
 PACKAGECONFIG[gnutls] = "-Dgnutls=true,-Dgnutls=false,gnutls"
 PACKAGECONFIG[systemd] = "-D_systemd=true,-D_systemd=false,systemd"
-# vala requires gir
-PACKAGECONFIG:remove:class-native = "vala"
-
-CFLAGS += "-D_GNU_SOURCE"
 
 PACKAGES =+ "libvte ${PN}-prompt"
+FILES:${PN} +="${systemd_user_unitdir}"
 FILES:libvte = "${libdir}/*.so.* ${libdir}/girepository-1.0/*"
 FILES:${PN}-prompt = " \
     ${sysconfdir}/profile.d \
@@ -49,5 +44,3 @@ FILES:${PN}-prompt = " \
 "
 
 FILES:${PN}-dev += "${datadir}/glade/"
-
-BBCLASSEXTEND = "native nativesdk"
-- 
2.42.1


