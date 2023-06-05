Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49E21C7EE23
	for <webhook@archiver.kernel.org>; Mon,  5 Jun 2023 13:33:13 +0000 (UTC)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (EUR04-DB3-obe.outbound.protection.outlook.com [40.107.6.51])
 by mx.groups.io with SMTP id smtpd.web11.7787.1685971986791859947
 for <openembedded-core@lists.openembedded.org>;
 Mon, 05 Jun 2023 06:33:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=aW1Bl2/x;
 spf=pass (domain: arm.com, ip: 40.107.6.51, mailfrom: ross.burton@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nTt/Wi4vg5oCIN+VtgXhFTIAQn9kj2b2XnaapH5S2tY=;
 b=aW1Bl2/xfMyhUWL+CXxgGkuB8NZAsAcJ+si42+u5gvnmAN+4n1z9l6zoJw6M6mmcG5HZ0sU7wwSMhQOCCGdJrSmXYdp5fxzNo6D/Lgkd14uo0Wgqe5c4IwFDb3aojLWz957t+3wsYDMG2Z/h6+hqdmmpjFWPabjtTwbzotDBUxc=
Received: from DB9PR05CA0030.eurprd05.prod.outlook.com (2603:10a6:10:1da::35)
 by AS8PR08MB9766.eurprd08.prod.outlook.com (2603:10a6:20b:615::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.32; Mon, 5 Jun
 2023 13:32:59 +0000
Received: from DBAEUR03FT050.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:1da:cafe::1b) by DB9PR05CA0030.outlook.office365.com
 (2603:10a6:10:1da::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.32 via Frontend
 Transport; Mon, 5 Jun 2023 13:32:59 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT050.mail.protection.outlook.com (100.127.142.250) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6477.18 via Frontend Transport; Mon, 5 Jun 2023 13:32:58 +0000
Received: ("Tessian outbound 99a3040377ca:v136"); Mon, 05 Jun 2023 13:32:58 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 87091744ed1ef29f
X-CR-MTA-TID: 64aa7808
Received: from 8730758ab497.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id B28F5E02-EA1A-443B-B20D-C28D1072CB1A.1;
	Mon, 05 Jun 2023 13:32:52 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 8730758ab497.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Mon, 05 Jun 2023 13:32:52 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ov8GDVO1i4utIPu3TNZf+4qt1Y30pkyiVdHyBQZZCH+PiS27Uau5atNGArZh+M9Kc3icyHyKUFzLuYaAupEE6+rJdopL76q0MIXQfAxVtet9rGH/5UlNb3zGSLrGLHuIV+0zVcjVPPAmjq8bqoj7VOlVnjIqqjijgQLOPRSXqwCyQsD8gHIbZXnm0tzkYAj12Izzd9JgMIkedIyxUEpX0HM7UQzw9yQ9viYc709U3SywA0SHcXS+wyvqoFBeZ0q8NRmUWMDlcbZn4s1bilLJssVloOzhxJlAghQ+pSbl7f75m+BgW5Sv6nJVgsecZDZlOI7yt9MsQFaLc1BTaDUURQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nTt/Wi4vg5oCIN+VtgXhFTIAQn9kj2b2XnaapH5S2tY=;
 b=Dl5QDC8rn6wBMhEwRNRcv4MTbheI5+PvsX/pkFZWvNcxTbQfMNxgutDzz8kCFgt/uF6DlCfRhjufelUy4BjN5+KOSYixrBhuc2NsRQgKwKORRH6r65cZ6KhrkUd4j73XBhjs2Xalbc3Ye6x+pfXfH4p6MrgPJHmPGHtog2gnkdynWAfG+/kttUYyXk/T7r60IiTNJabkJEo1TGuIy1Sg5FX9sA1m3LocKyxXaSDpeJiM6AaYVxVJ4+tx/cX8SZc/DBAOJ1Ww9dFwutUFN/jDumenxM65hhdbwt8LTzxO6P3p5Ahk1QsWR/+I3z5dE0LkjJ3jvqWYQuQ2LkiCMu/QVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nTt/Wi4vg5oCIN+VtgXhFTIAQn9kj2b2XnaapH5S2tY=;
 b=aW1Bl2/xfMyhUWL+CXxgGkuB8NZAsAcJ+si42+u5gvnmAN+4n1z9l6zoJw6M6mmcG5HZ0sU7wwSMhQOCCGdJrSmXYdp5fxzNo6D/Lgkd14uo0Wgqe5c4IwFDb3aojLWz957t+3wsYDMG2Z/h6+hqdmmpjFWPabjtTwbzotDBUxc=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by AM8PR08MB5633.eurprd08.prod.outlook.com (2603:10a6:20b:1d3::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.33; Mon, 5 Jun
 2023 13:32:50 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::eb3c:9b42:21c9:494e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::eb3c:9b42:21c9:494e%7]) with mapi id 15.20.6455.030; Mon, 5 Jun 2023
 13:32:50 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "leimaohui@fujitsu.com" <leimaohui@fujitsu.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] Is aarch64_be under maintenance?
Thread-Topic: [OE-core] Is aarch64_be under maintenance?
Thread-Index: AdmUVJ7Lf/hFeIQFSMaBIHGjw7h/EgDXZOiA
Date: Mon, 5 Jun 2023 13:32:50 +0000
Message-ID: <5A43659C-3176-43F3-914F-6119098DA120@arm.com>
References: 
 <TYCPR01MB61918B757CBA93C6AD0BD80EA0499@TYCPR01MB6191.jpnprd01.prod.outlook.com>
In-Reply-To: 
 <TYCPR01MB61918B757CBA93C6AD0BD80EA0499@TYCPR01MB6191.jpnprd01.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3731.500.231)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|AM8PR08MB5633:EE_|DBAEUR03FT050:EE_|AS8PR08MB9766:EE_
X-MS-Office365-Filtering-Correlation-Id: f643a8d7-5a4c-4b74-7c6a-08db65c960bc
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 4wx5LkhcoA2u9zA1clTe6wNVKzYHLTbeKuD7+Jt+Zzpm0RR+acp4hZMlfGQ6rxWXG0wI0moLDZj8EpIZNzxC3tt2md1tVgV3+kKENpa4uP/0JMCmZqGSy9ufZK5zfw9lG7cuwi5vn5uJQSiWragPkXyT+rnDVtcgMpqY/h0ZRESnnQF4HKcyLGf10rl0nAJWlFIrsTqnwXD9ol/NoNOyou2TKtvoe3YbrIqd/meojrCpVTyV5ZlWy5QR2pFedjEhABW7U6TX+HNHvOZiaIIWqXd3iHc1cQVAp9g/p7oi+gt+kO/lCOknfRrk5zBI5VZcM9hhWtO0wm4azCC+0xidVyJxU+E1tL+xlKbUKN7s6iUof7AciwdrlSSCqCZ1Cgj639Ms9/RfZFC61SfZ+cI3R6V9OOJwhG/pDqdOkhIJyNPNLyquf1Q8JsVaM6BVV8GJaAZ7Rz3j/MnETXzQAw5MmHQDasrSG2CeGoxgGwfEPCQXcgY+4wul+qtH6nq6OIxSAHs6W0dP/hIS8qdQNv5S0llUSOs2raCc4UKyJ2GpGq5vpy8F7/OABLv4U4F2ZLShxrcE+vIQxJdnA0zL2ACYvmBlqnkSlYageWajSDu1F7P4B7mpvHLx5WwRlULq6c/e996SwYn6zYS9wUu/NZSc0g==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(376002)(396003)(366004)(136003)(39860400002)(451199021)(36756003)(4744005)(2906002)(38070700005)(71200400001)(33656002)(478600001)(86362001)(38100700002)(41300700001)(8936002)(8676002)(5660300002)(316002)(4326008)(6916009)(66556008)(122000001)(76116006)(91956017)(64756008)(66476007)(66946007)(66446008)(6506007)(6512007)(53546011)(2616005)(26005)(186003)(6486002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <B0A3FA2B8C6B0143B5EF1AA711363981@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB5633
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DBAEUR03FT050.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	80f4c286-5220-44e0-1b88-08db65c95b8c
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	MzUpFkArop2DNIgOU/d8JoXDQR4K6caOtrK2d8wYg4JouyfTal+N6yc60RBNzfrZ1VHKqzVhYKWQQ1wXdt+uwf9CQLydTNwFGO7mWUYvzEGm5H3M+3AHiQ67vCAUyU1WDED9ASaAJ/+IyL8RPcJnwD/L+Tq3moRp0w2NCU+isOkeFkbz9b+kdZqGV4TbdCB7+kdMYDRsGkGuG6JWBlqop3azx043B6lAi86Xt8sTkpiVGOGqj9VUeg8QM0F4QEOf9fcOCeoT5YTJ+vM5/DssqH1wWIPh9PUUmM1nHj+/3JNYFDcn5DpjQNaEr8PzLWpLUs/vC2guTS0G0bxtSJ6zAawzS33PPz7RkDZzXmdfXAXsGILQmEpZ2Xn9t7yNZcyLWQHCByHkWJwC257GxPO0lf/I+81urepayDO85j08ggO1KfQeyMMOFGtNDN951lmIs9tYB9GsYAlG0SBCVtmorC0IkVay3ofznrn6cY+JenF0Kooo2IflhT8JdvAYvAmC7zmtx0S4HF/TdcQSpdHNQfpSLOGv2BqbGmgek+9Y5EbKldfH04ZuYeAETpK7o08EtZlTu0xmoZXxlVFkSC8Qc9GUNzqEc5kwYnLS/jQ8hj9P2gTpnW4PxGLryxhfs4dQxr2F1MavBot3fMKvHotPtRKex0IsJFuUsZ74uAdZBuBOBXPoIesfrRFUBrqRtE3q9XYvHSBZAcjGXE9F7wfKqRQkAVuG72Ed2+F70U+CRuIIxizcpYpQQQ2aqiVolD4O
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(396003)(376002)(136003)(346002)(451199021)(36840700001)(46966006)(40470700004)(40460700003)(47076005)(336012)(4744005)(2906002)(2616005)(36756003)(86362001)(33656002)(82310400005)(81166007)(356005)(82740400003)(36860700001)(40480700001)(6486002)(316002)(41300700001)(5660300002)(6862004)(8676002)(8936002)(478600001)(70206006)(70586007)(4326008)(6506007)(53546011)(6512007)(26005)(186003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2023 13:32:58.8854
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f643a8d7-5a4c-4b74-7c6a-08db65c960bc
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DBAEUR03FT050.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB9766
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 05 Jun 2023 13:33:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182380

T24gMSBKdW4gMjAyMywgYXQgMDc6NTgsIGxlaW1hb2h1aSB2aWEgbGlzdHMub3BlbmVtYmVkZGVk
Lm9yZyA8bGVpbWFvaHVpPWZ1aml0c3UuY29tQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+IHdyb3Rl
Og0KPiBJdCBzZWVtcyB0aGF0IHFlbXUtYWFyY2g2NF9iZSBkb2Vzbid0IHdvcmsgd2VsbC4NCg0K
UmlnaHQsIHFlbXXigJlzIGFhcmNoNjQtYmUgaXNu4oCZdCByZWFsbHkgdGVzdGVkIGJlY2F1c2Ug
YmlnLWVuZGlhbiBhYXJjaDY0IGlzIGJhc2ljYWxseSBub24tZXhpc3RlbnQuDQoNCklmIHlvdSBf
cmVhbGx5XyB3YW50IGEgYmlnIGVuZGlhbiBhYXJjaDY0IHN5c3RlbSB0aGVuIGluc3RlYWQgb2Yg
Zml4aW5nIHFlbXUgeW91IGNhbiByZW1vdmUgdGhlIHFlbXUtdXNlcm1vZGUgTUFDSElORV9GRUFU
VVJFLCBhcyBpdOKAmXMgY2xlYXJseSBicm9rZW4uICANCg0KUm9zcw==

