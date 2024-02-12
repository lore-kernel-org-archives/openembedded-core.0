Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89896C4829E
	for <webhook@archiver.kernel.org>; Mon, 12 Feb 2024 17:28:10 +0000 (UTC)
Received: from EUR02-AM0-obe.outbound.protection.outlook.com (EUR02-AM0-obe.outbound.protection.outlook.com [40.107.247.79])
 by mx.groups.io with SMTP id smtpd.web11.12529.1707758884296942221
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 Feb 2024 09:28:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=VaNtwjMq;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=VaNtwjMq;
 spf=pass (domain: arm.com, ip: 40.107.247.79, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=C9Fmu7sI/TiD6yCZWTt+ea2mN4LQCkDSf58M/hjXDO7OSVkcXGd1OvjIW/61B17Z9+kATbC/Cp+F0OQHjYwEzFY7s09oHlH8BEcFM5179QFJ4nBIV2aOHgf93s0vez+9LL/29Tsmzc8HiEmKjZRnnMi01X7nf6fTyrS5PlQW5nkdvY3w7fgky3I41bsWImIEfl+aWjCDhnJSC0DL491XLhzb7mjpvIMJdvgmXCVqrs3KTKFYMyrMDSf4u0/5ZGQsQ822cUlOWKsIS3ruW8oR+H7PrDDzSxtLP4HNkPjrHkV6VT7u2wUjjpiAZ9IKPdt/6jMquVeph91GRGDSXHpwzA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mLy1d8tVTn5BT2kKOlRh/YD+rwSZw71OSeycmml2Q0Q=;
 b=lMiiiwqlhIlWwXBnlK6FOUaY3cLFA817YNgpX20H+Gufb+RVIO8lUmjirR6AX80aBYNGSsK2l34S6Fjb6MemzMGlmEbFwTZO29d4KPW/lbk/ql4CVJc48Eg16Vh/vYhoHXO2kfGtmuGVkfHb7MPqIO8fMUBv2MA93VC+C5kAXH/0bqfxQQdCqQ0HSIidYCpCiyvJpUgNek+JRKMP46q8Ix9pyvvSdKGkTqhjeAouXHOKAA6y9yBrh7hqf8LEU6GM4Ozn5xWNkeeGhIklmcMKgpDzKBtA7bApxQjhR/cCUQAOQaeVYH3aLIgq0SK3pLvBXWICOecithknFpyeGdbhYQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mLy1d8tVTn5BT2kKOlRh/YD+rwSZw71OSeycmml2Q0Q=;
 b=VaNtwjMqfs5cjOT2ygtryAcUzVr/b9UXHRus9W8ESgSPnoPjiWiDBbPUgJ56HZFnGXF63sWjDG0Ggmd1uV1/ht0WW+dYcpI649xGTJJzaYsXBoxa1nZ0NTPWKxXCJcX530R8lpczU1kggQdO9wlXGle4s7SyvNbTm0pcNcrteSI=
Received: from DUZP191CA0026.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:4f8::7) by
 AS4PR08MB7632.eurprd08.prod.outlook.com (2603:10a6:20b:4cf::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7270.33; Mon, 12 Feb
 2024 17:28:00 +0000
Received: from DU2PEPF00028D10.eurprd03.prod.outlook.com
 (2603:10a6:10:4f8:cafe::f7) by DUZP191CA0026.outlook.office365.com
 (2603:10a6:10:4f8::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7270.38 via Frontend
 Transport; Mon, 12 Feb 2024 17:28:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DU2PEPF00028D10.mail.protection.outlook.com (10.167.242.24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7249.19 via Frontend Transport; Mon, 12 Feb 2024 17:27:59 +0000
Received: ("Tessian outbound c4f080b252bb:v228"); Mon, 12 Feb 2024 17:27:59 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: a89680b21c53587b
X-CR-MTA-TID: 64aa7808
Received: from e3e3eba996bc.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 36313851-4159-4406-B272-FC7FB3480645.1;
	Mon, 12 Feb 2024 17:27:53 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id e3e3eba996bc.2
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Mon, 12 Feb 2024 17:27:53 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P6gjZlmSJ10HM66cMGD88F4WJK6Z28wqZoYGF+YX6JG2U9TMZUd5q3KyEqemv4wgH/WN5Ld8PJ0BVcNqbccjrsN0QnAtDEuSBmIsjQPSaKVDqFlQJ1MRNCc37+OJuOBKk/dPqcSfjIDptJ5zbQRU6stl7WF4EbL+ys/ymmeR0pDwRGb1P5nrrI9pnzKdI9Qbx9+iUNLwerNlsx+B5YP6rtlhnNUODd3yJhc+468hdWQWGSnjAYVYjqr1hO8bNL3nMV+idN2l5bWql/m36e6PQ3N57+gULJCYEcyruaXdTz6G1unKt88tbMtul5BmDS0RVxqIyN+GXgQhpryAsunqzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mLy1d8tVTn5BT2kKOlRh/YD+rwSZw71OSeycmml2Q0Q=;
 b=EINtvAuv4gyCnvzluoYs9JwmpzbCzfn0RaOWFm+1zgUScayjHw8wJ55Xd4ggPLeoQQ38FA9jnwbzc7HZ69eEFIFCSRmIvFeyXgvzsGbzYeO3/ZtcMGbuuxC/m8ANvywGzrl7iBBynBZw6eUivyJEzLb+nZW4YmhiCHGSKAdH+q8bqnIJCM8rYGpGTWsCHwUeQKdc5s4RdXe17nnDa66qBbvWphzq0Yv+e4F+Jmju+dQKwR4hi2vs3zPe9bdg6ZGjp1JOT7eJuJnPuCR6DJMpq37Vvqzpg9tjoTniecbcUh0RMZSWwLsEzqwAORE0GUABY9C1T7ac+K6h0B9VeUi8Vg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mLy1d8tVTn5BT2kKOlRh/YD+rwSZw71OSeycmml2Q0Q=;
 b=VaNtwjMqfs5cjOT2ygtryAcUzVr/b9UXHRus9W8ESgSPnoPjiWiDBbPUgJ56HZFnGXF63sWjDG0Ggmd1uV1/ht0WW+dYcpI649xGTJJzaYsXBoxa1nZ0NTPWKxXCJcX530R8lpczU1kggQdO9wlXGle4s7SyvNbTm0pcNcrteSI=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by DU2PR08MB10132.eurprd08.prod.outlook.com (2603:10a6:10:49a::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7270.33; Mon, 12 Feb
 2024 17:27:52 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::740e:ab01:e66a:61c9]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::740e:ab01:e66a:61c9%3]) with mapi id 15.20.7270.024; Mon, 12 Feb 2024
 17:27:52 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
CC: Tim Orling <ticotimo@gmail.com>, Vikas Katariya <Vikas.Katariya@arm.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 1/1] bmap-tools: Add missing runtime dependency
Thread-Topic: [OE-core] [PATCH 1/1] bmap-tools: Add missing runtime dependency
Thread-Index: AQHaWeYXNvfmgW4Y10KOjUHheJtUM7D/0t+AgAJrVgCABL+OgA==
Date: Mon, 12 Feb 2024 17:27:52 +0000
Message-ID: <FE02D4E8-A5D7-4C9D-B673-2219E20E04D5@arm.com>
References: <20240207165219.825246-1-vikas.katariya@arm.com>
 <20240207165219.825246-2-vikas.katariya@arm.com>
 <CANx9H-BnSFGhJLCWgof7mCLfTPMBWn9rdVRYb2vtuoTnmAWc-w@mail.gmail.com>
 <c5fc39dd2e0081a621b8e8568c18dec188bdbf2b.camel@linuxfoundation.org>
In-Reply-To: 
 <c5fc39dd2e0081a621b8e8568c18dec188bdbf2b.camel@linuxfoundation.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3774.400.31)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|DU2PR08MB10132:EE_|DU2PEPF00028D10:EE_|AS4PR08MB7632:EE_
X-MS-Office365-Filtering-Correlation-Id: 1efb5140-a978-495d-4ea3-08dc2beff5b8
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 qL6M4Kr910W3NJ3+sx1JxKze5vlH5IVG06FL2MU6/qiS9fqdhZHODSskRt0jD3NKlfYYtTfrHWK81KIYTVlRP/Ytm2G+AbM2olxWVS/zh0V0quphgeFArthABfGEl3e5ERuTasyo+8pkmdHO0JzcaNItG1XKgdtOaFly4PhiHJl4+7NaQGQQCNop/VshX/LFrJUzi9ThnDtCq4uBLsKD3GQMIQbjf/eVyZDbs8O3kgdzYY0989EuSqBdpkjOzS1RMdwj9yMwwZbwb10sm7un0nihNbMWdH5f+X7R7ewkGpVUy/IcVH0hDB5TJkzf0fJnFlaopewrg1FwmtvUsXq0Fyr7eXu26oT3mfWKRP6JlfcozO0KA36Luc92zMyhsrTg/jgf3i5kqMd7baQn1eCmGvaYFyJLaN8kgPa4C36DbU+SarfsxlEa+mCW50HReJpegL/Hi1iNGWDzUedSct1WBPj3W1xu/EkH2+Fy/D3CEiGYPwQVlqjpvxpn+UMX+o2349NcUsCwKk2FnAvuI7nX6x83Y67xFP2EXcXcAJePJF2rnOhpL1GX84FnOy+af+5PVRF50tGWeBlZEnW67SYKfDHt2VF8bTKUTBcmqu01pdk=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(136003)(396003)(346002)(39860400002)(366004)(230922051799003)(64100799003)(1800799012)(451199024)(186009)(4744005)(2906002)(4326008)(8936002)(8676002)(5660300002)(66556008)(2616005)(38100700002)(26005)(36756003)(122000001)(33656002)(86362001)(38070700009)(76116006)(6916009)(64756008)(316002)(53546011)(66446008)(66476007)(6506007)(71200400001)(54906003)(66946007)(6512007)(6486002)(966005)(478600001)(41300700001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <64F0A742AB23CA4084C02E6029A74E5E@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR08MB10132
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DU2PEPF00028D10.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	e016a0f4-9c77-48d8-c338-08dc2beff107
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	/SZz6PEXYADHR47Dk2O7aQykkwxNG5HOnxt5A9lhKgUAJA4cfXH+zI1VD+eXUp5NHx2BlauGqEwFl95vydH3LU8NO6jCu6K8x3Os1TghGSOjliy+V7B9sujNDVTaZbD63x3bBjPrxQpC9ju/ly0POF7PotBYOWZps6f9YCNFr9RlN8ps2s0x9jyExB4vFPRmVFteXRH8uD3ni2SQ15HAvKtntDGmlPhaZG1Zz30+Son9Us8lReoAgIYpD1EFXzou96QSp1TiMtO+XBFad3oFBIRglUVE+ca2APSI0yUK5Dd4cOfKVqdu71S9BKTA2LbL/t+wYQxyGzF06+TPAtQsALNck9658zDzTlBgYyxp+dhazmByGlVJQ7ekCnHjmMTDxY75wwUVMJcqeyDtRows1+wuTQDdIZ17EIrv1uLNe+UW9iov8Nxk7RPwI89uPH/4SslCGTz0P5ZbEMdwx5ovvRNjcTnenFQyfXQhE2VizdRktMBnfe1d8FRy6EvHZwR0LdfIaD//2JjefpXxM9FPFzma2AnSvaC357laJiWZQNEjOitiaukAzi6cFBNAEty+s0TgjyOdHDXhBLVq+hhY4Q==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(396003)(39860400002)(346002)(376002)(136003)(230922051799003)(451199024)(1800799012)(64100799003)(186009)(82310400011)(40470700004)(36840700001)(46966006)(6862004)(70586007)(8676002)(4744005)(70206006)(4326008)(2906002)(81166007)(478600001)(33656002)(36756003)(356005)(86362001)(82740400003)(53546011)(6486002)(54906003)(6506007)(316002)(966005)(6512007)(2616005)(26005)(336012)(41300700001)(5660300002)(8936002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2024 17:27:59.9286
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1efb5140-a978-495d-4ea3-08dc2beff5b8
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DU2PEPF00028D10.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR08MB7632
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 12 Feb 2024 17:28:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195350

T24gOSBGZWIgMjAyNCwgYXQgMTY6NTcsIFJpY2hhcmQgUHVyZGllIHZpYSBsaXN0cy5vcGVuZW1i
ZWRkZWQub3JnIDxyaWNoYXJkLnB1cmRpZT1saW51eGZvdW5kYXRpb24ub3JnQGxpc3RzLm9wZW5l
bWJlZGRlZC5vcmc+IHdyb3RlOg0KPiANCj4gT24gV2VkLCAyMDI0LTAyLTA3IGF0IDIwOjAwIC0w
ODAwLCBUaW0gT3JsaW5nIHdyb3RlOg0KPj4gDQo+PiANCj4+IE9uIFdlZCwgRmViIDcsIDIwMjQg
YXQgODo1MuKAr0FNIDx2aWthcy5rYXRhcml5YUBhcm0uY29tPiB3cm90ZToNCj4+PiBGcm9tOiBW
aWthcyBLYXRhcml5YSA8dmlrYXMua2F0YXJpeWFAYXJtLmNvbT4NCj4+PiANCj4+PiBQeXRob24z
IG1vZHVsZSBuZXRyYyBpcyByZXF1aXJlZCBieSBibWFwLXRvb2xzICh2My43KSwgdGhlcmVmb3Jl
IGFkZA0KPj4+IGBweXRob24zLW1pc2NgIGFzIHJ1bnRpbWUgZGVwZW5kZW5jeS4NCj4+PiANCj4+
IA0KPj4gDQo+PiBodHRwczovL2dpdGh1Yi5jb20vc2VhcmNoP3E9cmVwbyUzQWludGVsJTJGYm1h
cC10b29scyUyMG5ldHJjJnR5cGU9Y29kZQ0KPj4gDQo+PiBXZSBjb3VsZCBhcmd1YWJseSBjcmVh
dGUgYSBweXRob24zLW5ldHJjIHN1YiBwYWNrYWdlIHRvIG1pbmltaXplIHRoZSBhZGRlZCBmaWxl
cy4NCj4gDQo+IEkgZG9uJ3Qgd2FudCB0byBhZGQgcHl0aG9uLW1pc2MgZGVwZW5kZW5jaWVzIGxp
a2UgdGhpcy4gUGxlYXNlIGNhbiB3ZQ0KPiB0d2VhayB0aGUgcHl0aG9uIG1vZHVsZSBzcGxpdHRp
bmcgdG8gaGF2ZSBhIHNlcGFyYXRlIHBhY2thZ2UgZm9yIHRoaXMsDQo+IHRoZW4gd2UgY2FuIGRl
cGVuZCB1cG9uIHRoYXQuDQoNCnB5dGhvbjMtbWlzYyBkb2VzbuKAmXQgaGF2ZSBhbnkgaGVhdnkg
ZGVwZW5kZW5jeSBjaGFpbnMsIGl04oCZcyBqdXN0IHRoZSBjYXRjaC1hbGwgb2YgbGFzdCByZXNv
cnQuDQoNClJvc3M=

