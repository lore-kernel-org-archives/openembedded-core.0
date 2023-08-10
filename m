Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7649C001DE
	for <webhook@archiver.kernel.org>; Thu, 10 Aug 2023 10:26:25 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (EUR04-HE1-obe.outbound.protection.outlook.com [40.107.7.89])
 by mx.groups.io with SMTP id smtpd.web10.14081.1691663178971433946
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Aug 2023 03:26:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=z2GWRlhv;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=z2GWRlhv;
 spf=pass (domain: arm.com, ip: 40.107.7.89, mailfrom: ross.burton@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=esFUWgiwXF9+BgT91jaFT8iZgsJ3E4Jvesq2oc6/YUE=;
 b=z2GWRlhvlCwHGKSH5T5AiVfXx9lXpFerwj+Af6LykCEDBDsCgO0BaqiDLCxoTjoXOwLFe0hXObXUL46uiLE2RqBZZdzP5fuQEo2SJFd1AYpO5PPr0ZvJrq8RtfeYCUhvT3AehZAiYTdkGFR1TvGAK13xRR+T04TY1kzRsixGAaU=
Received: from DB8PR06CA0012.eurprd06.prod.outlook.com (2603:10a6:10:100::25)
 by PAXPR08MB6576.eurprd08.prod.outlook.com (2603:10a6:102:15a::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.30; Thu, 10 Aug
 2023 10:26:13 +0000
Received: from DBAEUR03FT021.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:100:cafe::56) by DB8PR06CA0012.outlook.office365.com
 (2603:10a6:10:100::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.30 via Frontend
 Transport; Thu, 10 Aug 2023 10:26:13 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT021.mail.protection.outlook.com (100.127.142.184) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6678.18 via Frontend Transport; Thu, 10 Aug 2023 10:26:12 +0000
Received: ("Tessian outbound f1e964b3a9be:v145"); Thu, 10 Aug 2023 10:26:12 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 8feca70751492e9b
X-CR-MTA-TID: 64aa7808
Received: from e2f1187e4b48.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id DA7B94D6-3843-4F0B-8234-FF08E649D9D0.1;
	Thu, 10 Aug 2023 10:26:06 +0000
Received: from EUR03-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id e2f1187e4b48.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 10 Aug 2023 10:26:06 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Vp95XiFmx23bn0uNm8OM4RKwvlEITEBeXyPhXqowVMrVS/jvDNC6SpcfQU4aO6mLpMY6AC7o9eXO0lozZ6ts48xM9e3BlhaBKSQUXSko/De9rvwpgGlBN07lFHQz1X05Dq8l3bFyY/AqhWenY/PJr8l7qJu3UdjwOZ6oAPOMkGEdH+HZpJIlJP+IgG3evzN/Fq0lq7Qx8q3z0IPIQ0peZkEq6Tnmhc072PDYJTZ+L215nccFCvI93OPKmfcu8UAF1Q8OF2GvaxJuYFerDImKnim1W3QRNxLSsKfobUgBln3qnF72At3NyDvQ+LtPM7IM6pfmcZ5ADknh25DGJkl5og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=esFUWgiwXF9+BgT91jaFT8iZgsJ3E4Jvesq2oc6/YUE=;
 b=G3thdsIDNIQJxI40BgRZCo5/CPJQSt/2ozFDaBIsIJUmHUx9/QFcyHvDulmILiUDrpiYeuTt+HoQVAgy5WmVYzl8Ov19ppj4H4TsOnSNYMr3/Vxs3/sW5CYw9WOp8Afp68/NGc8Oavoa8g3m9GNd+bcYQlE8s/OCKvzDtPN1z7qSA5q4nhf+4XZnD6bnJR5efgFM8Adf6mqlFoOhKzJwS8SNy929itHr9Go424PFP1O5vCNI2gHMtcgT//Lu0iCGIGultQewRr/8FQkx4A5QXISEfnjLQqVo6yr6XFhQu/tctU1DBamwCT+Ccxcew1Z313b8PfOXUUYIKMJLQn1knw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=esFUWgiwXF9+BgT91jaFT8iZgsJ3E4Jvesq2oc6/YUE=;
 b=z2GWRlhvlCwHGKSH5T5AiVfXx9lXpFerwj+Af6LykCEDBDsCgO0BaqiDLCxoTjoXOwLFe0hXObXUL46uiLE2RqBZZdzP5fuQEo2SJFd1AYpO5PPr0ZvJrq8RtfeYCUhvT3AehZAiYTdkGFR1TvGAK13xRR+T04TY1kzRsixGAaU=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by DU0PR08MB8732.eurprd08.prod.outlook.com (2603:10a6:10:400::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.30; Thu, 10 Aug
 2023 10:26:00 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::4b8a:7518:c642:5727]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::4b8a:7518:c642:5727%7]) with mapi id 15.20.6652.029; Thu, 10 Aug 2023
 10:25:59 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Marta Rybczynska <rybczynska@gmail.com>
CC: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] linux-yocto: add script to generate kernel CVE_STATUS
 entries
Thread-Topic: [PATCH 2/2] linux-yocto: add script to generate kernel
 CVE_STATUS entries
Thread-Index: AQHZyd/MaXrjJ9SxRUySRnYynpuqjK/jVkUA
Date: Thu, 10 Aug 2023 10:25:59 +0000
Message-ID: <6FDCF0C4-0B64-4E5D-8114-EBFB26AC42E0@arm.com>
References: <20230807162807.4037215-1-ross.burton@arm.com>
 <20230807162807.4037215-2-ross.burton@arm.com>
 <CAApg2=T5C4AKG95NwsXnZ-7GDJTknxmTdPcqCHTOKoL61TaQwA@mail.gmail.com>
In-Reply-To: 
 <CAApg2=T5C4AKG95NwsXnZ-7GDJTknxmTdPcqCHTOKoL61TaQwA@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3731.700.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|DU0PR08MB8732:EE_|DBAEUR03FT021:EE_|PAXPR08MB6576:EE_
X-MS-Office365-Filtering-Correlation-Id: 5b064b50-003d-46c1-08f5-08db998c38b3
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 MZfKWG2Yoj6nyHQfdZkdxnrrvK5mAQKO8DixgGN9hjaLrHyVFNBebzSpD8Y5Lq4Rw6V0OXwGk8yqF9s7qIMFmT7TyBZTy8Oa120KaZvDomZ0mGU/PkVrYg6CYGHRcgmFKkrdKBPD4fmFGaZogK10YxCDTEoSEqx7T1CkjNihhr9uMpDGETzd1U/g4+o5sqUa7Ks4YPx9o183ekWBa8ox2QEFbnKlN2yamiC0Kdfxmz3S8a8o6sKlJaIgrnJrzOOUb5CCqxw99iSq2HMnU8EqW4Ml/x6GW+DXAjcipLLIoV5qcck8a6zrQpGGPUc3WLJDtOMIdsvkMIROG3qhfZr9evWLDz2yHw3DQtr8U1JjTKUnJfzlf0AgQ05C9ZfPUskofD7iuxXhyctaVKN+9m1HSOCrYNcoR+wZ0wQXUl9/W4vfzMnzCTnU/QWXHJab6Gb/Jd3tj/X3WRJmBbWwEroivlJSZAHdJVhXyk8HHjg5I22Jv0uQgn+YyNvV9JWratqi1ywQuG2iWrhT/BjL4Zs1FKnAptFoPO+2PDXqGijg2i9ENNLFKwpgR8S7sygZ0aqwXuUaVtiUBILWjnmy9EofELhUvcQ0EoriNtctQ0Lotjcs3G0eD/lunNEuF70XRoA6Tq472XDayMs5KKB447WDzg==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(39860400002)(136003)(346002)(376002)(396003)(451199021)(186006)(1800799006)(4744005)(478600001)(2616005)(38070700005)(83380400001)(33656002)(6506007)(26005)(53546011)(86362001)(15974865002)(122000001)(38100700002)(2906002)(6486002)(6512007)(71200400001)(36756003)(66556008)(5660300002)(4326008)(64756008)(6916009)(66446008)(91956017)(66476007)(76116006)(66946007)(41300700001)(316002)(8676002)(8936002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <A760F2CA6ACDC941BB452A0927BEF3BB@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB8732
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DBAEUR03FT021.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	11acd13d-4620-4471-7ad9-08db998c30f7
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	aQoBHVvDO8bBDBOWbLutE4lLZZjJA22TXbPvVjrz1ywWHk+PJKFHF6s5AFRfzgIuJ2WZsd9rZ7OEhwvWPZzDy7S4zc0iYwVm1xCSlLC+mhxd2enjKfHOEErsa9ZZbRBh6WPVisL7cpcrTFqX1WF2FLJ0Q02wOjYVQyz9CHQBbfSjRFtrZZM1K/0k+XaV/Y3SdtavaDVLUmxWODL/gUnLwBV/4Ure7/UAyvEzOqUf2rO5iciSW1UWvhBtNQiYkeX7ceyeaUGkzkYVBkSgnpNTuyjpfGccA+Mja/slykvN/XRGPPxBlAzJHdOY2V8h1F7ak4Ta7sdXxUZK37by5UvP1Q7OA53++TUv6s2RKx3TM1nDDZIZTzEt3aTMHUurP/U8mLQalmhs2gSE90LISDnHAkTYeQF8z05DwCaiAS2YDoI4hQWNAAE8MtzcML98rq0BHObB85rMGiZpsMtOlqwOsti9dM1v0MoOgHgpS5NyRYTRyILmEUUAtR2OeQt6HmWE4BfIMZEuh1m2yyyzFm69JoRH5JhV91V0+nF2nWHS42EciTwRWTkRZm0GnFhxUo4Ex6YzaIr4fTs21N0WohE1itT1L8MrV8Y4V7z6QsoOvwpAnoRLUWS0VkVJ0gb5t7+9yPnu9ls94+cd/xPrNxEKvbaAqKbqdsyxyKq4oc/WuwbOLO/CqJVk0D4mUCIZF420dc54Zs34haNbUvD5ih/fvPAKUchO39CMOANLOm7xLVo=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(396003)(346002)(376002)(136003)(39860400002)(1800799006)(82310400008)(451199021)(186006)(46966006)(36840700001)(40470700004)(81166007)(26005)(53546011)(86362001)(33656002)(6512007)(2906002)(356005)(15974865002)(336012)(6486002)(36756003)(4744005)(36860700001)(2616005)(478600001)(6506007)(4326008)(70206006)(70586007)(8676002)(82740400003)(47076005)(316002)(8936002)(41300700001)(5660300002)(40460700003)(40480700001)(83380400001)(6862004);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Aug 2023 10:26:12.8785
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b064b50-003d-46c1-08f5-08db998c38b3
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DBAEUR03FT021.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6576
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Aug 2023 10:26:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185734

T24gOCBBdWcgMjAyMywgYXQgMTE6MDQsIE1hcnRhIFJ5YmN6eW5za2EgPHJ5YmN6eW5za2FAZ21h
aWwuY29tPiB3cm90ZToNCj4gSW5zdGVhZCBvZiBtYW51YWxseSBsb29raW5nIHVwIG5ldyBDVkVz
IGFuZCBkZXRlcm1pbmluZyB3aGF0IHBvaW50DQo+IHJlbGVhc2VzIHRoZSBmaXhlcyBhcmUgaW5j
b3Jwb3JhdGVkIGludG8sIGFkZCBhIHNjcmlwdCB0byBnZW5lcmF0ZSB0aGUNCj4gQ1ZFX1NUQVRV
UyBkYXRhIGF1dG9tYXRpY2FsbHkuDQo+IA0KPiBGaXJzdCwgbm90ZSB0aGF0IHRoaXMgaXMgdmVy
eSBtdWNoIGFuIGludGVyaW0gc29sdXRpb24gdW50aWwgdGhlDQo+IGN2ZS1jaGVjayBjbGFzcyBm
ZXRjaGVzIGRhdGEgZnJvbSB3d3cubGludXhrZXJuZWxjdmVzLmNvbSBkaXJlY3RseS4NCj4gDQo+
IA0KPiBUaGlzIGlzIGNvbWluZyBSb3NzLCB0aGlzIGlzIGNvbWluZy4uLg0KPiANCj4gQnV0IEkg
aGF2ZSBhIHF1ZXN0aW9uLiBXZSBkbyBwcmVmZXIgdG8gaGF2ZSBhIHNvbHV0aW9uIHRoYXQgcnVu
cyBjb21wbGV0ZWx5IG9uIHRoZQ0KPiBidWlsZCBtYWNoaW5lLCB3aXRob3V0IGF1dG9tYXRpYyBy
ZWJ1aWxkcyBmcm9tIHRoZSBZUD8gSSdtIGFza2luZyBiZWNhdXNlIGZvciB0aGUNCj4gc29sdXRp
b24gSSdtIHdvcmtpbmcgb24gd2UncmUgYWRkaW5nIGEgcHJldHR5IGJpZyBnaXQgcmVwbyB0byBl
YWNoIGJ1aWxkICh+MTMwTUIpLg0KDQpUaGF04oCZcyBhIHByZXR0eSBzaXplYWJsZSBmZXRjaCBi
dXQgbm90IGFzdHJvbm9taWNhbC4gIFRoYXTigJlzIHRoZSBsaW51eF9rZXJuZWxfY3ZlcyByZXBv
c2l0b3J5LCByaWdodD8NCg0KQXQgbGVhc3Qgd2l0aCBnaXQgaXTigJlzIGEgb25lLXRpbWUgaGl0
IGZvciB0aGUgaW5pdGlhbCBmZXRjaCBhbmQgdGhlbiBqdXN0IHRoZSBkZWx0YXMgb24gdXBkYXRl
cy4NCg0KUm9zcw==

