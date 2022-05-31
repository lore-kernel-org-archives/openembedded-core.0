Return-Path: <simone.weiss@elektrobit.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51E0AC433F5
	for <webhook@archiver.kernel.org>; Tue, 31 May 2022 05:45:05 +0000 (UTC)
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (NAM12-BN8-obe.outbound.protection.outlook.com [40.107.237.50])
 by mx.groups.io with SMTP id smtpd.web08.45997.1653975900851388920
 for <openembedded-core@lists.openembedded.org>;
 Mon, 30 May 2022 22:45:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@elektrobit.onmicrosoft.com
 header.s=selector2-elektrobit-onmicrosoft-com header.b=RD6W/pnn;
 spf=pass (domain: elektrobit.com, ip: 40.107.237.50,
 mailfrom: simone.weiss@elektrobit.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=kOfWA5CwasVoMpTajBzovC/9wO88wxeplbrjBHv04sZvcT02O5x1IfN+v8c8+3auW7XNeh8H39Y78vRp6329lOsiL3pRFXc8YE3G+rXr/k00BYL7NZoQk06X7jhBCEBVUTvq/agk4M3R3BDgOvxMnVnta0s848iX9/B4p+1yrKuTck/BFKzNbLTPAGguB5a/eLkO6qbZo9KBaLUAN0FnzbwNNyPHsbbZp0e+qqr/Q5FYeU4C3R3pxCUwOgL4gbUYtrLAZw7bDkB+DOi6fdAQvuCWHjG8UM9YSU95gOuhP3B1yhGAV2MoWp/U56ukBccLOt8C2Mw0bDHe8hI2G/TLzw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=05NYqaJxmKUHcwBl66GTeb0g2Hxr41Z7wOY9YSh6cL0=;
 b=m3TDnalv/RcWeAz7NiO3699qGFxWNAO4iQ5CmXiu+wllb+szPHlRIgJazpUOTMYJOA5O+fN64Eda3IGYWG6xj12DiXb/tQBgp44tCq6ifLpIlDcaQ/DsAyPx0GzbbpIQdfy3CEpCXboaJkZsoVfyh0uaXOuc9IbjczWyTJZe3oFVY+E9ngdrtonm5qH9PNII2+g33ZL3BwBG5EEW7ZtAqBO+ZflBVaidzrbtMXFKSbcFj0V+RROkWkGX8eq5E+uVRG8SIwTQh0W5SDGRg2XxitdNbEmnlLCsoU0+8waeaZ8BJTt8wbdiF/g5dEqpRjzTeqBBmitwwOHS9BnI/c1jBg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=temperror (sender ip
 is 4.79.107.243) smtp.rcpttodomain=bootlin.com smtp.mailfrom=elektrobit.com;
 dmarc=temperror action=none header.from=elektrobit.com; dkim=pass (signature
 was verified) header.d=elektrobit.onmicrosoft.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=elektrobit.com] dkim=[1,1,header.d=elektrobit.com]
 dmarc=[1,1,header.from=elektrobit.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=elektrobit.onmicrosoft.com; s=selector2-elektrobit-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=05NYqaJxmKUHcwBl66GTeb0g2Hxr41Z7wOY9YSh6cL0=;
 b=RD6W/pnnmfBRuwLvhPzU4zg8H1CkWGLeetshlkRT+ImF+aJniR3oketNIrRC4y2MhGC6i3cF9vgYlnNv52sTX1PakOx3SLp5c5YuGhmiYowFc0hA8fd0QrsRZLpMrGcS24i3QV9zH0w9lxjIhggS8frPwZE5TuYFzC+2Cc/pkYI=
Received: from DM3PR03CA0015.namprd03.prod.outlook.com (2603:10b6:0:50::25) by
 PH0PR08MB6986.namprd08.prod.outlook.com (2603:10b6:510:93::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5293.13; Tue, 31 May 2022 05:44:58 +0000
Received: from DM6NAM12FT030.eop-nam12.prod.protection.outlook.com
 (2603:10b6:0:50:cafe::66) by DM3PR03CA0015.outlook.office365.com
 (2603:10b6:0:50::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.13 via Frontend
 Transport; Tue, 31 May 2022 05:44:58 +0000
X-MS-Exchange-Authentication-Results: spf=temperror (sender IP is
 4.79.107.243) smtp.mailfrom=elektrobit.com; dkim=pass (signature was
 verified) header.d=elektrobit.onmicrosoft.com;dmarc=temperror action=none
 header.from=elektrobit.com;
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of elektrobit.com: DNS Timeout)
Received: from usbth1es003.ebgroup.elektrobit.com (4.79.107.243) by
 DM6NAM12FT030.mail.protection.outlook.com (10.13.178.167) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5314.6 via Frontend Transport; Tue, 31 May 2022 05:44:56 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2106.outbound.protection.outlook.com [104.47.17.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by usbth1es003.ebgroup.elektrobit.com (Postfix) with ESMTPS;
	Mon, 30 May 2022 22:44:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G2Z7Bz+1zMqHqa9RRryQ3xGn9VQ7oJC8vSyc3FlZZz406aPnK/vspQ/KOoc5HglbnbE+roKNkTSs4XwdW8j9UNdhyrJZNGXnKDL4TMyam3ltPsjhYeuQcgVpLkvZ4i9rWMSkN9mCGnreUUY0piNO1o05dx8OvQtWWxhkkGDgyHo9GfFgcG7tFzTuvVzG+6OMaXEfxca/i0OZhvZegdGDCoXvQ3IC6uZlleIOhoPGOVJyP0izDJHy0d7ohS4edBhAby6Y1iTB5qztyZnzi7Vbj8brVD5JazUT0CAMRWBJDbtd6KwZqqGBTbmVPc0wdy9aQ63n9bhjWFYWt3+hviqzeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=05NYqaJxmKUHcwBl66GTeb0g2Hxr41Z7wOY9YSh6cL0=;
 b=cm8VpiJzvTviPrYozlNp/MHrkOuxBItn9UzewCFyZJb8vs89Gh3IrBl1RZQ8jREAahyxdmYECjTcSdNsB1hBEplvq42PeP32NtnBspA2jr1sSy0auoTnuwaW0UMW491WIYupXtA8JEuxWlFF5I9a6ECG3aSlVZNX0OaSSkYWBBlfchYsVRxwIthnPETZhqH33xjQsXv69xbtYgWmeRnpkvI7jNtksjMK69eT5w8MDAF1DLShsd1g+9j2TAs8mLmdPivXXpMsJBWSxNzI0WQr+Ldw3k9AinbbwrQrblq7YSumvr96lvnUxxZhDEmJzydfsmHo8jWKQJkBuGG2b4k7jg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=elektrobit.com; dmarc=pass action=none
 header.from=elektrobit.com; dkim=pass header.d=elektrobit.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=elektrobit.onmicrosoft.com; s=selector2-elektrobit-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=05NYqaJxmKUHcwBl66GTeb0g2Hxr41Z7wOY9YSh6cL0=;
 b=RD6W/pnnmfBRuwLvhPzU4zg8H1CkWGLeetshlkRT+ImF+aJniR3oketNIrRC4y2MhGC6i3cF9vgYlnNv52sTX1PakOx3SLp5c5YuGhmiYowFc0hA8fd0QrsRZLpMrGcS24i3QV9zH0w9lxjIhggS8frPwZE5TuYFzC+2Cc/pkYI=
Received: from PAXP195MB1231.EURP195.PROD.OUTLOOK.COM (2603:10a6:102:1a3::10)
 by AM9P195MB1029.EURP195.PROD.OUTLOOK.COM (2603:10a6:20b:1f9::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.13; Tue, 31 May
 2022 05:44:52 +0000
Received: from PAXP195MB1231.EURP195.PROD.OUTLOOK.COM
 ([fe80::a889:6738:a0f6:88bf]) by PAXP195MB1231.EURP195.PROD.OUTLOOK.COM
 ([fe80::a889:6738:a0f6:88bf%9]) with mapi id 15.20.5293.019; Tue, 31 May 2022
 05:44:52 +0000
From: =?utf-8?B?V2Vpw58sIFNpbW9uZQ==?= <Simone.Weiss@elektrobit.com>
To: "luca.ceresoli@bootlin.com" <luca.ceresoli@bootlin.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "Tomerius, Kai"
	<Kai.Tomerius@elektrobit.com>
Subject: Re: [OE-core] [PATCH] json-c: Add ptest for json-c
Thread-Topic: [OE-core] [PATCH] json-c: Add ptest for json-c
Thread-Index: AQHYdGWYnWDwc2iL1EmTz9kSTOnkRK04ekyA
Date: Tue, 31 May 2022 05:44:52 +0000
Message-ID: <62cbadbf7ef19770831fd327c74c1e6066dd7843.camel@elektrobit.com>
References: 
 <5e05e3aa-6b3f-44b1-85d1-8cd220310306@denue6es010.ebgroup.elektrobit.com>
	 <20220530224111.7ac1b7d4@melee>
In-Reply-To: <20220530224111.7ac1b7d4@melee>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=elektrobit.com;
X-MS-Office365-Filtering-Correlation-Id: fcbaf1e0-9865-4bbf-4ba6-08da42c8b1ca
x-ms-traffictypediagnostic: 
	AM9P195MB1029:EE_|DM6NAM12FT030:EE_|PH0PR08MB6986:EE_
X-Microsoft-Antispam-PRVS: 
	<PH0PR08MB698630E0768F65582EF052E2E2DC9@PH0PR08MB6986.namprd08.prod.outlook.com>
X-SM-outgoing: yes
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 c/SmMzAQTNsamYDMhYLaEBx5w38amOwPsbHIOzoiwenCArfMjRHUwkTduRuUHN1/w6zIYK0xWxCmy3Hkb2wKgruWx0M7rC6aoE2w6Zck9ETLcKVMapy2fMFQDlx5CJZsHqN8zvxVqi88jVICmfu69FDpCTXffpIDnxhJiidQIWinCfcdgn0hysXRG3Z6BhGxHGtJpOqiFfXqETrYerxp6rfQZyj7xjDQT1dq2ZA6zTnKV09/poFt94qWiriW/zQjkKejQE97Iz0X1BmlcJ+YfkEfPcpwO8K2IbAY/aZ5uvYbabSxfQz4GxEXXt4RXPGSkK+ccgnW04U0qRicBJ+6du7geIVdadN/OCFG3u8iXOGBeD5u4J8WYnwnq8SR6h4APG7fIk48J9D/4a9fQ2JwAYj5zIbuBKP5Pt09g8+LhzLoGSslhRD9APvqLhGlKZpcDPT57g9QmZiEkUT3EIPSyC7JlquBXbtXYLZLBTrddX9svHTxvIhYT6LrYQfToS+g6J8OEcHahh1VAR5ZTmuqBqT6AwzDRybF16KRETM1wknzYf+SYK56RvBU1p2P7cs8IBcv7F6/D0vXrmtj1l09JVtn42KSQGGs1bH4jhMVI1dnDmyT9vvlsDPPVcmMtgLyPHeEUzmr5TVT+OTbJi4gkLklqvpZG0JhLcKrsSY+Q88prfl4v41fYtgWxaGBdAez0xM2EGeVoebzMG9w3XaOtKRRWin26nnc28WKBVcsjh5lLcDEhLepzN28Ani5GS5IlPVlL0BPQPpdz40L7nwLPZ4mlbeMHKYsEh8dMB2J5PU=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXP195MB1231.EURP195.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(66946007)(71200400001)(66556008)(66476007)(64756008)(2616005)(8676002)(91956017)(966005)(66446008)(6486002)(2906002)(107886003)(186003)(76116006)(122000001)(45080400002)(5660300002)(83380400001)(86362001)(36756003)(6512007)(6506007)(8936002)(85182001)(38070700005)(38100700002)(6916009)(316002)(54906003)(508600001)(4326008);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <28198448EEED4E418A4B028C4DBD0F56@EURP195.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9P195MB1029
X-SM-smarthost: [elektrobit-com.mail.protection.outlook.com]
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DM6NAM12FT030.eop-nam12.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	3323f927-2a03-4cb9-9ab5-08da42c8aee5
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	fc0lDJQ0hC9cMZj0VliztRnRmg3lrlAZxTwMdJMJGNOo4GPvsNWZg9qiz+6rilg8yJMPrsqQUY7PY3gBdEWIH5VrQORT/vcSF/QRefxfVGuasMtbgEy2Puzlw7SeMDh6PXB3AsAOtUnFE3HJ7Nb18cwdI7op5ZMts+i2VnSwUSDbyBST1PRio7Ki4DVq6/In+U15NDpNgb/b1urDoZBCtfLChR0pALaJbBtQ4eCFNB0+yiAOQdtuTryHLNTB/4wSlmF91SSgN3Y9TQufukv/Zo3gl3I3XA2NF09o1UW1bMWm3tfNwYzM138axxgaEzyQgXb17tOILr9BNj0zmPFLV9O8WQDgWDx8UYkE1ce4JHSXFZhgBSvfNv2zd1Eq4L9Qa0/xwgUj7pPaizaSSC5r5dmZ4oImfI80yHulxFizqaQBQxhh752vFMEzh73Zqk9J/B3XDEF3NOoSl+YEwoPzswZ9l1tECFlyCNsD5/v0xeKl0JifNdeBnA6lIooV4IPromELEN9KR8QlVSwzXqNaJ4Z3Kr9rZsPdT5z9Piax/zWIWiiuB9i2UhdxkHS5FOyu1lsGG4aRBvYKB569nOyVn03k+WwkAXWJ202qI39TZvixlHJgrqT+he6poGzdn6LC8K6HFN84T+84hpEJbBfmO7OOvYPOFMTW0SFfCaiUGlkif7CrQjJc0ArC6OWOvGyenDyHKzrKpbgmBDLaWeo3/e7SPHUDPJfhG5MKq3DRHiSUyKNmfVERNualSk2G++ycdlL2O0gQKRG7TOxePg0a6+1IwIkZg+XI6emMoVffvrs=
X-Forefront-Antispam-Report: 
	CIP:4.79.107.243;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:usbth1es003.ebgroup.elektrobit.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230001)(4636009)(36840700001)(40470700004)(46966006)(26005)(86362001)(40460700003)(6512007)(966005)(508600001)(45080400002)(8676002)(356005)(6916009)(63370400001)(6486002)(316002)(5660300002)(6506007)(4326008)(85182001)(54906003)(36756003)(83380400001)(36860700001)(186003)(63350400001)(8936002)(2906002)(336012)(2616005)(82310400005)(70586007)(107886003)(70206006)(81166007)(47076005)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: elektrobit.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 May 2022 05:44:56.6626
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 fcbaf1e0-9865-4bbf-4ba6-08da42c8b1ca
X-MS-Exchange-CrossTenant-Id: e764c36b-012e-4216-910d-8fd16283182d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=e764c36b-012e-4216-910d-8fd16283182d;Ip=[4.79.107.243];Helo=[usbth1es003.ebgroup.elektrobit.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DM6NAM12FT030.eop-nam12.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR08MB6986
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 31 May 2022 05:45:05 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166303

SGksDQoNCnRoYW5rcyBmb3Igbm90aWZ5aW5nLCBJJ2xsIHNlZSBpZiBJIGNhbiBmaXggdGhpcy4u
Lg0KDQpLaW5kIFJlZ2FyZHMsDQoNClNpbW9uZQ0KT24gTW9uLCAyMDIyLTA1LTMwIGF0IDIyOjQx
ICswMjAwLCBMdWNhIENlcmVzb2xpIHdyb3RlOg0KPiBDQVVUSU9OOiBUaGlzIGVtYWlsIG9yaWdp
bmF0ZWQgZnJvbSBvdXRzaWRlIG9mIHRoZSBFbGVrdHJvYml0DQo+IG9yZ2FuaXphdGlvbi4gRG8g
bm90IGNsaWNrIGxpbmtzIG9yIG9wZW4gYXR0YWNobWVudHMgdW5sZXNzIHlvdQ0KPiByZWNvZ25p
emUgdGhlIHNlbmRlciBhbmQga25vdyB0aGUgY29udGVudCBpcyBzYWZlLg0KPiANCj4gDQo+IEhp
IFNpbW9uZSwNCj4gDQo+IElsIGdpb3JubyBNb24sIDMwIE1heSAyMDIyIDExOjQ3OjQ1ICswMjAw
DQo+ICJTaW1vbmUgV2Vpc3MiIDxzaW1vbmUud2Vpc3NAZWxla3Ryb2JpdC5jb20+IGhhIHNjcml0
dG86DQo+IA0KPiA+IEFsc28gYWRkIGEgc2NyaXB0IGZvciBleGVjdXRpbmcgdGhlIHB0ZXN0cy4g
QWxsIHRlc3RzIHdlcmUNCj4gPiBzdWNlc3NmdWwgb24gYSB0cmlhbA0KPiA+IHJ1bi4gQWxzbyBh
ZGQgYSBzbWFsbCBzY3JpcHQgZm9yIHJ1bm5pbmcgdGhlIHRlc3RzLg0KPiA+IA0KPiA+IFNpZ25l
ZC1vZmYtYnk6IFNpbW9uZSBXZWnDnyA8c2ltb25lLndlaXNzQGVsZWt0cm9iaXQuY29tPg0KPiA+
IFNpZ25lZC1vZmYtYnk6IEthaSBUb21lcml1cyA8a2FpLnRvbWVyaXVzQGVsZWt0cm9iaXQuY29t
Pg0KPiANCj4gVGhpcyBwYXRjaCBjYXVzZXMgcmVwcm9kdWNpYmlsaXR5IGJ1aWxkIGZhaWx1cmVz
Og0KPiANCj4gDQpodHRwczovL25hbTEyLnNhZmVsaW5rcy5wcm90ZWN0aW9uLm91dGxvb2suY29t
Lz91cmw9aHR0cHMlM0ElMkYlMkZhdXRvYnVpbGRlci55b2N0b3Byb2plY3Qub3JnJTJGdHlwaG9v
biUyRiUyMyUyRmJ1aWxkZXJzJTJGMTE3JTJGYnVpbGRzJTJGOTM2JTJGc3RlcHMlMkYxMiUyRmxv
Z3MlMkZzdGRpbyZhbXA7ZGF0YT0wNSU3QzAxJTdDJTdDZTMxN2Q4YjM2NWI0NDg2ZmJiY2UwOGRh
NDI3Y2JmN2IlN0NlNzY0YzM2YjAxMmU0MjE2OTEwZDhmZDE2MjgzMTgyZCU3QzAlN0MwJTdDNjM3
ODk1NDAwODE1NDI0MzA2JTdDVW5rbm93biU3Q1RXRnBiR1pzYjNkOGV5SldJam9pTUM0d0xqQXdN
REFpTENKUUlqb2lWMmx1TXpJaUxDSkJUaUk2SWsxaGFXd2lMQ0pYVkNJNk1uMCUzRCU3QzMwMDAl
N0MlN0MlN0MmYW1wO3NkYXRhPWM3VCUyRmk1Tk1ORDhpQlUzMUJBak9aZllkSWd5cVU0NnlQdGls
UUM3WiUyRkZ3JTNEJmFtcDtyZXNlcnZlZD0wDQo+IA0KPiAtLQ0KPiBMdWNhIENlcmVzb2xpLCBC
b290bGluDQo+IEVtYmVkZGVkIExpbnV4IGFuZCBLZXJuZWwgZW5naW5lZXJpbmcNCj4gDQpodHRw
czovL25hbTEyLnNhZmVsaW5rcy5wcm90ZWN0aW9uLm91dGxvb2suY29tLz91cmw9aHR0cHMlM0El
MkYlMkZib290bGluLmNvbSUyRiZhbXA7ZGF0YT0wNSU3QzAxJTdDJTdDZTMxN2Q4YjM2NWI0NDg2
ZmJiY2UwOGRhNDI3Y2JmN2IlN0NlNzY0YzM2YjAxMmU0MjE2OTEwZDhmZDE2MjgzMTgyZCU3QzAl
N0MwJTdDNjM3ODk1NDAwODE1NDI0MzA2JTdDVW5rbm93biU3Q1RXRnBiR1pzYjNkOGV5SldJam9p
TUM0d0xqQXdNREFpTENKUUlqb2lWMmx1TXpJaUxDSkJUaUk2SWsxaGFXd2lMQ0pYVkNJNk1uMCUz
RCU3QzMwMDAlN0MlN0MlN0MmYW1wO3NkYXRhPXV2ZmQ3dnlTOVkzM1V0QVdIUFJOJTJCN3hMT1F4
NCUyQndtQnJNbzlIN0NJZXZ3JTNEJmFtcDtyZXNlcnZlZD0wDQo=

