Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1137EB64DA
	for <webhook@archiver.kernel.org>; Wed,  5 Jul 2023 17:27:04 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.72])
 by mx.groups.io with SMTP id smtpd.web11.1070.1688578023639559522
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Jul 2023 10:27:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=Q4znivE7;
 spf=pass (domain: arm.com, ip: 40.107.21.72, mailfrom: ross.burton@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0kc/Fuq2r7esxvwR4MGs1jVBbPZoX3t1bh/rCTPxfX0=;
 b=Q4znivE7d8tH9o51QoRCAD1cnGGwBFFTFha1qzenyN+8GX/Cu92zquXYJ+rJcbwm0QAzS7GLpEWhPB1zYwnOV76rplrhp59mZy13t53OtvC07+JROcql4FCu++O3rstQPj8DsJT4APxgCxtHNCZSUa4kZIVS/eeRGAa4Q/5PF3k=
Received: from DB8PR03CA0022.eurprd03.prod.outlook.com (2603:10a6:10:be::35)
 by PR3PR08MB5786.eurprd08.prod.outlook.com (2603:10a6:102:85::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.17; Wed, 5 Jul
 2023 17:27:00 +0000
Received: from DBAEUR03FT024.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:be:cafe::60) by DB8PR03CA0022.outlook.office365.com
 (2603:10a6:10:be::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.21 via Frontend
 Transport; Wed, 5 Jul 2023 17:26:59 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT024.mail.protection.outlook.com (100.127.142.163) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6565.23 via Frontend Transport; Wed, 5 Jul 2023 17:26:59 +0000
Received: ("Tessian outbound d6c4ee3ba1eb:v142"); Wed, 05 Jul 2023 17:26:59 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 8ffef91d1ea676a9
X-CR-MTA-TID: 64aa7808
Received: from 130af63e3647.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 65197572-987E-47AE-8E50-C24BAA1854BC.1;
	Wed, 05 Jul 2023 17:26:53 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 130af63e3647.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Wed, 05 Jul 2023 17:26:53 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gWEhaQKHHjud//SV/uG83vKMMixkkeuH90ZJEUYa0IlzmC++TyL+ei4irFxAm4Ag8B5yYrV4U2n+ddHiZPl/mj2qE1vsUvXVCuB+cqWLtEx88y6Juxg/ixQsJhASAfonIfbLQo0C8ylymxbD7J7S/keo2Yhxss+etAmuyAb4o3mROA2ntwdlpWVPmxJ4GKBuArmUzhBGGunyBa/nKXZtvyPJGZd+GH3oTXnZUW6TYwewPUGreoFVXfyj7TvSHa9oXYoMSsWo/QbUTe6qatQG6gwZOkH6t3DjGLoGOCZF1Py84ERALUIbciMoP4EIUlZVvAql4byMv8L9BkbvqkudYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0kc/Fuq2r7esxvwR4MGs1jVBbPZoX3t1bh/rCTPxfX0=;
 b=KFwWAXDjOQO7t6xQ8SGUVXfbev+Fx/TmPoSvy9TOGwLCDDp6yV2GCVP0Gk5mq2xgYNu9WLWBq+rKCPSX/lMXwp7J/K1haTJq93Qv58pBFwRw0H5kCUgj6zg2c+0L/jARYXjiiPxAsVNWStjJ3z7xyAv5fRGwuibLlmiXLP7MBlJta+WLMFD+Difwfmb2bFP22rk447Jad2jNDnQk7+Cyp3VAA3msovBWagcPKHAISTeSWvgLD/Qxx6P/sccfQmMPBkHbnxFT86ojF8e6T3ilHoQD4j0ykt4k+RW5eebG2fXmZMWpCvHS+roWVndw/W9wpHC2FmsKNHmyGSgO809w8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0kc/Fuq2r7esxvwR4MGs1jVBbPZoX3t1bh/rCTPxfX0=;
 b=Q4znivE7d8tH9o51QoRCAD1cnGGwBFFTFha1qzenyN+8GX/Cu92zquXYJ+rJcbwm0QAzS7GLpEWhPB1zYwnOV76rplrhp59mZy13t53OtvC07+JROcql4FCu++O3rstQPj8DsJT4APxgCxtHNCZSUa4kZIVS/eeRGAa4Q/5PF3k=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by PAXPR08MB6461.eurprd08.prod.outlook.com (2603:10a6:102:153::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.17; Wed, 5 Jul
 2023 17:26:51 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::30b4:3110:b02d:7f21]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::30b4:3110:b02d:7f21%7]) with mapi id 15.20.6544.024; Wed, 5 Jul 2023
 17:26:51 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Khem Raj <raj.khem@gmail.com>
CC: OE-core <openembedded-core@lists.openembedded.org>, nd <nd@arm.com>
Subject: Re: [OE-core] [PATCH] libjpeg-turbo: upgrade to 3.0.0
Thread-Topic: [OE-core] [PATCH] libjpeg-turbo: upgrade to 3.0.0
Thread-Index: AQHZrmGOJ2GjpLnAi0u06cfXFyFSAK+rQrMAgAAIsYCAABckAIAADGwA
Date: Wed, 5 Jul 2023 17:26:50 +0000
Message-ID: <B5ADDB5A-5457-4C0A-ABB1-C98FF4042C2D@arm.com>
References: <20230704102307.3654880-1-ross.burton@arm.com>
 <CAMKF1srqdCHyyOcpZzzhvB+=mAE+38E4hYKhwG-a+6LSf7bpTQ@mail.gmail.com>
 <427A6236-E060-4E2D-8642-FF5E78FD6095@arm.com>
 <CAMKF1srLYqsDqmkKbP2MNtTXV5+73Jt5y-5YOcWZsjanFgqW6Q@mail.gmail.com>
In-Reply-To: 
 <CAMKF1srLYqsDqmkKbP2MNtTXV5+73Jt5y-5YOcWZsjanFgqW6Q@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3731.600.7)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|PAXPR08MB6461:EE_|DBAEUR03FT024:EE_|PR3PR08MB5786:EE_
X-MS-Office365-Filtering-Correlation-Id: 0741d185-71b7-4a51-eb26-08db7d7d0a21
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 AilQ40I7Xyg+FRRYPv/iWCp4hAYU5nOmwJ716GvAjnb34YjkpyPTbzoWbjhgP6qmw4bhONO6JbVEUEijCmmjlfkgJCBM4wmz07+X4GbM+1QLlLU3h37hlnj/pSwGS0ctGujimsdd6BDlaEIsiL5bEx3TEwY77OQRdtq285UF+j04MCEaoGxfKlfisZRIsjaJtB5W0DygvD8xI5EQzJdE54hI5u5Ub/nkXtO/VMVki5c2fVzcA0X6fHzzucdIi/NVOyzQCX0PB+NT8Pbo2s0E6+vJtD24s8ObEiLo8qg4grBbu0U/KI6Tu7R7sHz9f0hQU392PowjN1kN0rCCsPlxtyA3288Mje7sBm9cYBMWVsy/qzq1njZE4BvZMiQCOJC/Q6S1OG1stHNQqNY3bTi4P43loAM14cwdsZ91m8103RthUf1oHvx+bSEusm20My959mGXmjN5eRTjd78lLGLmYUbxQG9vMI4DL6N3uYa0x58E2lwp+q3sicJDbSM0Gh52yAYjnEJyNau0xD20dM3PcDMUFc1i/vHA6Fpcf9ZAen0tAAIMLa/zETBjdZdWa1h8rzxjL2FAlgGz+x/7WF7x4RICRcj6ImleVQzk0nf/MBYifWMACsJjNQKSkRTZk9Ch
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(39860400002)(396003)(346002)(376002)(366004)(451199021)(41300700001)(4744005)(6486002)(71200400001)(38100700002)(122000001)(2616005)(6506007)(186003)(53546011)(26005)(6512007)(966005)(38070700005)(86362001)(54906003)(478600001)(2906002)(316002)(36756003)(91956017)(6916009)(4326008)(64756008)(76116006)(66446008)(66946007)(66556008)(33656002)(66476007)(5660300002)(8676002)(8936002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <98506A09749D9147B4088C33E8FE2F66@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6461
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DBAEUR03FT024.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	47ba5703-c3e7-4886-3ea7-08db7d7d04ea
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	z8XF9WyevxiRfP0rTwxgn2Vnw+mpBCgxbNJcGtaIeR1SbAA6/hfbcNV3vG6yEu1XqXXbn+SX0Y7M7QXmOCrljz0XhvWEE4hv8Lzlj7OERFYxWR7nP7FdF5bUdttmIzAB2UR3sFsUZY7rj0lUn2MITbvon2VhPMc20CJaIWSZgUPUpWVuGsSVS126nI6bGBvUkqoSpjk3U7RwZW2C6c7xuZ8LzNAQybudRbQpiB+L7EQ61D0CVcVUCjVnN1U5+CmWJINfaeR+CGADze0pwB6rngQgxoDTLn+cKDXfJApbTWOORQPTgGzucVObwNnqss8vOEOSGJZltA3yI5YCSJ05Km8UE0RhQY98cS2dSDB9u1gMnfK/uBIBAmesaCgHUq6oimC7eZf7oMqXD86aA+JWlspbYIC6+0n9dEvChMKtblyUwl3Ab1bdkAhkpl2QQQM3QsKqZvMXr/pbHzVNewm41fgBiSW1udhuOmhwAdidu1eJs75vyko3sZI6ugHYl7Xwrv64IiLDtIcjA4pzJX+I5frGdwgR/d5fstRwwYJ4oy/gI+WZVI9i/I/vU0OZI9C0+/VKKZ2Oqde40g6Kx/znONA5NqW2uUd0KUDaZVDW4FQQwPApNjDnQZ5IbCH1A9hbJ5t7F0EiuFNeAkOF0bLr4gXgK3632LYKjsmjXHA9rEcWKmT79b1/RfKJHUNffQ2tSMK1IdLqevt7HCHH+W9aW794B8jA9caEGwrqMXjEg34=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(136003)(346002)(376002)(396003)(39860400002)(451199021)(46966006)(40470700004)(36840700001)(8676002)(2906002)(2616005)(70586007)(70206006)(40480700001)(6862004)(8936002)(5660300002)(6506007)(53546011)(26005)(186003)(336012)(4744005)(41300700001)(40460700003)(82740400003)(356005)(81166007)(6486002)(4326008)(33656002)(316002)(47076005)(36756003)(36860700001)(54906003)(478600001)(6512007)(966005)(82310400005)(86362001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jul 2023 17:26:59.7436
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0741d185-71b7-4a51-eb26-08db7d7d0a21
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DBAEUR03FT024.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR08MB5786
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Jul 2023 17:27:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183899

T24gNSBKdWwgMjAyMywgYXQgMTc6NDIsIEtoZW0gUmFqIDxyYWoua2hlbUBnbWFpbC5jb20+IHdy
b3RlOg0KPiBMb29rcyBsaWtlIHlvdSB3YW50IHRvIGJhY2twb3J0IGh0dHBzOi8vZ2l0bGFiLmZy
ZWVkZXNrdG9wLm9yZy9wb3BwbGVyL3BvcHBsZXIvLS9jb21taXQvMjk4NmYwNmM3Y2M5ZDY0YTUw
NmViZTg2MWI4YmYzOGY3MzM4NmU4NiB0byBwb3BwbGVyLg0KPiANCj4gUmlnaHQgdGhhdCBzZWVt
cyB0byBiZSB0aGUgZml4LiBTbyBzaG91bGQgSSBiZSBleHBlY3RpbmcgYSBwYXRjaCA6KSANCg0K
SSBzdXNwZWN0IHlvdeKAmXJlIGFjdHVhbGx5IGFsc28gdGVzdGluZyBhIG5ldyBjbGFuZyBhbmQg
dGhhdCBpcyB0byBibGFtZSwgYnV0IHBhdGNoIG9uIHRoZSBsaXN0IDopDQoNClJvc3M=

