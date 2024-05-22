Return-Path: <mike.looijmans@topic.nl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C931C25B77
	for <webhook@archiver.kernel.org>; Wed, 22 May 2024 05:29:08 +0000 (UTC)
Received: from EUR02-AM0-obe.outbound.protection.outlook.com (EUR02-AM0-obe.outbound.protection.outlook.com [40.107.247.139])
 by mx.groups.io with SMTP id smtpd.web10.2921.1716355743008816587
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 May 2024 22:29:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@topic.nl header.s=selector2 header.b=uHQRsozg;
 dkim=fail reason="dkim: body hash did not verify" header.i=@topic.nl header.s=selector2 header.b=BfXG5Esi;
 spf=pass (domain: topic.nl, ip: 40.107.247.139, mailfrom: mike.looijmans@topic.nl)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=fail;
 b=E1dvXqH/4viJlQkGPYQh6T32847W4Gz0tLj4lwSQj8feU8Zsynvuj9Rsk5EOTtcQUjeGySG5B8pUMSGaHFGUumgZs0osZR3Q/QNhUjfWVxklF0gFXLkSf4yLoTNRyK4r8Ix+5KNDalbNAkZz+x2E0IspmuTrJeQ/KfRpDmSjPnwFrZC2FblZW5YP+JkKThYhE9RC4Q3Q9lSW/gwNnrWLZjaVpCSAZ7RB9WBvCMtOZAHdc08KuWY1iR5jASW0Lys4GOOhgkGGKD10lezdFGGPCFNvyR/MdNhFYA07F3O2X39auM/Yh2TgP2QFdsrM/CdkhIbgbKnY8CaiqrJILMq8UQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GybjnjqpZnYPpU3xxCXJC77yOTPl/H0eVo1nr5Qzfqg=;
 b=MI3XFBUDUvH/AWFRNunAuofrgNA+MDfP2oeakarksxb4pyfvZVkVCUWuhi6mHMlIoRl5i3UPnbxSVz9goWYME9zZzRtR2J73fpJUnmlPG9UgMXAsd1pDNI6VIFtqGJhfRIAJIzQDiSVH012UGcwHAbl8RtvyKOvJ2FhF025ZoBbItGHxilCku+RY6yRUWXg3hIOzfmQpVkpEt7yCM1bvxbkKN5gs2lNjsAhXPDQ7gU81isfPAjpcOyWWYKjCXys+ErplsNq58NqIfTnYwu+YKx+bY7DC6weYxD0R47pZ7GyVD6z9xuNEjO2VGK4Y7lDrGtPW/oy797TY2pHS/PbuDQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 20.93.157.195) smtp.rcpttodomain=linuxfoundation.org smtp.mailfrom=topic.nl;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=topic.nl;
 dkim=fail (signature did not verify) header.d=topic.nl; arc=fail (47)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=topic.nl; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GybjnjqpZnYPpU3xxCXJC77yOTPl/H0eVo1nr5Qzfqg=;
 b=uHQRsozggmtzgzejmf4DpFExRDfjlLpXasxs47Zp6C6rc21eGw0qnfiOOE2V8RbTxL/yqCt4SBV/tFGYlsMHmL+QjJwPsIJRGLrUOrAedIYIJgXO2iP40C822E5aVFYjtOb7893m2K5f2dO7mQTcxRl2M6i+rOg6cfJf65NCadhcqm8bUVHubNFCp0NE2kx7jnQOzDmNJ+eClVUS+p1kh5kwzQfSLh/VCBIXnI3fbBAw29+/uC+h6midyaoRRHd51scNH6CekrLV2+bpcXILfI91g+GS7sZrl+ryqH+2swJsQlyGxyEO+YaUmf07gyPqOzGj2nn3v9lCIc9kBKq/LA==
Received: from DB7PR02CA0014.eurprd02.prod.outlook.com (2603:10a6:10:52::27)
 by AM8PR04MB8049.eurprd04.prod.outlook.com (2603:10a6:20b:24c::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.36; Wed, 22 May
 2024 05:28:59 +0000
Received: from DB1PEPF000509EA.eurprd03.prod.outlook.com
 (2603:10a6:10:52:cafe::49) by DB7PR02CA0014.outlook.office365.com
 (2603:10a6:10:52::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.35 via Frontend
 Transport; Wed, 22 May 2024 05:28:59 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 20.93.157.195)
 smtp.mailfrom=topic.nl; dkim=fail (signature did not verify)
 header.d=topic.nl;dmarc=pass action=none header.from=topic.nl;
Received-SPF: Pass (protection.outlook.com: domain of topic.nl designates
 20.93.157.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=20.93.157.195; helo=westeu11-emailsignatures-cloud.codetwo.com;
 pr=C
Received: from westeu11-emailsignatures-cloud.codetwo.com (20.93.157.195) by
 DB1PEPF000509EA.mail.protection.outlook.com (10.167.242.68) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7611.14 via Frontend Transport; Wed, 22 May 2024 05:28:59 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (104.47.17.168) by westeu11-emailsignatures-cloud.codetwo.com with CodeTwo SMTP Server (TLS12) via SMTP; Wed, 22 May 2024 05:28:58 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Mzu2f1F/RrkIVbwzTB0iWaocjlJhfQ/bMLEcP2bZYG6/wnwHDIoo2oXNF74QMmHUebUY1g+WZOgM19D9btxW22Pet6sfGdf1yw7e2sTl5RTUClb4IN6GTVu3oH65ZHmUQvYKuXXur7g4NXE31NG+Zwy/nldvMr+bNc/gRPZ0EBd2L2va8DyM6ofCpCZeUWfE/Z1cK48zO9tjHK5kM4OtW6EHsdUaXkgvgk7SBpKWK3coNXQQsPUecy32jMnuqtH+n7HhcZuDx1Ppo2xDs6oyQxreu4abWspifJVbXNAFrDtj2TInAO0nh8QbXRjL1aZb/1elZt4IPkmAJn1R2guQfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TOHvN6FlEqVPTJ7wD7rvcB7h++M8UnL5PUXb3Z9GbOg=;
 b=co//hKUldyWP7BeW8b3y3P34AwSY/1guX0DMLqDWC/i17fLAWOYXhF7xp444D85ze47Vg80UTyNIhPbukuPqqEWYBWpwbuPpTVC+pf5HucI9syhb2YcO5kZ2+ApCKyHPnACw9wbMdsDsjUVvYc9PYJhzqboJthuy1zT91ht6+9jbq3ZtFjxWTylPfPseec6ALldEwAAONrUQXjSa0hcuorwESkVUe3eMFVbeZDkvbKZv7cXFXZtV/H17v0h08wRthtXQLwMdy372/8kk5mNnBkLzzYBz4haeceRixsfS4uHWZoA6Zp4rah9pMAO1RsRmrBQSqKjhyI87Fl8fRRvHPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=topic.nl; dmarc=pass action=none header.from=topic.nl;
 dkim=pass header.d=topic.nl; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=topic.nl; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TOHvN6FlEqVPTJ7wD7rvcB7h++M8UnL5PUXb3Z9GbOg=;
 b=BfXG5Esi6+R9oodX/y1ZKM5QedNoNSxW7LaQxMJZpcdqN0WZMlSSZs6PIdmzP5qxa6UsGFhHse9PKg/KiX2tnm/q5qY4/jxOOx1UP6ZhLci6K/Vv8OCOaWwUeuZtRwl28QdxuSADcen9PFjbIasQYt3748W9Da/okmCI7VJjhJDRc1u4tmphRqYLtgJoLpuYVYY07SQLa24cSw3UoVhULw8HvRAOryu1k/lKcIwxvL10oNutg8BaEn0k+9e3wPqfSeVxjS/YPGGftVNhIADMk/v+GR8Xc8qPaKbYmcwBSZtAQnqYJiXFvz2BuVkaIcizkoh4q4j0Qy8X7VviNUdgtw==
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=topic.nl;
Received: from AS8PR04MB8644.eurprd04.prod.outlook.com (2603:10a6:20b:42b::12)
 by AS8PR04MB9012.eurprd04.prod.outlook.com (2603:10a6:20b:42e::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.36; Wed, 22 May
 2024 05:28:55 +0000
Received: from AS8PR04MB8644.eurprd04.prod.outlook.com
 ([fe80::e86d:f110:534e:480a]) by AS8PR04MB8644.eurprd04.prod.outlook.com
 ([fe80::e86d:f110:534e:480a%4]) with mapi id 15.20.7587.035; Wed, 22 May 2024
 05:28:55 +0000
Message-ID: <023cbca2-b5e4-420c-b109-445d7d8480a4@topic.nl>
Date: Wed, 22 May 2024 07:28:53 +0200
User-Agent: Mozilla Thunderbird
From: <mike.looijmans@topic.nl>
Subject: Re: [OE-core] [PATCH] meta: uboot-config: Fix broken menuconfig for
 "fitImage" kernel
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 openembedded-core@lists.openembedded.org
References: <1b153bce-a66a-45ee-a5c6-963ea6fb1c82.949ef384-8293-46b8-903f-40a477c056ae.cc544a93-e646-4932-8496-82717a21cde8@emailsignatures365.codetwo.com>
 <20240521135705.444470-1-mike.looijmans@topic.nl>
 <5340825db3c98197e448c58b88381562edbed66f.camel@linuxfoundation.org>
Content-Language: nl
Organization: TOPIC
In-Reply-To: <5340825db3c98197e448c58b88381562edbed66f.camel@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM0PR02CA0085.eurprd02.prod.outlook.com
 (2603:10a6:208:154::26) To AS8PR04MB8644.eurprd04.prod.outlook.com
 (2603:10a6:20b:42b::12)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: 
	AS8PR04MB8644:EE_|AS8PR04MB9012:EE_|DB1PEPF000509EA:EE_|AM8PR04MB8049:EE_
X-MS-Office365-Filtering-Correlation-Id: 0b0863bc-1479-4a66-6a85-08dc7a201518
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230031|366007|1800799015|376005;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?bnFFa2YzaWpOV0c0bmtzZnF4dXVZMUtONnk1ZkMvMVlCd0NKRGtLaUR3a3dS?=
 =?utf-8?B?ZVB4d3FqK0RpMThERmd0Z2oxUVh6cVkwZkRUYjBJaXNwcHVBcjBzekdGVjNB?=
 =?utf-8?B?cGZKYUJlOG1ianAzZjFQYmkyQklyZUZzS0x6cUVFZFlaM0dYRlBiYk5TNE5V?=
 =?utf-8?B?SWN5RjhjTTN0cG9QaENGT2t0N1JSNWU4aXdPNDZjVEV4WktZdnM4Z2N0cnRE?=
 =?utf-8?B?Y1NFOXBUQ0VGUjdsbEczaW9zQXBEL25tdmNQbFpDYmI4SFIvdnNFbjFBTm1n?=
 =?utf-8?B?TGNvQ29RWG9IMERxb1dnUC9qT3llZHM3bmJhNHZmanBZV25CNTN3Nk1xS1lC?=
 =?utf-8?B?a1B2c3VzOXp6TnFlVEprZTYwU0VSa01YcjZtRkdIRXIvOXc0VDBrOXNuSFA5?=
 =?utf-8?B?bnZSZmk3b0VZMFRMNHp2azRWcGliM1U3WDZ2aVdaV245d1ZHS0NqdVFsWmY3?=
 =?utf-8?B?enVqSjdoSVZOVGtaOUlzeG1sekRhcWR5VG5FUVVpTUYwMUNreVRCL28vWDFX?=
 =?utf-8?B?S0xBaWYxdFF3NG9sNEt4bUdqWWREby9XQWRlWDhxZ2tkVEZLTjVCMUZBQzY4?=
 =?utf-8?B?SlQrcGp0a2xIWEJKWlU5OE9FNk16K0xzZnN0ZjdRa3BwUnU1cFlTZ0tXbFR6?=
 =?utf-8?B?U1lGTTBobEdtOUVZMXVPQm1QR1VuRFZvNU1WUUFTWUJCNmo1MUdqYURkdEts?=
 =?utf-8?B?SHlPMnN1czRaZnJXWGwyWkFiQno4SGlXRFgzNG9kZHRteE9Kc0VBTmNQYnlQ?=
 =?utf-8?B?bThlQzM4aUJiaHkxNDdXaVFRTFZnRm5qS1ZidUM0STNpQmM5a3l3cFY3Z09M?=
 =?utf-8?B?QWxoVDFCYng4ZE9IRitVRVAwdnI5UVVsZ09RcVhrdVgrRE1LdkpFYStnb2k2?=
 =?utf-8?B?U29XZjVPeUxETnVmMHhzaUVrRVBNc2RLaGtibk9iRkR6RzdDVE10SER0QTZa?=
 =?utf-8?B?Z08reldGZXBlV3RlRWYyV2pDMWlKaG56SjR1Z1NiUTlvT3BDR2NNTHNSVzFj?=
 =?utf-8?B?aHZkM3Q4dk4raDhhcFk1WEt2QnhSRmpoQzJMK0J3SkhzSGhPOE91MHNtcXhM?=
 =?utf-8?B?TVNHQ3NFTWZqVHJaUXpNYjQrdzBFU0JqRk9WNzRkVFBHRnNhSUF5V0pqR0lh?=
 =?utf-8?B?dDAyWkRkVDJRdVlVeUgyd09SYklsR0dCYjRFb3VYLytxUTY2TjhuRWh6NVFJ?=
 =?utf-8?B?ckNLUnQ2cVJwQy9VVmYzOUtmK2ZKU1lVMnhYT1o3SUZTSmp3VE5VV095MVFU?=
 =?utf-8?B?aTk4M29Gd09jWldsVlBtZVlkQjRFaTZPbGRNczI3Y0Y4WlRkUm5QYzFZc254?=
 =?utf-8?B?VE9LVWRZT1doa0Q0QXUxTmNKQ2g4YWF1SHNDdGp4TDNPTEkzc2cwREJRMUE0?=
 =?utf-8?B?ZUVYL00vY3BpSGg4dFdJdGozVVpDZ0hZdkdkYXNLVldKQVkvNzdBL0lnRzJu?=
 =?utf-8?B?YThvN0RnUUFEeWdLdTcrTVMydzl2OVRwa3lwaE5yZDA5TnpwU2ZqQkhMbzhT?=
 =?utf-8?B?dzEzTU42dzVlZHJKMmlQM1VWOFhMZ3JyelErTXFCQlhUWTNTVDVRMGU1ekJm?=
 =?utf-8?B?ZGJPMDk2RXNUQ3NBNGNDR1FmYXptMzZvRklYbGVQZDdocTNvWlpSSlZCZXUw?=
 =?utf-8?Q?9SFbewXyPWvzuiyDZbT9YdaHUdoPZ6hqYztRMplP98qg=3D?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8644.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(1800799015)(376005);DIR:OUT;SFP:1102;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB9012
X-CodeTwo-MessageID: b0ebadda-d2ff-41a7-a06d-5feebc3dfe3d.20240522052858@westeu11-emailsignatures-cloud.codetwo.com
X-CodeTwoProcessed: true
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB1PEPF000509EA.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	c98f5e32-08d2-4901-1dec-08dc7a20127f
X-Microsoft-Antispam: 
	BCL:0;ARA:13230031|35042699013|1800799015|36860700004|376005|82310400017;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?M2ZKNkxCcWpQdG9hamp5eGZxblpFUktycTQxN0tMTmdpQ2JVVHhyaTFjdXJQ?=
 =?utf-8?B?UXdic1M0VUZaREdNK0liRjhBZ0I2dGVrOXZLSXl4YnI0R2dMS3h6RitpS3N5?=
 =?utf-8?B?OFdmclRGZnhYamxrZU9XVzlqN1U5WURXVmdJZmR2RENyayt0WmpBay82REN5?=
 =?utf-8?B?WlNobHlPY01UemFjZDNJUVRCNEFNbnZsQ09KTzdmTjI2VXlQNStIUXdHaWw4?=
 =?utf-8?B?UHlhamN1aGJJNkFqZWExRWoxMXZnTkNOOUpuN2JKNS8zbjhTN2l2ckQ5UnMv?=
 =?utf-8?B?dmVMVlZhSUVvNDNkWTlRS0sxcFgzM2dUelBDeHhtS2F0S3RvZGh4dk82TmQ1?=
 =?utf-8?B?TklZRUtYTXZyTGNTSTYySVdzTHVkTS85Q21sVllmUUZrbTR6VU4xeDE1MnVl?=
 =?utf-8?B?enh6UEQvWFZrM3IwOW1QL0VUSkpnNTlHNFYwTVNJc2QxYUVtVTUyZ0xuN2o0?=
 =?utf-8?B?VjZ6ZGwrZFd2VjJqaHhJV3ZYeS8xbGhKL08vcURRQmdzZ2dzL1FEMkZLNzNa?=
 =?utf-8?B?SkRadVdUOC9aeGRObVRqK1RVYUNEcFRZLzV3Y2xJKzhiaGRzS1YxQ2pIeENN?=
 =?utf-8?B?ZDE5eS9WY1BaZXpkdXJSWGpwb1pSRGZaMkRxMS91NmJIU3VCMStlMFpWeHRy?=
 =?utf-8?B?Z3FZWTdURlN6STZGOTRHMnVpdzM2MWlta1RzSUlyTXVXQlBYcjgwbnRRNmxz?=
 =?utf-8?B?cnA4S1JSY21kL0pHelR3aERNa0hFbkZ2Z0REaUZTeGJ6SEE4TW90Y01wUmh1?=
 =?utf-8?B?MG40ZGUwUkpEWjFGajVtMzZDWEFwSHpOTlFwNGptQUw3WUJGTHphSlJXTHNx?=
 =?utf-8?B?RWFFbk1IeXBBSVJIUjlzVzV5aWRuaGtNanJqdlgySHV2bG9lWkJrSkdpVytY?=
 =?utf-8?B?ZE9iUHU1Q3RGOVlwU0ZNc2FUZGxSTnZxcGZiTHFzbmRKS1lOSUdwZnd1UWdX?=
 =?utf-8?B?MjdsNXpueGJYZlBpb01JRUdIcGpzRlVhankwSm5LOHdBUlF3TEJoZWZlZGM5?=
 =?utf-8?B?Q2VIS1dsSlU2UkNjc0pUUnZyZGE4STlJdE9USjZqa0ZIRGNOQmdLTzJvWDJC?=
 =?utf-8?B?blBxWk1HUytpck96eGRzcE1TVCtZeFlLSFAvV1R2a2ZyWkdvTDdqSjQxTTNj?=
 =?utf-8?B?bUFpeG9ucGo3K1ZrOVhxLzRETlk3SFYwUVlOTGFjbzJXMDVpYWpTWVU5SHNB?=
 =?utf-8?B?SHplQTdrbHk0UWZud05FVy8yWXRpbTBPTU9JTm04S08vall2alhMU2ZSZnVG?=
 =?utf-8?B?b2VLcUN1T0o1OGpIYVBCWUZZK1VBdHNOMEJoZkFMM0RnYVZZM3JkWml0TUEw?=
 =?utf-8?B?ekF6K0RIS1NqZjh3TkM0VTJscVFuNlQ1b0dBYWpyUXo3VCtVbVloa2VVZ1Fm?=
 =?utf-8?B?TmhaYXFlVWU5TWdZeHNlbXFCb3JoTk91VXhONWZsTGhoeUxWemZ3Vng2clpG?=
 =?utf-8?B?S1BLZkE0eUFZc0g5bVEvUTVDcXFEalMrSTZrN1BJUVBmSWtxQ0krZTNTOTBQ?=
 =?utf-8?B?c084VGRGZ0JFclhkWVY3Wk1jU0Z5Rk9RdllWMVZnN0h5K2ErNmpPVjNSbmJS?=
 =?utf-8?B?SnlsMTBBNVR0UzhsTE1qTjY1d0d2V3JRY3ZGWFFGZWtFUC9zRnAxS0JIYTZY?=
 =?utf-8?B?K3Q5dFpHajUrUWZUMnFVZUhKU3htZ2U5Z011Y0VwcW43TFZYS2twaTU3cnZu?=
 =?utf-8?B?cGVmbUN4QUNwZThWU2hqVUYwakhlNk9ZRC93UVFxK0JFYW8zSjlUL0xDVnhU?=
 =?utf-8?Q?xZVbXLxBPZvdChuioiOsh58NXmSGA4xq3s7lYYa?=
X-Forefront-Antispam-Report: 
	CIP:20.93.157.195;CTRY:NL;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:westeu11-emailsignatures-cloud.codetwo.com;PTR:westeu11-emailsignatures-cloud.codetwo.com;CAT:NONE;SFS:(13230031)(35042699013)(1800799015)(36860700004)(376005)(82310400017);DIR:OUT;SFP:1102;
X-OriginatorOrg: topic.nl
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2024 05:28:59.0606
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b0863bc-1479-4a66-6a85-08dc7a201518
X-MS-Exchange-CrossTenant-Id: 449607a5-3517-482d-8d16-41dd868cbda3
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=449607a5-3517-482d-8d16-41dd868cbda3;Ip=[20.93.157.195];Helo=[westeu11-emailsignatures-cloud.codetwo.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB1PEPF000509EA.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB8049
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 May 2024 05:29:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199684

On 21-05-2024 16:51, Richard Purdie wrote:
> On Tue, 2024-05-21 at 15:57 +0200, Mike Looijmans via lists.openembedded.=
org wrote:
>> kernel-fitimage inherited uboot-config, which resulted in failure to
>> run "menuconfig" on a system that has both multiple u-boot configs and
>> wants a fitImage kernel.
>>
>> Fix the issue by splitting up uboot-config into uboot-config-vars that
>> only contains the "harmless" variable settings, and inherit that in a
>> new uboot-config class which contains the Python code to do the U-boot
>> specific settings. Inherit only uboot-config-vars in kernel-fitimage
>> so that it has what it needs but doesn't break.
>>
>> Fixes: f9e834e31788 "meta: introduce KCONFIG_CONFIG_ENABLE_MENUCONFIG"
>> Signed-off-by: Mike Looijmans <mike.looijmans@topic.nl>
>> ---
>>  =C2=A0meta/classes-recipe/kernel-fitimage.bbclass=C2=A0=C2=A0 |=C2=A0 2=
 +-
>>  =C2=A0meta/classes-recipe/uboot-config-vars.bbclass | 95 ++++++++++++++=
+++++
>>  =C2=A0meta/classes-recipe/uboot-config.bbclass=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 | 80 +---------------
>>  =C2=A03 files changed, 97 insertions(+), 80 deletions(-)
>>  =C2=A0create mode 100644 meta/classes-recipe/uboot-config-vars.bbclass
>=20
> This looks like it might be a good candidate to move to a file in
> meta/conf rather than a new class file?

What does "this" refer to exactly?

Note that this patch just moves code, it doesn't introduce anything new.

> We could add any functions needed to lib/oe/ if they can be made
> suitably generic.

What "functions" would that be?

M.


--=20
Mike Looijmans
System Expert

TOPIC Embedded Products B.V.
Materiaalweg 4, 5681 RJ Best
The Netherlands

T: +31 (0) 499 33 69 69
E: mike.looijmans@topic.nl
W: www.topic.nl



