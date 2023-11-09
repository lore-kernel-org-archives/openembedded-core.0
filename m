Return-Path: <luca.fancellu@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4ED0FC4332F
	for <webhook@archiver.kernel.org>; Thu,  9 Nov 2023 12:23:55 +0000 (UTC)
Received: from EUR03-AM7-obe.outbound.protection.outlook.com (EUR03-AM7-obe.outbound.protection.outlook.com [40.107.105.83])
 by mx.groups.io with SMTP id smtpd.web10.119985.1699532625658216124
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Nov 2023 04:23:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=Jcs6n27/;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=Jcs6n27/;
 spf=pass (domain: arm.com, ip: 40.107.105.83, mailfrom: luca.fancellu@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=XToniQFGtpBAfDp6xG2w3LQqNkJOMKIuYi/ChrnYQe3BpFywuaID5hlEFtQFTXCALeZTs1BSI3tAc9aEvQW0WxESrJ+LR7gj0sCZkYRJvUf49QsVJtrWtRW2PvVMuygbh/lu+mxTui1spiovMsgBZHN0LMRp3MPCgmVQJnHGBcBQE914R/laPYCktWotri27h5ZYm5SxibHmAoLAPKV5MwVNMGV08z1mhfFXFkodXvqKIdsHE5gqFiUxUu1bX8FMeVjgGO526suepHLLlC8sUy+Eub9wzPcdi0SruDWbnBTxKy8JFiFLg3GU6DODL7lIQ9z36lFcMauRAfPGLiU8mA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DexlJszZO3kLgskkqFnm+2vuHJEWJlStQCff+VLBB1s=;
 b=JEiY92D8zYu8rOQz5oQrlh8wB+/gwUDKNRG6aAcTlRmPbIIX/ktP/d0QVD0kjS23yXB6tFtqPAr5S478rU14dJ1rDz5WDJXGhOR5/L+qESZ9wvR5Mj1RpnuzqiK/+SYiisqtddC3tQKHydbeOmwX/cFdu7udiaN5HLBTo/JKFpSZbMFrIdrGDQd4vI9ci0BygRGyJO3ULnaAWnmUoRXKKheHZArQclpQ516wEnaUjVTufeVb8scCABMdU9EXXYv0BxiwWh1/rMEW+h1eNWoCasP7lZsiZO4jqyqY3jlLEOZ2DSc1hUHMDRwhVf7PMva4R2AmAxByfj4TgGwzUpSStQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DexlJszZO3kLgskkqFnm+2vuHJEWJlStQCff+VLBB1s=;
 b=Jcs6n27/tbFkbLUGXMSkHYAh/H9Y039kjjn2Q2njAjm/gRH/d9C0aHd7GMfvkL2QzOa2hDxh9A65TOpBOrA4XuuZ368TelwJDEqthZ4/QG8gE4L7osoRImlfS8qurPkNSA+HMnTVZnbpwJr8Ypo5rc2TqYEFVXKHFDefWzExdlQ=
Received: from AS9PR06CA0171.eurprd06.prod.outlook.com (2603:10a6:20b:45c::29)
 by PAVPR08MB9113.eurprd08.prod.outlook.com (2603:10a6:102:32a::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.28; Thu, 9 Nov
 2023 12:23:42 +0000
Received: from AM1PEPF000252DD.eurprd07.prod.outlook.com
 (2603:10a6:20b:45c:cafe::85) by AS9PR06CA0171.outlook.office365.com
 (2603:10a6:20b:45c::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.18 via Frontend
 Transport; Thu, 9 Nov 2023 12:23:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM1PEPF000252DD.mail.protection.outlook.com (10.167.16.55) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6977.16 via Frontend Transport; Thu, 9 Nov 2023 12:23:41 +0000
Received: ("Tessian outbound 5d213238733f:v228"); Thu, 09 Nov 2023 12:23:41 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: e37c680bea6e9cf1
X-CR-MTA-TID: 64aa7808
Received: from b2f25102095b.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id CF93E2CB-4817-4EB8-B865-0B23FFDE6E5F.1;
	Thu, 09 Nov 2023 12:23:34 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id b2f25102095b.2
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 09 Nov 2023 12:23:33 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hSJ/FdtzgGQ1nIsNJxKaw6IxbvHpdaK3JO0BxLJnCagu+ot2tFGYiXo+POgp+NiVPL75lATLo+ZIFq++hPLZi/Pn3mZk4h7vkSdj2UV8SFkp/OWWxk0xfxpXO3Um3MMsPbUZEeNONF2yfwYt2Aq39gM5/8Do5YT4GybTkSsbOvkq4/Affe258wESAcGyVNsnhYyRfQB6ZOt3WZYX/6IT+l7d20n2RBZCwGut4OZij0opHUPSimA08zeV/LBnVK/kwFRmUQBRooruCthhLOMJ/BUGWy392SmBqP0EuwDy7Bvx5u6i4u+gVf5AVufGKcDJMsxcQpD2qlYjq//rariP6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DexlJszZO3kLgskkqFnm+2vuHJEWJlStQCff+VLBB1s=;
 b=V7pAqEKJHC+tcpFyuDPrwFgxljzK7rrTqWw1nXpgtb6vw6v6lNHKuBJ5nu/GxeMNF1QqIvD7r08eO19zTuTQjgNG5CGFO8cYv8ZDSIn8Yur+y8JmOi5Hlo0nNjF12xEdklYl8nqgyEwtqHq2Ie4uifsEx5LTcO6awjJwZyl8LyX4bZRG83221KENbO99+HMIkrnsi3Uzl1/gWyFHTZmHPRNVFxTbC1c+tTU5YvjtsnWb0/ZK7qr/YdREAluETNE5n5d10RbkSci6IVSM5bFmAWfIbQ0jrqpn1xKxhw0sxP/cpUmtAlmZu40ZqNHdly+70IuONH2aU8agFfaq2Ydz7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DexlJszZO3kLgskkqFnm+2vuHJEWJlStQCff+VLBB1s=;
 b=Jcs6n27/tbFkbLUGXMSkHYAh/H9Y039kjjn2Q2njAjm/gRH/d9C0aHd7GMfvkL2QzOa2hDxh9A65TOpBOrA4XuuZ368TelwJDEqthZ4/QG8gE4L7osoRImlfS8qurPkNSA+HMnTVZnbpwJr8Ypo5rc2TqYEFVXKHFDefWzExdlQ=
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com (2603:10a6:20b:8f::22)
 by DB9PR08MB7559.eurprd08.prod.outlook.com (2603:10a6:10:306::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.29; Thu, 9 Nov
 2023 12:23:30 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::76e6:a7e1:1592:866]) by AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::76e6:a7e1:1592:866%3]) with mapi id 15.20.6954.028; Thu, 9 Nov 2023
 12:23:30 +0000
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, Diego Sueiro
	<Diego.Sueiro@arm.com>, Rahul Singh <Rahul.Singh@arm.com>
Subject: Re: [OE-core] [PATCH] oeqa,ssh: Handle SSHCall timeout error code
Thread-Topic: [OE-core] [PATCH] oeqa,ssh: Handle SSHCall timeout error code
Thread-Index: AQHaEvAQ3v8mMnl2D0CgBNFPK7RcA7Bx6SuA
Date: Thu, 9 Nov 2023 12:23:30 +0000
Message-ID: <1FE7A701-D371-4B93-87CF-6B3A01C52AB8@arm.com>
References: <20231108112547.3599563-1-luca.fancellu@arm.com>
 <20231109093506c1313530@mail.local>
In-Reply-To: <20231109093506c1313530@mail.local>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3774.200.91.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	AM6PR08MB3749:EE_|DB9PR08MB7559:EE_|AM1PEPF000252DD:EE_|PAVPR08MB9113:EE_
X-MS-Office365-Filtering-Correlation-Id: 5f122e5b-9122-447d-cffb-08dbe11eb58e
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 77mF/dghzPVvYeEDAdvs5x2aszW7rW4L6/dDXgP0KT+FnKmzhdg5Kkk/9wlJFXCNWTrfZATPHP7EP0+m0GLyDN5nNAY8FZvWPX6syqNAgEsVAMmLTTDlEEmCO5ZRpRuwysbxhlzi8TmbzXaVARlfeEgT6JUegpw1d+zhun4FPEYIzaEdE9nWdrsJASFClDbEqKe28HXwdOPeevTR9SdmInT6RTMGpDRavi+G5oxBUkWr+grf3xz128Injgb0EXXMcEWFYvE+XW2A0rszfgRHiZYX3EIvFU0tcQtHenyFQIgAE1ZPe8aRjGrhwpu/Z+xWwFFlq01uF2tqgLoKQvp+PzTBn6PyQ/5ujvZTK/QF7I1rZrybZaGbVc58DvnpdpF+4LwM/7+Fgjn/v6Qp709ZzSmCmG4NchjVWBmHRCO31zX8ORTexlvYjVm71f9mvEHgGWhmM8Gkl0EFWM4nedLBVmhCs4gemVZadMqOtPW7ZBE3ASe+3qkIATxXHfpMvBQvFa5s6c3daLjjfUYU6Oj6b5Id4NijaejG23gKpfim6ugepQ9uqW15UdHANkMhSZjzQiabqGc0ZlhKn7SI3+CIvErnyC5DsMuixZfxiZg/NzG+UTG7enEtA6IZBSVVWlExmNxvTViIpLo3hYLL57dPcg==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3749.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(366004)(346002)(39860400002)(376002)(396003)(230922051799003)(186009)(451199024)(1800799009)(64100799003)(26005)(2906002)(122000001)(38070700009)(41300700001)(38100700002)(8936002)(478600001)(4326008)(71200400001)(8676002)(6486002)(966005)(86362001)(6506007)(66556008)(66946007)(66446008)(64756008)(6916009)(66476007)(33656002)(91956017)(5660300002)(6512007)(54906003)(2616005)(76116006)(316002)(36756003)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <5C1A7183C5C87C4B964DAD3349811EC8@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB7559
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM1PEPF000252DD.eurprd07.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	32a63887-696f-4960-307c-08dbe11eaee3
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	CDWJeSBa+Ig94KarTqqqKwizNN+bazxwj9FHiiaULw8HyxukzbR7WJZyhTWW3q3N13a8KGZcjKRGIJLPMP8gm8l1hkuhlwH6djMr9wvvcGoxPUC+KF55t822itQ5KdtWsEj89Gslzar1dwQroQ+kDBWIBHhYvTM8RMy5lSERyFqf5BhNtufm2aEb+S3FhtMjMf0+MwFbdP4WsqbdXJ6SCIUimG9ajmSgRzWC2tdBcu+6eKv8rH+dRUO1hEjfh3ph1KsskjTE9cm9lDHRIp6ZJH066fQfofzKjVntYSqjFjamIPBn2Va9cmCn91Q8dPpXw53znSCaJ9wzefTXSwzZ4FLxwHPUQGQjclrUmUp0s9OhaOq5ApYL6l/Nfie6jOWAcgQJqKVjmimsgRdhwlIg0ngnjbfbciVW3AAHIT9qx+umfi0PFmvheiPMzu6s0C5SKabwvA2kKFs6x2RnoZBhg5lg/nCTrHGkAgPlPwXXvhuHEWY6djQZ1NNf9PmGSB/I9klqqFtsJHn0duwzNnq+KXMiLxqdY2Yoz8YMJ0GYjq3sl2yjTgYQSddn8knV476royWStE96Ob1LIsUV8MqOt70RlxnbLRqRHoHvYhQm3asNfw0gLRRbJRUJjZxuyi6kdrYqW/aSbNL+Zo5JATg4Z5BfXSzbofEDgp9zbep+iwkk5oi/uK+LclQrPlMX6dL4tiq+kr0diOxCgWtIFDK46Mw6uCMxDefuUBR0+rznDfM=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(376002)(396003)(346002)(39860400002)(136003)(230922051799003)(451199024)(1800799009)(82310400011)(64100799003)(186009)(46966006)(40470700004)(36840700001)(478600001)(41300700001)(6512007)(966005)(6506007)(6486002)(47076005)(2616005)(8936002)(336012)(54906003)(8676002)(6862004)(2906002)(5660300002)(36860700001)(316002)(70586007)(70206006)(356005)(81166007)(4326008)(82740400003)(86362001)(26005)(40480700001)(36756003)(40460700003)(33656002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2023 12:23:41.3892
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f122e5b-9122-447d-cffb-08dbe11eb58e
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM1PEPF000252DD.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR08MB9113
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Nov 2023 12:23:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190383


>> +    except SSHCallTimeout:
>> +        # Version of openssh before 8.6_p1 returns error code 0 when ki=
lled by
>> +        # a signal, when the timeout occurs we will receive a 0 error c=
ode
>> +        # because the process is been terminated and it's wrong because=
 that
>> +        # value means success, but the process timed out.
>> +        # Afterwards, from version 8.6_p1 onwards, the returned code is=
 255.
>> +        # Fix this behaviour by checking the return code
>> +        if process.returncode =3D=3D 0:
>> +            process.returncode =3D 255
>=20
> This breaks most of our tests:
>=20
> https://autobuilder.yoctoproject.org/typhoon/#/builders/40/builds/8103/st=
eps/13/logs/stdio
> https://autobuilder.yoctoproject.org/typhoon/#/builders/76/builds/8054/st=
eps/21/logs/stdio
> https://autobuilder.yoctoproject.org/typhoon/#/builders/87/builds/6037/st=
eps/14/logs/stdio
> https://autobuilder.yoctoproject.org/typhoon/#/builders/72/builds/8106/st=
eps/15/logs/stdio
>=20
> and more...


Hi Alexandre,

Sorry about that, I will push a v2 that fixes the issues

Cheers,
Luca



