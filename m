Return-Path: <amaury.couderc@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 009E9C531F9
	for <webhook@archiver.kernel.org>; Tue, 28 Jul 2026 10:43:49 +0000 (UTC)
Received: from AM0PR83CU005.outbound.protection.outlook.com (AM0PR83CU005.outbound.protection.outlook.com [52.101.69.57])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8731.1785235423081968462
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Jul 2026 03:43:43 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=Xbnvq8Qd;
 spf=pass (domain: est.tech, ip: 52.101.69.57, mailfrom: amaury.couderc@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MF6Ka7SJBCcV3Vc/vckrCEbdK1pj8U+MMMbsVPEglH08pbC9Ehb0JcSYqjA2qG0gUPEQr+LgAutyDQshoqqiYO3iWsfE/92mqef36Lz6Ss9IGSb/+fj+T9ol0Bxo+D8AJvrIRWW3/xYYW6wFeVClVtdbJsmaII3W8oixbZv4xBVewoAdgh/V3bZYPMnQs5wcz9fkVAsLSV8RRwx/veNH8A5aWgFVLWLVJTuDgUwBvqV1t85y8HUGeoS4gjA7yHyhxV2hC4dViOl27gUALAFw5sLG14liE0q2eTac8odMMikPh2EdYcaYAy84oVY22yS3djSd6gKMzkTX6GWy1xvTYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BznO3XYn0RELQR3+07H3tistCLc+3LqDjh51jdtx9mQ=;
 b=KQ80XQTD61kz/BU2yDDhET6QwZpJbJawzoUuzeZgAKpe1IgGuqswL2s6nBHmnvoLkvRpj7oS0M7JFe3JnF8eeM3ziek3uHL/hBy1HyOOptCpDwMsPvzvqLgut4kdngXSOYknps/iaVDfT2tpJeh8ehCTPoNLeofLEmh78MryfYz3FEsIoQqf9oD5VD405UYmmApOdFSvndU4cETRnvRr3GunbQ5fLikG1PDGYhAzE5n2n/abyr/qd34sVBTejGk3KzRAtSm31rYgjykc8zVlMoGKVl8RNHmsvXKW4dC1LouY13IR1hpf4GPTVQMaqpLHRPNr9OOlX7v3rKRGJNzLqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BznO3XYn0RELQR3+07H3tistCLc+3LqDjh51jdtx9mQ=;
 b=Xbnvq8Qd6vzaXNWOkDAnhLHQZeHxo6YroQoqFwckZTD3YxxYDg7ItBpT7XwTL0IgUekWpVSlCXiLwpt3JrqX6tKWZDXNzQCprC/z3ZFq6Bn7/6Eoyzo7fPx1pHBMLVgizuF1isM62GlWWtOPfjHtrUJ7l+q2NQ6vvvSkt/7DXrkF8oHJOyM60OfZ71eWbjGQLSCstwal9E7Y5LGyPxwW29JRWlhGkXVG52la36Gm7lj1bK74dL5ZQltbUEW1Bobj19HeFiZ/+YvFiI7+EuWFjVSg5dnE5lK4Uk0+8CQw4DVMuYZ81CnrRaZo7Rogyey8rJR85nMjov/70zSSdP8tPg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AMBP189MB3196.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6ad::11)
 by VE1P189MB0893.EURP189.PROD.OUTLOOK.COM (2603:10a6:800:16a::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.12; Tue, 28 Jul
 2026 10:43:38 +0000
Received: from AMBP189MB3196.EURP189.PROD.OUTLOOK.COM
 ([fe80::1afd:f059:542:3d95]) by AMBP189MB3196.EURP189.PROD.OUTLOOK.COM
 ([fe80::1afd:f059:542:3d95%6]) with mapi id 15.21.0270.006; Tue, 28 Jul 2026
 10:43:38 +0000
From: amaury.couderc@est.tech
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2 0/2] wget: CVE fixes regression patches
Date: Tue, 28 Jul 2026 12:43:19 +0200
Message-ID: <20260728104331.27437-1-amaury.couderc@est.tech>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0129.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:193::8) To AMBP189MB3196.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6ad::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMBP189MB3196:EE_|VE1P189MB0893:EE_
X-MS-Office365-Filtering-Correlation-Id: 2dad23a6-ab41-4bef-cc2f-08deec9514fb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|23010399003|366016|376014|11063799006|56012099006|10067099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	WRSywm9v/Ek1kpyx147hxDE0aC677oXb0gYkWpoYyLDZTmES6ZU6vM+8rL8hO376rZXgnptEw63lKZ3bm0hSRVixkhdUnQBXvD2meugjgx6oktWuIhmCfnAxfkcFKyQsFBRqubsqXLffPBTSlz714BFL+ejEj1dSXip6ePKb84Q1tXFgTsiBwmeuxt0R900y/PYxBDzIb1iRag+4qrtLpaQHuGbtFKuzRCdxe1I96q2uDxiE1sawT9JP91yUk7WnlYKnE0nFAvnxgLTh5Gg7RocE/2fhfOJQ5mKrmWf7d0inr7W5kjxV0xQtUbLHWKKi9pi4Qbn8ZCXCDHcaXOqA5/9bdGG7D6umXURHs+zCRdatrtmbssRRjsJqQ3mAte4EYBP8EU1g3GR+u0qSoJXsBBxb8UPPyybh4Zaw9/0Ml5zNI7mSgn5hNK9C0/qRw7LlqsyUjEMJrztYzmEcpi2s8NpW1uY2cbAOu1iFhwpCOTcLQ2gK49hBEtCRS3BWCGDDqekpkWIJC0/YEoO4cjUbBeJZnKLNk0DcSTwz5nOJlDR+4ZrMpHpsdD5NzJJr1jkGeSO9lofZrTSKgoQPky7KyoMLprMV4iJ5qSaPoSHiCtsAb2MPZVEfcupCxoPo+EvaFJS6qRXSg2Qino/HjNdoXO2hLhmwNWyFfPisPnl1Gtg=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AMBP189MB3196.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(366016)(376014)(11063799006)(56012099006)(10067099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?YPFSmXiqbJFMDti3d38UCVUK9gkbBWBJ9A6TjIykUUo0z5BmZgR+j9/Yl7zw?=
 =?us-ascii?Q?I5KSYO4gY4vAb+tcp3eKRAO/+XyoDlLkSTJpM4kizAdiEqOrc8Mn3mP3d5nZ?=
 =?us-ascii?Q?APWCCpCK2y7Q+YpheMwBdMZLYPqpOTehoqKVmQcyqwhbKXht6+JSyQRrVzG7?=
 =?us-ascii?Q?3ql2hWS2RoW5GthjJ+hdE8Y2BAEEt7kcgnNKZeZcPIexyk9rjalLRp9g+bNW?=
 =?us-ascii?Q?4mWBdxVWhcmekzRMw1vJ2d/adzrcuDU6mAr2+6Z8x+EhMcztLVxhEBKC723u?=
 =?us-ascii?Q?ycc+wYXqm6hCZ0hi/GMndDyTkCrqi1oiq2OjX1tdc/rLXyOTlLaVcKVyrSzu?=
 =?us-ascii?Q?lLGQX86bRtVP1HdBKUEaeOzjTJ2m3CdSvCS9GvepqQZFh8uneba5JCpQ9FHm?=
 =?us-ascii?Q?eKK/alqyzpgVWgMiuMDMyJCTqJDOQ7KUxNudS6zlIudh/l4CC0lgyjm8C6Md?=
 =?us-ascii?Q?n/fLOapJSmzZFEKUVpe+KKSuv7gFh+UP8y/c567tfFLwkGLY0r7EEgNgk1CC?=
 =?us-ascii?Q?SgAkJ5Nh9qz4NG+IuX8Nk+opSahb6ibNfPMA0oseSNRvc/kaRAtesjTIjqx9?=
 =?us-ascii?Q?D8UiO4iDge4SmEqtk6/AAblJoIMiqkSH5aY4sbK1EelhGOePDAmtbfOnBil0?=
 =?us-ascii?Q?dRsYxzW1nXXPpT0578iCXHqYzSujlgUOuHuTLxzAH+PPqkvC3BVpFwjbwsHW?=
 =?us-ascii?Q?Igc1SmunhUwoV4cs9ce1q1LS7gCdAn2fRUDicbDfdenqtI0i8D4qM0j4KmlP?=
 =?us-ascii?Q?1EZEpfrCBpIlR810ooJ9esfQHQpzma3cD0kgxz6w1MXMdbdAunNpdj/4eOkx?=
 =?us-ascii?Q?TAWvSr7edzId40919nrr7F/lEqt/bz8I906SbX5JDWPnz8oi+0scT/T44rz2?=
 =?us-ascii?Q?JhQa1mX5yLJY/D7zxoUiZnNF/FZ5e0IWapYMn7K607iOiYBjY7JKWkXTKcxR?=
 =?us-ascii?Q?x6sJ3+PAe2dUvod4DO3pp7SM1k4jyP9fJfZ8umHc0wGXZcvo/dpNwh655q2+?=
 =?us-ascii?Q?JBkKVL5FIu53RvoAG+c/NHFCdmUpwk3NB+dtTAxhXF7/MM34dDx/NJ265MMH?=
 =?us-ascii?Q?4+N/xlELpuLDg2twOAXg1O6B31S1UxkjyX8r4YNFKqsSyHp7bpAK+WVG8j/d?=
 =?us-ascii?Q?MzmAEhV2OR2g+biV8KZVJzkULzRmR/k7OsVZNUOfUbxWk84pywYTx5vBWxsU?=
 =?us-ascii?Q?o54MPz2nvWM3h5tPbwp/Jd7ZzRhUOLOL4B/B7sOKT8LN8A+uUopaQhp74WHj?=
 =?us-ascii?Q?TEHv2wU5DI0iwJNidK+Hc1llFjv+Gl/5+GXzQcCIn6NAIHxNnhEsT9BHFURy?=
 =?us-ascii?Q?YEUoFs5QBUZHSL0QFHf4+ReUkPQsLcFGaM92rFq+uTtQsE1gzLmm/0NxmtMD?=
 =?us-ascii?Q?G7zRy5v84/CLDeRCFNZPgvNvkNu0EZJ20l4PNxrbaqH1muA+OsO+06XtZZYd?=
 =?us-ascii?Q?ZgZhnSqjnfZnCPXeXF14ASkR/FJDUDJ6+1gKOuAljBh/5qeld5HTi4weWuIi?=
 =?us-ascii?Q?ZRH7M+jCdy4KI5YacadafKearKc33uRhyQrV78EUEFTjxC1iGPN8xlWIOHL8?=
 =?us-ascii?Q?pmHuOk1aRCUSPG/yea0gWAxO06Sne/qQc6hd54qUTLQ9kCNiN3cznVnSpMZV?=
 =?us-ascii?Q?RLRSsa8iEsgTzvfayWyBEcxc+6CqiNz+4h6kP+L9PwWkLNhphXCECVkFTEfo?=
 =?us-ascii?Q?e6keG3WghywzWFcPgbHVXrQMDWgGCILTG+84XVhFt3GuIDtonsmnvRagiUAK?=
 =?us-ascii?Q?xiAz6vvRKA=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 2dad23a6-ab41-4bef-cc2f-08deec9514fb
X-MS-Exchange-CrossTenant-AuthSource: AMBP189MB3196.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2026 10:43:38.0068
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JYnZyOkmxZpSs7+DeMA8nbxKn4Aoqy5kGLLtW+Hfg07mllypsHv6PAEeu4oedgrxXu+KvydX/Mf4pyipnIfgfw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1P189MB0893
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 28 Jul 2026 10:43:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242180

From: Amaury Couderc <amaury.couderc@est.tech>

Changelog since v1:

CVE-2026-58469:
  Added the regression patches=20
    CVE-2026-58469-regression_p1.patch [https://gitlab.com/gnuwget/wget/-/c=
ommit/7b1cdecc49bc77bde220fc575c8a00386c3f3bcf]
    CVE-2026-58469-regression_p2.patch [https://gitlab.com/gnuwget/wget/-/c=
ommit/82d945ff5dc9942b78b2bf736aac298c24fe00a1]

CVE-2026-28472:
  Added the regression patch
    CVE-2026-58472-regression.patch [https://gitlab.com/gnuwget/wget/-/comm=
it/f76978a51ba9365e7ecaed96c1cfb73197a38ca2]

Amaury Couderc (2):
  wget: fix CVE-2026-58469
  wget: fix CVE-2026-58472

 .../wget/CVE-2026-58469-regression_p1.patch   |  41 +++
 .../wget/CVE-2026-58469-regression_p2.patch   |  28 +++
 .../wget/wget/CVE-2026-58469.patch            |  52 ++++
 .../wget/wget/CVE-2026-58472-regression.patch | 235 ++++++++++++++++++
 .../wget/wget/CVE-2026-58472.patch            |  73 ++++++
 meta/recipes-extended/wget/wget_1.25.0.bb     |   5 +
 6 files changed, 434 insertions(+)
 create mode 100644 meta/recipes-extended/wget/wget/CVE-2026-58469-regressi=
on_p1.patch
 create mode 100644 meta/recipes-extended/wget/wget/CVE-2026-58469-regressi=
on_p2.patch
 create mode 100644 meta/recipes-extended/wget/wget/CVE-2026-58469.patch
 create mode 100644 meta/recipes-extended/wget/wget/CVE-2026-58472-regressi=
on.patch
 create mode 100644 meta/recipes-extended/wget/wget/CVE-2026-58472.patch

--=20
2.34.1


