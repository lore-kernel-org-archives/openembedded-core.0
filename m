Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 273EFC61DA4
	for <webhook@archiver.kernel.org>; Wed, 22 Feb 2023 16:17:58 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.71])
 by mx.groups.io with SMTP id smtpd.web11.13177.1677082673578362840
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Feb 2023 08:17:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=3o/Zg6LS;
 spf=pass (domain: arm.com, ip: 40.107.22.71, mailfrom: ross.burton@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qg5xtRYb9UxUVGKOO3Xjnr9ohFuCy5BV6dZuWkxe+ds=;
 b=3o/Zg6LSZRr5eHijEjd8BkSdGGClXqLF/NFk8bJoEYr8aWFKmx9o0RS329bSsSOG3G3iZ5L5Tt7r2I379iQh5b7vKiijjMxh3BMTtibEE8s70Rjiux6EF3biAsIfUQzbA0pq9D6MwiaXOViIytR+x21Vdu1ZO5zyy0KEsi3Ip0g=
Received: from DB6PR0601CA0022.eurprd06.prod.outlook.com (2603:10a6:4:7b::32)
 by AS8PR08MB6663.eurprd08.prod.outlook.com (2603:10a6:20b:39b::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.18; Wed, 22 Feb
 2023 16:17:49 +0000
Received: from DBAEUR03FT041.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:7b:cafe::fb) by DB6PR0601CA0022.outlook.office365.com
 (2603:10a6:4:7b::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6111.20 via Frontend
 Transport; Wed, 22 Feb 2023 16:17:49 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT041.mail.protection.outlook.com (100.127.142.233) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6134.19 via Frontend Transport; Wed, 22 Feb 2023 16:17:49 +0000
Received: ("Tessian outbound 6e565e48ed4a:v132"); Wed, 22 Feb 2023 16:17:49 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: bafbe7545136627d
X-CR-MTA-TID: 64aa7808
Received: from edcc5781c3e0.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id F81E3F85-11A8-4ACC-B60A-6F04D3788748.1;
	Wed, 22 Feb 2023 16:17:42 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id edcc5781c3e0.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Wed, 22 Feb 2023 16:17:42 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V4nKts7zJwdhvzDt5TS/N8BE49ps52tg2CowLEtk2mBVBS+E7gypSjM5vdsJrKLcCTQgEDMYVH3MVuPM9SUTM6FSUFk54No0Er1Mrak/AelUMLotiAEAQ41JsKjPelFf8Oe1DwIwyRXX7u8C9XJZ6l2SGAmkyaGV7DobxWpInyQ/53d7O/DKx+yZq3qXV8oOydbHJYDyf34jaDJTRwZs9jdlTEC5G/PE2DA+5Ajk1JQRLjzc8xDTAtGnx6Zu36rkgzVf4igLLm8JC8IfSP38mZ/O4m2cr6Jjr9EuzWhRRpN1kszaivtv28Lr+KQrxt+U+CzQr43LIuMR8Cl8CGOv+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Qg5xtRYb9UxUVGKOO3Xjnr9ohFuCy5BV6dZuWkxe+ds=;
 b=NakWv2X4m4p9IraiwyCt2fLTT3U4pqEBvmRDQnI8Tn3dz4WR7TPCkVwqnC8u5f8OCPb0/jSm+hRwC43gAXdcZwIVIvYMrtOMetwOx9SyfxSWiOanuieyWpE4UWL3rXj6CkhOksQwtNHGD+OtbfqgOoCfTkLoIg1Vov8EdHrHqD8fm1UJ6bFAQC4lxKRANCZxureNsok+QyuHbD3yRhr76ZYMfkFzAxudPOXdgnkQl/ClJvXwqu48qUX4jqBzaw2395jsgtiXcs4vs4/6n8uC3tKSyN6AyYUhnb8NW02eR7x/Sd3vthu8I59QcccBI/hABOh5l9DC9qTk9vvapPArCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qg5xtRYb9UxUVGKOO3Xjnr9ohFuCy5BV6dZuWkxe+ds=;
 b=3o/Zg6LSZRr5eHijEjd8BkSdGGClXqLF/NFk8bJoEYr8aWFKmx9o0RS329bSsSOG3G3iZ5L5Tt7r2I379iQh5b7vKiijjMxh3BMTtibEE8s70Rjiux6EF3biAsIfUQzbA0pq9D6MwiaXOViIytR+x21Vdu1ZO5zyy0KEsi3Ip0g=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by DB9PR08MB6650.eurprd08.prod.outlook.com (2603:10a6:10:26d::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.19; Wed, 22 Feb
 2023 16:17:41 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::e305:742e:e10b:1093]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::e305:742e:e10b:1093%2]) with mapi id 15.20.6134.019; Wed, 22 Feb 2023
 16:17:40 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "rich@richelberger.com" <rich@richelberger.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 2/2] [YOCTO #13270] docbook-xml-dtd: refactor
 for style, add version check regex
Thread-Topic: [OE-core] [PATCH 2/2] [YOCTO #13270] docbook-xml-dtd: refactor
 for style, add version check regex
Thread-Index: AQHZRKp3Rd+89yRvQFycCVf28l/dgwAAALvortlsCIAAVRiyOf//FCmA
Date: Wed, 22 Feb 2023 16:17:40 +0000
Message-ID: <5D6A8A1C-494F-46D3-AA18-27BE0F2C8649@arm.com>
References: <20230219213807.3415938-1-rich@richelberger.com>
 <20230219213807.3415938-2-rich@richelberger.com>
 <010001866b9d0634-676dbda8-5f68-4a16-b3f2-5b80d490524a-000000@email.amazonses.com>
 <AAEE0F32-07A5-421A-96CE-CC6DC5409CB6@arm.com>
 <d4237fbd-e369-8572-170c-3300e1fd41d9@richelberger.com>
 <010001867453baf1-8b731419-55f4-45b4-bd0f-0a7d97fc3023-000000@email.amazonses.com>
In-Reply-To: 
 <010001867453baf1-8b731419-55f4-45b4-bd0f-0a7d97fc3023-000000@email.amazonses.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3731.400.51.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|DB9PR08MB6650:EE_|DBAEUR03FT041:EE_|AS8PR08MB6663:EE_
X-MS-Office365-Filtering-Correlation-Id: da823a7f-83b7-4d06-8320-08db14f05760
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 4tVNPIXjoswKbv2lK8p0KVcFFgHgcklUM5PyVE/SPitZvwzHwYkvS2VLSu12KjGwHpdQR6nR7siZBqBqyzKnH0EQI7GpVO9JFain/GOXSrhubWD+HqbggRPrPzd2Tyl5cqK21mk95OqqNPH4CTfwPwAueTu/1xOTWIYX1iXSURDdMxtc0n0NWTHxGnlVRCK2IzvdvQGYc1/2qkeyNGSs22siL4IXxKlFz+XGnZWAVdvW+eZ8DC7La8XtxICqfkWFUIK4zs+v9cxx8FzVdq4KyI9+A9jhY8/tIomqEYwgW+vqughvGnD0CBLO2+khUuiwsTR2zLwROHMMdsFr56TZ6MKNIMCqOZFE12QfcD+pFHJivivOqexvVgDhyLkKjbCAb/H+H9jcw2hfcRyVkw5JvqBeiceoJBZWt9vpYhT2KS62gTc5kyp1Sp5YaPUijlMPwux57+mVuNRKyVXUIWZK+TUETSkS7mg+aclBTU1OYtPN2tce7HJFvCm0eg1lvc6qREboLRpGXcVacf9a5KDiiDtFztH7/B1Zo1cwF+XKpPfDL1vbzm3xqyjePc9sIetQ2GmXbb6SX2vnaWzSeWadlFLiP+sW4Y6zW05raVM6lZNk7wFHtV1e62LZksq6/DD/1YdBtd8HcdSL8W8CHAwVQlLxG1o5vvkisS2LRC+o3tdMoLijbndHvx0kNp1y2QbsaJhYAtsn6dtwAUI8GkfZ7Y3PxZZpN3hARjaWXo7LpJI=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(376002)(396003)(136003)(39860400002)(366004)(346002)(451199018)(316002)(38070700005)(53546011)(41300700001)(186003)(26005)(6512007)(4744005)(33656002)(8936002)(2616005)(122000001)(5660300002)(76116006)(6486002)(478600001)(6506007)(8676002)(64756008)(71200400001)(66446008)(66476007)(66946007)(66556008)(91956017)(4326008)(6916009)(36756003)(38100700002)(86362001)(2906002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <32DBA19569324F4798910DFF38BE1764@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB6650
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DBAEUR03FT041.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	8dc47543-8c92-4996-3aa8-08db14f05212
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	TDA0c0/jKA2CX3CL0fqDSUT6f56EGZKcGvdhm92Q7JkLOUNuHfQijYhLhlWN7Tjn15pDUUZ8WyN9ajd+ycCcaajR114unTISyOCpGOlKejGopM11jLuSd3W5rrpwGM8tI5bQR0aqBuJ7r51Wfiv8rp1Aik0x3G/S8PRSQg5Hzu4O6rqLQj0D0VONC1N6Qsy+n8l60BTena8w75ATJh22VcFX/bdv6cWrS88xlRhKtLSUXhZrg1TZupYCAkLqfL6Y9v4f30UvKOlmm2SdqLq1TKapPSE/R29X/zrfe8vHkcWy+RaIKAgqTVXEMQto706EQBRzpzr2KIGmCiZivOxTmugZ2oaNmBG9BBEXy2D/RbuigPE3QfF7CymSmMWtFyFQjAFnc/X90x6t4obWC1frmVFOBL8WIKyay1zN9LYnN8uUwnHRAsUbVIPgOac8sM5mSaJ9wp5d2m9a1d9sH75cWtPWkPOY7TJNvUoQYcBQIdz/3xCDJ+ZaAjTjXDO7UAZ3ydgljQX8UPp60z03wNeNtwVqqIuSZnU+8NhnqG00AxWdEoNhP+SiqPUSKPVv13l1DkAwpJweJCLFmtf0fBYoe8+LTu4/mK2WQIc4BVCI3GF+0bJBzHYjbtCpknfZQdgu2iNQqNx6jG2DRri6/rukKsCItnwVGorDdZdyvYLX4D8oPsF8Lsbn7PHXO0po4XYZXX2d494H1qvdfAXeAQRxoA==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230025)(4636009)(396003)(346002)(39860400002)(136003)(376002)(451199018)(46966006)(36840700001)(40470700004)(316002)(47076005)(478600001)(40460700003)(81166007)(36756003)(2906002)(82740400003)(4744005)(82310400005)(86362001)(356005)(33656002)(4326008)(70586007)(70206006)(8676002)(41300700001)(40480700001)(8936002)(6862004)(2616005)(5660300002)(36860700001)(6486002)(186003)(26005)(6506007)(53546011)(6512007)(336012);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Feb 2023 16:17:49.3550
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: da823a7f-83b7-4d06-8320-08db14f05760
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DBAEUR03FT041.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6663
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Feb 2023 16:17:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177575

On 21 Feb 2023, at 14:14, Richard Elberger via lists.openembedded.org <rich=
=3Drichelberger.com@lists.openembedded.org> wrote:
>=20
> Hello Ross,
>=20
> It wasn't entirely clear to me that the patch would be required if taken=
=20
> from docbook, but I see that my "test scope" was not appropriate and you=
=20
> have surfaced why patching is required. Now that I have a test target=20
> this helps but in future I probably should build world but... just tried=
=20
> that and got a gtk4 dependency error.

My test was to enable the api-documentation DISTRO_FEATURE and then build o=
ne of the many recipes that use xmlto (and thus, docbook) to make man pages=
, such as kmod.

Ross=

