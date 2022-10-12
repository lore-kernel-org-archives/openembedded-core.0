Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4A38C433FE
	for <webhook@archiver.kernel.org>; Wed, 12 Oct 2022 16:18:57 +0000 (UTC)
Received: from EUR01-HE1-obe.outbound.protection.outlook.com (EUR01-HE1-obe.outbound.protection.outlook.com [40.107.13.75])
 by mx.groups.io with SMTP id smtpd.web11.1265.1665591526608245445
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Oct 2022 09:18:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=JNG6SIJ2;
 spf=pass (domain: arm.com, ip: 40.107.13.75, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=UyfWLrBDhcQgZoYixunBka54iZV3w73JuKPO1bfAXWP3YE8AYiPhlfjegablhxZ2GgzVSArwct8kgj7sBka6Ef1cLLefjwuN+g+TS0stwxJkjQWPuTBV4lrP53ylHVVxRHA+YJSpz49UPQAfcyxqETsP3PSy00n3fj2JgGhblCOhlD/MhHqOklC6moKdpnMa5KBMo0X5dvDIx0Da70hDEu6Qhe10zAj1AA7VrRHnHupjhgODxjs14Jl6c35VJ11XFGZNSS+xQBqGw4dYUEA6IoxFftFtToXPKFkzGkJprQ0bzVAdOjFcn8EJz4YVgADYXrDx5TLoVwEWWeXrkEn7bw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eovksalzQ72TRy7M3AJAoTnjzV4awkJkFlTs7ZPBjQI=;
 b=XKekJiIGSBmD9J2VxueCAd3wj732Y3VdyTU2+2uf9ikV8LzUnvfltnDx62WR17yPAP3hKjI6bgeDFdtYIer3mOn70RjBKTCcv1MQZkpKGtweNWWIkbnPYgxp63LZdFQItAB0FIua7qGfmxVeOfLvP8/XJl1ZkWUHbWyhfZjrj+Ia1cq+kK5XNx14/lOZdIBJvl47h9ZA6+2ApBAhaKHFZTFpgmZ6fNk/nkSg+XiSB0kbgG5pct8nrj0vFkbPX6DSwi2Gg3gCfA3uqSYvA4ghnDItx0LVtRE6tR8JxsN1apBVhcUsBVuJqM+C7TNISJ9DKP36NctVTGIQ/I/5+ilIXw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eovksalzQ72TRy7M3AJAoTnjzV4awkJkFlTs7ZPBjQI=;
 b=JNG6SIJ2wZPtnNdqRQCMF9TKrrJsN6RdON1huDsNy9YbaQQfllUOQx6SlWfZJ/c9IkKVzKImc8THU6UrulbPR84DAGDUQbH6IurTuTeDNgH+KOPZN3Nsgq3nhBb5MrCeSC9hU2j2aIEPR0EDt+GEy9HwFaotePUIArV4bmrPfms=
Received: from AM6PR0502CA0040.eurprd05.prod.outlook.com
 (2603:10a6:20b:56::17) by AM7PR08MB5334.eurprd08.prod.outlook.com
 (2603:10a6:20b:10b::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5709.15; Wed, 12 Oct
 2022 16:18:35 +0000
Received: from AM7EUR03FT043.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:56:cafe::f2) by AM6PR0502CA0040.outlook.office365.com
 (2603:10a6:20b:56::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5709.15 via Frontend
 Transport; Wed, 12 Oct 2022 16:18:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT043.mail.protection.outlook.com (100.127.140.160) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5709.10 via Frontend Transport; Wed, 12 Oct 2022 16:18:35 +0000
Received: ("Tessian outbound 86cf7f935b1b:v128"); Wed, 12 Oct 2022 16:18:35 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 830438ceef879644
X-CR-MTA-TID: 64aa7808
Received: from 50f712ff6bb3.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 2BD0D5B3-DF4D-43B4-B61C-D9798347E359.1;
	Wed, 12 Oct 2022 16:18:28 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 50f712ff6bb3.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Wed, 12 Oct 2022 16:18:28 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ACQRacnoTTuCxvCdG7VLQd/HypjxgROF8A4HAv0ncnORJWij1IfiODabr7bA+7qYo0ScAwFuh935hg+h9kYn0E5gVjbcFII1mHu2/HQc4AgL7PvMzqrQ2etYWVUBlO9tHdKufwZZcHfb5FZiQVjH/th1ps+m27DzgIQQZuP3Y7a7g6UEuC/tLvVID6OTCdutYbpdZoKtgCUmuhxkg5gtBlwEB8x4Qe0wtIatZiYY9CJIfflSCMWNUQWPj306sfp6+nRzT9Y4lq1XRVgoj+a8rQcEo1em0Bn9Nu380skVnWyihTzeBuYUcCV+kVbkoEUnjiJOTkUeN/pHs7+YtSJfsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eovksalzQ72TRy7M3AJAoTnjzV4awkJkFlTs7ZPBjQI=;
 b=QbL/UxGBGT5qa+r2yHzJCYVJ9plqsc5Nk14hYA3o24zyD8bEdZCaDzKANFtchUZsz63kCgUQbLCndA9dNBoWvkduuvv4apUCM/aaFzskNBZWCECcDYOwQG4xHdQ5f0shF8jvpAPKiUfgUrEiWNkSkELVTwgIuweZhrNeOzG2ggO8+QJtTOstXmZQvc2RtfzbH0uae2df5aKalhyW4Ij1+nX9L+Prqom3gET0PMwVDTtCuMxj0bx97qR6dL4+qlqgtZ1teEbmvI8BCJWoYttZ/UoqR/ee/uoAp7ecNCSr7v1g/Ec03ISLC6grtOJm99J8bp+cPUIdKfrsxp9zv96y/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eovksalzQ72TRy7M3AJAoTnjzV4awkJkFlTs7ZPBjQI=;
 b=JNG6SIJ2wZPtnNdqRQCMF9TKrrJsN6RdON1huDsNy9YbaQQfllUOQx6SlWfZJ/c9IkKVzKImc8THU6UrulbPR84DAGDUQbH6IurTuTeDNgH+KOPZN3Nsgq3nhBb5MrCeSC9hU2j2aIEPR0EDt+GEy9HwFaotePUIArV4bmrPfms=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by AM9PR08MB6132.eurprd08.prod.outlook.com (2603:10a6:20b:2d7::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5709.21; Wed, 12 Oct
 2022 16:18:26 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7d2b:2570:9a99:a3d2]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7d2b:2570:9a99:a3d2%6]) with mapi id 15.20.5709.021; Wed, 12 Oct 2022
 16:18:26 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "raj.khem@gmail.com" <raj.khem@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] ptests: Mark ptest-runner as rdepend instead of
 rrecommends
Thread-Topic: [OE-core] [PATCH] ptests: Mark ptest-runner as rdepend instead
 of rrecommends
Thread-Index: AQHY3PClTbgM/J4WlUKLccYF6INR8K4K8qGA
Date: Wed, 12 Oct 2022 16:18:26 +0000
Message-ID: <7D9DED4A-BE5C-451C-AF30-559ACED2C7A7@arm.com>
References: <20221010213814.1678227-1-raj.khem@gmail.com>
In-Reply-To: <20221010213814.1678227-1-raj.khem@gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3696.120.41.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|AM9PR08MB6132:EE_|AM7EUR03FT043:EE_|AM7PR08MB5334:EE_
X-MS-Office365-Filtering-Correlation-Id: 587c7988-62f3-4481-ae83-08daac6d6a0c
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 KE5eM7p+CyAw8CGv/TF2peBjI/tuV3cFD8pfHgRJM4ieDQ6uQtKFW0E36u9cmRBed4jHanG3Y4wql8YFne/cCqlVMJactf4M55N3t+Au/rr/YjyEihdlDHcAN0x44S0/0pci5itcuxujrdDKfququNBSaYcQLhOYhNPSIaumJj5pahDcm7xsTobVaLnqXGyibYXhS1IFBWXM1fzpCtkullLjGjhvepPMo33jROuGXvIuEGw0kQoUqUEJPMEnS7ycgcmi+ST5UhPkzjvECdlqFsufPq9Y/5DFVTDeXV23Od27tBDUZv7anrY6EatfGzA6CNQEWr6wdgU7Y7JHf19iO+fcEaUwkZeM/7xntpryeaBSOBbnQwinSsYlklhoy8KMSEazWTaoRhayUa1YgBmLRZAgr6Qfer58bLHFmoG2RixgGXX6AnNE8X067zZuqXM+JG0KJ3RoGgchWehuUFzFumuqfWr88WiQ6v3tn5p3PkNDQkkOgRF8WBddzq0frATAGPAYm/q0J7qti2IY8NZcMUST/4jg1Fg0KwhC2iCcHoXJWDC8n/GQS/UruPEBPHhU2SoOGdMIX3Pbuub61LAzOOLJA8E+M3POKyHb94cdoi5279R+xlT7Ae6Qc8U59Ze69cGmKGIgChtghGOGcjiu4niAnLi4TlzUTzEYzr0JekEMHCiKgzMd3iScutU2LypFymRcD68Hq7Rd1TqSBbfkWFr8Wnp2Jf60rH0hfmQCntGv7DS4ypbpXxI5AmcvR9+EqW/y8Jmf/+kV2pWzdQ3sf2bcMzyPkOG8/FAQVbpUEWw=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(366004)(346002)(376002)(136003)(396003)(39860400002)(451199015)(36756003)(86362001)(33656002)(38100700002)(2906002)(5660300002)(4744005)(66476007)(4326008)(8676002)(64756008)(66446008)(66556008)(76116006)(41300700001)(38070700005)(6916009)(316002)(66946007)(91956017)(8936002)(71200400001)(122000001)(478600001)(6486002)(6506007)(26005)(6512007)(2616005)(186003)(53546011)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <2C6B612916B0FE488CF8213176AF63B6@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB6132
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM7EUR03FT043.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	3801b07a-76c8-42ac-4e1c-08daac6d64a5
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	VfpNslCBmV/rX+3c1aJ7ll7yQ6TAbBLVweVo8cjWddfxv+0GpAwP9dhSFycjPCuqpEIl2iv1J+RDMO+TUtmQlBi9l+D0kZpuTdJ6ji8o9lDfnLSMpfuzyDWjq1WNetuAnU/gsdWoLsUOvRIFYpiNlYdm39SA4wxU7HhbTnabgHL1CFhYmmtDvv2gQe0FoBgUGYgC0XVsipOLhKvVLXzH4JZ3PYp8mgt2ZIlZpiA/iOepPLSeRv1+uBe1fTXfQycqZgBNhBRUr3CYdjBrrhGOoOYo5AnjYHpwWCdOoXD9Rfc34SEVemzr+Jfuwhchg8qTT/CBMdiAHuyGHbBcqfG3R13wAQxy+/20RoMVfu+4NMM4Lj0L5EjhEgSU5ShebgiOGkO2hfnWBp3zXjQ3l72hifMM/dVSgeWTmgT6BD/ppAYY1PDA1z0Y6aATK8qiEgkz3W5kIPJCFHB1/2lepUGUDk55L9YuUMXYfPqPNDiI/WVxB2n84jqLa1H0L0KS4wMZ/h9/PgUfEHV56Xl2FUXG4TA5WsRhWXoACbtkBrTQsl9Iqb6EZvb7nWihFHTP6y98MK89Kt3TVaejr8UCCihy6IjQurC+hrPh8z8o5/e+xdzMjh3MVJUqOVQ6mjfD2P27gdFgjhE9Q2w7qt9CKl9EZVtoXRWXDGzk2KuQ+5o55Q+3gZEga9ynliT2GujFSN7M5x6GYnvTehc6rVsEYh8W6siUKyLKHpaQHu2inaYdWVsENWzik1Et5lBbt7Q2Ja5GkXnnrJA3BkH1o1i86KFFDA==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(136003)(346002)(376002)(39860400002)(396003)(451199015)(46966006)(40470700004)(36840700001)(5660300002)(41300700001)(2616005)(6486002)(40460700003)(36860700001)(2906002)(86362001)(478600001)(316002)(6506007)(33656002)(40480700001)(26005)(8676002)(53546011)(6512007)(70206006)(336012)(4326008)(6862004)(82740400003)(47076005)(70586007)(186003)(8936002)(36756003)(82310400005)(356005)(81166007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2022 16:18:35.6194
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 587c7988-62f3-4481-ae83-08daac6d6a0c
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM7EUR03FT043.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5334
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 12 Oct 2022 16:18:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/171667

T24gMTAgT2N0IDIwMjIsIGF0IDIyOjM4LCBLaGVtIFJhaiB2aWEgbGlzdHMub3BlbmVtYmVkZGVk
Lm9yZyA8cmFqLmtoZW09Z21haWwuY29tQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+IHdyb3RlOg0K
PiANCj4gVGhpcyBlbnN1cmVzIGFsbCBydW50aW1lIGRlZXBlbmRlbmNpZXMgZWcuIHBlcmwtbW9k
dWxlcyByZWNvbW1lbmRhdGlvbnMNCj4gYXJlIGFkZGVkIHRvIGRlcGVuZGVuY2llcyBjb3JyZWN0
bHkNCg0KSXQgZG9lc27igJl0IGRvIHRoYXQsIHRob3VnaC4NCg0KVGhpcyBtYWtlcyBpbWFnZXMg
YnVpbHQgd2l0aCBwdGVzdC1wa2dzIGFjdHVhbGx5IGluc3RhbGxlZCBwdGVzdC1ydW5uZXIsIGJl
Y2F1c2UgY29tcGxlbWVudGFyeSBwYWNrYWdlcyBhcmUgaW5zdGFsbGVkIHdpdGhvdXQgcmVjb21t
ZW5kcy4gIFRoaXMgaXMgYSBwcm9ibGVtIGJlY2F1c2UgYW4gaW1hZ2Ugd2l0aCBwdGVzdCBwYWNr
YWdlcyBpbnN0YWxsZWQgc2hvdWxkLCBieSBkZWZhdWx0LCBiZSBhYmxlIHRvIHJ1biB0aGUgdGVz
dHMgd2l0aCBwdGVzdC1ydW5uZXIuDQoNCknigJl2ZSBhIGxlc3MgaW52YXNpdmUgY2hhbmdlIHRo
YXQgSeKAmW0gYWJvdXQgdG8gc2VuZCB3aGljaCBzb2x2ZWQgdGhpcyBzcGVjaWZpYyBwcm9ibGVt
IGJ5IG1ha2luZyBwdGVzdC1wa2dzIGluc3RhbGwgIiotcHRlc3QgcHRlc3QtcnVubmVy4oCdLg0K
DQpIb3dldmVyLCB0aGlzIGRvZXNu4oCZdCBzb2x2ZSB5b3VyIG9yaWdpbmFsIHByb2JsZW0sIHdo
aWNoIHdhcyB0aGF0IGlmIGZvby1wdGVzdCBSREVQRU5EUyBvbiBwZXJsLW1vZHVsZXMsIHRoZW4g
cGVybC1tb2R1bGXigJlzIFJSRUNPTU1FTkRTIGFyZSBub3QgcmVzcGVjdGVkLg0KDQpJ4oCZbSB0
aGlua2luZyB0aGF0IGlmIHNvbWVvbmUgaW5zdGFsbHMgcGVybC1tb2R1bGVzIHRoZXkgd2FudCB0
aGUgZW50aXJlIHBlcmwgc3RhbmRhcmQgbGlicmFyeSBtb2R1bGUsIHNvIHRoYXQgUlJFQ09NTUVO
RFMgc2hvdWxkIGJlIGEgUkRFUEVORFMuICBOb3RlIHRoYXQgcHl0aG9uMy1tb2R1bGVzIGFscmVh
ZHkgZG9lcyB0aGlzLg0KDQpSb3Nz

