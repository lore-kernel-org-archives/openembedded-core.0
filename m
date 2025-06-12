Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 072DEC61CE8
	for <webhook@archiver.kernel.org>; Thu, 12 Jun 2025 10:29:54 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.66.21])
 by mx.groups.io with SMTP id smtpd.web11.9611.1749724186476140326
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Jun 2025 03:29:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=WoDwSoQD;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=WoDwSoQD;
 spf=pass (domain: arm.com, ip: 52.101.66.21, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=WfvA8YpVb8dBbvgx94TtQwSqhz3HK6FOIV9yUdr8EfdMXl7+1pWT/XNg2AGsm4NBuFK8O66ekL0WEz5bCMPNzRrwqN6hoR86yf7+wDyi6M55GfDQLxzXXW6xL+52TBpp2WjdzhndsYbp+tSBDNSzhgUxi9XUxedCumVEfpXtKuZCBC+I/vyjRB8Uo/QkT4lGt+DxxkkRP+y2fzvdelUCxIf8evp6ajbTB/8rUmL6f6RSng8Ja4e/mctFs1ieeTB30zyC1Y8sDHKQ+7ZNTxzn6k42pmi3Y9R6JLM7c6emWwM2Tt9x3dMXReQUBVyowGBAgQB8BHbmTTMY0p+38u3R1A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IktGCeurujDlT7vLgMFhBuxsY7hyAFi49OTW1AAfrQU=;
 b=hf09jH0EdG1L2zT0pQ/58IfOwdmezTRxhUWokKCpWLkMSn4+rssk9zZ8lz8RVwtTGesK96f7EWF2Vo1+liGZfupVTBG7MUhOAiP9fhByee8iG/P0SoS6a99DwIdvxCkAvwVOxYWAX+ftrNVJq3YyLsT3diuzS/qAvAdYn43qHOShGe83MYOVu9O22IsnIGj1YDiCf45WlLhVEpVz+abqTo+p6FItxG/KSezRSB/J1xshOg+RPcdqZq3TV/N2qg32MUKv4aKYeCIKzIvEZ6ZWQsoLYnzOA+0SxBVkgRFKpCnyih9DEpfJ0pyM+umPJ4Yen39WVeKM33FmfWxT33BGoA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=gmail.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IktGCeurujDlT7vLgMFhBuxsY7hyAFi49OTW1AAfrQU=;
 b=WoDwSoQDsHFY5xP2OV93vhi+MrYeyfa1GWzOYT/2SbO6YW1KHI23ysID9iyvhnvQ5lezBW3Ly6czxD9eLlI2F1VhfWta56A7PxoX/mUggTIr0bh/6M9bsXY4OH+MOwrCJB2E7ydC7tplmPwB4FH7Iq+JKZGhrxyIdIzyohb889Y=
Received: from AM0PR03CA0077.eurprd03.prod.outlook.com (2603:10a6:208:69::18)
 by DB4PR08MB8150.eurprd08.prod.outlook.com (2603:10a6:10:382::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.26; Thu, 12 Jun
 2025 10:29:42 +0000
Received: from AM2PEPF0001C714.eurprd05.prod.outlook.com
 (2603:10a6:208:69:cafe::c6) by AM0PR03CA0077.outlook.office365.com
 (2603:10a6:208:69::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.19 via Frontend Transport; Thu,
 12 Jun 2025 10:29:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM2PEPF0001C714.mail.protection.outlook.com (10.167.16.184) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.15
 via Frontend Transport; Thu, 12 Jun 2025 10:29:42 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=t12xZNSBXJ+g4+eVaLetFk/ElB9CH9pNVlL8NiimQ+LuUi3mUFajEDETh2pDIWFVEGmby8+wsh2wxA247zjraC5RplnmupGZKFDbGciClUhTpczl+7Ah9tLByXHccslahMiHrmxYA5S9JroJ98J94OS5hxwOGZmE8NLXMXxTZqWmpzyMB8eakVv4NEVMnMbJAmDszYNN9y0LNhB2kGOD0+XlVm6b1CSijUT/uDB4u/MJllxSGeDvyZ+b8P6tJENbyfIu7cHLPlUIcIxQUc+hIljUyVlVZVsXZkfwM2p1MO4F+tL7oxWsM5UiGlHKO0qpRZzZR8XzEojS61P3gVdV+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IktGCeurujDlT7vLgMFhBuxsY7hyAFi49OTW1AAfrQU=;
 b=BGHbA2wfXRlvNt/Zx5hN9/OKQ/L3cvDuFraMF01H8GUVcDLIJ2qbObVU2S5ntNXquWYB9feUL0Wy2Oqu1WRvbGPXclefiZy+qH9I5IqiPd2pVTkZZaQpyRapOs2HBUXrgoIbPl5i/tfocfQnaNAHf7SnBmME4DLOpylHlMc6zalfJ0qyxew5fw2gqbjcmrY3NLpHf5KHTYGyIFWerHv/WpGQDjoUz6+dHl+DCphPD9+VWeCrnpO+AI+0GsS1neNUzkdu4zQthBSIfP5vE4aTFSFN1HgH89cE80I6FUZJOBcjCp+Q8sjr76oguSbMgtRnlrItX0wd1TNwflKerR3BdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IktGCeurujDlT7vLgMFhBuxsY7hyAFi49OTW1AAfrQU=;
 b=WoDwSoQDsHFY5xP2OV93vhi+MrYeyfa1GWzOYT/2SbO6YW1KHI23ysID9iyvhnvQ5lezBW3Ly6czxD9eLlI2F1VhfWta56A7PxoX/mUggTIr0bh/6M9bsXY4OH+MOwrCJB2E7ydC7tplmPwB4FH7Iq+JKZGhrxyIdIzyohb889Y=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by AS2PR08MB8431.eurprd08.prod.outlook.com (2603:10a6:20b:55a::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.19; Thu, 12 Jun
 2025 10:29:10 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e%5]) with mapi id 15.20.8835.018; Thu, 12 Jun 2025
 10:29:10 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "skandigraun@gmail.com" <skandigraun@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] weston: upgrade 14.0.1 -> 14.0.2
Thread-Topic: [OE-core] [PATCH] weston: upgrade 14.0.1 -> 14.0.2
Thread-Index: AQHb1xS9aZxt99ZwLkGOvMgidXGjkLP/W3wA
Date: Thu, 12 Jun 2025 10:29:10 +0000
Message-ID: <5FC76FC6-42A3-4AE2-92EA-6A0CB2A8BDC5@arm.com>
References: <20250606185625.4087714-1-skandigraun@gmail.com>
In-Reply-To: <20250606185625.4087714-1-skandigraun@gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.600.51.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|AS2PR08MB8431:EE_|AM2PEPF0001C714:EE_|DB4PR08MB8150:EE_
X-MS-Office365-Filtering-Correlation-Id: 4e9f0956-ab48-4a35-d561-08dda99c0b27
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?NGdqd0JSTmNMZldNV211SmNNVzlnM0NUSUdIamJPR256ZllNK2RWcXZMZUhr?=
 =?utf-8?B?R1RjcmZYVFNqZVp6ZVVMMUpkNVM5Uk1UalNVN2d3cHl3UExIb3M1UGtpaUpM?=
 =?utf-8?B?TEtMUzRwajdsbWMzcThCaXQxWnRTUTY2OVg1VWtYRWdtd3htNWRyTHN0MXZ2?=
 =?utf-8?B?TkVRNVBpY3FHVmZ6RU5OSWF1ZU1ld0cvQk1XeWtRY1dUbjlaU0tZY2lTem1N?=
 =?utf-8?B?b0wwMUxTcVJkRlN5Uk5FcmthRFlQZUNDbjQwWXVYNkc5dEdxMU5vdDJ3alRi?=
 =?utf-8?B?RGZoTklCV2Vpa2lsL0ozZlBPNnk3bDVFZ3VJU1BFaEZva0Rua0tmRngxbHRD?=
 =?utf-8?B?RE5kaVF5cW92WFA5SkNoWWMrcll6aVFHaTBKNmZzWkxLVkptNUZRV1ZPWEV0?=
 =?utf-8?B?T2FoTlVqaFh2TFNHaUFMTHdGVk5oT1VLNU1MZkVGVEtDQXQvTFpHL2lrSXBJ?=
 =?utf-8?B?bmJydU1HeGdVcmZXN0RhRkxXcldVbVpNVUdBZHFpRjlraGZCTStWcXlKN2tk?=
 =?utf-8?B?Y1c3WUV1NHB5bk1WajRVU0paL0poU1Z3aUxRYUNrK25PaU9WWkZxVkFwUHJK?=
 =?utf-8?B?OW0rVXF0VytDbzVMRW5CSWRZbEdGL2NpcHFGTjdOQkZHcTR1TkxjTEgrTzdG?=
 =?utf-8?B?TDFxTEk4NExobmFPZ1RySTlXSlRHMHg5SEJjcU1JTEViSE52bEF2RUVyc1hL?=
 =?utf-8?B?M1hScDBRdGIxU0h0aGhPN2s5aWxCN2ZQRVE3eGVnU29yamxjOVcrS044ZVJQ?=
 =?utf-8?B?V1J4UnJhLytTQUNhNDlZY2FkSlFzcFREbUIvUjM1VGFLRmpRb1JFTmRnaXA5?=
 =?utf-8?B?cnhXL1E5djNpSTlPUnFBMU1Qamc4VDlBZzMyU0pQUmNrWjlJdXVneVBpKzRq?=
 =?utf-8?B?L045a3ZJWXRmbVhndkozTm1RVDdSU0ovQnMrVE9mdDZBdkpUalhMTmpRN0Jn?=
 =?utf-8?B?OHdnVHdTa2tIZ0dSRmx4NS8yN1NpcUYya0p5Nk85cWVPbUVzTlBHczQ0WHh2?=
 =?utf-8?B?K3dlZGZJT3pYcVU0MGRITFFmOVY4M29UYi8zaTd4L0NTbW5ZL0QrYkhqNnJO?=
 =?utf-8?B?N1Z1MlplRVY3bGxITFQ3UHc5RlFaQXI2TzF4OW1uQmxjbWE0blowTFRTSmI1?=
 =?utf-8?B?QU15RGlmamtpT3VtMXdqSHM3eTFCNU42Uk1GUzBOWE9sbUpSOHQ1c2JJbnNL?=
 =?utf-8?B?VUdKdXhiN0EyalRQSGNscm1QVmJ1KzBack9NYmdnMkYxb2tuZDZFdG90TUxr?=
 =?utf-8?B?K1NVKzhUSGRhUUtqZ2Z0RU0wOXVBNzNjek9pN3k4eGZBRWVWSHFBb2Z3TEhx?=
 =?utf-8?B?eWdhaVN2WmIzN2syRTM1akdjOXRJamdVdm9VMlV3UUREUW5GT2NUdUU0bWpv?=
 =?utf-8?B?R1M5OHNDZm53dVk3aU4vOVpaUWVhK05ZL3ZSbEw4RCt6bk02c1pKQ3NoMjRp?=
 =?utf-8?B?VTB3NXhjUEJMYU9hTjd0bVZVMXVpUFJHZkhHVUp2Tkd5anQ0SS9neUlCeEY4?=
 =?utf-8?B?eFNVcVB0K2wySkVLejVzWCtTNHl6ZVJFSUhkakxwVW5CMktNd1ZKRVJxMll0?=
 =?utf-8?B?bUxNV0FsWVZtVXg2RFJtWjRtRGRHR2Qza1BsMTJraEI3MEVRR1VPc2h0SDBT?=
 =?utf-8?B?NmlzWCs4YnNZUmxyU2F5UndnWHczRldKTDAxbFdTR0RRS2V6N25WT3JvTlZn?=
 =?utf-8?B?OTN2RC9NaExNbzdiMWFFQm5FY2dVc0cvQlRJckRhaVMrMG1hTU9CVGlqdkl5?=
 =?utf-8?B?c2J3OE5hWE14OHdBL3g2NTZvOXZJSGdtRStSTll3Z2hYTkt4cGZIL2RvNFY4?=
 =?utf-8?B?TGl0dkVROVlraUhNK1h6TmdMUzdyWlJHTlhmdVZVRVE4bUEvaTMwOGM5TG43?=
 =?utf-8?B?UG1LNjFPcjB6VDRFWDlxd0VPRnlFRENVd0d2Vjc3MGJ3RlpscVpGV0oxSm5W?=
 =?utf-8?B?MGxXSkNrWkpOQ0h3RVpMeHZSMDgrdmRkNXFBK3J4L3hsWkJxSDBHSE5NWUs4?=
 =?utf-8?Q?wsrCe/0AbCDB11bJq4J/uLWA8NvMWM=3D?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <30B5773F4FB081469067ED86A927B484@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB8431
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM2PEPF0001C714.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	6a1d1acf-07bb-4457-854e-08dda99bf80a
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|14060799003|35042699022|1800799024|376014|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?bTVKT2ROV2FJa09TVmRGOHlDRWNBVWdlSUkyMm90TjFpZ2ZRN2ZIWVFTYlZj?=
 =?utf-8?B?cFNCZzZxaG12SGJVa2gwaDFlZjIreDFSTFlyRHhKYmMxNG8rOHEyWmFQWDVZ?=
 =?utf-8?B?bk9QZnhVaXY0RnZYMzQrUHJJLzRVTW84ZGd3Rll5WkRWRnFzaUp1VjFoSzNW?=
 =?utf-8?B?WGhaQVd6SmtYNllHN3d1cUNqNVh2Z2VkQnFuRFRSS2VkTjliMDQ0L2pKQTlu?=
 =?utf-8?B?RHF1MFFEbnh0RWVJUnRSYVM2VkpDMi9jck5LZ3c2dTBERHFGVXcvOHh5NTZ6?=
 =?utf-8?B?THZvS0c4MWVkOFFOQ05nWHdKM3hTKzBlZ1pKSHpzMzN1M3k1WGJCUUdpZ0wz?=
 =?utf-8?B?YjV6RmpoMjZ0dUdyUUtLUGtRVnhuSUpzNEhrT0J1VTRjVDlTZkFOWlNBMGla?=
 =?utf-8?B?TzEzb1BtOGkzZ2h6TlpGSVNCeG1MNGR0ZGk3V20ybnAvMW5nQVdYdGhhcjZs?=
 =?utf-8?B?V2FWbkpScFcyWmVPWU8ydENaMlU3S3dnbm5Mc2pYanRMQm40NTBOY3MvMlBG?=
 =?utf-8?B?cXpNL1JuSzZSV3M3WVRNUk9OV1B4UEVudW1VTnloc3RYcWZXMEhhOHozKzlW?=
 =?utf-8?B?MmxRMVRITmN3Q0lpRCs4eElJaDRNRlJDN2dNQUo3bUU0UTBpMzhDV21VdkZF?=
 =?utf-8?B?TmpXNk11RVAwTEEwbG5YYjNSUElmSlBKdmNwdHl3aURNcElQVEd1NnpFR3FG?=
 =?utf-8?B?M2k2S1BjaDZrYUVVNjY1QXhKLzI0Z3l5K3BDMDNaL3NkN2tKeWRnazAyMGhE?=
 =?utf-8?B?N0FEYlF2R25PNVU5KzdUY2xQR3VIS2xsMi9wZGtVZDllVjJ1aDdqRnc0aEw1?=
 =?utf-8?B?K1pyTm0xaU5hbVpieHNSczFZcUM1RzVDOUg5RHdNQlB5VkU5RkZqdlFNbjJE?=
 =?utf-8?B?aGVSb2dWVTFVM0NYbHMxTitJRFp2WGJrS2xPdys0QlBaWDg3ZTZycC9sdWVs?=
 =?utf-8?B?cmhkNU03cHJDWXlqb0lPV2duOFpXQTBFa1dKZEMxRDhQVExQcFY2R3BYUEFz?=
 =?utf-8?B?K2NlWkppeUZBajdwVFBZRFRrTjlsUTdvZlBrWCttVnkrV3cwWFhMZkdVUGRu?=
 =?utf-8?B?dzRMbGtFR0IxcWlHeGFXN1g0Z0kvbmZYV2JQUEpEajJUbzcwbU1EVndoNHVS?=
 =?utf-8?B?MDlXa0dGSGswdWpOR3JOY1gzMXMyS1lxQmVIZlZnWEJid1UrNHV0SDR6KzZY?=
 =?utf-8?B?cVVwZWl6N1pmL0c2Y1A3Rnc3T2RQTHpmaTc0bkdXRG9nQWJRMU5JeXJYTUo4?=
 =?utf-8?B?WVVGNng1WmMvdllYMW5OVEFhVGpWUk1KZVVIZ1RLNWNpN3gzR2t1aVg5Y01a?=
 =?utf-8?B?YVA0MFBGWjBBMFlPTTRTWEJHekFlNjk5ejhqK2FTZStRZXZHQnN5NU4rTFda?=
 =?utf-8?B?S29Bb202RzZBbDdtN0Q5TkJocWNkVEx5OG5QR1RuU0ZqaU9pblhmbnFReW9B?=
 =?utf-8?B?YXp0T3BGbHZjdTY1VXNLMUprdjdFV3VnNStpU1h6UmQ1bFplZlplRnhTZE50?=
 =?utf-8?B?Qm4wdHdXRmJwRUtoSnoyaG9Jc0dxeWlFS3BNcVc1ZmttMEVtQ09KTWQ0cjVt?=
 =?utf-8?B?NWd4VElVcktSY2wxSCtiZmM5SzVaSEIwRm9kZ211YllCdnJMSmI2NkxsUWds?=
 =?utf-8?B?bVFjWnJORGVXZm5GclA0dDNHN2xFRWNBakh1KzlQanFWK3VVR05Ha2VZK2NX?=
 =?utf-8?B?TlgxM1laRWE3eE1vNVRyOGZocDBqZ1lmRTdUaGVWUGVBRlpuYzlrSlNqNWYw?=
 =?utf-8?B?UDlhWS9Tc1lTcjk5WHVhMkNvVmhhOEZteXRYdUw0bGZmN2dVNDZJMDk1RlQy?=
 =?utf-8?B?VTR6TTBLM3h5YUQ3RzYrT2JxVnB1UGVkQUgzdW1YanBrZ2Y0dGYycmx3Y2wz?=
 =?utf-8?B?WTBZYUZBNVk1QmpCczJZUk1aWDRxSDROSHAySmNPRS91TnlKUStiNzl6TXRr?=
 =?utf-8?B?dXF3dG1NYWJZTzJ2Yy9mMVJFQVY5QkxLMzNleDdadTlLc0VLRkE1R0ZxdUdF?=
 =?utf-8?B?V3JzeVNuZmVvZEdYenppTENwZWQ5ZUM2K29wajlxeTl1WVZCWVprdU5KdExi?=
 =?utf-8?Q?T3OvmB?=
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(14060799003)(35042699022)(1800799024)(376014)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2025 10:29:42.3310
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e9f0956-ab48-4a35-d561-08dda99c0b27
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM2PEPF0001C714.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4PR08MB8150
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 12 Jun 2025 10:29:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218503

T24gNiBKdW4gMjAyNSwgYXQgMTk6NTYsIEd5b3JneSBTYXJ2YXJpIHZpYSBsaXN0cy5vcGVuZW1i
ZWRkZWQub3JnIDxza2FuZGlncmF1bj1nbWFpbC5jb21AbGlzdHMub3BlbmVtYmVkZGVkLm9yZz4g
d3JvdGU6DQo+ICtQQUNLQUdFQ09ORklHW3ZuY10gPSAiLURiYWNrZW5kLXZuYz10cnVlLC1EYmFj
a2VuZC12bmM9ZmFsc2UsbmVhdHZuYyBsaWJwYW0sbGlicGFt4oCdDQoNCldoeSBkb2VzIHRoaXMg
bmVlZCBleHBsaWNpdCBSREVQRU5EUz8NCg0KUm9zcw==

