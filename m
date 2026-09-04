Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 173B9C79F87
	for <webhook@archiver.kernel.org>; Fri,  4 Sep 2026 13:36:28 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14033.1788528979260041228
 for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Sep 2026 06:36:19 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=Ajo1uFLg;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 185EF152B
	for <openembedded-core@lists.openembedded.org>; Fri,  4 Sep 2026 06:36:15 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 6C3B73F7D8
	for <openembedded-core@lists.openembedded.org>; Fri,  4 Sep 2026 06:36:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1788528978; bh=E5/MRC3VmyLlrpiARG380t/WVMNgY03GinhXcepp4aw=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=Ajo1uFLgWz0cbn05WJhww88KL6D+E+X/ZFb2PNsWN6V0vA+2Apugq6avIuC3AGbzw
	 1kBJpgTxw4PW+30dWJMIlTieys91a/wSMufRGgfm9RtrdT1bKH+g7WivAzq8r3Tl/e
	 bsPHN/p+LTGvBOG1b2Sjo1BNKc+PbWcDgHafNGGs=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 4/4] pypi: improve upstream check regex
Date: Fri,  4 Sep 2026 14:36:10 +0100
Message-ID: <20260904133610.774110-4-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260904133610.774110-1-ross.burton@arm.com>
References: <20260904133610.774110-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 04 Sep 2026 13:36:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245107

Currently the upstream release checker fetches the Simple API release
index which lists all of the uploaded files.  However the naming rules
have evolved over time[1] so matching the value of PYPI_PACKAGE fails if
the sdist filename was not normalised but then is normalised.

Remove UPSTREAM_CHECK_PYPI_PACKAGE which is mostly unused[2] and instead
transform the PYPI_PACKAGE into a regular expression that handles both
- and _ being used in the filename.

Change the version number match so that it handles .postN suffixes, as
defined in the Version Specifiers documentation[3]. We don't want to
match any alphanumeric characters as this would also match development
snapshots and release candidates.

Finally escape the . between the version and the extension, so this
matches a literal . and not any character.

Across oe-core and meta-oe this improves the upstream detection quite
significantly:

- 93 recipes move from a broken check to up-to-date
- 21 recipes move from a broken check to needing an update
- 30 recipes move from up-to-date to needing an update

[1] Specifically PEP-0427 introduced normalisation of special characters
    to underscores and lowercasing.
[2] No users in oe-core, three in meta-oe which are no longer needed
    after this change.
[3] https://packaging.python.org/en/latest/specifications/version-specifi=
ers/

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/classes-recipe/pypi.bbclass | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/meta/classes-recipe/pypi.bbclass b/meta/classes-recipe/pypi.=
bbclass
index eb13ffe7e71..72e83e86cca 100644
--- a/meta/classes-recipe/pypi.bbclass
+++ b/meta/classes-recipe/pypi.bbclass
@@ -52,7 +52,10 @@ SECTION =3D "devel/python"
 SRC_URI:prepend =3D "${PYPI_SRC_URI} "
 S =3D "${UNPACKDIR}/${PYPI_PACKAGE}-${PV}"
=20
-UPSTREAM_CHECK_PYPI_PACKAGE ?=3D "${PYPI_PACKAGE}"
+def pypi_normalize_regex(d):
+    # Use a regex wildcard instead of hyphen as the filenames
+    # may or may not have been normalised properly.
+    return pypi_normalize(d).replace("-", "[_-]")
=20
 # Use the simple repository API rather than the potentially unstable pro=
ject URL
 # More information on the pypi API specification is avaialble here:
@@ -60,7 +63,7 @@ UPSTREAM_CHECK_PYPI_PACKAGE ?=3D "${PYPI_PACKAGE}"
 #
 # NOTE: All URLs for the simple API MUST request canonical normalized UR=
Ls per the spec
 UPSTREAM_CHECK_URI ?=3D "https://pypi.org/simple/${@pypi_normalize(d)}/"
-UPSTREAM_CHECK_REGEX ?=3D "(?i)${UPSTREAM_CHECK_PYPI_PACKAGE}-(?P<pver>(=
\d+[\.\-_]*)+).(tar\.gz|tgz|zip|tar\.bz2)"
+UPSTREAM_CHECK_REGEX ?=3D "(?i)${@pypi_normalize_regex(d)}-(?P<pver>(\d+=
(\.[\d\-]+)*(\.post\d+)?))\.(tar\.gz|tgz|zip|tar\.bz2)"
=20
 CVE_PRODUCT ?=3D "python:${PYPI_PACKAGE}"
=20
--=20
2.43.0


