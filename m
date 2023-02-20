Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40AF7C636CC
	for <webhook@archiver.kernel.org>; Mon, 20 Feb 2023 16:34:11 +0000 (UTC)
Received: from EUR02-AM0-obe.outbound.protection.outlook.com (EUR02-AM0-obe.outbound.protection.outlook.com [40.107.247.58])
 by mx.groups.io with SMTP id smtpd.web11.17951.1676910844710521753
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Feb 2023 08:34:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=42IddHFL;
 spf=pass (domain: arm.com, ip: 40.107.247.58, mailfrom: ross.burton@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DmuDD4W6P8QXOFywFFMCjbNSSGKfvcOzlK6Ur2MzXIQ=;
 b=42IddHFL58N5pmHZ1w7TMg1SJzCOG6FH7EhqkD+9TDiYWKYe7Sfi4YUcxhCs62I+WfZJqp6jQjzR3EApppHUG9FNK/VSWXtjawCun9GE5Lp0ZkJ+7zADuCZvJElK4NLr4S+c5tBqaJyY+NseWo6qJiPDAXCtFlXsm99L2zdHcCk=
Received: from AS9PR04CA0057.eurprd04.prod.outlook.com (2603:10a6:20b:46a::17)
 by AS8PR08MB6389.eurprd08.prod.outlook.com (2603:10a6:20b:33e::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6111.20; Mon, 20 Feb
 2023 16:34:01 +0000
Received: from AM7EUR03FT015.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:46a:cafe::74) by AS9PR04CA0057.outlook.office365.com
 (2603:10a6:20b:46a::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6111.20 via Frontend
 Transport; Mon, 20 Feb 2023 16:34:01 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT015.mail.protection.outlook.com (100.127.140.173) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6111.19 via Frontend Transport; Mon, 20 Feb 2023 16:34:01 +0000
Received: ("Tessian outbound b1d3ffe56e73:v132"); Mon, 20 Feb 2023 16:34:01 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 7efcd30548555049
X-CR-MTA-TID: 64aa7808
Received: from 9d5e4a3de765.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id F7F1998B-D91E-4397-AEC0-602F33116631.1;
	Mon, 20 Feb 2023 16:33:51 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 9d5e4a3de765.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Mon, 20 Feb 2023 16:33:51 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f9UqhcpggVrnEdaqtUevx0hziKZiIVHAYVWLfC3BmVSbjQNTfUAY5IhTj2ZsvJumi5iUm816MjZsJH6ZYGNatBtWbACZ/l+OvK7KlMuE0dDpqvEyBrQCDZit5Yuiyj/2BpddB+/3+jvpro54YIQwY9jWUE9KIZMrl95AbU7HWhfZgCnfErNj4MRe6zr+cmhdFXTmhSobQU0mVCk3nFlr4hdSef6qFN+Nttn6eVLBz6y9MjuR4VgsEBuXceOD18iI/ft4CRrb3mRZ/8L4ACXTmDCzJq23kUlSizXFxlwRo378dYWbfQAKRQJ9M42kMWVnILTLf0yaUfiipEW6DpyviQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DmuDD4W6P8QXOFywFFMCjbNSSGKfvcOzlK6Ur2MzXIQ=;
 b=M6gq9SZF5d7/Lr/jRbyXFJ2P4Hxw0Iwro61wPe4lc8uLids2FJ9hQW574BTFyTy9NRuv4BRtLXdkldj46PxBoOqot2FRvrOKCUv7neY2yxi5660wNlQsHvrN301Os+itMM8vdk2eJeKjRLFcl3HrkLapXdZe+7UY48Q50gMWZQyX84/AfpV6zJxg2VDyyTvvEEQiHGlhGBUofnSI+HM70BXaQailZKvXyiZU3gqcC9AfWit+oKZ8MMo8lOiowjEhrD3GMxLQm0usDpPGOv9ohTRR8sd7nKhvSI8QqAStQnveieDa3nGRN/kCQbIkit4Uek0t43R3IRlT/iT2XoV+0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DmuDD4W6P8QXOFywFFMCjbNSSGKfvcOzlK6Ur2MzXIQ=;
 b=42IddHFL58N5pmHZ1w7TMg1SJzCOG6FH7EhqkD+9TDiYWKYe7Sfi4YUcxhCs62I+WfZJqp6jQjzR3EApppHUG9FNK/VSWXtjawCun9GE5Lp0ZkJ+7zADuCZvJElK4NLr4S+c5tBqaJyY+NseWo6qJiPDAXCtFlXsm99L2zdHcCk=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by AM0PR08MB5345.eurprd08.prod.outlook.com (2603:10a6:208:18c::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6111.19; Mon, 20 Feb
 2023 16:33:48 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::e305:742e:e10b:1093]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::e305:742e:e10b:1093%2]) with mapi id 15.20.6111.019; Mon, 20 Feb 2023
 16:33:47 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Ross Burton <Ross.Burton@arm.com>
CC: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 3/3] glibc: backport the fix for CVE-2023-25139
Thread-Topic: [OE-core] [PATCH 3/3] glibc: backport the fix for CVE-2023-25139
Thread-Index: AQHZRUhpfY/Z6EXXWkiPnibbrUvJUK7YB5aA
Date: Mon, 20 Feb 2023 16:33:47 +0000
Message-ID: <ACFEBC4F-0692-43CA-A44E-2A4102500C3D@arm.com>
References: <20230220162817.180458-1-ross.burton@arm.com>
 <20230220162817.180458-3-ross.burton@arm.com>
In-Reply-To: <20230220162817.180458-3-ross.burton@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3731.400.51.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|AM0PR08MB5345:EE_|AM7EUR03FT015:EE_|AS8PR08MB6389:EE_
X-MS-Office365-Filtering-Correlation-Id: c905709e-0c6e-4f35-9095-08db136045ea
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 VPSHb+ouN1tLOuUgXUDV85aN2cylBVolXr6N2h4sbEHLeSREolYe7nZZYUYELFQyG3VAzr7vVxKlqog8m7YwcEYl2miCQ2ha7k090IO57Q5tFqaLtKcRsStduwT1cwIy+px26+7n9RjGp5ixHW//mjjF0C4IcdSMEAcfMg1/4jVIkQdPueT2DW51v4t+Exe4CtCuGxQeS+oQDNTBH8UHDdS1MaIkSePuT6vHDE7l8CJyEv+rPmI/d8TGkt3s+uYrEm1sC8Tdacrh4DsE03IKVXUemNyWDe293jIKYA8mMv7ziNvC3WxO8+/Kj90WruwCXjocDHI2mw6ng9OS80BO2WmjRxPFGoNlUTkyhn//3wOQhu5fUWct7O7mv0Nh44XYUB8vFeOYJMo+WbQuh0U6Z0VsBKVOFLoVu8THpWP+dRfury2QeF/eQp5s0OtCgs9BvwE1bwG6NJIhzZujVl+LyzwaxQJl8ZRudAJ7UQZxfLqG3uyZ8uicCp/fEqlF/kpa3ADObB2ei2d+/Nrb7PgKakW7Mw02JRGrSSFo6MkX44zFvUeGFWOsc//hkvCYXiT5ERpffFL5+7vSvTkBpL0uZzivc1867UDuTPw0+pBtMIrhFVBc6rAgOpeAJixfWp9c5wNMsdnnHNjEARagJFFsCjRkLgnno4KwIQFylvFkSY4LoYuNRll79N/AZOzfp0OFmTBVKBN04K4WmQCGGF6y5vs69obbAubPqQEMlP5XoiQ=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(396003)(346002)(39860400002)(366004)(136003)(376002)(451199018)(6486002)(966005)(4326008)(478600001)(122000001)(2616005)(6862004)(38100700002)(83380400001)(6200100001)(26005)(186003)(91956017)(2906002)(66946007)(6506007)(6512007)(66446008)(66556008)(64756008)(53546011)(8676002)(71200400001)(76116006)(37006003)(66476007)(316002)(38070700005)(5660300002)(8936002)(33656002)(36756003)(86362001)(66899018)(41300700001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <5D8E1FB32A2E244282AB818A08ECF544@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB5345
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM7EUR03FT015.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	59c29874-e263-40fc-e9ab-08db13603de8
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	5JSXFKAlpAfd3whKLzvVKbON0LmJzZZfuzyiZIyvvY84pLGOmzDueNlGSBjJ4dGuDEd/MyTEyxGPMtF5JHfkrCOgUkj0a2Lsue0Qhp85FsowBTMoCPZend1mS7bKc5zT7qSFP1KRNpqY/NycVTgrgJ173XkeMGLOCgsca8B+R1UIViOGbIWR53PJoI101sfYrmdohsGzLBGgxk0lkj1qnjznYh6QfdYMcNL954BYxLEnBSv5GKl2KAI9oui3FACFi/oe9Fjfmk+hRJ2h5hTwKtfMHqCD+A4gc+Ts44UIzT4xNDvlJGtxo6CxYUOV+cawwBMkPemqHRbAjDBx6uMGE+0ZttzOCOAPGispRCxxfI8EBz2e39W7xW7bM3SqdzLgE2ESwakaoxoEBkw9kJliYQ/n/hb3jA7fs0D/UOC68AS9lo1bgMOs15TXLI/6xvrv3j/AIdw1hM2uDwd8LfW12GErC7fyLACJgWVUf68NZyrINHvyUrm7eQHALmG0Jo/FWxpm1Jz/M9Dp8ZBRFL299chpg97ITp/0Ofebv+C5UIpAAj1lY6A8ZNQ9c3NqiC0BZJ4SW7If/NmHkT9LU8Q3GKCjqqh8EP9a6iZ+6RPmLAVKpdRkIhC23pu6kdBZAk/IumLdLq7oB/pCULuW3acKdC2e+Iz8CN50mzOz/ghYNPJ3WlmW8PZ9FhD2JhJplMt0
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230025)(4636009)(376002)(39860400002)(396003)(346002)(136003)(451199018)(36840700001)(40470700004)(46966006)(40460700003)(316002)(70586007)(37006003)(83380400001)(2616005)(4326008)(6862004)(8936002)(70206006)(8676002)(6506007)(41300700001)(186003)(53546011)(47076005)(6512007)(26005)(36756003)(478600001)(966005)(336012)(6486002)(40480700001)(33656002)(2906002)(86362001)(82310400005)(356005)(82740400003)(5660300002)(36860700001)(81166007)(6200100001)(66899018);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Feb 2023 16:34:01.2908
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c905709e-0c6e-4f35-9095-08db136045ea
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM7EUR03FT015.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6389
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Feb 2023 16:34:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177441

SWdub3JlIHRoaXMsICJnbGliYzogc3RhYmxlIDIuMzcgYnJhbmNoIHVwZGF0ZXPigJ0gaW5jb3Jw
b3JhdGVzIGl0Lg0KDQpSb3NzDQoNCj4gT24gMjAgRmViIDIwMjMsIGF0IDE2OjI4LCBSb3NzIEJ1
cnRvbiB2aWEgbGlzdHMub3BlbmVtYmVkZGVkLm9yZyA8cm9zcy5idXJ0b249YXJtLmNvbUBsaXN0
cy5vcGVuZW1iZWRkZWQub3JnPiB3cm90ZToNCj4gDQo+IFNpZ25lZC1vZmYtYnk6IFJvc3MgQnVy
dG9uIDxyb3NzLmJ1cnRvbkBhcm0uY29tPg0KPiAtLS0NCj4gLi4uci1ncm91cGluZy1pbi1wcmlu
dGYtd2lkdGgtYnVnLTMwMDY4LnBhdGNoIHwgODQgKysrKysrKysrKysrKysrKysrKw0KPiBtZXRh
L3JlY2lwZXMtY29yZS9nbGliYy9nbGliY18yLjM3LmJiICAgICAgICAgfCAgMSArDQo+IDIgZmls
ZXMgY2hhbmdlZCwgODUgaW5zZXJ0aW9ucygrKQ0KPiBjcmVhdGUgbW9kZSAxMDA2NDQgbWV0YS9y
ZWNpcGVzLWNvcmUvZ2xpYmMvZ2xpYmMvMDAwMS1BY2NvdW50LWZvci1ncm91cGluZy1pbi1wcmlu
dGYtd2lkdGgtYnVnLTMwMDY4LnBhdGNoDQo+IA0KPiBkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVz
LWNvcmUvZ2xpYmMvZ2xpYmMvMDAwMS1BY2NvdW50LWZvci1ncm91cGluZy1pbi1wcmludGYtd2lk
dGgtYnVnLTMwMDY4LnBhdGNoIGIvbWV0YS9yZWNpcGVzLWNvcmUvZ2xpYmMvZ2xpYmMvMDAwMS1B
Y2NvdW50LWZvci1ncm91cGluZy1pbi1wcmludGYtd2lkdGgtYnVnLTMwMDY4LnBhdGNoDQo+IG5l
dyBmaWxlIG1vZGUgMTAwNjQ0DQo+IGluZGV4IDAwMDAwMDAwMDAwLi45ZWZkMzlhOWViNA0KPiAt
LS0gL2Rldi9udWxsDQo+ICsrKyBiL21ldGEvcmVjaXBlcy1jb3JlL2dsaWJjL2dsaWJjLzAwMDEt
QWNjb3VudC1mb3ItZ3JvdXBpbmctaW4tcHJpbnRmLXdpZHRoLWJ1Zy0zMDA2OC5wYXRjaA0KPiBA
QCAtMCwwICsxLDg0IEBADQo+ICtDVkU6IENWRS0yMDIzLTI1MTM5DQo+ICtVcHN0cmVhbS1TdGF0
dXM6IEJhY2twb3J0DQo+ICtTaWduZWQtb2ZmLWJ5OiBSb3NzIEJ1cnRvbiA8cm9zcy5idXJ0b25A
YXJtLmNvbT4NCj4gKw0KPiArRnJvbSAwN2I5NTIxZmM2MzY5ZDAwMDIxNmI5NjU2MmZmN2MwZWQz
MmExNmM0IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQ0KPiArRnJvbTogQ2FybG9zIE8nRG9uZWxs
IDxjYXJsb3NAcmVkaGF0LmNvbT4NCj4gK0RhdGU6IFRodSwgMTkgSmFuIDIwMjMgMTI6NTA6MjAg
KzAxMDANCj4gK1N1YmplY3Q6IFtQQVRDSF0gQWNjb3VudCBmb3IgZ3JvdXBpbmcgaW4gcHJpbnRm
IHdpZHRoIChidWcgMzAwNjgpDQo+ICsNCj4gK1RoaXMgaXMgYSBwYXJ0aWFsIGZpeCBmb3IgbWlz
aGFuZGxpbmcgb2YgZ3JvdXBpbmcgd2hlbiBmb3JtYXR0aW5nDQo+ICtpbnRlZ2Vycy4gIEl0IHBy
b3Blcmx5IGNvbXB1dGVzIHRoZSB3aWR0aCBpbiB0aGUgcHJlc2VuY2Ugb2YgZ3JvdXBpbmcNCj4g
K2NoYXJhY3RlcnMgd2hlbiB0aGUgd2lkdGggaXMgbGFyZ2VyIHRoYW4gdGhlIG51bWJlciBvZiBz
aWduaWZpY2FudA0KPiArZGlnaXRzLiBUaGUgcHJlY2lzaW9uIHJlbGF0ZWQgaXNzdWUgaXMgZG9j
dW1lbnRlZCBpbiBidWcgMjM0MzIuDQo+ICsNCj4gK0NvLWF1dGhvcmVkLWJ5OiBBbmRyZWFzIFNj
aHdhYiA8c2Nod2FiQHN1c2UuZGU+DQo+ICsoY2hlcnJ5IHBpY2tlZCBmcm9tIGNvbW1pdCBjOTgw
NTQ5Y2M2YTFjMDNjMjNjYzJmZTNlN2IwZmU2MjZhMDM2NGIwKQ0KPiArLS0tDQo+ICsgc3RkaW8t
Y29tbW9uL01ha2VmaWxlICAgICAgICAgICAgICAgfCAgMiArKw0KPiArIHN0ZGlvLWNvbW1vbi90
c3QtZ3JvdXBpbmczLmMgICAgICAgIHwgNTQgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysN
Cj4gKyBzdGRpby1jb21tb24vdmZwcmludGYtcHJvY2Vzcy1hcmcuYyB8IDIyICsrKysrKysrKy0t
LQ0KPiArIDMgZmlsZXMgY2hhbmdlZCwgNzMgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkN
Cj4gKyBjcmVhdGUgbW9kZSAxMDA2NDQgc3RkaW8tY29tbW9uL3RzdC1ncm91cGluZzMuYw0KPiAr
DQo+ICtkaWZmIC0tZ2l0IGEvc3RkaW8tY29tbW9uL3ZmcHJpbnRmLXByb2Nlc3MtYXJnLmMgYi9z
dGRpby1jb21tb24vdmZwcmludGYtcHJvY2Vzcy1hcmcuYw0KPiAraW5kZXggMjRjOTEyNWY5Zi4u
OGMwZmNiY2Y3OCAxMDA2NDQNCj4gKy0tLSBhL3N0ZGlvLWNvbW1vbi92ZnByaW50Zi1wcm9jZXNz
LWFyZy5jDQo+ICsrKysgYi9zdGRpby1jb21tb24vdmZwcmludGYtcHJvY2Vzcy1hcmcuYw0KPiAr
QEAgLTE4NiwxMSArMTg2LDE3IEBAIExBQkVMICh1bnNpZ25lZF9udW1iZXIpOiAgICAgIC8qIFVu
c2lnbmVkIG51bWJlciBvZiBiYXNlIEJBU0UuICAqLw0KPiArICAgYm9vbCBvY3RhbF9tYXJrZXIg
PSAocHJlYyA8PSBudW1iZXJfbGVuZ3RoICYmIG51bWJlci53b3JkICE9IDANCj4gKyAgICAgICAg
ICAgICAgICAgICAgICAgICYmIGFsdCAmJiBiYXNlID09IDgpOw0KPiArIA0KPiArLSAgcHJlYyA9
IE1BWCAoMCwgcHJlYyAtICh3b3JrZW5kIC0gc3RyaW5nKSk7DQo+ICsrICAvKiBBdCB0aGlzIHBv
aW50IHByZWNfaW5jIGlzIHRoZSBhZGRpdGlvbmFsIGJ5dGVzIHJlcXVpcmVkIGZvciB0aGUNCj4g
KysgICAgIHNwZWNpZmljZWQgcHJlY2lzaW9uLiAgSXQgaXMgMCBpZiB0aGUgcHJlY2lzaW9uIHdv
dWxkIG5vdCBoYXZlDQo+ICsrICAgICByZXF1aXJlZCBhZGRpdGlvbmFsIGJ5dGVzIGkuZS4gdGhl
IG51bWJlciBvZiBpbnB1dCBkaWdpdHMgaXMgbW9yZQ0KPiArKyAgICAgdGhhbiB0aGUgcHJlY2lz
aW9uLiAgSXQgaXMgZ3JlYXRlciB0aGFuIHplcm8gaWYgdGhlIHByZWNpc2lvbiBpcw0KPiArKyAg
ICAgbW9yZSB0aGFuIHRoZSBudW1iZXIgb2YgZGlnaXRzIHdpdGhvdXQgZ3JvdXBpbmcgKHByZWNp
c2lvbiBvbmx5DQo+ICsrICAgICBjb25zaWRlcnMgZGlnaXRzKS4gICovDQo+ICsrICB1bnNpZ25l
ZCBpbnQgcHJlY19pbmMgPSBNQVggKDAsIHByZWMgLSAod29ya2VuZCAtIHN0cmluZykpOw0KPiAr
IA0KPiArICAgaWYgKCFsZWZ0KQ0KPiArICAgICB7DQo+ICstICAgICAgd2lkdGggLT0gbnVtYmVy
X2xlbmd0aCArIHByZWM7DQo+ICsrICAgICAgd2lkdGggLT0gbnVtYmVyX2xlbmd0aCArIHByZWNf
aW5jOw0KPiArIA0KPiArICAgICAgIGlmIChudW1iZXIud29yZCAhPSAwICYmIGFsdCAmJiAoYmFz
ZSA9PSAxNiB8fCBiYXNlID09IDIpKQ0KPiArICAgICAgICAgLyogQWNjb3VudCBmb3IgMFgsIDB4
LCAwQiBvciAwYiBoZXggb3IgYmluYXJ5IG1hcmtlci4gICovDQo+ICtAQCAtMjIxLDcgKzIyNyw3
IEBAIExBQkVMICh1bnNpZ25lZF9udW1iZXIpOiAgICAgIC8qIFVuc2lnbmVkIG51bWJlciBvZiBi
YXNlIEJBU0UuICAqLw0KPiArICAgICAgICAgICBYcHJpbnRmX2J1ZmZlcl9wdXRjIChidWYsIHNw
ZWMpOw0KPiArICAgICAgICAgfQ0KPiArIA0KPiArLSAgICAgIHdpZHRoICs9IHByZWM7DQo+ICsr
ICAgICAgd2lkdGggKz0gcHJlY19pbmM7DQo+ICsgICAgICAgWHByaW50Zl9idWZmZXJfcGFkIChi
dWYsIExfKCcwJyksIHdpZHRoKTsNCj4gKyANCj4gKyAgICAgICBpZiAob2N0YWxfbWFya2VyKQ0K
PiArQEAgLTIzNyw2ICsyNDMsOCBAQCBMQUJFTCAodW5zaWduZWRfbnVtYmVyKTogICAgICAvKiBV
bnNpZ25lZCBudW1iZXIgb2YgYmFzZSBCQVNFLiAgKi8NCj4gKyAgICAgfQ0KPiArICAgZWxzZQ0K
PiArICAgICB7DQo+ICsrICAgICAgLyogUGVyZm9ybSBsZWZ0IGp1c3RpZmljYXRpb24gYWRqdXN0
bWVudHMuICAqLw0KPiArKw0KPiArICAgICAgIGlmIChpc19uZWdhdGl2ZSkNCj4gKyAgICAgICAg
IHsNCj4gKyAgICAgICAgICAgWHByaW50Zl9idWZmZXJfcHV0YyAoYnVmLCBMXygnLScpKTsNCj4g
K0BAIC0yNjMsOSArMjcxLDEzIEBAIExBQkVMICh1bnNpZ25lZF9udW1iZXIpOiAgICAgIC8qIFVu
c2lnbmVkIG51bWJlciBvZiBiYXNlIEJBU0UuICAqLw0KPiArICAgICAgIGlmIChvY3RhbF9tYXJr
ZXIpDQo+ICsgLS13aWR0aDsNCj4gKyANCj4gKy0gICAgICB3aWR0aCAtPSB3b3JrZW5kIC0gc3Ry
aW5nICsgcHJlYzsNCj4gKysgICAgICAvKiBBZGp1c3QgdGhlIHdpZHRoIGJ5IHN1YnRyYWN0aW5n
IHRoZSBudW1iZXIgb2YgYnl0ZXMNCj4gKysgICAgICAgICByZXF1aXJlZCB0byByZXByZXNlbnQg
dGhlIG51bWJlciB3aXRoIGdyb3VwaW5nIGNoYXJhY3RlcnMNCj4gKysgKE5VTUJFUl9MRU5HVEgp
IGFuZCBhbnkgYWRkaXRpb25hbCBieXRlcyByZXF1aXJlZCBmb3INCj4gKysgcHJlY2lzaW9uLiAg
Ki8NCj4gKysgICAgICB3aWR0aCAtPSBudW1iZXJfbGVuZ3RoICsgcHJlY19pbmM7DQo+ICsgDQo+
ICstICAgICAgWHByaW50Zl9idWZmZXJfcGFkIChidWYsIExfKCcwJyksIHByZWMpOw0KPiArKyAg
ICAgIFhwcmludGZfYnVmZmVyX3BhZCAoYnVmLCBMXygnMCcpLCBwcmVjX2luYyk7DQo+ICsgDQo+
ICsgICAgICAgaWYgKG9jdGFsX21hcmtlcikNCj4gKyAgICAgICAgIFhwcmludGZfYnVmZmVyX3B1
dGMgKGJ1ZiwgTF8oJzAnKSk7DQo+ICstLSANCj4gKzIuMzQuMQ0KPiArDQo+IGRpZmYgLS1naXQg
YS9tZXRhL3JlY2lwZXMtY29yZS9nbGliYy9nbGliY18yLjM3LmJiIGIvbWV0YS9yZWNpcGVzLWNv
cmUvZ2xpYmMvZ2xpYmNfMi4zNy5iYg0KPiBpbmRleCBmMjk5YTMwMDRhNC4uZTU2ODllNTM2YWQg
MTAwNjQ0DQo+IC0tLSBhL21ldGEvcmVjaXBlcy1jb3JlL2dsaWJjL2dsaWJjXzIuMzcuYmINCj4g
KysrIGIvbWV0YS9yZWNpcGVzLWNvcmUvZ2xpYmMvZ2xpYmNfMi4zNy5iYg0KPiBAQCAtNTEsNiAr
NTEsNyBAQCBTUkNfVVJJID0gICIke0dMSUJDX0dJVF9VUkl9O2JyYW5jaD0ke1NSQ0JSQU5DSH07
bmFtZT1nbGliYyBcDQo+ICAgICAgICAgICAgZmlsZTovLzAwMjAtdHpzZWxlY3Qua3NoLVVzZS1i
aW4tc2gtZGVmYXVsdC1zaGVsbC1pbnRlcnByZXRlci5wYXRjaCBcDQo+ICAgICAgICAgICAgZmls
ZTovLzAwMjEtZml4LWNyZWF0ZS10aHJlYWQtZmFpbGVkLWluLXVucHJpdmlsZWdlZC1wcm9jZXNz
LUJaLS5wYXRjaCBcDQo+ICAgICAgICAgICAgZmlsZTovLzAwMjItQXZvaWQtaGFyZGNvZGVkLWJ1
aWxkLXRpbWUtcGF0aHMtaW4tdGhlLW91dHB1dC1iaW5hci5wYXRjaCBcDQo+ICsgICAgICAgICAg
IGZpbGU6Ly8wMDAxLUFjY291bnQtZm9yLWdyb3VwaW5nLWluLXByaW50Zi13aWR0aC1idWctMzAw
NjgucGF0Y2ggXA0KPiAiDQo+IFMgPSAiJHtXT1JLRElSfS9naXQiDQo+IEIgPSAiJHtXT1JLRElS
fS9idWlsZC0ke1RBUkdFVF9TWVN9Ig0KPiAtLSANCj4gMi4zNC4xDQo+IA0KPiANCj4gLT0tPS09
LT0tPS09LT0tPS09LT0tPS0NCj4gTGlua3M6IFlvdSByZWNlaXZlIGFsbCBtZXNzYWdlcyBzZW50
IHRvIHRoaXMgZ3JvdXAuDQo+IFZpZXcvUmVwbHkgT25saW5lICgjMTc3NDQwKTogaHR0cHM6Ly9s
aXN0cy5vcGVuZW1iZWRkZWQub3JnL2cvb3BlbmVtYmVkZGVkLWNvcmUvbWVzc2FnZS8xNzc0NDAN
Cj4gTXV0ZSBUaGlzIFRvcGljOiBodHRwczovL2xpc3RzLm9wZW5lbWJlZGRlZC5vcmcvbXQvOTcw
ODkzNzcvNjg3NTg4OA0KPiBHcm91cCBPd25lcjogb3BlbmVtYmVkZGVkLWNvcmUrb3duZXJAbGlz
dHMub3BlbmVtYmVkZGVkLm9yZw0KPiBVbnN1YnNjcmliZTogaHR0cHM6Ly9saXN0cy5vcGVuZW1i
ZWRkZWQub3JnL2cvb3BlbmVtYmVkZGVkLWNvcmUvdW5zdWIgW3Jvc3MuYnVydG9uQGFybS5jb21d
DQo+IC09LT0tPS09LT0tPS09LT0tPS09LT0tDQo+IA0KDQo=

