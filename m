Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77F5AEB64D9
	for <webhook@archiver.kernel.org>; Fri,  7 Jul 2023 14:59:20 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.74])
 by mx.groups.io with SMTP id smtpd.web10.14395.1688741951169445974
 for <openembedded-core@lists.openembedded.org>;
 Fri, 07 Jul 2023 07:59:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=onzvpYMa;
 spf=pass (domain: arm.com, ip: 40.107.20.74, mailfrom: ross.burton@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MJROBibISFzVGE2ABZz6XC7btQZ+cbRtGu8byDPQ37A=;
 b=onzvpYMadBHfxzU9Ju9Fmwd5ldUFJo/w8jtnsMj8el7eAF6kRcVuZoaoEpMwJjZIdJ4N3UqmTOhKFaLsg8oRe6fKr45Wl+G3L8Rmac9Z438pAjQrUpfrv4jQUknSLY3ZBHR+3yV/bOZhaVuF+yxFU4ZsP2dfZn4qoXyle45LsCY=
Received: from AS9PR06CA0600.eurprd06.prod.outlook.com (2603:10a6:20b:486::35)
 by AS8PR08MB9670.eurprd08.prod.outlook.com (2603:10a6:20b:616::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.17; Fri, 7 Jul
 2023 14:59:04 +0000
Received: from AM7EUR03FT044.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:486:cafe::44) by AS9PR06CA0600.outlook.office365.com
 (2603:10a6:20b:486::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.25 via Frontend
 Transport; Fri, 7 Jul 2023 14:59:03 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT044.mail.protection.outlook.com (100.127.140.169) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6565.25 via Frontend Transport; Fri, 7 Jul 2023 14:59:03 +0000
Received: ("Tessian outbound 997ae1cc9f47:v145"); Fri, 07 Jul 2023 14:59:03 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: d8abaa6ec1a3e3d8
X-CR-MTA-TID: 64aa7808
Received: from 9f00cba8bb28.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id CB33F1D1-D8A4-4BBC-83BC-5773D53480A3.1;
	Fri, 07 Jul 2023 14:58:56 +0000
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 9f00cba8bb28.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Fri, 07 Jul 2023 14:58:56 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Mb2Hf6fMkhXnLOTWzJyW6H0rM4IMrJmhyC2LLM935SSegMXMAHLeTYhq4BYLnyGECmtyPdw6aLhl8Bdp9Cp0Pr7n7n+rNCQwowzQP67ghDwwSmdn/GjQjzdgZlRWxDs8gh6ugVPxc5kMahefkjBcj/zuCGLpqiVdDYPIGHa5Pd41PzPbz5ecrlA1n9p3MVyhHb2laQ35G73mVYiR+VZes5Sf2mtYr8E8fZ+2dQGz1WRdv9B6lxs9qIitkeU+w9Tmg5evTAfo06wgbW8h8fgEYJeJO4kLX/n36r4GU8Ey862Owc1KemykesNZRDgdTIqmzuomMm5qZaNJnvK1L7502Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MJROBibISFzVGE2ABZz6XC7btQZ+cbRtGu8byDPQ37A=;
 b=Au88XZCfR0BCLBCxavfK8FKkiaqQaQZ0iMj/z6n+YqjvGwQMP6K0hYNkwIcEsttq60u3WPN+FG9COYpB4F/SSuwRT+1lWsst0yJAv7RZZrUU5rso/2UT63LNYTLF+b/jfQ6Hm8Qry2Q2vrVtjH6P7zJaupoe2UM0sdqC4FiLE6aM/zTocSIrjvm8xKNC+WZsq633fmcSSX79T1g2WxpPnBfZ2Po9HF0IH0c22s4OH2iMsnN/ZSH28oRqEaQgFBTOrX3N/6Bo6IGg5iOEoTzGAckRP06h+azmtXi7Yp8aqMbGoQ6HRe9S4Qdz9sabg/GELZXsoxrKPwnUbHHqtmymUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MJROBibISFzVGE2ABZz6XC7btQZ+cbRtGu8byDPQ37A=;
 b=onzvpYMadBHfxzU9Ju9Fmwd5ldUFJo/w8jtnsMj8el7eAF6kRcVuZoaoEpMwJjZIdJ4N3UqmTOhKFaLsg8oRe6fKr45Wl+G3L8Rmac9Z438pAjQrUpfrv4jQUknSLY3ZBHR+3yV/bOZhaVuF+yxFU4ZsP2dfZn4qoXyle45LsCY=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by DB9PR08MB7512.eurprd08.prod.outlook.com (2603:10a6:10:303::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.17; Fri, 7 Jul
 2023 14:58:54 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::30b4:3110:b02d:7f21]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::30b4:3110:b02d:7f21%7]) with mapi id 15.20.6565.016; Fri, 7 Jul 2023
 14:58:54 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "alex.kanavin@gmail.com" <alex.kanavin@gmail.com>
CC: OE-core <openembedded-core@lists.openembedded.org>, Alexander Kanavin
	<alex@linutronix.de>
Subject: Re: [OE-core] [PATCH] python3: rework ptest handling
Thread-Topic: [OE-core] [PATCH] python3: rework ptest handling
Thread-Index: AQHZsNbExyW9UZMoOEaiE3raAAmA4K+uZV4A
Date: Fri, 7 Jul 2023 14:58:54 +0000
Message-ID: <386DC5D1-AEB1-4799-94F5-C999E1DD8C10@arm.com>
References: <20230707132649.3841870-1-alex@linutronix.de>
In-Reply-To: <20230707132649.3841870-1-alex@linutronix.de>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3731.600.7)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|DB9PR08MB7512:EE_|AM7EUR03FT044:EE_|AS8PR08MB9670:EE_
X-MS-Office365-Filtering-Correlation-Id: b55227d7-652c-43d6-5207-08db7efab464
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 m3tysco56fHj/UWuIlcDFR/KFMFwp1a/IVK2nOBy5Rsa89vHWoV+n23igT/bEAw3gDfsVFTCh2E8KrE6weNKL5gi/QiLjzi/iixRzDeMAzxHOSH/uZFJIFR9mJArJteTGA5TZC7gVtrzrVwxI+ynYFL7dYoSmPICZJpeGycm7VNfb8t2wu+c/F/Uq1XnyJyP1gnShmtGaqVHhSyGtgAkRYNXzU8qQC0tIZdZ6BLCoMI9d5pqTfpEE1o4Ars4lK7CQYvqp0ue3Fu5Nq/r6C7GKpbDVaAOlm3DVBCWuKfA58PYdXEHYzzEF8eQEfGYEbb9JxdQwraSMfJthPE+uC9djY8TjJKwP573L+Mkpb7nsnPp7tT0Vwj8EBGTSNUQ2pqNqEU0u8h3lTp1GAm6rBXcdkHSECgVdOoKxfoCRp6deZjcLZZUuZQC6p55CpJpkV6aIMBLL/xSPqZmD/7WbDSymy2zWO3qcg9CmGDpgMWULCeBdlfD4hWkXNKiDZJx92zCmo8UHrZwuB0mqJB3ezOxN9gXtKCz4gX0SIvBFDSKJE44V5xtal4bXpqd3p8XWZbJNWEx2GpEWOHZgVbVy9qDLYNXvXOQEA2BFHI5DJgWM9/vMmgiRVJqg3nX+2aglT66rQpHTNMhcYmYymu7NVmMuA==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(396003)(136003)(366004)(346002)(39860400002)(451199021)(8936002)(2906002)(76116006)(2616005)(8676002)(5660300002)(53546011)(26005)(6506007)(186003)(4744005)(41300700001)(122000001)(66946007)(66556008)(33656002)(71200400001)(6916009)(66446008)(91956017)(38070700005)(83380400001)(316002)(36756003)(4326008)(478600001)(38100700002)(6486002)(54906003)(6512007)(86362001)(66476007)(64756008)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <9AED3E5B17906E4695B22655D2DD469D@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB7512
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM7EUR03FT044.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	8148a744-b844-4ecc-9a12-08db7efaaeda
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	EvcNweYvnAtAWxa37ihdr5x3+/6nx4FUG8U6e+Efc3WudClWN0HrexTH07ZEOdfAbet3wX8wnSs8LQ7vjGxYY3dPyFcQm0GsWXKA/hBsWXi8g0qNQCo2VLY31PQRD3SktnXHWnznTg5iCQrWeO3L5nrjyIGSaN6DgdNEm3U+vIloryb7uQnrhDPgRhG/8XgoW0OfkuzC4jdbksMU7O1VbqBHMQk1Hp0pf8eUnoZmaOvDBE2hljqCZOM5gUcVqlLjBg2RJ59ABOJclul9yKBOdblsipj+K+CM+fDELSXN3NYILayiQiS/Vgypn9caZrtVJqMLYVul8874RmywGHh99t6ajlU4rnguXk9qeJY/WVgAssOSq98Q/mDlIDL4nh3u/I+3kCF5GViGhXuZcpA76VN3N/guEjt7HNAwmqb143sxGnl5HMA4ZBDaGZL3JUG3zacrzZjQu2pKBVtU3DC1F05YteyJ3UN69m7g/oimPCM+V6r/IUU9ovCIUOfRyg1WWFV8sA+B+IIuCZZbn8rSNGqMgEInfUxz1jvClNzL0UzdFmYuE0TsMs1/BpqgDoomN712DUya/ETa1U2srq5UKfYp1F9N13Ms3OQny2o5kmCSb35XODb96nAsI78w0x4QmFYL/MXWow00pHjbZLYCpsC6FXZ2rSaDRV7jaZ5a8rsJfZu1ZjoU7bH04/o9pxUqI+EQ6ofYQYWgASVoqWwwF+V86CX2cZX50tYT6XeqXDKebT4jFPYnr2Z8veno6mNo
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(136003)(376002)(346002)(39860400002)(396003)(451199021)(40470700004)(46966006)(36840700001)(6506007)(8676002)(8936002)(186003)(6862004)(26005)(2906002)(2616005)(70586007)(70206006)(40480700001)(336012)(5660300002)(53546011)(4744005)(40460700003)(41300700001)(36756003)(107886003)(356005)(36860700001)(6486002)(81166007)(83380400001)(82740400003)(4326008)(316002)(47076005)(33656002)(6512007)(478600001)(86362001)(54906003)(82310400005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2023 14:59:03.5829
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b55227d7-652c-43d6-5207-08db7efab464
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM7EUR03FT044.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB9670
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 07 Jul 2023 14:59:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184013

T24gNyBKdWwgMjAyMywgYXQgMTQ6MjYsIEFsZXhhbmRlciBLYW5hdmluIHZpYSBsaXN0cy5vcGVu
ZW1iZWRkZWQub3JnIDxhbGV4LmthbmF2aW49Z21haWwuY29tQGxpc3RzLm9wZW5lbWJlZGRlZC5v
cmc+IHdyb3RlOg0KPiANCj4gLSB3b3JzZSwgdGhlc2UgZmFpbHVyZXMgd2VyZSBub3QgcmVwb3J0
ZWQgZHVlIHRvIGEgY29tYmluYXRpb24NCj4gb2YgcmVncmVzc2VkIHNlZCBwcm9jZXNzaW5nIHRo
YXQgcmVsaWVzIG9uIGJyaXR0bGUsIHVuc3RhYmxlIHZlcmJvc2UNCj4gb3V0cHV0IG9mIHB5dGhv
bidzIHRlc3QgbW9kdWxlLCBhbmQgc2hlbGwgcGlwZWxpbmUgb2JzY3VyaW5nIGEgbm9uLXplcm8N
Cj4gZXhpdCBjb2RlIGZyb20gcHl0aG9uIGl0c2VsZi4gVGhpcyBpcyBjaGFuZ2VkIHRvIGEgZGly
ZWN0IGhhbmRsaW5nDQo+IG9mIHB5dGhvbidzIGV4aXQgY29kZSBpbnRvIGEgc2luZ2xlIFBBU1Mg
b3IgRkFJTCwgYW5kIGNoYW5naW5nIGZ1bGwgdmVyYm9zaXR5ICgtdikNCj4gaW50byB2ZXJib3Nl
IG91dHB1dCBvbmx5IGZvciBpdGVtcyB0aGF0IGRpZCBmYWlsICgtVykuDQoNCk15IG9ubHkgY29u
Y2VybiB3aXRoIHRoaXMgaXMgdGhhdCB3ZeKAmXJlIG1pc3NpbmcgdGhlIGJyZWFrZG93biBvZiB0
ZXN0cyBzbyByZXN1bHR0b29sIGNhbuKAmXQgcmVwb3J0IGluZGl2aWR1YWwgcmVncmVzc2lvbnMu
DQoNClJvc3M=

