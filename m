Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2FEE2C4167D
	for <webhook@archiver.kernel.org>; Mon, 13 Nov 2023 17:44:29 +0000 (UTC)
Received: from EUR02-DB5-obe.outbound.protection.outlook.com (EUR02-DB5-obe.outbound.protection.outlook.com [40.107.249.67])
 by mx.groups.io with SMTP id smtpd.web10.1756.1699897460164942647
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Nov 2023 09:44:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=n28lxnQY;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=n28lxnQY;
 spf=pass (domain: arm.com, ip: 40.107.249.67, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=oD/uP95wvCByHwKjRFdH4EzZGaa/Jz+5/HHRMMhxA3/QDpPVwpz6kg0qBrhWa2wz/AECztGBmTSKtslZK64utcZtaqhFe1HVtw7qP1nfS+GtWsZV4CSdi2amZJn+q7yIznqZei8baQqBBYTmhbWpJfUCEC2SmOHn0I7oV60/aSc8VPsQJXcYoO4Y7eYSEcAi7DYDNvUMU8iPdXOAYfXWF+SGveJVnvCGGAeys6FcfT4A7p1YGAATWi28UwbsiZlLMprK1TouyQ8XTREtbXKY6HKEIt2rGA4cvP6SKARXtwROVzGe/aKjequ2XWKUh4yIhvhE21fnP/KIobh8Q3xO+g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c7ejFZHCIiSEwnvsIodXHPiaHyk7CtVCN3rBKrMk2v0=;
 b=RqZBlyplGyIIBp6LXe2WELy5j3SmPbI7UnvXdtEaKs926DSYTWc+CK4sRXvOSJhsEpEVmvn02iujl1HCX+iLf4qCw2Dgzd5Ny83U4ynZcpr9SbfO3PwwHoNwwtz4vQlrr8Sm+yA6omnQyJ+7usISpuvxISnGsOnll2oKFT+n/tCqLx3YSl4pI+AYGgGFkQaF5uxRvBusS3mkJruRF0/6q3xNMlxvy9kGqUTdgZBx1efJwll6rQv6tqbJPh7ZwWoqrsDrvNssYZ/YfyEY4tthaoSR2rsr4zTCg1+4F9YYVTx5H+nGnq6CnCFz2C1y8oAw+J2Q9/iAMmrlrsb7ytBWJg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c7ejFZHCIiSEwnvsIodXHPiaHyk7CtVCN3rBKrMk2v0=;
 b=n28lxnQYB1SEQoCDndABxHIIY2gVc+q9MKzqfP07oHoFs13427quzmC3hcb54EiZqdeeQzz+28CiKYmEjkkgNFMajV9dXTHMx+NkJi6mrjlbZBsEI26K/YkZXt68tKnmVYCs8orwGC7+sLVhqUUxAFQSc54F2U6J+QlUWxN96W8=
Received: from AS9PR06CA0424.eurprd06.prod.outlook.com (2603:10a6:20b:49e::8)
 by PAVPR08MB9859.eurprd08.prod.outlook.com (2603:10a6:102:30f::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.29; Mon, 13 Nov
 2023 17:44:15 +0000
Received: from AMS0EPF000001B2.eurprd05.prod.outlook.com
 (2603:10a6:20b:49e:cafe::28) by AS9PR06CA0424.outlook.office365.com
 (2603:10a6:20b:49e::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.29 via Frontend
 Transport; Mon, 13 Nov 2023 17:44:15 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AMS0EPF000001B2.mail.protection.outlook.com (10.167.16.166) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7002.14 via Frontend Transport; Mon, 13 Nov 2023 17:44:15 +0000
Received: ("Tessian outbound 7c4ecdadb9e7:v228"); Mon, 13 Nov 2023 17:44:14 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 1dc932fa8534a5b1
X-CR-MTA-TID: 64aa7808
Received: from 875134ff537a.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id F9F060C1-8B7F-4DC2-B769-1A725D727AE5.1;
	Mon, 13 Nov 2023 17:44:08 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 875134ff537a.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Mon, 13 Nov 2023 17:44:08 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E8ohUJDWJ+9OJHoyhHiu7byMHChyfSn58HXn0jB47z4aMgYYMX0kIsUx+gX9ashj+9ivY5fnGhHwoIwK+Tt3NAEIo0kmrz3/H12ohBg39JmaF4qLCHw2EranGO1GsYMoHPs7ukGtVNnKLcZdwobwYz5BcV9oW6vr36Hi+FFPyNIJd33SxC0q3o8ypOQM/lp9gw3P9tj7eyO9N5T6QmxSmlRhpHbARfjmXHx9z198GNwKV9CXTV8zQWz9Gb9jjWs85zqUherd+/cM342c8s1aN68p3Q6m5/L6aWiG9av8coBywLonyG5YE1FZz5fdVvDuq830pGwX4rzOp0ib63dk8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c7ejFZHCIiSEwnvsIodXHPiaHyk7CtVCN3rBKrMk2v0=;
 b=bLQtQXB0a+yRPl8bjdorGRQy9r7C7CVcDnwsPpJF4PwqUy2QPPavuwyg81Rul9PLT5wuLMxxDjroc5/KhUd8gUs5oodDwE4Abw2W21bOW99j33xORwNMtfbf2jg9HwwJgzFLKGPR4kNL7SGiZqj9sc0qDerHQVIHcj3DCKg/7WRCQxT8vfQt79YD40aGjqSW2KZcdwbo30l1caIK26n8/+p3HFp7HZzD+XZlmOl2B6okcBcem6+e2zRPIEuPA7DpDERfJ5rwjTsZT5de2ED3a218J9dfZCM7lPSouO+ZktgkJFyA1607gIR2V9xjhTFEC45KOUFc+XMR6wWrVesV5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c7ejFZHCIiSEwnvsIodXHPiaHyk7CtVCN3rBKrMk2v0=;
 b=n28lxnQYB1SEQoCDndABxHIIY2gVc+q9MKzqfP07oHoFs13427quzmC3hcb54EiZqdeeQzz+28CiKYmEjkkgNFMajV9dXTHMx+NkJi6mrjlbZBsEI26K/YkZXt68tKnmVYCs8orwGC7+sLVhqUUxAFQSc54F2U6J+QlUWxN96W8=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by DU5PR08MB10733.eurprd08.prod.outlook.com (2603:10a6:10:526::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.29; Mon, 13 Nov
 2023 17:44:07 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::ef47:2c42:1ef6:fe5c]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::ef47:2c42:1ef6:fe5c%6]) with mapi id 15.20.6977.028; Mon, 13 Nov 2023
 17:44:07 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "p.lobacz@welotec.com" <p.lobacz@welotec.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-Core][PATCH] curl-native: add missing ca-certificates.crt
 file
Thread-Topic: [OE-Core][PATCH] curl-native: add missing ca-certificates.crt
 file
Thread-Index: AQHaFA1mYtG3BRatrkmFC9uIKGG88rB4idgA
Date: Mon, 13 Nov 2023 17:44:06 +0000
Message-ID: <99EB7878-D43F-4CB2-AB49-E6626E08FA5A@arm.com>
References: <20231110193716.2198635-1-p.lobacz@welotec.com>
In-Reply-To: <20231110193716.2198635-1-p.lobacz@welotec.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3774.200.91.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|DU5PR08MB10733:EE_|AMS0EPF000001B2:EE_|PAVPR08MB9859:EE_
X-MS-Office365-Filtering-Correlation-Id: b12de48a-a77f-4fb5-fc5c-08dbe470276f
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 /Tc7YV49oUIOGHp1j3xb5thsnKuc2h+FAn0cciWeneK70DUeJdCojNovLV9CwZVQT2us9s9xRPzGekIZH29Pl7OlFqm3e32UCPBMjr3vAdmGb2xlscvD1CgkDLSSeIGVSvKoXDmuIXQwVn0bHD7seiv3ns6/sTL9wmr3jDx6uAIOpb8t3LY8GloZy9DgsujAs3AvF06Rdg0cH7gWSa5YI3qqSopz0OjJFJbeYeSZjGk3XeglfchLWm+adiTYLANV2ZKHZrf5bBS/rZSkIXyppStZIwtWS+AH0O898GYWo4ths6XP2/UWiEzgotQSuQUHX7wS0UzwISrmJ4umrlch4vfdHW8PL8Y4V79aKfBKl+bCj6jln71//vTz0qwnoWwD6BzX5+mBpvCn6DwFiqXgVjg9RSu9TesgxgwW+Yn3OyJmzG7h5jqnK2GVOahav/r+FIEQv71Bnu8nkq19UCPNZMswZgmteiWqEL9NuRLyowYk/ZXLCxdpgyFoRxJZzIw/NjMVxsX9KefTVvx+cX431gQq6cdAao+KwVgZ2vQwGrGyBUG2dw+JkLXIfVSSBGgfHaCxeUs0grQ6BjyhhAtJdqIrUSFGZI1EsB5G2s8XRQlStjyg/0GRIYHpvfu2VQPthydrbLVRFEFVvyTxpTW+uA==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(136003)(376002)(346002)(396003)(366004)(230922051799003)(1800799009)(64100799003)(186009)(451199024)(64756008)(66476007)(66556008)(76116006)(66946007)(91956017)(6916009)(66446008)(86362001)(33656002)(36756003)(38070700009)(38100700002)(122000001)(6512007)(66574015)(316002)(26005)(6506007)(71200400001)(2616005)(53546011)(41300700001)(2906002)(478600001)(6486002)(5660300002)(4326008)(8676002)(8936002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <5F0948B63071034EA6392834236E3071@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU5PR08MB10733
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AMS0EPF000001B2.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	1551b289-c969-4d18-b91c-08dbe4702279
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	o+Lv1FvFh1z0x2LAsOUNqMo5rm4G+VcvKyNxqb0NBLaPMERb7agevDO9Q/Ag4Nx1MDGBrUQs/s7K8A31dhj7wIizO9pei3n+vy8ThsAgIlqL0H8w97ryGgw3d3/NnwpdaLTQuSGsvOmXkVyNRvS4MPyDKOiXESFBa+Rlrw5fXgXHx91Sj7TFWnU0DcUp+bDdUOXZ3HWqfOPM4v/SqEUM016ZmaK4x0CBdAjI7Y4x1xDxVyM2iKHULoqIqwmW4rlKYGggCSyRbA7zAMvWQYjwXrspzKHS3II0MSMsa3OcW4Y27GVw83kNxzMNNeHJqfyrU//8RlxrkqFRKyxHuzI9RJIgsybAmEXnH7O4Sx4mZxyNm8qUAe7dJobDGN3b6kHxcAWxxIV94v7j3MIzszBh6qTJL2NOgCJd1TYu83W0vyl4oWIFovXtppVIKGJbT3PIO9Hs7AkZCHl4I21pLEHlBcqQX8D1WNoh2UPVGut9rkfTE6rXcX3PciKr3/NXTYUwK+B0O8K/f8DeySZANfTztmpbO2g+Xy+aQPwmHVpcAU9DyqFKLJ2TAp8w6SCH1sFz/vGKC8uHQcKpz0iAbORRmg5E9hHPhVm+vFbenuhbP/blJ1OroYxwfqA+1t34NROr5l0Ihtt19r6W414KiFL4VSRL3U5A12X3kaEOniQZDudthheusVhR3iH5LpvSL+V8NBJAwJ3CR4F69JckZ5B1SatSfasjS3H52fwAI7s27Ahgdv9H43SdtJSTerW7cvuV
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(136003)(39860400002)(346002)(376002)(396003)(230922051799003)(451199024)(64100799003)(186009)(1800799009)(82310400011)(36840700001)(40470700004)(46966006)(40480700001)(40460700003)(70586007)(70206006)(316002)(82740400003)(33656002)(81166007)(356005)(36756003)(86362001)(6512007)(66574015)(26005)(336012)(2616005)(6506007)(53546011)(36860700001)(2906002)(478600001)(6486002)(6862004)(5660300002)(47076005)(41300700001)(4326008)(8676002)(8936002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2023 17:44:15.1708
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b12de48a-a77f-4fb5-fc5c-08dbe470276f
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS0EPF000001B2.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR08MB9859
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 Nov 2023 17:44:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190483

T24gMTAgTm92IDIwMjMsIGF0IDE5OjM3LCBQaW90ciDFgW9iYWN6IHZpYSBsaXN0cy5vcGVuZW1i
ZWRkZWQub3JnIDxwLmxvYmFjej13ZWxvdGVjLmNvbUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnPiB3
cm90ZToNCj4gDQo+IEJ5IGRlZmF1bHQgY3VybCBpcyBiZWluZyBjb25maWd1cmVkIHdpdGg6DQo+
IA0KPiAtLXdpdGgtY2EtYnVuZGxlPSR7c3lzY29uZmRpcn0vc3NsL2NlcnRzL2NhLWNlcnRpZmlj
YXRlcy5jcnQNCj4gDQo+IHdoaWNoIGNhdXNlcyBhbiBpc3N1ZSBmb3IgbmF0aXZlIGJ1aWxkLCB3
aGVuIGNhbGxpbmcNCj4gY3VybC1uYXRpdmUgY29tbWFuZCwgYXMgY2VydGlmaWNhdGVzIGZpbGUg
aXMgbWlzc2luZy4NCj4gDQo+IFRoaXMgY29tbWl0IGZpeGVzIHRoZSBpc3N1ZS4NCg0KSeKAmW0g
bm90IHN1cmUgd2hhdCBpc3N1ZSB0aGlzIGlzIGFjdHVhbGx5IHNvbHZpbmcsIHVubGVzcyBzb21l
dGhpbmcgaGFzIGNoYW5nZWQgaW4gaG93IGN1cmwgaXMgYnVpbHQuDQoNCmN1cmwtbmF0aXZlIGhh
cyBhIGhhcmQtY29kZWQgY2EtYnVuZGxlIHBhdGggdG8gJHN5c2NvbmZkaXIvc3NsL2NlcnRzL2Nh
LWNlcnRpZmljYXRlcy5jcnQuICBXZSBjYW4ga25vdyBleGFjdGx5IHdoYXQgdGhpcyBwYXRoIGlz
IHdoZW4gY3VybC1uYXRpdmUgaXMgYnVpbHQ6DQoNCiQgYml0YmFrZS1nZXR2YXIgLXIgY3VybC1u
YXRpdmUgc3lzY29uZmRpcg0KZXhwb3J0IHN5c2NvbmZkaXI9Ii95b2N0by9yb3NzL2J1aWxkLXBv
a3kvdG1wL3dvcmsvYWFyY2g2NC1saW51eC9jdXJsLW5hdGl2ZS84LjQuMC9yZWNpcGUtc3lzcm9v
dC1uYXRpdmUvZXRj4oCdDQoNClRoaXMgaXMgdGhlICp3b3JrIGRpcmVjdG9yeSogb2YgY3VybC1u
YXRpdmUuDQoNCklmIHlvdSB0aGVuIGxpbmsgdG8gY3VybC1uYXRpdmUgaW4gYW5vdGhlciBuYXRp
dmUgcmVjaXBlIGFuZCBydW4gdGhlIGJpbmFyeSwgdGhhdCBsaWJjdXJsIHdpbGwgY29udGludWUg
dG8gbG9vayBpbiB0aGUgY3VybC1uYXRpdmUgd29yayBkaXJlY3Rvcnkgd2hpY2ggZG9lcyBub3Qg
ZXhpc3QgaWYgcm1fd29yayBpcyBiZWluZyB1c2VkIG9yIGN1cmwtbmF0aXZlIHdhcyB0YWtlbiBm
cm9tIHNzdGF0ZS4gIFRoaXMgY2hhbmdlIGRvZXMgbm90IHNvbHZlIHRoYXQgcHJvYmxlbS4NCg0K
Um9zcw==

