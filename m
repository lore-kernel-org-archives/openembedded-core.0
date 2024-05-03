Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1523EC4345F
	for <webhook@archiver.kernel.org>; Fri,  3 May 2024 10:48:48 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.61])
 by mx.groups.io with SMTP id smtpd.web10.9596.1714733323384050197
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 May 2024 03:48:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=W3ZQBx/8;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=W3ZQBx/8;
 spf=pass (domain: arm.com, ip: 40.107.21.61, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=OlAJSbqr8e2qCJj15s3XGnXpaiH1R3/JQ40QuY+Z4+F8iOUbSQc1J2QzY1u8HvpGLeBc0jDj9nYUNoRtDx3UIYsP/EyhrNDHiPtObACS698gUjB33OJeissYSPb0rHW3U2Yua0FU2Emq/kVILuJRlduhTVp73qO92LzlO7J45eKxRfntpGU/n9v0HHGQw8HZ5fFWn9UrQb8RRI7sNX4+o0uuuxoDONLEseW/ka+1O8uywnImhRzHxCoxJDFGyCgyfW7l7h1A+MUCcRnt40ct/sdqsBCVT5j9W5Hm1iJ/wntLBckuYB19yDlRGjIIfZCblZbbvEktnTZ28WMFd07lTQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X+ZPaWmXVlucD+m3S40m1r+JyDP3lF+u4yx02Tduphw=;
 b=kJSVHTklo6o/u159sMN1S+dKO2uebKLelyDryNMwykn6M51seLwf4cFU+RpUHuzxZjAWjHRs70HtM+0fj21ojDk6K0oJJdvG62qIEj9fy0auhakeJRFWo+Ipuevg2L8y/KXmxhi+QpDgt9NLylfxxU8+72tgkRbRPMJxyUd2eDcL05IrzejRg/Fn4y1kSjEHax2iOQhJnPtw9vXjZvfugrjuUb8whrzoV6nfXPCAR7U36masJXl56NnaFRgcE7caZjQo7Wf+agVs2k4kk15ZdoOcsbNNauWyaHfw00oDKKHzW6KOTNk9xD7jWagmv35t0GSSqP3wm4kqMgxFP5vOxQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X+ZPaWmXVlucD+m3S40m1r+JyDP3lF+u4yx02Tduphw=;
 b=W3ZQBx/85VzrBbO0B5oNOYYu3dAya95sfzEVeDxe+ZAZDjp7y/chSzAYXuSBKsWwDjhCW+OignCnRFs2QiXEkoCuGri13rpwq4eNWIanAks9Nz73831DBA8cwqDxvxUlkKIG0RXCZROYcCvnuJvjmH19XxzSIGdSnrmokNHGs6o=
Received: from DBBPR09CA0018.eurprd09.prod.outlook.com (2603:10a6:10:c0::30)
 by PAWPR08MB11158.eurprd08.prod.outlook.com (2603:10a6:102:470::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.21; Fri, 3 May
 2024 10:48:39 +0000
Received: from DB1PEPF00050A00.eurprd03.prod.outlook.com
 (2603:10a6:10:c0:cafe::55) by DBBPR09CA0018.outlook.office365.com
 (2603:10a6:10:c0::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.30 via Frontend
 Transport; Fri, 3 May 2024 10:48:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB1PEPF00050A00.mail.protection.outlook.com (10.167.242.42) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.7519.19
 via Frontend Transport; Fri, 3 May 2024 10:48:39 +0000
Received: ("Tessian outbound af213ececc3d:v315"); Fri, 03 May 2024 10:48:38 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 87ff06cb937fbb37
X-CR-MTA-TID: 64aa7808
Received: from e35416031d13.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 71C35D7A-EDA7-4733-B12E-A6311460457C.1;
	Fri, 03 May 2024 10:48:31 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id e35416031d13.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Fri, 03 May 2024 10:48:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oJbBWrYHaVHjtgjynU4vu+0HwzmoyEAbsbHkC0akAH2NjgqVFJETfylZ0laABZHYEvYctXZDHzPx6KhPVkNkCu5rdZ/1ZNAVgPEzFlRMEVl5GF3EBIa/oC4eegFopVuppTXXWAYcDb9DbpVlztZkVOiI/N5nuteGe5AhchlnqZ6hTVQtSB/XE/Td3LrQOLJnZN7n6yiJODxFREikBPSmvxdqa2NysBqkOiyNCORb44J6WKCyN0vuO6pjPZ07sDRjyiZh/kKjOVxL4wmGSWLaodIxP7QokGWL9jg7TEzhWWi5Mm0zjK7z2uCq9etAzlISRVGq1adOGdSLWhsvCplsmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X+ZPaWmXVlucD+m3S40m1r+JyDP3lF+u4yx02Tduphw=;
 b=PlOIN2/+TdXDQ6ZCLDSst9EFrKiQ2bNCH29GQxb4+gqqHNO0WLePy4e3pOa88lofG1ahw88LqA9cfMXocEV+uxuTwCISrd/tG7lknMZTm3UF4dbOarJCh0y1euv3Z9MUA9ZBFJFV732yyJ0mjWnxz6aWXZIA+jtz6i1XYoaM2NB86JnomDF1e5ZXPGNN00zUZr7lLaB9hcfO53uwRoWcmtg0lzD2+wbwZBCMoZQ4rQ+ubxAO90vqcfUpHbkRsfTJlYnC6FHRVvih5fSOqthMqBLtXCzjm0u4VlqJdNmcLNFOZRr82Gi7BXhPvg1pb3onWEBMegGsH5uY3Ro5R7lLgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X+ZPaWmXVlucD+m3S40m1r+JyDP3lF+u4yx02Tduphw=;
 b=W3ZQBx/85VzrBbO0B5oNOYYu3dAya95sfzEVeDxe+ZAZDjp7y/chSzAYXuSBKsWwDjhCW+OignCnRFs2QiXEkoCuGri13rpwq4eNWIanAks9Nz73831DBA8cwqDxvxUlkKIG0RXCZROYcCvnuJvjmH19XxzSIGdSnrmokNHGs6o=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by PAWPR08MB10320.eurprd08.prod.outlook.com (2603:10a6:102:333::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.29; Fri, 3 May
 2024 10:48:27 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e%4]) with mapi id 15.20.7544.029; Fri, 3 May 2024
 10:48:27 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Martin Jansa <martin.jansa@gmail.com>
CC: Mikko Rapeli <mikko.rapeli@linaro.org>, Alexander Kanavin
	<alex.kanavin@gmail.com>, "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] openssl: fix pkg-config file libdir from /usr
 back to /usr/lib
Thread-Topic: [OE-core] [PATCH] openssl: fix pkg-config file libdir from /usr
 back to /usr/lib
Thread-Index: AQHanURxOTI5vqU14U6vsdNAanvq1LGFT+wAgAABJoCAAAHdgIAAAVYA
Date: Fri, 3 May 2024 10:48:26 +0000
Message-ID: <D5F8CE04-D837-442C-AB42-DF0D53D1FF72@arm.com>
References: <20240503102624.594443-1-mikko.rapeli@linaro.org>
 <CANNYZj8RStk4X-HkTp01THZdrtZ+AF3pLoDm6v04TsFKumSVDA@mail.gmail.com>
 <ZjS-QQ1wDTt-lXsc@nuoska>
 <CA+chaQeXOqrc_UKyYUt=JCiJfJyxDNGSFwn3f9q7mi6NiGA1pw@mail.gmail.com>
In-Reply-To: 
 <CA+chaQeXOqrc_UKyYUt=JCiJfJyxDNGSFwn3f9q7mi6NiGA1pw@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3774.500.171.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|PAWPR08MB10320:EE_|DB1PEPF00050A00:EE_|PAWPR08MB11158:EE_
X-MS-Office365-Filtering-Correlation-Id: 179b5b64-4754-450c-fe1a-08dc6b5e9763
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230031|366007|376005|1800799015|38070700009;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?RUJqUVJaMUpJQ3BEbFdjZ1dWbXBTL3c1YmZleXJ4UC85bFFNVEZ1VjJLQ0ds?=
 =?utf-8?B?NmpxRUpDcXRlRUpoVlA2NEd1SCthTlVpV0tydUJoY013SmgzeGlYMU1UaER4?=
 =?utf-8?B?SE9lMHhKRGZQVkZ0MFkwSU5ydzgzSExuY3RMYVJjWHFnNjFCWEw0NDA1bUZx?=
 =?utf-8?B?ME9wcnkyZ2E1M2g5cGZJR3VBQ3k2cWVUUTVpczlWUEdJazNaVDBmYStZMnJr?=
 =?utf-8?B?TWF3YWZGaEsvamgxVHRhSlBpQzJIU3djT2tkWGluUTJMeHdiWUdSOGEvQXM0?=
 =?utf-8?B?WEtoVG1SMzZ6RkNjbHBzVHVieVNoTXZBVURsbGF5NU1yaXZGWUJPZmRGTGRx?=
 =?utf-8?B?aTV3Rkl5VkN5SWpJTHRrOEZ1TkZCUDc3SWNYOGx5UnErMklLZWFMSldLSlIr?=
 =?utf-8?B?R1pVNlpSbFBJdlNiWWp5UXljQ2x5U0dQK1lqUDduaE4yY0ExRjlycW1RNHVE?=
 =?utf-8?B?Lzh6Qnc2WnE0cWF0SnY3bjF0ejBENFo2bDdzMXB5RHYyZGl1cE1LUEtuRUlu?=
 =?utf-8?B?M2VsRmVoQkV2bnVHcnRubkRyZGMvZU85OGRubTVzczQyR1NLRnIzMUhjek5Z?=
 =?utf-8?B?YURQbjRRTHNhVHR2aXkzTWUzOGJpWWs2TmpNazE1b0g1RVRrNm8wcjZ1aGtu?=
 =?utf-8?B?dXVyR3c5emd5MUJSc04yeWFmUmNCRHpSYkZHNENLNUpYTXNHWWhpdEtpOUZy?=
 =?utf-8?B?TlFiWG41UjdaVW1xRzd0YzcwalJFTEJOQy9aTjJtaXgyOXJQWkZnalNZd3o3?=
 =?utf-8?B?ZmZpbU9EeUUwSXo1VllpU2JMTmVuWUx3N3oyUlZiS2t4YjBncWVkdXhtaDFR?=
 =?utf-8?B?WnZsUFh1cEZnT2ZIN1J1Z3U2bXowOU9nbHFhMnk2ckVLSFFmWEVJSHVQeXZx?=
 =?utf-8?B?dTVORzZELzdCS3hPa2FmK2VLdkN3R1hyNWF4UzJSSjlDRDhzWHFsNXhMbFN5?=
 =?utf-8?B?NlVNaC9Nc3Jpa051L3BXMEx6UEpCNTFMNjVVS1MyL00zVUZ4Mzl2WUdtM0Qw?=
 =?utf-8?B?MzJ0NWtuQ0NtSGdSMng0NDZtNS9oR2ZZVkdkSkpzMjgyNFI3czNXanZzbm8w?=
 =?utf-8?B?UzVxRFVDUUpjcWhGcHFCSjJGdUZhUnd0cEN4WkxpOUwzdklmSkFUZmhCbWZw?=
 =?utf-8?B?Zk1wZE1rb1duSllRT292ajNiZGhmdlhncmJpbXRYb3BFTUZRNUFmNzJKU25v?=
 =?utf-8?B?NXIyUmFQVTZKOGtpNWZhNkRpUXF1R0NOcUdFZVM4aWRUMTQ1Q0JQR29YR1F5?=
 =?utf-8?B?YTNRUkExTU9wYnRTOXVkMllncjRZVUZUalV3UzFsa2tud0pqTE4yL2dQc1Er?=
 =?utf-8?B?bzZoWGMwZThnTXhFSW1IQnBBeGxBYjNZeDZoVU4vU3dQRUxqck9sZ0RwTWVC?=
 =?utf-8?B?dDVpQU1LVWdTODM5RVJ1UnppU0hVOHlMdHFlVDdlUjBYMmEzQThUcHh5Y0lX?=
 =?utf-8?B?L29LZE5DQnBPcGducXNMWUhQTzZ1eDEvcVhKUUp2NldIWGQyTjNBR043TVBM?=
 =?utf-8?B?TXNxZlp1VUZTVFhEcUM0cnBJR0o5cGo2blBGeExoQjBDcGRLOTlPcnNoanNk?=
 =?utf-8?B?aldPSDA2d3dNRGxBNnF1engyUEE4ZjF2K2hQY3loNlNadU1sT2E4Nm5xNlJD?=
 =?utf-8?B?ZGNPMW9lOGpvcXdENnlRZ1huRlhibDdlSC9yc0dPRWpqVWVVLzkvYzd5c3A1?=
 =?utf-8?B?RFJrRnNhbTFIRmtwQWNBTEF3Q2VkYzErVHQ5V29rbWF3eFZHYzZuWVlaN2Vr?=
 =?utf-8?B?YXlPQVdyNG5pVmZrYTlnbkNmV3o5elI1cVF1KzBDZUxDc3Z1b1NJVUNzVEdx?=
 =?utf-8?B?dThPQWtTUG5mN2JvUFc3dz09?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(376005)(1800799015)(38070700009);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <3044F8273EE6604CBA23BF6DCD42CE99@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB10320
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB1PEPF00050A00.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	4eb2f98a-99d4-44b0-09d4-08dc6b5e902d
X-Microsoft-Antispam: 
	BCL:0;ARA:13230031|376005|36860700004|35042699013|1800799015;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?bWVmaVhSby9nakljQU00V1RHcVg5bUZnMktIR0NVa09SNFRlS1FXbCtlZXJG?=
 =?utf-8?B?bENZOVoxbndvMVh1YzFYeGZBZmQ5ZnU5b0xCWVVXUG1TY3pUcU5tVWlzNVZ2?=
 =?utf-8?B?enptSW5ydmZFZlVxT0hvbkNyaHdNYjREZ21Pa2dvUlZzaFdUcCs0UDVtZ2Vu?=
 =?utf-8?B?Rjg2TDVDaWFrTUE1V1pxVGpSSloxclhINXY5aG9hTlA3M085d21HNGdZSmJW?=
 =?utf-8?B?ZW1BYk9LUjc3bjR6NTM0cTk3MGM0V3drYjZEalA3VWY4MnJhM0NVOFh5clY2?=
 =?utf-8?B?dXZCQzlXRUo3a1FyUUx0RWRNcERTc2RvcHVKS09qa1BWNXNMa0VDMDBtR1NZ?=
 =?utf-8?B?VlZlV2hScmo1NkNPbTlCNmlub0gwWmlDRElwTlA1VUhzYzBLbi95K3BwaHhy?=
 =?utf-8?B?Wk5TemZXclpHYkI4bDhvTndPaHc0WGxoSGhJYnRPejBkRkxZU3JuU05aREkz?=
 =?utf-8?B?T1NjeVh4NTg5ZGsxaU8zK0ZrOWxpd0g5VTFqeEFHOGgzZkZScksrUkNiZWcr?=
 =?utf-8?B?U0lseHZrNEliTXExSTBieWxwQ3N4c3ZWTkk2eFlXd2thN0NxU3RKcGl3ZVEv?=
 =?utf-8?B?ZWN2bkRQWlgzL296aVY3RkZ4WVZQcGlZYkNubmtVN0FRR1NRSW02QlpwWjZu?=
 =?utf-8?B?elhWMTBHSE9kc1BhRUxkVE0razJNV25PRlFpSDNMUXFqb3pRRnJUaG1XNldY?=
 =?utf-8?B?TVQ1QTZ2OFdLVXJaa1Y2ZWNGVGw4OFZQQ2dqVWRPN0tWSjFXN0hhS2RMZmFZ?=
 =?utf-8?B?emV0WFpVaitVQUxZUTh5TFg1d3FVQWtjYk5ydk5RRVh2Z25EOWRHQmxlbjdx?=
 =?utf-8?B?anY3Szc5bEZFMEVjeE1PcUs2OSsrQndTMlI2MHBIc3NQR1orWnYvQy96VEFV?=
 =?utf-8?B?UEUxcHBKdk1POEU2c1prTktNMkpyanJIU2g5RXh6S25ncGxoZzhnZ0R2bk11?=
 =?utf-8?B?MHVXYVJIcEU4NW1MVkVNK0hjTUZwaGllR1p1QXJOR0tldXVXbXBpMFZaR0Ez?=
 =?utf-8?B?RERKenJOS1Npc3ovNzB6Y2tXOHFTNTdIUkl1NjFScHM2NEprU1JSVnE0eHdX?=
 =?utf-8?B?ZkROUW1MTEEyTU9ybER2YVZuY21VaERSckNrT3VlRWs2RlNMaHd2SWZxazJJ?=
 =?utf-8?B?WmJvekk4cjAzZlZlNFhOMnB4WU9PdWdXYUFhZm56OWV0T1lOeEtKK280cUov?=
 =?utf-8?B?VG5MbnMwQjc0SzRKZE54elhjUUMyYlFHNlBaU3p6T29tZEM0S2EzUjdHOWJq?=
 =?utf-8?B?ZGpSUkxvK3JjL0ZKQWwzWlFacUVLVk9rOTJkdnU3TzU4Nk1PbVNXbEt5TFZQ?=
 =?utf-8?B?ZDZ3UDFva2d0SGx2VUs2QXdINVNPRFJscFpWc1Y3Vm9BK1RyM29BVmRNYzdq?=
 =?utf-8?B?bm9xa0lHSW5ISG9GV2xNL1k2TGQzdmlURHR5Tm1GeEVjN3p4MjZENDdHRjVN?=
 =?utf-8?B?NDZsdm54U2ZvSzhoV0R2UkdFSmxPN3Z3RzVVckZ6WnZCOEJrNU1QZ21wbUVK?=
 =?utf-8?B?YytKOGtMb1FQYzNLaHdvRnUwTnRETlBvcFBBTm1rb0RRVG5Md2pxVmdRSExq?=
 =?utf-8?B?emx3MEJlc2xVKzBvZ0NKRklIVWk0SytEb0xKM0pNeVF1VGtuOVJNb2V6WWRk?=
 =?utf-8?B?UTZPdGV3ZXI2eU1JOEZ6a3doVVBqdmlnZlMrbTc3SkFaeUpNUEJKRmc5bThm?=
 =?utf-8?B?QjBaUTZLaUd3aml2TXB0TUliaE10YWJNaVJ4cGZnWTgwbFRsd3Y4N3V1RUh6?=
 =?utf-8?B?WFBHWmdYK0NETVNZOTFNVUE0NUhtQlgwWVViaWFXUDBzZmZ3TG0vbnZJTzVq?=
 =?utf-8?B?QWttODZWZStjd3JPbFVma3dTcDZYNlVJV0tOVEx0b00ydTFIRTFWTElKVFVx?=
 =?utf-8?Q?d6aDBGNkK1UIP?=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(376005)(36860700004)(35042699013)(1800799015);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 May 2024 10:48:39.0620
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 179b5b64-4754-450c-fe1a-08dc6b5e9763
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB1PEPF00050A00.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB11158
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 May 2024 10:48:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198974

T24gMyBNYXkgMjAyNCwgYXQgMTE6NDMsIE1hcnRpbiBKYW5zYSB2aWEgbGlzdHMub3BlbmVtYmVk
ZGVkLm9yZyA8bWFydGluLmphbnNhPWdtYWlsLmNvbUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnPiB3
cm90ZToNCj4gSXNuJ3QgaXQgZWFzaWVyIHRvIGZpeCB0cG0yLW9wZW5zc2wgdGhlbj8NCj4gDQo+
IEkgaGFkIHNpbWlsYXIgaXNzdWUgaW4gY2hpcCB3aGljaCB3YXMgdXNpbmcgInBrZy1jb25maWcN
Cj4gLS12YXJpYWJsZT1wcmVmaXggb3BlbnNzbCIgYW5kIGRpZG4ndCBleHBlY3QgaXQgdG8gYmUg
ZW1wdHkgaW4gImlmDQo+IHByZWZpeFstNF0gPT0gJy91c3InIiBhbmQgcmF0aGVyIHBhdGNoZWQg
Y2hpcCB0aGFuIGNoYW5naW5nIG9wZW5zc2wuDQoNClRoZSBsaWJkaXIgdmFyaWFibGUgaW4gdGhl
IC5wYyBfaXNfIHdyb25nIGFuZCB0aGUgZG9jdW1lbnRhdGlvbiBjbGVhcmx5IHN0YXRlcyB0aGF0
IOKAlGxpYmRpciBpcyB0aGUgbmFtZSBvZiB0aGUgZGlyZWN0b3J5IHVuZGVyIHByZWZpeCAoaXMg
JHtiYXNlbGliKS4gIEJ1aWxkaW5nIGl0IG91dHNpZGUgb2YgWW9jdG8gd2l0aCDigJRwcmVmaXg9
L2ZvbyDigJRsaWJkaXI9YmFyIGNvcnJlY3RseSBzZXRzIGxpYmRpciBhcyAvZm9vL2JhciBzbyB3
ZSBzaG91bGQgYmUgYWJsZSB0byBkbyB0aGUgcmlnaHQgdGhpbmcgYW5kIGluZGVlZCBJIGhhdmUg
YSBwYXRjaCB0aGF0IGZpeGVzIHRoaXMgYW5kIGNsZWFucyB1cCBzb21lIG90aGVyIG5vbnNlbnNl
Og0KDQovd29yay9yb3NzL2J1aWxkL3RtcC9zeXNyb290cy1jb21wb25lbnRzL2NvcnRleGE1Ny9v
cGVuc3NsJCBjYXQgdXNyL2xpYi9wa2djb25maWcvb3BlbnNzbC5wYw0KbGliZGlyPS91c3IvbGli
DQoNClJvc3M=

