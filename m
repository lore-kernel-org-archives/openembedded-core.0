Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 611E6C88E64
	for <webhook@archiver.kernel.org>; Mon, 14 Sep 2026 13:36:06 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.20429.1789392965138718507
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Sep 2026 06:36:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=qXfLCCRm;
 spf=pass (domain: konsulko.com, ip: 209.85.128.52, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-49e6deb520eso26550885e9.0
        for <openembedded-core@lists.openembedded.org>; Mon, 14 Sep 2026 06:36:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1789392963; x=1789997763; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0v4ELJ/bVVDguEtl4IEEsIeT/nj3iauNiV+nPcPCIFQ=;
        b=qXfLCCRmGrY/1ckQ/ZctQxMomK/qKm7OFjwMneHRdykuqnfl/YJoSCzrXWfP5SafPH
         NK0TSniAOqNhgfJ1hYEh15PaFQ1F9LH2Tp8eS2eIWt09klmzRU2KSqn5w9DIjnXmqp2g
         xy0mwMzP9UajvII4i5Aw/4BFqV9yF8ilwPrlE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789392963; x=1789997763;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0v4ELJ/bVVDguEtl4IEEsIeT/nj3iauNiV+nPcPCIFQ=;
        b=I46cmVGp1Sbq0E0xaCyrPrMmIAaDu+0xnPI/z5YBkcW/Zt3QuYllAQMeXhjE9TUXMQ
         3SluHiD4Hekzlc7BRIVrlOviXkIjFizJ3u8Zq5ZuC+k6LznxUChnHYDeHVPQTS6aMskh
         EURPpS4GS65oZw9AO3NW0ZYOF2Vtgj89WnpP4+nkG49ub+RDEikIeZRN9x0W263MIi4l
         i3chf+l0ACsrffmcJrUYyGEm87L0riZHcwt1YUqANFdA/zRbXPFflvgPq4yfVxRhpiHf
         oPTAn4BRE4qGexjrDiET50oNe5kVjb9dXXWBLhhmZWbxuPVSZP+hXP8B3ZnpqLeNEun7
         /HvA==
X-Gm-Message-State: AFuF++kJdEy5yjR8GgMKq9gC5UaEr1+EFoxBQFzfB+Ht4Bs/0PPBpzbD
	KRZN0eK9JlhU0THds+e0lbkCTHnGX88AW9Aj2YxTug8YDqRzvymCTblglPrWcc08kfdq9VUl0pO
	Fuvfh
X-Gm-Gg: AYBFou1RonbwV1zAtpUt8IjO3DtmzoAJiAR6Dz26AjuDNwFi04KiM0CjzMEuPxtI+NC
	i7cWRNv3IY1nNA+cT5WU3A4Vm+LxS3sFy/R5PwAE5wmXhPY+a2SuSJYtXbZUib9SXjaEbfLoWNT
	uQ39iMIRZnUZPFi3K/rg1X1LV/QIrmajd4Bwm+iOyx8TMgBwerjbhpky1SuyZYieoXY5SGcU6Ya
	6JM/1boPrLsL1bV7avxHiwoaSXyoUZvNe1JojZZztMt42Itoqku89q/VvPNWcwfbAdGa3Qi4R+J
	z3lByYa4F2wxBUORMSt99N7fhTsbxftOk2as7HQqk1Io6wefQhabYIC8GBvaYkU6i5EtjdJqpKw
	lYsw/SvuG2Du2fVcMVGTspht1NGp+N8B9Ldk+plSgA/Xkjl/m5G+U2qVyfdwiHxKqXwFqZ8uVSw
	Pm1cMuA+rcimsgSSVqght6uc7n4FcABlqiZlqWH7NiTq8kQdIR+J+hA1PQCQ1CQXz9GNoUT/R2b
	U2q1WIk1/xJyRfkiHyXrkPNfXcWXt4Bwe4z8bQY6H6W7WVX5uF/bFMy75q5hmr6IcG+tkkVM3vg
	mLulLBxQij7rYRtX3UTkXbOtkmBOBqsXe7wU
X-Received: by 2002:a05:600c:1c19:b0:49c:fc6c:be19 with SMTP id 5b1f17b1804b1-49e7a691a5amr41506705e9.31.1789392963161;
        Mon, 14 Sep 2026 06:36:03 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d26c300e2sm450883555e9.8.2026.09.14.06.36.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 06:36:02 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-core@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [PATCH] lame: Upgrade 3.100 -> 4.0
Date: Mon, 14 Sep 2026 16:35:54 +0300
Message-ID: <20260914133558.2695215-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Type: text/plain; charset=y
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 14 Sep 2026 13:36:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245781

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
 meta/recipes-multimedia/lame/lame/clang.patch | 32 ++++++------
 .../lame/lame/id3tags.patch                   | 49 +++++++++++++++++++
 .../lame/lame/no-gtk1.patch                   | 10 ++--
 .../lame/{lame_3.100.bb => lame_4.0.bb}       |  7 +--
 4 files changed, 74 insertions(+), 24 deletions(-)
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
index 0000000000..1df79b0b8f
--- /dev/null
+++ b/meta/recipes-multimedia/lame/lame/id3tags.patch
@@ -0,0 +1,49 @@
+Upstream-Status: Pending
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


