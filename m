Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8B34EB64D9
	for <webhook@archiver.kernel.org>; Thu, 29 Jun 2023 09:44:14 +0000 (UTC)
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (EUR03-DBA-obe.outbound.protection.outlook.com [40.107.104.73])
 by mx.groups.io with SMTP id smtpd.web10.4673.1688031847149131384
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Jun 2023 02:44:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=pCARa7ke;
 spf=pass (domain: arm.com, ip: 40.107.104.73, mailfrom: ross.burton@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kFKEKKztTITXoGCh2q3OfHd0EuZwy25HY7UvPpV+w7Q=;
 b=pCARa7ket37ICx0iH7ar2y4GyOx6XFKprm2wQemKpERzhf0ZLP80UGr8dW5c3EvjzJ3Hg0WM94pGnlSLL6axoLHk1D9JB/zSg6KmTDRtKgfdKqBx96pRHtZOFLqNSp67Rgj5AxmtQ/RJEKZBDYve14h+Eu6Erm+Qkacw6rmAuLI=
Received: from AS4P189CA0020.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:5db::9)
 by GV2PR08MB8317.eurprd08.prod.outlook.com (2603:10a6:150:bf::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.24; Thu, 29 Jun
 2023 09:44:03 +0000
Received: from AM7EUR03FT061.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:5db:cafe::bb) by AS4P189CA0020.outlook.office365.com
 (2603:10a6:20b:5db::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6544.19 via Frontend
 Transport; Thu, 29 Jun 2023 09:44:02 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT061.mail.protection.outlook.com (100.127.140.72) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6544.19 via Frontend Transport; Thu, 29 Jun 2023 09:44:02 +0000
Received: ("Tessian outbound 52217515e112:v142"); Thu, 29 Jun 2023 09:44:02 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 3b13f9abb7e75fa3
X-CR-MTA-TID: 64aa7808
Received: from 41dca9670385.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 7FAB71E0-84BC-443C-93C0-00813B57744F.1;
	Thu, 29 Jun 2023 09:43:55 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 41dca9670385.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 29 Jun 2023 09:43:55 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UIFRumUbXJs5LLS4pWWhaQVB+mTfBchYMYq+gqBM02bUgWQPpewaDeMtupeIefAIdAtya0msUip+eNsX/nYLzzXJic49u+3gLuNRMumoic6NX3mFmdzZ5YntOkQJS5zpbFVo+ffoVblHCJ35Jcz663RH0cSUAcDpg24bTrC+BNC1fxbMa0Ly1hw14nn/ZHt9UpUCDgpTR6DWY0LztPXP/hjB67IMOvgPPAwf7miFh/oT1AosWs7Ud9l14JoFwRYY0rLWXCYLnEhMCXaxg/ED9wgRNQloiK15C+b4dy+4EW2lBLranjO/24xpjzDqHZtlAKbQWl/YAS+vfRC2DnQ7tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kFKEKKztTITXoGCh2q3OfHd0EuZwy25HY7UvPpV+w7Q=;
 b=klF84v/FiRKr6vW7UIUebvdpo4Zz17sKSV5WATtAurNTC5hMMZ4mn9wLIJvd8YXDnKaEpd2rkYRpMVc1EEi4t1UTElI+GrFTH9Tiw2EnACVbaOJdIuZD7DTZzUlvcDeOskl+1SdPWw8dMO7iAJf3QDfZy+t3K7GfXw8OotSIcwKWnciDAx/e+pj6zy4+JvZCAeHmZ/frBwkbzbI7oRFsFAgw+P6lJgop5NNWb0CJMrVGdHLCcaOXSTzDOk2KMKaPbFAzoF/tU0Llg00Pjqi9hWNGvXrGFj/D3nO/DejTwjH52CsF79bzQMEFLcX0GvgL+g+Z8mF+Mfei0xNhdCxO5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kFKEKKztTITXoGCh2q3OfHd0EuZwy25HY7UvPpV+w7Q=;
 b=pCARa7ket37ICx0iH7ar2y4GyOx6XFKprm2wQemKpERzhf0ZLP80UGr8dW5c3EvjzJ3Hg0WM94pGnlSLL6axoLHk1D9JB/zSg6KmTDRtKgfdKqBx96pRHtZOFLqNSp67Rgj5AxmtQ/RJEKZBDYve14h+Eu6Erm+Qkacw6rmAuLI=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by GV2PR08MB8632.eurprd08.prod.outlook.com (2603:10a6:150:b1::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6544.19; Thu, 29 Jun
 2023 09:43:51 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::30b4:3110:b02d:7f21]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::30b4:3110:b02d:7f21%7]) with mapi id 15.20.6521.024; Thu, 29 Jun 2023
 09:43:51 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "Krupal Ka Patel -X (krkapate - E-INFO CHIPS INC at Cisco)"
	<krkapate@cisco.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] Multiple providers are available for runtime libltdl
 (libtool, libtool-native)
Thread-Topic: [OE-core] Multiple providers are available for runtime libltdl
 (libtool, libtool-native)
Thread-Index: AQHZpObVvpR86lAiz0evk36F2k4EgK+Wjm+zgAYaaVyAADBWgIAC0h2KgAHnRQA=
Date: Thu, 29 Jun 2023 09:43:51 +0000
Message-ID: <6F3229B2-74B8-4DB1-8898-D087C9E6DAD9@arm.com>
References: 
 <BL1PR11MB539919006E25CD8243EDE31FD322A@BL1PR11MB5399.namprd11.prod.outlook.com>
 <BL1PR11MB5399A434D9A3B13D1A802A4BD322A@BL1PR11MB5399.namprd11.prod.outlook.com>
 <BL1PR11MB53990B0F5E0ACD4C6A10149FD326A@BL1PR11MB5399.namprd11.prod.outlook.com>
 <9059A405-BFD8-4F3F-BDEF-CB5A64145F76@arm.com>
 <BL1PR11MB5399FACF34FB1B861D5FC102D324A@BL1PR11MB5399.namprd11.prod.outlook.com>
In-Reply-To: 
 <BL1PR11MB5399FACF34FB1B861D5FC102D324A@BL1PR11MB5399.namprd11.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3731.600.7)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|GV2PR08MB8632:EE_|AM7EUR03FT061:EE_|GV2PR08MB8317:EE_
X-MS-Office365-Filtering-Correlation-Id: c4883337-55b5-47f0-72d1-08db78855f26
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 j9+he1ABrgyaEmjBL+ZeCif7+R0Kz3UCTg6MXvOnUQCfyPaCJjvjEqfJ4YOCpk9VK8dj2bZwW8LqD0VlgYsMuTUUj580Spi1eAVRGII4V+VTPhjsevteLMeJyl/SNjCBkLaDeQX0HuuZhs3UUCy1lVAwf+DBkBiTQxuBkxqTaSzG2nipcPLPqbUwzmmqHzz91BWp1tPblB8EvZVGIXB+AgmasvniSDzYYajWC3Q8zHAGJcUZh/PItJO8ZGh9Me8L/xyYgWdbZs53rHQbuAqHcLEvd+rPH2idJKmDuHZkQXeFGPHv8FMWFFzcwDm+BHcYxA4kf8TO/fsEUebdLmx+qWI/LX+8Id0LSe4N3s+8SUTjqoOqac86tU1frW9wgMsXLu3hP5f6q0E23hj1HTgoPT85LTN1S4h6lizg/QniTgtfnGUJWScj9D+o7mU408SgoYb+7yGrPn8jwkzXBEQGpYaKjjw+mGb/qZaU8HkZuTzQVcnF3eZH1dHxt+YyjGvRPJxaNppT7lO/8EWv9nSP43W+j5PxURnv51qrk1pRpmjmFPuFWOVsLWKp041yxMVNr2LCGqzFt3l1XP1KKH/2NnO1xMur3GoRx5vcX0lm41Fp7QPeJejppJpvCwg9rv8IXH8w73xdfpNi0X8+bL8lTQ==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(346002)(39860400002)(396003)(136003)(366004)(451199021)(478600001)(6486002)(71200400001)(91956017)(76116006)(53546011)(6506007)(26005)(6512007)(4744005)(2906002)(66946007)(186003)(41300700001)(316002)(64756008)(66556008)(66446008)(4326008)(5660300002)(8936002)(66476007)(8676002)(6916009)(38100700002)(122000001)(86362001)(36756003)(33656002)(38070700005)(83380400001)(2616005)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <CF84534EA208DF4DB80803D2A0DF364B@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB8632
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM7EUR03FT061.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	35161266-e1ce-40d1-8dae-08db7885587a
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	cs/CxLjBz1qpq0CuG+C486wV98pvK2TX5KOJEol3tWaVm7MbkkE8Gw/pWgeDk8QPwDwuD7DIcL7L8Jydomb2zqOnpuIVZZr4aQNmXaryxmodnwUwobqezgHhVtiEKOXmLBj/trdS/0vsIUZYiM38hrshc0nIAHW4riuHv2wEqP5J3AARe6oYsSTzRigZrBQa2BSUs5WIYXh1bLdrBWYsqwgzk3txBsB53SiCbSTKqqkJn9MkuTvL+OXt4cMuxRDXG6oEzl77ES8q1UZHrQxceeVP1A1sELZforXVb6SAHdH3zCf5orFhO2knNB2zqyJpXZk9EA1egt4p0fZcfK6b4hfwphc8pP23mQUKnSrloLjRTcRCBdXkXIE5tLAYdVzl9cLqKs+NhbUzwK9WwLmOEcoJ9sP9cl25R7EZXO+1rV3Pohn6i9AnNAnuHFEvEFj4BsjlZAmJeoweejGmHv1CY7eKcrBxsDr0vm5dWXQoXdp1v1YeVZ5ixJQI/T/I/Mvw//zmg2UEHi9iLkeeYZQldJj2AEYaSRagIk9kzhCJT05oaSgsBMoUYylSxxtwR1NWavXwheq0kaLARwuoeQp8qZtcUR++4WaIokF/CDsliJ53HidhkOg/FbRxm2ht5haZh2NqceMHcAfqSL8bz6Nl+P8NMmbvNGysifLZdQWkyE2KLPcTzfedoxdhb3ZF3KE7rQqZLJeaMpxqF7Ogdg0vZIIr8i3JZmnQJUvdzUaXaXl3CtdM/8NJ+czlF5Z7NdGN
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(376002)(346002)(39860400002)(136003)(396003)(451199021)(46966006)(40470700004)(36840700001)(6512007)(4744005)(2906002)(186003)(40480700001)(6486002)(82310400005)(82740400003)(83380400001)(81166007)(2616005)(6506007)(53546011)(47076005)(26005)(336012)(86362001)(356005)(36860700001)(40460700003)(41300700001)(70206006)(478600001)(316002)(36756003)(4326008)(33656002)(70586007)(5660300002)(8676002)(6862004)(8936002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2023 09:44:02.4770
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c4883337-55b5-47f0-72d1-08db78855f26
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM7EUR03FT061.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB8317
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 29 Jun 2023 09:44:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183614

T24gMjggSnVuIDIwMjMsIGF0IDA2OjQzLCBLcnVwYWwgS2EgUGF0ZWwgLVggKGtya2FwYXRlIC0g
RS1JTkZPIENISVBTIElOQyBhdCBDaXNjbykgPGtya2FwYXRlQGNpc2NvLmNvbT4gd3JvdGU6DQo+
IA0KPiBIaSBSb3NzLA0KPiANCj4gVGhhbmsgeW91IGZvciB5b3VyIHByb21wdCByZXNwb25zZS4N
Cj4gDQo+IEkgYW0gdXNpbmcgR2F0ZXNnYXJ0aCB2ZXJzaW9uLiANCj4gDQo+IEkgYW0gYWJsZSB0
byByZXByb2R1Y2UgdGhpcyBpc3N1ZSB3aGVuIEkgYWRkICJsaWJsdGRsIiBkZXBlbmRlbmN5IGlu
IHRoZSBjb3JlLWltYWdlLW1pbmltYWwuDQoNCkdhdGVzZ2FydGggaGFzIGJlZW4gRU9MIHNpbmNl
IDIwMjEsIHdlIHJlY29tbWVuZCB5b3UgdXBncmFkZS4NCg0KSSBjYW7igJl0IGV2ZW4gdGVzdCB0
aGlzIGJlY2F1c2UgZ2F0ZXNnYXJ0aCBkb2VzbuKAmXQgd29yayBvbiBtb2Rlcm4gZGlzdHJpYnV0
aW9ucywgYnV0IHlvdXIgZmFpbHVyZSBjYXNlIHdvcmtzIGZpbmUgd2l0aCBraXJrc3RvbmUuICBD
YW4geW91IHJlcGxpY2F0ZSB3aXRoIGEgZnJlc2ggYnVpbGQgZGlyZWN0b3J5IGluIGEgY2xlYW4g
cG9reSB0cmVlPw0KDQpSb3Nz

