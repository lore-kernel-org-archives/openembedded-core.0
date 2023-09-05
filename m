Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6C49C83F3E
	for <webhook@archiver.kernel.org>; Tue,  5 Sep 2023 13:46:22 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.64])
 by mx.groups.io with SMTP id smtpd.web11.21845.1693921581391262761
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Sep 2023 06:46:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=r4f/Wkaf;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=r4f/Wkaf;
 spf=pass (domain: arm.com, ip: 40.107.21.64, mailfrom: ross.burton@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZA9tUwZvvYOSjf52beEKURtfeU61BErHUuD/gvpTLYE=;
 b=r4f/Wkafzuc4zU3yd5Je/P4puBiZaYQwBXVsk3AX+KVSAtSOQrd+rjM8P1j6oj3+cusT4H1X0FrhM/Q0Sc5PgLJRbCWwwEYSP2jl6Tonjrbp5v7AEX78/UfKJcTu568aLlbB3Z4bg05pzzfFkWWAL3DFjZvVvy0S2Sw2Vp1dOkY=
Received: from AM6P195CA0058.EURP195.PROD.OUTLOOK.COM (2603:10a6:209:87::35)
 by PAXPR08MB6336.eurprd08.prod.outlook.com (2603:10a6:102:158::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.33; Tue, 5 Sep
 2023 13:46:17 +0000
Received: from AM7EUR03FT004.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:87:cafe::c0) by AM6P195CA0058.outlook.office365.com
 (2603:10a6:209:87::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.32 via Frontend
 Transport; Tue, 5 Sep 2023 13:46:17 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT004.mail.protection.outlook.com (100.127.140.210) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6768.26 via Frontend Transport; Tue, 5 Sep 2023 13:46:17 +0000
Received: ("Tessian outbound c99fbc01d472:v175"); Tue, 05 Sep 2023 13:46:16 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: e7cf45332a6f269a
X-CR-MTA-TID: 64aa7808
Received: from 2d5fe6dd3953.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 7280AA2A-842A-45E2-8DAE-9FA51DA2975B.1;
	Tue, 05 Sep 2023 13:46:10 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 2d5fe6dd3953.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Tue, 05 Sep 2023 13:46:10 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GGypkD3M3KvzWBmMRk1qHVsQaG0YvtsgNZQ+YPYjNENDEcXKUzlAHHBHgkW/1HT0N13kHsoelUtD31WO49+OpCiOjX5VODkCsy1BiMmY1v425Z0h54CLJ1b2tv6X1qoQkwh5p9+J8W++t8d3Q9+sC+r0kXVoDM1XXit+mCgrgs8OaE2S/10rV7WlvV/vhv6rlelWFsDivW8Y02U5gD9ffIlnpASRqFKNaW5TSGwwrdZYwN+Nj1dPbMm37IwUoBb7y5t3o60q0NGsO0kNH4fzYJWUy6WB9VzEu+mmqGIC9rxGEDWfC55uGdWD6GtgcvA5txoHe5YjsVDc/LPIXbvE6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZA9tUwZvvYOSjf52beEKURtfeU61BErHUuD/gvpTLYE=;
 b=b60x0ZwJQEy5+JgZzitggIVrJMY0Ra05r820azb/A2feHCPnNsXg9ThAB0UslvgSIDj9N5tplo0Zhhi3CWfSF2tQqSfccZPWdsjwrvhFOqI6Iji3aXgcHYV11/att6xh9UCayg2v/+S0NEVAQ46WapqcaVV4C2TbrEsQS8xLaXDAeaDOd+uJp3Cg2UDOPmJIFhnKtiOkl5+DtoG/xNqIWyK38jAgTiAQdYcFJ5uqLN0N33U+F2A/jIy/KDUZL1WFZqEWbmpwJ3LKpWPmQCwK9gAmWViV84xzEychgpCZl42g7Wh0Zo7vEw2LZ7E1ft0v87Po/MUpco8KuoTK0MiTqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZA9tUwZvvYOSjf52beEKURtfeU61BErHUuD/gvpTLYE=;
 b=r4f/Wkafzuc4zU3yd5Je/P4puBiZaYQwBXVsk3AX+KVSAtSOQrd+rjM8P1j6oj3+cusT4H1X0FrhM/Q0Sc5PgLJRbCWwwEYSP2jl6Tonjrbp5v7AEX78/UfKJcTu568aLlbB3Z4bg05pzzfFkWWAL3DFjZvVvy0S2Sw2Vp1dOkY=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by DB5PR08MB10045.eurprd08.prod.outlook.com (2603:10a6:10:48c::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.30; Tue, 5 Sep
 2023 13:46:08 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::4b8a:7518:c642:5727]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::4b8a:7518:c642:5727%7]) with mapi id 15.20.6745.030; Tue, 5 Sep 2023
 13:46:08 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Mikko Rapeli <mikko.rapeli@linaro.org>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH v2 7/9] oeqa selftest context.py: fix git
 commands and set branch name
Thread-Topic: [OE-core] [PATCH v2 7/9] oeqa selftest context.py: fix git
 commands and set branch name
Thread-Index: AQHZ1Yi46SnRjVv/qUSC1Z4VYnWRg7AMU4aA
Date: Tue, 5 Sep 2023 13:46:08 +0000
Message-ID: <DE39E9E6-98FE-4446-AD3C-70CF73D1600A@arm.com>
References: <20230823061025.3952909-1-mikko.rapeli@linaro.org>
 <20230823061025.3952909-7-mikko.rapeli@linaro.org>
In-Reply-To: <20230823061025.3952909-7-mikko.rapeli@linaro.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3731.700.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|DB5PR08MB10045:EE_|AM7EUR03FT004:EE_|PAXPR08MB6336:EE_
X-MS-Office365-Filtering-Correlation-Id: e46547d8-337b-423d-d1c1-08dbae167a88
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 w4UmHp5f1a/6WQfMmroog5BUGMCrB802Xg9x+UxLHfpkAs55UP7hFe5QxMBFDdbJ/S1Rba8zH/PdfsvTlE5irAPJXOY5jyXhQcBhpzu/Js+SGelf59WCfOfffgywjaraSaYfnO9XKV51IxNhq8JzTFRJhyia+caMiYFpI8gSPDPquFVVHwfqGYVH1R2gKQMCORXTD6CZqbocxjfK4Oi31CZgmzFXiU8nIFcM0RhnSxdWk+uhOsUR12nFip7N12bjVcdqevr7okHzIhmoqqqKAq7H00/UEB/3znKKVlKTvmujzkAgTcCBAnfojLMQ3kLtcE8RU9VuU6A8cLuuQtKzbyTM1CVSbl1tgvKkFEpE4PGHVmysXTJDTKJTq8KsIMBHrHFmMR1RpJnOjsPK9D00OmNTkzysbpTru+Mv5Et4yFwkbP6XU2SiTXyM1ksJwgToMkxcsFhDebE2FMJ2O2qPWvtCGfhw+cbyHFTcLWjLki+NG5LdeS5Svn3Qh4QYllipylD3F1CPyibzheJww4Ql6qbbtmZoPbRvrBN+xQndRCj1rLFjvdw2vH+KHdEv4wxyAMskEhZ5Dw5/wPFtkd8wwN/DuJM0pOz0b0ofTLGgcTDYYmyio7eF2P1ageiE1oWkYAloP/LHkYabYjWbaxaETA==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(396003)(136003)(366004)(39850400004)(346002)(186009)(1800799009)(451199024)(41300700001)(71200400001)(122000001)(38100700002)(478600001)(86362001)(33656002)(38070700005)(2616005)(6506007)(6512007)(6486002)(53546011)(26005)(66446008)(76116006)(316002)(91956017)(36756003)(2906002)(66946007)(6916009)(64756008)(66476007)(66556008)(4744005)(8676002)(5660300002)(8936002)(4326008)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <C8CAC565DA873545A428CC1F5E616FD0@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB5PR08MB10045
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM7EUR03FT004.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	3891b151-9f7f-40fa-24b9-08dbae167524
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	SBfuytIJFx9vvMQudxiHHMtSAmxWGqVxvLy/GeX7Ka5gKs/uba4IYotTK+lztsBLXkNPXFRBS9pMAQ9eB1Qr1Agt3mmb0SnPd4QtUQs9KIcLfLfOZwaPJ67wS55Z5EUWHXfvhIYTr/QByW84Zcdik9PSO29jzpyicKQyXixMWZjKJcbmnMnBxfbl7BNVKibp/Ek08EEZrPhaVIT2vywyp/eXRMWDUJOOa4FNM4UiIAEkiSfdXHe5wapp2zaWLF/gWJPtcWJanr6D3CdvoNedUoSjxn3ECP/o67tWbcyaR38ZfIKpuAeM4oWVXvmvoCYe4lc4HykXuaQvEfsmBXniUhHFJmX81ChLxovFuR9UwdRqt4usziKnaLWBu2cwoPZRrpqSgqUay/quO/R2XRqQAm8b9nkp9B6p/WWgAj/sIbzk5CtWVdad88F+uV9EmS6ltlNYh+zfA6vhYXwWzKfQTnRj711iDBe39bduLJJgH3lZJAxHo11x5Q8xpCJMM4DFFC0B4WkwW5zsBNtpQ6K0eJ4XROF8VV2bkWUAmSGcXs/nTVMXm0GSCrfSQgXfEkcqxy7W9wTRLT/VCtmCm3Rc7P8GkCXBXQCh0JTW9qbHUSSYtRZ2347Q4OgXkQkabFbrR288/3kJx4wn0nQZcklhrV4byJ7END6Pdss6lOQKbhAlMKq6UpmkohJgbsqXWcE9B3I/3huIMM6aiB8+ujJwPJRCWFKPAaXZejVr7pELdls/8Jx2kTncy65rPChmda9b
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(396003)(376002)(136003)(39860400002)(346002)(82310400011)(451199024)(1800799009)(186009)(36840700001)(46966006)(40470700004)(8676002)(70586007)(70206006)(316002)(6486002)(4326008)(6862004)(2616005)(8936002)(40480700001)(82740400003)(356005)(81166007)(53546011)(6506007)(41300700001)(6512007)(336012)(26005)(5660300002)(478600001)(2906002)(40460700003)(36860700001)(4744005)(47076005)(86362001)(36756003)(33656002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Sep 2023 13:46:17.0888
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e46547d8-337b-423d-d1c1-08dbae167a88
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM7EUR03FT004.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6336
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 05 Sep 2023 13:46:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187215

T24gMjMgQXVnIDIwMjMsIGF0IDA3OjEwLCBNaWtrbyBSYXBlbGkgdmlhIGxpc3RzLm9wZW5lbWJl
ZGRlZC5vcmcgPG1pa2tvLnJhcGVsaT1saW5hcm8ub3JnQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+
IHdyb3RlOg0KPiAtICAgICAgICBzdWJwcm9jZXNzLmNoZWNrX291dHB1dCgiZ2l0IGluaXQ7IGdp
dCBhZGQgKjsgZ2l0IGNvbW1pdCAtYSAtbSAnaW5pdGlhbCciLCBjd2Q9bmV3c2VsZnRlc3RkaXIs
IHNoZWxsPVRydWUpDQo+ICsgICAgICAgIHN1YnByb2Nlc3MuY2hlY2tfb3V0cHV0KCJnaXQgaW5p
dCAtYiBtYWluICYmIGdpdCBhZGQgKiAmJiBnaXQgY29tbWl0IC1hIC1tICdpbml0aWFsJyIsIGN3
ZD1uZXdzZWxmdGVzdGRpciwgc2hlbGw9VHJ1ZSkNCg0KSSBiZWxpZXZlIHRoZSBsYXN0IHRpbWUg
SSB0cmllZCB0byBmaXggdGhpcyB3ZSBoYWQgYSBwcm9ibGVtIHdoZXJlIG9sZGVyIGRpc3Ryb3Mg
aGFkIGEgZ2l0IHdoaWNoIGRpZG7igJl0IGhhbmRsZSBpbml0IC1iICh3aGljaCB3YXMgYWRkZWQg
aW4gMi4yOCkuDQoNCknigJltIG5vdCBzdXJlIHdoZXRoZXIgdGhpcyBpc27igJl0IGEgcHJvYmxl
bSBhbnltb3Jl4oCmDQoNClJvc3M=

