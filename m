Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B3EAFA3741
	for <webhook@archiver.kernel.org>; Mon, 31 Oct 2022 15:42:32 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web09.10716.1667230947618826629
 for <openembedded-core@lists.openembedded.org>;
 Mon, 31 Oct 2022 08:42:27 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2CD9E1FB;
	Mon, 31 Oct 2022 08:42:33 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6985A3F5A1;
	Mon, 31 Oct 2022 08:42:26 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH][kirkstone] expat: backport the fix for CVE-2022-43680
Date: Mon, 31 Oct 2022 15:42:24 +0000
Message-Id: <20221031154224.526148-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 31 Oct 2022 15:42:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172325

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../expat/expat/CVE-2022-43680.patch          | 33 +++++++++++++++++++
 meta/recipes-core/expat/expat_2.4.9.bb        |  1 +
 2 files changed, 34 insertions(+)
 create mode 100644 meta/recipes-core/expat/expat/CVE-2022-43680.patch

diff --git a/meta/recipes-core/expat/expat/CVE-2022-43680.patch b/meta/re=
cipes-core/expat/expat/CVE-2022-43680.patch
new file mode 100644
index 00000000000..76c55edc768
--- /dev/null
+++ b/meta/recipes-core/expat/expat/CVE-2022-43680.patch
@@ -0,0 +1,33 @@
+CVE: CVE-2022-43680
+Upstream-Status: Backport [5290462a7ea1278a8d5c0d5b2860d4e244f997e4]
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+
+From 5290462a7ea1278a8d5c0d5b2860d4e244f997e4 Mon Sep 17 00:00:00 2001
+From: Sebastian Pipping <sebastian@pipping.org>
+Date: Tue, 20 Sep 2022 02:44:34 +0200
+Subject: [PATCH] lib: Fix overeager DTD destruction in
+ XML_ExternalEntityParserCreate
+
+---
+ expat/lib/xmlparse.c | 8 ++++++++
+ 1 file changed, 8 insertions(+)
+
+diff --git a/lib/xmlparse.c b/lib/xmlparse.c
+index aacd6e7fc..57bf103cc 100644
+--- a/lib/xmlparse.c
++++ b/lib/xmlparse.c
+@@ -1068,6 +1068,14 @@ parserCreate(const XML_Char *encodingName,
+   parserInit(parser, encodingName);
+=20
+   if (encodingName && ! parser->m_protocolEncodingName) {
++    if (dtd) {
++      // We need to stop the upcoming call to XML_ParserFree from happi=
ly
++      // destroying parser->m_dtd because the DTD is shared with the pa=
rent
++      // parser and the only guard that keeps XML_ParserFree from destr=
oying
++      // parser->m_dtd is parser->m_isParamEntity but it will be set to
++      // XML_TRUE only later in XML_ExternalEntityParserCreate (or not =
at all).
++      parser->m_dtd =3D NULL;
++    }
+     XML_ParserFree(parser);
+     return NULL;
+   }
diff --git a/meta/recipes-core/expat/expat_2.4.9.bb b/meta/recipes-core/e=
xpat/expat_2.4.9.bb
index cb007708c78..22f9845a99b 100644
--- a/meta/recipes-core/expat/expat_2.4.9.bb
+++ b/meta/recipes-core/expat/expat_2.4.9.bb
@@ -9,6 +9,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D7b3b078238d090=
1d3b339289117cb7fb"
 VERSION_TAG =3D "${@d.getVar('PV').replace('.', '_')}"
=20
 SRC_URI =3D "https://github.com/libexpat/libexpat/releases/download/R_${=
VERSION_TAG}/expat-${PV}.tar.bz2  \
+           file://CVE-2022-43680.patch \
            file://run-ptest \
            "
=20
--=20
2.34.1


