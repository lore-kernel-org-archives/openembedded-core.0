Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0891CC27C5E
	for <webhook@archiver.kernel.org>; Tue, 11 Jun 2024 10:47:26 +0000 (UTC)
Received: from EUR02-VI1-obe.outbound.protection.outlook.com (EUR02-VI1-obe.outbound.protection.outlook.com [40.107.241.89])
 by mx.groups.io with SMTP id smtpd.web10.6451.1718102841954038156
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Jun 2024 03:47:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=NaxWfjMV;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=NaxWfjMV;
 spf=pass (domain: arm.com, ip: 40.107.241.89, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=OD46JMM22EXRRnl/cErY+Tv/hzE3Ipa2Aj85kQhQfFp+8oIxms7VS9a2IBGE+d0Yj8WwxNYbnL1W870sbVXtEceqlUtN/jeQv+2ySVTsnhOYkxK1klvzsDxLTSp9X5TyzVAAV9YnzVLJvILXLktrK3ruCR8cjZcv1m5QZP46oTfZ8XB7QtnyCYGahFDhPCMbNbWBDHyzh+j+Sn+Upt8zfwf4uS/JAoab36qJnxdV5ruTTYYKxu5NPztZHyNIGY1JAaF4xOevXPv+OItGzCuhiFt/6pO3S50Mr+l4dllglxWvt8pe4dzBvxDJMytd0CtjmZkkSY9Wr+q2DYufX0VOBA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q7A2v3E5Z66vsA97tkgqcg3a9lUmXZY5uJRMcTgY1b4=;
 b=DIvw8+giCUW9Gx3WgemS4hcaI4ajfnlv8jh8rw1J0eDbuekKywy9yheYdl/NGGZPnyihqela9eQwT5eSqkrDD5Ao1DA5jqMuJvIUbvSTH9bvilFU+KXd592Vs4dtZ88nD5KVSt2l1lUnCAGimR0PPNeNWGFaNQEtGMpl+y+FrEkhkds2WktOXmhdNDCdZRJlmKbTIBxvVWcb2A7uEy0md8YRRFIFgxaFnfP0drkmMXlgyjJZNo+Xg6MGImAlfMNApt0OIktq5TFmokYGA61ANcngTCpk5Z66ywvpjK42vq6nnK1fcwFhBy6gk1gvSVO/EaG118aDyv+HAldQfzn5Ug==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q7A2v3E5Z66vsA97tkgqcg3a9lUmXZY5uJRMcTgY1b4=;
 b=NaxWfjMVFnLtiEQbk3XrK9alOruzDp0VjKZ/m6FEzaBeSUXbAJDq/3e2DvgeHNBn3T4gvRwCj8tuDYpUfdnhQ8qTAgo0i/7fsjSpHKRh2fn9ISbySeVwTaB5EjHe4ShppvQ54brJC0JjZjoAJiUBsprSvO3QnrbO6eD7YhAG8Pc=
Received: from DB7PR05CA0056.eurprd05.prod.outlook.com (2603:10a6:10:2e::33)
 by AS8PR08MB9194.eurprd08.prod.outlook.com (2603:10a6:20b:57e::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.37; Tue, 11 Jun
 2024 10:47:13 +0000
Received: from DU2PEPF00028D0C.eurprd03.prod.outlook.com
 (2603:10a6:10:2e:cafe::11) by DB7PR05CA0056.outlook.office365.com
 (2603:10a6:10:2e::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.17 via Frontend
 Transport; Tue, 11 Jun 2024 10:47:13 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DU2PEPF00028D0C.mail.protection.outlook.com (10.167.242.20) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.7677.15
 via Frontend Transport; Tue, 11 Jun 2024 10:47:16 +0000
Received: ("Tessian outbound 949243bb8c19:v332"); Tue, 11 Jun 2024 10:47:16 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 029b73d1df467e44
X-CR-MTA-TID: 64aa7808
Received: from bbbc400e923f.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id B7CB8E8E-90A4-4CB3-89F0-2A6097631BC7.1;
	Tue, 11 Jun 2024 10:47:09 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id bbbc400e923f.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Tue, 11 Jun 2024 10:47:09 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T0yTNbxwdHYFZLDOZ0jEyLoXuS+zrtrzN3YWmuO4WNxmpBFttYUXQOKLlOFOS9pBQK017maER4NmhkBuafq1gCOIOzMuRt2/azwrUEN61iwH19yr8h5eUWC7Uh3tkrijiLkCZsWswtemkZxpg1vpUn2CUwt76oIAN4tdwEI+jEYSCXsdu37un+jsHfnyc+7y3TrvYpmBnsPUUSxlQb82XnkaV4YA53H7vVcdtkBLqYYB8jcHF/UzZJbQL366+a48V9fDPTGMB7wSbVX8uwQYBaDualFVptQDRPbqmaQpBUj6p8P1DVKrTwxUGp6AQIZwLB9s5GVW54KvT4/XXbV6vA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q7A2v3E5Z66vsA97tkgqcg3a9lUmXZY5uJRMcTgY1b4=;
 b=UhoASTIAhbfDqmEml6MvplC9K2igJOrpwl31zJakplMMuVOs3+LVZB7ubEMcjm3ebMOqPY9zkYFfjMc1Mq7zta2JBc752AgauiEQFeco+H8lG80l/Gtvob2DaUL480ZCK+ZkvU+PdubWJW6nC34HWrJO9M0az4DyRKhBP1P8oSJ01odB0OfWMf8QvGHMHVnG8e9uXRGCnbxm9TARKGz3uZNJFVHgEoQDTVy3jQPb68wJmKxIRuoYy390+quD3HkyVm1O2gkE48x1hNMx8iSJettvxrKRczbI/tIYy93j2FGBQnoleC0hwezJvHlTEUKqFvX6dJKUj4QFK6Jwime1JA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q7A2v3E5Z66vsA97tkgqcg3a9lUmXZY5uJRMcTgY1b4=;
 b=NaxWfjMVFnLtiEQbk3XrK9alOruzDp0VjKZ/m6FEzaBeSUXbAJDq/3e2DvgeHNBn3T4gvRwCj8tuDYpUfdnhQ8qTAgo0i/7fsjSpHKRh2fn9ISbySeVwTaB5EjHe4ShppvQ54brJC0JjZjoAJiUBsprSvO3QnrbO6eD7YhAG8Pc=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by VI1PR08MB5424.eurprd08.prod.outlook.com (2603:10a6:803:136::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.36; Tue, 11 Jun
 2024 10:47:07 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e%4]) with mapi id 15.20.7633.036; Tue, 11 Jun 2024
 10:47:03 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "ecordonnier@snap.com" <ecordonnier@snap.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][PATCH v3] oeqa/runtime: fix race-condition in
 minidebuginfo test
Thread-Topic: [OE-core][PATCH v3] oeqa/runtime: fix race-condition in
 minidebuginfo test
Thread-Index: AQHau1GhzhhOMxItxEWpsTMvl2Dzt7HCYrmA
Date: Tue, 11 Jun 2024 10:47:03 +0000
Message-ID: <D10F0112-192B-46C1-A9B3-6ED3F4F346D1@arm.com>
References: <20240610161642.257051-1-ecordonnier@snap.com>
In-Reply-To: <20240610161642.257051-1-ecordonnier@snap.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3774.600.62)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|VI1PR08MB5424:EE_|DU2PEPF00028D0C:EE_|AS8PR08MB9194:EE_
X-MS-Office365-Filtering-Correlation-Id: 737b61a9-ee96-4203-3333-08dc8a03dc82
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230031|376005|1800799015|366007|38070700009;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?SVYvNTNIUmczYXdnT25DY2xFc0dhVlhITnIwbGtFZzNOTnNHTzhzb09ZeG16?=
 =?utf-8?B?OHVHRnNjbytJNm9JYmsvYUIzRFBsNUM0TlZBS1MxZ2srSkZMRm55Y3BpL21C?=
 =?utf-8?B?c2FpclFUVWkyUXYzNTRYdFU2bnp3d2IzOVhCd0RpeEpzUXRPS2NEc2JQbjR3?=
 =?utf-8?B?VTB6b1hhQjVpeW5ld29GckRTcE5wNjhKVXpjZUsvRGZzV003bWRDT2lKdEcw?=
 =?utf-8?B?WFBJb2dMUzRpNnVEaGs2RXRUaEVtSG5kTWJTMW10UGNqZlQ5VmdRVDF6aFJW?=
 =?utf-8?B?eG5NQlNwcHl0U09haUt1UkM1RENSekMrdjRuSkNyZVVVd3oyOFdHWmpDTExG?=
 =?utf-8?B?RnY4TmpKRHFrYkZuZ1pPNFZSUURaN09HU3ZOQkRBMExDZFV1T2VXWFJKMUhE?=
 =?utf-8?B?MmlXQmJmQ3U4RFVZc0VtTkVaVVZGYlk1OXZIVTZ5anNkYnJxZUFpcWtBeTRt?=
 =?utf-8?B?dm1iS3FxTzE1K2xWTmdHeUVvNzVwMnE4VEtTNXpjWFdOdVc2NFo5amFxZVBC?=
 =?utf-8?B?NlBCRkFnUFcwMEtpVjV4WFhnQUNYT25JY0FsYkNnc3hleG1EM2xFMUpnZTU2?=
 =?utf-8?B?Z1V1TFJKOEFWYmkrNzR1bXVtV0YwS3JBUGRBdDF1M1VmMUZwMHRrbjVlZUdl?=
 =?utf-8?B?Y3NwRFQ2QTd5TlJ3VmxPcWcyQlVYZjRWZjhIU2VoVnVhRUwxOW5Ubi9DcTBH?=
 =?utf-8?B?WlVLKzhXdENjVVYvb1NJZmhwRURSZ2p0L0lSSHMrZ1QwcnVSZ0NrMkI4OEtu?=
 =?utf-8?B?NFp4RVl1bUxuS20rQWxNbFl6QjJRODVJMUtsaDc1UmVSUUl1QlREYlN3eFRX?=
 =?utf-8?B?RzNnRDZYbURmcmVaQTJXNWJldzFMM01ydm1WZnc4WjV1UWZDb3BaaXMwelh6?=
 =?utf-8?B?TndMUkQxRVpGcDNRdFFUZCtORVVPZzVpVTBJdkxZU1BzUkRCSTJlbm1nYXli?=
 =?utf-8?B?Q0U1UFRvelREZXk2NHFzc041N0FDQ2JNSURrL2lFVDZJQXV4WjYyVHZmaHU0?=
 =?utf-8?B?aFFSOHczVHhGNWJmY21HNWYrNXVOTEF4eGhsS2phTTI1M1NJdnd2VDE2T2JX?=
 =?utf-8?B?dkQ1em9PenRIY1VZWHZlcFdZdDV0ODUvVmE3UkhEdTRRRkFvZnMrQjRQK25X?=
 =?utf-8?B?L2tJQWgrTFI0L2V4d1FueWoySDJ1Ny9xS25NZXJKNnkyMDQ3VUQzUldUOEl4?=
 =?utf-8?B?UzZ1UkZJWERWSmJJTzZhTmRZblVpbzhzZWU2M1ZMYmJFOG5TRVJXMFpLRGVl?=
 =?utf-8?B?ODZJdFpXdnZNUTF4MDVBZXJGVWZBZHRDajErajR4RkpkUDRRblF0ZVVzZXUr?=
 =?utf-8?B?Y3hlVVRsbkVZT0VST1M5RklYUGpqREdteEMwbmcwQ0NaUGlXUEFTRWVjK3Qx?=
 =?utf-8?B?Y0NkOVlUamNGQzllSnJtM2dLRzE0RVV6K040VHNxazdWKy95REF0L3pJcmI1?=
 =?utf-8?B?N2lpcC9KTFk5YmdwbDB2eWcvR0dzSXoxSlY1Q1Z6cGt4UGEvSlBvdGh6bU8v?=
 =?utf-8?B?YnJoVnZvUkxsQ290RzZpU1hldlBieTM2dHMyQkgybUJTT2JOWU1LSVJKWnQv?=
 =?utf-8?B?U0k1MytLNStkbDNPbmdpTFI3TWY5ZFd1WHRDWTZQcVhqWFJNTElwZmJIbVgx?=
 =?utf-8?B?YXVRbXcydmFabUF4bHRHWG5tL1JOTzFWRmJzSVAwYlBVN3F4Z1dxYWc3T04w?=
 =?utf-8?B?dEM0d2FyelFDQ25TYlNYVjJTWnNBNFkzNXpJK0cwbjBxbXBnUDNBcFZUV1Bm?=
 =?utf-8?B?enBGTXJuNFZoa20xci9OVVo2MGNnY2pTLzVqcmZTRXFwQk9TZG5XRXZqQkdE?=
 =?utf-8?Q?HYhhj/wfLpf6Qlcah3OQivmqEh57Kguw2AoSE=3D?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(1800799015)(366007)(38070700009);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <81EF7486DC1EFF4189E81AF84521FE93@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB5424
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DU2PEPF00028D0C.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	f7e19c11-e11d-4a95-2df4-08dc8a03d472
X-Microsoft-Antispam: 
	BCL:0;ARA:13230031|376005|36860700004|1800799015|82310400017|35042699013;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?TW9od0pBL09CTCtBUUFZTW0yVlhyMmtMZUszN2o3ZnRLNDNSb2tUbFFoMU1M?=
 =?utf-8?B?Z29XM1l0TksxalJjZWpSd0hSQ0I3bEt5M0M2eFhobzBTMThVRnJqdGVaRjh2?=
 =?utf-8?B?RzNrdE1FWHlPTlNaRGg3YUszb1IycUxpWlRVczRIQnBvQ2RLUXFTNHpCOTJq?=
 =?utf-8?B?U0tPY0FkOFZKcjBTNmNOR0E5bFdaSjF2YTJqaVdBM3ZjVWlPUU1FSmpPT05Z?=
 =?utf-8?B?NUIvRzdHMFJqbk1uOFo1NmpveGdQbjFJbnlPZWJpRXJyRm1qbTdlV2JwOTVi?=
 =?utf-8?B?Z25sclZlaXJMZ21Dc0xVT0VMa3docWJ5VkJ3QTV4a3pRZ3hsVGxZczFva3BI?=
 =?utf-8?B?aU9JMjllZVY5RHJsTEM5VWNuaGllcndWYTdyZjJDbWJ1c3BmNXVKc3JRWlFE?=
 =?utf-8?B?ZFQ0RmJOT2NZam5JRkxjUlMvZW5FalE3alVwRC9IRkpIMUJlL1hhVkRKdW5a?=
 =?utf-8?B?d09yb0hjVlBQSW96NEF4SzhjVHdSWitVcTMxNGxWVDRoZi9PZjJDQXFBTVRi?=
 =?utf-8?B?Z2FFRVBzcXNDZ0QxK0puRDFEenRTRmkwMzFuc1dzZ09MTkVRY2FxbC9HeXVo?=
 =?utf-8?B?NEhLNzIzcXo1d3JtWnBldkhOZit5N0I3bldVWFhNbUg3amFxYUZLMzZPNnZ2?=
 =?utf-8?B?YTl6YnNkM0M1eEw3eks3bC9QQ3oxSWhEcmJoejhTQVhQenVGbHdiTDk5K3pa?=
 =?utf-8?B?TC95WDRWVFJ6cWIydlloQyttQVVraW9yQVhrQkRObm9CazV4Mkd3azhrWWFu?=
 =?utf-8?B?d092TUcyYTlFZW5Fc3RyeXYzVmxsbDJyUitsV0hHcnlNTVlKQU8wNCtLSlRi?=
 =?utf-8?B?YnYrcXhxSUlyQ0tCQjRNVkx1VlBQQWMvVTVMUUhiVUJlNTZMSHQ4Wms4bzZB?=
 =?utf-8?B?aGN0alhubGxjVDAzR1U5d1VkcGpIVkdjOWFoOGlXWTRhM29WWlZYdHg5VkhN?=
 =?utf-8?B?OVZsTklXblQ5aXZiUUtjbDhtZ1RsQ2lPWGgxRUdhWTVFNlJ1UnhvRWMyMHgw?=
 =?utf-8?B?R0Rqb0x1ZnNCZXgwd2x4djNCbzlYMFBIZkhON3graVlvNXU3Rjg3L2g1aWp0?=
 =?utf-8?B?RDFjMnNIQUtMdmppMDJ3TXZzUFc1bmhtSjVaTFZtc3hhYWswVzJiZFhjc2ph?=
 =?utf-8?B?Y1pKRThGamxNOElFVWhOb1A5VnFNR2djR0VabzZiRndIcE9Db0szVjdMaUNS?=
 =?utf-8?B?Zlp3U1JnSS81SWtxOXZRdnkvQlhtRk4xVzVYMTYwVFlOa0M0VjU0aExHSWl6?=
 =?utf-8?B?R1EzWFdWVHJobW5zMElwRk1ZWDdHYmgwQVh1RkVIa04rTVZ2NG5XaGorUWdN?=
 =?utf-8?B?c2lzVVlBSFVhaDFoNFhHd1o3ZXphb3NJWnZ5dEhFZFFGdjFyQmgwUStnZFlV?=
 =?utf-8?B?bFpNd05IWUdGZ2x1K2FGclB5QVNtdWNyb2Yyc0s3QSszR1FvSzVrd1hkeG0w?=
 =?utf-8?B?VUo1bHBBeUFqbW91YUlHOE1QcGdRRmFPM3g0eDJiSnBuT1EvSTNHUEV4blpl?=
 =?utf-8?B?aytuTEwxRmRlYm9FakRrbEovSm44R3NZZlRYaWJNRG9OUTZmR3NCWXpwbUZp?=
 =?utf-8?B?VjNOZ2tNQjVDaFdEWm9iK0F5cm5Ick92T21HOURzd3doSytiUkZUWGhpUlBu?=
 =?utf-8?B?TzhxVFhlM1N0MnAzUm1xTmtPSGFQQXYxMEhGZzkzTnJRQWcyVmpEVGVwSzFZ?=
 =?utf-8?B?L1FMbHUzc0pHQmpyNlA2VXh3SFc1VTljUG9pNGFLV29zdFYxMFBrcmFzMVM0?=
 =?utf-8?B?M3JIZmNMSjFJMEt2Vkg1em44ZnlNUkpZa2pEMDAzL2gyWjBFL091UFIxUnQv?=
 =?utf-8?B?WFpqQ0ZLMXlCQVlMRVRsaWtBZnphOEh0b1JMbk9kYnhrYVJWK3RQeWcwb29T?=
 =?utf-8?B?M2dLS3NPTUVTQXlVbVRldGNUZCs5OG9qbHVMYkZoejN6d1E9PQ==?=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(376005)(36860700004)(1800799015)(82310400017)(35042699013);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2024 10:47:16.8823
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 737b61a9-ee96-4203-3333-08dc8a03dc82
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DU2PEPF00028D0C.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB9194
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Jun 2024 10:47:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200504

T24gMTAgSnVuIDIwMjQsIGF0IDE3OjE2LCBFdGllbm5lIENvcmRvbm5pZXIgdmlhIGxpc3RzLm9w
ZW5lbWJlZGRlZC5vcmcgPGVjb3Jkb25uaWVyPXNuYXAuY29tQGxpc3RzLm9wZW5lbWJlZGRlZC5v
cmc+IHdyb3RlOg0KPiANCj4gRnJvbTogRXRpZW5uZSBDb3Jkb25uaWVyIDxlY29yZG9ubmllckBz
bmFwLmNvbT4NCj4gDQo+IEZpeCB0aGlzIGVycm9yIHdoZXJlICdjb3JlZHVtcGN0bCBpbmZvJyB3
YXJucyB0aGF0IHRoZSBjb3JlZHVtcCBpcyBzdGlsbCBiZWluZw0KPiBwcm9jZXNzZWQ6DQo+IA0K
PiBgYGANCj4gQXNzZXJ0aW9uRXJyb3I6IDEgIT0gMCA6IE1pbmlEZWJ1Z0luZm8gVGVzdCBmYWls
ZWQ6IE5vIG1hdGNoIGZvdW5kLg0KPiAtLSBOb3RpY2U6IDEgc3lzdGVtZC1jb3JlZHVtcEAuc2Vy
dmljZSB1bml0IGlzIHJ1bm5pbmcsIG91dHB1dCBtYXkgYmUgaW5jb21wbGV0ZS4NCj4gYGBgDQo+
IA0KPiBTaWduZWQtb2ZmLWJ5OiBFdGllbm5lIENvcmRvbm5pZXIgPGVjb3Jkb25uaWVyQHNuYXAu
Y29tPg0KPiAtLS0NCj4gbWV0YS9saWIvb2VxYS9ydW50aW1lL2Nhc2VzL3N5c3RlbWQucHkgfCA3
ICsrKysrKysNCj4gMSBmaWxlIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKQ0KPiANCj4gZGlmZiAt
LWdpdCBhL21ldGEvbGliL29lcWEvcnVudGltZS9jYXNlcy9zeXN0ZW1kLnB5IGIvbWV0YS9saWIv
b2VxYS9ydW50aW1lL2Nhc2VzL3N5c3RlbWQucHkNCj4gaW5kZXggODBmZGFlMjQwYS4uYWVkMjMw
NzA4ZSAxMDA2NDQNCj4gLS0tIGEvbWV0YS9saWIvb2VxYS9ydW50aW1lL2Nhc2VzL3N5c3RlbWQu
cHkNCj4gKysrIGIvbWV0YS9saWIvb2VxYS9ydW50aW1lL2Nhc2VzL3N5c3RlbWQucHkNCj4gQEAg
LTE1NSw2ICsxNTUsMTMgQEAgY2xhc3MgU3lzdGVtZFNlcnZpY2VUZXN0cyhTeXN0ZW1kVGVzdCk6
DQo+ICAgICAgICAgc2VsZi50YXJnZXQucnVuKCdraWxsIC1TRUdWICVzJyAlIG91dHB1dCkNCj4g
ICAgICAgICBzZWxmLmFzc2VydEVxdWFsKHN0YXR1cywgMCwgbXNnID0gJ05vdCBhYmxlIHRvIGZp
bmQgcHJvY2VzcyB0aGF0IHJ1bnMgc2xlZXAsIG91dHB1dCA6ICVzJyAlIG91dHB1dCkNCj4gDQo+
ICsgICAgICAgICMgR2l2ZSBzb21lIHRpbWUgdG8gc3lzdGVtZC1jb3JlZHVtcEAuc2VydmljZSB0
byBwcm9jZXNzIHRoZSBjb3JlZHVtcA0KPiArICAgICAgICBmb3IgeCBpbiByYW5nZSgyMCk6DQo+
ICsgICAgICAgICAgICBzdGF0dXMsIG91dHB1dCA9IHNlbGYudGFyZ2V0LnJ1bignY29yZWR1bXBj
dGwgLS1xdWlldCAtLW5vLXBhZ2VyIC0tbm8tbGVnZW5kIHwgd2MgLWwnKQ0KPiArICAgICAgICAg
ICAgaWYgb3V0cHV0ID09ICIxIjoNCj4gKyAgICAgICAgICAgICAgICBicmVhaw0KPiArICAgICAg
ICAgICAgdGltZS5zbGVlcCgxKQ0KPiArDQo+ICAgICAgICAgKHN0YXR1cywgb3V0cHV0KSA9IHNl
bGYudGFyZ2V0LnJ1bignY29yZWR1bXBjdGwgaW5mbycpDQoNCkFzIHNvbWVvbmUgd2hvIHNwZW50
IHRvbyBsb25nIHN0YXJpbmcgYXQgbXlzdGVyaW91cyBmYWlsdXJlcyBpbiB0aGUgZGVidWdpbmZv
ZCB0ZXN0cywgSSByZWNvbW1lbmQgeW91IGFkZCBhbiDigJhlbHNl4oCZIGNhc2UgdG8gdGhhdCBs
b29wIHNvIHRoYXQgeW91IGNhbiBleHBsaWNpdGx5IGZhaWwgaWYgdGhlIHRpbWVvdXQgZXhwaXJl
cyB3aXRob3V0IGJyZWFraW5nIG91dC4NCg0KQWxzbyBpdCBmZWVscyBsaWtlIHRoZSB0ZXN0IGNv
dWxkIGJlIG1hZGUgbW9yZSByZWxpYWJseSBieSB1c2luZyBtYXRjaGVzIGluc3RlYWQgb2YganVz
dCBhc2tpbmcgaXQgdG8gbGlzdCBhbGwgY3Jhc2hlcyBhbmQgZXhwZWN0aW5nIGl0IHRvIGJlIG9u
ZSAod2hhdCBpZiBzb21ldGhpbmcgZWxzZSBjcmFzaGVkPyksIGFuZCBhc3N1bWluZyB0aGUgbGF0
ZXN0IGNyYXNoIGlzIHRoZSBvbmUgd2XigJlyZSBhZnRlci4gICBJZiB5b3UgdXNlIG1hdGNoZXMg
dGhlbiB0aGUgZXhpdCBjb2RlIGlzIHNldCB0byBub24temVybyBpZiB0aGUgbWF0Y2ggaXNu4oCZ
dCBmb3VuZCwgc28geW91IGNvdWxkIGNvbWJpbmUgdGhlIHJldHJ5IGxvb3AgYW5kIHRoZSBhY3R1
YWwgdGVzdCBpbnRvIG9uZS4NCg0KUm9zcw==

