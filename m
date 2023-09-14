Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07047EDE9BA
	for <webhook@archiver.kernel.org>; Thu, 14 Sep 2023 12:25:29 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (EUR04-HE1-obe.outbound.protection.outlook.com [40.107.7.89])
 by mx.groups.io with SMTP id smtpd.web10.10776.1694694326328559894
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Sep 2023 05:25:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=UKalv05v;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=UKalv05v;
 spf=pass (domain: arm.com, ip: 40.107.7.89, mailfrom: ross.burton@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RoUid00aEwiwF6fsuI4AnGdFcEesvGHBlyNfZ5KJxfM=;
 b=UKalv05vpzarNE2n6aiZkeFZsbNBPgyaXb63rp7lzkuOK3Q7z/kzX0BQzxfGJO6GzHn7+4nZbzrD+ak5bvnR2DZDFaQxGbYujU+5v+KkzJdHMdoFvzjMPAE+rNbB36GtHGYHOtIREi4QBIb1EoRdeOK5U7zwlR9f1CU9O+jAR/o=
Received: from DUZPR01CA0343.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b8::23) by AM8PR08MB6450.eurprd08.prod.outlook.com
 (2603:10a6:20b:317::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.19; Thu, 14 Sep
 2023 12:25:22 +0000
Received: from DBAEUR03FT024.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:4b8:cafe::f8) by DUZPR01CA0343.outlook.office365.com
 (2603:10a6:10:4b8::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.20 via Frontend
 Transport; Thu, 14 Sep 2023 12:25:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT024.mail.protection.outlook.com (100.127.142.163) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6792.21 via Frontend Transport; Thu, 14 Sep 2023 12:25:21 +0000
Received: ("Tessian outbound 1eb4e931b055:v175"); Thu, 14 Sep 2023 12:25:21 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: d47893127fab61c9
X-CR-MTA-TID: 64aa7808
Received: from 594b42897ba9.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 39F6D090-3813-43D4-A9A7-27F160760BC2.1;
	Thu, 14 Sep 2023 12:25:14 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 594b42897ba9.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 14 Sep 2023 12:25:14 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i9Ba8XWDQv5+ekhRklPHL+5SQKAHjBTfUFx70zO4A7LMgWj5D4EUNyWxQmepEZ3XOXCkuuEmp9snTPIHwrHXABxlygwhzVmTZtw52svLLoMqMSWpiPBX1nNhok+/JbD9Zsk5CBAFoTbBs/pxtTl2huRetVZyaJm+bbcVe+1WEDk5KAF5bvgtU/6YVKmipG6pWLB98NUvv4h+/oxkHUaJ9vvuf3s3+KixN8HGJf1iY3ScVnLNvrs/ecf1QVVaDw9e0rD/GVO6OTRXhf0NZgeGvXKVjrcYffKZwiS9KwGiWAcOEQ4K44dN+P7y3VIPGfWGVtAiApe13yXyCg7cvUKOzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RoUid00aEwiwF6fsuI4AnGdFcEesvGHBlyNfZ5KJxfM=;
 b=g2b5Ahz8wYt/UuiGvfTkzOfkRSSBVCG60+283dBvrh5ZZwFiX3nX1YCgMx3oNun9xQDTVM5VJ1ISEh1//4kQvmpZak9ZMnVIOAxZGQYqUoaDY7c5iBIkgyboYPLzoYK54a3CMnWdOs9hP7KO7TOj5pPd4e5gaxkq3fGNEzGt1QR539bOXJz1ZGeTUSLy0CC5LeKLYDleH7wO9rfEMVgtJjII89H5yPQD1iJ6hU4vzO7s+ZJCeiZItUThLq2+iQ3r6hbesmmFCr3w+lJUb3nKlbLxRBsW4ZWlNEbFNHPUVKxyLKxYj1JFrGniAf2mPda6EJt6tf6pQtFGqHFa2jpDXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RoUid00aEwiwF6fsuI4AnGdFcEesvGHBlyNfZ5KJxfM=;
 b=UKalv05vpzarNE2n6aiZkeFZsbNBPgyaXb63rp7lzkuOK3Q7z/kzX0BQzxfGJO6GzHn7+4nZbzrD+ak5bvnR2DZDFaQxGbYujU+5v+KkzJdHMdoFvzjMPAE+rNbB36GtHGYHOtIREi4QBIb1EoRdeOK5U7zwlR9f1CU9O+jAR/o=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by DB9PR08MB8359.eurprd08.prod.outlook.com (2603:10a6:10:3d9::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.30; Thu, 14 Sep
 2023 12:25:12 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::4b8a:7518:c642:5727]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::4b8a:7518:c642:5727%7]) with mapi id 15.20.6768.029; Thu, 14 Sep 2023
 12:25:12 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Martin Jansa <martin.jansa@gmail.com>
CC: OE-core <openembedded-core@lists.openembedded.org>, nd <nd@arm.com>
Subject: Re: [OE-core] [PATCH][mickledore] gcc: Fix -fstack-protector issue on
 aarch64
Thread-Topic: [OE-core] [PATCH][mickledore] gcc: Fix -fstack-protector issue
 on aarch64
Thread-Index: AQHZ5Z4cEJdIJcX7gkaT2g6LZVaXerAaCqaAgAA3FQA=
Date: Thu, 14 Sep 2023 12:25:12 +0000
Message-ID: <3D657BCB-3B69-45CA-81EE-9F5EF1E7BA86@arm.com>
References: <20230912172439.2336327-1-ross.burton@arm.com>
 <CA+chaQdGwohtDJFPa=pyVM+ST1BnWbd5Y9bFO7cWL7KbExtTAA@mail.gmail.com>
In-Reply-To: 
 <CA+chaQdGwohtDJFPa=pyVM+ST1BnWbd5Y9bFO7cWL7KbExtTAA@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3731.700.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|DB9PR08MB8359:EE_|DBAEUR03FT024:EE_|AM8PR08MB6450:EE_
X-MS-Office365-Filtering-Correlation-Id: 10105551-25ad-462f-4ab4-08dbb51daa1f
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 cxQF9ucmv1FQq9qQ8IzabXazH+hAKGg2UQur8haZ1ELwxiIjq6LsYky/9VZ0EX/wxchlpUYDNyRrQ8jHGex86m8ZKvUEAJYVJ6/F8hJCIfRsiBb7Cksxb9q3ACAKir4QR9j50pqcffkV7SxePpfIQtzsgr+Uur6OypIOkDqtSjeccqU4o3W3V9S8eW52d2C74b49V4PP9x+NKTv9nEIjzYJr2g+MpK4oX+RwiQQGlvmI5BqwNGrxGgOchHMc/F6p/mw7/FsXmr9xbSifv0UEYflHDPrei9f6n4FQGl1F0EBn78gEj3UKkC/+OmTtgi9iL1lUoaQT4qoRob8VolVH4P3/ZHS58XJXnw2h3IQ1hhEcMzQuOeQX6QhsNoFQ0HoYuypfAD/VnhQreYeCA9SAVpQnpvzlgAZo8LkrcIQe3lo870xHagLUeTp7v3y+8zXTt8tj9oaaT77VNHD2+o+UvaRvbMM4TxcC/QyYQGqxvSRbsoL1aevJr0pUHAf80Ms7f9LUW+wT4DUqRUMYv4j5KaQ5dU16x4wgUxFhfatW4qWKFuucUpZ6A1xEzSdVpNlq35paFq44WeMFVm3FjeF8+7RJhFnQLVpJnJzE6t2j6iXXel7WvVSCfIDoBBlQgX/97KldeYtlTA863+uG1HyF3g==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(376002)(346002)(136003)(366004)(396003)(451199024)(1800799009)(186009)(2906002)(5660300002)(4744005)(4326008)(8676002)(8936002)(26005)(41300700001)(2616005)(122000001)(38100700002)(6512007)(38070700005)(33656002)(53546011)(66476007)(66946007)(316002)(86362001)(66446008)(6916009)(54906003)(6486002)(76116006)(6506007)(91956017)(478600001)(36756003)(66556008)(71200400001)(64756008)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <C92B7DCFFF4ADE448145EF3E15A2C2A4@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB8359
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DBAEUR03FT024.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	35e3abdd-0a65-442c-7c93-08dbb51da493
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Ek+F0kp7F8k2USK1002OGMGqzxL9xhfB0e0syMn6p/JZiPe0VIdHCXlBIEMPYjVVKICW29WG6aTESivMr2PGGNZ1SIR71MkaJ05Cyp48H6MTUqvyHMqWw7woTt0JwCLYJaboJJ2WXdjbmcNr3//L7jkfyagJR6G4iYnJ0D2vg5bnxS8JBB80ghZD43EIv2vRHf1uJJVW4DmBQmx65fbpFi1ygVDGKR0ZIVienazfgOePpiU6aZI+1tjIxoih6Fk/7FvCXmDKGH5wWQsP/9ZEZffD+DzZnENsDPpBSniFYQSq252VNkVVbcK9zzTenII5MYCNwUyTVAJ6564XsL6VRCjOTpdLzUQcRcWKE2lphUDwoWkI12sNYU6p3W/XWEeDGt8pOqoKVMjSmrbBArRb0HYwYP0HYzULHckFwG5GrRapAB/f8jLIW+C32EMr4OqPquG1u9jd4N/RIlPxQX58SRgCIxTQdvM3MHvh4TNZjXXyhFal/FTQ1gqBig+8CGKac0on6hH/Tyow5ycHeuyiqfEFr8PhGEwx+WC9N2/nWD778VTISyMD5PUcJZzZNmx0hJAVfJlZ9tubKX97eleJUQplIHpgSj8FKyXtP5wPBdUlarbzkMf8XSwdakNbhWitj01DnxCQUuj16gDo9sUQIzsG7U8SEyU+UCHC9OqQBbcmvl3JY7o4AhZwQUfMOjjsIbeHMDwt7Rn+I/pn97tQfjID9SJ9peMfDHTfVl+aRXovL4nUpqIfpQiMLKrnQz0M
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(396003)(346002)(376002)(136003)(39860400002)(82310400011)(186009)(1800799009)(451199024)(36840700001)(40470700004)(46966006)(4744005)(6512007)(53546011)(82740400003)(356005)(2616005)(81166007)(86362001)(336012)(6486002)(6506007)(70586007)(36860700001)(47076005)(478600001)(70206006)(40480700001)(26005)(40460700003)(6862004)(8676002)(8936002)(316002)(5660300002)(41300700001)(54906003)(4326008)(33656002)(36756003)(2906002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2023 12:25:21.5757
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 10105551-25ad-462f-4ab4-08dbb51daa1f
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DBAEUR03FT024.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB6450
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 14 Sep 2023 12:25:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187638

T24gMTQgU2VwIDIwMjMsIGF0IDEwOjA3LCBNYXJ0aW4gSmFuc2EgdmlhIGxpc3RzLm9wZW5lbWJl
ZGRlZC5vcmcgPE1hcnRpbi5KYW5zYT1nbWFpbC5jb21AbGlzdHMub3BlbmVtYmVkZGVkLm9yZz4g
d3JvdGU6DQo+IA0KPiBGWUk6IG9uZSBvZiBMR0UgcHJvcHJpZXRhcnkgY29tcG9uZW50cyB0cmln
Z2VycyBJQ0Ugd2l0aCB0aGlzIGFwcGxpZWQsIEknbGwgdHJ5IHRvIGZpbmQgbWluaW1hbCByZXBy
b2R1Y2VyIGxhdGVyLCB0aGlzIGlzIGp1c3QgZm9yIG90aGVyIHBlb3BsZSB3aG8gbWlnaHQgaGl0
IHRoZSBzYW1lOg0KDQpUaGF04oCZc+KApiB1cHNldHRpbmcuDQoNCknigJl2ZSBmb3J3YXJkZWQg
dGhpcyB0byBvdXIgdG9vbGNoYWluIHRlYW0uICBJZiB5b3UgY2FuIHdoaXR0bGUgZG93biBhIHJl
cHJvZHVjZXIgdGhhdCB3b3VsZCBiZSBfbXVjaF8gYXBwcmVjaWF0ZWQsIGJ1dCBJ4oCZbGwgc2Vl
IGlmIHRoZXkgaGF2ZSBhbnkgaWRlYXMgYWJvdXQgd2hlcmUgdGhlIGlzc3VlIG1pZ2h0IGJlLg0K
DQpSb3Nz

