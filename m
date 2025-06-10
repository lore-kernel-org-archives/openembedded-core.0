Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65B41C5B552
	for <webhook@archiver.kernel.org>; Tue, 10 Jun 2025 11:22:06 +0000 (UTC)
Received: from AM0PR83CU005.outbound.protection.outlook.com (AM0PR83CU005.outbound.protection.outlook.com [52.101.69.17])
 by mx.groups.io with SMTP id smtpd.web11.83963.1749554520474913265
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Jun 2025 04:22:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=mOPJ+Hg2;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=mOPJ+Hg2;
 spf=pass (domain: arm.com, ip: 52.101.69.17, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=C/ftY19dYM9345+h6NCkwH5qHxFg2DlzFFJETqbOvSHFkILYLhY1kslNneYyHfGbm4DW7xoMS7HDMqnUjzsxY0c+H9YvmmvY5+UWBKF74n9pmxmPXr2ZX0kjBGyQiksMGEv9+hu1yadugSugbYcMrG02+GiVtmTKkHLMfoUopwD4RH8b8n1yvFUQiZkoyISyevE/Nydm+e967t5u6JVaOOvsV9dUCmFyw9oD/bCZeSO2IXltUFawWRBwVwGIe14yLEvTj1wiuNiLywHpqlF85kz8lUaj3lcPj1twTPlwioKmgfrECp16bwt4ZiCcGwqDkvg3FNNDtL8XJExUSrTk0Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HE+0J4TRLDij9NhAxS3BKqi1ng53Q5QN4P1fSHZfW5E=;
 b=v0ITE7seR06VnT31p0dA3jm+vShQS7dBkAel6MJK28Oq75F6TrRtypV30AgDiBE9MgFMRUwipA5M2wzmO4z+Z28kLq3RUi1PPczEBGWOT/0iFytDj9u0hPitVolpFke9Wzyk8iCLjADiK2RyeFqqHcaGKoLY4MWISL/BO+pIaVCNXoVORVujdZJy0Gm9BxAGnuys8efoajVF0cVw6ZSF0YVMnCyPUdt2ac+a2+gjPtY3OABmQavIVW4sJ1Domme+n8Nzveknk6DjEF1BPR4oumJqH9dwGeLhS1YNMswP0ycEfxk4+MHHdF1RzAbZq4/3kamXgYri8mRAEEzFmMOpnQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=windriver.com smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HE+0J4TRLDij9NhAxS3BKqi1ng53Q5QN4P1fSHZfW5E=;
 b=mOPJ+Hg2tLAnX1CeXhXXXy+3OfV4qvGxhMaEnYV0wITIggMuzf/KMBD+yVGw4F+7jGMDf0pCPcSzhyAZpFbWOnfBcRwu87QE5vVC4I5QjEVmvfzyNOwmdWh+lfltgFMqgKEK3PVusbBiTc029y2rv2Gm16fpsrXNGfbcE4Fg8Us=
Received: from DUZPR01CA0028.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:46b::7) by AS8PR08MB8087.eurprd08.prod.outlook.com
 (2603:10a6:20b:54c::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.21; Tue, 10 Jun
 2025 11:21:57 +0000
Received: from DB5PEPF00014B99.eurprd02.prod.outlook.com
 (2603:10a6:10:46b:cafe::14) by DUZPR01CA0028.outlook.office365.com
 (2603:10a6:10:46b::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.17 via Frontend Transport; Tue,
 10 Jun 2025 11:22:14 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB5PEPF00014B99.mail.protection.outlook.com (10.167.8.166) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.15
 via Frontend Transport; Tue, 10 Jun 2025 11:21:56 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KIKUPdr6P8xQQyo5ZSiJzNHplvuFQsPm2Rr7xafF8iUMhIx1CHL/+2LBckSDWy5jf3NHqkI8OkPoj5+9i4gWg7yL7gDL0CoKeBk35yVzms3rhEzsPL2CNTBazT/rduizSXhLlKHvXERKL1libwxsuFLN3m6Be2N4viZNAXoTREyp8v2XWbNx+vFJo3ieHRGMSP+EckE4ZDU1kHfR5rftxn5woOutyJR+dycwxe7Msn7VUFMU1oKifbsZiK/um/Zzp7wYAonixEyI7Rh9fDOIUstVCnbSs6d0YsBAVBbByrIFcP3q3WTC1kJNC3pRNoBpTUy9si5dTBXqsHTP1m827g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HE+0J4TRLDij9NhAxS3BKqi1ng53Q5QN4P1fSHZfW5E=;
 b=yZzS5CrhvmGEc04llbE/UwgL80oPZpkOTjLDsYpXMPM2BIapgXEjdb6VupJ5CeH83UCtWGhGuHLL59eWMn0UEIOPzBPAUqvySPVehmC4Po/9HQgV0Xn/HWDmBYQ3uDsEqjw3Dl5azenuoC4EBbYSU6g0R9dcN8VRiWNDJ+TTiCsP5+E4VCsnROjI2sOGE7cR0ce7SKtov2VGCK7rzO0xZPkSI4uGfpj1DDiDQUiV9Uk74L/l1SK5lXF7uNxrdyE8Zo4btYrkGx+6fDGEMp5Pi6bDt+UxROod55u9VKNMKgwCYuccTYdSfGP2QKC4JUXbfAsBpbEbhXHIYpfFvvOnGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HE+0J4TRLDij9NhAxS3BKqi1ng53Q5QN4P1fSHZfW5E=;
 b=mOPJ+Hg2tLAnX1CeXhXXXy+3OfV4qvGxhMaEnYV0wITIggMuzf/KMBD+yVGw4F+7jGMDf0pCPcSzhyAZpFbWOnfBcRwu87QE5vVC4I5QjEVmvfzyNOwmdWh+lfltgFMqgKEK3PVusbBiTc029y2rv2Gm16fpsrXNGfbcE4Fg8Us=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by PA6PR08MB10567.eurprd08.prod.outlook.com (2603:10a6:102:3cc::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.18; Tue, 10 Jun
 2025 11:21:23 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e%5]) with mapi id 15.20.8813.024; Tue, 10 Jun 2025
 11:21:23 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "liezhi.yang@windriver.com" <liezhi.yang@windriver.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2 2/2] automake: 1.17 -> 1.18
Thread-Topic: [PATCH v2 2/2] automake: 1.17 -> 1.18
Thread-Index: AQHb2fk6YKJQa7fTQUOUC4bwqlOpIbP8P5gA
Date: Tue, 10 Jun 2025 11:21:23 +0000
Message-ID: <2420FDDE-F7F7-4A02-8696-66554E56924A@arm.com>
References: <cover.1749554012.git.liezhi.yang@windriver.com>
 <3a20c600314b7acb3eb3015583a6cbc4ceb4970f.1749554012.git.liezhi.yang@windriver.com>
In-Reply-To: 
 <3a20c600314b7acb3eb3015583a6cbc4ceb4970f.1749554012.git.liezhi.yang@windriver.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.600.51.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|PA6PR08MB10567:EE_|DB5PEPF00014B99:EE_|AS8PR08MB8087:EE_
X-MS-Office365-Filtering-Correlation-Id: 5a0d7a68-0b88-477f-5cd6-08dda811026a
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|376014|1800799024|366016|38070700018|7053199007;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?R2UxMTRqc2pnQ1dCTzFYMjRXUUd3YWdEYXNpQmllMzFQcGF4OTl3YzFpMmVO?=
 =?utf-8?B?TWF4ZEhuY1NoWUl2VUlsdkpKdldlZm5wbWk2QklneDN6cFU2QkNOa21Wck9t?=
 =?utf-8?B?Vk13N3VIbWdpNlRiamI4b0ZnNXZOR1o4cmthUTZCUFlkaDA2LzVPL2tZMGdT?=
 =?utf-8?B?TUxjS1dYNHBLc1JXMGxwRzNXM09KWFpJa24rNkRtNWpSRjdIb2VoOWx6ZTZh?=
 =?utf-8?B?L0UrbURzelA0RTZZQUFYV3QzZXNpK1RUanZmaytwMmZyeFpLWHk5RlpTelox?=
 =?utf-8?B?VVUwdnhQSHFueml6NGFmd25VUGlXeTBPZUdmeTRtWVRpSTdMMXJFeWlWeXl0?=
 =?utf-8?B?dktvaFZBWTZWOGp5cDYvcGI3dERsNjk4QkRMNWsvQTQyd0IwNmUvRDlqWFdy?=
 =?utf-8?B?MHJCODdWdmNxQ3FCSTNXdFBocEZvTDRFYVFSVHZxYnVzMFB4bEl2ZW5UWEdZ?=
 =?utf-8?B?S2F4Qjl0YzJmaGRlcWRLcnAwUUxtRmxJTm0zT1liSFQ3SjZKR3NoU0tROVZD?=
 =?utf-8?B?QllwNG1VRFlGVVdPT2RBWUJGcDd5c1NBQlJ0NlNUZ1JHQ3YzWS9HVU1ncFU0?=
 =?utf-8?B?UnhmY0QveVRvNnlGNlBwOWVFNnQ1Ynl4TDRkVC9SN0tmemZLcEVMRmd6bHdk?=
 =?utf-8?B?Q0d5bW1ydW9oditROUt5V0JDQ3BQVGJIM09IUE9rRmNRMTZ1cVJ1cTJJcDJz?=
 =?utf-8?B?alo4THVZbHZzMW1ZQVUwNjg2T1F4QWdQWGVUaEVDSllPUGFPTm8xSGNLRFhU?=
 =?utf-8?B?bmptUG1mMnk3YVk0WXNpS1hzVUl1ejVrdmNwRDNySHArMGdacEVTSHBXQnBQ?=
 =?utf-8?B?cmUwOUdBaC9iZ3F2WFVXRXFXVnhtaGg0d3QrM0lhL0F6bzZLN1BJNHFtN29v?=
 =?utf-8?B?ZFE0ZFkxYTlVVVlJRWZ0SVYyWURoVDVpTkxPT1IwRjRYaWY5S3JwV3pIeDdL?=
 =?utf-8?B?bEdMdHBRN0ZIei9FYi9zSVJJaGcwLzhkdEJsYkNRZEJSOWN1V2RPaG16WTJB?=
 =?utf-8?B?SnRldWRGaDN3Nm1tTE84dDk1djVaaHQxWitjL3VCSktsRVBMMGVad3VPTGQv?=
 =?utf-8?B?SG5mYlliaGxiSm5JRmtDZzREeTZTUE16YmxTL3VBVlF3NkpJazV1NG9rNnRT?=
 =?utf-8?B?QUZJSk5ZUkVjWThSWU9SekpDNEsvWGR3UWlpZHp0ejFrdkZxQ1V4RVRpQU9i?=
 =?utf-8?B?RGx0ZnBjVWdUSFZpT1RDbERUTW4yWjZlZkNxNzVFM0xheERzaXRkTFlqZHVV?=
 =?utf-8?B?VGpXN3YvY3UwQUY4ak45YlVEQjJLUElHZ2lDMElsODRiRWFsYnBsNkZMdW1l?=
 =?utf-8?B?QlprcGd3Tmw1VkFzT0VnV3h5cVRLSS9mSEpFWDJjL1NXeUVVUkkxa1Ezemdp?=
 =?utf-8?B?L05GdmxmNTNjWUZSb1V2K2J5UnhjOVJlNWxCWmNnVmVCcmxuL2lrWWwwREhx?=
 =?utf-8?B?eUVZNUQ2ZS94WSs1RnJnNS9RNzg0S2ZpcVlDVFgrSkJXTDNBRy9ndXBTTlhW?=
 =?utf-8?B?TEhBaVM2ZTJXaWpzTUc4Qno4UXRZS1ZpdDVYaXRka21CMnk2Y3ZNNkw1dXAz?=
 =?utf-8?B?Mk9LaVpnMEU0ZDgzUzRWeEdkT0h3dzZoNGNsdnV1b1VIRnFVSmdBZU1HK0lL?=
 =?utf-8?B?MmZHUHkyTEFKMm1kLzg0dlF3eTlwNXA3NTUrcTFPNVVmVVBrNnN1STVwS1A2?=
 =?utf-8?B?RUZLRXRRMWs3VlB1T1BoQUV6cW5LSmdDTWtOUkpvWVY1Si9aNXJmNCtGeC9V?=
 =?utf-8?B?Wm1QSFdXQVJyaVNuMlJvd2wwQkFzMDJLcGo0MjdmMWZxakhkYWIyWFRqTHho?=
 =?utf-8?B?bTlVTmE3ODJmMGxYbXZ2TjdramY5YUpmbzBNbkdOYkl1YzB3Vll6bFVJMFlO?=
 =?utf-8?B?VjR2UDMyUUVzSXByeTVYckNGak9qQ3hJN3EzYkdweFUxUGhIUExjWDZwZG5j?=
 =?utf-8?B?L045T0ZlWDJ0aVdnZW81M3pPNzYyNXJKcjI2L2g2QjcvaWF2RXgvSitQa3kx?=
 =?utf-8?B?Y2pVWEJnOE93PT0=?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018)(7053199007);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <574CFE27E86638478FED3B811EAADA03@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA6PR08MB10567
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB5PEPF00014B99.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	b5052cf7-400b-4de0-8608-08dda810eeaa
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|14060799003|36860700013|82310400026|35042699022|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?WnY0VTQ1QWh2Z3lsZE93NEFUUkJLdXlLZHdVd3pTRFg2cHVSZkFtRDBiWU4r?=
 =?utf-8?B?dkhwUzloMEFpY0pjT3UxcmZLaWxoUko4WGdCRXVYQ1FRNWJ6Q3NwODFBa3F3?=
 =?utf-8?B?VXMwRjF4UmNaOUxacTZoemp5T1NjNit1VG5SbXYyVS9OU2R2OExEODl0SWNU?=
 =?utf-8?B?Ni9NRmRLZEp2MXREL3hoRy9lQ1d3bHdobmhlTjgxRWlGS3UwejZRdVYxM2l5?=
 =?utf-8?B?NlRUSTF1T0l1WC81L1BsRnFqdHVsaVJBMy90SzV1Z3RFM2JidHNzak5oT1Yx?=
 =?utf-8?B?aStzSzFiYy8vcStacGFndTZtVzROd3VjazkwRWxreTFMMTArd09aNUtOUk14?=
 =?utf-8?B?VXZKcGttREhWeDlORFhENGVrYm9pOXgxNytaL00wVTYzK05EOE5NN29xbVJi?=
 =?utf-8?B?cjluSktZUWN5SENvRzFrTmFSOUJER2lhMmJ2bXgyTDg0bTZjZ3dvK0srb3Fv?=
 =?utf-8?B?L0dVejJac2FrNHpJOFFGa0piRjBBZ3ZKeDNZWXJSRHF1NzlkdkxZcHVvcnZ1?=
 =?utf-8?B?d2JBa2lpMWZicXF6MlJiYVQzWUw4RXBmdG51QlE0K3BNeS9GWnRYenBNbklY?=
 =?utf-8?B?WXVac3lBb0UxT2FBMlhicXZpWmlySnR3M01ZUDBQYXZ1N2dDN25jdmpqT1VX?=
 =?utf-8?B?NWE0YmFhQTUzcWNhQWpqOUNpWGs1d0U5WVAvd1NnVXN3RytmRnN4SUFUQlFh?=
 =?utf-8?B?dVpPbG1xdkJrek9IOEJBbEdwN0hCRVl6RnJ4TDBoYTZnZExJMUsxaHVsY3Nm?=
 =?utf-8?B?cnc0SFBnTG82VzR3RjBoK05TemtMLzNqYUJ0QjFqQm9DVHl4eUFtMnZnbG1q?=
 =?utf-8?B?U1I5MDBSSWN5NnptcjluUDVrZlhzcEJXMmcrZWJLRjBCMWgvb2FjaVlQTUxD?=
 =?utf-8?B?eTdTOTV2STJ6Q1YxUDlzWGlEbXRjam00MmlHc3dScUE5K1AxSm4xWlo4TkV1?=
 =?utf-8?B?SzNtWnF2c0hjWDVERFlZMHFJU3V6OWdxSk1nOEExR0NuYUx6S3B6UlhpMHJM?=
 =?utf-8?B?TTFueURsbi9ZMUxVQXc3Sm9JQ1VhYjhWQW5oU0N4a2hObmNyUU1wK0cxd0pw?=
 =?utf-8?B?Sjl4Ym1DbWZTMGlrZWwxQ3hNMjR3Ykt6MUIvSVVwbzJWUDJRbVpiUlRhcUdP?=
 =?utf-8?B?V1ZwSDVSYUFXRExINFlvM0NobXpnMXc3cUc4c0ZKcWpjRWpPSkhlVHlsQ3B4?=
 =?utf-8?B?L0RpNXUyTU1DS1paRnpUK0ZlZkFsVExuTHYwdkZMK2kwc0laeXZQMDlCWXlM?=
 =?utf-8?B?N0J5V284dVhndG5aRk9Jc00rTGpmVGRnWndCeHZ3S1EyVDBiTThaa3d6eTdL?=
 =?utf-8?B?N2p2a0pZaUhnWTEwT2Fzdmw4SUNZQS94ODZMeHZ6TDl4TnpteGdPMENCMGlk?=
 =?utf-8?B?S004S05MenhuNTRTSVF2QzdoN2dpc2YwYjBBVUUyVW5VUXpkQjBQRldjSTlN?=
 =?utf-8?B?V0xIbzRhODJ4YmtERytuVGpiTXNiRWtIWk9lZVFJaE1PeGNEZ1lUR1pLdVJV?=
 =?utf-8?B?ejE2ZDl6WDRFNWF4bVo3UXZiZ09XMXNjNDNlV2tITWx5WEJ5NU1iMnpPQW9T?=
 =?utf-8?B?OUdqemhVZ3BpYUVRNHhTaGt1cnliUk96d3RnOGw5OHg2T1M1UzN3dGlCY0Zv?=
 =?utf-8?B?R0tKcWZZYWxMR0F5d0JzOE9icTZGbjdJandyeGZYUVhFUmFzWDF0dkU1ZHE1?=
 =?utf-8?B?STIwN3NSM3J5THRzQS9pU25XYjQvUm04UFplOE83bG1TMGxqTUtteTVMUTh3?=
 =?utf-8?B?dG1IVFpwaW5RLzYwK3dxcDZSMCsvMWhkNThGeldTMlVCR2RlQ0VLbkxXK25M?=
 =?utf-8?B?U0UwT29tejlnbDNmZ0RpRnlMUnFKNThFakZIaHd0RTFnSVVudmpBYlRMUy8x?=
 =?utf-8?B?MnhENDJVYWx3VDBWNVk1S1ZiSnBzajgvd3VETjdGZnRRcy9vMW9PMkU1czA1?=
 =?utf-8?B?WXJGSUZNZFJoZHJ0dGx3a3A0bXliY2NleXhabUpBSDNIZTFEUWRqbE1rMjVy?=
 =?utf-8?B?SXZ6WndFMFd0Z2NkMXRRUThUY1habWhWNDNDck90bzZlRXFaTHdWVXpxNTB0?=
 =?utf-8?Q?gYuPbI?=
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(14060799003)(36860700013)(82310400026)(35042699022)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2025 11:21:56.4327
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a0d7a68-0b88-477f-5cd6-08dda811026a
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5PEPF00014B99.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB8087
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 Jun 2025 11:22:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218345

T24gMTAgSnVuIDIwMjUsIGF0IDEyOjE3LCBsaWV6aGkueWFuZ0B3aW5kcml2ZXIuY29tIHdyb3Rl
Og0KPiANCj4gRnJvbTogUm9iZXJ0IFlhbmcgPGxpZXpoaS55YW5nQHdpbmRyaXZlci5jb20+DQo+
IA0KPiAqIERyb3AgMDAwMS1jb25maWd1cmUtZG9uLXQtcmVwb3J0LWVycm9yLXdoZW4tdGhlLXBh
dGgtb2YtUGVybC1jLnBhdGNoLCBpdCBpcyBhDQo+ICB3YXJuaW5nIG5vdCBhbiBlcnJvciBhbnkg
bW9yZSwgc28ganVzdCBkcm9wIGl0Lg0KPiANCj4gU2lnbmVkLW9mZi1ieTogUm9iZXJ0IFlhbmcg
PGxpZXpoaS55YW5nQHdpbmRyaXZlci5jb20+DQoNCkkgc3RpbGwgcmVxdWVzdCBob2xkaW5nIG9m
ZiB0aGlzIHVudGlsIHRoZSByZWJ1aWxkIHByb2JsZW0gdGhhdCBJ4oCZdmUgc2VlbiBoYXMgYmVl
biBpbnZlc3RpZ2F0ZWQgcHJvcGVybHkuDQoNClJvc3MNCg0K

