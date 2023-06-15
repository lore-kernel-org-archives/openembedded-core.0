Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2DD0BEB64D9
	for <webhook@archiver.kernel.org>; Thu, 15 Jun 2023 15:10:52 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.81])
 by mx.groups.io with SMTP id smtpd.web10.21190.1686841851309953509
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Jun 2023 08:10:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=PEShjtrj;
 spf=pass (domain: arm.com, ip: 40.107.20.81, mailfrom: ross.burton@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LVcczHNj3/MZ/zXm65SsbgezQghX7AwcPUAvM99ajDU=;
 b=PEShjtrjgUqiLPm9dOgeXi9tQnvtwODpRa+oO7I6LGQz9Fm38bkPqerAKge045JGeo0nia5l3tocSSCBJlQY1LSXz/IwsY/4BufI5o7/562AVum6AgmhBiaY5tsk7/G5KmytqrSorsAEOAZXdJRsJbU81cOenhAivscoCLEwlNU=
Received: from AM6PR05CA0032.eurprd05.prod.outlook.com (2603:10a6:20b:2e::45)
 by PAVPR08MB9482.eurprd08.prod.outlook.com (2603:10a6:102:318::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.25; Thu, 15 Jun
 2023 15:10:48 +0000
Received: from AM7EUR03FT004.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:2e:cafe::b7) by AM6PR05CA0032.outlook.office365.com
 (2603:10a6:20b:2e::45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.25 via Frontend
 Transport; Thu, 15 Jun 2023 15:10:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT004.mail.protection.outlook.com (100.127.140.210) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6500.25 via Frontend Transport; Thu, 15 Jun 2023 15:10:47 +0000
Received: ("Tessian outbound 945aec65ec65:v136"); Thu, 15 Jun 2023 15:10:47 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 25f18f6e3cbd16fe
X-CR-MTA-TID: 64aa7808
Received: from fb04f4344055.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id A7270FAC-8193-4DC4-8920-D014610F1BA1.1;
	Thu, 15 Jun 2023 15:10:41 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id fb04f4344055.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 15 Jun 2023 15:10:41 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BNHNFI21LLTgUgZakAzEENRBkypmdY7VweiK6fXQ8rNjfCBhZDRgT4SkdBvZpVFyLQxiNVOlcIgvtv81wZhPY1wN8CBw569aNvvvRojtIGijSEmM/MGJMhkxOnKcY4dEiofDvX+eh4mvLxFx5LW12yS4tJY3nr6//pchrA42fbxaMgUw6ewkDKqUUsHr/ka24ArLujguW32JQDWJw+9plsNzTtRn1fFcvkW5Sg3SVRvGiDN4LOZKDnFNQAl3z5ti0DveEsqA3Calkxk6iRfh1jqZjZFxFYqiY3jivJIuTlx1u+CzO5uW8II0wIRtS/SqOnZ/crEhMTLRsqq8aZe4pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LVcczHNj3/MZ/zXm65SsbgezQghX7AwcPUAvM99ajDU=;
 b=Ao+v7f5cZo99tDLRFoefvxluqffMRNbBf7Zy9dd9QpgAd/uwPvW1dSU2a8Y69/5ekh3ojzUzJ+6WBbrIDDWDLnxj6LuQr5RXDHz7VGJHE/P1Zz6XCWh8ZpRyBb8DtnhcMDcCkONwFOtvJNIBpAxTjtJ7wnNX3o0r5fCYvaCMD35/ZaAIey2sCYCaPJRMeORvFT8LfdgdLVHcxmTXuclCsD1KQ7GUxS2Ymen2rY/jwOTv7uEUQirWC/7qOxOn1gZIdPYOFUKK7RvMUHW5D0dZCIV5wvcRpnmEKxoYGItn5SHOJO8q7ig4H2hDV5xxWKd4vai5r8v341FLME1c9XByGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LVcczHNj3/MZ/zXm65SsbgezQghX7AwcPUAvM99ajDU=;
 b=PEShjtrjgUqiLPm9dOgeXi9tQnvtwODpRa+oO7I6LGQz9Fm38bkPqerAKge045JGeo0nia5l3tocSSCBJlQY1LSXz/IwsY/4BufI5o7/562AVum6AgmhBiaY5tsk7/G5KmytqrSorsAEOAZXdJRsJbU81cOenhAivscoCLEwlNU=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by AS2PR08MB8646.eurprd08.prod.outlook.com (2603:10a6:20b:55d::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.33; Thu, 15 Jun
 2023 15:10:37 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::eb3c:9b42:21c9:494e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::eb3c:9b42:21c9:494e%7]) with mapi id 15.20.6455.045; Thu, 15 Jun 2023
 15:10:37 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "alex.kanavin@gmail.com" <alex.kanavin@gmail.com>
CC: OE-core <openembedded-core@lists.openembedded.org>, Alexander Kanavin
	<alex@linutronix.de>
Subject: Re: [OE-core] [PATCH 06/55] sysfsutils: update 2.1.0 -> 2.1.1
Thread-Topic: [OE-core] [PATCH 06/55] sysfsutils: update 2.1.0 -> 2.1.1
Thread-Index: AQHZnqLbSEeqPyIth0ydjQoV1QhOfq+L+cEA
Date: Thu, 15 Jun 2023 15:10:37 +0000
Message-ID: <9BD4E811-53FB-4468-99FF-FC6E50FE54C6@arm.com>
References: <20230614092918.4065570-1-alex@linutronix.de>
 <20230614092918.4065570-6-alex@linutronix.de>
In-Reply-To: <20230614092918.4065570-6-alex@linutronix.de>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3731.600.7)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|AS2PR08MB8646:EE_|AM7EUR03FT004:EE_|PAVPR08MB9482:EE_
X-MS-Office365-Filtering-Correlation-Id: 1da796d8-c58e-4ed2-5e53-08db6db2b328
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 cEq95JPueEdsBLH104iqFudEzAkSqb4WQ+nxr69FetIOPBAME3jGF9/06Utrgo7/YXGy2u9Qxym9AQmpTIy9DOlGxXWhTZGfHJiCeJLUFjjnzkRzKKwnMa12LJIjEJCnkWSKIMEoau0B01R1enPDyWJonwv/Q5x7eHu3KFbof7gco5u+s+ODvfIEjy9Puzq0Ot2Vd+xMotjDyOZrt8awAf3XjxFH+RpJETmCeN2F9aolqmSX7jExpGmCIyDCgifdibceTcwilBA9i0hA/HguQtmjlRllhQ4F0ltUlFiUJd9EOic8Aa+qRvIOgdzTytdHaW02fsSgUpEpqj4qTKfNH+wb8NL9kHCA/xoBfpDFGer2/EX6OamtKbTRnAjTR4TrY5QbHCxvKjCrSmVkfKk7yo41eMoBRv/mhvmIrtVfbN9PBSTqOTtoOID7Ts1XUFHU7yMW/k9axI/B2sK8T4XC/4OMzhQS3908foWaEbnt+H+iB5Iz266SQHIuu9txN9AOqZgGVAXOKFoO9i7Ks1g0RQjSkIhO+DZPxYZqG6w/aJv7c0Kq6fTu7egYH3VfCIIaFn9FsA1r4mwfohfG1TUPPAMbnDxYteaC/lt3uORqiKmxudP2l5cwdpsyFCNRufH9QL8NROeIM6z5xKgBkg0gPQ==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(346002)(396003)(39860400002)(136003)(376002)(451199021)(83380400001)(33656002)(5660300002)(4744005)(15650500001)(53546011)(38100700002)(122000001)(38070700005)(186003)(6506007)(26005)(6512007)(2616005)(54906003)(71200400001)(2906002)(6486002)(41300700001)(36756003)(66556008)(66476007)(76116006)(91956017)(6916009)(4326008)(66946007)(8676002)(8936002)(66446008)(478600001)(64756008)(86362001)(316002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <394DD221CBD2834186FF672E6289027B@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB8646
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM7EUR03FT004.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	4fadbbd7-eb68-4b46-dc46-08db6db2acb9
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	NYet5MX0S237pdr1oJyLsKiPR6JescaK5ZVl1NLOJ38/JkD+GciLqkT5hqk+BIMOX6+BjwNkwu0kvkvjWXMY8liEiGV0iuvrN8gC02o7qjDBoq3CpixfNgnV/lPsRazZ9cMym912r/pRI1E++i1GC2y6dli5emGbgvX35HJeh3D4wv6pu/iNcpV9a6ur0+b+IFojdhipa1IvREI43qcixAcmXsAeobBe4xnksQ4NqrQND1j4ewr+g76z9FOASnuOVuHIplRokuG7erdpTVcaMu4SyHro2Qbm6Nk51Yg26G9P1a28HqmFpc5hB6RHDbYgXti6O+awVD8JmBCcA4UTXKTgttnnuFQGah/IG4gg1xm8AymfGOP5ht1XxGEKlTeacxe9WKTXc1TZKp5ewg44ZUJgMCs+UdRLrgGlR5rUTBhO1g+aULHnhPq9vGOAb7F901DZ43pxIvqg7wn8FRuEeR0ZG4eIgsMYM3LTRIDak6tc3pvyZjM5zu2fMoyl9MJNU5MjyqrIONp4qg7cJ8HMknHcL+tzM8C1Tz8I86FdBxm/fWxtaF1a3C/wf20TeB6yxN4p0pixxj2/LI6TWUthadyjFnYidL4mTfUbMXH9G0zsOp+PXwjNWNmfyKsRrBrg8ZaQY5ZSjq+CnfTmKwwnf5sjbwXfh9c6UiCYtl/R8+wyXw0milJriRGzdttkJStWlIeUXD6Vpnl5Pu0Dm3kOz0wxRaMPJwjyHT2riYawJbXGR5V93FB90mYb6UGk1YOM
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(136003)(376002)(396003)(39860400002)(346002)(451199021)(36840700001)(46966006)(40470700004)(40460700003)(5660300002)(82740400003)(6862004)(81166007)(356005)(336012)(2616005)(53546011)(83380400001)(6506007)(186003)(2906002)(4744005)(15650500001)(26005)(6512007)(36860700001)(107886003)(47076005)(478600001)(40480700001)(70206006)(316002)(33656002)(8936002)(6486002)(8676002)(41300700001)(86362001)(82310400005)(70586007)(36756003)(4326008)(54906003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jun 2023 15:10:47.9961
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1da796d8-c58e-4ed2-5e53-08db6db2b328
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM7EUR03FT004.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR08MB9482
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Jun 2023 15:10:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182863

T24gMTQgSnVuIDIwMjMsIGF0IDEwOjI4LCBBbGV4YW5kZXIgS2FuYXZpbiB2aWEgbGlzdHMub3Bl
bmVtYmVkZGVkLm9yZyA8YWxleC5rYW5hdmluPWdtYWlsLmNvbUBsaXN0cy5vcGVuZW1iZWRkZWQu
b3JnPiB3cm90ZToNCj4gDQo+IERyb3AgYWxsIHBhdGNoZXMsIGFzIGlzc3VlcyBhcmUgYWxsIGZp
eGVkIHVwc3RyZWFtLg0KPiANCj4gTGljZW5zZS1VcGRhdGU6IGNsYXJpZmljYXRpb24gdGhhdCBH
UEwgYXBwbGllcyB0byBhbGwgZXhlY3V0YWJsZXMNCj4gKG5vdCBqdXN0IHRlc3QpLCBmb3JtYXR0
aW5nLg0KDQpUaGlzIGRyb3BzIHRoZSBwa2djb25maWcgZmlsZSBpbnRvIC9saWIvcGtnY29uZmln
LCB3aGljaCBkb2VzbuKAmXQgbG9vayByaWdodC4NCg0KUm9zcw==

