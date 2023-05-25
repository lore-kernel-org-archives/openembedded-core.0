Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8BD87C77B7A
	for <webhook@archiver.kernel.org>; Thu, 25 May 2023 19:09:51 +0000 (UTC)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (EUR04-DB3-obe.outbound.protection.outlook.com [40.107.6.69])
 by mx.groups.io with SMTP id smtpd.web10.20453.1685041786711875654
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 May 2023 12:09:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=X5ckwJsF;
 spf=pass (domain: arm.com, ip: 40.107.6.69, mailfrom: ross.burton@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ol9JEicQDSn9BUh6/YD9q9zlQIY2M+ytc0fGdOWiTBo=;
 b=X5ckwJsFAFSTAnD9j68zft8uU5jpId7ub53rpvGK0YWu49zyWnxC3xpY0iQMUFXx4hkWp6J8DrwyuwgRjFwHPZvm3qIPXk8qiLYsmaMRiGjZvDVK0z4x2hZva6+4R+SiUhuOO3dNXWy9PH8XbCiQv0F17cs0+wSzj6tbxl+JLcE=
Received: from AM9P195CA0010.EURP195.PROD.OUTLOOK.COM (2603:10a6:20b:21f::15)
 by AS8PR08MB8970.eurprd08.prod.outlook.com (2603:10a6:20b:5b3::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.15; Thu, 25 May
 2023 19:09:43 +0000
Received: from AM7EUR03FT012.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:21f:cafe::ac) by AM9P195CA0010.outlook.office365.com
 (2603:10a6:20b:21f::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.15 via Frontend
 Transport; Thu, 25 May 2023 19:09:43 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT012.mail.protection.outlook.com (100.127.141.26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6433.17 via Frontend Transport; Thu, 25 May 2023 19:09:42 +0000
Received: ("Tessian outbound 3570909035da:v136"); Thu, 25 May 2023 19:09:42 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 453e8edd947ebb81
X-CR-MTA-TID: 64aa7808
Received: from d77cf5b9e257.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id DEB9D602-278C-443D-8FF1-330AE8960364.1;
	Thu, 25 May 2023 19:09:36 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id d77cf5b9e257.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 25 May 2023 19:09:36 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T4XHrfJp/ENg1WoNjOqxiCWBBWYXUhFITlGCci6mk7RCjjKcYMfwIlJDVVT6yTTO+PixPXspWIc7uKWoQXnBr9MjlZpxYZGZZIG1y3r6X6bQb7Y3eAH+l1fmCI2UtmM8jKKTBr36TGueT2BAov9LvoFRi4twdyljOO5QEyd8wJb+EtlgXgZPSxrjmycrfSmQ0h5De2AVXKVAJZXz++9AYiOrd80USmGDodZ/+TblsUNS9n3bsnlj4o7x34rv5l/PMzBFiV3Xatk0atxBwxC7uH/F06JwVcqe/2x1RLqhZFnznFiVLg15vo+pKdK3h90vt4UXcuTgQA1sDNw24vaMSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ol9JEicQDSn9BUh6/YD9q9zlQIY2M+ytc0fGdOWiTBo=;
 b=HMD7M3+N6lqDMUSqPRcrZEc/5vaJIU663E/8bbqH0gbON+YsadsIfvvr0zq5vaYkn3ZFpN2KlpgxGNOaKqWAEin+D9ZE8DyP+OkpunCaWlLJPK84UYS7D84VArzSnC+Qfz4b7uP9nC4G3WBW8S0Ol7Ck4IOr/5XuOfmqsAQZrJaLRx0PxZ566uEtyyXo4O0nWdZ/jjaF7xhdQEEYlv0FiH09LifQ+YlSL+0slpRhAVx+gqmaXfaNK9EMgGueZvdvqNxwbZVl0DwTxhC/k+a7MaGhZt3PbHSUjWWcsAKRLbuplly9MdKqYNytxA+hbPEVxzgVllhf937Z8mHdUgghEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ol9JEicQDSn9BUh6/YD9q9zlQIY2M+ytc0fGdOWiTBo=;
 b=X5ckwJsFAFSTAnD9j68zft8uU5jpId7ub53rpvGK0YWu49zyWnxC3xpY0iQMUFXx4hkWp6J8DrwyuwgRjFwHPZvm3qIPXk8qiLYsmaMRiGjZvDVK0z4x2hZva6+4R+SiUhuOO3dNXWy9PH8XbCiQv0F17cs0+wSzj6tbxl+JLcE=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by DB9PR08MB6713.eurprd08.prod.outlook.com (2603:10a6:10:2aa::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.16; Thu, 25 May
 2023 19:09:33 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::eb3c:9b42:21c9:494e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::eb3c:9b42:21c9:494e%7]) with mapi id 15.20.6433.016; Thu, 25 May 2023
 19:09:33 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "ecordonnier@snap.com" <ecordonnier@snap.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] fix hard-coded .so file extension
Thread-Topic: [OE-core] [PATCH] fix hard-coded .so file extension
Thread-Index: AQHZjxkxuWiWaDTF9Eq0lCKcs5bX9q9rWqEA
Date: Thu, 25 May 2023 19:09:33 +0000
Message-ID: <0D9F1393-5095-4AB2-9815-92AE4752681F@arm.com>
References: <20230525132235.1022441-1-ecordonnier@snap.com>
In-Reply-To: <20230525132235.1022441-1-ecordonnier@snap.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3731.500.231)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|DB9PR08MB6713:EE_|AM7EUR03FT012:EE_|AS8PR08MB8970:EE_
X-MS-Office365-Filtering-Correlation-Id: 835ca6a3-4c86-4752-ab82-08db5d5398c2
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 DkQT/v+geK7UIYCIYKbIekS0HODQe8AsxIA5JPZ3ZFQaZagl1OL+Y9WjAMR5ns0bXOSSVbKVrZWaKIG4sRpiFh9n7DVj4BeCDzNm+iSmhvgNrvAc/s5Hh8znIQ/czjYByhZUC2T+8hRAHTzV95qBa0vVbBx69+OeGMLlH2jJNLC3tfzDT5kV5psChKi/Z83vve5KqiUJ3bmB/uKU0fOsR17EOHoDSQ3K5FihZvffGMn0XFrNhwEzFel2vWeJtdfTVQLww05UX9hqkaTPMy9Lp2OcssTQw8tfaWVslA/tpJI15TJT++kI56e5A6SpenSMJn21LWvCJBH49RQXe1JfhDnOvCLjj1mGZBHV2HU8th80JEF/9u0LB/yUIQ3mSDvd8fc8FYoM5wg9XyJE0A70j8d9mdDUO1ejcYV7NMEeIg5BS9CoDnFfBABMWMhUD9pDjbJ5Iq1stQZZhmaB1gzaxXN6uxCapxaSQvPhyivwDDck5q86w36qWXFKLjMhsR6DUFlfJKrz6OXFtImLuMsAvdY5GfZhEFRruoCMYZH7CRqBemehfQ62V1AtRwgYwkZw35bYxK69vkWVm80ToTJBgmHYpMEQQGO3/8MlYfeuUsfU7HLCVrbHB020iM6/H5xQmJqexvEJP1vbFJSWU0W6ewkktJVJEpaGqftQ8k0xLff6G3ubKwRwp01aDknYZRaX
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(376002)(366004)(396003)(39860400002)(346002)(451199021)(2616005)(83380400001)(2906002)(186003)(36756003)(38100700002)(33656002)(38070700005)(86362001)(122000001)(66556008)(8676002)(8936002)(66446008)(5660300002)(76116006)(66946007)(66476007)(64756008)(91956017)(6916009)(41300700001)(6486002)(4326008)(316002)(478600001)(71200400001)(53546011)(6506007)(26005)(6512007)(142923001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <30F22C8FE4251B479C8B8EB638C92689@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB6713
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM7EUR03FT012.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	e0794628-69e6-4a01-9f9d-08db5d5392e1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	EvAL2/D3LAC1gbIrh+uCo8YjKQRoOo1ST55SzQZJq5SH6BSF7U1WZCOyNPFMZhHujXeR+io6L6g3nCZxkq+5mkYSf3UzmgG4RYKnvmK+LH8SIeRkcbGHr01UdBRG3zEoabtLdFpFTTYmvmxIEZXHlVEPHqLY400pr6LvTOTSDOAaI2Xdxzttr90Ay++cgawq+vHJmcki8y4KrDz2oYYkQiN3SJQWhy4iHMV2NUMBtnR48+hGDJ1M5NDGxoRXNCH4JNpHtg1sPgE5llu/vn+bkwpNFhu22zM12+9s7hZd0ysPWY4hd7iSLtVbHWl1zbYy3cABnbZM7IdelLE1smewTY14IQ05taM+btOJNJhuAHYe7hGyWHzB4NkwPG3kai7ViDoWTOcm0EJ4XpuXRMC6t3VNYQWn5Awb2FlvzxT94GdKCGKIBAHoZ+4TaxldV+y3GK6wuGPzgU+xaquA0OBbNawPZHNfBcZy3yEmKt1gj2wi9b93SELZ5eEGs//GUxDbGzoO50jwxQqN9QgVHWWIOfPXNqrqsWfmvVR0YlExrnKMBebiNejUCn4WvluTzcs4xGuFi5PbGNSgVCAuk0fsB4YbItmyJeT8Q1dUGNQH/VIXQ31vuI4xBx4XumBpMth8Zrrwe7XoBwmDFfMaasZWrfbD6PXvrYJq8zbbFaYAlgNTiWCbygBJdmOMbRTjZR6p3en6bphk6LXE/ZbbZxQyM0f34uhuXU+i/lbKm5qGOlDAM94fbgjZ30TeyqYixy4N25325X237/t4pdYtI6XlCw==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(376002)(396003)(136003)(346002)(39860400002)(451199021)(40470700004)(36840700001)(46966006)(82310400005)(36860700001)(2906002)(40460700003)(26005)(6512007)(6506007)(41300700001)(70586007)(4326008)(478600001)(70206006)(2616005)(336012)(81166007)(82740400003)(53546011)(86362001)(186003)(83380400001)(47076005)(8676002)(5660300002)(356005)(316002)(6862004)(36756003)(8936002)(40480700001)(33656002)(6486002)(142923001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 May 2023 19:09:42.8995
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 835ca6a3-4c86-4752-ab82-08db5d5398c2
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM7EUR03FT012.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB8970
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 25 May 2023 19:09:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181723

T24gMjUgTWF5IDIwMjMsIGF0IDE0OjIyLCBFdGllbm5lIENvcmRvbm5pZXIgdmlhIGxpc3RzLm9w
ZW5lbWJlZGRlZC5vcmcgPGVjb3Jkb25uaWVyPXNuYXAuY29tQGxpc3RzLm9wZW5lbWJlZGRlZC5v
cmc+IHdyb3RlOg0KPiANCj4gRnJvbTogRXRpZW5uZSBDb3Jkb25uaWVyIDxlY29yZG9ubmllckBz
bmFwLmNvbT4NCj4gDQo+IEUuZy4gRGFyd2luIHVzZXMgLmR5bGliIGluc3RlYWQuDQo+IA0KPiBT
aWduZWQtb2ZmLWJ5OiBFdGllbm5lIENvcmRvbm5pZXIgPGVjb3Jkb25uaWVyQHNuYXAuY29tPg0K
PiAtLS0NCj4gbWV0YS9yZWNpcGVzLWNvcmUvbGlieGNyeXB0L2xpYnhjcnlwdC5pbmMgfCA4ICsr
KystLS0tDQo+IDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0p
DQo+IA0KPiBkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWNvcmUvbGlieGNyeXB0L2xpYnhjcnlw
dC5pbmMgYi9tZXRhL3JlY2lwZXMtY29yZS9saWJ4Y3J5cHQvbGlieGNyeXB0LmluYw0KPiBpbmRl
eCA2MWIwMzgxMDc2Li43YjQ4NGQ4NmJjIDEwMDY0NA0KPiAtLS0gYS9tZXRhL3JlY2lwZXMtY29y
ZS9saWJ4Y3J5cHQvbGlieGNyeXB0LmluYw0KPiArKysgYi9tZXRhL3JlY2lwZXMtY29yZS9saWJ4
Y3J5cHQvbGlieGNyeXB0LmluYw0KPiBAQCAtMTcsMTAgKzE3LDEwIEBAIFNSQ19VUkkgKz0gImZp
bGU6Ly9maXhfY2ZsYWdzX2hhbmRsaW5nLnBhdGNoIg0KPiANCj4gUFJPVklERVMgPSAidmlydHVh
bC9jcnlwdCINCj4gDQo+IC1GSUxFUzoke1BOfSA9ICIke2xpYmRpcn0vbGliY3J5cHQqLnNvLiog
XA0KPiAtICAgICAgICAgICAgICAgJHtsaWJkaXJ9L2xpYmNyeXB0LSouc28gXA0KPiAtICAgICAg
ICAgICAgICAgJHtsaWJkaXJ9L2xpYm93Y3J5cHQqLnNvLiogXA0KPiAtICAgICAgICAgICAgICAg
JHtsaWJkaXJ9L2xpYm93Y3J5cHQtKi5zbyBcDQo+ICtGSUxFUzoke1BOfSA9ICIke2xpYmRpcn0v
bGliY3J5cHQqJHtTT0xJQlN9IFwNCj4gKyAgICAgICAgICAgICAgICR7bGliZGlyfS9saWJjcnlw
dC0qJHtTT0xJQlNERVZ9IFwNCj4gKyAgICAgICAgICAgICAgICR7bGliZGlyfS9saWJvd2NyeXB0
KiR7U09MSUJTfSBcDQo+ICsgICAgICAgICAgICAgICAke2xpYmRpcn0vbGlib3djcnlwdC0qJHtT
T0xJQlNERVZ9IFwNCj4g4oCcDQoNCklzIHRoaXMgYWN0dWFsbHkgcmlnaHQgdGhvdWdoPyBUaGUg
Y3VycmVudCBwYWNrYWdpbmcgaXM6DQoNCmxpYnhjcnlwdDoNCgkvdXNyL2xpYi9saWJjcnlwdC5z
by4yDQoJL3Vzci9saWIvbGliY3J5cHQuc28uMi4wLjANCmxpYnhjcnlwdC1kZXY6DQoJL3Vzci9p
bmNsdWRlL2NyeXB0LmgNCgkvdXNyL2xpYi9saWJjcnlwdC5zbw0KCS91c3IvbGliL3BrZ2NvbmZp
Zy9saWJjcnlwdC5wYw0KCS91c3IvbGliL3BrZ2NvbmZpZy9saWJ4Y3J5cHQucGMNCg0KV2hpY2gg
aXMgd2hhdCBJ4oCZZCBleHBlY3QuICBJIHN1c3BlY3QgcmVtb3ZpbmcgdGhpcyBGSUxFUyBzdGF0
ZW1lbnQgd291bGQgcmVzdWx0IGluIHRoZSBzYW1lIHBhY2thZ2luZyBhbmQgd29yayBvbiBEYXJ3
aW4gdG9vLg0KDQpSb3Nz

