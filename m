Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94655C2BD09
	for <webhook@archiver.kernel.org>; Wed,  3 Jul 2024 11:24:45 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.48769.1720005875571601350
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Jul 2024 04:24:35 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 075A6367
	for <openembedded-core@lists.openembedded.org>; Wed,  3 Jul 2024 04:25:00 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.oss.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 97CE13F762
	for <openembedded-core@lists.openembedded.org>; Wed,  3 Jul 2024 04:24:34 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] linux-libc-headers: remove redundant install_headers patch
Date: Wed,  3 Jul 2024 12:24:33 +0100
Message-Id: <20240703112433.2979955-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 03 Jul 2024 11:24:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201467

This was added in the upgrade to 4.19[1] which included three patches
that were taken from the series at [2].

What merged was the second iteration of this series[3] which dropped the
install_headers patch, so we can drop this obsolete patch.

[1] oe-core 11f02b7c6f9854eecd3a49ea47833c8cbffb1581
[2] https://lore.kernel.org/linux-arm-kernel/1544556407-19897-1-git-send-=
email-Dave.Martin@arm.com/
[3] https://lore.kernel.org/linux-arm-kernel/1546607391-3850-1-git-send-e=
mail-Dave.Martin@arm.com/

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 ...eaders.sh-Strip-_UAPI-from-if-define.patch | 38 -------------------
 .../linux-libc-headers_6.9.bb                 |  4 --
 2 files changed, 42 deletions(-)
 delete mode 100644 meta/recipes-kernel/linux-libc-headers/linux-libc-hea=
ders/0001-kbuild-install_headers.sh-Strip-_UAPI-from-if-define.patch

diff --git a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers/00=
01-kbuild-install_headers.sh-Strip-_UAPI-from-if-define.patch b/meta/reci=
pes-kernel/linux-libc-headers/linux-libc-headers/0001-kbuild-install_head=
ers.sh-Strip-_UAPI-from-if-define.patch
deleted file mode 100644
index 54528b6e6a6..00000000000
--- a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers/0001-kbui=
ld-install_headers.sh-Strip-_UAPI-from-if-define.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-From 9ca6c6a510bda90954aa2532711200b89dd1df89 Mon Sep 17 00:00:00 2001
-From: Dave Martin <Dave.Martin@arm.com>
-Date: Tue, 11 Dec 2018 19:26:45 +0000
-Subject: [PATCH 1/3] kbuild: install_headers.sh: Strip _UAPI from
- #if-defined() guards
-
-install_headers.sh knows how to strip the _UAPI prefix from #ifdef/
-ifndef and #define directives used to guard headers against multiple
-or inappropriate inclusion.  Currently this does not work for guards
-in the "#if defined()" style, which may be needed for non-trivial
-cases.
-
-This patch adds similar logic so that the _UAPI prefix is also
-stripped from guard directives written using "#if defined()" etc.
-
-This is not completely foolproof, but will work for simple cases of
-using #if defined() to guard against inappropriate header inclusion.
-
-Signed-off-by: Dave Martin <Dave.Martin@arm.com>
-Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
-
-Upstream-Status: Submitted [https://www.spinics.net/lists/arm-kernel/msg=
694800.html]
----
- scripts/headers_install.sh | 1 +
- 1 file changed, 1 insertion(+)
-
-Index: linux-5.4/scripts/headers_install.sh
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- linux-5.4.orig/scripts/headers_install.sh
-+++ linux-5.4/scripts/headers_install.sh
-@@ -36,6 +36,7 @@
- 	s/(^|[^a-zA-Z0-9])__packed([^a-zA-Z0-9_]|$)/\1__attribute__((packed))\=
2/g
- 	s/(^|[[:space:](])(inline|asm|volatile)([[:space:](]|$)/\1__\2__\3/g
- 	s@#(ifndef|define|endif[[:space:]]*/[*])[[:space:]]*_UAPI@#\1 @
-+        :1;s/(#(if|elif)(.*[^A-Za-z0-9_])defined\([[:space:]]*)_UAPI/\1=
/;t1
- ' $INFILE > $TMPFILE || exit 1
-=20
- scripts/unifdef -U__KERNEL__ -D__EXPORTED_HEADERS__ $TMPFILE > $OUTFILE
diff --git a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.=
9.bb b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.9.bb
index 3dd4d547d52..7ebf63a0518 100644
--- a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.9.bb
+++ b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.9.bb
@@ -6,10 +6,6 @@ SRC_URI:append:libc-musl =3D "\
     file://0001-libc-compat.h-musl-_does_-define-IFF_LOWER_UP-DORMAN.pat=
ch \
    "
=20
-SRC_URI +=3D "\
-    file://0001-kbuild-install_headers.sh-Strip-_UAPI-from-if-define.pat=
ch \
-"
-
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D6bc538ed5bd9a7fc9398086aedcd7=
e46"
=20
 SRC_URI[sha256sum] =3D "24fa01fb989c7a3e28453f117799168713766e119c5381da=
c30115f18f268149"
--=20
2.34.1


