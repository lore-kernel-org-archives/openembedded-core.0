Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44442C74A5B
	for <webhook@archiver.kernel.org>; Tue, 14 Mar 2023 14:39:42 +0000 (UTC)
Received: from EUR01-VE1-obe.outbound.protection.outlook.com (EUR01-VE1-obe.outbound.protection.outlook.com [40.107.14.58])
 by mx.groups.io with SMTP id smtpd.web10.10615.1678804778593201835
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Mar 2023 07:39:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=dpnEFzAY;
 spf=pass (domain: arm.com, ip: 40.107.14.58, mailfrom: ross.burton@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KYvxY8FOzpt29eWeWkXm/YW3YN/0O4uTExEyMPvsREE=;
 b=dpnEFzAY3rRPVLbMKdvkyiZ4pXiomGG/ntxsHPAz5LdoasUm5xo5SUAKXJ0Q67z1au/HUL6xd0WYaARWkmkKExNZGfQemzoUtkaERptfCrWfIMuA7jBqW0b4XXYUoS0oxE3mcsNNkixOArqVgmqFfbry/vUhW3+TN4hJIdTgq/g=
Received: from FR3P281CA0030.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:1c::16)
 by PAXPR08MB6448.eurprd08.prod.outlook.com (2603:10a6:102:152::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.26; Tue, 14 Mar
 2023 14:39:34 +0000
Received: from VI1EUR03FT065.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:d10:1c:cafe::79) by FR3P281CA0030.outlook.office365.com
 (2603:10a6:d10:1c::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.26 via Frontend
 Transport; Tue, 14 Mar 2023 14:39:34 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VI1EUR03FT065.mail.protection.outlook.com (100.127.144.171) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6199.11 via Frontend Transport; Tue, 14 Mar 2023 14:39:34 +0000
Received: ("Tessian outbound 2ba0ed2ebb9f:v135"); Tue, 14 Mar 2023 14:39:33 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 789e14a9e89e4b57
X-CR-MTA-TID: 64aa7808
Received: from b42d36717b83.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 72365A75-973E-46D7-BD43-7BF41FE3F7D5.1;
	Tue, 14 Mar 2023 14:39:27 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id b42d36717b83.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Tue, 14 Mar 2023 14:39:27 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O2vj4t982vTmtUehzed5wy4WHRQwU+5/039AB4MTwSSEbKkFxz0LOkwYe9pN4KMpHWi9j82u8aeEfwc5OMsOCq7s2RgneG4pqulLRCUnkJoPKgQgmSzeQYKayjx4HbjyALrwoKsXBfKHStBEjt+mV03ZACwrJz8JLsMO6OdzClewD3IGjgBcpIdIHRf0WUqTWs/TL734f4oMPW2ryemShbLst1q8xQxCOpQvXUG4S278c5W1+AG2fmg2A7qrPxg033aqw1dSU0pAx/Vz99lP93n6hiF88zz0cbsJZTN/F5/qRMACekFwnKbhMCG/tGOoSvhONzgS8KtH8Z+CGtl7og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KYvxY8FOzpt29eWeWkXm/YW3YN/0O4uTExEyMPvsREE=;
 b=dzAro6jrIAiWfOaBcO9r4HaiiS04gZY08c667NY4RZUljjad1HTKJNppv9XRFAAF9RNxcymHp0VSVOHhw3vfs/blYL4kndN6Y7S5CmQmATk5U5QXjBCCU538vYfnzVSQ/hjDb/PDjaRC9EvR6wNKBPJbW5p1K826j/Mb4XfCosVYECPcM3gcCAliBmgO2tXDRsYwWSnLF3Pt5FjNNc4G/K374VmVoB33DnnR8i71CkExNCTmWInYs87Gzo0AUGYLiCoP49ZsqCyvzdRzHQAxqiZ1idAEmBTZ5f/Oo1hNCmUz48cSBqKorvsbvJORA5bzL3UH/l2ZxBwjm09KdeIxMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KYvxY8FOzpt29eWeWkXm/YW3YN/0O4uTExEyMPvsREE=;
 b=dpnEFzAY3rRPVLbMKdvkyiZ4pXiomGG/ntxsHPAz5LdoasUm5xo5SUAKXJ0Q67z1au/HUL6xd0WYaARWkmkKExNZGfQemzoUtkaERptfCrWfIMuA7jBqW0b4XXYUoS0oxE3mcsNNkixOArqVgmqFfbry/vUhW3+TN4hJIdTgq/g=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by DB9PR08MB7510.eurprd08.prod.outlook.com (2603:10a6:10:301::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.26; Tue, 14 Mar
 2023 14:39:24 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::e305:742e:e10b:1093]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::e305:742e:e10b:1093%2]) with mapi id 15.20.6178.024; Tue, 14 Mar 2023
 14:39:24 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Marta Rybczynska <rybczynska@gmail.com>
CC: OE-core <openembedded-core@lists.openembedded.org>, Marta Rybczynska
	<marta.rybczynska@syslinbit.com>
Subject: Re: [OE-core] [RFC]] cve-update-nvd2-native: new CVE database fetcher
Thread-Topic: [OE-core] [RFC]] cve-update-nvd2-native: new CVE database
 fetcher
Thread-Index: AQHZSGtxUtQG2EMrBkOjIGbj2bH0Ua76cLkEgAAD8wA=
Date: Tue, 14 Mar 2023 14:39:24 +0000
Message-ID: <85E2BE90-C658-4C01-8124-BD231FA1D10A@arm.com>
References: <20230224161643.1596895-1-rybczynska@gmail.com>
 <1746CF3A756BF744.29542@lists.openembedded.org>
 <CAApg2=Rky1AVv98bUZoG5axPV3j7Z5-nFjDXcjY_b_0GqqSBiQ@mail.gmail.com>
In-Reply-To: 
 <CAApg2=Rky1AVv98bUZoG5axPV3j7Z5-nFjDXcjY_b_0GqqSBiQ@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3731.400.51.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|DB9PR08MB7510:EE_|VI1EUR03FT065:EE_|PAXPR08MB6448:EE_
X-MS-Office365-Filtering-Correlation-Id: 76a44cd1-7166-4f44-6b36-08db2499ede5
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 Smuod8vVNLOZ0vP9vD0cgMfGHlolYtlNPAIj6YzYexxkbQ1dP7W9pwrCoB6zGo9poGkLd9okzx5BXDWpBcQa7v7q+uory0v/8HO0Za7ZsGt4SzMImiKOqUcrr1RU2D1hZUpKQg87MCRPDDJW1xrws94VfCOZE42ZX2T5QCp9YOqLws4pPqVn85B5NdbtOXKjTbAO0k8Fhx0Vci82rqQ+6U7IoYkRLbhH/hthc74QE0VP55TABul+DInIqLED8q+sBXpadmsMIMT9LXrPUIeWq+ZnjpWXmRIqdZFcPsP2LcQjHZXRoCViQ/nyitgnnMbuL7CGaK5c+Onp+ITnOnK07q3ZRZDUHlt5BAc1k4P/H98ZJ+ytVePtvPcYPMs54zjDCM+oKz2mdJvhUd0ejbCsZBflHjfdtyNx/lJp7xWEXgCg/4FfN5eXznLpXtF2XMpSFv8lJVKR+X/RSMQdwUGERx2Wt0jvzlmR0ebpSiYsntEr0s5Qc2j6e9gDfk+5fLOZ5bx6Vj5KY3ZYV8agRUp5iOaYFN6MbDSnjfTKL+GQsWgBmfSNiwUjv+mq4+jVswaDHjsk5e27qKdMeYJtYPRXLq3z//PibJ5/zZJDHXFHR9h3WbFV4bIHsPYv2ksDOwQa4n6gMg8CN5A7VThZaDur5H92LBa+lcCELpDQ4yarfXLwwnHwbizRewDkpwppg4HkNMS6O5IKX/d288Zm87IItWZr+PgIDxjEU653kiBeBABD2H+1DSGv1wi03WKQ36Z92PeNvoQRanmwSC1cYIROZw==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(396003)(39860400002)(346002)(376002)(136003)(366004)(451199018)(66899018)(36756003)(33656002)(5660300002)(8936002)(2906002)(41300700001)(38100700002)(38070700005)(86362001)(122000001)(478600001)(71200400001)(76116006)(66946007)(66476007)(91956017)(66446008)(64756008)(8676002)(6486002)(66556008)(6916009)(4326008)(26005)(54906003)(316002)(186003)(6506007)(6512007)(2616005)(53546011)(45980500001)(130980200001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <F275F88DF3E44448BFFCA9B9A814FFA1@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB7510
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 VI1EUR03FT065.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	17746249-59e8-45f2-25f8-08db2499e7ef
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	t87eDLrP48moKgS7zBn7VXBugUlCbCt2QxU8qpeqe6p0y0RwtD3yy7Lbc1iEylL2H9Ry7Ehap4O78oZ35ysEpics8ezGsWVWwN/k/pD6w+p2vKKDtJl+KL//tu8CYcuYZYfGuLrRcSjoocD+sCvYq4P3MApWi0GHlfSKkZVVipPx3kgugyC2eFvgtE6OD7v92hfZoSt5PyyvYTz9wnRV2Ry1lWSpbRpTKvzTuyNwSRt6NAh/0gtNKwzu16kZgskqvETT94WUfTmuOKnQIZI5dY65vLUqxeCKGVTtT/E40VSITcre3f/10M+vIUYpZR3hZSAG0ELE0HYg4MmGvmutbeeTuD1hvQ6O8A1XnQYbrOZfDzAKFYDLPh8zLgHL7UnDGyBk8VUrrPHWB9oGGbXMTXxkBGqBhkMhJzdOyTayVSYXXcI2Xg6UQL7LSVVvcrYtJSCn2ZRrGtRq318Lpot3qTRkgdbgKcehbSdijWfouC3zrloXSYTmcjS2H11z4ckG5vwRcM8HzB13eW+GrlgWwz79wlpkSG6AwtmchwMdr6XFBg2iijS92RudcgNdA9u9f5pufgLh2vyqHpWVHS7RR/GgJFkQTC2pe3MN/HKM0Hl5vmwR9YYF5cL22CHqW29pqX/WflprWnAbipNkhXPNgyoTci4A5Lw7xXr6j07LI24gXbUNBLu3P8XgVy4T23CkgiOlznmzAFAYIpy5gj4LKOb3C8i9lMQakri5F5lj3Qe5vxVhiX989IZ8Ew0NVaxJ
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230025)(4636009)(39860400002)(136003)(346002)(396003)(376002)(451199018)(36840700001)(46966006)(40470700004)(47076005)(336012)(66899018)(316002)(478600001)(82310400005)(36756003)(40460700003)(33656002)(40480700001)(86362001)(356005)(36860700001)(82740400003)(26005)(2616005)(6506007)(6512007)(81166007)(53546011)(107886003)(186003)(5660300002)(8936002)(6862004)(54906003)(6486002)(41300700001)(70206006)(70586007)(2906002)(8676002)(4326008)(130980200001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Mar 2023 14:39:34.1951
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 76a44cd1-7166-4f44-6b36-08db2499ede5
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	VI1EUR03FT065.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6448
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 14 Mar 2023 14:39:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178495

T24gMTQgTWFyIDIwMjMsIGF0IDE0OjI0LCBNYXJ0YSBSeWJjenluc2thIDxyeWJjenluc2thQGdt
YWlsLmNvbT4gd3JvdGU6DQo+IE9uIEZyaSwgRmViIDI0LCAyMDIzIGF0IDU6MTYgUE0gTWFydGEg
UnliY3p5bnNrYSA8cnliY3p5bnNrYUBnbWFpbC5jb20+IHdyb3RlOg0KPiBBZGQgbmV3IGZldGNo
ZXIgZm9yIHRoZSBOVkQgZGF0YWJhc2UgdXNpbmcgdGhlIDIuMCBBUEkgWzFdLg0KPiBUaGUgaW1w
bGVtZW50YXRpb24gY2hhbmdlcyBhcyBsaXR0bGUgYXMgcG9zc2libGUsIGtlZXBpbmcgdGhlIGN1
cnJlbnQNCj4gZGF0YWJhc2UgZm9ybWF0IChidXQgdXNpbmcgYSBkaWZmZXJlbnQgZGF0YWJhc2Ug
ZmlsZSBmb3IgdGhlIHRyYW5zaXRpb24NCj4gcGVyaW9kKSwgd2l0aCBhIG5vdGFibGUgZXhjZXB0
aW9uIG9mIG5vdCB1c2luZyB0aGUgTUVUQSB0YWJsZS4NCj4gDQo+IE1pbm9yIGNoYW5nZXMgdGhh
dCBjb3VsZCBiZSB2aXNpYmxlOg0KPiAtIHRoZSBkYXRhYmFzZSBzdGFydHMgaW4gMTk5OSBpbnN0
ZWFkIG9mIDIwMDINCj4gLSB0aGUgY29tcGxldGUgZmV0Y2ggaXMgbG9uZ2VyICgzMCBtaW51dGVz
IHR5cGljYWxseSkNCj4gDQo+IA0KPiBUZXN0cyBWRVJZIE1VQ0ggd2VsY29tZSwgSSBoYXZlIGZv
dW5kIHNvbWUgYnVncyB0b2RheSBzdGlsbC4NCj4gDQo+IERvY3MgKHdpdGggYSBtYW5kYXRvcnkg
bm90ZSBhY2NvcmRpbmcgdG8gdGhlIHRlcm1zIG9mIHVzZSkgd2lsbCBjb21lIHdpdGggdjIuDQo+
IA0KPiBGb3IgdGhlIHN3YXAgYmV0d2VlbiB2MSBhbmQgdjIgSSdtIG5vdCBzdXJlIHdoYXQgd2ls
bCBiZSB0aGUgYmVzdCBzb2x1dGlvbjoNCj4gLSBhIGNvbmZpZ3VyYXRpb24gb3B0aW9uIGFsbG93
cyB0byBtaWdyYXRlIHdoZW4gdGhlIHVzZXIgZGVjaWRlcyB0byBkbyBzbw0KPiAtIC4uLiBidXQg
ZG9lcyBub3QgcHJvdGVjdCB0aGUgZGF5IHRoZXkgZGlzY29ubmVjdCB0aGUgZmVlZA0KPiBXaGF0
IGRvIHlvdSB0aGluaz8NCj4gDQo+IA0KPiBTdGlsbCBpbnRlcmVzdGVkIGluIHlvdXIgb3Bpbmlv
bnMgb24gdGhpcy4gQ3VycmVudGx5IEknbSBpbnZlc3RpZ2F0aW5nIHNvbWUgZGlmZmVyZW5jZXMg
YmV0d2Vlbg0KPiBib3RoIGZldGNoZXJzLg0KDQpTb3JyeSwgSSB1dHRlcmx5IGZhaWxlZCB0byBh
Y3R1YWxseSByZXBseS4NCg0KSSBkaWQgc29tZSBiYXNpYyBjb2RlIHJldmlldyBhbmQgaGFkIHNv
bWUgdHdlYWtzLCBhbmQgZ3J1bWJsZWQgYXQgdGhlIHBlcmZvcm1hbmNlIG9mIE5JU1TigJlzIHNl
cnZlcnPigKYgSeKAmW0gaW4gbWVldGluZ3MgZm9yIHRoZSByZXN0IG9mIHRvZGF5IGJ1dCBJ4oCZ
bGwgYWN0dWFsbHkgd3JpdGUgbXkgcmVwbHkgdG9tb3Jyb3cuDQoNClJvc3M=

