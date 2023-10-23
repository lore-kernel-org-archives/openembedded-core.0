Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3BFFBC25B45
	for <webhook@archiver.kernel.org>; Mon, 23 Oct 2023 17:38:33 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.127369.1698082705884606113
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Oct 2023 10:38:25 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9AC0E2F4;
	Mon, 23 Oct 2023 10:39:06 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 106AA3F762;
	Mon, 23 Oct 2023 10:38:24 -0700 (PDT)
From: ross.burton@arm.com
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH][master nanbield 1/4] libxml2: ignore disputed CVE-2023-45322
Date: Mon, 23 Oct 2023 18:38:19 +0100
Message-Id: <20231023173822.3476595-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 23 Oct 2023 17:38:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189626

From: Ross Burton <ross.burton@arm.com>

This CVE is a use-after-free which theoretically can be an exploit
vector, but this UAF only occurs when malloc() fails.  As it's
unlikely that the user can orchestrate malloc() failures at just the
place to break on _this_ malloc and not others it is disputed that this
is actually a security issue.

The underlying bug has been fixed, and will be incorporated into the
next release.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-core/libxml/libxml2_2.11.5.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-core/libxml/libxml2_2.11.5.bb b/meta/recipes-co=
re/libxml/libxml2_2.11.5.bb
index 4cf6dd09a9a..fc82912df25 100644
--- a/meta/recipes-core/libxml/libxml2_2.11.5.bb
+++ b/meta/recipes-core/libxml/libxml2_2.11.5.bb
@@ -21,6 +21,9 @@ SRC_URI +=3D "http://www.w3.org/XML/Test/xmlts20130923.=
tar;subdir=3D${BP};name=3Dtestt
 SRC_URI[archive.sha256sum] =3D "3727b078c360ec69fa869de14bd6f75d7ee8d369=
87b071e6928d4720a28df3a6"
 SRC_URI[testtar.sha256sum] =3D "c6b2d42ee50b8b236e711a97d68e6c4b5c8d83e6=
9a2be4722379f08702ea7273"
=20
+# Disputed as a security issue, but fixed in d39f780
+CVE_STATUS[CVE-2023-45322] =3D "disputed: issue requires memory allocati=
on to fail"
+
 BINCONFIG =3D "${bindir}/xml2-config"
=20
 PACKAGECONFIG ??=3D "python \
--=20
2.34.1


