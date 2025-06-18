Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6E9CC71157
	for <webhook@archiver.kernel.org>; Wed, 18 Jun 2025 09:32:05 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.84.61])
 by mx.groups.io with SMTP id smtpd.web10.3261.1750239120836643197
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Jun 2025 02:32:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=cQmJoCGB;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=cQmJoCGB;
 spf=pass (domain: arm.com, ip: 52.101.84.61, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=rlj+LQmQjBayBfHs5F4fQ2m8BdkXFDetd1lyzZDlAr3FhjAg/97SF0mQN73Jr5fAHOzPGvbSvvCW7tHEWouYg4CggEy7iWtLxau3PM7aXyiP0UzM+lhvLYE9RKpSsbt960f9tdvJkkfdcZ0MyIur7Wxsb9whodyVjEcR3rmJguU20Off4zj+jHJplbVPPiO82NEgH3wmSdqjgBm1GJD6zUpnODskOXxnz1rcMegV1g9O2c4CfWEt083GDO6nXA3nMiAlKrV5d804cMe/ygICBlMazN0n3V4hM94Qz+BvmlZ/0B5U83AFgao0sbIEdEr8mnkfFQXL3sny1h9DCCRktg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YV/TGtI/8AhrTabsj2OJH0DNw+7DlvVDuYrzFqZfHdI=;
 b=IN7lgtXX96ChKfT5aILiZlkuyILMpNFuOEkoLWbEkeX3eEjtfgOs4AeAWYiAiz9DDSOQ46EjiZhyRdbbySivPSJ3rjkJbEYjrQHqDrbQQPt4CJqtYSelkSY92obSmq2wqklmBTjX+WVGtt1rAWc2dAowSAqtAJwbuqJ7apV62Pj/fKYzQIRn+++9bwNPsNaeT886PNYNo1z2bJEpkIQmPMc5mQSaRXYurem7hZMk/x1aZxaRmSyZfIR7ykUcb9vfyEccyx2Ov3bo+aE6zRqlMWlzmJiAnUob6HFSwvnS9BwpWRY1X7DeO74VORMOyTBZzopeR/NHigXWabGPuazGbw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=eng.windriver.com smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YV/TGtI/8AhrTabsj2OJH0DNw+7DlvVDuYrzFqZfHdI=;
 b=cQmJoCGBUhQcUuhP4m2lvczlcI44ox/s8b/Tj/BpyufjF+zT6dSP+3Zw1aGEqcDw5p0XLOtlHe6PlHHwoPpVIw06ovup81TEr4qlj/QZ7bV0JJVbRWGrlO6psqfLwYPL104JsxUdmdTDTjmuhI9422wU2N9+BazzTC0VcFi3UOk=
Received: from AS4P192CA0021.EURP192.PROD.OUTLOOK.COM (2603:10a6:20b:5e1::15)
 by PAVPR08MB9652.eurprd08.prod.outlook.com (2603:10a6:102:31c::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.19; Wed, 18 Jun
 2025 09:31:55 +0000
Received: from AMS0EPF000001AF.eurprd05.prod.outlook.com
 (2603:10a6:20b:5e1:cafe::32) by AS4P192CA0021.outlook.office365.com
 (2603:10a6:20b:5e1::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.33 via Frontend Transport; Wed,
 18 Jun 2025 09:31:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AMS0EPF000001AF.mail.protection.outlook.com (10.167.16.155) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8857.21
 via Frontend Transport; Wed, 18 Jun 2025 09:31:54 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JOV2x6Cq3maheN2GYxnoL3dCnBXgCj0ioE6eJu+y58e3tlecngSQPBnmaf+FmRbFiKOIPFODsnzMQ42quMspZCHMcrYRe6JUqpC78zg853cw9SSpXOEU2W3FC/c4GzSZhTD2MCj0HvYXo5bh8kMRRQY6d12txeMMpPi2ZJH5uM6JJ5kzHeZYQ3E876gic3tYbIgX/c/QBntTjnBR9tN/xUaqTMbKt8IVOL69hoLLYAKwN0uf8FVOAbHgDHA3gw6iDfeXlFmK50IkgoyiX6wcCC7bIze2PYbVxHBjLB+wOAh390WuJe+PTzuzxbNMkC4KlRpWNE91rjbZbOlVGTdYEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YV/TGtI/8AhrTabsj2OJH0DNw+7DlvVDuYrzFqZfHdI=;
 b=tvXL0p0+9Cpga/ZSqs0T2Z3nwrQBF5yh2EcYAjjKxvsaHsKcCCRgFDCL7LDiFpn0hMy03qmAyydG53wS8tOIQDk7MxEHSuLpMHAn0P4p2lfyMO8xB87RW+2rThyZbosVBML6B6QSTVes2iZEdGmp/Nj5KGvekEDDqjv06sa/Utl00IAE0IUxFJvZi0A4bMkARetbXOscvYm4xV5JUxdE4A4wCLcCK2y0AoXQ/uJjUpLpAa14DFlbCOq/WNsQU4xMUWJaL7bzvBoS/1Md+H1zMq6nm4DGAermSSMY8Oj910QzFFi8LBP3dbSnDq97YR0gNK5y1+YejQRDvXAXnrpFbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YV/TGtI/8AhrTabsj2OJH0DNw+7DlvVDuYrzFqZfHdI=;
 b=cQmJoCGBUhQcUuhP4m2lvczlcI44ox/s8b/Tj/BpyufjF+zT6dSP+3Zw1aGEqcDw5p0XLOtlHe6PlHHwoPpVIw06ovup81TEr4qlj/QZ7bV0JJVbRWGrlO6psqfLwYPL104JsxUdmdTDTjmuhI9422wU2N9+BazzTC0VcFi3UOk=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by AS8PR08MB8874.eurprd08.prod.outlook.com (2603:10a6:20b:5b8::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.29; Wed, 18 Jun
 2025 09:31:19 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e%6]) with mapi id 15.20.8835.027; Wed, 18 Jun 2025
 09:31:17 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "hongxu.jia@eng.windriver.com" <hongxu.jia@eng.windriver.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] image-live.bbclass: support to enable/disable
 isohybrid
Thread-Topic: [OE-core] [PATCH] image-live.bbclass: support to enable/disable
 isohybrid
Thread-Index: AQHb1idqOW253cFBFkenGTpDPSTUErQIuyCA
Date: Wed, 18 Jun 2025 09:31:17 +0000
Message-ID: <10C273CD-2737-42A4-9061-22C1E4A4B684@arm.com>
References: <20250605143728.4000790-1-hongxu.jia@windriver.com>
In-Reply-To: <20250605143728.4000790-1-hongxu.jia@windriver.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.600.51.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|AS8PR08MB8874:EE_|AMS0EPF000001AF:EE_|PAVPR08MB9652:EE_
X-MS-Office365-Filtering-Correlation-Id: 20e34e84-7ab8-400a-960e-08ddae4af6a2
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?Mnp6aW54RmtRbGNobUFtQldkNjNaMXNkdnhSVWJCYy8wQVBUbGRVS1dnS1gv?=
 =?utf-8?B?SHJDRFNKNXZUdW81U1FscXJndFdFZ0ZpRmcwNTlGL3kwZGhUZXhyQmJ1WVVV?=
 =?utf-8?B?eE56cE9RNXhsZnZkclI2MFpOcDNEaEEyOFl2dlhSRzBMeDRNNmw3Uzhrcm9T?=
 =?utf-8?B?cU1TWDRjbFdQRmU5YkR6RVZHVW9SejhHOWNBUnhVVFk3b1RreHJISTRidEZo?=
 =?utf-8?B?a2dheTdjVTZLbEQ3Ni8zY3gzZ0lxMDZXdTRNaEZIb2N2U3JyK0xoMk9Vemgv?=
 =?utf-8?B?Q3BrYm4zSkZBZXJvTHd6OXJqMmVYT3g2anQ5WVFHTmhkejlIQTN5OC91Vm5F?=
 =?utf-8?B?bG9LdXh4b2FtdFp6VnI0aWFPbFdDZm1KL2xtckRWM0dZajg3UWtrZUJRUGNu?=
 =?utf-8?B?bzZGWGswUlh0MFAvdTBYY1U2dE9FN2QvRW5ZcjhTdmt0cWU0QlNoVUhBZ3RE?=
 =?utf-8?B?Znhrc2t4UytrbE02aFc0OEFlNEZGeDd1cmpocGVLZkttK1o2eUtLMkJiU3R0?=
 =?utf-8?B?dmozR1ZkM3RyUnk3cHY5dDFrVXR6VGJ6L0hHQ1V2U09HV0FxQmR1R0xhYzFR?=
 =?utf-8?B?VXJyNXp4SFptNi82czdRN0xUOGdkNjRuMGp1U2VCOWxZMmwwaVRsb0JETFdj?=
 =?utf-8?B?dGRsb0p3UDVZNG1Md2U1aUt4dEhOTEhkQTB5a0MwV1VOVm5yRkM0YjFsRUM3?=
 =?utf-8?B?Y3VsK1JmU0k4TVlCKzFZUkFpdkphZ0lNYW1YRytZZTcrSXZKZlRnVytGaEY2?=
 =?utf-8?B?dHF4YU9TOXVMbU5oL05KK1liWjl1YUh1OFVhcWkzb214dFpnbUdBTVVrM002?=
 =?utf-8?B?Q3E2eGFqUzg2UjNBZDRPWmpJb1dqb2dSNFh2THF3bzBrTWJkckdua1BHRjVa?=
 =?utf-8?B?dDJGRUg4NmxFZ25nQWtpMThVSnJ6c0RkT1dsZU9HS2RHWlhsdHdRSUQ0UGUz?=
 =?utf-8?B?NG9MM1hqZXJNMnh5QmpZOGQyWFdUNHY3MUFHaHU4YzRFR3FZa0pyUXg4eHN5?=
 =?utf-8?B?NEtORC9RSDd3aVhwY3B3aGlXd3hsdU1lL3QxM0NCN3lJNklnNDNDSXFCamU0?=
 =?utf-8?B?VHdWMlpQSEhTZGJYaTJjaS9zaVZRTi9sRG5QaW9ZVHNPODRxeTFQRDhLSGtM?=
 =?utf-8?B?YmIwMGNLUXZTaVQwZ2VIMjFMUVBJays4MjFJdm44aEpSTE9lRE9GLzIzVHQv?=
 =?utf-8?B?SXJKUkhpVFBYa1NUclRCV092Q0R3MDJZY0llUVdobm8zRGlNVGhKRFFuN3VL?=
 =?utf-8?B?SGxGL2k1Qk9YdkExU2htT0tZNjBJTk16QkpTWEVwSTduR2tTc25KcFhWTGJu?=
 =?utf-8?B?MkU0TzZEcnNXbEs2YzI2NmtPeEFtOXpxQytyejZOc1h3aWdjWThETVIweTJt?=
 =?utf-8?B?VHEwUUtRWUdBWnhXeTY1RXNPTk96WnRsakg3WXZsRG0vamMrOG9Yc29FSUJH?=
 =?utf-8?B?UWt5NnMzalFCelBMcFlJUDVpVWtpSmN1SXk4bXlqUUVad2pOT0w1SHJOeDNq?=
 =?utf-8?B?RFFGa3Nka1IvODVZcld6SVBMenNueTU2QVRFbEJEbU9iUW00YXJUWWQyQUQ3?=
 =?utf-8?B?MHZ4SUZNR0d0YlRKenFIKzBadWUwNk50ZGdzODdwdFFGTU9RVU5ZaStydFJG?=
 =?utf-8?B?UXhwd01lRVNwc1JJOTVIZDR1dmVaZTZxS0hldDVmeDNZVnhXS0oxTmNCQ2Y4?=
 =?utf-8?B?R2xPSUxaUGI3TE9KOGttK2ZrR1RVT2VvT2EreTVJZEJEY1lXQ1ZqWGZnSUQz?=
 =?utf-8?B?UUV2SlNRZlIvVDR6NWRmdlZnRW9rdkpZN2lKRUNyemMzcDlNZXNteUxIYk1a?=
 =?utf-8?B?ckkxaEJ0V3ErTnRFQXFLWUVEUFB0Rld3THErTTd5WWkwM0pUM0lmL3VKdm5U?=
 =?utf-8?B?SDRrYm1GTlZzQjNJUDYyVUxNUnVzK3RkNHdDRWhXbzV0REZZYUlDaEFrZ05Q?=
 =?utf-8?B?R0lYbnJMSGtEL2k1V1NsVTVSbVhuN2h4Qk1CZXA0UVN3K29SbXNNR1VBbkcv?=
 =?utf-8?Q?NgY2EwFbih72JrPADmy/dH4UCTjCGA=3D?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <CB77315D709B204280EDB259F6723474@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB8874
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AMS0EPF000001AF.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	b2f3f71e-bcce-45df-5123-08ddae4ae083
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|35042699022|1800799024|36860700013|82310400026|14060799003;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?UElJL1pKWUkvdVlCVFdVOTRHUG5Wck11WVJmUTE1Y0FjbFBNN1kzTlpmTFpk?=
 =?utf-8?B?Z2xBNHFUU1FSeUJGMGRuMTNxZ2o2eForZ3J3S0grS0ZMNm4rTWxhbzRLLzlS?=
 =?utf-8?B?Zlpadm51Nmt3VUNBR0Q2VVNkNmNNK0VqeGY0YUhQOExvbmVwZm9JV3JwWDdo?=
 =?utf-8?B?ZW9VUjF2ODlhdURFa1FnelhXUmtnYmd3SThrVlQ2ejdzUVJxWmVmSkZjMXg2?=
 =?utf-8?B?RnNlZHNiOGZIRjR2VlE5djZDVmlyVWNrT0NRTlVrdEpBV2xETE93bnhUSDJG?=
 =?utf-8?B?eFQ5d2VrUjJyUE04Q0RiWmJDOVpDYm5zTmQ5M0psQVN1ZDlrSXpjWlVmREhS?=
 =?utf-8?B?VUNyUzUrTktmYzdadmlUcitpMnZuOEhnenljaXhLRFhhdU1DR0hKNHVxbzhC?=
 =?utf-8?B?YndMYytPOFBrcHNDL05JUVc2OEtFTkJReXBHUFNXVkxnL2RacjRPbVRJOVpx?=
 =?utf-8?B?RE5XZVJDOXdWMTBVcVBkZkFJUW0yUlpjb3lsK2FSSTRRaWFacG43bmpwcTZS?=
 =?utf-8?B?ZlBPMGpOWFJKV0I4N1VRMTJ2cUxjdWx5U0ZOUGhvL1V3cjlSM0xDWXZ5VFlG?=
 =?utf-8?B?QW1waEdBczRpUUc3b3ZPYmM3MTJMNGZvZXNRSWoxMEs3SHJVazQvNjhLTUpq?=
 =?utf-8?B?eVdjMWNQUkJSYkxjZnVOR3FhbStHL216R1psU01NUXFwblVHOEgwdnhXNEtE?=
 =?utf-8?B?NGJXMTk4L0FwL29OMDllcjNpSmg4dkFJc3p5WkVxREp2eXduNEtCb0Z3Y0tw?=
 =?utf-8?B?Q3FTcDZFMzM5R3I3czBOTUF1RkNscDgvaFpTTmZBMU1UQk90Sm91YlR0S2Ri?=
 =?utf-8?B?NkxJODNTK2xvZ1RzWEdCUXd6V0t3bGpIU1YvcUI5elpDL2Q0cEN6ak1YYzdQ?=
 =?utf-8?B?bkYwT0ROczlYcjVheW84ZDBqSTMwZ1pQMzB6ZFg0dUxzc2NEMHZ1bEk3YytZ?=
 =?utf-8?B?b1ZubHhzRXpEczVEeS9FeDJMOUp6R1JDWURRVGw5bU1pZ2pVNkhTcTdTQzFB?=
 =?utf-8?B?blo1UEIzSUhIZGlKcG5JNWVjbnVZVk03a0VXazExZWtwZloxQXU4SDBUNmw0?=
 =?utf-8?B?NmRCTmp5QTlLWWVLUGxZM2xzVFBuQ1NBdjZDSkxkMWxGYzBiZi92UUxHYTZX?=
 =?utf-8?B?Nlp3NE5ZMzgxSWNwK2hCc2JWWVhRUUg0MXJuSXNlUm9jallXbWxVQVhYNDE2?=
 =?utf-8?B?Y1RKdi9YYlBOZCtmb0ZqcW1uU285MFVLM3VRa0RDQ1NqR0w4a05EYWtXZ29C?=
 =?utf-8?B?cUhzS0ZuS1RrR1U4VWQ5bDJPNDN4alNSR0o2RVIxdDYrNXVYVFZZcjZnQTJE?=
 =?utf-8?B?Q0lMWEFDcTJvc0JuTHBzY2E5RDgrNjI0b3RpM0RHeXU0cXZhS2hxZjlQK2F6?=
 =?utf-8?B?Q0MvaFhHdkJ6bG5ib0JiV1VySStzNXY5K2VFYzJtZEN3Y2RzUzhSM1dyRVFH?=
 =?utf-8?B?aE9FZ1FWWE1OQVJLc1FyeUptNkMyV1hLMGZWOHBpNkR5N2Jkd2RMTjF2Mitt?=
 =?utf-8?B?b1o3d3l6RVBRV3VpWUdiak8zVndvL2ZZc01IOHhjWGtMbGJHcERlMi9qbzJh?=
 =?utf-8?B?T3V6d3ptVVVnOTdTb2dBQmhJUTZUN2FGSUR3OWttc2x3VkVyUW5RVGk3Wldl?=
 =?utf-8?B?SXk3d01ZQy9DM00zOE9mcEdkZGxQbnhYVk9LMFMxOGR6d0R2VWVrRHFxejNK?=
 =?utf-8?B?MXd2L1VQYmowQmdXY2sydVJuRkFGcXZwaFdJTVgyTlkyZ0FsR205allzTmUw?=
 =?utf-8?B?OFlYVDlYU3pWMjViNk5ZcjhaVkFPY0YyTENkU1Vmc1JaRklmcXVHQnhWejlB?=
 =?utf-8?B?Z1ZvSS8yZkpER2d6emlzK09EUGxXa093STMvbCt6YXNFVVZ2cGFpMi9GM0Fx?=
 =?utf-8?B?MjI3Tk85bHdTMVBkNlgvQ29NVjFjSmg0bGhZSDV6YVduemtUUWJIamlmZTQ1?=
 =?utf-8?B?VmxLNjhtR3dxNUN0OUErQm15WHV1bExsQzU0bmk2T3dVWFdpMU9sWUVQZWtE?=
 =?utf-8?B?Sk5BMUEweHRjK2svVDFyZkNFOGZ0dWZEMHNCUjF0ak51K0Fmd2QzcThUYWo3?=
 =?utf-8?Q?c9xdQP?=
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(35042699022)(1800799024)(36860700013)(82310400026)(14060799003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2025 09:31:54.4718
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 20e34e84-7ab8-400a-960e-08ddae4af6a2
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS0EPF000001AF.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR08MB9652
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 Jun 2025 09:32:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218988

T24gNSBKdW4gMjAyNSwgYXQgMTU6MzcsIGhvbmd4dSB2aWEgbGlzdHMub3BlbmVtYmVkZGVkLm9y
ZyA8aG9uZ3h1LmppYT1lbmcud2luZHJpdmVyLmNvbUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnPiB3
cm90ZToNCj4gJCBlY2hvICdNQUNISU5FX0ZFQVRVUkVTOnJlbW92ZSA9ICJwY2Jpb3MiJyA+PiBj
b25mL2xvY2FsLmNvbmYNCg0KU28gd2hhdCB5b3XigJlyZSBzYXlpbmcgaGVyZSBpcyB0aGF0IHRo
ZXJl4oCZcyBhbiBleGlzdGluZyB3YXkgdG8gZGV0ZXJtaW5lIGlmIGEgbWFjaGluZSBzaG91bGQg
dXNlIGxlZ2FjeSBCSU9TLg0KDQo+ICtOT19JU09IWUJSSUQgPz0gIjAiDQoNCkFwYXJ0IGZyb20g
dGhlIGxhY2sgb2YgZG9jdW1lbnRhdGlvbiwgd2h5IG5vdCBqdXN0IGxvb2sgYXQgdGhlIE1BQ0hJ
TkVfRkVBVFVSRVM/DQoNClJvc3M=

