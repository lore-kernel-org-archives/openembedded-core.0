Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8F6CC4167B
	for <webhook@archiver.kernel.org>; Wed, 29 Nov 2023 11:51:02 +0000 (UTC)
Received: from EUR01-DB5-obe.outbound.protection.outlook.com (EUR01-DB5-obe.outbound.protection.outlook.com [40.107.15.54])
 by mx.groups.io with SMTP id smtpd.web11.30965.1701258659825902213
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Nov 2023 03:51:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=jZSdN+F3;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=jZSdN+F3;
 spf=pass (domain: arm.com, ip: 40.107.15.54, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=UGhBFBEnuXLvA5McIzROrpvxsF5MfxlrSCegQJBn86kUTg8OHNqzbjOz67EWcifvuHq8GxQ/QdeMaJblO98d0y7QQp2Dj2VIPm5OaECZ81oAJUlerww7LcGEceHWTb0sRL1bdJy0Vz7gWkjR+FA/QH11rcHez69hubzv7w9MiNRdbJHsjoykMdK005PrzPJcj8FdOypbiFeeVYnNcgzP/feAsam7wJQh7NCVHdKu7SuUrAl6penvapflPcOHTns8z+9dQ8orfih04OYpqQGxnSHDdyRguKgTjGqpo4Zp5zVR06DDGNZaNA5SIpp1MiBVZoH+Q/ULIrfsgQqLp+aGRg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=135OkDHmwpc+G2WrBA83+l6RVXY2rJ3Do7IHib9EEOI=;
 b=l4Mz580m+YPqikyYc/fR7LtSf+/GBleban8gvH/ANtAhyhg0EcOqLTH4FfCn9MTgDOpR+BD27rU6X3awH5uMmwM8pvFkUjFwOw1hFAlpZj2qoQAdr/1dZlGoPlUDI9Ckv64+4K5hiisKDdeNIo5BAnEGIfnRVWx3J04mKa89XELkUV36xZeYKvetMpvdPiytjaDf3Nq6CuwxucimDbUbVzGhqpbN7/v6bQEs7+VUtuoHHh8bhMRukuTSFZVfYjx/NNHIAgVhEOTSatV3ixXcVcZa0my5td3qX5bGoF6wQO6AU5v7BOrL3Tt2QolbxcwsrQ3CpwqYl2Hq4iRTC43fMw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=135OkDHmwpc+G2WrBA83+l6RVXY2rJ3Do7IHib9EEOI=;
 b=jZSdN+F3L/Pt5z2c8RZ9iaJ8yGSdFtGLKKPOYrEsegnRwvlqHMu7i+ugcoku8JVwfTAyOxuky21UCHgRPfMo/hIsog2LeCbCYYm1+WZPpiKvjVSBJYbtLeClgH5NmqmetIyTbRMm/oYlPDsQ33DHIhB+yy2OHbLdQ63EGXY0mFE=
Received: from AS9PR06CA0298.eurprd06.prod.outlook.com (2603:10a6:20b:45a::6)
 by DBBPR08MB6155.eurprd08.prod.outlook.com (2603:10a6:10:1f5::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.27; Wed, 29 Nov
 2023 11:50:55 +0000
Received: from AMS0EPF00000193.eurprd05.prod.outlook.com
 (2603:10a6:20b:45a:cafe::6a) by AS9PR06CA0298.outlook.office365.com
 (2603:10a6:20b:45a::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.31 via Frontend
 Transport; Wed, 29 Nov 2023 11:50:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AMS0EPF00000193.mail.protection.outlook.com (10.167.16.212) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7046.17 via Frontend Transport; Wed, 29 Nov 2023 11:50:55 +0000
Received: ("Tessian outbound 7c4ecdadb9e7:v228"); Wed, 29 Nov 2023 11:50:55 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: e187e9b8ba88843c
X-CR-MTA-TID: 64aa7808
Received: from 62f8664f7a15.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id E2FB403E-470D-4B31-B41F-35A2663B8F4B.1;
	Wed, 29 Nov 2023 11:50:47 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 62f8664f7a15.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Wed, 29 Nov 2023 11:50:47 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NM7iQklQLKBmebOyKYEu8rMaZp+7nsPwZqQ4SWpRPXSG5wReFSNpW23PvkQpu2eAjFvnrUPPep7fQPWFarconQar5w7Qlrp5fhk5C1VUEK8GnJfftdpyMkIxL9oimFlQ/B+FOWNscbR7H3iPcKq53xPKy+nPSb3VIjCrpkFwomQq7XOMi/N9ArIQS6ZB0dWmGaZ8WCGhvsfNkKlnvSsYQfh1g5C4KgO0Pfw/m61mCRzs0KiFBURkPni5JTF1rhwuE6S+GHYh4nbqfVPiNstH9RU7aj/eF8z1fEAWoQ7GFW091tNpJ5xOa+qAxJzPvlGMvvPliucS0e3zLg7AVC+4sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=135OkDHmwpc+G2WrBA83+l6RVXY2rJ3Do7IHib9EEOI=;
 b=VC1nD5IV5RjWts01XUoWljE2NAbQI2m5L0VWDZQDJQMGxkMtoOQg6m7eA5BJ1dQXfpPagQxJxstZVWC+bJPMFUjXhQF7Z5K4EXWCk8rZhOaZOvybKeAF9Rwpwp7sX8f60LzKBkZ3shRvY7t5PwA4cLZabQhqKiwcNZJ5Wg8sBgiLw1EKjrIvF4WYCptZ6Jv2mpHMjjPmN6hLgFl8vL4XVxTeamrOu6vrZbVK9exntLV10VCC3Vo3tKJZQBjlTGruSshMqchlD2HU5QuKp83DRYc4CNyNEDfy4eg+RIOFKmAjbHTxFCaKinkZUQ4Ewtuk1tdytX3YR2qij+Q7YWtWjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=135OkDHmwpc+G2WrBA83+l6RVXY2rJ3Do7IHib9EEOI=;
 b=jZSdN+F3L/Pt5z2c8RZ9iaJ8yGSdFtGLKKPOYrEsegnRwvlqHMu7i+ugcoku8JVwfTAyOxuky21UCHgRPfMo/hIsog2LeCbCYYm1+WZPpiKvjVSBJYbtLeClgH5NmqmetIyTbRMm/oYlPDsQ33DHIhB+yy2OHbLdQ63EGXY0mFE=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by DB9PR08MB7496.eurprd08.prod.outlook.com (2603:10a6:10:36b::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.22; Wed, 29 Nov
 2023 11:50:45 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::ef47:2c42:1ef6:fe5c]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::ef47:2c42:1ef6:fe5c%6]) with mapi id 15.20.7025.022; Wed, 29 Nov 2023
 11:50:45 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "andrey.popov@yadro.com" <andrey.popov@yadro.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH v2] image-live: Add support for building
 EFI-bootable ISO images for non-x86-based archs
Thread-Topic: [OE-core] [PATCH v2] image-live: Add support for building
 EFI-bootable ISO images for non-x86-based archs
Thread-Index: AQHaEYzy5bSjqgeOX0K1TXdExQQEv7CRUWsA
Date: Wed, 29 Nov 2023 11:50:45 +0000
Message-ID: <CCD6EA53-BA66-4547-AA4A-2CAC0387D934@arm.com>
References: <20231107151243.10853-1-andrey.popov@yadro.com>
In-Reply-To: <20231107151243.10853-1-andrey.popov@yadro.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3774.200.91.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|DB9PR08MB7496:EE_|AMS0EPF00000193:EE_|DBBPR08MB6155:EE_
X-MS-Office365-Filtering-Correlation-Id: b29b68c7-b935-4d05-4f5f-08dbf0d171ec
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 1+5MzqU+8Iq6L4NGKEUN5lxq2PC4xbXO14iSQXyKpjyrwSi2HeErHkV9w77fVSb6FmTE3dKMhydAhIyQnJUJ1ht8JCLAbYGbdEqkkWgD2wpx7y1JAZbWBWQvElJvK1hoA0pN0A4b+nJs1WAfiMvxqsgOD4ecvYQVROBU05MPhjst9ngofzSdRuen7Iw7se2UdDKJPf3D2lwaj8eVypuW+fRXCtFClmCA4MpxhKaKGNVP6prrowhtLtQJ9sXlk63ajGMAagfr9n0jUz3G6Z+9e3jYI98KZLiwaqffzbe+B/2LqgU7johJEeCo7RE0a22pHXpUohz05n7CkoN4uekamN9nOiUVSENF0Ldmi7OVhaGZtQSH9il/Kb4P+uEZPkQ4OWNOaPEj4JCHSzUA3QW2DiT9Jr7c3MFr5E4BKwNbpLnjD3sIVlVcRapyEampmtpW7YBJKLgdW7ScpkcpawGbn16bZ3FaZZKxkqOkgPKSPqPyNJJ8LKIGyg1Za/ZMNU81ii1LQKXw80J31g6ZhPtCx7KzxZCuHBvKgOTA7vQoEhi2GAxb4D5+BZhllUG0sSd0OHwhIMXyREh8gJCyr9SDr/I44kYPd9eqD9Fwp/RY33CtPvgu3Ljg3ljehlGll9Vrwc+ttx3C6nv13Ci7L/92cg==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(396003)(136003)(376002)(39860400002)(346002)(230922051799003)(64100799003)(186009)(451199024)(1800799012)(86362001)(64756008)(6916009)(5660300002)(66556008)(76116006)(66446008)(66476007)(66946007)(91956017)(8936002)(316002)(4326008)(8676002)(41300700001)(36756003)(33656002)(2906002)(38100700002)(122000001)(83380400001)(6512007)(26005)(2616005)(6486002)(966005)(478600001)(71200400001)(38070700009)(53546011)(6506007)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <E0CFC20F856A5B4AB4AAE1DC7180A4D9@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB7496
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AMS0EPF00000193.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	98ee631f-2870-4443-815a-08dbf0d16be8
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	VS9iHxINGzSRhkzB+UfgIHHXwAfhYB8kF/Q2DfN3ugR7XkhcGKYTqT3Dg9tSlDe15FQwBpe0ezqiR3JT1y1M+NbJlGG5kjsJxkJO+ec6BjMvIF9zXf7tMGOBkO3/kQ+jJaPAV+Kdzj3nItT4mj2zhCJOVHzYPrps1oS1TWx25DC9BGqJfoWpuZ3CKplzHHqKe39qRzgD+cM+KPTlLQt3upQ+HXW7P9P/7c+rIDodKIpOR2D/31+k/avjDSSG51atimANc18o20Dh9Se0AioJRMDCNiaFSsA0nCuWgpt7p+37D001+sh/VfsYtGNjvIZqQ0Jmhudchrob+BztGZem0KZHcz64+kk4XRCudFhx3B+0tvWuMKlNLuYzCmzUkZWne6nyBnTHuY1e2rr+DcfLS2yRVQ0A6ojnpAlFlDQtYyjGwHp/0mWHZwXBC75Yp7VI3eoOPODFSHe6U1fLH/HHvvagbxFzXKxUgkia8QNmJKWNDKLV0YpLQkb63kXj1AnjsoxWbGrYz7sq/8sjT34yFh0sX+K5RP9op1bfD1HSmbP4x7mGoNMziir7Hl2wOa0aueeBYMdYnaqj8Me5QWhNWGGFrK7PeGGN+eM6NGZv5kfxjUETlT0yuiGBQ9GsI74+Jr8ihAGFtCiJOq1cbm4e4gOqrjAMFv8xoHhd20amJ6U4jSIp/oScFw9f1CB6jGsJwUX6E/CW4cXlBv80wTdAnLaBwBjxjwrWe4w5Sq+hr3Y=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(136003)(39860400002)(376002)(346002)(396003)(230922051799003)(64100799003)(186009)(1800799012)(82310400011)(451199024)(36840700001)(46966006)(40470700004)(2616005)(6486002)(6512007)(53546011)(6506007)(478600001)(966005)(36860700001)(336012)(41300700001)(83380400001)(40460700003)(316002)(2906002)(5660300002)(70586007)(6862004)(70206006)(8676002)(4326008)(8936002)(47076005)(81166007)(356005)(36756003)(86362001)(33656002)(82740400003)(40480700001)(26005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Nov 2023 11:50:55.2575
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b29b68c7-b935-4d05-4f5f-08dbf0d171ec
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS0EPF00000193.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB6155
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 Nov 2023 11:51:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191445

T24gNyBOb3YgMjAyMywgYXQgMTU6MTIsIEFuZHJleSBQb3BvdiB2aWEgbGlzdHMub3BlbmVtYmVk
ZGVkLm9yZyA8YW5kcmV5LnBvcG92PXlhZHJvLmNvbUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnPiB3
cm90ZToNCj4gQEAgLTI5LDggKzI5LDEwIEBAIGRvX2Jvb3RpbWdbZGVwZW5kc10gKz0gImRvc2Zz
dG9vbHMtbmF0aXZlOmRvX3BvcHVsYXRlX3N5c3Jvb3QgXA0KPiAgICAgICAgICAgICAgICAgICAg
ICAgICBtdG9vbHMtbmF0aXZlOmRvX3BvcHVsYXRlX3N5c3Jvb3QgXA0KPiAgICAgICAgICAgICAg
ICAgICAgICAgICBjZHJ0b29scy1uYXRpdmU6ZG9fcG9wdWxhdGVfc3lzcm9vdCBcDQo+ICAgICAg
ICAgICAgICAgICAgICAgICAgIHZpcnR1YWwva2VybmVsOmRvX2RlcGxveSBcDQo+IC0gICAgICAg
ICAgICAgICAgICAgICAgICAke01MUFJFRklYfXN5c2xpbnV4OmRvX3BvcHVsYXRlX3N5c3Jvb3Qg
XA0KPiAtICAgICAgICAgICAgICAgICAgICAgICAgc3lzbGludXgtbmF0aXZlOmRvX3BvcHVsYXRl
X3N5c3Jvb3QgXA0KPiArICAgICAgICAgICAgICAgICAgICAgICAgJHtAZC5nZXRWYXIoJ01MUFJF
RklYJykgKyAnc3lzbGludXg6ZG9fcG9wdWxhdGVfc3lzcm9vdCBcDQo+ICsgICAgICAgICAgICAg
ICAgICAgICAgICAgICBzeXNsaW51eC1uYXRpdmU6ZG9fcG9wdWxhdGVfc3lzcm9vdCcgaWYgX19p
bXBvcnRfXygncmUnKS5tYXRjaCgnaS44NicsIGQuZ2V0VmFyKCdUQVJHRVRfQVJDSCcpKSBvciBc
DQo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgX19pbXBvcnRfXygncmUnKS5tYXRjaCgneDg2XzY0JywgZC5nZXRWYXIo
J1RBUkdFVF9BUkNIJykpIGVsc2UgXA0KPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgJ3hv
cnJpc28tbmF0aXZlOmRvX3BvcHVsYXRlX3N5c3Jvb3QnfSBcDQo+ICAgICAgICAgICAgICAgICAg
ICAgICAgICR7QCclczpkb19pbWFnZV8lcycgJSAoZC5nZXRWYXIoJ1BOJyksIGQuZ2V0VmFyKCdM
SVZFX1JPT1RGU19UWVBFJykucmVwbGFjZSgnLScsICdfJykpIGlmIGQuZ2V0VmFyKCdST09URlMn
KSBlbHNlICcnfSBcDQo+ICAgICAgICAgICAgICAgICAgICAgICAgICINCg0KSW5zdGVhZCBvZiBs
b29raW5nIGF0IHRoZSBUQVJHRVRfQVJDSCwgcGxlYXNlIHVzZSB0aGUgcGVyZmVjdGx5IGdvb2Qg
bWFjaGluZSBmZWF0dXJlcyB0aGF0IGFscmVhZHkgZXhpc3Q6IHBjYmlvcyBhbmQgZWZpLiBJZiB0
aGUgdGFyZ2V0IGlzIEVGSS1vbmx5IHRoZXJl4oCZcyBubyBwb2ludCBpbiBzdXBwb3J0aW5nIHN5
c2xpbnV4LCBhbmQgaXQgd291bGQgYmUgbmljZSB0byBiZSBhYmxlIHRvIGRyb3AgaXQgZW50aXJl
bHkgb25lIGRheSBpbiB0aGUgZnV0dXJlLiAgVGhpcyBjbGFzcyBzaG91bGRu4oCZdCBiZSBjaGVj
a2luZyB0aGUgYXJjaGl0ZWN0dXJlIGF0IGFsbCwgc2ltcGx5IGNoZWNrIGZvciB0aGUgZWZpIGFu
ZCBwY2Jpb3MgZmVhdHVyZXMuDQoNClRoaXMgYWxzbyBwdWxscyBpbiBhIGhhcmQtZGVwZW5kZW5j
eSBvbiB4b3JyaXNvIHdoaWNoIGlzbuKAmXQgaW4gb2UtY29yZSwgc28gdGhhdCB3aWxsIGJyZWFr
IHRoZSB1c2VycyBvZiB0aGUgY2xhc3MgdGhhdCBqdXN0IHVzZSBjb3JlLiAgeG9ycmlzbyBhbHNv
IGRvZXNu4oCZdCBleGlzdCBpbiBhbnkgbGF5ZXIgYW55bW9yZSBhcyBJIHJlbW92ZWQgaXQgZnJv
bSBtZXRhLW9lIGluIG5hbmJpZWxkLCBzbyBJIGtub3cgdGhhdCB5b3XigJl2ZSBub3QgdGVzdGVk
IHRoaXMgY29kZSB3aXRoIG1hc3RlciBvciBuYW5iaWVsZC4NCg0KPiBAQCAtNzEsMTQgKzczLDky
IEBAIE1LSVNPRlNfT1BUSU9OUyA9ICItbm8tZW11bC1ib290IC1ib290LWxvYWQtc2l6ZSA0IC1i
b290LWluZm8tdGFibGUiDQo+IEJPT1RJTUdfVk9MVU1FX0lEICAgPz0gImJvb3QiDQo+IEJPT1RJ
TUdfRVhUUkFfU1BBQ0UgPz0gIjUxMiINCj4gDQo+ICtkZWYgY29tcHV0ZV9jaHMoc2VjdG9yX3op
Og0KPiArICAgIEMgPSBpbnQoc2VjdG9yX3ogLyAoNjMgKiAyNTUpKQ0KPiArICAgIEggPSBpbnQo
KHNlY3Rvcl96ICUgKDYzICogMjU1KSkgLyA2MykNCj4gKyAgICAjIGNvbnZlcnQgemVyby1iYXNl
ZCBzZWN0b3IgdG8gQ0hTIGZvcm1hdA0KPiArICAgIFMgPSBpbnQoc2VjdG9yX3ogJSA2MykgKyAx
DQo+ICsgICAgIyBtdW5nZSBhY2NvcmQgdG8gcGFydGl0aW9uIHRhYmxlIGZvcm1hdA0KPiArICAg
IFMgPSAoUyAmIDB4M2YpIHwgKCgoQyA+PiA4KSAmIDB4MykgPDwgNikNCj4gKyAgICBDID0gKEMg
JiAweEZGKQ0KPiArICAgIHJldHVybiAoQywgSCwgUykNCj4gKw0KPiArZGVmIG1rX2VmaV9wYXJ0
X3RhYmxlKGlzbywgc3RhcnQsIGxlbmd0aCk6DQo+ICsgICAgZnJvbSBzdHJ1Y3QgaW1wb3J0IHBh
Y2sNCj4gKw0KPiArICAgICMgQ29tcHV0ZSBzdGFydGluZyBhbmQgZW5kaW5nIENIUyBhZGRyZXNz
ZXMgZm9yIHRoZSBwYXJ0aXRpb24gZW50cnkuDQo+ICsgICAgKHNfQywgc19ILCBzX1MpID0gY29t
cHV0ZV9jaHMoc3RhcnQpDQo+ICsgICAgKGVfQywgZV9ILCBlX1MpID0gY29tcHV0ZV9jaHMoc3Rh
cnQgKyBsZW5ndGggLSAxKQ0KPiArDQo+ICsgICAgIyBXcml0ZSB0aGUgNjYgYnl0ZSBwYXJ0aXRp
b24gdGFibGUgdG8gYnl0ZXMgMHgxQkUgdGhyb3VnaCAweDFGRiBpbg0KPiArICAgICMgc2VjdG9y
IDAgb2YgdGhlIC5JU08uDQo+ICsgICAgIw0KPiArICAgICMgU2VlIHRoZSBwYXJ0aXRpb24gdGFi
bGUgZm9ybWF0IGhlcmU6DQo+ICsgICAgIyBodHRwOi8vZW4ud2lraXBlZGlhLm9yZy93aWtpL01h
c3Rlcl9ib290X3JlY29yZCNTZWN0b3JfbGF5b3V0DQo+ICsgICAgZiA9IG9wZW4oaXNvLCAnciti
JykNCj4gKyAgICBmLnNlZWsoMHgxQkUpDQo+ICsgICAgZi53cml0ZShwYWNrKCI8OEJMTDQ4eEgi
LCAweDgwLCBzX0gsIHNfUywgc19DLA0KPiArICAgICAgICAgICAgICAgICAweEVGLCBlX0gsIGVf
UywgZV9DLCBzdGFydCwgbGVuZ3RoLCAweEFBNTUpKQ0KPiArICAgIGYuY2xvc2UoKQ0KDQpXaHkg
bm90IGNvbnRpbnVlIHRvIHVzZSBzeXNsaW51eC1uYXRpdmUgdG8gcHJvdmlkZSBpc29oeWJyaWQ/
IE15IHVuZGVyc3RhbmRpbmcgaXMgdGhhdCBpc29oeWJyaWQgc2ltcGx5IG1lc3NlcyB3aXRoIHBh
cnRpdGlvbiB0YWJsZXMgYW5kIGRvZXNu4oCZdCBkZXBlbmQgb24gYSB0YXJnZXQgc3lzbGludXgu
IE9mIGNvdXJzZSBpZiBJ4oCZbSB3cm9uZyB0aGVuIHRoaXMgbmVlZHMgdG8gYmUgZXhwbGFpbmVk
IGluIHRoZSBjbGFzczogd2XigJl2ZSBhIHByb2JsZW0gd2l0aCBjb21wbGljYXRlZCBjbGFzc2Vz
IGJlaW5nIHdyaXR0ZW4gd2l0aG91dCBhbnkgZXhwbGFuYXRpb24gb2Ygd2hhdCBpcyBoYXBwZW5p
bmcgc28gbGV0cyB0cnkgdG8gaW1wcm92ZSB0aGUgc2l0dWF0aW9uIGluc3RlYWQgb2YgbWFraW5n
IGl0IHdvcnNlLg0KDQo+ICtkZWYgcnVudG9vbChjbWRsbl9vcl9hcmdzKToNCj4gKyAgICBpbXBv
cnQgc3VicHJvY2Vzcw0KPiArDQo+ICsgICAgaWYgaXNpbnN0YW5jZShjbWRsbl9vcl9hcmdzLCBs
aXN0KToNCj4gKyAgICAgICAgY21kID0gY21kbG5fb3JfYXJnc1swXQ0KPiArICAgICAgICBzaGVs
bCA9IEZhbHNlDQo+ICsgICAgZWxzZToNCj4gKyAgICAgICAgaW1wb3J0IHNobGV4DQo+ICsgICAg
ICAgIGNtZCA9IHNobGV4LnNwbGl0KGNtZGxuX29yX2FyZ3MpWzBdDQo+ICsgICAgICAgIHNoZWxs
ID0gVHJ1ZQ0KPiArDQo+ICsgICAgc291dCA9IHN1YnByb2Nlc3MuUElQRQ0KPiArICAgIHNlcnIg
PSBzdWJwcm9jZXNzLlNURE9VVA0KPiArDQo+ICsgICAgdHJ5Og0KPiArICAgICAgICBwcm9jZXNz
ID0gc3VicHJvY2Vzcy5Qb3BlbihjbWRsbl9vcl9hcmdzLCBzdGRvdXQ9c291dCwNCj4gKyAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgc3RkZXJyPXNlcnIsIHNoZWxsPXNoZWxsKQ0K
PiArICAgICAgICBzb3V0LCBzZXJyID0gcHJvY2Vzcy5jb21tdW5pY2F0ZSgpDQo+ICsgICAgICAg
ICMgY29tYmluZSBzdGRvdXQgYW5kIHN0ZGVyciwgZmlsdGVyIE5vbmUgb3V0IGFuZCBkZWNvZGUN
Cj4gKyAgICAgICAgb3V0ID0gJycuam9pbihbb3V0LmRlY29kZSgndXRmLTgnKSBmb3Igb3V0IGlu
IFtzb3V0LCBzZXJyXSBpZiBvdXRdKQ0KPiArICAgIGV4Y2VwdCBPU0Vycm9yIGFzIGVycjoNCj4g
KyAgICAgICAgYmIuZmF0YWwoIkNhbm5vdCBydW4gY29tbWFuZCAlczogJXMiICUgKGNtZCwgZXJy
KSkNCj4gKw0KPiArICAgIHJldHVybiBwcm9jZXNzLnJldHVybmNvZGUsIG91dA0KPiArDQo+ICtk
ZWYgZXhlY19jbWQoY21kX2FuZF9hcmdzKToNCj4gKyAgICBhcmdzID0gY21kX2FuZF9hcmdzLnNw
bGl0KCkNCj4gKyAgICByZXQsIG91dCA9IHJ1bnRvb2woYXJncykNCj4gKyAgICBvdXQgPSBvdXQu
c3RyaXAoKQ0KPiArICAgIGlmIHJldCAhPSAwOg0KPiArICAgICAgICBiYi5mYXRhbCgiZXhlY19j
bWQ6ICVzIHJldHVybmVkICclcycgaW5zdGVhZCBvZiAwXG5vdXRwdXQ6ICVzIiAlIFwNCj4gKyAg
ICAgICAgICAgICAgICAgKGNtZF9hbmRfYXJncywgcmV0LCBvdXQpKQ0KPiArICAgIHJldHVybiBy
ZXQsIG91dA0KDQpUaGVzZSB0d28gZnVuY3Rpb25zIGFyZSBiYXNpY2FsbHkgYSBiYWQgcmVpbXBs
ZW1lbnRhdGlvbiBvZiBzdWJwcm9jY2Vzcy5ydW4oKS4gRG9u4oCZdCBjb3B5LXBhc3RlLCBqdXN0
IHVzZSBtb2Rlcm4gQVBJLg0KDQpSb3NzDQoNCg==

