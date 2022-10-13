Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5FEECC43217
	for <webhook@archiver.kernel.org>; Thu, 13 Oct 2022 10:36:32 +0000 (UTC)
Received: from EUR03-AM7-obe.outbound.protection.outlook.com (EUR03-AM7-obe.outbound.protection.outlook.com [40.107.105.50])
 by mx.groups.io with SMTP id smtpd.web09.6001.1665657387231519222
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Oct 2022 03:36:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=nMdVmRg9;
 spf=pass (domain: arm.com, ip: 40.107.105.50, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=j5ZDwdqwbY7VnHeVF2ddfikfl/Ce6LpRVpi5fDsvjox1ZOLXa2NM3mcJvEGrYP/zrFVhgGnBNU9AFafu/3nUk4LtmIIIsqtLz0O4r2IKsNl4PD0PfXlLMoNp4LTqZLMlhJsSQqxF8Ip9iZ58ZC1/yeOV3AXG3lvWKjuBzuNE1lIKGKXl5F+vDYPel3iRJaf2sZ30RFt0DEi+zfeNePWZMSRJX7epuUZJ5g9It7JJuYtmHcIoe7TF58ti5TuBrpL/t3dNkBHsqNO1GuEmt+E5NKAFid11gtSZ62ujDiO0em7FAanmEZQtjVWuAAhMCMRS4myc/M2Sis+vy7tAnJrRMQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BikBqXUHjGfH3oKF4vXhU0kcaRuboMAWqaPJHT7adqc=;
 b=lLMRVSv0o0cvble9oP7lkery9rcJXK73jolmfRK0uNpaEwSl+j9FXleV4RSuNSRuQSRoiLxuVNpF8N8jGtJ9/mVCTttgIYiv4ul282NZFdv3tpikowX8vQLRC714jIGG0evo27shHEs9CWblj7BeL8fWhT8TZqSQedvqOlnBaQYWoswX7XfuILjRxL8oFg4p1WIbMhL1eaXWklgsONoe1XPEONDY1NAGohx5+MBbeH6MSxunoKwD+GBBys7Y7fgw2SDA94VG5PIAPz0txSuxRBAED1l3KqpXV2w11N5n6mDvliKDcRK//kyG8uXpeCsFicpveOQndYnMkd/1xigouA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BikBqXUHjGfH3oKF4vXhU0kcaRuboMAWqaPJHT7adqc=;
 b=nMdVmRg9NLIJDlVywz6og0pmnCm0Uu3CdHHacMVkZye4WZg8iaEW4AF26rSeemwCsu4+4nhBjXTKjdR3iNgR96PKqvLfknjsEsjsiYk9maqjO5R9849M0yxBHtjeDnEVSL23ZlavVLKWMbnbmS7tx2r1OILd4+Finh/dprQwWHM=
Received: from AS8PR04CA0169.eurprd04.prod.outlook.com (2603:10a6:20b:331::24)
 by PA4PR08MB6126.eurprd08.prod.outlook.com (2603:10a6:102:ea::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.26; Thu, 13 Oct
 2022 10:36:23 +0000
Received: from VE1EUR03FT004.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:331:cafe::ae) by AS8PR04CA0169.outlook.office365.com
 (2603:10a6:20b:331::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.26 via Frontend
 Transport; Thu, 13 Oct 2022 10:36:23 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT004.mail.protection.outlook.com (10.152.18.106) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5709.10 via Frontend Transport; Thu, 13 Oct 2022 10:36:23 +0000
Received: ("Tessian outbound 7761be2ecf00:v128"); Thu, 13 Oct 2022 10:36:22 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 4e6016069ab4708c
X-CR-MTA-TID: 64aa7808
Received: from 166f8fe3cda0.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id C5416B31-0E88-4645-8549-8458457E83D2.1;
	Thu, 13 Oct 2022 10:36:15 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 166f8fe3cda0.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 13 Oct 2022 10:36:15 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ncIo+Euguy8AHMGWVANoYH5L5yRyj79TX5MaDMHT2et7os+BYW7eHbLCUPKJ5In2uAhMm14BH8X/L7iTbxVBKERNzZl+u38TEyVWXh170e5nP6FH9q44jtQp6q8jGC/oltn/Ld8gr0z+Tsc6B1kTnzDWVwiFm5/DS4y3+JrqUBPvJhE91+86Juvwba+FtkyxDvbtBA0HJXioCqn7MhG3LN7yvivjB1xLiDTF/80iWDveEmdiHT547ICo9sd03BRfrt0yVj/eBWvZeRSV4+SwR4G21+8uSOa61pNkqTWsZu28OoEDtEXXdYo4knwvXUQJQr4TEgr0kStsMqyCpOheFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BikBqXUHjGfH3oKF4vXhU0kcaRuboMAWqaPJHT7adqc=;
 b=CWL31SbxY8aMPl7+wTRHC92HBIVVUqbeBeB3fospIGewXc8r6P5E+mb8ofkKdTrBL//3wGVpbFc4WIVTD9tYHQVqEhi9kpfFJU0Cy2aDVBaPgOaBcUKvy19kbzaPwXUx0G7xPkwVRb9FuMm05lHZ7UPS56DfptNVzK9j9i0fwD+eniY5UXq7DXObiqsLwEnDby+jeoWLL2hUYtvLevIFHqmjyF9+sTJTPhbbro4ZLvpkjpEa+ZKkLOXnUrNPICRrEMOWzyo+GJxmam/5gck8hnzmAhOlM0mIrfQxxvHNWxyj6lsjfSLfztYdObLwR1bn8c6mK6jPkcP+zhAHr9vt0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BikBqXUHjGfH3oKF4vXhU0kcaRuboMAWqaPJHT7adqc=;
 b=nMdVmRg9NLIJDlVywz6og0pmnCm0Uu3CdHHacMVkZye4WZg8iaEW4AF26rSeemwCsu4+4nhBjXTKjdR3iNgR96PKqvLfknjsEsjsiYk9maqjO5R9849M0yxBHtjeDnEVSL23ZlavVLKWMbnbmS7tx2r1OILd4+Finh/dprQwWHM=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by AM8PR08MB5586.eurprd08.prod.outlook.com (2603:10a6:20b:1d6::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.26; Thu, 13 Oct
 2022 10:36:13 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7d2b:2570:9a99:a3d2]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7d2b:2570:9a99:a3d2%6]) with mapi id 15.20.5709.021; Thu, 13 Oct 2022
 10:36:13 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Khem Raj <raj.khem@gmail.com>
CC: "kai.kang@windriver.com" <kai.kang@windriver.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH v3] mesa: only apply patch to fix ALWAYS_INLINE
 for native
Thread-Topic: [OE-core] [PATCH v3] mesa: only apply patch to fix ALWAYS_INLINE
 for native
Thread-Index: AQHY3gm0FOo7cT+vDUC8zrMRElFTPa4K9c8AgABGzoCAAOaJAA==
Date: Thu, 13 Oct 2022 10:36:13 +0000
Message-ID: <48F9F377-B4F3-4554-9F22-03C1B1F5E665@arm.com>
References: <171996618BFD121B.23184@lists.openembedded.org>
 <756d646f-6b68-804d-edcd-7933d2a66356@windriver.com>
 <045E68AF-5D26-4045-9E3C-44D6451ED3C6@arm.com>
 <CAMKF1sqpXZ8_9mzNY3vjOStRdUNq8D20TwPC7YRBtDKAV=psjg@mail.gmail.com>
In-Reply-To: 
 <CAMKF1sqpXZ8_9mzNY3vjOStRdUNq8D20TwPC7YRBtDKAV=psjg@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3696.120.41.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|AM8PR08MB5586:EE_|VE1EUR03FT004:EE_|PA4PR08MB6126:EE_
X-MS-Office365-Filtering-Correlation-Id: aacbeb77-6020-43bc-aa0c-08daad06c629
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 FussjXhgfNfJGCkNTQCDXjCFRNswfUDaV53sANmp0NwDbUUtTRw9LX7qf7NLheKrrXrJnOxQGmFi//8Knhy7/IZiN0I1yIF9EVtSEOaL0ZJOcT+faGLe7KbShgfzUHu3wEFcZAKqSCTp3zk0PmpeLStPQbFZgWvi0PJUr6e/mouhe7lrpq2MHtahqX2833vEhf6Ux3CxGymkyv550F+6KBqQQX+7RVW7Pi0Z9u94UYn6qRO2gz8UkhaJwjCLv/1IvvpwV7wqhdf+4O2vmCyZGaq65MrOVMdvrprLjrhirJ9sFeUsgyURs8ltdLAVO6v9se3oG0gbVyA2ZJve0XvOI7rZk8Njp0Bp8SjPWJq87C7VO93Pe6KVDYDN0GmPwYCU+MPlmV4N2o8jegNHHKLlYxVW36qmeZEDEf6w+LxWsLWWnpg/20qieWU26xecaAKUKq/TNjEUOfnzWjdTB2DNaCeW0zxoE8FrPUJgSUNLV8UcmJcLjqupx00WsiWqND4xyvi6Lvu2WRom7HCgZkieCMm4DLQOOdsK8t6o2988I1FtS9ffFwWUJ5Pa06Oc2RuPfBZ3NN9zsYP1OinRvm/paoD85I7H/t8jgF/sgb/vGWEGKPNq1nb5w+BDWVVenooAquIjK66Cna8kk2LLT1mD/KtBpLeU9+oz04nfcHPF5Ch1+54pYwdIhGfEnjTnXs/B+wQ4jUS4WFuN+GPxiHorXs7lN+DQ5YyIJ7RDNS9hCW1YPTdZwsfYJvSQZWLxEIITlIsbMB+bvZGt+qV3ggUW1MrPoW9hR3R9Pgk0mMePmzboU9JRBSgU/wbLGi2pdNpK
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(396003)(346002)(366004)(376002)(39860400002)(451199015)(478600001)(71200400001)(122000001)(38070700005)(966005)(6486002)(86362001)(54906003)(41300700001)(6916009)(38100700002)(36756003)(66476007)(66446008)(76116006)(91956017)(66556008)(66946007)(8676002)(4744005)(4326008)(64756008)(6506007)(26005)(53546011)(316002)(186003)(2616005)(2906002)(8936002)(6512007)(5660300002)(33656002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <EFA625C4899B094987E24FF75F08228C@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB5586
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 VE1EUR03FT004.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	62b9ab0f-74ee-4e0a-234d-08daad06c07a
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	5QxiHJ1JIwn2QMEHZQDFWhD2LNZ0QO6ddqAiUBJwtPSCod6HQDTnYvle24D8mr3kHwY2yhey/PpKngBQ0g3nN9pk+2UQaaeLby8dIZuo7t4zrECN+R+zS5cChtnrDHZnwCUu4xKRwZnzmEYerH8ZEFAzWnDIn+55McQo6QNO6PQY/w3coSQnHQ/OdpjnL+/xkS+eVvDyTfHcGSv3h1HYo+UXcFT7vp0FAUSY0lrs8DignqvBqmk0KsrbBJHKDaRlJ4712GJyKoR3Z0GuPaoiAu8K95hGptci2Q/qEr2/wS51lUPy0Q6KctrQ2H3J18zkpEniPzcdRanKYYtSmQFLPwOICtoe1SSSYOJM/1HDnPD5OPlTmq0B7hTQeUbYF/aKjI9EHgXZQySYMlVDnUuS8nHNS3PtsuFD1evk7jrhhlxXpYHQSH12jo4w9sZGUCKBwi1TZ8ZT98Gzm8kbXhgWEVlh/a3358qXdMeRdpofiKXrvERhQcMFSno8ECHIYx2ocuKJ22Eq8jjz7zLQZ5XrcY09U7TQgwr8yAktdEuHGkdLFkEhvj+V4uY0kkDlH3hM6tbqDHjrFcNBp5ip/ujREJVR6BJGY2k2Y0x9/klHngXKFSJwXoMI1VNac/meVoiWj5Gq5OFJWfIZwyb83KHPPoRFzxgZ8DT/iU7v57O9pMebFKuKMLjNEJJ8dAqkIsCEiAjnF3n6TATHZ6R0QsSdJgdh6m7oXOsB55/AdeuIoKe3APBFSruril5XagU6p+8rVL7pKUYQ2gJRgbhKwyoA7MRUCNwRBGd3RL8cUXqdhbg=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(136003)(346002)(376002)(39860400002)(396003)(451199015)(46966006)(40470700004)(36840700001)(4744005)(82740400003)(81166007)(356005)(41300700001)(2906002)(5660300002)(36860700001)(40480700001)(6512007)(26005)(8676002)(70206006)(70586007)(4326008)(2616005)(47076005)(8936002)(6862004)(82310400005)(54906003)(966005)(6486002)(53546011)(6506007)(478600001)(86362001)(33656002)(36756003)(186003)(336012)(316002)(40460700003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2022 10:36:23.1124
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: aacbeb77-6020-43bc-aa0c-08daad06c629
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	VE1EUR03FT004.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB6126
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 13 Oct 2022 10:36:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/171699

T24gMTIgT2N0IDIwMjIsIGF0IDIxOjUxLCBLaGVtIFJhaiB2aWEgbGlzdHMub3BlbmVtYmVkZGVk
Lm9yZyA8cmFqLmtoZW09Z21haWwuY29tQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+IHdyb3RlOg0K
PiBBcyBwZXIgaHR0cHM6Ly93aWtpLnlvY3RvcHJvamVjdC5vcmcvd2lraS9XZWVrbHlfU3RhdHVz
LCBtYXN0ZXIgaXMgZnJvemVuIGZvciByZWxlYXNlIGFuZCBSUCBpcyBvbiB2YWNhdGlvbiwgc28g
cGF0Y2hlcyBhcmUgYmVpbmcgcmV2aWV3L2FjY3VtdWxhdGVkIGJ1dCBhcmUgbm90IG1lcmdpbmcg
anVzdCB5ZXQuDQo+IA0KPiBDYW4gd2UgcHVibGlzaCB0aGUgc3RhZ2luZyBicmFuY2ggc29tZXdo
ZXJlIG9uIHBva3ktY29udHJpYiBvciBvZS1jb3JlLWNvbnRyaWIgDQoNClRoZXJlIGFyZSBhIGZl
dy4NCg0KTXkgdXN1YWwgc3RhZ2luZyBicmFuY2ggaXMgcm9zcy9tdXQgb24gcG9reS1jb250cmli
LiAgSXTigJlzIGEgYml0IG9mIGEgbWVzcyB1c3VhbGx5Li4uDQoNCkFsZXggYW5kIEx1Y2EgYXJl
IHZlcnkgZWZmaWNpZW50IGF0IHN3ZWVwaW5nIHRoZSBsaXN0cyBhbmQgZG9pbmcgYnVpbGRzLiBU
aGVpciBzdGFnaW5nIGJyYW5jaGVzIGFyZSBvbiBvcGVuZW1iZWRkZWQtY29yZS1jb250cmliOiAg
YWJlbGxvbmkvbWFzdGVyLW5leHQgYW5kICBsdWNhY2VyZXNvbGkvbWFzdGVyLW5leHQgcmVzcGVj
dGl2ZWx5Lg0KDQpSb3Nz

