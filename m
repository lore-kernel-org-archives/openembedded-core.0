Return-Path: <mingli.yu@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A89AD711D5
	for <webhook@archiver.kernel.org>; Mon, 22 Dec 2025 09:39:00 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.77327.1766396339959372491
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Dec 2025 01:38:59 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=JTUr2uUi;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=445155024b=mingli.yu@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BM5u23r1138180
	for <openembedded-core@lists.openembedded.org>; Mon, 22 Dec 2025 01:38:59 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=DPZj3iJ8qb2bJzvue05l
	VJ7LDF5HQNaQDtB6Ja4n4pc=; b=JTUr2uUimGP1sNmnSvBqOpHH/5aX2oSXa47e
	Q5iEJLBW7Nyrkj4nyBUzksbNlPEJV7V9a280WlBKagmjoB57U6xrwyMzYkGliqcz
	JMoOnApQZREER0DvaWzKt0eewoR1t/xg6OyJSyku0YVwDnfIT9MdZHjTpgO+FGM7
	rbHz6vgcMgDQXezTvJq65L9+CNoo4NNfvR0ZGk8JheD+BOkK6X4x1YXi8h8pDMb0
	oXjmOq1iu5xQNXKULK5nnxVStTh07uO6UmObzzlLatP5LMBYZ5Hbkmf5xBlkaFQF
	mx4XmtEYtCONvN+oxNYS6VXFGJ1IJi2xXxzFQtO7pIxFilGaEw==
Received: from ala-exchng02.corp.ad.wrs.com ([128.224.246.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4b5qy4se85-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 22 Dec 2025 01:38:59 -0800 (PST)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Mon, 22 Dec 2025 01:38:59 -0800
Received: from pek-lpg-core4.wrs.com (10.11.232.110) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Mon, 22 Dec 2025 01:38:58 -0800
From: <mingli.yu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] libxslt: Upgrade 1.1.43 -> 1.1.45
Date: Mon, 22 Dec 2025 17:38:53 +0800
Message-ID: <20251222093853.2833287-1-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-GUID: A9H10qeY-FGc_4GO0Z_3FI-lO1-CyE4m
X-Authority-Analysis: v=2.4 cv=Q+vfIo2a c=1 sm=1 tr=0 ts=694911b3 cx=c_pps
 a=Lg6ja3A245NiLSnFpY5YKQ==:117 a=Lg6ja3A245NiLSnFpY5YKQ==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=GHR8O2WEAAAA:20 a=Z5getJ8MAAAA:20 a=t7CeM3EgAAAA:8 a=t-IPkPogAAAA:8
 a=7CQSdrXTAAAA:8 a=jEmzW1iBHTGc4C56qsQA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=FdTzh2GWekK77mhwV6Dw:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIyMDA4NyBTYWx0ZWRfX7Zx2HcWUn/3g
 W0ebpwrxTCjvOEjjZ6cvbceQDltn0y9iRLrMXUdSF7yciDB4sx/8Ss5v9PVzo5J7c3i5utuh+QU
 rgOqQuV5sgMuEnFLzQRmEVJLJ9TU92iz8xBZuT06lHHATidgkd4DxCr0yxIuR3S3RQuKK+wH6Ob
 GgJVgmaBjSaYEkXhKCoEzu1KygcdWGX89TmhfMxoI9wfY5N4zodw7K+1kjxy+Ws5bFis6WelHaX
 nLhkBk81O4FG0yHqM/l9m+8xnCWf13DI+zuQXCB8LzxArhsBtZL5CFc8bfF9+mJ4CdlIKtl7J/0
 HerixdBJVXhbUjc6Nxi5CX684mGoKUbznDLmiGr5G908GWy3Hn3FY0BIuKBSOnMdLMiHQif3JWO
 VzKf6GSc7sCfDwqXFQrprR95IfY4kVJU8Mb0616gLinWxiEXUeFJMv05XFlXeejZVH4ECgu+4vz
 pj6rK079SoFXrOUDUvA==
X-Proofpoint-ORIG-GUID: A9H10qeY-FGc_4GO0Z_3FI-lO1-CyE4m
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-21_05,2025-12-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 malwarescore=0 adultscore=0 impostorscore=0
 suspectscore=0 phishscore=0 spamscore=0 priorityscore=1501 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512220087
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 5BM5u23r1138180
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Dec 2025 09:39:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228291

From: Mingli Yu <mingli.yu@windriver.com>

* Remove the patch gnome-libxslt-bug-139-apple-fix.diff as the CVE-2025-7=
424
issue has been fixed in new version.

* Changelog for v1.1.45

  Rebuild of v1.1.44

* Changelog for v1.1.44
  ## Major changes
  Libxml2 changed the meta tag information, removed the:
 `http-equiv=3D"Content-Type" content=3D"text/html;` attributes leaving
 only the `charset` attribute. This caused the tests to fail in the
 gitlab pipeline. Updated the test files accordingly.

  ## Security
  - [CVE-2025-9714] Fix: Was a false positive, closed issue #148.
  - [CVE-2025-7424] Fix: Type confusion in xmlNode.psvi between styleshee=
t and source
                  nodes (Fixed by Apple's engineers)
  - [CVE-2025-11731] Fix: End function node ancestor search at document

  ### Bug fixes
  - New maintainer: Iv=C3=A1n Chavero
  - CMake: cannot configure on MinGW-w64, missing Iconv::Iconv
  - Reset context variable when evaluating globals

  ### Tests
  - Update test outputs for new libxml2
  - Fixed Windows tests

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 .../gnome-libxslt-bug-139-apple-fix.diff      | 103 ------------------
 .../{libxslt_1.1.43.bb =3D> libxslt_1.1.45.bb}  |   5 +-
 2 files changed, 2 insertions(+), 106 deletions(-)
 delete mode 100644 meta/recipes-support/libxslt/files/gnome-libxslt-bug-=
139-apple-fix.diff
 rename meta/recipes-support/libxslt/{libxslt_1.1.43.bb =3D> libxslt_1.1.=
45.bb} (92%)

diff --git a/meta/recipes-support/libxslt/files/gnome-libxslt-bug-139-app=
le-fix.diff b/meta/recipes-support/libxslt/files/gnome-libxslt-bug-139-ap=
ple-fix.diff
deleted file mode 100644
index c7220ab954..0000000000
--- a/meta/recipes-support/libxslt/files/gnome-libxslt-bug-139-apple-fix.=
diff
+++ /dev/null
@@ -1,103 +0,0 @@
-From 345d6826d0eae6f0a962456b8ed6f6a1bad0877d Mon Sep 17 00:00:00 2001
-From: David Kilzer <ddkilzer@apple.com>
-Date: Sat, 24 May 2025 15:06:42 -0700
-Subject: [PATCH] libxslt: Type confusion in xmlNode.psvi between stylesh=
eet
- and source nodes
-
-* libxslt/functions.c:
-(xsltDocumentFunctionLoadDocument):
-- Implement fix suggested by Ivan Fratric.  This copies the xmlDoc,
-  calls xsltCleanupSourceDoc() to remove pvsi fields, then adds the
-  xmlDoc to tctxt->docList.
-- Add error handling for functions that may return NULL.
-* libxslt/transform.c:
-- Remove static keyword so this can be called from
-  xsltDocumentFunctionLoadDocument().
-* libxslt/transformInternals.h: Add.
-(xsltCleanupSourceDoc): Add declaration.
-
-Fixes #139.
-
-CVE: CVE-2025-7424
-Upstream-Status: Submitted [https://gitlab.gnome.org/GNOME/libxslt/-/iss=
ues/139]
-Signed-off-by: Ross Burton <ross.burton@arm.com>
----
- libxslt/functions.c          | 16 +++++++++++++++-
- libxslt/transform.c          |  3 ++-
- libxslt/transformInternals.h |  9 +++++++++
- 3 files changed, 26 insertions(+), 2 deletions(-)
- create mode 100644 libxslt/transformInternals.h
-
-diff --git a/libxslt/functions.c b/libxslt/functions.c
-index 72a58dc4..11ec039f 100644
---- a/libxslt/functions.c
-+++ b/libxslt/functions.c
-@@ -34,6 +34,7 @@
- #include "numbersInternals.h"
- #include "keys.h"
- #include "documents.h"
-+#include "transformInternals.h"
-=20
- #ifdef WITH_XSLT_DEBUG
- #define WITH_XSLT_DEBUG_FUNCTION
-@@ -125,7 +126,20 @@ xsltDocumentFunctionLoadDocument(xmlXPathParserCont=
extPtr ctxt,
- 	    /*
- 	    * This selects the stylesheet's doc itself.
- 	    */
--	    doc =3D tctxt->style->doc;
-+	    doc =3D xmlCopyDoc(tctxt->style->doc, 1);
-+	    if (doc =3D=3D NULL) {
-+		xsltTransformError(tctxt, NULL, NULL,
-+		    "document() : failed to copy style doc\n");
-+		goto out_fragment;
-+	    }
-+	    xsltCleanupSourceDoc(doc); /* Remove psvi fields. */
-+	    idoc =3D xsltNewDocument(tctxt, doc);
-+	    if (idoc =3D=3D NULL) {
-+		xsltTransformError(tctxt, NULL, NULL,
-+		    "document() : failed to create xsltDocument\n");
-+		xmlFreeDoc(doc);
-+		goto out_fragment;
-+	    }
- 	} else {
-             goto out_fragment;
- 	}
-diff --git a/libxslt/transform.c b/libxslt/transform.c
-index 54ef821b..38c2dce6 100644
---- a/libxslt/transform.c
-+++ b/libxslt/transform.c
-@@ -43,6 +43,7 @@
- #include "xsltlocale.h"
- #include "pattern.h"
- #include "transform.h"
-+#include "transformInternals.h"
- #include "variables.h"
- #include "numbersInternals.h"
- #include "namespaces.h"
-@@ -5757,7 +5758,7 @@ xsltCountKeys(xsltTransformContextPtr ctxt)
-  *
-  * Resets source node flags and ids stored in 'psvi' member.
-  */
--static void
-+void
- xsltCleanupSourceDoc(xmlDocPtr doc) {
-     xmlNodePtr cur =3D (xmlNodePtr) doc;
-     void **psviPtr;
-diff --git a/libxslt/transformInternals.h b/libxslt/transformInternals.h
-new file mode 100644
-index 00000000..d0f42823
---- /dev/null
-+++ b/libxslt/transformInternals.h
-@@ -0,0 +1,9 @@
-+/*
-+ * Summary: set of internal interfaces for the XSLT engine transformati=
on part.
-+ *
-+ * Copy: See Copyright for the status of this software.
-+ *
-+ * Author: David Kilzer <ddkilzer@apple.com>
-+ */
-+
-+void xsltCleanupSourceDoc(xmlDocPtr doc);
---=20
-2.39.5 (Apple Git-154)
-
diff --git a/meta/recipes-support/libxslt/libxslt_1.1.43.bb b/meta/recipe=
s-support/libxslt/libxslt_1.1.45.bb
similarity index 92%
rename from meta/recipes-support/libxslt/libxslt_1.1.43.bb
rename to meta/recipes-support/libxslt/libxslt_1.1.45.bb
index 3393be7ebe..c3440a99d4 100644
--- a/meta/recipes-support/libxslt/libxslt_1.1.43.bb
+++ b/meta/recipes-support/libxslt/libxslt_1.1.45.bb
@@ -13,10 +13,9 @@ LIC_FILES_CHKSUM =3D "file://Copyright;md5=3D0cd9a07af=
beb24026c9b03aecfeba458"
 SECTION =3D "libs"
 DEPENDS =3D "libxml2"
=20
-SRC_URI =3D "https://download.gnome.org/sources/libxslt/1.1/libxslt-${PV=
}.tar.xz \
-           file://gnome-libxslt-bug-139-apple-fix.diff"
+SRC_URI =3D "https://download.gnome.org/sources/libxslt/1.1/libxslt-${PV=
}.tar.xz"
=20
-SRC_URI[sha256sum] =3D "5a3d6b383ca5afc235b171118e90f5ff6aa27e9fea330306=
5231a6d403f0183a"
+SRC_URI[sha256sum] =3D "9acfe68419c4d06a45c550321b3212762d92f41465062ca4=
ea19e632ee5d216e"
=20
 UPSTREAM_CHECK_REGEX =3D "libxslt-(?P<pver>\d+(\.\d+)+)\.tar"
=20
--=20
2.34.1


