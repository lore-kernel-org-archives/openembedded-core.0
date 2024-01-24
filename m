Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2702C46CD2
	for <webhook@archiver.kernel.org>; Wed, 24 Jan 2024 13:53:28 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (EUR04-HE1-obe.outbound.protection.outlook.com [40.107.7.47])
 by mx.groups.io with SMTP id smtpd.web11.22942.1706104404115676558
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Jan 2024 05:53:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=cDNuUdzE;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=cDNuUdzE;
 spf=pass (domain: arm.com, ip: 40.107.7.47, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=U7YAMcTvoSUct0xoblveevPBJbf+Gwpf/l24RBoYPbmHsWNZlI9Hl79orzQiFJYvlptn8WB4SGxvxoyvYHpb2uXFm84SZ7S33QLf+WBdamcZLP5Nrv4HIcnCO/HN1s6AdHuo6EvDPO4ml94gA2EjnVc9a2LMo3/4rF4+5qpePCDGTExjyr2VEapUq+NxJhYg6Rq5VxidmINAgVyeTBf6Hn+qpWxlRw0BAWPNMrgEk4mYrdAg1xkonLIxPDukWmsnOMk2V4vofQ4wrQHHLhWW4UkEZZiHqUtVKRnasK92F5xRgyWwKkBAE++gU3oCZds7e6kZiM6UeQsy4RlD1xc2FQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cfBwr3wpswgkYfTTNkj7cLzaWXwoUbuJNsLJ55PLh4E=;
 b=WlMwkalvyR8phjti6GcXR2sOGK4kGzWo+nQLQoIl5oRRXGnrXUc/nZ4vfLuVen/Y1YGjHyqR+7CqaW65KuKnA2Lv2yMmuC3qE9JakDn7RdZnxapmOA0ZpWc5gcO4CUZ4Yq4O94tvBFa2JiXTytomhPj3KKK6E4Iqmb8iWVJI+txqeZp4GrJGcjE8h+WAresChaPpcLvYxr6NA1FWQWpkXNcrLBH5di/lgFGYDmFtvs+50PUg9jmLUiey4sLMSnPEeDG0Qqwch7QV9GPQB8Iqqz1oDt/GNIVBGr/S42lj5t3HjY/tHXHqierOQkNB9MMBcMB44AGZQJ/qObxeksleyw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cfBwr3wpswgkYfTTNkj7cLzaWXwoUbuJNsLJ55PLh4E=;
 b=cDNuUdzEkVAChivoSrt0xkv4RFCQ214XBH7eHZkgLhwcvEpvVb0ZbExnN2XKPxw8x6o7bvtFV5nk40hh+LENjP0pe8lRKE3GyPHv05H/R8+QHxObW4JDg3lkogb5fdQCdrz+EzzxTVUMDKh2vHxOZCbvA0qsHOAcv0n4vCAAu4U=
Received: from AS9PR0301CA0026.eurprd03.prod.outlook.com
 (2603:10a6:20b:468::12) by GV2PR08MB8461.eurprd08.prod.outlook.com
 (2603:10a6:150:c3::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.37; Wed, 24 Jan
 2024 13:53:16 +0000
Received: from AMS0EPF00000198.eurprd05.prod.outlook.com
 (2603:10a6:20b:468:cafe::b2) by AS9PR0301CA0026.outlook.office365.com
 (2603:10a6:20b:468::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.22 via Frontend
 Transport; Wed, 24 Jan 2024 13:53:16 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AMS0EPF00000198.mail.protection.outlook.com (10.167.16.244) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7202.16 via Frontend Transport; Wed, 24 Jan 2024 13:53:16 +0000
Received: ("Tessian outbound 94d82ba85b1d:v228"); Wed, 24 Jan 2024 13:53:15 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: f11641424aac9449
X-CR-MTA-TID: 64aa7808
Received: from a52c1794e78e.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 5750AD5C-0129-4462-BF2E-2555EEAEB88B.1;
	Wed, 24 Jan 2024 13:50:12 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id a52c1794e78e.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Wed, 24 Jan 2024 13:50:12 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jsq4wrW2l4C4h7eOqq+y7JIcHvepDVQiZGqMI4mpSPAoobuI5vVge3O0Tubzafnfdg7Qf8BXI2w+e0TsY30YYxuZkULieWyjZxk224XTZ8irKDZOPg13RyV6ztROJvDtpKKx/Zfy3Tkw+9wgMh0TIZk4WF+60txeNtaC3k3NWU8n/xF5Tk7yMsn8gNIlqXPNi5Lw077JpwDQTQ9xjKNWo1bU5UpfMcmkwBtmHyUqXsGDeUWr2ek9qO614SqIyO4KG5XpQlcy7kcpkxEokzgQ3x9QUeMRhIfu9eFk6gFRw7qft9cf5iSw9FLeMTMXxJps1uSqjTs5EBh25PLu1NF3sA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cfBwr3wpswgkYfTTNkj7cLzaWXwoUbuJNsLJ55PLh4E=;
 b=DKgrnDNxZ87iEmp9VQi1Ku27eSiMj3Il1NAAMVi1K5cEPXWNHIosfqaGJsROCiQaUUQZDbuuBebM+SCeYfTqZDyW0uZgyi2/T1JIkTXXg3Dd8SZtNaE3k90RhGYPWE9h7USBn9Odd2HEZDpjmfd8zQYpZgyieGK2BULBtwuiUH72Yly/IEmcREg6nEQ7ss79jLwPrI1gWargdh1o9BD1PYGPTOaiMHfOuXL+kKL+YFt6DSyRTEenizZ3mshA7f9SHYm0FXhJNx/86Dhe4b/jaRagiCrr6AmU9dDhtrjuCuLY7+kraVnfYBVca+tjH/zKJN/6zkTbdwplJaxy4LdH6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cfBwr3wpswgkYfTTNkj7cLzaWXwoUbuJNsLJ55PLh4E=;
 b=cDNuUdzEkVAChivoSrt0xkv4RFCQ214XBH7eHZkgLhwcvEpvVb0ZbExnN2XKPxw8x6o7bvtFV5nk40hh+LENjP0pe8lRKE3GyPHv05H/R8+QHxObW4JDg3lkogb5fdQCdrz+EzzxTVUMDKh2vHxOZCbvA0qsHOAcv0n4vCAAu4U=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by VI1PR08MB10243.eurprd08.prod.outlook.com (2603:10a6:800:1bf::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.36; Wed, 24 Jan
 2024 13:50:08 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9f34:f165:4c51:be06]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9f34:f165:4c51:be06%3]) with mapi id 15.20.7202.035; Wed, 24 Jan 2024
 13:50:08 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "anuj.mittal@intel.com" <anuj.mittal@intel.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 4/4] grub2: upgrade 2.06 -> 2.12
Thread-Topic: [OE-core] [PATCH 4/4] grub2: upgrade 2.06 -> 2.12
Thread-Index: AQHaTdj1vWYlk2Yq20iJ/DaFBiKOVrDo/L4A
Date: Wed, 24 Jan 2024 13:50:08 +0000
Message-ID: <A950FDEA-F17E-4234-AFE4-563163121E62@arm.com>
References: <20240123084734.223154-1-anuj.mittal@intel.com>
 <20240123084734.223154-4-anuj.mittal@intel.com>
In-Reply-To: <20240123084734.223154-4-anuj.mittal@intel.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3774.300.61.1.2)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|VI1PR08MB10243:EE_|AMS0EPF00000198:EE_|GV2PR08MB8461:EE_
X-MS-Office365-Filtering-Correlation-Id: 6a7f8e13-3013-460a-8cc1-08dc1ce3d07e
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 t2hCnrC9jPpRgik5pffTWJxP3vaGULYio7h31l8R9AamzPKRBEwfJ6SgKdpdZzDmR10WqneuJupJLnwvyDDc6PaS+EEXBse/ZMOg0QfRsdDTB8LybfIt2yW6BOoE2cEEOxgmB54XZyYlg9A/4HzMMR408B4Y3xrOijBNry2EZkiKJ6sTBicd5vySBtSM0hu5+pFeJZ8DoKNQyoxPrrj73FW+m4BPYXAqmj5ERoeqZ62Um1Y2nVHaeg8G4HfoxtqbRuld4lfQt6vDifrjkNFonIy3CYb1E3DdpYTV/HMKyG32Qjw9XdORzDePOUJfYRWQgbuKojuaM3dabTnlk+8qPe9+ItsOKYrp52YS2pOIYBqGRZ1IkTWurJyXu+A5Ix06o3zk4gDt1/hQdWRqFNmtGEQDyXBMwXbHeJg2rTX7rwBX/03srZBoiMvFYFi/ipXIrVPWSsMxPwDh0u3WkLj+a3530luIaB7goO/X0v3jTmE0iFXuQiV0Ij1YL8TOjRap66bkFtBMBTL8gKq3NTczmLYfsGLxgkzvax6/7GtJh511DRcjG1EdaFppwhalwaDtUyuSLevalECuV/oh4S27z66I2ljN/0l1ajj2CuJxMNRvWQP3pw9dKeIN/UO4rxrXHYegMO/sHl2OpOwlYJCezA==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(136003)(346002)(39860400002)(376002)(396003)(230922051799003)(451199024)(1800799012)(64100799003)(186009)(122000001)(71200400001)(26005)(2616005)(83380400001)(6506007)(6512007)(53546011)(5660300002)(66556008)(2906002)(6486002)(64756008)(76116006)(8936002)(66946007)(4326008)(478600001)(316002)(91956017)(8676002)(66446008)(6916009)(66476007)(558084003)(33656002)(38100700002)(86362001)(41300700001)(36756003)(38070700009)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <3E16F94E058FA34B807F0A856E8C4A90@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB10243
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AMS0EPF00000198.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	6b1f7b9f-9b0a-4fe5-d777-08dc1ce360e0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	QHwNACh3SuCz7MEURRTRRgx6vRDED7tElEJBqeggTQ2bFzXxWQNU8xr8Ipdf2aImyyfvRHGP5GBr753pwfuKdTx9z78cMMfviWQZ73syr9HcVPDfVgfRyCLyTMZYiHJJRYlbH5yNlgJRwxQoJ/iwsWNfHxO5Y3EucfhLEkVUyb3tezLlJsEAhTwQ/PnPvvt+Vor4IoExPPq5ozuHtHrDSbIfbDteGb5RPWMd0ObkVNDUtqVye6FDiQaK4MFE9szxnVBugIolKDmI5EBnsm8Vc7X6a5NZeoOQ9zDkURoFK8jSmg18ym73UEegtUQeIkZBMrbz7kpJ01G3vw5T0pZ2TyfFXD9aMvFtYOU5E8BzvdnzI99GUC9TXgoOUUZjgfSOCZESn0Z1uFVgCQKnwK9FP1VdswxvTlKd+YGJpsyECKn3KMWXoHZg7MKKLGXWdfIz8SbaGxKk2u9eqkkwZ8Bf3s0bQr/U6vS12Gm+eGKvEBZ++D4ttlo5t1DFBjWp26+2Pua85u3muPAMCRjCHQ7YOwWKathAtZo2OYn412zxM9FlxG8mSRP61vKPEIfGr5+4Lvj4sTyx1teiv+9X6j+WzjR2Ga0sH1W6WH5I32XYyiGUgI5Rw/Plfx51338RWFo6PGtb8zEVIhYZ6D++jXcDVoSvUdkvgkjbwjVjgN0z/uLjnT6BMozY/FTAg2cDkBJhxXeB/Z7pYwBiX98pRZMBp/7St8vHYRrq5bjpIFNKpOo=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(346002)(136003)(396003)(39860400002)(376002)(230922051799003)(186009)(64100799003)(1800799012)(82310400011)(451199024)(40470700004)(46966006)(36840700001)(8676002)(336012)(8936002)(81166007)(356005)(70206006)(70586007)(2616005)(86362001)(53546011)(6512007)(36756003)(33656002)(316002)(41300700001)(6506007)(4326008)(5660300002)(6862004)(2906002)(82740400003)(83380400001)(26005)(47076005)(36860700001)(4744005)(478600001)(40460700003)(40480700001)(6486002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jan 2024 13:53:16.0252
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a7f8e13-3013-460a-8cc1-08dc1ce3d07e
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS0EPF00000198.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB8461
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Jan 2024 13:53:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194274

T24gMjMgSmFuIDIwMjQsIGF0IDA4OjQ3LCBBbnVqIE1pdHRhbCB2aWEgbGlzdHMub3BlbmVtYmVk
ZGVkLm9yZyA8YW51ai5taXR0YWw9aW50ZWwuY29tQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+IHdy
b3RlOg0KPiANCj4gRHJvcCBwYXRjaGVzIHRoYXQgaGF2ZSBiZWVuIHVwc3RyZWFtZWQuIFJlZnJl
c2ggb3RoZXJzLg0KDQpJIHdhcyBuZXJ2b3VzIGJ1dCBJ4oCZbSBwbGVhc2VkIHRvIHNheToNCg0K
VGVzdGVkLWJ5OiBSb3NzIEJ1cnRvbiA8cm9zcy5idXJ0b25AYXJtLmNvbSA8bWFpbHRvOnJvc3Mu
YnVydG9uQGFybS5jb20+Pg0KDQpGb3IgdGhlIHVwZ3JhZGUgb24gdGhlIGZ2cC1iYXNlIGFhcmNo
NjQgbWFjaGluZS4NCg0KVGhhbmtzIEFudWohDQoNClJvc3M=

