Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3977CCFA03
	for <webhook@archiver.kernel.org>; Mon,  3 Nov 2025 17:19:14 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.26])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3012.1762190352193178588
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Nov 2025 09:19:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=R2gzcxk9;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=R2gzcxk9;
 spf=pass (domain: arm.com, ip: 40.107.159.26, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=R0v7PLNoRxOZA067vfEuiO+0nM19fO5vFd3zJ+G/VPRg1FUFQ7psu0om7xqLzHq+fB5e/b9dLntQCgR1gBCgcelVVbA/FdiDdoc1qxUCQ1LEQlf3vY+958mnQeEsEdpv0rvs6WHkUVcOmDZhGAgfEvVnVnAneSLNUwsi/ZgYPLXA3otKakNT2zy42P9O6jlR65hZvs0W5BIljbkVOL20GOoFHF/Jgn/Bl+NF54JD3pZ34hMTu++hRCwSbMDIRY45iOnNN5B75e1lVWYeYASDLVsvi8mN6puMGh+JeYvCX87EeNPcUjKu1oXqSxzwMlF4jUcJ2bWg8n7p42gD3XDeLQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=71VL+ePc9oDbpXwuxi2k7Fp177+nQ1UiYKgIsepNd14=;
 b=f2Hnpm/WgxqZw4x6toA1pvGBsL1Ys/8dWvNFta6pIbzBIMYwzzXwHsTciNsoLK+P+P5xSHWwQiENIGdk6LbKKdjHBEwrgQSqPFwb6zTn2Vd8dxFn40O1DKw273TTn5ePfVbaXQhHWCIPf4vnBa48oKtMEGtdTEFq/qt8papWs8c7I6B1DylL13X05U5WhS3C4sFfu9iNFGPm56O6lZymgAD7HKH0r58ryZKiin6L7S6NXAVq5WaZx9NW97YZp96vFFjj+ScAZcRtNhBJ/TVvGZzmH0Gob7/+XWGvvHSrCAu9TRWeSQY4PLDODfEMHJ5+yARFCsBbFqK2Nt0pXX+mLw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=schnwalter.eu smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=71VL+ePc9oDbpXwuxi2k7Fp177+nQ1UiYKgIsepNd14=;
 b=R2gzcxk9IG/xk6yIrkPW1nYmXN5JnPsu4et0kws/htaDSh6SRbG4DFEMyQm70y5TFnvciqQrJLbuoTem9cLhWOV+m/MvvMomcRANwkTmQPAqZh5FenS6xXdKVqEDkmPnPWzsrfZlsbAGr2xbOhm7nbbpixNl9bOEMhlFbuOrdVY=
Received: from AM6P194CA0001.EURP194.PROD.OUTLOOK.COM (2603:10a6:209:90::14)
 by PA6PR08MB10694.eurprd08.prod.outlook.com (2603:10a6:102:3d7::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.18; Mon, 3 Nov
 2025 17:19:06 +0000
Received: from AMS0EPF000001AF.eurprd05.prod.outlook.com
 (2603:10a6:209:90:cafe::5c) by AM6P194CA0001.outlook.office365.com
 (2603:10a6:209:90::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9275.16 via Frontend Transport; Mon,
 3 Nov 2025 17:19:06 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AMS0EPF000001AF.mail.protection.outlook.com (10.167.16.155) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9298.6
 via Frontend Transport; Mon, 3 Nov 2025 17:19:05 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oFFWuenEKWI966b9KC+o3lOruEWddwILe7DitRZGr5q+q5Q/0BLueVx9KjcgKE/dzM58lcR+Kzu91g1Jrci5MGBVWi2nTnGJikn4qG802cVrqUD8ifTW3bDOnMNpsSjLZAXyTPLudq563HNh/gWwu5O40maCXNbRNiEOkcJhAgS4BF5x4EL3MTgLJ6yfskCzwFO2WI8RoUhlD38sxttRwhRsooFrp0nVmZ1MQniDZIEPBxdOLkmZ4qg+0WmpN/sLMESBss+RAVoKVBg3oSuxztErOWKAdyuoDJWus4xh1WW2R+d7lqqfkTt2Pb78/aH93aT8oeTaujSy8ukzKwiXZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=71VL+ePc9oDbpXwuxi2k7Fp177+nQ1UiYKgIsepNd14=;
 b=IYMC7xA4XXmKWTwUiRPtHs6kKRq/k+E1BPqdRkEZLZ3lKcMkBC+T1vEX3J4Ngbj7flMGrXHCjnBQUJPTgmmH/TEO4tmX5TlboYaJhiy2Aj4sddBqZdvEgt0i1IkRzPt3wW5rgoiHKRKb+if83j0iZFQelcfSbun57h009Kpz199GRpEvx3a6aIbmwfS2qMA5qE0CNvG81s1H+C6r4xH1ebrb1VDc7CDHlu99pdwzqlSc5iDysQmXBXX53rGAhZLPLCI0qqtuHv/qeLRUVubtNIfZ3q4ud7MVy7nk3N/GIsicoKErH2OuKeO5vmP7inK294Bx96gUjpQvfQj6mqMHzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=71VL+ePc9oDbpXwuxi2k7Fp177+nQ1UiYKgIsepNd14=;
 b=R2gzcxk9IG/xk6yIrkPW1nYmXN5JnPsu4et0kws/htaDSh6SRbG4DFEMyQm70y5TFnvciqQrJLbuoTem9cLhWOV+m/MvvMomcRANwkTmQPAqZh5FenS6xXdKVqEDkmPnPWzsrfZlsbAGr2xbOhm7nbbpixNl9bOEMhlFbuOrdVY=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by VI1PR08MB5327.eurprd08.prod.outlook.com (2603:10a6:803:13b::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.16; Mon, 3 Nov
 2025 17:18:33 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7f73:806a:3493:7d50]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7f73:806a:3493:7d50%4]) with mapi id 15.20.9275.015; Mon, 3 Nov 2025
 17:18:33 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "contact@schnwalter.eu" <contact@schnwalter.eu>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH v2] features_check: warn about nodistro in
 message
Thread-Topic: [OE-core] [PATCH v2] features_check: warn about nodistro in
 message
Thread-Index: AQHcSNub6aYJAhj4CkS52ojm96mpRrThOf4A
Date: Mon, 3 Nov 2025 17:18:33 +0000
Message-ID: <595BC9C5-23F9-4518-ADE9-444B165D51F5@arm.com>
References: <20251029135419.12883-1-contact@schnwalter.eu>
In-Reply-To: <20251029135419.12883-1-contact@schnwalter.eu>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.700.81)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|VI1PR08MB5327:EE_|AMS0EPF000001AF:EE_|PA6PR08MB10694:EE_
X-MS-Office365-Filtering-Correlation-Id: 1bdc5431-2018-4ab5-9e7c-08de1afd17b2
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|4022899009|376014|1800799024|366016|38070700021;
X-Microsoft-Antispam-Message-Info-Original: 
 =?us-ascii?Q?3Y7eZU7/IHOCQFYjkTt8xdBMhuKtu1RryIIud6P/k4PCg6tM6ojNlYOswFrU?=
 =?us-ascii?Q?s3fjllovJ7Dx0d1/oNdVDADitkRXWppCEHL5O6RwOztbWkguFU9zHduMgFNd?=
 =?us-ascii?Q?eXXes0r5plts0iXJVEquc7GZb/gYojkzOTosc+lyAXh53nFGn/08xYs2dIr+?=
 =?us-ascii?Q?eb1AaiOopH/4GluL68pJzVwlAckub//Dv2y6TDW6CyD9KLvjlle2kGUfQLVk?=
 =?us-ascii?Q?FBEf0IuatCQ3D3Wazpqsvc+AbC285Naw7tSV2f7Xw+RDxOOPSF+FWN/TVmWw?=
 =?us-ascii?Q?foGUcGkfe5MAU287cpBK4dFjHF3cJpnJGJdlELVQ8xqf7kUyBAg1hWQy6LTl?=
 =?us-ascii?Q?igD3KWE9B00rajV3Onru0Uqy2PdULONtVsjk8h+9UrMpnhnrn01LI636ufjZ?=
 =?us-ascii?Q?bvFFVO4d1PYrXf1Yohj7KEEELTxnntlPf484a/fxQ/iDCGNBKS4SfZaeCopQ?=
 =?us-ascii?Q?Ol7iZ4wfDAVT3cZzS2VtOyU8ZVqbFmx1t9VBGDNgbBnEFGGRicYR9bOYqg5M?=
 =?us-ascii?Q?L2wR4dAhvRK8dy6G7n3BaXf6BZQaxOaAJhMaMefRj01R7RPty41aETQjwcRb?=
 =?us-ascii?Q?I7rV3jTjBMI300RuGJ/8kU3WzekQAbcJDS74L3zQidMr0M1u61zAAzv2lEc7?=
 =?us-ascii?Q?cAEGxBok9f8gwG3pT4nhIPLe33fEbFPUw4XMS8CwXpDd89n+lO+aeSmoRves?=
 =?us-ascii?Q?NqTwLDJH5lD73S/NbCiPZ6COHlsYHYzEnB866x8YQigOQM1AzrIcHPfMh4IN?=
 =?us-ascii?Q?Fb/a9E0ocscnbl2rjGAt6Nd3h22uMG9Hg8cWOCuyTRCpFQPbVteZITYXIWZM?=
 =?us-ascii?Q?KL87kekCuZXoZ9JNx4qTMHEjuO3XIfnlyGQ7yT9C9JFU+o/S6z5/kki9MDtg?=
 =?us-ascii?Q?lVbhTNhK+MHH0pxcwfJ6DqohRr2HL1z94ImYFSAZP2K1G0oRrJbcRo0J2yHO?=
 =?us-ascii?Q?/PBidXXsPyQTzU1GmTt1hTLAzp3y7isvR1k/ennLzpp9BXcqsJwVU8osPUE0?=
 =?us-ascii?Q?MtR5wAMAwGXr4ifgzjx5nAtyhtRUcTXjiwnnTe/ogyhHKtdM1SYLtyWpWTMa?=
 =?us-ascii?Q?902IKhOfSRcfLvWJSw1Gmw8J6lm4q7aZryeZtKhXZRAO4hUKv+mU4MwaVLwL?=
 =?us-ascii?Q?mYyjHUau2iY9mMHUl22Mon0vVRzxaW1SBw/3vEFLvf4BWKyNzvZaKZD6sS62?=
 =?us-ascii?Q?gDtbZrsThppdITRKxrZfBj7Z1D8rdh/YEYx3EmNgDRE52hb2OmP7fjkThdJK?=
 =?us-ascii?Q?OxStAmAnszomW6KoiPpYNqv+L+KaFDuD7FaOJztKeIwV/SPx6Iglb+/7+k00?=
 =?us-ascii?Q?ITOg+0Nno33DhBBrfFgu5rOwLHXfkdzBolBzVR4y/8UgZlgWgHjrjNXSkhru?=
 =?us-ascii?Q?vaHhzchd5wFehrZJuR6et+w36W90QL9dZ/+PoVHcVqBMEBfLIPrHqDd7d9Rq?=
 =?us-ascii?Q?8RHOcnhn4nA9gxitx6AMQ5KFxu3TAFOAg09FRty4t9DT63tR9GFj/w=3D=3D?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(4022899009)(376014)(1800799024)(366016)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <DD4CBE6166B5E34FA25BEE79C657D6BB@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB5327
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AMS0EPF000001AF.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	e198b468-ed81-4714-9ade-08de1afd0413
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|1800799024|14060799003|376014|35042699022|82310400026|4022899009|7053199007|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?44n1Kgr9kvfwFhh8bQ0ZQCBYdBtiatxuP+mybB/LAxB5Z8hFcUcVEyPoKlVK?=
 =?us-ascii?Q?AZlRvJdXatgKHQMXvjNUUgQvRkVjnifHPMzSvahTKrlHEtviu0KUeXXrA/Q5?=
 =?us-ascii?Q?zvAxG9f/V6afCXWA4PBCY0oXG6166a1SUKfDf/K4kNSCOB/dEJWcMg6KxEct?=
 =?us-ascii?Q?gbYg1r42sq5pueGbuCDtPaocA9Ydyt2084lZpRIUneZzuEsmxUOboEjkhhBh?=
 =?us-ascii?Q?kJ888yUYIn9uaorc2b5/1HPg3z/1A1/UopLyEQ9eLHR5x6hxUbGLG3XZa3t3?=
 =?us-ascii?Q?hUUWNbK3lBaP1/J1NIovbuW31f53PHrcFtYnyT6cL4lhltZsYVp0ELXJsytl?=
 =?us-ascii?Q?Wj2p2jat5DwBzHqayWjfvIiqAJjBKBtDPXDUfb7Aclkq8P4h9BI2z/jKhlk2?=
 =?us-ascii?Q?lRwtTYB5w0UtbDXPZX9194OvvbwpW1N8n8+C0rjMbrLwBLToUjinC8Z7oWbJ?=
 =?us-ascii?Q?RqkCjzQet3uviPZfG4VnKbpZNGcGNnnuAfz94pWZRB+fjkRDpinNr6q1EO9G?=
 =?us-ascii?Q?7mJfmNkazdBPfQAlWeizrets8yGilTOm9sL7qa7Ez5lmTgHbddMu3oj0vKsm?=
 =?us-ascii?Q?nnsYooOn2vQZuF0JWuQ8B2+hZ2mkZkcqHEgOxzBzvmlgSK5Pf9b9dKP8suI+?=
 =?us-ascii?Q?emijUNni4tVsu8jMuqtuQ5JCHuMfbzGGo+ZJTvng9GD4CdW0TsB5qhK8u4T0?=
 =?us-ascii?Q?tdr+eg7MkkOE5dnPQVc15LRvML4NJHcGu3KBN1BE63ZDqHf5lx8fX1vfqvVO?=
 =?us-ascii?Q?urtUjdSMgQgVLHP3bo9ehTvofhj9BFwWFyW3OB6RwJ1ovTEUfdLHnYPVzxU0?=
 =?us-ascii?Q?TL/E4e+CiE+JmbKqsbYbaGfDSCuuP+jtn4VCxRFY9QfMZfT9//Easxtew0ai?=
 =?us-ascii?Q?zkmfQpMczRg+7mPniEKCuIA52kAV1DIpo0Llh/kPIWIxhtpIQPjBGgd/Wcy1?=
 =?us-ascii?Q?+5prFL7f+RIwfb60mOFW07WfYNiA7oxcrxdF+sDsW3e8r6pUN1Qx4BNXovfw?=
 =?us-ascii?Q?zkUh51/0swqJN8tL611Ff7YGwFhy+DUgsqCq59OAyobm7U+Fzi3MENjWWilZ?=
 =?us-ascii?Q?3kI+IYIMUy8u9jRUZVHjJzVl0pfQSnMJRvGvuBfB1Wid0IXK8eotDhvGwiF0?=
 =?us-ascii?Q?mXteN/6Y9UKQ80Dy+z+rmig0C6A+Czjyg32Iycpj/73CadAQMmkVIPNU3ABJ?=
 =?us-ascii?Q?eprcSd/EoP548qc9N7up7G7V1a8mIezbcXbp5BuL9yQgglB4MU3yNFdk4QVM?=
 =?us-ascii?Q?pTxQjTV8rIqO9VTW5qx7Vn7+LgnPWGw/yqNPZIvN8r/Qn6arWD2aShV/7KP/?=
 =?us-ascii?Q?XxgqmGRUnO6n+lqMZ4W/pdGmcYg6/YtpxIIiSmQxE6vq9Ke59Y7zaXggFpuo?=
 =?us-ascii?Q?jimgf6pro5IRq8Hnd+LBkMvLQsLPHGl14D3HHScDALLS0of22LmZRdM8uwY9?=
 =?us-ascii?Q?CiXth+8NMsV5o+Z3prP9gFnX3VocFvF+lZfsPhn6Xd8zmdUDMP+aCEtOhFad?=
 =?us-ascii?Q?Nznc6s21sn+3MkDy/p2tsedkiXV5n0znBf7d?=
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(14060799003)(376014)(35042699022)(82310400026)(4022899009)(7053199007)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2025 17:19:05.9406
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1bdc5431-2018-4ab5-9e7c-08de1afd17b2
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS0EPF000001AF.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA6PR08MB10694
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Nov 2025 17:19:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225684

Hi Walter,

Can you rewrite the commit message to reflect what the new code does?

Cheers,
Ross

> On 29 Oct 2025, at 13:48, Walter Werner SCHNEIDER via lists.openembedded.=
org <contact=3Dschnwalter.eu@lists.openembedded.org> wrote:
>=20
> When a required distro feature is missing and DISTRO is set to nodistro,
> provide a clear hint to the user. This helps newcomers starting projects
> without a DISTRO configured who attempt to build images like
> core-image-weston that depend on specific distro features.
>=20
> Signed-off-by: Walter Werner SCHNEIDER <contact@schnwalter.eu>
> ---
> v1 -> v2: Changed the error message.
>=20
> As pointed out by others, the message might not be technically correct,
> but I think it's good enough for new users, experienced users will know
> that they can either update the DISTRO_FEATURES or use a different
> DISTRO, new users will start asking question why they have "nodistro"
> and wether or not that has something to do with the missing
> DISTRO_FEATURES. This is how the error message used to look like:
>=20
> ERROR: Nothing PROVIDES 'core-image-weston'
> core-image-weston was skipped: missing required distro feature 'wayland'
> (not in DISTRO_FEATURES)
>=20
> And now it looks like this:
>=20
> ERROR: Nothing PROVIDES 'core-image-weston'
> core-image-weston was skipped: using DISTRO 'nodistro', which is missing
> required DISTRO_FEATURES: 'wayland'
>=20
>=20
>=20
> meta/classes-recipe/features_check.bbclass | 9 +++++++--
> 1 file changed, 7 insertions(+), 2 deletions(-)
>=20
> diff --git a/meta/classes-recipe/features_check.bbclass b/meta/classes-re=
cipe/features_check.bbclass
> index 1e0eaa4eed..36ed4fa4be 100644
> --- a/meta/classes-recipe/features_check.bbclass
> +++ b/meta/classes-recipe/features_check.bbclass
> @@ -42,8 +42,13 @@ python () {
>         if required_features:
>             missing =3D set.difference(required_features, features)
>             if missing:
> -                raise bb.parse.SkipRecipe("missing required %s feature%s=
 '%s' (not in %s_FEATURES)"
> -                    % (kind.lower(), 's' if len(missing) > 1 else '', ' =
'.join(missing), kind))
> +                if kind =3D=3D 'DISTRO':
> +                    raise bb.parse.SkipRecipe("using %s '%s', which is m=
issing required %s_FEATURES: '%s'"
> +                        % (kind, d.getVar(kind), kind, ' '.join(missing)=
))
> +                else:
> +                    raise bb.parse.SkipRecipe("missing required %s_FEATU=
RES: '%s'"
> +                        % (kind, ' '.join(missing)))
> +
>=20
>         conflict_features =3D set((d.getVar('CONFLICT_' + kind + '_FEATUR=
ES') or '').split())
>         if conflict_features:
>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#225456): https://lists.openembedded.org/g/openembedde=
d-core/message/225456
> Mute This Topic: https://lists.openembedded.org/mt/116012468/6875888
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ro=
ss.burton@arm.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20


