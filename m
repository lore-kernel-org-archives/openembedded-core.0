Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 342EEC88CB6
	for <webhook@archiver.kernel.org>; Tue, 13 Jun 2023 10:37:46 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (EUR04-VI1-obe.outbound.protection.outlook.com [40.107.8.87])
 by mx.groups.io with SMTP id smtpd.web10.9872.1686652665213266840
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Jun 2023 03:37:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=pL2xZxBW;
 spf=pass (domain: arm.com, ip: 40.107.8.87, mailfrom: ross.burton@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NaS69Pc4Pn5cURpvoZsOktNq5WOex/H0WZl3AbCibyo=;
 b=pL2xZxBWp1QO6HyvI7+G8z/TPWz24goGudV9ShV24C+Pp3KunvJzpdCkoTS02Wv+F4kSKi8h8Uk8xUvZVBVgeOQ8DfYGzRPZLW29Yz1kjuvBP4PM0iY+ah06siM/zg1QXg2KIOOLgeNSEo3JWtzZtpQgc3BsXe3TY8L1XYbzJTk=
Received: from DUZPR01CA0274.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b9::13) by AS8PR08MB8948.eurprd08.prod.outlook.com
 (2603:10a6:20b:5b2::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6477.29; Tue, 13 Jun
 2023 10:37:39 +0000
Received: from DBAEUR03FT024.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:4b9:cafe::9a) by DUZPR01CA0274.outlook.office365.com
 (2603:10a6:10:4b9::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6477.34 via Frontend
 Transport; Tue, 13 Jun 2023 10:37:39 +0000
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
 15.20.6500.22 via Frontend Transport; Tue, 13 Jun 2023 10:37:39 +0000
Received: ("Tessian outbound 99a3040377ca:v136"); Tue, 13 Jun 2023 10:37:39 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 1609bf3a035369d8
X-CR-MTA-TID: 64aa7808
Received: from d4778401e84c.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 06B05D5B-2F32-4517-8F1E-C6B4BD51369E.1;
	Tue, 13 Jun 2023 10:37:33 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id d4778401e84c.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Tue, 13 Jun 2023 10:37:33 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZkRM5MJO2baRaWGkToGSaAWAvhbyEwObGk48uLiSeeabszE9Jqn7NCIHCaqTOThSRP5ZphlC4tWy+RCypAOJ7wQzoKyhpGo5K4/bxq6PQFBgJwkRpnQoCsbCIv14haFZQWJEx02tSZJJZC4j4yw+LP4XMaXnH9WH23iRLBl9eHvz4fXal2y/D7Ck1V5Fj2r714et+QiCqQtwNHiypyWz5iZcaGDXBwjVoJHdakx49G8Il8zcUXpa3OWTH/YIOuvRYbfbHknefKHrbJ6rWlh5i8F+r16CT2CTMUsPsqJ14fES6hyhTdyGUtycNbW2ejrWgDK66WQM9fhdRluoTd67GA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NaS69Pc4Pn5cURpvoZsOktNq5WOex/H0WZl3AbCibyo=;
 b=Lpq7NnFGxHe78hR8qTmAcTFzg4whxj8YTKACyzDz23ZACep3F/5pJ1vWH9eiQYbg9fkOmgze3FWG5cRYTCZPoiZDDD8r/0rcSOtrF21zYIejTfelPOlAdL1P8HTzkypCeNSyi/BWNN3w4K2lfhmNmMTHXYT2HBf0aS4CMD8cbaoATSALAUsMbV1gy9LMpzkHUFQvsGjeoRALegBiP4uWorhrGEDVFFouUsitH/EGNmg2O57eIL4ew4Q+YY1YB9snL0p23yWnxZ+MI+tAUXBmiNWLrj+bbr/qUN8GM+xJ7odb1w4Qr93nYAUY5N6zKe/as6URAfvovVAMz2EHs3H9fg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NaS69Pc4Pn5cURpvoZsOktNq5WOex/H0WZl3AbCibyo=;
 b=pL2xZxBWp1QO6HyvI7+G8z/TPWz24goGudV9ShV24C+Pp3KunvJzpdCkoTS02Wv+F4kSKi8h8Uk8xUvZVBVgeOQ8DfYGzRPZLW29Yz1kjuvBP4PM0iY+ah06siM/zg1QXg2KIOOLgeNSEo3JWtzZtpQgc3BsXe3TY8L1XYbzJTk=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by PA4PR08MB7569.eurprd08.prod.outlook.com (2603:10a6:102:26e::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6477.29; Tue, 13 Jun
 2023 10:37:26 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::eb3c:9b42:21c9:494e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::eb3c:9b42:21c9:494e%7]) with mapi id 15.20.6455.045; Tue, 13 Jun 2023
 10:37:26 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "schitrod@cisco.com" <schitrod@cisco.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][PATCH] cups: Fix CVE-2023-32324
Thread-Topic: [OE-core][PATCH] cups: Fix CVE-2023-32324
Thread-Index: AQHZm5dj7Y7pfguCpEiWh8rR/4lrTa+IjtwA
Date: Tue, 13 Jun 2023 10:37:26 +0000
Message-ID: <686C4180-10F1-4BE0-AD52-CBEAAFB1BE78@arm.com>
References: <20230610123008.4179883-1-schitrod@cisco.com>
In-Reply-To: <20230610123008.4179883-1-schitrod@cisco.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3731.600.7)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|PA4PR08MB7569:EE_|DBAEUR03FT024:EE_|AS8PR08MB8948:EE_
X-MS-Office365-Filtering-Correlation-Id: 32e03478-084a-4a1b-6554-08db6bfa35fd
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 +FcaQaJP74bfZXqB5vJLKqnBbwgGo/iWky9eU8SU3hbwBqYKFb8bfYWjBvejgHeKHY3/IYqKyHx1VvYEBGY+KQYOWKjJu05t2ZvFKGjC4yPWd+iFxdWWdda9yfcpTWWV7RfbsneiwZ6HaoGFrZ663DKrnZfu/R565TKbdOh5c69gW9/0krWtMCBmzl6XI7/PHOPFhRpFci7uTZrne4VY8a9EivjajR9Py2PoFNyJS5E5KscwjhM1mVu3BmNhMzEuDD/N5i2veMTZKPeM5q+Cgmie5DSDMx5saTcBM8XPnfBFkekcgEd3UZef8wB27GZp40Y/eTfZF7KOAVEbTC0+Wh5NcoO4EmpntduvK0RmGXuIoBpHtPhPqZs0c5ZU5wgwHOpPRnCt/6g1nADAIk10bidG5FutawkvBTCMlAC9OsEPCiVP01WqwD1UO3tmzxSxVHBFBegeKJdjqm1T2x9tXXGOIJPtlS68lgQCj8Gd2hyzypWTcm6Jec8iZjRNwiMGDtKaj/24KgrDSR+QJS5DhAoZLuShw8rZzlwwhL24c24qwgQOgMIC2YI1PEQsn9J28lgN1XijKPG9CS0BkUUUccz8WBCNtLqHPgX4U6UbgNEeFEgcfwoYVhve1F5HyUh9Svc00hozvmEXIGtZuZrOpg==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(376002)(396003)(136003)(346002)(39860400002)(451199021)(6486002)(316002)(41300700001)(2616005)(86362001)(6512007)(186003)(6506007)(38070700005)(83380400001)(26005)(33656002)(4744005)(2906002)(122000001)(38100700002)(36756003)(5660300002)(8676002)(8936002)(66946007)(76116006)(66476007)(66556008)(4326008)(91956017)(478600001)(71200400001)(64756008)(6916009)(66446008)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <E5BBF0BF2CE5C3408965D27F936CA90B@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB7569
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DBAEUR03FT024.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	8df971a6-bba9-4db6-512d-08db6bfa2e62
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	w3wUGN2rbmhtv2iE4vfMjElJ0EzNKJ3ecUURzAv/KT8L2+qX7I6wXDT/PaFfN8YTr/X+IixszJQSBZwtmaQg0ik1r7/FtR37sW++my5R1R51imC/KvtWITYLaVgZvWPAc8v5n+sNsd1nheinBNzQjT1Eoonk2odKhtbHzdeN8iAAdDYhWHq4I7XpnmJmiKrckYgY6K/T8GvUGnob0/TpIGuzdx1hxPQShxIGji8MwzDnL4vNnKGQrlXs3jsQJc13GKOEqtGKyx4hNLD5eSFFjPJVOZozPfU7ijwnF5JNUo+/wbYs1M8ZR0aj6rLRWNNK47CjwvGjUUFb1n2SAMWa5KkheGtACc/Hmrl7Hufwlv6UxASUWdC3J6NDG+/cBzbiaZkknrruWJZPgXQwcX4GKUG2yPHln4UQbDFpoVAo6DLzd/TlyM4+s0scWzvZckE/H94KyPhUemnmR78jtIJ9GBHyHBvK1YyE/77sczxPHdNWLxCPERCYVE2vzYnTGdaBOfhp7uEQyadiIE3NeGbkG3iPZexM1MsH0Xs7tFsb0bFfTGjogAmz8OwJsSPSuucf32z6VLk1GxZjbjwZpLL2KoOwjpN3cFkiiVuJ0tdzZVKFe+BQSlJ/do4XERAlmM9S31spyYnRLVqMs7jWtW+XNsWHwOdyDlUbnBCPALSxnQELNed156dl7Z+K4Fjq20cHeghVZ9gS3JDOUkJ5jQ1hUkRff3lyYOjkW+pjo3jCCeMY0YgIPgjhaUDGE1SIsUwl
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(136003)(39860400002)(346002)(376002)(396003)(451199021)(46966006)(40470700004)(36840700001)(36756003)(33656002)(86362001)(4326008)(478600001)(70586007)(316002)(70206006)(6486002)(8936002)(5660300002)(4744005)(2906002)(82310400005)(40480700001)(8676002)(6862004)(41300700001)(356005)(81166007)(82740400003)(2616005)(6512007)(6506007)(26005)(186003)(83380400001)(36860700001)(47076005)(336012)(40460700003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2023 10:37:39.4539
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 32e03478-084a-4a1b-6554-08db6bfa35fd
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DBAEUR03FT024.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB8948
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 13 Jun 2023 10:37:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182708

On 10 Jun 2023, at 13:30, Sanjaykumar kantibhai Chitroda -X (schitrod - E-I=
NFO CHIPS INC at Cisco) via lists.openembedded.org <schitrod=3Dcisco.com@li=
sts.openembedded.org> wrote:
>=20
> NASM v2.16 was discovered to contain a global buffer overflow in the
> component dbgdbg_typevalue at /output/outdbg.c

Copy-paste failure? The patch is for cups but the message says nasm.

Ross=

