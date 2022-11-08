Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B86EC433FE
	for <webhook@archiver.kernel.org>; Tue,  8 Nov 2022 17:45:03 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (EUR04-VI1-obe.outbound.protection.outlook.com [40.107.8.51])
 by mx.groups.io with SMTP id smtpd.web11.230.1667929493377687809
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Nov 2022 09:44:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=39cdyGBv;
 spf=pass (domain: arm.com, ip: 40.107.8.51, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=mZdnz1w4TgzKRqqweF7aI68ENLXwdXI+dMsOIhmE9MNbg38L9ztxYvcue35ErOrkRR0r5Q+FIpjosmYSxMwdI3OX5O0oVpOh0h3aHDaVm0ZFRYylwIAPeFn+Yce8YLw22KZ/MdiXcOJATywuzoe4ZTIMC7vdPQfLOK6VBK6hZ8RS0ZXWm1IW6QLV+FahNCUngnA3dJcNifdER9Y/OKyfkW67yHMxbslqP0Nw4fvHNb5lG7AY3jsfCvCtcChGfFZ2JmS1pHlRAgmMmoYF1HUxwuhdPQoMYyFg21TbzHFHitxvVTfbvNqN1ZPKVaRXrRx8ly5M3+SxIMBi60G5fy8e+w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7Y5LSmBd/rrU1b/oYretUBdWZ/dOdB9HyxqcyB3goMI=;
 b=fpUQnreb3C0w64vwryHIt9MfFWNWCJsYimy7BqoRw2Wx+lRo/VHpL20UuCVZS/DPffVdEVS0829nM1RP07ItDBCLH+I9DWbiBkj503JiPUnC8Og51P2YclroIGdLy0qUFisDgzCmjI65JIYnmNqI2o4OeSeVctp4P2v2c02FjTRzVbmmANtS1TEH9wx/X6FGOJefCMgjP3k0dXKmHV1NQEwiznCzX2lxXFhxDtS++GFHeLMl3BAX8sGqg/BBNCfY3nwhB2lp20+Av5xCoVTsIqCLiZX93nxlZbptAFm2yLrtWMO/F8OLxdXjyda7yE7aPZn29vsqj6Kp8DWEB/Y/2w==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7Y5LSmBd/rrU1b/oYretUBdWZ/dOdB9HyxqcyB3goMI=;
 b=39cdyGBvQLVHeYQqVG5gDLIgpxB5dDDjsSB6paV+2c1MGfCiHsCbNnqbuTi/s1w2aQQJHznZ3qSE4NY4J0JEacjXVMQIQmDOOkHqv4Wi/I7rUnyMuQg5TTtdLZXY/GjP9Dzx33+fJrLLCztwXmfr16dvxhcqAnKT7A73On918D0=
Received: from DB6PR0402CA0015.eurprd04.prod.outlook.com (2603:10a6:4:91::25)
 by GV1PR08MB8058.eurprd08.prod.outlook.com (2603:10a6:150:96::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.11; Tue, 8 Nov
 2022 17:44:44 +0000
Received: from DBAEUR03FT035.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:91:cafe::d8) by DB6PR0402CA0015.outlook.office365.com
 (2603:10a6:4:91::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.22 via Frontend
 Transport; Tue, 8 Nov 2022 17:44:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT035.mail.protection.outlook.com (100.127.142.136) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5813.12 via Frontend Transport; Tue, 8 Nov 2022 17:44:44 +0000
Received: ("Tessian outbound f394866f3f2b:v130"); Tue, 08 Nov 2022 17:44:44 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 3ee51e9617473ea4
X-CR-MTA-TID: 64aa7808
Received: from d6320b936610.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 514E9CFC-B11D-403D-B504-8B8A9A63CA87.1;
	Tue, 08 Nov 2022 17:44:37 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id d6320b936610.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Tue, 08 Nov 2022 17:44:37 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J2HGb0h79c9yqe5OIJWSXksBxoYyIFzqytHJ1Yi9jvZOosEstGKzW+RX7vrazFfkqjsCtLs4nyDdi/6i98NLnyTae8S/jZNSS1JxrbMVCrsqnaFdC5k90MfjWQLUYHgHtM5A/XXQSgBzF0r0tGtSfzTvVbKYR7XrgxgwBCXprs+QOk2GCRJjRf2pzIc1WAoJNzq43u7myjZX1xznls9KlGZeGqoa8kwczCHH0yNvHFwlJtAY1ZelKjNC1RiOENz7bDIeodt0SoD3+q9dTT6iBONLMS2o+O30PDHS5AikuO56PkrCIFuFa7nyMqLkjad+CAZ8UjrAoDkxAzHCLfREyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7Y5LSmBd/rrU1b/oYretUBdWZ/dOdB9HyxqcyB3goMI=;
 b=M3Zdp66uSvvoDck5FWSCYBfreWoGovuoYymAOarKNODT5358R37OoIzSrRYhzGVxnSQZW07GTHnUE2FGYUaU4U9QW3eC6Ub9dxhKmikqNLbyoI1+y+ngVPp1wxj97HAuE2L5KuX11gyDqcbL9KG9kQAhLEz75G1D3QWd3IK3QuN3RFtqFD2j3PkOmxsDccd14QXl2PgZNvwjnYq4k2Xb+9JZJSGmroj71MeRcUoet47B4uHpuj/IT2+GlivgaTvcSfoy88Bm0ZhvRkJXKWDrRKW+n55wpY+V/W+xn5Y83YCjK7desGHaFkeCLAYN4Fqk/wKtfCA/6Gw8PD5h4s6kLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7Y5LSmBd/rrU1b/oYretUBdWZ/dOdB9HyxqcyB3goMI=;
 b=39cdyGBvQLVHeYQqVG5gDLIgpxB5dDDjsSB6paV+2c1MGfCiHsCbNnqbuTi/s1w2aQQJHznZ3qSE4NY4J0JEacjXVMQIQmDOOkHqv4Wi/I7rUnyMuQg5TTtdLZXY/GjP9Dzx33+fJrLLCztwXmfr16dvxhcqAnKT7A73On918D0=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by PA4PR08MB5920.eurprd08.prod.outlook.com (2603:10a6:102:ea::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.10; Tue, 8 Nov
 2022 17:44:36 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::af9:29f:ae3b:108f]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::af9:29f:ae3b:108f%5]) with mapi id 15.20.5813.011; Tue, 8 Nov 2022
 17:44:36 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "Gundlupet Raju, Sandeep" <sandeep.gundlupet-raju@amd.com>
CC: Openembedded Core <openembedded-core@lists.openembedded.org>, "Hatle,
 Mark" <mark.hatle@amd.com>
Subject: Re: python3-picobuild build issues
Thread-Topic: python3-picobuild build issues
Thread-Index: AQHY8474dxFAPLLyg02hWF68vRDik641QECAgAALnACAAACDAA==
Date: Tue, 8 Nov 2022 17:44:36 +0000
Message-ID: <CF402A64-32D0-43EB-9C17-77A30EB87B0C@arm.com>
References: <34e26020-b14c-e5b2-d397-0d0715b67e4c@amd.com>
 <196A74E6-80CB-4137-9E28-4C0E498A51AD@arm.com>
 <663a8ce0-c048-94ec-0ed0-b97ceebab676@amd.com>
In-Reply-To: <663a8ce0-c048-94ec-0ed0-b97ceebab676@amd.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3731.200.110.1.12)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|PA4PR08MB5920:EE_|DBAEUR03FT035:EE_|GV1PR08MB8058:EE_
X-MS-Office365-Filtering-Correlation-Id: eb3b6830-c34d-478b-0b78-08dac1b0ebdb
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 DVp9iOaBuyGR0rsCXaYhctGCWtEx9sNrfmaw6U4BN4igH8rYSXXuDZ30J0jXET3F95q9bcn7LBFGTXJMGmpmbR9aC4lMar3YL4KLiMndKiqMqJAbS6W4N8I4WpyFD0BGAtCNAK+FS6UXca7Zjx36+ylwV86YXX9VCCn+9UL8lDTDJGG3K1OwRaI6hYx9My4IzPZXrpABo44QDrs5+N1mGJacM3i6i6+rsA2tPI1dXuOnMO8wXqWdweNRQVz8d337m2Dlt7HWaV9IDwgm7A/bkdxjjR3HmakUJR0fPRLuyGo5vZapWZ/GKUH1IvhUOJZX2XuJM3++n2NlTGr65gSPHc9FtU9E5vtLFSZp4HTyctnv+4IVvvFri0LdghHuWsL8aPPLMgn+g356YZIJDxLwLMgqgb813P4FYgx/780ENmy1JPFr3dLoJVHEtb8V1hiLDL0xDNMenarCvvXyLnFR7MS5m3sMKLhZofDy4LffXsJfKQdO7LO2p/Yh+zJYFzwRC2gcIStai1HqQ8Gs7jSt7oroCBlPXReOu3MJ7/QqW29Z+qY71tgi34Whi6s1A2AY93gsuPtnmQ4Hy4DpY7J2hUGcpfxddvovPGit5OV6k+X/DzYVb3IffoGbzWsRnPHsmPNwHDCmqQT81NWkoFemsdj8NpcSlwYNkCdL0enNxwvFhgGlmS8ihnuqS+ydLgaOKL962mSN27dpq4hy/tzmeRwk5vlgT7d6xoAVxeyeGSKu+x97eHOQrLPfipDNPdBDYYCGNHt5EP2l1rASU2asvuIjo6W8AEa+Gf1NVbODsaTp2mOx8Y3Mfnd+jdAPZPGkZ0A0nNDaZp5yFYy4JdOqzA==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(396003)(136003)(376002)(366004)(346002)(451199015)(478600001)(6486002)(8936002)(71200400001)(91956017)(5660300002)(4744005)(2906002)(66476007)(316002)(66556008)(33656002)(66446008)(41300700001)(64756008)(966005)(8676002)(83380400001)(38070700005)(54906003)(6916009)(76116006)(2616005)(38100700002)(6506007)(122000001)(86362001)(66946007)(53546011)(6512007)(26005)(186003)(4326008)(36756003)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <3BC79E09EE45544CAE73E677E3E42FBD@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB5920
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DBAEUR03FT035.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	d4b004c0-47a7-4ad9-7d80-08dac1b0e73f
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	tleM1vbERYb4RC3kBnS0SmgivMiSHnXh5/MTjQlAlapbXThMjRaehRhAHntFNOJJveWO+ZSBqu/lcxVy/12tI6ADs+jK78wysVSLkif5enJfwZnBiCVt+lD+PwsCrQ3BhE+7gfrVmVp1aIZvdK1TcfzedAT76G0SkXl3ITv8/cCTdQoyWt+sZd8SJjj/7gpiBsJO66a6wsLY861lq9cZ7YsEBLwpbyWjgr3MlwlbG60E0xAZ6y0ll+Pk0H6GqCK59J5cf1gtliDXy4NyXNJLtBkV+YEgeSLAh1uJhfnbQwKuphc70sPar3+vB30nhdrjEO7sd4me/zY7yFaTc5+U6NXNrNP73T/p4xFAKg4hH8wK7wfi9b4uP0yun/2/CWwoTtQnuyiHlk7g9OkD6SEuirpfNrNsGTcevZUWsjfHS7ZBD1iOtZfluJ2Lmnc/kpZXdAm9dJEP3xezi2JYtsdUqKQTV0KWD8YHKNKFbLss3kHX0SvzpbGrrhSF5XHD0BYt1qC/dQ+GQxRIS8rpS+xq1cSanRX+rJ4bpncnsrMBQZVY5S8I9TIvtB5Mm/KVwxRugO0fSCPtAsAi8ElATz5ZhvvN9rCQZWalPXSgz3sFMqys/qiq38wT3TyxGckS3yZ9OnjdC01Elu5lNQQvqdLhY9mpeF8/XuABpW/PMCziucMBM3RT8AmtnEejoKTcJPZllEVwlTwEmgeR5QS1F7fW6EmS3ZYikKQZ7aqGjzUSj/BB8V6zy05lbPnwnMbsv3dLnjvlC4Pp+ioJ0lfYXh7pkQOzZzDEvpd9DHu5kprtRV1rWlgwRSDowBaj4t2h/qsd
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(376002)(346002)(396003)(39860400002)(136003)(451199015)(36840700001)(46966006)(40470700004)(26005)(6506007)(81166007)(53546011)(86362001)(54906003)(6512007)(356005)(6486002)(40480700001)(36756003)(186003)(2906002)(966005)(478600001)(82310400005)(33656002)(47076005)(82740400003)(36860700001)(2616005)(40460700003)(316002)(83380400001)(336012)(4744005)(8936002)(6862004)(8676002)(70586007)(70206006)(5660300002)(4326008)(41300700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Nov 2022 17:44:44.1596
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: eb3b6830-c34d-478b-0b78-08dac1b0ebdb
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DBAEUR03FT035.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB8058
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 08 Nov 2022 17:45:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172986

T24gOCBOb3YgMjAyMiwgYXQgMTc6NDIsIEd1bmRsdXBldCBSYWp1LCBTYW5kZWVwIDxzYW5kZWVw
Lmd1bmRsdXBldC1yYWp1QGFtZC5jb20+IHdyb3RlOg0KPiANCj4gDQo+IE9uIDExLzgvMjAyMiAx
MDowMSBBTSwgUm9zcyBCdXJ0b24gd3JvdGU6DQo+PiBPbiA4IE5vdiAyMDIyLCBhdCAxNjoyNywg
R3VuZGx1cGV0IFJhanUsIFNhbmRlZXAgPHNhbmRlZXAuZ3VuZGx1cGV0LXJhanVAYW1kLmNvbT4g
d3JvdGU6DQo+Pj4gSGkgUm9zcywNCj4+PiANCj4+PiBJJ20gdXNpbmcgbGFuZ2RhbGUgcmVsZWFz
ZSBhbmQgYnVpbGQgaG9zdCBpcyBVYnVudHUtMTguMDQuMywgQW55IHBvaW50ZXJzIG9uIGJlbG93
IGJ1aWxkIGlzc3Vlcy4NCj4+PiANCj4+PiB8IHVzYWdlOiBweXRob24gLW0gaW5zdGFsbGVyIFst
aF0gWy0tZGVzdGRpciBwYXRoXSBbLS1jb21waWxlLWJ5dGVjb2RlIGxldmVsXQ0KPj4+IHwgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgWy0tbm8tY29tcGlsZS1ieXRlY29kZV0NCj4+PiB8ICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIHdoZWVsDQo+PiBUaGF0IHN1Z2dlc3RzIHRoYXQgaXMg
cnVubmluZyBhIGNvcHkgb2YgaW5zdGFsbGVyIHdoaWNoIGlzbuKAmXQgb3Vycy4gIERvIHlvdSBo
YXZlIGxvY2FsIGNoYW5nZXMgdG8gdGhlIHB5dGhvbjMtaW5zdGFsbGVyIHJlY2lwZT8gSXMgdGhp
cyByZXByb2R1Y2libGUgd2l0aCBhIHBsYWluIGNoZWNrb3V0IG9mIHBva3kvbGFuZ2RhbGUgd2l0
aCBubyBCU1BzIG9yIG90aGVyIHBhdGNoZXM/DQo+IA0KPiBbU2FuZGVlcF06IFdlIGhhdmUgYSBw
YXRjaCBmcm9tIFRpbSBmb3IgbWV0YS1qdXl0cGVyIGh0dHBzOi8vZ2l0aHViLmNvbS9YaWxpbngv
bWV0YS1qdXB5dGVyL2Jsb2IvcmVsLXYyMDIyLjIvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0
aG9uMy1pbnN0YWxsZXJfMC41LjAuYmIgbWF5IGJlIHRoYXQgbWlnaHQgYmUgY2F1c2luZyB0aGUg
aXNzdWUuDQoNClllcywgdGhhdCByZW1vdmVzIGEgdmVyeSBpbXBvcnRhbnQgcGF0Y2guDQoNClJv
c3M=

