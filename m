Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48C05D26D77
	for <webhook@archiver.kernel.org>; Fri,  9 Jan 2026 17:04:21 +0000 (UTC)
Received: from AS8PR04CU009.outbound.protection.outlook.com (AS8PR04CU009.outbound.protection.outlook.com [52.101.70.29])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14716.1767978254273866184
 for <openembedded-core@lists.openembedded.org>;
 Fri, 09 Jan 2026 09:04:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=Ov8+j06I;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=Ov8+j06I;
 spf=pass (domain: arm.com, ip: 52.101.70.29, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=b7oVj3s10Rpez/HNLaDNR6WXXBaeLoawS0DWiOe4s0MdhCAFFEgoKVGyREdAw07sEGTxVFja88RbemDZEhUQAXN+nhBHY2ZQbCHlv2xyp/2ZcWzjmYNB4i6kFWnW79cy+JYm6XmWXldqr1DK7H1n7Lie38BcT5rAGYhcwhXCitsYAqlu07IvMNPn/t/k0cMrPhubMjTjja6zQlUpF+9yo8awhg2F9EOqhpi0XJBJQWpQkSu1jMqlNqENSNs3YtFaAISNzXmLhvKLRqs1U3LENXvOCD6b2RExyZojuddLKDEH8wCYya0pGStrhEJBKjCABfWjgJriFEfyX5c8A4GrHg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ouFMR0KZGpY+gua1ipq4AArR7vGnCLDNrd6DTMuy+R4=;
 b=C4BJPSOf2r651SFzNmNXDJEyKhy6QRBd1wToUYfg3p5pOn3OalmJj7f1wyYFG/4GRBAsAu9Dt4LHnizx7Bikum4ps9kkQt8gshFFSYL5solUQOUf8oKJYq23VnqFp3L1gOFdRnPfmHJRy7chvIl5iCQEcM0u+87B58eAk11BWRqcqZNbMF7xwCA+zpINf8y47nFSvahSo8zSxf5336TiucqF/A24BeMhTlCAC7dM4zNSKazJlobw+pghVR3CbklteSIxRk+QrN8S9Xy4sDrl55fEXox6P9OpJkf1Y/6EvdRplUh/PjBn5Imfmjj1aFqgQvBljiwXLPezKpxqee04pA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=elder-tomes.com smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ouFMR0KZGpY+gua1ipq4AArR7vGnCLDNrd6DTMuy+R4=;
 b=Ov8+j06IVLzl+w3pbMMIUxr9fTJjkgcIyoxFjwQ0k2rIl4W10wen567OU5Ms53tYQ3r/7rwfCOgIeFyDRFC7c7yYbxbVmuH/zg3wUbQs1fKsYLU/yD59umig6Q6Xjind8zBq6S//P+T9Id3Ubn0XijTErJYZfHl3/IgIjjA8P40=
Received: from AM4PR0302CA0007.eurprd03.prod.outlook.com (2603:10a6:205:2::20)
 by PAVPR08MB9700.eurprd08.prod.outlook.com (2603:10a6:102:31f::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.2; Fri, 9 Jan
 2026 17:04:08 +0000
Received: from AMS0EPF00000195.eurprd05.prod.outlook.com
 (2603:10a6:205:2:cafe::2d) by AM4PR0302CA0007.outlook.office365.com
 (2603:10a6:205:2::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9499.4 via Frontend Transport; Fri, 9
 Jan 2026 17:04:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AMS0EPF00000195.mail.protection.outlook.com (10.167.16.215) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9520.1
 via Frontend Transport; Fri, 9 Jan 2026 17:04:06 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eF+lIvsvaPF3fkWRTPxB66MxHg2kgmOvNZjueCEt9pmtj8YTVMoqDCwABPiLYMRmjQmkz1mYehMGXgXEHYZ2A34U4IZuVn6mxpS29RuXLpYDPMZ6rLO3FZU8jn94YtulxmoxDXbWUH6sYqDK6Vbakh/vMcQKFXWYTnx9GG+/tMkDB8/iqOH1saEdx0/v2OWA9pJjfrbcaaEOnZD0SUYlNd3y2XkrJSUPBSZso1+BlvLn3pt+JrCYDjEA/0XivcnTlYfZlPLUHbQlYfEoR8/mJf2PddaIKaUjdsXuoP79cyKSZJXsHVngI06Shyjg1H1ypz3v4GhQvJvTKRFEOcHbHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ouFMR0KZGpY+gua1ipq4AArR7vGnCLDNrd6DTMuy+R4=;
 b=oP4emvmGk+ScS7zW+WTr9oVKrqdkqCN8wCzChdvWcQ2SfV57pe4rn23gc9A3WEf2GVNMi2fS9+mk4C5gUu5DcvIiqQSeqsyMESw1FerkwGZKKeXD8ZizwxpQfMSXLEns2vWJZ0Cl7XrIe4AdDpmqyeC/4qN/u7zRMRvEg1v/ZuEAVVUsn8o+CdF7C+1EIelegAFM0yrHrgsQP0ynpNL2XEByRbwjRopS6VPmBniaaVH584cYYygRuNNi44dKRdLPF2j8WXXV3Z7Dsr4BA/S5Kuaq4lliSgCmT57SuWQ6olniqfpTf+82St8Gu5S61pRG7F/Ax3IdP3dcJP15eL4NmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ouFMR0KZGpY+gua1ipq4AArR7vGnCLDNrd6DTMuy+R4=;
 b=Ov8+j06IVLzl+w3pbMMIUxr9fTJjkgcIyoxFjwQ0k2rIl4W10wen567OU5Ms53tYQ3r/7rwfCOgIeFyDRFC7c7yYbxbVmuH/zg3wUbQs1fKsYLU/yD59umig6Q6Xjind8zBq6S//P+T9Id3Ubn0XijTErJYZfHl3/IgIjjA8P40=
Received: from AS4PR08MB7429.eurprd08.prod.outlook.com (2603:10a6:20b:4e1::9)
 by AS8PR08MB7768.eurprd08.prod.outlook.com (2603:10a6:20b:52d::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.4; Fri, 9 Jan
 2026 17:03:03 +0000
Received: from AS4PR08MB7429.eurprd08.prod.outlook.com
 ([fe80::8db5:7772:a426:2afe]) by AS4PR08MB7429.eurprd08.prod.outlook.com
 ([fe80::8db5:7772:a426:2afe%7]) with mapi id 15.20.9499.002; Fri, 9 Jan 2026
 17:03:03 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "levi.shafter@elder-tomes.com" <levi.shafter@elder-tomes.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] image_types.bbclass: make fsck optional
Thread-Topic: [OE-core] [PATCH] image_types.bbclass: make fsck optional
Thread-Index: AQHcerSVn9MuUHXWTEeOj4JbqE48MbVKHiyA
Date: Fri, 9 Jan 2026 17:03:03 +0000
Message-ID: <C7184CF3-DBB2-4AE3-AACF-875B74E60632@arm.com>
References: <585429b3-5763-4c61-97ae-2c73266c887d@elder-tomes.com>
In-Reply-To: <585429b3-5763-4c61-97ae-2c73266c887d@elder-tomes.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.700.81.1.4)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	AS4PR08MB7429:EE_|AS8PR08MB7768:EE_|AMS0EPF00000195:EE_|PAVPR08MB9700:EE_
X-MS-Office365-Filtering-Correlation-Id: 1ff57387-5689-4182-a175-08de4fa11946
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|1800799024|376014|366016|38070700021;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?UUJVRmZxZmVobjFEMUhGZ2xNRGJQZjF5ODhtWExKTmoyV0dXUFN6QTlHRzZ3?=
 =?utf-8?B?cjhUeWhhenVtdzh2QlNaT2VjUk1DbmN4cUNLSWlWSFMzWVptNE1hUVo1Tnll?=
 =?utf-8?B?bE9PZ1psUHRiMlA2YmRDb0owbmFkb2NYWko5UGVIeEVxWWpxYy8vRnJvN2Yr?=
 =?utf-8?B?UElvODhnaWZNbTdnSUUzS0U1NHBncTJLYnBqSENkWFR4SGZKNkxIVHdLeW1K?=
 =?utf-8?B?NzRNbm5ZbzNFU3krdlhSNkgrWXRCcG9SY2FON3FFZlk0WmZRQnlhY0lMRVJM?=
 =?utf-8?B?dzhWZmh4Z3F3ZkN5MEZ5YVlBR25LdUVNNHNqYnpxbC9pellTekw5L0I1TXh0?=
 =?utf-8?B?c3V2QjlJbG9BZFgwNnc5blRqaHY2anhSb3FCUlM4SzJxaExUc3l6K25DTEY3?=
 =?utf-8?B?aWV4NUJDZXBHS3dWV3o2Tk9FMGI1TkFMOWFvamZkUzBRaXZOSTdTSkJsZEY5?=
 =?utf-8?B?ZnI0QUtZblpJTFRJTlBnMkx2aHgyOUgydW9LU1hxSll0MDhtbEQ5S2VEYVQy?=
 =?utf-8?B?VEJCSUF6L2Y0NU9BOHNicm1nMmpWeitjWGsyd0huWjkwRndtcWZjdFc5bFJ1?=
 =?utf-8?B?NkVoUnNrbDZzT0t3Ti9hRktSUnFIQVBoZ2VJTXJGY1NxUUM5UkZDYVhMeTZ0?=
 =?utf-8?B?YmJyL3U1dUc5MjBZaSt2ZjdnU0ZkSjFOdDZ1aU9OK0g3dmd2RXBzdkVSMVpN?=
 =?utf-8?B?UHZid1Q4Nk11aDE4VGdRV00wQS9rRjlQaUg5am5zNEFrRElRMWw0aEN4Z2cr?=
 =?utf-8?B?Z3NGdFFxQktLNzN1bUpEc3BVbklJQ01ZVzREeFgxR2pEU1A4czhTZmhwMDVa?=
 =?utf-8?B?Rm5wQUV1Ri9LcWIvMnV2RDZJVFJ0RVRQRnJkdjZFcVkzUGtPa09YY0dHK21Y?=
 =?utf-8?B?bDdobjFwMHJJKzMvZGZHS0I5SGZpYzBMeFZyaTUzaWhBOVhpeGlKRkFOTGZm?=
 =?utf-8?B?MzJ5UlBpSEl4V2FtNUdFWUxQRWhIM21GQ1FsZnUxNGpndEF3YVJQRDhDNFNr?=
 =?utf-8?B?ODRyUE9HcWErL3lFRnJabml4NGRVNjNFa1Raa08wSWtTUVhUcDVacG5vZnph?=
 =?utf-8?B?a1ozQ285dUlOOUNma2tWN0tRdU4xUEdOTVRhcVhDZktrNVZJL1B5Qjc4dVMz?=
 =?utf-8?B?MmhJYlMwZENRbzNBWW9sM2FLS1c0ZkJKWmlZYWEwQ3p3UVdBaFlzNjdISlNF?=
 =?utf-8?B?SlRsUFRpeGEwalMxK2dRYzdGWVN5dkFrL0RxSUk0d1c4bmxqTEo0U0pQQlp6?=
 =?utf-8?B?dWtLRGdiY1NMMEtyVEZQU1dkVjYxOFR2RHgzMzhuNVRKbjRvSmNDMmpmV1h5?=
 =?utf-8?B?QVArY1gzM0o1OUFrRy94MzJWOXBYSUI1QThIekhWY3lkL0o5ZWlub0tZYmlF?=
 =?utf-8?B?bTZNTU5PbE5YRWxDdjFnZ0hKY3hQaFRSV2NpYWRkbHIyQjVjMEdSb3plTWNN?=
 =?utf-8?B?NDBaZTVjek1Pa2ttVFZXaEg0cXIwTlhhUGNSNkNXYTZVMjZvMW9pL2RUYWFJ?=
 =?utf-8?B?MHJibFVJYk1mdllFU2ZXVUorbGIzRCt6ZHVHMUhyTHpXZEl0SjRQbzM5eEhB?=
 =?utf-8?B?VWhjcThqaEJ4WDlCeGQreC9SaTk5Y2xqS1JkTXNLeDB2UjYxREUvODY2b3p6?=
 =?utf-8?B?ckwrSHZZVjVaaFMzTThkNTNMb3VrbUFYa3RRbVJsUTkyUzlPS0ZSQzBkNEVp?=
 =?utf-8?B?N1UyVUxqNG1wWWs2QndsNWw4QnVBejNIQnNOQ3phM3dFYXVBTFZOWlVrTFp3?=
 =?utf-8?B?eWR4eWl5S3lvTWVRdm9EKzJQL2UrSzVvWGtYeXBlcmdWdktrdXFNVGV3emxv?=
 =?utf-8?B?SEtKNEk4eFQ5TUY3WlRKTERKUHFjeURGYmVrd0dyK3Q0OGFIeTBORU56WGQx?=
 =?utf-8?B?R0xSb1NWM1QxVXkrNWZmUHdGZDN2dGxQMW83OS81d00xcU1Mb0ZYT3FuUDdk?=
 =?utf-8?B?RVRaTEk1YkdkUGp6TnFaNGdnQUY4SHQybDdzSDJHbE5iWkNHSGdDZ3JJelVj?=
 =?utf-8?B?Q3V2Ni9Dbk1Zdjl5L0RzQ2lTYThkTk51S0JUU0JZWlU3N2wvdVFPTEhVd0Zl?=
 =?utf-8?Q?pfv1Vo?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR08MB7429.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <9D16F3D221B90A45B739A67EA1A1E249@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB7768
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AMS0EPF00000195.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	69dd2dab-a9a6-4b9f-739e-08de4fa0f3c5
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|35042699022|1800799024|36860700013|14060799003|376014|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?Nm5HdWNmVHVCSHJkTXRHcWczc2VwZE5ybm9KaXBRM3J1NytPSVdtRzlnOW43?=
 =?utf-8?B?ckdna3kyajk1UmM3cml1Q1FIRUpySDJvcDRVd09XRVJkVnpISG12anNGWHdJ?=
 =?utf-8?B?VXhMaGVySG45N0dBYjFKd3B6NzBOZXRJMkh4OUdOdUN4cnZMR1BWK0x3SHVF?=
 =?utf-8?B?QmFpbnpxQW5PVmdBcENsdDVucEV1Y2xlMGphcnFnOFZJSXE4bWhTRkgvRFNC?=
 =?utf-8?B?VnR1NUw2cVhaWURwSzBBSWUyYm9Vb0FyYVQ4UTlWWDlQZXNLcmNRZkFaUXVD?=
 =?utf-8?B?WUVrQlZ0eDUvcHlkNXdwaGRjWE1sU3dYSGRnWUZWL1hoQTJpSlQxZEtiaDV3?=
 =?utf-8?B?MUpnc0loMlFCc0UyMjhibW1hUytkZkRiZTVpbWo4VDVVNXd2azI3WEtkL1JN?=
 =?utf-8?B?bU1MbXFyN0ZxcUg4Z1FRWit5TTV3dlBiRExzZk84RkhFWHVlRkJVcHJpaGYv?=
 =?utf-8?B?SEFPQ1k5V0tFQkdGQzRVeFlwUUJ6S3FHN3lmNnVta2RHb2cvamZhejNWRWdV?=
 =?utf-8?B?SnVob3ZGTU5idXhwNFd0eVJPeDVQT0Z6UktHTnNpTDhrT3hlb0FkWk1xMzgy?=
 =?utf-8?B?K2ZtdTBQZWlWcWJ0RjJ4V3R5NEJ5cmlKdUhqQzF2a01kcnIvTWN3TmFFWjNv?=
 =?utf-8?B?dlhOZzV2TFVCMm9ZRHFkYnYvMnJHUnkzUU1FNTZNWFp3QVprUTNZMVFxSE14?=
 =?utf-8?B?b2locW8xM21JQXZYL3hjN2J5OVdWUUM3d2JObyt3K2xqbDBtdUNGblI2MTkr?=
 =?utf-8?B?YmJ5dGNzMVVBNm9FMk9DNHhsL2YyQ0QreUpUNmFMa1RFZm03UTIzN0I5ckpm?=
 =?utf-8?B?bURlSm1rbEZoNzMrbWxKeGl4VDJuNW9vWUJ6dmtrRHJlVHdzZVlPQXBScmF0?=
 =?utf-8?B?aFhuL1dMZTJEdHppWnJ0bnVmSVpjdnB5SDZNVkVySktnQmZhcWtIbEJsWVNp?=
 =?utf-8?B?bzJ3SlR2VVExeUZIYzBiUGdmM01IUFFjZkpITWx6eGFwWXpZdzhtTUlESDVl?=
 =?utf-8?B?QWVsZWFOTHpWTXlROUNLdzNUbEdvOWQ3cFpYRGswRW0rUkJKcTJ2SWFON3c1?=
 =?utf-8?B?N2ZTUWc0YzRpZ2tTTjdjV1R3am5EMUdqNGtyNnVlbUFxMm54SlZIWHc2THhN?=
 =?utf-8?B?ZU9kZ0ROK212UGJ4RWxnTGpVSGJIbitUNEd2bk4vajYxcS9KQ3FKRi9KVWpC?=
 =?utf-8?B?TEtQUU5wbTBSZlNIbnVLSlNYT2p0VnowY0hkckEwSFd5b3YvVXk0b25Ec3NG?=
 =?utf-8?B?VWtSUWJGckl6dkNybHAxbUdzSFY2RjdzWFF6VGF3eWM0ZXFSZCtpbmU5SjA2?=
 =?utf-8?B?T0JJVXdjWUdNamFSenA1K3RwRnZsSU9VOTZ2aW8zTHpGT1c0ZmdESTA4cFN2?=
 =?utf-8?B?TVU1SGhXdy9rODVhQUFZT21hVnlmZnhIRUh0WW5vcldPOW96ZEQwMFEvV0do?=
 =?utf-8?B?K3NldWxuMFh3MVk0cmQwUEtxeC9zODJuRkVhc2Q5OW9zNGtESXdQaC90bUZU?=
 =?utf-8?B?cnErTExXZk10VkVEeml1TGhlQXk0V0JKL2FUQk1WMTRWM1AzT2ZDbE14RzVE?=
 =?utf-8?B?bmo2dGRrdG4xTFZCSzZ6aDF0MGtQN1FNSUd1YmVidGh4OWNhZ3BHL1cyMkRj?=
 =?utf-8?B?NTgwVzVBRjc2MmE0TDdKTmtCY2MvM3lidy9TTHdUTHNhenpLQnRvbDBkT01T?=
 =?utf-8?B?b2tKbWYvOGs0dGZLM0VPZ2RaN0lrOEljbmx5MHZhVWdwa2YyR2t3L1IxaTdP?=
 =?utf-8?B?T0JwekxnNWhPeU1JcTdRMzFOR2wzZy9qeVAxbFpwU01CRHRLYjF4M1E5WTNk?=
 =?utf-8?B?RjF3UVV3VitBMGE4VWptL0xkdnJaODA4TW1tall0MW1JV1hNUjFIOHpHOWdh?=
 =?utf-8?B?Q0pxTm0wY0dVLzdBVXg2T21HNmxTMmVHVWVLand5VmxjOHIzdnRZTTVoT3ZR?=
 =?utf-8?B?TXNNelNsZzVQTGEwNHZZWjRrU3dQc3VsTU1yYkhhWlVXQWh4ZWpMQU1rSGR3?=
 =?utf-8?B?L2EreWw2bmdSdzNZSTRpYm9uYWdGTWZPYklWL3AvYlZhV1dpakwvK2xLUnor?=
 =?utf-8?B?aGRydC84NVpyRStyQ0k0MDZVUzU2L0tkSkNaSFBMMnlHM2JUd0EyRWQzRXhH?=
 =?utf-8?Q?M+hE=3D?=
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(35042699022)(1800799024)(36860700013)(14060799003)(376014)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2026 17:04:06.5187
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ff57387-5689-4182-a175-08de4fa11946
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS0EPF00000195.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR08MB9700
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 09 Jan 2026 17:04:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229142

T24gMzEgRGVjIDIwMjUsIGF0IDIyOjUyLCBMZXZpIFNoYWZ0ZXIgdmlhIGxpc3RzLm9wZW5lbWJl
ZGRlZC5vcmcgPGxldmkuc2hhZnRlcj1lbGRlci10b21lcy5jb21AbGlzdHMub3BlbmVtYmVkZGVk
Lm9yZz4gd3JvdGU6DQo+IA0KPiBUaGUgZnNjayBpbiBvZV9ta2V4dDIzNGZzKCkgd2FzIGFkZGVk
IHRvIHByZXZlbnQgYW4gZXh0cmEgcmVib290IG9uIHRoZQ0KPiB0YXJnZXQ6DQo+IA0KPiBodHRw
czovL2dpdC5vcGVuZW1iZWRkZWQub3JnL29wZW5lbWJlZGRlZC1jb3JlL2NvbW1pdC8/aWQ9YTkz
ZDAwNTkzNDENCj4gDQo+IFRoaXMgaGFzIHRoZSBzaWRlIGVmZmVjdCBvZiBpbmNyZWFzaW5nIGRl
bHRhIGJldHdlZW4gaW1hZ2VzIHdoaWNoDQo+IHByZXZlbnRzIHJlcHJvZHVjaWJpbGl0eS4gSW4g
bWFueSBjYXNlcywgdGhlIGFkZGVkIHNlY3VyaXR5IHByb3ZpZGVkIGJ5DQo+IGltYWdlIHJlcHJv
ZHVjaWJpbGl0eSBpcyB3b3J0aCB0aGUgZXh0cmEgcmVib290IHVwb24gZmlyc3QgYm9vdGluZyB0
aGUNCj4gdGFyZ2V0LiBUaGUgdXNlIG9mIGZzY2sgc2hvdWxkIGJlIGluY2x1ZGVkIGJ5IGRlZmF1
bHQsIGJ1dCBsZWZ0DQo+IGNvbmZpZ3VyYWJsZS4NCj4gDQo+IFtZT0NUTyAjMTYxMTBdDQoNClRo
ZXJl4oCZcyBzbGlnaHRseSBtb3JlIGluZm9ybWF0aW9uIGluIHRoZSBidWcgcmVwb3J0IHRoYW4g
aGVyZSwgd2hpY2ggbGlua3MgdG8gYSB2aWRlbyBmcm9tIFlQUyAyMDI0LjEyIHRhbGtpbmcgYWJv
dXQgaG93IGZzY2sgd2lsbCBtb2RpZnkgdGltZXN0YW1wcyBpbiBmaWxlIHN5c3RlbXMsIHNvIHdo
aWxzdCB0aGUgaW5pdGlhbCBleHQ0IGZyb20gbWtmcyBpcyByZXByb2R1Y2libGUsIHdlIGRvIGEg
ZnNjayB0byBjbGVhciBmbGFncyBhbmQgdGhleeKAmXJlIG5vIGxvbmdlciBiaXQtaWRlbnRpY2Fs
LiAgSXMgdGhpcyB0aGUgb25seSBzb3VyY2Ugb2Ygbm9uLWRldGVybWluaXNtIHRoYXQgeW914oCZ
cmUgb2JzZXJ2aW5nPw0KDQpJIGRvbuKAmXQgdGhpbmsgYWRkaW5nIGFuIG9wdGlvbiBpcyB0aGUg
cmlnaHQgdGhpbmcgaGVyZSBhcyB5b3XigJlyZSBzd2FwcGluZyBvbmUgcHJvYmxlbSAobm9uLXJl
cHJvZHVjaWJsZSBleHQ0KSB3aXRoIGFub3RoZXIgKGZpbGVzeXN0ZW0gZGlydHksIG5lZWRzIGEg
cmVib290KS4gIEFzIHRoZSB2aWRlbyBzaG93cywgd2Ugc2hvdWxkIGJlIHBhc3NpbmcgdGltZXN0
YW1wIGluZm9ybWF0aW9uIGF0IGNvbnN0cnVjdGlvbiB0aW1lIHRvIGF2b2lkIHRoaXMgcHJvYmxl
bS4gV291bGQgeW91IGJlIGFibGUgdG8gd29yayBvbiBhIHBhdGNoIHRvIGRvIHRoYXQgaW5zdGVh
ZD8NCg0KVGhhbmtzLA0KUm9zcw==

