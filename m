Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF990C71156
	for <webhook@archiver.kernel.org>; Fri, 13 Jun 2025 13:16:31 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.10097.1749820588788319456
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 Jun 2025 06:16:28 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E8C011C0A
	for <openembedded-core@lists.openembedded.org>; Fri, 13 Jun 2025 06:16:07 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id ED3443F59E
	for <openembedded-core@lists.openembedded.org>; Fri, 13 Jun 2025 06:16:27 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 10/10] oe/license_finder: support extra hashes being passed to find_licenses
Date: Fri, 13 Jun 2025 14:16:19 +0100
Message-ID: <20250613131620.221912-10-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250613131620.221912-1-ross.burton@arm.com>
References: <20250613131620.221912-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 13 Jun 2025 13:16:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218610

When using the license finder the caller might know some more license
hashes, for example if it is updating existing metadata.

Allow the caller to pass more hashes that can be used when identifying
licenses.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/lib/oe/license_finder.py | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/meta/lib/oe/license_finder.py b/meta/lib/oe/license_finder.p=
y
index 1bdc39e1c53..16f5d7c94cb 100644
--- a/meta/lib/oe/license_finder.py
+++ b/meta/lib/oe/license_finder.py
@@ -145,10 +145,11 @@ def find_license_files(srctree, first_only=3DFalse)=
:
     return licfiles
=20
=20
-def match_licenses(licfiles, srctree, d):
+def match_licenses(licfiles, srctree, d, extra_hashes=3D{}):
     md5sums =3D {}
     md5sums.update(_load_hash_csv(d))
     md5sums.update(_crunch_known_licenses(d))
+    md5sums.update(extra_hashes)
=20
     licenses =3D []
     for licfile in sorted(licfiles):
@@ -169,9 +170,9 @@ def match_licenses(licfiles, srctree, d):
     return licenses
=20
=20
-def find_licenses(srctree, d, first_only=3DFalse):
+def find_licenses(srctree, d, first_only=3DFalse, extra_hashes=3D{}):
     licfiles =3D find_license_files(srctree, first_only)
-    licenses =3D match_licenses(licfiles, srctree, d)
+    licenses =3D match_licenses(licfiles, srctree, d, extra_hashes)
=20
     # FIXME should we grab at least one source file with a license heade=
r and add that too?
=20
--=20
2.43.0


