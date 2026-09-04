Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3809C624D3
	for <webhook@archiver.kernel.org>; Fri,  4 Sep 2026 13:36:27 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13855.1788528977802758173
 for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Sep 2026 06:36:17 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=W0xdmwyn;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9BCB3152B
	for <openembedded-core@lists.openembedded.org>; Fri,  4 Sep 2026 06:36:13 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id E358D3F7D8
	for <openembedded-core@lists.openembedded.org>; Fri,  4 Sep 2026 06:36:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1788528977; bh=0dX4NtREhaRB/Aei7eEDxpMoK/NdbCQuToowNQ0MHQE=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=W0xdmwynkrTf4C46UsqQ1knZminQePWIGFfC2P5FD0j4lBI2MiB3oqejqWMaFVPSb
	 4IwtMsgbkFvVbxr+oBgVb8B+shDHZmhvKwDhsZTRpvwXFpubAx5HqWKo+RbuBmcfpi
	 4U6X7Z79hnMyKhhdrVlQs+9VSS0Mr8AN2+heUWPY=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/4] classes/pypi: only set downloadprefix in SRC_URI if needed
Date: Fri,  4 Sep 2026 14:36:08 +0100
Message-ID: <20260904133610.774110-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260904133610.774110-1-ross.burton@arm.com>
References: <20260904133610.774110-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 04 Sep 2026 13:36:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245105

Don't bloat the SRC_URI by setting a redundant downloadprefix if it is
not required.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/classes-recipe/pypi.bbclass | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/meta/classes-recipe/pypi.bbclass b/meta/classes-recipe/pypi.=
bbclass
index 0897994bb65..b42b171e151 100644
--- a/meta/classes-recipe/pypi.bbclass
+++ b/meta/classes-recipe/pypi.bbclass
@@ -25,8 +25,13 @@ def pypi_src_uri(d):
     """
     package =3D d.getVar('PYPI_PACKAGE')
     archive_name =3D d.expand('${PYPI_PACKAGE}-${PV}.${PYPI_PACKAGE_EXT}=
')
-    archive_downloadname =3D d.getVar('PYPI_ARCHIVE_NAME_PREFIX') + arch=
ive_name
-    return 'https://files.pythonhosted.org/packages/source/%s/%s/%s;down=
loadfilename=3D%s' % (package[0], package, archive_name, archive_download=
name)
+    url =3D 'https://files.pythonhosted.org/packages/source/%s/%s/%s' % =
(package[0], package, archive_name)
+
+    download_prefix =3D d.getVar("PYPI_ARCHIVE_NAME_PREFIX")
+    if download_prefix:
+        url +=3D ";downloadfilename=3D" + download_prefix + archive_name
+
+    return url
=20
 def pypi_normalize(d):
     """"
--=20
2.43.0


