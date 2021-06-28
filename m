Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web08.13393.1624896290443831340
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Jun 2021 09:04:50 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 677901042
	for <openembedded-core@lists.openembedded.org>; Mon, 28 Jun 2021 09:04:49 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 120FB3F718
	for <openembedded-core@lists.openembedded.org>; Mon, 28 Jun 2021 09:04:48 -0700 (PDT)
From: "Ross Burton" <ross@burtonini.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] libgudev: fix SRC_URI
Date: Mon, 28 Jun 2021 17:04:44 +0100
Message-Id: <20210628160445.945187-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Since oe-core fa8950d0c the logic to turn a version into a directory name
doesn't work for versions which are too short.

Solve this by overriding gnome_verdir() to return the version as-is, as
that is what the directory is called.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-gnome/libgudev/libgudev_236.bb | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/recipes-gnome/libgudev/libgudev_236.bb b/meta/recipes-g=
nome/libgudev/libgudev_236.bb
index daa578ddb19..5d1d2d782be 100644
--- a/meta/recipes-gnome/libgudev/libgudev_236.bb
+++ b/meta/recipes-gnome/libgudev/libgudev_236.bb
@@ -26,3 +26,8 @@ GTKDOC_MESON_OPTION =3D "gtk_doc"
=20
 UPSTREAM_CHECK_URI =3D "http://ftp.gnome.org/pub/GNOME/sources/libgudev/=
"
 UPSTREAM_CHECK_REGEX =3D "(?P<pver>(\d+))"
+
+# This isn't a GNOME-style version do gnome_verdir fails. Just return th=
e
+# version as that is how the directory is structured.
+def gnome_verdir(v):
+    return v
--=20
2.25.1

