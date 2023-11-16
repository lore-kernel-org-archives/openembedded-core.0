Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14A51C54FB9
	for <webhook@archiver.kernel.org>; Thu, 16 Nov 2023 12:00:38 +0000 (UTC)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (EUR04-DB3-obe.outbound.protection.outlook.com [40.107.6.78])
 by mx.groups.io with SMTP id smtpd.web11.5134.1700136034241490039
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Nov 2023 04:00:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=Kvx2A933;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=Kvx2A933;
 spf=pass (domain: arm.com, ip: 40.107.6.78, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=OAwrNsgPvgayRXbjW0SsUoN/y5OOkvwfxksC5vu/eT/X89N/4JMATTCpMr0Kmr1KnrsdBkx2u6jQ5vVs/iNmHDia3a/SLuaBfHfm+xSGDH3PEEXcvYUo2zc8eOTe4A1DWpzsYbXRBwa0kuSJ/uk1RGrWrDi0rnZEm+JGOM0BkoQZQ5amlbj6pNEjO1N8+RITF633bYIWbBEkDg+HsNrksXc+Cs+8ZsIhvb0NW7UVmb4Bs77nn5dQ3D61C11HGvOykv+BBF0jtzLxJd7XL/FA4q5i6tbQEQEPQfgEnkjHGoSu3QIy89EG7wIC8Aqvdld0V2SLaC4WonhkRuhQJlWkEA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MY8Gm8ND+GyXG8CKBW1raNXOU7fvDFylQJTnMpJVnzk=;
 b=FIQjcuXeLsqaPTOUKKZDgCDeYiY0znJScmnbp87roywKKV3C/qQtdrGUpsTsTQBMWm4EyOboGxeg78ZF9JaFOs5ZJzQVmPCvRbSJz1si6HDD5rab2AixIwha0ESQwXnfBdF78nfbkl4KB0bUY4uBwxiyY9yy1MaPrSd922t3hwNbTLWPseNCmNWS4UfQA9HS7ZWr5kMaNdNYgfNw4OXqZFJzq7j/9MuUzvcAqYh+z9zN1Aa6EdS9UIJDJcKhRIWeXjSghCjDKYVPjZ3KW1GA3wkVeLndpptUkbG9kVDeaM3Z5jAUtJ5kvy2MjZKexY+mLYIIvGLJrX47afV0YeBU2w==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MY8Gm8ND+GyXG8CKBW1raNXOU7fvDFylQJTnMpJVnzk=;
 b=Kvx2A933a4DHJz7N+v+2f/wmo2103m8ivAMpN56iiu3Nufbyldgwa6TdSmmU8fD0GEqz3ZIc0o1O+IWnQRKCY6Bm7B0uvL+a9FWKeA4EsKyn9EL7W4zC4CTDB+/o+yX804mzWl1DF43ee1fHeu8V+6vQIPkguZr3kg/vRzemuOY=
Received: from AM7PR04CA0016.eurprd04.prod.outlook.com (2603:10a6:20b:110::26)
 by AM9PR08MB6145.eurprd08.prod.outlook.com (2603:10a6:20b:2dd::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.21; Thu, 16 Nov
 2023 12:00:30 +0000
Received: from AMS0EPF00000192.eurprd05.prod.outlook.com
 (2603:10a6:20b:110:cafe::18) by AM7PR04CA0016.outlook.office365.com
 (2603:10a6:20b:110::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.21 via Frontend
 Transport; Thu, 16 Nov 2023 12:00:30 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AMS0EPF00000192.mail.protection.outlook.com (10.167.16.218) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7002.20 via Frontend Transport; Thu, 16 Nov 2023 12:00:29 +0000
Received: ("Tessian outbound 7671e7ddc218:v228"); Thu, 16 Nov 2023 12:00:29 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: bb57dc3c29fb701c
X-CR-MTA-TID: 64aa7808
Received: from 6493609d5584.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id AFCE17E0-1DB4-4657-A15C-BD5037EDC2F3.1;
	Thu, 16 Nov 2023 12:00:22 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 6493609d5584.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 16 Nov 2023 12:00:22 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hd7L2puPUw5O4PgFoeGb3Nb01135CBgKGEDcYh6QcJNTgBHI16i+gAl3/KTCW31vh+6j4VKvfEMwKRTtpF95b8LAOWCTa/lOqX2SW6ufHkP/gFB0Bfb+QR8YqXYF9qZjgr4amnutl7Yld44rYk2t61mO5t9/MMPR9l9fn7HB8N2l6kvwC1723BRAVEZWNiJ4MwckymPS9vgrVrwmdWlYAFU+BIt7VN0PSkHDWoZD36x1eiFrMMHttpaXiY+HjF1fB+rIr2yeOIOut5IsDwRUx5ctaAtriPf7LRKnGL80ioUKcK8nZ3MGGqX2j2HsoV9Eu2WsEgKc/g/fekWGl7ct+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MY8Gm8ND+GyXG8CKBW1raNXOU7fvDFylQJTnMpJVnzk=;
 b=MrNdNZLP6HLkMHVUZYZO4OgH1oqEHmv4cBqzWY+7nWuLPAp7r0oiHOwbrsuN0T2SzbRciXFfSSxrGwa+dGChcLw90yici5X8TMXkzHm68bN5wUeww9zsZArlxL9l0cLF0QfHRpiE6WMSyib/42eu/UXAmU3EXS8LVhR+qt3SGOMvE4IzzcZcjwGZdGONqqmad2eq7gvGko2xogrwQ7azSv2f4McTcPbw/F7YPLvMQpewtFWNQ9HpIvLQUCOuNNPsyCOMEHi2OTzFSbsdsQBK9xNGjmkMnqrYtKupVQaO4PIHXVHfHrWrwarVfKiUE93hCwx3o1SrWl8G9TSEdbH8NQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MY8Gm8ND+GyXG8CKBW1raNXOU7fvDFylQJTnMpJVnzk=;
 b=Kvx2A933a4DHJz7N+v+2f/wmo2103m8ivAMpN56iiu3Nufbyldgwa6TdSmmU8fD0GEqz3ZIc0o1O+IWnQRKCY6Bm7B0uvL+a9FWKeA4EsKyn9EL7W4zC4CTDB+/o+yX804mzWl1DF43ee1fHeu8V+6vQIPkguZr3kg/vRzemuOY=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by PA4PR08MB7665.eurprd08.prod.outlook.com (2603:10a6:102:262::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.29; Thu, 16 Nov
 2023 12:00:19 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::ef47:2c42:1ef6:fe5c]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::ef47:2c42:1ef6:fe5c%6]) with mapi id 15.20.7002.021; Thu, 16 Nov 2023
 12:00:19 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "p.lobacz@welotec.com" <p.lobacz@welotec.com>
CC: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-Core][PATCH v2 1/2] curl-native: add missing
 ca-certificates-native dependency
Thread-Topic: [OE-Core][PATCH v2 1/2] curl-native: add missing
 ca-certificates-native dependency
Thread-Index: AQHaGA4yEdyW6Td38E+N4wTVOsQ6KLB82MsA
Date: Thu, 16 Nov 2023 12:00:19 +0000
Message-ID: <B794072D-AEF9-4F0A-9D1A-9E22D202B9B6@arm.com>
References: <20231115215256.867653-1-p.lobacz@welotec.com>
In-Reply-To: <20231115215256.867653-1-p.lobacz@welotec.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3774.200.91.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|PA4PR08MB7665:EE_|AMS0EPF00000192:EE_|AM9PR08MB6145:EE_
X-MS-Office365-Filtering-Correlation-Id: 1cebdeb6-8fa2-47eb-9968-08dbe69ba0fd
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 +c+HKLNjchWq5jYwpl5fUJ+RxCQetyj9vd3Sop2aq0DUPnArgS4ZQzdJlMSHwPZHD6LXt4qQG2qggSU8qKOyNWEHztVqZJOEf2petO6CxZqu0WY3nmh5xxBNsDFOUD+JVeww1Kct44dhLXaAW9Irxn1VEJVMjms4KcvoTHRS1Iw+jPAm7rqmcH265UaxFHA91j1EyXzG95ZNuSnPiWjyPAc7SD+OGwEIQ6mDQwfny28HeY7ZDwZKaFjaWPwZA+GBaP0qG5sXM3L/caZd7kOukqI/OzVQeIJhDA4shYE0sGbFlk+kzNth+r8zczODFgUTnWKY1WydiS1Fxp9af8/5JtvaTqmZcx5EYRSib3hsC2OfRw56h57acXz9yQFeH8UNtC8haaUZHJ4Ym5oNWk6if9vtqNk7W1Ezj4mLKYnCmZBSk2Kv1P9CtDzpOK5nhX91dmy/XOKIYgFfiofwLgF/CyPTqKLz9kDCv/Bj9lOSalng7EOp35PtyOi98tHTqLFp2nwJrrLJslI6lSRag7acmMuRKIYpgU9+U3RJDqdr5ttk7d3t+4k0LGepi5aSBFpyR9dNNGi169dSeojaviCF8wmpwS/DOXV2w869uMcgc1twpgq1HSOikobfWc7Glx+O9H+tIVkYGHPZeM0bpfel/A==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(136003)(346002)(376002)(366004)(396003)(230922051799003)(1800799009)(186009)(451199024)(64100799003)(5660300002)(2616005)(4744005)(53546011)(6506007)(6512007)(26005)(2906002)(66574015)(36756003)(66446008)(66556008)(66476007)(64756008)(91956017)(316002)(76116006)(66946007)(6916009)(41300700001)(8936002)(478600001)(4326008)(122000001)(8676002)(71200400001)(33656002)(38100700002)(6486002)(86362001)(38070700009)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <AD0B519AD4F6F4479622EDDEA066118A@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB7665
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AMS0EPF00000192.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	31584ada-3d09-4038-76a8-08dbe69b9ad0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	LxiaSXs+R9b7ZLRUnOpHH3qByst/FFCPTgzbqA8vKt+nbCrFSMQ0do8MMYpA5Km215EyhfPBfxH9fCE9PlAZPl6er+oSv0H9/rSc3tgqk9s7vE2pq8/w6wqHhVqq26xI8lQo4TFT80rZU6kWOkPqAI+RzKMZFPwM+dosOEZt3skb4PkUa1qBkOMjVUnq2iyhCDVWTtC2L4loGN2i+T81S5bFzKOUKCJKy7EO37b2564BZsc7iVEnKiiw1Uj/feAxmiKFs0RFST/By0j9Y6q24GgtYG7hiUNp9gjEZEX9VCAe500HCoKp6QHgId08CZucqlgsG+Klmq0JfTXaK7idnSIpVFX+B/kPuAmEHYd6NYULfBrdpq21iySRBYQRrrQNh2ctC0g0prP/B56UUQluQHPpcITVFAisDjRdNvxBduRFFqHu56UvkHy+ZOQt/DDWOP5bDRkI0x45tFkIqwGb6TscMKB6xur608ySdMFPeM93rhDRwtzAwCLglRuLnB6sqDZ08MIe79hqRIL5Db5GYIaWvsw42NXFFv/dPULD09B77St9iPLDULTIz/jdHodMAuXo8hmqzSeMi+fv7oSEnIoq9pW0Y7/c7ZlY2egD66Q2VnC7XD4x+HoTGShnXm9J69G4UXDSWONhPMPxEK5hnhqY8NZmffu9CBbqU7CMicsmKnCnFW2XNUw2wkr3KNiuvkVDY2F8gMaBslKQWzDh961ZrNJupKO6BQyIMNvGGH8IkBuw+6xTsWKT7gPGevec
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(136003)(346002)(39860400002)(376002)(396003)(230922051799003)(82310400011)(64100799003)(1800799009)(451199024)(186009)(36840700001)(40470700004)(46966006)(82740400003)(4744005)(356005)(81166007)(5660300002)(86362001)(40480700001)(8936002)(4326008)(6862004)(8676002)(41300700001)(36860700001)(2906002)(47076005)(316002)(70586007)(70206006)(40460700003)(26005)(2616005)(33656002)(336012)(478600001)(6506007)(36756003)(53546011)(66574015)(6486002)(6512007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2023 12:00:29.7882
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1cebdeb6-8fa2-47eb-9968-08dbe69ba0fd
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS0EPF00000192.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB6145
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Nov 2023 12:00:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190790

T24gMTUgTm92IDIwMjMsIGF0IDIxOjUyLCBQaW90ciDFgW9iYWN6IHZpYSBsaXN0cy5vcGVuZW1i
ZWRkZWQub3JnIDxwLmxvYmFjej13ZWxvdGVjLmNvbUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnPiB3
cm90ZToNCj4gDQo+IEJ5IGRlZmF1bHQgY3VybCBpcyBiZWluZyBjb25maWd1cmVkIHdpdGg6DQo+
IA0KPiAtLXdpdGgtY2EtYnVuZGxlPSR7c3lzY29uZmRpcn0vc3NsL2NlcnRzL2NhLWNlcnRpZmlj
YXRlcy5jcnQNCj4gDQo+IHdoaWNoIGNhdXNlcyBhbiBpc3N1ZSBmb3IgbmF0aXZlIGJ1aWxkLCB3
aGVuIGNhbGxpbmcNCj4gY3VybC1uYXRpdmUgY29tbWFuZCwgYXMgY2VydGlmaWNhdGVzIGZpbGUg
aXMgbWlzc2luZy4NCg0KSSBzdGlsbCBkb27igJl0IHRoaW5rIHRoaXMgaXMgdGhlIGNvcnJlY3Qg
Zml4IGFuZCBzaW1wbHkgd29ya3MgZm9yIHlvdSBpbiB0ZXN0aW5nIGFzIHRoZSBjdXJsLW5hdGl2
ZSBidWlsZCB0cmVlIGV4aXN0cy4NCg0KV2hhdOKAmXMgeW91ciByZXByb2R1Y2VyIGZvciB0aGUg
YnVnIHlvdeKAmXJlIHNlZWluZz8NCg0KUm9zcw==

