Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94059C3A59F
	for <webhook@archiver.kernel.org>; Tue, 12 Dec 2023 14:09:21 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.2449.1702390157078664791
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Dec 2023 06:09:17 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 179B9143D;
	Tue, 12 Dec 2023 06:10:03 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 45C113F738;
	Tue, 12 Dec 2023 06:09:16 -0800 (PST)
From: ross.burton@arm.com
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH 5/9] gtk-doc: remove obsolete logic
Date: Tue, 12 Dec 2023 14:08:16 +0000
Message-Id: <20231212140820.2900963-6-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231212140820.2900963-1-ross.burton@arm.com>
References: <20231212140820.2900963-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 Dec 2023 14:09:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192198

From: Ross Burton <ross.burton@arm.com>

This manual disabling of gtk-doc for autotools and meson in native and
nativesdk builds is replicating logic above for target builds.

Instead, use one assignment for all builds, as we explicitly disable
gtk-doc in native builds and it can be useful in nativesdk.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/classes-recipe/gtk-doc.bbclass | 11 ++---------
 1 file changed, 2 insertions(+), 9 deletions(-)

diff --git a/meta/classes-recipe/gtk-doc.bbclass b/meta/classes-recipe/gt=
k-doc.bbclass
index 68fa2cc7451..c980c6bb52d 100644
--- a/meta/classes-recipe/gtk-doc.bbclass
+++ b/meta/classes-recipe/gtk-doc.bbclass
@@ -25,16 +25,9 @@ GTKDOC_MESON_ENABLE_FLAG ?=3D 'true'
 GTKDOC_MESON_DISABLE_FLAG ?=3D 'false'
=20
 # Auto enable/disable based on GTKDOC_ENABLED
-EXTRA_OECONF:prepend:class-target =3D "${@bb.utils.contains('GTKDOC_ENAB=
LED', 'True', '--enable-gtk-doc --enable-gtk-doc-html --disable-gtk-doc-p=
df', \
+EXTRA_OECONF:prepend =3D "${@bb.utils.contains('GTKDOC_ENABLED', 'True',=
 '--enable-gtk-doc --enable-gtk-doc-html --disable-gtk-doc-pdf', \
                                                                         =
            '--disable-gtk-doc', d)} "
-EXTRA_OEMESON:prepend:class-target =3D "-D${GTKDOC_MESON_OPTION}=3D${@bb=
.utils.contains('GTKDOC_ENABLED', 'True', '${GTKDOC_MESON_ENABLE_FLAG}', =
'${GTKDOC_MESON_DISABLE_FLAG}', d)} "
-
-# When building native recipes, disable gtkdoc, as it is not necessary,
-# pulls in additional dependencies, and makes build times longer
-EXTRA_OECONF:prepend:class-native =3D "--disable-gtk-doc "
-EXTRA_OECONF:prepend:class-nativesdk =3D "--disable-gtk-doc "
-EXTRA_OEMESON:prepend:class-native =3D "-D${GTKDOC_MESON_OPTION}=3D${GTK=
DOC_MESON_DISABLE_FLAG} "
-EXTRA_OEMESON:prepend:class-nativesdk =3D "-D${GTKDOC_MESON_OPTION}=3D${=
GTKDOC_MESON_DISABLE_FLAG} "
+EXTRA_OEMESON:prepend =3D "-D${GTKDOC_MESON_OPTION}=3D${@bb.utils.contai=
ns('GTKDOC_ENABLED', 'True', '${GTKDOC_MESON_ENABLE_FLAG}', '${GTKDOC_MES=
ON_DISABLE_FLAG}', d)} "
=20
 # Even though gtkdoc is disabled on -native, gtk-doc package is still
 # needed for m4 macros.
--=20
2.34.1


