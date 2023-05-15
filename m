Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96E18C7EE22
	for <webhook@archiver.kernel.org>; Mon, 15 May 2023 09:52:51 +0000 (UTC)
Received: from EUR02-VI1-obe.outbound.protection.outlook.com (EUR02-VI1-obe.outbound.protection.outlook.com [40.107.241.47])
 by mx.groups.io with SMTP id smtpd.web11.84314.1684144362593729148
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 May 2023 02:52:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=GiTRvvH5;
 spf=pass (domain: arm.com, ip: 40.107.241.47, mailfrom: ross.burton@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q8djAw+xpkEDNsGmitBPCzw8pjgiLB3uEDTUJHL3pAs=;
 b=GiTRvvH5wDhIHMNDJwV5I2Zx3Iv+bGO7P+zMDMVV8uqLZO+jkZ0uMuU4b+YwoKG4C/g19+z5+JHdOnFudEy71hKo78xNJp9FI3FELMEfGULG6nE9Okre8TIIx2v1y0NIT9OcDX/bJq81Zn1U4MsR17Gexcg1AezBhM1gM/9UVwY=
Received: from AS9PR05CA0156.eurprd05.prod.outlook.com (2603:10a6:20b:496::18)
 by DB9PR08MB6539.eurprd08.prod.outlook.com (2603:10a6:10:23f::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.30; Mon, 15 May
 2023 09:52:38 +0000
Received: from AM7EUR03FT053.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:496:cafe::e8) by AS9PR05CA0156.outlook.office365.com
 (2603:10a6:20b:496::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.30 via Frontend
 Transport; Mon, 15 May 2023 09:52:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT053.mail.protection.outlook.com (100.127.140.202) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6411.14 via Frontend Transport; Mon, 15 May 2023 09:52:38 +0000
Received: ("Tessian outbound 945aec65ec65:v136"); Mon, 15 May 2023 09:52:38 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 57b6c986cf7a50f4
X-CR-MTA-TID: 64aa7808
Received: from 82fd2fbee1bd.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 548A49A6-2BDC-4564-B5F3-EA9BE778038D.1;
	Mon, 15 May 2023 09:52:31 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 82fd2fbee1bd.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Mon, 15 May 2023 09:52:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i0ax4KfD4ekDXroknqOHcxrycwF/FVB1tzkd5OK2Db2kvv+bqhPlAZdqkrr2XOoQfHYy7hOLM4+JSZLq08eRXtUYK8TNje0Vwb0b3AR9Nlux8zR1RcWtq16cjEnXJuRhpnjJa4rbFqKNVi9SwaJEzP0Z3TiJjeULpJsrBYz8b9OmRNL/VFsIe6VQS4IuMx7J5lhxXjISFH6odOTtB7NUKnVrkFNtXEKB57CXHDcx94kPxZ/F3G4WCrVxH8ILLEtxSbp9OI8BAOdvU+82uxUkHbtwPToYczsX3MibvxdgU7ZTiFV3wDMPTJEZCiuv28q9yY1dypCfHKHOWnMFvoYTSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q8djAw+xpkEDNsGmitBPCzw8pjgiLB3uEDTUJHL3pAs=;
 b=g/KrYcyZuTSqiPyM6gE1Exj3Dvm7lNwQYwN+33FC5O98AD0GONIS/vLyIjAqdbf+mfU45yH6kKs1jAQgXM+8xBri1UJJqsOIAaI1QkuHXhvvhLZwi0JbxtPNZYlbRAP6jjUpDJFWJIVWCR3y8Q2S8AlMN5gDF7qX7EYTatoxEH3IMZKe+1mcq7vSFqBD5JuegaMn8Cj9SIwOsP5oOYshC797Jnjpiz2+3/TOFAWaliKouVa8c2YgftAC9+ZhqaUTmMI8a31AvWrjDq+nFHlc1lX017NlSomXKKhF+a8A8VMdPsQU4YxeDj8KQ5zSJbCDQBUH7tfMSNi0zRhNMMs1ug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q8djAw+xpkEDNsGmitBPCzw8pjgiLB3uEDTUJHL3pAs=;
 b=GiTRvvH5wDhIHMNDJwV5I2Zx3Iv+bGO7P+zMDMVV8uqLZO+jkZ0uMuU4b+YwoKG4C/g19+z5+JHdOnFudEy71hKo78xNJp9FI3FELMEfGULG6nE9Okre8TIIx2v1y0NIT9OcDX/bJq81Zn1U4MsR17Gexcg1AezBhM1gM/9UVwY=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by GV2PR08MB8122.eurprd08.prod.outlook.com (2603:10a6:150:a8::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.30; Mon, 15 May
 2023 09:52:28 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::eb3c:9b42:21c9:494e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::eb3c:9b42:21c9:494e%7]) with mapi id 15.20.6387.029; Mon, 15 May 2023
 09:52:28 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "throos@amazon.de" <throos@amazon.de>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] oeqa: adding selftest-hello and use it to speed
 up tests
Thread-Topic: [OE-core] [PATCH] oeqa: adding selftest-hello and use it to
 speed up tests
Thread-Index: AQHZhMqbhBN7zK2mIUeZFXiBQXvi8a9bHEiA
Date: Mon, 15 May 2023 09:52:28 +0000
Message-ID: <CD429124-DAE4-46E8-8E4B-1F05D4CEDC0C@arm.com>
References: <20230512120902.251469-1-throos@amazon.de>
In-Reply-To: <20230512120902.251469-1-throos@amazon.de>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3731.500.231)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|GV2PR08MB8122:EE_|AM7EUR03FT053:EE_|DB9PR08MB6539:EE_
X-MS-Office365-Filtering-Correlation-Id: 9aad00fc-18d0-4343-a549-08db552a1ddf
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 8ezMg7R8WH08fduEOG+eiRXXP+mC+CIBnqfKNnH0dp5t1e7okU2feX2CwYvh/u1aLienjyUaTLTVlvH9rQEMe+I2ud/izAGKkgSe5hx1kaLqa73ZzbJWAydbn4pM4kTRsY3keWpXxwuvBPIMIG1/2AmlmR91o6dooHX52CRW5fu6xAMxtaEeEKdQTeaCVM+/4oImQ7v9Ed3ZunFhIu8+5dHwT9U1/z+UanYwfDnko9FrzqNojU1hvWzngyA/gZsqMyiljcOv026wxt8JMGIx7D607WAjR19xhL53AUa13/oUvriOE0y9YwiP1oR9RITNB5gzH9C5B1W0wbgDGF+ZqwbSYof6I/BEwtV9vj7GQBmpC5gfbkQyNBTdF4uJEDN9NN0x/mY6g0iPjHad7qyU4W7jwn3kGUl6BYJS1bS0mVhk5eI/sP7Ibzwm5peQhgdRkU2ApszOeBwqxxbKIQ1EJ6JC+nOo4ipzlaJnzC+bzjZEJLuzTi47wzQ+ZB6z6K9qm8IBJpPkRYnhThLdfOUJoc9WPaiJ42J1MVtTMbDqXtSVm2JXisQ4uMpEpsols+YvUZ5bM1Na9QFbMTZSZ7qjl0J6gZL0WfX5UikErQBOOtJcdThcDazqx0GorU3OvJDHD0zWN2t26Q/M8Z6hn/77vQ==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(396003)(366004)(39860400002)(376002)(346002)(451199021)(64756008)(66476007)(66556008)(66946007)(66446008)(91956017)(76116006)(2616005)(6486002)(6512007)(26005)(6506007)(53546011)(478600001)(71200400001)(186003)(5660300002)(86362001)(8676002)(33656002)(558084003)(8936002)(36756003)(2906002)(38070700005)(4326008)(6916009)(316002)(41300700001)(122000001)(38100700002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <78FD90B39BD4204FB017F39CDD71A8FD@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB8122
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM7EUR03FT053.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	334a5900-319d-4799-bbc9-08db552a1815
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	4Atrd4zfDRRKBF+b6HsOE6c/44Kc8tjuTMS6/UofV9LfaY6UVxD9r2vkgL4qz7vsAekKNKS08DB/LUu+pOkbE64dNtRHO2OYXadYqqh92kka/H2jOvhmebIla3Kyh+BTaVfBkVSM/P2rHI5cHimLDjmjpDuv3xeNqtZ2CAgJcIZP/UkTvoTQDr5V8B9+mZB9Gu11udWYg8+zWIw18L+VcFn93lG7P8gR8Q6ZCyG1suDpkTe/QegHqJxx4faNe8MtsWYe/QbRAL41J9PIq7nS6pwfqnN6Fdyvz08ch5SIl9b9uS7dH5xObru2uVdr4m7W7wpGPC+ftabZ6gGTrLFjVSSpdTypMEuyeW4L9ZnUhfUdes/TmSMz0l6QIH/dbJTVht6uPbfze4ynoDnjm7mqbvv4QqebYliJCq7QQfwn9y2DzxWbJX+EWGHLIjGuNZcL6OCeRJcQOb3BxW9/OsIqtQyh5usV7HwdmFvMWPXk2LgeSS49rZcN4V3x4FePp263MOfD2vqQbxgyYsBP9ik98YgybfAmJKPNWUVKd52QkZbGNkU9afIVA6/83FCncHTj7xDQ9rLN3h+uNjHVUyo08hMSOiZD8VpTBlaryECpa0rUoAU1oOQr8ayMCD+Xl12zb3H/z3KonzLVuhTwipw+9FR+Exl/INuv/NZ/sHGf758xkAXUIVY1NYFyGtgiZ8E6cdgv4J+xGiL0g/oqFRiKpJfW7kx5iF7D6QCjzCGOklwxgYs/0VZNcpVMvgWjhzSr
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(376002)(346002)(136003)(39860400002)(396003)(451199021)(46966006)(40470700004)(36840700001)(82310400005)(36860700001)(47076005)(336012)(82740400003)(4326008)(356005)(36756003)(81166007)(41300700001)(558084003)(6512007)(26005)(6506007)(53546011)(6486002)(478600001)(40480700001)(316002)(33656002)(2616005)(70586007)(70206006)(8676002)(8936002)(6862004)(5660300002)(40460700003)(2906002)(86362001)(186003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2023 09:52:38.0615
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9aad00fc-18d0-4343-a549-08db552a1ddf
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM7EUR03FT053.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB6539
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 May 2023 09:52:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181240

On 12 May 2023, at 13:09, Thomas Roos via lists.openembedded.org <throos=3D=
amazon.de@lists.openembedded.org> wrote:
> +do_compile() {
> + ${CC} ${LDFLAGS} helloworld.c -o helloworld
> +}

Add CFLAGS too, please.
=20
Ros=

