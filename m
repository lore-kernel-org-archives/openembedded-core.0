Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5ADDC6FA8F
	for <webhook@archiver.kernel.org>; Wed, 30 Aug 2023 09:27:51 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.65])
 by mx.groups.io with SMTP id smtpd.web11.9943.1693387663177758545
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Aug 2023 02:27:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=xjCH/1gj;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=xjCH/1gj;
 spf=pass (domain: arm.com, ip: 40.107.20.65, mailfrom: ross.burton@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sc8Fh3OW7Q4Q+49ga/5TjuMpKQ0rBQxpKriO5V9fMDU=;
 b=xjCH/1gjqn3badqUiQr33L6qzfgO1TaQf46ntwdolT8em4Zy8sD/c3zBsyGGQ+RCz77va1mGGMKiAEA828M+lUl8vtUnyvqjuKRT4TsK/OuVRqyOZjXFM+56q6WV738EXf5ZEsoGQS3If/vpFA3QbwjTZtZ3z4vSuKSGqI0C+WY=
Received: from AM7PR02CA0020.eurprd02.prod.outlook.com (2603:10a6:20b:100::30)
 by PAXPR08MB7382.eurprd08.prod.outlook.com (2603:10a6:102:22d::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.36; Wed, 30 Aug
 2023 09:27:40 +0000
Received: from AM7EUR03FT028.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:100:cafe::b9) by AM7PR02CA0020.outlook.office365.com
 (2603:10a6:20b:100::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.36 via Frontend
 Transport; Wed, 30 Aug 2023 09:27:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT028.mail.protection.outlook.com (100.127.140.192) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6745.20 via Frontend Transport; Wed, 30 Aug 2023 09:27:39 +0000
Received: ("Tessian outbound d084e965c4eb:v175"); Wed, 30 Aug 2023 09:27:39 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: acf429e5a81e55c3
X-CR-MTA-TID: 64aa7808
Received: from 1f87a23a9a5b.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id D7AA5BDC-6502-446B-908B-5B085D764855.1;
	Wed, 30 Aug 2023 09:27:31 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 1f87a23a9a5b.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Wed, 30 Aug 2023 09:27:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eC5TCxMXHlnwBpX/01rBLDwI6Vqxc1EZWOwezK1pJaS7uwqKwWG9Sfj8Fmp7HIupbLxMaWZ0zugj7KurCxU0yvtcFvIxdE31VeXQRXI6VACBSw4BT+vo63OgCZsgLbzuDswtWK/NhQ06rnoapFy0dC+CgM10IYZOCc2Zmfmz25c8i6k8Hl0yPW9P6/MljJDW+tDVc5PyOB5PhHugBA6ZLlLP+Po5p/1Dy4vP0K4kZBxfiuUJq/sHwJYdc12zMs0tRxhKeyxku9y084ezrjK4vKu3v3lf9G+iYHCEB4rceLX1HYT2BZIUVIb7O7jONN2RK2QqJTbz+vFPsYPUwun+cQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sc8Fh3OW7Q4Q+49ga/5TjuMpKQ0rBQxpKriO5V9fMDU=;
 b=ITE7nt5v6eXKLP8NlahXaHrHqkSiYvmXJI+wd7sRUH6Fd5K5ulYi1NLk0SIX8A/yoUeWkSMZ0y4DFpA+WRI3ckLegZ3v5qlfS4rkN0cGVhQUJTbxl3tV+p6/EgVbiHtat1QAeNjtVcvB/GHHqtuiRAWQZc4oAoSCvhLeCQZnd+XKNbDd6I5EXjU6uTWzaB3ucZ/TarLfAJ6MX0WbCBnmW6VUpTSlEjC29Nl1iK9dxIodnKV+4pA5EhypP+7b8/I9EGCVmivc+cmvbr/hiWfxKtbHCSkDlw6JGyBlhmfEsNnUNhWJb1206eBu124BTpNaZTdOdZTnwPqHq1WDH8fe7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sc8Fh3OW7Q4Q+49ga/5TjuMpKQ0rBQxpKriO5V9fMDU=;
 b=xjCH/1gjqn3badqUiQr33L6qzfgO1TaQf46ntwdolT8em4Zy8sD/c3zBsyGGQ+RCz77va1mGGMKiAEA828M+lUl8vtUnyvqjuKRT4TsK/OuVRqyOZjXFM+56q6WV738EXf5ZEsoGQS3If/vpFA3QbwjTZtZ3z4vSuKSGqI0C+WY=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by GVXPR08MB7870.eurprd08.prod.outlook.com (2603:10a6:150::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6699.34; Wed, 30 Aug 2023 09:27:27 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::4b8a:7518:c642:5727]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::4b8a:7518:c642:5727%7]) with mapi id 15.20.6699.034; Wed, 30 Aug 2023
 09:27:27 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Emil Kronborg Andersen <emkan@prevas.dk>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 3/3] libx11-compose-data: add CVE_PRODUCT
Thread-Topic: [OE-core] [PATCH 3/3] libx11-compose-data: add CVE_PRODUCT
Thread-Index: AQHZ1pC+o0PoQVk8qkmhOrshDsnwIq/7IRsAgAQxagCAAbtNAIABXeqAgAAvdwA=
Date: Wed, 30 Aug 2023 09:27:26 +0000
Message-ID: <46B1A25C-EF15-4C95-A9C4-425B706F6DE5@arm.com>
References: <20230824134101.41906-1-emkan@prevas.dk>
 <20230824134101.41906-4-emkan@prevas.dk>
 <7263B0AD-E44B-4E8E-A7E5-567E67DEEC10@arm.com>
 <PA4PR10MB4576FA7369BA0C5437C8F9EEFFE0A@PA4PR10MB4576.EURPRD10.PROD.OUTLOOK.COM>
 <DD619F8E-B1D5-462B-A4E7-008A6F8E181E@arm.com>
 <PA4PR10MB45762B6CDBDBB062BE4C5326FFE6A@PA4PR10MB4576.EURPRD10.PROD.OUTLOOK.COM>
In-Reply-To: 
 <PA4PR10MB45762B6CDBDBB062BE4C5326FFE6A@PA4PR10MB4576.EURPRD10.PROD.OUTLOOK.COM>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3731.700.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|GVXPR08MB7870:EE_|AM7EUR03FT028:EE_|PAXPR08MB7382:EE_
X-MS-Office365-Filtering-Correlation-Id: 3c12f3f1-0e4d-48c3-84e6-08dba93b5ab4
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 UibpLV+9gY6cgmmznNNAWdXkDcV7qR/NcnsjiFnCXSWWZH7JoQm4zqiegf3YcEQm/+0hgzq0rDAima3mSvUsejcPmyNonmFEJBqQOUjFId/l1Zbb9irJ5VF21sG9+g0UKm+Avn3Qov3Si5/wuxnzo8KJZqih2xRkxb1Zqq42s5NFSoNP0x+z02yUQZmE5x20ouXrDvKblLyS1ClLCffgDxxH83tXW3LdSrDGScz2y/Q/S37E3Zfd1l4llJ6QJEDbePgy8zUizC7IeH7OW9pI8guSb4rFhtrZPjt5x9l4aPMj6C2mDSKrr8oRtfukgGryMPT8lRFvBQEglkTSxP+jJyIW+Plg+NomrcCVbtmptZd1T6BL31RCk/N2YpPj3RMsdOWK6ykDdOHfDWHh1gfdB4DJp/SUba7VsS9sASxYs6J6eO/Fgp7QChVlw6Tn/x+3RlD3+RS6PZb/LtYyBQTDx21l+LcVDCnBBus9JB/Zy9XPPXCRFsNnAKZQPPrlLRSsZVKnNdNoWrcqt5r9jH15fPHut4/bFhmgEvR+IhGzDVjLXtcW7wqX7Gop56Vvgb5HeDzjf/IYENFNBeoXN07pcCJhAwVx5LuDv14B6pXXlFirn8uQjENLw75IuUBl4IGxemxHRBM5eTutpNlB1TgzKw==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(366004)(376002)(396003)(346002)(136003)(186009)(1800799009)(451199024)(6506007)(6486002)(6512007)(71200400001)(53546011)(26005)(478600001)(91956017)(64756008)(66446008)(6916009)(316002)(41300700001)(66556008)(66946007)(66476007)(4326008)(5660300002)(8936002)(2906002)(76116006)(8676002)(33656002)(36756003)(86362001)(122000001)(2616005)(38100700002)(558084003)(38070700005)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <CFFD15CF8B84704F9339D64653057AA8@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR08MB7870
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM7EUR03FT028.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	d9c04a78-c9aa-4c5b-04a2-08dba93b5362
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	zpL2E0w10P8dLrJr4RuzlkQqTOJmaVgr5pqOjnuthM1nfWVQTX9ptYLW0JhR3NkAK/h9nYMC5fY5UBre/Exk9lUPguY2k78YyPr9EsHc2oFfnOJFwzu3wfEEoICHtetBzEdXq1k3rkiTdb2AXnvwWhjYvCmEQLtPRJK29Hv2Czsl78ICtRSelqpM2otdBZAvudi1THoBFq6rlxgY4oINgErkudDJ0PAxc754l4SuYeA9cEn5uEnqf6b1XYFCQn6qKQLNRTeHiTN6GW2vAq9M4NP4ESx64hJ+VuO77aNmbxO9meo4SjfdfsClHOC6PLnETRtMvqMr4Z0EEf6jk4Yq6b5p1ZcJmqQ7Wm3345sZxdkxA/oMZxxFM0sHkURtNnLnAzaTaQhzCm38tmtglg2Qs3Wq7MFlx7ehHZtHSwIa6mj50yn3qSkw+ZmWlP1yu861aVXcPvHPt2EmT3rtA8YMhcpnVN3m5FOKBjjvDOmijh6vRvieTGm2hxYLErayZKH3Fa/NvuquPE0gPmmfM+Qy7JaB4oe5qY0b/P30o5liDmGwb4W+0MAmXRBtqh7Z5gNdWVsuZmm3NpETAwNiCU1xZambXgGiWVRw/32QFuntu1CMvJAVQIJjEO1oiEJKC/CnBR5mK2jqIjEb/XRiWaWrbMUw+Yh2xu5ffzyVrhab1b4Pj5EAw2yFeqo8AenrS0XNZAQAQGrOu6fTPSVCSSsPSvFCMvzg1ygvWRXrKD8Duis=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(346002)(136003)(376002)(396003)(39860400002)(1800799009)(186009)(451199024)(82310400011)(36840700001)(46966006)(40470700004)(356005)(81166007)(82740400003)(8936002)(53546011)(70206006)(478600001)(70586007)(6506007)(6486002)(316002)(41300700001)(40460700003)(6512007)(26005)(5660300002)(8676002)(36756003)(558084003)(2906002)(2616005)(86362001)(47076005)(36860700001)(40480700001)(336012)(33656002)(4326008)(6862004);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Aug 2023 09:27:39.2376
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c12f3f1-0e4d-48c3-84e6-08dba93b5ab4
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM7EUR03FT028.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB7382
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 30 Aug 2023 09:27:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186875

T24gMzAgQXVnIDIwMjMsIGF0IDA3OjM3LCBFbWlsIEtyb25ib3JnIEFuZGVyc2VuIDxlbWthbkBw
cmV2YXMuZGs+IHdyb3RlOg0KPiANCj4gVGhhdCBpcyB3aHkgSSB3YW50IHRvIGluY2x1ZGUgaXQg
aW4gdGhhdCBmaWxlLiBEb2Vzbid0IGl0IG1ha2Ugc2Vuc2UgdG8gY2FwdHVyZSBDVkVzIGZvciB4
Lm9yZzpsaWJ4MTHigIsgaWYgeW91IHVzZSBhbnkgb2YgdGhlIGxpYnJhcmllcz8NCg0KTm8sIHgu
b3JnIDxodHRwOi8veC5vcmcvPjpsaWJ4MTEgcmVmZXJzIHRvIGxpYngxMSwgbm90IGVnIGxpYnh2
bWMuDQoNClJvc3MNCg0K

