Return-Path: <amaury.couderc@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 753DEC43458
	for <webhook@archiver.kernel.org>; Fri, 26 Jun 2026 14:28:57 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.65.59])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.36552.1782484127230343864
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Jun 2026 07:28:47 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=htDHVztu;
 spf=pass (domain: est.tech, ip: 52.101.65.59, mailfrom: amaury.couderc@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=auF98jj+0T1/Z8AHNHSFmsk6IEoMRIi1UxZ6aGh6OyQzaKYze5ae7hB3H/rwFNUM4zWDaBMpLx0T8RgAM0hyAwLqShl7GZRsLz3RCRr0W6Js5OZRNbmCQ8QJgI+lgw2FzwfEAu4xFK4nMqIBBcOcUS1JGdX8C9oLBN5XlCS//bwXCvi1WtlTdsuYfpdf3gotfh+87izN5aPU8myHjBxx9YbgoMsjIl/M3+CI+Fgx8QCZjPOEcmFSqeoaa3/u0NBRO7gSbUq36D5yu/3Us6K/jp3A8tFOlHnWj8M5DshZKLaIOcqNST94Xg6wvW42M8wJ0uZHCiG1kmiN8xBE54fbtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8CSXaOvZE1QWZqwOdcn6d2NetLwori0xf3mYj2dqn9o=;
 b=K/Jg4X1k5VLAJAEw5Iu0BJfbptf/sVYZjsUaac37daCyOnHjMSOcUFHZNPeKXgsfVrjgt8NCfUWEkGHN77mwIMPCvyvXNnochvnExp4mpvOOYvgbbaHMnSguUeTOAfm4//CFb/sgALW1UBLlr7Ek7NxFiIFUuo+HoNT+S2qdD8xTQJ/1/6t6PY+c2iOzPUsuTNok6854DjqK5SaJfR1eW1w8ldZDG/rkWCMkihYQCUhlYr7+rkLKJWFehUGH7429/9TMU3V06SFbfNCs5tgPpK0haEytjnJ88Z0sP1EDMu7xdvesfVh3SUb2nrnFYvkfn58LJhXkONYnSdHTSlcb1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8CSXaOvZE1QWZqwOdcn6d2NetLwori0xf3mYj2dqn9o=;
 b=htDHVztubvkVv6aMrqpCpKjqUWqroTUONcSRqJc6tQocbycCOoGDUKJRqdFpSDaOBs/6X0dOIZyQ0AEerdKOrKwcnfqU48WinUU1gljb7QEWtgyA6l6XnYBbPH9jOGGmlI3hbJEQEn+2fSjViZz3GM3wpa4pq8fQB9fd1ffHotWPu7oL54TxRH1D6kp4lwE6Mcuutul6o+omtb6hODfjdra/i4Oimia+H2w400kPAuPpMDIIh7kNr55EHa+o0MsIBX1pMs/Tc3kyJuZPTYQEu7j6Y2tovAjTykfb3p74w9vzJQa79vYpMhwUYqSlkTsg1Z7Prq1U/hI1Z7BZ/PxPaA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AMBP189MB3196.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6ad::11)
 by DB8P189MB0745.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:129::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.17; Fri, 26 Jun
 2026 14:28:43 +0000
Received: from AMBP189MB3196.EURP189.PROD.OUTLOOK.COM
 ([fe80::1afd:f059:542:3d95]) by AMBP189MB3196.EURP189.PROD.OUTLOOK.COM
 ([fe80::1afd:f059:542:3d95%4]) with mapi id 15.21.0159.013; Fri, 26 Jun 2026
 14:28:43 +0000
From: amaury.couderc@est.tech
To: openembedded-core@lists.openembedded.org
Subject: [PATCH][scarthgap] python3: fix CVE-2026-4224
Date: Fri, 26 Jun 2026 16:28:08 +0200
Message-ID: <20260626142836.40059-1-amaury.couderc@est.tech>
X-Mailer: git-send-email 2.43.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: LO4P123CA0682.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:351::7) To AMBP189MB3196.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6ad::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMBP189MB3196:EE_|DB8P189MB0745:EE_
X-MS-Office365-Filtering-Correlation-Id: caac231c-8fb4-4bd8-492f-08ded38f398c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|366016|1800799024|376014|6133799003|12006099003|18002099003|56012099006|11063799006|13003099007;
X-Microsoft-Antispam-Message-Info: 
	fm1sFXjt7hENPIFoW4OwaovsWH15CKin2YBpzDyOPk0qkzX1yuD5vru/oNBQC8nFdRx1U35N0FUFRK2JgHltNQGrrUzx47wv38miQONulAnCJJDMOJFT0JDuL7qn0s/DgPGtzrWs26Y+eUAe6fck0ZPs7qh7D7czHv+vR48y763/5v3HH30lLawTKu2WRw3KxeqTanhpc2eJME7fNnIHuFEQbIB3ku9GoPkl1Vvk8R7EYBPwYNbcEvvdM63CbfumTdsDn6E9P5OWUe3fiVlcbAZazv91n5fhFUV3IcZ4Xk9fjVEDwInNRmiRs/Dwn8wUUxxmYsFBILyGGmQBwX94eeIG/zM2yaykUxpzmPOgmLYuydaZWxYsKyhPW6QiGA4m4xpoKvxIXP4X7SOxqjXhwV3TJAppCNFb7fpqkCnWsfj6zrnkRVIDY0EOIM1StTmNW4hLrb4VaURWdTEnB+En5LdVdgw8vMFyBdfuecowfbkeeB9gATrVlGA2hBv+KCSlws+CclBTlqMLC9oKHZF6Kvq6QiTQsFiQUHivwdYcsXScTVaJLF/VjfGYKjyrM2l0O/234PDt1Z/U8WCLZQd8VwGUN6n2Ryz9aLWB4opJCWeIwxHMwvkKkKKIwgIniYzSS3h1cFAGCm5YKDXgjaJw2fQPhFHZA9aUstbF7mEWveI=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AMBP189MB3196.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(6133799003)(12006099003)(18002099003)(56012099006)(11063799006)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?wHc9MiTVP0GWQ2mmMfuUZQEMWxliK/JvIZX/rdQbAPYZR5SQBx9DERbOGJ6c?=
 =?us-ascii?Q?uMQ8R/sSoVozal6IfH8cae4E3lQ4xqwk2EpFsi/nDUhiSnqfnOvf3tgRen+z?=
 =?us-ascii?Q?g3xaKD3kwdOQBfptyX0+9Mnt1jbyGkzN426iFy1b413acWmhOt+KQ2qVyork?=
 =?us-ascii?Q?HRWnnUETnkZcAkK/NeA0idWBP9yPBZJBCZWcpUsfBPk/KSdsTJAcpvP0+7DL?=
 =?us-ascii?Q?Lj3ON5Q6Dt2aprCfruD1kN56gZAGGa29HGGw+zPyDXLP3zPgTi6ZOpbxTQKu?=
 =?us-ascii?Q?RWIQI5dSiaY91ay9qcN3tEUcRyARSzbPmQPx2cRRHg4S3Po5K5HX2bELlPhm?=
 =?us-ascii?Q?Tf6u06OO7UYIRD/Y2vCg0sxpfQkHb+TfTjimVpqXegkgePIo0QgbzjQSxb4s?=
 =?us-ascii?Q?jMFpGVK2iQ0FmLHuOGLxmim6kyJb33Mu88ipAAxNnfUTN4rnyUrP7B+CIwe+?=
 =?us-ascii?Q?gQAbcIMMV29rSzl4pF3VSKPDBeeI8f4GrQI/frbNiddiYO+6jU0cAxubQCcv?=
 =?us-ascii?Q?QvbUf+CVPJ2Z+iAOyu2pBS6cTTuAbBe77j8+sCHH5KS9ltWskdlAQyw0P1XE?=
 =?us-ascii?Q?5vkj0vPUHLuV4zPX2tjBIGtQwt5wf1tV2//zv15JQf1qZme+2/tSaEjAxgXf?=
 =?us-ascii?Q?jhMIJbh5lJ9H+OtOYLQwaCmOOQ2zGz+b+a5KdmCP5Thh2sISypc5/xdwvtal?=
 =?us-ascii?Q?93cGNDF4VHDvsXKrm7PYn3Ibsohfp3eDjG94u9wQ0JGu7YVSVSFQL8E7eDl/?=
 =?us-ascii?Q?qfKe7++nwhAi7cDlFhpECeTsMyr9mIV0Kchx0k01eA0OfOcawYyvawDap8LN?=
 =?us-ascii?Q?Mz0LXcmWaKVYw1iAI9B8+mb2ZJRFxSQLMY2wH7Cy4TtwqYp/k3oD0zd0cjn3?=
 =?us-ascii?Q?LAQnI/LjR8qskmwMNcJ4+RAgrXZP8MoiUjMdGlBfd+mGp3pzjm4wfhiyWXrj?=
 =?us-ascii?Q?n0Yoonuib5w/Z+s8XjrcUaIDWLCyfA8HJ+XAcnJCpMOSu4A+e4w8ewp3FyVL?=
 =?us-ascii?Q?lrA/KtuappaQ9hOtyVzfhJQ+SbE5C8WJn0fVR1vK8PtoLRas8w1fbZkBzqjz?=
 =?us-ascii?Q?YuhNNDWmnPRoXr4A3tt+kNiotrjVVyuf8U8W8cXfOZz+M2XUtgDfBDZDXlRT?=
 =?us-ascii?Q?0S2x18h8XWAOUc4U/jjtvjnM4o6dDDe6SvfPotPh6w/Z7xEeo6DJ2w+AfNnm?=
 =?us-ascii?Q?LM4G5+dhH/kyT5uQKU4scct9DyUUpRnhGUGrG+go0LbsUE4h2T7V/B3VZo8s?=
 =?us-ascii?Q?vmBPhYfmzkZr4pC1QRMIgiLY/FP2b3qxmTtxe0Es/oFOzxJSkcueJM8bgaYd?=
 =?us-ascii?Q?pPXIjtkjZFtySkovpSDS0NRhLKYLAYtvm31rCAlZiP27QYugcuo39M9oHSMI?=
 =?us-ascii?Q?vmcqaOQ8U0pLF9pXvAPNfiWo1axrz0+9WITtQpaGoKQNhdB6wRk8n+ulaGMC?=
 =?us-ascii?Q?qy6uOb9q8/y31oCoFZ/koE44Fu9TPDbgRpWEDdq4nDk1OmlYwQRYqBv7UWqG?=
 =?us-ascii?Q?BBk9xmmkqNSZK2lV+YANljTxgOhs+VfAu49rJJUCza045+SFRrB+lH/IhiyP?=
 =?us-ascii?Q?jz9GvUJ1BRti3uM9h+e0cgBX80TyTv/2ZVWOvenCW2g1tWVWynYKUKpete3F?=
 =?us-ascii?Q?LyBBY1gprFACBVxYTcU77Zmb66J5VKDrWJU3ZCS/Y6FtcZaAzp5z8sxKDVQ5?=
 =?us-ascii?Q?mvtaMs/owMttJgoEIDzQVktgpQRl4O31d6B5VFcnvd6eOmG7fTKP0W2syxVj?=
 =?us-ascii?Q?IK4k02oRYZ3IaLEEa26l+D+tEtIMdUo=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: caac231c-8fb4-4bd8-492f-08ded38f398c
X-MS-Exchange-CrossTenant-AuthSource: AMBP189MB3196.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2026 14:28:43.3531
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: B5/wN0rwu0xAj9b2beJBvs2FUMY8pArWqHJUG0zHUtovt28pDYrYGWVSAomnXx/gBUOQWBQudnWTZNK0tnKgTA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8P189MB0745
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 26 Jun 2026 14:28:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239638

From: Amaury Couderc <amaury.couderc@est.tech>

Backport patch to fix CVE-2026-4224.
https://nvd.nist.gov/vuln/detail/CVE-2026-4224

Upstream fix:
  https://github.com/python/cpython/commit/642865ddf4b232da1f3b1f7abcfa3254=
c4bfe785

Tested with ptest:
Before: PASSED: 40007, FAILED: 0, SKIPPED: 1877
After: PASSED: 40006, FAILED: 0, SKIPPED: 1877

Signed-off-by: Amaury Couderc <amaury.couderc@est.tech>
---
 .../python/python3/CVE-2026-4224.patch        | 121 ++++++++++++++++++
 .../python/python3_3.12.13.bb                 |   1 +
 2 files changed, 122 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3/CVE-2026-4224.patc=
h

diff --git a/meta/recipes-devtools/python/python3/CVE-2026-4224.patch b/met=
a/recipes-devtools/python/python3/CVE-2026-4224.patch
new file mode 100644
index 0000000000..2555912347
--- /dev/null
+++ b/meta/recipes-devtools/python/python3/CVE-2026-4224.patch
@@ -0,0 +1,121 @@
+From ca301e24e20d1d9d58bbd432ff103cab2cb87128 Mon Sep 17 00:00:00 2001
+From: Stan Ulbrych <stan@python.org>
+Date: Wed, 8 Apr 2026 11:27:39 +0100
+Subject: [PATCH] gh-145986: Avoid unbound C recursion in `conv_content_mod=
el`
+ in `pyexpat.c` (CVE-2026-4224) (GH-145987) (#146000)
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3DUTF-8
+Content-Transfer-Encoding: 8bit
+
+* [3.11] gh-145986: Avoid unbound C recursion in `conv_content_model` in `=
pyexpat.c` (CVE-2026-4224) (GH-145987)
+
+Fix C stack overflow (CVE-2026-4224) when an Expat parser
+with a registered `ElementDeclHandler` parses inline DTD
+containing deeply nested content model.
+
+---------
+(cherry picked from commit eb0e8be3a7e11b87d198a2c3af1ed0eccf532768)
+(cherry picked from commit e5caf45faac74b0ed869e3336420cffd3510ce6e)
+
+Co-authored-by: Stan Ulbrych <89152624+StanFromIreland@users.noreply.githu=
b.com>
+Co-authored-by: B=C3=A9n=C3=A9dikt Tran <10796600+picnixz@users.noreply.gi=
thub.com>
+
+* Update Misc/NEWS.d/next/Security/2026-03-14-17-31-39.gh-issue-145986.ifS=
Sr8.rst
+
+---------
+
+Co-authored-by: B=C3=A9n=C3=A9dikt Tran <10796600+picnixz@users.noreply.gi=
thub.com>
+
+CVE: CVE-2026-4224
+Upstream-Status: Backport [https://github.com/python/cpython/commit/642865=
ddf4b232da1f3b1f7abcfa3254c4bfe785]
+
+Signed-off-by: Amaury Couderc <amaury.couderc@est.tech>
+---
+ Lib/test/test_pyexpat.py                       | 18 ++++++++++++++++++
+ ...6-03-14-17-31-39.gh-issue-145986.ifSSr8.rst |  4 ++++
+ Modules/pyexpat.c                              |  9 ++++++++-
+ 3 files changed, 30 insertions(+), 1 deletion(-)
+ create mode 100644 Misc/NEWS.d/next/Security/2026-03-14-17-31-39.gh-issue=
-145986.ifSSr8.rst
+
+diff --git a/Lib/test/test_pyexpat.py b/Lib/test/test_pyexpat.py
+index 38f951573f0..37d9086f40a 100644
+--- a/Lib/test/test_pyexpat.py
++++ b/Lib/test/test_pyexpat.py
+@@ -675,6 +675,24 @@ class ChardataBufferTest(unittest.TestCase):
+         parser.Parse(xml2, True)
+         self.assertEqual(self.n, 4)
+=20
++class ElementDeclHandlerTest(unittest.TestCase):
++    def test_deeply_nested_content_model(self):
++        # This should raise a RecursionError and not crash.
++        # See https://github.com/python/cpython/issues/145986.
++        N =3D 500_000
++        data =3D (
++            b'<!DOCTYPE root [\n<!ELEMENT root '
++            + b'(a, ' * N + b'a' + b')' * N
++            + b'>\n]>\n<root/>\n'
++        )
++
++        parser =3D expat.ParserCreate()
++        parser.ElementDeclHandler =3D lambda _1, _2: None
++        with support.infinite_recursion():
++            with self.assertRaises(RecursionError):
++                parser.Parse(data)
++
++
+ class MalformedInputTest(unittest.TestCase):
+     def test1(self):
+         xml =3D b"\0\r\n"
+diff --git a/Misc/NEWS.d/next/Security/2026-03-14-17-31-39.gh-issue-145986=
.ifSSr8.rst b/Misc/NEWS.d/next/Security/2026-03-14-17-31-39.gh-issue-145986=
.ifSSr8.rst
+new file mode 100644
+index 00000000000..cb9dbadb72d
+--- /dev/null
++++ b/Misc/NEWS.d/next/Security/2026-03-14-17-31-39.gh-issue-145986.ifSSr8=
.rst
+@@ -0,0 +1,4 @@
++:mod:`xml.parsers.expat`: Fixed a crash caused by unbounded C recursion w=
hen
++converting deeply nested XML content models with
++:meth:`~xml.parsers.expat.xmlparser.ElementDeclHandler`.
++This addresses `CVE-2026-4224 <https://www.cve.org/CVERecord?id=3DCVE-202=
6-4224>`_.
+diff --git a/Modules/pyexpat.c b/Modules/pyexpat.c
+index 79492ca5c4f..8673540f358 100644
+--- a/Modules/pyexpat.c
++++ b/Modules/pyexpat.c
+@@ -3,6 +3,7 @@
+ #endif
+=20
+ #include "Python.h"
++#include "pycore_ceval.h"           // _Py_EnterRecursiveCall()
+ #include "pycore_runtime.h"         // _Py_ID()
+ #include <ctype.h>
+=20
+@@ -578,6 +579,10 @@ static PyObject *
+ conv_content_model(XML_Content * const model,
+                    PyObject *(*conv_string)(const XML_Char *))
+ {
++    if (_Py_EnterRecursiveCall(" in conv_content_model")) {
++        return NULL;
++    }
++
+     PyObject *result =3D NULL;
+     PyObject *children =3D PyTuple_New(model->numchildren);
+     int i;
+@@ -589,7 +594,7 @@ conv_content_model(XML_Content * const model,
+                                                  conv_string);
+             if (child =3D=3D NULL) {
+                 Py_XDECREF(children);
+-                return NULL;
++                goto done;
+             }
+             PyTuple_SET_ITEM(children, i, child);
+         }
+@@ -597,6 +602,8 @@ conv_content_model(XML_Content * const model,
+                                model->type, model->quant,
+                                conv_string,model->name, children);
+     }
++done:
++    _Py_LeaveRecursiveCall();
+     return result;
+ }
+=20
+--=20
+2.34.1
diff --git a/meta/recipes-devtools/python/python3_3.12.13.bb b/meta/recipes=
-devtools/python/python3_3.12.13.bb
index 5fa25235fe..631ae684c3 100644
--- a/meta/recipes-devtools/python/python3_3.12.13.bb
+++ b/meta/recipes-devtools/python/python3_3.12.13.bb
@@ -34,6 +34,7 @@ SRC_URI =3D "http://www.python.org/ftp/python/${PV}/Pytho=
n-${PV}.tar.xz \
 	   file://0001-test_deadlock-skip-problematic-test.patch \
 	   file://0001-test_active_children-skip-problematic-test.patch \
            file://0001-test_readline-skip-limited-history-test.patch \
+           file://CVE-2026-4224.patch \
            "
=20
 SRC_URI:append:class-native =3D " \
--=20
2.44.1


