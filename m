Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E226C433FE
	for <webhook@archiver.kernel.org>; Tue, 22 Nov 2022 17:20:55 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (EUR04-HE1-obe.outbound.protection.outlook.com [40.107.7.85])
 by mx.groups.io with SMTP id smtpd.web10.1103.1669137652158731324
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Nov 2022 09:20:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=HKphct8S;
 spf=pass (domain: arm.com, ip: 40.107.7.85, mailfrom: ross.burton@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QpyFvtl6ugRQRhcoRwIYJYqYW8VIC8lTNAb4nlPbx/g=;
 b=HKphct8SNhZFF6P3lNKVj+UiK8v9Y9AF0seT3VMW/9JgBEJPJemmtHfggOSh0Kqdw50tYfv7ALepGBgr+lQ5ZG16B6qQAho9wW45rmTMHxmgBd/trGosVwXjgEzGv2qV/ZlNIi/ms66/2sWbIPeSGa8i2+W5ZVbrprkxAD9FIrE=
Received: from DB6PR07CA0109.eurprd07.prod.outlook.com (2603:10a6:6:2c::23) by
 VE1PR08MB5727.eurprd08.prod.outlook.com (2603:10a6:800:1a5::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.17; Tue, 22 Nov
 2022 17:20:46 +0000
Received: from DBAEUR03FT053.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:6:2c:cafe::1e) by DB6PR07CA0109.outlook.office365.com
 (2603:10a6:6:2c::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5834.9 via Frontend
 Transport; Tue, 22 Nov 2022 17:20:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT053.mail.protection.outlook.com (100.127.142.121) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5834.8 via Frontend Transport; Tue, 22 Nov 2022 17:20:45 +0000
Received: ("Tessian outbound 73ab5f36653e:v130"); Tue, 22 Nov 2022 17:20:45 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 483b874916a5582b
X-CR-MTA-TID: 64aa7808
Received: from d22f8212c0d1.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 4B3CEEEA-5DBE-4F44-BDAC-017320CE8BC9.1;
	Tue, 22 Nov 2022 17:20:37 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id d22f8212c0d1.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Tue, 22 Nov 2022 17:20:37 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HvbKHv+4Y/+96UEXnK1HTE3M/M+PLZRVFGDWR5uc2v/zbNxQ31+oyUuohkkqHhfyaQBiqpVG6yqiUj2iruih7u5+K9ir7hHpc+jVh8IHd8N2e/l8ZVXXZwNJxoGLWzXb3VM7SxPQfOIpQpKwLVmuhd38xlceiGHm4CzOhIqC5lKqak2jZUN8SoUYF/GTmpHbzyKXWFie2WSd/t6+EdBpyB34czK0i1Z9guCjerL7P4q8O728iYIkke2LFAz9D8URVVsKAx3zU5Bg1WaAPj8q4pb+wuBji5ogKhf3tJj2Hjsqf0Abl2nDKmWH4vqVKmp1ij5MwqieJZ+sQJ/6+QTrtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QpyFvtl6ugRQRhcoRwIYJYqYW8VIC8lTNAb4nlPbx/g=;
 b=Sn9kwE1Ukd2Y4KcEe9on9mGz0LJ5nrfByhwwmYdwFSab7/YfAwRm1LJ7IwhnhIT/XgCN5e1kJ20JN4R/dcfiM9fhvFzDJ/c2rpi9ZFYZIdG9uj9U+5lkYjwDIyUkv2HIR+aH7+WffdnqontuX2mOZ3ZKyhGuJ3Dbp2rbD7WWDFTY61PL57M10xd5PXCnHutaWbHB+9x10Mzs9ZWwKdI9nlffQ3eA5FpFfLUUQZoMUVbYC4/5gKhK4HC4GDjUEAWxV4hkxEmDO85CKeeuxetNDl8WZQ50BWDFsb2CSbeFh4JuwheYFtxTAQwk3qLVsZNqGkpqizw1xaEmcWhBBJc/Tw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QpyFvtl6ugRQRhcoRwIYJYqYW8VIC8lTNAb4nlPbx/g=;
 b=HKphct8SNhZFF6P3lNKVj+UiK8v9Y9AF0seT3VMW/9JgBEJPJemmtHfggOSh0Kqdw50tYfv7ALepGBgr+lQ5ZG16B6qQAho9wW45rmTMHxmgBd/trGosVwXjgEzGv2qV/ZlNIi/ms66/2sWbIPeSGa8i2+W5ZVbrprkxAD9FIrE=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by AM8PR08MB5844.eurprd08.prod.outlook.com (2603:10a6:20b:1d1::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.17; Tue, 22 Nov
 2022 17:20:36 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::1ecf:7fb9:8c0:8119]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::1ecf:7fb9:8c0:8119%7]) with mapi id 15.20.5857.013; Tue, 22 Nov 2022
 17:20:35 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "mikko.rapeli@linaro.org" <mikko.rapeli@linaro.org>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH v2 1/2] oeqa: add utils/data.py with get_data()
 function
Thread-Topic: [OE-core] [PATCH v2 1/2] oeqa: add utils/data.py with get_data()
 function
Thread-Index: AQHY+2gVKtggdOw+Lk6B0q4BRI6Esa5LNpkA
Date: Tue, 22 Nov 2022 17:20:35 +0000
Message-ID: <2E6D8D06-3888-43E9-973F-B873FFC77979@arm.com>
References: <20221118160850.3964225-1-mikko.rapeli@linaro.org>
In-Reply-To: <20221118160850.3964225-1-mikko.rapeli@linaro.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3731.200.110.1.12)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|AM8PR08MB5844:EE_|DBAEUR03FT053:EE_|VE1PR08MB5727:EE_
X-MS-Office365-Filtering-Correlation-Id: 65679a09-5443-49e6-baa7-08daccade435
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 lIPooeYbFxE2mNc/ZQHhUus4qJjAvz8SsM2AqVcZzmIrM7JAT2isO/pbsD8NzZH+MGjsATfctaKt//LFNYUO+Mdd0wEMgQVvXBnJokKE0UYyXJRHwvgB0L6R4rIZ2CBlETRYjZ+zC0a1baQNXtEM8FzL5g1ypLM/PQLanH2GhOnFHi06AakBt5xGodyzUE1EtU6Ugc4jMOdagjQCc51bGTjZ6oPfRWZZwLzCb4mCRpangJEmyZBRT1wWgvR1Wgob4gFKRIvIK6WVT8Dy/5Tbk4utPri45YUDxpFJpHzdESFnk5PUF+C7zsxgSEC1M+VMjVKG4Ow/ZfqwM17vEpDIHsDARfFpO3KE/E0y2WGG7V9S7fwd5cbIvXC1/0P8C4RsSmn+BDljTK9xHUKdlX2Sy1NAOgvkQ0GBGk9PTXeZEGa+OcyjHXc+3EZdSBXE7dG333zjRk46YSI7OKY1DDAMH2DYHxNA7ngbBK/Skc7owtk9LLyhcgMFBxMLKn64VbShRtvxKr6sDELnXiJH6NVVcsOQ6rhwDi5dQe39NT7TNAQdOXtsG2X/Xz9yf4O9SVJN+4VLeUiAg5k06nM1v5+LYXsnCiMUK2Zt2xfk9jAMedamvoKxoYg8oQB9UO+EGEok4N5nFkWrzvFFsnv1dSg0KHVlPIGmdbXcC1TGFOlPwCxK1Rq8sPBon4TqDXjgnN4Lkdi9sFdhwd/ui4D0BdxZCeUVmZYRdWX+9INYxxACva48VrzXbIl+r2NiO/2XI9v/KhOjGFEEFDsRuvqQZnnUQQ==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(346002)(376002)(136003)(39860400002)(366004)(451199015)(36756003)(66946007)(76116006)(66556008)(41300700001)(64756008)(66446008)(8676002)(66476007)(5660300002)(478600001)(4744005)(6512007)(53546011)(6506007)(71200400001)(4326008)(33656002)(966005)(8936002)(26005)(316002)(186003)(2616005)(6916009)(91956017)(122000001)(6486002)(86362001)(38100700002)(2906002)(38070700005)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <D43AE17FE8F14941A4BD0F12553AF8BA@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB5844
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DBAEUR03FT053.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	a99ee858-ef67-43b4-60c1-08daccadde40
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	AUbPT+ODsQvx6RJT0l9w445gC31yDG2lM8drmR8QM1CkuYHYhJktpjmgTqLfUaqqV/UQ6mOR/xlIN9rdH5ue22wQerMVDPlyYgl73XzM03Gl8axklChgITINoYG3+tZJ42ZJ+6j4tHxoIxFIbZb0pKoN28gP8/vVjorCioGJ0/u5FJv6kN3jcm6Ilznl+vz+bJ2EqHt2qc3w+yO3Y7Dz9JDO2NmN+a/IAOVpY1Woz3LjWzeq09ID6wI0WAAQNrlqjrkk25S4bViwiac3ZA4r7WnLuADaR0FloJm2ZPDutEkY/X+L2DMdagY5XON/IAFKqWrgbbpA2JMXOxiOfQeNO9ChMXwiXfI49LRDnvbD7zTGpFp8smPlJIP8HZqXgppK+W9obM+KS31VcCnxHQ0BHQrP0KfLlLpb4VYGr+5vLHelWKJMkKjdF1I5JLgYRWRqV2rR6kdHQaLTiYVrKRbSFE48Ol2MUVerqYUKQ5N9HP+OaGPusfSIy9hyyzIPggWUBFeKLpquirLRpvAXUV9L1RZlMSwBehcTewPMjNEqMgK47Se04Db5jRr8iZ8Fb9TacwF2JVNTfUqTx+PiVrqPyU6sL7Ot4aztFyEncyeoqX3xlhnG9fzOHgL1RTT7CPnURS3twkaa9oJQa/VXivJf4jEq5IMgZBu9EiEy7akpW2mKOj2ejfNEBDxOtNpZpm5YOyv43QpCpDMt+Q5LmIfjPS3HX/ANzawMchUztS5u9GY=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(376002)(396003)(136003)(346002)(39860400002)(451199015)(40470700004)(46966006)(36840700001)(6486002)(26005)(2906002)(356005)(81166007)(82740400003)(6506007)(86362001)(36756003)(478600001)(53546011)(6512007)(40460700003)(33656002)(36860700001)(2616005)(336012)(82310400005)(47076005)(4744005)(186003)(6862004)(8936002)(41300700001)(966005)(40480700001)(8676002)(4326008)(70586007)(5660300002)(70206006)(316002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2022 17:20:45.6325
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 65679a09-5443-49e6-baa7-08daccade435
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DBAEUR03FT053.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5727
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 22 Nov 2022 17:20:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173692

T24gMTggTm92IDIwMjIsIGF0IDE2OjA4LCBNaWtrbyBSYXBlbGkgdmlhIGxpc3RzLm9wZW5lbWJl
ZGRlZC5vcmcgPG1pa2tvLnJhcGVsaT1saW5hcm8ub3JnQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+
IHdyb3RlOg0KPiANCj4gZ2V0X2RhdGEoKSB1c2VzIG9lcWEgdGVzdCBtZXRob2QgbmFtZSBhbmQg
YW4gb3B0aW9uYWwNCj4ga2V5IHRvIGdldCBkYXRhIGZyb20gaW1hZ2Ugc3BlY2lmaWMgInRlc3Rp
bWFnZV9kYXRhLmpzb24iDQo+IGZpbGUgbG9jYXRlZCBpbiBpbWFnZSBkZXBsb3kgZGlyZWN0b3J5
LiBJbWFnZSByZWNpcGVzIGNhbg0KPiBwcm92aWRlIGN1c3RvbSB2ZXJzaW9ucyBvZiB0aGlzIGZp
bGUgd2hpY2ggY29uZmlndXJlcw0KPiBnZW5lcmljIHRlc3RzIGZvciBhIHNwZWNpZmljIGltYWdl
IHdoZW4gdGVzdGluZyB3aXRoDQo+IHRlc3RpbWFnZS5iYmNsYXNzDQo+IA0KPiBGb3IgZXhhbXBs
ZSwgdGhlIHBhcnNlbG9ncy5weSBydW50aW1lIHRlc3QgbmVlZHMgaW1hZ2UNCj4gc3BlY2lmaWMg
Y29uZmlndXJhdGlvbiB3aGVuIHRoZSBpbWFnZSBoYXMgbmV3IGVycm9ycyBmcm9tDQo+IHRoZSBr
ZXJuZWwgd2hpY2ggYWNjZXB0YWJsZSBhbmQgY2FuIGJlIGlnbm9yZWQuDQo+IA0KPiBTYW1lIG1h
Y2hpbmUgY2FuIGJlIHVzZWQgdG8gZ2VuZXJhdGUgbXVsdGlwbGUgaW1hZ2VzIHdpdGggZGlmZmVy
ZW50DQo+IHJ1bnRpbWUgYmVoYXZpb3Igc28gdXNpbmcgaW1hZ2UgYXMgdGhlIGtleSBhbmQgbm90
IG1hY2hpbmUuDQoNCk5vdGUgdGhhdCB0aGVyZeKAmXMgYSB2ZXJ5IHJlbGF0ZWQgYnVnOg0KDQpo
dHRwczovL2J1Z3ppbGxhLnlvY3RvcHJvamVjdC5vcmcvc2hvd19idWcuY2dpP2lkPTE0NjA0DQoN
CkluIHRoaXMgY2FzZSBJIG5lZWQgdG8gZXh0ZW5kIHBhcnNlbG9ncyAqcGVyIG1hY2hpbmUqLg0K
DQpEb2VzIHRoaXMgcGF0Y2ggc2VyaWVzIHN1cHBvcnQgdGhpcz8NCg0KUm9zcw==

