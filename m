Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3A57C54E6E
	for <webhook@archiver.kernel.org>; Fri, 15 Mar 2024 14:38:00 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.23986.1710513475294091928
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Mar 2024 07:37:55 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 41E2EC15
	for <openembedded-core@lists.openembedded.org>; Fri, 15 Mar 2024 07:38:30 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 9A9EB3F8A4
	for <openembedded-core@lists.openembedded.org>; Fri, 15 Mar 2024 07:37:54 -0700 (PDT)
From: ross.burton@arm.com
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/3] classes/pypi: don't expose PYPI_ARCHIVE_NAME
Date: Fri, 15 Mar 2024 14:37:51 +0000
Message-Id: <20240315143751.1235135-3-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240315143751.1235135-1-ross.burton@arm.com>
References: <20240315143751.1235135-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 Mar 2024 14:38:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197138

From: Ross Burton <ross.burton@arm.com>

This variable is only used when constructing a SRC_URI and some recipes
think that it's the correct value to assign if the PyPi package name
isn't the same as the recipe name, when PYPI_PACKAGE is actually all
that needs to be set.

Also document the variables we expect the recipe to assign if needed,
and where the PyPi URL structure is documented.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/classes-recipe/pypi.bbclass | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/meta/classes-recipe/pypi.bbclass b/meta/classes-recipe/pypi.=
bbclass
index b8c18ccf395..c6bbe8119a6 100644
--- a/meta/classes-recipe/pypi.bbclass
+++ b/meta/classes-recipe/pypi.bbclass
@@ -12,14 +12,19 @@ def pypi_package(d):
         return bpn[8:]
     return bpn
=20
+# The PyPi package name (defaults to PN without the python3- prefix)
 PYPI_PACKAGE ?=3D "${@pypi_package(d)}"
+# The file extension of the source archive
 PYPI_PACKAGE_EXT ?=3D "tar.gz"
-PYPI_ARCHIVE_NAME ?=3D "${PYPI_PACKAGE}-${PV}.${PYPI_PACKAGE_EXT}"
+# An optional prefix for the download file in the case of name collision=
s
 PYPI_ARCHIVE_NAME_PREFIX ?=3D ""
=20
 def pypi_src_uri(d):
+    """
+    Construct a source URL as per https://warehouse.pypa.io/api-referenc=
e/integration-guide.html#predictable-urls.
+    """
     package =3D d.getVar('PYPI_PACKAGE')
-    archive_name =3D d.getVar('PYPI_ARCHIVE_NAME')
+    archive_name =3D d.expand('${PYPI_PACKAGE}-${PV}.${PYPI_PACKAGE_EXT}=
')
     archive_downloadname =3D d.getVar('PYPI_ARCHIVE_NAME_PREFIX') + arch=
ive_name
     return 'https://files.pythonhosted.org/packages/source/%s/%s/%s;down=
loadfilename=3D%s' % (package[0], package, archive_name, archive_download=
name)
=20
--=20
2.34.1


