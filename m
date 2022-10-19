Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94D8CC433FE
	for <webhook@archiver.kernel.org>; Wed, 19 Oct 2022 15:29:44 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.76])
 by mx.groups.io with SMTP id smtpd.web10.9741.1666193380783195848
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Oct 2022 08:29:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=U/coiNJV;
 spf=pass (domain: arm.com, ip: 40.107.20.76, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=bAYSgFGwsooqKcPUNQq4JdXN9LNLOZeOEdp1Ms77l94H+aH3lO+ZS2QLPJnJJTggEhdatitToKbs39FT0Xe7aqTk7P5ViM5eMa4F4WPsb/isXDINQEBTDL5lu0aGPvnTOR6UvFZfkOGYPJjKYfjB53NzL1zLzTqNR2OOkABs8pysKGoMshRde3HvdZQ3w8I2mi3V5IgejgNGr8PySZgurnWuSB00x0titeylXpPCafgo0fSUOAruoAL06V9cwhIvoifDnhTjbowWU+Bu3prJQ1DRrInLkNRLtFkTP9YmXgoXjACnGgGgV52kGeSff8X7oc4HHVooo2kplZKz9a1Pww==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/O27ZDADDYN+m59GH22YvPClK+SjU/uxtkaZLbcFKfE=;
 b=aR8OPhnZLF8iFkHIldXxrXmIU1UCcSTaRxQm5VaymYwf1nP29HPys5+p2sXmLER+Ou3eKxNcSL6PkK5sZUM2hB/lDrK5sUZx2cFRqef7EvhROjCEWVDscIIXozryCNZutUgokw8/YN+iP/9HZzUqNPKydVWoJ4mdHRqqW96VHyA5odOZ3/swvQYnSjun/zwdf2Dak5nN25QFKVMc9hbxVMl8DBEcbrUrTYsUJQtkK00qVU23d2qG2TtTkN7b80tsDCMHlQNTq2vghJ7WiI5wJCH5S0WuliRwAH2lOaPfCVa0FeWzRD8013XKbJ1sEC20dGwMWIXqo9hqcX381K+QHg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/O27ZDADDYN+m59GH22YvPClK+SjU/uxtkaZLbcFKfE=;
 b=U/coiNJVHr1OxQEhUz7Yy8bVEeLqRaZuxibB4AhzPm+8tcZUT8Jw8Dmpt6xEIyZV2TQCvqKmd3XkfV2D3LGMoO07HUlPX4GFsoPkRPPbRTV3X5Yan5rw/tPuLmMk6tM3BbyU6AeiZzbcnTpzy1tcAa1aO9EAL2kMQGxRWKCH6mU=
Received: from DB9PR05CA0011.eurprd05.prod.outlook.com (2603:10a6:10:1da::16)
 by DBBPR08MB6140.eurprd08.prod.outlook.com (2603:10a6:10:20a::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.30; Wed, 19 Oct
 2022 15:29:33 +0000
Received: from DBAEUR03FT031.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:1da:cafe::1) by DB9PR05CA0011.outlook.office365.com
 (2603:10a6:10:1da::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.26 via Frontend
 Transport; Wed, 19 Oct 2022 15:29:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT031.mail.protection.outlook.com (100.127.142.173) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5723.20 via Frontend Transport; Wed, 19 Oct 2022 15:29:33 +0000
Received: ("Tessian outbound 73ab5f36653e:v130"); Wed, 19 Oct 2022 15:29:33 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 989bd22428fe07d8
X-CR-MTA-TID: 64aa7808
Received: from bf5b1f37095e.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 8C4B954C-D481-41CB-8D29-A820716B599E.1;
	Wed, 19 Oct 2022 15:29:26 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id bf5b1f37095e.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Wed, 19 Oct 2022 15:29:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Lu9ubkjkhbQdyAJXgHDFJv1Jb944L8elf92PerUIn0PbIzXPBVU7ZxS9Bch5qmavcieuAjYw6iO0sCdd7j2SYbKNUymG2M9RxPXgMtGYqJLaA1DaHd4kzeBKMlpePczPJd91fYEaz1cQnbcqtSO2yLEKwhNR/NfaFiiERKuw8m/r/a0CEtcgrvPrHYoEApXxhbJ5E9g7fK/dbT99Zj6kN7gRzCSdXAjPk4hwXVxwufGPZaHJjR7uBia8gFwRCpVi/gW+J0IZtEotgtxJGRVR86KFfs28LyizXGjrXmb5XxEXXxqBazW+MjBbKe55MZRCbxk0WhPujvNg4tHtqncoeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/O27ZDADDYN+m59GH22YvPClK+SjU/uxtkaZLbcFKfE=;
 b=Eax6OI4ZX///ijHnCnc4JRcbGPFIeLDAxNVVHsesRkCUT/ejq3vhVZHuwxIR5W6iV/Wp76zDTozYGAVrXirgqPfoGyOg3mwFBNAKBepi/x49VXkN9/b4gGnuVXAiuygf6WxRD4punXF6XcjRQZie6BcOwkHhmSv1zmt7sDNSgwsKPB/YyNNZSAwmiv2AbjViA6SKsjb7g9Fkm4Cq3Hlo/s3Hm/D+FkbNjYbNYuHTPAC1/dRmF9K3DeW6qcxtc4NEfpnhk/OkmqDipN1b9R9QHTX5gP/jp5geUD5/Ywx86gi6BM5Oij3x5SSjwQzeLOdgd6ty6/q9pWLsH77cw/6J7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/O27ZDADDYN+m59GH22YvPClK+SjU/uxtkaZLbcFKfE=;
 b=U/coiNJVHr1OxQEhUz7Yy8bVEeLqRaZuxibB4AhzPm+8tcZUT8Jw8Dmpt6xEIyZV2TQCvqKmd3XkfV2D3LGMoO07HUlPX4GFsoPkRPPbRTV3X5Yan5rw/tPuLmMk6tM3BbyU6AeiZzbcnTpzy1tcAa1aO9EAL2kMQGxRWKCH6mU=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by DB4PR08MB9310.eurprd08.prod.outlook.com (2603:10a6:10:3f6::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.29; Wed, 19 Oct
 2022 15:29:24 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7d2b:2570:9a99:a3d2]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7d2b:2570:9a99:a3d2%7]) with mapi id 15.20.5723.033; Wed, 19 Oct 2022
 15:29:24 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "raj.khem@gmail.com" <raj.khem@gmail.com>
CC: Alexander Kanavin <alex.kanavin@gmail.com>, Kai Kang
	<kai.kang@windriver.com>, "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH v2] mesa: Add native patch via a variable
Thread-Topic: [OE-core] [PATCH v2] mesa: Add native patch via a variable
Thread-Index: AQHY40aPLhs0RUV58EC5K9y7I+JUAK4VNHcAgAAOowCAAJV7AA==
Date: Wed, 19 Oct 2022 15:29:24 +0000
Message-ID: <E6C978BA-94B2-43D9-9275-29EC0323CDC1@arm.com>
References: <20221018230820.2385167-1-raj.khem@gmail.com>
 <CANNYZj-r7G4y3ma8NkrgmKm-vgoXjvMEWYAUh=bOE0z80DrxkA@mail.gmail.com>
 <CAMKF1srnBDVj5ig2ZF_fX+-UZ5jtp0U89uG8qE5cuW1SjX0AfQ@mail.gmail.com>
In-Reply-To: 
 <CAMKF1srnBDVj5ig2ZF_fX+-UZ5jtp0U89uG8qE5cuW1SjX0AfQ@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3696.120.41.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|DB4PR08MB9310:EE_|DBAEUR03FT031:EE_|DBBPR08MB6140:EE_
X-MS-Office365-Filtering-Correlation-Id: 6eb3429d-ea09-4bee-6080-08dab1e6b934
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 Q20+9onQvkHzqRSZuU+yE9G0DDXS8vCHGxcxeN/mq/Jb4bWzJ9n8NM/Fzj28nNCqNAjzylBLTN7Igm0qj6Q1osFyuQCenUNeQLg3yhhJS+EgUm9d3VsckbS2CwivsghCMMOjyv9ZKomboWTNrjdiM+v0T/FT0Zvm0h33zf+C+kj4cViGO1ektpZ0QM8UCCl+u/RfW3+TDKlFNV3HNpRv83Z0ZodPTj9crGulNd7c4M0QzO3yHMuR3/oznq+CAAXz1tZ+DRtzkUdItMgswHD7XJZ34YhyRsmL4SZSs69ddkPH9pm4hXDSHIG6ShZCIdDFZWATy5KpgC1juaKR9FpRW/lAoq5QHm8ltWgQVrp4lGN1VQqN7L3pvf2+V9eUhnTo7ladm7mKtwfmV8Uifw+NL71bls0YP0uQDJkWbV5eiGj90LxxotMkZ7EmxD1IxwWx17V3aVxL/LFoa1jDQjoPayN2nJtpCHNw/CbLHKtsAKYJR9jJPZqcl01VNcHCUIr/gQim+vm4Uu4jr3HrMJiJj7fpnMahweWp8RXFSr91ECUpdOnw5Tu0P7ukpQ4zzhLsW0tXl2yxhAPVgN/bCOoj4/AeC7Jwj1R0BCB8qtK+oezcKQkhNiQfK8aVVGJJIPM0Knez7ZVcX+ovoZ2K6bYLxl5JA0/0DLmeq4qQ9VwHAIDC7Wo8ggbH0GjUf0vHH5OgaOkeujbRzUKOtn4/aIo+yqip939az6UvQ1TYeR2G+OoTxfQC4PA1I25SR5utS9oAjgekZeSZxuc3mvSrk5T9UbcGl3mxTipSJnabeQS3rt+hQvzMYOz8jTq51J6OYelmFH53S34foqd2cuQ8Ld50mg==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(366004)(39860400002)(396003)(136003)(376002)(346002)(451199015)(2906002)(4744005)(5660300002)(8936002)(54906003)(66946007)(91956017)(36756003)(64756008)(66446008)(66476007)(66556008)(8676002)(6916009)(122000001)(966005)(6486002)(6506007)(33656002)(71200400001)(478600001)(41300700001)(4326008)(83380400001)(316002)(86362001)(76116006)(53546011)(38100700002)(186003)(38070700005)(2616005)(26005)(6512007)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <C8002A85AB359F4883C84C43516E482A@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4PR08MB9310
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DBAEUR03FT031.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	47ce4bdc-1186-42e4-7c18-08dab1e6b403
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	BheWKGV4BdpIf2b4bDLeZH5PnXaz1vnWwf5ydGUPunyO6WUkhvnKNmSWhOJr08SxmJ1KBVeO09qvtcz6Od6v2tpPF/Xgypl4ZlyrKLL2qrHxt8X7Yn1A/eO42k9WvmMQi2CmCKcEvXp9SJ25ZkopxC4feMNzSq3cOm3II2zrHxGHURfi+viI303jFiMohof04BcAXKKMa89C6tqAz1YEqQFtMHBxFL58IPawG9xGqKTlNzT6cel7X8P80D70onByxhvO8aWfxsOjLMZRcb9fn5YylbhPIEZ7UVnHkpycS6ODPcPtv2ThpPkrSqXAk94aPK3c9WhnjF99fzbA1HCiMkZlR3EolYp358bbzSBA0EpXeB7nohwohE6Lg7pGWecjvNyrfY6D29farwaTsVXl7NMxwVjJkrCzuxjfswhB+r6wVEmGy5R2vFEd77SX3ikXfX1xl7CPK60f0+Y9ChlLCZr7Bj4xBJLNFaRfLPNkkBtYCprdu4yse1oK6RfKhhKD4VvM8N3eY0At/0nQzNtA0qtffulYde3Z0r7vmZrrqfU/MtbUkZLtWiAiWJN3djwmThxQapviWzTHi/3AbWuoCe69R0TfqMFztkOa5g5iy+wrMut+pzpELTiPAOT7qOxCo2X/s20lHfYGnTwBf70sC1Gnd35+XR1lScRLwll4y9pPVK8Hq3HIX64qGJgwax/tDgD0NlCnYRnIdV9YPxykHJR7z4gn9olyjSyiMzuUs4LaAPkOCeLZDBdUw79VDvfdnWGxwUUv9dg60d9g7NwkXs8nxHRDc7JqMDm8DXPH2IQ=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(346002)(136003)(376002)(396003)(39860400002)(451199015)(40470700004)(46966006)(36840700001)(47076005)(186003)(2616005)(83380400001)(356005)(81166007)(26005)(86362001)(36860700001)(336012)(82740400003)(4744005)(5660300002)(2906002)(8936002)(966005)(4326008)(40480700001)(82310400005)(6862004)(8676002)(40460700003)(478600001)(6486002)(6506007)(53546011)(316002)(41300700001)(70206006)(54906003)(6512007)(70586007)(36756003)(33656002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2022 15:29:33.4002
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6eb3429d-ea09-4bee-6080-08dab1e6b934
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DBAEUR03FT031.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB6140
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Oct 2022 15:29:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/171970

T24gMTkgT2N0IDIwMjIsIGF0IDA3OjM0LCBLaGVtIFJhaiB2aWEgbGlzdHMub3BlbmVtYmVkZGVk
Lm9yZyA8cmFqLmtoZW09Z21haWwuY29tQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+IHdyb3RlOg0K
PiANCj4gT24gVHVlLCBPY3QgMTgsIDIwMjIgYXQgMTA6NDIgUE0gQWxleGFuZGVyIEthbmF2aW4N
Cj4gPGFsZXgua2FuYXZpbkBnbWFpbC5jb20+IHdyb3RlOg0KPj4gDQo+PiBDYW4geW91IHNob3cg
ZXhhbXBsZXMgd2hlcmUgdGhpcyBpcyBuZWVkZWQ/IEN1c3RvbSB2YXJpYWJsZSBkb2VzIG5vdCBz
ZWVtIGEgZ29vZCBpZGVhLiBJIGFsc28gd29ycnkgdGhhdCBpdOKAmWxsIGJyZWFrIGF1dG9tYXRl
ZCB1cGRhdGVzIChpdOKAmXMgYmFkIGVub3VnaCB3aXRoIG1lc2EtZ2wsIHRoaXMgbWlnaHQgbWFr
ZSBpdCB3b3JzZSkuDQo+IA0KPiBodHRwczovL2dpdGh1Yi5jb20vbmRlY2hlc25lL21ldGEtcWNv
bS9ibG9iL21hc3Rlci9yZWNpcGVzLWdyYXBoaWNzL21lc2EvbWVzYV9naXQuYmINCg0KVGhhdCBp
cywgd2VsbCwgaG9ycmlibGUuDQoNCipJZiogd2XigJlyZSBnb2luZyB0byBleHBvc2UgYSBtZXNh
LmluYyB0aGF0IHBlb3BsZSBvdXRzaWRlIG9mIGNvcmUgY2FuIHVzZSB0byBwYWNrYWdlIHVwIHRo
ZWlyIG93biByYW5kb20gTWVzYSBTSEEgdGhlbiBtZXNhLmluYyBzaG91bGQganVzdCBiZSB0aGUg
cGFja2FnaW5nIGxvZ2ljLg0KDQpIb3dldmVyLCBJIGRvbuKAmXQgdW5kZXJzdGFuZCBzb21ldGhp
bmcgYWJvdXQgdGhlIHBhdGNoLg0KDQpXaHkgZG8gd2Ugb25seSBuZWVkIHRvIGFwcGx5IGl0IG9u
IG5hdGl2ZSBidWlsZHM/ICBJdOKAmXMgYSBiYWNrcG9ydCBmcm9tIHVwc3RyZWFtLCBzbyBzaG91
bGQgYmUgdGhlIGZpeC4gIElmIGl0IGJyZWFrcyB3aGVuIGFwcGxpZWQgdG8gdGFyZ2V0IGJ1aWxk
cywgaXMgdGhlcmUgYSBidWcgdXBzdHJlYW0gZm9yIHRoYXQ/IA0KDQpSb3Nz

