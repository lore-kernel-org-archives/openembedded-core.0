Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7AF8AC48BC4
	for <webhook@archiver.kernel.org>; Wed, 14 Feb 2024 11:06:41 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (EUR04-VI1-obe.outbound.protection.outlook.com [40.107.8.75])
 by mx.groups.io with SMTP id smtpd.web11.39318.1707908791148240603
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Feb 2024 03:06:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=IvMahFo6;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=IvMahFo6;
 spf=pass (domain: arm.com, ip: 40.107.8.75, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=eH58SwN5axF4EqAZPHDGpcZcgURZo1cpW3Ix3CKJoXhHYe8JTDn8TBwLRXoDwBzxPQrSL9yjBB3S/5YXg2zE220OEf4vmCaxgeYs7NWVsokoD5N56yE6VGhdLsm7JJbgqYPtkHNfjxGWupxxohe4yNgLBmbz1HzY3q7rTX17Un/56yGKIqhgWMzRVAYUEbcGRXtY7a+L0fdC7zM1gG8pXGwvKVRnE4wQuH5i8UoPlzsOUuLJ2eSrvw2vusScP06r8zev5RFEtc8vjy5Xhz34LWtzx1UBJDLOmnZLpG+ctwyIYiQuJdHHAVLy4Cv+6sDc/F+tHI6bC6BABxvzShZ8wA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9H1Bmmb/+0UMF410tHwlRbH0Q16SXNUeyANikp1P9Lo=;
 b=FiQ91p0TjkvDOcaabex3eO/aHZgx0E3EQkos4ElzGKcH+oefH8CkdKu3BWZ5qUKqPd4mkvI2j3MHB7m1rRYeC7MQ2g+1RrhKjcHk5DXEWdiECF1vKLTyqyx4sGvKXoC8khs1bm2K2eyP3l9A0KblIiEw15tkcUndolIg75YK26ea6xnXKnWud71YZPv8vESeYmSoJ0FU4t8b1fpEwCgBLJXcmCxTXK63CrkR+VGODcqmf8C5L5aShd1Xv588TRVClmQHcKqJIhXzihZKMM1OEIi4FqmBRUcw7AyS0E6pGPJlnyg730pfTYa7F5HMDZQa2dEVYB3YuyZYT8kHuqTDzw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9H1Bmmb/+0UMF410tHwlRbH0Q16SXNUeyANikp1P9Lo=;
 b=IvMahFo6E05Wf+WXigBCYUWNASefooprao6RQ7PFWqK2l/gllRLvu9CBBMHBlhT0JMMLQE1xV9bnlgHgNT1eTStQM3nunR2SS7yEOWOeR6nuBKkqWR2cglpxh2ZAqZ2dkU+1R0YjpJnE1DEkmoIq68+DnwD/OEzMzNSQeKvcR5c=
Received: from AM0PR10CA0095.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:15::48)
 by DB9PR08MB6778.eurprd08.prod.outlook.com (2603:10a6:10:26f::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7270.39; Wed, 14 Feb
 2024 11:06:27 +0000
Received: from AMS0EPF000001A9.eurprd05.prod.outlook.com
 (2603:10a6:208:15:cafe::41) by AM0PR10CA0095.outlook.office365.com
 (2603:10a6:208:15::48) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.26 via Frontend
 Transport; Wed, 14 Feb 2024 11:06:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AMS0EPF000001A9.mail.protection.outlook.com (10.167.16.149) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7292.25 via Frontend Transport; Wed, 14 Feb 2024 11:06:26 +0000
Received: ("Tessian outbound 778f5fac34db:v228"); Wed, 14 Feb 2024 11:06:26 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 46502cefc90ed940
X-CR-MTA-TID: 64aa7808
Received: from 7d114b2d69e1.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 510A7427-D471-42AD-BE60-3D5E4180789E.1;
	Wed, 14 Feb 2024 11:06:20 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 7d114b2d69e1.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Wed, 14 Feb 2024 11:06:20 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZUjAkniMQOuvDiJbegv/9tOn4U1yf60kbrNWWi5dz3fo2cM8dHJB0YyioxQjZ8huxD94+DDE7YXzuOY9yFWbDqYmpvG8QbYYrZvF1flAC7O5l9SUWAs9UVLA+47p4cNlRvzP2cJc+Lfgpkvbcbvak4TJ9OsT0J9FTzzUWcWBh5R5NXA8O6FHBVWRJXp1CHUmKqam05HaPcwBQd21rtO/T31dXvmcmVWGKTrfqfcxK0sbTI7S2WpE4vRagrlBewYqZpClrpaqqPN7nKEkg6x+nW+8ztzr/7T9uK7YCL9mOJM49yXaYUXCYWeescbStQq1il1EzU5XJOIrcfbS2pllgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9H1Bmmb/+0UMF410tHwlRbH0Q16SXNUeyANikp1P9Lo=;
 b=Jp7LB4G2moUg0zFFlk7cwmWgAJPVuGlLg2OQOENzBI3Q1ivck6bQ6jtv3DyXd+TwW6/1S2TvtkVzH+seGARqZmHC0NsJpe5Bo26Wo5OeQqPfT2H2CyV6u5OuguazscmZBtbQHcno+6RryLUiqGLSBcXgVIGfJvnxVbvvddQ3sM5LPgQN4uk72eMcXiBs/Q+7uK+m1ibqgrXG917MQwLgOWsdtJQDud0O/CQI3/+G3VprSftPSgbLSom/ulRpF+uie8/EDWNxs/pXL2l5LnW72cP+L6glNeA0AplikNDBsBYVSLGgutH+dsEFnaKJt1UnWumVQARznQ80XOTdvbzw3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9H1Bmmb/+0UMF410tHwlRbH0Q16SXNUeyANikp1P9Lo=;
 b=IvMahFo6E05Wf+WXigBCYUWNASefooprao6RQ7PFWqK2l/gllRLvu9CBBMHBlhT0JMMLQE1xV9bnlgHgNT1eTStQM3nunR2SS7yEOWOeR6nuBKkqWR2cglpxh2ZAqZ2dkU+1R0YjpJnE1DEkmoIq68+DnwD/OEzMzNSQeKvcR5c=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by AS4PR08MB7504.eurprd08.prod.outlook.com (2603:10a6:20b:4e8::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.26; Wed, 14 Feb
 2024 11:06:18 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::740e:ab01:e66a:61c9]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::740e:ab01:e66a:61c9%3]) with mapi id 15.20.7270.036; Wed, 14 Feb 2024
 11:06:18 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Mikko Rapeli <mikko.rapeli@linaro.org>
CC: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] qemuarm64: maximise the emulated CPU
 capabilities
Thread-Topic: [OE-core] [PATCH] qemuarm64: maximise the emulated CPU
 capabilities
Thread-Index: AQHaXpuskZjEfk3qxEW4sPUWQUmuQ7EJrfSAgAAAcoA=
Date: Wed, 14 Feb 2024 11:06:18 +0000
Message-ID: <0337531C-A455-4011-8641-F892DA243B81@arm.com>
References: <20240213164223.263232-1-ross.burton@arm.com>
 <ZcyeP_-leKRqfafa@nuoska>
In-Reply-To: <ZcyeP_-leKRqfafa@nuoska>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3774.400.31)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|AS4PR08MB7504:EE_|AMS0EPF000001A9:EE_|DB9PR08MB6778:EE_
X-MS-Office365-Filtering-Correlation-Id: fa988115-85e2-4a15-772c-08dc2d4cfd38
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 /nIzyfJe+sQDRFIwFHevnrgyh//LAtJH6jrs+UQl80RA/pyoocGnh5rYKdNN8Md7iocxQVOY7oES3bJ6iI2LlbRLOhPrQSicw2I2aSuOqyKXHC+xwvzVS4ydnno1lSXnYeVG4XeC27J4XO3+QwrpX26gr04PsAUyb5rc/jMYI5tWgUJye99mfQrP51WqsoyNldWmNnvhL9FaNfzs04rr6Qvfwyu+TfFvtTjKVy6vQgpO3jmr+OHpf13kgJzGVxpCRJuQlygAhJmfOkYv7n9jh+4Qeg/2JSkY1p5vibmm2YI7Wi8dIe14r/lEf74gDRe0a5NyLDIZSdCuDjfOIqkB6gXJ9q2KtFIByaG6xLQFEJJvWcnD4hHujg0hnrKlQWCEJQHvtFrtEW4z7Bml3vFyk1c9unuHbTktS5eIgC1/YzW/Izde4CU2aw99LROHMm88dgUFTLIQXYyY2GgYK+oZSuI57TS17g5EX+I2W7BxKyAwG+fX3lzwNjiLaW8YULn+eS2dG9p2pWYtSo5OeZIze1d2dzPiUgnCmbijpXqb69I2w9nPY549u7TVEiFm96nSXcm32gNl9hESirr5xfaKbfm2/h+HiBa2caqZy8FK3hQTjJLgRbRhOBfRHqFM/p7H
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(136003)(346002)(366004)(39860400002)(396003)(230922051799003)(64100799003)(451199024)(186009)(1800799012)(53546011)(478600001)(6486002)(6512007)(6506007)(2616005)(41300700001)(2906002)(8936002)(6916009)(8676002)(4326008)(4744005)(5660300002)(66476007)(66556008)(64756008)(66446008)(76116006)(66946007)(71200400001)(316002)(38070700009)(26005)(83380400001)(38100700002)(36756003)(86362001)(33656002)(122000001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <592AD73FFDB74C4FA5DF1DAA69BCE508@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR08MB7504
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AMS0EPF000001A9.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	0908a6bf-01d5-43c4-3f1c-08dc2d4cf816
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	YNj1NpntZZXCwrxjKoug6gwbURKANbGRQ7kG/ZHT1UgNdRsfOgiJ4l31rS945HTb7+OkE8ceLB/WHq4tL9ZllrdL4cx24ltN1ma1IrB8G4nky1apCQ0wcNKKK9Wt5A+tZSF8GmzKHlFKGtEYBJO+kknutZW8ki9Ld9VbFTWWQR5WMZc91+/pbn1rLb3qdOCYb1HMaoZz2stTeoUvUb/UPuiIIMWUdwUj+YCCkiXALOLrXYJvI2qMJR4fTHxmfpHgPrJDGV6BbtiQ3Ns7CuzW7Sce0ZpyhFvDf7lKwL5yxAGMK22UwuXGoRm99/7PQuruXD3oHWLyflvFjHRymMfPssAnGYWfRHsfHo7pUk6/V/s3ektrstTB+sLtOkEstJpVPp2vYncQXbtC/s9fAi8LEURcSeCoJCvBzV4eiyHGL0B1I8wKr/HX29Hh5o3JO6HCslJe5X2uMsVRod3ChVQOETNGUpwvrqvlcX+q8sn4/AFoBgQfk8Zu0iSYvEcwstJWCWeOObz9uzO3XLoS5Wr/w4NkFxSVnTgH7QqBxxJOCu7vN1An5OOXc+TIXRO/xc8qvkyeuSdlQx9k8r3HGtHUNKOFQwkVjcbCjOfH/n0doaE=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(346002)(39860400002)(376002)(136003)(396003)(230922051799003)(64100799003)(451199024)(186009)(1800799012)(82310400011)(36840700001)(46966006)(40470700004)(478600001)(6512007)(6486002)(41300700001)(8936002)(8676002)(2906002)(5660300002)(4326008)(6862004)(4744005)(53546011)(86362001)(6506007)(70206006)(70586007)(316002)(83380400001)(2616005)(336012)(81166007)(356005)(26005)(82740400003)(36756003)(33656002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Feb 2024 11:06:26.8399
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fa988115-85e2-4a15-772c-08dc2d4cfd38
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS0EPF000001A9.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB6778
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 Feb 2024 11:06:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195467

T24gMTQgRmViIDIwMjQsIGF0IDExOjA0LCBNaWtrbyBSYXBlbGkgPG1pa2tvLnJhcGVsaUBsaW5h
cm8ub3JnPiB3cm90ZToNCj4gRldJVywgdGhpcyBjYW4gYWxzbyBiZSByaXNreSBhbmQgY2F1c2Ug
aW5zdGFiaWxpdGllcy4gV2UndmUgc2VlbiBib290IGhhbmdzDQo+IGF0IGxlYXN0IHdpdGggb2xk
IHFlbXUgNy4yIGFuZCBrZXJuZWwgNC54eSB3aGVyZSBzZXJpYWwgY29uc29sZSBkZXRlY3Rpb24N
Cj4gZGlkIG5vdCBjb3JyZWN0bHkgd29yayBvbiBldmVyeSBib290Lg0KPiANCj4gSWYgdGhpbmdz
IHdvcmsgbm93LCB0aGVuIGdyZWF0IQ0KDQpJdCB3b3JrZWQgb24gdGhlIGZldyB0ZXN0cyBJIGRp
ZCBsb2NhbGx5LiBJIGRpZG7igJl0IHJ1biBpdCB0aHJvdWdoIHRoZSBBQiB5ZXQgdG8gc3RyZXNz
IGl0IGluIGFueSBtZWFuaW5nZnVsIHdheSB5ZXQuDQoNClJvc3M=

