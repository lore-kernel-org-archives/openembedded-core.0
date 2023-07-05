Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1174BC0015E
	for <webhook@archiver.kernel.org>; Wed,  5 Jul 2023 15:19:47 +0000 (UTC)
Received: from EUR03-AM7-obe.outbound.protection.outlook.com (EUR03-AM7-obe.outbound.protection.outlook.com [40.107.105.72])
 by mx.groups.io with SMTP id smtpd.web10.20284.1688570378324270929
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Jul 2023 08:19:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=4CwU7U0Y;
 spf=pass (domain: arm.com, ip: 40.107.105.72, mailfrom: ross.burton@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JEK2Hljv2nqIs+WRzQ5iMD9KwNKpRo8XUH+AoXD0v3s=;
 b=4CwU7U0YecaLT/aBGPoTw5TrTEgPjE6RMxKkBPZJvbKlqIvY3CZyVuywN7SmtMtSVx9SX/cSpnGn/CJKhPUrjogq57yStapR7wSHvFQwLz5+dqbw+JX0QxdxgtF4cc5tMWw166pq9X0r9FqbNT17DAh+H9cjPFVUpaLNJRk4peo=
Received: from DB9PR02CA0029.eurprd02.prod.outlook.com (2603:10a6:10:1d9::34)
 by AS8PR08MB9551.eurprd08.prod.outlook.com (2603:10a6:20b:61c::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.17; Wed, 5 Jul
 2023 15:19:34 +0000
Received: from DBAEUR03FT033.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:1d9:cafe::65) by DB9PR02CA0029.outlook.office365.com
 (2603:10a6:10:1d9::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.18 via Frontend
 Transport; Wed, 5 Jul 2023 15:19:34 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT033.mail.protection.outlook.com (100.127.142.251) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6565.18 via Frontend Transport; Wed, 5 Jul 2023 15:19:34 +0000
Received: ("Tessian outbound c08fa2e31830:v142"); Wed, 05 Jul 2023 15:19:34 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: b8ef6c5c478972ff
X-CR-MTA-TID: 64aa7808
Received: from b1d563cad26b.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id C3B7E5ED-1E8D-4C03-A3EB-94BCD48BC40A.1;
	Wed, 05 Jul 2023 15:19:27 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id b1d563cad26b.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Wed, 05 Jul 2023 15:19:27 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XTqYDOPUHN2bTSVhseH8syFVR2mMC4+j/m1azHMsPboCX3qhTmCEWSmpL5T4c6+y+iwbHba6BdT66ed6rhTr9q8ywSg1lYwCrcdRLAkDDuISSaJjLrQTz6jvh9lGRS4DdNJ+VKwJjNmhAhYM9IZhcf6jqnGBXiyq8S7Vu/yYOHotKxobrlnxGhPUeOcs+jOm6xKMm64mdBzrAPQPDKH65+2dNt4wX0+qFYWp9CRHVkL6g+XyhqzXi858IxioTcWbv+3u+Ap2nWtiEs4te5vLv4I/Y8yuYBO3tIoK+Wd4OB+smw9+HC21rI4ELGOBMTxgf9pykpTz2wnnB6Uy8EPQWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JEK2Hljv2nqIs+WRzQ5iMD9KwNKpRo8XUH+AoXD0v3s=;
 b=Ohw7heFUrUCT6Cd003NrG4fy0qv7x1krHXWxqSifmCPq2WerwGZ1rY3gMOQ6GntXposui4MJqbxpJvb8D9tKFivIRvhkFd8hczeXYjcCdbLNOKn9OOXmc95caZkFGNstUEhkVgsltVpf1MBuoq2YqRJhzB3FrWu4+UXQOJKjcreczPsCkpc1jGCUt8watJ8vnYl5+K5fwtMYfx40DxQYkdMielSUpHz6xCzVkIZLyFdds5qTko9aW8QY14y4ItNDO3A1LylY0uOa0y7moeHIItYcQY+LtlcJHNpK6qEjPXs5p7fBIP9mDTfxjxuE3QaFSRJ9QpIH03dGWvKKyagqaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JEK2Hljv2nqIs+WRzQ5iMD9KwNKpRo8XUH+AoXD0v3s=;
 b=4CwU7U0YecaLT/aBGPoTw5TrTEgPjE6RMxKkBPZJvbKlqIvY3CZyVuywN7SmtMtSVx9SX/cSpnGn/CJKhPUrjogq57yStapR7wSHvFQwLz5+dqbw+JX0QxdxgtF4cc5tMWw166pq9X0r9FqbNT17DAh+H9cjPFVUpaLNJRk4peo=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by PAVPR08MB10331.eurprd08.prod.outlook.com (2603:10a6:102:32a::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6544.24; Wed, 5 Jul
 2023 15:19:24 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::30b4:3110:b02d:7f21]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::30b4:3110:b02d:7f21%7]) with mapi id 15.20.6544.024; Wed, 5 Jul 2023
 15:19:24 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "raj.khem@gmail.com" <raj.khem@gmail.com>
CC: OE-core <openembedded-core@lists.openembedded.org>, nd <nd@arm.com>
Subject: Re: [OE-core] [PATCH] libjpeg-turbo: upgrade to 3.0.0
Thread-Topic: [OE-core] [PATCH] libjpeg-turbo: upgrade to 3.0.0
Thread-Index: AQHZrmGOJ2GjpLnAi0u06cfXFyFSAK+rQrMAgAAIsYA=
Date: Wed, 5 Jul 2023 15:19:24 +0000
Message-ID: <427A6236-E060-4E2D-8642-FF5E78FD6095@arm.com>
References: <20230704102307.3654880-1-ross.burton@arm.com>
 <CAMKF1srqdCHyyOcpZzzhvB+=mAE+38E4hYKhwG-a+6LSf7bpTQ@mail.gmail.com>
In-Reply-To: 
 <CAMKF1srqdCHyyOcpZzzhvB+=mAE+38E4hYKhwG-a+6LSf7bpTQ@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3731.600.7)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|PAVPR08MB10331:EE_|DBAEUR03FT033:EE_|AS8PR08MB9551:EE_
X-MS-Office365-Filtering-Correlation-Id: bb02bf26-7f83-42e4-5c56-08db7d6b3d4e
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 mmoUSj4LX4OLrNyoamsL8Jp9z4atYWpF9O65wnjIgBNNfjg0PheltXuzlfJmW0vI4G1BLB5+APFwMw1o3m+K8Hb6MPUFHhlbS4yiP4eYgG1rgizHdRlxSTDpeL/jsD5gZr3zAM8GdEjZRUjW3C5PZerbohq5DU9HhyKJDGEgTv61Rf/4XS545am4OPDScgRlMP4533PyRMA7C1CPnNDOtndf8+0Rdgf9qZPG4cw04iuivMlQ7AQbAa0LMEfeAFXWqWirEuJUTBtUMyWFuw655JZlo+36ZARo5l7Oc9m7TuJshHUHsR1m/OgOQGhrEF57/JdufB5D5+gQtba7h9GiT1tFYKnJAxBnBuJdPxIXKo5JSCez4Szwb0hvLs/auM0OGAdz1e29DrRk6tYNy65lHA0Y7/9UnHJ42AL6T2kI5BKTt0SOavNT9vEwpDciJ9f2J+4PlnIOlPOAEt+wj7eNafxYhrXMjgIMZrCDZpDTcSfWd6u0Nb2pv2bbF5ZT7WpD0edTFe+Q2r0NPKv3vtdlHjX35NIwYw+fMg2LQlG8PD+yyVYaVaQVi/zIrUCZWtoh8OgJS8/KQZjvyHi4m85H9y0CWcVPetpMORdmf5OarYTB0R7S6zjzUXmJjS3Zfp7ikVVYTfZEQPsBAFSzywCUGQ==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(396003)(366004)(136003)(39860400002)(346002)(451199021)(478600001)(83380400001)(71200400001)(6486002)(966005)(6512007)(86362001)(66946007)(316002)(38100700002)(64756008)(66476007)(53546011)(76116006)(26005)(186003)(122000001)(66446008)(91956017)(54906003)(66556008)(6916009)(6506007)(4326008)(2616005)(5660300002)(8936002)(38070700005)(2906002)(4744005)(8676002)(41300700001)(33656002)(36756003)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <EF38C7E42226E74BAD3C7B09B0582B8F@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR08MB10331
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DBAEUR03FT033.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	0433681f-ff22-46f3-b46d-08db7d6b3764
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	unVErcNmrD41vNJwGtp7pnb8XMvlG5mEvPsUZvME7n8hp7e5gnB9GkBu1EZ4CQOBMSfHxRTZ2mOblX3710nwpARFeE4CyMpv4E5JO4gytY/pNKU5Bc0nyP/+3I6ApYNC4nzYEVRDTwxg17hetpP0ZFnATTc0OivmTmiz1QGl5mSmyIKSx5Wje8Vjhv+eVIKNq9Y3pWvk/dSuq++AEdLEzTsDXBilOX7Vxm1Axi3l2E5zQoAfckod1KEhtzeVh6yU81H9dclCNitUEgXAsJEc7E7Ux8UfOG4DFmViuaCh+fRcEWwamO24OnGHt/SAqeRsm+Zpr4BsSOMuIbZmE0L7s3UqeR552B2DXYRK+f/KdH8XtI/kU6gI4Xl/HudeTBHeMs3GKWqQ8ZbPJpK3K4nsrw9xftTeiNXEX0IBHz3QpNlv4B3HUathausCC4Gl8f2KOx3/px651GagUSdV7qyt4YPkBddgYWNVye4vQlE0IlOFgXpKMtAmOGlpRbZhIEWtx7wOJnL1/79CkFnvfsWhsW2mU1R+63iAJ8YUMIVxzByGwJoEAs4yQq5TbAsqtxvhJO7kQlXEAUCeRmaO/z1UERBetiulkpVh0SyF0AIC3OjqjvYQk75B3Rf4YTItTgIXplChYaiRsWjEjclijmVyt8Hwvt5CHT0oRBThz+2huys5bV7QZWrvxgSYhfYpdidZXrMxjpd8L+I+mbNKnya3/H9XzGGw5gUxB3NuR/LsETE=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(376002)(346002)(39860400002)(136003)(396003)(451199021)(46966006)(36840700001)(40470700004)(70206006)(2906002)(82310400005)(5660300002)(6862004)(36860700001)(336012)(2616005)(86362001)(40480700001)(8676002)(8936002)(6506007)(54906003)(26005)(6486002)(478600001)(33656002)(186003)(966005)(6512007)(53546011)(81166007)(82740400003)(47076005)(40460700003)(356005)(83380400001)(4326008)(36756003)(70586007)(316002)(41300700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jul 2023 15:19:34.6575
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bb02bf26-7f83-42e4-5c56-08db7d6b3d4e
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DBAEUR03FT033.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB9551
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Jul 2023 15:19:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183890

T24gNSBKdWwgMjAyMywgYXQgMTU6NDgsIEtoZW0gUmFqIHZpYSBsaXN0cy5vcGVuZW1iZWRkZWQu
b3JnIDxyYWoua2hlbT1nbWFpbC5jb21AbGlzdHMub3BlbmVtYmVkZGVkLm9yZz4gd3JvdGU6DQo+
IA0KPiBJIHdvbmRlciBvZiB0aGlzIGZhaWx1cmUgaXMgcmVsYXRlZCB0byB0aGlzDQo+IGh0dHBz
Oi8vZXJyb3JzLnlvY3RvcHJvamVjdC5vcmcvRXJyb3JzL0RldGFpbHMvNzExNzcwLw0KDQpUT1BE
SVIvYnVpbGQvdG1wL3dvcmsvY29ydGV4YTcyLWNvcnRleGE1My1jcnlwdG8tbXg4LXlvZS1saW51
eC9wb3BwbGVyLzIzLjA0LjAtcjAvcmVjaXBlLXN5c3Jvb3QvdXNyL2luY2x1ZGUvanBlZ2xpYi5o
Ojk2ODo1MjogZXJyb3I6IHVua25vd24gdHlwZSBuYW1lICdGSUxFJw0KOTY4IHwgRVhURVJOKHZv
aWQpIGpwZWdfc3RkaW9fZGVzdChqX2NvbXByZXNzX3B0ciBjaW5mbywgRklMRSAqb3V0ZmlsZSk7
DQp8IF4NCg0KDQpRdWl0ZSBwb3NzaWJseSwgYnV0IHBvcHBsZXIgc2hvdWxkIGJlIGluY2x1ZGlu
ZyBzdGRpby5oOg0KDQrigJzigJ0iDQpBcHBsaWNhdGlvbnMgdXNpbmcgdGhlIEpQRUcgbGlicmFy
eSBzaG91bGQgaW5jbHVkZSB0aGUgaGVhZGVyIGZpbGUganBlZ2xpYi5oDQp0byBvYnRhaW4gZGVj
bGFyYXRpb25zIG9mIGRhdGEgdHlwZXMgYW5kIHJvdXRpbmVzLiAgQmVmb3JlIGluY2x1ZGluZw0K
anBlZ2xpYi5oLCBpbmNsdWRlIHN5c3RlbSBoZWFkZXJzIHRoYXQgZGVmaW5lIGF0IGxlYXN0IHRo
ZSB0eXBlZGVmcyBGSUxFIGFuZA0Kc2l6ZV90LiAgT24gQU5TSS1jb25mb3JtaW5nIHN5c3RlbXMs
IGluY2x1ZGluZyA8c3RkaW8uaD4gaXMgc3VmZmljaWVudDsgb24NCm9sZGVyIFVuaXggc3lzdGVt
cywgeW91IG1heSBuZWVkIDxzeXMvdHlwZXMuaD4gdG8gZGVmaW5lIHNpemVfdC4NCuKAnOKAneKA
nQ0KDQpMb29rcyBsaWtlIHlvdSB3YW50IHRvIGJhY2twb3J0IGh0dHBzOi8vZ2l0bGFiLmZyZWVk
ZXNrdG9wLm9yZy9wb3BwbGVyL3BvcHBsZXIvLS9jb21taXQvMjk4NmYwNmM3Y2M5ZDY0YTUwNmVi
ZTg2MWI4YmYzOGY3MzM4NmU4NiB0byBwb3BwbGVyLg0KDQpSb3Nz

