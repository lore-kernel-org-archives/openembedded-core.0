Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 888B4EB64D9
	for <webhook@archiver.kernel.org>; Thu, 15 Jun 2023 08:14:49 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.67])
 by mx.groups.io with SMTP id smtpd.web10.13144.1686816881766169395
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Jun 2023 01:14:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=1CJvYdFn;
 spf=pass (domain: arm.com, ip: 40.107.20.67, mailfrom: ross.burton@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pg9Cq38nbgwHZ/1cKpmQpQjaIVmL51k4EFC0+ZNJZFg=;
 b=1CJvYdFndqWNHES6/Msvnf8pdAGeWF8/bLaf4enwpwqjxSNRBeXwITkwLgczS5IYWdyyGUSiWrvesaK4SxY6jB4OUuCq7+kxh/eZu4SbF4EnPFdxPpao5rVEq/M3g3GhXpTCgQdx2ht1KrLpPPJFQXwedM2MuvfsmEwt8HNRqvY=
Received: from DB6PR07CA0187.eurprd07.prod.outlook.com (2603:10a6:6:42::17) by
 AS8PR08MB8369.eurprd08.prod.outlook.com (2603:10a6:20b:56c::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.38; Thu, 15 Jun
 2023 08:14:37 +0000
Received: from DBAEUR03FT045.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:6:42:cafe::e) by DB6PR07CA0187.outlook.office365.com
 (2603:10a6:6:42::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.25 via Frontend
 Transport; Thu, 15 Jun 2023 08:14:36 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT045.mail.protection.outlook.com (100.127.142.142) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6500.25 via Frontend Transport; Thu, 15 Jun 2023 08:14:36 +0000
Received: ("Tessian outbound 3a01b65b5aad:v136"); Thu, 15 Jun 2023 08:14:36 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 59989f82018c6dc8
X-CR-MTA-TID: 64aa7808
Received: from 840665cbfdf6.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 8129180D-00CA-40F9-BA79-795C4797E9F3.1;
	Thu, 15 Jun 2023 08:14:28 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 840665cbfdf6.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 15 Jun 2023 08:14:28 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YsPJBuqcMkEgLDK8ymKUBwC0tMZqQ9kisdqsf41Q1nduSbHZ7NzitC8c9TL65+YwR+y6FigTVfL1p6oxUM4a3ogupIKun3nHfZLuHUdZHFGpihDRo+0HU/aGpQLfeun8gybip/NFNu/svRUAWS5QFW66UojZTvPJO1O2kim84NMPpm8VXR+fyE/ksNjH9fhURMNB/5SucdjyFmKmgM3tTKQEFASjg+aUsjBefdG5/63Royyx4FoU9u8SRX5N3vhl5BhgSil70+dHa3WAidZe5gte8Qr1LUs5ZXrLVC4qRVCvwMVivFXUkIAW2KJm4BvvmjSaFmTy5Mwrnw7oReWT9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pg9Cq38nbgwHZ/1cKpmQpQjaIVmL51k4EFC0+ZNJZFg=;
 b=AVFEdedXqbsHrKEQ4bjYN7wph5MXJGepJNhDSnXy7IraAFi8r87eVGVVBRmURDCsEVKv7wuvuK63LrNgIJHP8OVdMNcKKiYsisx+vHU8NDuGNFcdXwfzJ3ColvZ4jIY32LF1X8OfsoSqROw4nobGiU4BuHoxI1n53tzlzHmUrZMjTYmVNQonVbD+3CAQfrnQDXMilhk8w8J2kdHtQbQhZRaDD9mdx9IbMNHS6KYzbxkQ/B/rDbkRMcbMjQj51TOPMEOVPbHj7RAusJWDWAM+8a5Gpj70KtGbmLSLm0moQEHqz3K9ukKGXMGWadBvEiYmgmyeBntnLA+nZCO5BghW5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pg9Cq38nbgwHZ/1cKpmQpQjaIVmL51k4EFC0+ZNJZFg=;
 b=1CJvYdFndqWNHES6/Msvnf8pdAGeWF8/bLaf4enwpwqjxSNRBeXwITkwLgczS5IYWdyyGUSiWrvesaK4SxY6jB4OUuCq7+kxh/eZu4SbF4EnPFdxPpao5rVEq/M3g3GhXpTCgQdx2ht1KrLpPPJFQXwedM2MuvfsmEwt8HNRqvY=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by PAVPR08MB9092.eurprd08.prod.outlook.com (2603:10a6:102:32a::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.25; Thu, 15 Jun
 2023 08:14:26 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::eb3c:9b42:21c9:494e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::eb3c:9b42:21c9:494e%7]) with mapi id 15.20.6455.045; Thu, 15 Jun 2023
 08:14:26 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "alex.kanavin@gmail.com" <alex.kanavin@gmail.com>
CC: OE-core <openembedded-core@lists.openembedded.org>, Alexander Kanavin
	<alex@linutronix.de>
Subject: Re: [OE-core] [PATCH 14/55] coreutils: upgrade 9.1 -> 9.3
Thread-Topic: [OE-core] [PATCH 14/55] coreutils: upgrade 9.1 -> 9.3
Thread-Index: AQHZnqL7Pssf2YuL0EKPY9CNFBR/+K+LhXoA
Date: Thu, 15 Jun 2023 08:14:26 +0000
Message-ID: <0BBA64C7-D551-4FA1-866A-C3CFCB3715E8@arm.com>
References: <20230614092918.4065570-1-alex@linutronix.de>
 <20230614092918.4065570-14-alex@linutronix.de>
In-Reply-To: <20230614092918.4065570-14-alex@linutronix.de>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3731.600.7)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|PAVPR08MB9092:EE_|DBAEUR03FT045:EE_|AS8PR08MB8369:EE_
X-MS-Office365-Filtering-Correlation-Id: 8d85e93d-2cc4-474b-7291-08db6d788ec8
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 NOPHLpfPrH2lTcuou15sVw5Yq99mfbq+sO/wNTTDe8Vtx/L/p4XeyvZFe1GcNzsXrbW+Ij4x5ldWwvIQ6OXmjiHYZk7r/RWhOulXBzvrMFsAPSAGv74ZwdyVHu4WrLSW8MXE2E5zDKrOPOH88RApUnftTSP6fgoIzFsLu6QgaMNMvtXqNtDdDa4L/tHXGXh5AqHimRcty8PNLuE5a2SyCAUTLUryaeHf13/o5AgKmU5kC2qO8xHvlDLp/mNTJ1oFhaUWMlRUwzh7LVVUoHlShlcmbcys3rP0LisedyNA+gODoK0mRqtZ3/xWd2l0hHwgNncppn7hgiKSo/wBRE0cj4umgS6uoBLKQYyDUqrE4QPi6z1eUHlciUDBk+FPZZh5+5LxBwdrNxdIc4CDwANawguOhYiC1GTThCY5wRo3jJ9oH4xYwLaUbUSg6cMT3wEL/EeWDmR6z+zds9hnHrZSIjUoaxyVlU+D1dD9iACrcEdSsbVo8IunnI3qrM0VP/kW353TvUtgocp58LoZNzmPdJppjjio6V2gFOpfiKXpUuLqTi9jVlSucRQaSSRWG8N6OfF1BPhPpPUQmt2pxkLDIriArNCIsopIo7iBQy/UouYzzc6XQaup0COdWBAscYlGTfjLvzib4c8mpvgrNPtXJA==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(39860400002)(346002)(366004)(396003)(376002)(451199021)(5660300002)(38100700002)(122000001)(2616005)(6506007)(83380400001)(186003)(2906002)(26005)(6512007)(38070700005)(478600001)(66446008)(64756008)(66556008)(6916009)(66946007)(66476007)(558084003)(316002)(33656002)(71200400001)(8936002)(6486002)(8676002)(41300700001)(86362001)(36756003)(76116006)(91956017)(4326008)(54906003)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <1A3F35D1A841034E945A9A77E55A5261@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR08MB9092
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DBAEUR03FT045.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	420fa9ac-344f-43ab-be3b-08db6d7888f8
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	NS0UsJWbGLPDeOVuDVWDE+BXdhGR9Nw+nQho+P8YKda9NUZ8o6mgzcgjy1YMjD/0/4yryJvf0cIa5oRu827zJzBg9cEqdVTCivNN5GDZlNddBxgtnUwNIEF69FKb3QFft9h0AmXo1J4qWayThrJoUyNI3xre+/4Qkz4tmdC/+we3gQg/BQljew8s+0MqrdMFjxtKkZXMSHBRh4x1JKw0YIx9P3ESP2lMOZbYen3vYNWgVvT+2pY2hLW/U5ysHKLLxyeQU2JzzlcV09zCBbtNKZKDzBw+woAuzlJ2qWLdQ7wtHHhDISeU+JpYMJdgUgcLLHFeSEGhJLApv1M4Lo3jPDEhcEysq+tJgbiSsj9oUYfQVp4D0sBs/kZYp1rTE5qfkrzusaqzFolyk6/0vRi9SrObjfB/X6z8m37dD1WZsPmW3zcWwDYqq9GyAWeI9AS2SVN2tKBAr1ySqATd4kTHv5RJmmTt6NqKLrV9PrRauMfOcSHcC2Wygz6WrbZSLvl2A70iZ1TqKmminU0k4v7Ua02Lp+OFDZp0VsLXXB4qj6itZjVFKSqlWLAvY4LbFJ7q0JfsNPRjJ5jycj4CtoYnZ4uN4j+fND3UFVqW5ZGNRPsvLaq4pOOrM1fYkm/p8l+9R8Uuktzvs5i5tOvlRdeFFN3yOXMe4nUwmpdA6VmbefLB9LO42+24eCZyvxF2WJxQ8ZJ52/0O+rWN9m3wNPYq0ocNCvWx9uc3TptlxbS9Qe/zfVgcFWCjoJjlpC3uHvnx
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(396003)(346002)(376002)(136003)(39860400002)(451199021)(40470700004)(36840700001)(46966006)(41300700001)(33656002)(6486002)(336012)(40460700003)(316002)(36860700001)(86362001)(2616005)(6506007)(6512007)(82310400005)(26005)(47076005)(186003)(83380400001)(107886003)(558084003)(2906002)(356005)(81166007)(40480700001)(82740400003)(8936002)(5660300002)(36756003)(8676002)(6862004)(70586007)(70206006)(478600001)(54906003)(4326008);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jun 2023 08:14:36.1905
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d85e93d-2cc4-474b-7291-08db6d788ec8
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DBAEUR03FT045.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB8369
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Jun 2023 08:14:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182836

With this upgrade I get:

| checking whether MB_CUR_MAX is correct... configure: error: in `/yocto/ro=
ss/build/tmp/work/cortexa57-poky-linux/coreutils/9.3-r0/build':
| configure: error: cannot run test program while cross compiling

Ross=

