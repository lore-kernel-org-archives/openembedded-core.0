Return-Path: <jakub.szczudlo@nokia.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3CE0C5DF94
	for <webhook@archiver.kernel.org>; Mon, 24 Aug 2026 15:20:43 +0000 (UTC)
Received: from MRWPR03CU001.outbound.protection.outlook.com (MRWPR03CU001.outbound.protection.outlook.com [40.107.130.69])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.68.1787584836945385871
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Aug 2026 08:20:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@nokia.com header.s=selector1 header.b=AFeBsIat;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: nokia.com, ip: 40.107.130.69, mailfrom: jakub.szczudlo@nokia.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UdNmvmcvzsaiqKup8oqnEBLD00qIO2LTqG97zKy1EgwNg02d/fgc3EXLecOnc6PMvlIXXQonloPTOA/akIF+/VYhHFUisPysIX3O1HJpOB8r3XdiJyptl0PxKv87v8nUsIsrCGrSrjYqiKfaxNupwpa359PBfDp4F7kiH8djlyI5gX0C81m/7FdMQdXWm0wNFSFBP2cqn2BupVGVyN9zU9tVnWgTTUGd3jpWkpFWstnFiUrGZJNJnQaLw8WpWS7zIgrbqDMQkJThzNLssur8mQlD7A15lpJwMK5GR99CGOq1+0Cv+r4f+WeZfPErR3LPncOpfejunpTkvyw6KMHEsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S+m6X3RVa95/Ds19dMDuqXyDNG14qOzesRCl/MGcYQU=;
 b=QVTe2mU761ksZbkY6S/7v7HKKkJS/0CKwhdoWg0ZVXNoXmIAoYjIk3pcFOAvHfGjgyw1vOt3cyPHI3L20Krzil3Meqg/Tc7f0A/Ee9NYcJcDBNDFUcmC5jwU/whi8LfMvlNcJEOOUyoUYvq3WPR/dhmslNLMfI1zaifH7EAOEiX1MdS5EgqeA5MdZTzu8CPfVnmZEJlGY+jZBhsfeVyUZGKAxhQuXM49VPBHOio/x3KCwVOoeMwE4gPe8xkioYXL1wZhkq0lfaOxBdZ3975bynz2XOJcKjChI2PduVfmGKXLI+MTijO6m3HvCKUZDrZd1X2sM4a4VdhbuA5SqCwyFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nokia.com; dmarc=pass action=none header.from=nokia.com;
 dkim=pass header.d=nokia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nokia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S+m6X3RVa95/Ds19dMDuqXyDNG14qOzesRCl/MGcYQU=;
 b=AFeBsIatmoi1rdirBSAC31/I+92Gme20IsnH3Wt1K/g4MP1NrFN3i8iqhwWBrEdOw2i5jpYadbr1Dt/4oDec4xv6DzWy1tBgKzHNGvLOCM7CGn/SetVKvYMjdTX8cgI8NNutM26VNxkie/jaH7Hx9GKx1E8lhePxtJXcv8CDCpJPyxYJJfl3gxnIUKUXwGzU/LwEMuwZc1RycRjL9L1tJfzxMv7RnEV8cOPREU9NermYUOoQgKUjm9nndZcSCb4Is8/0TF7s/Gcx4nN7iDtrAwrskdL0tDY8TyyDrTow0CYoibmMZHoOXAluPELqFzCb2jw9cW+X69ByIxZdXUuQFg==
Received: from GV2PR07MB11919.eurprd07.prod.outlook.com
 (2603:10a6:150:357::20) by DUZPR07MB9935.eurprd07.prod.outlook.com
 (2603:10a6:10:4ae::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.6; Mon, 24 Aug
 2026 15:20:31 +0000
Received: from GV2PR07MB11919.eurprd07.prod.outlook.com
 ([fe80::159a:9a82:1362:e680]) by GV2PR07MB11919.eurprd07.prod.outlook.com
 ([fe80::159a:9a82:1362:e680%3]) with mapi id 15.21.0360.005; Mon, 24 Aug 2026
 15:20:31 +0000
From: "Jakub Szczudlo (Nokia)" <jakub.szczudlo@nokia.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: "yoann.congal@smile.fr" <yoann.congal@smile.fr>, "Jakub Szczudlo (Nokia)"
	<jakub.szczudlo@nokia.com>
Subject: [wrynose][PATCH 1/3] expat: fix CVE-2026-50219
Thread-Topic: [wrynose][PATCH 1/3] expat: fix CVE-2026-50219
Thread-Index: AQHdM9wasgM8lRQayEO+yrXfZ8u0UA==
Date: Mon, 24 Aug 2026 15:20:31 +0000
Message-ID: <20260824152023.19501-1-jakub.szczudlo@nokia.com>
Accept-Language: en-US, en-150
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nokia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV2PR07MB11919:EE_|DUZPR07MB9935:EE_
x-ms-office365-filtering-correlation-id: 2e346509-b292-475c-69bb-08df01f33cca
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|366016|23010399003|376014|1800799024|38070700021|6133799003|56012099006|11063799006|10067099003|3023799007|18002099003;
x-microsoft-antispam-message-info: 
 un+FkloRxPLIyra+QG6yZOeaa/6yTR6kRpDmWtdqHMqabHzw7Za/heYJGpDtM4aqfDPLj6Y99TEPsxUDUnmqS8fEQBt0CCrGPFgVqrJU/CT1Lss81V2tEwZnV/ptet4JrBuJ9Z8J5F8xRuRj10+NVsAoK6j0lmCv9vG9khsOrCSXcxh+kOJJVjAtdObajV9W496lbrwSKeLqEoiRZrALezxDRfcJNONbEzwi1WGLSlbpm0UO1ujL2ur8Bpd9vFPcwFFsQ1UbfGLvF1AoAR/ChEbNQZASosuk8YGE+G4YlE5LwcGWVrtWv/narNPXUtkMuYawjAm0qwPKh+H09+BghegmEpVX9X3ReiyvVagmBHZkJ9gldh5cTWD7bbdFoI+HufNvuPxgH44L67yZ1m6LCVdJ73dUNWB/sgMmdS+gEC+wKzTXxGjMNARWbZA69lJ+Eeq+f5IdH1XMcVzv9Eph3C7qqsR+mzWZ3DzBrEdTWRaF6sxpIM3dtPhORWpQnMMafggpfsBDyk/ESxFPbQxKHlULMLnDikt/aivX6ZGsULTie4qVQuN1Wgna2mZq9mD1A7fQ3RLylPw3qnhZah9T86YJI6Z9qz13GtJPospYjDbYmTGsl/wdgIfSkjzkkFZ88wBzi03RDZE6qYOVU4c33qlpl7fM0N7/+BtgY/0yKt4=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR07MB11919.eurprd07.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(376014)(1800799024)(38070700021)(6133799003)(56012099006)(11063799006)(10067099003)(3023799007)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?r0U0yic2W8fP077Dd9Ga+slxHuR/5jNRNZn1GR9aCFrM3CNgC8w5c1AaQl?=
 =?iso-8859-1?Q?bqccsWnysWNy1lm3tvH0LOAirkSptgV4DV6n0iMWpiF7sJwiFjWX6ZTGFO?=
 =?iso-8859-1?Q?RteotlXlTHosL7oRk63uWcMBsz4R/gnqDPZI2aIRfdXSsTc0MTcqiLCdrQ?=
 =?iso-8859-1?Q?TUuxDdkNwYqM5gkIkl6+E2wZ0NprOhcRrXKi/4RdFt+9o9vwBQ67kPNy90?=
 =?iso-8859-1?Q?4hDyaoPgNAq1QFZonU6pB2YVSFtVwmBEK6rF28rgkYa2whLEwwwpUuIH8g?=
 =?iso-8859-1?Q?FdvjB8e6BBKR9TOO0QJXuG8pd/TcKs0+GQ5vMFBuZKoYKh2lHkAESK3A8C?=
 =?iso-8859-1?Q?WUjOguC4+Fhxe0QpQ2v5H55ubyAu3h3QJviUz91RduICdSR56SDt+aCSdm?=
 =?iso-8859-1?Q?tp8F1Uw9Ygd5pSyaWvdpJChR1KvYLDywm5uhBwCosI56Fd8WxheO3a1kB6?=
 =?iso-8859-1?Q?oPO8Y0cglBvQKATozm1IxB9hmzdzA11i52oHPPauwmB8spHxg3AU1eCBzB?=
 =?iso-8859-1?Q?ANekQlt30qH12C0iYymBKQ1Sb/k/YK0Jk+QBN3O+zok92DS1AhBRfJzEa+?=
 =?iso-8859-1?Q?DT3HmibwM/RtScJ6p39mLuJTOwPpv0fqLE26x4ziLiFsOg2vNBgdoY0z9Q?=
 =?iso-8859-1?Q?qiUAalWWGSzxS6GLzbA6iMFp4uLHBh49dT3qnYI+bWTB49gpcZcMMbO1BJ?=
 =?iso-8859-1?Q?X4+8Ouwl8zBgkm9EjT4m1BugLf1HYKiZ6stQa1TLKAqWC5kQ4qnBSjxqY8?=
 =?iso-8859-1?Q?IxJxwA3w4DR5/aFtzxw95l2KbAJEsFudaxiH5bt98LDjJ4RFW3IREVg5kT?=
 =?iso-8859-1?Q?cbHOKRns9iR/Lfnh91+r4vcDf7jiY+O0oMMCehepvwyDARGXOyh2awzwGr?=
 =?iso-8859-1?Q?Hw42isIAehsBc6x0JHtARQrzoZ0SmKNBqFM8v9fwqxYAfNBhJdx9jCNgsK?=
 =?iso-8859-1?Q?O0kguGWpDe+WZW6PDqvql0mJ6aMfrqRj8OdWzU56HiOaLKe7PaNrPi/zru?=
 =?iso-8859-1?Q?rbv+nbOpRtDq7nAi1PH3m6j1sG7oyWBeyfceZqcKs4xUYJGyL5r8D3xj2X?=
 =?iso-8859-1?Q?qYa1yb2RYbp2+nvq4r8m7VquFIkhlFUCRL7uTYiI9wedoNRtp4FhCj6ehg?=
 =?iso-8859-1?Q?sAfzZAaNbvXpaSRJziNZQft8r87AxE6mZrQQZO507tJBh1HoLW4KNbv5dF?=
 =?iso-8859-1?Q?7MLF7nwWnOOXb+Mk2LoNENMzTiXCyipvv4DpIurJI27b/aahWNkT6F5owT?=
 =?iso-8859-1?Q?HfauGnoZNMjg3V2/oiXDecMeWErQKMmO9+WtljeviJjIqM58ID7SJBLo9q?=
 =?iso-8859-1?Q?RskHVPlTk68cdsq6P/bVOhJjZwNSy2Pc4wJFASIO6Hw8auJXeFfKh/vSuW?=
 =?iso-8859-1?Q?AQho6Tv0FI1PWwPQ6894Mwn8oT3Q8QlB8RlS5Wju9fsmhWyz3MS6mTDIZ5?=
 =?iso-8859-1?Q?KBSLM11hyUQFIRpuQUYcrRVeKqqbcEiEt6ZiCVJfyK4dpWgSvZPZs6uzYP?=
 =?iso-8859-1?Q?ejhqe8PEgBFUpXOC/nTrd/OJyLM2me5VnDLZU6/pKugREVNv2iPedakfL2?=
 =?iso-8859-1?Q?0dseRJMCub8olQJ0r65CUSQhzuGi9PXAkPJyVpVWgvHow/nHdjrZl6sTN/?=
 =?iso-8859-1?Q?FgfOWv8mXWnHVBYffuNTcs400a7yUVd3j5vR/4lKGH8yrIWPdW68V9EOWm?=
 =?iso-8859-1?Q?DWR8DP6DLrsqpoLluj5feU8Urt223q9OKeOgYL1xaNXys7uHY4sti18Dti?=
 =?iso-8859-1?Q?zta3oJt/LlVJFTtGr1mxsKxVNQwcrKqE9yRzusjhu8b0DP15LLHp8uF3Nr?=
 =?iso-8859-1?Q?nBjGwNbc2w=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nokia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV2PR07MB11919.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e346509-b292-475c-69bb-08df01f33cca
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Aug 2026 15:20:31.8328
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5d471751-9675-428d-917b-70f44f9630b0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6NkpQGtdpL2Xy2lUKUv0hO/oBPZ/o1Q8p2XE5Mk7kDBdnYJz67SFvrcE9P/LTXLu+CTQ++lUM1j3fobI0sIQikfBspVh5pnmF/H28Y0NT8g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DUZPR07MB9935
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 24 Aug 2026 15:20:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244130

Expat does not track whether its public parser APIs are called from inside=
=0A=
a user handler. Re-entering the parser through XML_GetBuffer(),=0A=
XML_Parse(), XML_ParseBuffer(), XML_ParserFree() or XML_ParserReset() can=
=0A=
therefore result in use-after-free and memory corruption.=0A=
The 32 upstream commits are divided as follows:=0A=
* 01 introduces the handler call depth counter and the helper functions=0A=
  used to enter, leave and detect handler execution.=0A=
* 02-04 are preparation patches. They extract handler calls from compound=
=0A=
  expressions so that depth tracking can be placed before and after each=0A=
  invocation without changing handler return-value semantics.=0A=
* 05-26 instrument the individual handler types. Each patch covers a=0A=
  distinct callback path; omitting one would leave a route around the=0A=
  API guards.=0A=
* 27-31 add the actual policy enforcement to XML_GetBuffer(), XML_Parse(),=
=0A=
  XML_ParseBuffer(), XML_ParserFree() and XML_ParserReset().=0A=
* 32 adds regression coverage for all five rejected calls.=0A=
Documentation and Changes-file commits from the upstream=0A=
series are dropped because they do not affect the fix or its test=0A=
coverage.=0A=
An explicit XML_Parser cast is added to the regression-test handler=0A=
because handlers.c is also included by handlers_cxx.cpp and compiled as=0A=
C++ in the OE build.=0A=
Upstream pull request:=0A=
https://github.com/libexpat/libexpat/pull/1246=0A=
=0A=
Signed-off-by: Jakub Szczudlo <jakub.szczudlo@nokia.com>=0A=
---=0A=
 .../expat/expat/CVE-2026-50219-01.patch       |  61 +++++++=0A=
 .../expat/expat/CVE-2026-50219-02.patch       |  84 ++++++++++=0A=
 .../expat/expat/CVE-2026-50219-03.patch       |  92 +++++++++++=0A=
 .../expat/expat/CVE-2026-50219-04.patch       |  34 ++++=0A=
 .../expat/expat/CVE-2026-50219-05.patch       |  48 ++++++=0A=
 .../expat/expat/CVE-2026-50219-06.patch       | 154 ++++++++++++++++++=0A=
 .../expat/expat/CVE-2026-50219-07.patch       |  32 ++++=0A=
 .../expat/expat/CVE-2026-50219-08.patch       |  44 +++++=0A=
 .../expat/expat/CVE-2026-50219-09.patch       |  44 +++++=0A=
 .../expat/expat/CVE-2026-50219-10.patch       |  35 ++++=0A=
 .../expat/expat/CVE-2026-50219-11.patch       |  32 ++++=0A=
 .../expat/expat/CVE-2026-50219-12.patch       |  42 +++++=0A=
 .../expat/expat/CVE-2026-50219-13.patch       |  49 ++++++=0A=
 .../expat/expat/CVE-2026-50219-14.patch       |  74 +++++++++=0A=
 .../expat/expat/CVE-2026-50219-15.patch       |  82 ++++++++++=0A=
 .../expat/expat/CVE-2026-50219-16.patch       |  46 ++++++=0A=
 .../expat/expat/CVE-2026-50219-17.patch       |  64 ++++++++=0A=
 .../expat/expat/CVE-2026-50219-18.patch       |  32 ++++=0A=
 .../expat/expat/CVE-2026-50219-19.patch       |  87 ++++++++++=0A=
 .../expat/expat/CVE-2026-50219-20.patch       |  62 +++++++=0A=
 .../expat/expat/CVE-2026-50219-21.patch       |  46 ++++++=0A=
 .../expat/expat/CVE-2026-50219-22.patch       |  48 ++++++=0A=
 .../expat/expat/CVE-2026-50219-23.patch       |  36 ++++=0A=
 .../expat/expat/CVE-2026-50219-24.patch       |  33 ++++=0A=
 .../expat/expat/CVE-2026-50219-25.patch       |  35 ++++=0A=
 .../expat/expat/CVE-2026-50219-26.patch       |  33 ++++=0A=
 .../expat/expat/CVE-2026-50219-27.patch       |  30 ++++=0A=
 .../expat/expat/CVE-2026-50219-28.patch       |  30 ++++=0A=
 .../expat/expat/CVE-2026-50219-29.patch       |  31 ++++=0A=
 .../expat/expat/CVE-2026-50219-30.patch       |  31 ++++=0A=
 .../expat/expat/CVE-2026-50219-31.patch       |  31 ++++=0A=
 .../expat/expat/CVE-2026-50219-32.patch       | 100 ++++++++++++=0A=
 meta/recipes-core/expat/expat_2.7.5.bb        |  32 ++++=0A=
 33 files changed, 1714 insertions(+)=0A=
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-50219-01.patch=
=0A=
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-50219-02.patch=
=0A=
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-50219-03.patch=
=0A=
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-50219-04.patch=
=0A=
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-50219-05.patch=
=0A=
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-50219-06.patch=
=0A=
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-50219-07.patch=
=0A=
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-50219-08.patch=
=0A=
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-50219-09.patch=
=0A=
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-50219-10.patch=
=0A=
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-50219-11.patch=
=0A=
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-50219-12.patch=
=0A=
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-50219-13.patch=
=0A=
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-50219-14.patch=
=0A=
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-50219-15.patch=
=0A=
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-50219-16.patch=
=0A=
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-50219-17.patch=
=0A=
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-50219-18.patch=
=0A=
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-50219-19.patch=
=0A=
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-50219-20.patch=
=0A=
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-50219-21.patch=
=0A=
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-50219-22.patch=
=0A=
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-50219-23.patch=
=0A=
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-50219-24.patch=
=0A=
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-50219-25.patch=
=0A=
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-50219-26.patch=
=0A=
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-50219-27.patch=
=0A=
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-50219-28.patch=
=0A=
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-50219-29.patch=
=0A=
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-50219-30.patch=
=0A=
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-50219-31.patch=
=0A=
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-50219-32.patch=
=0A=
=0A=
diff --git a/meta/recipes-core/expat/expat/CVE-2026-50219-01.patch b/meta/r=
ecipes-core/expat/expat/CVE-2026-50219-01.patch=0A=
new file mode 100644=0A=
index 0000000000..1d3a8cbba2=0A=
--- /dev/null=0A=
+++ b/meta/recipes-core/expat/expat/CVE-2026-50219-01.patch=0A=
@@ -0,0 +1,61 @@=0A=
+From 8da7b772a31155083a37796f96e622f6dce25454 Mon Sep 17 00:00:00 2001=0A=
+From: Sebastian Pipping <sebastian@pipping.org>=0A=
+Date: Tue, 26 May 2026 15:15:10 +0200=0A=
+Subject: [PATCH] lib: Introduce handler call depth tracking=0A=
+=0A=
+(cherry picked from commit f69d0719bf01596f1d95c9e902f4a279e62c6305)=0A=
+=0A=
+CVE: CVE-2026-50219=0A=
+Upstream-Status: Backport [https://github.com/libexpat/libexpat/pull/1246/=
commits/f69d0719bf01596f1d95c9e902f4a279e62c6305]=0A=
+Signed-off-by: Jakub Szczudlo <jakub.szczudlo@nokia.com>=0A=
+---=0A=
+ lib/xmlparse.c | 19 +++++++++++++++++++=0A=
+ 1 file changed, 19 insertions(+)=0A=
+=0A=
+diff --git a/lib/xmlparse.c b/lib/xmlparse.c=0A=
+index 2a5ebb7..38617a6 100644=0A=
+--- a/lib/xmlparse.c=0A=
++++ b/lib/xmlparse.c=0A=
+@@ -793,6 +793,7 @@ struct XML_ParserStruct {=0A=
+   ENTITY_STATS m_entity_stats;=0A=
+ #endif=0A=
+   XML_Bool m_reenter;=0A=
++  unsigned m_handlerCallDepth;=0A=
+ };=0A=
+ =0A=
+ #if XML_GE =3D=3D 1=0A=
+@@ -1260,6 +1261,23 @@ generate_hash_secret_salt(void) {=0A=
+ #endif=0A=
+ }=0A=
+ =0A=
++static void=0A=
++beforeHandler(XML_Parser parser) {=0A=
++  assert(parser->m_handlerCallDepth < UINT_MAX);=0A=
++  parser->m_handlerCallDepth++;=0A=
++}=0A=
++=0A=
++static void=0A=
++afterHandler(XML_Parser parser) {=0A=
++  assert(parser->m_handlerCallDepth > 0);=0A=
++  parser->m_handlerCallDepth--;=0A=
++}=0A=
++=0A=
++static bool=0A=
++isCalledFromInsideHandler(XML_Parser parser) {=0A=
++  return parser->m_handlerCallDepth > 0;=0A=
++}=0A=
++=0A=
+ static enum XML_Error=0A=
+ callProcessor(XML_Parser parser, const char *start, const char *end,=0A=
+               const char **endPtr) {=0A=
+@@ -1614,6 +1632,7 @@ parserInit(XML_Parser parser, const XML_Char *encodi=
ngName) {=0A=
+   parser->m_parsingStatus.parsing =3D XML_INITIALIZED;=0A=
+   // Reentry can only be triggered inside m_processor calls=0A=
+   parser->m_reenter =3D XML_FALSE;=0A=
++  parser->m_handlerCallDepth =3D 0;=0A=
+ #ifdef XML_DTD=0A=
+   parser->m_isParamEntity =3D XML_FALSE;=0A=
+   parser->m_useForeignDTD =3D XML_FALSE;=0A=
+-- =0A=
+2.34.1=0A=
+=0A=
diff --git a/meta/recipes-core/expat/expat/CVE-2026-50219-02.patch b/meta/r=
ecipes-core/expat/expat/CVE-2026-50219-02.patch=0A=
new file mode 100644=0A=
index 0000000000..bb9335381a=0A=
--- /dev/null=0A=
+++ b/meta/recipes-core/expat/expat/CVE-2026-50219-02.patch=0A=
@@ -0,0 +1,84 @@=0A=
+From 3832d4080d50d5aeeeaae32688ba3bf4af2042a2 Mon Sep 17 00:00:00 2001=0A=
+From: Sebastian Pipping <sebastian@pipping.org>=0A=
+Date: Tue, 26 May 2026 21:33:26 +0200=0A=
+Subject: [PATCH] lib: Prepare `m_notStandaloneHandler` calls for upcoming=
=0A=
+ wrapping=0A=
+=0A=
+(cherry picked from commit cdd21e84e150cc2ca961533e157bd52e3cbb4aa4)=0A=
+=0A=
+CVE: CVE-2026-50219=0A=
+Upstream-Status: Backport [https://github.com/libexpat/libexpat/pull/1246/=
commits/cdd21e84e150cc2ca961533e157bd52e3cbb4aa4]=0A=
+Signed-off-by: Jakub Szczudlo <jakub.szczudlo@nokia.com>=0A=
+---=0A=
+ lib/xmlparse.c | 34 ++++++++++++++++++++++------------=0A=
+ 1 file changed, 22 insertions(+), 12 deletions(-)=0A=
+=0A=
+diff --git a/lib/xmlparse.c b/lib/xmlparse.c=0A=
+index 38617a6..65df026 100644=0A=
+--- a/lib/xmlparse.c=0A=
++++ b/lib/xmlparse.c=0A=
+@@ -5537,9 +5537,12 @@ doProlog(XML_Parser parser, const ENCODING *enc, co=
nst char *s, const char *end,=0A=
+                   entity->systemId, entity->publicId))=0A=
+             return XML_ERROR_EXTERNAL_ENTITY_HANDLING;=0A=
+           if (dtd->paramEntityRead) {=0A=
+-            if (! dtd->standalone && parser->m_notStandaloneHandler=0A=
+-                && ! parser->m_notStandaloneHandler(parser->m_handlerArg)=
)=0A=
+-              return XML_ERROR_NOT_STANDALONE;=0A=
++            if (! dtd->standalone && parser->m_notStandaloneHandler) {=0A=
++              const int handlerStatus=0A=
++                  =3D parser->m_notStandaloneHandler(parser->m_handlerArg=
);=0A=
++              if (! handlerStatus)=0A=
++                return XML_ERROR_NOT_STANDALONE;=0A=
++            }=0A=
+           }=0A=
+           /* if we didn't read the foreign DTD then this means that there=
=0A=
+              is no external subset and we must reset dtd->hasParamEntityR=
efs=0A=
+@@ -5577,9 +5580,12 @@ doProlog(XML_Parser parser, const ENCODING *enc, co=
nst char *s, const char *end,=0A=
+                   entity->systemId, entity->publicId))=0A=
+             return XML_ERROR_EXTERNAL_ENTITY_HANDLING;=0A=
+           if (dtd->paramEntityRead) {=0A=
+-            if (! dtd->standalone && parser->m_notStandaloneHandler=0A=
+-                && ! parser->m_notStandaloneHandler(parser->m_handlerArg)=
)=0A=
+-              return XML_ERROR_NOT_STANDALONE;=0A=
++            if (! dtd->standalone && parser->m_notStandaloneHandler) {=0A=
++              const int handlerStatus=0A=
++                  =3D parser->m_notStandaloneHandler(parser->m_handlerArg=
);=0A=
++              if (! handlerStatus)=0A=
++                return XML_ERROR_NOT_STANDALONE;=0A=
++            }=0A=
+           }=0A=
+           /* if we didn't read the foreign DTD then this means that there=
=0A=
+              is no external subset and we must reset dtd->hasParamEntityR=
efs=0A=
+@@ -5793,9 +5799,11 @@ doProlog(XML_Parser parser, const ENCODING *enc, co=
nst char *s, const char *end,=0A=
+ #ifdef XML_DTD=0A=
+           && ! parser->m_paramEntityParsing=0A=
+ #endif /* XML_DTD */=0A=
+-          && parser->m_notStandaloneHandler=0A=
+-          && ! parser->m_notStandaloneHandler(parser->m_handlerArg))=0A=
+-        return XML_ERROR_NOT_STANDALONE;=0A=
++          && parser->m_notStandaloneHandler) {=0A=
++        const int status =3D parser->m_notStandaloneHandler(parser->m_han=
dlerArg);=0A=
++        if (! status)=0A=
++          return XML_ERROR_NOT_STANDALONE;=0A=
++      }=0A=
+ #ifndef XML_DTD=0A=
+       break;=0A=
+ #else  /* XML_DTD */=0A=
+@@ -6179,9 +6187,11 @@ doProlog(XML_Parser parser, const ENCODING *enc, co=
nst char *s, const char *end,=0A=
+         }=0A=
+       }=0A=
+ #endif /* XML_DTD */=0A=
+-      if (! dtd->standalone && parser->m_notStandaloneHandler=0A=
+-          && ! parser->m_notStandaloneHandler(parser->m_handlerArg))=0A=
+-        return XML_ERROR_NOT_STANDALONE;=0A=
++      if (! dtd->standalone && parser->m_notStandaloneHandler) {=0A=
++        const int status =3D parser->m_notStandaloneHandler(parser->m_han=
dlerArg);=0A=
++        if (! status)=0A=
++          return XML_ERROR_NOT_STANDALONE;=0A=
++      }=0A=
+       break;=0A=
+ =0A=
+       /* Element declaration stuff */=0A=
+-- =0A=
+2.34.1=0A=
+=0A=
diff --git a/meta/recipes-core/expat/expat/CVE-2026-50219-03.patch b/meta/r=
ecipes-core/expat/expat/CVE-2026-50219-03.patch=0A=
new file mode 100644=0A=
index 0000000000..dca99968ae=0A=
--- /dev/null=0A=
+++ b/meta/recipes-core/expat/expat/CVE-2026-50219-03.patch=0A=
@@ -0,0 +1,92 @@=0A=
+From 3fd5635fac887f161ab02adf749c2bab1d2ee904 Mon Sep 17 00:00:00 2001=0A=
+From: Sebastian Pipping <sebastian@pipping.org>=0A=
+Date: Sat, 30 May 2026 00:45:34 +0200=0A=
+Subject: [PATCH] lib: Prepare `m_externalEntityRefHandler` calls for upcom=
ing=0A=
+ wrapping=0A=
+=0A=
+(cherry picked from commit 1ffe852fe1d8e1d73eb4eb5798456aefc8300299)=0A=
+=0A=
+CVE: CVE-2026-50219=0A=
+Upstream-Status: Backport [https://github.com/libexpat/libexpat/pull/1246/=
commits/1ffe852fe1d8e1d73eb4eb5798456aefc8300299]=0A=
+Signed-off-by: Jakub Szczudlo <jakub.szczudlo@nokia.com>=0A=
+---=0A=
+ lib/xmlparse.c | 35 ++++++++++++++++++++---------------=0A=
+ 1 file changed, 20 insertions(+), 15 deletions(-)=0A=
+=0A=
+diff --git a/lib/xmlparse.c b/lib/xmlparse.c=0A=
+index 65df026..eb8e803 100644=0A=
+--- a/lib/xmlparse.c=0A=
++++ b/lib/xmlparse.c=0A=
+@@ -3533,9 +3533,10 @@ doContent(XML_Parser parser, int startTagLevel, con=
st ENCODING *enc,=0A=
+         entity->open =3D XML_FALSE;=0A=
+         if (! context)=0A=
+           return XML_ERROR_NO_MEMORY;=0A=
+-        if (! parser->m_externalEntityRefHandler(=0A=
+-                parser->m_externalEntityRefHandlerArg, context, entity->b=
ase,=0A=
+-                entity->systemId, entity->publicId))=0A=
++        const int status =3D parser->m_externalEntityRefHandler(=0A=
++            parser->m_externalEntityRefHandlerArg, context, entity->base,=
=0A=
++            entity->systemId, entity->publicId);=0A=
++        if (! status)=0A=
+           return XML_ERROR_EXTERNAL_ENTITY_HANDLING;=0A=
+         poolDiscard(&parser->m_tempPool);=0A=
+       } else if (parser->m_defaultHandler)=0A=
+@@ -5532,9 +5533,10 @@ doProlog(XML_Parser parser, const ENCODING *enc, co=
nst char *s, const char *end,=0A=
+           if (parser->m_useForeignDTD)=0A=
+             entity->base =3D parser->m_curBase;=0A=
+           dtd->paramEntityRead =3D XML_FALSE;=0A=
+-          if (! parser->m_externalEntityRefHandler(=0A=
+-                  parser->m_externalEntityRefHandlerArg, 0, entity->base,=
=0A=
+-                  entity->systemId, entity->publicId))=0A=
++          const int status =3D parser->m_externalEntityRefHandler(=0A=
++              parser->m_externalEntityRefHandlerArg, 0, entity->base,=0A=
++              entity->systemId, entity->publicId);=0A=
++          if (! status)=0A=
+             return XML_ERROR_EXTERNAL_ENTITY_HANDLING;=0A=
+           if (dtd->paramEntityRead) {=0A=
+             if (! dtd->standalone && parser->m_notStandaloneHandler) {=0A=
+@@ -5575,9 +5577,10 @@ doProlog(XML_Parser parser, const ENCODING *enc, co=
nst char *s, const char *end,=0A=
+             return XML_ERROR_NO_MEMORY;=0A=
+           entity->base =3D parser->m_curBase;=0A=
+           dtd->paramEntityRead =3D XML_FALSE;=0A=
+-          if (! parser->m_externalEntityRefHandler(=0A=
+-                  parser->m_externalEntityRefHandlerArg, 0, entity->base,=
=0A=
+-                  entity->systemId, entity->publicId))=0A=
++          const int status =3D parser->m_externalEntityRefHandler(=0A=
++              parser->m_externalEntityRefHandlerArg, 0, entity->base,=0A=
++              entity->systemId, entity->publicId);=0A=
++          if (! status)=0A=
+             return XML_ERROR_EXTERNAL_ENTITY_HANDLING;=0A=
+           if (dtd->paramEntityRead) {=0A=
+             if (! dtd->standalone && parser->m_notStandaloneHandler) {=0A=
+@@ -6167,9 +6170,10 @@ doProlog(XML_Parser parser, const ENCODING *enc, co=
nst char *s, const char *end,=0A=
+           dtd->paramEntityRead =3D XML_FALSE;=0A=
+           entity->open =3D XML_TRUE;=0A=
+           entityTrackingOnOpen(parser, entity, __LINE__);=0A=
+-          if (! parser->m_externalEntityRefHandler(=0A=
+-                  parser->m_externalEntityRefHandlerArg, 0, entity->base,=
=0A=
+-                  entity->systemId, entity->publicId)) {=0A=
++          const int status =3D parser->m_externalEntityRefHandler(=0A=
++              parser->m_externalEntityRefHandlerArg, 0, entity->base,=0A=
++              entity->systemId, entity->publicId);=0A=
++          if (! status) {=0A=
+             entityTrackingOnClose(parser, entity, __LINE__);=0A=
+             entity->open =3D XML_FALSE;=0A=
+             return XML_ERROR_EXTERNAL_ENTITY_HANDLING;=0A=
+@@ -6959,9 +6963,10 @@ storeEntityValue(XML_Parser parser, const ENCODING =
*enc,=0A=
+             dtd->paramEntityRead =3D XML_FALSE;=0A=
+             entity->open =3D XML_TRUE;=0A=
+             entityTrackingOnOpen(parser, entity, __LINE__);=0A=
+-            if (! parser->m_externalEntityRefHandler(=0A=
+-                    parser->m_externalEntityRefHandlerArg, 0, entity->bas=
e,=0A=
+-                    entity->systemId, entity->publicId)) {=0A=
++            const int status =3D parser->m_externalEntityRefHandler(=0A=
++                parser->m_externalEntityRefHandlerArg, 0, entity->base,=
=0A=
++                entity->systemId, entity->publicId);=0A=
++            if (! status) {=0A=
+               entityTrackingOnClose(parser, entity, __LINE__);=0A=
+               entity->open =3D XML_FALSE;=0A=
+               result =3D XML_ERROR_EXTERNAL_ENTITY_HANDLING;=0A=
+-- =0A=
+2.34.1=0A=
+=0A=
diff --git a/meta/recipes-core/expat/expat/CVE-2026-50219-04.patch b/meta/r=
ecipes-core/expat/expat/CVE-2026-50219-04.patch=0A=
new file mode 100644=0A=
index 0000000000..3f4070e6e6=0A=
--- /dev/null=0A=
+++ b/meta/recipes-core/expat/expat/CVE-2026-50219-04.patch=0A=
@@ -0,0 +1,34 @@=0A=
+From 9a13084051f0dbff8f980db7aca46b02111cb6d5 Mon Sep 17 00:00:00 2001=0A=
+From: Sebastian Pipping <sebastian@pipping.org>=0A=
+Date: Sat, 30 May 2026 00:46:36 +0200=0A=
+Subject: [PATCH] lib: Prepare `m_unknownEncodingHandler` calls for upcomin=
g=0A=
+ wrapping=0A=
+=0A=
+(cherry picked from commit adcafd4316259ef48b1763e584733a7bff4a8db0)=0A=
+=0A=
+CVE: CVE-2026-50219=0A=
+Upstream-Status: Backport [https://github.com/libexpat/libexpat/pull/1246/=
commits/adcafd4316259ef48b1763e584733a7bff4a8db0]=0A=
+Signed-off-by: Jakub Szczudlo <jakub.szczudlo@nokia.com>=0A=
+---=0A=
+ lib/xmlparse.c | 5 +++--=0A=
+ 1 file changed, 3 insertions(+), 2 deletions(-)=0A=
+=0A=
+diff --git a/lib/xmlparse.c b/lib/xmlparse.c=0A=
+index eb8e803..dddcb47 100644=0A=
+--- a/lib/xmlparse.c=0A=
++++ b/lib/xmlparse.c=0A=
+@@ -5057,8 +5057,9 @@ handleUnknownEncoding(XML_Parser parser, const XML_C=
har *encodingName) {=0A=
+     info.convert =3D NULL;=0A=
+     info.data =3D NULL;=0A=
+     info.release =3D NULL;=0A=
+-    if (parser->m_unknownEncodingHandler(parser->m_unknownEncodingHandler=
Data,=0A=
+-                                         encodingName, &info)) {=0A=
++    const int status =3D parser->m_unknownEncodingHandler(=0A=
++        parser->m_unknownEncodingHandlerData, encodingName, &info);=0A=
++    if (status) {=0A=
+       ENCODING *enc;=0A=
+       parser->m_unknownEncodingMem =3D MALLOC(parser, XmlSizeOfUnknownEnc=
oding());=0A=
+       if (! parser->m_unknownEncodingMem) {=0A=
+-- =0A=
+2.34.1=0A=
+=0A=
diff --git a/meta/recipes-core/expat/expat/CVE-2026-50219-05.patch b/meta/r=
ecipes-core/expat/expat/CVE-2026-50219-05.patch=0A=
new file mode 100644=0A=
index 0000000000..29f9a0afcc=0A=
--- /dev/null=0A=
+++ b/meta/recipes-core/expat/expat/CVE-2026-50219-05.patch=0A=
@@ -0,0 +1,48 @@=0A=
+From 6e755a1e9c3e4cc7c1ed60c96e9d2e1659daf5da Mon Sep 17 00:00:00 2001=0A=
+From: Sebastian Pipping <sebastian@pipping.org>=0A=
+Date: Tue, 26 May 2026 21:05:19 +0200=0A=
+Subject: [PATCH] lib: Register `m_attlistDeclHandler` with handler call de=
pth=0A=
+ tracking=0A=
+=0A=
+(cherry picked from commit 781092f189a8c8e8be6640258829a7f783864282)=0A=
+=0A=
+CVE: CVE-2026-50219=0A=
+Upstream-Status: Backport [https://github.com/libexpat/libexpat/pull/1246/=
commits/781092f189a8c8e8be6640258829a7f783864282]=0A=
+Signed-off-by: Jakub Szczudlo <jakub.szczudlo@nokia.com>=0A=
+---=0A=
+ lib/xmlparse.c | 4 ++++=0A=
+ 1 file changed, 4 insertions(+)=0A=
+=0A=
+diff --git a/lib/xmlparse.c b/lib/xmlparse.c=0A=
+index dddcb47..16ab984 100644=0A=
+--- a/lib/xmlparse.c=0A=
++++ b/lib/xmlparse.c=0A=
+@@ -5682,10 +5682,12 @@ doProlog(XML_Parser parser, const ENCODING *enc, c=
onst char *s, const char *end,=0A=
+             poolFinish(&parser->m_tempPool);=0A=
+           }=0A=
+           *eventEndPP =3D s;=0A=
++          beforeHandler(parser);=0A=
+           parser->m_attlistDeclHandler(=0A=
+               parser->m_handlerArg, parser->m_declElementType->name,=0A=
+               parser->m_declAttributeId->name, parser->m_declAttributeTyp=
e, 0,=0A=
+               role =3D=3D XML_ROLE_REQUIRED_ATTRIBUTE_VALUE);=0A=
++          afterHandler(parser);=0A=
+           handleDefault =3D XML_FALSE;=0A=
+         }=0A=
+       }=0A=
+@@ -5720,10 +5722,12 @@ doProlog(XML_Parser parser, const ENCODING *enc, c=
onst char *s, const char *end,=0A=
+             poolFinish(&parser->m_tempPool);=0A=
+           }=0A=
+           *eventEndPP =3D s;=0A=
++          beforeHandler(parser);=0A=
+           parser->m_attlistDeclHandler(=0A=
+               parser->m_handlerArg, parser->m_declElementType->name,=0A=
+               parser->m_declAttributeId->name, parser->m_declAttributeTyp=
e,=0A=
+               attVal, role =3D=3D XML_ROLE_FIXED_ATTRIBUTE_VALUE);=0A=
++          afterHandler(parser);=0A=
+           poolClear(&parser->m_tempPool);=0A=
+           handleDefault =3D XML_FALSE;=0A=
+         }=0A=
+-- =0A=
+2.34.1=0A=
+=0A=
diff --git a/meta/recipes-core/expat/expat/CVE-2026-50219-06.patch b/meta/r=
ecipes-core/expat/expat/CVE-2026-50219-06.patch=0A=
new file mode 100644=0A=
index 0000000000..c5ca02b37a=0A=
--- /dev/null=0A=
+++ b/meta/recipes-core/expat/expat/CVE-2026-50219-06.patch=0A=
@@ -0,0 +1,154 @@=0A=
+From 80765c36bc9b272d0141fa8c3ea3da59a16c443e Mon Sep 17 00:00:00 2001=0A=
+From: Sebastian Pipping <sebastian@pipping.org>=0A=
+Date: Tue, 26 May 2026 21:08:02 +0200=0A=
+Subject: [PATCH] lib: Register `m_characterDataHandler` with handler call=
=0A=
+ depth tracking=0A=
+=0A=
+(cherry picked from commit 5ee607587a997220a48e78b5f6c55a05e50e5b20)=0A=
+=0A=
+CVE: CVE-2026-50219=0A=
+Upstream-Status: Backport [https://github.com/libexpat/libexpat/pull/1246/=
commits/5ee607587a997220a48e78b5f6c55a05e50e5b20]=0A=
+Signed-off-by: Jakub Szczudlo <jakub.szczudlo@nokia.com>=0A=
+---=0A=
+ lib/xmlparse.c | 44 ++++++++++++++++++++++++++++++++++----------=0A=
+ 1 file changed, 34 insertions(+), 10 deletions(-)=0A=
+=0A=
+diff --git a/lib/xmlparse.c b/lib/xmlparse.c=0A=
+index 16ab984..4556805 100644=0A=
+--- a/lib/xmlparse.c=0A=
++++ b/lib/xmlparse.c=0A=
+@@ -3428,7 +3428,9 @@ doContent(XML_Parser parser, int startTagLevel, cons=
t ENCODING *enc,=0A=
+       *eventEndPP =3D end;=0A=
+       if (parser->m_characterDataHandler) {=0A=
+         XML_Char c =3D 0xA;=0A=
++        beforeHandler(parser);=0A=
+         parser->m_characterDataHandler(parser->m_handlerArg, &c, 1);=0A=
++        afterHandler(parser);=0A=
+       } else if (parser->m_defaultHandler)=0A=
+         reportDefault(parser, enc, s, end);=0A=
+       /* We are at the end of the final buffer, should we check for=0A=
+@@ -3481,9 +3483,11 @@ doContent(XML_Parser parser, int startTagLevel, con=
st ENCODING *enc,=0A=
+                                 ((char *)&ch) + sizeof(XML_Char), __LINE_=
_,=0A=
+                                 XML_ACCOUNT_ENTITY_EXPANSION);=0A=
+ #endif /* XML_GE =3D=3D 1 */=0A=
+-        if (parser->m_characterDataHandler)=0A=
++        if (parser->m_characterDataHandler) {=0A=
++          beforeHandler(parser);=0A=
+           parser->m_characterDataHandler(parser->m_handlerArg, &ch, 1);=
=0A=
+-        else if (parser->m_defaultHandler)=0A=
++          afterHandler(parser);=0A=
++        } else if (parser->m_defaultHandler)=0A=
+           reportDefault(parser, enc, s, next);=0A=
+         break;=0A=
+       }=0A=
+@@ -3729,8 +3733,10 @@ doContent(XML_Parser parser, int startTagLevel, con=
st ENCODING *enc,=0A=
+         return XML_ERROR_BAD_CHAR_REF;=0A=
+       if (parser->m_characterDataHandler) {=0A=
+         XML_Char buf[XML_ENCODE_MAX];=0A=
++        beforeHandler(parser);=0A=
+         parser->m_characterDataHandler(parser->m_handlerArg, buf,=0A=
+                                        XmlEncode(n, (ICHAR *)buf));=0A=
++        afterHandler(parser);=0A=
+       } else if (parser->m_defaultHandler)=0A=
+         reportDefault(parser, enc, s, next);=0A=
+     } break;=0A=
+@@ -3739,7 +3745,9 @@ doContent(XML_Parser parser, int startTagLevel, cons=
t ENCODING *enc,=0A=
+     case XML_TOK_DATA_NEWLINE:=0A=
+       if (parser->m_characterDataHandler) {=0A=
+         XML_Char c =3D 0xA;=0A=
++        beforeHandler(parser);=0A=
+         parser->m_characterDataHandler(parser->m_handlerArg, &c, 1);=0A=
++        afterHandler(parser);=0A=
+       } else if (parser->m_defaultHandler)=0A=
+         reportDefault(parser, enc, s, next);=0A=
+       break;=0A=
+@@ -3760,11 +3768,13 @@ doContent(XML_Parser parser, int startTagLevel, co=
nst ENCODING *enc,=0A=
+          However, now we have a start/endCdataSectionHandler, so it seems=
=0A=
+          easier to let the user deal with this.=0A=
+       */=0A=
+-      else if ((0) && parser->m_characterDataHandler)=0A=
++      else if ((0) && parser->m_characterDataHandler) {=0A=
++        beforeHandler(parser);=0A=
+         parser->m_characterDataHandler(parser->m_handlerArg, parser->m_da=
taBuf,=0A=
+                                        0);=0A=
+-      /* END disabled code */=0A=
+-      else if (parser->m_defaultHandler)=0A=
++        afterHandler(parser);=0A=
++        /* END disabled code */=0A=
++      } else if (parser->m_defaultHandler)=0A=
+         reportDefault(parser, enc, s, next);=0A=
+       result=0A=
+           =3D doCdataSection(parser, enc, &next, end, nextPtr, haveMore, =
account);=0A=
+@@ -3784,13 +3794,18 @@ doContent(XML_Parser parser, int startTagLevel, co=
nst ENCODING *enc,=0A=
+         if (MUST_CONVERT(enc, s)) {=0A=
+           ICHAR *dataPtr =3D (ICHAR *)parser->m_dataBuf;=0A=
+           XmlConvert(enc, &s, end, &dataPtr, (ICHAR *)parser->m_dataBufEn=
d);=0A=
++          beforeHandler(parser);=0A=
+           parser->m_characterDataHandler(=0A=
+               parser->m_handlerArg, parser->m_dataBuf,=0A=
+               (int)(dataPtr - (ICHAR *)parser->m_dataBuf));=0A=
+-        } else=0A=
++          afterHandler(parser);=0A=
++        } else {=0A=
++          beforeHandler(parser);=0A=
+           parser->m_characterDataHandler(=0A=
+               parser->m_handlerArg, (const XML_Char *)s,=0A=
+               (int)((const XML_Char *)end - (const XML_Char *)s));=0A=
++          afterHandler(parser);=0A=
++        }=0A=
+       } else if (parser->m_defaultHandler)=0A=
+         reportDefault(parser, enc, s, end);=0A=
+       /* We are at the end of the final buffer, should we check for=0A=
+@@ -3815,16 +3830,21 @@ doContent(XML_Parser parser, int startTagLevel, co=
nst ENCODING *enc,=0A=
+             const enum XML_Convert_Result convert_res =3D XmlConvert(=0A=
+                 enc, &s, next, &dataPtr, (ICHAR *)parser->m_dataBufEnd);=
=0A=
+             *eventEndPP =3D s;=0A=
++            beforeHandler(parser);=0A=
+             charDataHandler(parser->m_handlerArg, parser->m_dataBuf,=0A=
+                             (int)(dataPtr - (ICHAR *)parser->m_dataBuf));=
=0A=
++            afterHandler(parser);=0A=
+             if ((convert_res =3D=3D XML_CONVERT_COMPLETED)=0A=
+                 || (convert_res =3D=3D XML_CONVERT_INPUT_INCOMPLETE))=0A=
+               break;=0A=
+             *eventPP =3D s;=0A=
+           }=0A=
+-        } else=0A=
++        } else {=0A=
++          beforeHandler(parser);=0A=
+           charDataHandler(parser->m_handlerArg, (const XML_Char *)s,=0A=
+                           (int)((const XML_Char *)next - (const XML_Char =
*)s));=0A=
++          afterHandler(parser);=0A=
++        }=0A=
+       } else if (parser->m_defaultHandler)=0A=
+         reportDefault(parser, enc, s, next);=0A=
+     } break;=0A=
+@@ -4730,11 +4750,13 @@ doCdataSection(XML_Parser parser, const ENCODING *=
enc, const char **startPtr,=0A=
+         parser->m_endCdataSectionHandler(parser->m_handlerArg);=0A=
+       /* BEGIN disabled code */=0A=
+       /* see comment under XML_TOK_CDATA_SECT_OPEN */=0A=
+-      else if ((0) && parser->m_characterDataHandler)=0A=
++      else if ((0) && parser->m_characterDataHandler) {=0A=
++        beforeHandler(parser);=0A=
+         parser->m_characterDataHandler(parser->m_handlerArg, parser->m_da=
taBuf,=0A=
+                                        0);=0A=
+-      /* END disabled code */=0A=
+-      else if (parser->m_defaultHandler)=0A=
++        afterHandler(parser);=0A=
++        /* END disabled code */=0A=
++      } else if (parser->m_defaultHandler)=0A=
+         reportDefault(parser, enc, s, next);=0A=
+       *startPtr =3D next;=0A=
+       *nextPtr =3D next;=0A=
+@@ -4745,7 +4767,9 @@ doCdataSection(XML_Parser parser, const ENCODING *en=
c, const char **startPtr,=0A=
+     case XML_TOK_DATA_NEWLINE:=0A=
+       if (parser->m_characterDataHandler) {=0A=
+         XML_Char c =3D 0xA;=0A=
++        beforeHandler(parser);=0A=
+         parser->m_characterDataHandler(parser->m_handlerArg, &c, 1);=0A=
++        afterHandler(parser);=0A=
+       } else if (parser->m_defaultHandler)=0A=
+         reportDefault(parser, enc, s, next);=0A=
+       break;=0A=
+-- =0A=
+2.34.1=0A=
+=0A=
diff --git a/meta/recipes-core/expat/expat/CVE-2026-50219-07.patch b/meta/r=
ecipes-core/expat/expat/CVE-2026-50219-07.patch=0A=
new file mode 100644=0A=
index 0000000000..1bf15cdd01=0A=
--- /dev/null=0A=
+++ b/meta/recipes-core/expat/expat/CVE-2026-50219-07.patch=0A=
@@ -0,0 +1,32 @@=0A=
+From bba681b574c9675f331e79db0513bb9df1fec523 Mon Sep 17 00:00:00 2001=0A=
+From: Sebastian Pipping <sebastian@pipping.org>=0A=
+Date: Tue, 26 May 2026 21:08:40 +0200=0A=
+Subject: [PATCH] lib: Register `m_commentHandler` with handler call depth=
=0A=
+ tracking=0A=
+=0A=
+(cherry picked from commit 0e7dbfee7912a8e25aace775be47e5ad570b9cc3)=0A=
+=0A=
+CVE: CVE-2026-50219=0A=
+Upstream-Status: Backport [https://github.com/libexpat/libexpat/pull/1246/=
commits/0e7dbfee7912a8e25aace775be47e5ad570b9cc3]=0A=
+Signed-off-by: Jakub Szczudlo <jakub.szczudlo@nokia.com>=0A=
+---=0A=
+ lib/xmlparse.c | 2 ++=0A=
+ 1 file changed, 2 insertions(+)=0A=
+=0A=
+diff --git a/lib/xmlparse.c b/lib/xmlparse.c=0A=
+index 4556805..98ffe5a 100644=0A=
+--- a/lib/xmlparse.c=0A=
++++ b/lib/xmlparse.c=0A=
+@@ -7269,7 +7269,9 @@ reportComment(XML_Parser parser, const ENCODING *enc=
, const char *start,=0A=
+   if (! data)=0A=
+     return 0;=0A=
+   normalizeLines(data);=0A=
++  beforeHandler(parser);=0A=
+   parser->m_commentHandler(parser->m_handlerArg, data);=0A=
++  afterHandler(parser);=0A=
+   poolClear(&parser->m_tempPool);=0A=
+   return 1;=0A=
+ }=0A=
+-- =0A=
+2.34.1=0A=
+=0A=
diff --git a/meta/recipes-core/expat/expat/CVE-2026-50219-08.patch b/meta/r=
ecipes-core/expat/expat/CVE-2026-50219-08.patch=0A=
new file mode 100644=0A=
index 0000000000..7a21357ae7=0A=
--- /dev/null=0A=
+++ b/meta/recipes-core/expat/expat/CVE-2026-50219-08.patch=0A=
@@ -0,0 +1,44 @@=0A=
+From c6e96e6a5ec4afc710f4aee2b81bda4baca71a25 Mon Sep 17 00:00:00 2001=0A=
+From: Sebastian Pipping <sebastian@pipping.org>=0A=
+Date: Tue, 26 May 2026 21:14:10 +0200=0A=
+Subject: [PATCH] lib: Register `m_defaultHandler` with handler call depth=
=0A=
+ tracking=0A=
+=0A=
+(cherry picked from commit e5b76bd58dd9984cef46c2a66a98b03c95a3c774)=0A=
+=0A=
+CVE: CVE-2026-50219=0A=
+Upstream-Status: Backport [https://github.com/libexpat/libexpat/pull/1246/=
commits/e5b76bd58dd9984cef46c2a66a98b03c95a3c774]=0A=
+Signed-off-by: Jakub Szczudlo <jakub.szczudlo@nokia.com>=0A=
+---=0A=
+ lib/xmlparse.c | 7 ++++++-=0A=
+ 1 file changed, 6 insertions(+), 1 deletion(-)=0A=
+=0A=
+diff --git a/lib/xmlparse.c b/lib/xmlparse.c=0A=
+index 98ffe5a..ed9628f 100644=0A=
+--- a/lib/xmlparse.c=0A=
++++ b/lib/xmlparse.c=0A=
+@@ -7312,15 +7312,20 @@ reportDefault(XML_Parser parser, const ENCODING *e=
nc, const char *s,=0A=
+       convert_res=0A=
+           =3D XmlConvert(enc, &s, end, &dataPtr, (ICHAR *)parser->m_dataB=
ufEnd);=0A=
+       *eventEndPP =3D s;=0A=
++      beforeHandler(parser);=0A=
+       parser->m_defaultHandler(parser->m_handlerArg, parser->m_dataBuf,=
=0A=
+                                (int)(dataPtr - (ICHAR *)parser->m_dataBuf=
));=0A=
++      afterHandler(parser);=0A=
+       *eventPP =3D s;=0A=
+     } while ((convert_res !=3D XML_CONVERT_COMPLETED)=0A=
+              && (convert_res !=3D XML_CONVERT_INPUT_INCOMPLETE));=0A=
+-  } else=0A=
++  } else {=0A=
++    beforeHandler(parser);=0A=
+     parser->m_defaultHandler(=0A=
+         parser->m_handlerArg, (const XML_Char *)s,=0A=
+         (int)((const XML_Char *)end - (const XML_Char *)s));=0A=
++    afterHandler(parser);=0A=
++  }=0A=
+ }=0A=
+ =0A=
+ static int=0A=
+-- =0A=
+2.34.1=0A=
+=0A=
diff --git a/meta/recipes-core/expat/expat/CVE-2026-50219-09.patch b/meta/r=
ecipes-core/expat/expat/CVE-2026-50219-09.patch=0A=
new file mode 100644=0A=
index 0000000000..9d87b20d7c=0A=
--- /dev/null=0A=
+++ b/meta/recipes-core/expat/expat/CVE-2026-50219-09.patch=0A=
@@ -0,0 +1,44 @@=0A=
+From 8f2979090e01719c7f0c005816943d93bfda2754 Mon Sep 17 00:00:00 2001=0A=
+From: Sebastian Pipping <sebastian@pipping.org>=0A=
+Date: Tue, 26 May 2026 21:15:01 +0200=0A=
+Subject: [PATCH] lib: Register `m_elementDeclHandler` with handler call de=
pth=0A=
+ tracking=0A=
+=0A=
+(cherry picked from commit b4a711a33591c0d45d6e630ed6448dcbc5534700)=0A=
+=0A=
+CVE: CVE-2026-50219=0A=
+Upstream-Status: Backport [https://github.com/libexpat/libexpat/pull/1246/=
commits/b4a711a33591c0d45d6e630ed6448dcbc5534700]=0A=
+Signed-off-by: Jakub Szczudlo <jakub.szczudlo@nokia.com>=0A=
+---=0A=
+ lib/xmlparse.c | 4 ++++=0A=
+ 1 file changed, 4 insertions(+)=0A=
+=0A=
+diff --git a/lib/xmlparse.c b/lib/xmlparse.c=0A=
+index ed9628f..03bc212 100644=0A=
+--- a/lib/xmlparse.c=0A=
++++ b/lib/xmlparse.c=0A=
+@@ -6259,8 +6259,10 @@ doProlog(XML_Parser parser, const ENCODING *enc, co=
nst char *s, const char *end,=0A=
+           content->type =3D ((role =3D=3D XML_ROLE_CONTENT_ANY) ? XML_CTY=
PE_ANY=0A=
+                                                           : XML_CTYPE_EMP=
TY);=0A=
+           *eventEndPP =3D s;=0A=
++          beforeHandler(parser);=0A=
+           parser->m_elementDeclHandler(=0A=
+               parser->m_handlerArg, parser->m_declElementType->name, cont=
ent);=0A=
++          afterHandler(parser);=0A=
+           handleDefault =3D XML_FALSE;=0A=
+         }=0A=
+         dtd->in_eldecl =3D XML_FALSE;=0A=
+@@ -6342,8 +6344,10 @@ doProlog(XML_Parser parser, const ENCODING *enc, co=
nst char *s, const char *end,=0A=
+             if (! model)=0A=
+               return XML_ERROR_NO_MEMORY;=0A=
+             *eventEndPP =3D s;=0A=
++            beforeHandler(parser);=0A=
+             parser->m_elementDeclHandler(=0A=
+                 parser->m_handlerArg, parser->m_declElementType->name, mo=
del);=0A=
++            afterHandler(parser);=0A=
+           }=0A=
+           dtd->in_eldecl =3D XML_FALSE;=0A=
+           dtd->contentStringLen =3D 0;=0A=
+-- =0A=
+2.34.1=0A=
+=0A=
diff --git a/meta/recipes-core/expat/expat/CVE-2026-50219-10.patch b/meta/r=
ecipes-core/expat/expat/CVE-2026-50219-10.patch=0A=
new file mode 100644=0A=
index 0000000000..97c0975217=0A=
--- /dev/null=0A=
+++ b/meta/recipes-core/expat/expat/CVE-2026-50219-10.patch=0A=
@@ -0,0 +1,35 @@=0A=
+From 8849de56e9789089103114f472d68f3a37f5ab53 Mon Sep 17 00:00:00 2001=0A=
+From: Sebastian Pipping <sebastian@pipping.org>=0A=
+Date: Tue, 26 May 2026 21:15:40 +0200=0A=
+Subject: [PATCH] lib: Register `m_endCdataSectionHandler` with handler cal=
l=0A=
+ depth tracking=0A=
+=0A=
+(cherry picked from commit b08e08c0558152a4180597a3e880dc70040c2b2a)=0A=
+=0A=
+CVE: CVE-2026-50219=0A=
+Upstream-Status: Backport [https://github.com/libexpat/libexpat/pull/1246/=
commits/b08e08c0558152a4180597a3e880dc70040c2b2a]=0A=
+Signed-off-by: Jakub Szczudlo <jakub.szczudlo@nokia.com>=0A=
+---=0A=
+ lib/xmlparse.c | 5 ++++-=0A=
+ 1 file changed, 4 insertions(+), 1 deletion(-)=0A=
+=0A=
+diff --git a/lib/xmlparse.c b/lib/xmlparse.c=0A=
+index 03bc212..a894538 100644=0A=
+--- a/lib/xmlparse.c=0A=
++++ b/lib/xmlparse.c=0A=
+@@ -4746,8 +4746,11 @@ doCdataSection(XML_Parser parser, const ENCODING *e=
nc, const char **startPtr,=0A=
+     *eventEndPP =3D next;=0A=
+     switch (tok) {=0A=
+     case XML_TOK_CDATA_SECT_CLOSE:=0A=
+-      if (parser->m_endCdataSectionHandler)=0A=
++      if (parser->m_endCdataSectionHandler) {=0A=
++        beforeHandler(parser);=0A=
+         parser->m_endCdataSectionHandler(parser->m_handlerArg);=0A=
++        afterHandler(parser);=0A=
++      }=0A=
+       /* BEGIN disabled code */=0A=
+       /* see comment under XML_TOK_CDATA_SECT_OPEN */=0A=
+       else if ((0) && parser->m_characterDataHandler) {=0A=
+-- =0A=
+2.34.1=0A=
+=0A=
diff --git a/meta/recipes-core/expat/expat/CVE-2026-50219-11.patch b/meta/r=
ecipes-core/expat/expat/CVE-2026-50219-11.patch=0A=
new file mode 100644=0A=
index 0000000000..64c95c02e8=0A=
--- /dev/null=0A=
+++ b/meta/recipes-core/expat/expat/CVE-2026-50219-11.patch=0A=
@@ -0,0 +1,32 @@=0A=
+From 8114f635922a0c22ad11630aa953ca1545d23044 Mon Sep 17 00:00:00 2001=0A=
+From: Sebastian Pipping <sebastian@pipping.org>=0A=
+Date: Tue, 26 May 2026 21:16:13 +0200=0A=
+Subject: [PATCH] lib: Register `m_endDoctypeDeclHandler` with handler call=
=0A=
+ depth tracking=0A=
+=0A=
+(cherry picked from commit bd454febe07b931e638f2186755585b67a738d31)=0A=
+=0A=
+CVE: CVE-2026-50219=0A=
+Upstream-Status: Backport [https://github.com/libexpat/libexpat/pull/1246/=
commits/bd454febe07b931e638f2186755585b67a738d31]=0A=
+Signed-off-by: Jakub Szczudlo <jakub.szczudlo@nokia.com>=0A=
+---=0A=
+ lib/xmlparse.c | 2 ++=0A=
+ 1 file changed, 2 insertions(+)=0A=
+=0A=
+diff --git a/lib/xmlparse.c b/lib/xmlparse.c=0A=
+index a894538..2fe2f71 100644=0A=
+--- a/lib/xmlparse.c=0A=
++++ b/lib/xmlparse.c=0A=
+@@ -5585,7 +5585,9 @@ doProlog(XML_Parser parser, const ENCODING *enc, con=
st char *s, const char *end,=0A=
+       }=0A=
+ #endif /* XML_DTD */=0A=
+       if (parser->m_endDoctypeDeclHandler) {=0A=
++        beforeHandler(parser);=0A=
+         parser->m_endDoctypeDeclHandler(parser->m_handlerArg);=0A=
++        afterHandler(parser);=0A=
+         handleDefault =3D XML_FALSE;=0A=
+       }=0A=
+       break;=0A=
+-- =0A=
+2.34.1=0A=
+=0A=
diff --git a/meta/recipes-core/expat/expat/CVE-2026-50219-12.patch b/meta/r=
ecipes-core/expat/expat/CVE-2026-50219-12.patch=0A=
new file mode 100644=0A=
index 0000000000..5fb7b7dcf1=0A=
--- /dev/null=0A=
+++ b/meta/recipes-core/expat/expat/CVE-2026-50219-12.patch=0A=
@@ -0,0 +1,42 @@=0A=
+From 1d95acdeab736c3b4e08477b958b6f7296a75607 Mon Sep 17 00:00:00 2001=0A=
+From: Sebastian Pipping <sebastian@pipping.org>=0A=
+Date: Tue, 26 May 2026 21:17:10 +0200=0A=
+Subject: [PATCH] lib: Register `m_endElementHandler` with handler call dep=
th=0A=
+ tracking=0A=
+=0A=
+(cherry picked from commit e411d9907b8addb334d1ed5db1afd5b5bf625f24)=0A=
+=0A=
+CVE: CVE-2026-50219=0A=
+Upstream-Status: Backport [https://github.com/libexpat/libexpat/pull/1246/=
commits/e411d9907b8addb334d1ed5db1afd5b5bf625f24]=0A=
+Signed-off-by: Jakub Szczudlo <jakub.szczudlo@nokia.com>=0A=
+---=0A=
+ lib/xmlparse.c | 4 ++++=0A=
+ 1 file changed, 4 insertions(+)=0A=
+=0A=
+diff --git a/lib/xmlparse.c b/lib/xmlparse.c=0A=
+index 2fe2f71..37aaabc 100644=0A=
+--- a/lib/xmlparse.c=0A=
++++ b/lib/xmlparse.c=0A=
+@@ -3645,7 +3645,9 @@ doContent(XML_Parser parser, int startTagLevel, cons=
t ENCODING *enc,=0A=
+       if (parser->m_endElementHandler) {=0A=
+         if (parser->m_startElementHandler)=0A=
+           *eventPP =3D *eventEndPP;=0A=
++        beforeHandler(parser);=0A=
+         parser->m_endElementHandler(parser->m_handlerArg, name.str);=0A=
++        afterHandler(parser);=0A=
+         noElmHandlers =3D XML_FALSE;=0A=
+       }=0A=
+       if (noElmHandlers && parser->m_defaultHandler)=0A=
+@@ -3703,7 +3705,9 @@ doContent(XML_Parser parser, int startTagLevel, cons=
t ENCODING *enc,=0A=
+             }=0A=
+             *uri =3D XML_T('\0');=0A=
+           }=0A=
++          beforeHandler(parser);=0A=
+           parser->m_endElementHandler(parser->m_handlerArg, tag->name.str=
);=0A=
++          afterHandler(parser);=0A=
+         } else if (parser->m_defaultHandler)=0A=
+           reportDefault(parser, enc, s, next);=0A=
+         while (tag->bindings) {=0A=
+-- =0A=
+2.34.1=0A=
+=0A=
diff --git a/meta/recipes-core/expat/expat/CVE-2026-50219-13.patch b/meta/r=
ecipes-core/expat/expat/CVE-2026-50219-13.patch=0A=
new file mode 100644=0A=
index 0000000000..f74de674b0=0A=
--- /dev/null=0A=
+++ b/meta/recipes-core/expat/expat/CVE-2026-50219-13.patch=0A=
@@ -0,0 +1,49 @@=0A=
+From 3e9e33361aeaa853f16fd85bf30a71f0ac0b2791 Mon Sep 17 00:00:00 2001=0A=
+From: Sebastian Pipping <sebastian@pipping.org>=0A=
+Date: Tue, 26 May 2026 21:23:59 +0200=0A=
+Subject: [PATCH] lib: Register `m_endNamespaceDeclHandler` with handler ca=
ll=0A=
+ depth tracking=0A=
+=0A=
+(cherry picked from commit 274aa82340fe1b2205e8e3ae1cd35e2168cd42e8)=0A=
+=0A=
+CVE: CVE-2026-50219=0A=
+Upstream-Status: Backport [https://github.com/libexpat/libexpat/pull/1246/=
commits/274aa82340fe1b2205e8e3ae1cd35e2168cd42e8]=0A=
+Signed-off-by: Jakub Szczudlo <jakub.szczudlo@nokia.com>=0A=
+---=0A=
+ lib/xmlparse.c | 10 ++++++++--=0A=
+ 1 file changed, 8 insertions(+), 2 deletions(-)=0A=
+=0A=
+diff --git a/lib/xmlparse.c b/lib/xmlparse.c=0A=
+index 37aaabc..ad72001 100644=0A=
+--- a/lib/xmlparse.c=0A=
++++ b/lib/xmlparse.c=0A=
+@@ -3712,9 +3712,12 @@ doContent(XML_Parser parser, int startTagLevel, con=
st ENCODING *enc,=0A=
+           reportDefault(parser, enc, s, next);=0A=
+         while (tag->bindings) {=0A=
+           BINDING *b =3D tag->bindings;=0A=
+-          if (parser->m_endNamespaceDeclHandler)=0A=
++          if (parser->m_endNamespaceDeclHandler) {=0A=
++            beforeHandler(parser);=0A=
+             parser->m_endNamespaceDeclHandler(parser->m_handlerArg,=0A=
+                                               b->prefix->name);=0A=
++            afterHandler(parser);=0A=
++          }=0A=
+           tag->bindings =3D tag->bindings->nextTagBinding;=0A=
+           b->nextTagBinding =3D parser->m_freeBindingList;=0A=
+           parser->m_freeBindingList =3D b;=0A=
+@@ -3906,8 +3909,11 @@ freeBindings(XML_Parser parser, BINDING *bindings) =
{=0A=
+     /* m_startNamespaceDeclHandler will have been called for this=0A=
+      * binding in addBindings(), so call the end handler now.=0A=
+      */=0A=
+-    if (parser->m_endNamespaceDeclHandler)=0A=
++    if (parser->m_endNamespaceDeclHandler) {=0A=
++      beforeHandler(parser);=0A=
+       parser->m_endNamespaceDeclHandler(parser->m_handlerArg, b->prefix->=
name);=0A=
++      afterHandler(parser);=0A=
++    }=0A=
+ =0A=
+     bindings =3D bindings->nextTagBinding;=0A=
+     b->nextTagBinding =3D parser->m_freeBindingList;=0A=
+-- =0A=
+2.34.1=0A=
+=0A=
diff --git a/meta/recipes-core/expat/expat/CVE-2026-50219-14.patch b/meta/r=
ecipes-core/expat/expat/CVE-2026-50219-14.patch=0A=
new file mode 100644=0A=
index 0000000000..4d37cd6f0c=0A=
--- /dev/null=0A=
+++ b/meta/recipes-core/expat/expat/CVE-2026-50219-14.patch=0A=
@@ -0,0 +1,74 @@=0A=
+From 13084e0a4473dcea40fc0173a2c54fbf9fd3eece Mon Sep 17 00:00:00 2001=0A=
+From: Sebastian Pipping <sebastian@pipping.org>=0A=
+Date: Tue, 26 May 2026 21:25:42 +0200=0A=
+Subject: [PATCH] lib: Register `m_entityDeclHandler` with handler call dep=
th=0A=
+ tracking=0A=
+=0A=
+(cherry picked from commit 6e62649e6b25eb789166b9131dfadfe9d806f5ce)=0A=
+=0A=
+CVE: CVE-2026-50219=0A=
+Upstream-Status: Backport [https://github.com/libexpat/libexpat/pull/1246/=
commits/6e62649e6b25eb789166b9131dfadfe9d806f5ce]=0A=
+Signed-off-by: Jakub Szczudlo <jakub.szczudlo@nokia.com>=0A=
+---=0A=
+ lib/xmlparse.c | 8 ++++++++=0A=
+ 1 file changed, 8 insertions(+)=0A=
+=0A=
+diff --git a/lib/xmlparse.c b/lib/xmlparse.c=0A=
+index ad72001..e9466d5 100644=0A=
+--- a/lib/xmlparse.c=0A=
++++ b/lib/xmlparse.c=0A=
+@@ -5791,10 +5791,12 @@ doProlog(XML_Parser parser, const ENCODING *enc, c=
onst char *s, const char *end,=0A=
+           poolFinish(&dtd->entityValuePool);=0A=
+           if (parser->m_entityDeclHandler) {=0A=
+             *eventEndPP =3D s;=0A=
++            beforeHandler(parser);=0A=
+             parser->m_entityDeclHandler(=0A=
+                 parser->m_handlerArg, parser->m_declEntity->name,=0A=
+                 parser->m_declEntity->is_param, parser->m_declEntity->tex=
tPtr,=0A=
+                 parser->m_declEntity->textLen, parser->m_curBase, 0, 0, 0=
);=0A=
++            afterHandler(parser);=0A=
+             handleDefault =3D XML_FALSE;=0A=
+           }=0A=
+         } else=0A=
+@@ -5812,10 +5814,12 @@ doProlog(XML_Parser parser, const ENCODING *enc, c=
onst char *s, const char *end,=0A=
+ =0A=
+           if (parser->m_entityDeclHandler) {=0A=
+             *eventEndPP =3D s;=0A=
++            beforeHandler(parser);=0A=
+             parser->m_entityDeclHandler(=0A=
+                 parser->m_handlerArg, parser->m_declEntity->name,=0A=
+                 parser->m_declEntity->is_param, parser->m_declEntity->tex=
tPtr,=0A=
+                 parser->m_declEntity->textLen, parser->m_curBase, 0, 0, 0=
);=0A=
++            afterHandler(parser);=0A=
+             handleDefault =3D XML_FALSE;=0A=
+           }=0A=
+         }=0A=
+@@ -5893,10 +5897,12 @@ doProlog(XML_Parser parser, const ENCODING *enc, c=
onst char *s, const char *end,=0A=
+       if (dtd->keepProcessing && parser->m_declEntity=0A=
+           && parser->m_entityDeclHandler) {=0A=
+         *eventEndPP =3D s;=0A=
++        beforeHandler(parser);=0A=
+         parser->m_entityDeclHandler(=0A=
+             parser->m_handlerArg, parser->m_declEntity->name,=0A=
+             parser->m_declEntity->is_param, 0, 0, parser->m_declEntity->b=
ase,=0A=
+             parser->m_declEntity->systemId, parser->m_declEntity->publicI=
d, 0);=0A=
++        afterHandler(parser);=0A=
+         handleDefault =3D XML_FALSE;=0A=
+       }=0A=
+       break;=0A=
+@@ -5916,10 +5922,12 @@ doProlog(XML_Parser parser, const ENCODING *enc, c=
onst char *s, const char *end,=0A=
+           handleDefault =3D XML_FALSE;=0A=
+         } else if (parser->m_entityDeclHandler) {=0A=
+           *eventEndPP =3D s;=0A=
++          beforeHandler(parser);=0A=
+           parser->m_entityDeclHandler(=0A=
+               parser->m_handlerArg, parser->m_declEntity->name, 0, 0, 0,=
=0A=
+               parser->m_declEntity->base, parser->m_declEntity->systemId,=
=0A=
+               parser->m_declEntity->publicId, parser->m_declEntity->notat=
ion);=0A=
++          afterHandler(parser);=0A=
+           handleDefault =3D XML_FALSE;=0A=
+         }=0A=
+       }=0A=
+-- =0A=
+2.34.1=0A=
+=0A=
diff --git a/meta/recipes-core/expat/expat/CVE-2026-50219-15.patch b/meta/r=
ecipes-core/expat/expat/CVE-2026-50219-15.patch=0A=
new file mode 100644=0A=
index 0000000000..07e69cb772=0A=
--- /dev/null=0A=
+++ b/meta/recipes-core/expat/expat/CVE-2026-50219-15.patch=0A=
@@ -0,0 +1,82 @@=0A=
+From e5035de264c3102b33891570bdff7c6313a9d2b5 Mon Sep 17 00:00:00 2001=0A=
+From: Sebastian Pipping <sebastian@pipping.org>=0A=
+Date: Sat, 30 May 2026 00:45:50 +0200=0A=
+Subject: [PATCH] lib: Register `m_externalEntityRefHandler` with handler c=
all=0A=
+ depth tracking=0A=
+=0A=
+(cherry picked from commit d4ba1c29165de39605b799223392dfb28bed85d5)=0A=
+=0A=
+CVE: CVE-2026-50219=0A=
+Upstream-Status: Backport [https://github.com/libexpat/libexpat/pull/1246/=
commits/d4ba1c29165de39605b799223392dfb28bed85d5]=0A=
+Signed-off-by: Jakub Szczudlo <jakub.szczudlo@nokia.com>=0A=
+---=0A=
+ lib/xmlparse.c | 10 ++++++++++=0A=
+ 1 file changed, 10 insertions(+)=0A=
+=0A=
+diff --git a/lib/xmlparse.c b/lib/xmlparse.c=0A=
+index e9466d5..7909490 100644=0A=
+--- a/lib/xmlparse.c=0A=
++++ b/lib/xmlparse.c=0A=
+@@ -3537,9 +3537,11 @@ doContent(XML_Parser parser, int startTagLevel, con=
st ENCODING *enc,=0A=
+         entity->open =3D XML_FALSE;=0A=
+         if (! context)=0A=
+           return XML_ERROR_NO_MEMORY;=0A=
++        beforeHandler(parser);=0A=
+         const int status =3D parser->m_externalEntityRefHandler(=0A=
+             parser->m_externalEntityRefHandlerArg, context, entity->base,=
=0A=
+             entity->systemId, entity->publicId);=0A=
++        afterHandler(parser);=0A=
+         if (! status)=0A=
+           return XML_ERROR_EXTERNAL_ENTITY_HANDLING;=0A=
+         poolDiscard(&parser->m_tempPool);=0A=
+@@ -5571,9 +5573,11 @@ doProlog(XML_Parser parser, const ENCODING *enc, co=
nst char *s, const char *end,=0A=
+           if (parser->m_useForeignDTD)=0A=
+             entity->base =3D parser->m_curBase;=0A=
+           dtd->paramEntityRead =3D XML_FALSE;=0A=
++          beforeHandler(parser);=0A=
+           const int status =3D parser->m_externalEntityRefHandler(=0A=
+               parser->m_externalEntityRefHandlerArg, 0, entity->base,=0A=
+               entity->systemId, entity->publicId);=0A=
++          afterHandler(parser);=0A=
+           if (! status)=0A=
+             return XML_ERROR_EXTERNAL_ENTITY_HANDLING;=0A=
+           if (dtd->paramEntityRead) {=0A=
+@@ -5617,9 +5621,11 @@ doProlog(XML_Parser parser, const ENCODING *enc, co=
nst char *s, const char *end,=0A=
+             return XML_ERROR_NO_MEMORY;=0A=
+           entity->base =3D parser->m_curBase;=0A=
+           dtd->paramEntityRead =3D XML_FALSE;=0A=
++          beforeHandler(parser);=0A=
+           const int status =3D parser->m_externalEntityRefHandler(=0A=
+               parser->m_externalEntityRefHandlerArg, 0, entity->base,=0A=
+               entity->systemId, entity->publicId);=0A=
++          afterHandler(parser);=0A=
+           if (! status)=0A=
+             return XML_ERROR_EXTERNAL_ENTITY_HANDLING;=0A=
+           if (dtd->paramEntityRead) {=0A=
+@@ -6222,9 +6228,11 @@ doProlog(XML_Parser parser, const ENCODING *enc, co=
nst char *s, const char *end,=0A=
+           dtd->paramEntityRead =3D XML_FALSE;=0A=
+           entity->open =3D XML_TRUE;=0A=
+           entityTrackingOnOpen(parser, entity, __LINE__);=0A=
++          beforeHandler(parser);=0A=
+           const int status =3D parser->m_externalEntityRefHandler(=0A=
+               parser->m_externalEntityRefHandlerArg, 0, entity->base,=0A=
+               entity->systemId, entity->publicId);=0A=
++          afterHandler(parser);=0A=
+           if (! status) {=0A=
+             entityTrackingOnClose(parser, entity, __LINE__);=0A=
+             entity->open =3D XML_FALSE;=0A=
+@@ -7019,9 +7027,11 @@ storeEntityValue(XML_Parser parser, const ENCODING =
*enc,=0A=
+             dtd->paramEntityRead =3D XML_FALSE;=0A=
+             entity->open =3D XML_TRUE;=0A=
+             entityTrackingOnOpen(parser, entity, __LINE__);=0A=
++            beforeHandler(parser);=0A=
+             const int status =3D parser->m_externalEntityRefHandler(=0A=
+                 parser->m_externalEntityRefHandlerArg, 0, entity->base,=
=0A=
+                 entity->systemId, entity->publicId);=0A=
++            afterHandler(parser);=0A=
+             if (! status) {=0A=
+               entityTrackingOnClose(parser, entity, __LINE__);=0A=
+               entity->open =3D XML_FALSE;=0A=
+-- =0A=
+2.34.1=0A=
+=0A=
diff --git a/meta/recipes-core/expat/expat/CVE-2026-50219-16.patch b/meta/r=
ecipes-core/expat/expat/CVE-2026-50219-16.patch=0A=
new file mode 100644=0A=
index 0000000000..3cc3f7faaf=0A=
--- /dev/null=0A=
+++ b/meta/recipes-core/expat/expat/CVE-2026-50219-16.patch=0A=
@@ -0,0 +1,46 @@=0A=
+From 24ec73df3f099032fb66638685c296c18d914f84 Mon Sep 17 00:00:00 2001=0A=
+From: Sebastian Pipping <sebastian@pipping.org>=0A=
+Date: Tue, 26 May 2026 21:27:13 +0200=0A=
+Subject: [PATCH] lib: Register `m_notationDeclHandler` with handler call d=
epth=0A=
+ tracking=0A=
+=0A=
+(cherry picked from commit 4739ad3fda250cf458d396d9c17a0e0fef571bdd)=0A=
+=0A=
+CVE: CVE-2026-50219=0A=
+Upstream-Status: Backport [https://github.com/libexpat/libexpat/pull/1246/=
commits/4739ad3fda250cf458d396d9c17a0e0fef571bdd]=0A=
+Signed-off-by: Jakub Szczudlo <jakub.szczudlo@nokia.com>=0A=
+---=0A=
+ lib/xmlparse.c | 4 ++++=0A=
+ 1 file changed, 4 insertions(+)=0A=
+=0A=
+diff --git a/lib/xmlparse.c b/lib/xmlparse.c=0A=
+index 7909490..5a0f063 100644=0A=
+--- a/lib/xmlparse.c=0A=
++++ b/lib/xmlparse.c=0A=
+@@ -6040,9 +6040,11 @@ doProlog(XML_Parser parser, const ENCODING *enc, co=
nst char *s, const char *end,=0A=
+         if (! systemId)=0A=
+           return XML_ERROR_NO_MEMORY;=0A=
+         *eventEndPP =3D s;=0A=
++        beforeHandler(parser);=0A=
+         parser->m_notationDeclHandler(=0A=
+             parser->m_handlerArg, parser->m_declNotationName, parser->m_c=
urBase,=0A=
+             systemId, parser->m_declNotationPublicId);=0A=
++        afterHandler(parser);=0A=
+         handleDefault =3D XML_FALSE;=0A=
+       }=0A=
+       poolClear(&parser->m_tempPool);=0A=
+@@ -6050,9 +6052,11 @@ doProlog(XML_Parser parser, const ENCODING *enc, co=
nst char *s, const char *end,=0A=
+     case XML_ROLE_NOTATION_NO_SYSTEM_ID:=0A=
+       if (parser->m_declNotationPublicId && parser->m_notationDeclHandler=
) {=0A=
+         *eventEndPP =3D s;=0A=
++        beforeHandler(parser);=0A=
+         parser->m_notationDeclHandler(=0A=
+             parser->m_handlerArg, parser->m_declNotationName, parser->m_c=
urBase,=0A=
+             0, parser->m_declNotationPublicId);=0A=
++        afterHandler(parser);=0A=
+         handleDefault =3D XML_FALSE;=0A=
+       }=0A=
+       poolClear(&parser->m_tempPool);=0A=
+-- =0A=
+2.34.1=0A=
+=0A=
diff --git a/meta/recipes-core/expat/expat/CVE-2026-50219-17.patch b/meta/r=
ecipes-core/expat/expat/CVE-2026-50219-17.patch=0A=
new file mode 100644=0A=
index 0000000000..992ae93d6e=0A=
--- /dev/null=0A=
+++ b/meta/recipes-core/expat/expat/CVE-2026-50219-17.patch=0A=
@@ -0,0 +1,64 @@=0A=
+From 08eea37057ebc8f6dafcec601b0ff923d221e205 Mon Sep 17 00:00:00 2001=0A=
+From: Sebastian Pipping <sebastian@pipping.org>=0A=
+Date: Tue, 26 May 2026 21:34:29 +0200=0A=
+Subject: [PATCH] lib: Register `m_notStandaloneHandler` with handler call=
=0A=
+ depth tracking=0A=
+=0A=
+(cherry picked from commit d7a9c975ceeaa24c730e50fef2bedff5f99d2172)=0A=
+=0A=
+CVE: CVE-2026-50219=0A=
+Upstream-Status: Backport [https://github.com/libexpat/libexpat/pull/1246/=
commits/d7a9c975ceeaa24c730e50fef2bedff5f99d2172]=0A=
+Signed-off-by: Jakub Szczudlo <jakub.szczudlo@nokia.com>=0A=
+---=0A=
+ lib/xmlparse.c | 8 ++++++++=0A=
+ 1 file changed, 8 insertions(+)=0A=
+=0A=
+diff --git a/lib/xmlparse.c b/lib/xmlparse.c=0A=
+index 5a0f063..93110fe 100644=0A=
+--- a/lib/xmlparse.c=0A=
++++ b/lib/xmlparse.c=0A=
+@@ -5582,8 +5582,10 @@ doProlog(XML_Parser parser, const ENCODING *enc, co=
nst char *s, const char *end,=0A=
+             return XML_ERROR_EXTERNAL_ENTITY_HANDLING;=0A=
+           if (dtd->paramEntityRead) {=0A=
+             if (! dtd->standalone && parser->m_notStandaloneHandler) {=0A=
++              beforeHandler(parser);=0A=
+               const int handlerStatus=0A=
+                   =3D parser->m_notStandaloneHandler(parser->m_handlerArg=
);=0A=
++              afterHandler(parser);=0A=
+               if (! handlerStatus)=0A=
+                 return XML_ERROR_NOT_STANDALONE;=0A=
+             }=0A=
+@@ -5630,8 +5632,10 @@ doProlog(XML_Parser parser, const ENCODING *enc, co=
nst char *s, const char *end,=0A=
+             return XML_ERROR_EXTERNAL_ENTITY_HANDLING;=0A=
+           if (dtd->paramEntityRead) {=0A=
+             if (! dtd->standalone && parser->m_notStandaloneHandler) {=0A=
++              beforeHandler(parser);=0A=
+               const int handlerStatus=0A=
+                   =3D parser->m_notStandaloneHandler(parser->m_handlerArg=
);=0A=
++              afterHandler(parser);=0A=
+               if (! handlerStatus)=0A=
+                 return XML_ERROR_NOT_STANDALONE;=0A=
+             }=0A=
+@@ -5857,7 +5861,9 @@ doProlog(XML_Parser parser, const ENCODING *enc, con=
st char *s, const char *end,=0A=
+           && ! parser->m_paramEntityParsing=0A=
+ #endif /* XML_DTD */=0A=
+           && parser->m_notStandaloneHandler) {=0A=
++        beforeHandler(parser);=0A=
+         const int status =3D parser->m_notStandaloneHandler(parser->m_han=
dlerArg);=0A=
++        afterHandler(parser);=0A=
+         if (! status)=0A=
+           return XML_ERROR_NOT_STANDALONE;=0A=
+       }=0A=
+@@ -6256,7 +6262,9 @@ doProlog(XML_Parser parser, const ENCODING *enc, con=
st char *s, const char *end,=0A=
+       }=0A=
+ #endif /* XML_DTD */=0A=
+       if (! dtd->standalone && parser->m_notStandaloneHandler) {=0A=
++        beforeHandler(parser);=0A=
+         const int status =3D parser->m_notStandaloneHandler(parser->m_han=
dlerArg);=0A=
++        afterHandler(parser);=0A=
+         if (! status)=0A=
+           return XML_ERROR_NOT_STANDALONE;=0A=
+       }=0A=
+-- =0A=
+2.34.1=0A=
+=0A=
diff --git a/meta/recipes-core/expat/expat/CVE-2026-50219-18.patch b/meta/r=
ecipes-core/expat/expat/CVE-2026-50219-18.patch=0A=
new file mode 100644=0A=
index 0000000000..4520cbd13a=0A=
--- /dev/null=0A=
+++ b/meta/recipes-core/expat/expat/CVE-2026-50219-18.patch=0A=
@@ -0,0 +1,32 @@=0A=
+From d9ea54153ef454217b8a2a8255b2bd1ead460e83 Mon Sep 17 00:00:00 2001=0A=
+From: Sebastian Pipping <sebastian@pipping.org>=0A=
+Date: Tue, 26 May 2026 21:35:08 +0200=0A=
+Subject: [PATCH] lib: Register `m_processingInstructionHandler` with handl=
er=0A=
+ call depth tracking=0A=
+=0A=
+(cherry picked from commit 8bb00d345d5f92b17a06e01a926ee1dda797e0af)=0A=
+=0A=
+CVE: CVE-2026-50219=0A=
+Upstream-Status: Backport [https://github.com/libexpat/libexpat/pull/1246/=
commits/8bb00d345d5f92b17a06e01a926ee1dda797e0af]=0A=
+Signed-off-by: Jakub Szczudlo <jakub.szczudlo@nokia.com>=0A=
+---=0A=
+ lib/xmlparse.c | 2 ++=0A=
+ 1 file changed, 2 insertions(+)=0A=
+=0A=
+diff --git a/lib/xmlparse.c b/lib/xmlparse.c=0A=
+index 93110fe..b2672ae 100644=0A=
+--- a/lib/xmlparse.c=0A=
++++ b/lib/xmlparse.c=0A=
+@@ -7298,7 +7298,9 @@ reportProcessingInstruction(XML_Parser parser, const=
 ENCODING *enc,=0A=
+   if (! data)=0A=
+     return 0;=0A=
+   normalizeLines(data);=0A=
++  beforeHandler(parser);=0A=
+   parser->m_processingInstructionHandler(parser->m_handlerArg, target, da=
ta);=0A=
++  afterHandler(parser);=0A=
+   poolClear(&parser->m_tempPool);=0A=
+   return 1;=0A=
+ }=0A=
+-- =0A=
+2.34.1=0A=
+=0A=
diff --git a/meta/recipes-core/expat/expat/CVE-2026-50219-19.patch b/meta/r=
ecipes-core/expat/expat/CVE-2026-50219-19.patch=0A=
new file mode 100644=0A=
index 0000000000..6d6e2cf2d4=0A=
--- /dev/null=0A=
+++ b/meta/recipes-core/expat/expat/CVE-2026-50219-19.patch=0A=
@@ -0,0 +1,87 @@=0A=
+From 1cbb5676ee24c03222923f2ce853ffe245a831ad Mon Sep 17 00:00:00 2001=0A=
+From: Sebastian Pipping <sebastian@pipping.org>=0A=
+Date: Tue, 26 May 2026 21:36:39 +0200=0A=
+Subject: [PATCH] lib: Register `m_skippedEntityHandler` with handler call=
=0A=
+ depth tracking=0A=
+=0A=
+(cherry picked from commit 64e3adf0c9d7e1846cff784de3159f1067eb5e06)=0A=
+=0A=
+CVE: CVE-2026-50219=0A=
+Upstream-Status: Backport [https://github.com/libexpat/libexpat/pull/1246/=
commits/64e3adf0c9d7e1846cff784de3159f1067eb5e06]=0A=
+Signed-off-by: Jakub Szczudlo <jakub.szczudlo@nokia.com>=0A=
+---=0A=
+ lib/xmlparse.c | 24 ++++++++++++++++++------=0A=
+ 1 file changed, 18 insertions(+), 6 deletions(-)=0A=
+=0A=
+diff --git a/lib/xmlparse.c b/lib/xmlparse.c=0A=
+index b2672ae..1ee7cca 100644=0A=
+--- a/lib/xmlparse.c=0A=
++++ b/lib/xmlparse.c=0A=
+@@ -3507,9 +3507,11 @@ doContent(XML_Parser parser, int startTagLevel, con=
st ENCODING *enc,=0A=
+         else if (! entity->is_internal)=0A=
+           return XML_ERROR_ENTITY_DECLARED_IN_PE;=0A=
+       } else if (! entity) {=0A=
+-        if (parser->m_skippedEntityHandler)=0A=
++        if (parser->m_skippedEntityHandler) {=0A=
++          beforeHandler(parser);=0A=
+           parser->m_skippedEntityHandler(parser->m_handlerArg, name, 0);=
=0A=
+-        else if (parser->m_defaultHandler)=0A=
++          afterHandler(parser);=0A=
++        } else if (parser->m_defaultHandler)=0A=
+           reportDefault(parser, enc, s, next);=0A=
+         break;=0A=
+       }=0A=
+@@ -3520,10 +3522,12 @@ doContent(XML_Parser parser, int startTagLevel, co=
nst ENCODING *enc,=0A=
+       if (entity->textPtr) {=0A=
+         enum XML_Error result;=0A=
+         if (! parser->m_defaultExpandInternalEntities) {=0A=
+-          if (parser->m_skippedEntityHandler)=0A=
++          if (parser->m_skippedEntityHandler) {=0A=
++            beforeHandler(parser);=0A=
+             parser->m_skippedEntityHandler(parser->m_handlerArg, entity->=
name,=0A=
+                                            0);=0A=
+-          else if (parser->m_defaultHandler)=0A=
++            afterHandler(parser);=0A=
++          } else if (parser->m_defaultHandler)=0A=
+             reportDefault(parser, enc, s, next);=0A=
+           break;=0A=
+         }=0A=
+@@ -6217,7 +6221,9 @@ doProlog(XML_Parser parser, const ENCODING *enc, con=
st char *s, const char *end,=0A=
+           /* cannot report skipped entities in declarations */=0A=
+           if ((role =3D=3D XML_ROLE_PARAM_ENTITY_REF)=0A=
+               && parser->m_skippedEntityHandler) {=0A=
++            beforeHandler(parser);=0A=
+             parser->m_skippedEntityHandler(parser->m_handlerArg, name, 1)=
;=0A=
++            afterHandler(parser);=0A=
+             handleDefault =3D XML_FALSE;=0A=
+           }=0A=
+           break;=0A=
+@@ -6888,8 +6894,11 @@ appendAttributeValue(XML_Parser parser, const ENCOD=
ING *enc, XML_Bool isCdata,=0A=
+       } else if (! entity) {=0A=
+         /* Cannot report skipped entity here - see comments on=0A=
+            parser->m_skippedEntityHandler.=0A=
+-        if (parser->m_skippedEntityHandler)=0A=
++        if (parser->m_skippedEntityHandler) {=0A=
++          beforeHandler(parser);=0A=
+           parser->m_skippedEntityHandler(parser->m_handlerArg, name, 0);=
=0A=
++          afterHandler(parser);=0A=
++        }=0A=
+         */=0A=
+         /* Cannot call the default handler because this would be=0A=
+            out of sync with the call to the startElementHandler.=0A=
+@@ -7022,8 +7031,11 @@ storeEntityValue(XML_Parser parser, const ENCODING =
*enc,=0A=
+           /* not a well-formedness error - see XML 1.0: WFC Entity Declar=
ed */=0A=
+           /* cannot report skipped entity here - see comments on=0A=
+              parser->m_skippedEntityHandler=0A=
+-          if (parser->m_skippedEntityHandler)=0A=
++          if (parser->m_skippedEntityHandler) {=0A=
++            beforeHandler(parser);=0A=
+             parser->m_skippedEntityHandler(parser->m_handlerArg, name, 0)=
;=0A=
++            afterHandler(parser);=0A=
++          }=0A=
+           */=0A=
+           dtd->keepProcessing =3D dtd->standalone;=0A=
+           goto endEntityValue;=0A=
+-- =0A=
+2.34.1=0A=
+=0A=
diff --git a/meta/recipes-core/expat/expat/CVE-2026-50219-20.patch b/meta/r=
ecipes-core/expat/expat/CVE-2026-50219-20.patch=0A=
new file mode 100644=0A=
index 0000000000..e36403367e=0A=
--- /dev/null=0A=
+++ b/meta/recipes-core/expat/expat/CVE-2026-50219-20.patch=0A=
@@ -0,0 +1,62 @@=0A=
+From 6697406736678ac3f6738f5b171c4c128b66df7d Mon Sep 17 00:00:00 2001=0A=
+From: Sebastian Pipping <sebastian@pipping.org>=0A=
+Date: Tue, 26 May 2026 21:37:49 +0200=0A=
+Subject: [PATCH] lib: Register `m_startCdataSectionHandler` with handler c=
all=0A=
+ depth tracking=0A=
+=0A=
+(cherry picked from commit 222278ad452d27f8c35ba031be14d6e70aab5ab1)=0A=
+=0A=
+CVE: CVE-2026-50219=0A=
+Upstream-Status: Backport [https://github.com/libexpat/libexpat/pull/1246/=
commits/222278ad452d27f8c35ba031be14d6e70aab5ab1]=0A=
+Signed-off-by: Jakub Szczudlo <jakub.szczudlo@nokia.com>=0A=
+---=0A=
+ lib/xmlparse.c | 32 +++++++++++++++++---------------=0A=
+ 1 file changed, 17 insertions(+), 15 deletions(-)=0A=
+=0A=
+diff --git a/lib/xmlparse.c b/lib/xmlparse.c=0A=
+index 1ee7cca..ad8cc44 100644=0A=
+--- a/lib/xmlparse.c=0A=
++++ b/lib/xmlparse.c=0A=
+@@ -3766,22 +3766,24 @@ doContent(XML_Parser parser, int startTagLevel, co=
nst ENCODING *enc,=0A=
+       break;=0A=
+     case XML_TOK_CDATA_SECT_OPEN: {=0A=
+       enum XML_Error result;=0A=
+-      if (parser->m_startCdataSectionHandler)=0A=
++      if (parser->m_startCdataSectionHandler) {=0A=
++        beforeHandler(parser);=0A=
+         parser->m_startCdataSectionHandler(parser->m_handlerArg);=0A=
+-      /* BEGIN disabled code */=0A=
+-      /* Suppose you doing a transformation on a document that involves=
=0A=
+-         changing only the character data.  You set up a defaultHandler=
=0A=
+-         and a characterDataHandler.  The defaultHandler simply copies=0A=
+-         characters through.  The characterDataHandler does the=0A=
+-         transformation and writes the characters out escaping them as=0A=
+-         necessary.  This case will fail to work if we leave out the=0A=
+-         following two lines (because & and < inside CDATA sections will=
=0A=
+-         be incorrectly escaped).=0A=
+-=0A=
+-         However, now we have a start/endCdataSectionHandler, so it seems=
=0A=
+-         easier to let the user deal with this.=0A=
+-      */=0A=
+-      else if ((0) && parser->m_characterDataHandler) {=0A=
++        afterHandler(parser);=0A=
++        /* BEGIN disabled code */=0A=
++        /* Suppose you doing a transformation on a document that involves=
=0A=
++           changing only the character data.  You set up a defaultHandler=
=0A=
++           and a characterDataHandler.  The defaultHandler simply copies=
=0A=
++           characters through.  The characterDataHandler does the=0A=
++           transformation and writes the characters out escaping them as=
=0A=
++           necessary.  This case will fail to work if we leave out the=0A=
++           following two lines (because & and < inside CDATA sections wil=
l=0A=
++           be incorrectly escaped).=0A=
++=0A=
++           However, now we have a start/endCdataSectionHandler, so it see=
ms=0A=
++           easier to let the user deal with this.=0A=
++        */=0A=
++      } else if ((0) && parser->m_characterDataHandler) {=0A=
+         beforeHandler(parser);=0A=
+         parser->m_characterDataHandler(parser->m_handlerArg, parser->m_da=
taBuf,=0A=
+                                        0);=0A=
+-- =0A=
+2.34.1=0A=
+=0A=
diff --git a/meta/recipes-core/expat/expat/CVE-2026-50219-21.patch b/meta/r=
ecipes-core/expat/expat/CVE-2026-50219-21.patch=0A=
new file mode 100644=0A=
index 0000000000..bbeeced76e=0A=
--- /dev/null=0A=
+++ b/meta/recipes-core/expat/expat/CVE-2026-50219-21.patch=0A=
@@ -0,0 +1,46 @@=0A=
+From c7cc71e323ef0afcb115dd1567bf1bdfcbc5f8d2 Mon Sep 17 00:00:00 2001=0A=
+From: Sebastian Pipping <sebastian@pipping.org>=0A=
+Date: Tue, 26 May 2026 21:38:47 +0200=0A=
+Subject: [PATCH] lib: Register `m_startDoctypeDeclHandler` with handler ca=
ll=0A=
+ depth tracking=0A=
+=0A=
+(cherry picked from commit 82f1d14a033f7c5bd6f658c3cdcd2515efe86745)=0A=
+=0A=
+CVE: CVE-2026-50219=0A=
+Upstream-Status: Backport [https://github.com/libexpat/libexpat/pull/1246/=
commits/82f1d14a033f7c5bd6f658c3cdcd2515efe86745]=0A=
+Signed-off-by: Jakub Szczudlo <jakub.szczudlo@nokia.com>=0A=
+---=0A=
+ lib/xmlparse.c | 4 ++++=0A=
+ 1 file changed, 4 insertions(+)=0A=
+=0A=
+diff --git a/lib/xmlparse.c b/lib/xmlparse.c=0A=
+index ad8cc44..0e101af 100644=0A=
+--- a/lib/xmlparse.c=0A=
++++ b/lib/xmlparse.c=0A=
+@@ -5481,9 +5481,11 @@ doProlog(XML_Parser parser, const ENCODING *enc, co=
nst char *s, const char *end,=0A=
+       break;=0A=
+     case XML_ROLE_DOCTYPE_INTERNAL_SUBSET:=0A=
+       if (parser->m_startDoctypeDeclHandler) {=0A=
++        beforeHandler(parser);=0A=
+         parser->m_startDoctypeDeclHandler(=0A=
+             parser->m_handlerArg, parser->m_doctypeName, parser->m_doctyp=
eSysid,=0A=
+             parser->m_doctypePubid, 1);=0A=
++        afterHandler(parser);=0A=
+         parser->m_doctypeName =3D NULL;=0A=
+         poolClear(&parser->m_tempPool);=0A=
+         handleDefault =3D XML_FALSE;=0A=
+@@ -5550,9 +5552,11 @@ doProlog(XML_Parser parser, const ENCODING *enc, co=
nst char *s, const char *end,=0A=
+       }=0A=
+ =0A=
+       if (parser->m_doctypeName) {=0A=
++        beforeHandler(parser);=0A=
+         parser->m_startDoctypeDeclHandler(=0A=
+             parser->m_handlerArg, parser->m_doctypeName, parser->m_doctyp=
eSysid,=0A=
+             parser->m_doctypePubid, 0);=0A=
++        afterHandler(parser);=0A=
+         poolClear(&parser->m_tempPool);=0A=
+         handleDefault =3D XML_FALSE;=0A=
+       }=0A=
+-- =0A=
+2.34.1=0A=
+=0A=
diff --git a/meta/recipes-core/expat/expat/CVE-2026-50219-22.patch b/meta/r=
ecipes-core/expat/expat/CVE-2026-50219-22.patch=0A=
new file mode 100644=0A=
index 0000000000..931bc06f1a=0A=
--- /dev/null=0A=
+++ b/meta/recipes-core/expat/expat/CVE-2026-50219-22.patch=0A=
@@ -0,0 +1,48 @@=0A=
+From 355e3aaa79f1b0e6067a8ebbc6fcbac47e98542e Mon Sep 17 00:00:00 2001=0A=
+From: Sebastian Pipping <sebastian@pipping.org>=0A=
+Date: Tue, 26 May 2026 21:39:38 +0200=0A=
+Subject: [PATCH] lib: Register `m_startElementHandler` with handler call d=
epth=0A=
+ tracking=0A=
+=0A=
+(cherry picked from commit 4f9a8f1cc2ed03cd9e23d281a6abac44dc89e8ab)=0A=
+=0A=
+CVE: CVE-2026-50219=0A=
+Upstream-Status: Backport [https://github.com/libexpat/libexpat/pull/1246/=
commits/4f9a8f1cc2ed03cd9e23d281a6abac44dc89e8ab]=0A=
+Signed-off-by: Jakub Szczudlo <jakub.szczudlo@nokia.com>=0A=
+---=0A=
+ lib/xmlparse.c | 8 ++++++--=0A=
+ 1 file changed, 6 insertions(+), 2 deletions(-)=0A=
+=0A=
+diff --git a/lib/xmlparse.c b/lib/xmlparse.c=0A=
+index 0e101af..a222a3f 100644=0A=
+--- a/lib/xmlparse.c=0A=
++++ b/lib/xmlparse.c=0A=
+@@ -3615,10 +3615,12 @@ doContent(XML_Parser parser, int startTagLevel, co=
nst ENCODING *enc,=0A=
+           =3D storeAtts(parser, enc, s, &(tag->name), &(tag->bindings), a=
ccount);=0A=
+       if (result)=0A=
+         return result;=0A=
+-      if (parser->m_startElementHandler)=0A=
++      if (parser->m_startElementHandler) {=0A=
++        beforeHandler(parser);=0A=
+         parser->m_startElementHandler(parser->m_handlerArg, tag->name.str=
,=0A=
+                                       (const XML_Char **)parser->m_atts);=
=0A=
+-      else if (parser->m_defaultHandler)=0A=
++        afterHandler(parser);=0A=
++      } else if (parser->m_defaultHandler)=0A=
+         reportDefault(parser, enc, s, next);=0A=
+       poolClear(&parser->m_tempPool);=0A=
+       break;=0A=
+@@ -3644,8 +3646,10 @@ doContent(XML_Parser parser, int startTagLevel, con=
st ENCODING *enc,=0A=
+       }=0A=
+       poolFinish(&parser->m_tempPool);=0A=
+       if (parser->m_startElementHandler) {=0A=
++        beforeHandler(parser);=0A=
+         parser->m_startElementHandler(parser->m_handlerArg, name.str,=0A=
+                                       (const XML_Char **)parser->m_atts);=
=0A=
++        afterHandler(parser);=0A=
+         noElmHandlers =3D XML_FALSE;=0A=
+       }=0A=
+       if (parser->m_endElementHandler) {=0A=
+-- =0A=
+2.34.1=0A=
+=0A=
diff --git a/meta/recipes-core/expat/expat/CVE-2026-50219-23.patch b/meta/r=
ecipes-core/expat/expat/CVE-2026-50219-23.patch=0A=
new file mode 100644=0A=
index 0000000000..7f883faeb1=0A=
--- /dev/null=0A=
+++ b/meta/recipes-core/expat/expat/CVE-2026-50219-23.patch=0A=
@@ -0,0 +1,36 @@=0A=
+From ac747d83eb8b6d7c71da606a9cb1a65aef50d0c1 Mon Sep 17 00:00:00 2001=0A=
+From: Sebastian Pipping <sebastian@pipping.org>=0A=
+Date: Tue, 26 May 2026 21:40:13 +0200=0A=
+Subject: [PATCH] lib: Register `m_startNamespaceDeclHandler` with handler =
call=0A=
+ depth tracking=0A=
+=0A=
+(cherry picked from commit ddd0238420113c97594083194e517e8bc742700c)=0A=
+=0A=
+CVE: CVE-2026-50219=0A=
+Upstream-Status: Backport [https://github.com/libexpat/libexpat/pull/1246/=
commits/ddd0238420113c97594083194e517e8bc742700c]=0A=
+Signed-off-by: Jakub Szczudlo <jakub.szczudlo@nokia.com>=0A=
+---=0A=
+ lib/xmlparse.c | 5 ++++-=0A=
+ 1 file changed, 4 insertions(+), 1 deletion(-)=0A=
+=0A=
+diff --git a/lib/xmlparse.c b/lib/xmlparse.c=0A=
+index a222a3f..267a198 100644=0A=
+--- a/lib/xmlparse.c=0A=
++++ b/lib/xmlparse.c=0A=
+@@ -4704,9 +4704,12 @@ addBinding(XML_Parser parser, PREFIX *prefix, const=
 ATTRIBUTE_ID *attId,=0A=
+   b->nextTagBinding =3D *bindingsPtr;=0A=
+   *bindingsPtr =3D b;=0A=
+   /* if attId =3D=3D NULL then we are not starting a namespace scope */=
=0A=
+-  if (attId && parser->m_startNamespaceDeclHandler)=0A=
++  if (attId && parser->m_startNamespaceDeclHandler) {=0A=
++    beforeHandler(parser);=0A=
+     parser->m_startNamespaceDeclHandler(parser->m_handlerArg, prefix->nam=
e,=0A=
+                                         prefix->binding ? uri : 0);=0A=
++    afterHandler(parser);=0A=
++  }=0A=
+   return XML_ERROR_NONE;=0A=
+ }=0A=
+ =0A=
+-- =0A=
+2.34.1=0A=
+=0A=
diff --git a/meta/recipes-core/expat/expat/CVE-2026-50219-24.patch b/meta/r=
ecipes-core/expat/expat/CVE-2026-50219-24.patch=0A=
new file mode 100644=0A=
index 0000000000..9f4e938218=0A=
--- /dev/null=0A=
+++ b/meta/recipes-core/expat/expat/CVE-2026-50219-24.patch=0A=
@@ -0,0 +1,33 @@=0A=
+From 36ada7e4ef06aa18765557240fb30a1a669d438a Mon Sep 17 00:00:00 2001=0A=
+From: Sebastian Pipping <sebastian@pipping.org>=0A=
+Date: Sat, 30 May 2026 00:46:47 +0200=0A=
+Subject: [PATCH] lib: Register `m_unknownEncodingHandler` with handler cal=
l=0A=
+ depth tracking=0A=
+=0A=
+(cherry picked from commit f66d83c9aecaa802174f95a1348a89f56e3b9441)=0A=
+=0A=
+CVE: CVE-2026-50219=0A=
+Upstream-Status: Backport [https://github.com/libexpat/libexpat/pull/1246/=
commits/f66d83c9aecaa802174f95a1348a89f56e3b9441]=0A=
+Signed-off-by: Jakub Szczudlo <jakub.szczudlo@nokia.com>=0A=
+---=0A=
+ lib/xmlparse.c | 2 ++=0A=
+ 1 file changed, 2 insertions(+)=0A=
+=0A=
+diff --git a/lib/xmlparse.c b/lib/xmlparse.c=0A=
+index 267a198..c76f8ea 100644=0A=
+--- a/lib/xmlparse.c=0A=
++++ b/lib/xmlparse.c=0A=
+@@ -5109,8 +5109,10 @@ handleUnknownEncoding(XML_Parser parser, const XML_=
Char *encodingName) {=0A=
+     info.convert =3D NULL;=0A=
+     info.data =3D NULL;=0A=
+     info.release =3D NULL;=0A=
++    beforeHandler(parser);=0A=
+     const int status =3D parser->m_unknownEncodingHandler(=0A=
+         parser->m_unknownEncodingHandlerData, encodingName, &info);=0A=
++    afterHandler(parser);=0A=
+     if (status) {=0A=
+       ENCODING *enc;=0A=
+       parser->m_unknownEncodingMem =3D MALLOC(parser, XmlSizeOfUnknownEnc=
oding());=0A=
+-- =0A=
+2.34.1=0A=
+=0A=
diff --git a/meta/recipes-core/expat/expat/CVE-2026-50219-25.patch b/meta/r=
ecipes-core/expat/expat/CVE-2026-50219-25.patch=0A=
new file mode 100644=0A=
index 0000000000..ab8a94c02c=0A=
--- /dev/null=0A=
+++ b/meta/recipes-core/expat/expat/CVE-2026-50219-25.patch=0A=
@@ -0,0 +1,35 @@=0A=
+From 002404e9805e4e685ca4c473a9c057a93c5b50e2 Mon Sep 17 00:00:00 2001=0A=
+From: Sebastian Pipping <sebastian@pipping.org>=0A=
+Date: Tue, 26 May 2026 21:41:00 +0200=0A=
+Subject: [PATCH] lib: Register `m_unparsedEntityDeclHandler` with handler =
call=0A=
+ depth tracking=0A=
+=0A=
+(cherry picked from commit 6e7c5af75a743c609fdb35627554cc7e940e6593)=0A=
+=0A=
+CVE: CVE-2026-50219=0A=
+Upstream-Status: Backport [https://github.com/libexpat/libexpat/pull/1246/=
commits/6e7c5af75a743c609fdb35627554cc7e940e6593]=0A=
+Signed-off-by: Jakub Szczudlo <jakub.szczudlo@nokia.com>=0A=
+---=0A=
+ lib/xmlparse.c | 2 ++=0A=
+ 1 file changed, 2 insertions(+)=0A=
+=0A=
+diff --git a/lib/xmlparse.c b/lib/xmlparse.c=0A=
+index c76f8ea..aebcda3 100644=0A=
+--- a/lib/xmlparse.c=0A=
++++ b/lib/xmlparse.c=0A=
+@@ -5946,10 +5946,12 @@ doProlog(XML_Parser parser, const ENCODING *enc, c=
onst char *s, const char *end,=0A=
+         poolFinish(&dtd->pool);=0A=
+         if (parser->m_unparsedEntityDeclHandler) {=0A=
+           *eventEndPP =3D s;=0A=
++          beforeHandler(parser);=0A=
+           parser->m_unparsedEntityDeclHandler(=0A=
+               parser->m_handlerArg, parser->m_declEntity->name,=0A=
+               parser->m_declEntity->base, parser->m_declEntity->systemId,=
=0A=
+               parser->m_declEntity->publicId, parser->m_declEntity->notat=
ion);=0A=
++          afterHandler(parser);=0A=
+           handleDefault =3D XML_FALSE;=0A=
+         } else if (parser->m_entityDeclHandler) {=0A=
+           *eventEndPP =3D s;=0A=
+-- =0A=
+2.34.1=0A=
+=0A=
diff --git a/meta/recipes-core/expat/expat/CVE-2026-50219-26.patch b/meta/r=
ecipes-core/expat/expat/CVE-2026-50219-26.patch=0A=
new file mode 100644=0A=
index 0000000000..a40a613eba=0A=
--- /dev/null=0A=
+++ b/meta/recipes-core/expat/expat/CVE-2026-50219-26.patch=0A=
@@ -0,0 +1,33 @@=0A=
+From 646eb417403a714ecd962f85a2d3c4b198f9b44b Mon Sep 17 00:00:00 2001=0A=
+From: Sebastian Pipping <sebastian@pipping.org>=0A=
+Date: Tue, 26 May 2026 21:41:38 +0200=0A=
+Subject: [PATCH] lib: Register `m_xmlDeclHandler` with handler call depth=
=0A=
+ tracking=0A=
+=0A=
+(cherry picked from commit 91484ffb98ec138df79265e431a55823bc80c6c4)=0A=
+=0A=
+CVE: CVE-2026-50219=0A=
+Upstream-Status: Backport [https://github.com/libexpat/libexpat/pull/1246/=
commits/91484ffb98ec138df79265e431a55823bc80c6c4]=0A=
+Signed-off-by: Jakub Szczudlo <jakub.szczudlo@nokia.com>=0A=
+---=0A=
+ lib/xmlparse.c | 2 ++=0A=
+ 1 file changed, 2 insertions(+)=0A=
+=0A=
+diff --git a/lib/xmlparse.c b/lib/xmlparse.c=0A=
+index aebcda3..edaf5f8 100644=0A=
+--- a/lib/xmlparse.c=0A=
++++ b/lib/xmlparse.c=0A=
+@@ -5058,8 +5058,10 @@ processXmlDecl(XML_Parser parser, int isGeneralText=
Entity, const char *s,=0A=
+       if (! storedversion)=0A=
+         return XML_ERROR_NO_MEMORY;=0A=
+     }=0A=
++    beforeHandler(parser);=0A=
+     parser->m_xmlDeclHandler(parser->m_handlerArg, storedversion, storedE=
ncName,=0A=
+                              standalone);=0A=
++    afterHandler(parser);=0A=
+   } else if (parser->m_defaultHandler)=0A=
+     reportDefault(parser, parser->m_encoding, s, next);=0A=
+   if (parser->m_protocolEncodingName =3D=3D NULL) {=0A=
+-- =0A=
+2.34.1=0A=
+=0A=
diff --git a/meta/recipes-core/expat/expat/CVE-2026-50219-27.patch b/meta/r=
ecipes-core/expat/expat/CVE-2026-50219-27.patch=0A=
new file mode 100644=0A=
index 0000000000..e3eff545cc=0A=
--- /dev/null=0A=
+++ b/meta/recipes-core/expat/expat/CVE-2026-50219-27.patch=0A=
@@ -0,0 +1,30 @@=0A=
+From 640fa889d24387ba5ad4e44d89a6440b927f6f45 Mon Sep 17 00:00:00 2001=0A=
+From: Sebastian Pipping <sebastian@pipping.org>=0A=
+Date: Tue, 26 May 2026 15:35:27 +0200=0A=
+Subject: [PATCH] lib: Protect `XML_GetBuffer` from being called from a han=
dler=0A=
+=0A=
+(cherry picked from commit 5d90d1aebfe606af2550e92983cbe121d7eda032)=0A=
+=0A=
+CVE: CVE-2026-50219=0A=
+Upstream-Status: Backport [https://github.com/libexpat/libexpat/pull/1246/=
commits/5d90d1aebfe606af2550e92983cbe121d7eda032]=0A=
+Signed-off-by: Jakub Szczudlo <jakub.szczudlo@nokia.com>=0A=
+---=0A=
+ lib/xmlparse.c | 2 +-=0A=
+ 1 file changed, 1 insertion(+), 1 deletion(-)=0A=
+=0A=
+diff --git a/lib/xmlparse.c b/lib/xmlparse.c=0A=
+index edaf5f8..d729fc7 100644=0A=
+--- a/lib/xmlparse.c=0A=
++++ b/lib/xmlparse.c=0A=
+@@ -2599,7 +2599,7 @@ XML_ParseBuffer(XML_Parser parser, int len, int isFi=
nal) {=0A=
+ =0A=
+ void *XMLCALL=0A=
+ XML_GetBuffer(XML_Parser parser, int len) {=0A=
+-  if (parser =3D=3D NULL)=0A=
++  if ((parser =3D=3D NULL) || isCalledFromInsideHandler(parser))=0A=
+     return NULL;=0A=
+   if (len < 0) {=0A=
+     parser->m_errorCode =3D XML_ERROR_NO_MEMORY;=0A=
+-- =0A=
+2.34.1=0A=
+=0A=
diff --git a/meta/recipes-core/expat/expat/CVE-2026-50219-28.patch b/meta/r=
ecipes-core/expat/expat/CVE-2026-50219-28.patch=0A=
new file mode 100644=0A=
index 0000000000..1a923a111c=0A=
--- /dev/null=0A=
+++ b/meta/recipes-core/expat/expat/CVE-2026-50219-28.patch=0A=
@@ -0,0 +1,30 @@=0A=
+From b6281b0d445029cad63a2eeb0fda9c6aaa8ad690 Mon Sep 17 00:00:00 2001=0A=
+From: Sebastian Pipping <sebastian@pipping.org>=0A=
+Date: Tue, 26 May 2026 15:32:38 +0200=0A=
+Subject: [PATCH] lib: Protect `XML_Parse` from being called from a handler=
=0A=
+=0A=
+(cherry picked from commit b59f1865e6c0c0ab2c1623b9dfd53aa6fb85bb96)=0A=
+=0A=
+CVE: CVE-2026-50219=0A=
+Upstream-Status: Backport [https://github.com/libexpat/libexpat/pull/1246/=
commits/b59f1865e6c0c0ab2c1623b9dfd53aa6fb85bb96]=0A=
+Signed-off-by: Jakub Szczudlo <jakub.szczudlo@nokia.com>=0A=
+---=0A=
+ lib/xmlparse.c | 2 ++=0A=
+ 1 file changed, 2 insertions(+)=0A=
+=0A=
+diff --git a/lib/xmlparse.c b/lib/xmlparse.c=0A=
+index d729fc7..f69e32c 100644=0A=
+--- a/lib/xmlparse.c=0A=
++++ b/lib/xmlparse.c=0A=
+@@ -2414,6 +2414,8 @@ XML_Parse(XML_Parser parser, const char *s, int len,=
 int isFinal) {=0A=
+       parser->m_errorCode =3D XML_ERROR_INVALID_ARGUMENT;=0A=
+     return XML_STATUS_ERROR;=0A=
+   }=0A=
++  if (isCalledFromInsideHandler(parser))=0A=
++    return XML_STATUS_ERROR;=0A=
+   switch (parser->m_parsingStatus.parsing) {=0A=
+   case XML_SUSPENDED:=0A=
+     parser->m_errorCode =3D XML_ERROR_SUSPENDED;=0A=
+-- =0A=
+2.34.1=0A=
+=0A=
diff --git a/meta/recipes-core/expat/expat/CVE-2026-50219-29.patch b/meta/r=
ecipes-core/expat/expat/CVE-2026-50219-29.patch=0A=
new file mode 100644=0A=
index 0000000000..02e172bfa9=0A=
--- /dev/null=0A=
+++ b/meta/recipes-core/expat/expat/CVE-2026-50219-29.patch=0A=
@@ -0,0 +1,31 @@=0A=
+From 3ea9955feaa8db08300c83de24ab8001aef19077 Mon Sep 17 00:00:00 2001=0A=
+From: Sebastian Pipping <sebastian@pipping.org>=0A=
+Date: Tue, 26 May 2026 15:33:44 +0200=0A=
+Subject: [PATCH] lib: Protect `XML_ParseBuffer` from being called from a=
=0A=
+ handler=0A=
+=0A=
+(cherry picked from commit ef3267d5f8157862e33d87c45c6fe82ac26e557f)=0A=
+=0A=
+CVE: CVE-2026-50219=0A=
+Upstream-Status: Backport [https://github.com/libexpat/libexpat/pull/1246/=
commits/ef3267d5f8157862e33d87c45c6fe82ac26e557f]=0A=
+Signed-off-by: Jakub Szczudlo <jakub.szczudlo@nokia.com>=0A=
+---=0A=
+ lib/xmlparse.c | 2 +-=0A=
+ 1 file changed, 1 insertion(+), 1 deletion(-)=0A=
+=0A=
+diff --git a/lib/xmlparse.c b/lib/xmlparse.c=0A=
+index f69e32c..87c20bf 100644=0A=
+--- a/lib/xmlparse.c=0A=
++++ b/lib/xmlparse.c=0A=
+@@ -2525,7 +2525,7 @@ XML_ParseBuffer(XML_Parser parser, int len, int isFi=
nal) {=0A=
+   const char *start;=0A=
+   enum XML_Status result =3D XML_STATUS_OK;=0A=
+ =0A=
+-  if (parser =3D=3D NULL)=0A=
++  if ((parser =3D=3D NULL) || isCalledFromInsideHandler(parser))=0A=
+     return XML_STATUS_ERROR;=0A=
+ =0A=
+   if (len < 0) {=0A=
+-- =0A=
+2.34.1=0A=
+=0A=
diff --git a/meta/recipes-core/expat/expat/CVE-2026-50219-30.patch b/meta/r=
ecipes-core/expat/expat/CVE-2026-50219-30.patch=0A=
new file mode 100644=0A=
index 0000000000..2b7402ae5c=0A=
--- /dev/null=0A=
+++ b/meta/recipes-core/expat/expat/CVE-2026-50219-30.patch=0A=
@@ -0,0 +1,31 @@=0A=
+From 69fc1130413313ecd8728573a254bd26afebd632 Mon Sep 17 00:00:00 2001=0A=
+From: Sebastian Pipping <sebastian@pipping.org>=0A=
+Date: Tue, 26 May 2026 15:21:28 +0200=0A=
+Subject: [PATCH] lib: Protect `XML_ParserFree` from being called from a=0A=
+ handler=0A=
+=0A=
+(cherry picked from commit 827fbddcaaa8ba2171ef76a3223d6f403388635c)=0A=
+=0A=
+CVE: CVE-2026-50219=0A=
+Upstream-Status: Backport [https://github.com/libexpat/libexpat/pull/1246/=
commits/827fbddcaaa8ba2171ef76a3223d6f403388635c]=0A=
+Signed-off-by: Jakub Szczudlo <jakub.szczudlo@nokia.com>=0A=
+---=0A=
+ lib/xmlparse.c | 2 +-=0A=
+ 1 file changed, 1 insertion(+), 1 deletion(-)=0A=
+=0A=
+diff --git a/lib/xmlparse.c b/lib/xmlparse.c=0A=
+index 87c20bf..bfa3217 100644=0A=
+--- a/lib/xmlparse.c=0A=
++++ b/lib/xmlparse.c=0A=
+@@ -1958,7 +1958,7 @@ void XMLCALL=0A=
+ XML_ParserFree(XML_Parser parser) {=0A=
+   TAG *tagList;=0A=
+   OPEN_INTERNAL_ENTITY *entityList;=0A=
+-  if (parser =3D=3D NULL)=0A=
++  if ((parser =3D=3D NULL) || isCalledFromInsideHandler(parser))=0A=
+     return;=0A=
+   /* free m_tagStack and m_freeTagList */=0A=
+   tagList =3D parser->m_tagStack;=0A=
+-- =0A=
+2.34.1=0A=
+=0A=
diff --git a/meta/recipes-core/expat/expat/CVE-2026-50219-31.patch b/meta/r=
ecipes-core/expat/expat/CVE-2026-50219-31.patch=0A=
new file mode 100644=0A=
index 0000000000..1fc8877a3e=0A=
--- /dev/null=0A=
+++ b/meta/recipes-core/expat/expat/CVE-2026-50219-31.patch=0A=
@@ -0,0 +1,31 @@=0A=
+From e7ea42e0111e697d2de64a94c8fd6bca9d2c99c9 Mon Sep 17 00:00:00 2001=0A=
+From: Sebastian Pipping <sebastian@pipping.org>=0A=
+Date: Tue, 26 May 2026 15:22:41 +0200=0A=
+Subject: [PATCH] lib: Protect `XML_ParserReset` from being called from a=
=0A=
+ handler=0A=
+=0A=
+(cherry picked from commit 34bc7e080a1b432ad9d6879a6c718f2d6f12fa22)=0A=
+=0A=
+CVE: CVE-2026-50219=0A=
+Upstream-Status: Backport [https://github.com/libexpat/libexpat/pull/1246/=
commits/34bc7e080a1b432ad9d6879a6c718f2d6f12fa22]=0A=
+Signed-off-by: Jakub Szczudlo <jakub.szczudlo@nokia.com>=0A=
+---=0A=
+ lib/xmlparse.c | 2 +-=0A=
+ 1 file changed, 1 insertion(+), 1 deletion(-)=0A=
+=0A=
+diff --git a/lib/xmlparse.c b/lib/xmlparse.c=0A=
+index bfa3217..cc1d550 100644=0A=
+--- a/lib/xmlparse.c=0A=
++++ b/lib/xmlparse.c=0A=
+@@ -1671,7 +1671,7 @@ XML_ParserReset(XML_Parser parser, const XML_Char *e=
ncodingName) {=0A=
+   TAG *tStk;=0A=
+   OPEN_INTERNAL_ENTITY *openEntityList;=0A=
+ =0A=
+-  if (parser =3D=3D NULL)=0A=
++  if ((parser =3D=3D NULL) || isCalledFromInsideHandler(parser))=0A=
+     return XML_FALSE;=0A=
+ =0A=
+   if (parser->m_parentParser)=0A=
+-- =0A=
+2.34.1=0A=
+=0A=
diff --git a/meta/recipes-core/expat/expat/CVE-2026-50219-32.patch b/meta/r=
ecipes-core/expat/expat/CVE-2026-50219-32.patch=0A=
new file mode 100644=0A=
index 0000000000..30a73f9bf5=0A=
--- /dev/null=0A=
+++ b/meta/recipes-core/expat/expat/CVE-2026-50219-32.patch=0A=
@@ -0,0 +1,100 @@=0A=
+From 8683ba1631c0467f78f512b16a8dfd1ea9636538 Mon Sep 17 00:00:00 2001=0A=
+From: Sebastian Pipping <sebastian@pipping.org>=0A=
+Date: Sun, 31 May 2026 13:37:01 +0200=0A=
+Subject: [PATCH] tests: Cover calls forbidden from handlers=0A=
+=0A=
+(cherry picked from commit 2e16f4c98f1f28bb9da36108b60c181d77752acb)=0A=
+=0A=
+Add an explicit cast for compatibility with Expat's C++ test build, which=
=0A=
+includes handlers.c from handlers_cxx.cpp.=0A=
+=0A=
+CVE: CVE-2026-50219=0A=
+Upstream-Status: Backport [https://github.com/libexpat/libexpat/pull/1246/=
commits/2e16f4c98f1f28bb9da36108b60c181d77752acb]=0A=
+Signed-off-by: Jakub Szczudlo <jakub.szczudlo@nokia.com>=0A=
+---=0A=
+ tests/handlers.c   | 24 ++++++++++++++++++++++++=0A=
+ tests/handlers.h   |  4 ++++=0A=
+ tests/misc_tests.c | 15 +++++++++++++++=0A=
+ 3 files changed, 43 insertions(+)=0A=
+=0A=
+diff --git a/tests/handlers.c b/tests/handlers.c=0A=
+index 8cda3a8..c7d6578 100644=0A=
+--- a/tests/handlers.c=0A=
++++ b/tests/handlers.c=0A=
+@@ -1991,3 +1991,27 @@ accumulate_and_suspend_comment_handler(void *userDa=
ta, const XML_Char *data) {=0A=
+   accumulate_comment(parserPlusStorage->storage, data);=0A=
+   XML_StopParser(parserPlusStorage->parser, XML_TRUE);=0A=
+ }=0A=
++=0A=
++void XMLCALL=0A=
++forbidden_calls_character_handler(void *userData, const XML_Char *s, int =
len) {=0A=
++  UNUSED_P(s);=0A=
++  UNUSED_P(len);=0A=
++  XML_Parser parser =3D (XML_Parser)userData;=0A=
++=0A=
++  assert_true(parser !=3D NULL); // self-test=0A=
++=0A=
++  assert_true(XML_GetBuffer(parser, 123) =3D=3D NULL); // i.e. rejected=
=0A=
++=0A=
++  assert_true(XML_Parse(parser, "", 0, /*isFinal=3D*/XML_FALSE)=0A=
++              =3D=3D XML_STATUS_ERROR); // i.e. rejected=0A=
++=0A=
++  assert_true(XML_ParseBuffer(parser, 0, /*isFinal=3D*/XML_FALSE)=0A=
++              =3D=3D XML_STATUS_ERROR); // i.e. rejected=0A=
++=0A=
++  XML_ParserFree(parser); // rejected=0A=
++=0A=
++  assert_true(XML_ParserReset(parser, /*encodingName=3D*/NULL)=0A=
++              =3D=3D XML_FALSE); // i.e. rejected=0A=
++=0A=
++  assert_true(XML_GetErrorCode(parser) =3D=3D XML_ERROR_NONE);=0A=
++}=0A=
+diff --git a/tests/handlers.h b/tests/handlers.h=0A=
+index 27a53f2..de28392 100644=0A=
+--- a/tests/handlers.h=0A=
++++ b/tests/handlers.h=0A=
+@@ -612,6 +612,10 @@ typedef struct {=0A=
+ extern void XMLCALL=0A=
+ accumulate_and_suspend_comment_handler(void *userData, const XML_Char *da=
ta);=0A=
+ =0A=
++extern void XMLCALL forbidden_calls_character_handler(void *userData,=0A=
++                                                      const XML_Char *s,=
=0A=
++                                                      int len);=0A=
++=0A=
+ #endif /* XML_HANDLERS_H */=0A=
+ =0A=
+ #ifdef __cplusplus=0A=
+diff --git a/tests/misc_tests.c b/tests/misc_tests.c=0A=
+index 1c508bd..b9053fe 100644=0A=
+--- a/tests/misc_tests.c=0A=
++++ b/tests/misc_tests.c=0A=
+@@ -801,6 +801,20 @@ START_TEST(test_misc_no_infinite_loop_issue_1161) {=
=0A=
+ }=0A=
+ END_TEST=0A=
+ =0A=
++START_TEST(test_misc_calls_forbidden_from_handlers) {=0A=
++  const char *const doc =3D "<doc>Hello world!</doc>";=0A=
++=0A=
++  XML_Parser parser =3D XML_ParserCreate(NULL);=0A=
++  XML_UseParserAsHandlerArg(parser);=0A=
++  XML_SetCharacterDataHandler(parser, forbidden_calls_character_handler);=
=0A=
++=0A=
++  assert_true(XML_Parse(parser, doc, (int)strlen(doc), /*isFinal=3D*/XML_=
TRUE)=0A=
++              =3D=3D XML_STATUS_OK);=0A=
++=0A=
++  XML_ParserFree(parser);=0A=
++}=0A=
++END_TEST=0A=
++=0A=
+ void=0A=
+ make_miscellaneous_test_case(Suite *s) {=0A=
+   TCase *tc_misc =3D tcase_create("miscellaneous tests");=0A=
+@@ -832,4 +846,5 @@ make_miscellaneous_test_case(Suite *s) {=0A=
+   tcase_add_test(tc_misc, test_misc_sync_entity_tolerated);=0A=
+   tcase_add_test(tc_misc, test_misc_async_entity_rejected);=0A=
+   tcase_add_test(tc_misc, test_misc_no_infinite_loop_issue_1161);=0A=
++  tcase_add_test(tc_misc, test_misc_calls_forbidden_from_handlers);=0A=
+ }=0A=
+-- =0A=
+2.34.1=0A=
+=0A=
diff --git a/meta/recipes-core/expat/expat_2.7.5.bb b/meta/recipes-core/exp=
at/expat_2.7.5.bb=0A=
index 890ee5b7d3..7f00c6f90b 100644=0A=
--- a/meta/recipes-core/expat/expat_2.7.5.bb=0A=
+++ b/meta/recipes-core/expat/expat_2.7.5.bb=0A=
@@ -36,6 +36,38 @@ SRC_URI =3D "${GITHUB_BASE_URI}/download/R_${VERSION_TAG=
}/expat-${PV}.tar.bz2  \=0A=
            file://CVE-2026-56132_p3.patch;striplevel=3D2 \=0A=
            file://CVE-2026-56132_p4.patch;striplevel=3D2 \=0A=
            file://CVE-2026-56132_p5.patch;striplevel=3D2 \=0A=
+           file://CVE-2026-50219-01.patch \=0A=
+           file://CVE-2026-50219-02.patch \=0A=
+           file://CVE-2026-50219-03.patch \=0A=
+           file://CVE-2026-50219-04.patch \=0A=
+           file://CVE-2026-50219-05.patch \=0A=
+           file://CVE-2026-50219-06.patch \=0A=
+           file://CVE-2026-50219-07.patch \=0A=
+           file://CVE-2026-50219-08.patch \=0A=
+           file://CVE-2026-50219-09.patch \=0A=
+           file://CVE-2026-50219-10.patch \=0A=
+           file://CVE-2026-50219-11.patch \=0A=
+           file://CVE-2026-50219-12.patch \=0A=
+           file://CVE-2026-50219-13.patch \=0A=
+           file://CVE-2026-50219-14.patch \=0A=
+           file://CVE-2026-50219-15.patch \=0A=
+           file://CVE-2026-50219-16.patch \=0A=
+           file://CVE-2026-50219-17.patch \=0A=
+           file://CVE-2026-50219-18.patch \=0A=
+           file://CVE-2026-50219-19.patch \=0A=
+           file://CVE-2026-50219-20.patch \=0A=
+           file://CVE-2026-50219-21.patch \=0A=
+           file://CVE-2026-50219-22.patch \=0A=
+           file://CVE-2026-50219-23.patch \=0A=
+           file://CVE-2026-50219-24.patch \=0A=
+           file://CVE-2026-50219-25.patch \=0A=
+           file://CVE-2026-50219-26.patch \=0A=
+           file://CVE-2026-50219-27.patch \=0A=
+           file://CVE-2026-50219-28.patch \=0A=
+           file://CVE-2026-50219-29.patch \=0A=
+           file://CVE-2026-50219-30.patch \=0A=
+           file://CVE-2026-50219-31.patch \=0A=
+           file://CVE-2026-50219-32.patch \=0A=
            "=0A=
 =0A=
 GITHUB_BASE_URI =3D "https://github.com/libexpat/libexpat/releases/"=0A=
-- =0A=
2.34.1=0A=
=0A=

