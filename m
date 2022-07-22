Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5150BC43334
	for <webhook@archiver.kernel.org>; Fri, 22 Jul 2022 16:17:57 +0000 (UTC)
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (EUR01-DB5-obe.outbound.protection.outlook.com [40.107.15.49])
 by mx.groups.io with SMTP id smtpd.web10.9858.1658506668069808119
 for <openembedded-core@lists.openembedded.org>;
 Fri, 22 Jul 2022 09:17:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com
 header.s=selector2-armh-onmicrosoft-com header.b=POXQoUG3;
 spf=pass (domain: arm.com, ip: 40.107.15.49, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=O3+1DJxUwUuWhZ/FV9ALqqzGU2qxKTH/N8XYV87Wtn2ALuSbu4BwYWfTm9wJ0UUsuju7RnpUbbgiq3/76wOSsogKV3Bo6xrDjkDmlTlpqxyGG4vd6hUZQC71rpZR1qJvoR7ZRO/CEw4vA7CUNc47lC2yO7KCAZJENQgD/uC9aXCsXy+Ds1C46k3euRwO+kslvUXWH6xlHN2WOGl32wxwNOA6hR8ng9N5pyPMBWaexpbHwpHjyZYTHopfDXaxJQy2+Mf/96uj61i0DB6ppp97z1ov1D350hb6v07z3VAWP8P1IpUp6wnBl7NiOyFUYXMHcJKvTqvTLVhwL507Hbx+1Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i3PLptYersihST0s1hB0Hv8xzImsIIfotlobKK9LIro=;
 b=ZZX+8VC6hkbK/4OelduDfWiW6CN6W0z5PQHznWQJj+pLxlmDNpIMipuimqVLnpclffKOJ6LIL2rVqSBBMKwVuP56Erm95L1Fw/F8VjQHSAcKMhH7EXyTpJjNTubOIjkCM98TsXrQHJ+JNnI0MPfgtE9IqNmbwCjqtCngsz9dC9MOZr11WoHzdHdU7yW9V9rcBei5xU695ZsxvXbh6VBSTvHcx+HbqjtaaCHewrwh9XPxyxmzwavJePNpMHb76z6CI9V+dTEWksv0TGd+OV1ZDBl4QHxh3l9kJD/qNLf5qFbjKxGor2vIVwoh+xT4BnIStOhsYTB4OPmlROgxu0Gsfg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i3PLptYersihST0s1hB0Hv8xzImsIIfotlobKK9LIro=;
 b=POXQoUG3xnzrGYopGMXr17Fs0TqSIRD5JsBNGES2q9kfPJBCLw6lXu5QIdEj6yk+GM4GAz4EYvZJZDE4a81L1rry/F32rwGSyOn3YZU001e6SjtG1YT0e9A6YOT9Rko051TSuuNHT8x+Qau6WtbHjMSEFZjH0C0P4LD/3NVcTmY=
Received: from AS9PR06CA0507.eurprd06.prod.outlook.com (2603:10a6:20b:49b::33)
 by AM6PR08MB4820.eurprd08.prod.outlook.com (2603:10a6:20b:d0::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.19; Fri, 22 Jul
 2022 16:17:44 +0000
Received: from AM5EUR03FT021.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:49b:cafe::e3) by AS9PR06CA0507.outlook.office365.com
 (2603:10a6:20b:49b::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.18 via Frontend
 Transport; Fri, 22 Jul 2022 16:17:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT021.mail.protection.outlook.com (10.152.16.105) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5458.17 via Frontend Transport; Fri, 22 Jul 2022 16:17:43 +0000
Received: ("Tessian outbound 63c09d5d38ac:v123");
 Fri, 22 Jul 2022 16:17:43 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 7a617b651ee72c5b
X-CR-MTA-TID: 64aa7808
Received: from bee5d792a199.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 3FF1F37E-2FC1-4BD4-BBD2-B133E88BF57A.1;
	Fri, 22 Jul 2022 16:17:36 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 bee5d792a199.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Fri, 22 Jul 2022 16:17:36 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OLjmrZBVkJF7FMas5xs4Z8RehAKx8SOAiJirMYjXi7dibULOEX0vdCIHN4bPtUu1v4F6CctvHAIgZVneoR5vF15sWQXoSVZ3YV0kpm+TdRXRb0EXpYXlnPTv4jPI5s+oQqXwpBEtQOg37W4MHOykvBAt+fAobjOks9m9nzyBwSJrwpPPXP+z0PFJJdwxbnBQ73/7zX0vixibtPXnhAnvvjrj1NrO3/IAG8pbdBHYY6o/msf2N5bdU7jesUxM8cHijU/IQP7XpnlwqjrIb0M/Ww3DK0NK7aFs+mIc3WzA5XiKTqe20BXf8n3ymCdo2CucNSXzq1Gi8I8kI0/7LhoxGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i3PLptYersihST0s1hB0Hv8xzImsIIfotlobKK9LIro=;
 b=fS+Y5lJpbqOjrOx1azxLMy/dEPg9H+WkNImkRhNXu8THh8JL8F9nBJ6nR/ls/ifpZTPAH+tgcUyF9fCCIiK12dieE/GUh7e/Bz6GHWLjItq4lt/58BphSy7JdVcUTwMJ//ctuo8iK6rNfNHtkT882fZcamVTTVcPX2rRjTkeEmHGyNx1M4qnhSjqA1Nk7pWGwOqolMaHZtLxn85PicWCEg+dm771wbSZ5vhsElAVXAyvhMCyXd9T0ZnmvMgvNOovYA5Sq0rC1h2JFS+1y60G/MonBqUqBpGXGj7uGxh4UFfu4XMXsLE8xcFq+pNMMDnxOm1mta0eFUYeM75KOci4/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i3PLptYersihST0s1hB0Hv8xzImsIIfotlobKK9LIro=;
 b=POXQoUG3xnzrGYopGMXr17Fs0TqSIRD5JsBNGES2q9kfPJBCLw6lXu5QIdEj6yk+GM4GAz4EYvZJZDE4a81L1rry/F32rwGSyOn3YZU001e6SjtG1YT0e9A6YOT9Rko051TSuuNHT8x+Qau6WtbHjMSEFZjH0C0P4LD/3NVcTmY=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by VI1PR0802MB2430.eurprd08.prod.outlook.com (2603:10a6:800:b1::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.21; Fri, 22 Jul
 2022 16:17:33 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::fc06:20ca:a7cd:4d72]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::fc06:20ca:a7cd:4d72%9]) with mapi id 15.20.5458.019; Fri, 22 Jul 2022
 16:17:33 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Khem Raj <raj.khem@gmail.com>
CC: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] zstd: do verbose builds
Thread-Topic: [OE-core] [PATCH] zstd: do verbose builds
Thread-Index: AQHYnbwf3q9JDIRFT0Sa7G6krwnuJq2KeoyAgAAXFIA=
Date: Fri, 22 Jul 2022 16:17:33 +0000
Message-ID: <93D9E7BB-46A6-465B-84DC-A9EBD7FBCDC6@arm.com>
References: <20220722111336.2143770-1-ross.burton@arm.com>
 <CAMKF1sqpH1MfeVVuY_GDegP8wNnKsXJNEfsaFdU2oxboZhT0Fg@mail.gmail.com>
In-Reply-To: 
 <CAMKF1sqpH1MfeVVuY_GDegP8wNnKsXJNEfsaFdU2oxboZhT0Fg@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3696.100.31)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 06da7778-0db6-4791-111a-08da6bfdb51f
x-ms-traffictypediagnostic: 
	VI1PR0802MB2430:EE_|AM5EUR03FT021:EE_|AM6PR08MB4820:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 QeqwQwHZi6h2+8HBGhINPmWArleZRxpMXuxKwTjjUa9C235IMNSXQC4xJupbY+Qdxd/T6v/0NbNq6SHr+uOAVXBQvoYCyV98PjNNaS5i/r4SGiLCFr6FM8Yiex52/sdSJMST5wcZeY7S5F6CeVmbgJKF+FXm0qSD/5k8imVH/9xoQXVYqhNzd/gb/Zq+PnbD1q59/R5dGsxLRO0o0hmqkbz6moLE5BEpfdalnx4zGbHJ9L2sRyw9rw08xXqKsgVY2iV/JhQUd1qaWBi6NthPzGdsZThtnmMJUlYivJJxN556ChnoFgeebrJxerDmdHeqMhSBS4vPEicvxpB4J885+wDsHSFbAhAawyrFX/totH/UzUK/U352+RwZVDTHj8vXNy4nHqdtq8iuefeHNPhP5nG3gPuwlGXyES+NRp014A62FimODqX/bOr7AkDV62hLID1Ud38zU4bHOlo/DKfeHCz+7FurP3zmauZryssBYCa4oBp326WycDkFftq1WmsVv9evcexcVvUNfIe7fV1ZuLOQrUVqMZZGQ7NGsKqX7NZ6BVn+tZyGblLTYklebAymIDKVEx4wIk2sWN6DWHpczmXPXhQOGpk0g6RtjhwE6/HDelOTy03I5Hj0DLWsd1D6bwGbZQ2kI2n03L6DTttAMeeEKKsfZb8YbB0Nus8jXT4vB+IFW0ejwV+oax9nW/UMxBgAwA/V0YX38JR2/KXFVa8Wp6XM4xh4Li6FKxffj4tavUVicRAe2l6U6XMXQbQEM/NzzRlxyRs/Z1hKB/vcxQ1lxnBe2/bzjIPPXJV34raGON7wVUzelqFdgCiYe7zpA5jCR0v3IrkbJyE0CyfI6w==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(396003)(136003)(376002)(366004)(39860400002)(346002)(186003)(64756008)(66946007)(66476007)(91956017)(66446008)(71200400001)(6916009)(66556008)(8676002)(6486002)(36756003)(2906002)(76116006)(6506007)(53546011)(26005)(6512007)(2616005)(38070700005)(4326008)(8936002)(316002)(5660300002)(4744005)(38100700002)(122000001)(41300700001)(478600001)(86362001)(33656002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <B888B408832E48469FC8AEF6C638C48F@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0802MB2430
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM5EUR03FT021.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	26792b23-31e5-4c98-ca70-08da6bfdaf53
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Lim4ADaEt7aVxdC4PiRLo/w5BgmdvYleEkCkdTzZ7+YeJmQjrLbwzYlI2KJ2ltc8fABZI3JlVo3Gy/FOEGgbHgJFgifXP40mDiTrE8UaROYH/PzsrEbZ9t3DVRRhqDU2g89RCr7Dt2P8yjuGCfbapN7Av0IwjwfnIlK1nLGZB/M5GJXObvulqYD7FdZkEh9B2XiWfr4jrEu+FKEFs5PeQVy6/B3z+CItDfMPXcyhpz7N7VS+778s+Z4jx+VQWtFSJptq4dQsd+60+9ktas4wqjrjJ/bGrlyZwMePoM7Ydi5NU5emDZ5T8bi1BTDaHIoA1DnIz0vQA655GmMgwq/Swce+z6UrS1mUMTlqe0mY6iwxWzCpBSqNU4+mOo9g5Jqb78wIvXIxMSYaDJ9APywu1d7yYh1lHbpogxVBF86+0OKKLB3OZKIsc2+09K38AmBLZ8mK5WgfCphR1VF5pugbqVLXOX0BgK2iqziHa65f6+sADTAGYaK+u/By32olAEWpBKZUenfxi5/Rm+vMPxTV2y9xy9MaJuceFZlGadYl6MvDsDtaFsy5PeB4/24CG25fJXDxi1suFTM8ShpN1j8svLXZT7Sk7qhtC2R9p7tUrP4g7Lj3xDnDVF2/ZGT1r7Q00+JZ/bvXwnFvOsUux4nqPrdJIMFSDDvK9SgJp5Ms7pQT1aXfnMNczECmssin57oPrVeEF4BxPg/zQpqai7o45+zd3XGjI6Vpwg0ZggLbX/5kMFNRsuWQLLMcClRH2eHHYdMBMpe5ssIa3j37FHOvXzdY3v7jWmYcsMWWec+hd0Kj+sWFgREfqSd8CX/E2A26
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(136003)(376002)(396003)(346002)(39860400002)(36840700001)(40470700004)(46966006)(186003)(70586007)(4744005)(4326008)(70206006)(8676002)(478600001)(6862004)(6486002)(41300700001)(5660300002)(8936002)(26005)(40460700003)(86362001)(6512007)(2906002)(6506007)(36860700001)(53546011)(33656002)(356005)(2616005)(40480700001)(82740400003)(36756003)(82310400005)(336012)(47076005)(81166007)(316002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2022 16:17:43.5487
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 06da7778-0db6-4791-111a-08da6bfdb51f
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM5EUR03FT021.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4820
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 22 Jul 2022 16:17:57 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168415

DQoNCj4gT24gMjIgSnVsIDIwMjIsIGF0IDE1OjU0LCBLaGVtIFJhaiB2aWEgbGlzdHMub3BlbmVt
YmVkZGVkLm9yZyA8cmFqLmtoZW09Z21haWwuY29tQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+IHdy
b3RlOg0KPiANCj4gT24gRnJpLCBKdWwgMjIsIDIwMjIgYXQgNzoxMyBBTSBSb3NzIEJ1cnRvbiA8
cm9zcy5idXJ0b25AYXJtLmNvbT4gd3JvdGU6DQo+PiANCj4+IFNldCBWPTEgc28gdGhhdCB0aGUg
Y29tcGlsZSBsb2cgaXMgdXNlZnVsIHdoZW4gdGhpbmdzIGdvIHdyb25nLg0KPj4gDQo+IA0KPiB2
ZXJib3NlIGxvZ3MgZG8gYWRkIHRvIGJ1aWxkIHRpbWUsIHVzdWFsbHkgd2hlbiBidWlsZCBmYWls
cyB0aGUgZXJyb3INCj4gcGFydHMgYXJlIGdvb2Qgd2l0aCBkdW1waW5nIGVycm9yIGFuZA0KPiBj
b21waWxlciBjbWRsaW5lLCBpcyB0aGF0IG5vdCB0aGUgY2FzZSBoZXJlID8NCg0KSXQgZG9lc27i
gJl0IGR1bXAgdGhlIGNvbW1hbmQgdGhhdCBmYWlsZWQsIGp1c3QgdGhlIGVycm9ycy4gIFRoZXJl
IGlzIG5vIG1lYW5pbmdmdWwgaW5jcmVhc2UgaW4gYnVpbGQgdGltZS4NCg0KUm9zcw==

