Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12B09D74EFD
	for <webhook@archiver.kernel.org>; Mon, 26 Jan 2026 12:55:37 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.66.69])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.18736.1769432128650088188
 for <openembedded-core@lists.openembedded.org>;
 Mon, 26 Jan 2026 04:55:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=jRxqYDbl;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=jRxqYDbl;
 spf=pass (domain: arm.com, ip: 52.101.66.69, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=y1uasa97Y0H9H0Zi4xvURqHGd8kCDlLrxcr2w5riCG5Cq5AZEx9I/YwnEch6fqC1CfXIFE0pTeqWXO/WCE9Ej9I7L0LvTueYRwlCmcSKFi0SE9PVoxLGSxP6hgQhLhbAXyPInfwVci6Fiy41LY65Zq3XFg4IfsiaHB2MTBcGUYxHCbD1bBz6LEw763NY7VJxcKMTVE5YMX53IZBL3Td94wHT+7cVRuO3yiZbZFTpvz1NPL6wP6ZYKwzi7u87pRgUuxJkdRJ/wm4Ewr3oZpjHIAkzBTlwAXi3sdpeQ76Yq1f/HT7QdbpuiE8CMMSL0pp6Dum4ELs33LSX4vgK2rKN0g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=37Ox0eAt4EmGFVtzSGym0pOhY+kPpgr1VqEwXGk+QOI=;
 b=Z4r93+B/A8rRXqhTQ7uzjtke9UkObL12etxAoHVLYjfE+v9cyOrzzUDNvbXu3Mu8WVTbke4+7tYDmTK0zLMEFNyhIdRIkkRqKOQ9PhYiJiTW7Mt2QZrCE3Px6gVIMeLXG9AMoJyUzlQ9PRdm1+LaBjqeBfQWG5u37i5mZSJMKGm+ahCSn81PB4FC98JZqZcf96oxodzP80pbiBtVCbYFQrLOgicBuD7ui3H06u28Vr1zWYKa9S7KMHmrOd8GEnJcbKSQkFGgFwBfArkPyFcMQFtzGdd90cboWnc5mMYy6XaeaDbUHA6ma1fnloe8Dj3k4/z5gdUgsm3KaDAI6sjTPQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=windriver.com smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=37Ox0eAt4EmGFVtzSGym0pOhY+kPpgr1VqEwXGk+QOI=;
 b=jRxqYDblRZFZqsjqPqqzt0otWp+G6VHQzy71IZLeo3ZYLEPTCE2p59NhtpMkMq5eVrD7rw30L5ZL5zZN3ZL60JDHQgsiA7HcyOuGxDsWaWNGKHUTEsNjCpmNhb2BiQInK/utYeciMJUCtcTMU2R+PGA0ahoGJZ/Q/aUlRwULJng=
Received: from AM4PR0302CA0002.eurprd03.prod.outlook.com (2603:10a6:205:2::15)
 by AS8PR08MB9905.eurprd08.prod.outlook.com (2603:10a6:20b:565::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.14; Mon, 26 Jan
 2026 12:55:24 +0000
Received: from AMS1EPF0000004A.eurprd04.prod.outlook.com
 (2603:10a6:205:2:cafe::33) by AM4PR0302CA0002.outlook.office365.com
 (2603:10a6:205:2::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.15 via Frontend Transport; Mon,
 26 Jan 2026 12:55:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AMS1EPF0000004A.mail.protection.outlook.com (10.167.16.134) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9564.3
 via Frontend Transport; Mon, 26 Jan 2026 12:55:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ry+NN6i6FU74ySoEC0PWZNpgZix9Ndo6CSPqJLmk8cErAfZPpkbVb7fTx5B+ol9kiswPr72vRIbSW6oB1zMHfDsDHNiNQouLG47cJno2Velb2lWr/wNTmow2Dol/llf/mm+FBBEw4oO7zUHUpOvbf3ULn+lIssRq8MWD4cnLEkfSUlaZ/0FspjyY8d+0NwRsZvp6QquT/Ojh21v75iIEuetJKrcz9XWvPWud2tdC6ew61myk354pFszG2ytum/BLKmkyoqQhqAzXiB0nGWHJyaXnWeQdWCEATx1Yim3+qJk2DZRYvPagD5I3aqlnQwxNi/7FXY6R+REg9FlB8XWjyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=37Ox0eAt4EmGFVtzSGym0pOhY+kPpgr1VqEwXGk+QOI=;
 b=x56HiVads2lN72DB5IIpHUpvGJwSJDlHN+NV7BR62JAZ6WLs85tONEPPFAe0n443VFEl3328LSVgHMcV3rBTRX/oCvKSR5oj7PyYc87I1XtoUQJ85k1LNHuCZPhpf7NWgXkCiJPgoQUAq85kaTTtYr0UoJHnLS/ak6Dd+rUK4qbdo67ULGjDVct6jS4lHxp5T9mWYzBizxts3RfAlKOUW06qJ+CDFhh+uPxmg8NWC50pdqAUZ2uyCc04KtIdGq0P5ANZURmapIazZazEYx1tyOlRGWOilY7vCKAlSdjD8QlAjwkxiWp9n5nIndsfuc8xP3KX2RZk27EPPWwIzyktXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=37Ox0eAt4EmGFVtzSGym0pOhY+kPpgr1VqEwXGk+QOI=;
 b=jRxqYDblRZFZqsjqPqqzt0otWp+G6VHQzy71IZLeo3ZYLEPTCE2p59NhtpMkMq5eVrD7rw30L5ZL5zZN3ZL60JDHQgsiA7HcyOuGxDsWaWNGKHUTEsNjCpmNhb2BiQInK/utYeciMJUCtcTMU2R+PGA0ahoGJZ/Q/aUlRwULJng=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by DB5PR08MB10114.eurprd08.prod.outlook.com (2603:10a6:10:4a3::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.15; Mon, 26 Jan
 2026 12:54:20 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7f73:806a:3493:7d50]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7f73:806a:3493:7d50%6]) with mapi id 15.20.9542.010; Mon, 26 Jan 2026
 12:54:20 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "Qi.Chen@windriver.com" <Qi.Chen@windriver.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][PATCH 2/2] systemd: add shell-profile-dropins
 PACKAGECONFIG
Thread-Topic: [OE-core][PATCH 2/2] systemd: add shell-profile-dropins
 PACKAGECONFIG
Thread-Index: AQHchcVsujZAPfOooEOhrRebzz5R/LVkei6A
Date: Mon, 26 Jan 2026 12:54:19 +0000
Message-ID: <8D1D3F71-DC47-43B3-B513-5ECE95A34D28@arm.com>
References: <20260115021918.1926514-1-Qi.Chen@windriver.com>
 <20260115021918.1926514-2-Qi.Chen@windriver.com>
In-Reply-To: <20260115021918.1926514-2-Qi.Chen@windriver.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.700.81.1.4)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|DB5PR08MB10114:EE_|AMS1EPF0000004A:EE_|AS8PR08MB9905:EE_
X-MS-Office365-Filtering-Correlation-Id: 0364aaed-3598-4d16-6e68-08de5cda2b34
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|376014|1800799024|366016|38070700021;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?RmlXdk5NYmNjY0tMNFdDd25nZ2tTd0xYMDJsUTQ0TjlpZExFL2I5RjZtREkv?=
 =?utf-8?B?ZUI0dE8wYmhGK0xRaE9JcmxJaUE4cWpvNzZVMjZXUkE3TXdsalEwaG9xbElN?=
 =?utf-8?B?ZitNUnZOaGZ4MHptWmh0THBmRXBNRUZlU24vaHlIUVIza2hkMEtkQmI3Vmlm?=
 =?utf-8?B?KzRNVFFGUkd5ZmlQS1IzNENKa1dKVmY0UG5hL1JTdGNNNEd2TW95Qis4V1JP?=
 =?utf-8?B?UndYZnd3NVEwd1V5cTBVMXIzc0d3TFgvc0dvam92TEp3QzNiVjFEeDlnRmhR?=
 =?utf-8?B?RXcyUi84VUdVSFF2em9xNzhIVHVlbFR6WnlhTEZZRHpFTlp0aFloSVFZeHhC?=
 =?utf-8?B?N1cxU012WTFnN3dleFpWcXplaFM5K01WbnVVS3dJdm1QZFhpY08wMXhxRkRT?=
 =?utf-8?B?cHQ0VmhUYnpmdzRDMGVmZ09qSlF4V0pwNUFKaExJSEsvWnRoc2xvYlJJeXJa?=
 =?utf-8?B?T1kyZzVQNkFUaUpvbEtiNXdCL1hMeDduZXQ4RDVOcjNlNzFKSW9qRU5YbFVu?=
 =?utf-8?B?aUtyZk5kQ0hWVHNaTzArTGdqYUNzT1dsbkw2Q2tQMDNCUk5vZ1hMVkw1WGNr?=
 =?utf-8?B?SXVpdW1xSUcySXArQ3djaXFOc3UwTXpyamgzVzIxOGVPMkhUVFdhN1M4aU9t?=
 =?utf-8?B?VExxSGVUZFdocEQyQ3ZadDhSMjZTVjYxK0NhQkJCUTFlYzREQzl1TzlDOUFj?=
 =?utf-8?B?bktkQ1Btd2JqSVZ6eG5DcjVtNkdEdng3cmVsWVVvS3F4VEs5WG9zTktFU2Zk?=
 =?utf-8?B?ZUJvVkNKR1YwNy9HL1l5dTF1WWQyRG5tZTh6TGwzV1hTb1ljRTZ3Rk5WTUdk?=
 =?utf-8?B?OFhZL2Z0VDk4cy82SXlxelZ6VFkxL0NIYXgxWGFaU25zL0RreDlQczlrQ3pL?=
 =?utf-8?B?U0VZeDFpMFVyU01oU01KVTkzYThKa2FpbEFENHpzc2Zic3dNdlM5cjVQT3ll?=
 =?utf-8?B?dUd6V1laWGVwenlNaWo4WW8xTndmbk1pTTQ2TmVsdEdjMDNVRkpGSElwQnc5?=
 =?utf-8?B?aXExTFNnbE1tS0lYNHZNUWxnYXhjUzdZV0VWMkV5VEFSYWtBdkRqQ2J0OWZH?=
 =?utf-8?B?VDdOZmFLMUpzV0E5aWxDNnllOGxuK2FzUmhMMkh0WVQvdFhXUlBQdXgxbHBJ?=
 =?utf-8?B?L3F4N1ZpMHVEWmkyL0d4V1FkSk0wL290MytYaG1Kcm9ySCsyTDBjQTBPV01V?=
 =?utf-8?B?a0hMUHl3bmJRSjlrWUE4YjdBc1p1K1R0SzA3UldKR0IyS2FBZE9TbFdMZUdl?=
 =?utf-8?B?dU1Idy96bE9naWhZNnpERnNDbVB0OFU5c2p1NmRnRnVoSTgyMSt6RWdUYjJy?=
 =?utf-8?B?WFQzRUFiTDNCM0RPZHFieTlHOGRJa3RubG5PQlJXOXlaamZCNnVkUngrQlVO?=
 =?utf-8?B?c1Q5WXp3aFlGZk9BaEZSSTRIQVJCZmxvc2xEeWtSWmoweTg0Uk9hQVY3ZHdG?=
 =?utf-8?B?UTFWb3ptam1rejFhTnQ0TWxkN0xFWjlGTmg5MDlsMWEzSEU3NnJncVdsWGd4?=
 =?utf-8?B?U3dQems4dkdkTmhoK044a1VzWTdlbnJ6VDRocUp2WnVlSHRHMzhyTHI1T1VP?=
 =?utf-8?B?QmFacUVnWXFYSHpjSjRwbnBjMy9IR2ZnVFpuNzMraGVXNlN3cXRCL245c3dj?=
 =?utf-8?B?OC9JNS8ySDFyWXlvLy9XR1NhYVdoUlIxWHlzakE4eFRyVm5nNGFQSXhEOHRV?=
 =?utf-8?B?TDMwVFcrL0pUaVBnSDJTbzMzVHdoblpzSHRTM1dkRlJrTThWT05jZy9jNXo2?=
 =?utf-8?B?UHlCWHIvS3gxMEJrZDVuWW01U0ZEaWNDMEVLdE4wZlRqaVIrcS9pQWVoWUdS?=
 =?utf-8?B?NVptZGJzRTRVQWxqNVM5aGJTVHdZVUZmTXZCRG1YK1ZXSGs5ZUNaeEVqOExl?=
 =?utf-8?B?cmlObnBiUVFrVzkvbHYvUjREL2dTdjRTOUFDdjhURG5TRWpPdTljSitMblhk?=
 =?utf-8?B?dk56b1hCaGQza3pjWEoydHQxbmtqK0hzRVB6c1NUVnQ1RWxmNVRYQ2xPelJz?=
 =?utf-8?B?aGVlK2tpbnkxVjBZTzVGTFk5TUVUUHBIdWdVUWFLUEJHN3dJa24zZjZPQnpO?=
 =?utf-8?B?aGxDa3pMTnVBTUgvR05JU1h1QTVyNzJiR2MxREROME1hT3NkOG10Zk5Ncy8r?=
 =?utf-8?B?NTFvT1FGMDRrWE12SjdMMms5aDNpMXNqODRPb1paNmNYWHdVbWxhMlRSNS93?=
 =?utf-8?Q?JblXj6l8+t9E1wvPrhQvs1k=3D?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <DC3D23551AFDE2498919CCC229B32DAF@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB5PR08MB10114
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AMS1EPF0000004A.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	baace5c3-fec8-4b3c-befa-08de5cda059e
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|14060799003|82310400026|1800799024|376014|35042699022|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?aEtlMVduRmdmTmNpWmpmUzgwZ3I4RFNZTjNnYUVPMnRBcnQyem54VGZxTTNG?=
 =?utf-8?B?N1pzSmtReHh6bUl3dmhyUVg1MExINFBhdzR1MHhZMGNwdk1JRGNtNEJEM2VK?=
 =?utf-8?B?TVVOS0pranp3S3RDTWcwYTRoTXlHRVd2RFNjSXVudGVKYktEMlQ0RWRjb1VQ?=
 =?utf-8?B?dFo2WUFtWUJpOFFwenI3Zjhpei9IZTEzZU02ZjJCSGhlN1BManBGV3ZtTVgz?=
 =?utf-8?B?NFNsTjRFVlNvL0ZDOW5ZOGpqUFRhQXQ2QjJkTXpzVFJDVzMyMWw0T1hDcnlS?=
 =?utf-8?B?WFdpdlRYVWdob09lRTZzc0lHbDBad0ptdWJPMFN5c3FyN3J2aVpnNVREZ0d4?=
 =?utf-8?B?ZG1ja1p4MTdQcmVRQXYwQzZVUkVpdmcvZUZQMS9PNlVCcGlLTE5zNGdvbmty?=
 =?utf-8?B?K0J2cjNSZU1DMVNSV1NVZjJyTmhWcXd3UXl6S3BhZnJqMXJSc3RJRm43T2V2?=
 =?utf-8?B?cHRlNUsvWlBSTEQ4QzIwZ0ZVMUxyYjlyanBHanJMVTNuQlp3T2xRc3hiRlAy?=
 =?utf-8?B?ZHRJRFcxaDhpd0F5Vzk2U1RSV1ZNUW5DVGUyNjhBOHVvZ0FMaHN1Mlk5Y1JR?=
 =?utf-8?B?clRvNnR0Q2NqMVRrTVBJUHJHTGFQOWRMODNtRHFER3lkd29URm45cjJka0FD?=
 =?utf-8?B?QmVUUWVVT0sxTFpTTFYwVW5sSEcvc25Na2oxV2pIRmF0T1ZJL1Z3MDhFbHJm?=
 =?utf-8?B?M2pQeS94Q1ZkUk1RSzBicTNLREhpRGNaMUM3V2Z6NHBoNlI4RS84SVBnOGZy?=
 =?utf-8?B?TXduM202SXJKelRqWDV4a1FwenFVZ1FrbW9Qa080VXZEcFVvK0FieTRvMTlO?=
 =?utf-8?B?Z001NWprWEJ1RjBIeUFzUWhYV2RLRlNhdVhsZmhhTVFBRjI1RjBYK3ptQWhk?=
 =?utf-8?B?SDdFd0pMdjVNcnRGQTUxYVJCdWdpK3BaU0NsS09sUnU0TXBMQWlZTU9zYU82?=
 =?utf-8?B?WkErR25pMkN5Vm1wbWZWZDBJTVhCZmlIK2ZDTFNSdjFwUVRIOENuVHBPTGpZ?=
 =?utf-8?B?eXNvVkxJVzBzbXROOHZGdEw3OE83VjdpRmRQOTVTakoxTDZqWE83dnRMbWQ1?=
 =?utf-8?B?dWJqbFRvRXFpd3p2UW1kb292OW9KWi9GaGZKZHZIak5SaGp3c29DeVRQbm5l?=
 =?utf-8?B?RlVhZWRIamF4S0I4dEdkbGxzamdQWWxEVVY2Y0tvMklvaU5CN0xrUHhoQjRR?=
 =?utf-8?B?WStBTWE1Q0krMS9OWnIyZ0F3VjJlSHJENmFHT3JDT3N5UWJRV2swS3QvbGJE?=
 =?utf-8?B?KzBlWk11SVMrZnJCdTg2Q3ZSaUd4dml6Z0lvTWlvWkF3dTQ5TUJ4TXpCRVRQ?=
 =?utf-8?B?eFRrQ3J5ZTlRdVFCWHpzRnpYeWlXRXJlV2dUMFQxTnNQSWNWVllnaUZTdU5z?=
 =?utf-8?B?bUJDZi9iOWlOREc0MmRqUWdDUlpXM3BwdW02UEI5YjBIK1pvRUM5SDdTM2l2?=
 =?utf-8?B?Q2xyZjZoSHl1Z3BzKzJVTVBDLy9uTXRVNkt5UUJxaFlyOG9TZjMvUFpXSHcr?=
 =?utf-8?B?TkJnNlIwekZDMXUwSjBiQUNENDM3MlRrQ1FOMEZnRUNRQzJOU1pJaE1xaGh3?=
 =?utf-8?B?cERVZEdoTGhNN1BUdVJGNzF3MVV5OTNqemdLSEYvQTB5RGpOVHNVQUdwTUJo?=
 =?utf-8?B?SjREYmpSQzhoT3c5UldaUkp6TkFPbVE4VEhxanJzYWpBa1d3emNDVTg4T1VY?=
 =?utf-8?B?bk5KR28xeWdyOThjOWIyWitPWXlSYS83Q3hMV0JpeWplSjB0QjJ5ckNQSklL?=
 =?utf-8?B?Qk9YSmVLSE5LRi80WmdLNkpwRmxadGVvRE5ONFlwY2ZWaTlFNStvUWdwdHBF?=
 =?utf-8?B?TWQ3a1dmMUtKU0lVR09jVCtnOUlmaWtOWm1Ec0NLOUozMStndnhHVGpiSUp1?=
 =?utf-8?B?M2tWQnZkaktRZHcxVjVpQ0VZNVZ0bk96ck1kdjFjOTRHYm0rNjhMTk5UNS82?=
 =?utf-8?B?Q2YzZlN2aDFaU1JxV2syMWYyQUhRSTRZYnFyUG56ZGV6aDFpMHBNR3NRWVZx?=
 =?utf-8?B?ekI5YUE3RUVpa0hGVmFYYW1VWnkvMWxnQXlwR2NLRzU4d0dMbzZTSDA3ands?=
 =?utf-8?B?cDNHUS8yNk1mN0FRVCtLK2ZPUWJzVjNuWWV3NnhDUGQ2Y1hicWw5bjRUS0Zu?=
 =?utf-8?B?WEYvTTJ3c1p3eWZTOC9Dd29vNHZTWERpU3VGcDduVnRwb0hZNGFIZXBqTEtF?=
 =?utf-8?B?Zy9ITXZOYXRrR2c1U0xwVzJwdm9qZlRrdzNtZ1kyQTl2TkpKb0YyM09mMi9G?=
 =?utf-8?B?YnBlOUZuV3ZOMHJUSENGMmlMa1ZBPT0=?=
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(14060799003)(82310400026)(1800799024)(376014)(35042699022)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2026 12:55:23.0339
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0364aaed-3598-4d16-6e68-08de5cda2b34
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS1EPF0000004A.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB9905
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 26 Jan 2026 12:55:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230003

T24gMTUgSmFuIDIwMjYsIGF0IDAyOjE5LCBDaGVuIFFpIHZpYSBsaXN0cy5vcGVuZW1iZWRkZWQu
b3JnIDxRaS5DaGVuPXdpbmRyaXZlci5jb21AbGlzdHMub3BlbmVtYmVkZGVkLm9yZz4gd3JvdGU6
DQo+IA0KPiArUEFDS0FHRUNPTkZJR1tzaGVsbC1wcm9maWxlLWRyb3BpbnNdID0gIiwtRHNoZWxs
cHJvZmlsZWRpcj1ub+KAnQ0KDQpPbiB0b3Agb2Ygd2hhdCBQYXVsIHNhaWQsIHdlIGFsd2F5cyB3
YW50IHRvIGJlIHNwZWNpZmljIGFuZCBub3QgbWFrZSBhc3N1bXB0aW9ucyB3aGVuIGVuYWJsaW5n
L2Rpc2FibGluZyBQQUNLQUdFQ09ORklHUywgc28gdGhlIOKAnGVuYWJsZWTigJ0gY2FzZSBzaG91
bGQgaGF2ZSBiZWVuIC1Ec2hlbGxwcm9maWxlZGlyPSR7c3lzY29uZmlnZGlyfS9wcm9maWxlLmQu
DQoNClJvc3MNCg0K

