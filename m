Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 121ACC48297
	for <webhook@archiver.kernel.org>; Mon, 12 Feb 2024 16:11:20 +0000 (UTC)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (EUR04-DB3-obe.outbound.protection.outlook.com [40.107.6.77])
 by mx.groups.io with SMTP id smtpd.web11.10276.1707754272870408777
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 Feb 2024 08:11:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=cm6vE0yr;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=cm6vE0yr;
 spf=pass (domain: arm.com, ip: 40.107.6.77, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=dqmWXoFqG003syLAB6RrsItTbV9HiIlPjKjnHFpWEWaiyazaQbR8IYVBmUM+kZ8UkBiadsNDf9YVS9PKR3lUj+qpEQ7d+I4t4ruvo87nt6pTSDTcEQ1iT90vrf1O+Ff/F7U5QrE4QPpDM04zTryWm137O9pdJCQ4wbTRfXlwYKXLQqUFuAfYs5aSvqD3rFvSUDK2/lVMLKUAG8k2anWMPSEPXDPoLZqNeUajUgRyi7Y9LbHjBFbgO0GP+vkSYDJYXaH4qFMrsO21VcJnybtYgFCCCW5nGvSpYSSNYKIWreF+l8r5SL+ORHh1td7JRTe9+lLNNAGTUIT3rF3p99WCbw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=toiVz8J24dMIS+5iiM0e1RG6kB2DDoBkIKE2CxCwg1I=;
 b=B7z6uu8WNVQY/ZefhL3WZC9roQCVNpFAiwpAmGwBRO/rTVVxz2u3jzWiBdzhGfQ29rlZqscAbAxLwnnbTKbXK6UJtGHRo+JZ/QwrSbxsESo95Lpr1ilS8Sjn9maCmwjFZtI9BJmP++McdBM6vsvZsMB4BiY/c6Bsix5kUBWHCxQpSleHOtTp20/lABjb6f0HezDTnlLCGykVeXDiJoZeAZFTLhq807uKL7cJ8P/BAjxPCYH4fhZbwGk6c4U09bDSnKkmypbA82XqBq4Mt1xjjmhijcqtML/V5Qwq/Hn6b9mYRVTYhzHqFYnZ6HI+mA9ersyjQW6q8pxcJADPbpHFSQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=toiVz8J24dMIS+5iiM0e1RG6kB2DDoBkIKE2CxCwg1I=;
 b=cm6vE0yrq2//eoK8aryM4mNPlELJk7IKJMBT10IxxspXReCfDNX+kVQ25kyNhsZe5vrE2S9uvC+d0INKsSikDvB8rj5tlMbiblpn8zWko+3zSaI1WyaDU/zE2c8IVPjFc6scJhOo4ccrfl0Jsf9rzSJ13PmLNiOdtfN30oyAHIU=
Received: from AM6P193CA0066.EURP193.PROD.OUTLOOK.COM (2603:10a6:209:8e::43)
 by AM8PR08MB5698.eurprd08.prod.outlook.com (2603:10a6:20b:1c6::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7270.27; Mon, 12 Feb
 2024 16:11:09 +0000
Received: from AMS0EPF000001A7.eurprd05.prod.outlook.com
 (2603:10a6:209:8e:cafe::9c) by AM6P193CA0066.outlook.office365.com
 (2603:10a6:209:8e::43) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7270.38 via Frontend
 Transport; Mon, 12 Feb 2024 16:11:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AMS0EPF000001A7.mail.protection.outlook.com (10.167.16.234) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7249.19 via Frontend Transport; Mon, 12 Feb 2024 16:11:09 +0000
Received: ("Tessian outbound 31df1b57f90c:v228"); Mon, 12 Feb 2024 16:11:09 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: bedb9506d8be4ffb
X-CR-MTA-TID: 64aa7808
Received: from eec3d0c848fe.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 8F8926CF-739E-4960-AF7D-A5A12E285A4F.1;
	Mon, 12 Feb 2024 16:11:02 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id eec3d0c848fe.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Mon, 12 Feb 2024 16:11:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ajJt15wyKNXUO9e3w1/fQ10W9hrqu0ot2yo3HJOTrE4SoigeIMpvTSjtifF0+3ZcUxg5ohq/wYSEszGT77WJ8FhvfRd3wnHiGV4341zutrhJcRKM89msXC4h8lw5aOblYjfazZYKJH+y0+j94g4A/YgHDbxC1SR4DOYfwsse18vMhogXJHEvoFf5r4+INOWirVGQ3+JWwppW18hXb/3zToLp+YA4lv8B181IXcE+t3V30g2YuDf151LTTEEGC81dxZ3gT7hNdjnFwg3zEFfLuFoXTT8IpxHuQ8RzQWh7S5m/sgM0mBtYoFeORuUKJLwIh4hziMp3ZFluhEgYPHhULg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=toiVz8J24dMIS+5iiM0e1RG6kB2DDoBkIKE2CxCwg1I=;
 b=kJmWcbK5Ow+Gc3CLQ/KiRs+Mo46A2GHub7iZkqG6XOFdqFfXuTltqZr676wIiIdwnm0USnIIk1o60U3nYpos2Wp80eeOibAwVKILYyv3nCgAGq1zwikIsMxCO2VIFAh9WA1iAD93JieVYpKN/ZylZAfubggXxvzW3qhI9H3cuh2YE8ZpcmDZK1vA1SytYQvW5FmKXPKdFSxVx5aro+aAA+x0teDxq0chtL36dUHeyaGcGXgg9YXupBp4eUuDndc9GBkCC89MhMGKI+wy3oHoiAAKUa6Waosvjw3aJA5oXbjoXT5pRCunag/dgM17yE2WdLoLQpcAjDyGZX1vaDYZuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=toiVz8J24dMIS+5iiM0e1RG6kB2DDoBkIKE2CxCwg1I=;
 b=cm6vE0yrq2//eoK8aryM4mNPlELJk7IKJMBT10IxxspXReCfDNX+kVQ25kyNhsZe5vrE2S9uvC+d0INKsSikDvB8rj5tlMbiblpn8zWko+3zSaI1WyaDU/zE2c8IVPjFc6scJhOo4ccrfl0Jsf9rzSJ13PmLNiOdtfN30oyAHIU=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by DB4PR08MB7958.eurprd08.prod.outlook.com (2603:10a6:10:38f::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7270.32; Mon, 12 Feb
 2024 16:11:00 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::740e:ab01:e66a:61c9]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::740e:ab01:e66a:61c9%3]) with mapi id 15.20.7270.024; Mon, 12 Feb 2024
 16:11:00 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Alex Kiernan <alex.kiernan@gmail.com>
CC: "Robert P. J. Day" <rpjday@crashcourse.ca>, OE Core mailing list
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] more ptest pedantry: why conditionally include
 "run-ptest" in SRC_URI?
Thread-Topic: [OE-core] more ptest pedantry: why conditionally include
 "run-ptest" in SRC_URI?
Thread-Index: 
 AQHaXX5EMrr/sTK0LE+qmnXyzK6NNLEGl7iAgAAIPwCAAAqlAIAAHtCAgAAEDACAABOhgA==
Date: Mon, 12 Feb 2024 16:11:00 +0000
Message-ID: <F448E74E-3EF8-4AED-B7C9-C61F300C0C44@arm.com>
References: <8d71c0f-9120-85b7-80ce-d985aa557f8@crashcourse.ca>
 <8C7A9199-D49B-4190-9D96-F060CD858C71@arm.com>
 <bef4a38f-aa1e-d57b-e23-f3a059ebe313@crashcourse.ca>
 <CAO5Uq5Qyr7ca2rcVtRs4seSyKid58J3ZGhRHuynm-AFYgM1PXw@mail.gmail.com>
 <ac14ca2-ef63-6ee-d01b-c4ed4b65d78@crashcourse.ca>
 <CAO5Uq5TYipCFncPuQFBXOr4BtLUDnsXGNr5w5OsyWjxXMpEZsQ@mail.gmail.com>
In-Reply-To: 
 <CAO5Uq5TYipCFncPuQFBXOr4BtLUDnsXGNr5w5OsyWjxXMpEZsQ@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3774.400.31)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|DB4PR08MB7958:EE_|AMS0EPF000001A7:EE_|AM8PR08MB5698:EE_
X-MS-Office365-Filtering-Correlation-Id: 356df71b-776a-4e66-3b2c-08dc2be539ab
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 BrMmfy+XkN5jz6rxBA/cuudKI56wMlH280H1qnH+uqM7iF1VDBN5yN15owPzC6EB1w1Ai+sQYK1l4l3OOPX2UHfTH528FtZ74ofmPFL9O9dGAMGU9j7bR/fsJ4iQwFnj7c0ALal6hgXFx4EWhxsOdliNV/lnbSbXg6eKXGcyTq58tOnAyjqV/FkEdV+L+oUDeYaDiN1BTnkZuKQkJxgXKpuB/aMDqPT5HcVPrgC1uQgmF4YZVK1bcoOuuiVDfTzdvLPdWMZFAHh6rnai2NLA34cnIWsxP/AJIrSUqq8Ms/cmSvl3xCOkJg+4ZIUlUY5TE8k5T/a1vH//IgzI0+E/zyigKvuMF6otyGUoFrPz7KTwREbTUeMKRgxGk6voLdmXU7+s60fRUq9zyM0LHkk5phUd9oV9wyl8Ka3QWAPV5SHvn9o2ChdHIJ0wfXK5f0Jnb/3mR00U69pnJwac1T3FyG19M7LyVCa1hE1hG+t/RIDhSB/1NiVH9Yumy92kdc8g0WITz4R3RpCGaIgrAfPg4SPYm4RiLvz+le/HUalP65oVLkvqwyXHms40c/b86tCfUgey2+EyZZqiB+UNU4/eiiojorLy4g4op+0bp8mrVZ2LGP4vOApBpEqbeMD5lFld
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39850400004)(366004)(346002)(136003)(396003)(376002)(230922051799003)(64100799003)(1800799012)(186009)(451199024)(6506007)(6486002)(6512007)(2906002)(4744005)(316002)(41300700001)(5660300002)(54906003)(4326008)(8676002)(6916009)(478600001)(66946007)(53546011)(76116006)(71200400001)(66556008)(66476007)(64756008)(36756003)(66446008)(8936002)(2616005)(38070700009)(26005)(86362001)(38100700002)(122000001)(33656002);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <A82A1815F70E6C41BD0901EC497DA13E@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4PR08MB7958
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AMS0EPF000001A7.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	dc5535bb-0b49-4578-2eae-08dc2be53414
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	qHk3hZVLgFTuJlc/uIZOacRLtakYQ2XGWoZjvAubWnHMc/lLVZ4GWasMARDx3Hqc1sqU2dLrh6FOdKkR8LpQIjmIlrMk8W02bwtAQpd7+l/rEnUZL/6l6I4KD5+Z6sdPYjVW45ME/mB9RcrjDfK3IyhFpQ4dhMM9vdhQvPfhuU6PZfOB5HzYRjQLqreDTJ2zQKsi165mcMkkVy4pCoXHgVgpyT33HqXYo/3ynw4pGsTj8uawbWdIgdlcEbVxj/QzpL6Wlb227AL89eXu2hcG1l1P4Nde7IsJAKtKeg/CyJAeJKsS6NtwYvq3+ToGJ8SWA54BWokJAPQI5dw7Sv8mIBLXnLW9KhawOB8dV49dM3b0BOkbEzPhKKP42/DyORQ1WHb9RhKswVOtGssNyPE45NSIQJBMC5NBm0fYu9fF9thYYvsq66ldTcnyXx8Y9AXQCYCkgmc6hnd641iW1Gkq/r1oVV//48K3DOYtHnKevf0oWb8udiousY3T9eknCbKF/D3KoQfNeTtkf5FHLioJiDNteAvuhN7MC0F1YpFV616Qyr+isoqL6iG8MDWxGOeygemR1amtPvitL53PFk5w+yf8mShIZgcBetqi1X1XsXI=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(136003)(39860400002)(346002)(396003)(376002)(230922051799003)(186009)(451199024)(64100799003)(1800799012)(82310400011)(36840700001)(46966006)(40470700004)(6512007)(26005)(478600001)(6506007)(53546011)(2616005)(41300700001)(4744005)(5660300002)(2906002)(336012)(6486002)(70586007)(316002)(70206006)(54906003)(6862004)(8936002)(8676002)(36756003)(4326008)(33656002)(81166007)(82740400003)(356005)(86362001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2024 16:11:09.4171
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 356df71b-776a-4e66-3b2c-08dc2be539ab
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS0EPF000001A7.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB5698
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 12 Feb 2024 16:11:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195345

T24gMTIgRmViIDIwMjQsIGF0IDE1OjAwLCBBbGV4IEtpZXJuYW4gPGFsZXgua2llcm5hbkBnbWFp
bC5jb20+IHdyb3RlOg0KPiBQVEVTVF9FTkFCTEVEIGlzIGp1c3Qgc2V0IGluIHB0ZXN0LmJiY2xh
c3M6DQo+IA0KPiBQVEVTVF9FTkFCTEVEID0gIiR7QGJiLnV0aWxzLmNvbnRhaW5zKCdESVNUUk9f
RkVBVFVSRVMnLCAncHRlc3QnLCAnMScsICcwJywgZCl9Ig0KPiBQVEVTVF9FTkFCTEVEOmNsYXNz
LW5hdGl2ZSA9ICIiDQo+IFBURVNUX0VOQUJMRUQ6Y2xhc3MtbmF0aXZlc2RrID0gIiINCj4gUFRF
U1RfRU5BQkxFRDpjbGFzcy1jcm9zcy1jYW5hZGlhbiA9ICIiDQo+IA0KPiBJJ2QgYXJndWUgY2hl
Y2tpbmcgUFRFU1RfRU5BQkxFRCBpcyB0aGUgcmlnaHQgd2F5Lg0KDQpBZ3JlZWQsIEnigJl2ZSBk
b25lIGV4YWN0bHkgd2hhdCB5b3Ugc2FpZCBiZWZvcmU6IHB0ZXN0IGdsb2JhbGx5IGlzIG9mZiwg
YnV0IEkgY2FuIHR1cm4gaXQgb24gZm9yIHNwZWNpZmljIHJlY2lwZXMuICBPciB0dXJuIGl0IG9u
IGdsb2JhbGx5IGJ1dCB0aGVuIG9mZiBmb3Igc3BlY2lmaWMgcmVjaXBlcy4NCg0KUm9zcw==

