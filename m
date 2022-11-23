Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4718AC433FE
	for <webhook@archiver.kernel.org>; Wed, 23 Nov 2022 20:02:45 +0000 (UTC)
Received: from EUR03-AM7-obe.outbound.protection.outlook.com (EUR03-AM7-obe.outbound.protection.outlook.com [40.107.105.81])
 by mx.groups.io with SMTP id smtpd.web10.6546.1669233755623611911
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Nov 2022 12:02:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=kpFRvIdf;
 spf=pass (domain: arm.com, ip: 40.107.105.81, mailfrom: ross.burton@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G8e59D/UIrV6WgrnHMGkj9g4xM+rxUyam5OjA9ICzjw=;
 b=kpFRvIdfS9lztX1FcbzzTSRrD4JVMIr3TMyLABEaRXEX/SMjchkJhNJEfGkYE8xq5gH6htNDJkbn7twv7Ceo7G/N8qbFB8EqL2l7RNhQZpikL/MP16zyksJOiwVkKDIQblYj55QZCCjpOxTPqjv2rlKWi2zqA25ECmPon7C14I8=
Received: from DB7PR05CA0048.eurprd05.prod.outlook.com (2603:10a6:10:2e::25)
 by DU0PR08MB8138.eurprd08.prod.outlook.com (2603:10a6:10:3ed::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.17; Wed, 23 Nov
 2022 20:02:27 +0000
Received: from DBAEUR03FT064.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:2e:cafe::43) by DB7PR05CA0048.outlook.office365.com
 (2603:10a6:10:2e::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5834.9 via Frontend
 Transport; Wed, 23 Nov 2022 20:02:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT064.mail.protection.outlook.com (100.127.143.3) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5834.8 via Frontend Transport; Wed, 23 Nov 2022 20:02:27 +0000
Received: ("Tessian outbound b4aebcc5bc64:v130"); Wed, 23 Nov 2022 20:02:27 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 2058c053b8ff13e7
X-CR-MTA-TID: 64aa7808
Received: from 2fa2a8b971d5.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id FBBD8D65-90DA-40C0-9001-58626429BC5C.1;
	Wed, 23 Nov 2022 20:02:20 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 2fa2a8b971d5.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Wed, 23 Nov 2022 20:02:20 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HXIzndG0VG32/MS1mM9eGWlt+8HmqD4o5dA3aTQvtZ0o2lTEZIQhbgBcGtCI4Qmrfn4tnXkBvVWgzPHOI1hi65gseXzYmLDX87+40Cfq4L+mVncIiVgsnqN4feBUMqJ7FOfVIVfxqJy/hmzAT7R3b36LK9Z+i/jHfQIGaAzkSX7UhzUWm3GF0Oclw/O0miXBmHVjdLC0sTw168TVsgox7dhcxONY+AIhUUIqtxVI96N/wgIkKzaLp7L9InyKRgq/cgi2E8Iru93Nf/XUbk0q8NjnRp1nmXqEJiUjy3gj1EkOz+wnUhTLCLBA+zJkCq5bwae5W4VXm9e1nYfuJVYcyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G8e59D/UIrV6WgrnHMGkj9g4xM+rxUyam5OjA9ICzjw=;
 b=cX2PmAmXsLfuSKwC20wpnr4Lj6l6U6H2spC8K46QQEM2w7UsHMYyVeZgyPPMN7x4WuBqscVL+bdeBwxCZoKFylmnhs0/aoFaL92tSQSH0vjdqiZePkcKE95+GgI8Y2MyynRU4/ZBG3weQ9WLETJVWOLAIfY8NLhIQtVo5ZihjFTl5LtPXonOd5+8LM6YbX1V5aBPowAmKOVAYAGH7mjcZ5ISN/Qla0sM1OYzzuQScSy5WSVQsE65tR9L7d0iH+3QGuHrAlZNp5T+p6JWdNL7i34CalEunfUdb0Rdp9C8Y9aFSsN4uUiCM4ZR59Qf0q6REGuK0/eTT5pOv/Tyi0HLlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G8e59D/UIrV6WgrnHMGkj9g4xM+rxUyam5OjA9ICzjw=;
 b=kpFRvIdfS9lztX1FcbzzTSRrD4JVMIr3TMyLABEaRXEX/SMjchkJhNJEfGkYE8xq5gH6htNDJkbn7twv7Ceo7G/N8qbFB8EqL2l7RNhQZpikL/MP16zyksJOiwVkKDIQblYj55QZCCjpOxTPqjv2rlKWi2zqA25ECmPon7C14I8=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by GV1PR08MB8330.eurprd08.prod.outlook.com (2603:10a6:150:85::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.17; Wed, 23 Nov
 2022 20:02:17 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::1ecf:7fb9:8c0:8119]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::1ecf:7fb9:8c0:8119%7]) with mapi id 15.20.5857.013; Wed, 23 Nov 2022
 20:02:17 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "raj.khem@gmail.com" <raj.khem@gmail.com>
CC: Alexander Kanavin <alex.kanavin@gmail.com>, Markus Volk
	<f_l_k@t-online.de>, "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [oe-core][PATCH] python3: add ${bindir}/python symlink
Thread-Topic: [oe-core][PATCH] python3: add ${bindir}/python symlink
Thread-Index: 
 AQHY/Qj3NOSdoWEgPkKI+DKTOAmX9q5IcnWAgAAK0oCAAQE0gIAAKmwGgAC2yoCAANl2AIAABl6AgAEK5wCAAA+gAIAAXrKAgAA6HAA=
Date: Wed, 23 Nov 2022 20:02:17 +0000
Message-ID: <A64E29A1-4A6F-4DE1-A102-0121B2097377@arm.com>
References: <20221120175237.194899-1-f_l_k@t-online.de>
 <CAMKF1spErHg3JX+DFRLcW4EthTGBMm4A24XsyAVOO3RNr6Wgfw@mail.gmail.com>
 <CANNYZj-UTuxW0-Rr7FhgjwE007Gr28Pc5ZCo=cnrDcaNsuZStw@mail.gmail.com>
 <CAMKF1srs_tmRRNqWQAmBKOkJkfysJt=OZjefq_mPd4htPGi6VA@mail.gmail.com>
 <1729A925BA1D06C8.25787@lists.openembedded.org>
 <CANNYZj-mhM6FzQY4Lv2BckodcLtPSUV29GG4TCUb_Tp003SAbw@mail.gmail.com>
 <HRFQLR.NFABK2KMZ9XR2@t-online.de>
 <4BF25A91-3F02-49A2-A546-A9CF7881E0ED@arm.com>
 <CANNYZj9uxKov0vrox7N3kv-HdQJ9VDbLu7Jsn_SuVUTz_Nbrzw@mail.gmail.com>
 <534355DF-2B59-4B88-84F1-18251DF2FCC9@arm.com>
 <CANNYZj--M74EQyWbLeYa6L=iH01QSqUcKnn2WpxMvyz_zpXS5w@mail.gmail.com>
 <CAMKF1sr7ZxbQPkAydEq6psBZSS=oumi0yogEWXLt23+YyhobCA@mail.gmail.com>
In-Reply-To: 
 <CAMKF1sr7ZxbQPkAydEq6psBZSS=oumi0yogEWXLt23+YyhobCA@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3731.200.110.1.12)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|GV1PR08MB8330:EE_|DBAEUR03FT064:EE_|DU0PR08MB8138:EE_
X-MS-Office365-Filtering-Correlation-Id: e1ea333f-b81a-44cb-9095-08dacd8da521
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 Li/xUYFmwOb2GgkQvI2PEuS4FelUozdbjkOh12gUYAFbl8uNcMcfPmXN3npkSWAvPjEL4VKpq79WITzYd8HFUGdCEBWvStcto9CViCqJlSbBvCL/O3YXHQg+vb3l9eicDN8h/agFLt38R3+GYfL7oFl+OWl8CKRGEaSSqAXndcMngEslyDCp7dQ2LzUx91GtKKxY5U2t3W4Afg8gRR9IHx4dnlJ9ve/bme4tRybiN+G0/UNneW3J9qSZm9PClDSrHJB9q1dvDg8WE5tTgv/cG9drhjmKjwZuw2R272Ck/FEI6quZKQddP2UEZOqeUYFauhniP2gADdBvb6g0zZqQiKLFlqrwGhaA8oVnFAwFWBrsB8Szh1yNQmrJeccXht4wKWMsxw7MxN0eyzPRqXPvOB868/7i89HMz0jVvkTsJ5wsG3ZiJTh71PZG+xgNUFGfaXeWzsk1FIVoUHJhisf0Q+/0srrSTxmn3CsAwGCz0uCs59MQLGlZGyx3E+QfmQVKWnXZW7qiBVsF29IlHu7FogXyB2kT1o4fwFzpsLzd1yWMgAL2GoIfhK+COYsVMCDYoJLMGo3YGB99oPstHWL+BieWbmlI+Xz7kOP6VobXHA4/bDb4Uum0gYI3oDTSTT0PgaB1Sf5jjREjrPRRKpuSLb1AgENfh/PngSRpiR8s6vLa/rO8pawV3912oWSHoszdVKdJry7iQps6zCNoTqmXb5pezZhjeup5DFiVykAPdrykJp9eve0BcpPL4Y2+teVy221IJf5lZahTyiX4m2gudw==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(366004)(396003)(376002)(39860400002)(136003)(346002)(451199015)(38100700002)(122000001)(38070700005)(86362001)(8676002)(6486002)(8936002)(2906002)(4744005)(4326008)(5660300002)(66556008)(66476007)(316002)(26005)(53546011)(6512007)(71200400001)(6506007)(66446008)(64756008)(2616005)(91956017)(6916009)(66946007)(478600001)(54906003)(186003)(41300700001)(76116006)(33656002)(36756003)(45980500001)(228453006);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <1515D0908BC2604B847B5E71A06715B1@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB8330
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DBAEUR03FT064.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	0cf992d7-3adf-454d-c880-08dacd8d9f53
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	syNeLnpkpQfvtzh+PirrSXqaYq2XxAvyzyiBG0u2YFpCUycSROmbsbujEqpsy9FNFVPTXrrpKZ5paNfKmILt6Bh6bY94LPlUlBmw5KWPkrUoYjcepz9Mw9Dw0pIs2bzsKqSyu0IAE4QW2MjPdwQORrzzJH7AxN8NqfIsCpH0jky9z7nmd5wUUE+AmwkYV0KoKhvb81rigFp20bFDpQHKoCetLSBYFiQegwuevRN4XI4KXTfQHLflDvCQ1EO1nr9fAsEujZctl5TZV7Sv+UUhaaRWAx4d2v7MGaR2G6S22H/sxPm5Zh4L0lKZCKETTeUJoqQLBvkA2phTbysTLu/vXfjM4loX/rHjSvH7TgraUVlyM8q2obfAO8JKunaRhqmlM0SjYr7pWb5A+OH6nCr70y90NeJpMHagsHG2G+qpsvRZFUm48gwlm0wz3hIRLCf5vls1PgnU2Jy9oN+t61fTt6rOAeBKr4vAV3a0vbwo0RhdyD7iVseB1YkE1CQMXsV/6l6yLB32bgArvTYxzosEd35YiqgjqzH/1/bJrhAbmvP8N1kJfmSVG49TpeE8M+kF9O7I0WHCJ4YTi8YwROawO2kz2wKPm376diXZzrsobvKn165wn/zbuoCJ7lowPY+LaQzAqfQ6PSHGai5tJ1JpjTIuu3HcYn6ZcqAPnieGarJJxpK21I8tOw86wfVxRyDyVBoaQEzvLvB1PuUsrdrqbHucmSleI2JRy2R93Xc6mas=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(136003)(396003)(346002)(376002)(39860400002)(451199015)(40470700004)(46966006)(36840700001)(316002)(53546011)(6512007)(54906003)(82310400005)(4326008)(36756003)(70586007)(70206006)(8676002)(40460700003)(36860700001)(356005)(5660300002)(478600001)(33656002)(40480700001)(6486002)(82740400003)(41300700001)(4744005)(6862004)(26005)(6506007)(81166007)(86362001)(8936002)(2906002)(47076005)(2616005)(336012)(186003)(228453006);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2022 20:02:27.0869
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e1ea333f-b81a-44cb-9095-08dacd8da521
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DBAEUR03FT064.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB8138
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Nov 2022 20:02:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173726

DQoNCj4gT24gMjMgTm92IDIwMjIsIGF0IDE2OjM0LCBLaGVtIFJhaiB2aWEgbGlzdHMub3BlbmVt
YmVkZGVkLm9yZyA8cmFqLmtoZW09Z21haWwuY29tQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+IHdy
b3RlOg0KPiANCj4gSWYNCj4+IC91c3IvYmluL3B5dGhvbiBpcyBhdmFpbGFibGUgYnkgZGVmYXVs
dCwgYXMgaXQgaXMgYWxyZWFkeSBvbiBGZWRvcmEsDQo+IA0KPiBUaGVyZSBwZXJoYXBzIGlzIGEg
cmVhc29uIGZvciB0aGF0IGluIEZlZG9yYSwgYnV0IGl0IGlzIGluIGNvbmZsaWN0DQo+IHdpdGgg
d2hhdCBQRVAwMzg0IGlzIHNheWluZw0KDQpJdOKAmXMgbm90IGluIGNvbmZsaWN0OiB0aGUgUEVQ
IGNvZGlmaWVzIHRoYXQgL3Vzci9iaW4vcHl0aG9uIGNhbiBiZSBweXRob24zLiBPciBweXRob24y
LiBPciBub3QgdGhlcmUgYXQgYWxsLiAgQmFzaWNhbGx5LCBpdOKAmXMgdXAgdG8gdGhlIGRpc3Ry
aWJ1dGlvbiwgc28gcGVvcGxlICp3cml0aW5nIFB5dGhvbiogc2hvdWxkbuKAmXQgaGF2ZSBhbnkg
YXNzdW1wdGlvbnMgYWJvdXQgaXQuDQoNClJvc3M=

