Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3EA41C54EBE
	for <webhook@archiver.kernel.org>; Fri, 13 Jan 2023 12:30:35 +0000 (UTC)
Received: from EUR01-HE1-obe.outbound.protection.outlook.com (EUR01-HE1-obe.outbound.protection.outlook.com [40.107.13.73])
 by mx.groups.io with SMTP id smtpd.web11.85124.1673613033089407631
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 Jan 2023 04:30:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=cn2GF+HS;
 spf=pass (domain: arm.com, ip: 40.107.13.73, mailfrom: ross.burton@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QwAmKGZBywyoI3nIvgUpvCdxHT21OhpDZDIlX6JlNqQ=;
 b=cn2GF+HS+Vngyg0Qf/VhZuAOV4MFF7xx2PvLZGJC07cWktkAOlWWA+H/Zss5ZMcIgD9UsEnN3ib1AjcAxc+8LSIipZidKVxOKgcGkdjf8pYflSV4dqkmBMpthcIYvwRUzMRes9z/oQjsJqtgDNqLWEYk/XTaFn/F/q6KcOjB2Uo=
Received: from AM5PR0201CA0007.eurprd02.prod.outlook.com
 (2603:10a6:203:3d::17) by PR3PR08MB5705.eurprd08.prod.outlook.com
 (2603:10a6:102:93::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18; Fri, 13 Jan
 2023 12:30:28 +0000
Received: from AM7EUR03FT037.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:203:3d:cafe::fa) by AM5PR0201CA0007.outlook.office365.com
 (2603:10a6:203:3d::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.14 via Frontend
 Transport; Fri, 13 Jan 2023 12:30:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT037.mail.protection.outlook.com (100.127.140.225) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6002.13 via Frontend Transport; Fri, 13 Jan 2023 12:30:28 +0000
Received: ("Tessian outbound b1d3ffe56e73:v132"); Fri, 13 Jan 2023 12:30:27 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 2928ade94465b5a2
X-CR-MTA-TID: 64aa7808
Received: from f1c618601253.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id E70CDC7E-0DE5-494A-972A-BABD1D675894.1;
	Fri, 13 Jan 2023 12:30:21 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id f1c618601253.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Fri, 13 Jan 2023 12:30:21 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LsHgkp8ySntbHdr20zsnTIidas8Cvpf6MbJeO4Zmja0WCVCYPQE1UAoH78vvAlfEEU3/IZvOTFFcqRyN0GGckYun86vu7jcFR3IcaFqFM9tikyKkfKnmA8kjHKheZBR40KFLrQVmMSlkl7n+2/37hMsIqMm1NLH1DDWil4MsrfL4ajExpj78ZOgjKByHnIM0RE+PVR5kw1RV/x9bmCmA0//nx04hS82mASid9mlABjVylz/kbgrObomeMox9pvAgLs6M8FZb7bj3BbPy3xelp7vHzgq4CxFh5EJOG7alxPH2kMswQE4eVg5iuYlYQ8QzYBAws42jMlDzNpWBNrNjNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QwAmKGZBywyoI3nIvgUpvCdxHT21OhpDZDIlX6JlNqQ=;
 b=KmrCozRSNxkC+J4d6uiEQMCCv30vdYllg0Jf6vVhDepkntN226T/J3lvt2tOKg/YPVLDYw65pMKbWOVij+RDuQT6ikOal08AlL/zjs65T7X/DEhNX21o5pCTF1sSIpK90wHvjOkbu58WNu4CY8D/iWuUNgr1a8zvyQAzdztU3ygESql1MNKpkfBmHcCmDfLrj2TDxWikrBualXiHhZrYmawWI/wMWbal+MWiYzsD7XrfPVGQd1OFpasuMEbkWXB0ikIKIRDeQkZzycWSWWnuh8yz52iVwZdQgQLMY5rX1WMOAdB9C+IUsbXC8cVGfbvjB55dN4ZOCKFAbuXuA+ySGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QwAmKGZBywyoI3nIvgUpvCdxHT21OhpDZDIlX6JlNqQ=;
 b=cn2GF+HS+Vngyg0Qf/VhZuAOV4MFF7xx2PvLZGJC07cWktkAOlWWA+H/Zss5ZMcIgD9UsEnN3ib1AjcAxc+8LSIipZidKVxOKgcGkdjf8pYflSV4dqkmBMpthcIYvwRUzMRes9z/oQjsJqtgDNqLWEYk/XTaFn/F/q6KcOjB2Uo=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by GV1PR08MB8307.eurprd08.prod.outlook.com (2603:10a6:150:a4::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18; Fri, 13 Jan
 2023 12:30:20 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::2d3c:c53c:86ba:a3b0]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::2d3c:c53c:86ba:a3b0%4]) with mapi id 15.20.5986.018; Fri, 13 Jan 2023
 12:30:19 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Khem Raj <raj.khem@gmail.com>
CC: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 4/4] python3-picobuild: remove
Thread-Topic: [OE-core] [PATCH 4/4] python3-picobuild: remove
Thread-Index: AQHZJnhpotPNUici+USS7JLAQk8I/K6b+p6AgAAuKwCAAB/SgA==
Date: Fri, 13 Jan 2023 12:30:19 +0000
Message-ID: <40B76EEF-B993-4AF2-A011-12EE2A09E1C9@arm.com>
References: <20230112112336.2254765-1-ross.burton@arm.com>
 <20230112112336.2254765-4-ross.burton@arm.com>
 <CAMKF1soqRFWz4HNgQDLq2BPkaTt-0mb0225ddN_20b22KsTf0g@mail.gmail.com>
 <1B8E8CEE-02A1-474B-AE7A-A3CA2F515F08@arm.com>
In-Reply-To: <1B8E8CEE-02A1-474B-AE7A-A3CA2F515F08@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3731.300.101.1.3)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|GV1PR08MB8307:EE_|AM7EUR03FT037:EE_|PR3PR08MB5705:EE_
X-MS-Office365-Filtering-Correlation-Id: 1fc66fc2-6e5f-461e-1f63-08daf561f40d
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 QBiE7vA/kN/RxQ53pF5KNbbN2M11xsd1+7x4OxklYMvTa+VekcvTM8cMan6GVe1Hn9ga4u4oMhOOKV/6UMI5Kfy7wG8QZkkTLextBmT/g5mga9lrQg0FBxlaiPZLMLss2tZS2pWyERzLB/ojoMkm/5Fsg4JgVDUEY48RzD6Pwp/go7NfJIGhYMSMa0nFmhdCyMu7HekSWlFJ8mQIu1I7AIujUObupupWcHtuskG/bBlRNvSquw/N/+zZBxlGzdBy4PlcGPokWtrC0xBFBaMkeGtuGTNSBO7z6mlQJws4Tv3cG4KYBHMRvJTRA1nnjA3Y5uiS5r/isZh6+V0OruAHlEy7k83tA7adNhVDbA70V15YeYRCz35bJv3giPgF3lu+Q6mh+yf696kpWKut6Dm3r91qOzq6URK57alXk+CikS8fe/JNjoIxwcuUE3jD40wT/itkB2dZip2Pe/vhPMvM2fx80sexxwer5pWlfZ/1AeHYTtWcMiCKGPV8Foyb+jn8azinUGiKowr1bc8RS8Hu3AqpLB9Lhbvs4XPgpYbqDA9MceIMqPpABYlIC0pDi66n2+Apwvu/nO9ugGf06F/60+KDDqRpvs/0xHVrmHvZpA87l3i3U+z1VzIRY1ueIal8iu0SIvvGQQIuaOBemQ6vLfaA1AGpZ6n15lA1c796LldBI1OoT/WqQXkkJUkQOqYzlzsbv13C9oXujvIxVxQReCq9ZVR5UZY9maahqzqHt0U=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(376002)(366004)(346002)(136003)(39860400002)(396003)(451199015)(558084003)(66556008)(91956017)(33656002)(66476007)(4326008)(64756008)(76116006)(8676002)(66946007)(66446008)(41300700001)(36756003)(5660300002)(86362001)(6486002)(478600001)(53546011)(6512007)(316002)(6506007)(38100700002)(71200400001)(122000001)(26005)(6916009)(38070700005)(186003)(8936002)(2616005)(2906002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <DEF54BB05B81EB4D9CBFCFC6D48C6341@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB8307
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM7EUR03FT037.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	b0fe50bd-baa3-4ec5-3a8f-08daf561ef19
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	4v22WoyAZGqrr630ZHwhMk60YUcHnAc0//bBUWK5NJb49xl07BBOBsUpXxCjVK6tW3KDR6JVIOHkfe8SVMFyEHSfOOwYNNq1vnG3wGsSb3DBaqw81euEq67Zg5F9G0aue3YnmWQUrH6RlIHAV4DLpPSN7qbzy4900sss0iHayW0zGNOYfhTpKFbjztfVPipLnbl/VULXrYAjTA5SWdCCmvGC/Xk5dtlYN/RI9G1HJ81rsbaoXZvhOL40ZEpBg8EHbUIN2B5D33WDF3qOAfjeLgurCN93Pw6IPVGCezZh2fr5uRFVmvPp5oD8LvkiLrZBukIC2ENgwoi4nu/g9deiwm9ZsyXWqwywpksD/VzgcLR+InmCnd+6KCS6N7wMTteAUn7XkAoiEcDkJimqcwl5z/sZG1DAG0WHp7Ggp+bb6yUyNSz30csidJlPgb66zpNutTRwCfW78Qn60AXqNxINTpUdkIeGir8eqbF6//E/P1HFgwlVwir9/uJSNPyGhQApmDhUi1S5/B2GxwYtI7JQu6N3/TmXwKNFW8P/Eh78ixdy4xEIaQ4sf2uF7kfLkJaDMA+v7XT5MpcOQNEW4v9FOV8PUv1MRAuFRyVEuOr6KUHNYKqWdDUmTfFSLPrIZAixjvdE0ZtEP8GtiZhjCsefI3l/2NrU+jUgiKRBM5KLUYtyFgdQZ0NDvYqrfEBtFsGXr8esWhHmpWtuf/aBreYwmg==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(376002)(346002)(136003)(39860400002)(396003)(451199015)(36840700001)(46966006)(40470700004)(70586007)(33656002)(4326008)(8676002)(70206006)(4744005)(40460700003)(6862004)(41300700001)(36756003)(356005)(5660300002)(86362001)(6486002)(478600001)(53546011)(6512007)(316002)(6506007)(81166007)(26005)(82740400003)(47076005)(186003)(40480700001)(8936002)(82310400005)(2616005)(336012)(2906002)(36860700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2023 12:30:28.0855
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1fc66fc2-6e5f-461e-1f63-08daf561f40d
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM7EUR03FT037.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR08MB5705
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 13 Jan 2023 12:30:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175824

T24gMTMgSmFuIDIwMjMsIGF0IDEwOjM2LCBSb3NzIEJ1cnRvbiB2aWEgbGlzdHMub3BlbmVtYmVk
ZGVkLm9yZyA8cm9zcy5idXJ0b249YXJtLmNvbUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnPiB3cm90
ZToNCj4gSSBoYXZlIHRoZSBwYXRjaCBmb3IgcHl0ZXN0LWZvcmtlZCwgZmFpbGVkIHRvIHNlbmQu
ICBJ4oCZdmUgbm90IHNlZW4gdGhlIG9wZW5nbC1lcy1jdHMgb25lIGJlZm9yZSwgSeKAmWxsIGhh
dmUgYSBsb29rLg0KDQpQYXRjaGVzIHNlbnQgdG8gb2UtZGV2ZWwuICBOb3RlIHRoYXQgdGhlIHB5
Zm9ya2VkIG9uZSBuZWVkcyB0byBtZXJnZSBhZnRlciB0aGUgcGljb2J1aWxkLT5idWlsZCBtaWdy
YXRpb24uDQoNClJvc3M=

