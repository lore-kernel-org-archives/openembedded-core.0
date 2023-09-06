Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3231FEB8FCE
	for <webhook@archiver.kernel.org>; Wed,  6 Sep 2023 13:15:53 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.88])
 by mx.groups.io with SMTP id smtpd.web11.8291.1694006147614212199
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Sep 2023 06:15:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=zvpxlU1T;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=zvpxlU1T;
 spf=pass (domain: arm.com, ip: 40.107.20.88, mailfrom: ross.burton@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xKshj0qIgZMr43FdNJWjd6DGasRfRFi/DT8XJrE6VAE=;
 b=zvpxlU1T5Td3XJxo8wJ1lMPX3iLXc9meauW33ukPKx0JWFjxn/5ecNN4xD8eXkbb81jyjFdRsPSTN5LFF1C4F2++Oog7xpqOk49cAFCYdLKxMkEBbtvDEX63UnLEauwNztKAEicOlgM8XY1GRsdkifOpYV0pYvhFfVNMgAq6knw=
Received: from DB7PR05CA0028.eurprd05.prod.outlook.com (2603:10a6:10:36::41)
 by DU0PR08MB7923.eurprd08.prod.outlook.com (2603:10a6:10:3ca::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.34; Wed, 6 Sep
 2023 13:15:44 +0000
Received: from DBAEUR03FT027.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:36:cafe::85) by DB7PR05CA0028.outlook.office365.com
 (2603:10a6:10:36::41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.33 via Frontend
 Transport; Wed, 6 Sep 2023 13:15:43 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT027.mail.protection.outlook.com (100.127.142.237) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6768.26 via Frontend Transport; Wed, 6 Sep 2023 13:15:43 +0000
Received: ("Tessian outbound 5c548696a0e7:v175"); Wed, 06 Sep 2023 13:15:43 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 7ddb469269627c4b
X-CR-MTA-TID: 64aa7808
Received: from 5fb99a955778.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id FD4BBAE7-B296-4A5C-99F3-9CB1309B5F9A.1;
	Wed, 06 Sep 2023 13:15:36 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 5fb99a955778.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Wed, 06 Sep 2023 13:15:36 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NPcWNb0o8wbr7AiG2Mg4UT+LDsUNf1iw8sYZD9Fdn1ewrd7v05dixqFkgxM1/EO27RuRI4/xny45XDu5Er6jMxFqw8C+PtWrI/H/RIfB4IeFqaaeEStc/JRpMK1huHNZSSRK+TfB9rhz3OrwWegi3So7cz/ybsIrI40/z1H7Fg4dh+GTHPhZWfKYTbdLOK0tNmSF8l39Oz/KzY6zEhfT61U86vXXGIPLgYpFm8PGxm+HJyxe9kcmLqToDNXPBCilk6lFCiU13vRIrhsCWQpIr1rm5fVKV65mWYoPBLWtRvF7sO2qjAiDrdwphxYeIybginwz5UfqRRnFUoA6AmMwqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xKshj0qIgZMr43FdNJWjd6DGasRfRFi/DT8XJrE6VAE=;
 b=h2nvYAUbA4gCRWxs1lrKokzykinr7ujfrxxzm9+H+jRMS/As6UIkTm8YJYHAkmjsIOrOmjDx9S9sFPTHrWuKiJdAF+dzys9+kbil0ULniiNQnzivK9HbqCNXwtZseXxm5fJeBb7VRkoCY/yZ2xe3OUxweM7UUHxyI9TMYgxdFMPlKwTUkVNA/MQx2seagcPBv9Afd4Z1fI9NM4zHDwXfIOmWns+tKPQ9vuZn1Ny05d/fWil5joW1rJSn++VmBNnzPXgQc0tBmKwATEsxrbISWMN+bI4w1OsGlqwCv0U3cIS+avo6E96MOjceOWvogEGCFeqygiu4jzAVJrvyJGu5wQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xKshj0qIgZMr43FdNJWjd6DGasRfRFi/DT8XJrE6VAE=;
 b=zvpxlU1T5Td3XJxo8wJ1lMPX3iLXc9meauW33ukPKx0JWFjxn/5ecNN4xD8eXkbb81jyjFdRsPSTN5LFF1C4F2++Oog7xpqOk49cAFCYdLKxMkEBbtvDEX63UnLEauwNztKAEicOlgM8XY1GRsdkifOpYV0pYvhFfVNMgAq6knw=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by AS4PR08MB8119.eurprd08.prod.outlook.com (2603:10a6:20b:58b::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.34; Wed, 6 Sep
 2023 13:15:31 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::4b8a:7518:c642:5727]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::4b8a:7518:c642:5727%7]) with mapi id 15.20.6745.034; Wed, 6 Sep 2023
 13:15:31 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
CC: Richard Purdie <richard.purdie@linuxfoundation.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 0/8] linux-yocto: consolidated pull request
Thread-Topic: [OE-core] [PATCH 0/8] linux-yocto: consolidated pull request
Thread-Index: AQHZ4AaFv2eW/Uorvkmp8tZZ1CWZhbANvjkAgAAE2gCAAAVGAA==
Date: Wed, 6 Sep 2023 13:15:31 +0000
Message-ID: <E3CBF5FF-D3D5-4EDA-9EC9-508085A6BCF8@arm.com>
References: <cover.1693924532.git.bruce.ashfield@gmail.com>
 <2E1BC731-5CE1-41F7-88B5-3ACF145BF7B0@arm.com>
 <CADkTA4MgPLM1L-bO=+28QE_xZC14EFmeAHfZSPKCtjOZfCZU+A@mail.gmail.com>
In-Reply-To: 
 <CADkTA4MgPLM1L-bO=+28QE_xZC14EFmeAHfZSPKCtjOZfCZU+A@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3731.700.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|AS4PR08MB8119:EE_|DBAEUR03FT027:EE_|DU0PR08MB7923:EE_
X-MS-Office365-Filtering-Correlation-Id: e1d14197-b5dd-419a-2edd-08dbaedb603d
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 g4bI+CYWMap2oZfYsQy+pEf1Y7Xv/g8iSXpgvT7id8vW+A9lAcSVFI1JNHmS/wTSa5EF9qVxIiBlclnOn/H1uqeicpRmgVVbRS2BAGs29mQa32EmSqdFxcP0NV14Wp/nlDPmFddMzuqKTll2Yad3vfX16UXS6Lu+h79qVWZZsHN7E2j8MWHafDJFSPXpYWiGPGp1DBAyZncRkkE11cAEfR3f2lJg+Z2p/teIci9KfN0bqDMK2XGF8CNnqFRoBAhQTlsT6CXISXDmWn9kbK/uSWnQli362KTI3UyHDJDAAKK7n54AU+KcckuhhApMu51URImgknV1JBS4cUfdM/24DCevyZOKC0qyG83/z01WOVYeBQa0cttIp3MAB1zWSbfVVRfDApHy07urW/FmlGyk25SPkv2ksfwXZAGQhIktVnCQ860GOs81gURKv20yrA7bg0ys2RK4fyMVOj6H5bFjZrSmNgA2Fj4NeozjWVio0N/3+24QT5pY233uW8eijAsVF1MdMO+HhBEK8yZ9jli34zisV9OSap/y7OJdf7ZR5DMfprHuIk3Z2ZgPTq7DIRi/QG4DWkJftuy5TlYPlVIRSfzW49eQmkhiAQnVzaL6QlrqWUMP+Y5ooWHiNCU54gM/QHJQBuw3Nf41b/8iAc8bMQ==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(346002)(39860400002)(366004)(376002)(396003)(186009)(451199024)(1800799009)(86362001)(33656002)(36756003)(38070700005)(38100700002)(122000001)(966005)(478600001)(2906002)(53546011)(316002)(6512007)(6506007)(71200400001)(6486002)(8936002)(8676002)(4326008)(5660300002)(41300700001)(91956017)(6916009)(64756008)(54906003)(66446008)(76116006)(66556008)(66946007)(66476007)(83380400001)(2616005)(26005)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <707F4FB70411FC4A87C104367B2CB5D5@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR08MB8119
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DBAEUR03FT027.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	3694cf42-7dad-403b-8705-08dbaedb58d1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	eIzqGH/Ajad942IJ0L8VQnlUeStu+ehOjnhbXIzmQ4z7sJLjBktY2jrSpVLKCMIsvAxcJVPys3FUe9J5n8dG1ywvgN/Omgo3rH7Upk9ZUXLE2sjuqocC0B8LF8Rx8noluX6z0jEZAOqRGNSx8TpRzuqWVZwr5smk/AMzDhYEzq8qQlFuiADgtLsifZ1qSOkpRVx6gynp1alGUoO9CZK2aTsKSPBR36E5KuYXm7UzkUmusBPn6R34fBBWEDKfvmUuzhZicXLVpMmlI/VtbVy6OgA9GmJDMCZIkWra/b+8ajViIgi1Sd256X6fQLd2xCzrU7XABmyUcbUxeqzmPMFJ8VhJ6LhwBvvjfaapGxepRBrd3RIoF1ELri0N4jwIEvdVj4I85xqI5LtPBbW+yWgbQr9MkkHwX2RAsgFxlkI3AAUHf45utekSSaTqCYZmAt6rG3PD6iWJScSNVIz3s2jMkslxrxIuVGpEG5+d1erLQENBH0w5N3abF56pP0HlpTDQZ9SgScufoR90qoyWy9bS+G3fZM0h4yuxLZHi2HKQPamYmXho906V+lCA32xOxMihkWGC4AxQ4SNaXdNV1+l7XjBIJpxfWMrqEL9dZXTDkeVm0K6NdbNc7jrvaQo7b0+iJ20jzNwV6aiXYzWlzKgD4nWE0J+BGd4yh/3EZg0nEhPTfuhUzSzKRnNU54zLxfs3EMV18HoBJOqX5ftqCpWSaUBQf66/SeknBCWD16+GgGM=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(396003)(376002)(346002)(136003)(39860400002)(186009)(82310400011)(451199024)(1800799009)(36840700001)(46966006)(40470700004)(6486002)(6506007)(53546011)(83380400001)(478600001)(2906002)(26005)(336012)(2616005)(966005)(54906003)(41300700001)(70206006)(5660300002)(70586007)(6862004)(316002)(4326008)(8676002)(8936002)(36756003)(40460700003)(6512007)(40480700001)(47076005)(33656002)(36860700001)(86362001)(82740400003)(81166007)(356005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2023 13:15:43.8281
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e1d14197-b5dd-419a-2edd-08dbaedb603d
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DBAEUR03FT027.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB7923
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Sep 2023 13:15:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187313

T24gNiBTZXAgMjAyMywgYXQgMTM6NTYsIEJydWNlIEFzaGZpZWxkIDxicnVjZS5hc2hmaWVsZEBn
bWFpbC5jb20+IHdyb3RlOg0KPiANCj4gT24gV2VkLCBTZXAgNiwgMjAyMyBhdCA4OjM54oCvQU0g
Um9zcyBCdXJ0b24gPFJvc3MuQnVydG9uQGFybS5jb20+IHdyb3RlOg0KPj4gDQo+PiBPbiA1IFNl
cCAyMDIzLCBhdCAxNTozNywgQnJ1Y2UgQXNoZmllbGQgdmlhIGxpc3RzLm9wZW5lbWJlZGRlZC5v
cmcgPGJydWNlLmFzaGZpZWxkPWdtYWlsLmNvbUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnPiB3cm90
ZToNCj4+PiANCj4+PiBGcm9tOiBCcnVjZSBBc2hmaWVsZCA8YnJ1Y2UuYXNoZmllbGRAZ21haWwu
Y29tPg0KPj4+IA0KPj4+IFJpY2hhcmQsDQo+Pj4gDQo+Pj4gSGVyZSdzIHRoZSBuZXh0IHJvdW5k
IG9mIC1zdGFibGUgYW5kIGNvbmZpZ3VyYXRpb24gY2hhbmdlcy4NCj4+PiANCj4+PiBJIGFsc28g
cmFuIGludG8gYSBidWlsZCBpc3N1ZSB3aXRoIDYuNCsgb24gb25lIG9mIG15IGJ1aWxkZXJzDQo+
Pj4gZHVlIHRvIGEgZ3ppcCBtaXNtYXRjaCB3aXRoIHpsaWIgdmVyc2lvbnMuIFNvIEkndmUgaW5j
bHVkZWQNCj4+PiBhIGZpeCBmb3IgdGhhdC4NCj4+IA0KPj4gV291bGQgeW91IGJlIGFibGUgdG8g
dGhyb3cgaW4gYSBjdmUtZXhjbHVzaW9ucyB1cGRhdGUgd2hlbiB5b3UgdXBncmFkZSB0aGUga2Vy
bmVscz8gIEkgY2FuIGRvIGl0LCBidXQgaXTigJlzIGVhc2llciBpZiBpdOKAmXMgZG9uZSBhcyBw
YXJ0IG9mIHRoZSB1cGdyYWRlLg0KPj4gDQo+PiBGb3Igbm93IGl04oCZcyBhIGxpdHRsZSBtYW51
YWwuICBIYXZlIGEgY2xvbmUgb2YgaHR0cHM6Ly9naXRodWIuY29tL25sdWVkdGtlL2xpbnV4X2tl
cm5lbF9jdmVzIHRvIGhhbmQgdGhlbjoNCj4+IA0KPj4gJCAuL2dlbmVyYXRlLWN2ZS1leGNsdXNp
b25zLnB5ICB+L0NvZGUvZHJpdmUtYnkvbGludXhfa2VybmVsX2N2ZXMvIDYuNC4xMSA+IGN2ZS1l
eGNsdXNpb25fNi40LmluYw0KPj4gDQo+PiAodXBkYXRlIHBhdGhzIGFzIG5lZWRlZCkNCj4gDQo+
IEknbGwgYWRkIHRoYXQgdG8gbXkgdXBkYXRlIHN0ZXBzLg0KPiANCj4gQXMgbG9uZyBhcyBJIGRv
bid0IGhhdmUgdG8gYXVkaXQvY2hlY2sgb3IgbWFudWFsbHkgZWRpdCBhbnl0aGluZywgaXQNCj4g
d29uJ3QgYmUgYW4gaXNzdWUuDQoNCkNoZWVycy4NCg0KTGl0ZXJhbGx5IGp1c3QgcnVuIHRob3Nl
IGNvbW1hbmRzIGFuZCBzYW5pdHkgY2hlY2sgdGhhdCBpdCBkaWQgc29tZXRoaW5nIHJlYXNvbmFi
bGUgKGllIGRpZG7igJl0IHdyaXRlIGFuIGVycm9yIG1lc3NhZ2UgdG8gdGhlIGZpbGVzKS4gIEni
gJl2ZSBiZWVuIG1lYW5pbmcgdG8gYWRkIGEgd3JhcHBlciB0byBkbyB0aGUgcmlnaHQgdGhpbmcs
IGJ1dCBNYXJ0YSBpcyBhbHNvIHdvcmtpbmcgb24gaW50ZWdyYXRpbmcgdGhlIGRhdGEgZGlyZWN0
bHkgaW50byB0aGUgQ1ZFIGNoZWNrIGxvZ2ljIHNvIEkgcmVhbGx5IGRvIGNvbnNpZGVyIHRoaXMg
c2NyaXB0IHZlcnkgbXVjaCBhbiBpbnRlcmltIHNvbHV0aW9uLg0KDQpSb3Nz

