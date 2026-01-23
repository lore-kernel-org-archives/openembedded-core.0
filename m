Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3DAF6D74ED9
	for <webhook@archiver.kernel.org>; Fri, 23 Jan 2026 14:02:49 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.68134.1769176962628690744
 for <openembedded-core@lists.openembedded.org>;
 Fri, 23 Jan 2026 06:02:42 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 76A9F1476
	for <openembedded-core@lists.openembedded.org>; Fri, 23 Jan 2026 06:02:30 -0800 (PST)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id AA6213F740
	for <openembedded-core@lists.openembedded.org>; Fri, 23 Jan 2026 06:02:36 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] python3-pygobject: fix compile error with old GCC
Date: Fri, 23 Jan 2026 14:02:28 +0000
Message-ID: <20260123140228.1691924-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 23 Jan 2026 14:02:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229893

If the build is done with GCC 10 (eg a native build on Debian 11) then
the build fails:

  gi/pygi-resulttuple.c:337:1: error: label at end of compound statement

Backport a patch from upstream to add a missing semicolon.

[ YOCTO #16147 ]

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../python/python3-pygobject/semicolon.patch  | 31 +++++++++++++++++++
 .../python/python3-pygobject_3.54.5.bb        |  2 ++
 2 files changed, 33 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-pygobject/semico=
lon.patch

diff --git a/meta/recipes-devtools/python/python3-pygobject/semicolon.pat=
ch b/meta/recipes-devtools/python/python3-pygobject/semicolon.patch
new file mode 100644
index 0000000000..54828d7707
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-pygobject/semicolon.patch
@@ -0,0 +1,31 @@
+From d00ad09688e9dcc42020949e276741d3ae58c10d Mon Sep 17 00:00:00 2001
+From: Dan Yeaw <dan@yeaw.me>
+Date: Mon, 13 Oct 2025 21:45:22 -0400
+Subject: [PATCH] Fix syntax error for missing ;
+
+This fixes a compile error with older GCC, for example GCC 10 on Debian =
11:
+
+  gi/pygi-resulttuple.c:337:1: error: label at end of compound statement
+
+Upstream-Status: Backport
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+---
+ gi/pygi-resulttuple.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/gi/pygi-resulttuple.c b/gi/pygi-resulttuple.c
+index 8b793e4d0..4d892e94d 100644
+--- a/gi/pygi-resulttuple.c
++++ b/gi/pygi-resulttuple.c
+@@ -335,7 +335,7 @@ resulttuple_dealloc (PyObject *self)
+     Py_TYPE (self)->tp_free (self);
+=20
+ done:
+-    CPy_TRASHCAN_END (self)
++    CPy_TRASHCAN_END (self);
+ }
+ #endif
+=20
+--=20
+GitLab
+
diff --git a/meta/recipes-devtools/python/python3-pygobject_3.54.5.bb b/m=
eta/recipes-devtools/python/python3-pygobject_3.54.5.bb
index f6ed3ff5fb..8eb0f9fa6b 100644
--- a/meta/recipes-devtools/python/python3-pygobject_3.54.5.bb
+++ b/meta/recipes-devtools/python/python3-pygobject_3.54.5.bb
@@ -19,6 +19,8 @@ DEPENDS +=3D "python3 glib-2.0"
 GNOME_COMPRESS_TYPE =3D "gz"
 GNOMEBN =3D "pygobject"
=20
+SRC_URI +=3D "file://semicolon.patch"
+
 SRC_URI[archive.sha256sum] =3D "b6656f6348f5245606cf15ea48c384c7f05156c7=
5ead206c1b246c80a22fb585"
=20
 S =3D "${UNPACKDIR}/${GNOMEBN}-${PV}"
--=20
2.43.0


