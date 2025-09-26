Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 171D2CAC5B8
	for <webhook@archiver.kernel.org>; Fri, 26 Sep 2025 16:32:43 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.52.1758904357480067304
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Sep 2025 09:32:37 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E3156168F
	for <openembedded-core@lists.openembedded.org>; Fri, 26 Sep 2025 09:32:28 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id A109D3F5A1
	for <openembedded-core@lists.openembedded.org>; Fri, 26 Sep 2025 09:32:36 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] expat: upgrade to 2.7.3
Date: Fri, 26 Sep 2025 17:32:31 +0100
Message-ID: <20250926163231.1478264-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 26 Sep 2025 16:32:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224086

Security fixes:
- Fix alignment of internal allocations for some non-amd64 architectures
  (e.g. sparc32); fixes up on the fix to CVE-2025-59375 from #1034 (of
  Expat 2.7.2 and related backports)

- Fix a class of false positives where input should have been rejected
  with error XML_ERROR_ASYNC_ENTITY; regression from CVE-2024-8176 fix
  pull request #973 (of Expat 2.7.0 and related backports). Please check
  the added unit tests for example documents.

Other changes:
- Prove and regression-proof absence of integer overflow from function
  expat_realloc
- Remove "harmless" cast that truncated a size_t to unsigned
- Autotools: Remove "ln -s" discovery
- docs: Be consistent with use of floating point around
  XML_SetAllocTrackerMaximumAmplification
- docs: Make it explicit that XML_GetCurrentColumnNumber starts at 0
- docs: Better integrate the effect of the activation thresholds
- docs: Fix an in-comment typo in expat.h
- docs: Fix a typo in README.md
- docs: Improve change log of release 2.7.2
- xmlwf: Resolve use of functions XML_GetErrorLineNumber and
  XML_GetErrorColumnNumber
- Windows: Normalize .bat files to CRLF line endings
- Version info bumped from 12:0:11 (libexpat*.so.1.11.0) to 12:1:11
  (libexpat*.so.1.11.1); see https://verbump.de/ for what these numbers
  do

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-core/expat/{expat_2.7.2.bb =3D> expat_2.7.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-core/expat/{expat_2.7.2.bb =3D> expat_2.7.3.bb} (92%=
)

diff --git a/meta/recipes-core/expat/expat_2.7.2.bb b/meta/recipes-core/e=
xpat/expat_2.7.3.bb
similarity index 92%
rename from meta/recipes-core/expat/expat_2.7.2.bb
rename to meta/recipes-core/expat/expat_2.7.3.bb
index 952235d7a04..069254e13c3 100644
--- a/meta/recipes-core/expat/expat_2.7.2.bb
+++ b/meta/recipes-core/expat/expat_2.7.3.bb
@@ -15,7 +15,7 @@ SRC_URI =3D "${GITHUB_BASE_URI}/download/R_${VERSION_TA=
G}/expat-${PV}.tar.bz2  \
 GITHUB_BASE_URI =3D "https://github.com/libexpat/libexpat/releases/"
 UPSTREAM_CHECK_REGEX =3D "releases/tag/R_(?P<pver>.+)"
=20
-SRC_URI[sha256sum] =3D "976f6c2d358953c22398d64cd93790ba5abc62e02a1bbc20=
4a3a264adea149b8"
+SRC_URI[sha256sum] =3D "59c31441fec9a66205307749eccfee551055f2d792f329f1=
8d97099e919a3b2f"
=20
 EXTRA_OECMAKE:class-native +=3D "-DEXPAT_BUILD_DOCS=3DOFF"
=20
--=20
2.43.0


