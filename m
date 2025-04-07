Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F696C36010
	for <webhook@archiver.kernel.org>; Mon,  7 Apr 2025 16:29:02 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.53])
 by mx.groups.io with SMTP id smtpd.web11.51952.1744043339688449423
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Apr 2025 09:29:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=gtw5KB8Y;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=gtw5KB8Y;
 spf=pass (domain: arm.com, ip: 40.107.21.53, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=kwWB5pjxMlu1XwfDuV18EV2UOpynpqFraX9MuT0zvILdC17SebPFK7g+6rH9hbS6nLEeldhKTchyuH4ObK/sO+DlTNfs1n/62PXnfy3peBsPpxgNqJ9T2jONJQI4jdtTVVVDMd6UcLFniv/z+bg2iV2WSIeHFT70RHD7JCh8Pu18miKcfVxVWlH8BxcheB5W059eaCxWWQe4ZKY8xTtmf9BYWitv2R1ttkwObLahGDDghyedeS4FxLWKglIc5Vwhlr520xFISX7KgRl53fbojHVf7Sbh2PgtdU7AGGFZO5qFJq1Rikl2IA3nR7GIWvb/ugbslo7EkM8vLeU4ZokeqQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iUyTX//9XbuljgG47sapvSVNwSNeOsOYTnc+P+yLgHY=;
 b=vxKJGb1wAha4bO/e13P3USm4CQcU33JvRJr2ZSWtroiBCTvGMxIcLyXS45ES2nEnGBeOBNWM+0FpuHAJ+I/p9jcpfLUFJh4lA3Wh9PziMEmRqaFhUvuT4dK4hzOBkIvSRe1LL1h9es8d2f2qrXsbtclEoS8XL3fozq7fRVwQYzOluLoOrkJbIl7L2dpa2bFr8Wu2QjMJzYUSpOQAjrvhAqzNqOOJ5IyLhMyTmb8OBE8cnyEy/0LzM4lpfHN42VPkClChgEhNhwmNLpZHi6mqavVVfOlDx40kBFhJAEKFuOoDDR5iCoAJ0wG9h9SN/XFLUZj8Bxd4J1xcUrkloCH2sw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=fail (sender ip is
 4.158.2.129) smtp.rcpttodomain=eng.windriver.com smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iUyTX//9XbuljgG47sapvSVNwSNeOsOYTnc+P+yLgHY=;
 b=gtw5KB8YAfc92orDt3o00z7qoOg0A241hi1xPgFuFh+CexaY1mlpKRoe+XyoaLZyqyWA9Ov/B0yREOhUzKeZIhMAyLSXBoW/ida5EBg0a/rTkdJQuvTe0g67T/DBelgdcg3twv3F4HiU5tnzpHdjX0l8ttqZY66DVQY0V6x0cY0=
Received: from DU2P250CA0022.EURP250.PROD.OUTLOOK.COM (2603:10a6:10:231::27)
 by DU0PR08MB8955.eurprd08.prod.outlook.com (2603:10a6:10:466::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.29; Mon, 7 Apr
 2025 16:28:55 +0000
Received: from DB1PEPF000509E9.eurprd03.prod.outlook.com
 (2603:10a6:10:231:cafe::38) by DU2P250CA0022.outlook.office365.com
 (2603:10a6:10:231::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8606.34 via Frontend Transport; Mon,
 7 Apr 2025 16:28:55 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Fail (protection.outlook.com: domain of arm.com does not
 designate 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com;
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB1PEPF000509E9.mail.protection.outlook.com (10.167.242.59) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8606.22
 via Frontend Transport; Mon, 7 Apr 2025 16:28:54 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=krAzRi9eLgXS/Ay7+h6py4UkSeJsqVZaPEfdc/10mmRHhzFvd/88CNFfaz9mWSVApnR7f/yEKb+a8zpgusouZyG2BFFNjRvIbG2epPmuM1a10+Tkd0ztqyWSS45evsqk1uBMg1iJXoL3+/ux3fgrm0s2IBhcdGsGS3kBcrOjpeEpqXGa40odnZD7Wcors7ngOVbX89iOUJnGlO62wvYkbhrh7USsjNGyKc955JTIOx8c2qjwzYbYVOAYnYeh+9IzL6pwXaGTO8+mjdHxycZTlwUV2PLRdIfAX6UbogBWwfw/vlDxeQyofSBEtt8BZPGGTS89qQaVoTth7UasvQP+qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iUyTX//9XbuljgG47sapvSVNwSNeOsOYTnc+P+yLgHY=;
 b=fsIDXo/jYObjpCinRogyArPTpBivEHbvC6lWiMe4A/2gR+qBlUsgNxKUTcbfTt0RqYw7Bcp9P5mhMx5DNOWcTg59lUvoQ1pSpTtsj/tMlBA8rLAoPg4kCC6Rz0EoycupwOCCA/i/+3GO90WnMXaVAbNNASA9Ji7MSML6Dfar17xM6SaKWcNWXnqfBunH6GOMlLlMP3YhmaUV5pHb7O80K0ZXZKMFrdxBA2Lf/zyXS84OjqbH9xdqBDGlJPdoKh+uWfmWFoUwCNROAAgJiDqlF3x5GiVUL/alMwyKM6r4KCntgBY6AI++Q0p3A8AkWO5YssGMYJivOBLKoVESHdLmHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iUyTX//9XbuljgG47sapvSVNwSNeOsOYTnc+P+yLgHY=;
 b=gtw5KB8YAfc92orDt3o00z7qoOg0A241hi1xPgFuFh+CexaY1mlpKRoe+XyoaLZyqyWA9Ov/B0yREOhUzKeZIhMAyLSXBoW/ida5EBg0a/rTkdJQuvTe0g67T/DBelgdcg3twv3F4HiU5tnzpHdjX0l8ttqZY66DVQY0V6x0cY0=
Received: from AS4PR08MB7429.eurprd08.prod.outlook.com (2603:10a6:20b:4e1::9)
 by AS1PR08MB7426.eurprd08.prod.outlook.com (2603:10a6:20b:4c5::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.32; Mon, 7 Apr
 2025 16:28:22 +0000
Received: from AS4PR08MB7429.eurprd08.prod.outlook.com
 ([fe80::8db5:7772:a426:2afe]) by AS4PR08MB7429.eurprd08.prod.outlook.com
 ([fe80::8db5:7772:a426:2afe%4]) with mapi id 15.20.8583.045; Mon, 7 Apr 2025
 16:28:22 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "hongxu.jia@eng.windriver.com" <hongxu.jia@eng.windriver.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 2/2] image-live.bbclass: fix booting EFI ISO
 live failed
Thread-Topic: [OE-core] [PATCH 2/2] image-live.bbclass: fix booting EFI ISO
 live failed
Thread-Index: AQHbn+HGuu4N+DmEWEqnKCPKbEAOdrOYdFgA
Date: Mon, 7 Apr 2025 16:28:22 +0000
Message-ID: <E19241D0-CCA5-44BA-8C7E-9CC8906981EC@arm.com>
References: <20250328130242.929372-1-hongxu.jia@windriver.com>
 <20250328130242.929372-2-hongxu.jia@windriver.com>
In-Reply-To: <20250328130242.929372-2-hongxu.jia@windriver.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.400.131.1.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	AS4PR08MB7429:EE_|AS1PR08MB7426:EE_|DB1PEPF000509E9:EE_|DU0PR08MB8955:EE_
X-MS-Office365-Filtering-Correlation-Id: 94152252-5f55-4145-c1ec-08dd75f149ed
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?bXkyd0c1bFRzbDA4dU1Gb0NMODgvOHJOUmx5ZDVWTXc5OVU3Z0ZNMXBUOVNr?=
 =?utf-8?B?SlJmYWVIWkdBbmFzUnFOVUp5Ti9HU3h6enprZThMaWh0L0lHMGRJckR2KzJW?=
 =?utf-8?B?TFVaY09uMXp5STNjeXZVcWNUVlVNTjhsdGlNeGVrNjlXTDJsRUdsbFEvR2Zk?=
 =?utf-8?B?VWwveUo4WTBJYVc0TlRKc0ZFYVdOZWp1UHdPU2loejlZVmtranljT1Zsa09C?=
 =?utf-8?B?cjgxZjFTaWo2eHVSVUN6T1ZQTXY1b1BjelhkenFEcThaaDN3YVVTQ2c0RExj?=
 =?utf-8?B?MlRoK1F0bHBEc2dNbTloOE96dUswNHg0U25EWkdFcGxRQzV1MFJESStpczJX?=
 =?utf-8?B?WUZ0aFdwYytpYlJlNzlOVHJCNER3ZjVXL0x6Ukk4VHczUndHV0VlY3lsVWUz?=
 =?utf-8?B?ajZFbmF3alJVZ1JZMlFRaVJtZHhCMmFrNFVoZjUzQ3QwZ1N2U1lzRkhYSGlt?=
 =?utf-8?B?VDBHMlMrNk9TcHV4TlM1ZXNrR0xIWkV5aXZLT2lReGgrb2lWcXBDV1NMYXF3?=
 =?utf-8?B?RUtFV1JTZEZBZGFTL2FId2RtRG5xZHl6cUtuOXFrMWQ0YWNZVlQySW91ZTQ1?=
 =?utf-8?B?QjRTZmxpQUlVNjd3TnlnZXBscVd4cVMvcTlRQzJiZ2R1bnNPckpvVGlBMUd0?=
 =?utf-8?B?cE4rNkVIcCtlZ2xLMStvMm1SZ0Y4Wnh3eFU2cHpQc283bXZ5ODRIQ0hPaG9R?=
 =?utf-8?B?cnFCRWJETys4bU9IY2VST0Nuamo3ZWJ4eXBLZFBpTGVxbmEzRVQrancwQU1n?=
 =?utf-8?B?dDdRQmp6bDZQMEVrcXNRdWZ1SGtKaTBxSVpaSktvSGh6YUVGZUYvaDFPeTNN?=
 =?utf-8?B?RFlINTAybzB2ZldUZjl5cTBwMVNKQXdRR1BOMXFvQ05aRTVhak1FbmVJVjBq?=
 =?utf-8?B?cnp6b0ZTaG5Wc3RLRDFGQ2V4QXFzWjNQeDZnMGVGVTlaNWZhcDZScUNHSGdS?=
 =?utf-8?B?dFpZWG91UHVFOHBkWEk4ME84ZjVMd2lOREd5QnUrdEkzT0ZINDdpLyt1Vk9l?=
 =?utf-8?B?NFVqMEhmUjVETDdnZjliNDVCcHA1emJGNExjQ2s2NlVueUtSVG9VQnQwSDYv?=
 =?utf-8?B?STd1UTYyR252TTh4QjRwbWFJejRuZmtHSmlHQklvbFdLNllmYWVNdjhWSCs2?=
 =?utf-8?B?UDlXeUlzalpjNTVKZUZVdkl5SW1tcnErUG5IRVd0Z2M3MXdJbVRTcEQyRUkw?=
 =?utf-8?B?YnQxU3FiOVRsQ2NPUU5BdWJYK0VPTWRIMkx0NVpjNzB0eEFLOFVXUlRRYnRj?=
 =?utf-8?B?Tmk5OWNBTmxxbU9kYVU2aGpFSWRYUENaYXU1MFJlQWx6TnlQN3Z6TExscnJo?=
 =?utf-8?B?Y2ZhWi9KdGNCaGd1Z2VZVkFwMXFCYUN1NHUzdU5HN2g5ckUyYlpka3lMQSsx?=
 =?utf-8?B?MXBrRnRmaFlIMnZjU2JLd2FnOHpIbXBMMjJSK0tEUk5RUllsQi9BRGk2MEFl?=
 =?utf-8?B?ZFA2dmlTVHcrdndFSGd2K3pOeEovNkhUUitna0o3UUNkL3lXM1RuVjFyb1hE?=
 =?utf-8?B?NDBBeGMrWWwvanl2NlZHKytLNFgxelhld25qbmpRbkNwT3lEZUd3QXpjOEJ3?=
 =?utf-8?B?QnIwQXdwc1hFWFdZQ0o1bFd3cGJTUUVKenBYR2hkQmNGcS8zUmZyblNlTEIy?=
 =?utf-8?B?SXlsazNnc3FpVkZFSFpMR29hQ0o5NEdraWFiU0lqaXBvZWtVWEhmS2picmIr?=
 =?utf-8?B?MlBUU3pIMFZaZy8rVHpmUVlBVDVTazBxVUcwZ2hsL3VKcVdzYkVwall4MzFz?=
 =?utf-8?B?bVB2a3BLVCtyMGlobnNGQ1VreFJSNGVjdmxkaFkraVROVW9CUEhmTzAvZlFQ?=
 =?utf-8?B?Q2ZZWFkwVHZGSzVQTEtJT3JHTWEzSFRyVE13L0ZkR0NNc2NNNlNUZlRLSUkr?=
 =?utf-8?B?TWJYL3dJWHVrYjVOTDgvaVpSZXJxNCtab1dzN0tEL1kwV0ozc1YvVzdTTGJt?=
 =?utf-8?Q?dU4YbWgTHHm8mpJSk2xygztwQdjeV76v?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR08MB7429.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <FABF812AA1A0BF45BF25435A5462161B@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR08MB7426
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB1PEPF000509E9.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	2ea8705d-f641-4753-b666-08dd75f13705
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|14060799003|82310400026|376014|36860700013|35042699022;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?dTBHeXlSVnBXR2lZZkpxRFlCNE9LMCtLRXpSdlRkNHYweWZLREdYYmQxQlQ2?=
 =?utf-8?B?UklXb1Y1YmkxVEJkR3BDWDBDNVVTbHFtaE8wc2VHL0Erb3pHSndSNXZWVlFV?=
 =?utf-8?B?QmJHbkpRVGtna3ZGQnlaZDR0d2ZncmFUalBqNHF1YTdCWUlSZG1zTkgydmxG?=
 =?utf-8?B?aHora0NVSGNCNXc5QUNqRmJLTC9RR1cxa0tSbkRWc05ickVWWmhxcDJnenJu?=
 =?utf-8?B?bVg2SFRTUDVXZXJzWDdzZHZLOTd6WWxVM3UwMVIwWjltVkRHRFpmSHFLdGdt?=
 =?utf-8?B?aEgyUUMwTGpjQlVDbUNKbFp2Q2d0c3J0VkpyNkRYTm8xRTRaYmlmYnlMZFhY?=
 =?utf-8?B?WktwVWxRNnlNYW5Wbk43bThMMVROUXYzck5SSWRpY0hUUjBGUlNSWVhSTzdo?=
 =?utf-8?B?YkpZK1VrK2pjSjJsd2Q5ZlpBNno2UXd3b2I3Yzk2NXRNTUMrcDc5c2NmdEZI?=
 =?utf-8?B?dmdkWTYrRmJGZE9LalI3Smd4bHh4MEFGTU1ReEw1UzVkNmlQakVPK0cvOENn?=
 =?utf-8?B?N0NUc2lSMmRGSjljRGg0YUV1amtOSkJxWmlTQVptbFprL21TaGZOclFUOWIx?=
 =?utf-8?B?NTVOMk9aRXRWUUtOeVdPMjlUMm9uV3YwQkYzUWNONFExKzhidUNkcDFITnFp?=
 =?utf-8?B?Z244V2NWYzhpcGZ5V0NkemVhNnV3MTFvdjdpZ1BDcmJYNENrSHc5SitFOXpT?=
 =?utf-8?B?ZjhVd09qcmRKSmU2WWdYUHFJdXdtTGZDdWtpUlpGaEdaMWpVeEluczJJV3Q5?=
 =?utf-8?B?RlR3cEZBOVk5QUpzUnF2QytnS0c2Y1ZMM1FEWm9vU1pMaE54bGdNbEtnTjZO?=
 =?utf-8?B?S0JUMjRZa3pYanhCa2RPZklkaXdma1NFRm00SEdLZkFVYjVjWmh3bkd3TmJF?=
 =?utf-8?B?QldhUnVjWGdiODE1UVdPYUI0cWRuWUZmSHJESzZwanEzTCttZ3NwV3JYZ3h2?=
 =?utf-8?B?aVZYa0tOMTFVWU5mcVB6cGhMTTh0OGdBZ3pEU1hHOTc1Q1RFRU9JRDBHNklQ?=
 =?utf-8?B?dlRWUElSYlFCbzYvSTh5dHF1TkZNVGt0OW5GZEtkMGVSR3lOQzRscitYUEhk?=
 =?utf-8?B?ZTI1QXJYbFBMTFdueEFJN041cWZ4RUdRYWhrempBNlluZWdpVldHVEpVVWNX?=
 =?utf-8?B?VHgySkFyL0piRkVYZjh1VExNMVdNWm4yZ2dJZ3ZFaEN6NmxBdVhXNDFod3dk?=
 =?utf-8?B?TWNXZ2lQRFFSaFdKbm1YdUUrTWdiQkJqclBKV3RmN1FGdkp1SHBSL2xLTFh2?=
 =?utf-8?B?NExpVHhOWXNTS1dMcmlDcTVHbnlUbm1KSFNaTXFFdms1b3lVVDlaN0tjY2d2?=
 =?utf-8?B?QTl2Q2ZCNnZTTVpPNGZQdXpoSTRlUnhRVXlkQkhFa1NONmFyVzIzWHZycitV?=
 =?utf-8?B?YW5sMVhIYzJHQVBOR1p4TmJkZG94dVBBUTJ0Vkk2SDR5R1ZTeGc4Skczd1Er?=
 =?utf-8?B?aEVmTTJEb2QrUUVXWnhrTThTajZKM0JWdUNZeVBMQ0VWUXcrZWlQZjRuUVdI?=
 =?utf-8?B?RnNsUGVZR0h4YWExZEE2U1RLUG55YU5KeGhCZVlFWDZ2dWpuSS8raGRIb2FU?=
 =?utf-8?B?KzZWeVNweFppZHhxL0tSL3d5aWJ0Mm1XTTRtZEthdERsS0ZNU3NvWnNBcklO?=
 =?utf-8?B?dEtSakg3QkJaT0lvcnZUcHJ6bHlsTW53VzMvTFhrSW1DN092cTYyNnFGN2ZN?=
 =?utf-8?B?ZnE0c3Y3YkFtZnVqNm1XQjNXRThrS1dGK1Bjc1l2NWNaUHQyTzFhRkplQ2tr?=
 =?utf-8?B?TTVxaEhsUE9nYnAzNjlGSVRXdjBnRTU2eUhZK2RWU1pCejFzWkRreVlxME5W?=
 =?utf-8?B?Wk1LKzFKUTRWeXAvYTlGeS8xVmFZSmd2cmJlYm9BR2JubUl4YXpKdElpZUI4?=
 =?utf-8?B?UEVkcDNlY0JkZU5RelcvVlZEMU9rTm9QaTEvMkRoVnZuaEZZS29iU1k3VXIx?=
 =?utf-8?B?R1VvRFArdG5EdDNYNHY0T0d1WStoTExvMVBMdGtvWERCTlN1REt5cVRqa3NO?=
 =?utf-8?Q?y65BQKrHGHQRGJL5r3iGoFwTDLYiAQ=3D?=
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(14060799003)(82310400026)(376014)(36860700013)(35042699022);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2025 16:28:54.3740
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 94152252-5f55-4145-c1ec-08dd75f149ed
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB1PEPF000509E9.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB8955
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Apr 2025 16:29:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214461

T24gMjggTWFyIDIwMjUsIGF0IDEzOjAyLCBob25neHUgdmlhIGxpc3RzLm9wZW5lbWJlZGRlZC5v
cmcgPGhvbmd4dS5qaWE9ZW5nLndpbmRyaXZlci5jb21AbGlzdHMub3BlbmVtYmVkZGVkLm9yZz4g
d3JvdGU6DQo+IA0KPiBJbiBJU08gbGl2ZSwgaWYgdGhlIHNpemUgb2YgZWZpLmltZyA+PSAzMk1C
LCBhbmQgY29weSBFRkkgYXBwbGljYXRpb24NCj4gKGJvb3R4NjQuZWZpKSB0byBlZmkuaW1nIGJl
aGluZCBvZiBrZXJuZWwgYW5kIGluaXRyZCwgVUVGSSBzeXN0ZW0NCj4gY291bGQgbm90IGZpbmQg
RUZJIGFwcGxpY2F0aW9uIGJvb3R4NjQuZWZpDQoNClRoYXQgc291bmRzIHZlcnkgc3VzcGljaW91
cyB0byBtZSwgZXNwZWNpYWxseSB0aGUgMzJNQiBsaW1pdC4gIElzIHRoaXMgZmlsZSBzeXN0ZW0g
YmVpbmcgYWNjaWRlbnRhbGx5IGNyZWF0ZWQgYXMgRkFUMTIsIHdoaWNoIGRvZXMgaGF2ZSBhIDMy
TUIgbGltaXQ/DQoNCkNhbiB5b3UgdHJ5IGp1c3QgZm9yY2luZyBGQVRTSVpFPeKAnC1GIDMy4oCd
IHRvIGZvcmNlIEZBVDMyIGluc3RlYWQgb2YgdGhlc2UgcGF0Y2hlcz8NCg0KUm9zcw==

