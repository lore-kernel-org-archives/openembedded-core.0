Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C3BCC43217
	for <webhook@archiver.kernel.org>; Mon, 10 Oct 2022 10:35:44 +0000 (UTC)
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (EUR01-HE1-obe.outbound.protection.outlook.com [40.107.13.85])
 by mx.groups.io with SMTP id smtpd.web10.4891.1665398139496037336
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Oct 2022 03:35:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com
 header.s=selector2-armh-onmicrosoft-com header.b=uG67F2ZT;
 spf=pass (domain: arm.com, ip: 40.107.13.85, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=ndj053v6rh+Z9dVwisa+g1iMm83OQKa2tlV6fcAghUQz2qTTwvvgCTB4ofk9H1EE0WXUPklYFXWepASObqG6CctHdRWZkjFFI1wX/5VUggtcdZkRo8CJoRkFb+E4908zqpZWkX9AE8boYcaC/bWtokm5uCY/UQbQTfXM4dU1EX66UyO+raasGvosNF/VsyiW7ItlzYbW/5P9JXlemYPAVo25sqNpDffvljio4MzM+BFFUw03whflnIgyK9eFjwYCl6o2uw5T5W+PkXLDDhVgH4lfNm58+1cLlJSNkqFNkLfTQhpUrgW0v7Fc9dY1yDor+yDGKZxIHoUh+7pFROW/xA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jeinHWgGgWDgxKnVsroaezdSCTNLULaDa+36P0KNQBk=;
 b=OiirCRvqPVVSHx4/1JXzZmOEzOZI6+4m5tG/QUZR+EPfbzh1ZFprMVsEYFQ7cjkQSBc94bAc79aqwZzcA8uh7nqGISrTvUHa9VCRwqRFCvcVB0fn4SuVcJKIQo1USvBWeJGDqbYOgiGLouUq9Fey6U43/TGnK5jASvR7lvyggid0V9khZanUtCR+01fN9kUwU6YU9Ryu5xtcj9krX09Pr3Gh9wFX8tgfDUAdes/jzdTRI4UoAsIeE5VgqkXfEBWfrQC9kiCwBDfOBwdSTK7Qq84Y+dYYCa3hOJ/BJuvlvPgwVNwOoBHHrGM9aHsQyoU3GO5Q9rodPNCWCCSslt0gYQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jeinHWgGgWDgxKnVsroaezdSCTNLULaDa+36P0KNQBk=;
 b=uG67F2ZTheFnDi2VfPxy4N4hl62XAVRroyJq7G0JZka1OCVrEGmvZJlBSdpkfzh2d26ZAKO0CypAw6QPQl86rkGvSAZv+7AexJM3s77M5GoTXPyrSYXk43kpGV7lkN4x0TdKRGJjSILaQm9tjgJYtBk3oTtQSF7Oetf01AJY8n0=
Received: from DB9PR06CA0030.eurprd06.prod.outlook.com (2603:10a6:10:1db::35)
 by DB4PR08MB9311.eurprd08.prod.outlook.com (2603:10a6:10:3f5::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.23; Mon, 10 Oct
 2022 10:35:35 +0000
Received: from DBAEUR03FT018.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:1db:cafe::9e) by DB9PR06CA0030.outlook.office365.com
 (2603:10a6:10:1db::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5709.15 via Frontend
 Transport; Mon, 10 Oct 2022 10:35:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT018.mail.protection.outlook.com (100.127.142.74) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5709.10 via Frontend Transport; Mon, 10 Oct 2022 10:35:35 +0000
Received: ("Tessian outbound 99ee3885c6d5:v128");
 Mon, 10 Oct 2022 10:35:35 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: c02c8445ec0eb29c
X-CR-MTA-TID: 64aa7808
Received: from bdfd2457f995.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 0AA90F3F-4E12-4004-BC92-9CBACF64FE9C.1;
	Mon, 10 Oct 2022 10:35:28 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 bdfd2457f995.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Mon, 10 Oct 2022 10:35:28 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iYVMwGXxN0K0l8b9/l9pyQNq6XxGtFgGL0n6RzFBvDo+vWu1T8Mip8Ql1tNY8njHn6I8WisXvPu5aae78YDpDkDk3bcjOnNHLoLY9wAcOkEgZ4My+BjF9lsloDfy1Mofh0CO1HDbO07tBs7hEnUl/kyJFjUGY+QQJeE2Xh1l507oJ0eJ4LdwY4vLBJLGQBdT1rqh/jl77ACtKmLNIVPdocHcN0r+dUmMYybAxKXQFKteZ6rLezQ8a7NU9xKQMkXCjc8uIM31U+qp7vF08LBqUcetgBZETEZIwrDNIrcikvVpOdonyLsm250y97TOeQzDy53rKIMPnWedu6YdDpczrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jeinHWgGgWDgxKnVsroaezdSCTNLULaDa+36P0KNQBk=;
 b=Qrtu0N2sYUpv0c6hIdIVBmkqMoA6BnnYt0+mHMxI/htdzy7lrCli5smNn2J7t+9jc3RJIN9ibRJFFkaqDoDoag1cRlrw0fQ8FIeZrSX4lOM/iUqEKz8b5iZsl8kXC+A3KXaiLDVJ+R+D/Unfxr5jrUa8emUjdTFA0JXMPeA22Ua18cp2+w/YVuwij4E4S6hn1PDD4JBTFR+GvEX69D+EusxRrnKFcliwtLa02GOh8CVPrxWhw/MEr0rSLk3C9VPtna+9RE0DEnRdvpsNdE9RGNKpn4W16KnQlYWL2t4OgrPWQc4xI9bbpIptK5Hnp4X5n6PHvdTlemMA+Sf088t66w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jeinHWgGgWDgxKnVsroaezdSCTNLULaDa+36P0KNQBk=;
 b=uG67F2ZTheFnDi2VfPxy4N4hl62XAVRroyJq7G0JZka1OCVrEGmvZJlBSdpkfzh2d26ZAKO0CypAw6QPQl86rkGvSAZv+7AexJM3s77M5GoTXPyrSYXk43kpGV7lkN4x0TdKRGJjSILaQm9tjgJYtBk3oTtQSF7Oetf01AJY8n0=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by DU0PR08MB8445.eurprd08.prod.outlook.com (2603:10a6:10:407::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.19; Mon, 10 Oct
 2022 10:35:24 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7d2b:2570:9a99:a3d2]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7d2b:2570:9a99:a3d2%5]) with mapi id 15.20.5676.028; Mon, 10 Oct 2022
 10:35:24 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "otavio.salvador@ossystems.com.br" <otavio.salvador@ossystems.com.br>
CC: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>, Daiane Angolini
	<angolini@gmail.com>, Richard Purdie <richard.purdie@linuxfoundation.org>,
	"paul.eggleton@linux.microsoft.com" <paul.eggleton@linux.microsoft.com>
Subject: Re: [OE-core] How is 'devtool sdk-install' supposed to work?
Thread-Topic: [OE-core] How is 'devtool sdk-install' supposed to work?
Thread-Index: AQHY3Blq7d8/JlWQVkWdOPBB+pigtK4Hb86A
Date: Mon, 10 Oct 2022 10:35:23 +0000
Message-ID: <B4C207D2-A37B-4CA5-A418-DD1387741263@arm.com>
References: 
 <CAP9ODKqkPRSzkGFCb1Yyt9U1Ut+nOzyhPtb19HgrN4p5AXun1g@mail.gmail.com>
In-Reply-To: 
 <CAP9ODKqkPRSzkGFCb1Yyt9U1Ut+nOzyhPtb19HgrN4p5AXun1g@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3696.120.41.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|DU0PR08MB8445:EE_|DBAEUR03FT018:EE_|DB4PR08MB9311:EE_
X-MS-Office365-Filtering-Correlation-Id: 70ec6c2b-27c8-485d-e086-08daaaab2a39
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 rqhcHAZ3ZdCY8ANWXlily5D12/DcavfxgQTsU+0ck2V9ewrhLhpQiKk925Up3kHUPn/zd+qCHlOVWvzbRLVyBTiaO2HkKw1qjhvntWW6wGOb6lEIK/N8AbA3xBFPtgU7YJ+/jJ9xPRCjo1pjhrY0MaAQjZhc4DUHk6XlSfuJZfY0dnwvQMchnmuLQdGq1R2Qxq6lPQo7fipBbntlhrl/vE3VrlBDuV8R/1PsX5vT5AsuvyGnV+ff5lfXY5nLIyU+/uvPWySAxvAaeo7HNU5YUSteAumUGAKqOBPq8ueguQeis7CLelEQv2BKY5rMp2uoWz2Bqp4MIGeFh0zCiDWcTwQGW6jR1C2RzIt4ANdJK3u9NDKrx2tLgsOLIFby5fQdFyZxOCB+mTKMCbEqTiRinFsEkaG0tuShCgeolYEnzXfTkdrGLq2o5CWFmb6BWcyY6oHywa9n4hndc0aPa3d2hDyP9Ziif6gXUhTP6PfOlCl7GPv2Tazr442HL1p8qBK8NeL3AvsTw8zuxfzOi8V5k0Qau5JrTCDJPmQmdxYTksePwi+x3lDPK0W4g4QBPqVuck+3tTk+VahXdGNCSLVnQ/1ked1MxZJsiy2suP1M0z70XumroUFrvCmqsGFjYWgKYC8X5TXBfMK53tEuNnHIwQKziWKmqJ7xXakDZhxlDRAYg6qRMNkVT3aF0KkpVWucCbt0+rVLvm/t5gRUIjDdWJP1CwejmH8XBWpc8+js+9kNzre5waqROEe0jhJg+1W4DnNu5mXy+2VG5fydJz2l6ywnZ/mriRzs7PkXwU57rgQ=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(39860400002)(376002)(366004)(346002)(396003)(451199015)(26005)(2616005)(6512007)(64756008)(38100700002)(53546011)(316002)(6916009)(8676002)(122000001)(6486002)(71200400001)(33656002)(2906002)(38070700005)(54906003)(86362001)(91956017)(66446008)(36756003)(4326008)(76116006)(41300700001)(66946007)(66556008)(5660300002)(8936002)(83380400001)(6506007)(66476007)(478600001)(186003)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <22C490903AAE2A43B00C55A25A63C634@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB8445
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DBAEUR03FT018.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	55e6a2cc-fd3b-4c3c-86fa-08daaaab2396
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	rmnL0xwJ5/vk3ZpedjV5T/iSDP5p6vlpjFXS4D5d2Qnp4XlOA2Ag8frkMjDwSsppnk4KS090JnnMC1OWOlaWm8SpnYbGBy6r8APYDHQWjP8RsMeixLFH3aLQuM45EKfZ7Dt/uk9L+zb/Ws4ngIYWANHLGH5GjVQQVWHqbfxN0h37+VJlTstWNRrvlvrx8dKo8BdRFLXCU9BJjVZhIv99ZbwFuDJ/TSQlOALdV05KhZbAIvlsMo8w5l/MvEKN7CX/rVXF5xl4hMZiCf77cGuBKN7xZFUi5HVGZsHLGJZk+Sj/6JjBF5ZHA/Cy7zKJQqEmYvhTTin3uA9tT4Ukjlhac2S8/9Y/EZdEzKmKLJDGxYXurYtr5dw0eqcSNTkvY4nd5iuIcsy30UxMQGSDXWh/djOw1BZC+99YHmLy3BEckKkAkfqczKlfI2A5N+dkNP43ZcCPpzIP2+2ZXbrOTHb63zFey+StUTcG3Mp23FdE9HhgPBb/mAsXeliSgg1PipbhlzFj0tpC+9NbQcys2z8JBJ1zCsYc2kwP7Rkzg4wjTIOhKpGjDQxHSDaffhS/8xx2314abi6v7HXSlHhIAMf0ciVcF0Hp0OX9IxK8SFZSuNoZi3fviPVMvxYMWSLD407KM7gHXowoOxcyiLjhtwK6cJk1DUbhuxO+CkA5KmuUl8MNy8JeJOLIDFwE+xgbC20TTQzGJIlUtG5zyAQUUcJigtFEqoHvT6MKFaQ2/qofc38=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(376002)(136003)(39850400004)(346002)(396003)(451199015)(36840700001)(46966006)(47076005)(336012)(83380400001)(2906002)(6506007)(4326008)(86362001)(41300700001)(70586007)(36756003)(107886003)(8936002)(70206006)(186003)(82310400005)(5660300002)(40480700001)(356005)(81166007)(33656002)(26005)(2616005)(36860700001)(54906003)(478600001)(82740400003)(6862004)(8676002)(6486002)(316002)(6512007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Oct 2022 10:35:35.0912
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 70ec6c2b-27c8-485d-e086-08daaaab2a39
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DBAEUR03FT018.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4PR08MB9311
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 10 Oct 2022 10:35:44 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171572

Q29weWluZyBpbiBQYXVsIGFzIGhlIHdhcyBpbnZvbHZlZCBpbiB0aGlzIGNvZGUgc28gbWlnaHQg
aGF2ZSBzb21lIHRob3VnaHRz4oCmDQoNCk9uIDkgT2N0IDIwMjIsIGF0IDIwOjU3LCBPdGF2aW8g
U2FsdmFkb3IgdmlhIGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcgPG90YXZpby5zYWx2YWRvcj1vc3N5
c3RlbXMuY29tLmJyQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+IHdyb3RlOg0KPiANCj4gSGVsbG8g
YWxsLA0KPiANCj4gRGFpYW5lIGFuZCBJIGFyZSB3b3JraW5nIG9uIHRoZSAzcmQgZWRpdGlvbiBv
ZiBvdXIgWW9jdG8gUHJvamVjdCBib29rIGFuZCBub3cgd29ya2luZyBvbiB0aGUgY2hhcHRlciB3
aGVyZSB3ZSdkIGxpa2UgdG8gY292ZXIgdGhlIGVTREsgdXNlIGJldHRlci4gV2UgYXJlIGxpa2Vs
eSBtaXNzaW5nIHNvbWV0aGluZyBvYnZpb3VzLCBidXQgaXQgaXMgYmV0dGVyIHRvIGFzayBpZiB3
ZSBjYW4ndCBmaWd1cmUgaXQgb3V0Lg0KPiANCj4gSG93IGlzICdkZXZ0b29sIHNkay1pbnN0YWxs
JyBzdXBwb3NlZCB0byB3b3JrPw0KPiANCj4gV2UgdXNlZCB0aGUgJ2RldnRvb2wgc2RrLWluc3Rh
bGwgLXMgbGlicG5nJyBjb21tYW5kLCBhbmQgdGhlIGJ1aWxkIHN1Y2NlZWRlZCwgYnV0IHRoZSBw
YWNrYWdlIGRpZG4ndCBpbnN0YWxsLiBUaGUgZXJyb3IgaXM6DQo+IA0KPiBFUlJPUjogRmFpbGVk
IHRvIGluc3RhbGwgbGlicG5nIC0gdW5hdmFpbGFibGUNCg0KWWVhaCwgSSBqdXN0IGhpdCB0aGF0
IHRvby4NCg0KSSB3b25kZXIgaWYgdGhlIGhhc2ggZXF1aXYgYnJva2Ugc29tZXRoaW5n4oCmDQoN
CkludGVyZXN0aW5nbHksIHRoZSBlU0RLIHRlc3RzIHVzZSB0aGF0LCBzbyBlaXRoZXIgdGhleeKA
mXJlIGRvaW5nIHNvbWV0aGluZyBzcGVjaWFsLCBvciB0aGV54oCZcmUgbm90IGFjdHVhbGx5IHJ1
bm5pbmcuICBJdCBtYXkgYmUgdGhlIGxhdHRlci4NCg0KSXQgbG9va3MgbGlrZSBzb21lIG9mIHRo
ZSBzc3RhdGUgaXMgbWlzc2luZyBpbiB0aGUgZVNESy4gIEZvciBleGFtcGxlLCBjb25mL2xvY2tl
ZC1zaWdzLmluYyBzYXlzOg0KDQogICAgbGlieG1sMjpkb19wYWNrYWdlX3dyaXRlX3JwbTo3ODdm
ZThhYWJkMDAxMDEyMmM4YzIwNzBhYTBjNmUzZmFjMzk4OTU5NjNlMTk2MDBhNDgyMjZhYjNlMmIx
MzQ2DQoNCkFuZCBpbmRlZWQsIHRoaXMgc3N0YXRlIGV4aXN0czoNCg0Kc3N0YXRlLWNhY2hlLzc4
LzdmL3NzdGF0ZTpsaWJ4bWwyOmNvcnRleGE1Ny1wb2t5LWxpbnV4OjIuOS4xNDpyMDpjb3J0ZXhh
NTc6MTA6Nzg3ZmU4YWFiZDAwMTAxMjJjOGMyMDcwYWEwYzZlM2ZhYzM5ODk1OTYzZTE5NjAwYTQ4
MjI2YWIzZTJiMTM0Nl9wYWNrYWdlX3dyaXRlX3JwbS50YXIuenN0DQoNCkhvd2V2ZXIsIHRoZSBw
b3B1bGF0ZS1zeXNyb290IHNzdGF0ZToNCg0KICAgIGxpYnhtbDI6ZG9fcG9wdWxhdGVfc3lzcm9v
dDphMzdlYzcyNjg1ZDg0NzQwMmE4YTE4Yjc4MWY0NTNhZDMwZjZhZmY3Mjg5MmU0NTdlMzY0NTYx
NjM3MTRiYjgxDQoNCkRvZXMgbm90IGV4aXN0IGF0IGFsbC4NCg0KU28gaXQgbG9va3MgbGlrZSB0
aGUgZVNESyBnZW5lcmF0aW9uIGlzIGZhaWxpbmcuIE1heWJlIHRoaXMgaXMgYSBoYXNoIGVxdWl2
IGlzc3VlIGFuZCB0aGUgZVNESyBjb3B5IG9mIHRoZSBzc3RhdGUgaXMgdXNpbmcgdGhlIHdyb25n
IGhhc2hlcz8NCg0KUm9zcw==

