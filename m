Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 468E6CCD18C
	for <webhook@archiver.kernel.org>; Mon, 13 Oct 2025 12:45:39 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.42441.1760359529163438561
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Oct 2025 05:45:29 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B480E113E
	for <openembedded-core@lists.openembedded.org>; Mon, 13 Oct 2025 05:45:20 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 48FE13F738
	for <openembedded-core@lists.openembedded.org>; Mon, 13 Oct 2025 05:45:28 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] glibc: inherit update-rc.d
Date: Mon, 13 Oct 2025 13:45:14 +0100
Message-ID: <20251013124515.2362058-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 Oct 2025 12:45:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224780

The nscd package has an init script, so we should be inheriting the
update-rc.d class like we inherit the the systemd class.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-core/glibc/glibc-package.inc | 3 +++
 meta/recipes-core/glibc/glibc.inc         | 2 +-
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/glibc/glibc-package.inc b/meta/recipes-cor=
e/glibc/glibc-package.inc
index 21f2200d19b..d4941a21a10 100644
--- a/meta/recipes-core/glibc/glibc-package.inc
+++ b/meta/recipes-core/glibc/glibc-package.inc
@@ -297,3 +297,6 @@ CONFFILES:nscd =3D "${sysconfdir}/nscd.conf"
=20
 SYSTEMD_PACKAGES =3D "nscd"
 SYSTEMD_SERVICE:nscd =3D "nscd.service"
+
+INITSCRIPT_PACKAGES =3D "nscd"
+INITSCRIPT_NAME =3D "nscd"
diff --git a/meta/recipes-core/glibc/glibc.inc b/meta/recipes-core/glibc/=
glibc.inc
index d8f20c87dd6..0aa36318193 100644
--- a/meta/recipes-core/glibc/glibc.inc
+++ b/meta/recipes-core/glibc/glibc.inc
@@ -5,7 +5,7 @@ DEPENDS =3D "virtual/cross-cc virtual/cross-binutils libg=
cc-initial linux-libc-hea
=20
 PROVIDES =3D "virtual/libc"
 PROVIDES +=3D "virtual/libintl virtual/libiconv"
-inherit autotools texinfo systemd
+inherit autotools texinfo systemd update-rc.d
=20
 LEAD_SONAME =3D "libc.so"
=20
--=20
2.43.0


