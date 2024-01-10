Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 152D5C47073
	for <webhook@archiver.kernel.org>; Wed, 10 Jan 2024 21:00:38 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.89])
 by mx.groups.io with SMTP id smtpd.web10.5245.1704920428691184440
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Jan 2024 13:00:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=ksBVrkxr;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=ksBVrkxr;
 spf=pass (domain: arm.com, ip: 40.107.22.89, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=Hlu0sSf0IxAjlW/pVdLB8Dz+vX+lenUN9FA0zFV3klOXoUgRi0nEiel1qPgu64lz1Tq6BU2RLtokvY/nmWx/0LPwkZ+qt0FkipMq/qRGV9iAjH+n4HiiIw7eFegsCZfaA69bI0G6kdF942abST0hoT6CQpwNm3k9ddJFMRQvVDYXKDWR65HBrzD6TjHQissRg4wXMqokYIsWGCZcrHG5fHG4tL3p4LE0hME5A0ybysXzT2OuO2SiVXr5uq0nrCGeLCS+2KYt1K+0flcm/k2FnMFBiHv93mepFPcT1bnhjnKIYEWlL7LSEnsxQT/IBlW5qw0dCVuB0lXuMhGvQp/bew==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VFkQm2VfaDKoFxL/y92HNoiXl0KzTycc/VdkRUktsYs=;
 b=GlYLRm+vxwVqV8sr0TnT7yEGffHcH77BELPomCZryPtRPMmoNArB0rsHCe4MdGo9i7fGIUW4XaJA+YxFmUEKlkHHvy/UcbZJYkm6iFuQcfgR6GG9XbUx1gj+lSyzj2qWu5hTDmB1pjHIsd21SB7LXf8T6E67k+5ZCAbyIz2L5a6x39eOS9pAElyhR8VM6w+Tj5HHyFlu1oUak5brOzn0GLuh4ff4CyEHMSztj7kx+J3cY8iwHDf8BVnXb68yy4cGhoflMVcGyI/XoljEXmspG6DsXR1iuYV456E7wmXUz6gfXPs0RW7aroaa7LX4X0DRMDkrWD4p6bJxtyAecOEbsA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VFkQm2VfaDKoFxL/y92HNoiXl0KzTycc/VdkRUktsYs=;
 b=ksBVrkxr6x6T1IhiNDkDjy0AQjG7k+X8m7NTgDt17oLLbJshXUSQKJjyLu7V3CkQ+gqbsfTnNTzgKKWstK+7Scx0QpuaTKwAS3juks7kI2Xb703LaYe37HWcBnAchLdJ/9rLv4LwAYVz3u0V8ZFkhPxjJ28iAfJZasyTpoUC93o=
Received: from DB7PR02CA0026.eurprd02.prod.outlook.com (2603:10a6:10:52::39)
 by AS8PR08MB10026.eurprd08.prod.outlook.com (2603:10a6:20b:632::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.23; Wed, 10 Jan
 2024 21:00:24 +0000
Received: from DB5PEPF00014B98.eurprd02.prod.outlook.com
 (2603:10a6:10:52:cafe::d8) by DB7PR02CA0026.outlook.office365.com
 (2603:10a6:10:52::39) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7181.17 via Frontend
 Transport; Wed, 10 Jan 2024 21:00:24 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5PEPF00014B98.mail.protection.outlook.com (10.167.8.165) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7181.14 via Frontend Transport; Wed, 10 Jan 2024 21:00:24 +0000
Received: ("Tessian outbound 94d82ba85b1d:v228"); Wed, 10 Jan 2024 21:00:24 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 51e6dda8dd8347df
X-CR-MTA-TID: 64aa7808
Received: from ff25e6a41528.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 79BA036B-0C13-47C9-90D0-80E6BC5EF90E.1;
	Wed, 10 Jan 2024 21:00:17 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id ff25e6a41528.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Wed, 10 Jan 2024 21:00:17 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IhkcPq6tQFlWVwvap2T+DQVud6d3d+dwEU82sP0ID2iKVwEArIpzWmJal8kiZTaibhVBR6cFLBBlNEM2/3EdNsSs3Q5r0t7+XqBm4A3eum9Fd49HbdhbGDFeGUHhKJGtrhBJ+Z0jCIhoDHzThldH0JldiQUpuZR2KoXCysdiE9GAiZUq/SGpnbHp6KWkve2FkSz0odcilC0UGpWPVTAz5aCv0xvQtmPIrJzx4ZkoC+fo/j9CKPqrrAYm0Ey2sKc/ivx74hO3WcmQQeBGvtHU/53IGBCWLgLNV/r5LRUWoG6nwubc/NZF4RDRVaD7BDVbU1/fGIOqpt4AwiMY9aVfUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VFkQm2VfaDKoFxL/y92HNoiXl0KzTycc/VdkRUktsYs=;
 b=FeAENasML4psuvbyqQ9iAtFgibvdgjYU1NZPnoNoAsuc++evg2+9gQFeTp3bsmD/0S4Sth36Ik1NbJr/STW/xfaCQ/CkilatE/I3FNkux+170iDcWjG6dYDO1Q8zMInuCNELm85gjCauJ4OLsXuk2dl3uoiv0q9sj27VbKpBDv3ZiqJUCwLcuATifBD9qBVD5JVQd9Wl+kLQXdi975dZQ9C2SiQJCrwS07wmazfuIvZpYB3afxnZq8rAWurBs53g0KWCVYV0m40D22XJX0eSy/VliFYqZh8JXfmnK1HxpRFZzUlOV8ZZe8DYugfurN/QL4oJeQSYj3dW0wIfUbFJig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VFkQm2VfaDKoFxL/y92HNoiXl0KzTycc/VdkRUktsYs=;
 b=ksBVrkxr6x6T1IhiNDkDjy0AQjG7k+X8m7NTgDt17oLLbJshXUSQKJjyLu7V3CkQ+gqbsfTnNTzgKKWstK+7Scx0QpuaTKwAS3juks7kI2Xb703LaYe37HWcBnAchLdJ/9rLv4LwAYVz3u0V8ZFkhPxjJ28iAfJZasyTpoUC93o=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by GVXPR08MB10637.eurprd08.prod.outlook.com (2603:10a6:150:14e::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7181.17; Wed, 10 Jan
 2024 21:00:15 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::ef47:2c42:1ef6:fe5c]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::ef47:2c42:1ef6:fe5c%6]) with mapi id 15.20.7159.020; Wed, 10 Jan 2024
 21:00:15 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH V4] cairo: upgrade 1.16.0 -> 1.18.0
Thread-Topic: [OE-core] [PATCH V4] cairo: upgrade 1.16.0 -> 1.18.0
Thread-Index: AQHaOHs16g1/lzpGWkmBWZxSASJzCrDTeGEAgAAlX4CAAAFBAA==
Date: Wed, 10 Jan 2024 21:00:15 +0000
Message-ID: <BE8F66A5-CFDE-4CD7-8CE5-773191F4901B@arm.com>
References: <20231227040936.1063726-1-qiutt@fujitsu.com>
 <741C23EC-9225-4A31-94C7-D5FE92E39B08@arm.com>
 <CANNYZj8pBQG8aZfY3RYTT3i4-jWTPbvxBkH9Aw2Ci8-gBTJdjg@mail.gmail.com>
In-Reply-To: 
 <CANNYZj8pBQG8aZfY3RYTT3i4-jWTPbvxBkH9Aw2Ci8-gBTJdjg@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3774.300.61.1.2)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|GVXPR08MB10637:EE_|DB5PEPF00014B98:EE_|AS8PR08MB10026:EE_
X-MS-Office365-Filtering-Correlation-Id: f68042cf-f827-4f0d-5001-08dc121f2a6b
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 TLI0Y3zI71LZLKnZekDt7sFB2d3scNKd6q4Q4877L5vtSfjsZseYqNC1BPWG/XmNc0gB7pIxbTU11FYexOrdHuDSSGEnycQGKznKnGFo0OSAPXGZqeoNauezxT8w4CbBMN345YOCwW5S6tR9sPB68hwUKfoI6k6s1gpoPsrNQuxJtIAnziKz1o64y7jxzyTM11C4Wb4XWKJazx+XDraoBtvdVWrq0upwhAfjzyfdzjQ/bsXpzXQAtgk33kyWR94ibUInM16RNOzU3nWyLC6064X+G/J7CSOatdbu9He/SweeNI4fVF2910CZhcm/NqmLkW5eFDEdTHg8XJ92oZqKJwRmzR0lrMNJDx6/GgjtpJtH2jHMLabR/VXAZpoMWPM4hQeS/Vsxy0iCeXCSNcnoaKRXjHpAA9YK1aPWTrUDpnBc+fFImXJLhEodren89YAUT0Runo6G0J9gybOAQe1yMkV28I/U1SZdeSYcW1B9t8a0XkT1hSEI2Dq4yhgjRvH6G2BXM8Bz354s2dmS/vwQurCmW97AAiH6e6O1bDQauISd/vAMzjCYvfTMq0yXfcN7bzgm8Z297TnhxbTtOT9n32ItniXDtGwW5jXAhAJNOlACYQvaA1aaYtt6BQry3dWoyRiaGzlemIv4ch+EtY3jFQ==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(39860400002)(346002)(376002)(396003)(136003)(230922051799003)(64100799003)(1800799012)(451199024)(186009)(2616005)(26005)(6512007)(71200400001)(478600001)(53546011)(6506007)(83380400001)(5660300002)(2906002)(41300700001)(91956017)(76116006)(66946007)(8676002)(8936002)(6916009)(64756008)(6486002)(66476007)(316002)(66446008)(66556008)(4326008)(86362001)(122000001)(38100700002)(33656002)(38070700009)(36756003)(558084003)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <0979CAE71F85F845BC6B8B2ACA90B5D5@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR08MB10637
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB5PEPF00014B98.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	b007842b-31e1-480d-ea7f-08dc121f24fb
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	KcIbCI55kJU89meTz+Mh3+ayZsfR0CAyL0tfPNN8u85tqGPtInmrn6NU5MUqPJQMIf16mhO3041AkonT+tZvqCwxo48nV6GPzdBfXgmVKoZ5lmh69wi/WCBlzyr1K3uW/K6Kfn/CmiQwupC4TT5BGBCf2wYbnfLNNGXTRRd10lCZmXP1uw4pen8UJcU++7zf5cYrRAbsc2D4qrGAi90jZK27zc+0+8rvB8CVapNsTdPhkuyOp5HOFwFaTeIeM6dNtdTyVQsyHu6vLg91bRAH4eBtIr+2g2WcvRO4fKnbAO3hJzQBGvPONfr5iuinp3zsBZSjc2JDqgmTQF8w5wZGWgTAUNzmMtDWp3tMJHxaeCx1mHUDG3TsaoRW0KJ3GWq/txCX4kt8LXnW78xu7fovK4DaqJvDIZ0pJ44tUCpHC2GAc5QLpMSol4Q/sSSDrIEUjwXr9Q8n1tEfq3wTc3oiwZdDMRwuDui7MQ6PVcqQlGz9RlH/bjH2H3R6uXdfURnNPt2iJz6MycAfxrd2/n1mxfu/nMEdJOqHtSVTDfHxIdNb+SFP40FhF3VyMytAlRqdYT0QME61KI8hA7D4DyW3NbNog7oVC8sRQt5PBTB3RyoELeItfoOAyYeQ71iJK/FLbmNFUl+RJIn8T0f+X/yUV4TflzzwGgdZBq8NDPOWnDFxgq57C1t1P9oeWzaLXurN7M60nkAigj7WIuUbJC2kon9JFssHPMNKhlcyn0cESOU=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(376002)(136003)(346002)(396003)(39860400002)(230922051799003)(1800799012)(186009)(451199024)(82310400011)(64100799003)(36840700001)(40470700004)(46966006)(41300700001)(558084003)(83380400001)(53546011)(33656002)(40480700001)(47076005)(40460700003)(70586007)(70206006)(36756003)(2906002)(6512007)(336012)(81166007)(356005)(82740400003)(6506007)(2616005)(26005)(86362001)(36860700001)(8936002)(316002)(5660300002)(6862004)(8676002)(6486002)(478600001)(4326008);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jan 2024 21:00:24.4729
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f68042cf-f827-4f0d-5001-08dc121f2a6b
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5PEPF00014B98.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB10026
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Jan 2024 21:00:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193525

T24gMTAgSmFuIDIwMjQsIGF0IDIwOjU1LCBBbGV4YW5kZXIgS2FuYXZpbiA8YWxleC5rYW5hdmlu
QGdtYWlsLmNvbT4gd3JvdGU6DQo+IA0KPiBJIHRoaW5rIHlvdSBzaG91bGQgY2xhcmlmeS4gV2hh
dCB3aXAgY29tbWl0IGFuZCB3aG/igJlzIHRha2VuIGl0IGFuZCB3aGVyZT8NCg0KdjMgb253YXJk
cyBvZiB0aGUgY2Fpcm8gdXBncmFkZSBhcmUgfjk5JSBteSB1cGdyYWRlIHRvIHRoZSBiZXRhLg0K
DQpJ4oCZbSBqdXN0IGFib3V0IHRvIHBvc3QgYW5vdGhlciBpdGVyYXRpb24gd2hpY2ggaW5jb3Jw
b3JhdGVzIHlvdXIgZml4ZXMuDQoNClJvc3M=

