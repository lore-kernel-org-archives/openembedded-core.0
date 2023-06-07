Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F07CBC7EE29
	for <webhook@archiver.kernel.org>; Wed,  7 Jun 2023 10:32:16 +0000 (UTC)
Received: from EUR02-DB5-obe.outbound.protection.outlook.com (EUR02-DB5-obe.outbound.protection.outlook.com [40.107.249.43])
 by mx.groups.io with SMTP id smtpd.web10.5042.1686133931408219449
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Jun 2023 03:32:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=DMqmj85m;
 spf=pass (domain: arm.com, ip: 40.107.249.43, mailfrom: ross.burton@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k2vMUdwGr80vW1ottfZ8dz6FJ9yXY78ywa1qg9a1jfY=;
 b=DMqmj85mM1+mIGxDyON0dXPMD67KSY8gGX89kfpJHQTWPl5ctaDgi14d7Jox5244xIuOnKe/rWEnTz4w9jhpvX3cXC8JLrKMfRvKFPBp/7y3YE4ATKr+4nAdkEZdwIHviIgkqzyPsZkPLp+vlXmeRduc1uF5NjDxy+w31GuwNmc=
Received: from AS4P195CA0046.EURP195.PROD.OUTLOOK.COM (2603:10a6:20b:65a::27)
 by GV2PR08MB8195.eurprd08.prod.outlook.com (2603:10a6:150:7b::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.32; Wed, 7 Jun
 2023 10:32:05 +0000
Received: from AM7EUR03FT056.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:65a:cafe::60) by AS4P195CA0046.outlook.office365.com
 (2603:10a6:20b:65a::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6477.19 via Frontend
 Transport; Wed, 7 Jun 2023 10:32:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT056.mail.protection.outlook.com (100.127.140.107) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6477.19 via Frontend Transport; Wed, 7 Jun 2023 10:32:05 +0000
Received: ("Tessian outbound 5154e9d36775:v136"); Wed, 07 Jun 2023 10:32:04 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: b1b718c50496acfb
X-CR-MTA-TID: 64aa7808
Received: from bfb56dc03257.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 973D715F-611F-4895-9EF6-5845550FD776.1;
	Wed, 07 Jun 2023 10:31:56 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id bfb56dc03257.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Wed, 07 Jun 2023 10:31:56 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HTGhkVgD29UV1WXhdnd843mH5L5xn4NH3pSc9EkinMjbKiaSGoWbc0/z+x+w67S1bJodOYZStMFx4pB6BD+QQ+yazBWrr2XlyTeXAmIKgWzA0+Y3L/4x4jUYLoO4bbWapANDIncAvCvFNNHbW+sRtu3/oARY3FnOvjT4CsrDCeHRaV1Y7vMpPm0tQuLa0Tmyat//zQEnh00aGGhtMlWzIe3cP+oM/av2WU6F6Y79evM3+H198VUgpYArAVWoKvaRlor+eVdQXGO7scIhk8SA3h2PRKrrfkULL2l9jrNSubQKEzN3ifEgiCrSRjBJMND0QxI8k/Xw+qUaUcX3JSnC+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k2vMUdwGr80vW1ottfZ8dz6FJ9yXY78ywa1qg9a1jfY=;
 b=OK0MZgChZlZqg1MYEhSi48TuDFGCjJZG9pxrWzPTvwglJxU71jmAEviNV0D2JPOly4Ut7FELjqNHtGet5NZGbCJ4KXL9+yRs8mIDw3vqhwh4pBUV1Glc10pKnXnMyqKFMze5MOUR1VlIJidxJsmpblEFwNrqZwvMkEg1k9V0I9KYS4e8FejrMm7Hlcos7olzx84qefUPzl0qYU0cPgdRo5wJyqvzzB0PdhYIVQjlZpngsyOCytm0dWG4+jxRm27fYwqOtoSF41f04Z70twtyHuNiRveO6JOSZuD1btxy1pOV7rEh28iPS66/rqZ6ASuKqx+E8jpJ2kwAJa8dvlNz0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k2vMUdwGr80vW1ottfZ8dz6FJ9yXY78ywa1qg9a1jfY=;
 b=DMqmj85mM1+mIGxDyON0dXPMD67KSY8gGX89kfpJHQTWPl5ctaDgi14d7Jox5244xIuOnKe/rWEnTz4w9jhpvX3cXC8JLrKMfRvKFPBp/7y3YE4ATKr+4nAdkEZdwIHviIgkqzyPsZkPLp+vlXmeRduc1uF5NjDxy+w31GuwNmc=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by AS8PR08MB6343.eurprd08.prod.outlook.com (2603:10a6:20b:337::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.32; Wed, 7 Jun
 2023 10:31:52 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::eb3c:9b42:21c9:494e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::eb3c:9b42:21c9:494e%7]) with mapi id 15.20.6455.030; Wed, 7 Jun 2023
 10:31:52 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Marta Rybczynska <rybczynska@gmail.com>
CC: Richard Purdie <richard.purdie@linuxfoundation.org>, Yoann Congal
	<yoann.congal@smile.fr>, Geoffrey GIRY <geoffrey.giry@smile.fr>, OE-core
	<openembedded-core@lists.openembedded.org>
Subject: Re: Drafting a fetcher for kernelcves
Thread-Topic: Drafting a fetcher for kernelcves
Thread-Index: AQHZmDvchnJKmG29g021Bqs4EwF7pa9/JggA
Date: Wed, 7 Jun 2023 10:31:52 +0000
Message-ID: <BDB9EDE4-1DBB-4607-AA22-C74C26B655DE@arm.com>
References: 
 <CAApg2=S9UFXCCtL2ByH7Y3_pYVvLmJUO945=RuFNqNg=nXyo9w@mail.gmail.com>
In-Reply-To: 
 <CAApg2=S9UFXCCtL2ByH7Y3_pYVvLmJUO945=RuFNqNg=nXyo9w@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3731.600.7)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|AS8PR08MB6343:EE_|AM7EUR03FT056:EE_|GV2PR08MB8195:EE_
X-MS-Office365-Filtering-Correlation-Id: 031231cc-4361-4f69-4c56-08db67427040
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 enGZSiK/5F4X/WT06wkACP2V18QExvY6QuaLEcPGWoFC80ayLxWHPK0SJpCy5xwLG+npOt2HuXfO5kKRdzkGEDorra2Ffzqo3mSIQDxYqzUvuOG/EtRPc4tXfxB4pSHc3sSS3BFb+WFkKZGwmiuDIS61ZtJ1h/o05k/0odHn2jQua0EQLDL4W2VOYT/0+qeQbpMKnPZ/xSna8SJF5wWHlKbSornuwadDjoJyXrX1JyDtdj27XiQh8KmOsod2de/OfAAXOZNVgMoYLwTlfpxRkhsD8i1iMp6OrMNjFPc93Q0mBaqYwHpSECfiXrLOKK0EUvC1/Hb26aAQR1Bi6R+1rFl9lmrhG5hrjrHITyAOMPYt47FaJgSQRc/XvR19k1S6Y5XlpNxUdu4b74Igbi5fdaMmLPIYlh9kOveiqh992QdjdPYoZsFyiNmwP6ZBMj2JUHgom/1fKR7xMzSoWbHkjBzKHAsGsFN8ofVxRsYNOsvfRFiRaefadN6IziRLrZzV6yn4NX53j6rNQKwfpMovRLhZiCY7O8qXFmi+C7DimOGDGTN07dfX0k7VX/tzuSBtC495FViP82vWbGfmEXBHd920Kt1++dshPT+0YMFTa1ksQEJo3AIuvYYgDLGfFkp6zHyQntOGWDBqEIGoPx1nvg==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(39860400002)(366004)(346002)(136003)(376002)(451199021)(54906003)(71200400001)(478600001)(8676002)(5660300002)(86362001)(8936002)(36756003)(33656002)(38070700005)(2906002)(66946007)(91956017)(66446008)(4326008)(66556008)(122000001)(64756008)(6916009)(66476007)(76116006)(316002)(38100700002)(41300700001)(83380400001)(2616005)(6506007)(6512007)(53546011)(26005)(186003)(6486002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <42925016B73A9E4F8F1EB10962FAF36C@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6343
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM7EUR03FT056.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	3e9467cd-df0b-4608-c690-08db6742689b
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	+gZJMdPugnzIoiakvLXCZxPmhB4kCPbmCNkjRe86B3VpQITAmcqQW8oocptjnC6t9WRKNKchiZuFo1by37D0M/Z5dbzGZYlId4j2LfEagV0Pb7hr1pbSHde8UyFTsb0ioMTSuumTO30RDV25/LhexZAM0QLJKJq8drYAWFieK6Okn/fE2bu3ox32qo/SamRm4tPk0RQVk3WA5OfA6EZcqqYMyKQEUnJ5K6oEfPHXfU9a9XSnSI7dz+jmRXk7uIlB9Dp8dYyMcdfIDd7+MAjwHNx8w7Q9Mii4uNApZxxowwRWuKTLSdQpe4xFurkF8DqZC9MSTOJ8QeZiePz/WjaKHkQDRFQcThHiwIliuHYHKSUdlFSHKWLmvjaXRw4PsNVgqOaaPn4vqcsKIyT+ciBqO/7wlQj2I06XiVPfb9aCHb10J4IQoPksdtrD6BmrJ/UhAPb5YQvjpyXtkvYkdX0+0MBFfOP81JiDBfXq11+APmBVkv/AYaguRgnc+nHCqdnFLm5K2MK+VbuvHHTpk/KIIdExM9ph1xQ/QbptCmQcsQKGudOPnZTJXaBh/WCuCJo6TQHQUcnvhA7KRsS3pUlWsC5f2eWZNfWsI41wjjEAdGGlvoNFrL5I3KvTtUckHXZjT+ycCjsxKTCws2EBeCpMBQm4C+g6L7WEyXDTTG/HxMKyGBZwwSpDodexDw5IWvRIFEm2tYOGYJ3quiuoRg/IAvxOY/FwGcuvuKIJfH6HKCE=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(346002)(136003)(39860400002)(376002)(396003)(451199021)(40470700004)(46966006)(36840700001)(6506007)(186003)(26005)(6512007)(53546011)(2616005)(336012)(83380400001)(47076005)(36756003)(6486002)(54906003)(36860700001)(82310400005)(2906002)(6862004)(8676002)(8936002)(40480700001)(33656002)(82740400003)(478600001)(40460700003)(41300700001)(5660300002)(316002)(86362001)(4326008)(70206006)(70586007)(356005)(81166007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2023 10:32:05.1196
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 031231cc-4361-4f69-4c56-08db67427040
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM7EUR03FT056.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB8195
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 07 Jun 2023 10:32:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182470

DQoNCj4gT24gNiBKdW4gMjAyMywgYXQgMDY6NTcsIE1hcnRhIFJ5YmN6eW5za2EgPHJ5YmN6eW5z
a2FAZ21haWwuY29tPiB3cm90ZToNCj4gDQo+IEhlbGxvIGFsbCwNCj4gSSdtIGRyYWZ0aW5nIGEg
ZmV0Y2hlciBmb3Iga2VybmVsY3ZlcyAgKGh0dHBzOi8vZ2l0aHViLmNvbS9ubHVlZHRrZS9saW51
eF9rZXJuZWxfY3Zlcy8pIGFuZCB0aGUgZGF0YSBjb25mbGljdHMgaW4gYSBjZXJ0YWluIHdheSB3
aXRoIGN2ZS1leHRyYS1leGNsdXNpb25zLmluYy4gV2l0aCBtdWx0aXBsZSBmZXRjaGVycyB3ZSds
bCBuZWVkIHRvIGhhdmUgYSB3YXkgdG8gc2F5IHdoaWNoIGRhdGEgc2V0IGhhcyBwcmlvcml0eS4N
Cj4gDQo+IEZvciBub3cgSSBjYW4gc2VlIGV4YW1wbGVzIG9mIHR3byBjYXNlcyAoaW4gYWxsIGNh
c2VzIHdlIGdvIGZvciBhIHNwZWNpZmljIGtlcm5lbCB2ZXJzaW9uKToNCj4gDQo+IENhc2Ugb25l
Og0KPiBOVkQgc2F5cyB1bmZpeGVkDQo+IGxpbnV4X2tlcm5lbF9jdmVzIHNheXMgdW5rbm93bg0K
PiBjdmUtZXh0cmEtZXhjbHVzaW9ucy5pbmMgc2F5cyBJR05PUkUNCj4gDQo+IENhc2UgdHdvOg0K
PiBOVkQgc2F5cyB1bmZpeGVkDQo+IGxpbnV4X2tlcm5lbF9jdmVzIHNheXMgZml4ZWQNCj4gY3Zl
LWV4dHJhLWV4Y2x1c2lvbnMgc2F5cyBJR05PUkUNCj4gDQo+IEluIHRoZSBmaXJzdCBjYXNlLCB0
aGUgc29sdXRpb25zIGlzIElHTk9SRSAoc29tZSBvbGQgQ1ZFcyksIGluIHRoZSBzZWNvbmQgb25l
IGl0J3MgUEFUQ0hFRC4NCj4gDQo+IFRoZSBxdWVzdGlvbnMgSSBoYXZlOiBTaG91bGQgY3ZlLWV4
dHJhLWV4Y2x1c2lvbnMgYWx3YXlzIGhhdmUgcHJpb3JpdHk/IFNob3VsZCB3ZSBhbGxvdyB0aGUg
dXNlciB0byBzZXQgcHJpb3JpdHkgb2YgZmV0Y2hlcnM/DQo+IA0KPiBXaGF0IEknbSBnb2luZyB0
byB0ZXN0IGlzIHVzZSB0aGUga2VybmVsX2N2ZXMgZmV0Y2hlciBmb3IgYWxsIGtlcm5lbCBDVkVz
IGFuZCBOVkQgZm9yIGFsbCAgdGhlIHJlc3QuIFNob3VsZCBpdCBiZSBhbiBvcHRpb24/DQo+IA0K
PiBJJ2QgbGlrZSB0byBhdm9pZCBhZGRpbmcgdG9vIG1hbnkgb3B0aW9ucyB0aGF0IG1ha2UgY2F1
c2UgbWlzdGFrZXPigKYNCg0KSeKAmWQgc3VnZ2VzdCB0aGF0IHRoZSBvcmRlciBvZiBwcmlvcml0
eSBnb2VzIE5WRCwgbGludXhfa2VybmVsX2N2ZXMsIHRoZW4gbWV0YWRhdGEgKHR5cGljYWxseSBj
dmUtZXh0cmEtZXhjbHVzaW9ucykuDQoNCldpdGggZGF0YSBmcm9tIGtlcm5lbGN2ZXMgYmVpbmcg
cHVsbGVkIGluIHdlIHNob3VsZCBiZSBhYmxlIHRvIHB1cmdlIG1vc3Qgb2YgdGhlIGRhdGEgaW4g
Y3ZlLWV4dHJhLWV4Y2x1c2lvbnMgYW5kIG9ubHkgdXNlIGl0IHdoZW4gd2XigJl2ZSBiYWNrcG9y
dGVkL3Jlc29sdmVkIGEgQ1ZFIHRoYXQgaGFzbuKAmXQgYmVlbiBtZXJnZWQgdXBzdHJlYW0uDQoN
ClZlcnkgcGxlYXNlZCB5b3XigJlyZSB3b3JraW5nIG9uIGZldGNoaW5nIGZyb20ga2VybmVsY3Zl
cyB0b28sIGFzIG1hbnVhbGx5IG1haW50YWluaW5nIHRoZSBleGNsdXNpb25zIGlzIHRpcmVzb21l
Lg0KDQpSb3Nz

