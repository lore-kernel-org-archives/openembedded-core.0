Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC9B3C54EAA
	for <webhook@archiver.kernel.org>; Fri, 27 Jan 2023 14:28:50 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.72])
 by mx.groups.io with SMTP id smtpd.web10.103166.1674829722639622852
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 Jan 2023 06:28:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=NBCuhGcR;
 spf=pass (domain: arm.com, ip: 40.107.22.72, mailfrom: ross.burton@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JjUlVeS00yabcnk7SVVeLUl+3woCKn5P+CaYHBed5sY=;
 b=NBCuhGcRQe+BsZIHSJ35ovxzgsKELKCZTh0NX/Bk0WDIxdRCCcbTdHpiO+WAQiyBKw9ZeE8RKnKuX0PB89VHxg5hmMz4zKuOyFcDPQv5RJCG6rJJvSercDF+LcyQJCG2WdwFqlfp3f7bHfApebIpAHPAGj1KB0Iy44V3QF+LUzw=
Received: from AS8PR04CA0012.eurprd04.prod.outlook.com (2603:10a6:20b:310::17)
 by VE1PR08MB5582.eurprd08.prod.outlook.com (2603:10a6:800:1a5::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.33; Fri, 27 Jan
 2023 14:28:39 +0000
Received: from AM7EUR03FT039.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:310:cafe::dc) by AS8PR04CA0012.outlook.office365.com
 (2603:10a6:20b:310::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.23 via Frontend
 Transport; Fri, 27 Jan 2023 14:28:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT039.mail.protection.outlook.com (100.127.140.224) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6043.21 via Frontend Transport; Fri, 27 Jan 2023 14:28:38 +0000
Received: ("Tessian outbound 8038f0863a52:v132"); Fri, 27 Jan 2023 14:28:38 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: ead7d7e3afd25172
X-CR-MTA-TID: 64aa7808
Received: from 30625973ad09.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 7AA955BE-688D-4642-B4BE-032920ADF0D7.1;
	Fri, 27 Jan 2023 14:28:32 +0000
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 30625973ad09.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Fri, 27 Jan 2023 14:28:32 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NclBxpHzroWF112zPazUW42FBEjr39y7PnhbLh3ACzklnKeKTikuglZt9BbYEDNll5zuCnCEn1ZGDu65ErLFvc9h4lhLqfM3D9h+8wc9M1MeFQD/RPed+WUgU4e+HTFEpVFi8O7YgyPPknGmu7BnOD15hSNBGyZvhLZlh9IbiHeWd9OxoDdwPuQvlpJdxD4IiYIEYE5ofyRGtZ1E4zyJyEKx419RhWF3mKsBZHHmP/cUDKqvN83c06lpToph+koUuKSMxkla9U8zTThCwOzbIHKAOwkEtbryEs0PxKveHbq5ReIcaYdBlSpUOQbyAOIz+qudE97vfUBRAwYvL7osHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JjUlVeS00yabcnk7SVVeLUl+3woCKn5P+CaYHBed5sY=;
 b=oWi63tGH67d0D4v8dRSucv5qt+jsW9i6iIsu4D+d3vQbMzzId34U1ORmS5rPhfr7jazNRUEeYudo5DuIAulkjYPib/8KZqNkdYiSlHFGymtDN1H1RHPEfd/8uX1H5Fi/hTqPMdCj90ynEWWz3mYQNarMaw8PCSleX343lmLSAAoUyfSnHr6Fh3q5MaJ4Q3iEPLSCV3bmxPb//8Z9Gqq1QgUZqJ4pFVbIzRnxb5rbwlPlqYsz8RPGPvkMpGfglmJo3YX0DLHJG2wkRzwFU2iz4tNsWYkBGM0qjtJA8so15pz+CNLJZDJChnXX074tXp7uPNFd/vReXUGmVZMtiB5ZeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JjUlVeS00yabcnk7SVVeLUl+3woCKn5P+CaYHBed5sY=;
 b=NBCuhGcRQe+BsZIHSJ35ovxzgsKELKCZTh0NX/Bk0WDIxdRCCcbTdHpiO+WAQiyBKw9ZeE8RKnKuX0PB89VHxg5hmMz4zKuOyFcDPQv5RJCG6rJJvSercDF+LcyQJCG2WdwFqlfp3f7bHfApebIpAHPAGj1KB0Iy44V3QF+LUzw=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by AS8PR08MB10071.eurprd08.prod.outlook.com (2603:10a6:20b:633::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.22; Fri, 27 Jan
 2023 14:28:31 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::2d3c:c53c:86ba:a3b0]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::2d3c:c53c:86ba:a3b0%4]) with mapi id 15.20.6002.033; Fri, 27 Jan 2023
 14:28:31 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
CC: OE-core <openembedded-core@lists.openembedded.org>, nd <nd@arm.com>
Subject: Re: [OE-core] [PATCH] Revert "cve-update-db-native: show IP on
 failure"
Thread-Topic: [OE-core] [PATCH] Revert "cve-update-db-native: show IP on
 failure"
Thread-Index: AQHZMlUGEUkZaMZ9mU67vW26Vcqnxq6yUeEAgAAAqIA=
Date: Fri, 27 Jan 2023 14:28:30 +0000
Message-ID: <22048688-E275-4E2E-97ED-868DDCBA0DBC@arm.com>
References: <20230127134055.1870465-1-ross.burton@arm.com>
 <628bf7942a37c7e97d50ebcc07080b257b47f315.camel@linuxfoundation.org>
In-Reply-To: 
 <628bf7942a37c7e97d50ebcc07080b257b47f315.camel@linuxfoundation.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3731.300.101.1.3)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|AS8PR08MB10071:EE_|AM7EUR03FT039:EE_|VE1PR08MB5582:EE_
X-MS-Office365-Filtering-Correlation-Id: 7277fc13-ed4e-449b-f86f-08db0072c838
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 WFgQjJKdo7c1dXqw3EPyiUpwj7JWpM3aZF//N4+ILP+TNEkcZjVk91gIx68lEkbw0wWH9EV90Bpe4iZBHvTs4nDZxlLVdUthhPEs3yQv5FnFvfygYDWVHMjMkDMrXIbiKqGrLOZFefjOQ5J2Bzi6HKmRGHvPeAAQvVFhtqFIOutB+Hyh7ObVfRnA6DzVXRzjnj2mCkSxH+5ew54RV328WpLSxrgQvrEpbGddIORA5paN7B3C/PHuCvKSKxXNJFeHdveeSeYGHFgAbwKLarFi48rVvsSk9hCiTufrUXoVfbqAG/3DOukK1PFazgXJaSkiBi8JYcj8/0fDxqah8DHLbrM11KNmKmTDCwbGTfoiQtvgPCGtQN8ae7ixaCI+L6vlT67hvCUHBCGzQj2p0SDcoz9v4lz4GJaeH15pXRdJAaeozGK+XLqSvvakNuvncC4A4edix9CQkI7RuayJdli1gaolOJmdb7dcZ+TCwXkO1Tgd3pzDUVjo3XpuAOCMNFrRRoIaL529bsbyh0TY0BYeGsFr5nf6q/w5hFEWQr8XWq0H99X5Oo9/p+Ra/OX6HUhet7gUb5wvzYoXGbhfzqwACyFfgAnoLbD4Zc7KziehWNTEz7cy9ve7fZK11LxJ8+9Tm3erVkPhBPtMcTjViUIGe0/jcxPtncv1E2YcFAbhf4i0ltIqXvzMnEvdwHu8chfw4MOv1s96/+n7430k2ZpvIGUcwZOSxrOtBpZPGlsatD4=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(39860400002)(366004)(346002)(136003)(376002)(396003)(451199018)(83380400001)(86362001)(15650500001)(2906002)(41300700001)(8936002)(5660300002)(6486002)(2616005)(6512007)(36756003)(8676002)(26005)(33656002)(186003)(6506007)(478600001)(53546011)(38070700005)(66946007)(316002)(122000001)(38100700002)(71200400001)(66476007)(4326008)(64756008)(76116006)(66446008)(54906003)(66556008)(91956017)(6916009)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <C57E8F6CA594D941ACC5833778F271E7@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB10071
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM7EUR03FT039.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	ceb5582e-3905-4aa9-34ac-08db0072c37e
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	vALgIFn17d3pI9DG7NrRPR3U9ogJojoFFz6nSXyoWzAsDbZFDvBFg0igOLlBc9eeSRuBBVWGT606acWXmxvplzdLLAyZ+q9W0gTsxFiVyeb6VAYlndeohjmC84ieuYfl4raQMZOeKjux3wtDmsJCo9UVy1gFbJW1eC59hOxJTxWcyETNjYSVMm9fHIrxH+ayGRUyuQpMdjRA5oaYPe5cNeo1tiTGTnajuXpcqxs5e8Sox72N5ckukIdIjWc8Dpsl2oTFdg/seAJ96MjT4LklXOXkfr3OOrb/VbQA8K4ojcIEXCt/o+l90XOyYMM0VnP6bZvYFZ0dmiCrHF6YCNm/sH9PHTojq5AMjACjqjV7tUQOvUtsbqg/8XgerhF1uUOOk6UHF9jdOnL4vVYL9r48i44Iq4yvf4TPFVnDS2MAwJeIa+FDgvPmSLWR1LuAJTWyvSEX+d+F1VEbUHD2hBhwHU6j5ESbG0JYxGm2X35G5zllNgbBmfx00VYVIZ0Bcuvjndetjwjf43vihuM46edQV8N4dfuFHGiu5paoeAjshjYSopdR3wfs0MvHiplb8j/pTWMZ6cDckz95o9zRUCJYWEMwOJ055E60hclcW/b7rSNaKqzCVdfvWDnMKkfhikRjwCaQrLKjZD71pQsPTv/gREsI3eh8A68+IU5Xm/QCVb5O8mp8+H/vYs+fhwa8vcZ5IwrN2PZDGK5J2fzOQN8YIQ==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230025)(4636009)(376002)(39860400002)(346002)(136003)(396003)(451199018)(36840700001)(46966006)(40470700004)(82310400005)(40460700003)(6506007)(83380400001)(33656002)(2906002)(40480700001)(36756003)(15650500001)(47076005)(6512007)(82740400003)(36860700001)(5660300002)(316002)(70206006)(70586007)(2616005)(86362001)(53546011)(186003)(336012)(26005)(478600001)(6486002)(41300700001)(4326008)(54906003)(8676002)(356005)(81166007)(6862004)(8936002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2023 14:28:38.8037
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7277fc13-ed4e-449b-f86f-08db0072c838
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM7EUR03FT039.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5582
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 27 Jan 2023 14:28:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176450

T24gMjcgSmFuIDIwMjMsIGF0IDE0OjI1LCBSaWNoYXJkIFB1cmRpZSA8cmljaGFyZC5wdXJkaWVA
bGludXhmb3VuZGF0aW9uLm9yZz4gd3JvdGU6DQo+IA0KPiBPbiBGcmksIDIwMjMtMDEtMjcgYXQg
MTM6NDAgKzAwMDAsIFJvc3MgQnVydG9uIHdyb3RlOg0KPj4gVGhlIGJ1ZyB0aGlzIHdhcyBpbnRl
bmRlZCB0byBmaW5kIGhhcyBiZWVuIHJlc29sdmVkLCBzbyB3ZSBkb24ndCBuZWVkDQo+PiB0aGlz
IGV4dHJhIG5vaXNlIGluIHRoZSBsb2dzLg0KPj4gDQo+PiBUaGlzIHJldmVydHMgY29tbWl0IGJk
MWVkZmEzZDViMWMyNGNkMTE5MjYyMGY3MDg1ZWUxZGYwM2UxYWYuDQo+PiANCj4+IFNpZ25lZC1v
ZmYtYnk6IFJvc3MgQnVydG9uIDxyb3NzLmJ1cnRvbkBhcm0uY29tPg0KPj4gLS0tDQo+PiBtZXRh
L3JlY2lwZXMtY29yZS9tZXRhL2N2ZS11cGRhdGUtZGItbmF0aXZlLmJiIHwgNSArLS0tLQ0KPj4g
MSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCA0IGRlbGV0aW9ucygtKQ0KPj4gDQo+PiBk
aWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWNvcmUvbWV0YS9jdmUtdXBkYXRlLWRiLW5hdGl2ZS5i
YiBiL21ldGEvcmVjaXBlcy1jb3JlL21ldGEvY3ZlLXVwZGF0ZS1kYi1uYXRpdmUuYmINCj4+IGlu
ZGV4IGUwNDJlNjdiMDlhLi4wNzlmMDYyZjc5YiAxMDA2NDQNCj4+IC0tLSBhL21ldGEvcmVjaXBl
cy1jb3JlL21ldGEvY3ZlLXVwZGF0ZS1kYi1uYXRpdmUuYmINCj4+ICsrKyBiL21ldGEvcmVjaXBl
cy1jb3JlL21ldGEvY3ZlLXVwZGF0ZS1kYi1uYXRpdmUuYmINCj4+IEBAIC0xMzAsMTAgKzEzMCw3
IEBAIGRlZiB1cGRhdGVfZGJfZmlsZShkYl90bXBfZmlsZSwgZCk6DQo+PiAgICAgICAgICAgICAg
ICAgcmVzcG9uc2UgPSB1cmxsaWIucmVxdWVzdC51cmxvcGVuKG1ldGFfdXJsLCB0aW1lb3V0PWN2
ZV9zb2NrZXRfdGltZW91dCkNCj4+ICAgICAgICAgICAgIGV4Y2VwdCB1cmxsaWIuZXJyb3IuVVJM
RXJyb3IgYXMgZToNCj4+ICAgICAgICAgICAgICAgICBjdmVfZi53cml0ZSgnV2FybmluZzogQ1ZF
IGRiIHVwZGF0ZSBlcnJvciwgVW5hYmxlIHRvIGZldGNoIENWRSBkYXRhLlxuXG4nKQ0KPj4gLSAg
ICAgICAgICAgICAgICBiYi53YXJuKCJGYWlsZWQgdG8gZmV0Y2ggQ1ZFIGRhdGEgKCVzKSIgJSBl
KQ0KPj4gLSAgICAgICAgICAgICAgICBpbXBvcnQgc29ja2V0DQo+PiAtICAgICAgICAgICAgICAg
IHJlc3VsdCA9IHNvY2tldC5nZXRhZGRyaW5mbygibnZkLm5pc3QuZ292IiwgNDQzLCBwcm90bz1z
b2NrZXQuSVBQUk9UT19UQ1ApDQo+PiAtICAgICAgICAgICAgICAgIGJiLndhcm4oIkhvc3QgSVBz
IGFyZSAlcyIgJSAoIiwgIi5qb2luKHRbNF1bMF0gZm9yIHQgaW4gcmVzdWx0KSkpDQo+PiArICAg
ICAgICAgICAgICAgIGJiLndhcm4oIkZhaWxlZCB0byBmZXRjaCBDVkUgZGF0YSAoJXMpIiAlIGUu
cmVhc29uKQ0KPj4gICAgICAgICAgICAgICAgIHJldHVybiBGYWxzZQ0KPj4gDQo+PiAgICAgICAg
ICAgICBpZiByZXNwb25zZToNCj4gDQo+IFNpbmNlIHRoZSBlcnJvciBpcyBvbmx5IHNob3duIG9u
IGZhaWx1cmUgY2FzZXMsIGlzbid0IHRoaXMgYmV0dGVyIGxlZnQ/DQoNCkl04oCZcyBib3Jpbmcg
bm9pc2UgYW5kIGRvZXNu4oCZdCBzZXJ2ZSBhbnkgcHVycG9zZSwgbm93IHRoYXQgd2UgdW5kZXJz
dGFuZCB0aGUgcmVhc29uIGJlaGluZCB0aGUgaXNzdWUgaXQgd2FzIGFkZGVkIHRvIGRlYnVnLiAg
S2VlcCBpdCBpZiB5b3Ugd2FudCwgYnV0IEkgZG9u4oCZdCBzZWUgdGhlIG5lZWQuDQoNClJvc3M=

