Return-Path: <jakub.szczudlo@nokia.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8395C5DF9B
	for <webhook@archiver.kernel.org>; Mon, 24 Aug 2026 15:20:43 +0000 (UTC)
Received: from GVXPR05CU001.outbound.protection.outlook.com (GVXPR05CU001.outbound.protection.outlook.com [52.101.83.30])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.92.1787584841778568195
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Aug 2026 08:20:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@nokia.com header.s=selector1 header.b=lVBuQ++2;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: nokia.com, ip: 52.101.83.30, mailfrom: jakub.szczudlo@nokia.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UhjEZ7bZLd8ZZjrydLxTMCUf7iFLDYRl0whj1jKdE+5BuWSVDOE8EAnonOarWL+E5AYiq+eym+9o9xLX+jpECBJwDFbQfj67xBip4clqz6v/QCqUVZinFOAtLxiYvdWW4lTzzvtdMRa+tvdde6q3VQnUrJ4Fmg7QCkJD8hu4QMT+vpPwkk1Fw/9YMK/IyD9HWhWEYagrh5HRuLT2p+z76fif8/CFEyiE0c7HLfLYoWkshQa3t82Avth8To+htZ7cIPcpLNpwdoBZ1VKp4CK6NJR6jUxiiVp/cPhDJxtklGrSWy7NRTZ+ktRfDU2c+R/mdwUttI8WMh+VY6Lb97+B+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DZ7+oM0Sr7dXlgBaRRaR2jOqoFn4yH2aI3XAI+upIL4=;
 b=J7LXpZ/CAAB+/lX9zud9aq7IT1F6ZYnEvG5BSuwe9hs8c+1JDwNVJziIz49syRXRFoFv/z6PufGHwlvel4qrpHm26+CMVKMA6Xdq8/hR+//rPLh1dkytDhhbm8SlBChVKE3N5JC7zZIEdvp8n43OEFOPLowlXUBmzOZGwrguzhbp+20p0wsjRDXTh7GI0Gb9FHq94uceIdIIlr9IdDNrnsMBgLW2FBsGf35Dvt594GtfSPP8Re89z9B+FzVgQubp/hmqwShsCflE9AfhzkM43YP6pKaJO3bxo7EaVS6vcrSMZHu1NWOycHL7NBi4VIAjje6gV+YaPx535kOjc0fZ+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nokia.com; dmarc=pass action=none header.from=nokia.com;
 dkim=pass header.d=nokia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nokia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DZ7+oM0Sr7dXlgBaRRaR2jOqoFn4yH2aI3XAI+upIL4=;
 b=lVBuQ++28J7+RwjmQWTdF8/bHdOTWP4SuC+gQxbs74QwXbhId7QNzQT0Sr5YbX92c3PA2hxQeaceaawb3e1tOvEhZiyVY+JtOz2i+UYtPVjgN/zfjZw4e9BdIU2dVhPobFMfjm22zq4qg2VkKDn3zLYHhDQ9dEKO86CtP2zGGWE0A2ylLdemRmIR1v/t49TS46Kb0+VXrgOTSnM232Auj+A1C+2ZpgPcqLpcOGjRfUsQnxiD4Jxy2CQk5g2ApM2RUcKH97LyMRbh4j4Fx2amWwBaEIDKVbMeWu4iadwatDimAnmxHAPHdtptL8IFUeXENf896t063sj9VpgOFcSKxQ==
Received: from GV2PR07MB11919.eurprd07.prod.outlook.com
 (2603:10a6:150:357::20) by DUZPR07MB9935.eurprd07.prod.outlook.com
 (2603:10a6:10:4ae::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.6; Mon, 24 Aug
 2026 15:20:37 +0000
Received: from GV2PR07MB11919.eurprd07.prod.outlook.com
 ([fe80::159a:9a82:1362:e680]) by GV2PR07MB11919.eurprd07.prod.outlook.com
 ([fe80::159a:9a82:1362:e680%3]) with mapi id 15.21.0360.005; Mon, 24 Aug 2026
 15:20:36 +0000
From: "Jakub Szczudlo (Nokia)" <jakub.szczudlo@nokia.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: "yoann.congal@smile.fr" <yoann.congal@smile.fr>, "Jakub Szczudlo (Nokia)"
	<jakub.szczudlo@nokia.com>
Subject: [wrynose][PATCH 2/3] expat: fix CVE-2026-56131
Thread-Topic: [wrynose][PATCH 2/3] expat: fix CVE-2026-56131
Thread-Index: AQHdM9wd/uQf9+gNwEeHqDqyjkjk2g==
Date: Mon, 24 Aug 2026 15:20:36 +0000
Message-ID: <20260824152023.19501-2-jakub.szczudlo@nokia.com>
References: <20260824152023.19501-1-jakub.szczudlo@nokia.com>
In-Reply-To: <20260824152023.19501-1-jakub.szczudlo@nokia.com>
Accept-Language: en-US, en-150
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nokia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV2PR07MB11919:EE_|DUZPR07MB9935:EE_
x-ms-office365-filtering-correlation-id: 9310de8b-e530-4064-bb41-08df01f33fd4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|366016|23010399003|376014|1800799024|38070700021|56012099006|11063799006|10067099003|18002099003|22082099003;
x-microsoft-antispam-message-info: 
 UPcJZ65Z2ntKCCzByB5aFjsxX2eAPUmRs3h1IHBmV8+I/77dtknst9d2l6Gm7i5Zk3RA3wIqK47/EucbB/DwuTR+znXzSuzNw3oTFEUqEongv8LeAuxt9ssCUAsV10AAK+y6wHIbdbMS50eZtJ9cgyMTVGFOB6AGxwyLlCiqInresL6XtTkmjHqZ7Z+xnKABTRc00qtjq+0SymkZ6niV/ewCplCAKihwJqtbFhg8psLPLhxnnQqthiQdR90WFssQnUd/lqY6E+l5muDKc3UAleciRqyy6rYvPz9qu1NgbwcP+8E2D3iu3sr+Fq5+uwmFxqqSujgyxkY2ZYPPO2cev9V+edv9cmT9SsZy3fN/N617KGotC/IWEDFPBRX3wFfS7r8cW75pqv+brHggYEErbRDlPoPfz9QSEe9QNrxeY6OHeMcWC706f6VAuOEOKbDKMoXw98VGV5nZT3N/t+5vUb7y4zqdfsSQdVT+lePp7xzruWw0teSHFiMLJfFPjvq60h504slD1qXzH8/meSe/XTbvuc6tlx0x5ru6hWAHdGv2Bud3p+yb2uWsoaJuvTEa36Vn1t7JGpBvFbhm6yMhIWSnhK1oBWL2V9f+1U9buUQhaY/b6szsTdZb/u90yj69gC0LiVlZ3ZWjLIRW5kv5NJZFIvr8XO0HBXh1gdJ84Ys=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR07MB11919.eurprd07.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(376014)(1800799024)(38070700021)(56012099006)(11063799006)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?337RHDHj1i7nDbXP02CMwYW+/Y6Lg3FYsd4LQFM6hJ1ZJIFvg405jZQDC5?=
 =?iso-8859-1?Q?tVUIDsW7WqAz+rsU8LF6HYhyzoawhoPUziOkxdjyTaE2QoGjkxyC3oyJRC?=
 =?iso-8859-1?Q?3sijm8t8frNiCyHMchZz8KLsdhe2yTNtPQJWlMlgVSJD8xPaYoiLLfq48w?=
 =?iso-8859-1?Q?JC3qTA3nKkoX7CKUWpYIkz3hj29cnfXl24ExxDCGhsljqWQoMjwi20/xAr?=
 =?iso-8859-1?Q?WhVAy/of66tM6N0e/0ja8cv2/eaOOHjERLiZPYAvmUXAwrvPBfhCcP+B+/?=
 =?iso-8859-1?Q?tjGvmuH34F/Lkf2vLDfUX4IuLBLTTuxtwcTz5KUBsYKbEyCMc05/fdoDg6?=
 =?iso-8859-1?Q?CfWO/IwShclrtZ0YR8Kiivl+f7FV7OGs/PcfPOkH5IBDKAhsnZ0UgC8ySz?=
 =?iso-8859-1?Q?vjCW/F4sDwIznVpuNaOzr0Wr9pS7PkNdxTorZYFC5qmAEk3py9qyDvrL+d?=
 =?iso-8859-1?Q?GlSPpW2KBGydkBlVHgms6VI3xMT3yOCMkEKvToLldJ7tDV+JScySoSp4Kt?=
 =?iso-8859-1?Q?Ro/+hVTja25V+juaNsElYFAHdd4k9bPurofVKlom7B0uv+/zE15LXywCm2?=
 =?iso-8859-1?Q?qYYB73J+rpBwvUmy1sJtegjMxeS/SeuZYhC1MbqE6DWNLDpozLYG1Rj/SA?=
 =?iso-8859-1?Q?LyDXd5dS9iAx5+HmhOzAFTsxNc0ZL05d2/fKn/HwExvrlKrnXxl8rm8h7U?=
 =?iso-8859-1?Q?8AjdcNnrYFIkoLfcFKtbjBERutDeqrGUuTz/1ZGTTcO+cCXBIq+5yj8sXc?=
 =?iso-8859-1?Q?ChOURDyKseY6DYSJA6qXkuATlx/GVWcKXqEbN+eC6y0MnlBJI+LFQbFswE?=
 =?iso-8859-1?Q?y0c4WqxK+zKRBIJLul6jl/Xuts3qyHSf9JOjX7Jljupd+0bUpK7N+QZxQh?=
 =?iso-8859-1?Q?hMJ79Ytnyb/GPKxPTNYzXxlYS0eswrprA09T2RCc1vf/sz6uNOYvf/pO/c?=
 =?iso-8859-1?Q?Lri0BafXQ6LbznwEke7abaJwnA8mLYxMVmn1wygL2/3/qBDdg3m3PglcvW?=
 =?iso-8859-1?Q?DJGxHRv67zR5LWbYIIIzoraQNkvtEERRbjpDVjMmUK+++/Nk7c4cS84Hzj?=
 =?iso-8859-1?Q?arjBmE2ABeMXJCXrLIcX3vi2spf6KXlmgdKR4LK31tsDPLofUH3uvpRiax?=
 =?iso-8859-1?Q?gsvD+7KxWgplNX9dPv61QQiUZjx9qVOP6uH1CqSLTpyL6D4tRIFxKUITVE?=
 =?iso-8859-1?Q?dB6i5lO/rJpdvfau3jfUbk+/smJPU8nLlby7i0xEQvponSqDQKY/GxTJuu?=
 =?iso-8859-1?Q?9U/P1Wllhv4kO0iIwpIbWDNtEEWgUeDtYWLaB4oVDyb8jXgoNYyQZMhPwo?=
 =?iso-8859-1?Q?awXPV9/jGgxw00b/p94gyiHts0E1g0hlRHH8zUqF/1arEnWil/8eZSbRQP?=
 =?iso-8859-1?Q?NBSTr29q/xEsZley45CfOoEz7VCOcAsLVGPQHCqtTqA6x+VmQXUvG/GvzE?=
 =?iso-8859-1?Q?A89ar9eyLwRckbnlIuMxMvUPG2nhN9gLl6Pl2+qd0cJOOj4qfTQDCkkr19?=
 =?iso-8859-1?Q?tq1I5C+IAf3L47f7Q11DjYnVSzhGm300X5iip4zAfqlBE79+DgXGDtF7mU?=
 =?iso-8859-1?Q?nxyVhi0bFERKZMYJsTINEg1lCjEgJqtoPGVxOIWg0/xCnn9/v5ZNY0yt9F?=
 =?iso-8859-1?Q?mqj2mlknMWeL8HxniD28iyFmC5IgxJwmhjkcAZAL8UOjeUkKIL4AFHqoj4?=
 =?iso-8859-1?Q?z3b5w8SErSUuM8Rb/xQacMeO6dOWKy5X9srx1AtM44A6w12tLfs/tXorAi?=
 =?iso-8859-1?Q?2/CT/orEK9wFaBdB09LlLRS5b56JOkPsnK/pdd7LKwtv9z?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nokia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV2PR07MB11919.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9310de8b-e530-4064-bb41-08df01f33fd4
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Aug 2026 15:20:36.9460
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5d471751-9675-428d-917b-70f44f9630b0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UBAVSBuX2AhdcnB94rA3fycmuLk+tR3O0OlShZqwuTeCbaCv83grI4JxB0aq/e/uN2pDTKSlPOBvZSfbeZMzJkbT04sCLkbIMuOkt/wKbiI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DUZPR07MB9935
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 24 Aug 2026 15:20:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244131

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

