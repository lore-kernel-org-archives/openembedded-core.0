Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 183DEC27C79
	for <webhook@archiver.kernel.org>; Wed, 19 Jun 2024 16:46:05 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (EUR04-HE1-obe.outbound.protection.outlook.com [40.107.7.63])
 by mx.groups.io with SMTP id smtpd.web10.26175.1718815561252712334
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Jun 2024 09:46:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=P52SlPBY;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=P52SlPBY;
 spf=pass (domain: arm.com, ip: 40.107.7.63, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=MdJUfJNOdYyx/BBJaMZ/7HZc4JfDnaA6mpDNa0RmV0TsSRFM86xjpgA4gwzjMFYcFo7JF9Cl506W/MBlZCiMJQXerSeClGgQKuRstokJOxtuXx4nUUOtlsn1iPMANLPw19KFvr0dEMHzijMLPz3qZQf7ArhgmjjO2qF32Xw+OVkA9YNuKN75smraq9iWRmNCYml0tLZtfoBKrUIPniV7cM+EW1S2qah4SCaMIvBc7KXxk0if8gMUbk0EliqSSZHhOdNxxs8eWAqt6j+V+zpu5CiM+vNgQXLUyHB0+4XSUiy3Qn33wrStXKoR6cFrqWRUTb8LEEljMhXF7ca3EpXRuw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=559gVCsGG6sOZ4sMuRTIixRtEVrBe5XvAt+T/ZVNp2I=;
 b=jYRT/IRixdeMBaHsfAvIdb8FP7lJqsPsS9SQvkUTeZ5TxgtR53MU1rKxUw8MIvKAm9xG0/5g24q+mQg3684S2oRJ8ZnN4fkph0swhnfjfT2Nz/zbzXZ6RwY3fGZGlgNIctLgsDLQvPE9v2sHElc+0JmkYzeqHowmvaUKAA1tZCrjhCqMvz5NjZyEwEXqHfE8BzW0xclq/gcHdI3nmVR93TgcGTmYGU0m4He8AdGsPlQsyCsV1OTs1MgJjGI7NHA/mWvr1af+mVRziMA2FG/o+hJjW8uyAUrXpYSql4dClR/HWiFi78VrnTnUCD4dk5+AtY3SgQtxtNAhpoTfdomdTg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=559gVCsGG6sOZ4sMuRTIixRtEVrBe5XvAt+T/ZVNp2I=;
 b=P52SlPBYvFsYgD/mnHntWIkfoaT25Pk+qqCR2l1Crg6Oy7o5bKAo6LI8ySLox6e0CTBIC9gON4I1y/VzVqe1VrWc/Y3xNK6F2Ti1pTLjqnvPa0KTxmezxLXkt1ipdfu4+wjwTZbngUe1Cg8dbfqX32BBfKvp9UaCBzeO98H+t/I=
Received: from AS4P250CA0028.EURP250.PROD.OUTLOOK.COM (2603:10a6:20b:5e3::16)
 by DBBPR08MB6266.eurprd08.prod.outlook.com (2603:10a6:10:203::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.31; Wed, 19 Jun
 2024 16:45:57 +0000
Received: from AM2PEPF0001C708.eurprd05.prod.outlook.com
 (2603:10a6:20b:5e3:cafe::4c) by AS4P250CA0028.outlook.office365.com
 (2603:10a6:20b:5e3::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.32 via Frontend
 Transport; Wed, 19 Jun 2024 16:45:57 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM2PEPF0001C708.mail.protection.outlook.com (10.167.16.196) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.7677.15
 via Frontend Transport; Wed, 19 Jun 2024 16:45:57 +0000
Received: ("Tessian outbound fcd698738a24:v339"); Wed, 19 Jun 2024 16:45:56 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 7e1504724e9e3edb
X-CR-MTA-TID: 64aa7808
Received: from 7a82a4a8026c.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id B4892431-0450-4CED-8870-1AE801A48982.1;
	Wed, 19 Jun 2024 16:45:49 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 7a82a4a8026c.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Wed, 19 Jun 2024 16:45:49 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bhl9CaxEEyjn5p7382hwoUPqzucDlnNaJ47H+uFK/9mfG2KcOdGJvHd0AS0TBNv4RLGyKB8Gu66d8HbgvWQLNsZ9RPZWg7Xj0TTgv9xiFz50+Qr92fG33OoRensuJvoGRHzF7HC0LJvvQV7QQ3YNkV4fyDCynpzYpgxHh7PbPLWnyjpd0E860cgYrhUT28YjzQSMjdLLk1igIyGSdPugCzUnmWOff8BpDqgNgfjBHvyWlxPIocrNWna4J2shpReYk3T0O0Quo/4VzCuApQM78DSCTKP+on6DZKZiDESP6L+x+LNQVmtKnGhQtl4bT89ByY1hbRJ99dOJQXOBHLvoTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=559gVCsGG6sOZ4sMuRTIixRtEVrBe5XvAt+T/ZVNp2I=;
 b=nfC6mcutmRN3b+mjwX6PrbEd9ImiNQu6wq91p14fTkGbTIiUsPV/26olY45uBA7pq8/mOwtoAlQYb4ofPSvoliDxmMdnAFpSvYnqJC5OG9FPXfXomlbvBJaH/ucZE6+aDAsLNVyxQxtSiVmpcM0lvkUKarzImQLTIW9KAOS7jsXKnS5Zt+hYjyneBnyWhmw5bnObiB8nwH3na6a0d7w4fSy002gOPicc73iD/8et0CURlbfvcujKtxbUYYouEVpknzKKmAEYAyyQ9wtw5WYO7xD5cMd7Facot8wk8w/+l6NWBwlbHbreeWdg64YqeSqTJMQ1GK5iNdt1T8/FnrcUEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=559gVCsGG6sOZ4sMuRTIixRtEVrBe5XvAt+T/ZVNp2I=;
 b=P52SlPBYvFsYgD/mnHntWIkfoaT25Pk+qqCR2l1Crg6Oy7o5bKAo6LI8ySLox6e0CTBIC9gON4I1y/VzVqe1VrWc/Y3xNK6F2Ti1pTLjqnvPa0KTxmezxLXkt1ipdfu4+wjwTZbngUe1Cg8dbfqX32BBfKvp9UaCBzeO98H+t/I=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by PAWPR08MB10117.eurprd08.prod.outlook.com (2603:10a6:102:361::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.31; Wed, 19 Jun
 2024 16:45:47 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e%4]) with mapi id 15.20.7698.017; Wed, 19 Jun 2024
 16:45:47 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "mingli.yu@eng.windriver.com" <mingli.yu@eng.windriver.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] acl: Fix nfs ptest failure
Thread-Topic: [OE-core] [PATCH] acl: Fix nfs ptest failure
Thread-Index: AQHawimPbkfYQadGVke/TxRxSX1W4bHPS+IA
Date: Wed, 19 Jun 2024 16:45:47 +0000
Message-ID: <1AA24A74-8081-48D5-AFA3-9CFF5657988F@arm.com>
References: <20240619091703.1410186-1-mingli.yu@windriver.com>
In-Reply-To: <20240619091703.1410186-1-mingli.yu@windriver.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3774.600.62)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|PAWPR08MB10117:EE_|AM2PEPF0001C708:EE_|DBBPR08MB6266:EE_
X-MS-Office365-Filtering-Correlation-Id: 5840739c-ea8d-425e-febb-08dc907f4ad4
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230037|1800799021|376011|366013|38070700015;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?LzQ2TEx1Z0tEaGppL3Q1ZkxVb2VnbURqeHRoR05QcnU2cEx1NGF4dkZpRzJC?=
 =?utf-8?B?MXZQUmQvQTFDVEkyb3VxMUFhcXY5STJqT1RHYUpiNWIxcU5IWlNHRDdFYWFR?=
 =?utf-8?B?YWVFeWFrOWJQYUFYbzROSnJEU3lqUEV1cTVJWGVISUthTkFKc3dRMFZuekF5?=
 =?utf-8?B?QnE1bi9HdlIwbEJZSGo4TklIRnVQNUk5dmZJM3VUK3htbTljSmJHdDhIUE55?=
 =?utf-8?B?SHRYdzZJOE9sV3Q3TG1VMHoyMnBzcVdDcUFrTTlOWVYrV3hqVDNwVFRNd0lm?=
 =?utf-8?B?RFR4bzRRempyaXRNWHJ2Ykd5NitPMk9FcnNXR0xsL0pDcjg3TU5zNHl5WS9i?=
 =?utf-8?B?cXpwVmhMRmErZ2g3WVo3Y3ZTaDFiM0Y5VkFkSE84Q0xnZUFtK0cxeVVId1Nk?=
 =?utf-8?B?dTQ4bDJGSVprZlhoODhkNGpHZ0JYUSswUnJFMmJtNlhZbnh6TExZVzdtNDJp?=
 =?utf-8?B?elB2YTBJeXZ4dGlHaDkzRVMzMDdWRS9HRUJsdUtoajRkZDRvSGt0Z0dqcG1s?=
 =?utf-8?B?VGpMYnZGVU1iZ0w2RWgwdE5EZW9EWUt4ZjFIS2wrM0h3N083K0tjMG9IdmRL?=
 =?utf-8?B?cGZzOGQ5NEVUSFN4OFl4WDJqSnpyUU5aQnlsdVRneHhZanBoWGNSRVI4RFN6?=
 =?utf-8?B?WitFVWp0azlvbVRxdmlsbXRTcHQrRzV2aGU1WDhDdUhmOUJ6TGhtWGFoWEFI?=
 =?utf-8?B?TTk2UEZPaXU1U3pIVTkrWDNhamw0R1h2bHo5RTEyMmxIZnY3VDVMM1h4UkdT?=
 =?utf-8?B?YXRLVUNrMGtJTWlhTjVlbER5M2RWMnR0YjBibkFYYThNbXRrNWwxbVVSQ21h?=
 =?utf-8?B?QjNsbUlTZzhuZDR0enlwMTlqK01QTGtyYm5aMkxCWEJXeHRYWEZORGNwZzd5?=
 =?utf-8?B?ZW8wMjNqM1l2b2lXWWFpUzg4ZDJHNFN5THdlM2FkcW5mK2dLVHFxY2tHeE0y?=
 =?utf-8?B?UjFkSmZDMDN5T2F4WUU4QlU3ck1OOER5QmhiMzdhQ3BnZml0Y3pVbm5DQzFt?=
 =?utf-8?B?OHp6OFByeURIbGRFSDM2L3p2dEpxWnU5UGx3KzJjWXNLQlBYODJsY21NT2t1?=
 =?utf-8?B?ZDdoaFFNRU10eE5ha0FKM2FUaDBiMUJpVDRiNmR4Lys3dm82Q1dUeXhQTkwx?=
 =?utf-8?B?UlJzeTE2dU41SGhQNy8zeDBHUlpKa2VSa3hnYWpaenBYZDN1cVRZZjdHdXpw?=
 =?utf-8?B?UVJKcEt1VitCNjZuYXpBWDlBczI3ZXR2aWEzWUJibzlEQWE0em9teDExa1pL?=
 =?utf-8?B?TWJIdWFqKzNvL05wUWhWM21xQU82Tzc1WjNIMEFCUHZDamQwZzhZRHJIV0h5?=
 =?utf-8?B?MkIwd1pjY2JBUmRoczFsa0lYL2dQZ1FzWXBpTnNvd1BneEJtbzVnTkt3UmZR?=
 =?utf-8?B?Y2JObmhaaHl2RGNvRHE0S1dpZHluMXZKRkh2dFVtSzFhY1gxNUJ3bm9pdzFX?=
 =?utf-8?B?UXptY1h4bExodnNZcjdMQkU3UzZBaGNZampqTG5HVUJ2WUFZc1lsUlAvYkxH?=
 =?utf-8?B?d2Zzb0JVOXk0Y2x4OEgydGlYR1V0L3BlWG43dnpDTlFPM0VDQkxWWWVIT2VL?=
 =?utf-8?B?ZlZIZi9OQmNtelN0OEt1UTY5THlOQUF4VnVCZktzWm1OSmRQNU16U1JOM2I2?=
 =?utf-8?B?TmpyYkRURFdZdnBDSFNsWndvbk52RkRNYUJCbm9SSEpuRnFnQXBFNDlVdlA3?=
 =?utf-8?B?VDNBMGR6ZlBPclRvRTgzaktWajd1V1prL25landFM0NmRGxLTWE2Vm9DeVJx?=
 =?utf-8?Q?7pzxqDAuQl3pv9LYVSe/Fzj8P4LianhUAOwSNvM?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230037)(1800799021)(376011)(366013)(38070700015);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <2D8885C07B53554E8C170910924545E2@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB10117
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM2PEPF0001C708.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	24b6c417-6580-4326-d275-08dc907f453d
X-Microsoft-Antispam: 
	BCL:0;ARA:13230037|36860700010|1800799021|82310400023|376011|35042699019|34020700013;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?MXdVZlg5OTlGYTNWeHRDeXdXQlpiWW5qV3ZKL2oxb3E3VmVyWDdtWXVhR1FQ?=
 =?utf-8?B?dWFnUG9DN0xBc00raEJheHR3eURvc0R6MTM1UlVNdWxQNTM3T3FRZ1ZOdVU2?=
 =?utf-8?B?SHN2bjJRZGwxR05paXd3K2RYUmdBVmJEM0RWSVNJTmJ2ZjB2WU1RV0cwZlhZ?=
 =?utf-8?B?TnlXdSt0NXJ2c0xEUVQyZ0MwemMwWnI0eVQxR1E2ZlhOcmUwcm1wSkdKelpR?=
 =?utf-8?B?Z2ErYi9mRVFlN3hoODczbngvRWUxb3VXbEUrMm5iL3VoZ1RxMFFaOVhSZkVZ?=
 =?utf-8?B?cDI2UEI0ZXpYSTBBeDJsaTZXWU91L0dveWk5RkpZclVDZE5wRzdlTTdVYlgr?=
 =?utf-8?B?Z1dRbFVLRjUxOVd1MmlEa3dBME1jaWNrc3dINklUMFNyUTE5d1NjeHBleTQr?=
 =?utf-8?B?dmJWc1FHRzJHSUFtMXpkRmhDWXJ3TFJhYzFtc1R3N1ZWSXpPZnZveWJJL1hy?=
 =?utf-8?B?RWRjNFgrYjA2VDFLMmxLVUdUd1MwNkdwZit0Uk9YWHM5QjBGOFFNb3VPdzdu?=
 =?utf-8?B?V3hjZE1ZTmVhN1ZVZ1dwWHh3djUrS2FDUWVjNXlaZGVTYnN6YVZWMmxZQnZl?=
 =?utf-8?B?TUQydS95cUk1WHJnaEl1WG43dEtnTzVrdGpNUWhURHJIWXI2YTFMK2x2ZHBK?=
 =?utf-8?B?OTJKNWxETnplWDI2YXBHeno5Q3llVHlxU2Y4ZWhOSGRhR3VtRE9xZUVoVUt3?=
 =?utf-8?B?R2h3R0tkcjR0eWg4N05iYUROQlp5dDZLY043WjVuN1UzQS9JU045NVRwYnd4?=
 =?utf-8?B?Zlord2lPekl6Q05OVGxuRWlvODRrWGJqZmhwREZNallVUFJnYWgwK0h3SkpW?=
 =?utf-8?B?K2dzcUlIYkhoSHJsWCtWTVV2akp2U2JtWTVlRk9yaU5MZlo5ZW5XaEIvSktM?=
 =?utf-8?B?d1NyVy93QjVHRUZEWmdwOVY4MjZSYmNsd3RRbHUzcUR5OE43VkE4aHV6Znky?=
 =?utf-8?B?YjR3bVhRNktHc2dYRUM3WTBScWxKY0hKdTBPWG9zOFNIZ1NxcUdxcm5IWXd4?=
 =?utf-8?B?RWNqVFRaVWNxcFNxNmVVdTErdW5pNE5SZitFTHlGK05BWDlqa2hKQnNvY2RK?=
 =?utf-8?B?czBmN2kvK1dGaE00L0lmQUkyVXFQYVI2UUdkTFNzMGdTSHRIY253SHBNU25Z?=
 =?utf-8?B?RGZDa3lKVkxJNk9waGhoeVBZUHRiMk5xcFlQUlVoT245SkdTL3FHc21QM09q?=
 =?utf-8?B?RmJYWEFuaElyUlBPMTRDanhwcmJrakdvZWt6Nko3Z29UbkZFZ21Ba1dESWlX?=
 =?utf-8?B?d1o0ZitRUkxBL1ZnbC9OeEtqMG0ybU9wVVJvdndSY0k5MFBZSUJRZHcrU0NH?=
 =?utf-8?B?ZjlkYTFQcmVjWGlpSkdBdUFXTDRwSzYxMUlhZ3daOUVsa1oycUVEU3JIUjJ5?=
 =?utf-8?B?QWUrR1k5aWpPc2hHQ1kwZnBuWFJMTTY4RUJXOUdNVU5QdlVscFpVMFFmTmxH?=
 =?utf-8?B?Skx6U1ZqbjdHV0IwSlFpY0FNcmdDVGtHQUJIdC9aOWltUm5ScFMvcXRuWkpI?=
 =?utf-8?B?SzRVODRnb0Q2NVphakVJMDY5czFuSXlMekhBaGlTaXc1SjdJZEprVnkvM21w?=
 =?utf-8?B?MTN4TXM1UG5ZZ09nbEpoNDFyQ1Nzd1BHZm92dTZraEFZelpuaEp4UHBHTzdD?=
 =?utf-8?B?UURFR1lDcXE4eSszd2dPK09Yc3pvQjFHUUhVdEY0aHJJQ3FhWFRxYXZzdXhC?=
 =?utf-8?B?ZnBEcFlPTlA3V2dDU0w5eEhXcm5zUU0vNGp2eFdsNlZSNTVIb0gzbWZuUVlU?=
 =?utf-8?B?czJpbnpUTWJWTmYrRWY1MkY2QkxGbkxlWHJMcm5wTThwcFNjRnVqVTMxVVlJ?=
 =?utf-8?B?SUVDeC9uRlRLdkNkbHRPZz09?=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230037)(36860700010)(1800799021)(82310400023)(376011)(35042699019)(34020700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2024 16:45:57.0018
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5840739c-ea8d-425e-febb-08dc907f4ad4
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM2PEPF0001C708.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB6266
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Jun 2024 16:46:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200924

T24gMTkgSnVuIDIwMjQsIGF0IDEwOjE3LCBZdSwgTWluZ2xpIHZpYSBsaXN0cy5vcGVuZW1iZWRk
ZWQub3JnIDxtaW5nbGkueXU9ZW5nLndpbmRyaXZlci5jb21AbGlzdHMub3BlbmVtYmVkZGVkLm9y
Zz4gd3JvdGU6DQo+ICtUaGUgbmZzIHRlc3RzIHdpbGwgYmUgcHV0IGludG8gWFBBU1MvWEZBSUwg
Y2F0ZWdvcnkgYXMgaXQgZGVmaW5lZCBpbg0KPiArWEZBSUxfVEVTVFMgdGFyZ2V0LCBncm91cCBh
bGwgdGhlIHRlc3Qgb25seSBpbiBURVNUUyB0YXJnZXQgYXMgd2UgcHJlZmVyDQo+ICt1c2UgUEFT
Uy9GQUlML1NLSVAgdG8gaW5kaWNhdGUgdGhlIHJlc3VsdC4NCg0KWFBBU1MvWEZBSUwgaXMgZmlu
ZSwgd2UgZG9u4oCZdCBuZWVkIHRvIGNoYW5nZSB0aGUgdGVzdHMuDQoNCj4gZGlmZiAtLWdpdCBh
L21ldGEvcmVjaXBlcy1zdXBwb3J0L2F0dHIvYWNsLzAwMDEtdGVzdC1uZnMtbmZzYWNsLnRlc3Qt
Q29ycmVjdC10aGUtY2hlY2staXRlbS5wYXRjaCBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L2F0dHIv
YWNsLzAwMDEtdGVzdC1uZnMtbmZzYWNsLnRlc3QtQ29ycmVjdC10aGUtY2hlY2staXRlbS5wYXRj
aA0KPiBuZXcgZmlsZSBtb2RlIDEwMDY0NA0KPiBpbmRleCAwMDAwMDAwMDAwLi5mOTkwY2E0YTMx
DQo+IC0tLSAvZGV2L251bGwNCj4gKysrIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvYXR0ci9hY2wv
MDAwMS10ZXN0LW5mcy1uZnNhY2wudGVzdC1Db3JyZWN0LXRoZS1jaGVjay1pdGVtLnBhdGNoDQo+
IEBAIC0wLDAgKzEsNTEgQEANCj4gK0Zyb20gZGZjNjMyOGYwMjgyMWY5YzY3MDNmNzY0ZWM2ZjUz
Y2Y4MWRhYWFiNiBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDENCj4gK0Zyb206IE1pbmdsaSBZdSA8
bWluZ2xpLnl1QHdpbmRyaXZlci5jb20+DQo+ICtEYXRlOiBNb24sIDE3IEp1biAyMDI0IDExOjAw
OjQzICswODAwDQo+ICtTdWJqZWN0OiBbUEFUQ0hdIHRlc3QvbmZzL25mc2FjbC50ZXN0OiBDb3Jy
ZWN0IHRoZSBjaGVjayBpdGVtDQo+ICsNCj4gK1RoZSBkYXRlIHN1Y2ggYXMgIkp1biAxMyIgc2hv
dWxkIHRha2UgMiBjb2x1bW5zLCBzbyB0aGUgZXhwZWN0ZWQgY2hlY2sNCj4gK2l0ZW0gInRlc3Qv
c3ViMiIgc2hvdWxkIHRoZSBjb2x1bW4gOS4NCj4gKyAjIGxzIHRlc3Qvc3ViMiAtZGwNCj4gK2Ry
d3hyLXhyLXggMiByb290IHJvb3QgNDA5NiBKdW4gMTMgMDY6MDEgdGVzdC9zdWIyDQo+ICsNCj4g
K1Vwc3RyZWFtLVN0YXR1czogU3VibWl0dGVkIFtodHRwczovL2xpc3RzLm5vbmdudS5vcmcvYXJj
aGl2ZS9odG1sL2FjbC1kZXZlbC8yMDI0LTA2L21zZzAwMDAyLmh0bWxdDQoNCldoYXQgdGhpcyB3
aHkgdGhlIHRlc3QgaXMgYW4gWEZBSUw/ICBJbiB3aGljaCBjYXNlIHRoZSBwcmV2aW91cyBwYXRj
aCBzaG91bGQgbWFrZSBpdCBjbGVhciB0aGF0IHdl4oCZcmUgbm90IHJlbW92aW5nIFhGQUlMIGJl
Y2F1c2Ugd2UgZG9u4oCZdCBsaWtlIGl0LCBidXQgYmVjYXVzZSB0aGUgdGVzdHMgYXJlIG5vdyBm
aXhlZC4NCg0KPiBkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvYXR0ci9hY2wvcnVu
LXB0ZXN0IGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvYXR0ci9hY2wvcnVuLXB0ZXN0DQo+IGluZGV4
IDNhZjc1Yzg0ZmUuLjdkODhjYzg0ODQgMTAwNjQ0DQo+IC0tLSBhL21ldGEvcmVjaXBlcy1zdXBw
b3J0L2F0dHIvYWNsL3J1bi1wdGVzdA0KPiArKysgYi9tZXRhL3JlY2lwZXMtc3VwcG9ydC9hdHRy
L2FjbC9ydW4tcHRlc3QNCj4gQEAgLTYsNiArNiw3IEBADQo+IA0KPiBta2RpciAtcCAvdG1wL2Fj
bC1wdGVzdC90ZXN0DQo+IGNwIHRlc3QvdGVzdC4qIC90bXAvYWNsLXB0ZXN0L3Rlc3QNCj4gK2V4
cG9ydCBFWFBPUlRfUEFUSD0iL3RtcC9hY2wtcHRlc3QvdGVzdOKAnQ0KDQpXaGlsc3QgeW914oCZ
cmUgaGVyZSwgdGhpcyBsb29rcyBmcmFnaWxlLiAgQ2FuIHlvdSB1c2UgbWt0ZW1wIC1kIHRvIG1h
a2UgYSBmcmVzaCBkaXJlY3RvcnkgZm9yIGVhY2ggcnVuPw0KDQpSb3NzDQoNCg==

