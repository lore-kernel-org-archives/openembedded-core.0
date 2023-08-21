Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B79C9EE49AA
	for <webhook@archiver.kernel.org>; Mon, 21 Aug 2023 13:35:04 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (EUR04-HE1-obe.outbound.protection.outlook.com [40.107.7.44])
 by mx.groups.io with SMTP id smtpd.web10.11129.1692624899800747019
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Aug 2023 06:35:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=cJvQaW3r;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=cJvQaW3r;
 spf=pass (domain: arm.com, ip: 40.107.7.44, mailfrom: ross.burton@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IJdmk0AWM5fIx7m7rpscO9tvxNHtMXqGfCgYQRxRnhw=;
 b=cJvQaW3r5IbejcFCusDAsermea5yiF7R0oT36FjZl7ZBI+SMbbpDjvhIGFR66Fu9I0xT5mWIYSd5ufMoi7+zdMxIWXLbdLf3M+jiP7FOtXAOMVLLP1O2wzZL9KpAwWYQZMgQsH5MCcJK6M4vKdjntZmvyjhspaqPrEdbHtMNXyo=
Received: from AM6PR10CA0107.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:209:8c::48)
 by AS1PR08MB7658.eurprd08.prod.outlook.com (2603:10a6:20b:479::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.24; Mon, 21 Aug
 2023 13:34:55 +0000
Received: from AM7EUR03FT040.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:8c:cafe::6d) by AM6PR10CA0107.outlook.office365.com
 (2603:10a6:209:8c::48) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.20 via Frontend
 Transport; Mon, 21 Aug 2023 13:34:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT040.mail.protection.outlook.com (100.127.140.128) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6723.15 via Frontend Transport; Mon, 21 Aug 2023 13:34:55 +0000
Received: ("Tessian outbound 0b7d6027328f:v175"); Mon, 21 Aug 2023 13:34:55 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: e9e3826457a8ce90
X-CR-MTA-TID: 64aa7808
Received: from 81e44653bcbc.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 302C4EB8-2659-42A1-955E-26C3DBB8A82D.1;
	Mon, 21 Aug 2023 13:34:48 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 81e44653bcbc.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Mon, 21 Aug 2023 13:34:48 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L+W9sZo09goUob8Wjl1WadH9itHPPFt4LTPoHW0arrYaMO9QPHhzJa77YBBQ19b5r93wrLOR8b+Ws4gVXjs65R2yeyPdymEJgRc+43aQcgcS43XM5iuQ5BcDL0PRPGF9AsZNkqcG3taJkBtNb+Xf0fTn8vjcQZzPcYntZFMEHxCsWjD1sUAFO4Ru9MEatUsqEbZPYJNQLHoSYx6eKPeDDSUfeyIFkl9m8ww29ExRW/L5AiFWih3egsERsf31SxjFOLbwtS7hhf0aGVXvWLrNacdptN8KEGne1eNsKlTDfBGhtal+ZZRptz5A54mi9hOmOfPQf5jmHp0C7nWlH4cMHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IJdmk0AWM5fIx7m7rpscO9tvxNHtMXqGfCgYQRxRnhw=;
 b=LlpBfQ0NHc1AAbwHZfI9W8LJj1AwcZIJtJFYxnNFJDSsnVraQGBMK+3k19po4X4+pClxEBeOFTEpzAV1Ok6Ppc+ljbIpiKoaGdryJ/KVYCl3hDaUOBr2uMSFcviSgjBvhVgdFad9v+eu2IDxqWByGpC4jT/nVEhf6d/aLRbx3JQzSEHGR4Q1bdb26I6p7d7AgKbIRYiRtcrMdQ5nPA2zQ/elJ225Hgop6Kn4DP6d8iZFHSl1rN4WOqaX9mgC0EPkMVlX34oEC1q1WyY/4TmlFity0plldbeFQu+2DoMOdJ9SBkq7kGKdS9Dr3crFDVB9RFZelmVzg88SKEAf/tfMng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IJdmk0AWM5fIx7m7rpscO9tvxNHtMXqGfCgYQRxRnhw=;
 b=cJvQaW3r5IbejcFCusDAsermea5yiF7R0oT36FjZl7ZBI+SMbbpDjvhIGFR66Fu9I0xT5mWIYSd5ufMoi7+zdMxIWXLbdLf3M+jiP7FOtXAOMVLLP1O2wzZL9KpAwWYQZMgQsH5MCcJK6M4vKdjntZmvyjhspaqPrEdbHtMNXyo=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by GV1PR08MB7708.eurprd08.prod.outlook.com (2603:10a6:150:53::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.20; Mon, 21 Aug
 2023 13:34:42 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::4b8a:7518:c642:5727]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::4b8a:7518:c642:5727%7]) with mapi id 15.20.6699.020; Mon, 21 Aug 2023
 13:34:42 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "raj.khem@gmail.com" <raj.khem@gmail.com>
CC: Steve Sakoman <steve@sakoman.com>, OE-core
	<openembedded-core@lists.openembedded.org>,
	"yocto-security@lists.yoctoproject.org"
	<yocto-security@lists.yoctoproject.org>
Subject: Re: [OE-core] OE-core CVE metrics for master on Sun 20 Aug 2023
 01:00:01 AM HST
Thread-Topic: [OE-core] OE-core CVE metrics for master on Sun 20 Aug 2023
 01:00:01 AM HST
Thread-Index: AQHZ04wfGyaTylFVokeh7Hhsphdhba/0wVWA
Date: Mon, 21 Aug 2023 13:34:42 +0000
Message-ID: <C6A59BC1-9C77-44CE-B397-561BD9B8B900@arm.com>
References: <20230820111950.15E381070A5@builder.sakoman.com>
 <CAMKF1srJgDx0w8NvQx+0WE9OPVdY+mDOz_q1En4nsXH=CPaBbw@mail.gmail.com>
In-Reply-To: 
 <CAMKF1srJgDx0w8NvQx+0WE9OPVdY+mDOz_q1En4nsXH=CPaBbw@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3731.700.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|GV1PR08MB7708:EE_|AM7EUR03FT040:EE_|AS1PR08MB7658:EE_
X-MS-Office365-Filtering-Correlation-Id: 10db5168-368f-460e-a18b-08dba24b67e3
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 oPK13EiHNrkMpQdvJCXWfe1zJPuRQaFZu3Oobc/JzhPa3eUFEwYw7skv6p3U3AobWTFazc2z6rC6KI8sbd5l/etCZZdBba0/VU3gg0d98AeBdvjzyDkdw0dQeMIZxSOw+a3oMGJpTIKToplZ6NdH4chl5pUuQGgTw3N98yikIDOrspIoYzBl1DFMKTvMdYevlKfjF1kqTJGA1IVuyD0UeqK1hky279eCrj+0i7NAPNu9mT4JjWHaMUV2V7D2y7BrupulO924aPLJh5V3uzdXfFOGgLjVNAQ1VTw3TjWzjEbapBfsRA76bkDyOcu0CVEVfUUrrFfqOIgtebwRo8+dCTOx98V/JIGiaeUgJGLh/xNi/7WXlTqWJGNd5oR8QrmWovufcFbveWWwMmqigHTyazdmKKE3ydjt0dHEAfPUL5QofWNSQWjVq3FRUentAiRohzzSxG+NlY3f3RlhMZSH/DbNDhG9JVA/zYEV/WJjLuBdxBPc0M47aoijVK+tdmz9OEXCAT7C71QvW6Vi94didOqWw6QCktweCSy7QgrWGHTFasgfiaRsxkg42x1ltSFFcEM4KnNFzoRzsjl/+RgIks/L8jKx1SmAnl3euLhF+jmEUY3JIwhIM+yaKYQ5qauc
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(346002)(39860400002)(376002)(396003)(136003)(451199024)(186009)(1800799009)(122000001)(316002)(91956017)(6506007)(26005)(71200400001)(6486002)(53546011)(6512007)(2616005)(4326008)(5660300002)(8936002)(8676002)(2906002)(4744005)(966005)(41300700001)(64756008)(76116006)(66556008)(66946007)(66476007)(66446008)(54906003)(478600001)(6916009)(38070700005)(38100700002)(36756003)(33656002)(86362001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <FDA80B41EF038546A537DF99EEB1F563@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB7708
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM7EUR03FT040.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	9d1e1c12-f7a4-41f1-9a5c-08dba24b606f
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	8TvtW/frsaK4SwyMPEXD94PB7TjHx1PdcFC0+/h/YzCIopJZlfelG3JlgrhvzGZYDfe5CstGV52cnW0rFqCv85o6rT14gvLKeKyauViDoK0U5AB8C5Ta2UWX9BOsEPkvWNMibPb4zlgccXdbkvWynWyEqfQybjAnklZSU66GOXfYpB5i89+C0y+gHU1R9Mdt3pIWutmzLJfHNzlqLBg5gulKXChfDIuF67Z1ejRrtckn+3/c+SziRpUso4c6e1ov+Kl3yv/n76o3Vi+xZAKacfDHbeh5SlQ3d0T9CIv5KGm3bqPGr7r9baEO6ku+6fAyojINAw6pDrI+V34lJDei4QdiKiUW++1zJqWJj/Qi/3WbkE2bYzJ0etF6UDC1QBUQpqRqkZIbWYbkUUGxiBv8GWdGuf+nNem/tzpBSMc++MyqaDCZtr61SGnD+BAYfYDVHo0f2j1Nj4Q9IVI0nkoNMtNVBNCDr63kCEooIcG9S2GJrQ0POHx15m0HJsI/bkqo2XFEKFpkN/MhdkliWW1x9bRe1XlPxtddyyRvxNonTYaCu7eBozYsD1o4eoQH2NNdzFevl14S1pEVG/mzQqs6h2BgujHmbVDR9GbFDrHQS9ZbtdyTIbcTn+aDJ1ZPBrZjGJDwNhSjhCAXRDsNjATEDwV65GNCqqzhFQTEFmIGPJxjNAb0Z225pS9aTnZR5JFN4LkCiaSIMrvs+AEYDSCqyjRw/HOdMLUSwByxSZWmKsw=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(346002)(39850400004)(376002)(136003)(396003)(82310400011)(451199024)(186009)(1800799009)(36840700001)(40470700004)(46966006)(2906002)(4744005)(53546011)(40480700001)(6506007)(6486002)(5660300002)(336012)(33656002)(26005)(86362001)(36860700001)(47076005)(8676002)(2616005)(8936002)(107886003)(6862004)(4326008)(70206006)(316002)(6512007)(54906003)(70586007)(966005)(478600001)(82740400003)(356005)(81166007)(36756003)(41300700001)(40460700003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2023 13:34:55.1650
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 10db5168-368f-460e-a18b-08dba24b67e3
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM7EUR03FT040.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR08MB7658
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 21 Aug 2023 13:35:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186443

T24gMjAgQXVnIDIwMjMsIGF0IDE4OjMwLCBLaGVtIFJhaiB2aWEgbGlzdHMub3BlbmVtYmVkZGVk
Lm9yZyA8cmFqLmtoZW09Z21haWwuY29tQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+IHdyb3RlOg0K
PiANCj4+IENWRS0yMDIzLTA2ODcgKENWU1MzOiA5LjggQ1JJVElDQUwpOiBnbGliYyBodHRwczov
L3dlYi5udmQubmlzdC5nb3Yvdmlldy92dWxuL2RldGFpbD92dWxuSWQ9Q1ZFLTIwMjMtMDY4NyAq
DQo+IA0KPiBXZSBhcmUgYXQgMi4zOCByZWxlYXNlIG9uIG1hc3RlciBhbmQgdGhpcyByZWxlYXNl
IGNvbnRhaW5zDQo+IGh0dHBzOi8vc291cmNld2FyZS5vcmcvZ2l0Lz9wPWdsaWJjLmdpdDthPWNv
bW1pdDtoPTgwMWFmOWZhZmQ0Njg5MzM3ZWJmMjcyNjBhYTExNTMzNWEwY2IyYmMNCj4gd2hpY2gg
Zml4ZXMgdGhpcyBwcm9ibGVtLiBTbyBJIHdvbmRlciB3aHkgaXQgYXBwZWFycyBpbiB0aGUgc2Nh
biBoZXJlID8NCg0KQmVjYXVzZSB0aGUgQ1ZFIGV4cGxpY2l0bHkgc2F5cyB0aGF0IDIuMzggaXMg
YnJva2VuLiAgSeKAmXZlIG1haWxlZCBOSVNUIHRvIHRlbGwgdGhlbSB0aGF0IGl04oCZcyBmaXhl
ZCBpbiAyLjM4IG9ud2FyZHMuDQoNClJvc3M=

