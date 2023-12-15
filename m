Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF608C35274
	for <webhook@archiver.kernel.org>; Fri, 15 Dec 2023 12:00:18 +0000 (UTC)
Received: from EUR03-AM7-obe.outbound.protection.outlook.com (EUR03-AM7-obe.outbound.protection.outlook.com [40.107.105.55])
 by mx.groups.io with SMTP id smtpd.web10.60711.1702641612853091691
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Dec 2023 04:00:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=Cni1nFIf;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=Cni1nFIf;
 spf=pass (domain: arm.com, ip: 40.107.105.55, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=dO8Cr+rzC579unehu6Da3tQexNhMPLI7komEghLQ5h+fFmbg8hTF6fsUoQp+1is786bu71lv0dt21+e5cSA99myBv3XIaBinEsLazibMwkKiaLjouMWLvHQ7nufU70oaE3BYk68tanIvNqjIIgSPDAnPlFfR/0eE55vcHPOpQS8UUJdh4eQKvtWSjNndGQzrt6Ec5DvB86642/UBsQ9cOBvnxLIbGGzQLs06sl3zX5UtYLBerJtlCV/7acoE3pf57U2IPOe1QCQ428oTLd1b5zwg4USoKKOi59Eq50ksC4sSiR0pu5r8/iYoETNxBvlojVkAIto7abis6XQ+So9hfA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=urW0f2tydnzg+OXnfa5jgsyX7d73Cgmcqt81iS9TelM=;
 b=WtvzC8gtjrg0REIsvzHnnWVyvo4OcXiYI6tu+u1voSJofVzL/I9fQSn1bICUOz3OOH4qStXB9LtsnZMjFZUVBkApXJ0ZPplwMND0qtoHYMLTTjxl9W99nHdsSavRSYkDBjuGokIJOc9L/PqNMg54ixWtYm894trj4Usf6+wOcNFx5n9U/v8yTTyCbJizepYYoDfSF4L6kRXuV/O69z+iMHdO119H6NgZQCa2lhBVSz+2ckvpOF06ECG+SrPeJUL0oUhWrrnT8gbwF8eCZc+rV3UOAD0FabvTuDVUejf2DUgNaADjAHdpTiNhEXP3pp5OfSlLFY3By4kGj1adOWeH/Q==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=urW0f2tydnzg+OXnfa5jgsyX7d73Cgmcqt81iS9TelM=;
 b=Cni1nFIfaJm3L63Zfzqe6XgxZsJFGKPha2pkL/svyFr2bLlN71CF5RZ0AXtRwW41V/46kjnqC4yR8gNRepSdLJWU/0HFWay60LM4W+/IAoEUeF1vtw+KDFW9NNAEEbAc51D5CEZFoo5TPSRlfu6727S8lCM02nZnA7cfb9Hyd9E=
Received: from DUZPR01CA0118.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4bc::29) by DB9PR08MB6650.eurprd08.prod.outlook.com
 (2603:10a6:10:26d::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.31; Fri, 15 Dec
 2023 12:00:01 +0000
Received: from DU6PEPF0000A7E3.eurprd02.prod.outlook.com
 (2603:10a6:10:4bc:cafe::1d) by DUZPR01CA0118.outlook.office365.com
 (2603:10a6:10:4bc::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.31 via Frontend
 Transport; Fri, 15 Dec 2023 12:00:01 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DU6PEPF0000A7E3.mail.protection.outlook.com (10.167.8.41) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7091.26 via Frontend Transport; Fri, 15 Dec 2023 12:00:00 +0000
Received: ("Tessian outbound 7c4ecdadb9e7:v228"); Fri, 15 Dec 2023 12:00:00 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 21708fd18acb67e8
X-CR-MTA-TID: 64aa7808
Received: from 7992a20d0baa.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 496D8966-540A-47C3-9ADA-FD603869C4EB.1;
	Fri, 15 Dec 2023 11:59:53 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 7992a20d0baa.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Fri, 15 Dec 2023 11:59:53 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EekQn0I1+tivnNTA5rg/64zDynPnTXt1/q6WyTyXbRMZIZpLPb8+E8IZi+FmiOMedbfTg0YpTfMXbN4Vx+eK2QG2cgfTp1qTTqB3y6Cne3MtlqLDKgfPEOSW8HH3qCqM/uVUt2Q2RhBNUpDFZvzLuVltyhlAdH0TiIbRk7fjMGCvGt0oAF3Kr2Q2165zxIW0iLHzsabT3UcbGNzPQV/pk2IzF+tTkopVaV3M04ysBAKWwOCJZGXuIQ++dO1/lNBxu5L1++zloPBu+hN2Pz5C3HZhNuxafH/yM4Aq5nQ9F1+i0xFgpuXi/yT0C8MhZyWxKh+L/gRqdV2LDPlwWQOQFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=urW0f2tydnzg+OXnfa5jgsyX7d73Cgmcqt81iS9TelM=;
 b=nDCoyHWHPGELsnl1Y6zFK1uAjTftDbL8qhq8rmBviFjtHptYArU7IMqgpv0sSdbFarRXVhxDyEgKLwxdS86OdwGV5nNvgkt1GocPJY3/9nSdh0BYW7SotA/tHRoWDKCgIpXpuFxn6gcpAzA1iM6SoE9uyCRsUvXtAPULBhpkx7DeUdpxOIFI7NGeNuBUDlPQgsj34AouhB5Xupy0gV2Di23uVrnc67z1a5ifiQVrsJ4tO8k3QS6oUUMZrCjqixqTR+trevE/5sEsOHUbi24Z/BclQDU7+9kQc2yFo8qRBt4VJTSRWSfqxuQUGDY9aRmsAOm+hmsjSHfDCZkvldoFqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=urW0f2tydnzg+OXnfa5jgsyX7d73Cgmcqt81iS9TelM=;
 b=Cni1nFIfaJm3L63Zfzqe6XgxZsJFGKPha2pkL/svyFr2bLlN71CF5RZ0AXtRwW41V/46kjnqC4yR8gNRepSdLJWU/0HFWay60LM4W+/IAoEUeF1vtw+KDFW9NNAEEbAc51D5CEZFoo5TPSRlfu6727S8lCM02nZnA7cfb9Hyd9E=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by DB9PR08MB7581.eurprd08.prod.outlook.com (2603:10a6:10:305::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.28; Fri, 15 Dec
 2023 11:59:50 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::ef47:2c42:1ef6:fe5c]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::ef47:2c42:1ef6:fe5c%6]) with mapi id 15.20.7091.028; Fri, 15 Dec 2023
 11:59:50 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Yoann Congal <yoann.congal@smile.fr>
CC: Khem Raj <raj.khem@gmail.com>, Alexandre Belloni
	<alexandre.belloni@bootlin.com>, Alexander Kanavin <alex.kanavin@gmail.com>,
	OE Core mailing list <openembedded-core@lists.openembedded.org>, Tim Orling
	<ticotimo@gmail.com>, Martin Jansa <martin.jansa@gmail.com>, Richard Purdie
	<richard.purdie@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v3] strace: Disable bluetooth support by default
Thread-Topic: [OE-core] [PATCH v3] strace: Disable bluetooth support by
 default
Thread-Index: 
 AQHaLaJrxWBVVeanE0G/jTU5fjiiJLCof1uAgACi6oCAAAteAIAAAKUAgAD/MoCAABOeAA==
Date: Fri, 15 Dec 2023 11:59:50 +0000
Message-ID: <4F557F6F-8492-4027-AD2C-97773A476624@arm.com>
References: <20231213085657.2552223-1-yoann.congal@smile.fr>
 <CANNYZj9mWiEZRf_snYJ0eRcirn746GbkZSekLV3-XVcHjaR6bw@mail.gmail.com>
 <CAMKF1spsMdx55xzBT9VEb51my-fE4GeLCq5m3do-5-8AKr-BqQ@mail.gmail.com>
 <20231214193346baddfca0@mail.local>
 <CAMKF1soTi3X-eZf6+pd+hS3FpTvxSO7kR4ievYgM_F2N_8AVFA@mail.gmail.com>
 <18825c98-a4bf-4918-833d-a797a9e5ac74@smile.fr>
In-Reply-To: <18825c98-a4bf-4918-833d-a797a9e5ac74@smile.fr>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3774.200.91.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|DB9PR08MB7581:EE_|DU6PEPF0000A7E3:EE_|DB9PR08MB6650:EE_
X-MS-Office365-Filtering-Correlation-Id: a423da61-3c25-4550-03d7-08dbfd655da4
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 F1Pjx4alN3HaHpr0nL7jqtauieLL+V26K2JuCChRIOPc78wNhQdb8gPDQpGbJ4Waj0BSB9YutffNDPkVIGjTgBGQzqyQWA5rGXS5e/vM7d7r+HcOMoDacjnw2hRHRrxZ1AlF9/bjSMHdryWm+fdwN/g5u50Wq1NUUehtInsc1xFnOKCzk2Or47jAMMRuZYALr8XIT/KOWwmNruJ7lSfQjTlkWt6Ayfk6/CNl0MkzO34V2D7RCcO3KnHTDasqbPYR974Y1XORJlYfUvbNXcWXck25RreLq2idyk7yilh7oVkuLX3AxzPI07MzW5uKYTIpY9yvhrNtKNPR3Wr7q0inHlIxCk3Lj4fuu+syVjzy9SXc5db5Em1tMcfvLqhuVttuBjGQVuSsudisG7Pfx7FiO2UKIDEpT5ckJS52B54ptaTH0NBHOsq7WRiXcgYOx0Be8SCsxY187OpiFyynTUf07YTxXVOiK9mBK9CBd8m9y0bLSnM9RG5TLMjkJdMMxfwzguaCpwoUWgYXXhIKoHu3UOZaD+F8v7ONN7p9XLDTpdZ3ZUmasb6y4dv2wAHJ7ZlJwXUkZsnZk6VWT4sZCUbiLiWsmhEVkDAsr1Np+3ASee1aWjERgvQZaKFrvqooLQ9/5Qvu9j2iU9+F/OHsuxg+Ag==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(366004)(376002)(39860400002)(136003)(346002)(230922051799003)(186009)(1800799012)(64100799003)(451199024)(122000001)(38100700002)(26005)(83380400001)(2616005)(71200400001)(33656002)(36756003)(86362001)(38070700009)(53546011)(6486002)(6512007)(478600001)(6506007)(76116006)(66946007)(54906003)(316002)(6916009)(66556008)(66446008)(66476007)(64756008)(91956017)(4326008)(8676002)(8936002)(4744005)(2906002)(5660300002)(41300700001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <E98BD574DDF05742943527436E71575B@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB7581
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DU6PEPF0000A7E3.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	4050fdfb-19de-4989-f2fe-08dbfd65579f
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	nTYyvQ4J9THUvrOeCwFqmloB6Nezhm7NHW+ZYNhqwOcn42wDkHki7sTK6l4B+MVuVLaZnppcokyL4UhH5R9d18sxOQ+frtwcfne6/TebHqb9qZIuqJ+4JlJifccXqqTcdqHMno+bAWjXEPUjmlo5X30kORalTUUcrkL+aTUmbSlyz+S7jigr6D29qEdyQ8vodYuMob+rwA1LJS7Qm+DRNrwzB3Pfsg5J1PW1IFOsd+rg4GD3CoU8IN+5lP6qdzNBc+UYj4iGm4TqMbDBMjin2ODiNkVGzuI+SF0Nd2zO8v9YXeEIJrmB3ScOVTmuFN6L6JihO5Ddv3LVdcDJIQe0wMke0B0Sc9gO1iLX4KDTh6EOXU+KEwoAY733uV6jKwiYFX+zO7aZKn/QwOff12Ssx2+e8fch2P3kPt3tIfE/H+btCkpDwG2n1qsBDS0vW/Fgc1LtYL02fv2gN/FiBBWBkRFnLjgOLB7BKjIoMy0TEINXPMbanIyOYKbOzCtaCgZebmO5X1EpKzmZNjvHzd/hZzZIEcChX8h3DE3Hgs03MlPNFjXI2rf8LDaFTwjhsV0xPXKqUE3N5Ieu7/nyJ+dstlbQzntU+O1FxNWnudb2M7aO+Ijve7UpddkcsNtL6CdXPOreoS3eyJWvH17ZNEB2Li7xM/w4aI+lCg8YlKq3B4GTNP1Z7IhXIWiHVZMUhyaWJ6hSZtFEigT1d9a6YFFjaQvrgzBoj83CNgNUS1b8aIjPkAL+Y5JJ4zcZHYB7g1EJ
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(39860400002)(396003)(376002)(346002)(136003)(230922051799003)(1800799012)(186009)(64100799003)(82310400011)(451199024)(46966006)(40470700004)(36840700001)(40480700001)(40460700003)(36860700001)(47076005)(81166007)(356005)(82740400003)(2906002)(4744005)(33656002)(36756003)(5660300002)(83380400001)(53546011)(336012)(6506007)(107886003)(26005)(2616005)(6512007)(478600001)(54906003)(70206006)(6486002)(70586007)(41300700001)(86362001)(4326008)(6862004)(8676002)(8936002)(316002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Dec 2023 12:00:00.7298
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a423da61-3c25-4550-03d7-08dbfd655da4
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DU6PEPF0000A7E3.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB6650
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 Dec 2023 12:00:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192426

T24gMTUgRGVjIDIwMjMsIGF0IDEwOjQ5LCBZb2FubiBDb25nYWwgPHlvYW5uLmNvbmdhbEBzbWls
ZS5mcj4gd3JvdGU6DQo+IEZZSSwgc2luY2UgS2hlbSdzIHBhdGNoIChbT0UtY29yZV0gW1BBVENI
XSB1dGlsLWxpbnV4OiBEZWxldGUgbWQtcmFpZCB0ZXN0cykgYWxzbyBwcmV2ZW50IGJsdWV6IHRv
IGJlIGJ1aWx0IGluIGEgZGVmYXVsdCBjb3JlLWltYWdlLW1pbmltYWwgYnVpbGQsIHdlIGNhbiBz
a2lwIHRoaXMgb25lIChzdHJhY2U6IERpc2FibGUgYmx1ZXRvb3RoIHN1cHBvcnQgYnkgZGVmYXVs
dCkgYW5kIHN0aWxsIGZpeCBbWU9DVE8gIzE1MzIzXS4NCg0KSeKAmW0gYSBmYW4gb2YgYm90aC4g
IEJsdWV0b290aCBzdXBwb3J0IGluIHN0cmFjZSBpcyBhIG5pY2hlIHVzZWNhc2UgYW5kIGVhc2ls
eSBlbmFibGVkLg0KDQpSb3Nz

