Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0EADC88E75
	for <webhook@archiver.kernel.org>; Tue, 15 Sep 2026 05:47:35 +0000 (UTC)
Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16939.1789451247663273442
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Sep 2026 22:47:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=HfOkLkZ3;
 spf=pass (domain: konsulko.com, ip: 74.125.225.76, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-4858bc96fabso1882915f8f.3
        for <openembedded-core@lists.openembedded.org>; Mon, 14 Sep 2026 22:47:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1789451246; x=1790056046; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XQoJkBmTNjmcGlJpWNpAo0sA4Z4mhir+dTWroJc4tvc=;
        b=HfOkLkZ3EV1auT+cUhZ1ejE/TiJSMJMni/fhCGMw9jRxUx9yiPjls7LvU4VE+AQnEh
         UzTDKMS8yhNevRNJOwm/KCN+jkfUK62H9xSRws7PVBwSfmKSDQPAdGX7jgukvwPrQlMa
         CxtW3Vo5u9/KY99/cGy0dKM7+KnMX2DvxfvKw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789451246; x=1790056046;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XQoJkBmTNjmcGlJpWNpAo0sA4Z4mhir+dTWroJc4tvc=;
        b=obLiPI0/zOfIkjPwjn6+XSlnN5Olx/K8DLzYkp5YOgpOsdbxat8A6uZmzcg/M7JDvh
         uKIoL4eEhIcr1cXrvbM2M5E6raJ+ym8m6bF3smo0hCUhYKk0WDzDxetmJ5H54fY1QWhH
         IBggetQdKu3SHpi9R9PVtd+I1NVdCEV4/KqiA4qHOnColxmHoq71PoaF/TRo9lKKtk0W
         9yMvdPe3Pi7IUMvBw11+o12GNJF0YV/6dKAs2NCmqXBt+1Q1Ev6+pwJgKdHnOrVRLKzA
         67RIRbyD7tYmAN7vfrhO4MDLNTMr8MmbmhfNGXxIfnBOsgJKL4F/KhsXSYTz/P1zbkYs
         DEjw==
X-Gm-Message-State: AFuF++mdGY0jMBG962HrDpAbyIeVfXC3yw4ZGRiiF2fR6nFMNQj3wCj2
	dfLqzk5AzUPFz73zQQii2bfmVbfF0PHbsfE0p5oZSvePCzWbHOv+xU8MCLof4R79F3rhXbIddmj
	EIZXj
X-Gm-Gg: AYBFou1Bw4R8BtS1jtSkG3/WW3/WKcv3jQnBxg9LjKOn+1MB0/zc7GvtYtgqfwaDHXt
	0Sw1vct0A9Efw98Dreu9NUO8CdeJx6V10hdSvB35604ANlrJV6cB1dICSajc6kRmyhLzEd6AaUk
	JBVX9eRQ18w2ndqCZl97RdBp+5AXuAlpD0pUQrCghimTHKWVS7WoH57kXSa2tfDH5zUTrW35lvt
	EhaXH99Qy/oSiYU5IaXwStXNdFz/ck2BjJhCSSZaLwIfTViLsvaqxuL98iKauKsFey3F7XRzzUr
	G4f4sTwj5MVbtFYxNNfXOFn/gLtvbw6jhEFjyySQg0tgWSR7dPs15ibv8doS+5ll43OkluciVN6
	RmogGG80AtgeJd1z6xkXVymJd2Uv1uIpCxLTqNi7DI7MlUf2w3iWpCwwUmpTxSQkeyzQfWz+Vq7
	OzE+f21GlMNoWzUXYeNpOeBmZ3/XOcflBjSIpzxqUUdYhleg5SbUUWqquVb3cKACDgd3u4MQpkQ
	grFkOV5UBOlQDjFIYSMpBpLUr0khzpx5C2DQ1aCV/aB2UIGgrAQ+GWt+UC65zBPGBgP7OEYB7Cw
	EP7cBZBvk+FJKEoM4eO8CXimBA==
X-Received: by 2002:a5d:59c1:0:b0:487:39:5049 with SMTP id ffacd0b85a97d-48702b081a6mr7169628f8f.28.1789451245462;
        Mon, 14 Sep 2026 22:47:25 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb32d3c7sm29666768f8f.10.2026.09.14.22.47.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 22:47:23 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-core@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [PATCHv2] lame: Upgrade 3.100 -> 4.0
Date: Tue, 15 Sep 2026 08:46:58 +0300
Message-ID: <20260915054709.706556-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Sep 2026 05:47:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245810

Upgrade to release 4.0:

- Fixed a stack buffer overflow in the Blade-style encoder DLL
  (lame_enc.dll): beInitStream() copied a caller-supplied
  configuration structure using an unchecked, caller-controlled
  size, so an oversized or compiler-mismatched size could
  overwrite the stack. The size is now bounds-checked and the
  packed structure layout is consistent across MSVC and GCC/MinGW
  builds. [CVSS 8.4, Blade DLL]. Fix by Alexander Leidinger.
- Fixed an integer underflow in the AIFF header parser
  (parse_aiff_header()): a crafted file with a FORM chunk size
  below 4 wrapped the unsigned chunk-size counter to a huge value,
  sending the chunk-scanning loop into an effectively unbounded
  spin (a hang) on a tiny malicious input. The size is now
  validated before it is decremented. [CVSS 5.5, AIFF frontend].
  Fix by Alexander Leidinger.
- Bump the major version to 4.0 (minor reset to 0). The LAME tag
  embedded in every encoded MP3 has a fixed 9-byte field for the
  encoder version string; since 3.100 the 3-digit minor version
  left no room for the trailing alpha/beta/release marker
  character, which was silently dropped.
- Export the UTF-8 ID3 tag functions id3tag_set_textinfo_utf8 and
  id3tag_set_comment_utf8 from the shared library, and fix a
  possible crash on out-of-memory in the ID3v2 user-defined tag
  setters.

Add id3tags.patch from the mailing list to fix issues with
id3tag_set_textinfo_utf8:
https://sourceforge.net/p/lame/mailman/message/59358795/

This has been also fixed in the dev tree and will be included in
LAME release 4.1.

License-Update: Correct the address of the FSF.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 meta/recipes-multimedia/lame/lame/clang.patch | 32 +++++-----
 .../lame/lame/id3tags.patch                   | 59 +++++++++++++++++++
 .../lame/lame/no-gtk1.patch                   | 10 ++--
 .../lame/{lame_3.100.bb => lame_4.0.bb}       |  7 ++-
 4 files changed, 84 insertions(+), 24 deletions(-)
 create mode 100644 meta/recipes-multimedia/lame/lame/id3tags.patch
 rename meta/recipes-multimedia/lame/{lame_3.100.bb => lame_4.0.bb} (76%)

diff --git a/meta/recipes-multimedia/lame/lame/clang.patch b/meta/recipes-multimedia/lame/lame/clang.patch
index 116000c577..9e434fcbe7 100644
--- a/meta/recipes-multimedia/lame/lame/clang.patch
+++ b/meta/recipes-multimedia/lame/lame/clang.patch
@@ -16,18 +16,18 @@ so resolves the build failure.
 Upstream-Status: Pending
 Signed-off-by: Ross Burton <ross.burton@arm.com>
 
-diff --git i/configure.in w/configure.in
-index 5e43179..d51b017 100644
---- i/configure.in
-+++ w/configure.in
-@@ -960,45 +960,43 @@ if test "x$HAVE_GCC" = "xyes" -o "x$HAVE_CLANG" = "xyes"; then
+diff --git i/configure.ac w/configure.ac
+index 1111111..2222222 100644
+--- i/configure.ac
++++ w/configure.ac
+@@ -1021,45 +1021,43 @@ if test "x$HAVE_GCC" = "xyes" -o "x$HAVE_CLANG" = "xyes"; then
  				;;
  			esac
  		fi
 +
 +		if test "x${HAVE_CLANG}" = "xyes"; then
 +			case "${CLANG_VERSION}" in
-+			3.[89]*|[45].*)
++			3.[[89]]*|[[45]].*|1[[0-9]].*)
 +				OPTIMIZATION="-Ofast"
 +				;;
 +			*)
@@ -48,23 +48,23 @@ index 5e43179..d51b017 100644
 +				OPTIMIZATION="${OPTIMIZATION} -march=i686 \
 +					-mtune=native"
 +				;;
-+			*86)
-+				OPTIMIZATION="${OPTIMIZATION} -march=native \
-+					-mtune=native"
-+				;;
 +			esac
 +
++			# if someone supplies own CFLAGS, we don't add our own
++			if test "x${ac_save_CFLAGS}" != "x"; then
++				OPTIMIZATION=""
++			fi
 +		fi
  		;;
  	*)
  		AC_MSG_ERROR(bad value �${CONFIG_EXPOPT}� for expopt option)
  		;;
  	esac
- 
+
 -
 -	if test "x${HAVE_CLANG}" = "xyes"; then
 -		case "${CLANG_VERSION}" in
--		3.[89]*|[45].*)
+-		3.[[89]]*|[[45]].*|1[[0-9]].*)
 -			OPTIMIZATION="-Ofast"
 -			;;
 -		*)
@@ -85,12 +85,12 @@ index 5e43179..d51b017 100644
 -			OPTIMIZATION="${OPTIMIZATION} -march=i686 \
 -				-mtune=native"
 -			;;
--		*86)
--			OPTIMIZATION="${OPTIMIZATION} -march=native \
--				-mtune=native"
--			;;
 -		esac
 -
+-		# if someone supplies own CFLAGS, we don't add our own
+-		if test "x${ac_save_CFLAGS}" != "x"; then
+-			OPTIMIZATION=""
+-		fi
 -	fi
 -
 -
diff --git a/meta/recipes-multimedia/lame/lame/id3tags.patch b/meta/recipes-multimedia/lame/lame/id3tags.patch
new file mode 100644
index 0000000000..1ce36b9e89
--- /dev/null
+++ b/meta/recipes-multimedia/lame/lame/id3tags.patch
@@ -0,0 +1,59 @@
+Fix id3tag_set_textinfo_utf8 issues
+
+Fix issues with id3tag_set_textinfo_utf8 based on the proposed
+patch from the mailing list:
+https://sourceforge.net/p/lame/mailman/message/59358795/
+
+This has been also fixed in the dev tree and will be included in
+LAME release 4.1.
+
+Upstream-Status: Pending
+Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
+
+diff --git a/frontend/parse.c b/frontend/parse.c
+index 4a6b660..2ae7eb2 100644
+--- a/frontend/parse.c
++++ b/frontend/parse.c
+@@ -402,6 +402,10 @@ static int getIntValue(char const* token, char const* arg, int* ptr)
+ }
+ 
+ #ifdef ID3TAGS_EXTENDED
++extern int
++id3tag_set_comment_ucs2(lame_t gfp, char const *lang, unsigned short const *desc, unsigned short const *text);
++extern int
++id3tag_set_fieldvalue_ucs2(lame_t gfp, const unsigned short *fieldvalue);
+ static int
+ set_id3v2tag(lame_global_flags* gfp, TextEncoding enc, int type, unsigned short const* str)
+ {
+@@ -410,13 +414,13 @@ set_id3v2tag(lame_global_flags* gfp, TextEncoding enc, int type, unsigned short
+         case TENC_UTF8:
+             switch (type)
+             {
+-                case 'a': return id3tag_set_textinfo_utf8(gfp, "TPE1", str);
+-                case 't': return id3tag_set_textinfo_utf8(gfp, "TIT2", str);
+-                case 'l': return id3tag_set_textinfo_utf8(gfp, "TALB", str);
+-                case 'g': return id3tag_set_textinfo_utf8(gfp, "TCON", str);
++                case 'a': return id3tag_set_textinfo_utf8(gfp, "TPE1", (const char *)str);
++                case 't': return id3tag_set_textinfo_utf8(gfp, "TIT2", (const char *)str);
++                case 'l': return id3tag_set_textinfo_utf8(gfp, "TALB", (const char *)str);
++                case 'g': return id3tag_set_textinfo_utf8(gfp, "TCON", (const char *)str);
+                 case 'c': return id3tag_set_comment_ucs2(gfp, 0, 0, str);
+-                case 'n': return id3tag_set_textinfo_utf8(gfp, "TRCK", str);
+-                case 'y': return id3tag_set_textinfo_utf8(gfp, "TYER", str);
++                case 'n': return id3tag_set_textinfo_utf8(gfp, "TRCK", (const char *)str);
++                case 'y': return id3tag_set_textinfo_utf8(gfp, "TYER", (const char *)str);
+                 case 'v': return id3tag_set_fieldvalue_ucs2(gfp, str);
+             }
+             ;;
+diff --git a/include/libmp3lame.sym b/include/libmp3lame.sym
+index 7651fb3..77657ab 100644
+--- a/include/libmp3lame.sym
++++ b/include/libmp3lame.sym
+@@ -193,6 +193,7 @@ hip_decode_headers
+ hip_decode1
+ hip_decode1_headers
+ hip_decode1_headersB
++hip_finish_pinfo
+ lame_decode_init
+ lame_decode
+ lame_decode_headers
diff --git a/meta/recipes-multimedia/lame/lame/no-gtk1.patch b/meta/recipes-multimedia/lame/lame/no-gtk1.patch
index e88d7f1bb4..1d7527e180 100644
--- a/meta/recipes-multimedia/lame/lame/no-gtk1.patch
+++ b/meta/recipes-multimedia/lame/lame/no-gtk1.patch
@@ -2,12 +2,12 @@ Upstream-Status: Inappropriate [configuration]
 
 # Acquired from OpenEmbedded
 
---- lame-3.96.1/configure.in~no-gtk1.patch	2004-07-25 15:52:12.000000000 +0100
-+++ lame-3.96.1/configure.in	2004-09-10 15:54:39.000000000 +0100
-@@ -363,7 +363,12 @@
- 
+--- lame-4.0/configure.ac~no-gtk1.patch
++++ lame-4.0/configure.ac
+@@ -477,7 +477,12 @@
+
  dnl configure use of features
- 
+
 -AM_PATH_GTK(1.2.0, HAVE_GTK="yes", HAVE_GTK="no")
 +#AM_PATH_GTK(1.2.0, HAVE_GTK="yes", HAVE_GTK="no")
 +HAVE_GTK="no"
diff --git a/meta/recipes-multimedia/lame/lame_3.100.bb b/meta/recipes-multimedia/lame/lame_4.0.bb
similarity index 76%
rename from meta/recipes-multimedia/lame/lame_3.100.bb
rename to meta/recipes-multimedia/lame/lame_4.0.bb
index 42689df351..0dd94e9d25 100644
--- a/meta/recipes-multimedia/lame/lame_3.100.bb
+++ b/meta/recipes-multimedia/lame/lame_4.0.bb
@@ -4,18 +4,19 @@ HOMEPAGE = "https://lame.sourceforge.io/"
 BUGTRACKER = "http://sourceforge.net/tracker/?group_id=290&atid=100290"
 SECTION = "console/utils"
 LICENSE = "LGPL-2.0-or-later"
-LIC_FILES_CHKSUM = "file://COPYING;md5=c46bda00ffbb0ba1dac22f8d087f54d9 \
+LIC_FILES_CHKSUM = "file://COPYING;md5=a03aed0afc52dd24ed99db06d64a9fa3 \
                     file://include/lame.h;beginline=1;endline=20;md5=a2258182c593c398d15a48262130a92b \
 "
 
-DEPENDS = "ncurses gettext-native"
+DEPENDS = "ncurses mpg123 gettext-native"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/lame/lame-${PV}.tar.gz \
            file://no-gtk1.patch \
            file://clang.patch \
+           file://id3tags.patch \
            "
 
-SRC_URI[sha256sum] = "ddfe36cab873794038ae2c1210557ad34857a4b6bdc515785d1da9e175b1da1e"
+SRC_URI[sha256sum] = "3df5124d5ad3a98312ffd7ba6a9b36230e4f8a3e66d3ce0f425e336c32d216eb"
 
 inherit autotools pkgconfig sourceforge-releases
 
-- 
2.47.3


