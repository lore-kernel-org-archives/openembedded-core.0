Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23FAEC369C2
	for <webhook@archiver.kernel.org>; Tue, 22 Apr 2025 10:45:15 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.65.64])
 by mx.groups.io with SMTP id smtpd.web11.36928.1745318714340357541
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Apr 2025 03:45:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=mBLKvCfI;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=mBLKvCfI;
 spf=pass (domain: arm.com, ip: 52.101.65.64, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=Xm63YXwSfc3jCZ6i3ul6lxnSOQOZwBZzzhMGhjU6Pctc15Sb+YoJ5OywadQge0EElSaHsbbqWk/ACCxh4TdVMjgs0jyYDggDKEUSYnvoaMLVRD7hhQOojnC3E/0zbrEw4gW2vQ/dtvG6oYwoxhSWTgo1qviO55Vz2QQ+MNtu18aNe3q4ZOKcYZHYGHsXf20axMuE4gJNhest4hJ2VfjxK+RIEcWtxiyVzNo8rHmij2A1tlGjjPcenoaLjxAW2IVDfinl4HPn/Lf2RmfBakT3So+s3KZrlKH1CMhhE30vpuVA3JdZpbZdI6M62Dk921387FVZa9Z5shvqa1Xlcm+Qog==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lVJTGWTF6eQt4vrop8HVT0+ABbRtIck6UlFX33hE7BM=;
 b=upbiN5afD6qxlCWE9SNQtV+wgnDt2nqiEEtG7hbVPpifnC8vJh/O4gSE/R5QdQmFPoogWINrWAappEvalUYA5Z8+1smkO/Vmb/WrlcV0dIezS5a2jV5WIJvTPpkyXXxYzNd1Qiv+H1IS5fYK5hY83yDK9z30J4ToscDdsyDagBSyaF0mIUCuYMro+wTYUKrRWPXfq42vygyXKt16Om9ertdlwxX4FePimMtBvtTmNDjtlOl13+kOqIzvdZbPeXVqxQOZx8EB9OHSr5A8whJsSVxJPGExQg8GwVubB8+xGlsrh8LsSZ06bhLvxsn+wJb1QbMOrOJNh4dDuNuN1KFiNw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=fujitsu.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lVJTGWTF6eQt4vrop8HVT0+ABbRtIck6UlFX33hE7BM=;
 b=mBLKvCfIi+Kymy3I1+XDRADvCFw3ErM6o14TRXsDpr46kzlyoQrl3A2RZ1kTKEuFfNMQr3KZe4jnpxPt97gwyOuAEghf5miFHhvAoRA1tbbsXWz/2CGsmZRgHYg+EIZsgQY8f5AJEI8GRpvtutm91zE+Y2JaEaLAAStvRNAlCSA=
Received: from DU2PR04CA0305.eurprd04.prod.outlook.com (2603:10a6:10:2b5::10)
 by AS8PR08MB7815.eurprd08.prod.outlook.com (2603:10a6:20b:529::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.32; Tue, 22 Apr
 2025 10:45:08 +0000
Received: from DU2PEPF0001E9C3.eurprd03.prod.outlook.com
 (2603:10a6:10:2b5:cafe::e5) by DU2PR04CA0305.outlook.office365.com
 (2603:10a6:10:2b5::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.34 via Frontend Transport; Tue,
 22 Apr 2025 10:45:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DU2PEPF0001E9C3.mail.protection.outlook.com (10.167.8.72) with Microsoft SMTP
 Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.12 via
 Frontend Transport; Tue, 22 Apr 2025 10:45:06 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F/qisvrpVyP6h1hGCPyVeCC9EvllpMdtBd/vtre2JIJPvZ6x+mI9zb6gfkINzo6n8VM+NhHRL7LNbOqtYRgHs5MWj1idX1RGxoXEwJu3g0U5zwlOcb4oVQ35Y9Ozho8adzZ8PMnKUXitwsPaPvkZZb+IlUoDwgwxemaAVhqTDB3OuNkxUg+g+pCoHYzGdqieseGeRpZgzobsna6koq7fKNKgv6rORls08e8LySMUi6LcC2AUua/D1YHANKqvWFLnr7NWp86R4YqsXtKBeai/HUKNRjGJk3v7S4k9IA+QWEAHuD56ceJs00nYaOnnXuUGrdsnplp/4Xyy7t2N6guiuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lVJTGWTF6eQt4vrop8HVT0+ABbRtIck6UlFX33hE7BM=;
 b=RPZj1hQSB6za+Uj5Chvy6zPF+y6ZTot8r+TOV2OU8REFGCYh+dQbtAZRjM5K4vh/Ez1N2o2tR7RjOXNCteYP75CTM8wVYU+bTzvdNclPoyrDxJxAOrlTX3sjAX57bpvo6QcX/6BSx4oXowUnYNbNoJrVuE3VLVDhPkPYFPv3jqcaj/K1IueIMsukz4xGN6eq2GRGWvfQ2dRySaPlzA0APTwcZQuilSfpUqffjfjwajqrdV3zGpyoDHJC6GDH4BIm46KEJH1hDw66qkue9rpcAr7dLGE0+o8KhPZD6ranz6o4tJAkr+XPb6NIstfOARWn1YqR91PRBgqKEYg5VQWflA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lVJTGWTF6eQt4vrop8HVT0+ABbRtIck6UlFX33hE7BM=;
 b=mBLKvCfIi+Kymy3I1+XDRADvCFw3ErM6o14TRXsDpr46kzlyoQrl3A2RZ1kTKEuFfNMQr3KZe4jnpxPt97gwyOuAEghf5miFHhvAoRA1tbbsXWz/2CGsmZRgHYg+EIZsgQY8f5AJEI8GRpvtutm91zE+Y2JaEaLAAStvRNAlCSA=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by PAWPR08MB8791.eurprd08.prod.outlook.com (2603:10a6:102:334::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.33; Tue, 22 Apr
 2025 10:44:33 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e%3]) with mapi id 15.20.8655.033; Tue, 22 Apr 2025
 10:44:33 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Lei Maohui <leimaohui@fujitsu.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] gstreamer1.0-dev: Fix install conflict when
 enable multilib
Thread-Topic: [OE-core] [PATCH] gstreamer1.0-dev: Fix install conflict when
 enable multilib
Thread-Index: AQHbszF7sN107XBU+UWuE9Z/G7P50bOvgKKA
Date: Tue, 22 Apr 2025 10:44:33 +0000
Message-ID: <F85259CF-8D1A-4464-A296-487B30A67ED1@arm.com>
References: <20250422025127.605-1-leimaohui@fujitsu.com>
In-Reply-To: <20250422025127.605-1-leimaohui@fujitsu.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.500.181.1.5)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|PAWPR08MB8791:EE_|DU2PEPF0001E9C3:EE_|AS8PR08MB7815:EE_
X-MS-Office365-Filtering-Correlation-Id: 02252503-5c99-4f39-aa24-08dd818abf3c
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?a1EwTXU2QWdCcFJmWmR0cjdZbFp1RnRQU0NIQjZzeHNNeVhrUlhNRWF1WGZR?=
 =?utf-8?B?Wk5zWFErbllSMEJJczluVnoreEJOOE9zdGFEb3lwaGpVc1UvMlRTQStxVnBK?=
 =?utf-8?B?U2N4NjFRUnA1Zzc4VzcvMEwrbWg0OHhaTTdsVFpNVUg5OUgwL0d1a2cyZUlq?=
 =?utf-8?B?bXU4WitFYi8wcVlPWnVpb2o5ZEJtZHpPSG81enU1ZFhCQnNVV2RBaDJ5c21x?=
 =?utf-8?B?ait1UCtodk5obGR6UTNDOGE4TWlMbWs0d1pFLzdIMzRkbkRWRXJ0TWd6aWNH?=
 =?utf-8?B?MEtZQ0ovNnNYZ09CRGJVbUJ4N3dXSUttZXN0cnF2ekFvczkybUxaTWpONkMx?=
 =?utf-8?B?M3VYdHNSUmVwVUVJWUl2RER4MlhsYllyeHFNdUJZWW4zYzEyc0tUUTJHOUVR?=
 =?utf-8?B?aUNsYW1obkFHUVRDMVhxZjg5T3h1bGJKWkNoYm80dktFS29CZVpKZ3ZHekk3?=
 =?utf-8?B?UUxubklQTStLNE9yZGZmV2RDK0hYM3FNb3FzblRaTkZxMnBjWFFISU02RzIv?=
 =?utf-8?B?VnNENzZoNVQ0emlVVEloa0ExQkU1Y2RPVDJGWTRQY2NJN0J2TUZ3c3l3a09V?=
 =?utf-8?B?V0VHU293b2ZsTjBsN2JKOGM0Ukl4bXdDczVndldFK2hDamJmRnREKy9KS2ZT?=
 =?utf-8?B?RFMrUkJMU2IvRG5CcWdvSUFzbURBb2dPc1FITEhzZFl2Q1lwbXJrNkhzdFRH?=
 =?utf-8?B?dGNHTWJlYUtLdXc3ZVh5MDhZYnh6SExuT0UxSjVrWmVDQ1N5KzZHTWV2dzBV?=
 =?utf-8?B?T3hHaGpsZ1pCenU1Z3M3OElobjBac21rTzVSaFVpMEFMKzRMY3UvZ013YWU0?=
 =?utf-8?B?dHlod1ZNRVBuUUtzMUlSSVAzcVMrbVZCUG90SFdEa0RvRnNUMUZYNFB4eCt3?=
 =?utf-8?B?dXUzWHcyeG8wQ2J2NkVRcDJJczN5UWdMbTlVVG80ZzJRZW9EMGVUZll0OS9y?=
 =?utf-8?B?Zm1Bd2pnZUVIVndGT3FTd0dLK2YwVHh0Z3F3TnVpczlwVm1wcDhuU014ZDZl?=
 =?utf-8?B?S0srSitnbERuMzdmUG5IRnR3eFJISklYTjJobElrRUVHVnpWbzJpc0U2MGsz?=
 =?utf-8?B?b1JtUDgwaFNPQkhXR3ZFUSt6UGRTYlUrczZzQkdGb2tjUy8rUUpmTUJWeGlF?=
 =?utf-8?B?ZzRpVEJGU2pVKzlIVWdDSVMzaytYSnBodWxNTW9yWFhlMEtSSXAvZVVCdE1t?=
 =?utf-8?B?RWh1YVAyTC80NXdnVVRNeDFvcEtTOVJMZ1kzUjBCQnNTZzluTXIydFA3QVhV?=
 =?utf-8?B?RlArMEQ3eEdOUzhyQkJmTGJ2bHFUMnduSWpSUjVlU2lPNDViUkpmQnRsYlpx?=
 =?utf-8?B?OHVBVFJmNTZpY1U2NG5LRGpidkp1MU02NTdNcU80MkZndExERm1BNE9HQm1X?=
 =?utf-8?B?WXU3VWpWOGRQM3JLODI0Ni9BTkdJd1VZZ0ZQRGUzWER4VTNlS2NRS1JHcUVX?=
 =?utf-8?B?N3EyQ0F3UEZyTEwzUDM4N0tYRnV5QnlidGNmM0Nvb2QwMmxWZ1IrVkZOSGx3?=
 =?utf-8?B?YkxwdC9mNThod0xOUXZuZjd3cjhRcHRjOWRnTlVhVUpGMGFsWWhSUDhSb1lh?=
 =?utf-8?B?UHE4bXFCelpsL1Y4U3hmbk11RElJaUlkSVJHMnJyNkxqdjZuZXBOcitBQXA0?=
 =?utf-8?B?blJTVVBUUXozZjMvOHBQem45WVV6NWd0U2VnV0lLemdpUE1DZ2JEWEZ0U0VE?=
 =?utf-8?B?TE9YVFVKTjMvQW5KbjVpajkxUFNNZ2xXOWFwSUd3ZVMxMVVXSzNOc2lnaHhn?=
 =?utf-8?B?M3JDSjRCTFB6QWN6b3A5ek5MTTUzRGl6UHB4VFFmQmt1TDFDYW9yRHVjZzYw?=
 =?utf-8?B?Qk4ybkVVYW1JN0VEbGt0bTJUdEpZWXZGQlFBRWtVNFl1Rlh5TmQ3WG1jdklZ?=
 =?utf-8?B?cDZ2TDhxcDBHMytEeWgzRENEOTMyb0N6aThiRnIyZW1qY1dNWXhwQUpjbCtS?=
 =?utf-8?Q?ySq3uTqeoqZXlaR+jLVjb5eM8bjOvWnI?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <1EF5252E4DD7F74CA3F873F472B46710@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB8791
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DU2PEPF0001E9C3.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	f9104e2a-9a87-49e4-acdd-08dd818aab6b
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|35042699022|36860700013|14060799003|82310400026|13003099007|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?NmtjZEZqU1pJOEFlN2ErbWd0N3BIdS9UZ3IxQ09zRXB3dVpjaFRrSXRqQXow?=
 =?utf-8?B?eHIzN3Q5SENCd0IzWWQ3MXdSNjk2anlybGQ5Ui9SZkRzVVg1bjNyTGoxaG1r?=
 =?utf-8?B?NVhCRE9BYVFDNzBWbGlOL0Jac3pkVHlDeWFxRm0rek52bS83Z3I4WldySDJL?=
 =?utf-8?B?RjRaWjRnWGdMaitLVlE3QXcvOTN1ZURTOUZHK0U5RC9IYnJoMU1SSndWb3Vn?=
 =?utf-8?B?Vy9BS2VFZTMzYkIxWW5COG5zV3lmMTBWci9rSTBQWGFielR6S0pSU1M2SjQy?=
 =?utf-8?B?ZjBaY2NhRU9IMXpvQnJmbE9GcUl1VWJrQmQ4ZHVwSkRGRjhqWk1GWHJWM0hZ?=
 =?utf-8?B?UGNCaHlpckRrcSt4QU1ZZ3hzVzh0VCtpeUZIcG44enBUclVuelhzMFU2czFU?=
 =?utf-8?B?M3pORDBNSE9JYVBXenFNRDAzcTJOQlVMOHA5UVo0a0NkZ0NhdG1UYzZSbjlm?=
 =?utf-8?B?RTNCc0hRZng0Mm0xeUp2ZytlTTdCTkhaS0h6cHVGNGNWd0x0N3VuYm9qWGti?=
 =?utf-8?B?UzhUVTdyNzVDN2NiNHpyV2JHTDRFR0lBcUVZQktWL1huYWlSRU9ENWlSazNq?=
 =?utf-8?B?WVNoM1h3L2lrQkg2M1ZYSXpxaUM5SHlGa1NIT1JwVXJvcDRmdEZoT0k4ZGR1?=
 =?utf-8?B?WHZVZzJieDgxOXd1UEJPa2ZITjNQQzhFQlZHRmYxellzWStlS0hxcjl6T0pI?=
 =?utf-8?B?Rnh1Q28yQnNPYnE2NzNkVksrRmtQVThaRVJpMjN5Y0pBamQ3M2w2VHhoSk8r?=
 =?utf-8?B?bDZFcWhKcWtFSjNadys0TmdaS3dIclE2NUlRQmhPeHpaVkY0M2YwUVYyUTBi?=
 =?utf-8?B?clNVMHlEZkx2S3c4V09XdFlBemUzcStMTi9FQnZUVUVoVzJIQ2dZNVoxMW05?=
 =?utf-8?B?dHFRSmFXZmg5Qm56TG1UTEdyeXFReGJHS1JNc2lVQlF4OFYyOWNxTENkaSt2?=
 =?utf-8?B?dTZ1SnZPYnVOaWNESjhnUzB2blZFaG9QY1BvYnpWeGM3NHN1SWo1RHk4Umpx?=
 =?utf-8?B?bkU5c04wRFg4YlExYTdlNGtlbmNaaUlpc0ZseG9FLy9wbThIS0VYMHBWYnNQ?=
 =?utf-8?B?aGhuL1NHYTU3azNtUU0rT20zVWZSV1FkcVlMV1N2OC93aGl5bEt6ajF4cm9Z?=
 =?utf-8?B?OW1ZdnR1ODVIeTZ5SmpBQnp4SXJhVG8xQm5OeGxNVnNpVGROUGhkOU9Dc1dW?=
 =?utf-8?B?SUtTaWJPSXJMT2JXTUdhcnllMGlNeXFSRytUSFFHeFZZem8vUnpXRUVSMkJZ?=
 =?utf-8?B?clpXaHdrZGdQVlJIU3MzZjhDTE9YZy9MT0pqNGtkbTRkSXUya3hQM3Bra1V5?=
 =?utf-8?B?QVlMZS9pZEpRdXk1MHYrQUFtNTRIL0p1MGR6cTRyR3FYVUNNamhYa05qWUtT?=
 =?utf-8?B?ajF2OC94d1dKK0ZTOG1GOENWc3BDeDJzWFRvWDlNZGVXY29RU0xRNHV2YUZX?=
 =?utf-8?B?N1hxUHVSaFFXVnVaVFFUcVhuK1RKNjJUUHZhRU96VjY2YXpmMlF0a3hYSlV1?=
 =?utf-8?B?RXdod0FvV0xJMTVzK1hsOUdZbTBrcWVMUjl4YW0xekZNOURZamtjTTV0c2hl?=
 =?utf-8?B?ektOYkJhVExDYkZTc0tzSW9ua3A0NlJkeEUyVkNYaGwrd2VVRHpaOXNuUDdG?=
 =?utf-8?B?ZG51MVlUS25iZG5RVjBCTGhZL0w4UU9DckFvME1adjFkWDVKeEpYWUVORDg5?=
 =?utf-8?B?TDFZZTlSdGJRRU4yeVRSREpOSkVyc0phcDRsT004MFBoRkxHc0o0aEJVYzVl?=
 =?utf-8?B?L3YydTB6R1ViWmlYRXB3Mm81ZmVBM2dudGtZc01SWDlLK2g1RzlpUkpUR2F3?=
 =?utf-8?B?ZkNJaE9YTTdiYWhBclNyeUdVR21Ia0grN29ZQUY2WDVSVnZBeXl6dlJyOGU3?=
 =?utf-8?B?OUVla1RqT0FhTk5TaDhRcnRyNzhMcFZodndrNzdzVWM5OG1QQmxZMmlJS2sv?=
 =?utf-8?B?dXg1d284QkEzN3E4WHhvTUtuRE5xWGdRZFhwUFJ4cGR0NWphMWlsR3Z4QUVH?=
 =?utf-8?B?ZjVFQ1U5UXlnPT0=?=
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(35042699022)(36860700013)(14060799003)(82310400026)(13003099007)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2025 10:45:06.9903
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 02252503-5c99-4f39-aa24-08dd818abf3c
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DU2PEPF0001E9C3.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB7815
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 22 Apr 2025 10:45:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215199

T24gMjIgQXByIDIwMjUsIGF0IDAzOjUxLCBMZWkgTWFvaHVpIDxsZWltYW9odWlAZnVqaXRzdS5j
b20+IHdyb3RlOg0KPiANCj4gRXJyb3I6IFRyYW5zYWN0aW9uIHRlc3QgZXJyb3I6DQo+ICBmaWxl
IC91c3Ivc2hhcmUvZ2lyLTEuMC9Hc3QtMS4wLmdpciBjb25mbGljdHMgYmV0d2VlbiBhdHRlbXB0
ZWQgaW5zdGFsbHMgb2YgbGliMzItZ3N0cmVhbWVyMS4wLWRldi0xLjI2LjAtcjAuY29yZTJfMzIg
YW5kIGdzdHJlYW1lcjEuMC1kZXYtMS4yNi4wLXIwLmNvcmUyXzY0DQo+IA0KPiBmaXhlZC1zaXpl
IGRpZmZlcnMgYmV0d2VlbiAzMiBiaXQgYW5kIDY0IGJpdCBzeXN0ZW0NCj4gDQo+ICQgZGlmZiAv
bW50L3Rlc3QvYnVpbGRfYXVoL3RtcC93b3JrL2NvcmUyLTY0LXBva3ktbGludXgvZ3N0cmVhbWVy
MS4wLzEuMjYuMC9pbWFnZS91c3Ivc2hhcmUvZ2lyLTEuMC9Hc3QtMS4wLmdpciAvbW50L3Rlc3Qv
YnVpbGRfYXVoL3RtcC93b3JrL2NvcmUyLTMyLXBva3ltbGxpYjMyLWxpbnV4L2xpYjMyLWdzdHJl
YW1lcjEuMC8xLjI2LjAvaW1hZ2UvdXNyL3NoYXJlL2dpci0xLjAvR3N0LTEuMC5naXINCj4gMzE4
NjRjMzE4NjQNCj4gPCAgICAgICAgIDxhcnJheSB6ZXJvLXRlcm1pbmF0ZWQ9IjAiIGZpeGVkLXNp
emU9IjgiPg0KPiAtLS0NCj4+ICAgICAgICA8YXJyYXkgemVyby10ZXJtaW5hdGVkPSIwIiBmaXhl
ZC1zaXplPSIxMiI+DQo+IA0KPiBUaGUgaXNzdWUgdGhhdCAiL3Vzci9zaGFyZSBpcyBhIGFyY2hp
dGVjdHVyZS1pbmRlcGVuZGVudCBsb2NhdGlvbiBidXQgY29udGFpbnMgYXJjaGl0ZWN0dXJlLWRl
cGVuZGVudCBmaWxlIiwgaXMNCj4gYSAibG9uZy1rbm93biBwcm9ibGVtIHdpdGggZ29iamVjdC1p
bnRyb3NwZWN0aW9uLiBZb3UnbGwgcHJvYmFibHkgZmluZCBhbiBpc3N1ZSBvciB0aHJlZSBmcm9t
IDEwIHllYXJzIGFnbyBhYm91dCB0aGF0Ig0KPiBhY2NvcmRpbmcgdG8gaHR0cHM6Ly9naXRsYWIu
ZnJlZWRlc2t0b3Aub3JnL2dzdHJlYW1lci9nc3RyZWFtZXIvLS9pc3N1ZXMvNDM3Nw0KPiANCj4g
V2UgY2FuIGZvdW5kIGlzc3VlIHJlcG9ydGVkIHllYXJzIGFnbywgZ3N0cmVhbWVyIGNvbW11bml0
eSB3aWxsIG5vdCBoYW5kbGUgdGhpcyBpc3N1ZSBmb3Igbm93DQo+IGh0dHBzOi8vZ2l0bGFiLmdu
b21lLm9yZy9HTk9NRS9nb2JqZWN0LWludHJvc3BlY3Rpb24vLS9pc3N1ZXM/c2VhcmNoPW11bHRp
YXJjaA0KDQpBbmQgSSBzdGlsbCByZWplY3QgdGhpcyBhcyBiZWluZyBhbiBpbmFwcHJvcHJpYXRl
IHdvcmthcm91bmQ6IHlvdSBzaG91bGRu4oCZdCBoYXZlIHRvIHVzZSB1cGRhdGUtYWx0ZXJuYXRp
dmVzIHRvIGJ1aWxkIHNvbWV0aGluZyB1bmxlc3MgZGVzcGVyYXRlbHkgbmVlZGVkLg0KDQpGb2xs
b3dpbmcgdGhlIHNlYXJjaCB5b3UgcHJvdmlkZWQgd2UgY29tZSBhY3Jvc3MgaHR0cHM6Ly9naXRs
YWIuZ25vbWUub3JnL0dOT01FL2dvYmplY3QtaW50cm9zcGVjdGlvbi8tL2lzc3Vlcy8zMjMgZm9y
IHRoZSBnZW5lcmFsIGlzc3VlIGFuZCB0aGUgYWNjZXB0ZWQgTVIgaHR0cHM6Ly9naXRsYWIuZ25v
bWUub3JnL0dOT01FL2dvYmplY3QtaW50cm9zcGVjdGlvbi8tL21lcmdlX3JlcXVlc3RzLzYzIHRo
YXQgd2FzIGZpbGVkIGJ5IEthbmcgS2FpIGZyb20gV2luZCBSaXZlci4NCg0KVGhpcyBpcyBub3Qg
dGhlIHNvbHV0aW9uLiAgUHV0dGluZyB0aGUgLmdpciBpbnRvICRsaWJkaXIgaXMgdGhlIGFuc3dl
ci4gIFNlZSwgZm9yIGV4YW1wbGUsIHRoZSBEZWJpYW4gRy1JIHBvbGljeTogaHR0cHM6Ly9zYWxz
YS5kZWJpYW4ub3JnL2dub21lLXRlYW0vZ29iamVjdC1pbnRyb3NwZWN0aW9uLy0vYmxvYi9kZWJp
YW4vbGF0ZXN0L2RlYmlhbi9wb2xpY3kudHh0P3JlZl90eXBlPWhlYWRzLg0KDQpUaGUgaW50ZXJl
c3RpbmcgcXVlc3Rpb24gaXMgd2h5IERlYmlhbiBkb2VzbuKAmXQgZmVlbCB0aGUgbmVlZCB0byBk
byB0aGlzLg0KDQpSb3Nz

