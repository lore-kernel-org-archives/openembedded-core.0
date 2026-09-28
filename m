Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0F0DCA5FA6
	for <webhook@archiver.kernel.org>; Mon, 28 Sep 2026 17:32:10 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.63279.1790616724438238149
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Sep 2026 10:32:04 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=mbGI7+Ct;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6B1B11655
	for <openembedded-core@lists.openembedded.org>; Mon, 28 Sep 2026 10:32:00 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 7A3883F763
	for <openembedded-core@lists.openembedded.org>; Mon, 28 Sep 2026 10:32:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790616723; bh=mb3LLIlVsf0och2hod3BYTybMSWuCWC3HpdpA/x33YQ=;
	h=From:To:Subject:Date:From;
	b=mbGI7+Ct4LUuYwSeJpw7BYavc2t/hG+aIboAJ0za5uwxuAGtzfdIysxNyLl1PbrD0
	 UTyfHHWZa+DA07/SgoUgYVeDUaK6f4pyCjhS7YaH6xVByBlvJGL5hnc9NrPKkAQpk8
	 HekFfttg43MC6elc7btYiyUsemNHUFlselstmI8o=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [RFC PATCH 1/4] classes/pypi: change PYPI_PACKAGE to be normalised
Date: Mon, 28 Sep 2026 18:31:55 +0100
Message-ID: <20260928173158.781301-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-ARM-No-Footer: NoDisclaimer
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 28 Sep 2026 17:32:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246778

Currently the semantics of the PYPI_PACKAGE variable are slightly
unexpected, as it is the name of the source distribution (tarball), not
the logical package itself.

This meant many recipes had to set PYPI_PACKAGE and there were problems
when we wanted to use PyPI APIs that expect the normalised package name,
not whatever the sdist was called.

This commit changes the definition of PYPI_PACKAGE to be the normalised
package name[1], so PySocks would be pysocks and boolean.py would be
boolean-py.

This means we can use the correct package name in any PyPI API calls,
which all expect a normalised name.

Some uploaded tarballs do not have normalised names, so add a new variabl=
e
PYPI_PACKAGE_SDIST for the name of the sdist tarball.  This defaults to
the source distribution normalised[2] PYPI_PACKAGE, but can be overriden
if needed.

Whilst this causes some churn in recipes, it mostly lets recipes remove
lines.

[1] https://packaging.python.org/en/latest/specifications/name-normalizat=
ion/
[2] https://packaging.python.org/en/latest/specifications/source-distribu=
tion-format/,

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/classes-recipe/pypi.bbclass | 59 +++++++++++++++++---------------
 1 file changed, 32 insertions(+), 27 deletions(-)

diff --git a/meta/classes-recipe/pypi.bbclass b/meta/classes-recipe/pypi.=
bbclass
index 08788fcb9a9..e45e3115305 100644
--- a/meta/classes-recipe/pypi.bbclass
+++ b/meta/classes-recipe/pypi.bbclass
@@ -7,28 +7,37 @@
 def pypi_default_package(d):
     """
     Return a reasonable guess for the PyPI package name by
-    stripping any python- prefix from PN.
+    stripping any python- prefix from PN and normalising it.
     """
     bpn =3D d.getVar('BPN')
     if bpn.startswith('python-'):
-        return bpn[7:]
+        return pypi_package_normalise(bpn[7:])
     elif bpn.startswith('python3-'):
-        return bpn[8:]
-    return bpn
+        return pypi_package_normalise(bpn[8:])
+    return pypi_package_normalise(bpn)
=20
-# The PyPi package name (defaults to PN without the python3- prefix)
+# The PyPI package name, normalised as per
+# https://packaging.python.org/en/latest/specifications/name-normalizati=
on/.
+# Defaults to BPN without a python3- prefix.
 PYPI_PACKAGE ?=3D "${@pypi_default_package(d)}"
+
+# The name of the sdist. This defaults to the normalised name with under=
scores as per
+# https://packaging.python.org/en/latest/specifications/source-distribut=
ion-format/,
+# but can be overridden if needed.
+PYPI_PACKAGE_SDIST ?=3D "${@d.getVar("PYPI_PACKAGE").replace("-", "_")}"
+
 # The file extension of the source archive
 PYPI_PACKAGE_EXT ?=3D "tar.gz"
+
 # An optional prefix for the download file in the case of name collision=
s
 PYPI_ARCHIVE_NAME_PREFIX ?=3D ""
=20
 def pypi_src_uri(d):
     """
-    Construct a source URL as per https://warehouse.pypa.io/api-referenc=
e/integration-guide.html#predictable-urls.
+    Construct a source URL as per https://docs.pypi.org/api/#predictable=
-urls.
     """
-    package =3D d.getVar('PYPI_PACKAGE')
-    archive_name =3D d.expand('${PYPI_PACKAGE}-${PV}.${PYPI_PACKAGE_EXT}=
')
+    package =3D d.getVar('PYPI_PACKAGE_SDIST')
+    archive_name =3D d.expand('${PYPI_PACKAGE_SDIST}-${PV}.${PYPI_PACKAG=
E_EXT}')
     url =3D 'https://files.pythonhosted.org/packages/source/%s/%s/%s' % =
(package[0], package, archive_name)
=20
     download_prefix =3D d.getVar("PYPI_ARCHIVE_NAME_PREFIX")
@@ -37,34 +46,30 @@ def pypi_src_uri(d):
=20
     return url
=20
-def pypi_normalize(d):
-    """"
-    Normalize the package names to match PEP625 (https://peps.python.org=
/pep-0625/).
-    """
-    import re
-    return re.sub(r"[-_.]+", "-", d.getVar('PYPI_PACKAGE')).lower()
-
 PYPI_SRC_URI ?=3D "${@pypi_src_uri(d)}"
=20
 HOMEPAGE ?=3D "https://pypi.python.org/pypi/${PYPI_PACKAGE}/"
 SECTION =3D "devel/python"
 SRC_URI:prepend =3D "${PYPI_SRC_URI} "
-S =3D "${UNPACKDIR}/${PYPI_PACKAGE}-${PV}"
+S =3D "${UNPACKDIR}/${PYPI_PACKAGE_SDIST}-${PV}"
=20
-def pypi_normalize_regex(d):
-    # Use a regex wildcard instead of hyphen as the filenames
-    # may or may not have been normalised properly.
-    return pypi_normalize(d).replace("-", "[_-]")
-
-# Use the simple repository API rather than the potentially unstable pro=
ject URL
-# More information on the pypi API specification is avaialble here:
+# More information on the PyPI API specification is available here:
 # https://packaging.python.org/en/latest/specifications/simple-repositor=
y-api/
 #
-# NOTE: All URLs for the simple API MUST request canonical normalized UR=
Ls per the spec
-UPSTREAM_CHECK_URI ?=3D "https://pypi.org/simple/${@pypi_normalize(d)}/"
-UPSTREAM_CHECK_REGEX ?=3D "(?i)${@pypi_normalize_regex(d)}-(?P<pver>(\d+=
(\.[\d\-]+)*(\.post\d+)?))\.(tar\.gz|tgz|zip|tar\.bz2)"
+# Use a case-insensitive regex wildcard instead of hyphen as the filenam=
es may
+# or may not have been normalised.
+UPSTREAM_CHECK_URI ?=3D "https://pypi.org/simple/${PYPI_PACKAGE}/"
+UPSTREAM_CHECK_REGEX ?=3D "(?i)${@d.getVar("PYPI_PACKAGE").replace("-", =
"[_-]")}-(?P<pver>(\d+(\.[\d\-]+)*(\.post\d+)?))\.(tar\.gz|tgz|zip|tar\.b=
z2)"
=20
 CVE_PRODUCT ?=3D "python:${PYPI_PACKAGE}"
=20
 # Generate ecosystem-specific Package URL for SPDX
-SPDX_PACKAGE_URLS =3D+ "pkg:pypi/${@pypi_normalize(d)}@${PV} "
+SPDX_PACKAGE_URLS =3D+ "pkg:pypi/${PYPI_PACKAGE}@${PV} "
+
+def pypi_package_normalise(s):
+    """
+    Normalise the passed package name as per
+    https://packaging.python.org/en/latest/specifications/name-normaliza=
tion/
+    """
+    import re
+    return re.sub(r"[-_.]+", "-", s).lower()
--=20
2.43.0


