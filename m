Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF72EC4332F
	for <webhook@archiver.kernel.org>; Fri, 12 Nov 2021 14:02:42 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.16206.1636725761503792704
 for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Nov 2021 06:02:41 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1F0E6139F
	for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Nov 2021 06:02:41 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BE95B3F70D
	for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Nov 2021 06:02:40 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 4/6] dtc: fix mingw build
Date: Fri, 12 Nov 2021 14:02:35 +0000
Message-Id: <20211112140237.575404-4-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211112140237.575404-1-ross.burton@arm.com>
References: <20211112140237.575404-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 12 Nov 2021 14:02:42 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158220

Backport a patch to fix the build of fdtdump with mingw, which so the
tools now build successfully with mingw.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 ...tdump-fix-Werror-int-to-pointer-cast.patch | 40 +++++++++++++++++++
 meta/recipes-kernel/dtc/dtc_1.6.1.bb          |  3 +-
 2 files changed, 42 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-kernel/dtc/dtc/0001-fdtdump-fix-Werror-i=
nt-to-pointer-cast.patch

diff --git a/meta/recipes-kernel/dtc/dtc/0001-fdtdump-fix-Werror-int-to-p=
ointer-cast.patch b/meta/recipes-kernel/dtc/dtc/0001-fdtdump-fix-Werror-i=
nt-to-pointer-cast.patch
new file mode 100644
index 0000000000..4c3e34b1ff
--- /dev/null
+++ b/meta/recipes-kernel/dtc/dtc/0001-fdtdump-fix-Werror-int-to-pointer-=
cast.patch
@@ -0,0 +1,40 @@
+Fix the build of fdtdump with mingw.
+
+Upstream-Status: Backport
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+
+From ae0ce1fa7f4d679b5f8df1fc0e797246e43547fe Mon Sep 17 00:00:00 2001
+From: =3D?UTF-8?q?Marc-Andr=3DC3=3DA9=3D20Lureau?=3D <marcandre.lureau@r=
edhat.com>
+Date: Wed, 25 Aug 2021 16:13:50 +0400
+Subject: [PATCH] fdtdump: fix -Werror=3Dint-to-pointer-cast
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3DUTF-8
+Content-Transfer-Encoding: 8bit
+
+With mingw64-gcc, the compiler complains with various warnings:
+error: cast from pointer to integer of different size [-Werror=3Dpointer=
-to-int-cast]
+
+Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
+Message-Id: <20210825121350.213551-1-marcandre.lureau@redhat.com>
+Acked-by: Rob Herring <robh@kernel.org>
+Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
+---
+ fdtdump.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/fdtdump.c b/fdtdump.c
+index d9fb374..483f367 100644
+--- a/fdtdump.c
++++ b/fdtdump.c
+@@ -21,7 +21,7 @@
+ #define MAX_VERSION 17
+=20
+ #define ALIGN(x, a)	(((x) + ((a) - 1)) & ~((a) - 1))
+-#define PALIGN(p, a)	((void *)(ALIGN((unsigned long)(p), (a))))
++#define PALIGN(p, a)	((void *)(ALIGN((uintptr_t)(p), (a))))
+ #define GET_CELL(p)	(p +=3D 4, *((const fdt32_t *)(p-4)))
+=20
+ static const char *tagname(uint32_t tag)
+--=20
+2.25.1
+
diff --git a/meta/recipes-kernel/dtc/dtc_1.6.1.bb b/meta/recipes-kernel/d=
tc/dtc_1.6.1.bb
index 6365f73e10..2610b26a94 100644
--- a/meta/recipes-kernel/dtc/dtc_1.6.1.bb
+++ b/meta/recipes-kernel/dtc/dtc_1.6.1.bb
@@ -7,7 +7,8 @@ LICENSE =3D "GPLv2 | BSD-2-Clause"
 LIC_FILES_CHKSUM =3D "file://GPL;md5=3Db234ee4d69f5fce4486a80fdaf4a4263 =
\
                     file://libfdt/libfdt.h;beginline=3D4;endline=3D7;md5=
=3D05bb357cfb75cae7d2b01d2ee8d76407"
=20
-SRC_URI =3D "git://git.kernel.org/pub/scm/utils/dtc/dtc.git;branch=3Dmas=
ter"
+SRC_URI =3D "git://git.kernel.org/pub/scm/utils/dtc/dtc.git;branch=3Dmas=
ter \
+           file://0001-fdtdump-fix-Werror-int-to-pointer-cast.patch"
 SRCREV =3D "b6910bec11614980a21e46fbccc35934b671bd81"
=20
 UPSTREAM_CHECK_GITTAGREGEX =3D "v(?P<pver>\d+(\.\d+)+)"
--=20
2.25.1


