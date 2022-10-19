Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E35A0C4332F
	for <webhook@archiver.kernel.org>; Wed, 19 Oct 2022 15:30:33 +0000 (UTC)
Received: from EUR01-HE1-obe.outbound.protection.outlook.com (EUR01-HE1-obe.outbound.protection.outlook.com [40.107.13.77])
 by mx.groups.io with SMTP id smtpd.web08.9733.1666193431725543553
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Oct 2022 08:30:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=n6ld/Lga;
 spf=pass (domain: arm.com, ip: 40.107.13.77, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=Ba/FJRxao/KNhr6+ZQRqIEXyxmAnxiccMQUlZKBEktux1R5/8XjYPVLgLdBD2IIKELXS1otq51PV/c2r6KGLSVAw51QlfWHr/h8MlvAYFI4g7u5iAxBmiP+xPjPz3zYBbA+UP2D4ufhDmIk9LguEmAqe1wLOFLfTgU6gbLPTYDNxcc+tz9Cb9h0hg1YdEqlQK7ySXCEVBJTb7MX+ni2n+3fZt4HgXHfLT2WKWyMRvvRIRbkWeLutzNhJP7H4aYcve4kwaPsNZPk/beQ0bXCYeglDKinL7Pcu0rr1C0/w2aHZh20DZd+7h4QhMTD/nyHHH29LJt8nqnW1FvW4BnI/0Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xQXZUnLZ5wsHNRQ4k/cK17Kdw0dLBjzWyLGu7lzOnM4=;
 b=gSiy3/GZTE6Z26r5DLUKallxZ9RBUOv53UeZ4JqNsKSJLG33MGOWMk9C24Js1Hm+DPbU9xeiLOGOVstm6ExHJREsdh66iMVKxYd1xLKRNJ6Smwcj+Vu/hx5cxiXuZCIkndUeUoaForVrpU37P4ldwEjCze1nejSSlhIcco1Mgc8pO8p0NwEPGxjeHG1hXDPBOnWfQ4AAWQ6sgWEx0qge0H9IosG4sEgZzSDDcTsxB6jt8uWZTwkp4aJwStYgqrFxml3NkPBGNWYAXYLjKOeu3KGcegENdxN0imzy8icEXUOy+TbOurm616REBD/a9mint6eh3vpivsWWNLuZfxthEw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xQXZUnLZ5wsHNRQ4k/cK17Kdw0dLBjzWyLGu7lzOnM4=;
 b=n6ld/LgaKNOKVTENIvoS9u9U6oy6c1Jl3gZxj9rB+0fz5lXO6eMFkeCnuFcdnnxF5HkcrgGfQWCWV4ADa98kV4WWHF/X41hxhy6bps5iiDoOh160/ZDj+f0pTlJRcEaph/HloGEbOCUKouSd96viBu6UCq+FV8g3dvpCr2CvdHQ=
Received: from FR3P281CA0135.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:94::19)
 by AS8PR08MB8801.eurprd08.prod.outlook.com (2603:10a6:20b:5bd::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.34; Wed, 19 Oct
 2022 15:30:29 +0000
Received: from VI1EUR03FT039.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:d10:94:cafe::57) by FR3P281CA0135.outlook.office365.com
 (2603:10a6:d10:94::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.17 via Frontend
 Transport; Wed, 19 Oct 2022 15:30:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VI1EUR03FT039.mail.protection.outlook.com (100.127.144.77) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5723.32 via Frontend Transport; Wed, 19 Oct 2022 15:30:28 +0000
Received: ("Tessian outbound aeae1c7b66fd:v130"); Wed, 19 Oct 2022 15:30:28 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: c426480f15d72375
X-CR-MTA-TID: 64aa7808
Received: from 6a8a4c16d6df.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 119E54EF-352F-465B-B885-C38B80007250.1;
	Wed, 19 Oct 2022 15:30:21 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 6a8a4c16d6df.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Wed, 19 Oct 2022 15:30:21 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mUyes0uZhLmOGkq/XXxZjRcDNdWn9LjxZwX3Oe0VPexozoUJ5AquiQC/uomkBuk9JJjjv0TCZJfcTvl4qZ5muweFGNb4NxxZdkD+54yxyFsJ+a555ZRhzBNnZi2T2KAeVySqE+vOf78vrWW0MgrekOCChEuNclmMsDIq/EcfOk55em8MsJhbKQIfubaB/I4iJFPvpLL45Ar65zpfHGHEDzbEOTqssO1j+/unUZci5abXTwUQu3k1WLBRytCAiigVm+ikYpgzIxzQG56q+jRZ9uTAHXwUFUg4fUU2rpGyCQlHnmpBezZp4XFTjPpIDNYc2LkXgzTb58oe9ryS7ctTjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xQXZUnLZ5wsHNRQ4k/cK17Kdw0dLBjzWyLGu7lzOnM4=;
 b=FOjqWLzkCKwviqE+KlUJLyCWP6YO7kdRMbspBiYwU6WG0SdOKtviRAOgk9fTySQ4KqF2fwKWu4oqV0UyZVahCVfMOQP4Hoyr1Md5dFohz5yVm2smfK4nJJ5LVW6RFcngWf0eFpwPq5Tnf2c7gYB6JxlAxrsw0XxF4zVsFZbprhcm1Ueh7eX1YWM1el5xIZEmeMEYFF2aKigfZ6KCmZr3sbcIpd0DzF8WkbwlRDRDc0TCQd7T1RXtTb95hM8herfTAdzHK1uz3IIOltk8h5H3YCj+0J/8j2fUJ5NzLQJqvQT4Huy+Ua9mAH+7AcMMWhqHGuuBSarnm7jn0bhDUt1KRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xQXZUnLZ5wsHNRQ4k/cK17Kdw0dLBjzWyLGu7lzOnM4=;
 b=n6ld/LgaKNOKVTENIvoS9u9U6oy6c1Jl3gZxj9rB+0fz5lXO6eMFkeCnuFcdnnxF5HkcrgGfQWCWV4ADa98kV4WWHF/X41hxhy6bps5iiDoOh160/ZDj+f0pTlJRcEaph/HloGEbOCUKouSd96viBu6UCq+FV8g3dvpCr2CvdHQ=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by DB4PR08MB9310.eurprd08.prod.outlook.com (2603:10a6:10:3f6::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.29; Wed, 19 Oct
 2022 15:30:20 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7d2b:2570:9a99:a3d2]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7d2b:2570:9a99:a3d2%7]) with mapi id 15.20.5723.033; Wed, 19 Oct 2022
 15:30:19 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "nobuta.keiya@fujitsu.com" <nobuta.keiya@fujitsu.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 3/3] gnutls: Unified pakcage names to lower-case
Thread-Topic: [OE-core] [PATCH 3/3] gnutls: Unified pakcage names to
 lower-case
Thread-Index: AQHY46su9qBsvIvsn0eUzRvCskq9gK4V2A2A
Date: Wed, 19 Oct 2022 15:30:19 +0000
Message-ID: <CA65B93B-6009-4F66-B872-54BE4351E8F6@arm.com>
References: <20221019105739.2279010-1-nobuta.keiya@fujitsu.com>
 <20221019105739.2279010-3-nobuta.keiya@fujitsu.com>
In-Reply-To: <20221019105739.2279010-3-nobuta.keiya@fujitsu.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3696.120.41.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|DB4PR08MB9310:EE_|VI1EUR03FT039:EE_|AS8PR08MB8801:EE_
X-MS-Office365-Filtering-Correlation-Id: c8268529-c34f-4856-af0d-08dab1e6da10
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 XGZc2tH9hYvhBoSs3vs7DleWkwDbLS7KxeWWPYg0BGUdJZMXC85Oazq/5H3jp9Jf4RdCBvlpfH7Iz8qdetIHNP1XBNoGWngcHqbgm2tel+yaOnjrsG1LziOa12ihMMYwsDze3bjwGvU9ldv0NHJ6yFvR0Uz1Tm3h9mAU1r2nFJuB3PHuvUGi2W2BNaxRjXE2iUTbaQiPSWBUHb6ecPnPrZCDgP21+96PIWkxXh6ChqHN43JIMD0IOyC7tViCqy+FliCQc0vtJpSn7Jwds/wScion85qH2Dnq3TS7UkdslG115OVlsLMm+bjj8G4qlkWde43JIFWtYm1BSYMxpRQjUcoHgFWGSNM8E9GwmQnJL2pp+A97ZIA3nD2Y7m3bYRMZeHph10biloq8poIWX9D8jixwNKLeglZv9Mx1S2rrHUD8qOMWt6h+D5NAmF/uCaifRzEx0DRDauL7+E3zmbypKvJFBy4kfPPOn5GLv60V27qSOZwz0g4PxvqF7pSPgucYCsOd9/1JE65argeEG0hqpd1u+n5KQMtmqamTH+0ZDvZmaloPJTdDwfHPKOZA6QtTDl+8JzY3BakaNnYtUCqaDTm660oiSlUvomozmmKBHtzIWbeEypYEYNpVyk0HH0flD+bNjU7IovVF3XtJgnvTBZSmgmNZK2WLf4yHIjWmoaAMfSJPi4enoSKtQTjxQKptxJVB1FCYygBFVS5iYUCPzzTYjL90DYjUa3MFhdC+azS0NPQnbHu0GeZrHfQbcdAMHsHRfhE20ciztuhGWXI93uFUaQjjcpTX+1kQwYmzOXE=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(366004)(39860400002)(396003)(136003)(376002)(346002)(451199015)(2906002)(5660300002)(8936002)(66946007)(91956017)(36756003)(64756008)(66446008)(66476007)(66556008)(558084003)(8676002)(6916009)(122000001)(6486002)(6506007)(33656002)(71200400001)(478600001)(41300700001)(4326008)(83380400001)(316002)(86362001)(76116006)(53546011)(38100700002)(186003)(38070700005)(2616005)(26005)(6512007)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <845A1BEC3A41F74894041178E5FCE3DB@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4PR08MB9310
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 VI1EUR03FT039.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	c7eb1ad9-18e8-4b9f-a63e-08dab1e6d4ed
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	ovJNjv8nYzDjioDQf5m/4PQ1/Tz6GwmyzVRVrC+/SBGzSn3aAIvr+eeaDkmt0PksvzRRWsvcwsejTevdVFH8SZhFGYrHdurgJeuAVy5+3sMgj8WLdXgMqrC6N0TPqmtZzNGIr6UHtSJwVjE3LRip9vhlvdIH7IOow/J+9f5PS1nKDFqtLJ8+W3eK321BeVkh4T4sz7A7JP8RcwYcQin+sVs09g6+xaFyCI0q8bBzhHDXp5pqpdRrk46EPuYlfphxceklBel9XoFS0u43h46sAKu+g96ZsJS1Eb1/clpGN6sJnMbJbN85VSBD/trUz6UxMiOGevC+/xMT5o4MhYHKHfRdKmzVEwjLEastkCy+ukqMyeriwJRBcZvkHO8dajoVQfQPBt0J2uRJmk/f6nOh8XFM9KNzBxKjFjrlOEBa3dsoPCoKn/WIgUQPO0bOAX5TTOn6uArVeGtzTd94bOXVTr7hRaZ4EfoPJB5/JiTa+T4ZA2TY7UhB9WlYMg6YS3JTX4Px4a1JyTtSJZpPYoYLL1km0+LNJUA/0KpGucc6jDIRejGL47wK3ZWpYC5FXyuoVp5wbN+T17iNUcBpZc4+0N8JbR8i6L9r6EgcjZNsGNj5r8oVo3/R5o4d6893uVmLFYOwaQZ/uYW0Np5VVenq6Y+XDYAvizr3o8s5KPGaakmoL9yqcH1Gz672M8bpp8d8aCuu91ACilnC6WR6XVeCpQZRKC3U3wV+xnhdw1fFo/BWbbKAJ9UcKdPjxBHt5cvmxVeMSy+nE94BpiFsF4BuQA==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(376002)(39860400002)(396003)(136003)(346002)(451199015)(46966006)(36840700001)(40470700004)(4744005)(5660300002)(53546011)(4326008)(8676002)(70586007)(70206006)(36756003)(8936002)(6862004)(6506007)(316002)(6512007)(26005)(41300700001)(40480700001)(36860700001)(81166007)(82740400003)(356005)(82310400005)(2616005)(47076005)(40460700003)(33656002)(336012)(186003)(2906002)(86362001)(83380400001)(478600001)(6486002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2022 15:30:28.4529
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c8268529-c34f-4856-af0d-08dab1e6da10
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	VI1EUR03FT039.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB8801
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Oct 2022 15:30:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/171971

T24gMTkgT2N0IDIwMjIsIGF0IDExOjU3LCBLZWl5YSBOb2J1dGEgdmlhIGxpc3RzLm9wZW5lbWJl
ZGRlZC5vcmcgPG5vYnV0YS5rZWl5YT1mdWppdHN1LmNvbUBsaXN0cy5vcGVuZW1iZWRkZWQub3Jn
PiB3cm90ZToNCj4gDQo+IGNyZWF0ZS1zcGR4IGNhbid0IGRldGVjdCB0aGUgbGljZW5zZSBwcm9w
ZXJseSBpZiB0aGUgY2FzZSBkb2Vzbid0DQo+IG1hdGNoLCBzbyBmaXggaXQuDQoNClRoaXMgaXNu
4oCZdCBzcGR4LXNwZWNpZmljOiBub3RoaW5nIHdvdWxkIGhhdmUgc2VlbiB0aGF0IHBhY2thZ2Ut
c3BlY2lmaWMgbGljZW5zZS4gV2VsbCBzcG90dGVkIQ0KDQpSb3Nz

