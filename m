Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D557ECAAA1
	for <webhook@archiver.kernel.org>; Fri, 28 Oct 2022 11:46:56 +0000 (UTC)
Received: from EUR03-AM7-obe.outbound.protection.outlook.com (EUR03-AM7-obe.outbound.protection.outlook.com [40.107.105.43])
 by mx.groups.io with SMTP id smtpd.web12.5229.1666957612839783639
 for <openembedded-core@lists.openembedded.org>;
 Fri, 28 Oct 2022 04:46:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=mFWvOVy9;
 spf=pass (domain: arm.com, ip: 40.107.105.43, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=L5DB46X8kooqyodhOsf/DwG7eUVj1XvrfUZEfhXksQxAJ51rGi77YMRiGoek0XkhDvw0BDy3SA7prLBDMWszIOkTYXoMZY+oMzdCU1IBzT6ovNxhZ9FWgM/M7nLD52TD4MK1hMdMIKc/WM69AuFq/2uGek4j5PdipqckiI6k9xTz5gKKtaUfHxd3dv+Uqe3qqCXtVP3AJyXOhA2u8NCpY4EKN2gOmvmELsIo+7yDLmMU5o9AfDgurc3/kMmxbt+avHiCasrDbfzAr9sEAgIUvyz8MkB1C5wWlLl/tP83jGzvkQIZzJRFFa410zvPjaPwxe5/KAGcl8arZ7zViLQ9kg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FdY7/TSQxzY2BWXOCYizh5VSwF5B3+NFXOEydfFMnLA=;
 b=Q5xvvU4sD6zk4V7atL25vO3B1IkEhcUb4zaygWG4TIfSkUDO2NKLHpYzHbqa2T9IWg2/YuaD+mpjl+JJvbKdRlHMk8ZA9kosDsGKdeuPenppn/QohjLuETgnBvM+Q7vOMPbgzE37jKgXsw5izAL09xxE9gwX972nQly5nrEJrIqywXJYZnCEFQPQ3gme1KqMNO9sHBirAcIGO1tbl9Zajvzx85uDNFpq3kUA+tOS2l3xIAAo2U2UmJJx85Hpipr4ql4u3nfcvUDb8dloo0eLfZntoC5rq9gL8SJcLFm2AyBmU1PWKHqNezuchs78pa2AmJLvwPsmcFOqWrC65HqoRQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FdY7/TSQxzY2BWXOCYizh5VSwF5B3+NFXOEydfFMnLA=;
 b=mFWvOVy9ceya3nDdznQwXd7OxeOEeVDb4s+rcUDF5fGCMfwFH65JHB0anCma/My5anvvjJN0zQfK7ZMAFoezb1XywJzVwIrCAf0JbIuCwYj1Q+llxqf9bjeMbNNF1TIAeWao3KVj1BQOXtKEH7s/7djA54IHVqex7NbtTNVQ7NU=
Received: from DB7PR02CA0023.eurprd02.prod.outlook.com (2603:10a6:10:52::36)
 by DB4PR08MB9141.eurprd08.prod.outlook.com (2603:10a6:10:3ff::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.28; Fri, 28 Oct
 2022 11:46:48 +0000
Received: from DBAEUR03FT016.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:52:cafe::b9) by DB7PR02CA0023.outlook.office365.com
 (2603:10a6:10:52::36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5769.15 via Frontend
 Transport; Fri, 28 Oct 2022 11:46:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT016.mail.protection.outlook.com (100.127.142.204) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5709.10 via Frontend Transport; Fri, 28 Oct 2022 11:46:47 +0000
Received: ("Tessian outbound 2ff13c8f2c05:v130"); Fri, 28 Oct 2022 11:46:47 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 0af4313dedf70ed7
X-CR-MTA-TID: 64aa7808
Received: from d49d677330c4.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 32100FA3-2964-4344-884D-D25BFE183CD4.1;
	Fri, 28 Oct 2022 11:46:41 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id d49d677330c4.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Fri, 28 Oct 2022 11:46:41 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G5ODG99S9GRIOlD3T0YVJ5up5KwjMpLiJLWLsQJrZqtp9y0UDR1GOBXsqm3Do73a4jPhxxZdfyJOpBsOqsPPJBS0h0r43llDXN6W3sGXpw8E7TlV7yQzX4GYyZacvRDkmLkviKXArviX2HEU9d1RFBRE46taywdX0P6bDb0g5tu6HtVC0LnIZ33g3TlB6MDMDQMrkc5mxHst2I7xKG3l5X0SJnn5eb9EKJGLl8wX65dDa9040tIdkPS1dpIt+IENEGyrzI7bRrYm6MBVAH3HuMcj32Gs5K81IG0YTk+8EpTMaKldnm83TUqK9Lz6WAeyTbMH89sNOPxtZxeM19zsIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FdY7/TSQxzY2BWXOCYizh5VSwF5B3+NFXOEydfFMnLA=;
 b=GyE713HHA2w/sgxlPTTFix5ByryBkAJAFFBwJ9XbFeQXHMa5xDY57aiODsxSnCjam8YSlsSEL+bse5sTWO7stBYY7OumJPk2P/BHLtW82nE7XjnR6f9SlQCcMwiC+SKCOX+76V0hpWG4OM5Vf2Z3zoZaGRpN5oZA6Vp3Ps1/IQC12Un92GNHpShPb9syh8oPwbWvzBc952HqOx/grg2r3avc6IzNWcLmfjoft8wnQGmoeCLu7p3Zwsb7RyAnv5yusfxg2R8pMyngciQy2qwecWQIOTeWrVEBJNnbjKhuXrB0MD9HfhETZBWyNeNSRK3z6QUWeJIBi09A/YmWRihoFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FdY7/TSQxzY2BWXOCYizh5VSwF5B3+NFXOEydfFMnLA=;
 b=mFWvOVy9ceya3nDdznQwXd7OxeOEeVDb4s+rcUDF5fGCMfwFH65JHB0anCma/My5anvvjJN0zQfK7ZMAFoezb1XywJzVwIrCAf0JbIuCwYj1Q+llxqf9bjeMbNNF1TIAeWao3KVj1BQOXtKEH7s/7djA54IHVqex7NbtTNVQ7NU=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by DBAPR08MB5653.eurprd08.prod.outlook.com (2603:10a6:10:1a9::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5769.15; Fri, 28 Oct
 2022 11:46:38 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::52da:ac9d:e42d:8cc]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::52da:ac9d:e42d:8cc%5]) with mapi id 15.20.5769.014; Fri, 28 Oct 2022
 11:46:38 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "robert_henz@jabil.com" <robert_henz@jabil.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] PR to fix WantedBy parsing of systemctl
Thread-Topic: [OE-core] PR to fix WantedBy parsing of systemctl
Thread-Index: 
 AQHYzQWznyTD58gH9ESfGzUBG724QK3o02CAgAk0S32AACCngIAA8TkUgAA30oCAAAObgIAwltuA
Date: Fri, 28 Oct 2022 11:46:38 +0000
Message-ID: <137BA618-56FD-422C-B956-C45B4FE47D1B@arm.com>
References: <28379.1664285599238247382@lists.openembedded.org>
 <14846.1664286373544166845@lists.openembedded.org>
In-Reply-To: <14846.1664286373544166845@lists.openembedded.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3696.120.41.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|DBAPR08MB5653:EE_|DBAEUR03FT016:EE_|DB4PR08MB9141:EE_
X-MS-Office365-Filtering-Correlation-Id: 74924a81-b7dd-404b-ab7f-08dab8da186b
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 KznvFAfCmaWaP0FJ3n3Shop5DORL0Fbq1j/Xvd0FGi3l9DX7rQWE6Hs6ARJ4hU1uwKiWBE6cAzuiJCpbaxlkBWyfA58MnRZNnLtAxIlKCXKUR5fdlnvvVrXvUXGfFrQ3o7XTpdbRl7fk7H4ampRI8qYfJ+DwRMyDcjJNlQPcseDOxAA2fMNvyWPRQwRHhNr/HZOWe4eh7GPWENNy42Nb99UlUHGQCYn00HgH70LYDiDEuEFJZd+4oLECjTbeyN/tGXTBDb+xcyluXoSznFGcff0juTqQXJevKVLfDWLzu5SEC598XKiEio6WlDYoedwAIA49PabBa3MmiNy774YG7rgWSZqX20JZPZeNDYXaD31Ij6Z8jyG5o86FQqo8nMipmkwzfrDtlxx/Y6xCvTcE8/PuNOPrx1VxpUgpX1GtVfQDybQGSg3ajBJfYRmWZsX6Y8EvqZMygurId3NEmjAR1xvCJwHSy/tufDBdjIba4ZxnMFJefAfvNl+B34TMwDaBSvIV5Fbhd0sp6fE3k7rtD1ivCXaXS/+EDQc5Zph7FusRLZueLefStUVhRepzsZLjZkBRJ2OJ8z9spCyKM2uL9US7U0zX5T3u/jCGvm+01/+np3BMmwDRZyr3gVph7jaeNFc+usX/xSjzooI4CZVc3ss3GdsV5iq1ilvzORpbjCBRvNoKDg9REtR6cbf83nmqbEa1SoFDf2yPkkK/nq4lAJ1R/NwEkhxMH5T3QBQJGxPqsm0mbGnli7Y1YfglmbUtjIWDdHyaSZ2Lu79g6BkZucZc2NlboM4I+plh5IEyAMJCrlSOLRfvJGsNlYHhiRxNEcvK+ORI/iPjmVAASsnlvg==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(396003)(376002)(136003)(366004)(39860400002)(451199015)(6512007)(2616005)(478600001)(26005)(6506007)(53546011)(83380400001)(186003)(2906002)(71200400001)(66556008)(4744005)(316002)(6916009)(91956017)(66446008)(6486002)(66476007)(8936002)(4326008)(5660300002)(76116006)(8676002)(64756008)(66946007)(41300700001)(66899015)(86362001)(36756003)(33656002)(122000001)(38070700005)(38100700002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <F450849603398D4A89F9E53E1A5A60B8@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR08MB5653
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DBAEUR03FT016.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	2d39721f-ed00-489f-42c7-08dab8da12a8
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	7FRR/sO/oF6qoTEbPnfgQPk5Iq96NZ1cgWpa+l/7rMa0tx++Vm+fFF3Bd0oMRwh6p48wIzv3ocPbHK1dbk+3JsjIoCyGr12tZ6WP8XrIsoeuUrD7NIEQRvIPMYXPvGpWTnwpoCjE+P5gkUaJ2EZBPFQEGgAUa8LqZZkXj2qDLzKap8njBgSEXsCyz9uDO70agyIu4EGDhKx6Plhj+MdCAIm9FwhEq8i5Y4X3hUqQ8jcoDSjuIx+woPN9tHGNAw09gIJ7l5EzZcMVpCnmEU+EuPl0b40dlWkVb50IZb4ooGezo6I9HW0NuKP0Icu7yAUGrqdeX+7lolFh4ao2QjfAvHlEUt+rZWiSGjv+O0aYnyVZRtY+vbl+1+Gb7SWPTU34NCmT5PcnzvD4BzRtjQC7a5pPHVIGi0xy1SKN8ErZQfCRIYceDT/AtHdWMBW6P5AO4juTQbAeZQ4YFyoCFtqadJlaLbDxyU60MkQbQ81ydJOj1XIvQyziv28f0gqQBsLpxzE3xCt4FSae6zbybFesjVBxBmmenFzRSO+Y8AkG22hmBE+wuZmC2uz9odSeCNKnYr7QS9HXb1QyrKP850IQcwSRjC8DHHfx97hNe9bc4aFMH1vydltriVHq1ePRF6PZuWru0s1EqPSUk6cUki/KwbdLlIX3RaCz+is+eHU8NMVCtBl0hyNpanPrcnPie0qwMQrZK2epJiEg2F8cIrtBhc5JmncsN/znCAtpas6eLtdVYKqlPedzvVs7d0nFv83Q3LQAqqasHJD3YEmzy43Bj7hHlZNXKg/APDsmmsZvTuc=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(346002)(136003)(376002)(39860400002)(396003)(451199015)(40470700004)(36840700001)(46966006)(40480700001)(2906002)(5660300002)(336012)(186003)(2616005)(47076005)(6512007)(6862004)(41300700001)(4744005)(26005)(82740400003)(356005)(86362001)(40460700003)(82310400005)(33656002)(36756003)(81166007)(8936002)(83380400001)(36860700001)(316002)(66899015)(478600001)(4326008)(8676002)(70586007)(70206006)(6486002)(6506007)(53546011);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2022 11:46:47.8281
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 74924a81-b7dd-404b-ab7f-08dab8da186b
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DBAEUR03FT016.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4PR08MB9141
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 28 Oct 2022 11:46:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172248

T24gMjcgU2VwIDIwMjIsIGF0IDE0OjQ2LCBSb2JlcnQgSGVueiB2aWEgbGlzdHMub3BlbmVtYmVk
ZGVkLm9yZyA8cm9iZXJ0X2hlbno9amFiaWwuY29tQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+IHdy
b3RlOg0KPiANCj4gSSdsbCBtYWtlIHlvdSBhbGwgYSBkZWFsLiBXaGVuIHlvdSBhbGwgdXBkYXRl
IHlvdXIgZG9jdW1lbnRhdGlvbiAoaHR0cHM6Ly93d3cub3BlbmVtYmVkZGVkLm9yZy93aWtpL0hv
d190b19zdWJtaXRfYV9wYXRjaF90b19PcGVuRW1iZWRkZWQpIHRvIGluY2x1ZGUgdGhlIHByb2Nl
ZHVyZSBmb3Igc2V0dGluZyB1cCBteSBwZXJzb25hbCBnbWFpbCBhY2NvdW50IHRvIGFsbG93IGdp
dCBzZW5kLWVtYWlsIHRvIHdvcmsgZnJvbSBteSB3b3JrIGxhcHRvcCwgSSdsbCBkbyBpdCBhbmQg
c3VibWl0IG15IHBhdGNoIHRoYXQgd2F5Lg0KDQpXZeKAmXJlIG5vdCBnb2luZyB0byBleHBhbmQg
dGhlIHdpa2kgdG8gY292ZXIgaG93IHRvIHNldHVwIGdpdC1zZW5kLWVtYWlsIGZvciBldmVyeSBl
bWFpbCBzZXJ2ZXIuDQoNCklmIHlvdXIgTVRBIChsaWtlIEdNYWlsKSBuZWVkcyBhdXRoZW50aWNh
dGVkIFNNVFAsIHRoZW4geW91IG5lZWQgdGhlIHBhc3N3b3JkLiBJZiB5b3VyIE1UQSB1c2VzIDJG
QSAobGlrZSBHTWFpbCkgdGhlbiB5b3UgdHlwaWNhbGx5IG5lZWQgYW4gYXBwbGljYXRpb24gcGFz
c3dvcmQuICBHZW5lcmF0aW5nIHRoaXMgaXMgc3RlcCAyIG9mIHRoYXQgU08gcGFnZSB5b3UgbGlu
a2VkIHRvLCBhbHRob3VnaCB0aGUgdXNlIG9mIGdpdC1jcmVkZW50aWFscyBpcyBvdmVya2lsbCBh
cyB5b3UgY2FuIGp1c3QgdGVsbCBnaXQgdGhlIHBhc3N3b3JkIHRoZSBzYW1lIHdheSB5b3UgdGVs
bCBpdCB3aGF0IHNldmVyIHRvIHVzZS4NCg0KW3NlbmRlbWFpbF0NCmZyb20gPSBSb3NzIEJ1cnRv
biA8cm9zc0BidXJ0b25pbmkuY29tPg0Kc210cHNlcnZlciA9IHNtdHAuZ21haWwuY29tDQpzbXRw
dXNlciA9IC4uLg0Kc210cHBhc3MgPSDigKYNCg0KUm9zcw==

