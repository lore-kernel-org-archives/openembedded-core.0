Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA5C8C2BA18
	for <webhook@archiver.kernel.org>; Thu, 20 Jun 2024 12:47:10 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (EUR04-VI1-obe.outbound.protection.outlook.com [40.107.8.54])
 by mx.groups.io with SMTP id smtpd.web10.46771.1718887621879665756
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Jun 2024 05:47:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=dpBE/Py/;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=dpBE/Py/;
 spf=pass (domain: arm.com, ip: 40.107.8.54, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=K+PZPqKLYX+JoP3UmdZ9AohprNGNnLUjwVbWNYXJjNin4Sad5AiKwoSrGQ2a1QHIU6d4TzPu/ZqQxbP94AFr8LtPvWqwQBA+PgbXaqpzslojwcT3PEw0CtJYmTKiTmCZzDnaiHCXl58DdMC2krUC+PCf+dBVLN9aCABo9LZNh3diQQ6RHY6hdlLwSn75ysqapjC1WZA7uaJ07RK2L6wlo63w4qH8o0chDzJpufkAKKvzPDU8FUxKzNElCahVz5Sc+gdDF8v9do1F69CypbVacU9jXhMJkD8acUo/o3+RUKG2dSDAse2BODiuExTK5B4BfdueCwFOtVCVOadEPTYz2w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ik24o+d7BbJMfdB7qQRSAF8lEiNjHZNNKfu7LwDNVG4=;
 b=Wv9tz0NOxYqznuYtFPeWmvO9vQohGzwC4BMVkEK6gWC4e1NI9B2QmS2ODfttxKkJhcCAKetTHwzNEV81p9jHHktwTXxwEBI/C6cfYI0Z9QP/e1UHDmcjNDUMzILvRlY7KeiSjXprsAkMxKgpD5J7ldMbVMqb0jIv+aucOCf4yihajzhWYEJGfgchJpLuJEudjgWK4XIpou3LNrCR3Dw+fTZXntOdqwCN1OK2ps4vFLfG87S6RGi3RAUt/Z5jGsF5TiJh+Gbtczb4WVQEv24aJ2h93IWw6yYYkyphS4yWAYIsHxi5fZGYW/IJVT4xpV2sP6xoLqnS+7k1TkhKsMNIbQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ik24o+d7BbJMfdB7qQRSAF8lEiNjHZNNKfu7LwDNVG4=;
 b=dpBE/Py/onx4M3C5JUyL2fMOZvIN0P4DubHmCQk1qvwfn3SnSB3YyYd9nAucwU3zsoueFbcmDYc17QUM9jxW+gNSntLCFt1KSyoNsOlyYrweP4khxbEVbkWAFklEpqTlQ9Kp56OS9zTSujGuccbneDPzfMsW5zaZm5UciP56Yd0=
Received: from DB9PR02CA0003.eurprd02.prod.outlook.com (2603:10a6:10:1d9::8)
 by AM8PR08MB5649.eurprd08.prod.outlook.com (2603:10a6:20b:1dd::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.21; Thu, 20 Jun
 2024 12:46:58 +0000
Received: from DB1PEPF00039233.eurprd03.prod.outlook.com
 (2603:10a6:10:1d9:cafe::e8) by DB9PR02CA0003.outlook.office365.com
 (2603:10a6:10:1d9::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.33 via Frontend
 Transport; Thu, 20 Jun 2024 12:46:58 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB1PEPF00039233.mail.protection.outlook.com (10.167.8.106) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.7677.15
 via Frontend Transport; Thu, 20 Jun 2024 12:46:58 +0000
Received: ("Tessian outbound fcd698738a24:v339"); Thu, 20 Jun 2024 12:46:58 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 970fb5153692d46b
X-CR-MTA-TID: 64aa7808
Received: from 96b440fe923a.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 834EBB33-4BB9-40E1-8569-C2DC0D28D910.1;
	Thu, 20 Jun 2024 12:46:51 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 96b440fe923a.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 20 Jun 2024 12:46:51 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NtdIV9z6dZZ0O2NrUF3TqxPDJEK1q+Vmz58K0KMY/szvY09q2MvbkVz8lSgIgL/f+NcKADGsXm3Xwcx8j7WSPzfQkkKB8cpsEqXJ89D62715Tprh5HLMkMNpW36zHyHnKJpZFs4HHrg/QsKDsTgiURFJtiaVQvSvw1wYd/DRVNjkR+/6FaRmD3GGCUtOLxRvAdau1pWCbVTwvr0rbY0ljotByCTjTX8ZUAJiH75Tv5fQZ9EMJ4lgIku2yL6GzV9ozlY3KyVBe1MFA4RAkfDluPvw3ygL+K+qAYxqIWmD6TAPQtD90lGS+zxxrgw8HHDn1VlMIvsvTa7JgY15XJZzuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ik24o+d7BbJMfdB7qQRSAF8lEiNjHZNNKfu7LwDNVG4=;
 b=NenK4eNYTo5WpZ8BZWNDzv1puaR36rbdDGZ+hhBiQqkoIxWvEtzqs9YUhWNO6UpCwWL9BfwJ1/w2j6At1zpEjOkdm1YKWKjIFCYc097K0c+XunyRTpnNazhxtFeXHu3TKJAlEotC0AKvP2JmxQzl+jEdPasuWtXzLiNfdlyJ6vd8S6+mZAmWJ4UaruXeFVE71S1C5JZVZpArNG0VHaH1r4c9poAVE0UXqXqNjstoK6bDKrbEczvXb2xLNBy57TAZ7KFhOuUSRHTCFTdqQc1MtglOCj2WVtfNrgl9c2+Qb4Xi3pnImXiIo8iUZMGOEWaEpKVxSe8AX1bSHVLKS1o/+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ik24o+d7BbJMfdB7qQRSAF8lEiNjHZNNKfu7LwDNVG4=;
 b=dpBE/Py/onx4M3C5JUyL2fMOZvIN0P4DubHmCQk1qvwfn3SnSB3YyYd9nAucwU3zsoueFbcmDYc17QUM9jxW+gNSntLCFt1KSyoNsOlyYrweP4khxbEVbkWAFklEpqTlQ9Kp56OS9zTSujGuccbneDPzfMsW5zaZm5UciP56Yd0=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by DU2PR08MB10278.eurprd08.prod.outlook.com (2603:10a6:10:498::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.31; Thu, 20 Jun
 2024 12:46:48 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e%4]) with mapi id 15.20.7698.017; Thu, 20 Jun 2024
 12:46:48 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "gudnimar@noxmedical.com" <gudnimar@noxmedical.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] python3-setuptools: drop python3-2to3 from
 RDEPENDS
Thread-Topic: [OE-core] [PATCH] python3-setuptools: drop python3-2to3 from
 RDEPENDS
Thread-Index: AQHawmqoWjRk5aOEm0iOHXoU6/dsYLHPUU4AgAEaUYCAABbwgIAAAxcAgAAVTAA=
Date: Thu, 20 Jun 2024 12:46:48 +0000
Message-ID: <19A83C04-D1E7-429C-B7C2-73C404077326@arm.com>
References: <6942.1718882361902473385@lists.openembedded.org>
 <2056.1718883024436895882@lists.openembedded.org>
In-Reply-To: <2056.1718883024436895882@lists.openembedded.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3774.600.62)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|DU2PR08MB10278:EE_|DB1PEPF00039233:EE_|AM8PR08MB5649:EE_
X-MS-Office365-Filtering-Correlation-Id: 98327a56-6dfb-4fbc-b912-08dc912712a9
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230037|376011|1800799021|366013|38070700015;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?cGhUTjFaNjIvejBjc2t1RnNJcTg4cFMrd21VQUdRaU9Ca3VSS1pCUndONE5p?=
 =?utf-8?B?WGdOTWxxMi93dVJaL1BQZTM4TTN4Z2JLTE1PdEl0SU5BOEpUd1kxUFYzR3JX?=
 =?utf-8?B?elNCc1VwYUZHZHUvc0pBb0tySWkxRWZ0K05vaWwxU3N0UjNha0ZMVThKZDY4?=
 =?utf-8?B?RVVSdTZwK1lCNkJGcXNyNXl4RE9OVGUyeHJUWUlTT05HeC9RQW1TS3pEeUxR?=
 =?utf-8?B?cTFFTHdaajJkd3hHemJUY0VzWkVKVytzR05FcjlveWx1TTRRZytxRzV1VzI2?=
 =?utf-8?B?djBVUWpWcHdJREtiWk1mYkNLMjYzUlhYQnh3Yjg1b3BFYndaVVFsN2dMcVdB?=
 =?utf-8?B?ZndmOHNpdExxNGROMkFkOTliM1IwLys2SjE1YzByZEdsUHRzTWhqSVBQTFlz?=
 =?utf-8?B?TlJxTTNKYjN0WWlhRjFaZ0h0cW1xSnAwMlgxWUwzTkVibFNrY1dCOTM1OTBx?=
 =?utf-8?B?U1U1ODg1VThNblROZENyR1kzUTJIYlJVN2NPZmFSMTA2eklkdEVETC95dlg3?=
 =?utf-8?B?L0Z5UmRqT2NEa212MGNLYThMZFN3MkdOVlJqdmI2dnFDaUROL2hkUXFkVG5R?=
 =?utf-8?B?eTR1MEpyRzVWRDI2d0g1aVRPdTZvUEdCZ0VFN1cycEllckluVnM3OGdsM2xC?=
 =?utf-8?B?SE5KZi9IRDdveTFIUEN0MHZaMjRSN1BmdmNTSUgrNG9vWmt3byswL3lJckVw?=
 =?utf-8?B?R1crb1pvU0RhUTFld0V6NSsrT0ZOcXcxVHNLdHJqODJJVTJEQzhUVHlWbUR0?=
 =?utf-8?B?K3VlZk5nWGJkQ2VhVTVGZWlDcXF3bXJoS0ZUMkFqWkFIdGhIdG9nRjV6UXpr?=
 =?utf-8?B?Nml0eTVjYnJxYTYxN2xHL2lOZjJnUDFkWk1KVWN5akxPSEhUT0c5dU0xQi9h?=
 =?utf-8?B?SUY2OVByQ0dhSnBSbWRqUVlUVFF2VXRBU1RDSVI4R1VsTUhWTVFiVWhQejNz?=
 =?utf-8?B?SVZGbXo1R0ptQlhjckdXdlNzVmtjUTQyL0NJUytiZlRubm9RVnZRWThhZG5k?=
 =?utf-8?B?T1E1WjI0bjZvWTVMcDRsaTMwK3lRVjBydldqQXpGR0NZOHVUcHg2SGd6aURY?=
 =?utf-8?B?Q2Y2WWhMbjAvWlZGQm93VzV1L0ZPamVKcWwxZEVrNXdNR1MxUTQ1U1dIR0tn?=
 =?utf-8?B?ekkwSWJSMnFLQVdRd1dyOEg2YWc0Vm00RFYyNE9qbDJSalNTd0RSbmxYTGNt?=
 =?utf-8?B?b1EvMWFNaDRtK1g1cjBoWUVneHZhMU9lWUZleFcxTEpIRzV4N2s3ZnVrOFkz?=
 =?utf-8?B?ZnVTYVVTcDNQK2ZTNlNJNzIzQ0UzbzkwOCtCcUtHQTFlZlhwTUJ3WThuMHRl?=
 =?utf-8?B?S1BPQUZFQ3J3OFNQZkRTZG95Q1Z1MEdxQm5GSGkyWk5uOWU0ZFptS2RtMkUr?=
 =?utf-8?B?RlhMeTRLVzhqTk81WnFRSWh2cVZSOWREN3YybStGclNndE1wYmhSbmFMQTRy?=
 =?utf-8?B?cnV6NW9ROC90UGhuWExtbmxmK1hWTkdMMzB2ejBTdHF4VW9XWkdVSmpCeVhM?=
 =?utf-8?B?bnMralpPSnpzdG9BMDFZaXBXdm9wKzVTV0FrZHFUcXFQbVZpYVk3bVI4Z3gy?=
 =?utf-8?B?MFB5MWdkQzRFTTNmK3JOZERRUzh3MjFBU1M1enBCSlltK01wN2dtYjN1TWlT?=
 =?utf-8?B?c0RjV0FVR0RRSUlrKzZqQXBrOVgvc1lHdWF4bWtBNnFJOFg4bUtQREhjMTho?=
 =?utf-8?B?TVpvUTBwcmgxTXdGajVMTTJZWjNvczZ3SkxEZ3hZdGF5WGNsMVVDMXYrZjVx?=
 =?utf-8?Q?txJnFsYaQqRSHxFSTIEQK92bWU+nvvWZxM2VS7P?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230037)(376011)(1800799021)(366013)(38070700015);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <A21283D546946C43A53A1ECE6D815999@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR08MB10278
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB1PEPF00039233.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	d82257a0-2f46-49ec-803d-08dc91270cff
X-Microsoft-Antispam: 
	BCL:0;ARA:13230037|36860700010|35042699019|376011|1800799021|34020700013|82310400023;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?ekpqQ3Y4WXdMdUpya2VGQXhvVEE3OGthY3NmVjV1SXFEUUpiK3l6Njl6SDUx?=
 =?utf-8?B?MENGOXBodVhTbzI3dk1mVXJVOU9nUG96cnlCWndNWXFpeDd5Q2h4MnJMeHhF?=
 =?utf-8?B?UUNOb0h2c0JmU09XS2k0bkhJaVROTENDS0FKN09ZWmFXS0Mza0xGeXZCejZx?=
 =?utf-8?B?NHljT1N3bEw4YXM3TE00TWRXYUMxT2tSQXNmbEJQOHFVNzIwVTk1Mkg4UE5x?=
 =?utf-8?B?ckVkRUZPbkdGckxVTCtNK3FuWHd5R3VLZ0RZN1VrSVBDQ1EySks5bmJpSUtz?=
 =?utf-8?B?S2Y2SDA2YXFrZStWNTBXRVdGZUUrN2huU3VCUVVBN29tNGswWE9LeElMK0ho?=
 =?utf-8?B?WjdjUnNwY0REWXYxNEFncEFURm1KckRUaUtXK21xcitLNlVxRlY2TTFpQjQv?=
 =?utf-8?B?NnAvbWIrTHNpbTVwMkdmR253dHQvbU1IYWtlSjRUZlBaVWJia01WRlNEUkhY?=
 =?utf-8?B?VGovcDE4cXp1aVMyb2g1bFVmY254V3VWSWYxbWVNb3ZQRWtUb2FWM2dDbXVX?=
 =?utf-8?B?VlRZcWhSWUkzN3VpQnFobXlRcVlpOHlhYi9IbCtWOFh5MEVyckU0bkFvV25Q?=
 =?utf-8?B?Zmt6WWZRTFk5anF1cG5QL1hHTVZqaGJSandnaUdXQnhDcldWODdmWDIwKzhP?=
 =?utf-8?B?c3VqY3VjMFNJNHNnRlZvT21uRTdSczE0blFoRzZYbmtZMGVDYWR0cmxKR2Zr?=
 =?utf-8?B?dXA0WVQ5Skk4S3FJYU1RYUFiZTRaOFA2RzY2U1dGTUZIeFN3M3JDZUVWblht?=
 =?utf-8?B?ZzdhZGhWWVBZYWNHblpPTkZLWnN3eU9jOGNobUdRd1RjMEM0UStTZlRZUFFG?=
 =?utf-8?B?Q29iL0RrMjFoTWIrZ2FIUTFYUlU4ejd2TktseFE0ZTYwcUtxUFFWN0VSOWZu?=
 =?utf-8?B?M3dweGdERWx0NEdGaHRLL1MvTU9lTk9ZNW5oci9RR081eUhBRU8ra250Vloz?=
 =?utf-8?B?S0kxcUcyZnV0bG5SN1F2c1hjRTc5TDMrNnpUZGE1dUN3ODFKY1VyY2VFVFA4?=
 =?utf-8?B?ZThBeGxDN0xkMzRTOXBhSDhsWDNCZEFGb0xsL24wUnV0NmZXTW52NkZvUkh2?=
 =?utf-8?B?NGdVTFFmTFgyd1k0YUFlaVlJb1hTanBuV1R6YzhlVElESmFLRk9GdXZDZUJG?=
 =?utf-8?B?R0hUV25GYXQ4d2haY0VRT3U4anRNN2lyTE9FWTRsRkVBZnNQODluU3NMbThO?=
 =?utf-8?B?V0RiUnJ6UERUcVBqSVYxeTNMM3cvSm80MFo2YmNtK2tSMWxRdmxDR29zeTl1?=
 =?utf-8?B?MlNTcURxNGJiT3JNMmpSR1cwbEN3czdhWUxHRCt5Q3UvR3ZTY1MraU9GSzV2?=
 =?utf-8?B?bzJZc29xSzhvREhUa1hqcGM0SEtPNm5uZ0c4K0ZYRS9nZ3ZkcldkZWlxOGFv?=
 =?utf-8?B?bmxrSjdWWi9Pd1VnU1ZjQW1TRzEzMEFCc2p5VkR0VjBEQlRqRTZ6UmlPOXVI?=
 =?utf-8?B?VDNMUktrOWRBMnhUbCtoVmNIaGV4VzhEenQ0WGJ0SFhvVXhSbytrQnFPRFVN?=
 =?utf-8?B?TG9wWGRmUE9EUzRmd2Q0dm5HNndNZ29yWkg1ekZFdXZDME9DUVRiNlV0WEYw?=
 =?utf-8?B?ZkpUQXdtdmw4N0lvWTdYdG02WHpuaThPVEdDaXRYZUNIdGQ4SUhOeFRPdk1W?=
 =?utf-8?B?VGtjTTlUTWE0MTRaVWUzYS9GU3dzaTZDanJ0Y2hHU1Z0NXUzck5kcWNjVitm?=
 =?utf-8?B?Qllja2FmNE0yYkdZT0daS3R0Q3NLc3BRMmJDTFBlZjlhRFBIckEyUW5DcWlx?=
 =?utf-8?B?NzVYV2ZnR2U1ZmhWc1NacWkwd0Q3L0JPRmlzNzRiQkxqazduMVVRTkJ5Z2NZ?=
 =?utf-8?Q?+w+ESBywlSwni1/BrHppN08ul/tdYrQAWltCo=3D?=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230037)(36860700010)(35042699019)(376011)(1800799021)(34020700013)(82310400023);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jun 2024 12:46:58.2476
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 98327a56-6dfb-4fbc-b912-08dc912712a9
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB1PEPF00039233.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB5649
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 20 Jun 2024 12:47:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200951

DQoNCj4gT24gMjAgSnVuIDIwMjQsIGF0IDEyOjMwLCBHdcOwbmkgTcOhciBHaWxiZXJ0IHZpYSBs
aXN0cy5vcGVuZW1iZWRkZWQub3JnIDxndWRuaW1hcj1ub3htZWRpY2FsLmNvbUBsaXN0cy5vcGVu
ZW1iZWRkZWQub3JnPiB3cm90ZToNCj4gDQo+IFRvIGFkZCB0byB0aGlzIHRvcGljLCBJIGZvdW5k
IGh0dHBzOi8vZ2l0bGFiLmdub21lLm9yZy9HTk9NRS9nb2JqZWN0LWludHJvc3BlY3Rpb24vLS9p
c3N1ZXMvMzk1DQo+IA0KPiBJIHdvbmRlciBpZiBzZXR1cHRvb2xzIGlzIGEgYnVpbGQtdGltZSBk
ZXBlbmRlbmN5IG9ubHkuIA0KDQpZZXMsIHF1aXRlIHBvc3NpYmx5Lg0KDQpSb3Nz

