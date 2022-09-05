Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B7A1ECAAD5
	for <webhook@archiver.kernel.org>; Mon,  5 Sep 2022 09:06:12 +0000 (UTC)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (EUR04-DB3-obe.outbound.protection.outlook.com [40.107.6.67])
 by mx.groups.io with SMTP id smtpd.web09.22605.1662368762764954411
 for <openembedded-core@lists.openembedded.org>;
 Mon, 05 Sep 2022 02:06:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com
 header.s=selector2-armh-onmicrosoft-com header.b=cyNYf0CE;
 spf=pass (domain: arm.com, ip: 40.107.6.67, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=cgXHQI5ibwRlyNhtzew8fzp5tpriFvb2Uojkzbs8r02j1fwX3TEI7319TtN3Js0LKt5fayrU/QL+PcV4w3au/DQM5JIPGAGWCV6CN5z5KGMfckH5vfCFtw3I7+bbDcga7a6214Aw8w6Psh4Qh50EBtOP6Q9QxMex972Jnq9v9s+YVUuAVILbIZHU/aX5iIc6phPlvPdz4gA3F1v8rL8G55dJg/O2nxD4D9nso6AKN86ebD2r5ZgrpMg8faSaZ6i2Y4GcGojU4sNMx6taPME0/dC0u9g5l7t8L8woaDV9inJ6loCUlj+6kchH4zjKv3/+FLsDLIWl8M4LVge7V34hPg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dGO4kSDOx5HTPLd7ZTvWCYbbOGkhCGN7V08gZTfzIN8=;
 b=AOgk4IUBXGRz+hDg3y1FsYb2qDdazwVxAemj9dLk6HA652/uzA27S4x0z2JTX9BofYKj7wdpOmP0om07pkZHZ+sIPcwxoerCSNOifAoLYtCc8ycpwnbSV32dlk2/o4y7Zpa4jvY6A8ylC6ZgKgr53zW81eAoERIcjFeKXZHxUlSlztdf+rIdSg/cQVOM7Dt3UeVj6j5CvBkEe9p5h9EBPTTrnLHWPjbnVRY255wwXVfA5NeWsFeIH5+CDrkokA4TJvWNKN+k1Kl3V/VubgNstAYy8uAThFI/Z6t815n6786UC4X/rMjFFy2WuyVLg8iRetZWOUBF7zqVuBNKjJMQtA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dGO4kSDOx5HTPLd7ZTvWCYbbOGkhCGN7V08gZTfzIN8=;
 b=cyNYf0CE7hN9I9FWRKj4gku8a6vu68+9jyJpdqMJ4bZ9abLp8byiK43gxoFJom2NOEgYT1PbK/2bDmVCs3P5zI+azBFbuGCQTxZ0qYYW6N5aQ5ToSWyTO/wGB9BW4JUTBcg008uN+qSMTNPsBVKytnWWLKbeRwVq3CkQvDZ6LUs=
Received: from AM6P193CA0124.EURP193.PROD.OUTLOOK.COM (2603:10a6:209:85::29)
 by AM8PR08MB6515.eurprd08.prod.outlook.com (2603:10a6:20b:369::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.10; Mon, 5 Sep
 2022 09:05:57 +0000
Received: from AM7EUR03FT009.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:85:cafe::f8) by AM6P193CA0124.outlook.office365.com
 (2603:10a6:209:85::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.12 via Frontend
 Transport; Mon, 5 Sep 2022 09:05:57 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT009.mail.protection.outlook.com (100.127.140.130) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5588.10 via Frontend Transport; Mon, 5 Sep 2022 09:05:57 +0000
Received: ("Tessian outbound 63c09d5d38ac:v123");
 Mon, 05 Sep 2022 09:05:57 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 58392798200f23f5
X-CR-MTA-TID: 64aa7808
Received: from 70a6264a16e7.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 EA08183E-361A-4474-B63B-F2D20EBA87F6.1;
	Mon, 05 Sep 2022 09:05:50 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 70a6264a16e7.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Mon, 05 Sep 2022 09:05:50 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KTx4uo5ASOGZFh8OEQ76WpTuO7Puv1ieOygJp1+gLLm5HB2FDItYY6TAXjtQT5DI+GsERxW7kGaNEjENtxKnqIMp8xS+rmdOwGYN35RXfbeR8PGw0AryqhmJjgMVGR9WiFUWTaOcxKYx1+MCgjFHuZGeobn5hnH3eK6EVAnCz2l6IVH9ULWbuwz9JJhSTTfRtQbNknD5Kuj2Y5E9WbOAy7JUUutsyitYKtKu1+g1mNcYP3T7P5P9o3B7QFy9twYcObXmUADXCbbKFnVXVoEC3Av2dkeczSuyIP7VEaGH2iGzwyvN1KleEG7uRxW64+6HkFEp6sUIyqkILSDSxNP84w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dGO4kSDOx5HTPLd7ZTvWCYbbOGkhCGN7V08gZTfzIN8=;
 b=jvxH80AEblcbRMb5Th21PXFkEwDg1Riut9vSs1EY6S3eNYBz7Q1XMdAExXWuBtYSkMMD3H7/AER3OtHYVVOrwxkvxTcyecZakWwXV8NELeUfrF9KPJo8rmKenExDol8YbWYdh+1SEuv0N4m3GluibI2wLPfn7Lah0hFJK9JixQZN8Q2ujLUsZmJmuc18jHSwsYyon4EFHzxnm9ejufoLFzp4wCAkr0h38oBeIzuIfFjorT7SCP07ibz3pAtn3tbKSF060fRDTnYcQW++XMp90tpn9m71SVzH4mP+ucwAbUKaYYtwlymEt1HUIVTa2VuGDTkywKFA2ylYsfkOLcdIfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dGO4kSDOx5HTPLd7ZTvWCYbbOGkhCGN7V08gZTfzIN8=;
 b=cyNYf0CE7hN9I9FWRKj4gku8a6vu68+9jyJpdqMJ4bZ9abLp8byiK43gxoFJom2NOEgYT1PbK/2bDmVCs3P5zI+azBFbuGCQTxZ0qYYW6N5aQ5ToSWyTO/wGB9BW4JUTBcg008uN+qSMTNPsBVKytnWWLKbeRwVq3CkQvDZ6LUs=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by DU0PR08MB7881.eurprd08.prod.outlook.com (2603:10a6:10:3b3::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.11; Mon, 5 Sep
 2022 09:05:48 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::6cbd:62ea:4be4:aa4c]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::6cbd:62ea:4be4:aa4c%9]) with mapi id 15.20.5588.012; Mon, 5 Sep 2022
 09:05:48 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
CC: =?utf-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>, OE-core
	<openembedded-core@lists.openembedded.org>, Steve Sakoman
	<steve@sakoman.com>, "cordlandwehr@kde.org" <cordlandwehr@kde.org>
Subject: Re: [OE-core] [PATCH] libxml2: wrap xmllint to use the correct XML
 catalogues
Thread-Topic: [OE-core] [PATCH] libxml2: wrap xmllint to use the correct XML
 catalogues
Thread-Index: AQHYtwZJJgINT7rDzE64pdsAShKU4a3NjSWAgAAhloCAAvCZAA==
Date: Mon, 5 Sep 2022 09:05:48 +0000
Message-ID: <FD5B2A84-2572-4291-9C6E-E33F43D02F2E@arm.com>
References: <20220823153730.172962-1-ross.burton@arm.com>
 <CALbNGRSb4WGO5Dwb-kz6Xeoc5My5a6n0q=n2hm+sid2ZuwrZmA@mail.gmail.com>
 <7e97fd1400dce9ce5bce3ba7273d0b35a326a171.camel@linuxfoundation.org>
In-Reply-To: 
 <7e97fd1400dce9ce5bce3ba7273d0b35a326a171.camel@linuxfoundation.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3696.120.41.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 55f13299-50df-496a-3d08-08da8f1dd874
x-ms-traffictypediagnostic: 
	DU0PR08MB7881:EE_|AM7EUR03FT009:EE_|AM8PR08MB6515:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 tl9jlha8gZn1KdktHTmPbX0sKlPvWNYCa1++e3uyctn3EqGhPQqIIxZjqeebzd0x5w6fA+jgGq6b0/eAtnvE3cH8qTbFiFnvVuhkbnk8A3d+7ylzgQH+XmniTXEbJBGswuOdxy3bBV2oZyKelBrv7HbOzkMA26S8z5ebfv+07zXu9J/9KZPoFN2RtLHdpZJHz9Xg9Vf2IVErds54S8uz37IfzIb7dkY/TQnQC/mw74OfBvYPTdRtEprHs8Vm5rPy+jKVzxufPfj1IzHIYZFy76ZRIbabBnPgjkK9DAGkzzTEaG7iOvY5iZm+igUhcSunos2+4LSBRGgjwXIzxQbJntdsoQajmHSqs44JIxXJ392tP4Sd88PAdEaZvo9WAgWf4W9LvYLzNxE7QM5ar9xzM1vHf/odaxx2Ax/+fzWvOoX4CZvM+vCelBeL8BY1tRjn95M+zuDx9pbx1rTce3mlBRKlPOj6QKWovj3A14JdfEg3f1Nsd/XbpFTjJTDnw3NRaqsMr/Md0axQ3nO0UG2N/mFpwfIkdeIJc1T73PasO2F6FOoYMhzCifMMPQGJBv6Q23UV8ngmFMiJUl8v+VFUOARE5vfKK2KJjlW0b4NaH1tLgPEpbhvi6VL2ryGF4r6CYD3ghdaooTSqZ3OqNyX9Q6aEu8vbmdRJe5RV4JdR5+s0USVzPwsa8u1ODorg4FMBvAp716duFrp735Y/UnDiEFpnnS+U9Oew9u02WTVYRCxK3ENHn/ziCdHuMXLZlGCh8SpvgEjGAsy9u0lRnxiKP4giL8zsiw44AQYMNtsqYiWwQ8pJehHLDZA+HRAhL726RnXMMl4n5e9QrU2C9msKUw==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(376002)(366004)(396003)(136003)(39860400002)(346002)(122000001)(38070700005)(83380400001)(38100700002)(91956017)(316002)(36756003)(64756008)(71200400001)(8676002)(66446008)(6486002)(966005)(66476007)(4326008)(66946007)(54906003)(478600001)(66556008)(6916009)(76116006)(5660300002)(41300700001)(26005)(2616005)(33656002)(8936002)(66574015)(186003)(86362001)(6512007)(6506007)(2906002)(53546011)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <4A35C3C104AA3E42BA7C0B8AE86B6667@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB7881
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM7EUR03FT009.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	44606011-2b3c-4f72-adae-08da8f1dd34c
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Z5vu2u3Y5cx5+BlAovpgmaAym6REw9iC3wetrmk1LN0aQrtU4bxJR9k2cLoLoFfpM14l/XNLoPBCzMflNa+Fosf+PZq9NQCVU+RqjfYziJ/5gqV3xWlWC2sPeCX+bF8og+3h45ZaYxqJcGjrz21GvP5M4aFilZfz3pgQFF9g2MaQtZVvRRgpIIjmHfxoRqZGWN74jGNGa5OHgU4WIFvqDoYsHsDS3kjNenZ6ClTyhDmZ1NJzNjzffvu/SN7gTMvCrsaAbWl5V+O8eKJ7kabo46UGpiH+Ryok7nA+1Dfvjli7qfzDY5egyG2ZaydoX4voYnFUGsHLbnALVn1mfiIpRnFqsUYmeAOBBQFTAy2FPx01Jl5m2RlQSuaTIHas3WCM4tZ4/EWXitb1vqE4vSsWd6o1hs1DPvQea3ohcJemMKz/HksnAoEl4DMOMSITAW6B6GeIOxV6mD08Cmn2SkBetl1l2bvRow8JFQnFju7R2yL//PDDZr5t9lbTa5lziRN7mrewSyTuI60OEbwKG4iH6dacfabT/TuPpZH57wzcnqFH3NSPGn3oDswRohRFwePM4vnCXIhuUi/bDdN+pLuFf2Oj9VVjatUrdS3jRvSBiphml/gGbM6nbAuWy/1/N2Fhbm7tBE4mhfFYGVycgmtY8TTm0lVNJhz6X+smrp7nHQLSs9ndjvvAeAid7jRP4xEhCutXbYsB5GZS3mBj1ci4HFd4V5W8M/dcryYqzatU9Uu4jV/gybPagp5KZFJatQJjiZlntNkc0S0aOtj7fMSUCSPZiHrNACU2JtahjfYuX8I=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(396003)(136003)(376002)(346002)(36840700001)(46966006)(40470700004)(40480700001)(81166007)(478600001)(966005)(6486002)(40460700003)(356005)(33656002)(8676002)(41300700001)(4326008)(70586007)(70206006)(316002)(86362001)(54906003)(82310400005)(36756003)(26005)(6512007)(83380400001)(66574015)(47076005)(8936002)(6862004)(186003)(336012)(2616005)(36860700001)(6506007)(5660300002)(82740400003)(53546011)(2906002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Sep 2022 09:05:57.4041
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 55f13299-50df-496a-3d08-08da8f1dd874
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM7EUR03FT009.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB6515
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 05 Sep 2022 09:06:12 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170305

T24gMyBTZXAgMjAyMiwgYXQgMTM6MTIsIFJpY2hhcmQgUHVyZGllIDxyaWNoYXJkLnB1cmRpZUBs
aW51eGZvdW5kYXRpb24ub3JnPiB3cm90ZToNCj4gDQo+IE9uIFNhdCwgMjAyMi0wOS0wMyBhdCAx
MjoxMSArMDIwMCwgQW5kcmVhcyBNw7xsbGVyIHdyb3RlOg0KPj4gSGksDQo+PiANCj4+IHRoaXMg
aXMgYSBtYWpvciBjaGFuZ2Ugb24gYmVoYXZpb3VyIGFuZCBjYXVzaW5nIHRyb3VibGUgYXQgbGVh
c3QgZm9yDQo+PiBLREUncyBrZG9jdG9vbHMuIEFtIG5vIGV4cGVydCBidXQgSSBndWVzcyBrZG9j
dG9vbHMgdXNlcyBjdXN0b20NCj4+IGNhdGFsb2dzLiBXb3JrZWQgYXJvdW5kIHRyb3VibGUgaW4g
bWV0YS1xdDUtZXh0cmEgKGFzc3VtZSBtZXRhLWtmNQ0KPj4gd2lsbCBmYWNlIHNhbWUpIGJ5IHBy
ZWZlcnJpbmcgYmFyZSB4bWxsaW50IFsxXS4NCj4+IEp1c3QgYSBoZWFkcyB1cCAtIGl0IGlzIGFi
b3V0IHRvIGxhbmQgaW4ga2lya3N0b25lIC0gaGF2ZSBubyBpZGVhIHdoYXQNCj4+IHRoaXMgcGF0
Y2ggZml4ZXMuDQo+PiANCj4+IFsxXSBodHRwczovL2dpdGh1Yi5jb20vc2Nobml0emVsdG9ueS9t
ZXRhLXF0NS1leHRyYS9ibG9iL21hc3Rlci9yZWNpcGVzLWtkZS9rZjUvdGllcjIva2RvY3Rvb2xz
L2ZpbGVzLzAwMDItUHJlZmVyLWJhcmUteG1sbGludC5wYXRjaA0KPj4gDQo+IA0KPiBUaGFua3Mg
Zm9yIHRoZSB3YXJuaW5nLCBJIGRyb3BwZWQgaXQgZnJvbSB0aGUga2lya3N0b25lIHB1bGwgcmVx
dWVzdC4NCj4gDQo+IERvZXMgYW55b25lIGtub3cgaWYgdGhhdCBlbnYgdmFyIHRha2VzIG11bHRp
cGxlIHBhdGhzPw0KPiANCj4gSWYgbm90LCB3ZSBwcm9iYWJseSBuZWVkIHRvIGFkanVzdCB0aGUg
d3JhcHBlciB0byBvbmx5IHNldCB0aGUgZW52dmFyDQo+IGlmIG9uZSBpc24ndCBhbHJlYWR5IHNl
dC4NCg0KRnJvbSBjYXRhbG9nLmM6DQoNCiAvKiB0aGUgWE1MX0NBVEFMT0dfRklMRVMgZW52dmFy
IGlzIGFsbG93ZWQgdG8gY29udGFpbiBhDQogICAgICAgICAgIHNwYWNlLXNlcGFyYXRlZCBsaXN0
IG9mIGVudHJpZXMuICovDQoNClNvIG9uZSBzb2x1dGlvbiBpcyB0aGF0IHRoZSB3cmFwcGVyIHNo
b3VsZCBhcHBlbmQgYW4gZXhpc3RpbmcgWE1MX0NBVEFMT0dfRklMRVMgaWYgc2V0LiAgT2YgY291
cnNlLCB0aGUgd3JhcHBlciBzY3JpcHQgaXMgZ2VuZXJhdGVkIHNvIHdl4oCZZCBoYXZlIHRvIHdy
aXRlIHRoYXQgbWFudWFsbHkuDQoNCkludGVyZXN0aW5nbHkgY2F0YWxvZy5jIGhhcyBzb21lIGF1
dG9tYXRpYyByZWxvY2F0aW9uIHN1cHBvcnQgZm9yIFdpbmRvd3Mgd2hlcmUgaXQgZmluZHMgY2F0
YWxvZ3VlcyBiYXNlZCBvbiB0aGUgbG9jYXRpb24gb2YgbGlieG1sMi5kbGwuICBVc2luZyBkbG9w
ZW4vZGxpbmZvIHRvIGRvIHRoZSBzYW1lIHRoaW5nIHNob3VsZCBiZSBwb3NzaWJsZS4uLg0KDQpS
b3Nz

