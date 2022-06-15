Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE17BC433EF
	for <webhook@archiver.kernel.org>; Wed, 15 Jun 2022 11:08:04 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.48])
 by mx.groups.io with SMTP id smtpd.web09.3235.1655291279194231553
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Jun 2022 04:08:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com
 header.s=selector2-armh-onmicrosoft-com header.b=avF0OSs4;
 spf=pass (domain: arm.com, ip: 40.107.21.48, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=a+JoUlQdO30b1nkRuzQDEQkZAUKlWWT747qSnjQMI3MMNmXXjGtkt6f82y86ETUN7uKLr+DQfqLMmkqMHZcWGnTYPOdI5TcJW5I9HiCjJ/OcKQy265Vlz+VDm5/s58+HKmM+rl8hFkZ118zlRadU+SbEePRjJTTz5UFvw5IjHOl0zofOXbKJ2VWqVeTBj4GDa1t9I/pOD9HlsxB+GPvGY78+ZNOIQG/CddXDrYQpOc3VCP0DcA7pCZe89pYN7Cl9A+D/HACICuC7pxWBSR0BBWLKri39Dq5rHxo8dTSGegZRNi+ZmkRRVo+9MqaeuEozGcKwnXhnaQp1dE1cUd6TUg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UysHqNSeQSjlE8EEo7kkKnAdUg4jTdhzuIkbtd3nPyg=;
 b=gMpIr2/jPQVbPPkn+Qjy6ArhhyMaey6KPZ8vez5m6xROPQtWyYnq1sB6ek4aiiy9xg/Dp65Pc5wulIAbhZNqNIKOGs5hU3ZOk5TNVYvsVJVhPv5TTb1i0LVJkrRVu+H8y4+o6/HywAiIhBxmyLkGDTltHpmB2evX7FNZkOTnpNgATnvTT9y8XS4k7HWKWJAaxco4v/SK5ZUSf13c4jbEFZNwFA00dD0KkAIFWVVE6fU5NMR5pIen1wkOgf32rZHLkxAicVpGx8eQUgpNcahcEWS9F0xVMSAFfoQjyQQYJctaXfKDA4fW3OuJB9Q6IkC2m3dYNyneXuQvixe23XxldQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UysHqNSeQSjlE8EEo7kkKnAdUg4jTdhzuIkbtd3nPyg=;
 b=avF0OSs42xEjRPDJKcC1jLLJFdUpx29orBvmVkupOabASWeGlvXDQpEUvniaEazc2iF8qYxvSNeIlkMrc9n5ZikErgO3eSkeC1OzqvClZYgMHWNRhyOqqXqEmwpr1etQBuugTqWT4oPI40N5FJKfxZYa/cz8XYZIXdEDb+x2Ewc=
Received: from AM3PR05CA0115.eurprd05.prod.outlook.com (2603:10a6:207:2::17)
 by AM9PR08MB6130.eurprd08.prod.outlook.com (2603:10a6:20b:2d8::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.13; Wed, 15 Jun
 2022 11:07:55 +0000
Received: from AM5EUR03FT015.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:207:2:cafe::2d) by AM3PR05CA0115.outlook.office365.com
 (2603:10a6:207:2::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.14 via Frontend
 Transport; Wed, 15 Jun 2022 11:07:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT015.mail.protection.outlook.com (10.152.16.132) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5353.14 via Frontend Transport; Wed, 15 Jun 2022 11:07:54 +0000
Received: ("Tessian outbound 1766a3bff204:v120");
 Wed, 15 Jun 2022 11:07:54 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: ba5b370a8729cc85
X-CR-MTA-TID: 64aa7808
Received: from f4650dea04b8.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 9C01B2C8-E9E5-4BED-99DC-7DA38B00BFCE.1;
	Wed, 15 Jun 2022 11:07:47 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 f4650dea04b8.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Wed, 15 Jun 2022 11:07:47 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h3xicjELdgNalJ73rkEx3N2ymICsAkk6P94CaRvyEfybn1c8G8KkdGNr7CwQjczUXhBVqyuiuqrmgrEYZHngUi97qE5EcnJriPBIOdJlBO8hZn8/RG/xUhSR9L/kSo+eOcHl/F7a9rk6m4nWjoX1ci2FJUCOPlYNcsNscpum0UDPCLTV80xPTWk4VC4tNwnj/SDVcuQkoM/J8xqT2dqXIoyK0CtufzrxsovsyxFeXdDQ0r7ab+CrTl5uu5xR3/KWBc/DhDF1sKuAfUecHXBilLKCHd65sjUBzCsm2biNvotTrpSTA7txi3VD6b6Pm6qMA4z8VHmy8pNx72ugK5JjoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UysHqNSeQSjlE8EEo7kkKnAdUg4jTdhzuIkbtd3nPyg=;
 b=KLbccb3x0fyfTjxrG74r/DE3EuSCU5EugigzopuE354EJdJuSX0joJ9c72Fm75/W4gZ17XS9r9yu3CR7YHsCnm0ipt1UYUNSX69/18GIFjMbtW3Z+EcP8pIxBXnQmn6d5s00RsT6nsc7Wp30H/1X2JqafooLlh/J8C0Nso5a5PBbGXoJ8img9kP8OQ0/yYkzr/lvqBDcPxjMQ4bei/0NVHT9HJEDDkyakT/GFP9CpzXmleH109ABHIuiXOnMQp5/D5W+M7aAbDYV4L8dZG280/J2QOmM8NzR586vzCnkWrs83vAT+jcxencieElYlpJCJipV7onTm0LHhwT7Fgt6aQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UysHqNSeQSjlE8EEo7kkKnAdUg4jTdhzuIkbtd3nPyg=;
 b=avF0OSs42xEjRPDJKcC1jLLJFdUpx29orBvmVkupOabASWeGlvXDQpEUvniaEazc2iF8qYxvSNeIlkMrc9n5ZikErgO3eSkeC1OzqvClZYgMHWNRhyOqqXqEmwpr1etQBuugTqWT4oPI40N5FJKfxZYa/cz8XYZIXdEDb+x2Ewc=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by VI1PR08MB3631.eurprd08.prod.outlook.com (2603:10a6:803:85::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.14; Wed, 15 Jun
 2022 11:07:45 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::5099:2a51:e4ef:7405]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::5099:2a51:e4ef:7405%3]) with mapi id 15.20.5353.014; Wed, 15 Jun 2022
 11:07:45 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "ptsneves@gmail.com" <ptsneves@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 1/3] insane.bbclass: Make do_qa_staging check
 shebangs
Thread-Topic: [OE-core] [PATCH 1/3] insane.bbclass: Make do_qa_staging check
 shebangs
Thread-Index: AQHYeb6lBtpJ2TtDnE+mtpxXTcqSiq1QXMqA
Date: Wed, 15 Jun 2022 11:07:45 +0000
Message-ID: <66A02BB7-DFB2-4BB0-819C-E0F18BA82628@arm.com>
References: <20220606155807.1414519-1-ptsneves@gmail.com>
In-Reply-To: <20220606155807.1414519-1-ptsneves@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3696.100.31)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 89a2e2bc-218b-49fb-696f-08da4ebf4c13
x-ms-traffictypediagnostic: 
	VI1PR08MB3631:EE_|AM5EUR03FT015:EE_|AM9PR08MB6130:EE_
X-Microsoft-Antispam-PRVS: 
	<AM9PR08MB6130E14EE3C5270990D17422E8AD9@AM9PR08MB6130.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 xl+R4HJAMw0xocF0uIzKx2vx1ifQxamAQnKUQBdmtmXFs/lMLiBiYzEV8qG0uv5wPzrZKDmSZJLahEe5XIGxxsjNMY/wTlcbCE4FXQM8m4/7Drl+KEPRuW1ohk2uIMaW7/98M8qqKB9WrjAwcND7Wzqo94Aduux8PUY0OwvwjzU93OSK8WASA247ZB+7JuRWzixFi+C++C/0UENipkWVe/Q9ngzPfqVlqJ6H34mGtFDjsclNsNwS9nAPcxndcx3FEhgWH5oCcZF7VIpyEviCot6+SOHnoQ1JaNC1HWJgl2fiX0lUiRvlhy9bTUsMiLcxbuMPDrry8elIhcqkaNOjHtH94K9tAFiBnHA67mk6KxWAIG4MHVUeZu3Rj+QgqC8ApogvQ5VZfn1vGFYk/Vo/juY4p8A3f0kpKI7f0colJN1NlstA1yWb04rQkqDHkHKh/qzHHpz90ysqLnnci7i4oqv0XMilj9s3xZduqzrWoi2kFLCOGblLWvMfnjnxJtijwyrqgFQrg0UU7wyWE+4DzZz3IWmaHnzvQZUvUlYHEtodNhGuE0hO0JqXQQTvsFFBHj20WCIG3dfGM9rh5I0FzuxXJav9go0UE/tj4VWf+NgfFqOBHF/9cRkDJ90ZsDBgBQJHVzvWaIPb0KdeKgc5YXzd2lTSCzUXLk0drE4HJHkhAcHLLxadRWUl4Dz2jDPOcN8r+xudBuaxgFK6HwUB4+jknxPSgDilsx3j9565d6oBIIPNdXvawn7fsk5twp7y
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(366004)(186003)(2906002)(91956017)(83380400001)(316002)(36756003)(38100700002)(26005)(6506007)(6512007)(6916009)(2616005)(508600001)(66446008)(8676002)(66946007)(76116006)(64756008)(5660300002)(66556008)(122000001)(8936002)(66476007)(4744005)(33656002)(71200400001)(4326008)(38070700005)(86362001)(6486002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <F3B22417A2026E429B77174385D7F3A4@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3631
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM5EUR03FT015.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	95f7cc63-346d-4f3c-f928-08da4ebf46a9
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	KS8sSCFB0CKu/kEZTKWG00W3TIaXplNvStDU17/nVS3fMFaWE1qMeFWJTMJ448pwVgAOmMmPrZQVc5YJdJ92OuT3A9/ho9rFGkF8u0kAPSOXnET/URNj8ZyrmK17/wBGCH8XMZ8oakJ1iwJKz+XQ2PVvVod1vSZS5gKGaBzPfivI3bvI8LMJu4KUgr+4KW/y81cZhxW8lH2OmpIAq9oFANsJ7hBEABlXrb1u/OEQk35DzfxYyPX+q35H5OnMtsJvOpEOkZowL/aw6O00VHz0WCgIGTxgeBU/GLOQF9f+mhTlXUf/yhOqPH40gcmCNzlH4sj2J52ZAT/0LZLduhKQ2/Zmkqv2wmBeh1Z54/vMC4DNzhia7JXk2JICFi1UnTvI1dHd0RGNnMrJwms5rTuM1PAaMTll+O4hEri9k8HdLQKXsS//hHTm+Crvg2yrLZP9MrW0AAjpf6NdDGiUrNDRfOaqze0DnXvwJESUd//+PgkzBA6n+o1ziF/ZK9rul6hQhrUFTwD44+TZKYI7MBIMIXZ0m24czx5uQ7OtYHDjSh9g5KelEkx44oZzI98RtMaGbF4th4hpRFTypy0vuJyo8moeAXQnHNWlqlhMDtkD58hGPwRUhX8GFBbMbIdec9AUe3zg4VyL0CXLxaGB89jNgmuGNQLWhAPY2Ptvp2ZZwA06vmN0SytZUzS1Q7s8zWry
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(46966006)(40470700004)(36840700001)(4744005)(2616005)(6486002)(2906002)(33656002)(36860700001)(186003)(36756003)(5660300002)(8676002)(82310400005)(8936002)(86362001)(47076005)(316002)(6862004)(6506007)(26005)(336012)(70586007)(356005)(70206006)(81166007)(6512007)(508600001)(83380400001)(4326008)(40460700003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jun 2022 11:07:54.7054
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 89a2e2bc-218b-49fb-696f-08da4ebf4c13
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM5EUR03FT015.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB6130
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Jun 2022 11:08:04 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166932

> +            if not skip_shebang_size:
> +                errors =3D {}
> +                package_qa_check_shebang_size(path, "", d, None, errors)
> +                for e in errors:
> +                    oe.qa.handle_error(e, errors[e], d)

Where is package_qa_check_shebang_size() defined?

Ross
IMPORTANT NOTICE: The contents of this email and any attachments are confid=
ential and may also be privileged. If you are not the intended recipient, p=
lease notify the sender immediately and do not disclose the contents to any=
 other person, use it for any purpose, or store or copy the information in =
any medium. Thank you.

