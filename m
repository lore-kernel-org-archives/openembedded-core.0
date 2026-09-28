Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08F8DC9833E
	for <webhook@archiver.kernel.org>; Mon, 28 Sep 2026 08:29:32 +0000 (UTC)
Received: from MRWPR03CU001.outbound.protection.outlook.com (MRWPR03CU001.outbound.protection.outlook.com [40.107.130.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.52900.1790584161453099760
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Sep 2026 01:29:21 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=meO/UEnn;
 spf=pass (domain: est.tech, ip: 40.107.130.52, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=C2hSPJhxX1pEM4XmmSEqSrlQEyrGRc1fougiTvjbaYBX7tE/tGznH/W+izXZM0mZwSvNDldUB6qgTYEpjpc1JWQZWKViDyravO8A68LTVIcMFQIMInddTPx38wkffXSHe0uN0or/n1wgBJ9Seqc8cdIILtp/0sqpfOi8VYyl7HQh6tBjzHcrYU7zTDyN7ams8VKCK1rPOr1TLtMxfPDeUbVq75PngsYRRDXB7Gpdbdh0+Wm5LxgLvjehV7JpX0NKOsRKQElflaQoFUGlddSdJbPVfJ8G0vqUvnrF6OhkZ8qLDCbW5i6uyP2sKNdabShJQq2DQ6CuzhC4EBx8rwcOWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fAIxzk0oou6mPNVOFQB1RUT50nCnTYhosoY0AP4oqSM=;
 b=Jzjb87kPLlTZoRfF66FOHPn7t3L81szneoukeL1TU3PjPpruHz7h9/sKk0qzSCAK/mh9s1nkfzXQkYcBEOxl/5HIA9UWX7vQT8YbrwIAgXFK4yDgh4jzEcCbvYZznqdirUTcMQHETa+Zq+JWPxPXMjnVNy3prTzfL0xFi1P77qOmruyeMStYem/F7wgxYxfAfL7OyjjQM2s6Q4NDglCT0FRifrSpsxHnJMaDBmVYBM8bw9y4UVu/4UcObmGwIK/CadTrYFqbOhcSPFBr0tNmdgiyCiXDWpoBmRpC12l9p2WbM9YQFI6RDMXL0hmUvMxo8YGlDc4bukTFtqINhv7qhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fAIxzk0oou6mPNVOFQB1RUT50nCnTYhosoY0AP4oqSM=;
 b=meO/UEnnyJg4x4zcHgm9C65MuGbGTHIHuaTSC1RozffnIYJ1x6OIXuZ2HTdKMWm4jLqOxDyeLboP2kp+E4k1TZuF6cyCGRqDrA0PhWCinFjD1U3LXVSdwl6JatngccuNlavSEA3o3Q01wBOq3hJhaJsaHnptLcyW80sTj95eXbgormw9DqXoevqa/j9AxrL4DscVYpBkZOom5WsrXzUw8wTVLulZKt15ZVHcIFhrNVSnYuz1f8EX90MRkgJ4lMnfrSBQevAaCibxARk/bkLBQFQr9nD4N+ZcqZD5E5vDDU9HuFy0TECFugM3fSeC+pcC4sm3s656S8M37fMk1pkVkA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6c0::19)
 by FRZP189MB2808.EURP189.PROD.OUTLOOK.COM (2603:10a6:d10:13b::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.23; Mon, 28 Sep
 2026 08:29:17 +0000
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb]) by AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb%6]) with mapi id 15.21.0451.022; Mon, 28 Sep 2026
 08:29:17 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] libpwquality: Add version tag for SRC_URI
Date: Mon, 28 Sep 2026 10:29:15 +0200
Message-ID: <20260928082915.18121-1-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0082.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:190::15) To AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6c0::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6P189MB3107:EE_|FRZP189MB2808:EE_
X-MS-Office365-Filtering-Correlation-Id: 80eee5b1-c74d-48da-34eb-08df1d3a95d4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|366016|23010399003|3023799007|6133799003|10067099003|11063799006|56012099006|18002099003;
X-Microsoft-Antispam-Message-Info: 
	JJVowqJMRepbzpHEOsk5FS78+TEGnV8hhCSW6hRXmiTBV1lOFAnZ1jQ7zd25ccnqQvBCU7YsKf4nyR02cHFzfPQqXPGBPu6Nre3ZSq0XxMkpZaHvV4L3YIbGGZU8KK6extBDRt1T6drMm9tHPO2BraS8zGlEMfd2fpgyTLLZxgNbLofBq5pn/B5n/9hDoHc36YcSCFwktXTiQ6CQDjA5P40uxteO6q4gd+04OudaNnhdn+d8ncofs1PAzN2gDwjnfksTxXQ0uZdK7yb8YyGzN+77mWWj+pPqYf5BkYnURzDLpe18ZBjP/bVoRhfxXua5PARDv/wGPeNTVIhyQMcd/+He6zbhLw8AYszm8cIODMFbBy9lRe/8np0mapsUhczjFK6cgQQGCCeap/ejeoA1XBqd3krUqnI5uWMi0Pm0McYSs69Hg8D2cZZMQLkDuvrb97x94vIdzbA4aL3tS6UVwPqwt6x9Dt8CqMxTu+2ErlwKL6qvicofQqMRPffr5FIwHgLcZE3k6U/ul0ZiXqDxpz3plZ2xJWSSVajInCYgnrgurft/rZezQQRMhQXzjNasNQlkkbzxF0myhqv4Kl16CS2pesIQgvdjegSTUqxn6L4lTfEYzbptwkAgmwonBQyt2SHZAugiz0+Kja/ZO3smAGM1iWCZtg6c28ekAD+mEDE=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6P189MB3107.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(23010399003)(3023799007)(6133799003)(10067099003)(11063799006)(56012099006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?2AXjRXpidQHh5AEqqDSX+ytrRqgt7QrzBV50YVMF3VBN8LjPj9cSGydofH32?=
 =?us-ascii?Q?it5bZ2Xh7g5oL/oyxrk6O1s4vfssuCXKl+WcKAE19u6goVFNF/ri0rM2nQvi?=
 =?us-ascii?Q?FVBJEy6G0woxEPuLbWw7MwVYaZmMXXq6vYs0wjKLYg35d1vmkC1jaBLzMhRX?=
 =?us-ascii?Q?AH1j5NPwMeyjNNG0bz6/SK1U5mA49wSfTBV7b2v8wiLnT+BZnbALvqC/uFqC?=
 =?us-ascii?Q?cI3CgR5+telFlhgvQOwoS8bzrf+pkM04yaDjRFHJeQDBoFGK9UHRvTNrRQ4g?=
 =?us-ascii?Q?lVShyxy4uA3EyxFIzLvy7bL7eYEf8NZS2E03oTQ0w5Zn9lyUL8zJS13d89Ub?=
 =?us-ascii?Q?n6DV/TSehx0Qd/28V1hZbL14QwNm9fpKPmURwmdspA2bnWmw9afbOo/oiDoy?=
 =?us-ascii?Q?Up3d2v9zoOh7gA2aLXuoQczDIcnjtq+n+C4RrMHg9QbwK+qwVkBKnGhLIFkx?=
 =?us-ascii?Q?ynCF4eh5tQKYEecWixbR635qBbaAdX9CsvTTJStXIeWgBUCNwox5nKqWKlqD?=
 =?us-ascii?Q?HsbtxgspwD8gy+zr1EJEDlMGJlyL9U71rByvTlHz6NUCiYh6OG+DYCvVMBET?=
 =?us-ascii?Q?oZiIyh/1dUaYpfvi3qYGVq9XozYRmRtqe/LHim6p4Utj5cTcjr6zBrE+MhKR?=
 =?us-ascii?Q?TwkxtZcZhxXa6AnK8qh6AUZRVyv/bWrBfn0TuC1aHdeKNEBYK9XwYHcGVtdj?=
 =?us-ascii?Q?G00LwOxTzjBOc3hvwh2flXdbgsKZQECtvOLQs6pUuAanYFYwIKj24FYIBXMl?=
 =?us-ascii?Q?1yZLBhX5fW5mc40ePgPDFa/ejuVRp12OV4DcO/zZ7lb4Y3bjaKN+3eDts+wX?=
 =?us-ascii?Q?EhNFtnEa/7tDO1F63GUFgdCw6bP0w4l2fDazCo9N6PDj6wgbYy4ut6vTsUxH?=
 =?us-ascii?Q?qaGJZVTBGE/Q/g0QehFyU9ByfbnHSfzy2OOQJIjo7j+nObD/Tz5kwOAO0MwR?=
 =?us-ascii?Q?y4MIznYN41/Yqdbx0/3JcSFRhitowuHM1EVKzaUaEX0HR8uLJVGbaSf4u4TZ?=
 =?us-ascii?Q?8BMvb68Th6fIh0yCH57QVwd8T0TM0uWx9+ChT+0PXAsyFZ8MfMHO8fg+gI7x?=
 =?us-ascii?Q?BU06qqNyo99UyaZbSsbGL5uhP5p13JcXxVQvNnE83y/FCFQJ8zU88Lmmy+gh?=
 =?us-ascii?Q?SEl8vbw6d6T9dzprBYqh7OWD4S1K6XkQmdLJJokMjd34hBsv9QualeMpuraI?=
 =?us-ascii?Q?/od4EHwnqAZtYQRKL5+rxd3aCiDSHpVTR/ocoZYrE9XA4HMccC+t3CE+hNKm?=
 =?us-ascii?Q?OxHIsqf8KBbsFltbmRnJ+8L1vEpgZpIvS68ZJMwNJEljceCl+zEOvGG8ajD+?=
 =?us-ascii?Q?OFh+AOwjwtvFGiyvwEJFGbN1yGsGI6PHI8GTbTif1sEIeR4sbunep5Gq0vHb?=
 =?us-ascii?Q?3zjqQzmlQgunKL0Fc0TgYK4MD7alMCDiiQha1bX/9D5rys5QQZWw3c0tVgmg?=
 =?us-ascii?Q?Gl/6YlQPBLyjxEeEekiQObHTX4uipJ3ydRoNlFTI0vesfnGUpxTkY1VmmH9m?=
 =?us-ascii?Q?W00CfQ7fnAVPcF1/zPhRp2ilenMH6yqfn32z4BmI5Wi6M8mlV9J0lRizYz4G?=
 =?us-ascii?Q?iv4MyeMILLi3MKb+8Pv/W4knlrUmYhQCbS87G2DKNOHz7vuqVDFcl0Dyo6bF?=
 =?us-ascii?Q?KCgc6pto/GpraE02NrI5BSFyDqV3EAsASxlJp3HwIiCAuYNJgOPcA+5UwoCX?=
 =?us-ascii?Q?DEOHd2Wf5XDVjzuhiNeJDfZ0S1NzVV4Kn/0y0sLOuH8HGqOpSlkC0R9H6KBj?=
 =?us-ascii?Q?tZn2PQSk2g=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 80eee5b1-c74d-48da-34eb-08df1d3a95d4
X-MS-Exchange-CrossTenant-AuthSource: AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2026 08:29:17.0121
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4da29C7+80dBOq4AR4pLX81FsosqSado641OeitQcCaGlEiBDvCg/QX3yj8cf7X2x8MKnk6qho3cICnSj19t6J710InZuHMKSBr9DsMVKWM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FRZP189MB2808
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 28 Sep 2026 08:29:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246740

- Change SRC_URI to fetch the libpwquality source from the
version-specific

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 meta/recipes-extended/libpwquality/libpwquality_1.4.5.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/libpwquality/libpwquality_1.4.5.bb b/met=
a/recipes-extended/libpwquality/libpwquality_1.4.5.bb
index a303b9e758..707f789164 100644
--- a/meta/recipes-extended/libpwquality/libpwquality_1.4.5.bb
+++ b/meta/recipes-extended/libpwquality/libpwquality_1.4.5.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D6bd2f1386df813a4=
59a0c34fde676fc2"
=20
 DEPENDS =3D "cracklib"
=20
-SRC_URI =3D "git://github.com/libpwquality/libpwquality;branch=3Dmaster;pr=
otocol=3Dhttps \
+SRC_URI =3D "git://github.com/libpwquality/libpwquality;branch=3Dmaster;pr=
otocol=3Dhttps;tag=3D${BPN}-${PV} \
     file://0001-Use-setuptools-instead-of-distutils.patch \
     file://0002-Makefile.am-respect-PYTHONSITEDIR.patch \
 "

