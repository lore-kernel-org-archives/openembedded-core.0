Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13E11C433FE
	for <webhook@archiver.kernel.org>; Wed, 12 Oct 2022 16:37:57 +0000 (UTC)
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (EUR03-DBA-obe.outbound.protection.outlook.com [40.107.104.53])
 by mx.groups.io with SMTP id smtpd.web10.121.1665592673961391410
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Oct 2022 09:37:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=8MYk4rdz;
 spf=pass (domain: arm.com, ip: 40.107.104.53, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=K+7HhTkIjleQDT1XtDIxVqNd7M+dNbqZbCJJ/TLMZ4+fZsX7gCv/EARbSxXdexR6Ia+wedi9DNAkuiSjuRlhSLNnatFkuE43dFrPvqVbAJKsUNuQYRIw31paC95XLqYYYzgnu06J6B+tOur9NOqAgv0cURF/lOGBmZHlUuP3mu0HNWGceGv0uRTN1akQFdMku3weMrmd9JakVZQCUSH+PEOlAeHdV7ebpaMSqjzT0MF3uc56AKELzCvrui5bO1YIe9C02htNhshNGZ5ot82ES89NA9VtpWWKuoNOHs00Pknrqi2kaKjTsymHmuqBw739D/S58J1NvVXNDjCC3B3hGA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PBJw5dNefYLrJAINvubWXha3Pc3+lX47BwtVPvfSEg8=;
 b=GO2zB7B7FrFwqGcKGl+QbiCehC6/aDMnBhd3KaPzQJct9CrFualHI7DDWnOCdoYUZYlDmvytwxf640plYDFMs2AAFvz1z9Lb0s0fEndAZBD++KJcBfiN3vT9oeegJDth5geZafo8zX/WH+yxR0CpgpumkNlTBYkCocO1dEk2569WRvI5cXFkvt6Bk7aK3dxRUNzSf79BaASosnZs9t8rZZpM4S8lh+pbWx4D2hAN+f6fqxT543Xt97+vUW8VbABMls5gnshsqN8Cvuv51+t8cCX+YfXf22MQANjHP49YF2GE7jJy5lZH0zYQKXmhoN9o566mqyHJSwSnEqm9is4KAw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PBJw5dNefYLrJAINvubWXha3Pc3+lX47BwtVPvfSEg8=;
 b=8MYk4rdzOKDOjqxyle3ncaxDc7m66+V404tdhbfDbzLof9eQ5Z4Po2T6cdDqNm+LoHK+T1IjD4HwPqka1HbgZF/Q/adPt1h4Xg8YOJOqe1Q3TcZtaQ9e7+Tr8Sth5iQnRYunC1lPcO/AdYwRMuaxVLwho9NNJaokIxHtz5r16VM=
Received: from DB8PR06CA0003.eurprd06.prod.outlook.com (2603:10a6:10:100::16)
 by GVXPR08MB7821.eurprd08.prod.outlook.com (2603:10a6:150:4::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5709.19; Wed, 12 Oct
 2022 16:37:50 +0000
Received: from DBAEUR03FT009.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:100:cafe::8b) by DB8PR06CA0003.outlook.office365.com
 (2603:10a6:10:100::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5709.21 via Frontend
 Transport; Wed, 12 Oct 2022 16:37:50 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT009.mail.protection.outlook.com (100.127.143.21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5709.10 via Frontend Transport; Wed, 12 Oct 2022 16:37:50 +0000
Received: ("Tessian outbound ce981123c49d:v128"); Wed, 12 Oct 2022 16:37:50 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: dacf523894406f29
X-CR-MTA-TID: 64aa7808
Received: from d3d65b0acee2.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 63E3B0FF-4E47-4A16-8E1D-514ED2CDBB9C.1;
	Wed, 12 Oct 2022 16:37:43 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id d3d65b0acee2.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Wed, 12 Oct 2022 16:37:43 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Nd1hK22iuhfUwIMdvaaf5lPvqemd5FyrU/lltanmAQmG8qJRTlecUqROX9iQMi1O5eqBTmQKujgamnD447U2vb2yLy8lxygNW99DpFfYMFSbcct7BH3oE4fCXRmT4unznLFlAKGwuMdss27G+z/Iuhh5xul9uNYi9SGhNd2qKkXrgQ6tBk5Gw/TC+wFT1NnGklgzfHqE+GtQVq3f+0FjhLbOBwNcBxvv83jrsovAYryxomwsi5DgT8494KKgNo7THHQNrxRMCKLVdZRsdCjKvgohJsLza3fOrbxcmawdejlEkFIy882foMlwPTAhWrR8TZip2Pa5TdrqXLIEnYIQEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PBJw5dNefYLrJAINvubWXha3Pc3+lX47BwtVPvfSEg8=;
 b=cyPsGWuknZ+HghELkjew9ug3Eq6LsLp9gePwykIPrGPWzxj1aHmCUej+gYgsCjXmCDW5O73qqEtuoMfFTDcRSXuMa0cV0cyLY1UaLXEeG9MCG/ZdEclYll047lduu+OQ3Z7DEQecEQXtsiQfowaXUZ0AfZrcWQTFgWLfr1MgIEiNVM64DCtJ2KYgDpQnfqhdsVDaPiUMHAusWZ6RDH8S9MJya+D6loDePME0QLvciO8dsahvmZVaBqnJyzQFv9nWIv3vCJe0faFPNrRSSTLKgthIGLhHloghQ6qrHwRxTU+y2GNcRanByGY/wlwfTXtYIqUoqy2n73S6j22OTHshaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PBJw5dNefYLrJAINvubWXha3Pc3+lX47BwtVPvfSEg8=;
 b=8MYk4rdzOKDOjqxyle3ncaxDc7m66+V404tdhbfDbzLof9eQ5Z4Po2T6cdDqNm+LoHK+T1IjD4HwPqka1HbgZF/Q/adPt1h4Xg8YOJOqe1Q3TcZtaQ9e7+Tr8Sth5iQnRYunC1lPcO/AdYwRMuaxVLwho9NNJaokIxHtz5r16VM=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by DB9PR08MB6652.eurprd08.prod.outlook.com (2603:10a6:10:2ab::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5709.19; Wed, 12 Oct
 2022 16:37:41 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7d2b:2570:9a99:a3d2]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7d2b:2570:9a99:a3d2%6]) with mapi id 15.20.5709.021; Wed, 12 Oct 2022
 16:37:41 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "kai.kang@windriver.com" <kai.kang@windriver.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH v3] mesa: only apply patch to fix ALWAYS_INLINE
 for native
Thread-Topic: [OE-core] [PATCH v3] mesa: only apply patch to fix ALWAYS_INLINE
 for native
Thread-Index: AQHY3gm0FOo7cT+vDUC8zrMRElFTPa4K9c8A
Date: Wed, 12 Oct 2022 16:37:41 +0000
Message-ID: <045E68AF-5D26-4045-9E3C-44D6451ED3C6@arm.com>
References: <171996618BFD121B.23184@lists.openembedded.org>
 <756d646f-6b68-804d-edcd-7933d2a66356@windriver.com>
In-Reply-To: <756d646f-6b68-804d-edcd-7933d2a66356@windriver.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3696.120.41.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|DB9PR08MB6652:EE_|DBAEUR03FT009:EE_|GVXPR08MB7821:EE_
X-MS-Office365-Filtering-Correlation-Id: 52ab196c-0760-476e-29d0-08daac701a35
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 P+rTGu6vaOejd+vJL54tqT06JkHdHkwT2XyNUvpxqzDy7aGJXNMf6ouYeoxyFsibwdmBUZjt07spPLNYXn0mJ4U0ukWUMeAtrCB0SurmLpJdRCqlz9rfu2QUKG1/jpHRvxZUDEbNBrFlbIfLrai1MRzN97o5KoiTI+U+FSD7GmKTfAfqswNC6hAGIrhviqQUc1BIo10VCh9kDbeCr7GLHPPCfyjMtbV1Woj7PAe18zVYwnoMQjMNNvi2nJJAN44AB0E2YwVB/wCDkN/Ac1m+caOUNJRBSD2g4FZJQn5MWf8NFKslk5aVktl6dpv1XlC3uyIk9tpNvLZHXgJLOpYF8aRX7pwhXh1xC6SOcQhKMIclqAIasqzlzhaRvJTbG7Y27TgrDpxUjDGbCYC9ErJ8GR9yPEVFZstiIUnmuNxooXyxhd2tOnaxevuUzDRLdG/Q95FbcaPZf99pSL8pg4WT4xmf9j2t/+GQgNCZFU2Q4h6sJTcjWOmalYKrzZNmtKSYJUC8UIKTFx1sNiJ9+M28eXyNufttwJl6lJuEzNcO/5XzrK/QbmWwWKo9T17KPCXQVDZ+S1fc45EQcKFr0CNbZNpt1OykUrBB4GZADlwtSbxHKo4ZGmisVF6OWo9+YcU1/SUdxJYrEH6nMCzQy1YzZN0Dl/gy1R0iRb42LmU7c6IfRZWtzr5Baguhnp3xQZf/Y23WvzB6V21PHxY9BOMv6PjFXi6jCwYgtNNAHO7KXuAVH1qI/z/0LL1T/y/sRyjyZtr3/oodgfUHuR26Honr9oYSdgdAmMIGGbwYt+YhLpdYbXfLRJ5d/nyg1u41Hc/HGD1DYu7e1O50iW5zBT6OdA==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(346002)(376002)(396003)(39860400002)(366004)(451199015)(6506007)(966005)(6486002)(71200400001)(316002)(33656002)(66446008)(91956017)(66946007)(66556008)(64756008)(76116006)(66476007)(6916009)(8676002)(4326008)(478600001)(41300700001)(26005)(5660300002)(6512007)(8936002)(86362001)(558084003)(2616005)(2906002)(186003)(36756003)(38100700002)(122000001)(38070700005)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <B9E3F0BD5BC12146AC168C05ACB2E988@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB6652
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DBAEUR03FT009.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	50c6bd75-9941-4a7b-8904-08daac7014e9
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	vH3NPIRaA/+OxgNMj3HkB6wZavZy4TdfrMfvMK5bqyEs2AnzVW7Bm/fUs30E2DvWd4g4/5UHCiIr6xfyJqQOdpkaH2mYCeSNnNnOGsVTEl4ITUde6NbDgNQqxZcL6s0R/6z+JBMRNmhNwPw1JL4iR2vvwNNeATqCsqVS1iNK4OuVb4bLKJbca7yuazKeoaCgaAVWgClmbhmEO1ukKqCPDOdHjMzVU2Uyjrqo+J9CTOOrMoEiGSKN85QooKB74d7Jv/d5Em5tN++0ASrEYfu9shb4SEGw4wdZYwWb8dpaBFtqod/uzzWy0KY121YiTU8yzYmq5uxDiTqzPFVrSvG02H6x22Io3MMO0G7PJmuaUbvjZkC3SZTPCaTU0WX+872K/4ZXpi37Fj0cOBfp4t5jZxQ2qynxyauZW8K5guZ4fHlIUqmM1WtTClaubRPNH0L21AQEtEFfj/94YIgFIwwlIGJ3kwwn+rXNt4Ck8/Vs57HklyF/tsvvbRa6VVwTlP/Z/KdO9wcmWIIjqd7eAsAmgoCRLLn3KPvTsva67KrcrPBoe4yo+1htvOMPeGzitDdRmooz1snMEBkwgP/kOwP79C/ARJAS2Li+s9spUQgq4rb1gNbZ3falxQ/rj79d5GuEzs6hq6b7Ffihqq5w79Wbaf2cOMECHnOFC2MrtXuDIPgukdVj65m5CPDHFAw7sSFMRBJUDP+2lCjmvx7fK1T/IK3NPp9lJQy9jJPWyTLhvy/1zEbVwUyd9aXx7b/4YmjMjhKFzH/agw/734ZVq5WdCZG7CT3KbF6P4xP4reiyZ4s=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(376002)(136003)(396003)(346002)(451199015)(40470700004)(46966006)(36840700001)(2616005)(186003)(336012)(47076005)(2906002)(81166007)(356005)(82740400003)(36860700001)(5660300002)(4326008)(82310400005)(6862004)(8936002)(40480700001)(40460700003)(41300700001)(6486002)(26005)(966005)(6512007)(6506007)(70206006)(70586007)(478600001)(8676002)(316002)(33656002)(36756003)(86362001)(558084003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2022 16:37:50.2196
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 52ab196c-0760-476e-29d0-08daac701a35
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DBAEUR03FT009.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR08MB7821
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 12 Oct 2022 16:37:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/171670

> Ping.

As per https://wiki.yoctoproject.org/wiki/Weekly_Status, master is frozen f=
or release and RP is on vacation, so patches are being review/accumulated b=
ut are not merging just yet.

Ross=

