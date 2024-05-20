Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1EB4C25B79
	for <webhook@archiver.kernel.org>; Mon, 20 May 2024 14:03:56 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (EUR04-VI1-obe.outbound.protection.outlook.com [40.107.8.82])
 by mx.groups.io with SMTP id smtpd.web11.61824.1716213829718825940
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 May 2024 07:03:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=XPSkVyay;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=XPSkVyay;
 spf=pass (domain: arm.com, ip: 40.107.8.82, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=Jvt6EdQM3aft1mbo4DmZ+Ex9CySE/H+w+/UWN50ZsAvaUvuq7aVJtsEJvs3/6r5SJvPxgYC2UPWe7rwGYGOnZkvY9vZ1JBAxWPsUMlMqZCE9alK6HV7HdHXeVaILKc7mr4vzZozhvi5iVOTsoMOSv5AJVHpKX74OtNl/zt9bZ9vh318qQAFmlD4PsCxHBwhTKwgL/YQ0Fd5vxKtPy2/fThQp1LZ+nn9GAY1/Pd/d6W/2b5tfGPyXyvfE6BeLVmpiVESowSwVPiVErlcjw1qoCZvFLzqP3nR5q2TEZI59Id81GPNqoDKWp+rTwDmaqrAw84Aa0UmANoMFq2Oqn/NT/Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h4KfuDTS7G6w7/0w+nn3K82d3rovvtJJrBQbFGtj8Tg=;
 b=R5eRCqYUsdmOIc6gx6hoQlWWBboyAdfxNLKPQanxGgIAXOMtcGUthipnP6kljAZlEfwkfK3sS5xklQnIIEDbFAfFiFogaQN/YNybKEf8lHoozXFdrNlpqEkrGeIklZjZljiaMtygU68fjML147RsagGlLL567HnhLYlCWur2xgYYQ1TbUNjRopuaIL2WZaiERJJjGk7pgkLj3T/TdotWecD3nE7pqVZNzir8eipJl6Dl1WaVAtDMHz+PnNASphuuT2Tu/6UCQNv8UfAz+uUSAbfWhlaSL5TVvYZBvFJ1Y4jg2hrWsi/hbVrvr9xsR4TMkYZI6LhRzxFgqtbmWdHG8w==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h4KfuDTS7G6w7/0w+nn3K82d3rovvtJJrBQbFGtj8Tg=;
 b=XPSkVyayS/vle7l9i9fUcrUOmvrtMwjxc6eFgcHbLukvFcN8j6x1FJRDIiUon2jFt5iFoiDEu0ofaSFt6waPU8kqE3E+T5n/16tbON488iHNam7oVl6E0UL5Ca7n3McxWd4p7DGXo6yYu3SFyjs+4WcmyzXSxccvVn4XdtSrOlQ=
Received: from AS9PR06CA0088.eurprd06.prod.outlook.com (2603:10a6:20b:464::33)
 by DU0PR08MB8664.eurprd08.prod.outlook.com (2603:10a6:10:400::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.35; Mon, 20 May
 2024 14:03:46 +0000
Received: from AMS1EPF0000004E.eurprd04.prod.outlook.com
 (2603:10a6:20b:464:cafe::ab) by AS9PR06CA0088.outlook.office365.com
 (2603:10a6:20b:464::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.35 via Frontend
 Transport; Mon, 20 May 2024 14:03:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AMS1EPF0000004E.mail.protection.outlook.com (10.167.16.139) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.7611.14
 via Frontend Transport; Mon, 20 May 2024 14:03:45 +0000
Received: ("Tessian outbound 082664cc04c1:v315"); Mon, 20 May 2024 14:03:45 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 5efdf94a23e8bc1f
X-CR-MTA-TID: 64aa7808
Received: from cbd8d3fac1c2.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 22DFE747-3EFC-4D3D-B84A-5516F6A7FEBD.1;
	Mon, 20 May 2024 14:03:38 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id cbd8d3fac1c2.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Mon, 20 May 2024 14:03:38 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dvDcBdadQAkzTTnr6xOzszwWQIXVOOTC3PilGbtAbf1v2URvFPDJk4tJkQcpuzFlRNB5L8u99uEro80ElWEz5sORiO/xHoP8WktqETLGGbEyJe98PTcxUkt1CmvE0HuaA/c1T0/Eh7mW6lvrrWVnSvW32DL2y/p2/U7x1v4kxh8smlZEOzDxmmanVoGrc3ipll64GFX27c8qukqvEMXj3hJDx0DxcckrJVsbC3yLr910HEOvf10XIPAlZuwrEThVlej2E3IC0RCgNpTo+NMXq5WmVjOb7m4jQNmaMhrJWhyTV6OdXb+7wSWr1WbeXb9GWdd3SOVdQ3o4ay4nzw0HDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h4KfuDTS7G6w7/0w+nn3K82d3rovvtJJrBQbFGtj8Tg=;
 b=NymgzMhfMXReRPSYiboXGQaftwnIrmtEVWg0z8y9Jpvg895eAqhmWM0DwRKVDhGH1340PA9UwwZM3WbhRSIuokut8K6ahHz3Bo0Vd7TJ9xYxh5od1V6V0owp/57MXksvEXTdo2g2regs0ji24lCS98qCffo49uiWrTjCV1v2Ec4CGKwjsnykVI8jWwIIo2AUbESnXxrgF1ZJ7j2KZqO3+FtUMGfOihrrVvdFk1ryEojGLtLZDvdHybr6kCrEBWoEZUhHQvZ4YDKwJbh03bMiYz7L7H4avRmn6XSdj9qEgOIpGK/YvslDHAhQ5QSuc+E20SSV42PzfrkUAeyhr1vPkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h4KfuDTS7G6w7/0w+nn3K82d3rovvtJJrBQbFGtj8Tg=;
 b=XPSkVyayS/vle7l9i9fUcrUOmvrtMwjxc6eFgcHbLukvFcN8j6x1FJRDIiUon2jFt5iFoiDEu0ofaSFt6waPU8kqE3E+T5n/16tbON488iHNam7oVl6E0UL5Ca7n3McxWd4p7DGXo6yYu3SFyjs+4WcmyzXSxccvVn4XdtSrOlQ=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by AS8PR08MB10004.eurprd08.prod.outlook.com (2603:10a6:20b:63d::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.35; Mon, 20 May
 2024 14:03:36 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e%4]) with mapi id 15.20.7587.030; Mon, 20 May 2024
 14:03:36 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "emil.kronborg@protonmail.com" <emil.kronborg@protonmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "rasmus.villemoes@prevas.dk"
	<rasmus.villemoes@prevas.dk>
Subject: Re: [OE-core] [PATCH] gtk+3: add gtk+ to CVE_PRODUCT
Thread-Topic: [OE-core] [PATCH] gtk+3: add gtk+ to CVE_PRODUCT
Thread-Index: AQHapS2lNZ2FPoCDh02I5ZQNpdW4k7GgMpuA
Date: Mon, 20 May 2024 14:03:36 +0000
Message-ID: <2F8B609D-6E81-4A72-8751-82B3888BA4BB@arm.com>
References: <20240513120320.73922-1-emil.kronborg@protonmail.com>
In-Reply-To: <20240513120320.73922-1-emil.kronborg@protonmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3774.600.62)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|AS8PR08MB10004:EE_|AMS1EPF0000004E:EE_|DU0PR08MB8664:EE_
X-MS-Office365-Filtering-Correlation-Id: 254650af-4d49-477f-b02f-08dc78d5aa25
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230031|366007|1800799015|376005|38070700009;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?TFpNSnFPTUJmckM2ZG9vUXRFOUlMWVlHWW1ZOGtUTFptdVVyRXkvUDdkQ3Fy?=
 =?utf-8?B?eHd5T29YVTBlUTViTzdMUitMcHNnV2RocTlodFNENnEvUXZuZ3pGREZiYWx0?=
 =?utf-8?B?WldZejFwT2d3clIvU0dMSXZ5aVhSdFA2STFISUxuR2Z3ODBCVXNkYytPY29y?=
 =?utf-8?B?N0J0czdrZndUQ2E0aGlraU1GbFFtNFlwL3JGUjU0N3NGanJONzdvbGV1VDda?=
 =?utf-8?B?V3pjMFdBOTk1WDFGai9TV3hKN1N1NXZSRXhqZ1RDMkxQblV2REpocGY3eC9P?=
 =?utf-8?B?VG84NEc3RmRDSGVRVmpNQkk5VnpDNi95SVZFSjIya2VwaEp6d3lmSEFPNUV2?=
 =?utf-8?B?cFhNMzgxc01OOElaaVR3MnRTeWovRkdmY05NeFA0ZTg4L3NyYXFOMGd1UHV0?=
 =?utf-8?B?YXBWUDJibXBTT0lKSWZNYnBlbGlVUzRJcjFkSklpMXIzWjJ0NUR4a251Y1V0?=
 =?utf-8?B?Mi9nQXpGMVN3VXhRcnhHUmxMSGNsOXB2bW1OK2hqRi9reTNFeVMvUEtTQURO?=
 =?utf-8?B?Zjg0YzdydmVsZnFhdDdUUkhBc01oTUZPV280VE1aazdCcGpXMVh6RzNKc3Ux?=
 =?utf-8?B?dXEvQzZnUGo2cUY1VElKcXpVWlJjRWVOd1VZZ3g0ZGpFV1o3ZUxqV3lGQ3Nn?=
 =?utf-8?B?djU2UEdLRHoyNUZiaE1hOVVRRVAvcDgxSyt0cWtUYjJMTFdaWEcrcnkxdjdL?=
 =?utf-8?B?NysvMGZvYk5VUHg2SmxsZjM4Ui9nSUsxSVg3RzNxZDZDVy9pYlI4bkt2U3V2?=
 =?utf-8?B?b0tOVmM3cmM5MWd5cUFtMEFsamdaUzFtMHoyTHdsMnovWXJ4T290QkhsS3Nz?=
 =?utf-8?B?SlA1VWhWUXJVT05vQ0hxOEplaFNXdi9BMnBtZWFXbWMvRU4zekNrTndJS2o4?=
 =?utf-8?B?VytRdmZRV2Q5MWZwemZuS3FrdGkxQkFpMGtPeXRuQjFjKzd4Z3pQWHhYMEdK?=
 =?utf-8?B?cE1VdENrbWZPMDk0N09hSDRtY0RScDlQTkF4bC8yWDBBZWZkdEwzSWdjcVdE?=
 =?utf-8?B?TloyMENidE5ZU1JqVnZzY0FVWTZ1cEU1dnlKV1lkc1h1SEoyc1lzamM3dXZJ?=
 =?utf-8?B?dGRHOEdmUzdlMm1OM0lleE9xM3llK0tOcjI2TXpLQnkrbEhBaVVGUmZVTnVT?=
 =?utf-8?B?aEFlREpUSENWNlZDMVJSb0o2d3RTMlBYRnp1a0kxREx4cFA2MTY1amk1RFI4?=
 =?utf-8?B?U213MnVvK05KWmlNdGQ3V3ovN0x3VkExam1UVzFsRTA3WFBMTmVsM1NYOVpN?=
 =?utf-8?B?bGwyQWRBVlNTK1N2NUgvVFEvVmd2Nzd1TXJheUxKK0w4QkgvcklQM3k1SDFQ?=
 =?utf-8?B?MktPbWp0ZG5yemk0L3Z3MVZIMzZGWjNCMG51Yi9aVzFLeHhQbWM1bGN5S3Fw?=
 =?utf-8?B?MUpMMTkvOEZNU29zUGVWenZQN2tKVE9WZ0t1cG1hdmV5ZkFPa2dhTW1BdVBr?=
 =?utf-8?B?MkpGWGtmWXFlbnlqZU5uS1daUkhkS3hpY3VmUWJ2QXlxL2Y0OFd4cUw2SXNX?=
 =?utf-8?B?QXVjdktYMWhpaE1HVGhkZDRTa1diY0VwUDJIQ3VBM1ZUeXdUYzhWZWpCS0k5?=
 =?utf-8?B?dXNoYzh0c2w1aU5pdVBGS0NPbG5SN00rVG5TRjE3WXJqMlNpdlNSbkhvNGsz?=
 =?utf-8?B?Y2RTdE1meXUzUDFPN2FzSmVUYzY1bVpRVjJGRmxxREFZOFpGdjVmNGorZ1V3?=
 =?utf-8?B?K0Fzc3VxMm1rQ2JTaC9HVkZGbDBIZVpPVDhOc0NDNlRLKzZCZG8raXZQNlZ0?=
 =?utf-8?B?L3JBQXNPbVpWbDlJYXpjZVQ5S1ZqMTJONnBBQ2toY3Q1RlBGMUVlT2tEYkJQ?=
 =?utf-8?B?SUhJSVlhRU8vWnRLYmFsUT09?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(1800799015)(376005)(38070700009);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <22F1AC6ACA9BFA4CAF58C9A897C9669D@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB10004
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AMS1EPF0000004E.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	26b80290-df66-4c5c-2d34-08dc78d5a49f
X-Microsoft-Antispam: 
	BCL:0;ARA:13230031|376005|82310400017|35042699013|36860700004|1800799015;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?NnhlSW9HVHBNNHlxbmMrZWhYTkRxay8wemFZaitxYUlzYWtscU50NjJLUWlP?=
 =?utf-8?B?UW1tOHUxZmZKcVRFTnhxVm5Wcy9RYzlXTktEalQxOFRoaDFZckZsYkUvdjV2?=
 =?utf-8?B?dDFBcS9aK0JlWndsYmRDVzQvUXBVbU5BaHloY091VW1tQmdNQk1RKzNPS1Jv?=
 =?utf-8?B?b0NuVy8yTWJ3Q0hITWo3U3hwVVJ6TVg4Q04vMjRmZDBndXNUeTQvS1lpY0xv?=
 =?utf-8?B?VlRwb2JMNWM4UUxBV0xWUmx2UDFYdXVJc2YvQnV1ZnVxeUYxcGNDdlE3Q2ps?=
 =?utf-8?B?UUhtamtSRjNvOHRwaDJvakVwMWpaWHZES3ZXcWM3WlpnMzJjNVNHNjR6OGZC?=
 =?utf-8?B?V3BDZGRFaWtHNWcwdmhCUEpLSGorQllpcGF6WHNFT3djL2dHK05JYmFUbC9p?=
 =?utf-8?B?NWNsSWZlSEFSSExraU5VbEpVMXJ3WktPUnc3VlhtVnNDVCs3bER1NE5EUTMz?=
 =?utf-8?B?Yzdxcy9CRUwvaTJBVWJZc0h4TWI5cS94N1duK3VvL0x1ZFR6SE13T3pkSHo4?=
 =?utf-8?B?ZGJPb1U3cm5pMHI4RXcvSnlqQysxaEx0QXBVM1cxZ1R5ZTNOWXpDMFlKVXRp?=
 =?utf-8?B?TmhBZEhaN0VnVmtHT2xSRkc2aGhUMGxtM3ZKS3BZWWFDM1ZGbEl3T3VNamp4?=
 =?utf-8?B?TnZ6RHFOMjg5aWhubmMzcmtBQ2k5eUd5TmxUemQ4ZGt2aytFUEdXd3BLQVFW?=
 =?utf-8?B?djk5bDk4bjZrVmxhNVltT0NuWmZQUVNSQm9MZlBSRzdqVXN1MGx2OTE2bXJU?=
 =?utf-8?B?VWxadUdMMUlRRTNLdFRKRG9zSE9FMnBSMDVrRkFCaXFTL1c2RmZNa1BQdTll?=
 =?utf-8?B?bDJOTE5DZXhKb203SllQZG8zemtoaWk0Yjl2REJvOERVWW9Rd1ZEb3RRZGZt?=
 =?utf-8?B?M3NDdHQrSUx1alZYUUhCSldqVTdpVEhCQnFxcUVoZWMzTU1ldWFOLzhuSHNz?=
 =?utf-8?B?RDZIZXc1ZlJ5STh1UThGR0VIM0xUajhKN0NScmNQdXRPRGtOMWNkVWRGTjg3?=
 =?utf-8?B?RjlhV3RFODN3bUlVYWdYbXN1WFQ5UFBsYU10T1dxZlpmNm91YkdIekVvRCtH?=
 =?utf-8?B?UUpvWm5GZjZQcEdYMHhhZE5JcldmdHZnUFA0Rk16TjlHY0xZZm5ZQitIQm5r?=
 =?utf-8?B?c2NNdHZwSVplbUZDNis3Y3BMYnlmLzFrRXZlVVc2dlZGTWI3Zi9DdkFvbzRm?=
 =?utf-8?B?cS92MitCaVRXYjArcFV2MWJGUWNvOGhrWkZFT2dSdllqUmxheDRpMTFaclhP?=
 =?utf-8?B?OERMUm1MQjgyU2tiVm9oVFYzQWxvQVBvcVpIUDZZRm5LenhZWDFpM3ZrNWoz?=
 =?utf-8?B?clhYVGM5b0lsV2ZGc1BZY0dGSDM0WUY5ZUdRNE5vSHpLU3ZCY0h0QmNLSVBY?=
 =?utf-8?B?eHdxNUhLVk1BZGp3bjI0Yjl6LzJNa0RINVA1VXpoeEtCcCs4cU9PMUY5Q3ZH?=
 =?utf-8?B?L0svQ25zS3AvSnJPRVZZL0JoRGxXRzZYQ0FKT2Y1Tis5aTU2R0UxbWhNUlVS?=
 =?utf-8?B?eW5OSG9zT2ZEWjFkZWZBVURVVCs5S3g5RSs0L2RJYlhGV0t4bFQyaGRCL1ZW?=
 =?utf-8?B?WjRBeENHT1BWWndPaVFvWG1aaEh5OFdOUFpqVXVyVU9kUnVDVEZpSW1hOWNB?=
 =?utf-8?B?d2VCQXN3RHN4TlR2NlJtRXlGb1BMQ2x2SjFMTmpWTUZNT0UrYW5aYWhWRWl0?=
 =?utf-8?B?cnhWaHA1QTZPKzhlamFib2xxcVcxbFNtVlV2VWlqYVdqRnFuRElKMGZJNTRT?=
 =?utf-8?B?ZGhZZ01VUVJaSEVrQ0s3YkdNWEZ5QWFoZEZiWXgxSGJld25xN2s0R0dSc2JG?=
 =?utf-8?B?R296WFptY1V1d1BiaVBwMUNaVlRxUzdPOEZMazZ5ZEF4ZnUyclNuQzduaXNq?=
 =?utf-8?Q?IiduGBj1sPDE8?=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(376005)(82310400017)(35042699013)(36860700004)(1800799015);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2024 14:03:45.7262
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 254650af-4d49-477f-b02f-08dc78d5aa25
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS1EPF0000004E.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB8664
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 May 2024 14:03:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199593

T24gMTMgTWF5IDIwMjQsIGF0IDEzOjAzLCBFbWlsIEtyb25ib3JnIHZpYSBsaXN0cy5vcGVuZW1i
ZWRkZWQub3JnIDxlbWlsLmtyb25ib3JnPXByb3Rvbm1haWwuY29tQGxpc3RzLm9wZW5lbWJlZGRl
ZC5vcmc+IHdyb3RlOg0KPiAtQ1ZFX1BST0RVQ1QgPSAiZ25vbWU6Z3RrIg0KPiArQ1ZFX1BST0RV
Q1QgPSAiZ25vbWU6Z3RrIGd0azpndGtcK+KAnQ0KDQpJdCBmZWVscyBsaWtlIHdlIHNob3VsZCBi
ZSBmaXhpbmcgdGhlIENQRSBjb21wYXJpc29uIGluc3RlYWQgb2YgZGVhbGluZyB3aXRoIENQRSBl
c2NhcGluZyBzZW1hbnRpY3MsIGJ1dCBhY2vigJlkLg0KDQpSb3Nz

