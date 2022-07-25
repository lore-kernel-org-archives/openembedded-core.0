Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E76CBCCA473
	for <webhook@archiver.kernel.org>; Mon, 25 Jul 2022 13:59:27 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.41])
 by mx.groups.io with SMTP id smtpd.web11.28344.1658757564682022601
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Jul 2022 06:59:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com
 header.s=selector2-armh-onmicrosoft-com header.b=lg49Kg1o;
 spf=pass (domain: arm.com, ip: 40.107.20.41, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=BzO7lrNSemjKEIW3rQtzijbzQb3EQUzY34xukBLdULQ10n6CRxv711yLnM7XSrBnils8bOCeVDT8Eh7MeUmC6FQEBgsFQU1SLltp2z+CSGN2YIQCxGV36I6vcg7mYK1v+odRzbx2RQRbB0TUpil8tLIN+ODv7uuBGJtcrVR75lOlvIGz6Hn7RzZCz8uOn44MPmXiLTKeMuK1DTyW2MqT42rgxG/aLcRXhs0q4Mh8qWuFfzML9WIkfjpJ2EI40TLeFAOvv5SNC315JEkHO5DGxoXY8OgBRxwtBHHA5vXBLRjmHD343xtIRNCrvHrct8NPRSdqwJtSyZ1ZrKfy0t1Kdg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VeKMY0Q4637xJYrRaRZyYutjefwpTFjOcIRjcIKElLY=;
 b=cIhf+Go0dT3UsqCrsIcYLsBjtuwv9yiLDP4GDRQyucliOL8yvZ/Z+ynviORdv4hlzlsYkuBr/lzXhQTC+xZzG+bgLZZXYBCBk3BHqKAe+IlEA7v7F2cuPlHMS97Gt5uGggyWjRO4VH3rd0/uwcIEVAU0TwemUoQNVeEQKuPA45pNmGTnrBVuvYzBXl5euLb60HhHJC47bXRSX4WuimZIx4/zEUIJBRo3DGNDZZUkfGEB1v1yKi+kub+M6QuBL1XQegxndoYlA0lCU8kHe72BtC5XK7ZhUoK4OSU/A+pG2/0Z+8ctXBxGSZ2GhTV5KIx9ufSnwyij4p/DpHFDEDBm6w==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=temperror (sender ip
 is 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=arm.com; dmarc=temperror action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VeKMY0Q4637xJYrRaRZyYutjefwpTFjOcIRjcIKElLY=;
 b=lg49Kg1o3YKXpGXh6WCLiPBUagAKUt+GeyS0EHjKRW7yWScYQKBQODinjVoxEITvqb1OFKphcpvmk+KLPJ1CZGMN7vFCjTz6hNBcIpZ4BkZtbb8XzOGrLfGAqDGkODi83lraWPQJT3Jzfr5XIBjVkQhqIXqn2ouw2YBSXx9b2DE=
Received: from AM5PR0701CA0069.eurprd07.prod.outlook.com (2603:10a6:203:2::31)
 by AM9PR08MB6132.eurprd08.prod.outlook.com (2603:10a6:20b:2d7::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.19; Mon, 25 Jul
 2022 13:59:21 +0000
Received: from AM5EUR03FT051.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:203:2:cafe::1c) by AM5PR0701CA0069.outlook.office365.com
 (2603:10a6:203:2::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5482.7 via Frontend
 Transport; Mon, 25 Jul 2022 13:59:21 +0000
X-MS-Exchange-Authentication-Results: spf=temperror (sender IP is
 63.35.35.123) smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=temperror action=none
 header.from=arm.com;
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of arm.com: DNS Timeout)
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT051.mail.protection.outlook.com (10.152.16.246) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5458.17 via Frontend Transport; Mon, 25 Jul 2022 13:59:20 +0000
Received: ("Tessian outbound fccf984e7173:v123");
 Mon, 25 Jul 2022 13:59:20 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: e9e43d5b24c8debd
X-CR-MTA-TID: 64aa7808
Received: from 3609b32515bf.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 C34072E6-B517-4BFC-A3BC-7171837E0FB8.1;
	Mon, 25 Jul 2022 13:59:13 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 3609b32515bf.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Mon, 25 Jul 2022 13:59:13 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e3RSR3J0w0GKVM2Rky61bce91bWBh4aUMxhLPBh9X3nWaxNzbQY/NPXta4nkqHd5p7HEBYMfXI92SqbFNjpQuGNJ/qzMPvv/QcW1aFBAipKvBT9JedGAswWf0Iy1dxVANCtjnB8IyaYdHp5Rsm7lnCNRXOOp0jiJqVfiIqe2NN62Fftim+n1QVRwlSFcPNAvtDfP8RBUGI6MV1/+Tj/1ijBjBEnVuIAaV7kABh2uaqO/N+FS2XZ51ZZlunKVsNWyP6j21CemiBvw1RXvaSmMuhJnyOzSaMSooMup0xRXE9b+aekQ0WGvvCo/LRN5vB8u00JbbNVN/pyZd3iAe4OpDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VeKMY0Q4637xJYrRaRZyYutjefwpTFjOcIRjcIKElLY=;
 b=cgFJqM/BYFc8bDCBU0Ofsks8IRmJW8cyAevveyeHN+8dirVzLxX53LPxGftIYQzxS2f5ETfE6tCHOAhP5oi81EuxUAmJNZV0NRWx829A1GepGz8/HM47+V5YiNLf24cV4yrN+ZFM0T/JR0z3/cZntlnyYCE3YPemYV2TN+1BwJkPWhPT1CJETknZQPrsRASM5pR/Mg5WKuvG6ZnGXDpuiDlp0CI3RUZgnvtTpcBfojoDC6hQj/+IY01AxHMoHUliggDOv1U/9DsbT4I4UEStVqqEsAFn3wHxsQBVtQBldmOXQneLS9jT09qjm3Hm8lh9SxDWYBsIrV564UeQaY4EiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VeKMY0Q4637xJYrRaRZyYutjefwpTFjOcIRjcIKElLY=;
 b=lg49Kg1o3YKXpGXh6WCLiPBUagAKUt+GeyS0EHjKRW7yWScYQKBQODinjVoxEITvqb1OFKphcpvmk+KLPJ1CZGMN7vFCjTz6hNBcIpZ4BkZtbb8XzOGrLfGAqDGkODi83lraWPQJT3Jzfr5XIBjVkQhqIXqn2ouw2YBSXx9b2DE=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by AM0PR08MB3474.eurprd08.prod.outlook.com (2603:10a6:208:e1::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.24; Mon, 25 Jul
 2022 13:59:12 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::fc06:20ca:a7cd:4d72]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::fc06:20ca:a7cd:4d72%8]) with mapi id 15.20.5458.024; Mon, 25 Jul 2022
 13:59:12 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
CC: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>, nd <nd@arm.com>
Subject: Re: [OE-core] [PATCH] oeqa/selftest/context: set branch name when
 creating temporary git repo
Thread-Topic: [OE-core] [PATCH] oeqa/selftest/context: set branch name when
 creating temporary git repo
Thread-Index: AQHYnbxnubsgWMIMaUGPvh1M/Rpmnq2NtzeAgAFqvwA=
Date: Mon, 25 Jul 2022 13:59:12 +0000
Message-ID: <7E39EDD4-F620-4CEB-BB00-E2880B2EBC96@arm.com>
References: <20220722111534.2144462-1-ross.burton@arm.com>
 <e6176b990acf909a305fe40b4fdd91c196c9a60f.camel@linuxfoundation.org>
In-Reply-To: 
 <e6176b990acf909a305fe40b4fdd91c196c9a60f.camel@linuxfoundation.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3696.100.31)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 65936b27-4d0f-4153-b628-08da6e45df70
x-ms-traffictypediagnostic: 
	AM0PR08MB3474:EE_|AM5EUR03FT051:EE_|AM9PR08MB6132:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 qHKfZjMpg/5+AAAineU57mbBLJK4xhJxTpVNnt7IQjwMg2DgX8Zd1KoPaYZCkBXvC4F6PTwoNSft14ogzMnOSAzi7I6fXgP5wq6QekK7vlCdm2OXXgeQ+MhelA6jgzO51175GSl+68ggtDedcYsV0/3xgHDtOj6pIULY19o/4odchrO5NhAjd54kET+ApXPnP2xNU1XHwxYE6IxWwb1eP3/2H7/3bWZw+GyGyDM4VoVm9iIg+RxczgWyIQidsVhF6RbTrbxkyvQFNGW7Eeuse8xnhy68PKmBsZDbVHEY1gW2+0gAbHoIs09HoNN94OIOpgFj7AyTxthXf09ET4IYd9bN2wUnkNyWZrkqiO/eJvnEixQBLwsfowv9ikGIv1P/L6XAPv0qCGfjOPADvGaLkyMs6Ld+fOMOmhOmF8XcFGsMV/Bb1NysmaAIvraCPkMgN1bNgankIVb+cqHHAK2hVyR87+aH7LjJa/q2UhfDhjzjPBWeHYtivGYHKreRxZP202CzcOCe4uRwRt8okd05htbIhJUvJU1N+gJCAp7RacpBvkXi4dIIxUnnRfE+cuX1goke+ThVpcM2+mB3cOIbLjxinxUeGZVPBaifJpF5uRg7iVMkmenroBLaEe/PtSMETz8zxTQmuKYdDMtFfCEjryFsUXux3KX06Ee0FvOVNkslnRe4gq3lSeOzyNKxH8EwGel1vsb0LxDw4JyTWTgJEE+qSAbhfhA1yeHk8VjVG2Lgx1Z9DxJdwAjX++cnMRHFpfBkBxIqaUsVJQrY9IncQBnQYWJUnxacg3rS883RDrrJwtCEDGtaXzwDjnfB31Ec17lr36fIArPVREqyQpUwnevIvizQHG3u56zLaOt4BY5P/+ftsGEl11ZxUuBwNT/m
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(346002)(396003)(39860400002)(376002)(136003)(366004)(6486002)(6512007)(26005)(71200400001)(966005)(36756003)(33656002)(478600001)(6506007)(53546011)(38070700005)(54906003)(6916009)(41300700001)(86362001)(186003)(2616005)(316002)(76116006)(38100700002)(66556008)(66946007)(4326008)(4744005)(8676002)(122000001)(64756008)(66446008)(66476007)(91956017)(5660300002)(2906002)(8936002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <CAF51D2FEC295F4FB93A929CA3411BFE@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB3474
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM5EUR03FT051.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	52e8ff72-648b-4054-68b8-08da6e45daa7
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	wy9FtzKX45kCcqVh8hSVdFkoXz/vdjmIHqOIwfXnNG/uMTB6kvKG5CGrp2d9q8hn5JLZwmeu45xF3f1EeySJMLkI1nfUTqs16h0B0lVSkDj722Wc9GODmz6CMF3ujG1PrFVIoj+Rw4njkG0VB1+oD3Ora3iJeyai9AgUC3nz3/xQwMwvM22dpw9XWDXxrcAO/oiJs5NgXbENTovvJbE3tUPNNBIpYuiaqprEx/fCRWBfHjXci1gQV1R26zvispSR4Zk1wIqj0RcTUnG/nPZp+iE3VAeS9dIrSysCD986Qk13X4YQ7odyoxLMr5fcAjOaQuW+tqd7TZqWE3giiVMrKFJnyDEKrcnQDV3xNLb4Rywob7nZz18M3P+C2QDIFPv70UbkoQjmVJ34rixP5D9HKSvAcLiS89xYQ+OBgCYd5OPPoxFzEIgOy+B+JXXWXP3hYg/lBA0vKkM9Pi8nrwcwmxkyv0Tz6Kgvuy6scbeJLeIjU2xumXVTCHA6xC+v/9Vobx5viYwjT/XKkedoBUIkdR1LjqqGRgf+OEfcPQn+vsW6wr5KqG1cJTEUsfzueMG2kL+PopxkI5MrcDrZ2JNmb2SX2GjvP14QCZLOD4OoYx/N57Ou/9VarzWmiBwQffs6/gQxVe1YIpTCJxN/Wp4jj8ncUMEwIEYozh4XuRqa/USLhCe/wWAYsDnJHVvb2VQadlUbQnOs+3L/2dqH8pNmCSpzVhQZgrw6mR8UdTDHqNprbZglZX5DOVqDZxoL4mLCrjpXNyv5QziuU/mE5UjK7xiKJrG8/Frbw/Mh9qrcwkqqzv3/EpUezD6DNLO8N8/JqLwWMe1WKwEmVTzDzAscbLsrDT0UBuNxjGE8F7PNdQ6yKrWpHAR60YuSNus1T/44
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(376002)(346002)(396003)(39860400002)(136003)(40470700004)(46966006)(36840700001)(36860700001)(63350400001)(356005)(86362001)(36756003)(33656002)(70206006)(82740400003)(6862004)(186003)(8936002)(63370400001)(81166007)(336012)(47076005)(53546011)(26005)(6506007)(6512007)(478600001)(6486002)(40480700001)(966005)(41300700001)(54906003)(316002)(40460700003)(4744005)(5660300002)(2616005)(4326008)(8676002)(2906002)(70586007)(82310400005)(45980500001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jul 2022 13:59:20.6226
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 65936b27-4d0f-4153-b628-08da6e45df70
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM5EUR03FT051.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB6132
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 25 Jul 2022 13:59:27 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168485

T24gMjQgSnVsIDIwMjIsIGF0IDE3OjIwLCBSaWNoYXJkIFB1cmRpZSA8cmljaGFyZC5wdXJkaWVA
bGludXhmb3VuZGF0aW9uLm9yZz4gd3JvdGU6DQo+IERvZXNuJ3Qgd29yayBJJ20gYWZyYWlkOg0K
PiANCj4gaHR0cHM6Ly9hdXRvYnVpbGRlci55b2N0b3Byb2plY3Qub3JnL3R5cGhvb24vIy9idWls
ZGVycy8xMTcvYnVpbGRzLzEyMjANCg0KSSBjaGVja2VkIG9sZGVyIGdpdCByZWxlYXNlcyBidXQg
ZGlkbuKAmXQgdGhpbmsgdGhhdCB1YnVudHUgMTgwNCB3YXMgc28gb2xkLiAgT2ggd2VsbCwgd2Xi
gJlsbCBqdXN0IGhhdmUgdG8gc2hlbHZlIHRoaXMgdW50aWwgYWxsIHN1cHBvcnRlZCBkaXN0cm9z
IGhhdmUgYSBtb2Rlcm4gZ2l0Lg0KDQpSb3Nz

