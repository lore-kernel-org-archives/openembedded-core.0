Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB93BC4321E
	for <webhook@archiver.kernel.org>; Mon,  7 Nov 2022 14:56:12 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web11.4149.1667832962625963422
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Nov 2022 06:56:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=nJwZMLqU;
 spf=pass (domain: gmail.com, ip: 209.85.128.51, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f51.google.com with SMTP id ja4-20020a05600c556400b003cf6e77f89cso8459555wmb.0
        for <openembedded-core@lists.openembedded.org>; Mon, 07 Nov 2022 06:56:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=urj/IA+aTNPu42YE/BSyrOmWD57gdIontfg6p4JQU2s=;
        b=nJwZMLqUI5fJ8GHiO/5k9bE2k69HECxMrWgWP5FA8oiihK1PNgRAafPheKyxHsOCis
         5QFUFymPYN2k2zUSfkTm8NqBR+ORFkDI5Z9pXy0gOvG128KVF46EJEnzcLbpLNYBxkdT
         SHc7hPjIyxFhbvIFggZdgYGgETt2XEVwNaqDYMsP0n2UjAauGOa6CYIcx8mT7usrOfMe
         j/M/aeblLxn77plKBNSin3GD5fjMQlN8/2Byy5VBazfZavbh6XnuStBk8q77aExdycUL
         NCGCTXQFdvqt0J+5Ym8EVP2dAq5ZFMipsEfw1QBakgTYlMD+YqMI7f4iMRiDZHdw/NGC
         FH1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=urj/IA+aTNPu42YE/BSyrOmWD57gdIontfg6p4JQU2s=;
        b=GPIyc0tp9pekJKl8NKyknrAu/LdANvb93yIOXKc+ls+RbLxdzGuGCNtDzgOB+ujExq
         ZyKu45mvEYAUTkbqUjj+PUZP6g995VwZCy7FPuyXX8aNvNVg/v9Vlrd3E11nMqmrqgj5
         LboCTZP7seh785zRL1cOvpiaV+sIceGYxICDy48qKNT+Z/+R4Dx6nJHz71Pk15UAjXU3
         7+VMZDvb+GoQsU+CvKD+lLZZL+ntSLkdKQZegWrplPVuVsSwQgexYMJFmMCitBBLvW+P
         Dsm812srcd7aD5s2zkYrd0+JQpn43wJAUj42eQZN9DrrAdqqZ7WbBf3E8e/XWpYDTMnh
         buFg==
X-Gm-Message-State: ACrzQf0c2StBzOy1e9z7enX9+jUyAk8GwkSqzdtHTlxEzmyU715x3+r4
	84rKQgvoaGOq4t7SEfsq+naoN45J/qg=
X-Google-Smtp-Source: AMsMyM5fwo4M9V2SWQ70jb80QTpV7BJFeiUiDQmVKUGHOheM/w7roY6uqf6R3AlODdPSSg74sqcOhQ==
X-Received: by 2002:a05:600c:5543:b0:3cf:81e8:20c7 with SMTP id iz3-20020a05600c554300b003cf81e820c7mr21835531wmb.140.1667832960955;
        Mon, 07 Nov 2022 06:56:00 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id s13-20020a5d69cd000000b0023659925b2asm7460440wrw.51.2022.11.07.06.55.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Nov 2022 06:56:00 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 42/48] gstreamer1.0: upgrade 1.20.3 -> 1.20.4
Date: Mon,  7 Nov 2022 15:55:02 +0100
Message-Id: <20221107145508.1051404-42-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221107145508.1051404-1-alex@linutronix.de>
References: <20221107145508.1051404-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Nov 2022 14:56:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172892

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...tools_1.20.3.bb => gst-devtools_1.20.4.bb} |  2 +-
 ...r-APNG-encoder-property-registration.patch | 86 -------------------
 ...1.20.3.bb => gstreamer1.0-libav_1.20.4.bb} |  6 +-
 ...x_1.20.3.bb => gstreamer1.0-omx_1.20.4.bb} |  2 +-
 ....bb => gstreamer1.0-plugins-bad_1.20.4.bb} |  2 +-
 ...-system-headers-for-isspace-and-ssca.patch | 35 --------
 ...bb => gstreamer1.0-plugins-base_1.20.4.bb} |  3 +-
 ...bb => gstreamer1.0-plugins-good_1.20.4.bb} |  2 +-
 ...bb => gstreamer1.0-plugins-ugly_1.20.4.bb} |  2 +-
 ....20.3.bb => gstreamer1.0-python_1.20.4.bb} |  2 +-
 ....bb => gstreamer1.0-rtsp-server_1.20.4.bb} |  2 +-
 ...1.20.3.bb => gstreamer1.0-vaapi_1.20.4.bb} |  2 +-
 ...er1.0_1.20.3.bb => gstreamer1.0_1.20.4.bb} |  2 +-
 13 files changed, 12 insertions(+), 136 deletions(-)
 rename meta/recipes-multimedia/gstreamer/{gst-devtools_1.20.3.bb => gst-devtools_1.20.4.bb} (95%)
 delete mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-libav/0001-libav-Fix-for-APNG-encoder-property-registration.patch
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-libav_1.20.3.bb => gstreamer1.0-libav_1.20.4.bb} (82%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-omx_1.20.3.bb => gstreamer1.0-omx_1.20.4.bb} (95%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-bad_1.20.3.bb => gstreamer1.0-plugins-bad_1.20.4.bb} (98%)
 delete mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0001-include-required-system-headers-for-isspace-and-ssca.patch
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-base_1.20.3.bb => gstreamer1.0-plugins-base_1.20.4.bb} (96%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-good_1.20.3.bb => gstreamer1.0-plugins-good_1.20.4.bb} (97%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-ugly_1.20.3.bb => gstreamer1.0-plugins-ugly_1.20.4.bb} (94%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-python_1.20.3.bb => gstreamer1.0-python_1.20.4.bb} (91%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-rtsp-server_1.20.3.bb => gstreamer1.0-rtsp-server_1.20.4.bb} (90%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-vaapi_1.20.3.bb => gstreamer1.0-vaapi_1.20.4.bb} (95%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0_1.20.3.bb => gstreamer1.0_1.20.4.bb} (97%)

diff --git a/meta/recipes-multimedia/gstreamer/gst-devtools_1.20.3.bb b/meta/recipes-multimedia/gstreamer/gst-devtools_1.20.4.bb
similarity index 95%
rename from meta/recipes-multimedia/gstreamer/gst-devtools_1.20.3.bb
rename to meta/recipes-multimedia/gstreamer/gst-devtools_1.20.4.bb
index c515e173c8..09b6e5a497 100644
--- a/meta/recipes-multimedia/gstreamer/gst-devtools_1.20.3.bb
+++ b/meta/recipes-multimedia/gstreamer/gst-devtools_1.20.4.bb
@@ -12,7 +12,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gst-devtools/gst-devtools-${PV}
            file://0001-connect-has-a-different-signature-on-musl.patch \
            "
 
-SRC_URI[sha256sum] = "bbbd45ead703367ea8f4be9b3c082d7b62bef47b240a39083f27844e28758c47"
+SRC_URI[sha256sum] = "82a293600273f4dd3eed567aae510ca0c7d629c3807788b00e6cdbd1d2459a84"
 
 DEPENDS = "json-glib glib-2.0 glib-2.0-native gstreamer1.0 gstreamer1.0-plugins-base"
 RRECOMMENDS:${PN} = "git"
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav/0001-libav-Fix-for-APNG-encoder-property-registration.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav/0001-libav-Fix-for-APNG-encoder-property-registration.patch
deleted file mode 100644
index 526bbb0037..0000000000
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav/0001-libav-Fix-for-APNG-encoder-property-registration.patch
+++ /dev/null
@@ -1,86 +0,0 @@
-From 78a97c1ec35ada76d83fc67d0549ba56c74d8875 Mon Sep 17 00:00:00 2001
-From: Seungha Yang <seungha@centricular.com>
-Date: Thu, 7 Jul 2022 22:16:30 +0900
-Subject: [PATCH] libav: Fix for APNG encoder property registration
-
-The AVClass name of Animated PNG in FFmpeg 5.x is "(A)PNG"
-and it will be converted to "-a-png" through
-g_ascii_strdown() and g_strcanon(). But GLib disallow leading '-'
-character for a GType name. Strip leading '-' to workaround it.
-
-Upstream-Status: Backport [https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/2724]
-
-Seungha Yangs patch was imported without modifications.
-
-Signed-off-by: Claus Stovgaard <claus.stovgaard@gmail.com>
----
- ext/libav/gstavcfg.c | 29 +++++++++++++++++++++++------
- 1 file changed, 23 insertions(+), 6 deletions(-)
-
-diff --git a/ext/libav/gstavcfg.c b/ext/libav/gstavcfg.c
-index c736920..a8635a7 100644
---- a/ext/libav/gstavcfg.c
-+++ b/ext/libav/gstavcfg.c
-@@ -91,10 +91,19 @@ register_enum (const AVClass ** obj, const AVOption * top_opt)
-   gchar *lower_obj_name = g_ascii_strdown ((*obj)->class_name, -1);
-   gchar *enum_name = g_strdup_printf ("%s-%s", lower_obj_name, top_opt->unit);
-   gboolean none_default = TRUE;
-+  const gchar *enum_name_strip;
- 
-   g_strcanon (enum_name, G_CSET_a_2_z G_CSET_DIGITS, '-');
- 
--  if ((res = g_type_from_name (enum_name)))
-+  /* strip leading '-'s */
-+  enum_name_strip = enum_name;
-+  while (enum_name_strip[0] == '-')
-+    enum_name_strip++;
-+
-+  if (enum_name_strip[0] == '\0')
-+    goto done;
-+
-+  if ((res = g_type_from_name (enum_name_strip)))
-     goto done;
- 
-   while ((opt = av_opt_next (obj, opt))) {
-@@ -150,9 +159,8 @@ register_enum (const AVClass ** obj, const AVOption * top_opt)
-       }
-     }
- 
--    res =
--        g_enum_register_static (enum_name, &g_array_index (values, GEnumValue,
--            0));
-+    res = g_enum_register_static (enum_name_strip,
-+        &g_array_index (values, GEnumValue, 0));
- 
-     gst_type_mark_as_plugin_api (res, 0);
-   }
-@@ -177,10 +185,19 @@ register_flags (const AVClass ** obj, const AVOption * top_opt)
-   GArray *values = g_array_new (TRUE, TRUE, sizeof (GEnumValue));
-   gchar *lower_obj_name = g_ascii_strdown ((*obj)->class_name, -1);
-   gchar *flags_name = g_strdup_printf ("%s-%s", lower_obj_name, top_opt->unit);
-+  const gchar *flags_name_strip;
- 
-   g_strcanon (flags_name, G_CSET_a_2_z G_CSET_DIGITS, '-');
- 
--  if ((res = g_type_from_name (flags_name)))
-+  /* strip leading '-'s */
-+  flags_name_strip = flags_name;
-+  while (flags_name_strip[0] == '-')
-+    flags_name_strip++;
-+
-+  if (flags_name_strip[0] == '\0')
-+    goto done;
-+
-+  if ((res = g_type_from_name (flags_name_strip)))
-     goto done;
- 
-   while ((opt = av_opt_next (obj, opt))) {
-@@ -211,7 +228,7 @@ register_flags (const AVClass ** obj, const AVOption * top_opt)
-     g_array_sort (values, (GCompareFunc) cmp_flags_value);
- 
-     res =
--        g_flags_register_static (flags_name, &g_array_index (values,
-+        g_flags_register_static (flags_name_strip, &g_array_index (values,
-             GFlagsValue, 0));
- 
-     gst_type_mark_as_plugin_api (res, 0);
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.20.3.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.20.4.bb
similarity index 82%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.20.3.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.20.4.bb
index 7a2c0d1365..e23cf2e337 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.20.3.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.20.4.bb
@@ -11,10 +11,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=69333daa044cb77e486cc36129f7a770 \
                     file://ext/libav/gstav.h;beginline=1;endline=18;md5=a752c35267d8276fd9ca3db6994fca9c \
                     "
 
-SRC_URI = "https://gstreamer.freedesktop.org/src/gst-libav/gst-libav-${PV}.tar.xz \
-           file://0001-libav-Fix-for-APNG-encoder-property-registration.patch \
-           "
-SRC_URI[sha256sum] = "3fedd10560fcdfaa1b6462cbf79a38c4e7b57d7f390359393fc0cef6dbf27dfe"
+SRC_URI = "https://gstreamer.freedesktop.org/src/gst-libav/gst-libav-${PV}.tar.xz"
+SRC_URI[sha256sum] = "04ccbdd58fb31dd94098da599209834a0e7661638c5703381dd0a862c56fc532"
 
 S = "${WORKDIR}/gst-libav-${PV}"
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.20.3.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.20.4.bb
similarity index 95%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.20.3.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.20.4.bb
index fb48562a2b..4d63db89a7 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.20.3.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.20.4.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c \
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/gst-omx/gst-omx-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "8db48040bb41f09edf8d17ff6d16c54888d7777ba4501c2c69f0083350ea9a15"
+SRC_URI[sha256sum] = "70ddd485e2dcab79070164d61ad2ff3a63e15a1d7abf9075d86eb77762b0edfd"
 
 S = "${WORKDIR}/gst-omx-${PV}"
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.3.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.4.bb
similarity index 98%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.3.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.4.bb
index 39d5e08b21..0eac1322a3 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.3.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.4.bb
@@ -10,7 +10,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gst-plugins-bad/gst-plugins-bad
            file://0002-avoid-including-sys-poll.h-directly.patch \
            file://0004-opencv-resolve-missing-opencv-data-dir-in-yocto-buil.patch \
            "
-SRC_URI[sha256sum] = "7a11c13b55dd1d2386dd902219e41cbfcdda8e1e0aa3e738186c95074b35da4f"
+SRC_URI[sha256sum] = "a1a3f53b3604d9a04fdd0bf9a1a616c3d2dab5320489e9ecee1178e81e33a16a"
 
 S = "${WORKDIR}/gst-plugins-bad-${PV}"
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0001-include-required-system-headers-for-isspace-and-ssca.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0001-include-required-system-headers-for-isspace-and-ssca.patch
deleted file mode 100644
index 23c1048a36..0000000000
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0001-include-required-system-headers-for-isspace-and-ssca.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From c85a53a41d4e6bfc49c377217ece12a1f330a690 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Fri, 12 Aug 2022 22:50:06 -0700
-Subject: [PATCH] include required system headers for isspace() and sscanf()
- functions
-
-Newer compilers ( clang 15 ) has turned stricter and errors out instead
-of warning on implicit function declations
-Fixes
-gstssaparse.c:297:12: error: call to undeclared library function 'isspace' with type 'int (int)'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
-while (isspace(*t))
-
-Upstream-Status: Submitted [https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/2879]
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- gst/subparse/gstssaparse.c | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/gst/subparse/gstssaparse.c b/gst/subparse/gstssaparse.c
-index ff802fa..5ebe678 100755
---- a/gst/subparse/gstssaparse.c
-+++ b/gst/subparse/gstssaparse.c
-@@ -24,6 +24,8 @@
- #include "config.h"
- #endif
- 
-+#include <ctype.h>              /* isspace() */
-+#include <stdio.h>              /* sscanf() */
- #include <stdlib.h>             /* atoi() */
- #include <string.h>
- 
--- 
-2.37.1
-
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.3.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.4.bb
similarity index 96%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.3.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.4.bb
index e5e346e5e9..a0f238a59d 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.3.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.4.bb
@@ -10,9 +10,8 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gst-plugins-base/gst-plugins-ba
            file://0001-ENGR00312515-get-caps-from-src-pad-when-query-caps.patch \
            file://0003-viv-fb-Make-sure-config.h-is-included.patch \
            file://0002-ssaparse-enhance-SSA-text-lines-parsing.patch \
-           file://0001-include-required-system-headers-for-isspace-and-ssca.patch \
            "
-SRC_URI[sha256sum] = "7e30b3dd81a70380ff7554f998471d6996ff76bbe6fc5447096f851e24473c9f"
+SRC_URI[sha256sum] = "8d181b7abe4caf23ee9f9ec5b4d3e232640452464e39495bfffb6d776fc97225"
 
 S = "${WORKDIR}/gst-plugins-base-${PV}"
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.20.3.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.20.4.bb
similarity index 97%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.20.3.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.20.4.bb
index 0235935a4a..4a4672992e 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.20.3.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.20.4.bb
@@ -8,7 +8,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gst-plugins-good/gst-plugins-go
            file://0001-qt-include-ext-qt-gstqtgl.h-instead-of-gst-gl-gstglf.patch \
            "
 
-SRC_URI[sha256sum] = "f8f3c206bf5cdabc00953920b47b3575af0ef15e9f871c0b6966f6d0aa5868b7"
+SRC_URI[sha256sum] = "b16130fbe632fa8547c2147a0ef575b0140fb521065c5cb121c72ddbd23b64da"
 
 S = "${WORKDIR}/gst-plugins-good-${PV}"
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.20.3.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.20.4.bb
similarity index 94%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.20.3.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.20.4.bb
index ad7b84b5ab..94b8c8e2cf 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.20.3.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.20.4.bb
@@ -14,7 +14,7 @@ LICENSE_FLAGS = "commercial"
 SRC_URI = " \
             https://gstreamer.freedesktop.org/src/gst-plugins-ugly/gst-plugins-ugly-${PV}.tar.xz \
             "
-SRC_URI[sha256sum] = "8caa20789a09c304b49cf563d33cca9421b1875b84fcc187e4a385fa01d6aefd"
+SRC_URI[sha256sum] = "5c9ec6bab96517e438b3f9bae0ceb84d3436f3da9bbe180cf4d28e32a7251b59"
 
 S = "${WORKDIR}/gst-plugins-ugly-${PV}"
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.20.3.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.20.4.bb
similarity index 91%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.20.3.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.20.4.bb
index 57026ba73b..b514989864 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.20.3.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.20.4.bb
@@ -8,7 +8,7 @@ LICENSE = "LGPL-2.1-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=c34deae4e395ca07e725ab0076a5f740"
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/${PNREAL}/${PNREAL}-${PV}.tar.xz"
-SRC_URI[sha256sum] = "db348120eae955b8cc4de3560a7ea06e36d6e1ddbaa99a7ad96b59846601cfdc"
+SRC_URI[sha256sum] = "5eb4136d03e2a495f4499c8b2e6d9d3e7b5e73c5a8b8acf9213d57bc6a7bd3c1"
 
 DEPENDS = "gstreamer1.0 gstreamer1.0-plugins-base python3-pygobject"
 RDEPENDS:${PN} += "gstreamer1.0 gstreamer1.0-plugins-base python3-pygobject"
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.20.3.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.20.4.bb
similarity index 90%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.20.3.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.20.4.bb
index fd4f82fcc3..4137b4993b 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.20.3.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.20.4.bb
@@ -10,7 +10,7 @@ PNREAL = "gst-rtsp-server"
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/${PNREAL}/${PNREAL}-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "ee402718be9b127f0e5e66ca4c1b4f42e4926ec93ba307b7ccca5dc6cc9794ca"
+SRC_URI[sha256sum] = "88d9ef634e59aeb8cc183ad5ae444557c5a88dd49d833b9072bc6e1fae6a3d7d"
 
 S = "${WORKDIR}/${PNREAL}-${PV}"
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.3.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.4.bb
similarity index 95%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.3.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.4.bb
index 6e580f9f79..81ec23d26e 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.3.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.4.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=4fbd65380cdd255951079008b364516c"
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/${REALPN}/${REALPN}-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "6ee99eb316abdde9ad37002915bd8c3867918f6fdc74b7cf2ac4c1ae0d690b45"
+SRC_URI[sha256sum] = "ab12596144c05506e9782374c5d2cdfb3069fca89908d6de360d947bb77fd06a"
 
 S = "${WORKDIR}/${REALPN}-${PV}"
 DEPENDS = "libva gstreamer1.0 gstreamer1.0-plugins-base gstreamer1.0-plugins-bad"
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.3.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.4.bb
similarity index 97%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.3.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.4.bb
index 1f4576c3e1..d0ba2919ee 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.3.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.4.bb
@@ -23,7 +23,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gstreamer/gstreamer-${PV}.tar.x
            file://0004-tests-add-helper-script-to-run-the-installed_tests.patch;striplevel=3 \
            file://0005-tests-remove-gstbin-test_watch_for_state_change-test.patch \
            "
-SRC_URI[sha256sum] = "607daf64bbbd5fb18af9d17e21c0d22c4d702fffe83b23cb22d1b1af2ca23a2a"
+SRC_URI[sha256sum] = "67c1edf8c3c339cda5dde85f4f7b953bb9607c2d13ae970e2491c5c4c055ef5f"
 
 PACKAGECONFIG ??= "${@bb.utils.contains('PTEST_ENABLED', '1', 'tests', '', d)} \
                    check \
-- 
2.30.2


