Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87FC4EB64DA
	for <webhook@archiver.kernel.org>; Tue,  4 Jul 2023 11:15:58 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.48])
 by mx.groups.io with SMTP id smtpd.web10.56288.1688469351008072795
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Jul 2023 04:15:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=ZjQO6ntY;
 spf=pass (domain: arm.com, ip: 40.107.21.48, mailfrom: ross.burton@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nrGWAVGbi4hPNJk6aMa/KlfcCIKEuFvGJF9M43wF++A=;
 b=ZjQO6ntYexMM4tDDkgVJqKMyhRFX+WMirOf9nz4uCYX/d5niHb0q0hH0lt2neayV5hhUIa8/NucrQmtoXyiM61/xj98mfOrPZvGh/YXVJ4auWqWffM1+ZbU1wx2CMf9BeBZkeL9Z02sAhUVHo6SX3ThXMT6IWPNdoNdUyFbRlPU=
Received: from AS4P251CA0026.EURP251.PROD.OUTLOOK.COM (2603:10a6:20b:5d3::15)
 by AS1PR08MB7609.eurprd08.prod.outlook.com (2603:10a6:20b:474::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6544.24; Tue, 4 Jul
 2023 11:15:47 +0000
Received: from AM7EUR03FT026.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:5d3:cafe::cf) by AS4P251CA0026.outlook.office365.com
 (2603:10a6:20b:5d3::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6544.30 via Frontend
 Transport; Tue, 4 Jul 2023 11:15:47 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT026.mail.protection.outlook.com (100.127.140.154) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6565.18 via Frontend Transport; Tue, 4 Jul 2023 11:15:47 +0000
Received: ("Tessian outbound c08fa2e31830:v142"); Tue, 04 Jul 2023 11:15:46 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 850087c3a138db46
X-CR-MTA-TID: 64aa7808
Received: from 9040a3806460.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id EE28B7A9-2A77-4810-9406-4E3F12440433.1;
	Tue, 04 Jul 2023 11:15:39 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 9040a3806460.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Tue, 04 Jul 2023 11:15:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VgmHEpERSy1YlPtZHEem0JMR/5PTkdWUQJ/YErcKCtDRlE28jiZRCSkK+sIfo0sJgaSdMYxPHZeeOF0M9k7xL5S9B62Ly7UjHutiYttJY0mazObHDzz0cExdAKRGyG8sNKdCvds4WXPv7f5uLdQWmBhQQOlWIMU+V9DCBfh0OOt/h/XD+Sl0W8k2ySmW4369pzGAVtGDjLC38ltPYTbwH8XUag1YtzJhAf2p9chbf2miIR8CJLI2X4uFjOVvrJdBJ1B7mW8AXYLCtK9bHw3WQ0FUPA3ypahTZUSLme/5MA7UovhE6MtykiKKIOuDAutriN3HIpzqWrLQ8fG75ApkKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nrGWAVGbi4hPNJk6aMa/KlfcCIKEuFvGJF9M43wF++A=;
 b=ejkBWu+8ESWrdR4RbziVZKWBXLXAfpbWppE/wNcQwZaatcyIrrsvdiR7gvSLYI/qDOeryRFpi6nDB3H9Z9qiV8BJ9CLl3txpLw0bnuFXMSVl6On9MXPp+1qlrUvj7bhdxVRDEuo26BL3ffJ+/7bzi1BDl36FochjkeSZQ7ttepNNZEltS7Ez7+dh7pIsmOPe0cLxOpIkn3kfLqDo7oWn7122zaYuOL5e5i9xodG4moUM86+W9vXbXBHTuYROKgYVlbISuZfmEVjuBk4KXy07rtqDc3tbE0SnnczKQhiz3luf7miLUpGdgT5VAc9mvX+HcXNgl6XFsSp7qXBaDtu3hg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nrGWAVGbi4hPNJk6aMa/KlfcCIKEuFvGJF9M43wF++A=;
 b=ZjQO6ntYexMM4tDDkgVJqKMyhRFX+WMirOf9nz4uCYX/d5niHb0q0hH0lt2neayV5hhUIa8/NucrQmtoXyiM61/xj98mfOrPZvGh/YXVJ4auWqWffM1+ZbU1wx2CMf9BeBZkeL9Z02sAhUVHo6SX3ThXMT6IWPNdoNdUyFbRlPU=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by AS1PR08MB7609.eurprd08.prod.outlook.com (2603:10a6:20b:474::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6544.24; Tue, 4 Jul
 2023 11:15:38 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::30b4:3110:b02d:7f21]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::30b4:3110:b02d:7f21%7]) with mapi id 15.20.6544.024; Tue, 4 Jul 2023
 11:15:38 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "tgamblin@baylibre.com" <tgamblin@baylibre.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][PATCH] python3: add cgitb, zipapp ptest dependencies
Thread-Topic: [OE-core][PATCH] python3: add cgitb, zipapp ptest dependencies
Thread-Index: AQHZqsKwCzw4aogjJUCuEU4hRCa7jq+pfCaA
Date: Tue, 4 Jul 2023 11:15:37 +0000
Message-ID: <6B91D07E-1A6B-46C4-8375-8E948E3A9478@arm.com>
References: <20230629194813.1171680-1-tgamblin@baylibre.com>
In-Reply-To: <20230629194813.1171680-1-tgamblin@baylibre.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3731.600.7)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|AS1PR08MB7609:EE_|AM7EUR03FT026:EE_|AS1PR08MB7609:EE_
X-MS-Office365-Filtering-Correlation-Id: b34ad1b1-66eb-475a-31fb-08db7c800441
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 2AFhlOtC0dEpqEIKWiTnHMQO3joFcOu8JbXK1Fa3tBFNpbxH0MZHIkLahShgVPWbD246++iGxhm5ukUZcdQyoZGJS/vHZxI7KdDJdbThdIvtMHlpXf7RVCXiydyqBZOvQBXB7Bef5d91wweNHvOvu5t/fTkDcupdFexKPy63IAtfghclWWyKO39RyTtPsN5kIBDHzMDgBcREFupt5YKkJHhrKlXqB3VO5jSqhhUV3wJc3P8owlG4jhNtbAdMoKCkMW4nhf0b0JiKwrYRdPMnb/R+XmIu0HjtOI7R7EVNLQdMwyV1S/itY6NdpLR7bqROntlCExe04ebxX7vVctwZQqCaS9vGX+banQPpa4ISOh0Bnthhpv15+oB/CH7kL3HLSE6LzFQ4T4qi3Fms43tg6ChESA7Tjv9B8i+hlhrV0lLBkw8jLLDK4jY9Thyq8JsxV8btbERJhptG8oVUoL+9msBGB9FlKz+3BsoBQrC4QFoK3MxsDuAcW/cv4nObWbTfEpePYwjBrmwK21Lt4nd0FO4yG8q8Grg9yRytWRMBhcBrTrhxRVDJNiPsxBaYKUGd8SHzLNh6JB8Rfi77O3fr00PEtwR5OVgbV6iSJhONL7oxOlWwc/RknVmy5E+SKtNb3Rh8WhOHPX+ze56DU2R2Qg==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(396003)(366004)(346002)(376002)(136003)(451199021)(38070700005)(4744005)(2906002)(41300700001)(5660300002)(8676002)(8936002)(33656002)(36756003)(86362001)(186003)(2616005)(478600001)(26005)(6512007)(6506007)(71200400001)(76116006)(6486002)(91956017)(122000001)(316002)(6916009)(66446008)(4326008)(66476007)(64756008)(66946007)(66556008)(53546011)(38100700002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <1ACA76D07A00DD4F827A40095DC97B17@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR08MB7609
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM7EUR03FT026.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	42056152-75fa-417d-0875-08db7c7ffec6
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	/yKA9tjlpMm0ApG8iHMmS1DW/s+fFJgJEDE+LQc60of2EFxiu/nNR8oAlNR844qcLExWwCIHvsqakwWbXwY5F5gCMunbRhK+O04TFd8daC8olQQf69tXKHNSUKDhOBHO3I+F961jnY/VpgKYOwUe4pa8VPyvMYFZ2uIGFqqTy6ZRTm4zxp2PDSnAiCfb/4ODbznWDJU5tIv++vD4ou1Bv+/wbPdNDRE7LJxptZjenOPnQoUOHeDYNUey5R/grLoBHVdeKLTYFYB2JbNHEjyZ2GRrr+Oq68GPbG0Aq4NfasFQCpZzlh2DjTBuvlHxztWs9e7OUMx2xx4ZhhJHcCd+phDpbEkiiJyIpQHcv/fTM3JJ4F+qGPA4+CKQjcTaZIrbX+uIaez1kwR0DUSK3R/NZEtruHfjmvCRxNkbvadYwa4qRTYY52FFNTcgNWeU2vLCH37XnjM9oZUy3b8KU2xWZtLlAUs+NJMjqw5zvbxzFg4xLuva/6cnm0V1GNVEmu2NpTv9y6yZ1MwSP5Q2dl376RAAJhUwL4GfAB57JpKUX7wlEAoTHiqzOs4ZjgLd/eewPBwdBxQTwXH8q8OPW+MG5lBYMo/10EF4rwYLGtNO4syptK0N2FgczaZiGVT12uzQQBf0KoSTYpy0LB+HeL1Q8dV1fS00+PHZWwQAVqFQEWNib4FcJqrYbewEYDIgxaeRsiHjFPrsxyFM7G4V27N73cvd82Ivy4c1TDNTprwUyaIbl9hiSuMZil/uS8rlBE+D
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(396003)(346002)(376002)(136003)(451199021)(46966006)(40470700004)(36840700001)(40460700003)(4744005)(2906002)(41300700001)(6862004)(5660300002)(8676002)(8936002)(82310400005)(33656002)(36756003)(40480700001)(86362001)(186003)(2616005)(478600001)(26005)(6512007)(6506007)(82740400003)(6486002)(70206006)(47076005)(316002)(70586007)(4326008)(36860700001)(53546011)(81166007)(336012)(356005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jul 2023 11:15:47.1471
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b34ad1b1-66eb-475a-31fb-08db7c800441
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM7EUR03FT026.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR08MB7609
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Jul 2023 11:15:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183828

T24gMjkgSnVuIDIwMjMsIGF0IDIwOjQ4LCBUcmV2b3IgR2FtYmxpbiB2aWEgbGlzdHMub3BlbmVt
YmVkZGVkLm9yZyA8dGdhbWJsaW49YmF5bGlicmUuY29tQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+
IHdyb3RlOg0KPiANCj4gV2l0aG91dCB0aGVzZSwgdGVzdF9jZ2l0YiBhbmQgdGVzdF96aXBhcHAg
Ym90aCBmYWlsIHdoZW4gcnVubmluZyB0aGUNCj4gcHl0aG9uMyBwdGVzdHMuIFNpbmNlIGNnaXRi
IGlzIGRlcHJlY2F0ZWQsIEkgaGF2ZSBvbmx5IGFkZGVkIGl0IHRvDQo+ICR7UE59LXB0ZXN0J3Mg
UkRFUEVORFMgc3BlY2lmaWNhbGx5LCBidXQgemlwYXBwIGlzIG1vcmUgY3VycmVudCBhbmQNCj4g
dGhlcmVmb3JlIEkndmUgcHV0IGl0IGluIHRoZSAke1BOfS1taXNjIGxpc3QgaW5zdGVhZC4NCg0K
VGhlIFJERVBFTkRTIG9uIG1pc2MgdG8gb3RoZXIgbW9kdWxlcyBzaG91bGQgb25seSBiZSBuZWVk
ZWQgc28gdGhhdCBtb2R1bGVzIGluIG1pc2MgYWN0dWFsbHkgd29yay4NCg0KSW4gdGhpcyBjYXNl
LCB0aGUgcHJvYmxlbSBpcyB0aGF0IHRlc3RfemlwYXBwIGZhaWxzIGJlY2F1c2UgaXTigJlzIG5v
dCBpbnN0YWxsZWQsIHNvIHRoZXNlIHNob3VsZCBiZSBkZXBlbmRlbmNpZXMgb24gdGhlIHB0ZXN0
IHBhY2thZ2UgdG8gdGhlIHNwbGl0LW91dCBtb2R1bGVzLCBhbmQgbm90IGEgY2hhbmdlIHRvIHRo
ZSAtbWlzYyBSREVQRU5EUy4NCg0KQmFzaWNhbGx5LCBhZGQgdGhlIGRlcGVuZHMgdG8gLXB0ZXN0
LCBhbmQgbGVhdmUgLW1pc2MgYXMgaXQgaXMuDQoNClJvc3M=

