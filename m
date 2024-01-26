Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA712C47DDB
	for <webhook@archiver.kernel.org>; Fri, 26 Jan 2024 20:41:37 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.61])
 by mx.groups.io with SMTP id smtpd.web11.340.1706301695425792156
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Jan 2024 12:41:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=uHoqmrvp;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=uHoqmrvp;
 spf=pass (domain: arm.com, ip: 40.107.20.61, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=ZjdJYUBPC87AXOUgkzbLXlHMagTTC1zoh29LXPuibTcopM2CLt5m/nUycVbOh4fCQxipJI84MjqJnQst6/36S9rYNTsq9ihwJbD6VIIeTX2scAXVgAlCDSKnCoK+M/cl9umCfZ/po8xe6sUTRzyHCpe93qtFEHPm/vlQW9h6Nj8alp6rHnf/CXGCPSItKTkdhBcKCM0ER0kw9b0rij5WVM377MdNqRXV2m18V60ZIyaA0B8KzqKQFlCy1Fu7YD2jZ+7M8IIkTtUABrOBdAMIQkyg9OG0fDa+YM5uKI+RWG3VbcXO1zj5PKQ7sgMMZ1hIYHc5p1bdlzc/cPIYH5LQbw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0FkGnN9EZGMAVw3G5AXswh0hekauw5P7k2hkO3Dk5FM=;
 b=DlSlmlc9vzzwUE66r726b3gvtYxLPfy9uwzE5gH+MYY51YGqMYwCODk3XC5CnwdcF7lY+Z/+YE2XVC6sRjEdEqR7XY44JyeBM3I665j1/uMnhaPJKvc0ARquiNQNuRwbmoQ+BOqo3f1doKnyhAxU6+iYcSTCaCGEXI5PSwEDs71h8f544+QUThcuQeWUC2PxitameLxx+mTENio5O8w0/bCZfvxvbS3OaUajpNLfsrys6ptqR4zqIa9eDTrEpMlQjh1wa7la6FkyTMdkThfvkBz9lRp7sCIQ4kH3Y0cMOVIrB+dOfmQ261HuuqPTmIqyQ6UWtiNQ4PHaB8xCOJElRg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0FkGnN9EZGMAVw3G5AXswh0hekauw5P7k2hkO3Dk5FM=;
 b=uHoqmrvpb2kfbc+2MsXUS2K1WyWBsC8Nsvn8F91XwRjuCArR3Kd8cbCAvZnvKl83ttA52lXT5pMjBpf/lAuEyXFH8ZyNKzh6L4wLP7DO/c6G//KDl50lWPj8zsKJH8loiv04PN8Q78A23AXOSQi/hbKmUAc2j6fMyRyQh7ExeeY=
Received: from DUZPR01CA0126.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4bc::20) by GVXPR08MB7871.eurprd08.prod.outlook.com
 (2603:10a6:150:17::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.27; Fri, 26 Jan
 2024 20:41:27 +0000
Received: from DB5PEPF00014B93.eurprd02.prod.outlook.com
 (2603:10a6:10:4bc:cafe::38) by DUZPR01CA0126.outlook.office365.com
 (2603:10a6:10:4bc::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.27 via Frontend
 Transport; Fri, 26 Jan 2024 20:41:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5PEPF00014B93.mail.protection.outlook.com (10.167.8.231) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7228.16 via Frontend Transport; Fri, 26 Jan 2024 20:41:27 +0000
Received: ("Tessian outbound a297577ee0df:v228"); Fri, 26 Jan 2024 20:41:27 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 0ae5fc178cab6960
X-CR-MTA-TID: 64aa7808
Received: from dead01a5432f.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id FB2079A2-CDE6-48A6-8DAB-C0EB284DECE7.1;
	Fri, 26 Jan 2024 20:41:20 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id dead01a5432f.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Fri, 26 Jan 2024 20:41:20 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GWGkcwYAhkJAucuTWctDISWPy0Qvw6E59gWIlgywUrsYoh11BVFss0Ps800dg73qDy6Rth2fCspQh/NXuaRxGoJsKLlQu9TUw2/eHhwckBCOS13QGp9IPaVCACHe6AS6i5OQHOXnkimLpPoLmDMH0NncYSjx6NJ5mpVTAk6Q3f8Ocb3rPvYP8j27HrznD8cdIXTBjDoOPgHFjk/kKETJ2qU3S9dmR8uLONVbWYqVx4Atna7YJDdnCzNodajTO3PueM5xgRKs9fsefL4BOYdIP6MfaGC0Z5AgYOeGRWwg5CCZueF+hkLVUgF5W6Hc6Q7JvI2G77x6gpypIw8f7h60HQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0FkGnN9EZGMAVw3G5AXswh0hekauw5P7k2hkO3Dk5FM=;
 b=SFnoj6c4LvzsLhjeb4PvEgL6sPC6owmzJ65bHj4qJNn8CPf8iY39Zfyo6nBk5Dg4O76p/MDtVn2QkDx3IccJ9MowMaJtqeo9gYPjjrzxSgIBYRCce3r16M+4m8zFShSVUBrzC9cmhxWQ3P7R4c0s+gjY553SFO0MMSQbVT7ppFg5lvt+qzDG5Q62lEo3iyTfbtK4GLlQj34jGED9rFN0wSVW5NbRE3hPVHDGKgDl3VrHgdh1h8jjs33CPmRIEZSnVdY/CeMFJsiK0Go66JKpKCD7QEWyy1JQyBrM3f8aBw47Q1YWL6OS0ZSPw2irRnlAOU5u16u6SwgEabLLE7ny2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0FkGnN9EZGMAVw3G5AXswh0hekauw5P7k2hkO3Dk5FM=;
 b=uHoqmrvpb2kfbc+2MsXUS2K1WyWBsC8Nsvn8F91XwRjuCArR3Kd8cbCAvZnvKl83ttA52lXT5pMjBpf/lAuEyXFH8ZyNKzh6L4wLP7DO/c6G//KDl50lWPj8zsKJH8loiv04PN8Q78A23AXOSQi/hbKmUAc2j6fMyRyQh7ExeeY=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by AM7PR08MB5317.eurprd08.prod.outlook.com (2603:10a6:20b:101::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.27; Fri, 26 Jan
 2024 20:41:18 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9f34:f165:4c51:be06]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9f34:f165:4c51:be06%3]) with mapi id 15.20.7228.026; Fri, 26 Jan 2024
 20:41:18 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: OE Core mailing list <openembedded-core@lists.openembedded.org>,
	Yocto-mailing-list <yocto@lists.yoctoproject.org>
Subject: Future package versions
Thread-Topic: Future package versions
Thread-Index: AQHaUJgDT7J74xZOYEuebvErsdqJlg==
Date: Fri, 26 Jan 2024 20:41:18 +0000
Message-ID: <618B0BCA-2E2C-422A-B554-421D533FB0BA@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3774.300.61.1.2)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|AM7PR08MB5317:EE_|DB5PEPF00014B93:EE_|GVXPR08MB7871:EE_
X-MS-Office365-Filtering-Correlation-Id: be40cbd5-3bde-4dd1-8da5-08dc1eaf2b35
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 aNq7jOXrznWs+q+scDys9UlfOJdlHkFQNAfTujA2psu8kbPiO5WUW7v3VJeeXaJc2NWviV1m/YSeV8GwfdIxLRWxxNytx7MxJ1B8k1tKwiCFQobdXzPuiGIefx3t6ckieUGPB59FANvCt/w0p88Uv4lrZ/lM7ipngApG+OBZBvWpqz1XOwozXx5WBD/imDoINH3s7v4Ndb3sJ5lLQn3fMaCT+Cqj9cVV393QSRokSUWPG+pC1FwdAZZJEkMSo+PaZ2BntAPIT+so+tDqD8guMiL3YazTFfxoiOwDc4Fm8+w+R/ZEopaW1OCcMfTp/bI+CLEFJiFEUh7fFU3Xco/jkjdxpcYoEndnawR24VqQJxFvMIDUTXSTJlFLosK3WCrLp0Ahh03u1QIFzrW0nk0nQCloZ72qkOHdfBhTSYhly9Pr/74/CiZgawSGSMK7+jxdIxXMmlf/BZvFnon65UpETyBOjFrgxU9XXhGnZa29Z5VBilPa/cbRnHq8UrTgJLCYSIyKgsrP0Jx0qDJoPNkQtwO2OFXfn4NMKjkL0DMrT79bjOpCTIEgLwI67+PmIwNP2q0I9pI8XbcYN0JP97MKFDanD0q1+f2nIX26yu8c3/5+DLUVceD8Zl/SVRgnaTb6LYO/crlpgqVHcoSSw+w2Dw==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(376002)(136003)(39860400002)(396003)(366004)(230922051799003)(1800799012)(451199024)(186009)(64100799003)(3480700007)(6512007)(8936002)(2616005)(26005)(6486002)(122000001)(38100700002)(7116003)(5660300002)(8676002)(64756008)(2906002)(478600001)(66946007)(4744005)(6506007)(71200400001)(66446008)(76116006)(316002)(66476007)(66556008)(41300700001)(110136005)(966005)(38070700009)(33656002)(86362001)(36756003)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <0C1BF307335F6E47ABA8E599719D5447@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5317
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB5PEPF00014B93.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	29e925ae-5aff-4a8b-6dad-08dc1eaf25b6
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	JHBEcwOUqwR78est0nZMDI5CNRV9NHhLSa0GZ0fXy2eLuYQmNCz0Uqjmn+8/RTsSHDPw2VwadQ3JZHL8zMaKXgDQLl4M+pUGeX2aDlFA0Pm30g74Rj1aDR9jK4FiAjG/8y0PtHPieCx+zRTWk1YUfDwsO+hsp+EUbr/LI+sTDLaaqe2cIEtGGUL6o4xYzeJhJjktHcqQsZ3WJBQgnVsplIRRvBHfqYINMWma7IN4gcfAu8MGZa47nt+HFDUhBlePxMQmZ4QGFW2JEmOBhPKwRKHf/CaEE46E2ZeJ2nG6oIIMjGJyBmLwoVeU+TDJ1N9mCV3W5d4j3x6wbsYl4spMCtL/8E4GJFLFGhjg16bHom98lHHZB5yF9l3blZvJB1EIAWvpeUtIuNw8hJ1exIkVXJyupaH5C9dgZWltGSaPIBewYyKQNnpUP80RJjyDRPEkCTg/GQ6izZgOFsbaQt2PTcGCGBA1wno/c0++e+7cT+CTViS5hYeMHt+5V+UkMWDOagUZU6GYy+WdDU7DNRizAfRXpaCdvqfR6fRG2SbD6MYFuKmY5FXIzhOmJYtcPpogmYCwzFLdRHerou305NqcBI8IZycIbh9itcEa/GYxODR2+D3Tdv7zrzM4DhJW85E328tAHBy/XCTvc9xeO9iHXvHvLWT9EIVdTBfDgyiYs4ZYHcA55n/6i/eAqZ+1qQwMi1xSVuYY8MrCEerYA/08FdL6nKdiXVCDHgKnIbK+qkY=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(39860400002)(136003)(376002)(396003)(346002)(230922051799003)(1800799012)(451199024)(64100799003)(82310400011)(186009)(46966006)(36840700001)(40470700004)(47076005)(3480700007)(36860700001)(6486002)(2906002)(966005)(478600001)(8676002)(8936002)(5660300002)(86362001)(70206006)(316002)(110136005)(70586007)(4744005)(2616005)(36756003)(7116003)(336012)(33656002)(26005)(6512007)(6506007)(41300700001)(356005)(81166007)(40460700003)(40480700001)(82740400003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2024 20:41:27.2807
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: be40cbd5-3bde-4dd1-8da5-08dc1eaf2b35
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5PEPF00014B93.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR08MB7871
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 26 Jan 2024 20:41:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194404

SGksDQoNCkEgc29tZXdoYXQgcmVjdXJyaW5nIHRoZW1lIGFib3V0IHRoaXMgdGltZSBpbiB0aGUg
cmVsZWFzZSBjeWNsZSBpcyBwZW9wbGUgYXNraW5nIHdoYXQgdmVyc2lvbiBvZiBhIHJlY2lwZSB3
aWxsIGJlIGluIHRoZSBuZXh0IHJlbGVhc2UsIGVzcGVjaWFsbHkgbW9yZSBub3cgYmVjYXVzZSB0
aGUgbmV4dCByZWxlYXNlIGlzIGEgTFRTLg0KDQpTbyB0byBhdm9pZCB0aGUgcmVsZXZhbnQgcGVv
cGxlIHJlcGVhdGluZyB0aGVtc2VsdmVzLCBJ4oCZdmUgY3JlYXRlZCBhIHdpa2kgcGFnZToNCg0K
aHR0cHM6Ly93aWtpLnlvY3RvcHJvamVjdC5vcmcvd2lraS9SZWNpcGVfVmVyc2lvbnMNCg0KVGhl
cmUgbWF5IHdlbGwgYmUgYSBtb3JlIHN1aXRhYmxlL2Rpc2NvdmVyYWJsZSBwbGFjZSBmb3IgdGhp
cyBwYWdlLCBidXQgdGhpcyBpcyBiZXR0ZXIgdGhhbiBub3RoaW5nLg0KDQpSb3Nz

