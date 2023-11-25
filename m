Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45A27C61DF7
	for <webhook@archiver.kernel.org>; Sat, 25 Nov 2023 07:38:32 +0000 (UTC)
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
 by mx.groups.io with SMTP id smtpd.web11.22071.1700897906991350520
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Nov 2023 23:38:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Ofkd8Nut;
 spf=pass (domain: gmail.com, ip: 209.85.210.169, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-6b2018a11efso2537831b3a.0
        for <openembedded-core@lists.openembedded.org>; Fri, 24 Nov 2023 23:38:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700897906; x=1701502706; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=08/gl9H2xCKFK/EVGEVqsbysqOvE/cGbAn8pWb4L+qY=;
        b=Ofkd8NutmaZu8BLlqQ4F2zxXoDla1K8g1+RgHaj5qg3tZg+GDJDloHHdkQLJhMj9lt
         ADGt/BgOqs8jIhoxxQ7IZ0ph9vtwuIEZ4WFL/BbEvpki+vdw7XK+tHH2GctBfMoORlYC
         B+1TsEWMz72QrwOCGMyZ1+6KJ1f7W1oG1HnCU/AGc0wuz/qjG7Umu5Ka/h//XEdqzRD3
         giaqT3Qki8XR1lj28UAVWsXnbfxuAX5zMysUWo9sUSuEF6HyF/G1LK/NTZe2I+AxoWpn
         TpH6puc5Req68gJZHzt14g2dQH0Z6/GunhjDeJsZxQRmdGIJNYejxFXlis4A/LBRQabb
         fniw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700897906; x=1701502706;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=08/gl9H2xCKFK/EVGEVqsbysqOvE/cGbAn8pWb4L+qY=;
        b=eyfDFqkPupS44niWWjtHXGEnLbr/PoLU9bH+XDPHoFBIfSuQ3EOGsmM53cuEK4XcC/
         Ro3cwj/EFmgLrCpOKBLEkBLaVYU56iAo0XEwVme2XqZ5HbLv287Nz62a2ThPZFnxIdQc
         ylYgQiX3wwbbiimeA55IEIg/3c60kzAVcc+bPgTuWLLtfNc3jADCI7wK5gwqb/0fHbg+
         z2gOmpzxYgtH1BNZDywRI2FTNPgekvg5wH7rnLqx0WmTHCdc1H6SpuQPSvGfHgvkPpr5
         n5I9FDXtE3pRV2Oe31YeuNgkXtm/ZrKyAS25GDeMka5j7GhbtafBSwsBJ8/DtNEWHII3
         bDfQ==
X-Gm-Message-State: AOJu0YymqoCRVGMyN5glcrACJ4yovveX/mmmwfhIz0P1hQZdqHFv2cC8
	JH3quwhjeIX62ndq87eJCjcdqzGijEHT0g==
X-Google-Smtp-Source: AGHT+IFvD8IB+txouVvo3aCwMJhpVByasHmG4DbBijf/zUnwzNPjztqmfYl3gnLyM+T0w7c8a9adaA==
X-Received: by 2002:a05:6a20:42aa:b0:18b:4dc2:a4c7 with SMTP id o42-20020a056a2042aa00b0018b4dc2a4c7mr7364737pzj.14.1700897905915;
        Fri, 24 Nov 2023 23:38:25 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9100:2cb0::2c3f])
        by smtp.gmail.com with ESMTPSA id ei40-20020a056a0080e800b006933822e7a6sm3806105pfb.66.2023.11.24.23.38.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Nov 2023 23:38:25 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>,
	Khem Raj <raj.khem@gmail.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: [PATCH v10 1/3] vte: upgrade 0.72.2 -> 0.74.0
Date: Fri, 24 Nov 2023 23:38:19 -0800
Message-ID: <20231125073823.159294-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 25 Nov 2023 07:38:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191218

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

(From OE-Core rev: f9ddacafbdcf0539a8d5eecfa981194b401f1062)

(From OE-Core rev: ac1c6649a3ebdd24835ac2b0bba433e8e6fb54b7)

Signed-off-by: Markus Volk <f_l_k@t-online.de>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
---
v9: Rebased
v10: Correct version in subject

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
2.43.0


