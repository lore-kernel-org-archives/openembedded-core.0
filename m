Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3346CC636CC
	for <webhook@archiver.kernel.org>; Mon, 20 Feb 2023 16:35:31 +0000 (UTC)
Received: from EUR02-DB5-obe.outbound.protection.outlook.com (EUR02-DB5-obe.outbound.protection.outlook.com [40.107.249.65])
 by mx.groups.io with SMTP id smtpd.web11.17984.1676910924766377866
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Feb 2023 08:35:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=Pai39IPk;
 spf=pass (domain: arm.com, ip: 40.107.249.65, mailfrom: ross.burton@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0G9jpU0czauZLAV1LtI9bZ5jIJR1zQFCLKugtqalkqM=;
 b=Pai39IPkXuH4OLY+iPwptBWUXc8Pu/O5YpLSwP8lyz/SsE4CqaBYSDTCCwbP9AVdk6+Z08oKo+OkbL0vbAQYVa6w7POWDd1dMzApYrOGnJwupC/8iDMYpGKK+qEfypvjBEQ/lkjW9qOwFUw0AzrKGYeScenwFhvsUN7Mq2mufG0=
Received: from DB3PR08CA0006.eurprd08.prod.outlook.com (2603:10a6:8::19) by
 DU0PR08MB8323.eurprd08.prod.outlook.com (2603:10a6:10:40c::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6111.19; Mon, 20 Feb 2023 16:35:12 +0000
Received: from DBAEUR03FT034.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:8:0:cafe::9c) by DB3PR08CA0006.outlook.office365.com
 (2603:10a6:8::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6111.20 via Frontend
 Transport; Mon, 20 Feb 2023 16:35:12 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT034.mail.protection.outlook.com (100.127.142.97) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6111.20 via Frontend Transport; Mon, 20 Feb 2023 16:35:12 +0000
Received: ("Tessian outbound 0d7b2ab0f13d:v132"); Mon, 20 Feb 2023 16:35:12 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: a9a7ed5b1744497e
X-CR-MTA-TID: 64aa7808
Received: from 92d6eefc603f.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id FC5CBAD8-CB87-41EE-8A7D-D803E3C4E850.1;
	Mon, 20 Feb 2023 16:35:06 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 92d6eefc603f.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Mon, 20 Feb 2023 16:35:06 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hTYxE3fURt0RMxPY+h5LhnzFLNbNdVDam0iDeWbL0v1LY9M8hBCAqaRQHlyF2OAllUPovEj+vHMEMInLmoW247aXs4/auS6ZQcyHWHYyFeMgP3x5x5LCA5tQUewaiddf5BZOY4fGQWp/cCeBq4HxzihLI5qs+CCJLMA7PkjalYa2dRLWHuL2bxznllLoIOOktb0nPO8TKV8+Oa8du+2ikWJFBmkul+5FCXn9mAB5r6jS91B97HqDzAU8k+MXKIhjlLj2yooQo9ETrU9xNCZ4gVLEKAvx/9zI7+khFa7nTJgGDxjVYcMz3rw+rA+hLieaLPMgG5Qwuo3koWZsp0Q+mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0G9jpU0czauZLAV1LtI9bZ5jIJR1zQFCLKugtqalkqM=;
 b=RPvzAC38JMSAG2q+5pe2yWtAxveBpiQ1faji/pi+m+WwNaUc9r9BGAnUtYErp1Roh4djkGXDHvqQnznf2xc/3nJOYJA9Ao/UIDaBvSBd4BZno6KPAR2j5/J50Ya/KACvCPzqLF0NfD1JjuVXXSrs/w88eHmnTAJlTah+HDvwmvLHcCJAc43kp15n765rI2eoGPtHB/nuN1p4cMdSP4JZiAT8qNe928dAj2NftBqwcvWANK/ZKhj0vwwV0VtWa70oFQZxwo567vFc19laV6wmQNmZrWuZ7D7H6i3YmciRCbuDvtaCrDrqQ78lYMzIeSddgw8w0WC3PjwP93POQT6q1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0G9jpU0czauZLAV1LtI9bZ5jIJR1zQFCLKugtqalkqM=;
 b=Pai39IPkXuH4OLY+iPwptBWUXc8Pu/O5YpLSwP8lyz/SsE4CqaBYSDTCCwbP9AVdk6+Z08oKo+OkbL0vbAQYVa6w7POWDd1dMzApYrOGnJwupC/8iDMYpGKK+qEfypvjBEQ/lkjW9qOwFUw0AzrKGYeScenwFhvsUN7Mq2mufG0=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by GVXPR08MB7893.eurprd08.prod.outlook.com (2603:10a6:150:1::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6111.19; Mon, 20 Feb
 2023 16:35:04 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::e305:742e:e10b:1093]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::e305:742e:e10b:1093%2]) with mapi id 15.20.6111.019; Mon, 20 Feb 2023
 16:35:04 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Jose Quaresma <quaresma.jose@gmail.com>
CC: openembedded-core <openembedded-core@lists.openembedded.org>, nd
	<nd@arm.com>
Subject: Re: [OE-core] [PATCH 3/3] python3-pytest: add BBCLASSEXTEND
Thread-Topic: [OE-core] [PATCH 3/3] python3-pytest: add BBCLASSEXTEND
Thread-Index: AQHZQhjSYdo5a0yyI06td/mE2SBRlK7RzriAgAY/moA=
Date: Mon, 20 Feb 2023 16:35:04 +0000
Message-ID: <43545EEF-6369-4CA6-A40B-978715678FFC@arm.com>
References: <20230216151005.3469200-1-ross.burton@arm.com>
 <20230216151005.3469200-3-ross.burton@arm.com>
 <CANPvuRkwMCmFUTCGGbPzmTRa-Q7VYROT9+YL8Y=e-n7y70RBsA@mail.gmail.com>
In-Reply-To: 
 <CANPvuRkwMCmFUTCGGbPzmTRa-Q7VYROT9+YL8Y=e-n7y70RBsA@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3731.400.51.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|GVXPR08MB7893:EE_|DBAEUR03FT034:EE_|DU0PR08MB8323:EE_
X-MS-Office365-Filtering-Correlation-Id: 081a4637-1d41-4249-332d-08db13607047
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 dyZnTN2pW7F0kCVL9tcEPh1xv5/jgSB1KP3Py6nTND7n5Eb/L8CZNApuALOLjRRusQYmzbXKZgTr/fWAr74NgyoSC1z3HA5vK3GXDeXFJ42e+VoWwFCGygnAcmPzhaxBmMtNKxGEfAINgX5IQquF1gNnPy8fAzUyYjYkILXdQ+C4F8kFZzdDVUuCYyMUwB77aa7hZSs7iw47FWT7jfp124w68sVpmRXevi5c8ZF8LTnHGHflHhUCnRkdrhJBu91Vsv2Mhi0MGdz7ENV6wwNt7oOAix9aGuJ3CmDdx2WTnlPzlSxA6Te3EuCIoMGkgRgLYU4WcyfIdAwu/GPgsjrlyd/rgzAExxX3evval8SZINDpf7xJvlPXVpbqVGf+L1Gsj0G9UBgReqP9nL5I0SlR2cei9rEPJ9wwnsz1N2JcDGiUJms69p43SgBlSZnpo0KabBmHOV1KfJXDrRQVka95CJCHzEbp6yOm1lHwBMgJJp2PQCP340J7edqClW145wv40u553M4IHcKClRGsainjQEGwjb1srSiRVstxTmHaFgNCYY0g1cmDwxax9sOZr7zv0lqppkRxM7y3GZo2FxP5okrEMJlMNiSxTZQ4q40Xn+++YX+X0sQAmSRfbNCXcdNr4/SeW5bjcQ98KtLXFRaVXjlWVimm7yaMQ8nRp9gPzqdPvuAaJDupNHcFRd0ETT5q3C759EHPiuycDhJqt+4/kiepMb0SzDt9ba4Xm3JDKRU=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(39860400002)(366004)(376002)(136003)(396003)(346002)(451199018)(6506007)(83380400001)(66946007)(76116006)(91956017)(6916009)(4326008)(66556008)(6512007)(64756008)(66476007)(66446008)(8676002)(2616005)(38070700005)(86362001)(38100700002)(54906003)(122000001)(36756003)(316002)(53546011)(33656002)(186003)(71200400001)(26005)(6486002)(478600001)(8936002)(5660300002)(2906002)(4744005)(41300700001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <4D887A49954068478D8C8E84B431F138@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR08MB7893
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DBAEUR03FT034.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	1ff84af9-4031-45ae-489b-08db13606b68
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	IGGrqg9UmiPAxjCoNrKys1c2/3D8X1jky4pzma8pCLZt6ZAFKinhhP21pOhiSPoKghlUspccwmeYCzBSXaAKU2IKwYx60VDtMSY3kYl7t8izGUKJXw65qeo1rx8ZtWEgn3kWx+2T6hBmz9VSOYUTYM/Dp3EHINPXH0RSKIxnD5qlJUoFONoWYL06lUnKIqoVEFyQuSkjfoDPmwgRnCejrdsdVwggYXLn9klIMP6IGLcOrcnIQXaY/H3CpzsafmARetuj+lyMddZCKULiLaQLyo5zGTRlQaHpZDwkmFNov+DLnkw91jiP4OIzYl3QQexLN2m5yT2e4YuPJdKVFrGlq4G5yn+DP1IAR/ofx1DVkac1S6hE4LreztegUu83AyU0hi9qvISFQfXgvqbNATcW0FtRi26pJl4krU0PAP/k18J627KqsamIQB2uv1jb8HOxdTASvXJ6WcmQ8IisuDZbp6LSgLfsJZFT9Aa/jfogxCFGT+2/506zw0Xe+hC4tfxx9h4tnirVDt5Ly/KCRc5CWa9sTt0LGFBeNfsB7CffJIhyEJ3v0yqnS6NWZc0Eb6GINVtT3l+CwuHo6XqlM5SL2bceZhq30JQxL+Pm12EaFD/W722laBsftFjTTpFcKBgYXSNQVdqm7AUujGJyTzQ9UOg4iby5GQuEuM10hoZKvIwTqvc5qNbKliBkns396nV61jp2BOLg8Hm20GLMOl9n/g==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230025)(4636009)(136003)(376002)(396003)(39860400002)(346002)(451199018)(36840700001)(46966006)(40470700004)(41300700001)(82310400005)(36756003)(40480700001)(356005)(8936002)(82740400003)(33656002)(5660300002)(26005)(86362001)(6486002)(4326008)(186003)(2906002)(53546011)(83380400001)(316002)(54906003)(40460700003)(6512007)(70206006)(8676002)(70586007)(6506007)(47076005)(2616005)(81166007)(478600001)(336012)(36860700001)(6862004);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Feb 2023 16:35:12.4403
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 081a4637-1d41-4249-332d-08db13607047
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DBAEUR03FT034.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB8323
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Feb 2023 16:35:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177442

T24gMTYgRmViIDIwMjMsIGF0IDE3OjA5LCBKb3NlIFF1YXJlc21hIDxxdWFyZXNtYS5qb3NlQGdt
YWlsLmNvbT4gd3JvdGU6DQo+IA0KPiBIaSBSb3NzLA0KPiANCj4gUm9zcyBCdXJ0b24gPHJvc3Mu
YnVydG9uQGFybS5jb20+IGVzY3JldmV1IG5vIGRpYSBxdWludGEsIDE2LzAyLzIwMjMgw6Aocykg
MTU6MTA6DQo+IFNpZ25lZC1vZmYtYnk6IFJvc3MgQnVydG9uIDxyb3NzLmJ1cnRvbkBhcm0uY29t
Pg0KPiAtLS0NCj4gIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1weXRlc3Rf
Ny4yLjEuYmIgfCAyICstDQo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVs
ZXRpb24oLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9u
L3B5dGhvbjMtcHl0ZXN0XzcuMi4xLmJiIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9w
eXRob24zLXB5dGVzdF83LjIuMS5iYg0KPiBpbmRleCAxMDViNzZhNGE2NC4uYzc2MTBkNDQwYzEg
MTAwNjQ0DQo+IC0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1weXRl
c3RfNy4yLjEuYmINCj4gKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24z
LXB5dGVzdF83LjIuMS5iYg0KPiBAQCAtMTEsNyArMTEsNyBAQCBERVBFTkRTICs9ICJweXRob24z
LXNldHVwdG9vbHMtc2NtLW5hdGl2ZSINCj4gDQo+ICBpbmhlcml0IHVwZGF0ZS1hbHRlcm5hdGl2
ZXMgcHlwaSBweXRob25fc2V0dXB0b29sc19idWlsZF9tZXRhDQo+IA0KPiAtUkRFUEVORFM6JHtQ
Tn06Y2xhc3MtdGFyZ2V0ICs9ICIgXA0KPiArUkRFUEVORFM6JHtQTn0gKz0gIiBcDQo+IA0KPiBU
aGUgY29tbWl0IHRpdGxlIGlzIG5vdCBkZXNjcmliaW5nIHdoYXQgaGFzIGJlZW4gZG9uZSBvbiB0
aGUgcGF0Y2guDQoNCk5vLCBpdOKAmXMgbm90LiAgU29ycnkgYWJvdXQgdGhhdCwgSSB0cmllZCBn
ZXR0aW5nIGNsZXZlciBhbmQgc2NyaXB0aW5nIGNvbW1pdHMgYnV0IGZvcmdvdCBvbmUgd2FzIGRp
ZmZlcmVudC4NCg0KUm9zcw==

