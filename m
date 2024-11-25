Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57E60D58090
	for <webhook@archiver.kernel.org>; Mon, 25 Nov 2024 12:11:04 +0000 (UTC)
Received: from EUR03-VI1-obe.outbound.protection.outlook.com (EUR03-VI1-obe.outbound.protection.outlook.com [40.107.103.74])
 by mx.groups.io with SMTP id smtpd.web11.17419.1732536661684650512
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Nov 2024 04:11:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=Aoiji4s2;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=Aoiji4s2;
 spf=pass (domain: arm.com, ip: 40.107.103.74, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=Nq8fIbl0givSEVdfs5EvWNS26sw1RU7axYcRMpJYGrnCKMwSfUJk9F2R/MiPUYCIM02MkwTQ39px6mg+YazUGKxREwCgvNYhMRJ2IYy5TOzeq3GFsrT1Cmp/6sOGRpUyGWfdVD/9KZIMfL1VduPSA4xN/28Su2r3e2o0aeIkzbDRjmBd8sEsEiSa+B+YyU7MuZB225cTMGNa/OKuQkl/gpykzlcGRtH9s5VUyYdYSRO/4nGLbSjlC8JmgvtRLkYLfvmXsFmhwrp04qCMDM+4rSAWAy5tCLNXwImeaUtHyR/xTX27fBTaAZFsaeIHQHpXQNiVaykwFgR68abTyLn3Wg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hLZip9+v85p/leXasSi80UyCULmB0HHxkHs9w391eqY=;
 b=gsT27xc0k4GJbEMbJGLMytX3jHK2IeJSnOsT1Ayg8l96uhN8c7HqBBCmtdT+y1egcXpSMWE7Gy4qGgRgV/9iV2XjwqanoJJDKKVo/uYqAtp2XFl82kwKAtAZZ7ccwiBAqBgBrFpIlPUuEzvH8NVToRunmy1Yc0NxJu3PmrkHi/3OrT3ERPLf5gtny1rF3Cpb8IsRnLcKwSCIrolunEawoVvs02R89kiRYi8bVaswXGiM2u1ekTuCTY4lhUROYySu0wqinXW1IjP1kFw90d1gH6Bz2aRBkzzbbJGtElRuBZqGz9eYH6dhU831wThiWtjkGN+9CHhZ+xhhmpjp3V2w6w==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hLZip9+v85p/leXasSi80UyCULmB0HHxkHs9w391eqY=;
 b=Aoiji4s2a4mKWDUKRV7rSN3gHN2p+uRpShs7qY209OHd+Vx5XPEFh57u7x0fdv39NoY2em4cfr5Zb90Alxyks9Se79bBUZDvwveICcSh+JJRyb4JpBhV4NdWhs1OJVU+jcDJUhQU0vH6WJTsLM+Co9oijfFVppuNZ+dd+te6kY4=
Received: from AS8PR04CA0175.eurprd04.prod.outlook.com (2603:10a6:20b:331::30)
 by PAWPR08MB8982.eurprd08.prod.outlook.com (2603:10a6:102:33f::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.20; Mon, 25 Nov
 2024 12:10:54 +0000
Received: from AMS0EPF000001A4.eurprd05.prod.outlook.com
 (2603:10a6:20b:331:cafe::69) by AS8PR04CA0175.outlook.office365.com
 (2603:10a6:20b:331::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8182.20 via Frontend Transport; Mon,
 25 Nov 2024 12:10:54 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AMS0EPF000001A4.mail.protection.outlook.com (10.167.16.229) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8207.12
 via Frontend Transport; Mon, 25 Nov 2024 12:10:54 +0000
Received: ("Tessian outbound 6970ca6dd121:v490"); Mon, 25 Nov 2024 12:10:54 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: cc0c9482a46eec45
X-TessianGatewayMetadata: 9/jR+dE13m54BIywHUq0ppRHrPC+j3PVswC5ze6SvnLz//hc7qhNjAbmu+inXMAg1O0z9n2caMWNWXh8TV7A+gF3h4N7sNhVeEmlihBfCTKbFRE0+/UwAL0paf1YjCaostm3b6VW42+Cckurvy4pu5As3S9dGW8ikTipXsKGKh8=
X-CR-MTA-TID: 64aa7808
Received: from L7be9766b0264.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id E1A86A16-3576-4808-98BE-919EEA20F034.1;
	Mon, 25 Nov 2024 12:10:47 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id L7be9766b0264.1
    (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
    Mon, 25 Nov 2024 12:10:47 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZzYJP2lzduEmTr6NorvbLR5rcH5nQcxKCe/21BhLqaCTc3Hcf+qo3hczcxtlAgPYhek2ybo8wa+JVoIGPbRCiELHyqijbjNeZdzL6rMF8cz1Yo31eBY4L5iFqBY2ptBwq4yvDs9b7553mGjOIcA363xweAQurPl94sZGIXDfwmY6q4Hj/uTaBjBJtnlYl3sRC+THeaGDxq6gFOpF7o1Xs49NrKJlIpwswdjsKefQ1TUdWnKQ0GbayR1qtGTDmMzm3Lv2x2Z5BuT2nAHiLtZG+xvBtEtAczB6QS/jrhXB9d771fWyFnHSySslulKes5NgTxdCyznnvKZO4I6eBBEIQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hLZip9+v85p/leXasSi80UyCULmB0HHxkHs9w391eqY=;
 b=LmBytfYUMs7Ljrxp9NUlL37V/DD09Q65JXzRNlIUUw4b61RtRDwx2vjoAdl3wKbV9CjivgfSPVtZtumzyoGD5J28QoKtvE19rFNuOMLPdYN/V8lH0Jup3mBHmm+rMmNhPQBgnNdc3PwTF0ZFJUu6Z2X5TUClhRC8/Tv3BmVGwOdz8WW/VhCLpAvzWDINihyF/r8mpGbMljR3cqhB1U+9FkPZ/eWDXeZlRYLPmkN9DTooUqQRVVD7cP5iF+jUQXX7ZqTsuMVRP+T9YkLDZeJ7Y8wOC6t4fHY6/iW6EUhFUxehtjfjOEJjwEOMwpSlcBagH7u/waXU9zCo50aR1q5Qkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hLZip9+v85p/leXasSi80UyCULmB0HHxkHs9w391eqY=;
 b=Aoiji4s2a4mKWDUKRV7rSN3gHN2p+uRpShs7qY209OHd+Vx5XPEFh57u7x0fdv39NoY2em4cfr5Zb90Alxyks9Se79bBUZDvwveICcSh+JJRyb4JpBhV4NdWhs1OJVU+jcDJUhQU0vH6WJTsLM+Co9oijfFVppuNZ+dd+te6kY4=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by DB9PR08MB9515.eurprd08.prod.outlook.com (2603:10a6:10:453::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.27; Mon, 25 Nov
 2024 12:10:44 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e%3]) with mapi id 15.20.8182.018; Mon, 25 Nov 2024
 12:10:44 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "Marko, Peter" <Peter.Marko@siemens.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][PATCH] builder: set CVE_PRODUCT
Thread-Topic: [OE-core][PATCH] builder: set CVE_PRODUCT
Thread-Index: AQHbPmxbrSpPDvceJEGcx0zVJ2h7NrLH3eUAgAAK6gCAAABnAA==
Date: Mon, 25 Nov 2024 12:10:44 +0000
Message-ID: <8DEB4E3E-A99A-4DD2-866E-B468076C7674@arm.com>
References: <20241124122711.18001-1-peter.marko@siemens.com>
 <7E848D03-BCBA-4C6D-8986-3B4DC9135287@arm.com>
 <AS1PR10MB569758C88F50C1C49C70D595FD2E2@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
In-Reply-To: 
 <AS1PR10MB569758C88F50C1C49C70D595FD2E2@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.200.121)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|DB9PR08MB9515:EE_|AMS0EPF000001A4:EE_|PAWPR08MB8982:EE_
X-MS-Office365-Filtering-Correlation-Id: 259e9d37-75fc-40e0-16f7-08dd0d4a362d
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
X-Microsoft-Antispam-Message-Info-Original: 
 =?us-ascii?Q?VC99g0YEjER60jAOBukj7AzOojD2YFuoK+AgY58LJkjQKpFOsvRJQZ/VW2M1?=
 =?us-ascii?Q?0ltEIwM7qpdCA3ydXnv9Tune+MiSXZx/Jek1Jvhez2xtvL9QsyY2nGKFEKjX?=
 =?us-ascii?Q?GWShQRHAmvIiTSIBLmNUrPX0hTfFVslvvaon8/X2cUEuunlQ8G6qc5hcO2SN?=
 =?us-ascii?Q?akmoYdJUlq0o653Bm1exq/TDeOsmxrpC48+so3wzvk2rb0sF19YyQFSAHdDa?=
 =?us-ascii?Q?A3GqX74fT4vwr7hRTDJjN3mvuqh4t1ylGiB6nlXl9YmPk3Af5eSwtupU5iIY?=
 =?us-ascii?Q?IuzaGpojw387ZxZ+1ejPgWiWnF/yktA3hPv/XaSbT1/HRDRaA6iEbaewWMkj?=
 =?us-ascii?Q?HmWto6fEEBelzZMXlBneXmOftCUd9MPQ/NpJK9qZ+Pq1mQhg0Ox/NA9M6c7T?=
 =?us-ascii?Q?+Z3mwQt+M3ygcog0kjTzMWJV+Kbtrf42TKfLyww9cggw6kVmz496PRyuCiKc?=
 =?us-ascii?Q?ULM9e3XxuF8on7GhFuJYVJIvQGguOkhhUIquVx6KIBmaLyNL81Y/5Qnoro/G?=
 =?us-ascii?Q?Uk91kfe6yRoGhkAvmWJh8aJgrNdG8ZpXnP8wkE/klqRCm0RslLhJHAyOZGK0?=
 =?us-ascii?Q?USkDW1nSvK5qU6TWAMjnAul6lk1Zj6XnEbHknBip1qeVfjWyNFPiJak/mbwB?=
 =?us-ascii?Q?Ur1Oqt3ewAsabhmI9839kZmNStKCXkLnQGOZ2eC5bvUIbN8DYMQ+A9f0DlsB?=
 =?us-ascii?Q?cDsumc+6lzbSS5ls4xjIaxkEuy8NkLCoFq1BIWuWYIlidK5Yg+R8OD9eYaPR?=
 =?us-ascii?Q?NrjEbvodWC6jWuq5joEpJa0ZnNVqEuCkA63Yfx8vZfoK3Z2GO2v7JClMSxBz?=
 =?us-ascii?Q?dQRhygoTFLYUBByqXBh3fhNfOMq/uWISCS0zdpcsK1oqe3WbUEOkJfkZfo8Y?=
 =?us-ascii?Q?ynrV2u9vmQHgEw+0BmLqIblz99Na2Um8rAO3pZqHAxZFPFc/+2d++uzEaov5?=
 =?us-ascii?Q?pf0WOElCin631IdDZjoVNmW+x9wE9Dd0kiBsnJGriGbUlVnUZfSVdRXnX42W?=
 =?us-ascii?Q?kMQQC9bHwumevWwQovIUuDcvAcb5vBjoFjjj0LBPYtyRICl6g7oleTFaBqS9?=
 =?us-ascii?Q?6s9YWCVQC4gZjvxcDVmZM2MvnngBevfVoGMOAuJEp066n/PCIxF8eDQF6JbH?=
 =?us-ascii?Q?j6tAn2C/vkZRL4R45Fx4gO2K9EN7PqVd1WDdvK1fSOrlm6cxF+mevSa0K/Sb?=
 =?us-ascii?Q?THxUc2A9OvirnCdDlGUSEpZrBcMlVl+gdnV4EwHnE2X9Nqpl7DbqzoPsnJCP?=
 =?us-ascii?Q?wzHq2BKkHTCOXCL+Sz6UW7JPHmjYhOxrA36EJU6IP5sXdW5kCtIg2pve9ru2?=
 =?us-ascii?Q?AuEW8ruVm4327p2u85PdmF3MGwX/5hUytqZyb5PilsM6acz32PxARjoNyUBi?=
 =?us-ascii?Q?7pr2valVBSKKKnbM7qKn0TvNvxNRGuFwOX3ijtZ2/6qXgfj81Q=3D=3D?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <E3DFDD51EA161B42A5D72AC8F13E2E86@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB9515
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender: 
 ip=[2603:10a6:102:2a3::12];domain=PA4PR08MB7411.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AMS0EPF000001A4.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	c6a2aec1-edb0-46ea-d9e1-08dd0d4a3062
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|35042699022|82310400026|14060799003|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?YXxuX/EnRflAUamVWsT7CHdiIOOCr4LkkxiTon0u2o5K80HDtJ5rZsUcZf0J?=
 =?us-ascii?Q?voB4mbUYgiPi5IsLX5bn4n74ZVWNlZvZSWWAVIQtrUf2gbyRtZZP4NSr0eVa?=
 =?us-ascii?Q?6Io/Jslctgq0LItApwuWyPJR03uNjtaYPwrQhsMV9ZrrPeRi4Plv2EJ5cx4O?=
 =?us-ascii?Q?xLAdY2d1NkPaDu2g2oyQ/s+ewLdkNvU501HVHFckVIMYrnlhCYvfq9EiUhG7?=
 =?us-ascii?Q?587HUEpx+7DYNc73ORayUhrkABuTxGKRcPClcvKA5XBrF8roWDTFVaGD/nWC?=
 =?us-ascii?Q?nbTNDoEwMtDQsi5wWti095nXINrHNKi5IK3MYJs73b/QuyUpXyctqPvGzavv?=
 =?us-ascii?Q?1P5Ygm047APrG761Zc5vcS1en82WvKH7sdMuPuM/rr5faUbzzkAxWV5UKEI8?=
 =?us-ascii?Q?tBy3sNmfm0qIw4A7V/vB8HIb4j3WwmbsDEFWMepZy+xA2QcfSD1DubwnyxQM?=
 =?us-ascii?Q?TBBAACp7YqiIAq4ThNr+CHhyYlyxzo4wV0vePUByNF9+Tc8ZKATLdFR2jTck?=
 =?us-ascii?Q?FFrbBEWXRqhzTCSH+CQ/CGRfZjGzhFENtLWx69JxxdsUFrlIpHPLlSHXpRTm?=
 =?us-ascii?Q?JaBYR9HSRKk7vsC/YRJV07g0FRtGsfXC1MzMpT67OD2r0oe3rzjljX1GsNyg?=
 =?us-ascii?Q?lCGEeBI2Q3hWk1tQrcguEMqoixQVt4twdMYbFXLPZnK68+U0b5IrUmaUHbGN?=
 =?us-ascii?Q?8uycLekxs75kwVzXvn7vhPBBXDztIiCd0dXE0SyPmOYz1E6oCCcStWLqvOuo?=
 =?us-ascii?Q?PlHdRESxnY5T6w6Nsij6z2X6i18HRPVFCY1/lPeF3MtvKxH6QL175RW7rBbD?=
 =?us-ascii?Q?HeSPWnCV5ODR56N7UlsQlkAjV3i7QUPytsSgaxrNyyMKz/rB1TVUyDbne73U?=
 =?us-ascii?Q?PKfrQUritErDwWeJiaalgLNqSXv5vI3RCBOZj0luLssfsXgxuLGWYqF1c08z?=
 =?us-ascii?Q?D+PnHdD1ll97Uy04WBT4DxaO8ivCrwo2TzY2F298XBbwCx3sj1xsLzLR+nJe?=
 =?us-ascii?Q?+n8Ca/UNhYB2IPAw+K6ueo9P1TVwNKK+rdBh/SLNspUUrtuPCXsIVZhE0Rce?=
 =?us-ascii?Q?0Q0gth5HobQMcrSTyMP7s6P9Kr36rdvvs9K7AxHTW5P2+JGVuTCVToF/aDTo?=
 =?us-ascii?Q?raZyhwlZjKlU9VQPX8AJW+gw7ovBw4MW+GeO17ewkr+AJTWrmv92y8pKxUBY?=
 =?us-ascii?Q?sYjgIJCrdeFIJCPiGSH9nWFnXiy4xqXX1Yu8pChYJalM6EqETzHSKupDddxP?=
 =?us-ascii?Q?9+u6C1FnUKOW7WNPJBgvXUL/38kfebvBTgTA9NnHrTLm0yIEAy83qvzm9UBz?=
 =?us-ascii?Q?fEtZw3hTFWpgM0HM1jfwWDSTb2bPm7vY73FXAW3C8A8wijhFDKWW39W5vIxW?=
 =?us-ascii?Q?VwMeoPbjZxjXz4AudDZdTZPSGBg7XMSq+JCBraDdbKNcgkqgKjytT9by6O5D?=
 =?us-ascii?Q?McyrpizCwD6QG+0Cp5GfpWMY1ooBfbTz?=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:64aa7808-outbound-1.mta.getcheckrecipient.com;CAT:NONE;SFS:(13230040)(376014)(35042699022)(82310400026)(14060799003)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2024 12:10:54.3671
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 259e9d37-75fc-40e0-16f7-08dd0d4a362d
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS0EPF000001A4.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB8982
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 25 Nov 2024 12:11:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207785

On 25 Nov 2024, at 12:09, Marko, Peter <Peter.Marko@siemens.com> wrote:
>=20
> Hi Ross,
>=20
> I have realized this and sent v2 with yoctoproject only 10 minutes after =
sending this patch.
> I guess I have forgotten to chain it with --in-reply-to=3D, sorry for tha=
t.

So you did, sorry about that.  Drive-by review over a coffee on a Monday mi=
ght not be a good idea :)

Ross=

