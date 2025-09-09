Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4009CA0FED
	for <webhook@archiver.kernel.org>; Tue,  9 Sep 2025 09:44:42 +0000 (UTC)
Received: from AM0PR02CU008.outbound.protection.outlook.com (AM0PR02CU008.outbound.protection.outlook.com [52.101.72.69])
 by mx.groups.io with SMTP id smtpd.web10.9035.1757411081125955697
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Sep 2025 02:44:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=mVhOuUHF;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=mVhOuUHF;
 spf=pass (domain: arm.com, ip: 52.101.72.69, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=RDzqsu/rw7kJ7U2FkC+1hhNHa6B6fQOwFMX3+1MlyJ4QXyrrdKCIIEic22SD1HU9IO5e49CiqEdAm6yoBeX0gyUqYtUy6pWeOy9Tr8UmC+haTN/1ZfnrxtvPcUbeYRRdJTNP9ORjFUUGxbO/7MpeWUT2aCN+9h23cNtjPoqOqa9L5+BkFcnGAg8mc7NJPgo+5qlt1uil9SuHXwVnE1YkQv/y+DXg/5WblSR5oypd5zDPzfLO+ldCqMTq9mWlIBLkfe9t7C89UayBIWmNpjQxcne7+yNfhBaDrnwgrwcNCxOKob7y+pL+m/SfEySrPmryjkpiOWUb0T3t0VNCl4vXSA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=alfk4JMuES9zND9eSmy/BU8Mu36l/TkuG59e7dn8AqA=;
 b=n2eS6aAd5eueDa1o3+WBfcxsVOvDGorgUIv3uNr/ci2p7x5XXkuQUKhZKKu5RbRl3OYbyKzoklINgdPkue8ZXpN2yh3fDnuj2Lh+VLOYQ3MuU+wdPCSjSl6CykG3dJwUG3xN3tYvDRIeVeA0h9mGpJ8Q5tYmlsMye76+7Feu8QZnEK7WaXwIo12p8/9iPbixKi8SZMI1SUoCL925wJeb1QVU7lwo3aR89261mRdX19fZsgIwD0vLZblyBj+wDyXm8nPBM4B8VChqP81xocpszZQl6fEpXn3okEZ96V2SZua49m1m4W9gyXzGEmU55UXB1t2oJvFsgriGJTdPPcE3jg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=oss.qualcomm.com smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=alfk4JMuES9zND9eSmy/BU8Mu36l/TkuG59e7dn8AqA=;
 b=mVhOuUHFeWRi3PNNQO1mhdVOQgoEfO/Na7iR74ZIXiBuCYKO15ih91+INrnE5JGvgy3Hldl+5HXIwKwVHkAcnDMYheQQ+0MSfWkCbPlUStnf+lo1qLJrR3ygsyVxqaoGmnGmyheWJutGTFw9Yo3l2sU6BOnUMIp19zu3ommsPb4=
Received: from AM0PR10CA0118.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:e6::35)
 by GV2PR08MB11316.eurprd08.prod.outlook.com (2603:10a6:150:2b0::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Tue, 9 Sep
 2025 09:44:33 +0000
Received: from AMS0EPF000001AA.eurprd05.prod.outlook.com
 (2603:10a6:208:e6:cafe::1c) by AM0PR10CA0118.outlook.office365.com
 (2603:10a6:208:e6::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9115.15 via Frontend Transport; Tue,
 9 Sep 2025 09:44:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AMS0EPF000001AA.mail.protection.outlook.com (10.167.16.150) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9115.13
 via Frontend Transport; Tue, 9 Sep 2025 09:44:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DhrpYkuY/NF82UBXR8Vklope0DXPtLTtIC6pk89gNro2xTr+K04U340yQrLahN96aJppc4gf0LoQ1AIooz0GE9npqi5zgmsearuuF1lCMWxfqNkaL7mghLLS2athL+uFcq9ec1uuOqLBcaVB795HU0uxUeidwOqawiMUEmhHJCGuXtSHUiJffLTOVEbmYiSVDkOmXnnO8r9EDbyqTQgO9ev3syap+gkQVNxtZuEv27vhoIK2vpgdnSdgT6N1CYrG5SJuXDu6lQDKs7v3KRzLgkVwCkWycJkUalUYzZLiT3NTfO/vbG0rXb0vECidbdANLcMiGhaHgGKu3lXhVOXXQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=alfk4JMuES9zND9eSmy/BU8Mu36l/TkuG59e7dn8AqA=;
 b=TC3ur9O6TboNNocCcnXugexlbv8bGpg868DWBPXIlqqJZ2BZtM3FJdozSuM76utNm54SX2TfA5bC+DaSv7+CyqhnsiWLjLMzXfd+uWqOuyjgpL30kJWu0J1ZPQTOoiRN/jJGkduyvSYRTSf8Fz7opndM9IoLG/A1PAKWE9g3QoyuL5H/WIYKCe751uJSFhuX40q3MTAph3lczozfs2NU/EwCSEYKJ8qeyRvSdaURCMyiB/myRMcUdpYMPBPLaoHXa+mO84YchXlo79yBkF9WuUbE6mMVoQ4LWg8aaZzZ44IWpzk7060ogIPCz5jWY1F+Ehol3+fNkJFqjoyQ4I8V+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=alfk4JMuES9zND9eSmy/BU8Mu36l/TkuG59e7dn8AqA=;
 b=mVhOuUHFeWRi3PNNQO1mhdVOQgoEfO/Na7iR74ZIXiBuCYKO15ih91+INrnE5JGvgy3Hldl+5HXIwKwVHkAcnDMYheQQ+0MSfWkCbPlUStnf+lo1qLJrR3ygsyVxqaoGmnGmyheWJutGTFw9Yo3l2sU6BOnUMIp19zu3ommsPb4=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by GV2PR08MB8679.eurprd08.prod.outlook.com (2603:10a6:150:b3::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.19; Tue, 9 Sep
 2025 09:43:51 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7f73:806a:3493:7d50]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7f73:806a:3493:7d50%4]) with mapi id 15.20.9094.021; Tue, 9 Sep 2025
 09:43:50 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Koen Kooi <koen.kooi@oss.qualcomm.com>
CC: Antonin Godard <antonin.godard@bootlin.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, Adrian Freihofer
	<adrian.freihofer@siemens.com>, Peter Marko <peter.marko@siemens.com>, Jose
 Quaresma <jose.quaresma@oss.qualcomm.com>
Subject: Re: [OE-core] [PATCH] systemd: stop enabling non-standard MAC policy
 when using the 'pni-names' DISTRO_FEATURE
Thread-Topic: [OE-core] [PATCH] systemd: stop enabling non-standard MAC policy
 when using the 'pni-names' DISTRO_FEATURE
Thread-Index: 
 AQHcG+lTCiL79TKLdkC1JimrZTHYLLSER5yAgAAKKACAAEMAC4AAAbuAgAYNHgCAAAEJAA==
Date: Tue, 9 Sep 2025 09:43:50 +0000
Message-ID: <8726848D-4267-479C-BC1D-3EE8930D3BEC@arm.com>
References: <20250902090925.2904294-1-koen.kooi@oss.qualcomm.com>
 <DCKQ7KX5D934.3FS2DI6M1I2L1@bootlin.com>
 <ABE717E9-255C-446F-A5CC-C33C7D20ABBB@arm.com>
 <18626142A7130E51.28137@lists.openembedded.org>
 <D98DABEC-9D8B-4D6A-ADB8-EABFAADAA502@oss.qualcomm.com>
 <DCKW7R98LZAP.19SKBT6URU40X@bootlin.com>
 <A66C93B6-7EB1-44AE-ABC9-96254953F5A2@oss.qualcomm.com>
In-Reply-To: <A66C93B6-7EB1-44AE-ABC9-96254953F5A2@oss.qualcomm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.700.81)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|GV2PR08MB8679:EE_|AMS0EPF000001AA:EE_|GV2PR08MB11316:EE_
X-MS-Office365-Filtering-Correlation-Id: 1a660e06-a41f-40ff-03cd-08ddef8579f6
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|376014|1800799024|366016|38070700021;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?NkRvQlU5QlptTUw5SEl2QitDWFR0TE02MVhNMU5SaEN1SU9FNnc4M1ZFQ3pJ?=
 =?utf-8?B?ZzhBdVBXVGY2alRZZlBtK3BoMVkxTGU4VlczSkY3WC92b1VEdm1pRVpyWUxL?=
 =?utf-8?B?cHpzTkpoUVowN3p4azA5Z0JLOEkvUDFOTHhVQm1OaUhtTWxhQXdhYklITDFH?=
 =?utf-8?B?cDF3Wlpxd0FjV3lJdGExZVdmMGpBTlJuSTVUUjVzYkpkVks1QktxcG1aY2sr?=
 =?utf-8?B?S1ppdE9RbkR1dWwyODBBYUw5NklaemRVQVlaWlRoV1BqczYySVVYNklLaHhF?=
 =?utf-8?B?bE5jSXoyc01sM3YvajBBbVVNQWkwWDdMSXNrTmo0NkJIa0FzbmJuYzVRUkNa?=
 =?utf-8?B?VXhmRGVkRGVRc0VFcy8xOWtPRTJYdmg0VkZFQXJHU1BMaE1WdWl1aUxJVFR5?=
 =?utf-8?B?M0VlVXFVTTllb3lldXdqb2RHbFhvajlyU2hoY1BWTDZxazRVZ3ZmKzEwK1k4?=
 =?utf-8?B?RFNYSjFzK1lwa0d5VVNnY0N0dTdZeXpBRzVPQmZvSDJCVFFPRWx4YVJsU01L?=
 =?utf-8?B?dUZZU2ZOc05tR0gyTkQ4MHBjWUd4VWpDb1FJK2xIZGtjWGJvZ29lWlAwcVpw?=
 =?utf-8?B?RlBOVEwvdUJPNUdJbTN5bk5wT2NyR1FOMWRMTE9VQTJ5OTZjYmJCV0dCczdj?=
 =?utf-8?B?dWthSUdwVHlSTWR2SkdJWVNGMXQ3cGM0VEdka0x5eXlnRzNIOU5rYXZBZkx2?=
 =?utf-8?B?Tmc0cWlSVDYveUxwbUdIM0xlckVvRjNudGVLQnI3d1MvVEdLd3BHV2U0amU5?=
 =?utf-8?B?bmFKUm1hcGhNV3NZbFZJZ1FQcmxiYVdXM2d2ZWE2bzZzKzc2N0hjUU93QVJ2?=
 =?utf-8?B?SUZBWlJGZ2VVbkNtaHkxOUhvNDZDUGhyZkd6MnFtdDMxUDVZTGsxNWFIZXpB?=
 =?utf-8?B?MnkzQmg3enJmc3BRV08zSGpsQXJrRXJCSkFJc2dncUlXNm84alJHcCtFTzhH?=
 =?utf-8?B?OHFwbUJmM0UrTTkzLzI0UGhkR2hEQkNFazNSUnFvM1NiRnJCcklpMTNvYU1T?=
 =?utf-8?B?VzM2bUMxZEZhQll2Qnh3Vk9kWkNpNldiUk9uTUl2d2dXU2xwZFdUL0d6K21o?=
 =?utf-8?B?bkx2SXFiNVRTTGRFVlhqQVpramZta0NqS2lCTmdDcG45MFFyUUtzeFFXcEsy?=
 =?utf-8?B?Y0NBU1cweWdUVlNHOXVYRzRSMXpUUTU3TVQzOGZ6NTM4WHZFT1NISUwrbjBn?=
 =?utf-8?B?Z0VvZ1k4bkxoTHpKV2ZBa21IalFKZ3oyWWRDYnJmU0hNRzNaa3d0Ylo1MkJ4?=
 =?utf-8?B?OU5sVmxuNXNadFZ0blN6T0p4eG5HY3ZhNllvWTJjRFE5YlU0Vm8yNjJqTDBE?=
 =?utf-8?B?NzNNSkEzalIxRVBYa1JYK2FwV2pzNlNDakhMb2NDY2pMWDNaYzNVWGdXRFhT?=
 =?utf-8?B?Q3ErWXZmcWlYRG1RdDd0VlZTT0lZUUVaSEtBUFU4V0ZQZzFVdzJVWThKQ1Np?=
 =?utf-8?B?ckVCMGlqSE8yTzRlVHJ2N28zcndtRm5rQnlkOC9XczR6ZUxVMU1qZWwrTXA0?=
 =?utf-8?B?b1FRK1BtUW96MmpzQUNYZS92Vm5HTXJIU1k4T29KN1RVLzBFWnMwK0x3UUhL?=
 =?utf-8?B?czMzN01uNE5pK2ZacUZoN0NNa2xOcEFmdGdmcnNZUUlqT29jM1VVMWp0L1dv?=
 =?utf-8?B?M1Z5c1E3M1phYlJXYjJOUDVsY0ZTQkZaTnV5OFU1Z3JscG1oKy9GRkI1UHdy?=
 =?utf-8?B?V0VjRk5yUFZEMURObW5jTFRPTDJkYW1RNUJDTTM0N0Fncmd5cW95M2FiMG9p?=
 =?utf-8?B?QjNPdUtCUzZhWmpVSFB5SEs4UElUQVg1elNtZWdCRUg0ODNocDh5UWxLTVlL?=
 =?utf-8?B?VVRQbVoxeE43QW1IOTZGYUFUOFFwdkN2NEc2NmJqRkpOU3lvYUdyT0FBT0tu?=
 =?utf-8?B?RFc4U0ZQbnV5dXk5T2xqVmFSSTRDUzdhQ2FvTUJqVkV6WWQ5WGZxUWhpWERT?=
 =?utf-8?B?eDVqYkZtOU5jdnhDckpBYzIvY1VIWnE4cEFha0ZSVGc1cmpZeENxejZFLzBL?=
 =?utf-8?B?T3dha21ZNDJ3PT0=?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <4F48CD5073DD4249BE0A02B7D168D1D3@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB8679
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AMS0EPF000001AA.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	748b366e-1e15-4d74-d561-08ddef8561e2
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|14060799003|82310400026|1800799024|35042699022|376014|36860700013|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?N3NaMnZUL1JZU2ZpVzhqTmdjNCtOejB2TFpldXIwM2dPZGFYZTdUSkZ0STA0?=
 =?utf-8?B?ZHRFNTNKOVJ0TzhnMW8wNWFlRmJNQnlqY1N4VXZLd2Q0QWdqWFFUVkRUZkFS?=
 =?utf-8?B?Lzk4VnlFRlYrcHU3dDROd1J4T1R0MGRIOHJzNXlQV0FONTRQWFJDOEZCbkdB?=
 =?utf-8?B?N1RSeFNvbzZQaFMwTjRwdHdkZ3dxaGVlOE5waUFNUUw4eCtnendpKzJkcVI1?=
 =?utf-8?B?ZDBONHE4a04xbjNxMVl6VXk3dkdjQWt2QWx6Q0hmNklVWHZHdFRQV1U0WGxj?=
 =?utf-8?B?RkxnQ1gwNktZbjFhdDVSak1PdWZ0SU9weW1NUmlJVlNrakg2U2p5VHhqeitY?=
 =?utf-8?B?eitLcCtIM0NBMHZlM3REd1E1QVFPSkRqd2Rkd2UyZUU0UXJLbXdSdVFjQ3NU?=
 =?utf-8?B?bTBDZTc4YndJK1lBQWVseW1NcFZaYUVHNjN3N0FwNWNFRENHZytzYWZROUhO?=
 =?utf-8?B?VGUwV1U3K2VqWG5vNlRKdU5qMGQ5cTd4Yit6S3ljQ1pIVEdkTUNGQTRFK2o3?=
 =?utf-8?B?TWJVQkpIQWZrNWVMNGpJWFQ3ei96NjFjQ3pRanVaZDlybE5XQzJlQWdlRmVY?=
 =?utf-8?B?TldFaUFqaHFVc1FSS3BETVQrVktTdmY1eFhBMVp6ZTBGMndHdHNlbVdmVE9K?=
 =?utf-8?B?cHFqOEkzR3JOTXBXcnVmQXNaTjJ0LzdCRzEzR2d3TXVjWXBMbG5wTmJld3ph?=
 =?utf-8?B?c3B4QjNydUthWUhXZnlLWWcrSGREbTIvd25vV2lFS1JXT3k1UmxaL1VRQTBt?=
 =?utf-8?B?enpsU01xUk1lV2wyVE9GQzZyQ3dtL3NLUjBDNWdCT1JNL1FDaFU4SHJXaTdI?=
 =?utf-8?B?Tzg1VExoUnAvUHFlS2g0K1pRM2lpY2NUZnliVVJlUFp6M3pSRWtmVUpwOUtN?=
 =?utf-8?B?ckhIOFVYSCtlRzBsUW56YnR4ejAvempsRks5UFZDT09RZEZyUFJwaEVHSVVW?=
 =?utf-8?B?NW9iU2U5RS9oS2gwNjdabUpoc0lPNHJicDZVWktGd1ZIMG40VUZUK0NDUm5x?=
 =?utf-8?B?SDRXZVBuMVhYTG1OUndpdmI2UDZudFpDemFvdlBZT0FhclQ1aDhNbko1cFA0?=
 =?utf-8?B?cmdRWEV3UFBYK3daMEdtSWRBNlZHYzhHMit5ajNGNDhjUzIzSVB3eFlsN2I4?=
 =?utf-8?B?cTF2SzVLOG45blFrUC9kemk0VG02bFB2UTFxbTg4ci9hTUF5VVJjcjVCc2lH?=
 =?utf-8?B?TEQxS01jWlZaRU9mNkYrU3JUOCt5TnFTeFFtaW00MGxqZms3aGRHdE5jZGRa?=
 =?utf-8?B?NmswdXROUFA1aXhJRTNUeXJ4RVIwWkZRV0xVd2F3QU12dy9TTFFyaVU2Y1ZK?=
 =?utf-8?B?SnVZd1dqL00zemtSaFVsZ3lWdWFXdFJEMng2WUFmV0NuSG82aHJ2SDZoMmVx?=
 =?utf-8?B?YTRxSWF6eld4OFk4eURZWFJqcFp0VTFNaXJWQW1CWnR6bWxlR0twUHQ5bnRh?=
 =?utf-8?B?ckgvdWN4aS91V0xBaUR0cVk4WFd5RDlOK2RJZVQrbEx3c2d3K1I2a2JVMG9n?=
 =?utf-8?B?YUs5eDRVekkwb0xndVNMN0NLRjcvcTZqUjEyOFRaNjhLNUNtaHV3d0YwSlJD?=
 =?utf-8?B?ajE0S0ZSTHlURXBXUkJhQ0NCQmJIVm8xc2RwQloyVWo3ZmZpaERCVEkzYVZO?=
 =?utf-8?B?STdHdEJVZ25PUC9sZnlSam04b0ptZ1J1dlZ4c2dqSDAydENoc0RROUcvRkY4?=
 =?utf-8?B?UHFRalNVWGdsRmpXMmZnRVJlS0RRVWRBd2ZCc0xieDljMitaSkt3OEk0RGpX?=
 =?utf-8?B?MEtOVFJsSVNCamdYWDZJajZVZ3o5R1Z1ZDlEKzJacnVPREQ2RnFPOERBWS9I?=
 =?utf-8?B?NDVZdmg4SW9vSTA5QzNaTFVwNHY2OXJXU29HYXpVNk1NQjMzSXZwL2Q1QWpl?=
 =?utf-8?B?NlBOWTlVNXNZdmdZZmovU012QUxWU3NnVUkzSCs2bDdWWDN1QUJDM3VPQUt6?=
 =?utf-8?B?S1N6QWxaNzlpTGxRVjdEclZRYVZEZmZoTEtldjZnNzRKVGhDWHFzRTE0ZUYr?=
 =?utf-8?B?OU1zN3huWDRkNWhqRDI5c0IvSnI2VGpTTGxZV0NJZ09kZFBWditWYmprSmkx?=
 =?utf-8?Q?8lNuL2?=
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(14060799003)(82310400026)(1800799024)(35042699022)(376014)(36860700013)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2025 09:44:31.1351
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a660e06-a41f-40ff-03cd-08ddef8579f6
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS0EPF000001AA.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB11316
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 09 Sep 2025 09:44:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223096

T24gOSBTZXAgMjAyNSwgYXQgMTA6NDAsIEtvZW4gS29vaSA8a29lbi5rb29pQG9zcy5xdWFsY29t
bS5jb20+IHdyb3RlOg0KPiBNeSBvcmlnaW5hbCBwYXRjaCB3YXMgYXBwbGllZCwgZG8geW91IHdh
bnQgYSBmb2xsb3d1cCBwYXRjaCB0byBzd2l0Y2ggdG8gJ2lmICEnIG9yIGxlYXZlIGl0IGFzIGlz
Pw0KDQpQZXJzb25hbGx5IEkgc3RydWdnbGUgdG8gaGF2ZSBhIHN0cm9uZyBvcGluaW9uIGVpdGhl
ciB3YXksIHRvIGJlIGhvbmVzdC4gU2VuZCBvbmUgaWYgeW91IGhhdmUgYSBtb21lbnQgYXMgaXTi
gJlzIGp1c3QgbmVhdGVyIGJ1dCBJ4oCZbSBub3QgZ29pbmcgdG8gY2hhc2UgeW91IGRvd24gb3Zl
ciBpdCA6KQ0KDQpSb3Nz

