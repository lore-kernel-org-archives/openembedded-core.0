Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E2DFC7EE25
	for <webhook@archiver.kernel.org>; Fri,  9 Jun 2023 15:19:29 +0000 (UTC)
Received: from EUR03-AM7-obe.outbound.protection.outlook.com (EUR03-AM7-obe.outbound.protection.outlook.com [40.107.105.76])
 by mx.groups.io with SMTP id smtpd.web10.16104.1686323965010160886
 for <openembedded-core@lists.openembedded.org>;
 Fri, 09 Jun 2023 08:19:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=VXJhKSXY;
 spf=pass (domain: arm.com, ip: 40.107.105.76, mailfrom: ross.burton@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LdXM+vIqDwFDO46Iuso6Upsv09UnEh5X2JyWK4xfapQ=;
 b=VXJhKSXY9Li+TpLpf8NLY+w9wNOwsFSsWoPnhoP1lq/BSngOq20gG3XG8ac82kO4eipf06AfPqi1mIrYBOCKHWQkLIm+syp7nGlrsNTsthAxlYWl3N14goRpvyU0Zv+dpodGOyQibteJ/23d2cOj7PVR9v80KRIgjuQ8j3feaQo=
Received: from DBBPR09CA0002.eurprd09.prod.outlook.com (2603:10a6:10:c0::14)
 by GV1PR08MB8284.eurprd08.prod.outlook.com (2603:10a6:150:a5::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.36; Fri, 9 Jun
 2023 15:19:21 +0000
Received: from DBAEUR03FT064.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:c0:cafe::8b) by DBBPR09CA0002.outlook.office365.com
 (2603:10a6:10:c0::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6477.27 via Frontend
 Transport; Fri, 9 Jun 2023 15:19:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT064.mail.protection.outlook.com (100.127.143.3) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6477.29 via Frontend Transport; Fri, 9 Jun 2023 15:19:20 +0000
Received: ("Tessian outbound 3570909035da:v136"); Fri, 09 Jun 2023 15:19:20 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 4fcb017e76c81918
X-CR-MTA-TID: 64aa7808
Received: from d7f70554b023.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 6408399D-7A9E-49D4-A59C-026C3DB3C453.1;
	Fri, 09 Jun 2023 15:19:14 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id d7f70554b023.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Fri, 09 Jun 2023 15:19:14 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VTo1QP6NUHqLk2mVXL+3oyhCsJ58jkBVKb5doBrwvV3z5NdLCCG9yYXQ5wenEv71+S2CsXZviNBp3tna41aaDdxr5+TLc0lJuWnKCFA44FIgZ0NgWEvaUPLEQ6wB/qzkB21eue32ie14+PGIcYV2l0kcKwcRLomjs51r0Adup1aX1r8yh1BHmX/oQnn2HiqLOm0jM/BqrQdmKkrC9jx+5ucliEemkRJJPF53zs4BZgn09/OlsoqXijrhSA3JMxKoUthkfUIwgOdI3+0FDHahrOvpz8WGNGbUxvxNYyo0zRzC0tGodLkqbTopwyeBeyDP1UihNmZ9cPIzweo4Rjq10g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LdXM+vIqDwFDO46Iuso6Upsv09UnEh5X2JyWK4xfapQ=;
 b=oAnC16b0SdULQVoBk2EL0nF8E9XWhF2cqFmAXCZ237RmI/1sWeZALIxh9KkHWDmVEackKZANo3oE6ZYu4a1IueiZ+MqJXmFNCMWffnYLSShdCTp6a0DYpxqzyATLaTSeyDnxmMCjnAzxPHUJqeMxLpD4aMpGMPaeIMq05T1yLWRHGnIerP5jdMdPNDm5jDm27R0ok33K++UyJdgBvtGfdmqfUjX+sw0fbgW1oD0qmHp6N/FdhuW6gxjFgCOMMJWGs0fmtVN7ePfZRNicIFCxp2KJcbylFcAkAYeLGKXpakSeGn5XwLQNiCXPb8l3d2a2TmMhnzL8Ecu5zbWX9OpVGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LdXM+vIqDwFDO46Iuso6Upsv09UnEh5X2JyWK4xfapQ=;
 b=VXJhKSXY9Li+TpLpf8NLY+w9wNOwsFSsWoPnhoP1lq/BSngOq20gG3XG8ac82kO4eipf06AfPqi1mIrYBOCKHWQkLIm+syp7nGlrsNTsthAxlYWl3N14goRpvyU0Zv+dpodGOyQibteJ/23d2cOj7PVR9v80KRIgjuQ8j3feaQo=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by PR3PR08MB5660.eurprd08.prod.outlook.com (2603:10a6:102:8d::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.39; Fri, 9 Jun
 2023 15:19:13 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::eb3c:9b42:21c9:494e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::eb3c:9b42:21c9:494e%7]) with mapi id 15.20.6455.030; Fri, 9 Jun 2023
 15:19:12 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "ecordonnier@snap.com" <ecordonnier@snap.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] libxcrypt: fix hard-coded ".so" extension
Thread-Topic: [OE-core] [PATCH] libxcrypt: fix hard-coded ".so" extension
Thread-Index: AQHZj9XpFo+ck+1SxES8G7Mu7q2AOa+CTHUAgABfUAA=
Date: Fri, 9 Jun 2023 15:19:12 +0000
Message-ID: <B5654344-F58D-4A5D-8AD7-668A866E9CD4@arm.com>
References: <20230526115155.1953481-1-ecordonnier@snap.com>
 <CAHUKmYbZdJ3kws3ujidWy89pZSM_siGYBbcLzMJtWKbT_6A5dQ@mail.gmail.com>
In-Reply-To: 
 <CAHUKmYbZdJ3kws3ujidWy89pZSM_siGYBbcLzMJtWKbT_6A5dQ@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3731.600.7)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|PR3PR08MB5660:EE_|DBAEUR03FT064:EE_|GV1PR08MB8284:EE_
X-MS-Office365-Filtering-Correlation-Id: b58053c1-78f8-4dab-7844-08db68fce668
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 L/vTXfocUpYZioRxWYZAkl/3YpYj6aJuFUMzmdmu5RDTqW/2Q/nXGZ/W9lE9BGvmDqocHAyBrje0XyzLBduPFfdDzaC6ZgWG7U7id9s5MDMkMlFIW+g9hY7guXUutaTMli7f7KraO3HmbRDQAAb9Cs7ptnGDp3I6fjioGq+xLE63pQUkQ96HcHGFy+UCUyZboLVliE/NplrQ8d46I77P2Rv+7ebRzIXnty8RGDIY+XF4Yg78hby3/NVO/Q2btrrH7AUyG2uYHgoljbFUN8ko6GJ9vJ7fWBctCW7FIGMldLIYnh97x1u8rQm5rTlyxyLgUV1K6DFdGE++l3dqkTL1F8r1o3lFUrtrcLnIGJI1wlHj16sspRbWS75ZZrSRnYC8MdOqNb/txtvC5NXiWD/ywR0lZIKujxrCLOCH+alaOMpRTeIQH5+DPwrAzxtSkxeaui5d+vJ8axAEwbZvDIJK86LLJ2wxGHlHFB3p3MqXbFEku0Y3HF6GRFy1GKGQ8IKSEb71ai6sUsYV0HOJg5cVgcP20YsBQl+XPmjXHjoIrhG42w9RJaOQ4UdS+yXoe/CID92hGPmInbXkC2BT4N1E2kUVJ2jC0bl23SLXMzdSSfzuxa1+vHQiN9FmiGjJ7h5sq8sC+LrIV4avHLG6VFfSNw==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(376002)(366004)(39860400002)(136003)(346002)(451199021)(6506007)(53546011)(6512007)(186003)(966005)(2616005)(26005)(66899021)(6486002)(6916009)(71200400001)(91956017)(66556008)(76116006)(66446008)(36756003)(64756008)(122000001)(66946007)(66476007)(4326008)(478600001)(83380400001)(38070700005)(86362001)(5660300002)(8936002)(8676002)(33656002)(38100700002)(316002)(2906002)(41300700001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <89AE419F27DCC74F8DDDD011F42AF749@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR08MB5660
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DBAEUR03FT064.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	93fed2fc-0ee2-43f9-0853-08db68fce187
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	PuCNIogffskN3qFPetFBLYayGCyVnkv0me27pZ1wLsJE1aJrluINfjhCJ86jeZqa0oOrxak+SceIgUQpM9wHs6R01TFnDZnU13q7UmLp80fJyum3qN4ZnafRw/7DH09kdVBDIe9BRhkMjYwuNTQiWSEVrYADJ2G/6sjXk285HZnvMq4zUbSDCi5kOCqjrtZUwgKj1oF3OhtfQjiajUnJEIKg2A9r6i2fTNvCzk2axk0klfW3W9rRf1ai/9fEiploGRNpuqx/XdF/avqHt6YR+ZXQEAHd8xvhodrsR6hrssAGqb0Zhn4fm6FOO5DmHs2q8PQt4MIj0gS0FR8hahvgPd+YnzM9dJd3kh7yO+IsCWqxoQRJkYTgdu+jHRZDRhaQncuJs5xYMb2IoMtD8WXInN6bgX9NG3i+0RCZFpPG/vHMCNG2ubfIF0CiktEH86LE9N/zAccap8aR7xkaKUoDQQAqrLDEPPgKjg/wftXQfm0/xAKsRi+R2v8+seFOF4azPVaZKwp2/qIg+T3C8aTl7mqG/u1JVxmQLSr4mcylQpi5s2KkrUtAgb28q9YhOaOgcUeayKOcPz8cQ+/EU+9vMvhFjghIcneCFNNX9baHKzHcJaZHnmZqE23rOpL0/xvK24ZMjMrKW51zdoS+jliFxtVnN5CgAr6q8RH4BFcKEGEF2siJpwZHF1nmQHBrDCVQFUmAyfqAxWP/gJBcbxcxV7JbqlqfDHC4kRe+vaS8+2E=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(396003)(346002)(39860400002)(376002)(136003)(451199021)(36840700001)(40470700004)(46966006)(47076005)(83380400001)(966005)(82740400003)(336012)(40480700001)(478600001)(8936002)(8676002)(33656002)(6862004)(4326008)(86362001)(70206006)(70586007)(81166007)(356005)(5660300002)(40460700003)(41300700001)(316002)(6486002)(36756003)(82310400005)(36860700001)(2906002)(6512007)(186003)(26005)(6506007)(53546011)(2616005)(66899021);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2023 15:19:20.9710
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b58053c1-78f8-4dab-7844-08db68fce668
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DBAEUR03FT064.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB8284
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 09 Jun 2023 15:19:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182559

UHJvYmFibHkganVzdCBmZWxsIHRocm91Z2ggYSBjcmFjaywgSeKAmXZlIHF1ZXVlZCBpdCBsb2Nh
bGx5IGZvciB0ZXN0aW5nLg0KDQpTb3JyeSBhYm91dCB0aGF0IQ0KDQpSb3NzDQoNCj4gT24gOSBK
dW4gMjAyMywgYXQgMTA6MzcsIEV0aWVubmUgQ29yZG9ubmllciB2aWEgbGlzdHMub3BlbmVtYmVk
ZGVkLm9yZyA8ZWNvcmRvbm5pZXI9c25hcC5jb21AbGlzdHMub3BlbmVtYmVkZGVkLm9yZz4gd3Jv
dGU6DQo+IA0KPiBIZWxsbywNCj4gaXMgZXZlcnl0aGluZyBPSyB3aXRoIHRoZSBwYXRjaD8gSXMg
dGhlcmUgYW55dGhpbmcgYmxvY2tpbmcgYSBtZXJnZT8NCj4gDQo+IE9uIEZyaSwgTWF5IDI2LCAy
MDIzIGF0IDE6NTLigK9QTSA8ZWNvcmRvbm5pZXJAc25hcC5jb20+IHdyb3RlOg0KPiBGcm9tOiBF
dGllbm5lIENvcmRvbm5pZXIgPGVjb3Jkb25uaWVyQHNuYXAuY29tPg0KPiANCj4gMiBpc3N1ZXM6
DQo+IC0gdGhlIC5zbyBleHRlbnNpb24gaXMgaGFyZC1jb2RlZCwgYW5kIHRoZXJlZm9yZSB0aGUg
bGlieGNyeXQgcGFja2FnZSBjb21waWxlZCB3aXRoDQo+ICAgbWV0YS1kYXJ3aW4gaXMgZW1wdHks
IGJlY2F1c2UgdGhlIGR5bGliIGZpbGVzIGFyZSBub3QgY29udGFpbmVkIGluIEZJTEVTXyR7UE59
DQo+IC0gbm90aGluZyBhY3R1YWxseSBwcm9kdWNlcyBhIGZpbGUgbGliY3J5cHQtKi5zbyAodGhl
IHN5bWxpbmsgZmlsZSBpcyBsaWJjcnlwdC5zbywgd2l0aG91dCBkYXNoKSwgdGh1cw0KPiAgIGRl
ZmluaW5nIEZJTEVTOiR7UE59IG1hbnVhbGx5IHRvIGNvbnRhaW4gbGliY3J5cHQtKi5zbyBoYXMg
bm8gZWZmZWN0Lg0KPiANCj4gU2lnbmVkLW9mZi1ieTogRXRpZW5uZSBDb3Jkb25uaWVyIDxlY29y
ZG9ubmllckBzbmFwLmNvbT4NCj4gLS0tDQo+ICBtZXRhL3JlY2lwZXMtY29yZS9saWJ4Y3J5cHQv
bGlieGNyeXB0LmluYyB8IDYgLS0tLS0tDQo+ICAxIGZpbGUgY2hhbmdlZCwgNiBkZWxldGlvbnMo
LSkNCj4gDQo+IGRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtY29yZS9saWJ4Y3J5cHQvbGlieGNy
eXB0LmluYyBiL21ldGEvcmVjaXBlcy1jb3JlL2xpYnhjcnlwdC9saWJ4Y3J5cHQuaW5jDQo+IGlu
ZGV4IDYxYjAzODEwNzYuLjQ1NGE1NWQ3M2QgMTAwNjQ0DQo+IC0tLSBhL21ldGEvcmVjaXBlcy1j
b3JlL2xpYnhjcnlwdC9saWJ4Y3J5cHQuaW5jDQo+ICsrKyBiL21ldGEvcmVjaXBlcy1jb3JlL2xp
YnhjcnlwdC9saWJ4Y3J5cHQuaW5jDQo+IEBAIC0xNywxMiArMTcsNiBAQCBTUkNfVVJJICs9ICJm
aWxlOi8vZml4X2NmbGFnc19oYW5kbGluZy5wYXRjaCINCj4gDQo+ICBQUk9WSURFUyA9ICJ2aXJ0
dWFsL2NyeXB0Ig0KPiANCj4gLUZJTEVTOiR7UE59ID0gIiR7bGliZGlyfS9saWJjcnlwdCouc28u
KiBcDQo+IC0gICAgICAgICAgICAgICAke2xpYmRpcn0vbGliY3J5cHQtKi5zbyBcDQo+IC0gICAg
ICAgICAgICAgICAke2xpYmRpcn0vbGlib3djcnlwdCouc28uKiBcDQo+IC0gICAgICAgICAgICAg
ICAke2xpYmRpcn0vbGlib3djcnlwdC0qLnNvIFwNCj4gLSINCj4gLQ0KPiAgUyA9ICIke1dPUktE
SVJ9L2dpdCINCj4gDQo+ICBCVUlMRF9DUFBGTEFHUyA9ICItSSR7U1RBR0lOR19JTkNESVJfTkFU
SVZFfSINCj4gLS0gDQo+IDIuMzYuMS52ZnMuMC4wDQo+IA0KPiANCj4gLT0tPS09LT0tPS09LT0t
PS09LT0tPS0NCj4gTGlua3M6IFlvdSByZWNlaXZlIGFsbCBtZXNzYWdlcyBzZW50IHRvIHRoaXMg
Z3JvdXAuDQo+IFZpZXcvUmVwbHkgT25saW5lICgjMTgyNTU4KTogaHR0cHM6Ly9saXN0cy5vcGVu
ZW1iZWRkZWQub3JnL2cvb3BlbmVtYmVkZGVkLWNvcmUvbWVzc2FnZS8xODI1NTgNCj4gTXV0ZSBU
aGlzIFRvcGljOiBodHRwczovL2xpc3RzLm9wZW5lbWJlZGRlZC5vcmcvbXQvOTkxNDk2NjUvNjg3
NTg4OA0KPiBHcm91cCBPd25lcjogb3BlbmVtYmVkZGVkLWNvcmUrb3duZXJAbGlzdHMub3BlbmVt
YmVkZGVkLm9yZw0KPiBVbnN1YnNjcmliZTogaHR0cHM6Ly9saXN0cy5vcGVuZW1iZWRkZWQub3Jn
L2cvb3BlbmVtYmVkZGVkLWNvcmUvdW5zdWIgW3Jvc3MuYnVydG9uQGFybS5jb21dDQo+IC09LT0t
PS09LT0tPS09LT0tPS09LT0tDQo+IA0KDQo=

