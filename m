Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web09.13216.1624896290503748148
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Jun 2021 09:04:50 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id ED9E0106F
	for <openembedded-core@lists.openembedded.org>; Mon, 28 Jun 2021 09:04:49 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9874D3F718
	for <openembedded-core@lists.openembedded.org>; Mon, 28 Jun 2021 09:04:49 -0700 (PDT)
From: "Ross Burton" <ross@burtonini.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] cantarell-fonts: fix SRC_URI
Date: Mon, 28 Jun 2021 17:04:45 +0100
Message-Id: <20210628160445.945187-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210628160445.945187-1-ross.burton@arm.com>
References: <20210628160445.945187-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Since oe-core fa8950d0c the logic to turn a version into a directory name
doesn't work for versions which are too short.

Solve this by overriding gnome_verdir() to return the version as-is, as
that is what the directory is called.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../cantarell-fonts/cantarell-fonts_0.301.bb                 | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/recipes-graphics/cantarell-fonts/cantarell-fonts_0.301.=
bb b/meta/recipes-graphics/cantarell-fonts/cantarell-fonts_0.301.bb
index 8dc4ceb399e..b0ce56127d8 100644
--- a/meta/recipes-graphics/cantarell-fonts/cantarell-fonts_0.301.bb
+++ b/meta/recipes-graphics/cantarell-fonts/cantarell-fonts_0.301.bb
@@ -20,3 +20,8 @@ HASHEQUIV_HASH_VERSION .=3D ".2"
 EXTRA_OEMESON +=3D "-Duseprebuilt=3Dtrue -Dbuildappstream=3Dfalse"
=20
 FILES_${PN} =3D "${datadir}/fonts ${datadir}/fontconfig"
+
+# This isn't a GNOME-style version do gnome_verdir fails. Just return th=
e
+# version as that is how the directory is structured.
+def gnome_verdir(v):
+    return v
--=20
2.25.1

