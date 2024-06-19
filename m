Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B872C27C53
	for <webhook@archiver.kernel.org>; Wed, 19 Jun 2024 16:36:05 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.51])
 by mx.groups.io with SMTP id smtpd.web11.25717.1718814957397214304
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Jun 2024 09:35:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=OXsVWsc8;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=OXsVWsc8;
 spf=pass (domain: arm.com, ip: 40.107.20.51, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=HzJPa0Sf4HwPEmky22cQHGi6KiOAAH+eTru75s5HUizcAX3yrqMvBJtG8LWZ3L3lfBJMb8vGNiooOKkPl9/JsfatdwcTqXfnV6LHT7HqqUcre6C+J8Jc6S4DAr7znGiJGJlPRzzvO05DjWNJclgmbdYeIEN+Q1nJBXvkQh/hSTh253lMVrZ8j5TUGGBzvA27RJuz+VeLKMT3jubUaVhXEl1Vi6Fe/qBC9PUjwE0EYlCTQwMP9vyoUYVWmnpmqEHiyM3ED+WDNqHNl0/QqDnJ16sFuBbZxYSDgwV1DUFQBIgEh8qWoivCnF8DeciTYL99Gyb+YAdV4D/FEQq2GZSk3A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gb2e/hv7sDl1fNswLQ0iiu0VmU27tTXkH0eM+wvlnFw=;
 b=XC9e2NyoiZ/XLhNGCCNfNRQ9gGrY+0DeR4S8BCax6TRk6ntanO/xZ+P+5yn4Z6FboC+F9UlBUsS8ewsCCTaKq4edcdRul/4W7IXprQ4rJvo+7O1lslmD/rDlh6EnNozZ63JWreH6GZeigwzx1tkp26akaFxlEYWF2MP7AHQHF9ktA2SJ5WUKjbA6OxdtzYLv1Od8SIPOFzCpp/HmJNzkyy80ZsmgaBDLhFBdmta4S7OHJnpNmMSXBsWn4S0JRHimIALhlwfjbjI8Kr0KAf9qnNVjBSM1n8Amz3oGSzFBbknUFr+ZPif0DIW0QLKH1nij/1S0Ly4pbHlOR4N59bYP0Q==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gb2e/hv7sDl1fNswLQ0iiu0VmU27tTXkH0eM+wvlnFw=;
 b=OXsVWsc8SoUqkgyhAOQsJfnCzRqlggO0r+VOSdgUUyZx/DueRZCTM28XJezLeDjEvOvlPIqtHQIpQsY39z4j1z5kpw056bjEJmSP32RV+SnkpbEIawzsTmOp+UG2yByFHHuf6zgm9h6OpdqEH4ovBc7J+7yJWpg4K8DOdotgmcc=
Received: from AS9PR06CA0014.eurprd06.prod.outlook.com (2603:10a6:20b:462::8)
 by DU0PR08MB7413.eurprd08.prod.outlook.com (2603:10a6:10:351::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.31; Wed, 19 Jun
 2024 16:35:54 +0000
Received: from AMS0EPF000001A2.eurprd05.prod.outlook.com
 (2603:10a6:20b:462:cafe::8c) by AS9PR06CA0014.outlook.office365.com
 (2603:10a6:20b:462::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.31 via Frontend
 Transport; Wed, 19 Jun 2024 16:35:54 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AMS0EPF000001A2.mail.protection.outlook.com (10.167.16.235) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.7677.15
 via Frontend Transport; Wed, 19 Jun 2024 16:35:53 +0000
Received: ("Tessian outbound 491425a8ca54:v339"); Wed, 19 Jun 2024 16:35:53 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: ea90d81fb3497664
X-CR-MTA-TID: 64aa7808
Received: from 3eaee798b415.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id FDEB1CED-A28D-47A6-96C9-D931C2E1BF7D.1;
	Wed, 19 Jun 2024 16:35:46 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 3eaee798b415.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Wed, 19 Jun 2024 16:35:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CxFcHjIXVFDpH1ulg2VIqkwkZZjTjhz3JtQlXguFtnfpjjOHuW5XvK7UBsHc70u0xSW8JJflv5MLu+Ji5JJfj/N7DOBdT/zJaLCKeRBmgnopfXof5tLScuTcmeTEoa5YOmfqX2fjo/FREuVmTW0M4Y44+tTW2X4DmGQwi0Bxf2rLrUx7pzvxR6F3JyhK6lBHK+qeQ3/ik/TSzOz5BiuEJ9rmlNYR/1UXBHKpEMnId5YuJWjqvY15d6dIxQ6O5O1V57SQeXqM1VhXYLCfYe/j4z3QcPIPPOL6Hx+yrwghd2R0dvrr66GMaTYkEFhQ/7MwVIe1r/tpF2eVOUrI7B+BCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gb2e/hv7sDl1fNswLQ0iiu0VmU27tTXkH0eM+wvlnFw=;
 b=SqVCH0B3JfJb2fqMcWOkBE8B0Xj668E16TmlxEOyP+m9Rm8xI35eSS7PslbZpucNUVxsd2XpHru+StSKkGB8Ho7G+tBusj2BIapNeZj6KZ0F/KtQ7uvcr7a9t0jhivjReuSl/jTnEefhY4WwNrPeSHTNRbEWLml2zunhNFe/4w5nvdds2TBTciN9p4qmLRDYL/PgioJOD7Elndifh2mo88C9Lq2uHbwvCi3KX5bN/QnnSpes1RyY782IcDlLA64Jcxz+Ne+zqBVHF649jMBvvTT+c7XxtZJnbbBOTFXzQGd7+11HjhvQD61BvTMaB3PyOcz5apgG/pmZh1tHbr9Pzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gb2e/hv7sDl1fNswLQ0iiu0VmU27tTXkH0eM+wvlnFw=;
 b=OXsVWsc8SoUqkgyhAOQsJfnCzRqlggO0r+VOSdgUUyZx/DueRZCTM28XJezLeDjEvOvlPIqtHQIpQsY39z4j1z5kpw056bjEJmSP32RV+SnkpbEIawzsTmOp+UG2yByFHHuf6zgm9h6OpdqEH4ovBc7J+7yJWpg4K8DOdotgmcc=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by DB4PR08MB10343.eurprd08.prod.outlook.com (2603:10a6:10:3fd::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.19; Wed, 19 Jun
 2024 16:35:43 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e%4]) with mapi id 15.20.7698.017; Wed, 19 Jun 2024
 16:35:42 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
CC: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 10/15] glslang: mark
 0001-generate-glslang-pkg-config.patch as Inappropriate
Thread-Topic: [OE-core] [PATCH 10/15] glslang: mark
 0001-generate-glslang-pkg-config.patch as Inappropriate
Thread-Index: AQHawidh25kfEsum70eyS7mUXfcPvbHO00WAgAABEQCAAGP1AIAAAW6AgAAPXoA=
Date: Wed, 19 Jun 2024 16:35:42 +0000
Message-ID: <35E7A1F3-A630-4F6F-B65C-65391C0B7F32@arm.com>
References: <20240619085957.2787700-1-alex.kanavin@gmail.com>
 <20240619085957.2787700-10-alex.kanavin@gmail.com>
 <CANPvuRkyyjavWQn2gynunhJpXxAG42+DmKNZ6+eTyumCoUCQog@mail.gmail.com>
 <CANNYZj-ZUTSpxwpycadiwnAyWkK2SbvX7BguE5hr3ZY0Kq6XWQ@mail.gmail.com>
 <D479E782-0AE4-45EE-A0B7-A7277B728857@arm.com>
 <CANNYZj-Ynnex=dPFv+yD_pvV8VFafv5Mwmvyeik_5VCH_YqCqw@mail.gmail.com>
In-Reply-To: 
 <CANNYZj-Ynnex=dPFv+yD_pvV8VFafv5Mwmvyeik_5VCH_YqCqw@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3774.600.62)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|DB4PR08MB10343:EE_|AMS0EPF000001A2:EE_|DU0PR08MB7413:EE_
X-MS-Office365-Filtering-Correlation-Id: 4dfc21f2-10e1-4bbb-305d-08dc907de365
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230037|376011|1800799021|366013|38070700015;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?dzBZWnFJTjhHMUFvcTZCZVpzUXBVM2ZyZEVWQVd4WjdmdzNOcjZMUjZjRXpD?=
 =?utf-8?B?VXpPdFl4NHdESTV0STFpSFViR0xsdzJZWHVCVW5uNlZvWTR2R20rQ2FhN0xV?=
 =?utf-8?B?VzlrbGV2SDNNYlU1b3d4bFlwdFd1WDlEbExnaVJnY0JFSVhEclpGbVRURXFo?=
 =?utf-8?B?Q3VCNXN2SGVsTTJycEg1QmgzR0M3NUJEY0JzTk5nNllPS3VvYWFzaEdnOWNB?=
 =?utf-8?B?cWxNM3N1NGFWUXJBTU5JeWdBTGFNK2Z0dFpKNVc1SGhJQmhSanB1R09ZakhV?=
 =?utf-8?B?OVozdUdHdjJGQVF5Y0J4YzhTOXh6NTlvbVgrbGtmMFFtOXZDRG9HbGM3N29Q?=
 =?utf-8?B?b3dXOG1RdE53YTJZZmpUdzVkUGhpTHE5aStlNW8zakNObXhEWUZ1eEdPZHlC?=
 =?utf-8?B?ZmZLbC9UaXRxbkVaWjM3MkQzdHJsbVJ2aFpZWmZVdGVMWVUzb3VaRThBZVhy?=
 =?utf-8?B?U0ZOT0V5emxrZ3lCOHFvTTNua09vQndxVUZDUFoxd3YxQlpFTkxJNDRvU3Q2?=
 =?utf-8?B?ME1WSXB5RTBrS1ZtNmhjTE90RUlVZHd1VEswb0ZyTWxISmdvMzB3NE01cEdI?=
 =?utf-8?B?UjlyMCtIWVYzbEVuRnZxWTJodFh4QmNZTEpVYmZnaHZ4QXFwM0lUcUpMYjEw?=
 =?utf-8?B?bkR2YkRCRW1HTXV1QXNJK1pmRlJ3V1NoQkNWd3V4dFVBWDNHRzFMUmg5N0w5?=
 =?utf-8?B?cEJ2VmoySDJkanhDcm94ZDRyNUo5a3A1UkJsV3Q0aXMxL3M5eVlhcmV5aWM4?=
 =?utf-8?B?WTNBdTZFNEZRdG94VEdGaUMzNW9sckN5bzlvaHh2RnZoMkQvVVlmdVpPYXFi?=
 =?utf-8?B?Qmo2dVlRZFpwbUVoRVhybE8yQmZMVGV3cUVmdDBSLzN1ZUVsTlJ4ZzVCd0cw?=
 =?utf-8?B?RkRValViaVQrQTk3WHRnNERxRHZGL085cU1mK21EQWhmSU5lRHRQOWRLV2hZ?=
 =?utf-8?B?MnR3TWlOUkwrd2ZXNU9qY0wwMDdRc3IxM05XUUd2TVNBWWZRdXJ0dVh6ZWMy?=
 =?utf-8?B?K3BIYytJM29kYUdKRFlBQVBha3YwUTFHand3QjJiclZtVWtienhoaFQzMlpX?=
 =?utf-8?B?dFhRRjlhSXJpNkVwWlBlTUZVbTlhaTFQTTkvVDdTNlE0Mmw1TkFiSksyK0th?=
 =?utf-8?B?K3FUM1ZkS3FFQ2FmWVpzWXJCamRRc2F4aitia0plL3M1UVNrZGRTK2lyOFdl?=
 =?utf-8?B?ZDQxaHZSSDl1ZFlMRjRDVUtuaDBLYXdlL1N2MjFyQ1NQa2dreHBGSFhPRSt3?=
 =?utf-8?B?ZEFRRXU2TW1uUGVNcTIrNzZsUWhUL200MmFTb3JjdDdTK2dMbUdlWjlZdlkz?=
 =?utf-8?B?aUJDL1d5WVpJdVpTNHZCeEhoRFNlRU1RdnRDcHZmWDZObkxJQ3plZ0JYU0pD?=
 =?utf-8?B?dzQ2cUNzS3RYaFFOTldJbU8zVVM1WDAxMEJCSEh2UkQ2bXpmTllSK2NFWVVt?=
 =?utf-8?B?MlIrL3hUWFFlakNib3JzUkJEaTgzQ00wdzQvOUhQV1VGY3hJZEliS2tldE9n?=
 =?utf-8?B?NDZPSno4NEJib0NzQjRSQnY2RkE5Uk1LNFNycTdBUGxudzNWYklXcFNGQ01n?=
 =?utf-8?B?M29TQVM4VllaV051SEJrRklXRUdKNDhPMGI5TVhSc2tUWTRaSGgzZDVJQURU?=
 =?utf-8?B?azROb1cxQzRsSXhNRkFjVWdBWnBLRkhGeWFZc0podWxMMzJzMkFQL2hBVURq?=
 =?utf-8?B?TFB4czcwSE9FQWQ4eHNpTkVtdmMwdXNQM0hkVzI5UVRSMk1aY3RtWWx5TkxX?=
 =?utf-8?Q?FNkIP6LOL1MLo5Rnz/zKBOddX7AL3163YSKg8ft?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230037)(376011)(1800799021)(366013)(38070700015);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <ECAE430D67312F4AA919140B688BDAE8@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4PR08MB10343
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AMS0EPF000001A2.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	fc86bdee-6a92-47e2-245b-08dc907ddcc0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230037|36860700010|34020700013|82310400023|376011|35042699019|1800799021;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?U0FmUmZyR25OZTVKRnllN2hoc2lqQUwxd0phZ2Jyc1JXVUdRMjZnR1R4Qk1L?=
 =?utf-8?B?dExpWXp1aUVRTitSQ1hqWHBzNTRtVDJSVnM0L2RjcXJKUEhJMUVlUVZ1UmtJ?=
 =?utf-8?B?WW55amtyWjhjYU5tdnhIdzFQeVpLV3ppNlFoR1BtWUZhMFlCR1Y5NkFGeWRL?=
 =?utf-8?B?amJEZW16cExEYS9qV2xxb3V0WnBVeHkyazF2OXZwWDg0b1VYeFA5ZmtEK1Mx?=
 =?utf-8?B?NmR5eWNKMlhkUVl4V09FYTl5ZTh0NFVtUzltbzQ3VmdqVkhWYkEwQmVIbnNN?=
 =?utf-8?B?bUZjYWhKSkRzZitYcHYreGVzWDU2SzhGaTlLYUR2UjdZM2ZGNTg5U1lyT0ty?=
 =?utf-8?B?aFlQUHBNS0plUmxQZ0pPSXVic1FydUZGZHlDdmtmRExBUVduaUkrellOUTkz?=
 =?utf-8?B?NU5RU3dSbytzSEFTVDg4UzdBeTRMQWp5c1l4TXBuekNFOExHZm5kSFJGNldN?=
 =?utf-8?B?MUh0VXBDZUV6YW5panRkSW5SQjgwdHpuK25GMzQzMTVBWXcwYVVqQlNIK3p3?=
 =?utf-8?B?YzNESTBoQWFWcHNRME5MLzQwbjBJUlpvcWlDT2c5RjRvUFUzK0lqc0svczNT?=
 =?utf-8?B?dnhhZ3NuWDdtUjdnNlFkS3ZlUkZ1SlZFR1UrSUYvU2x0S1h5K1U4QWNxZnN5?=
 =?utf-8?B?eFFNcXVWV2d4VG5LMDROL1VUNjFlcTZFWCsrMjBCbExQbW0xRVZXeGV6OGZI?=
 =?utf-8?B?ejE3SFZWQ3gyQzg5QWZGRkRsYVN4TklmNGJYVSs2cVNKLzVjWGIrbk5BRmh0?=
 =?utf-8?B?OVo3ZUdLNnJTVVF2aWlMQWxlY3VsQ0hDV0NKME9DNFBPNnI3R2M3TkJuT2g4?=
 =?utf-8?B?VmNyZUdncXB0VnF2VWlLTCtBSkl6UjVaa0FDWmpwTG5FQnhCYm9DTFpNMVVJ?=
 =?utf-8?B?emdmQlRGNjRXRVZzODZoalFTbFhMNHVRYlMzcUxvQUZUVXRlUHdibzVMUm5j?=
 =?utf-8?B?ckZDT3Z2L3hEbVV1MDBnSHBXcHNtNGtmN2hXa2o3ZWwyelhIanR3azlDM0xO?=
 =?utf-8?B?V1Y3OVdJam1jZklwSTFacnM0YkszemgwMGRGK1VLdGJ6eTVJV0RnSmtNM2tX?=
 =?utf-8?B?ajRCMlZ2eERtNnBtUG1BUWpWeFo4V0FpY0JzTFN5Q0FUYmgyQXRSdEFlNHBJ?=
 =?utf-8?B?L1l4MDV2ekwvdHhSaWZKb3licG00U09TdzV4VlZYNTF6MU9FWUI1U2h3Y2h5?=
 =?utf-8?B?QkRhRUpOVVk0bFFnNzNmOTBWMVhtbVVkZnVFR0YzWTlFWDdsYUtzQldVRlkx?=
 =?utf-8?B?ZVFqNTJIam1scWhhd0wrZU1aZWc1WHNPM3pLeXg5NGxDV3NpT0gxZ3RZSW9Y?=
 =?utf-8?B?ZXNzYXo5Q202T2lCczZUUlZEdHZMVkVvU1pnUm5sSzdPNTlrMGVnV2RPUDg2?=
 =?utf-8?B?d2ptaFE1cW96a1huUGxvd1RNNElrcnVET1ZWc1NEMlRLdjlUbzhIVk1ORjNz?=
 =?utf-8?B?ZlBkUm9MdHRHOHZ2TElxenlKc1JBOEJ1cWRaVjFvbVphSDlvUWl2Q0VvMjd0?=
 =?utf-8?B?dzkyT1UxUHZ6ZjNYVm5Oc3NSVC9ZemI2cEFpemgyUUVnYVFoZ2lUS0JqMGsz?=
 =?utf-8?B?b0pqWUpUSUZ4OWdBN2pWTVFRaCtxQUhjMFo5SzBBdEhBVXlqcndVSzR6MDNJ?=
 =?utf-8?B?ZWZrTFhNdERueFFVb2d2TGpTUGhzdGZrVVBNb2xHT1ZpLzVXNzJUb2NtdXQr?=
 =?utf-8?B?MnJOQmxFVkhzQThpc0tDTE9NcklpcFZSbWZFdCtPVG9WREU1YnF3cHNDeVVn?=
 =?utf-8?B?d3VLSitVU21BWngzRWt4cGkrTUpTUTZyejR4bG9Dd2hrSTljTVZLR0oyOVda?=
 =?utf-8?Q?J0QZnoI8+pWisVweIOGAldcJcUMYhzFXLxj5w=3D?=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230037)(36860700010)(34020700013)(82310400023)(376011)(35042699019)(1800799021);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2024 16:35:53.9514
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4dfc21f2-10e1-4bbb-305d-08dc907de365
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS0EPF000001A2.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB7413
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Jun 2024 16:36:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200923

DQoNCj4gT24gMTkgSnVuIDIwMjQsIGF0IDE2OjQwLCBBbGV4YW5kZXIgS2FuYXZpbiA8YWxleC5r
YW5hdmluQGdtYWlsLmNvbT4gd3JvdGU6DQo+IA0KPiBPbiBXZWQsIDE5IEp1biAyMDI0IGF0IDE3
OjM1LCBSb3NzIEJ1cnRvbiA8Um9zcy5CdXJ0b25AYXJtLmNvbT4gd3JvdGU6DQo+Pj4+PiArVXBz
dHJlYW0tU3RhdHVzOiBJbmFwcHJvcHJpYXRlIFtpbmRlcGVuZGVudGx5IGRldmVsb3BlZCBwYXRj
aCBzdWJtaXR0ZWQgYXQgaHR0cHM6Ly9naXRodWIuY29tL0tocm9ub3NHcm91cC9nbHNsYW5nL3B1
bGwvMzM3MV0NCj4+Pj4gDQo+Pj4+IA0KPj4+PiBNYXliZSB3ZSBjYW4gc3dpdGNoIHRvIHRoZSB1
cHN0cmVhbSBzdWJtaXNzaW9uLiBJdCBpcyBtb3N0bHkgdGhlIHNhbWUgd2l0aCB0aGUgZXhjZXB0
aW9uIG9mIHRoZSAtbEhMU0wgLWxTUFZSZW1hcHBlciB3ZSBoYXZlIGluIHlvY3RvLg0KPj4+IA0K
Pj4+IFdlIGNhbid0IGJlY2F1c2UgaXQgaGFyZGNvZGVzIHVzci9saWIgYW5kIHVzci9pbmNsdWRl
LiBJIGxlZnQgYQ0KPj4+IGNvbW1lbnQgaW4gdGhlIFBSIGFza2luZyB0byBmaXggdGhhdC4NCj4+
IA0KPj4gSSBjYW7igJl0IHNlZSB0aGF0IGNvbW1lbnQgaW4gdGhlIFBS4oCmDQo+IA0KPiBJdCdz
IHJpZ2h0IGF0IHRoZSBib3R0b20uIFZpc2libGUgaGVyZSBhcyB3ZWxsOg0KPiBodHRwczovL2dp
dGh1Yi5jb20vS2hyb25vc0dyb3VwL2dsc2xhbmcvcHVsbC8zMzcxL2ZpbGVzDQoNCkRpZCB5b3Ug
cHJlc3MgU3RhcnQgYSBSZXZpZXc/ICBZb3UgbmVlZCB0byBzdWJtaXQgdGhlIHJldmlldyAodGhp
cyBpcyBzbyB5b3UgY2FuIGluY3JlbWVudGFsbHkgcmV2aWV3IGEgUFIgYW5kIHNlbmQgYWxsIHRo
ZSBjb21tZW50cyBpbiBvbmUgZ28sIGluc3RlYWQgb2Ygc3BhbW1pbmcgcGVvcGxl4oCZcyBpbmJv
eCkuDQoNClJvc3M=

