Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA5F8C77B73
	for <webhook@archiver.kernel.org>; Mon, 20 Mar 2023 13:28:04 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.13802.1679318876207346928
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Mar 2023 06:27:56 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A52441424;
	Mon, 20 Mar 2023 06:28:39 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 4C4AF3F71E;
	Mon, 20 Mar 2023 06:27:55 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH 03/17] python3: add missing -modules dependencies
Date: Mon, 20 Mar 2023 13:27:37 +0000
Message-Id: <20230320132751.518693-3-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230320132751.518693-1-ross.burton@arm.com>
References: <20230320132751.518693-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Mar 2023 13:28:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178815

The python3-modules package should depend on zoneinfo, and gdbm if it
was enabled.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-devtools/python/python3/python3-manifest.json | 3 ++-
 meta/recipes-devtools/python/python3_3.11.2.bb             | 1 +
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python3/python3-manifest.json b=
/meta/recipes-devtools/python/python3/python3-manifest.json
index 58e6f28a692..498402af422 100644
--- a/meta/recipes-devtools/python/python3/python3-manifest.json
+++ b/meta/recipes-devtools/python/python3/python3-manifest.json
@@ -835,7 +835,8 @@
             "unixadmin",
             "venv",
             "xml",
-            "xmlrpc"
+            "xmlrpc",
+            "zoneinfo"
         ],
         "rrecommends": [
             "distutils-windows"
diff --git a/meta/recipes-devtools/python/python3_3.11.2.bb b/meta/recipe=
s-devtools/python/python3_3.11.2.bb
index 98b25342283..5060722beb9 100644
--- a/meta/recipes-devtools/python/python3_3.11.2.bb
+++ b/meta/recipes-devtools/python/python3_3.11.2.bb
@@ -417,6 +417,7 @@ RDEPENDS:${PN}-misc +=3D "\
 "
 RDEPENDS:${PN}-modules:append:class-target =3D " ${MLPREFIX}python3-misc=
"
 RDEPENDS:${PN}-modules:append:class-nativesdk =3D " ${MLPREFIX}python3-m=
isc"
+RDEPENDS:${PN}-modules:append:class-target =3D " ${@bb.utils.contains('P=
ACKAGECONFIG', 'gdbm', '${MLPREFIX}python3-gdbm', '', d)}"
 FILES:${PN}-misc =3D "${libdir}/python${PYTHON_MAJMIN} ${libdir}/python$=
{PYTHON_MAJMIN}/lib-dynload"
=20
 # catch manpage
--=20
2.34.1


