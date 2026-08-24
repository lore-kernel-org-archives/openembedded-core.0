Return-Path: <jakub.szczudlo@nokia.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C385C5DF81
	for <webhook@archiver.kernel.org>; Mon, 24 Aug 2026 15:15:19 +0000 (UTC)
Received: from AM0PR83CU005.outbound.protection.outlook.com (AM0PR83CU005.outbound.protection.outlook.com [52.101.69.23])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.18995.1787584513854410918
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Aug 2026 08:15:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@nokia.com header.s=selector1 header.b=YtmFgmHd;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: nokia.com, ip: 52.101.69.23, mailfrom: jakub.szczudlo@nokia.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EzM3TNNPSFiMATkbzWcfWAmuYJLHm9nzC2cOnwdf0TUKmp0+H8un8L2n7zdez383K5dAnu8lWOOSEax93Jh3SxE65/5bSEZdkoqWEL8gZcICHUEyjPpeX8vdXmRkadil2gigOjEk822QOoGSrDWTf/wz7nI2/QDDXg4Cc7YnUjmYfm6uasM9qKoV8z2Djmzh09puZAoBonZPHy1mnQN3y3t6t2xMkJasu181QIgHA8qIFjIQQmxm3FDDT3Y8GQ3g4WKO5rx2gHdc02IQD7h5HkvwlPelUQrd/jvC9qUSXKGaC3yURPdaqiggqdybLbzfM1KAx60785tdCWidicdpBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DZ7+oM0Sr7dXlgBaRRaR2jOqoFn4yH2aI3XAI+upIL4=;
 b=vdvSQmizzhSTXkkBRvSjeA3K7AKVnzEK/YqW2ZAg/O0m1DT65F7yW7hE5v7N8unlFwsN/xNLkfe+XMXiwfkjOMmWNhw4qdzJoCN/uBo5AmaH/Cbu/FFFz+CwA+6X6CJ5Yo+olI2T4dZB49p7Yu9vEIbQFuVGC+qHvLeFOYGyoBurwQuu16ZXnQUC5MTDq8suKg0C5UdZx+CuvfyHcxR6ktCsrygYZX23YjB03XIH+q76svBL3/qNlg3iKHEffologgnl7OseGWj/wMfuGPvycPeOHsSzTsFuQetUfg0LF3x+jShq44JcW1kBfB6n2tuOAY8g4CT3VFU/Nf8OoTVgFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nokia.com; dmarc=pass action=none header.from=nokia.com;
 dkim=pass header.d=nokia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nokia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DZ7+oM0Sr7dXlgBaRRaR2jOqoFn4yH2aI3XAI+upIL4=;
 b=YtmFgmHd3KfYcOiHZvd+F4sO6fJMSzCpdKDGCpF2Y7FUYIUrWiNz/ofbhJFUpi4poVCCymbkwImVcfHa23JmNaew1bwF1rOY65V4lLFyXkPeNGZlTNP0D99wFE7yBW/xgDhqporVYAUtbpFUQgE8XKBrcFho3q5I/p3UgqUNx/2sQm2x9FUBWq7ZXUmfNWd4igjP3gYOARBoQpQVRoihXfOZap5c8DBnbrKQRk38tcaz9tbqEY5Pj2sKd0e+aG2GftcxSQ1bSPp+6xgub2GISMRQshasTbTOdSmCVakQ9tUKekmxkhMViOTbcNGELK2Vvfa9g2Dul8cuU9sx7Tp5RA==
Received: from GV2PR07MB11919.eurprd07.prod.outlook.com
 (2603:10a6:150:357::20) by AMBPR07MB11278.eurprd07.prod.outlook.com
 (2603:10a6:20b:6f1::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.6; Mon, 24 Aug
 2026 15:15:11 +0000
Received: from GV2PR07MB11919.eurprd07.prod.outlook.com
 ([fe80::159a:9a82:1362:e680]) by GV2PR07MB11919.eurprd07.prod.outlook.com
 ([fe80::159a:9a82:1362:e680%3]) with mapi id 15.21.0360.005; Mon, 24 Aug 2026
 15:15:11 +0000
From: "Jakub Szczudlo (Nokia)" <jakub.szczudlo@nokia.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: "yoann.congal@smile.fr" <yoann.congal@smile.fr>, "Jakub Szczudlo (Nokia)"
	<jakub.szczudlo@nokia.com>
Subject: [PATCH 2/3] expat: fix CVE-2026-56131
Thread-Topic: [PATCH 2/3] expat: fix CVE-2026-56131
Thread-Index: AQHdM9tbzne/PJYr5ESRFQ6mVzM5ag==
Date: Mon, 24 Aug 2026 15:15:11 +0000
Message-ID: <20260824151448.19118-2-jakub.szczudlo@nokia.com>
References: <20260824151448.19118-1-jakub.szczudlo@nokia.com>
In-Reply-To: <20260824151448.19118-1-jakub.szczudlo@nokia.com>
Accept-Language: en-US, en-150
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nokia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV2PR07MB11919:EE_|AMBPR07MB11278:EE_
x-ms-office365-filtering-correlation-id: cced165a-8ae3-43b1-b735-08df01f27da8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|376014|23010399003|1800799024|366016|38070700021|10067099003|56012099006|11063799006|22082099003|18002099003;
x-microsoft-antispam-message-info: 
 qLP/ptXFY8oZ2G2fC2RADGh7cgIoENZ31aEdD+2d7DO6ojeZAGseBMLp1drbULafpB997gk9Iu1Hpm+PFaEWxkFlo1KN8lBFQKXkxLlckqdcGAGXY4/gR5wLe6OqWZpDGjj7VnCz3nzKYgIVrT2NvTIzniKJ8UD7ZmLkRNi8QnrhCVZ8zwd0IhEpbnBRWzktu7px2W54CArQIIXZmqqr9b6JWTU2wX8yJVMHTODQP6LdeiO68R6InXgpsiyWTj+HMHX6j8cFvaNx9u1u0hxu7fBKBpA1rWqc+NRGkVMIm2H89m4QCqYBm0Y3Z1zJdT5NQeseystLe6HB+EPWwC6tMGhibPiF2cfj963S523cE1S8Gn9ygxrvYztv77mKVf9/HEhol7e2i+FR2rnEz9rMdKmCwHgVqovRiCmUiDCv6IxF2VIYgrSU7JVPDgR703qNtijBdlCFTr3mK6Nec0gQ5TntAADWOpZaznwbLaN1n/BZh9uHUlMRqlCmuU+KDzLlZ07JHoNi+WV3D2be8uDpKWAkH86DzGhQqTmsS4MZqk6LxsxvbLjAcv+mFm9fEuBNJGzipSjB+MOwRrcOYatp2esOpD3PUyVYY2DUZdvw4NwE/o9lCLDEgZ4ZrXGs/8ji+RJbL++nCzOAibRTyOS5lsnYm5D6hNJmwOaf3JF+bOM=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR07MB11919.eurprd07.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(38070700021)(10067099003)(56012099006)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?5B2r/hmIcem6GYe3drh56CGf4o8H+cjSfgWSAa10uj92VnNIjCtyMvR89r?=
 =?iso-8859-1?Q?HeIImL4lmYKSBaDk2CTnzgS3LDdwshL24IBhaoyGJDCSDA+mCb1sBSn6EZ?=
 =?iso-8859-1?Q?09clofibg0xR2Obsz+XLjhaHAy0lWqfPKApdygjN4UkBqbsPCadcbiPYv7?=
 =?iso-8859-1?Q?wEu+7mcHa6ZAzQGRTxG7sPJKc9tXQUL0CTVpx+V1wJeCgFujIoOdkfQdVt?=
 =?iso-8859-1?Q?YSnQ6LLd5Flk/0JzjkJhBBnEG6GBDobFoMAVeQD9N6ek0z5SOLIwhKOwg4?=
 =?iso-8859-1?Q?DnbisGYvtZFRtxa1CEnn98dcwwUJOPb7zZ2xiT6RcIyq5PKAp5SWPLSIe0?=
 =?iso-8859-1?Q?LJ5h/eRNzuFxhBN2cND/0ZQlMWqPqlVqtgR8nfC5ZaAzCT5/ToAKSuQzuh?=
 =?iso-8859-1?Q?5AlDo5PIdNj53TiEI4zgJqu7dovIIqdHLkADoioEu+gLMjKqnghap43JMw?=
 =?iso-8859-1?Q?YuUNPwSD6b4gWCqwId9Qw+5yTFic3UxI5b4GzoXEPNExeQPLblD/wMa15v?=
 =?iso-8859-1?Q?p86xsyLuqjn3J2rCWmGpk7yBUexf6PO5px9qM6VBEwyzYG0KUxUoV4sgRS?=
 =?iso-8859-1?Q?72FYeR5CdkTVRHSfEO10g94BArNDrZVSKLX+3BzJqkH4pkDvjfoo49e3J9?=
 =?iso-8859-1?Q?KAVK/e8fngX21T4/b1SfHIGl65qd5frjqCNojWmSsevNq/IQ1TY7iouV/q?=
 =?iso-8859-1?Q?nw4lfafw5GRmZh50s+oohyUSPjDSZHWuEYgbznxbM4qmr1nw9URxs6O/ei?=
 =?iso-8859-1?Q?ZnisjAA1u27ORQ47Ljd45w/lpggyvP0zmKXvCM3RIddXC5/O+8JtNGoc/9?=
 =?iso-8859-1?Q?nmCwbf5Mke4n1bIy/k1YwfSxjYfBr/tvHa/OI0tU97Z+GRmPKuYFnx0Esm?=
 =?iso-8859-1?Q?BqjD+DoBKoAmz734YIkpbcgBBCKb0lE33tT3gHGHhs2+gxW2hDRFU3IM//?=
 =?iso-8859-1?Q?Ak9Cj0MtYLG68MfOyuO4h90CtoVUel3Dc7fasCtY8E7eTYkiW/i6HdIL6H?=
 =?iso-8859-1?Q?c3dbldVbgJfjoXU7J9+Mr5fMIWrq76uGbH50hIDc42snCvodwdhthvKQSU?=
 =?iso-8859-1?Q?QcCWpP8Mm7xcjlaJ1lSEiaxLEzDc179Kc+U6njeQ3JWgzr8JFG4DhMauOl?=
 =?iso-8859-1?Q?8huYc+nVd6vmF0aBfqN7oXQ+GS82H4D5DPHCEed2hrEw80cT4SEEkO1nHX?=
 =?iso-8859-1?Q?bwqOvrviGZuvrAbtViCVnIKye5/spXh+UEx8CZ612CZCZKwUTJ2QdsmOjk?=
 =?iso-8859-1?Q?IM89soMiWw9rHqRgFp7Zv2h8olkd9X4myOlsWz86D6nWG8RdieW6tdFk2A?=
 =?iso-8859-1?Q?eDHQ5Xr/UmNmJBva5Gcp7s1SlRtUo33xv1V8WwkeSq3kVCF7xXVVckfxOW?=
 =?iso-8859-1?Q?JLKqAspV6+NVz5WE5TT52OYMxAF1ZvuGNE3TZY1RzbuMDBFO+H6Lmfu1sR?=
 =?iso-8859-1?Q?6HZUPEzjisTjjLwTJ6GK5P4liSa+06PIgqDWZRuqI6jUfXVbhktMbDy4Xp?=
 =?iso-8859-1?Q?qIGz34R0067djVvP/sbkWkTsiQbU+jj2mg/FYO8/qYrsLomynM4zSnw5jj?=
 =?iso-8859-1?Q?P0mZOLr3aSJ46THmi0RH2/aKKOkGyXxKvwSnxqjv0Xn5V1Car8P6NUvW3R?=
 =?iso-8859-1?Q?2P+hf9h9XdzgYh991PK5+IrOxiFT96EuiOFLzRSKogyj01z/ec6O1vtYoJ?=
 =?iso-8859-1?Q?b2xIkp/qomG3DqyWxzL+Kk02BFz0PDfBDC9JNYAj9T16E6sRclUAs2O355?=
 =?iso-8859-1?Q?e26854mhf4PBK/lwWTvNEsbCc8CyjUwJbwemnOKQs2RdR3fgqvJHTKFnLR?=
 =?iso-8859-1?Q?twR7Kur10A=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nokia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV2PR07MB11919.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cced165a-8ae3-43b1-b735-08df01f27da8
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Aug 2026 15:15:11.1620
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5d471751-9675-428d-917b-70f44f9630b0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7+tfC9NpRpiWOKd0w6QwpSobjHiLbs1Cip9i1PE8F9lrOuA9pt49ovG9V0HwIzG8dnRgEKgQF5AOrOC1NE2dLe/4RpCN08GtZqBhaHJv6BE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMBPR07MB11278
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 24 Aug 2026 15:15:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244128

Backport patch to fix CVE-2026-56131.=0A=
=0A=
References:=0A=
  https://nvd.nist.gov/vuln/detail/CVE-2026-56131=0A=
=0A=
Upstream fix:=0A=
  https://github.com/libexpat/libexpat/commit/d5a654b4881f450827af5b3b7b723=
70a3bbf9a8f=0A=
=0A=
Signed-off-by: Jakub Szczudlo <jakub.szczudlo@nokia.com>=0A=
---=0A=
 .../expat/expat/CVE-2026-56131.patch          | 124 ++++++++++++++++++=0A=
 meta/recipes-core/expat/expat_2.7.5.bb        |   1 +=0A=
 2 files changed, 125 insertions(+)=0A=
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-56131.patch=0A=
=0A=
diff --git a/meta/recipes-core/expat/expat/CVE-2026-56131.patch b/meta/reci=
pes-core/expat/expat/CVE-2026-56131.patch=0A=
new file mode 100644=0A=
index 0000000000..8691f98f89=0A=
--- /dev/null=0A=
+++ b/meta/recipes-core/expat/expat/CVE-2026-56131.patch=0A=
@@ -0,0 +1,124 @@=0A=
+From 29dfca6ad4d2a9dfd5ce72efd72e1b67d598ab4c Mon Sep 17 00:00:00 2001=0A=
+From: netliomax25-code <netliomax25@gmail.com>=0A=
+Date: Sat, 6 Jun 2026 20:03:53 +0530=0A=
+Subject: [PATCH] lib: protect XML_ResumeParser from being called from a=0A=
+ handler=0A=
+=0A=
+The handler-reentrancy guards from CVE-2026-50219 cover XML_Parse, XML_Par=
seBuffer, XML_GetBuffer, XML_ParserFree and XML_ParserReset but not XML_Res=
umeParser, which drives the parser through callProcessor in the same way.=
=0A=
+=0A=
+(cherry picked from commit d5a654b4881f450827af5b3b7b72370a3bbf9a8f)=0A=
+=0A=
+CVE: CVE-2026-56131=0A=
+Upstream-Status: Backport [https://github.com/libexpat/libexpat/pull/1267/=
commits/d5a654b4881f450827af5b3b7b72370a3bbf9a8f]=0A=
+Signed-off-by: Jakub Szczudlo <jakub.szczudlo@nokia.com>=0A=
+---=0A=
+ lib/xmlparse.c     |  2 +-=0A=
+ tests/handlers.c   | 24 ++++++++++++++++++++++++=0A=
+ tests/handlers.h   |  9 +++++++++=0A=
+ tests/misc_tests.c | 20 ++++++++++++++++++++=0A=
+ 4 files changed, 54 insertions(+), 1 deletion(-)=0A=
+=0A=
+diff --git a/lib/xmlparse.c b/lib/xmlparse.c=0A=
+index cc1d550..a5fa256 100644=0A=
+--- a/lib/xmlparse.c=0A=
++++ b/lib/xmlparse.c=0A=
+@@ -2778,7 +2778,7 @@ enum XML_Status XMLCALL=0A=
+ XML_ResumeParser(XML_Parser parser) {=0A=
+   enum XML_Status result =3D XML_STATUS_OK;=0A=
+ =0A=
+-  if (parser =3D=3D NULL)=0A=
++  if ((parser =3D=3D NULL) || isCalledFromInsideHandler(parser))=0A=
+     return XML_STATUS_ERROR;=0A=
+   if (parser->m_parsingStatus.parsing !=3D XML_SUSPENDED) {=0A=
+     parser->m_errorCode =3D XML_ERROR_NOT_SUSPENDED;=0A=
+diff --git a/tests/handlers.c b/tests/handlers.c=0A=
+index c7d6578..5a85f6d 100644=0A=
+--- a/tests/handlers.c=0A=
++++ b/tests/handlers.c=0A=
+@@ -2015,3 +2015,27 @@ forbidden_calls_character_handler(void *userData, c=
onst XML_Char *s, int len) {=0A=
+ =0A=
+   assert_true(XML_GetErrorCode(parser) =3D=3D XML_ERROR_NONE);=0A=
+ }=0A=
++=0A=
++void XMLCALL=0A=
++suspend_then_resume_character_handler(void *userData, const XML_Char *s,=
=0A=
++                                      int len) {=0A=
++  UNUSED_P(s);=0A=
++  UNUSED_P(len);=0A=
++  ResumeFromHandlerData *const data =3D (ResumeFromHandlerData *)userData=
;=0A=
++=0A=
++  data->callCount++;=0A=
++  if (data->callCount > 1) {=0A=
++    // Reached only if the guard under test is missing: XML_ResumeParser =
would=0A=
++    // then have driven the parser re-entrantly and called us again.  Bai=
l out=0A=
++    // so the test fails by assertion below rather than recursing without=
 bound.=0A=
++    return;=0A=
++  }=0A=
++=0A=
++  // Put the parser into XML_SUSPENDED so that, without the guard,=0A=
++  // XML_ResumeParser would proceed into a re-entrant parse.=0A=
++  assert_true(XML_StopParser(data->parser, /*resumable=3D*/XML_TRUE)=0A=
++              =3D=3D XML_STATUS_OK);=0A=
++=0A=
++  // Resuming the parser from inside a handler must be rejected.=0A=
++  assert_true(XML_ResumeParser(data->parser) =3D=3D XML_STATUS_ERROR);=0A=
++}=0A=
+diff --git a/tests/handlers.h b/tests/handlers.h=0A=
+index de28392..507ad8b 100644=0A=
+--- a/tests/handlers.h=0A=
++++ b/tests/handlers.h=0A=
+@@ -616,6 +616,15 @@ extern void XMLCALL forbidden_calls_character_handler=
(void *userData,=0A=
+                                                       const XML_Char *s,=
=0A=
+                                                       int len);=0A=
+ =0A=
++typedef struct {=0A=
++  XML_Parser parser;=0A=
++  int callCount;=0A=
++} ResumeFromHandlerData;=0A=
++=0A=
++extern void XMLCALL suspend_then_resume_character_handler(void *userData,=
=0A=
++                                                          const XML_Char =
*s,=0A=
++                                                          int len);=0A=
++=0A=
+ #endif /* XML_HANDLERS_H */=0A=
+ =0A=
+ #ifdef __cplusplus=0A=
+diff --git a/tests/misc_tests.c b/tests/misc_tests.c=0A=
+index b9053fe..265e7cb 100644=0A=
+--- a/tests/misc_tests.c=0A=
++++ b/tests/misc_tests.c=0A=
+@@ -815,6 +815,25 @@ START_TEST(test_misc_calls_forbidden_from_handlers) {=
=0A=
+ }=0A=
+ END_TEST=0A=
+ =0A=
++START_TEST(test_misc_resume_parser_forbidden_from_handler) {=0A=
++  const char *const doc =3D "<doc>Hello world!</doc>";=0A=
++=0A=
++  XML_Parser parser =3D XML_ParserCreate(NULL);=0A=
++  ResumeFromHandlerData data =3D {parser, 0};=0A=
++  XML_SetUserData(parser, &data);=0A=
++  XML_SetCharacterDataHandler(parser, suspend_then_resume_character_handl=
er);=0A=
++=0A=
++  // The handler suspends the parser, so the top-level parse reports susp=
ension=0A=
++  // rather than completion.  The handler also asserts that resuming from=
 inside=0A=
++  // itself is rejected.=0A=
++  assert_true(XML_Parse(parser, doc, (int)strlen(doc), /*isFinal=3D*/XML_=
TRUE)=0A=
++              =3D=3D XML_STATUS_SUSPENDED);=0A=
++  assert_true(data.callCount =3D=3D 1);=0A=
++=0A=
++  XML_ParserFree(parser);=0A=
++}=0A=
++END_TEST=0A=
++=0A=
+ void=0A=
+ make_miscellaneous_test_case(Suite *s) {=0A=
+   TCase *tc_misc =3D tcase_create("miscellaneous tests");=0A=
+@@ -847,4 +866,5 @@ make_miscellaneous_test_case(Suite *s) {=0A=
+   tcase_add_test(tc_misc, test_misc_async_entity_rejected);=0A=
+   tcase_add_test(tc_misc, test_misc_no_infinite_loop_issue_1161);=0A=
+   tcase_add_test(tc_misc, test_misc_calls_forbidden_from_handlers);=0A=
++  tcase_add_test(tc_misc, test_misc_resume_parser_forbidden_from_handler)=
;=0A=
+ }=0A=
+-- =0A=
+2.34.1=0A=
+=0A=
diff --git a/meta/recipes-core/expat/expat_2.7.5.bb b/meta/recipes-core/exp=
at/expat_2.7.5.bb=0A=
index 7f00c6f90b..78e35243c5 100644=0A=
--- a/meta/recipes-core/expat/expat_2.7.5.bb=0A=
+++ b/meta/recipes-core/expat/expat_2.7.5.bb=0A=
@@ -68,6 +68,7 @@ SRC_URI =3D "${GITHUB_BASE_URI}/download/R_${VERSION_TAG}=
/expat-${PV}.tar.bz2  \=0A=
            file://CVE-2026-50219-30.patch \=0A=
            file://CVE-2026-50219-31.patch \=0A=
            file://CVE-2026-50219-32.patch \=0A=
+           file://CVE-2026-56131.patch \=0A=
            "=0A=
 =0A=
 GITHUB_BASE_URI =3D "https://github.com/libexpat/libexpat/releases/"=0A=
-- =0A=
2.34.1=0A=
=0A=

