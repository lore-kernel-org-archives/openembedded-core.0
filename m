Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03BB8EB64DA
	for <webhook@archiver.kernel.org>; Wed,  5 Jul 2023 11:08:55 +0000 (UTC)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (EUR04-DB3-obe.outbound.protection.outlook.com [40.107.6.74])
 by mx.groups.io with SMTP id smtpd.web10.14159.1688555327250903764
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Jul 2023 04:08:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=EXcqToph;
 spf=pass (domain: arm.com, ip: 40.107.6.74, mailfrom: ross.burton@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oj7QFbj++RTO2NM11NrRUDC69MO8pxLYo0n7t8x/qW8=;
 b=EXcqTophc7PMxYtv0Q0Kqu0N6BOYf6MRQmgfUk8UwhgqHaOD7wKL+XhQk9+jSwHX/T0/de9yvLC6hqfI7bGMlmda8C1FYf4Ke4ZjddaYpBui3BGzXIz67hQhHYdsn4tj/W4oamA1Ko4DTKd/by61T5DutkR5jXgCVEQDoE6q2HM=
Received: from DUZPR01CA0004.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:3c3::20) by AS8PR08MB6215.eurprd08.prod.outlook.com
 (2603:10a6:20b:291::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.17; Wed, 5 Jul
 2023 11:08:43 +0000
Received: from DBAEUR03FT035.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:3c3:cafe::2c) by DUZPR01CA0004.outlook.office365.com
 (2603:10a6:10:3c3::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6544.30 via Frontend
 Transport; Wed, 5 Jul 2023 11:08:43 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT035.mail.protection.outlook.com (100.127.142.136) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6565.22 via Frontend Transport; Wed, 5 Jul 2023 11:08:43 +0000
Received: ("Tessian outbound 52217515e112:v142"); Wed, 05 Jul 2023 11:08:43 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 30f4f250db192e25
X-CR-MTA-TID: 64aa7808
Received: from abd29d1e4168.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 825B53E9-4306-4C11-831D-83F5CF8FB27C.1;
	Wed, 05 Jul 2023 11:08:36 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id abd29d1e4168.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Wed, 05 Jul 2023 11:08:36 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ao+DefLkWjZuZemTXqulw4gg3k/yWE5oGO/SmzZ1d1XY1f+LYBw0nwolTvXENaniYhEkruM/1n/PoiumAeYyOJLm0clMQZJroQkjA/9B5kyDfn65IEHZowcNlZmVx8mOy9VlXQ6m0Y3W+N8BtTs8+ogGCgvSYCjJDyTuYoyQbhkafTcyE6XmJW2wGVoYDZffgdxTdoWdktCXjUMyCOVEm+xsYMQgyw1lVFRcHqlhx4uSYYtHvvKUQkFJc/UeKFdbu9LB0UUJc9hDeDvXVRGul8b4b8bLAcWBfDyfcuIROjTQXrL8T81VK3cnKbQEjG3pdFtpOo8Zl0bbCLGfwl55jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oj7QFbj++RTO2NM11NrRUDC69MO8pxLYo0n7t8x/qW8=;
 b=mkAffcCcaMMAjZpu/4b8B4vYTbPXaMrV3nUQyw1l/WYcY2eP48+6mNBAarXRU9HfhJqee0JoFYAb8/VyTu0BbbixBQT7DXXi4/JH7Mak9euso/gPq2OQ7SaNhh+eJ6OlOdjzGNERQPW0HT/BT6QW9FbdD1MIN15grSrMsikjdwpAsIU9rP6w6iUpqJuDcoL+1u+jXlhjXvurW87ONJ8PN60PO4QTD3qXWx1In3GtoYlT+PuKr+cobhExNo/NV9nxE3BkU38MArOILWlR7HAwtD44oXIutXcL2hN+XXhS7ZMKRBHzDH1GZPHX4dqszcstSC3FYBtjeSU8DhEHVxLFbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oj7QFbj++RTO2NM11NrRUDC69MO8pxLYo0n7t8x/qW8=;
 b=EXcqTophc7PMxYtv0Q0Kqu0N6BOYf6MRQmgfUk8UwhgqHaOD7wKL+XhQk9+jSwHX/T0/de9yvLC6hqfI7bGMlmda8C1FYf4Ke4ZjddaYpBui3BGzXIz67hQhHYdsn4tj/W4oamA1Ko4DTKd/by61T5DutkR5jXgCVEQDoE6q2HM=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by PAVPR08MB8896.eurprd08.prod.outlook.com (2603:10a6:102:324::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6544.24; Wed, 5 Jul
 2023 11:08:32 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::30b4:3110:b02d:7f21]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::30b4:3110:b02d:7f21%7]) with mapi id 15.20.6544.024; Wed, 5 Jul 2023
 11:08:32 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Khem Raj <raj.khem@gmail.com>
CC: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 2/3] libxcrypt: Limit to enabling strong hash
 algos only
Thread-Topic: [OE-core] [PATCH 2/3] libxcrypt: Limit to enabling strong hash
 algos only
Thread-Index: AQHZpl1NXQ8+cB970EatL4kwUnXKpq+jYXKAgAez2QA=
Date: Wed, 5 Jul 2023 11:08:32 +0000
Message-ID: <5AE653F3-0F84-4FBA-A71A-21455E4E2B76@arm.com>
References: <20230624053223.228117-1-raj.khem@gmail.com>
 <20230624053223.228117-2-raj.khem@gmail.com>
 <20230630133051db39352e@mail.local>
In-Reply-To: <20230630133051db39352e@mail.local>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3731.600.7)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|PAVPR08MB8896:EE_|DBAEUR03FT035:EE_|AS8PR08MB6215:EE_
X-MS-Office365-Filtering-Correlation-Id: 84bb6efa-a898-4cc3-9ec8-08db7d48320f
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 cI229cofDfVyYs4CX4h0C742qFtnFdPS4voWIKh3g9en5eIr3bjnXLsRzVnnMXUW/UGHYtBH5RT0xWtrMfIN2vWttBZuRbT0IUceZGSUsbShtD+f0bmn+cRBWEKd0ighK4AbVUPEGhJWmuPQZirniCajZm1kytm3/3QGNdpcwL4qaYt2mqE35OsMznhYzUa29uyCortd6tX/AUyrU4C89JS8xVkwayPBhTo04RVSSrjhgePX3NPXx3i2fDXvjFWwN9sNFdKTz4JLD3Ln5doqeegDqff4u8sEd94m9ixip6HJu1h1vfkDYxJza1+pb2PdHL+XnPiwgY2CMecytaAdmtJnWHOECs2TB+Xucnto0qg/GOQrA6AadvvtEeH/IxDmMIH6Q2V9BUi7kqf/c85CzDF3+d7zZP/QXSLhx1gngFYalTRniSo5Ug2+Hqy3FSoxHRk4I4L9r2hNwT9eqyUVYhInvBolSxJHv4c4rgiwyj7TsMEi9dunQnMGnr5NIrsv900Gte19QbDKmuLXqZbeztskO6iEQo/2KMzXgUwYKoqzpTrjLvKHwGHKDVTfe36MuF2a2x0wu9W2iSyHBy2xE8F/RsQJyQMvOjB2NY0Z0B58nuuMR4JTBPgsp2aTUWdKGtOgef/5p9+VHVoc0YA1qw==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(346002)(396003)(136003)(376002)(366004)(451199021)(41300700001)(316002)(6512007)(6486002)(186003)(83380400001)(53546011)(6506007)(26005)(2616005)(478600001)(33656002)(71200400001)(122000001)(38100700002)(66446008)(76116006)(66946007)(64756008)(91956017)(66476007)(6916009)(4326008)(66556008)(5660300002)(38070700005)(86362001)(8676002)(4744005)(8936002)(2906002)(36756003)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <398EF05F72B0AF43AE1EFD6D4BA63598@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR08MB8896
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DBAEUR03FT035.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	33a35d26-b5ce-4bd1-4cbe-08db7d482b75
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	z7hlWwoxFm57c0bR+UtN0FHYsU00vNH857WkWwFzJlPFWEMV/0cW3VO6xeELblBl5K+jfPfsptUTfKS3s64khgm6U0IkWliO6prppNvcIu+dhzqWOr3ntgT7Ob/VEKmZmufKaWGmM5laJAOVmdGe9l7QEad76RBdfE5mVI24i9V0txqPpo3B0k26qpVF8OVTwSxq0HJJFsY/gFx8zQNzQ9G8gtXWEFo0LiUfgdnr+Pdj0R/bgdHCmNyR4ibhyjHkW7zji6Dka1QUwJpJQmt/fVmLUwXkPpcCeqesViHQj4Di0pnwRM+Y2idAv0KfLqrwjjTbAtdDVdjc1QQrM/P4mHpCT0rU/0eIDJYeyNylEDB5XY1oN/TP2MgVARIUg/01WXshoXkr8cz42iZN7R9gtggRoJzf1n0kRY6UqQ3wx/mYAJgPGz7t2+mLRkDt+BevssJqNbGJlw64nNDPIylNgiHc7hDcXQ8et0efQTSOZgXx54oXgsBWkxgNQvABzhysmZhtEUL3JrlDR68RG656y6m1ylS8gSr0xIksp+47VaqODVS4ahIHFwTYcZG0P8Z1ZhnVEFhJtsGwn/vfjGUkSCAuk2YE5vjUDvndrfZUx6q5JSRD+Yg104wglGXT9DEjPdbTg1EVuEQZkJ9KSD94w1GI4GGjUjPr+ffHvbSiYUTnD38KFhkbb1Ev1vZcNhLVLJ5JfiGYBmh26gUsyNR4rw76P8ZEQJktC1yJLj6726+suoB/6k5JY66YASSKtfUR
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(346002)(376002)(39860400002)(396003)(136003)(451199021)(40470700004)(46966006)(36840700001)(4744005)(5660300002)(36860700001)(6862004)(8936002)(8676002)(41300700001)(82740400003)(316002)(47076005)(2906002)(336012)(83380400001)(356005)(40480700001)(81166007)(2616005)(4326008)(70206006)(70586007)(82310400005)(40460700003)(86362001)(186003)(478600001)(6506007)(26005)(36756003)(6486002)(33656002)(6512007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jul 2023 11:08:43.3277
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 84bb6efa-a898-4cc3-9ec8-08db7d48320f
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DBAEUR03FT035.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6215
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Jul 2023 11:08:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183887

On 30 Jun 2023, at 14:30, Alexandre Belloni via lists.openembedded.org <ale=
xandre.belloni=3Dbootlin.com@lists.openembedded.org> wrote:
>=20
> Hello Khem,
>=20
> This causes python ptest failures:
>=20
> {'python3': ['test_crypt', 'test_methods', 'test_sha2_rounds']}
>=20
> We should probably disable those

Guessing this is also the cause of the perl failures:

{'perl': ['t/op/crypt']}

and apr-util:

{'apr-util': ['testpass_3_of_6']}

Test 3 of 6 is test_shapass using SHA1.

If we want to do this then some effort will be needed to make all the test =
suites adapt to what algorithms are actually available.

Ross=

