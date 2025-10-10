Return-Path: <stefan.herbrechtsmeier-oss@weidmueller.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19966CCD185
	for <webhook@archiver.kernel.org>; Fri, 10 Oct 2025 17:05:02 +0000 (UTC)
Received: from GVXPR05CU001.outbound.protection.outlook.com (GVXPR05CU001.outbound.protection.outlook.com [52.101.83.133])
 by mx.groups.io with SMTP id smtpd.web10.750.1760115899176639173
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Oct 2025 10:05:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@weidmueller.com header.s=selector2 header.b=eD/pS6LB;
 spf=pass (domain: weidmueller.com, ip: 52.101.83.133, mailfrom: stefan.herbrechtsmeier-oss@weidmueller.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uQj60L6PnjcE24wrx6UI2VCOUau3liDOKjRdsVJ+xiHMxDlgb42LfJtWgyCcpT7Z1pv1hyQWVERKhUkYdWNv+8Gq/SniiaHSdNidW+2Aj8cMXfYnzJcbQHFNs4aiOZp1BemyCbi0mXBZRbN3vv30VobBkUKBfErC/X6kTqbLagoTXg2bAlx3iGbGBuIdL75o3N9ssw23Mly7Mde01BJq2R60As57f55nWjc3NJkhD+dzf5lT7YH+Xx16LJW7bPOxVlNlQars0sl6jpJwzwrnfGPl/ZyyGcvWY+3ly2zBqAxaCmcfbl8klhAfbBEB/FBQ8whoWm5W4oDPXHDaHYsFBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PO+sddT+yypFRWPgY8QbyMz7fHcDUXUIZwWXp6kaToI=;
 b=uhPThK2ATLP5MVSpmy7Aa+/3077/egxq1vHkBGT5HZzTzin8Fhr5PAZdxMr9s4/1wPTRUNzD+mHr1/AbluR5ISPOZG71fGzbj+VQ8hULzXIjrOknMVJYkcIMzrqK/Um3tcFoupYJ0MQvwEbxopCmOyT2hNx4dxt0VFnMOs9dZ/xirKMchThfsMQUgBwztyxHw0QeNMZ5dNF4384a2XUbxRMeRKe3nxteZAEWehQnUSBiorbE+Hps1Ytqs0ddKIrm5MRSFk3QmMjRAOJfr3bVmSPqNZu2VM8ZEnCOv4jPf3SDD72zVjnIjTeY8MWOKeUXyY9jO/3Gs+mkCrINRe68NA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=weidmueller.com; dmarc=pass action=none
 header.from=weidmueller.com; dkim=pass header.d=weidmueller.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=weidmueller.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PO+sddT+yypFRWPgY8QbyMz7fHcDUXUIZwWXp6kaToI=;
 b=eD/pS6LBv0CCLrwLdyjCWSvxpZtrdxiheyszqcPwsJ3RTvoLfGuK6+0CvBP47LzW3eVoNOqzw1FhOXBTC2FapjaiyL+E0JCuu3ZUbCCW4574CQfvWYRG4G9k52xSSvkhuD16oKzQl90rfx0jJGqE7LQyO5d1+ZpPL0z+3ef9RnRIHYbo1up3jV4bGQphkajt2H9f+LmK1LY6CSCc4TVLbkOk5SDz0jBFiZxoZbdLRFqa3LbkW4hc2BP8Q5nheAg0Eh0pvQYlWKwgbTmQbRggH4NBKjqe38Sj6YTNkfWsYhYd2bG9TGVuFTLBIdgxKti3Af7uu3uD8utjO/CDhCzIwA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=weidmueller.com;
Received: from GV1PR08MB8426.eurprd08.prod.outlook.com (2603:10a6:150:8a::17)
 by AS8PR08MB6662.eurprd08.prod.outlook.com (2603:10a6:20b:397::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.10; Fri, 10 Oct
 2025 17:04:54 +0000
Received: from GV1PR08MB8426.eurprd08.prod.outlook.com
 ([fe80::f9f5:b4bd:9e01:9013]) by GV1PR08MB8426.eurprd08.prod.outlook.com
 ([fe80::f9f5:b4bd:9e01:9013%5]) with mapi id 15.20.9203.009; Fri, 10 Oct 2025
 17:04:54 +0000
Content-Type: multipart/alternative;
 boundary="------------d80T9SO1HfSFzz4nTAicL7n6"
Message-ID: <07c94387-26b5-4fa9-ace0-a5b901c71da9@weidmueller.com>
Date: Fri, 10 Oct 2025 19:04:52 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [RFC PATCH] cargo_common.bbclass: use source
 replacement instead of dependency patching
To: Gyorgy Sarvari <skandigraun@gmail.com>,
 openembedded-core@lists.openembedded.org
Cc: Tom Geelen <t.f.g.geelen@gmail.com>
References: <20251003213000.2256939-1-skandigraun@gmail.com>
 <211549e4-c4c2-464d-9b63-88c27d5bdf18@weidmueller.com>
 <049f87a6-2e45-43b2-b04a-7b96e6cdb096@gmail.com>
 <54596a81-b725-4d78-9c35-ff851e4b1113@weidmueller.com>
 <239994b8-47de-4394-bcf0-16dc91ca654e@gmail.com>
 <6f3eedff-44c0-48ca-86dc-c1ea8aecc9e0@weidmueller.com>
 <2e82bf39-47c4-416f-a7f4-783be8bd32d5@gmail.com>
 <f918694b-93e8-46de-bd3b-d9556563aec3@weidmueller.com>
 <07f2daa3-b311-4247-87eb-ad404f2af24b@gmail.com>
Content-Language: en-US
From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier-oss@weidmueller.com>
In-Reply-To: <07f2daa3-b311-4247-87eb-ad404f2af24b@gmail.com>
X-ClientProxiedBy: FR4P281CA0197.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:e5::7) To GV1PR08MB8426.eurprd08.prod.outlook.com
 (2603:10a6:150:8a::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV1PR08MB8426:EE_|AS8PR08MB6662:EE_
X-MS-Office365-Filtering-Correlation-Id: 23614481-b4a4-491b-e811-08de081f21ee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|376014|4022899009|1800799024|13003099007|8096899003;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?dk9VWVpENzZZVmtCdlRTWWtCTGJTeW1obTJFdG1aY0NDNFR5d3NJbjkvMVJC?=
 =?utf-8?B?RXpIbC8rRTJNLzhicmZ2SmpKQ090R3RVZFkzbnlETTZ6MjBEYnY1UFA0NExr?=
 =?utf-8?B?bzQxa0QvQmFiMXlDanVUK3QwazNhQmNoMCswallFQ0VyQmx2OTlKM2dCZGhy?=
 =?utf-8?B?SG1CckQxd0dTWkpVT08rVWI0TWw0aFFiY1VVYTVLMmdYdXBleHV6MHE1eFZH?=
 =?utf-8?B?WEFHeklTSWVMUk1yMDhLQURKRzlHOWNDY0EzN2oyZ3JFQk92cFovcWlyY1A1?=
 =?utf-8?B?NXVzTzNtVmJOSUJnQlBtKzVaaU1yRzlSV0gvS2ovWklYZHU1WFBlR1pSUXZV?=
 =?utf-8?B?NFNrLzJCOENpZXFSOVF2Z1puc1VVb1FNaXEvVDdmRFpvQmNydkJlUDlZY3ZG?=
 =?utf-8?B?V2JvdVlnamVBTjlUTW05cFdPMjAxcGhlZTV0bFNjV0xobGVJdHVKc1V5UFFr?=
 =?utf-8?B?QzdaRjliNzJaZDZqRHI4amc2dGp0NlVwWE4wbmtNQmJha1FRbDNwQ0JyMGV6?=
 =?utf-8?B?cTlrQUhPb0ZRblhNZzZJd0xmY21XZ2EwRUhnSTVadkZvNTBWVSszNDJlTHNI?=
 =?utf-8?B?VzU0eVBJQ09RY1UyK0ZFMDNETW85cE1wc2dOYU5SMXhnQlg2V2hSNGZsSTR3?=
 =?utf-8?B?RGR6S1YwNHo2SU9EaWNXb1dZT3hod3Vxblo1MDVLUGpYT3UzcUpSaGFGd2Mw?=
 =?utf-8?B?eXg0aFdRYjVFaThvR2RodWJ0d1l5SlZ2RGNuTll2VmgvOG5DRFgzRkdiOVdJ?=
 =?utf-8?B?YTE5aTJPbUZ6ZzErMVhaYXJSWG5uaFh1Z1U3WlMzZndKaUJ0M1NucUsyS21G?=
 =?utf-8?B?UUlqY1dkYzlsaklPaU1kdDVGa1dUN2NtT1NXZHd4SkNCSlJheklZazljNDJE?=
 =?utf-8?B?bHIxMW5YQmY0UG43NTYvL1FTS0VUQ3lFQUZkcDZXRk1lVzk3dXNRUVRYUXpB?=
 =?utf-8?B?M3JWMEJTclUrejY5YnFQdVJ0QTRBcjM2ckxWVDExY1BmcG1Kc2tINHkzZXU2?=
 =?utf-8?B?cVovbk4rNjdRWTdQdzdQM2M2QnJKa0hyY3V3VGlLcFo2NndEVi9tOFVIaUtr?=
 =?utf-8?B?a3U0aEFzSGZHSGtQamtZQklINFB4OXB6OTdnZng3MkU4UmNLdkxFV0k0bVcz?=
 =?utf-8?B?cERPeHlDQnVHbCtlYTM3cWVURUJ0ck5sT2ZuMTR6b0ZjWDFoWngxR2RYWjRk?=
 =?utf-8?B?SGdFdnFrUSs2dDQ0czRoVS91WlcyYXdSNDRPc2VVVnlkckJpNWxzVjZPcGVY?=
 =?utf-8?B?OURvMFVFWHdiQ0d2VnhpQ3VsY25SRlFUT2FjWlNXdSs4WUhIS3ptdW44T1VF?=
 =?utf-8?B?alpQeHJXNHkzY3hUcTdvTm04OFRudWdzV1hJNkVyQ1Q4ei9TREFRQ0hCamEr?=
 =?utf-8?B?UC9mN1l6NGRjMXZvaERzTk1EWHBaSU8rUUE0azRxQ3NtK0dabFB0Nm1md0hh?=
 =?utf-8?B?bWZ3U0N4N2lOUm5HN3dqRExJZWRaWXE4K1M3TU1jRVB0TEhieHFnODFOQzkr?=
 =?utf-8?B?d2s5d3NFYThBUFV1c3hjdEs0WlU1Z3ZXeG9yeXVaalROSGRaN0dMQ1liSjFG?=
 =?utf-8?B?N3o3V1FwNHhZY1Nwc1oxczl4d3lzNHduRXZRYTc5RXI0bnhMR1YrNGdrb3Nv?=
 =?utf-8?B?QWNRUkJGMjE0TFRsUHFaWktJNE1aM3hJVGplRWc1RHRUdTZid0xiZ0tYaENu?=
 =?utf-8?B?c0p6ejgyNVcvczBiTUphT1lsRFU4Z21XblNhNDVSelBFTHY5VHYxV2NldVJN?=
 =?utf-8?B?USs2RE8zeHdnOUFWMnNHWVVTV1N6SGFCRi9uM0szYzJBeHBqSEJwYnI1NGNa?=
 =?utf-8?B?elQ2ejUybHc1SkN2UUVGUW5RbHNBVXFuazJVVXdjK3JYb2pvMkFVR21UTHVO?=
 =?utf-8?B?RzVDYW1ZdE9ObmE4M3F3TmJxQnphbFNHY08rVnpXSFdzQlE9PQ==?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR08MB8426.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(4022899009)(1800799024)(13003099007)(8096899003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?WkFwejhHRWgySGRwdWl5WlExUkhzeFNuTjVoakFWR0NBSGFxVWFGbi9MeTUy?=
 =?utf-8?B?S3B0bkx2TUhZNzM0VjVsTXZoT3RlOE8vT1dIc1VpWHdGYmM3MGJUcStYNHZO?=
 =?utf-8?B?VzlCTFBjTkliYVRjNVVYSGU1aVk4cTNnUGZmblNGRHVaUnMxQ3laR25hWXpx?=
 =?utf-8?B?eFR2RWdsWHFibk4wbGp4UFlDbEVrVUt4cHZnZjl0RjJEMnY0Si8rbWZCb09B?=
 =?utf-8?B?Z08zdXlpcmVaQjZYb05NdnRjYnVsSEYvSVQ0WU4zREUzb1o2cVBiVHRYZG5q?=
 =?utf-8?B?SkR5dHN6bi9oVTBDd3pyUHJCMkc5VTJPZFlWdzFLUU81clNOMzc5RE9Rd2JH?=
 =?utf-8?B?bU9RNjRUdFB5RWdSYnJJeWVzdWIvTTc1eS9oM2ZnczhWKytFbE15L3d5OUtW?=
 =?utf-8?B?UzUwbTNPV0I2MUtyYmxqQlZnZ3IyN2t6STZxdWtuYlRxZUo3dGE2NkhzUEk0?=
 =?utf-8?B?bnVkOVpzaXYyMHl2UTJjK1Nyc3JTNkdlMUxoZ1ZWYjhKM0hISitCajF1ZTAw?=
 =?utf-8?B?RzU4Y2JUQkZIR1F3aWlQeWdwLzlJeFd3VkZGU2NaQkhwb0hNN3R4M0hWNEhD?=
 =?utf-8?B?ZEFlL2k4M0FrR3BLamtPTHZaN0E3SStuSEdScVhmV09XeDQvUlNUWS9NeFdu?=
 =?utf-8?B?ejdOM0VzWmI3Mk51NTR5U0I1QStnNTQ1bG53SnUrbmU5VGFZRWwyai9MaW5L?=
 =?utf-8?B?WTh3ZFRwdlh2OVJoTEszVFZJTjloUTIxdDA3MFMvTHd4ZlB1Nk04OUhzeGJn?=
 =?utf-8?B?UnRnVVJvN2pDNlNneGd6enk5Q3lwS3ZIUzFMNm4wdTlqeEhWN0x6eDlNbEhX?=
 =?utf-8?B?TnM2YmswUld1cEUvWmVFbk5uM29CUEpDQjkzY1lzbi90eFRVUjhtbExqb04x?=
 =?utf-8?B?Slh5dDh1OWI3dGgzMHJaU1RPbVhTbUpzM2dOb0Z0NDZvSUFKZUFZaE5ocURE?=
 =?utf-8?B?aTRBT2xGblM1T1dVREJ2Y3FQcjVISnNuMzR4UXJOZnJSVmlWdGU2UFp5SGMy?=
 =?utf-8?B?dHB5bE1FZFExeXA3UTJZSXd4OFdrcUNtR3krcTZBaWtoQ09valE2Qk9BeFIv?=
 =?utf-8?B?WlhPZXZEK3hiZi9wVHFTKy9rQVhmbkNqSlhZWmd5RTh5MGhBNnV4SDZsUlpj?=
 =?utf-8?B?L29laTkySXU4d0pQazRpbDJZUitsR2dzS3hHTnJjbjJvVUtCeEpsT0Vqa2t6?=
 =?utf-8?B?enZxYnZpM0taeENVWE00UldudTRWT0M0WmR0MkRPbnBaRFFybHhsQnMrT3ZR?=
 =?utf-8?B?LzRpQW1FY3d2djdMQnh4UUJHUytCemFtbW1FMWNTeGJycGdaKy83ZHh5MUFv?=
 =?utf-8?B?ODVJbytUOFhUNVd5TExadVRKYTZHWFJRMDIzemNCSW1NLzZlcmUvdnlVeHlz?=
 =?utf-8?B?V29hRVV4b1I2eGNTejRMK3RnZ3RqT1RKYm5scm1rYjlSSTUvS1NYRFF5eXNE?=
 =?utf-8?B?citMSDY3TTR6WHg1OUMyemVqOUVJWG9UTlR0QUNleVYvUzRUQzZkR3ZpZ01h?=
 =?utf-8?B?cDFsaG1heFpWTEM4TlFjYU5NSTgzbFpoc3dLNlpRZmxiN0p6UUxMZzdQUStS?=
 =?utf-8?B?bXFrSXRWRmVxdVYxeG9LMzVrdVp1eU5VV0NWQUk4TXBwQmIxeXB6dVFwOVJv?=
 =?utf-8?B?L2U4SkpPeGZ0MXNLazUrVDIzNHRXeVhjdWs1eDBsSTdBeG1jVXl1VDdwTmdq?=
 =?utf-8?B?bjFBSHBYdEY5Yjl6anI0UERvWE1wU0N3Sk1aRGdmQnFPR08rcVc4U1Bpamdt?=
 =?utf-8?B?bWtyNkRLRTc4Mi9rdUVIMi9IODFKSS9yUUpHNHQ4dXdxRUlYdG9GeTMrUk82?=
 =?utf-8?B?VHEzVFdIbXdZV2xKTG8zOEViRm9QY2JRZTBCQkF1bXM2dnA4NU8wb1Nxb3Jk?=
 =?utf-8?B?dmNlMk14OGRrQ1FKU0xWNUpwQzl5QndKckZyTVNPUk9Mc0JRbWxaMXo0Z0hE?=
 =?utf-8?B?NnBuS0V3NHhWdldIOWJFRjZBekJaY1ZBaDd5bTIzVUppSmdVTk8zZEdBS3p2?=
 =?utf-8?B?SjR5VFVnREdNQlRLVlJIbFY3NmNIeUZmbUo2dlhscEYvWDR3L3lTNmZjQ2JE?=
 =?utf-8?B?VHFqUGhsVjgzUEFicDREc05NZWIvbVBadUxQcnpHaXI1a2paWVlnVWZUU3lu?=
 =?utf-8?B?TnJyVHdnVklFUlprZWlpb3Y3aUtjb2V6eTFxMEhBQjA0b01QTzh5TWpSQWdU?=
 =?utf-8?B?T0E9PQ==?=
X-OriginatorOrg: weidmueller.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 23614481-b4a4-491b-e811-08de081f21ee
X-MS-Exchange-CrossTenant-AuthSource: GV1PR08MB8426.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Oct 2025 17:04:54.2736
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e4289438-1c5f-4c95-a51a-ee553b8b18ec
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nlJoesRMBCNx5RUYmmI0WS+5yMEx3Ko2KSaVfI/iRLNVwAO6d3PoJwJb7SIPNWu5kpiw4vNx1fcxDJ46uuHdVA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6662
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 10 Oct 2025 17:05:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224702

--------------d80T9SO1HfSFzz4nTAicL7n6
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Am 10.10.2025 um 13:35 schrieb Gyorgy Sarvari:
> On 10/10/25 12:38, Stefan Herbrechtsmeier wrote:
>> Am 10.10.2025 um 10:04 schrieb Gyorgy Sarvari:
>>> On 10/10/25 08:27, Stefan Herbrechtsmeier wrote:
>>>> Am 09.10.2025 um 16:30 schrieb Gyorgy Sarvari:
>>>>> On 10/9/25 11:31, Stefan Herbrechtsmeier wrote:
>>>>>> Am 08.10.2025 um 13:01 schrieb Gyorgy Sarvari:
>>>>>>> On 10/7/25 16:59, Stefan Herbrechtsmeier wrote:
>>>>>>>> Am 03.10.2025 um 23:30 schrieb Gyorgy Sarvari via lists.openembedded.org:
>>>>>>>>> Cargo.toml files usually contain a list of dependencies in one of two forms:
>>>>>>>>> either a crate name that can be fetched from some registry (like crates.io), or
>>>>>>>>> as a source crate, which is most often fetched from a git repository.
>>>>>>>>>
>>>>>>>>> Normally cargo handles fetching the crates from both the registry and from git,
>>>>>>>>> however with Yocto this task is taken over by Bitbake.
>>>>>>>>>
>>>>>>>>> After fetching these crates, they are made available to cargo by adding the location
>>>>>>>>> to $CARGO_HOME/config.toml. The source crates are of interest here: each git repository
>>>>>>>>> that can be found in the SRC_URI is added as one source crate.
>>>>>>>>>
>>>>>>>>> This works most of the time, as long as the repository really contains one crate only.
>>>>>>>>>
>>>>>>>>> However in case the repository is a cargo workspace, it contains multiple crates in
>>>>>>>>> different subfolders, and in order to allow cargo to process them, they need to be
>>>>>>>>> listed separately. This is not happening with the current implementation of cargo_common.
>>>>>>>>>
>>>>>>>>> This change introduces the following:
>>>>>>>>> - instead of patching the dependencies, use source replacement (the primary motivation for
>>>>>>>>>      this was that maturin seems to ignore source crate patches from config.toml)
>>>>>>>>> - the above also allows to keep the original Cargo.lock untouched (the original implementation
>>>>>>>>>      deleted git repository lines from it)
>>>>>>>>> - it adds a new folder, currently ${UNPACKDIR}/yocto-vendored-source-crates. During processing
>>>>>>>>>      the separate crate folders are copied into this folder, and it is used as the central
>>>>>>>>>      vendoring folder. This is needed for source replacements: the folder that is used for
>>>>>>>>>      vendoring needs to contain the crates separately, one crate in one folder. Each folder
>>>>>>>>>      has the name of the crate that it contains. Workspaces are not included here (unless the
>>>>>>>>>      given manifest is a workspace AND a package at once)
>>>>>>>>> - previuosly the SRC_URI had to contain a "name" and a "destsuffix" parameter to be considered
>>>>>>>>>      to be a rust crate. The name is not derived from the Cargo.toml file, not from the SRC_URI.
>>>>>>>>>      Having destsuffix is still mandatory though.
>>>>>>>>>
>>>>>>>>> The change does not handle nested workspaces, only the top level Cargo.toml is processed.
>>>>>>>> I use a similar approach for my Cargo.lock fetcher. In my case the code
>>>>>>>> finds the crate on the fly inside the a git repository because the
>>>>>>>> Cargo.lock doesn't contain the subpath.
>>>>>>> By any chance, did you manage to solve the workspace problem? If you
>>>>>>> have a working solution, feel free to submit it, I wouldn't mind if I
>>>>>>> wouldn't have to debug mine :D
>>>>>> I haven't test a workspace project. Do you have an example project?
>>>>>>
>>>>> I have attached a sample recipe (that is very much based on Tom Geelen's
>>>>> initial work). It depends on at least 2 workspaces.
>>>> Thanks for the sample. After switching to my cargolock fecher and
>>>> cargo_vendor class the project build without problems. Your git URLs
>>>> need a parameter to inform the config generate that the source
>>>> contains a rev query parameter. Additionally you need to add the
>>>> revision to the name and destsuffix/subdir because it is possible to
>>>> use crates with different revisions from the same repository.
>>>>
>>> Yes, but the name and destsuffix already need to be always unique by
>>> definition for each SRC_URI component. If name isn't unique, then you
>>> can't specify different revisions. And git fetcher (and I suspect others
>>> too) starts fetching with deleting the target folder, so if destsuffix
>>> isn't unique, then only the last code prevails.
>> It was only a comment, that the solution inside your example doesn't
>> work in any case.
>>
>> In your example the Cargo.lock reference two crates inside the same
>> repository:
>>
>> [[package]]
>> name = "reqwest-middleware"
>> version = "0.4.2"
>> source =
>> "git+https://github.com/astral-sh/reqwest-middleware?rev=7650ed76215a962a96d94a79be71c27bffde7ab2#7650ed76215a962a96d94a79be71c27bffde7ab2"
>>
>> [[package]]
>> name = "reqwest-retry"
>> version = "0.7.0"
>> source =
>> "git+https://github.com/astral-sh/reqwest-middleware?rev=7650ed76215a962a96d94a79be71c27bffde7ab2#7650ed76215a962a96d94a79be71c27bffde7ab2"
>>
>> (https://github.com/astral-sh/uv/blob/0.8.19/Cargo.lock#L3431)
>>
>> Luckily both use the same revision of the repository and you can use a
>> single SRC_URI:
>>
>> SRC_URI +=
>> "git://github.com/astral-sh/reqwest-middleware;protocol=https;name=reqwest-middleware;destsuffix=reqwest-middleware;branch=main"
>>
>> If they use different revisions you have to add two SRC_URIs with
>> different name and destsuffix. Furthermore you need to add the crates
>> from the correct destsuffix to the vendor folder because both checkouts
>> can contain the same crates.
>>
>> I follow the cargo vendor approach and use a part of the revision inside
>> the subdir (destsuffix).
>>
>> SRC_URI +=
>> "git://github.com/astral-sh/reqwest-middleware;protocol=https;nobranch=1;name=reqwest-middleware#7650ed7;destsuffix=cargo/git/checkouts/reqwest-middleware/7650ed7"
>> SRC_URI +=
>> "git://github.com/astral-sh/reqwest-middleware;protocol=https;nobranch=1;name=reqwest-middleware#591ab44;destsuffix=cargo/git/checkouts/reqwest-middleware/591ab44"
> Hmmm... ooops. You are definitely right - I do break crates if they have
> the same name, they are not differentiated and copied over each other.
> Thanks a lot - will take care of it in next version.
>
> Regarding the duplicated SRC_URI: yes, but that's on the user.
>
>>> If this should be
>>> enforced, I would rather put that logic into a new QA check, or maybe
>>> into the fetcher directly.
>>>
>>> (A bit more touched on your note below)
>>>
>>>>>>>>> Signed-off-by: Gyorgy Sarvari<skandigraun@gmail.com>
>>>>>>>>> Cc: Tom Geelen<t.f.g.geelen@gmail.com>
>>>>>>>>>
>>>>>>>>> ---
>>>>>>>>>     meta/classes-recipe/cargo_common.bbclass | 158 ++++++++++++++++-------
>>>>>>>>>     1 file changed, 108 insertions(+), 50 deletions(-)
>>>>>>>>>
>>>>>>>>> diff --git a/meta/classes-recipe/cargo_common.bbclass b/meta/classes-recipe/cargo_common.bbclass
>>>>>>>>> index c9eb2d09a5..79c1351298 100644
>>>>>>>>> --- a/meta/classes-recipe/cargo_common.bbclass
>>>>>>>>> +++ b/meta/classes-recipe/cargo_common.bbclass
>>>>>>>>> @@ -129,6 +129,44 @@ cargo_common_do_configure () {
>>>>>>>>>     python cargo_common_do_patch_paths() {
>>>>>>>>>         import shutil
>>>>>>>>>     
>>>>>>>>> +    def is_rust_crate_folder(path):
>>>>>>>>> +        cargo_toml_path = os.path.join(path, 'Cargo.toml')
>>>>>>>>> +        return os.path.exists(cargo_toml_path)
>>>>>>>>> +
>>>>>>>>> +    def load_toml_file(toml_path):
>>>>>>>>> +        import tomllib
>>>>>>>>> +        with open(toml_path, 'rb') as f:
>>>>>>>>> +            toml = tomllib.load(f)
>>>>>>>>> +        return toml
>>>>>>>>> +
>>>>>>>>> +    def get_matching_repo_from_lockfile(lockfile_repos, repo, revision):
>>>>>>>>> +        for lf_repo in lockfile_repos.keys():
>>>>>>>>> +            if repo in lf_repo and lf_repo.endswith(revision):
>>>>>>>> Does this works if the URL contains a "rev" query parameter? This
>>>>>>>> happens if the same git repository is used with different revisions.
>>>>>>> I *think* yes, since I query the revision from the fetcher, instead of
>>>>>>> parsing it myself (and I use both the repo and revision for matching the
>>>>>>> cargo.lock repos). But will test it specifically, and make it work if it
>>>>>>> wouldn't work out of the box. Thanks for calling my attention on this.
>>>>>> The problem is that the source replacement key contains a query
>>>>>> parameter. The query isn't supported by the git fetcher. That means
>>>>>> you have to remove the query from the SRC_URI but add it back in the
>>>>>> source entry in the config.toml.
>>>>> You mean for dynamic fetching, from Cargo.lock? This patch still relies
>>>>> on the user adding these dependencies to the SRC_URI.
>>>>> Otherwise I might be misunderstanding your question...
>>>> Please check the source inside the Cargo.lock:
>>>> https://github.com/astral-sh/uv/blob/0.8.19/Cargo.lock#L302
>>>>
>>>> It contains a rev query parameter. This query parameter must be part
>>>> of the source key inside the config.toml:
>>>>
>>>> [source."git+https://github.com/astral-sh/rs-async-zip?rev=285e48742b74ab109887d62e1ae79e7c15fd4878"]
>>>>
>>>>
>>> Yes, it supposed to work like that already. The
>>> extract_git_repos_from_lockfile() collects the repos starting with
>>> "git+" from Cargo.lock - this value contains the rev parameter already.
>>> These values are only used as keys in the config.toml file, just like
>>> your example. Before adding it to config.toml, only the last optional
>>> part, the revision after the "#" is cut off. (E.g.
>>> "git+https://github.com/foo?rev=123#123" becomes only
>>> "git+https://github.com/foo?rev=123")
>> Okay, I use the SRC_URIs as source and therefore have the problem to
>> reconstruct the source key. The reason therefore where that I populate
>> the vendor folder during do_unpack. But the config.toml could be created
>> after do_patch and the Cargo.lock should be the better source.
> Personally my main goal would be only to add workspace support to the
> existing class without moving other pieces, but I think config.toml
> creation could be moved after do_patch without big issues, I don't see
> any obvious dependency problems.

The question is if we want to patch the git repository or the partial 
copy inside the vendor folder. In my case I populate the vendor folder 
during do_unpack to patch the vendor folder.

> I would still encourage you to submit your solution (if it is possible
> to open-source it) - it sounds it has been used in real world builds.
We still testing it but I have push the current version to github:

https://github.com/weidmueller/poky/tree/feature/implicit-urls-demo

>>> I do not use SRC_URI components in this file - currently there is some
>>> loose connection between SRC_URI and Cargo.lock repos: at the end I try
>>> to match each SRC_URI to a Cargo.lock repo, and see if the user has
>>> fetched every required repo (by trying to match the repo URL and
>>> revision), but in general the values are used differently.
>>>
>>>>>>>>> +                lockfile_repos[lf_repo] = True
>>>>>>>>> +                return lf_repo.split("#")[0]
>>>>>>>>> +        bb.fatal('Cannot find %s (%s) repository from SRC_URI in Cargo.lock file' % (repo, revision))
>>>>>>>>> +
>>>>>>>>> +    def create_cargo_checksum(folder_path):
>>>>>>>>> +        checksum_path = os.path.join(folder_path, '.cargo-checksum.json')
>>>>>>>>> +        if os.path.exists(checksum_path):
>>>>>>>>> +            return
>>>>>>>>> +
>>>>>>>>> +        import hashlib, json
>>>>>>>>> +
>>>>>>>>> +        checksum = {'files': {}}
>>>>>>>>> +        for root, _, files in os.walk(folder_path):
>>>>>>>>> +            for f in files:
>>>>>>>>> +                full_path = os.path.join(root, f)
>>>>>>>>> +                relative_path = os.path.relpath(full_path, folder_path)
>>>>>>>>> +                if relative_path.startswith(".git/"):
>>>>>>>>> +                    continue
>>>>>>>>> +                with open(full_path, 'rb') as f2:
>>>>>>>>> +                    file_sha = hashlib.sha256(f2.read()).hexdigest()
>>>>>>>>> +                checksum["files"][relative_path] = file_sha
>>>>>>>> Do we really need the calculation of the checksum?
>>>>>>> For source replacement AFAIK it is mandatory, otherwise cargo complains.
>>>>>>> (But I'd be happy to stand corrected)
>>>>>> Have you test an empty dictionary for "files" and NULL for "package"?
>>>>>>
>>>>> Are these valid states? Currently the checksum calculation happens for
>>>>> crate folders that have been actually copied to the vendor folder. And
>>>>> that happens only, in case there is at least a Cargo.toml manifest in
>>>>> that folder, so the files dict shouldn't be empty. Otherwise the
>>>>> checksum sub iterates through all the files it can find, it doesn't try
>>>>> to validate it against any manifests.
>>>> Do we need the validation by cargo? The crate fetcher skip the
>>>> validation with an empty dict and the same works for git sources.
>>>>
>>> Oh, you mean if there are no sources found that should be vendored? That
>>> was definitely a bug in this version, and v2 should have a check for
>>> that - if there is nothing to vendor than it stops and returns silently.
>> I mean that we already ensure the integrity of our sources. Why should
>> we invest time to populate the files checksum if we could simple skip
>> the check inside cargo by an empty files dictionary.
>>
>> metadata['files'] = {}
>> metadata['package'] = tarhash
>>
>> (https://github.com/openembedded/bitbake/blob/master/lib/bb/fetch2/crate.py#L120)
>>
>> Maybe we should even remove the .cargo-checksum.json creation from the
>> fetcher and move it into your function. We can speed up the process if
>> we use the checksum from the Cargo.lock instead of the on-the-fly
>> calculation inside the fetcher:
>>
>> tarhash = hashlib.sha256(f.read()).hexdigest()
>>
>> (https://github.com/openembedded/bitbake/blob/master/lib/bb/fetch2/crate.py#L118)
> I haven't seen this part yet in the fetcher, but I can definitely look
> into it for simplification. Thanks - will try to add it to the next version.
>
>>>>>>>>> +
>>>>>>>>> +        with open(checksum_path, 'w') as f:
>>>>>>>>> +            json.dump(checksum, f)
>>>>>>>>> +
>>>>>>>>>         cargo_config = os.path.join(d.getVar("CARGO_HOME"), "config.toml")
>>>>>>>>>         if not os.path.exists(cargo_config):
>>>>>>>>>             return
>>>>>>>>> @@ -137,66 +175,86 @@ python cargo_common_do_patch_paths() {
>>>>>>>>>         if len(src_uri) == 0:
>>>>>>>>>             return
>>>>>>>>>     
>>>>>>>>> -    patches = dict()
>>>>>>>>> +    lockfile = d.getVar("CARGO_LOCK_PATH")
>>>>>>>>> +    if not os.path.exists(lockfile):
>>>>>>>>> +        bb.fatal(f"{lockfile} file doesn't exist")
>>>>>>>>> +
>>>>>>>>> +    lockfile = load_toml_file(lockfile)
>>>>>>>>> +
>>>>>>>>> +    # key is the repo url, value is a boolean, which is used later
>>>>>>>>> +    # to indicate if there is a matching repository in SRC_URI also
>>>>>>>>> +    lockfile_git_repos = {}
>>>>>>>>> +    for p in lockfile['package']:
>>>>>>>>> +        if 'source' in p and p['source'].startswith('git+'):
>>>>>>>>> +            lockfile_git_repos[p['source']] = False
>>>>>>>>> +
>>>>>>>>> +    sources = dict()
>>>>>>>>>         workdir = d.getVar('UNPACKDIR')
>>>>>>>>>         fetcher = bb.fetch2.Fetch(src_uri, d)
>>>>>>>>> +
>>>>>>>>> +    vendor_folder = os.path.join(workdir, 'yocto-vendored-source-crates')
>>>>>>>>> +
>>>>>>>>> +    os.makedirs(vendor_folder)
>>>>>>>>> +
>>>>>>>>>         for url in fetcher.urls:
>>>>>>>>>             ud = fetcher.ud[url]
>>>>>>>>> -        if ud.type == 'git' or ud.type == 'gitsm':
>>>>>>>>> -            name = ud.parm.get('name')
>>>>>>>>> -            destsuffix = ud.parm.get('destsuffix')
>>>>>>>>> -            if name is not None and destsuffix is not None:
>>>>>>>>> -                if ud.user:
>>>>>>>>> -                    repo = '%s://%s@%s%s' % (ud.proto, ud.user, ud.host, ud.path)
>>>>>>>>> -                else:
>>>>>>>>> -                    repo = '%s://%s%s' % (ud.proto, ud.host, ud.path)
>>>>>>>>> -                path = '%s = { path = "%s" }' % (name, os.path.join(workdir, destsuffix))
>>>>>>>>> -                patches.setdefault(repo, []).append(path)
>>>>>>>>> +        if ud.type != 'git' and ud.type != 'gitsm':
>>>>>>>>> +            continue
>>>>>>>>>     
>>>>>>>>> -    with open(cargo_config, "a+") as config:
>>>>>>>>> -        for k, v in patches.items():
>>>>>>>>> -            print('\n[patch."%s"]' % k, file=config)
>>>>>>>>> -            for name in v:
>>>>>>>>> -                print(name, file=config)
>>>>>>>>> +        destsuffix = ud.parm.get('destsuffix')
>>>>>>>>> +        crate_folder = os.path.join(workdir, destsuffix)
>>>>>>>>>     
>>>>>>>>> -    if not patches:
>>>>>>>>> -        return
>>>>>>>>> +        if destsuffix is None or not is_rust_crate_folder(crate_folder):
>>>>>>>>> +            continue
>>>>>>>>>     
>>>>>>>>> -    # Cargo.lock file is needed for to be sure that artifacts
>>>>>>>>> -    # downloaded by the fetch steps are those expected by the
>>>>>>>>> -    # project and that the possible patches are correctly applied.
>>>>>>>>> -    # Moreover since we do not want any modification
>>>>>>>>> -    # of this file (for reproducibility purpose), we prevent it by
>>>>>>>>> -    # using --frozen flag (in CARGO_BUILD_FLAGS) and raise a clear error
>>>>>>>>> -    # here is better than letting cargo tell (in case the file is missing)
>>>>>>>>> -    # "Cargo.lock should be modified but --frozen was given"
>>>>>>>>> +        if ud.user:
>>>>>>>>> +            repo = '%s://%s@%s%s' % (ud.proto, ud.user, ud.host, ud.path)
>>>>>>>>> +        else:
>>>>>>>>> +            repo = '%s://%s%s' % (ud.proto, ud.host, ud.path)
>>>>>>>>>     
>>>>>>>>> -    lockfile = d.getVar("CARGO_LOCK_PATH")
>>>>>>>>> -    if not os.path.exists(lockfile):
>>>>>>>>> -        bb.fatal(f"{lockfile} file doesn't exist")
>>>>>>>>> +        sources[destsuffix] = (repo, ud.revision, crate_folder)
>>>>>>>>> +
>>>>>>>>> +        cargo_toml_path = os.path.join(workdir, destsuffix, 'Cargo.toml')
>>>>>>>>> +        cargo_toml = load_toml_file(cargo_toml_path)
>>>>>>>>> +
>>>>>>>>> +        if 'workspace' in cargo_toml:
>>>>>>>>> +            members = cargo_toml['workspace']['members']
>>>>>>>>> +            for member in members:
>>>>>>>>> +                member_crate_folder = os.path.join(workdir, destsuffix, member)
>>>>>>>>> +                member_crate_cargo_toml = os.path.join(member_crate_folder, 'Cargo.toml')
>>>>>>>>> +                member_cargo_toml = load_toml_file(member_crate_cargo_toml)
>>>>>>>>> +                member_crate_name = member_cargo_toml['package']['name']
>>>>>>>>> +                shutil.copytree(member_crate_folder, os.path.join(vendor_folder, member_crate_name))
>>>>>>>>> +
>>>>>>>>> +        if 'package' in cargo_toml:
>>>>>>>>> +            crate_folder = os.path.join(workdir, destsuffix)
>>>>>>>>> +            crate_name = cargo_toml['package']['name']
>>>>>>>>> +            shutil.copytree(crate_folder, os.path.join(vendor_folder, crate_name))
>>>>>>>>> +
>>>>>>>>> +    for d in os.scandir(vendor_folder):
>>>>>>>>> +        if d.is_dir():
>>>>>>>>> +            create_cargo_checksum(d.path)
>>>>>>>>> +
>>>>>>>>> +
>>>>>>>>> +    with open(cargo_config, "a+") as config:
>>>>>>>>> +        print('\n[source."yocto-vendored-sources"]', file=config)
>>>>>>>>> +        print('directory = "%s"' % vendor_folder, file=config)
>>>>>>>>> +
>>>>>>>>> +        for destsuffix, (repo, revision, repo_path) in sources.items():
>>>>>>>>> +            lockfile_repo = get_matching_repo_from_lockfile(lockfile_git_repos, repo, revision)
>>>>>>>>> +            print('\n[source."%s"]' % lockfile_repo, file=config)
>>>>>>>>> +            print('git = "%s"' % repo, file=config)
>>>>>>>>> +            print('rev = "%s"' % revision, file=config)
>>>>>>>>> +            print('replace-with = "yocto-vendored-sources"', file=config)
>>>>>>>>> +
>>>>>>>>> +    # check if there are any git repos in the lock file that were not visited
>>>>>>>>> +    # in the previous loop, when the source replacement was created, and warn about it
>>>>>>>>> +    for lf_repo, found_in_src_uri in lockfile_git_repos.items():
>>>>>>>>> +        if not found_in_src_uri:
>>>>>>>>> +            bb.warn(f"{lf_repo} is present in lockfile, but not found in SRC_URI")
>>>>>>>>>     
>>>>>>>>> -    # There are patched files and so Cargo.lock should be modified but we use
>>>>>>>>> -    # --frozen so let's handle that modifications here.
>>>>>>>>> -    #
>>>>>>>>> -    # Note that a "better" (more elegant ?) would have been to use cargo update for
>>>>>>>>> -    # patched packages:
>>>>>>>>> -    #  cargo update --offline -p package_1 -p package_2
>>>>>>>>> -    # But this is not possible since it requires that cargo local git db
>>>>>>>>> -    # to be populated and this is not the case as we fetch git repo ourself.
>>>>>>>>> -
>>>>>>>>> -    lockfile_orig = lockfile + ".orig"
>>>>>>>>> -    if not os.path.exists(lockfile_orig):
>>>>>>>>> -        shutil.copy(lockfile, lockfile_orig)
>>>>>>>>> -
>>>>>>>>> -    newlines = []
>>>>>>>>> -    with open(lockfile_orig, "r") as f:
>>>>>>>>> -        for line in f.readlines():
>>>>>>>>> -            if not line.startswith("source = \"git"):
>>>>>>>>> -                newlines.append(line)
>>>>>>>>> -
>>>>>>>>> -    with open(lockfile, "w") as f:
>>>>>>>>> -        f.writelines(newlines)
>>>>>>>>>     }
>>>>>>>>> +
>>>>>>>>>     do_configure[postfuncs] += "cargo_common_do_patch_paths"
>>>>>>>>>     
>>>>>>>>>     do_compile:prepend () {
>>>>>>>>>
>>>>>>>>> -=-=-=-=-=-=-=-=-=-=-=-
>>>>>>>>> Links: You receive all messages sent to this group.
>>>>>>>>> View/Reply Online (#224426):https://lists.openembedded.org/g/openembedded-core/message/224426
>>>>>>>>> Mute This Topic:https://lists.openembedded.org/mt/115578466/6374899
>>>>>>>>> Group Owner:openembedded-core+owner@lists.openembedded.org
>>>>>>>>> Unsubscribe:https://lists.openembedded.org/g/openembedded-core/unsub [stefan.herbrechtsmeier-oss@weidmueller.com]
>>>>>>>>> -=-=-=-=-=-=-=-=-=-=-=-
>>>>>>>>>
--------------d80T9SO1HfSFzz4nTAicL7n6
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <div class="moz-cite-prefix">Am 10.10.2025 um 13:35 schrieb Gyorgy
      Sarvari:<br>
    </div>
    <blockquote type="cite" cite="mid:07f2daa3-b311-4247-87eb-ad404f2af24b@gmail.com">
      <pre wrap="" class="moz-quote-pre">On 10/10/25 12:38, Stefan Herbrechtsmeier wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">Am 10.10.2025 um 10:04 schrieb Gyorgy Sarvari:
</pre>
        <blockquote type="cite">
          <pre wrap="" class="moz-quote-pre">On 10/10/25 08:27, Stefan Herbrechtsmeier wrote:
</pre>
          <blockquote type="cite">
            <pre wrap="" class="moz-quote-pre">Am 09.10.2025 um 16:30 schrieb Gyorgy Sarvari:
</pre>
            <blockquote type="cite">
              <pre wrap="" class="moz-quote-pre">On 10/9/25 11:31, Stefan Herbrechtsmeier wrote:
</pre>
              <blockquote type="cite">
                <pre wrap="" class="moz-quote-pre">Am 08.10.2025 um 13:01 schrieb Gyorgy Sarvari:
</pre>
                <blockquote type="cite">
                  <pre wrap="" class="moz-quote-pre">On 10/7/25 16:59, Stefan Herbrechtsmeier wrote:
</pre>
                  <blockquote type="cite">
                    <pre wrap="" class="moz-quote-pre">Am 03.10.2025 um 23:30 schrieb Gyorgy Sarvari via lists.openembedded.org:
</pre>
                    <blockquote type="cite">
                      <pre wrap="" class="moz-quote-pre">Cargo.toml files usually contain a list of dependencies in one of two forms:
either a crate name that can be fetched from some registry (like crates.io), or
as a source crate, which is most often fetched from a git repository.

Normally cargo handles fetching the crates from both the registry and from git,
however with Yocto this task is taken over by Bitbake.

After fetching these crates, they are made available to cargo by adding the location
to $CARGO_HOME/config.toml. The source crates are of interest here: each git repository
that can be found in the SRC_URI is added as one source crate.

This works most of the time, as long as the repository really contains one crate only.

However in case the repository is a cargo workspace, it contains multiple crates in
different subfolders, and in order to allow cargo to process them, they need to be
listed separately. This is not happening with the current implementation of cargo_common.

This change introduces the following:
- instead of patching the dependencies, use source replacement (the primary motivation for
    this was that maturin seems to ignore source crate patches from config.toml)
- the above also allows to keep the original Cargo.lock untouched (the original implementation
    deleted git repository lines from it)
- it adds a new folder, currently ${UNPACKDIR}/yocto-vendored-source-crates. During processing
    the separate crate folders are copied into this folder, and it is used as the central
    vendoring folder. This is needed for source replacements: the folder that is used for
    vendoring needs to contain the crates separately, one crate in one folder. Each folder
    has the name of the crate that it contains. Workspaces are not included here (unless the
    given manifest is a workspace AND a package at once)
- previuosly the SRC_URI had to contain a &quot;name&quot; and a &quot;destsuffix&quot; parameter to be considered
    to be a rust crate. The name is not derived from the Cargo.toml file, not from the SRC_URI.
    Having destsuffix is still mandatory though.

The change does not handle nested workspaces, only the top level Cargo.toml is processed.
</pre>
                    </blockquote>
                    <pre wrap="" class="moz-quote-pre">I use a similar approach for my Cargo.lock fetcher. In my case the code
finds the crate on the fly inside the a git repository because the
Cargo.lock doesn't contain the subpath.
</pre>
                  </blockquote>
                  <pre wrap="" class="moz-quote-pre">By any chance, did you manage to solve the workspace problem? If you
have a working solution, feel free to submit it, I wouldn't mind if I
wouldn't have to debug mine :D
</pre>
                </blockquote>
                <pre wrap="" class="moz-quote-pre">I haven't test a workspace project. Do you have an example project?

</pre>
              </blockquote>
              <pre wrap="" class="moz-quote-pre">I have attached a sample recipe (that is very much based on Tom Geelen's
initial work). It depends on at least 2 workspaces.
</pre>
            </blockquote>
            <pre wrap="" class="moz-quote-pre">Thanks for the sample. After switching to my cargolock fecher and
cargo_vendor class the project build without problems. Your git URLs
need a parameter to inform the config generate that the source
contains a rev query parameter. Additionally you need to add the
revision to the name and destsuffix/subdir because it is possible to
use crates with different revisions from the same repository.

</pre>
          </blockquote>
          <pre wrap="" class="moz-quote-pre">Yes, but the name and destsuffix already need to be always unique by
definition for each SRC_URI component. If name isn't unique, then you
can't specify different revisions. And git fetcher (and I suspect others
too) starts fetching with deleting the target folder, so if destsuffix
isn't unique, then only the last code prevails.
</pre>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">It was only a comment, that the solution inside your example doesn't 
work in any case.

In your example the Cargo.lock reference two crates inside the same 
repository:

[[package]]
name = &quot;reqwest-middleware&quot;
version = &quot;0.4.2&quot;
source = 
&quot;git+https://github.com/astral-sh/reqwest-middleware?rev=7650ed76215a962a96d94a79be71c27bffde7ab2#7650ed76215a962a96d94a79be71c27bffde7ab2&quot;

[[package]]
name = &quot;reqwest-retry&quot;
version = &quot;0.7.0&quot;
source = 
&quot;git+https://github.com/astral-sh/reqwest-middleware?rev=7650ed76215a962a96d94a79be71c27bffde7ab2#7650ed76215a962a96d94a79be71c27bffde7ab2&quot;

(<a class="moz-txt-link-freetext" href="https://github.com/astral-sh/uv/blob/0.8.19/Cargo.lock#L3431">https://github.com/astral-sh/uv/blob/0.8.19/Cargo.lock#L3431</a>)

Luckily both use the same revision of the repository and you can use a 
single SRC_URI:

SRC_URI += 
&quot;git://github.com/astral-sh/reqwest-middleware;protocol=https;name=reqwest-middleware;destsuffix=reqwest-middleware;branch=main&quot;

If they use different revisions you have to add two SRC_URIs with 
different name and destsuffix. Furthermore you need to add the crates 
from the correct destsuffix to the vendor folder because both checkouts 
can contain the same crates.

I follow the cargo vendor approach and use a part of the revision inside 
the subdir (destsuffix).

SRC_URI += 
&quot;git://github.com/astral-sh/reqwest-middleware;protocol=https;nobranch=1;name=reqwest-middleware#7650ed7;destsuffix=cargo/git/checkouts/reqwest-middleware/7650ed7&quot;
SRC_URI += 
&quot;git://github.com/astral-sh/reqwest-middleware;protocol=https;nobranch=1;name=reqwest-middleware#591ab44;destsuffix=cargo/git/checkouts/reqwest-middleware/591ab44&quot;
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Hmmm... ooops. You are definitely right - I do break crates if they have
the same name, they are not differentiated and copied over each other.
Thanks a lot - will take care of it in next version.

Regarding the duplicated SRC_URI: yes, but that's on the user.

</pre>
      <blockquote type="cite">
        <blockquote type="cite">
          <pre wrap="" class="moz-quote-pre">If this should be
enforced, I would rather put that logic into a new QA check, or maybe
into the fetcher directly.

(A bit more touched on your note below)

</pre>
          <blockquote type="cite">
            <blockquote type="cite">
              <blockquote type="cite">
                <blockquote type="cite">
                  <blockquote type="cite">
                    <blockquote type="cite">
                      <pre wrap="" class="moz-quote-pre">Signed-off-by: Gyorgy Sarvari <a class="moz-txt-link-rfc2396E" href="mailto:skandigraun@gmail.com">&lt;skandigraun@gmail.com&gt;</a>
Cc: Tom Geelen <a class="moz-txt-link-rfc2396E" href="mailto:t.f.g.geelen@gmail.com">&lt;t.f.g.geelen@gmail.com&gt;</a>

---
   meta/classes-recipe/cargo_common.bbclass | 158 ++++++++++++++++-------
   1 file changed, 108 insertions(+), 50 deletions(-)

diff --git a/meta/classes-recipe/cargo_common.bbclass b/meta/classes-recipe/cargo_common.bbclass
index c9eb2d09a5..79c1351298 100644
--- a/meta/classes-recipe/cargo_common.bbclass
+++ b/meta/classes-recipe/cargo_common.bbclass
@@ -129,6 +129,44 @@ cargo_common_do_configure () {
   python cargo_common_do_patch_paths() {
       import shutil
   
+    def is_rust_crate_folder(path):
+        cargo_toml_path = os.path.join(path, 'Cargo.toml')
+        return os.path.exists(cargo_toml_path)
+
+    def load_toml_file(toml_path):
+        import tomllib
+        with open(toml_path, 'rb') as f:
+            toml = tomllib.load(f)
+        return toml
+
+    def get_matching_repo_from_lockfile(lockfile_repos, repo, revision):
+        for lf_repo in lockfile_repos.keys():
+            if repo in lf_repo and lf_repo.endswith(revision):
</pre>
                    </blockquote>
                    <pre wrap="" class="moz-quote-pre">Does this works if the URL contains a &quot;rev&quot; query parameter? This
happens if the same git repository is used with different revisions.
</pre>
                  </blockquote>
                  <pre wrap="" class="moz-quote-pre">I *think* yes, since I query the revision from the fetcher, instead of
parsing it myself (and I use both the repo and revision for matching the
cargo.lock repos). But will test it specifically, and make it work if it
wouldn't work out of the box. Thanks for calling my attention on this.
</pre>
                </blockquote>
                <pre wrap="" class="moz-quote-pre">The problem is that the source replacement key contains a query
parameter. The query isn't supported by the git fetcher. That means
you have to remove the query from the SRC_URI but add it back in the
source entry in the config.toml.
</pre>
              </blockquote>
              <pre wrap="" class="moz-quote-pre">You mean for dynamic fetching, from Cargo.lock? This patch still relies
on the user adding these dependencies to the SRC_URI.
Otherwise I might be misunderstanding your question...
</pre>
            </blockquote>
            <pre wrap="" class="moz-quote-pre">Please check the source inside the Cargo.lock:
<a class="moz-txt-link-freetext" href="https://github.com/astral-sh/uv/blob/0.8.19/Cargo.lock#L302">https://github.com/astral-sh/uv/blob/0.8.19/Cargo.lock#L302</a>

It contains a rev query parameter. This query parameter must be part
of the source key inside the config.toml:

[source.&quot;git+https://github.com/astral-sh/rs-async-zip?rev=285e48742b74ab109887d62e1ae79e7c15fd4878&quot;]


</pre>
          </blockquote>
          <pre wrap="" class="moz-quote-pre">Yes, it supposed to work like that already. The
extract_git_repos_from_lockfile() collects the repos starting with
&quot;git+&quot; from Cargo.lock - this value contains the rev parameter already.
These values are only used as keys in the config.toml file, just like
your example. Before adding it to config.toml, only the last optional
part, the revision after the &quot;#&quot; is cut off. (E.g.
&quot;git+https://github.com/foo?rev=123#123&quot; becomes only
&quot;git+https://github.com/foo?rev=123&quot;)
</pre>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">Okay, I use the SRC_URIs as source and therefore have the problem to 
reconstruct the source key. The reason therefore where that I populate 
the vendor folder during do_unpack. But the config.toml could be created 
after do_patch and the Cargo.lock should be the better source.
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Personally my main goal would be only to add workspace support to the
existing class without moving other pieces, but I think config.toml
creation could be moved after do_patch without big issues, I don't see
any obvious dependency problems.</pre>
    </blockquote>
    <p>The question is if we want to patch the git repository or the
      partial copy inside the vendor folder. In my case I populate the
      vendor folder during do_unpack to patch the vendor folder.<span style="white-space: pre-wrap">
</span><br>
    </p>
    <blockquote type="cite" cite="mid:07f2daa3-b311-4247-87eb-ad404f2af24b@gmail.com">
      <pre wrap="" class="moz-quote-pre">I would still encourage you to submit your solution (if it is possible
to open-source it) - it sounds it has been used in real world builds.</pre>
    </blockquote>
    We still testing it but I have push the current version to github:<br>
    <br>
    <a class="moz-txt-link-freetext" href="https://github.com/weidmueller/poky/tree/feature/implicit-urls-demo">https://github.com/weidmueller/poky/tree/feature/implicit-urls-demo</a><br>
    <br>
    <blockquote type="cite" cite="mid:07f2daa3-b311-4247-87eb-ad404f2af24b@gmail.com">
      <blockquote type="cite">
        <blockquote type="cite">
          <pre wrap="" class="moz-quote-pre">I do not use SRC_URI components in this file - currently there is some
loose connection between SRC_URI and Cargo.lock repos: at the end I try
to match each SRC_URI to a Cargo.lock repo, and see if the user has
fetched every required repo (by trying to match the repo URL and
revision), but in general the values are used differently.

</pre>
          <blockquote type="cite">
            <blockquote type="cite">
              <blockquote type="cite">
                <blockquote type="cite">
                  <blockquote type="cite">
                    <blockquote type="cite">
                      <pre wrap="" class="moz-quote-pre">+                lockfile_repos[lf_repo] = True
+                return lf_repo.split(&quot;#&quot;)[0]
+        bb.fatal('Cannot find %s (%s) repository from SRC_URI in Cargo.lock file' % (repo, revision))
+
+    def create_cargo_checksum(folder_path):
+        checksum_path = os.path.join(folder_path, '.cargo-checksum.json')
+        if os.path.exists(checksum_path):
+            return
+
+        import hashlib, json
+
+        checksum = {'files': {}}
+        for root, _, files in os.walk(folder_path):
+            for f in files:
+                full_path = os.path.join(root, f)
+                relative_path = os.path.relpath(full_path, folder_path)
+                if relative_path.startswith(&quot;.git/&quot;):
+                    continue
+                with open(full_path, 'rb') as f2:
+                    file_sha = hashlib.sha256(f2.read()).hexdigest()
+                checksum[&quot;files&quot;][relative_path] = file_sha
</pre>
                    </blockquote>
                    <pre wrap="" class="moz-quote-pre">Do we really need the calculation of the checksum?
</pre>
                  </blockquote>
                  <pre wrap="" class="moz-quote-pre">For source replacement AFAIK it is mandatory, otherwise cargo complains.
(But I'd be happy to stand corrected)
</pre>
                </blockquote>
                <pre wrap="" class="moz-quote-pre">Have you test an empty dictionary for &quot;files&quot; and NULL for &quot;package&quot;?

</pre>
              </blockquote>
              <pre wrap="" class="moz-quote-pre">Are these valid states? Currently the checksum calculation happens for
crate folders that have been actually copied to the vendor folder. And
that happens only, in case there is at least a Cargo.toml manifest in
that folder, so the files dict shouldn't be empty. Otherwise the
checksum sub iterates through all the files it can find, it doesn't try
to validate it against any manifests.
</pre>
            </blockquote>
            <pre wrap="" class="moz-quote-pre">Do we need the validation by cargo? The crate fetcher skip the
validation with an empty dict and the same works for git sources.

</pre>
          </blockquote>
          <pre wrap="" class="moz-quote-pre">Oh, you mean if there are no sources found that should be vendored? That
was definitely a bug in this version, and v2 should have a check for
that - if there is nothing to vendor than it stops and returns silently.
</pre>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">I mean that we already ensure the integrity of our sources. Why should 
we invest time to populate the files checksum if we could simple skip 
the check inside cargo by an empty files dictionary.

metadata['files'] = {}
metadata['package'] = tarhash

(<a class="moz-txt-link-freetext" href="https://github.com/openembedded/bitbake/blob/master/lib/bb/fetch2/crate.py#L120">https://github.com/openembedded/bitbake/blob/master/lib/bb/fetch2/crate.py#L120</a>)

Maybe we should even remove the .cargo-checksum.json creation from the 
fetcher and move it into your function. We can speed up the process if 
we use the checksum from the Cargo.lock instead of the on-the-fly 
calculation inside the fetcher:

tarhash = hashlib.sha256(f.read()).hexdigest()

(<a class="moz-txt-link-freetext" href="https://github.com/openembedded/bitbake/blob/master/lib/bb/fetch2/crate.py#L118">https://github.com/openembedded/bitbake/blob/master/lib/bb/fetch2/crate.py#L118</a>)
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
I haven't seen this part yet in the fetcher, but I can definitely look
into it for simplification. Thanks - will try to add it to the next version.

</pre>
      <blockquote type="cite">
        <blockquote type="cite">
          <blockquote type="cite">
            <blockquote type="cite">
              <blockquote type="cite">
                <blockquote type="cite">
                  <blockquote type="cite">
                    <blockquote type="cite">
                      <pre wrap="" class="moz-quote-pre">+
+        with open(checksum_path, 'w') as f:
+            json.dump(checksum, f)
+
       cargo_config = os.path.join(d.getVar(&quot;CARGO_HOME&quot;), &quot;config.toml&quot;)
       if not os.path.exists(cargo_config):
           return
@@ -137,66 +175,86 @@ python cargo_common_do_patch_paths() {
       if len(src_uri) == 0:
           return
   
-    patches = dict()
+    lockfile = d.getVar(&quot;CARGO_LOCK_PATH&quot;)
+    if not os.path.exists(lockfile):
+        bb.fatal(f&quot;{lockfile} file doesn't exist&quot;)
+
+    lockfile = load_toml_file(lockfile)
+
+    # key is the repo url, value is a boolean, which is used later
+    # to indicate if there is a matching repository in SRC_URI also
+    lockfile_git_repos = {}
+    for p in lockfile['package']:
+        if 'source' in p and p['source'].startswith('git+'):
+            lockfile_git_repos[p['source']] = False
+
+    sources = dict()
       workdir = d.getVar('UNPACKDIR')
       fetcher = bb.fetch2.Fetch(src_uri, d)
+
+    vendor_folder = os.path.join(workdir, 'yocto-vendored-source-crates')
+
+    os.makedirs(vendor_folder)
+
       for url in fetcher.urls:
           ud = fetcher.ud[url]
-        if ud.type == 'git' or ud.type == 'gitsm':
-            name = ud.parm.get('name')
-            destsuffix = ud.parm.get('destsuffix')
-            if name is not None and destsuffix is not None:
-                if ud.user:
-                    repo = '%s://%s@%s%s' % (ud.proto, ud.user, ud.host, ud.path)
-                else:
-                    repo = '%s://%s%s' % (ud.proto, ud.host, ud.path)
-                path = '%s = { path = &quot;%s&quot; }' % (name, os.path.join(workdir, destsuffix))
-                patches.setdefault(repo, []).append(path)
+        if ud.type != 'git' and ud.type != 'gitsm':
+            continue
   
-    with open(cargo_config, &quot;a+&quot;) as config:
-        for k, v in patches.items():
-            print('\n[patch.&quot;%s&quot;]' % k, file=config)
-            for name in v:
-                print(name, file=config)
+        destsuffix = ud.parm.get('destsuffix')
+        crate_folder = os.path.join(workdir, destsuffix)
   
-    if not patches:
-        return
+        if destsuffix is None or not is_rust_crate_folder(crate_folder):
+            continue
   
-    # Cargo.lock file is needed for to be sure that artifacts
-    # downloaded by the fetch steps are those expected by the
-    # project and that the possible patches are correctly applied.
-    # Moreover since we do not want any modification
-    # of this file (for reproducibility purpose), we prevent it by
-    # using --frozen flag (in CARGO_BUILD_FLAGS) and raise a clear error
-    # here is better than letting cargo tell (in case the file is missing)
-    # &quot;Cargo.lock should be modified but --frozen was given&quot;
+        if ud.user:
+            repo = '%s://%s@%s%s' % (ud.proto, ud.user, ud.host, ud.path)
+        else:
+            repo = '%s://%s%s' % (ud.proto, ud.host, ud.path)
   
-    lockfile = d.getVar(&quot;CARGO_LOCK_PATH&quot;)
-    if not os.path.exists(lockfile):
-        bb.fatal(f&quot;{lockfile} file doesn't exist&quot;)
+        sources[destsuffix] = (repo, ud.revision, crate_folder)
+
+        cargo_toml_path = os.path.join(workdir, destsuffix, 'Cargo.toml')
+        cargo_toml = load_toml_file(cargo_toml_path)
+
+        if 'workspace' in cargo_toml:
+            members = cargo_toml['workspace']['members']
+            for member in members:
+                member_crate_folder = os.path.join(workdir, destsuffix, member)
+                member_crate_cargo_toml = os.path.join(member_crate_folder, 'Cargo.toml')
+                member_cargo_toml = load_toml_file(member_crate_cargo_toml)
+                member_crate_name = member_cargo_toml['package']['name']
+                shutil.copytree(member_crate_folder, os.path.join(vendor_folder, member_crate_name))
+
+        if 'package' in cargo_toml:
+            crate_folder = os.path.join(workdir, destsuffix)
+            crate_name = cargo_toml['package']['name']
+            shutil.copytree(crate_folder, os.path.join(vendor_folder, crate_name))
+
+    for d in os.scandir(vendor_folder):
+        if d.is_dir():
+            create_cargo_checksum(d.path)
+
+
+    with open(cargo_config, &quot;a+&quot;) as config:
+        print('\n[source.&quot;yocto-vendored-sources&quot;]', file=config)
+        print('directory = &quot;%s&quot;' % vendor_folder, file=config)
+
+        for destsuffix, (repo, revision, repo_path) in sources.items():
+            lockfile_repo = get_matching_repo_from_lockfile(lockfile_git_repos, repo, revision)
+            print('\n[source.&quot;%s&quot;]' % lockfile_repo, file=config)
+            print('git = &quot;%s&quot;' % repo, file=config)
+            print('rev = &quot;%s&quot;' % revision, file=config)
+            print('replace-with = &quot;yocto-vendored-sources&quot;', file=config)
+
+    # check if there are any git repos in the lock file that were not visited
+    # in the previous loop, when the source replacement was created, and warn about it
+    for lf_repo, found_in_src_uri in lockfile_git_repos.items():
+        if not found_in_src_uri:
+            bb.warn(f&quot;{lf_repo} is present in lockfile, but not found in SRC_URI&quot;)
   
-    # There are patched files and so Cargo.lock should be modified but we use
-    # --frozen so let's handle that modifications here.
-    #
-    # Note that a &quot;better&quot; (more elegant ?) would have been to use cargo update for
-    # patched packages:
-    #  cargo update --offline -p package_1 -p package_2
-    # But this is not possible since it requires that cargo local git db
-    # to be populated and this is not the case as we fetch git repo ourself.
-
-    lockfile_orig = lockfile + &quot;.orig&quot;
-    if not os.path.exists(lockfile_orig):
-        shutil.copy(lockfile, lockfile_orig)
-
-    newlines = []
-    with open(lockfile_orig, &quot;r&quot;) as f:
-        for line in f.readlines():
-            if not line.startswith(&quot;source = \&quot;git&quot;):
-                newlines.append(line)
-
-    with open(lockfile, &quot;w&quot;) as f:
-        f.writelines(newlines)
   }
+
   do_configure[postfuncs] += &quot;cargo_common_do_patch_paths&quot;
   
   do_compile:prepend () {

-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#224426): <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-core/message/224426">https://lists.openembedded.org/g/openembedded-core/message/224426</a>
Mute This Topic: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/mt/115578466/6374899">https://lists.openembedded.org/mt/115578466/6374899</a>
Group Owner: <a class="moz-txt-link-abbreviated" href="mailto:openembedded-core+owner@lists.openembedded.org">openembedded-core+owner@lists.openembedded.org</a>
Unsubscribe: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-core/unsub">https://lists.openembedded.org/g/openembedded-core/unsub</a> [<a class="moz-txt-link-abbreviated" href="mailto:stefan.herbrechtsmeier-oss@weidmueller.com">stefan.herbrechtsmeier-oss@weidmueller.com</a>]
-=-=-=-=-=-=-=-=-=-=-=-

</pre>
                    </blockquote>
                  </blockquote>
                </blockquote>
              </blockquote>
            </blockquote>
          </blockquote>
        </blockquote>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
</pre>
    </blockquote>
  </body>
</html>

--------------d80T9SO1HfSFzz4nTAicL7n6--

