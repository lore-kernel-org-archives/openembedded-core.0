Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7FDCDC3DA79
	for <webhook@archiver.kernel.org>; Mon, 15 Jan 2024 17:06:37 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.86])
 by mx.groups.io with SMTP id smtpd.web10.87715.1705338391960647010
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Jan 2024 09:06:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=RGQ2t0+A;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=RGQ2t0+A;
 spf=pass (domain: arm.com, ip: 40.107.21.86, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=H8Ru/skhj2JaxPhoRSNc1fxcZ5r6rIO0rugN4QeQFQwsHJ4bQFl0CwBdwljh3scRWxV6aDVvR957dP9WyO/JqA04RGXpR3ACCVi9owdf0vOg9LJq2ep1WZyFEmnh32znmHoDDAV6zUp5RU29cqeT+aD9w7JtTw7DuGcJcCtqQlTpfe1rv/xALLEm7LQ2gVxalJHtOsd99rQE3TX9EBVsyEIow4VujW/AAq7iVyp/+UY/MdlOVpWS3biCbYt6UersVXdGivtsqaEiBzPvfkWRkjrmJLFpeFRll61bWo3L5aKbjxhuWUgQVIfuWLKb2LkEF2M7xt844oY0tRzxim3HMw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zpRYgUtpPYdGEdnXa4ROLasPCKg80plH2P7h8ExMi+Q=;
 b=FBQ9OwrqDSPhwyyzpiqwvbfShhTPDyEUQwEIbsNlskihtRM/Na4MdBfAh1/8wjBGD5xCVlZOMa02y7hNDc98mwVQjFrVHYNSAEL4TfP2AfMczt11MM8xuBNtxMq+p/ouCcZjppP4j5572E38tOUnGegcPVrcPofwSvpcSWO2rSjq8FYam7DTofwh3pM3Nvt7fUb8hWJLeyIfmr7vT6eFpRpz2iPeOVZx9lkEKvtvoVT4JlFXxCdaryFB7h8myDSsQQu9vSZs7MzPMkHq6Ed5yKr2RPcvjUGS+80+AHNQ43cgiOCpbjqee8KAi7sFRvmsB6PIcetRyaDLWxXIG+dX0w==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zpRYgUtpPYdGEdnXa4ROLasPCKg80plH2P7h8ExMi+Q=;
 b=RGQ2t0+Abzr+eu7QjFFTcKxTckyt6jiP7Yj9Sjq+NFl+QXoQLf2lMSiPxE36VzsMm+bOW29wCGUtUZEiiUNu2WqHgvfx63NGNRN0lTCG9JuzBxvKAhAWtdVvnkOXi3y0T8DSijoAl1gTOYYIXT5ZMdnFObiOg7U+bBQTN+qXpJI=
Received: from AM6PR08CA0036.eurprd08.prod.outlook.com (2603:10a6:20b:c0::24)
 by PAWPR08MB9663.eurprd08.prod.outlook.com (2603:10a6:102:2e0::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7181.26; Mon, 15 Jan
 2024 17:06:27 +0000
Received: from AMS1EPF00000043.eurprd04.prod.outlook.com
 (2603:10a6:20b:c0:cafe::cb) by AM6PR08CA0036.outlook.office365.com
 (2603:10a6:20b:c0::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7181.23 via Frontend
 Transport; Mon, 15 Jan 2024 17:06:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AMS1EPF00000043.mail.protection.outlook.com (10.167.16.40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7202.16 via Frontend Transport; Mon, 15 Jan 2024 17:06:26 +0000
Received: ("Tessian outbound 67699c3f02bc:v228"); Mon, 15 Jan 2024 17:06:26 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 09910094f2016ab2
X-CR-MTA-TID: 64aa7808
Received: from 19e8c4ab0401.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id FE97C0A9-95B7-4EE5-B502-20682DA0A3AF.1;
	Mon, 15 Jan 2024 17:06:19 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 19e8c4ab0401.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Mon, 15 Jan 2024 17:06:19 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ODguKocwdJZgerKzJVmLdFzIz/36sKeDeta6by3sIL04vUKJYQ9nr4exz/Fg132AACh5q4EiJTYQ8CDJgkOWjH32myEJijI2VM2l5CWiDEoNvOqLRzX7MwyWCCFXg1zPNU1W3l8bNkqgpdaABwPQEgTMVPDypwb7FmcBnAWC2RkC7vaUA13ynP9VdFRcybG5ksCrJVE9TFAcYXDT+hCPMS/X/ckXW3eqakmDTMeCo8hDm5nm+s9/IjGH7ya0U69G5tsxkQajLe5zCYIYrfVaQJQMc3BNrr8lYFbJEtISYeKWzLNc358FAiCMYIJhGjGGGPivWA4PKdK5bA/agwkHVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zpRYgUtpPYdGEdnXa4ROLasPCKg80plH2P7h8ExMi+Q=;
 b=QilnelafzJyDSuAuvCoDSmY6GB8xABv0pkasgQsBvRaO2/cxd0FKyTRsGSz43VbnGjLXZN2Pg0745+nzlGwFD4Yg6BbznhJcs3ptx4jzWOsROcHDpFDjeQ7hcTCy2vYdvh9mOs1bClilQXPXpRlJpNll6OlAjBDXM0vSlKwM4WbZh38JBFQ/U5QlQQoeYyGA7skAXgoqvDlPDaOhw2vZZqbhDT8M9d4UFMb5Jp9XC8T7vvFw8q0gFQRfr27OVsaQxE99oj4g1qulkwwxKl8i6yjlzHaiu6qMWZh23EabKI3+LVRxkmuDrnDtVRw6HupIBjvBFSmjIxV0suuXTbmRrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zpRYgUtpPYdGEdnXa4ROLasPCKg80plH2P7h8ExMi+Q=;
 b=RGQ2t0+Abzr+eu7QjFFTcKxTckyt6jiP7Yj9Sjq+NFl+QXoQLf2lMSiPxE36VzsMm+bOW29wCGUtUZEiiUNu2WqHgvfx63NGNRN0lTCG9JuzBxvKAhAWtdVvnkOXi3y0T8DSijoAl1gTOYYIXT5ZMdnFObiOg7U+bBQTN+qXpJI=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by AS2PR08MB9836.eurprd08.prod.outlook.com (2603:10a6:20b:603::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7181.17; Mon, 15 Jan
 2024 17:06:18 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9f34:f165:4c51:be06]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9f34:f165:4c51:be06%3]) with mapi id 15.20.7181.019; Mon, 15 Jan 2024
 17:06:18 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Khem Raj <raj.khem@gmail.com>
CC: Alexander Kanavin <alex.kanavin@gmail.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH v3] glib-networking: Fix ptest failures with
 openssl backend
Thread-Topic: [OE-core] [PATCH v3] glib-networking: Fix ptest failures with
 openssl backend
Thread-Index: AQHaQzI0h77wMUU1uUmWICLlsBmLvrDa6nYAgAACm4CAAAQPgIAALyQAgAADpYA=
Date: Mon, 15 Jan 2024 17:06:18 +0000
Message-ID: <D8380C51-6614-4A8A-AC51-E702FC039561@arm.com>
References: <20240109192923.3183219-1-raj.khem@gmail.com>
 <3B3DBDDB-9E17-431A-B3E8-DC8E072066FC@arm.com>
 <CANNYZj_oydN+0ODz_kCjus74uzF-wUhcZ1nfmYqrRo+BoupB4A@mail.gmail.com>
 <3642B18A-B5F2-40EF-B1A9-303923477117@arm.com>
 <CAMKF1soNT6kc-jCNsop1qaQVxDphZEO3DNa5AB4jwP=2Rd729w@mail.gmail.com>
In-Reply-To: 
 <CAMKF1soNT6kc-jCNsop1qaQVxDphZEO3DNa5AB4jwP=2Rd729w@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3774.300.61.1.2)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|AS2PR08MB9836:EE_|AMS1EPF00000043:EE_|PAWPR08MB9663:EE_
X-MS-Office365-Filtering-Correlation-Id: b38ac199-593c-40be-6637-08dc15ec4f5a
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 Lh44E2w3FCH/IBKpXeyKy1xez71/zU1Sut8/IEJWR+MvHhnYLYv9ZO0ROo89tK04TPK2CGxqsRT2F2ELTsG1B9CCp1/5mvMtGGI2l5961VZ9XSVDzaWuhMbEbuuVRZ9IMynPYEMmfFf2h4gT62eBuYvIXOGjJ++l/3qPtc+iZQDTEtXRhJenLYHi7lpDhGeTv6Y1gsVwqduI3W9LpXIWSqiZzkh76e3JF5j3kCFx3jmEnbD/yRjL41Z8yQ4mT0Df/KPjZvK3eaQqJ60t8Y6DP6Xf+jq9cq9G6dl7M+Cw8fePqNd4hLj1dmubqMqaSIjReRP4pisr4jwQ8DSXDKgMZWh5hXbYlHvxe574q5iUuBEXAn9t5R/C4RbImz6JUv1yECv0u6GcQ0O7zu4e52ce7zfaDJZzFvgRi8Xer1rUf2LEcxovmla0LSAHuHahQGDRjsS4VlbxT7pmsXO4FeYjiHAL8kbskAEtiGpKSbaKm1D9jnLx5zvJZwIqUbL5B7CHNp91TB4fjN2erfDoCKz77dpZYS6/ifnbcry70V9U5up1rP0f7cVka3Hx2UPExt5ZVAF3jMgvdhaiKa4lEISuUJTtZ5FTWFRaZlusknxLdDt7wrl6ZXzT+4e5BlU27AE3Gxx2FudVCngGg5sC5YG99w==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(39860400002)(136003)(366004)(346002)(396003)(230922051799003)(1800799012)(451199024)(64100799003)(186009)(2616005)(26005)(2906002)(83380400001)(38100700002)(86362001)(66446008)(91956017)(66476007)(558084003)(33656002)(36756003)(38070700009)(5660300002)(54906003)(71200400001)(66556008)(76116006)(122000001)(8676002)(316002)(64756008)(8936002)(6486002)(966005)(6916009)(6512007)(41300700001)(478600001)(53546011)(6506007)(4326008)(66946007)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <888F5EDF9894D0458F4DCD63421B0AA0@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB9836
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AMS1EPF00000043.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	2d0a1220-fdc2-43df-6ada-08dc15ec4a6e
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	9iq3kmEotiqWHUiVaLzFEIPHeMRl6h7eAxfnOT4lr76bqREXR9OeUcM4S+fJf9T1vu9j/N7sI2XYHPG0VuOzlnlN8IPLKT8VknLeAhLGNGJ1OeF59bxWTapyzkLbldGUhR1Sg8fiMzxpKnRJvRi2lT0/slDpM2PzZJLKn3HYNAwXlqSYh3ib+mConPSCTDRoQQp9u+CLlBDic9vVj3fw8cVk3J9YUdKo6p6EiC/w+3TXpmfVVDoVZJnXoHUi1dRrWG+4+1H7Dg8TPOUt1EebWdQQ1nlYY1ZXe1DbI7jjm/iHzlTAtHbYnkfuoV3LEzZ0WumJ914S7vHwlwLI82sKyROf8X3OKITBtm2B8YQkFlLHNE3cHA7JnHRDGJLF5WoRw92JEMAoJ+30QUa4WOy1iVY5qHCuFYnL66KNSz+SZ6dU7AjYmo+ahqw2vwt2bxcM8xK47WCU3E7qpLYUhfzAzAC0qhezEk2B0Vyxyx6+G27X9LycA3CIKwwX7nv6GKqukAITJz+iCV18QyjGG7247w+iDczlBxmJzTTIvgJK/zxgdsFphbKZaoptCAsXdq5dwAFF8fuCCD1C9vAZnbG+olTiYaOQJY2IfvLPMkkMogyJB6iTCveD4Gdv8s+4/JnJdeYlFj5mZRPlVQTA5QRkOUbsDACSTU57M3RQFXvs9rbnRuE1bXT5m/r3XgaUTWAxX+LNl2Og+oa0+oqFGRmN4Hjf8//iMqj/CmXENOHlkjs=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(136003)(39860400002)(346002)(396003)(376002)(230922051799003)(186009)(64100799003)(82310400011)(451199024)(1800799012)(46966006)(40470700004)(36840700001)(40480700001)(40460700003)(83380400001)(33656002)(41300700001)(70586007)(36756003)(558084003)(356005)(86362001)(81166007)(70206006)(478600001)(82740400003)(47076005)(2906002)(336012)(26005)(2616005)(6512007)(6486002)(966005)(6506007)(36860700001)(8936002)(54906003)(4326008)(316002)(53546011)(5660300002)(6862004)(8676002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2024 17:06:26.7088
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b38ac199-593c-40be-6637-08dc15ec4f5a
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS1EPF00000043.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB9663
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Jan 2024 17:06:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193692



> On 15 Jan 2024, at 16:53, Khem Raj <raj.khem@gmail.com> wrote:
> Where does it say it does not support? On the contrary there are patches =
in this area sent recently

https://gitlab.gnome.org/GNOME/glib-networking/-/commit/8e1d80c1e0fc52d17d0=
8a21946fa4a86ec30e1db

Ross=

