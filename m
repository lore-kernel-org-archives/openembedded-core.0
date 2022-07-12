Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12979C43334
	for <webhook@archiver.kernel.org>; Tue, 12 Jul 2022 11:01:09 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (EUR04-VI1-obe.outbound.protection.outlook.com [40.107.8.82])
 by mx.groups.io with SMTP id smtpd.web10.7682.1657623667703638853
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Jul 2022 04:01:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com
 header.s=selector2-armh-onmicrosoft-com header.b=cIPdkbsK;
 spf=pass (domain: arm.com, ip: 40.107.8.82, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=Pk/FpYC7sLMeBZHb5GAU/B7sWc1dsymu7X91GUGFY/RFE/jqD3aQ2qiDpfbCQ0tc9RTTFiDGBd6mKGwS18mdtMh/h3TTvjxUwEuRXvaJBPSSpLtpevBdiWtGZd8Z4y5fRpEr7dH/epz56sF0X/dDe/PhJGIMr3ZQJnGf84tO9nC8l9Xy1TznNgEeh3jegnI8p+KHFiKG8YffVozt90Jn6YQ6BJONORIgg3JIoweGJj65zA9K/wTWm6BRt8FAPXeRSSvppIoxUcquFQ61djw62RXbg0UEFtDEqsoFqlhB/OlydThPXOJ4N+CaOEdFmAr93i5y/PRPsYXw2D6dlsfojA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qAvMq68rv06HHBZFZ+Kb5avDhoeizayN/FnlrRbEyxE=;
 b=SufRsLSF/P/8e0JL+VrWhnpWD218cTGrkBjGeowPrcmW6BDY6ZaZzX4NeoseghJezh6J50OcTFX5biHBisQRS3B9nW4/32bIbbgmcZDPCYO9pInueBk2BPGJgtxnhhGK0xw3QOIwu8Mh8P3X9YDIt5VscAQH/M3jtKmACRVA20deMDiFa1oAj5qn4KpQwycywKmAsuQhCXsSrcMYDkR+jVlB8Uxw3yLErnjPsEwXF5g2+of+kplSpNTh0q4nAh6U7r0fxnCdv2NhhGYZW/Cr55EjOgPaTvCudwU4xpa5vEJo5v1z/ovTKNjbJoqNuu2oAS2b8Io/EDRv4kokD6iNGw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qAvMq68rv06HHBZFZ+Kb5avDhoeizayN/FnlrRbEyxE=;
 b=cIPdkbsK6V+lMGpsJwDzSEgmT7PzQZRp1WcRAxS4VN3iQgYDX/LIRlBV/cwCvtcmFaqcP7zdpOjqAMV/+hC4l1KQhe1OOUKyR6ss46ajk12V3uo2E+n86yIhiKrZjV7yE9FXf8yr8TFSysoTH01Skpm6ssBLjkaSQWi2HUUtfeo=
Received: from FR0P281CA0003.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:15::8) by
 DB6PR08MB2887.eurprd08.prod.outlook.com (2603:10a6:6:1f::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5417.20; Tue, 12 Jul 2022 11:01:04 +0000
Received: from VE1EUR03FT035.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:d10:15:cafe::db) by FR0P281CA0003.outlook.office365.com
 (2603:10a6:d10:15::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.11 via Frontend
 Transport; Tue, 12 Jul 2022 11:01:04 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT035.mail.protection.outlook.com (10.152.18.110) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5417.15 via Frontend Transport; Tue, 12 Jul 2022 11:01:03 +0000
Received: ("Tessian outbound 6f9e7ef31fa8:v122");
 Tue, 12 Jul 2022 11:01:03 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: d26a05d2f2bf55d5
X-CR-MTA-TID: 64aa7808
Received: from f3b6ac9ba87f.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 C4426D24-5EDF-4D00-8ECE-4E5B3071E1D8.1;
	Tue, 12 Jul 2022 11:00:55 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 f3b6ac9ba87f.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Tue, 12 Jul 2022 11:00:55 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Wjsajg0j7uIlMAtgL8aQRltZZaZexyZ5dPoARn1Rw3xtmmi3+qLC2ACTG1ftDQoxQ72bjvuy3ivS7SkXadfMFv5Q4bSuZ5tSbT2i3BsCemKZ373mcFDRd6xX6m8QxyI4EuND4jZs66oZjyLmDGxL5f+qbo5m5PCm+lFg9Ue6+eKJbVCfB2FI5YpcHwnpf+4nIsUxt1/RY9ok+STNPWwhnf0Qe0ZXTIJ/unoGOpPDNwxUW1vYpyFQ8ZXmOSOYVFyYRq//4F+IX+U+x0h4V38m/PlLom3qyzGTt04qquecUnl2HhI7RLyVIa8VnAucS9xfqClWExU1dIxmo6M34ElExw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qAvMq68rv06HHBZFZ+Kb5avDhoeizayN/FnlrRbEyxE=;
 b=HuuuMixDHeaoUed3Y7+VoFh0+esIkijl7CtG8fVFqmVAqkxMYkvAEAmGHKhu4apHZMnYcXf5ugOiiI8MZA2duit+LX0Ume+/0S8Cek7+GuIRtixqgrnINrpOinkpOG38C8RYu4Irxr5ff2fSmpgipAOpP83OhfKNkPsTLjNBuRC5h8hBIQi1RtZhfwJW2+pF+CghswgJ0DsSH5xssdKvco+xQY0PsuDA/jh/TO9HJlCBm3DZBy+IHJVZWQNOwwGXQENm6SeK+Yip8fEygB9NrVEiuRSJtVNui6QPFNTFQFpdk037M0CO+EitUztFKBsRRT3/1vhGSWhV8PolqwPJxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qAvMq68rv06HHBZFZ+Kb5avDhoeizayN/FnlrRbEyxE=;
 b=cIPdkbsK6V+lMGpsJwDzSEgmT7PzQZRp1WcRAxS4VN3iQgYDX/LIRlBV/cwCvtcmFaqcP7zdpOjqAMV/+hC4l1KQhe1OOUKyR6ss46ajk12V3uo2E+n86yIhiKrZjV7yE9FXf8yr8TFSysoTH01Skpm6ssBLjkaSQWi2HUUtfeo=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by AM0PR08MB3779.eurprd08.prod.outlook.com (2603:10a6:208:101::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.21; Tue, 12 Jul
 2022 11:00:51 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::2c4a:b33:a761:a926]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::2c4a:b33:a761:a926%2]) with mapi id 15.20.5417.026; Tue, 12 Jul 2022
 11:00:51 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "akash.hadke@kpit.com" <akash.hadke@kpit.com>
CC: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>, "ranjitsinh.rathod@kpit.com"
	<ranjitsinh.rathod@kpit.com>
Subject: Re: [OE-core] [poky][master][kirkstone][PATCH] cve-check.bbclass: Add
 anonymous function to get patched CVEs from recipe
Thread-Topic: [OE-core] [poky][master][kirkstone][PATCH] cve-check.bbclass:
 Add anonymous function to get patched CVEs from recipe
Thread-Index: AQHYldra0S6go3Kl3E+EgotogGeeBa16kZUA
Date: Tue, 12 Jul 2022 11:00:50 +0000
Message-ID: <A70DCBA1-F769-485C-AE06-F71A5C85A2B5@arm.com>
References: <20220712102729.24407-1-akash.hadke@kpit.com>
In-Reply-To: <20220712102729.24407-1-akash.hadke@kpit.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3696.100.31)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 72fe82bb-9c87-4308-3fec-08da63f5d01a
x-ms-traffictypediagnostic: 
	AM0PR08MB3779:EE_|VE1EUR03FT035:EE_|DB6PR08MB2887:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 vR3PWOee8AG2kpgcvdV2LuQqm5mTSmfp9uJi7SkXcViw5ecRIniJbmQiTCA0R4bj8Ha6GfCxyo2fQx5nWmAAXcUPULWxP48CH7E5nkye5Tia/a05muVP+QoDx5OhzQ5B9Kk6tlaTyDV1dyHetrun6JQCLuplWZ8aACjTbSFIqSxxDislI5E4kn7x5YdZ4g95/jijALTneswrbj1wM8XEkC+p6f6cs8U0q+0hwxQgovYdmzNvelYa2EmGDtPp8P918ePZpw/2870lIzw/KEKdbWWc0BpfR1zO4rPdOkYU30fFUN2ghaxFXdIq3C7JmEXG8hTCA33Q5bPSKRR9eIZKzFUh9AjoNTdfI848fHp0Ladf3CP9B0rw+sdBs2sEHrj7FudV9cYt2wIiX+/SG6JgXwl96TRkbKod1VSFKEhqe1iMNiA5UFzXvXzrczT0f0im3hqGMmql0H3PTt3F9H6o+hlZYTGgNRX5Yw4GR3QJZNyYcUzHUG4r+qWrnUsMo3/WzCNFWEdasWKnIqO6GuB7UdAX7D6g7MctTUVv5nCUTzxt5E8GkiETX5eopjBiDmA1d1IbgK50y0OSQA5YatxjgOeP8WOz3/wo75Wyu6MvIVKQ3Xvy81UPCyNLY3V9eHVBAVTozampaBw1oo6EiWVvrj3686/XfXvTe3nMnynTwBUoP8tgzhm0l5qZBSjohSPOySvgTn9oDuPdyhLRulJ7CuPsKAAT8+uJCKreALheFT17q/cLRSmW1rPTmIavshXxZP/ulZGeUi6Avwvl3yOCmzpgxYJJ8bJo7TKL960MKRAhIoL4cjNw/RxU7VUhHKtX+qaIG4CzVgMLwfuJxLUE8ehVHwEM83LRrdQ85ADT1bk=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(376002)(136003)(366004)(396003)(39860400002)(346002)(64756008)(66476007)(91956017)(76116006)(66946007)(6506007)(6512007)(86362001)(4326008)(478600001)(66556008)(53546011)(26005)(41300700001)(6916009)(66446008)(6486002)(38070700005)(71200400001)(186003)(54906003)(8676002)(2616005)(8936002)(33656002)(38100700002)(36756003)(2906002)(5660300002)(4744005)(122000001)(316002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <31ACAA31B994C84C957BC1110CC87BD9@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB3779
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 VE1EUR03FT035.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	4910b4bb-1f1b-4e6b-c4cd-08da63f5c8a0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	jLgFK8zt9DYDxOW8AIPOIeJpKNFHA0qHfkOivH60peegRrlbOqVjG6XCJLDg/W7AON+ZpSzbBk08LvtfEtIiNJ+7papezcj0s2JQUtHnf0MTmVVq5gG5W9yqh59kS9PV5AzYou0tVQct0KD5Gmbyd8ELDsZ8u9ahQUDGjCIP9OUzBJY1E/SgxfAg85NPDsSq+oAkPO0/mQZyNfXNxrzBL7KFi+aHBWydiI15iMyyUlEAIzEC8Dd+F6rxg0Z7F6/kGfTTkrqQ+ip5avWL/qK8zi+LjVkHQjQnLIL/UVw/L5kOL6FXtw4vFok8L0Vp8dS9G3cidi2LfaiJ32nxiyNBHhfdXm/awZx62QjNzuG5l6k8lUbjtAxUnIrOO496ze8CzePYpEdHiQl3Irpe726q3r7wfrU7CfQ0iH4xI36u6b2VVZnDV4d3+wW5Qtd3sXyt2cb+JPbr7vCy6+8vCDsTfQ8DAiXOsIxtW+4Eurd4IB9Dh0+wNuJ/zgYV9MIlZ823V/LXwfFGTWEmULXcKxCC9QD3GbbHy7a5JPyu9y1mSsGWxVIjvrHF1VEEIN48JOoEpSiZb8aPopqiub7qe87nKg/B+0MwQqF1A3CeV43Hkv0YD6XzrZjG1CJkmGHlrBYIeMAJN+jjac5Dyx0nvZqCee0AP9tgceyVXbHppDZMWXqVmheLyzC4SF7jEPIwPiNT3kCiRIevlBHJEXxpgVNbdWmUNpuD6vuo7oc43Vc6mW/OEgywlxNP0OGbQMXAZa7lOaQmh5VFhnAuulW7GXwt435+EvBMSDfi4e//CK/JIy1Du7MYLwyN2TMiPWKDXj6y
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(396003)(136003)(346002)(39860400002)(376002)(40470700004)(36840700001)(46966006)(336012)(356005)(41300700001)(53546011)(6506007)(40460700003)(82310400005)(107886003)(47076005)(86362001)(2906002)(40480700001)(82740400003)(2616005)(4744005)(4326008)(6486002)(81166007)(186003)(54906003)(478600001)(6512007)(316002)(26005)(36860700001)(8676002)(36756003)(5660300002)(6862004)(33656002)(8936002)(70206006)(70586007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jul 2022 11:01:03.3365
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 72fe82bb-9c87-4308-3fec-08da63f5d01a
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	VE1EUR03FT035.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR08MB2887
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 Jul 2022 11:01:09 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167920

T24gMTIgSnVsIDIwMjIsIGF0IDExOjI3LCBha2FzaCBoYWRrZSB2aWEgbGlzdHMub3BlbmVtYmVk
ZGVkLm9yZyA8YWthc2guaGFka2U9a3BpdC5jb21AbGlzdHMub3BlbmVtYmVkZGVkLm9yZz4gd3Jv
dGU6DQo+IA0KPiBBZGQgYW4gYW5vbnltb3VzIGZ1bmN0aW9uIHRvIGdldCBwYXRjaGVkIENWRXMg
ZnJvbSB0aGUgcmVjaXBlDQo+IGFuZCBzZXQgdGhlIHZhbHVlIHRvICdDVkVfUEFUQ0hFRCcgdmFy
aWFibGUNCj4gVGhpcyB2YXJpYWJsZSBsYXRlciBjYW4gYmUgdXNlZCB0byBkbyBDVkUgZGF0YSBw
cm9jZXNzaW5nDQo+IG91dHNpZGUgb2YgYml0YmFrZQ0KPiANCj4gQWxzbywgaW50cm9kdWNlIGEg
bmV3IHZhcmlhYmxlICdDVkVfQ0hFQ0tfV0lUSF9EQicgZGVmYXVsdCBzZXQNCj4gdG8gJzAnLCB3
aGVuIGl0IGlzIHNldCB0byBub24gemVybyB2YWx1ZSBpdCBhdm9pZHMgQ1ZFIHNjYW4gZm9yDQo+
IHVucGF0Y2hlZCBDVkVzIGZyb20gTlZEIERCLg0KPiBJdCB3aWxsIHdvcmsgYXMgdGhlIHNlY29u
ZCBvcGVyYXRpb25hbCBtb2RlIGZvciBjdmUtY2hlY2suYmJjbGFzcw0KPiB3aGljaCBvbmx5IGV4
cG9ydHMgdGhlIGRhdGEuDQoNClRoaXMgaXMgdHdvIGNoYW5nZXMsIHNvIHBsZWFzZSBzcGxpdCBp
bnRvIHR3byBjb21taXRzLg0KDQpJ4oCZbSBjdXJpb3VzIHdoYXQgcHJvYmxlbSB0aGUgQ1ZFX0NI
RUNLX1dJVEhfREIgdmFyaWFibGUgaXMgc29sdmluZywgY2FuIHlvdSBleHBsYWluIHRoZSB1c2Ut
Y2FzZT8+DQoNClJvc3M=

