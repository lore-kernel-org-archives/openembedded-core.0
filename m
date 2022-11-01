Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE427C4332F
	for <webhook@archiver.kernel.org>; Tue,  1 Nov 2022 16:58:11 +0000 (UTC)
Received: from EUR02-AM0-obe.outbound.protection.outlook.com (EUR02-AM0-obe.outbound.protection.outlook.com [40.107.247.56])
 by mx.groups.io with SMTP id smtpd.web10.8981.1667321886095939354
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Nov 2022 09:58:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=oKaNQNj6;
 spf=pass (domain: arm.com, ip: 40.107.247.56, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=JSXdmJgLqNI/46s83a/LtMEDeY4mQGHu09I9Rs9PvwpW9gREeJbQ8dceDMZb/PC9E5PEmxg3CM+BT4CxV0rxKSxrKGhjBc7tIcSFyDzBlaJWX+7Yasd0snozhXlaweVLaqguMkVJbtAv5RjQFFjrxTwMWYYZswGCSwluHO9EKulXsUwvmizFMh6VcoJxJ68bYY2mHer0sdzqedd85d5Q7H3onTLgbQWeRrCHxvCA1OQuqk/84zQJ/8P7wUdbSbvxZF2MHPMd/KY0XKMGHQEMxAzV04TOwO+ay17ubjxrQ1/fscyOZaywyx6/HRpaXYwh3jgtu7M6mi4sSUnRT6tB8g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=65V1s1bYyCFI1wIWDgCZ9JbtiwLfDQMOcfqKLLmGBoQ=;
 b=SUjjtLitXx537EQcoh+tAg17oFwGUUma0OgAw9mgw5rULfvvhCx1jtHAHSu6XgdPgndo+mgNM3rvxhwjuqUsyy18NmHS9YvieLxgkZrDttkmcqvZUOWYu4t6Ot2Oa3MABGR79HRUoZyg+t6++53GLWCX2RmL0IEAImCL0kh4hbwvCu70XiDD3JjQfEUyISJnRQecrUW+H59mjg9sVliFr9Y6Q0KmhCuYpXRqLPxB9KvgGM1wLVKq0WVMgjAETr3eWz2MySNjqhuwC+7ssDVWot9DvIN+f1dLlfb0i4GsyiZH3+spe3TId6sf8nvC42SXalrfjTaD5FtL0t79BzyQMw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=65V1s1bYyCFI1wIWDgCZ9JbtiwLfDQMOcfqKLLmGBoQ=;
 b=oKaNQNj6WWl92TuH7QXbc/3Ru7Vlh8nFw4I4Bws5HrfH3MTXHy5X88kMfNoTvX8FJ+lscM7RxIkETVwwNMZCLPHvKqBAVI4S7jG2LLTDR6ajbvABuAU0pCvStH28TtbVpQmnml8n1ZKZmf1JoXppdGRUk4N1KGUdao6gHWRxuHQ=
Received: from DB6PR0201CA0036.eurprd02.prod.outlook.com (2603:10a6:4:3f::46)
 by AM0PR08MB5378.eurprd08.prod.outlook.com (2603:10a6:208:18a::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5769.19; Tue, 1 Nov
 2022 16:57:54 +0000
Received: from DBAEUR03FT013.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:3f:cafe::90) by DB6PR0201CA0036.outlook.office365.com
 (2603:10a6:4:3f::46) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5769.16 via Frontend
 Transport; Tue, 1 Nov 2022 16:57:54 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT013.mail.protection.outlook.com (100.127.142.222) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5769.14 via Frontend Transport; Tue, 1 Nov 2022 16:57:54 +0000
Received: ("Tessian outbound 73ab5f36653e:v130"); Tue, 01 Nov 2022 16:57:54 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: f14fe85c8d089b7f
X-CR-MTA-TID: 64aa7808
Received: from f93b622fe343.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 1BB99A6D-5BAF-4D90-8EB9-80E9AF1D7EF9.1;
	Tue, 01 Nov 2022 16:57:46 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id f93b622fe343.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Tue, 01 Nov 2022 16:57:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CnucuUWf/aZgXzHlEQh635oI91s4dYHfdRrdnZxvHV9MkXnXQDPAUfo/V5TRBD8x2K9qDz47R+epMxlXxAxyWvh55xzTHbMFMjT9oNvc/DTrL9Nc7emf7P5E5AILRFfAwMdMtAP52UP1pnF94lJK4yoOCnTxAcDR1x3KGOe0W3TxlVlXrKxO5D1dbG8UCsP/E9bVaMq3B0VfKdi1faQXT/hALcGOJJMxnVCac1tVhL95Fa7YMI6w1jGRHjNP8C1HvFNvjYNhF3mF4gtf7usVxZXOQL3qcB/E26IuRpvH6PzANp95uvFiiuaGLkd5cz1FmTKprhUbm/MK814bg+a7tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=65V1s1bYyCFI1wIWDgCZ9JbtiwLfDQMOcfqKLLmGBoQ=;
 b=maeF+LztYKXJpdFfddqcBZbN8e1zPmW6pxXOIwjyXSH6UDNOT2Qp0SX5uYCKxaR71WP22s19GGyt0jlP4zlf3yJb+ZVbpvtPczJNaopfCbE8qimteB5Cx6ibAv8tX2O645OJxYNdISvn+BdF+NUzZSX39Z+1WhPP00j3lfFIi6fueMG88ZaF3aWl43o1kEdlo5K0hd8f+dxwxqbatkKCelKJXiquDRgPIy6ulqLCMfnl1wJ152CSmiFTIE5P+t53TrUosmAE3sDGplihfsOQ+UyWkgP2NnTEWmtotBWwp7YKt5tCJhPJQwVGqqVpS6YrGtKoVH7nfFVsHkmPP1Xifg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=65V1s1bYyCFI1wIWDgCZ9JbtiwLfDQMOcfqKLLmGBoQ=;
 b=oKaNQNj6WWl92TuH7QXbc/3Ru7Vlh8nFw4I4Bws5HrfH3MTXHy5X88kMfNoTvX8FJ+lscM7RxIkETVwwNMZCLPHvKqBAVI4S7jG2LLTDR6ajbvABuAU0pCvStH28TtbVpQmnml8n1ZKZmf1JoXppdGRUk4N1KGUdao6gHWRxuHQ=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by VI1PR08MB5535.eurprd08.prod.outlook.com (2603:10a6:803:13e::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5769.21; Tue, 1 Nov
 2022 16:57:44 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::52da:ac9d:e42d:8cc]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::52da:ac9d:e42d:8cc%5]) with mapi id 15.20.5769.019; Tue, 1 Nov 2022
 16:57:43 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "blake.alexander@airbus.com" <blake.alexander@airbus.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] wic: fix corrupt vfat with rawcopy of sparse
 files
Thread-Topic: [OE-core] [PATCH] wic: fix corrupt vfat with rawcopy of sparse
 files
Thread-Index: AQHY7ecqoOZwv0LuEkSfBBJz6SwsMq4p8h2AgABYJoA=
Date: Tue, 1 Nov 2022 16:57:43 +0000
Message-ID: <C9928006-6F61-473B-9FD3-3C2C60C58CB5@arm.com>
References: 
 <CAE=baehdk3a9xYOG3za_aG4VZy7GAem=5iiZPVm0ZuSYmrWXug@mail.gmail.com>
 <Groupsio.1.CAE=baehdk3a9xYOG3za_aG4VZy7GAem=5iiZPVm0ZuSYmrWXug@mail.gmail.com>
In-Reply-To: 
 <Groupsio.1.CAE=baehdk3a9xYOG3za_aG4VZy7GAem=5iiZPVm0ZuSYmrWXug@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3731.200.110.1.12)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|VI1PR08MB5535:EE_|DBAEUR03FT013:EE_|AM0PR08MB5378:EE_
X-MS-Office365-Filtering-Correlation-Id: 5424fc8a-6e5b-4ec8-cc1b-08dabc2a3842
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 Msmtwcm3RwtIkEP35Zt4hZq2wg3fVJ2WCiE9/HN8k7hHxAohBHQvcuQKBCbA2FO1L6I2/gnctJ6ky7wNUYwSxJRkYyn79KQMHRiQQc8eEYdhuu5T+y3zV4jBKznlctOGLOn1K0VxlIdO+CQr3pX9hqqBwTUY4toplx2n9H6YKLDTgEpEvg+/PGWKAkHYaXgoX9Fh9BrQ741LXbNJdx5zRzMoZSTL5ZGEOHQz+IkmMgJnMpfS6iq095jlR8iaO9BIwD+7DEEswu4Ozu9IoJX2cDh6gp9A+x6MJX3xseweMzdenBnPniXdL0CsUQuJ8uLP8zValmVP8PYcszjJVDh0B2tV8xEG0cdWVzxUbjn4BNpI6qqtxuXX/Xtglq7fVVpUBXrWc5QXJGZTQxyfxICYq2GB5JS/hq1PbJ/4uZqQ5GS1I1f4FMSTV5IAPMYSqz4F8H/nFsYU8Ec+y/suuxTeiNLcAP8x+DmvaSFIYEs45FA3YDt1GRWs94R61xBCYHx9rky3gme0X78XpGTufq02NBi7VbVuj4MNzaauiA+Y/gN1hjKtvtCw8VdR6OmCVaCr0JxxMGwG/g5DupYIb11gTZZU9hXXrRadgBdRKx35J3Cc/iQlMMgrpgcIKAn5TCCYq2miDekwLwo/MaGvUSvNPfHfu1l/tsETUB3DbLarzt0UchG75KKV3EeKkH0DQD3DY/O4+9BNIGTWUEG3WHtH0mUEiQ/nBGe7xhstZQ6IBcftsC1c7PBDPsCjDKWiZXC5FbfD4dRBorZMrExSKi4+gJ8Ev7Ss4dnXM9l8SWhuKzU+3KMEH43uRezKy5rEsaqjdJCNIMjPbOYjZ5l+KdhrUA==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(366004)(39860400002)(396003)(376002)(136003)(346002)(451199015)(83380400001)(38070700005)(86362001)(33656002)(122000001)(38100700002)(5660300002)(2906002)(186003)(64756008)(4326008)(66556008)(8676002)(66476007)(66946007)(66446008)(8936002)(6506007)(76116006)(2616005)(26005)(6512007)(316002)(41300700001)(6916009)(91956017)(966005)(6486002)(478600001)(71200400001)(53546011)(66899015)(36756003)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <8234713D13D06D499345AEC663296B8D@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB5535
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DBAEUR03FT013.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	83b0da59-99db-43f4-1993-08dabc2a31e0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	+5Dz4L791oYEpbDFqlNsmAhFKsU0nYl8a0Zkt1KY3XrwjYDaO47PeUduAJ3FjTRzUMi62IoRhqGD+Sr6dgXUjo8Ir3WHwwRJ9uyxjP6EzW2Q19mOTKh4ubLiH+lwhbHFsPeOBHfo5WeUf1yy+NT6PQtGrBK83wPyMM4uxv/VroIBXJhs+/oMvtNVliqIFWQGXnC2eXs6xdjz9eOxbJjkeEtTTPsUOPnod2Do4H5Apn6JYimtBEVSyshtnEVuNgDGp+rZAc5wADAD8NkuACwJgoDRyNOWKKyqjpONcU2FcSXoPh9fTL47+clUDWsMdnq6o5uC1yBCFFuWI4BeLsiGLtDk6ncm8uLTdKuzwmKXMpE4D0P9xsmEdA2k3gj0NBqcdL7OXfBywvDuzpy2HrNu5bgNgPkWIT2FB3yR2VZMOaonnit/XFTyu5ooBDQqFvyuQlnc1kpDgBhSbCNqwSNUDKnQfqjNAjfX6dPF3DmXhXJQQujvxV3ByRf9PRVjSrXs64WslQ3XX0goYblf9uLoCi8ZKNdWqb43XgMAF5jNl2HJfdf/epw7Uijq/d/UCNECFN3dIPNwAfymE29RMfnwFDM2OAHexbPGFgUS4IyZwW1qy1DVD+MQHsU4xeZcvRry45fuRN/df9kSCTqhApsVreZTsX6Bf2z1wSNtGXEB5HvFFM+6tIee/P/h7zUIixu3kwGY/RWY4syLF/Rm3n7JcZHgzMyN9dnwrmtJ7ogM76e6BejKIjsauPIfn3jwx6Q8jBNg9iooJKlvo2wjNPirl/ZDnS//a1CiMur/yQlsH3k=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(396003)(39860400002)(136003)(346002)(376002)(451199015)(36840700001)(40470700004)(46966006)(82310400005)(66899015)(36756003)(86362001)(186003)(47076005)(40460700003)(336012)(83380400001)(41300700001)(8936002)(6862004)(5660300002)(33656002)(81166007)(356005)(70586007)(4326008)(36860700001)(8676002)(966005)(2616005)(2906002)(6506007)(316002)(53546011)(478600001)(82740400003)(26005)(70206006)(6512007)(40480700001)(6486002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Nov 2022 16:57:54.4896
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5424fc8a-6e5b-4ec8-cc1b-08dabc2a3842
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DBAEUR03FT013.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB5378
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Nov 2022 16:58:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172368

SGkNCg0KQ2FuIHlvdSBzZW5kIHRoZSBwYXRjaCB1c2luZyBnaXQtc2VuZC1lbWFpbD8gIFlvdXIg
bWFpbGVyIGlzIGVpdGhlciBzZW5kaW5nIHRoZSBwYXRjaCBhcyBwbGFpbiZodG1sIGF0dGFjaG1l
bnRzIG9yIHJlZm9ybWF0dGluZyB0aGUgcGxhaW4gdGV4dCwgc28gZ2l0IGFtIGNhbuKAmXQgYXBw
bHkgaXQuDQoNClJvc3MNCg0KPiBPbiAxIE5vdiAyMDIyLCBhdCAxMTo0MiwgQmxha2UgQWxleGFu
ZGVyIHZpYSBsaXN0cy5vcGVuZW1iZWRkZWQub3JnIDxibGFrZS5hbGV4YW5kZXI9YWlyYnVzLmNv
bUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnPiB3cm90ZToNCj4gDQo+IFtFZGl0ZWQgTWVzc2FnZSBG
b2xsb3dzXQ0KPiBbUmVhc29uOiByZW1vdmUgdW5uZWVkZWQgYXV0b21hdGljIGZvb3RlciBhbmQg
cmF3IHNtdHAgaGVhZGVyc10NCj4gdmZhdCBwYXJ0aXRpb25zIGRvIG5vdCBzdXBwb3J0IHNwYXJz
ZSBmaWxlcy4gV2hlbiB1c2luZyB0aGUgcmF3Y29weQ0KPiBwbHVnaW4gdG8gd3JpdGUgYW4gaW1h
Z2UgdG8gc3VjaCBhIHBhcnRpdGlvbiB0aGUgZmlsZXN5c3RlbSBtYXkgYmVjb21lDQo+IGNvcnJ1
cHRlLiBCb290IHN5c3RlbXMgc3VjaCBhcyBVRUZJIHJlcXVpcmUgdGhlIGJvb3QgcGFydGl0aW9u
IHRvIGJlIGENCj4gRkFUIHR5cGUgYW5kIHRoaXMgbWF5IHRoZXJlZm9yZSByZXN1bHQgaW4gYW4g
dW4tYm9vdGFibGUgc3lzdGVtIGR1ZSB0bw0KPiBib290IHBhcnRpdGlvbiBjb3JydXB0aW9uLg0K
PiANCj4gU3BhcnNlIGZpbGUgY29weWluZyBpcyBhZHZhbnRhZ2VvdXMgd2hlbiB0aGUgaW1hZ2Vz
IGNvbnNpc3Qgb2YgbW9zdGx5DQo+IGVtcHR5IG9yIHVudXNlZCBzcGFjZS4gU3lzdGVtcyB1c2lu
ZyBzcGFyc2UgZmlsZSBjYXBhYmxlIGZpbGVzeXN0ZW1zDQo+IHNob3VsZCBub3QgaGF2ZSB0aGlz
IGJlaGF2aW91ciB0YWtlbiBhd2F5IGZyb20gdGhlLCBob3dldmVyLCB3aGVuIHVzaW5nDQo+IGEg
bm9uLWNvbXBhdGlibGUgZmlsZSBzeXN0ZW0sIHRoZSB3aWMgc2NyaXB0IHNob3VsZCBub3QgcGVy
Zm9ybSBzcGFyc2UNCj4gZmlsZSBvcGVyYXRpb25zLiBJZiByZXF1aXJlZCwgdGhlIHVzZXIgc2hh
bGwgYmUgYWJsZSB0byBvdmVycmlkZSB0aGlzIHRvDQo+IGFjaGlldmUgdGhlIGJlaGF2aW91ciBw
cmlvciB0byB0aGlzIHBhdGNoLg0KPiANCj4gVGhlIHdpYyBzY3JpcHQgd2lsbCBub3cgY2hlY2sg
dGhlIGZpbGVzeXN0ZW0gdHlwZSBvZiB0aGUgZGVzdGluYXRpb24gYW5kDQo+IHVzZSBub24tc3Bh
cnNlIGNvcHlpbmcgZnVuY3Rpb25zIGlmIGl0IG1hdGNoZXMgdGhlIHR5cGUgJ3ZmYXQnLiBJZg0K
PiAnYWxsb3ctaG9sZXMnIGlzIHNwZWNpZmllZCBpbiB0aGUgcGx1Z2luIHBhcmFtZXRlcnMsIHRo
ZW4gdGhpcyB3aWxsIGJlDQo+IGlnbm9yZWQgYW5kIHNwYXJzZV9jb3B5IHNoYWxsIGJlIHVzZWQg
aW5zdGVhZC4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IEJsYWtlIEFsZXhhbmRlciA8Ymxha2UuYWxl
eGFuZGVyQGFpcmJ1cy5jb20+DQo+IC0tLQ0KPiAgc2NyaXB0cy9saWIvd2ljL3BsdWdpbnMvc291
cmNlL3Jhd2NvcHkucHkgfCAxMSArKysrKysrKystLQ0KPiAgMSBmaWxlIGNoYW5nZWQsIDkgaW5z
ZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9zY3JpcHRzL2xp
Yi93aWMvcGx1Z2lucy9zb3VyY2UvcmF3Y29weS5weSBiL3NjcmlwdHMvbGliL3dpYy9wbHVnaW5z
L3NvdXJjZS9yYXdjb3B5LnB5DQo+IGluZGV4IDdjOTBjZDNjZjguLjFlMGRkYmFjMTIgMTAwNjQ0
DQo+IC0tLSBhL3NjcmlwdHMvbGliL3dpYy9wbHVnaW5zL3NvdXJjZS9yYXdjb3B5LnB5DQo+ICsr
KyBiL3NjcmlwdHMvbGliL3dpYy9wbHVnaW5zL3NvdXJjZS9yYXdjb3B5LnB5DQo+IEBAIC04OSwx
MCArODksMTcgQEAgY2xhc3MgUmF3Q29weVBsdWdpbihTb3VyY2VQbHVnaW4pOg0KPiAgICAgICAg
ICBpZiBub3Qgb3MucGF0aC5leGlzdHMob3MucGF0aC5kaXJuYW1lKGRzdCkpOg0KPiAgICAgICAg
ICAgICAgb3MubWFrZWRpcnMob3MucGF0aC5kaXJuYW1lKGRzdCkpDQo+ICANCj4gLSAgICAgICAg
aWYgJ3NraXAnIGluIHNvdXJjZV9wYXJhbXM6DQo+ICsgICAgICAgICMgU3BhcnNlIGNvcHkgaWYg
dGhlIGZpbGUgc3lzdGVtIHN1cHBvcnRzIGl0IG9yIGFsbG93LWhvbGVzIGlzIHNldCB0byBvdmVy
cmlkZQ0KPiArICAgICAgICBhbGxvd19ob2xlcyA9IEZhbHNlIGlmIHBhcnQuZnN0eXBlID09ICJ2
ZmF0IiBhbmQgc291cmNlX3BhcmFtcy5nZXQoImFsbG93LWhvbGVzIiwgVHJ1ZSkgZWxzZSBUcnVl
DQo+ICsNCj4gKyAgICAgICAgaWYgYWxsb3dfaG9sZXMgYW5kICdza2lwJyBpbiBzb3VyY2VfcGFy
YW1zOg0KPiAgICAgICAgICAgICAgc3BhcnNlX2NvcHkoc3JjLCBkc3QsIHNraXA9aW50KHNvdXJj
ZV9wYXJhbXNbJ3NraXAnXSkpDQo+IC0gICAgICAgIGVsc2U6DQo+ICsgICAgICAgIGVsaWYgYWxs
b3dfaG9sZXMgYW5kICdza2lwJyBub3QgaW4gc291cmNlX3BhcmFtczoNCj4gICAgICAgICAgICAg
IHNwYXJzZV9jb3B5KHNyYywgZHN0KQ0KPiArICAgICAgICBlbGlmIG5vdCBhbGxvd19ob2xlcyBh
bmQgJ3NraXAnIGluIHNvdXJjZV9wYXJhbXM6DQo+ICsgICAgICAgICAgICBleGVjX2NtZChmImRk
IGlmPXtzcmN9IG9mPXtkc3R9IGlicz17c291cmNlX3BhcmFtc1snc2tpcCddfSBza2lwPTEgY29u
dj1ub3RydW5jIikNCj4gKyAgICAgICAgZWxzZToNCj4gKyAgICAgICAgICAgIGV4ZWNfY21kKGYi
Y3AgLS1zcGFyc2U9bmV2ZXIge3NyY30ge2RzdH0iKQ0KPiAgDQo+ICAgICAgICAgICMgZ2V0IHRo
ZSBzaXplIGluIHRoZSByaWdodCB1bml0cyBmb3Iga2lja3N0YXJ0IChrQikNCj4gICAgICAgICAg
ZHVfY21kID0gImR1IC1MYmtzICVzIiAlIGRzdA0KPiAtLSANCj4gMi4yNS4xDQo+IA0KPiAtPS09
LT0tPS09LT0tPS09LT0tPS09LQ0KPiBMaW5rczogWW91IHJlY2VpdmUgYWxsIG1lc3NhZ2VzIHNl
bnQgdG8gdGhpcyBncm91cC4NCj4gVmlldy9SZXBseSBPbmxpbmUgKCMxNzIzNTgpOiBodHRwczov
L2xpc3RzLm9wZW5lbWJlZGRlZC5vcmcvZy9vcGVuZW1iZWRkZWQtY29yZS9tZXNzYWdlLzE3MjM1
OA0KPiBNdXRlIFRoaXMgVG9waWM6IGh0dHBzOi8vbGlzdHMub3BlbmVtYmVkZGVkLm9yZy9tdC85
NDcwNjg3OC82ODc1ODg4DQo+IEdyb3VwIE93bmVyOiBvcGVuZW1iZWRkZWQtY29yZStvd25lckBs
aXN0cy5vcGVuZW1iZWRkZWQub3JnDQo+IFVuc3Vic2NyaWJlOiBodHRwczovL2xpc3RzLm9wZW5l
bWJlZGRlZC5vcmcvZy9vcGVuZW1iZWRkZWQtY29yZS91bnN1YiBbcm9zcy5idXJ0b25AYXJtLmNv
bV0NCj4gLT0tPS09LT0tPS09LT0tPS09LT0tPS0NCj4gDQoNCg==

