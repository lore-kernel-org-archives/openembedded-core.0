Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93412C433EF
	for <webhook@archiver.kernel.org>; Mon,  6 Jun 2022 10:21:03 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.61])
 by mx.groups.io with SMTP id smtpd.web11.30241.1654510853384325346
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Jun 2022 03:20:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com
 header.s=selector2-armh-onmicrosoft-com header.b=Uy1PNl4I;
 spf=pass (domain: arm.com, ip: 40.107.22.61, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=EsWM6HuaTjMYuv3PlOU5xLqYuYiXERmlSZwvEmlUl8TTptMAoowoidCmOhIv2PpLFhdX7R5mpYJynF+TC62k9mOdVFottbb3TdO2qGCaaeP64zTL/1L4dx5r+AuTk04dGt8LALglSPB3ct1hZhG/RJQRbB1SOhMxao20PJl6pIgDTOLT8wDU+7ZhCmBCd/r+novY4Y61wRIzm5rapkGNES0BH63URS+cHwIXtZ8LES+LyXImYroY8SD7WuKi89MQVtbOKrsjhO+FqtmbbceQZxPRG/8chz2FnkofHsfsdJfQY1/UEYXvOBsbB9WrLIze1s7OJLQRQK1uAghcEYNNgw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mBJYbVc1Mk76KeeZJf5U5akw82NmWgZvwc0i927uglo=;
 b=BZnWRh6bEAL0KVOqhuREY2ayRo18Z/QMC+F9Xp6MbxTdBmKsaBLg7+fP9TzxfnYX67mehaoETC0ToQ1+/8ECjIGVx4Mqr4AswYHZdYaGfqlwEIDyyOiUpE+eAhYfH54PvMshw5XYj0MhmXBnq8UsrI0GdPMuA4Wn+0fo6dGXm6BM5klPGcxgff+uupcq2cOBT0Q9zX7qw8JiKy3xzS4aLV/fIJsxgJAFka6q0FWdcB9lNgZ1Y1BxedsxwszW1kU4HgBZoK2KkmTIqnbJKC14sZlmvM5GhcJ3yq1sZeN3K4r6SaewntWvWZZKuaotTECVWxhKF46es/Uj5Br30tzjoQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mBJYbVc1Mk76KeeZJf5U5akw82NmWgZvwc0i927uglo=;
 b=Uy1PNl4IKFaG05dahKMZhLnBXbommUVgxeChAi2lSl+xx816KMn0yjYSvrbu9xA+JORa6P3R1TeMVUm/spfWeMhC/qld4sdCFOOeG6qKxUK7X55uFGelRmjHK6a3i6IBeW8qFIuWc5z7Wivy2pQKKoVrGZLouD75ZMsEnKO88nM=
Received: from AM6PR10CA0025.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:209:89::38)
 by PA4PR08MB7458.eurprd08.prod.outlook.com (2603:10a6:102:2a5::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.12; Mon, 6 Jun
 2022 10:20:49 +0000
Received: from AM5EUR03FT003.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:89:cafe::2d) by AM6PR10CA0025.outlook.office365.com
 (2603:10a6:209:89::38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.13 via Frontend
 Transport; Mon, 6 Jun 2022 10:20:49 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT003.mail.protection.outlook.com (10.152.16.149) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5314.12 via Frontend Transport; Mon, 6 Jun 2022 10:20:48 +0000
Received: ("Tessian outbound 01afcf8ccfad:v120");
 Mon, 06 Jun 2022 10:20:48 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 61ca48382951dcb4
X-CR-MTA-TID: 64aa7808
Received: from 7cd98778975b.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 F9B37144-A176-48FF-863E-CE0E686B0161.1;
	Mon, 06 Jun 2022 10:20:41 +0000
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 7cd98778975b.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Mon, 06 Jun 2022 10:20:41 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g9dCg/gBNeT2o817moYlkfjvL6s8jkTEsAF8Etb5WFJ2iahlwnlE42to8QzIYZ0TABSXKWZMGUxaIDfBPn8mW8AF3Se0fIvK2cK2qpt3qZmsAryNcoakOcjLPVTAkk4o+Hc6I/qWMRW7Ra397XKA6hf1sjWm4ESPWlxaYUWKbrlDKTIuohRI2MpcR0xxRe8L4/g5DE39nbZqnex+sranxs8ri6a70lQa5Jq1vekjGNU1e0MKcVJZy9gEtwX5wO9ijQj1TKy5EfWxXHhdtsjZhSA8dxZZWNoia3iE1z4lFvEMoQllyG/Hs7dBgb6bUkDx2ZUNIRKun8j+V+cjv6o0wA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mBJYbVc1Mk76KeeZJf5U5akw82NmWgZvwc0i927uglo=;
 b=AsqD74F595IRwVVmklAmfomrO5BOZ09kkDpjBcXeZ1td5by1s9O30TNDsmmxj4PDXFp4hMM+OF1OtF2G8dg77d/g/HUpShx7JqURYXWxtrSJ6r6p00/DbHtbbM4/Nem3/zdzk2HEQaHn2xREbHYIPjsOYXCfihHDXW6k4X+++QWzDMNuCgECkxzWNhqrcbfWlWcSuyM6/4US+7q5Rhi7wq5BnP87XrXCwOV3BQwfkHTdM3tU859KIsViXVvTopBpY1hT3JiFBMIq5cXbz0uI2S/dL6fzsIX0E8gw9IjT1hIDQDHWmE+CBqsYRfq0niS9D8HfF7cDhKuj0j7VyoTE/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mBJYbVc1Mk76KeeZJf5U5akw82NmWgZvwc0i927uglo=;
 b=Uy1PNl4IKFaG05dahKMZhLnBXbommUVgxeChAi2lSl+xx816KMn0yjYSvrbu9xA+JORa6P3R1TeMVUm/spfWeMhC/qld4sdCFOOeG6qKxUK7X55uFGelRmjHK6a3i6IBeW8qFIuWc5z7Wivy2pQKKoVrGZLouD75ZMsEnKO88nM=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by AM6PR08MB5015.eurprd08.prod.outlook.com (2603:10a6:20b:e5::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.13; Mon, 6 Jun
 2022 10:20:38 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::6c2b:5021:db9a:bf6d]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::6c2b:5021:db9a:bf6d%9]) with mapi id 15.20.5314.019; Mon, 6 Jun 2022
 10:20:38 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "f_l_k@t-online.de" <f_l_k@t-online.de>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [oe-core][PATCH 1/4] xorg-lib-common: allow to build for wayland
Thread-Topic: [oe-core][PATCH 1/4] xorg-lib-common: allow to build for wayland
Thread-Index: AQHYdSGYyYMsh4JVjUi+knX6DvNc1K1CM92A
Date: Mon, 6 Jun 2022 10:20:38 +0000
Message-ID: <D03D06CA-D56B-4005-9E8E-CE312E4B8C17@arm.com>
References: <20220531190620.186764-1-f_l_k@t-online.de>
In-Reply-To: <20220531190620.186764-1-f_l_k@t-online.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3696.100.31)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 9af196b4-050c-4d19-0b1b-08da47a639e4
x-ms-traffictypediagnostic: 
	AM6PR08MB5015:EE_|AM5EUR03FT003:EE_|PA4PR08MB7458:EE_
X-Microsoft-Antispam-PRVS: 
	<PA4PR08MB745820FA470621D3B8E6D8E3E8A29@PA4PR08MB7458.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 r1tGaMALKw9hzOJ0TKVgi0jSZ6h225DRC8HXtKJEztuWbyyRzObH7t9xBgLrf8/YTZXXpfprNARCSQKX4PIxrxgPivcWvhBnufp0kxcXBRNdSjmgtBlZ0p8/H3Ao6iDE1sAoO0Oeaw24LJJErBw4UGcDh3xymnZl001ttJujjEPjpTH0Gp3CHxpPMawByCCT8SdjCkxj7ub0XeWWLWFrYWm6W4jZT1U8WKb2hBPw1uipxOegOKFvcNSpIwxONep0ajGVJdHmEMkh47AK5f1LzfkfCvn6tsGHdcwdWq3iOrYyEY5ka7v6S/6B7NaLORfZfEvYdL6nS8tSI4xXiNkI6BgtwzMqYMm9FHWogKAKhSAbHkoHz7kH7DOvsTFBHKoeTqE9uRcyTK1I8iqfhGd64jYj/CoBuPPINiW6rp9YR5i7aLQAij1/l0Zs+bubcNN8oFIuDiI73Kxq80gk5StIMC8wXz2y48ozJ61FqS9MtaJVhyryIIt2nKk3PHmxUfgjW/nHoPj5cJvxL7jGEAUQVFIxyr7KQfMSvZlYQihkVv4TzIBjxEuZbg9fashaaXu6T63ONC6uD9oSeQ0JJmNRr5lQZC6LxzydZMva4tgQalE/jidfFz4sus7dIruiFoqQV1EjQDZ7K11DrsqM47+xroHwuALFASWNhU+dotr86MmG29RGJIwPxj13d764xy1ek8OHdUDtKtXfcj1BYLUHmeNwDqYDAVOAjxaBfTdDWXgaAMrMTfc2avyaNOtmVnve
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(8936002)(122000001)(38070700005)(66476007)(66556008)(508600001)(5660300002)(64756008)(6916009)(91956017)(66446008)(76116006)(33656002)(2906002)(86362001)(316002)(8676002)(71200400001)(4326008)(66946007)(186003)(38100700002)(2616005)(6486002)(36756003)(6506007)(53546011)(6512007)(26005)(83380400001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <C7A225F0BA9B91419AA59289EF2739F7@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB5015
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM5EUR03FT003.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	175d1c0b-e283-4ebc-f6a9-08da47a6339c
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Xkq4t79wq+P1glxLWG6U4Ud0j/dVRyhnD3KMoFt9E3XpjyjMTOjcgfIW/4SpspB1CinM/5E5muTlkOb6HxOQtsbNjKwBI/O7U7Z/ZbwLcXpie+rB3nWtVHZOdpRagBzvMAJ3UCCmJbKg53frRBpMrule0jUn8WqBSwPCDUda7RFaDJ7WnHdIs4BNkaLYVTJiOlhZVyNJUFT12StSmqua+9xs+QgcYyiXPJF1IL1YqSrr3mY0XtWnjPtfGrjip8cA/5yih5LfijAdYk0BHHdx9F0ETh70K6G1p9VaWeN0MND+OHeB6KjbGvrHS7BEOV1X8UXqjGAz8L2MfpVKeSFC74p+2SuZALTmsHd50MInRPYX5kGfupZLGI159MNopI7u5U1641L4y2/Tf3YymrEnItmkCz8aDgjzOTOeUv75yc5/VKS6uetorkVezfmLNYk/75S3Sj7A7hdhczX7yud+l6dO477y2NFdJqzPNgbImUHvh8vfmXZs9cfWaC5XbBmSW4s9Eb+ZQ8MLSbifVkTcvpkKzN6xsicNybXTb1BqdA6XuethmDdaSI8d8TWWrERWNx7ba35/ZQx9t0CsF2UYIb/NFQv/8B7TPjo4jPtYbpcVwJXbxXv6ypsEUMeqXyVjj4lQoacbqTeaZZy558gGafQpeJPZuWy1eLusw40CagJUoh41zChQ7mm6F8QtUffD
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(40470700004)(36840700001)(46966006)(6512007)(81166007)(4326008)(6486002)(82310400005)(83380400001)(26005)(47076005)(70586007)(86362001)(2616005)(33656002)(356005)(336012)(186003)(40460700003)(53546011)(36756003)(5660300002)(70206006)(8676002)(6506007)(508600001)(8936002)(36860700001)(2906002)(6862004)(316002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jun 2022 10:20:48.7111
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 9af196b4-050c-4d19-0b1b-08da47a639e4
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM5EUR03FT003.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB7458
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Jun 2022 10:21:03 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166589

T24gMzEgTWF5IDIwMjIsIGF0IDIwOjA2LCBNYXJrdXMgVm9sayB2aWEgbGlzdHMub3BlbmVtYmVk
ZGVkLm9yZyA8Zl9sX2s9dC1vbmxpbmUuZGVAbGlzdHMub3BlbmVtYmVkZGVkLm9yZz4gd3JvdGU6
DQo+DQo+IFNpZ25lZC1vZmYtYnk6IE1hcmt1cyBWb2xrIDxmX2xfa0B0LW9ubGluZS5kZT4NCj4g
LS0tDQo+IG1ldGEvcmVjaXBlcy1ncmFwaGljcy94b3JnLWxpYi94b3JnLWxpYi1jb21tb24uaW5j
IHwgMiArLQ0KPiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkN
Cj4NCj4gZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1ncmFwaGljcy94b3JnLWxpYi94b3JnLWxp
Yi1jb21tb24uaW5jIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3hvcmctbGliL3hvcmctbGliLWNv
bW1vbi5pbmMNCj4gaW5kZXggNjBiYzhjNzZmYS4uMzAxMjJmMmJmYSAxMDA2NDQNCj4gLS0tIGEv
bWV0YS9yZWNpcGVzLWdyYXBoaWNzL3hvcmctbGliL3hvcmctbGliLWNvbW1vbi5pbmMNCj4gKysr
IGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3hvcmctbGliL3hvcmctbGliLWNvbW1vbi5pbmMNCj4g
QEAgLTIzLDQgKzIzLDQgQEAgVU5LTk9XTl9DT05GSUdVUkVfT1BUX0lHTk9SRSArPSAiLS1lbmFi
bGUtbWFsbG9jMHJldHVybnNudWxsIC0tZGlzYWJsZS1tYWxsb2MwcmUNCj4gICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAtLXdpdGhvdXQteG1sdG8gLS13aXRoLXhtbHRvIFwNCj4gIg0K
Pg0KPiAtUkVRVUlSRURfRElTVFJPX0ZFQVRVUkVTID89ICJ4MTEiDQo+ICtBTllfT0ZfRElTVFJP
X0ZFQVRVUkVTID89ICJ4MTEgd2F5bGFuZCINCg0KSWYgeW914oCZcmUgZG9pbmcgdGhpcyB5b3Ug
bWlnaHQgYXMgd2VsbCBqdXN0IHJlbW92ZSB0aGUgZmVhdHVyZSBjaGVjaywgYXMgdGhlIGVudGly
ZSBwb2ludCBvZiB0aGlzIHdhcyB0aGF0IGl0IHNob3VsZCBiZSAqaW1wb3NzaWJsZSogdG8gYnVp
bGQgdGhlIFgxMSBzdGFjayBvbiBkaXN0cm9zIHdoaWNoIGhhdmUgZGlzYWJsZWQgWDExLg0KDQpP
YnZpb3VzbHksIGVnIGxpYnhyYW5kciBpc27igJl0IGdvaW5nIHRvIGFjdHVhbGx5IHdvcmsgb24g
YSBwdXJlIFdheWxhbmQgc3lzdGVtLCBhcyB0aGVyZSBpc27igJl0IGdvaW5nIHRvIGJlIGFuIFgg
c2VydmVyLg0KDQpTbywgdGhlIHF1ZXN0aW9uIGlzIHdoYXQgaXMgdGhlIGFjdHVhbCBwcm9ibGVt
IHlvdeKAmXJlIHRyeWluZyB0byBzb2x2ZSBoZXJlLCBhcyB0aGlzIGlzbuKAmXQgdGhlIHNvbHV0
aW9uLg0KDQpSb3NzDQoNCklNUE9SVEFOVCBOT1RJQ0U6IFRoZSBjb250ZW50cyBvZiB0aGlzIGVt
YWlsIGFuZCBhbnkgYXR0YWNobWVudHMgYXJlIGNvbmZpZGVudGlhbCBhbmQgbWF5IGFsc28gYmUg
cHJpdmlsZWdlZC4gSWYgeW91IGFyZSBub3QgdGhlIGludGVuZGVkIHJlY2lwaWVudCwgcGxlYXNl
IG5vdGlmeSB0aGUgc2VuZGVyIGltbWVkaWF0ZWx5IGFuZCBkbyBub3QgZGlzY2xvc2UgdGhlIGNv
bnRlbnRzIHRvIGFueSBvdGhlciBwZXJzb24sIHVzZSBpdCBmb3IgYW55IHB1cnBvc2UsIG9yIHN0
b3JlIG9yIGNvcHkgdGhlIGluZm9ybWF0aW9uIGluIGFueSBtZWRpdW0uIFRoYW5rIHlvdS4NCg==

