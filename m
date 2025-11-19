Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F770CF58CA
	for <webhook@archiver.kernel.org>; Wed, 19 Nov 2025 18:55:00 +0000 (UTC)
Received: from AM0PR02CU008.outbound.protection.outlook.com (AM0PR02CU008.outbound.protection.outlook.com [52.101.72.6])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6063.1763556480720280595
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Nov 2025 04:48:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=xbSFey9U;
 spf=temperror, err=temporary DNS error (domain: siemens.com, ip: 52.101.72.6, mailfrom: stefano.tondo.ext@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rYc9HGlrs44o6p/rLnU4jdyBZMaLRoi7vl1Mx3IFHWUY6cqQQyTChQMgsBfvsn/08gcCRaaldhjnO5syw6wIM5YvtCm7+kA/GpQfqqyOitS/V7YSkF9r1Pu1GpfqmnAdL+K5vMoa83thGIAGxu5aRoc4QnK6h+/T8MHlqgKz34a6y0cySbfjvIevCkWXofu6abfbVnqcxN4WLtIRlefGiYYdOUPapliq7OO8iGYn/tBiEqqSdXFjj619GojxO/WE6fsdBqofYibKX/jOY8cM/LpvfUo5fTmsh/dTGUR7zx+dk6yQxSbLM51tXniQ8ZxIEzCj/V+p+A1iOFvgBcPVLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bS5vcgSTLkn+RGbc1v8cfxiN/kAaQRLZZuQYQUuTuws=;
 b=D7x/f5wSbqoBeHOK4tCaDeKZo/YnFCoId8/HhtZOkLjmfHbChEKUhsB78SKFDalV/rY27Zo01ofgnuE6MeyR7nSVVNY2F56QS0ZJabZp2PD05t4IpELIMacUQ5j13WOJ5dPabQOBZHtWQVac5bRnlMzc0SZCteN7soSvyS48cEYIRguS+h4/J9eWQtKPOy4LQr5w/ly0eJLLzsfswRDDwB9fTZBOEoAkAsVhkjo+IVdkZny0Dc1SWtXbpWGVTZYHQclApZ0jbNF/mnk+JUamCMO2PtBQe1NzzY7v0sCjGGfGn28YVj6zXw41qilQPfKq4TXeEW2BqJAj3W3OCkjPsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bS5vcgSTLkn+RGbc1v8cfxiN/kAaQRLZZuQYQUuTuws=;
 b=xbSFey9UE2DMhyPHq97WuEBzX52mQbgA6eN1/qr4HKK9H3teCAE/i82FtI9y/p85OJonAcbqNqG8aT/GoVhDYnMJ/JPF2UZ8PyyJ1NLdkFbHh6++8RvAPFooUX2llTBR8h0vhFWf2whh72J51frbrItBngtjGcgj+FLDfoCXtha10cEaWZX5cMT4olWdjY0gwiyahCVz7Q8JYMRuRaRH6K8WVwbJ2aFUt0Jh4Ec4blZAD/HqlwRZMpsojCljxuO4sPAuEaduuO4QXuxokGuC6hW++qj++LUU8T/QqAEci/z2NGSkIn0EdzTZ3olE5fGrks+jp7Nx4CQxri0xUY64bQ==
Received: from AS4PR10MB5150.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:4c1::5)
 by DB8PR10MB3193.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:114::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Wed, 19 Nov
 2025 12:33:19 +0000
Received: from AS4PR10MB5150.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::b0d0:b5bf:18a1:2067]) by AS4PR10MB5150.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::b0d0:b5bf:18a1:2067%6]) with mapi id 15.20.9343.009; Wed, 19 Nov 2025
 12:33:19 +0000
From: "Tondo, Stefano" <stefano.tondo.ext@siemens.com>
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>, Stefano Tondo
	<stondo@gmail.com>, "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: "Marko, Peter" <Peter.Marko@siemens.com>, "Freihofer, Adrian"
	<adrian.freihofer@siemens.com>
Subject: Re: [OE-core][PATCH v2] spdx30_tasks: Fix SPDX_CUSTOM_ANNOTATION_VARS implementation
Thread-Topic: [OE-core][PATCH v2] spdx30_tasks: Fix
 SPDX_CUSTOM_ANNOTATION_VARS implementation
Thread-Index: AQHcV8LNV5TnCxqtskOanNnw2WGsdrT5uUWAgAAO0Nk=
Date: Wed, 19 Nov 2025 12:33:19 +0000
Message-ID: 
 <AS4PR10MB51507A3160F4AD577CD35ED4ACD7A@AS4PR10MB5150.EURPRD10.PROD.OUTLOOK.COM>
References: <20251117130451.1711036-1-stondo@gmail.com>
 <DECJZ8GOEY2L.1LKIW4KZNILBR@bootlin.com>
In-Reply-To: <DECJZ8GOEY2L.1LKIW4KZNILBR@bootlin.com>
Accept-Language: en-US, de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=True;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2025-11-19T12:33:19.054Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=C1
 -
 Restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=1;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS4PR10MB5150:EE_|DB8PR10MB3193:EE_
x-ms-office365-filtering-correlation-id: 4d15f27f-b00a-4b78-8b69-08de2767d237
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|39142699007|31052699007|1800799024|376014|366016|8096899003|13003099007|38070700021|7053199007;
x-microsoft-antispam-message-info: 
 =?iso-8859-1?Q?EbYhAOufJVo8MAVDoxmkH+xq4g7m+Wh8AwCQsvB00D7uFmocssQE1w4tzk?=
 =?iso-8859-1?Q?XcjEmpaqCpqSbO06dg8CHOPWp0tne0I5TmXwdfvbVvYnIvj0s61wkfp9E7?=
 =?iso-8859-1?Q?Jp95Z5kd5PmMh9giAsuatqUeVsSR8uMQ+gz9If8SBih0Y9pmyHyC094mQH?=
 =?iso-8859-1?Q?FIhV+IMv8zhPqJRwNY30I5sdUi2p7ciq2jhGqpdzB0SxjF5EB0r7myCcCg?=
 =?iso-8859-1?Q?InXEOzoALrZ95cskOKlt6cIY/R3SPkyeQ0XCYBLIe5u3RAzee0gP0X4dvh?=
 =?iso-8859-1?Q?J4l2is7sGfUZZnxeCuqxyLdNx5TuXzyG8L7yVBhhUjeICe8Y4ZXcajRHuu?=
 =?iso-8859-1?Q?RMu28HmBJdJ1hGBCG6sbfktoCkgq3hOCFl2XQIkCIgu7qA36/RUtvQXTIy?=
 =?iso-8859-1?Q?ERuClxU2xUS6f7e7+dDaKhSliGeNCwyvXypmG9YQe2KQxHigqsIhH2sQOl?=
 =?iso-8859-1?Q?c8y9SHAPFNLw6HjRMoLqymD8rRknmKBtruJJ3lsr0kVTwR2yeFjLji3j7k?=
 =?iso-8859-1?Q?JfJUgssCE1zrGbu84uZzpOXJA8bOtbhpvLj8UE/1jurex2cyDzddJTScrq?=
 =?iso-8859-1?Q?pcfdfxJYXoAe4Uxmx47pA6fq/m5hPJh9oXjHUuiR5aBxNZ1938JqLY+r4a?=
 =?iso-8859-1?Q?eW/TxmFAlkal8JUOfaPQydrepfgQu+m815eaBJeoVrXpovMobq4WnEZMoE?=
 =?iso-8859-1?Q?/p178qdZzI2ou3pub8aDTwUM+JaIyxR94yUNaZCaJzvwpekj+eZNs2F9j/?=
 =?iso-8859-1?Q?d0JwNMqXKvga2vdrW8g4dTh/DAMnHwmyTQLmbNxTw/EZEJ6zvj9SB6zhOy?=
 =?iso-8859-1?Q?DcSPp3TB96M0l5p4sk0/xoB034Gw3byJvEmKHA0qwlRvBx0rBB/7llEjhz?=
 =?iso-8859-1?Q?XDmBWnnPNfTr/bcQpYJDoH5rtonndjV045OQSyrZbNPOtnSte8HSEYU632?=
 =?iso-8859-1?Q?zFGfdYeCekjV+MdHAadjQoRsvu24xV8tL+44gKh/3HNEGC1cWXaTaJsh9K?=
 =?iso-8859-1?Q?cAU4Z2TQ0UOO+SFZziz5xo59naZzyTMVZ+uBd3PVTd3LlkEHpeeuX7VCFX?=
 =?iso-8859-1?Q?u1yJKwf7INtvRN03APFnUaWopQXfIdcMXvNah+sDMhI4PksHGB2OtpMOsK?=
 =?iso-8859-1?Q?LRNDmZFePyo6I4pxr06mt51yflHkCrsqPB5r7o/yDC8Ro0JGgcGsHSNtiQ?=
 =?iso-8859-1?Q?Ml59MYeXrzeeQSonn4n4dn1JdaIfE+UTqC9Di1YlKcUI9b00Mhp+osFm+1?=
 =?iso-8859-1?Q?vQufO2Cyrv9IBxdA9tHEGXhkjMl2nI47AjXN1HJ55sj3u5TnOt0/f7Ho15?=
 =?iso-8859-1?Q?CROZ1ixv6dDobOlxeb6cYpmqE+O/jk8v0h4BPlPOgfupK2eIofEqpirazf?=
 =?iso-8859-1?Q?SwMq+A4VbFdT6GSVS4KXDGJXOw+lmvgGy7eB/qW5+k0j01MPT3eh9P4UiH?=
 =?iso-8859-1?Q?EgInchC03PQ8o6DrtMh9YErjPMRf6MHbu3y2hpiOVhFZ5heFXgHHjGvGj1?=
 =?iso-8859-1?Q?TZ+KxFY/JY0ZQnwx+RBf8H?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR10MB5150.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(39142699007)(31052699007)(1800799024)(376014)(366016)(8096899003)(13003099007)(38070700021)(7053199007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?VO3MBjfQN+eLAV+IGGkYFhqgr7Q8NZDUw3PhQUVKg3m09dyfytaWzkVhcB?=
 =?iso-8859-1?Q?THGe/W7GyPbmugYBi1qU1X70uKuZzBjDonFEyUWLcySsCLW4aLbIavppKR?=
 =?iso-8859-1?Q?Zlb7wwd6aB4ve+/zcRW1QUiupajzUamMwiJjU4Jr5xCKOMvAUjSOWA2nwo?=
 =?iso-8859-1?Q?N0rHnaOjPg6sJ+BNAK7lpyUgOi+24kvwBCALr7dsAn+SdpZshaVAhBGJg3?=
 =?iso-8859-1?Q?G5xhSI5RuhYCnIKYK8aRG5dN+/ffejnhpMWUi20nG+kQludGgr4clFhZ95?=
 =?iso-8859-1?Q?LUA/RW/A6tw3bm9Z81atPAdp9K4r7UhBnGleFmeXlDScAzcu8gBhsDP8lr?=
 =?iso-8859-1?Q?ZCW5F+TlWuyV1QQyhG1sgSKkD2cLth9XkfcvUEaFt0E9345vcTlEuidlmT?=
 =?iso-8859-1?Q?4irNAjcIDuyIv/a7WIp9kLwTOwHIHssidga73U2fFXHnK8slQz091FaVHX?=
 =?iso-8859-1?Q?bbbLIVTPIyquAYagVE4+MKeS1OfiSt3dv9D3k/aewb5C5W1/bsyF04NFXs?=
 =?iso-8859-1?Q?vPUu9ZhXdtppUbQ9RXP6VMxOqv9cKeMLaogviTHAHPu2t6EII0y/tI+RLg?=
 =?iso-8859-1?Q?vW7tNMkI/6K3QdD5RaLL4hk0/GiZzD0BblIDPKIr38Kgap+QrqZ/ftMM6i?=
 =?iso-8859-1?Q?NEiUFHFJbUicDDRqcDpZL52GVqVKXTG5jmN4uHMvqsMDJLtyQ62SqVmdg2?=
 =?iso-8859-1?Q?FBw/Vz+Azv8S936ogAM33rXtAy8uvAooR3cHaK1SQgYVuRJ2n7aF+NQNLU?=
 =?iso-8859-1?Q?rLsAWtc/6RDSiGPAk6uiHNQI/v6qx/OvEyYLf04KP/fcb6r9Fq1G5IIZaE?=
 =?iso-8859-1?Q?+krd03SYDGOiSPeo/z72b5u7KfDWKmtg3pBYWFGZQsFklGIjTr9IWYWPia?=
 =?iso-8859-1?Q?f4MefkOvAJ6QG/JWESujrSG8TqAi31xPPzEa4+vvl0SLuTiZ1zMtpyZ13m?=
 =?iso-8859-1?Q?7Flc/flEZZ2u80SXgdiQZ9Hbzj6vywfpyIGSxBB3F5eWpwL8fMB6wRESxr?=
 =?iso-8859-1?Q?67iyKgpmB6yXUsTOzCTzwM08MvhjfBJu6BRTlneA9TT1ArWD8M3mvbVkOh?=
 =?iso-8859-1?Q?rEeEoFGvo2jZ3xRkPl5BAjBAm4EqedgA0ZsxlIqESqnZgK7qgY9mjQnvE8?=
 =?iso-8859-1?Q?wXlSiDmB+R/xXKq3pDDBdc3qZ6/9RezSUo/cQtZzOKu9gCOB4w1DAKtY+E?=
 =?iso-8859-1?Q?tdQcpL2IiKFYUDClGQ8gZWlXsL6o4I1Xq3aALsF9YYBAhCKTodF7tSvVML?=
 =?iso-8859-1?Q?ACoGCFJVHmXu0G74C+zqtRu2rTGAgNHl7BvtZfAivpsdsJKV/3/jxzfsAp?=
 =?iso-8859-1?Q?cjoXw1bFMrPj8ffh1YcVmJHZzrRof8SQiQDyqD5sHBAuReHiAauoIicQtx?=
 =?iso-8859-1?Q?0M9pAv4SbmJAgFrn0xfUlXk8eVh5Qnltt9HaUb4WtTuPB/8wivD11vH1Z5?=
 =?iso-8859-1?Q?pF8f801dmpUk8yfZ6ZZyIFKVQzkR9Fk4RbzSMm6wh+HEFoCJHseUerEXjR?=
 =?iso-8859-1?Q?cNtXGTp9rE0dBKWGLB/zwTetzQHTbi4MSSJ7SFoszRTuK2HtCDEdTwj3F0?=
 =?iso-8859-1?Q?G9FyBYsrgFeBe7TJSE3euG1E1CxSVMTD8YINz4EJoCNzsP98NC3oe4As7d?=
 =?iso-8859-1?Q?GuYAGiqv92ldZFjlybeFOdj/r5mlR82ZJ0?=
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS4PR10MB5150.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d15f27f-b00a-4b78-8b69-08de2767d237
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Nov 2025 12:33:19.4979
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0J7Uwdx+Xn/iBCXL8y/xpNwm5OQ6+bEJQqDHDtPJUjYbcHZHLaiM/6rk/yooJgOEQNFjOqLdSG4arxHadZbeEU107VqZEXFVLH+HsYu+D3s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR10MB3193
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_AS4PR10MB51507A3160F4AD577CD35ED4ACD7AAS4PR10MB5150EURP_"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Nov 2025 18:55:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226577

--_000_AS4PR10MB51507A3160F4AD577CD35ED4ACD7AAS4PR10MB5150EURP_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi Mathieu,

Weird, this time oe-selftest was passing. Anything else I need to check loc=
ally to make sure it is working properly?

2025-11-19 12:25:28,520 - oe-selftest - INFO - test_custom_annotation_vars =
(spdx.SPDX30Check.test_custom_annotation_vars)
2025-11-19 12:26:22,548 - oe-selftest - INFO - Found ANNOTATION1: ANNOTATIO=
N1=3DTestAnnotation1
2025-11-19 12:26:22,548 - oe-selftest - INFO - Found ANNOTATION2: ANNOTATIO=
N2=3DTestAnnotation2
2025-11-19 12:26:22,549 - oe-selftest - INFO -  ... ok
2025-11-19 12:26:27,823 - oe-selftest - INFO - ----------------------------=
------------------------------------------
2025-11-19 12:26:27,823 - oe-selftest - INFO - Ran 1 test in 59.471s
2025-11-19 12:26:27,823 - oe-selftest - INFO - OK
2025-11-19 12:26:32,996 - oe-selftest - INFO - RESULTS:
2025-11-19 12:26:32,996 - oe-selftest - INFO - RESULTS - spdx.SPDX30Check.t=
est_custom_annotation_vars: PASSED (54.03s)
2025-11-19 12:26:32,997 - oe-selftest - INFO - SUMMARY:
2025-11-19 12:26:32,997 - oe-selftest - INFO - oe-selftest () - Ran 1 test =
in 59.471s
2025-11-19 12:26:32,997 - oe-selftest - INFO - oe-selftest - OK - All requi=
red tests passed (successes=3D1, skipped=3D0, failures=3D0, errors=3D0)

Best regards,
Stefano

________________________________
From: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Sent: Wednesday, November 19, 2025 10:10
To: Stefano Tondo <stondo@gmail.com>; openembedded-core@lists.openembedded.=
org <openembedded-core@lists.openembedded.org>
Cc: Marko, Peter (FT D EU SK BFS1) <Peter.Marko@siemens.com>; Freihofer, Ad=
rian (SI B PRO TI EAC CCP) <adrian.freihofer@siemens.com>; Tondo, Stefano (=
ext) (SI B PRO AUT PD ZUG SW 2) <stefano.tondo.ext@siemens.com>
Subject: Re: [OE-core][PATCH v2] spdx30_tasks: Fix SPDX_CUSTOM_ANNOTATION_V=
ARS implementation

[You don't often get email from mathieu.dubois-briand@bootlin.com. Learn wh=
y this is important at https://aka.ms/LearnAboutSenderIdentification ]

On Mon Nov 17, 2025 at 2:04 PM CET, Stefano Tondo wrote:
> From: Stefano Tondo <stefano.tondo.ext@siemens.com>
>
> Fix incorrect function call when processing SPDX_CUSTOM_ANNOTATION_VARS.
> The code was calling new_annotation() as a standalone function, but it
> should be called as a method on the build_objset object.
>
> Error:
>     new_annotation(d, build_objset, build, ...)
>
> Corrected to:
>     build_objset.new_annotation(d, build_objset, build, ...)
>
> This bug would cause a NameError at runtime if SPDX_CUSTOM_ANNOTATION_VAR=
S
> was set to a non-empty value, preventing SPDX document generation.
>
> The fix aligns with how new_annotation() is called elsewhere in the
> codebase and matches the SBOMObjset class method signature.
>
> Signed-off-by: Stefano Tondo <stefano.tondo.ext@siemens.com>
>
> ---
> Changes in v2:
> - Fixed test bugs: corrected SPDX file path from packages/ to recipes/
> - Fixed test bugs: removed parentheses from objset.objects() call
> - Fixed whitespace formatting in test code
> ---

Hi Stefano,

Thanks for the v2, but it looks like the test is still failing with a
similar error:

2025-11-18 18:36:56,500 - oe-selftest - INFO - spdx.SPDX30Check.test_custom=
_annotation_vars (subunit.RemotedTestCase)
2025-11-18 18:36:56,500 - oe-selftest - INFO -  ... FAIL
...
  File "/srv/pokybuild/yocto-worker/oe-selftest-debian/build/layers/openemb=
edded-core/meta/lib/oeqa/selftest/cases/spdx.py", line 330, in test_custom_=
annotation_vars
    self.assertIsNotNone(build, "Unable to find Build element")
    ~~~~~~~~~~~~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/usr/lib/python3.13/unittest/case.py", line 1309, in assertIsNotNon=
e
    self.fail(self._formatMessage(msg, standardMsg))
    ~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/usr/lib/python3.13/unittest/case.py", line 732, in fail
    raise self.failureException(msg)
AssertionError: unexpectedly None : Unable to find Build element

https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fautobui=
lder.yoctoproject.org%2Fvalkyrie%2F%23%2Fbuilders%2F35%2Fbuilds%2F2716&data=
=3D05%7C02%7Cstefano.tondo.ext%40siemens.com%7C83cc9b25d9d7452d506108de274b=
8ab2%7C38ae3bcd95794fd4addab42e1495d55a%7C1%7C0%7C638991402564335644%7CUnkn=
own%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zM=
iIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=3DB9xMi%2B%2B5GIZkbx=
iVsiSQoV5jo8fTB3DlA3rmXnhFszM%3D&reserved=3D0<https://autobuilder.yoctoproj=
ect.org/valkyrie/#/builders/35/builds/2716>
https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fautobui=
lder.yoctoproject.org%2Fvalkyrie%2F%23%2Fbuilders%2F48%2Fbuilds%2F2610&data=
=3D05%7C02%7Cstefano.tondo.ext%40siemens.com%7C83cc9b25d9d7452d506108de274b=
8ab2%7C38ae3bcd95794fd4addab42e1495d55a%7C1%7C0%7C638991402564365511%7CUnkn=
own%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zM=
iIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=3D3l5UUBVMkavU0hHo2Y=
pwJOtuPBeptQ5vl7xVTSdAxUw%3D&reserved=3D0<https://autobuilder.yoctoproject.=
org/valkyrie/#/builders/48/builds/2610>
https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fautobui=
lder.yoctoproject.org%2Fvalkyrie%2F%23%2Fbuilders%2F23%2Fbuilds%2F2852&data=
=3D05%7C02%7Cstefano.tondo.ext%40siemens.com%7C83cc9b25d9d7452d506108de274b=
8ab2%7C38ae3bcd95794fd4addab42e1495d55a%7C1%7C0%7C638991402564383666%7CUnkn=
own%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zM=
iIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=3DrWHimLU30QLtBL3q5X=
Z9%2Blk7UW33hYUb1KRYe0zTO70%3D&reserved=3D0<https://autobuilder.yoctoprojec=
t.org/valkyrie/#/builders/23/builds/2852>

Can you have a look at these?

Thanks,
Mathieu

--
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fbootlin=
.com%2F&data=3D05%7C02%7Cstefano.tondo.ext%40siemens.com%7C83cc9b25d9d7452d=
506108de274b8ab2%7C38ae3bcd95794fd4addab42e1495d55a%7C1%7C0%7C6389914025644=
00279%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsI=
lAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=3DMz293o=
TTsJuVwG6sHJA4mf0Ln6gQsvwhncnbrdz0GUs%3D&reserved=3D0<https://bootlin.com/>


--_000_AS4PR10MB51507A3160F4AD577CD35ED4ACD7AAS4PR10MB5150EURP_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: &quot;Arial&quot;, &quot;Helvetica&quot;, sans-s=
erif; color: rgb(0, 0, 0);" class=3D"elementToProof">
<span style=3D"font-size: 10pt;">Hi </span><span style=3D"font-size: 11pt;"=
>Mathieu,<br>
<br>
Weird, this time oe-selftest was passing. Anything else I need to check loc=
ally to make sure it is working properly?&nbsp;<br>
<br>
2025-11-19 12:25:28,520 - oe-selftest - INFO - test_custom_annotation_vars =
(spdx.SPDX30Check.test_custom_annotation_vars)</span></div>
<div style=3D"font-family: &quot;Arial&quot;, &quot;Helvetica&quot;, sans-s=
erif; font-size: 11pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
2025-11-19 12:26:22,548 - oe-selftest - INFO - Found ANNOTATION1: ANNOTATIO=
N1=3DTestAnnotation1</div>
<div style=3D"font-family: &quot;Arial&quot;, &quot;Helvetica&quot;, sans-s=
erif; font-size: 11pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
2025-11-19 12:26:22,548 - oe-selftest - INFO - Found ANNOTATION2: ANNOTATIO=
N2=3DTestAnnotation2</div>
<div style=3D"font-family: &quot;Arial&quot;, &quot;Helvetica&quot;, sans-s=
erif; font-size: 11pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
2025-11-19 12:26:22,549 - oe-selftest - INFO - &nbsp;... ok</div>
<div style=3D"font-family: &quot;Arial&quot;, &quot;Helvetica&quot;, sans-s=
erif; font-size: 11pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
2025-11-19 12:26:27,823 - oe-selftest - INFO - ----------------------------=
------------------------------------------</div>
<div style=3D"font-family: &quot;Arial&quot;, &quot;Helvetica&quot;, sans-s=
erif; font-size: 11pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
2025-11-19 12:26:27,823 - oe-selftest - INFO - Ran 1 test in 59.471s</div>
<div style=3D"font-family: &quot;Arial&quot;, &quot;Helvetica&quot;, sans-s=
erif; font-size: 11pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
2025-11-19 12:26:27,823 - oe-selftest - INFO - OK</div>
<div style=3D"font-family: &quot;Arial&quot;, &quot;Helvetica&quot;, sans-s=
erif; font-size: 11pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
2025-11-19 12:26:32,996 - oe-selftest - INFO - RESULTS:</div>
<div style=3D"font-family: &quot;Arial&quot;, &quot;Helvetica&quot;, sans-s=
erif; font-size: 11pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
2025-11-19 12:26:32,996 - oe-selftest - INFO - RESULTS - spdx.SPDX30Check.t=
est_custom_annotation_vars: PASSED (54.03s)</div>
<div style=3D"font-family: &quot;Arial&quot;, &quot;Helvetica&quot;, sans-s=
erif; font-size: 11pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
2025-11-19 12:26:32,997 - oe-selftest - INFO - SUMMARY:</div>
<div style=3D"font-family: &quot;Arial&quot;, &quot;Helvetica&quot;, sans-s=
erif; font-size: 11pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
2025-11-19 12:26:32,997 - oe-selftest - INFO - oe-selftest () - Ran 1 test =
in 59.471s</div>
<div style=3D"font-family: &quot;Arial&quot;, &quot;Helvetica&quot;, sans-s=
erif; font-size: 11pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
2025-11-19 12:26:32,997 - oe-selftest - INFO - oe-selftest - OK - All requi=
red tests passed (successes=3D1, skipped=3D0, failures=3D0, errors=3D0)<br>
<br>
Best regards,<br>
Stefano<br>
<br>
</div>
<hr style=3D"display: inline-block; width: 98%;">
<div id=3D"divRplyFwdMsg">
<div style=3D"direction: ltr; font-family: Calibri, sans-serif; font-size: =
11pt; color: rgb(0, 0, 0);">
<b>From:</b>&nbsp;Mathieu Dubois-Briand &lt;mathieu.dubois-briand@bootlin.c=
om&gt;<br>
<b>Sent:</b>&nbsp;Wednesday, November 19, 2025 10:10<br>
<b>To:</b>&nbsp;Stefano Tondo &lt;stondo@gmail.com&gt;; openembedded-core@l=
ists.openembedded.org &lt;openembedded-core@lists.openembedded.org&gt;<br>
<b>Cc:</b>&nbsp;Marko, Peter (FT D EU SK BFS1) &lt;Peter.Marko@siemens.com&=
gt;; Freihofer, Adrian (SI B PRO TI EAC CCP) &lt;adrian.freihofer@siemens.c=
om&gt;; Tondo, Stefano (ext) (SI B PRO AUT PD ZUG SW 2) &lt;stefano.tondo.e=
xt@siemens.com&gt;<br>
<b>Subject:</b>&nbsp;Re: [OE-core][PATCH v2] spdx30_tasks: Fix SPDX_CUSTOM_=
ANNOTATION_VARS implementation</div>
<div style=3D"direction: ltr;">&nbsp;</div>
</div>
<div style=3D"font-size: 11pt;">[You don't often get email from mathieu.dub=
ois-briand@bootlin.com. Learn why this is important at
<a data-auth=3D"NotApplicable" class=3D"OWAAutoLink" id=3D"OWAf9344c53-c171=
-7e78-38fe-098914830bf2" href=3D"https://aka.ms/LearnAboutSenderIdentificat=
ion">
https://aka.ms/LearnAboutSenderIdentification</a>&nbsp;]<br>
<br>
On Mon Nov 17, 2025 at 2:04 PM CET, Stefano Tondo wrote:<br>
&gt; From: Stefano Tondo &lt;stefano.tondo.ext@siemens.com&gt;<br>
&gt;<br>
&gt; Fix incorrect function call when processing SPDX_CUSTOM_ANNOTATION_VAR=
S.<br>
&gt; The code was calling new_annotation() as a standalone function, but it=
<br>
&gt; should be called as a method on the build_objset object.<br>
&gt;<br>
&gt; Error:<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; new_annotation(d, build_objset, build, ...)<br=
>
&gt;<br>
&gt; Corrected to:<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; build_objset.new_annotation(d, build_objset, b=
uild, ...)<br>
&gt;<br>
&gt; This bug would cause a NameError at runtime if SPDX_CUSTOM_ANNOTATION_=
VARS<br>
&gt; was set to a non-empty value, preventing SPDX document generation.<br>
&gt;<br>
&gt; The fix aligns with how new_annotation() is called elsewhere in the<br=
>
&gt; codebase and matches the SBOMObjset class method signature.<br>
&gt;<br>
&gt; Signed-off-by: Stefano Tondo &lt;stefano.tondo.ext@siemens.com&gt;<br>
&gt;<br>
&gt; ---<br>
&gt; Changes in v2:<br>
&gt; - Fixed test bugs: corrected SPDX file path from packages/ to recipes/=
<br>
&gt; - Fixed test bugs: removed parentheses from objset.objects() call<br>
&gt; - Fixed whitespace formatting in test code<br>
&gt; ---<br>
<br>
Hi Stefano,<br>
<br>
Thanks for the v2, but it looks like the test is still failing with a<br>
similar error:<br>
<br>
2025-11-18 18:36:56,500 - oe-selftest - INFO - spdx.SPDX30Check.test_custom=
_annotation_vars (subunit.RemotedTestCase)<br>
2025-11-18 18:36:56,500 - oe-selftest - INFO -&nbsp; ... FAIL<br>
...<br>
&nbsp; File &quot;/srv/pokybuild/yocto-worker/oe-selftest-debian/build/laye=
rs/openembedded-core/meta/lib/oeqa/selftest/cases/spdx.py&quot;, line 330, =
in test_custom_annotation_vars<br>
&nbsp;&nbsp;&nbsp; self.assertIsNotNone(build, &quot;Unable to find Build e=
lement&quot;)<br>
&nbsp;&nbsp;&nbsp; ~~~~~~~~~~~~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^=
^^^<br>
&nbsp; File &quot;/usr/lib/python3.13/unittest/case.py&quot;, line 1309, in=
 assertIsNotNone<br>
&nbsp;&nbsp;&nbsp; self.fail(self._formatMessage(msg, standardMsg))<br>
&nbsp;&nbsp;&nbsp; ~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^<br>
&nbsp; File &quot;/usr/lib/python3.13/unittest/case.py&quot;, line 732, in =
fail<br>
&nbsp;&nbsp;&nbsp; raise self.failureException(msg)<br>
AssertionError: unexpectedly None : Unable to find Build element<br>
<br>
<a data-auth=3D"NotApplicable" class=3D"OWAAutoLink" id=3D"OWA501e6b96-f15d=
-1d2e-2e63-bab6332534e5" href=3D"https://autobuilder.yoctoproject.org/valky=
rie/#/builders/35/builds/2716">https://eur01.safelinks.protection.outlook.c=
om/?url=3Dhttps%3A%2F%2Fautobuilder.yoctoproject.org%2Fvalkyrie%2F%23%2Fbui=
lders%2F35%2Fbuilds%2F2716&amp;data=3D05%7C02%7Cstefano.tondo.ext%40siemens=
.com%7C83cc9b25d9d7452d506108de274b8ab2%7C38ae3bcd95794fd4addab42e1495d55a%=
7C1%7C0%7C638991402564335644%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydW=
UsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%=
7C%7C%7C&amp;sdata=3DB9xMi%2B%2B5GIZkbxiVsiSQoV5jo8fTB3DlA3rmXnhFszM%3D&amp=
;reserved=3D0</a><br>
<a data-auth=3D"NotApplicable" class=3D"OWAAutoLink" id=3D"OWA0cb847e8-824c=
-01c7-660e-431ffbc5219d" href=3D"https://autobuilder.yoctoproject.org/valky=
rie/#/builders/48/builds/2610">https://eur01.safelinks.protection.outlook.c=
om/?url=3Dhttps%3A%2F%2Fautobuilder.yoctoproject.org%2Fvalkyrie%2F%23%2Fbui=
lders%2F48%2Fbuilds%2F2610&amp;data=3D05%7C02%7Cstefano.tondo.ext%40siemens=
.com%7C83cc9b25d9d7452d506108de274b8ab2%7C38ae3bcd95794fd4addab42e1495d55a%=
7C1%7C0%7C638991402564365511%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydW=
UsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%=
7C%7C%7C&amp;sdata=3D3l5UUBVMkavU0hHo2YpwJOtuPBeptQ5vl7xVTSdAxUw%3D&amp;res=
erved=3D0</a></div>
<div style=3D"font-size: 11pt;" class=3D"elementToProof"><a data-auth=3D"No=
tApplicable" class=3D"OWAAutoLink" id=3D"OWAfd0ed0d1-ad5e-1aa2-3bf7-ec0effc=
9e8b1" href=3D"https://autobuilder.yoctoproject.org/valkyrie/#/builders/23/=
builds/2852">https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A=
%2F%2Fautobuilder.yoctoproject.org%2Fvalkyrie%2F%23%2Fbuilders%2F23%2Fbuild=
s%2F2852&amp;data=3D05%7C02%7Cstefano.tondo.ext%40siemens.com%7C83cc9b25d9d=
7452d506108de274b8ab2%7C38ae3bcd95794fd4addab42e1495d55a%7C1%7C0%7C63899140=
2564383666%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAw=
MCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&amp;sdata=
=3DrWHimLU30QLtBL3q5XZ9%2Blk7UW33hYUb1KRYe0zTO70%3D&amp;reserved=3D0</a></d=
iv>
<div style=3D"font-size: 11pt;"><br>
Can you have a look at these?<br>
<br>
Thanks,<br>
Mathieu<br>
<br>
--<br>
Mathieu Dubois-Briand, Bootlin<br>
Embedded Linux and Kernel engineering<br>
<a data-auth=3D"NotApplicable" class=3D"OWAAutoLink" id=3D"OWA609efdf1-9af9=
-3b00-dc6c-350cdbc09a83" href=3D"https://bootlin.com/">https://eur01.safeli=
nks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fbootlin.com%2F&amp;data=3D0=
5%7C02%7Cstefano.tondo.ext%40siemens.com%7C83cc9b25d9d7452d506108de274b8ab2=
%7C38ae3bcd95794fd4addab42e1495d55a%7C1%7C0%7C638991402564400279%7CUnknown%=
7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsI=
kFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&amp;sdata=3DMz293oTTsJuVwG6sHJ=
A4mf0Ln6gQsvwhncnbrdz0GUs%3D&amp;reserved=3D0</a><br>
<br>
</div>
</body>
</html>

--_000_AS4PR10MB51507A3160F4AD577CD35ED4ACD7AAS4PR10MB5150EURP_--

