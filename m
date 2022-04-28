Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2AB05C433FE
	for <webhook@archiver.kernel.org>; Thu, 28 Apr 2022 12:56:07 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.9835.1651150564197659774
 for <openembedded-core@lists.openembedded.org>;
 Thu, 28 Apr 2022 05:56:04 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EA7951477;
	Thu, 28 Apr 2022 05:56:02 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 78C973F73B;
	Thu, 28 Apr 2022 05:56:02 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH 2/2] musl-locales: explicitly depend on gettext-native
Date: Thu, 28 Apr 2022 13:55:59 +0100
Message-Id: <20220428125559.2994529-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220428125559.2994529-1-ross.burton@arm.com>
References: <20220428125559.2994529-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 28 Apr 2022 12:56:07 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164946

The gettext class is designed for use by applications with optional NLS
support: depending on the value of USE_NLS it will either depend on
gettext-minimal-native (just the autoconf macros) or gettext-native, and
will pass --enable-nls/--disable-nls as appropriate.

However, musl-locales specifically needs to run msgfmt at runtime,
so explicitly depend on gettext-native instead.

Also remove the redundant EXTRA_OECMAKE assignment.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-core/musl/musl-locales_git.bb | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-core/musl/musl-locales_git.bb b/meta/recipes-co=
re/musl/musl-locales_git.bb
index fa814d2bd9..40b20e250d 100644
--- a/meta/recipes-core/musl/musl-locales_git.bb
+++ b/meta/recipes-core/musl/musl-locales_git.bb
@@ -14,14 +14,12 @@ SRCREV =3D "1101fb2bcdd189cd9415b8bd1c775eb43527d25c"
=20
 S =3D "${WORKDIR}/git"
=20
-DEPENDS =3D "virtual/libintl"
+DEPENDS =3D "virtual/libintl gettext-native"
=20
 PROVIDES =3D "virtual/libc-locale"
=20
-inherit cmake gettext
+inherit cmake
=20
-EXTRA_OECMAKE =3D ""
-#
 # We will skip parsing for non-musl systems
 python () {
     if d.getVar('TCLIBC') !=3D "musl":
--=20
2.25.1


