Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B0CDCCA48A
	for <webhook@archiver.kernel.org>; Mon, 25 Jul 2022 20:17:39 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.48])
 by mx.groups.io with SMTP id smtpd.web10.715.1658780253312828154
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Jul 2022 13:17:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com
 header.s=selector2-armh-onmicrosoft-com header.b=EUzraOS0;
 spf=pass (domain: arm.com, ip: 40.107.21.48, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=T5Idlncetj3bqGBFeG2bX1yhTIHdnfmwVQbObnKEOziX0S/LNgNgUCcLmPa5E+XXNPPIzv2cLiKjh9fF9XL9P2PGBqTUzEDnzFH6V1EAMdUw4t1GNBWqmmI3U8kbMPr4eoYRk2T/Kxvo1Y4RWW195688UqITuaQESg9DNY+HMrSov7uMgBLBj995ahmvhK+CS8qRuHYrTfBBaEWh0slqdyJdvoWijfjnLpGCmWCTnOFzJpnauUfOdxPGBsF9zKlGzfxcnOmspRvjJD2MUJTiK/o27wwJHnzMJTBc/ck8qkAftzrPCAHU2sLbc/780PUJprCD3o5eNz0f5W9sUCcoSA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6zLGa3qDUgulBXHAB2hs1h4QJ6YJvgGM3S0o6aRubWw=;
 b=DZKJj7KFWm49NDR2HZ/hphDMIcUIbV3wVhXIDNsDjhmDD49qGCV4D/t5ObjPIt3phOienL3kTiMMeQih7vwnztgYUSGug0yZ+ccArGd0WwEp3JLEfsX5V+GOIw+F2sLp0bWbOmsUVRVYuyKddIVywhwRe2aFGmvqXZz4TOqfgBQP208JLH6NI0wwxBrPeDWBwlYfnvgjooewSLidvSrEQ/9Jrhtl0qNC3hlp8E89GHoUPU8G7TVpv6PRW8mWwLbFQdnyOq3Vx8/KC8KBlEAfWYUuaSuOXSYvUyF2B7PWaotyxiYwxL0wD9bPd6r/3UTBO1PKwuZAW5ZupH8vmBExRw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6zLGa3qDUgulBXHAB2hs1h4QJ6YJvgGM3S0o6aRubWw=;
 b=EUzraOS05MZCYBNUE4h/9EzXMdeg9Yc167xJ6WACzVsfYi0WpHrJL5w3vd3jgRk+S6ih2akCv6N+gHt3Vy2m1c3f3yRVLiWRnt5Acx4RVUlYVeA5oFH3xmri4nuBQo1G18ArCw/XzHweZVdHOZ0F2iWWPdOrLx1+QCFXEvNaBRM=
Received: from AM6PR0202CA0041.eurprd02.prod.outlook.com
 (2603:10a6:20b:3a::18) by PR3PR08MB5769.eurprd08.prod.outlook.com
 (2603:10a6:102:91::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.19; Mon, 25 Jul
 2022 20:17:29 +0000
Received: from AM5EUR03FT007.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:3a:cafe::7) by AM6PR0202CA0041.outlook.office365.com
 (2603:10a6:20b:3a::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.24 via Frontend
 Transport; Mon, 25 Jul 2022 20:17:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT007.mail.protection.outlook.com (10.152.16.145) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5458.17 via Frontend Transport; Mon, 25 Jul 2022 20:17:29 +0000
Received: ("Tessian outbound 63c09d5d38ac:v123");
 Mon, 25 Jul 2022 20:17:28 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: e02c127de42676dd
X-CR-MTA-TID: 64aa7808
Received: from 3aeca3cb7770.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 A9D091F6-6200-4A77-8C20-D3A868DA521A.1;
	Mon, 25 Jul 2022 20:17:22 +0000
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 3aeca3cb7770.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Mon, 25 Jul 2022 20:17:22 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JW9w3dGJB4XUCc5oS2SrumVehYP2nKWz4VRT6qa/kL67siENNy3+8hrT49QIrLT4DtFMgwfh9x0Oiib8ffhRA4SjhwwYAvdbanIe7aXm1w8zMlbuY5DWQlaIFITJsqxing1NS9rvpJAgNZ6JEFXnLsdWenVa9EKk69IABJQUkQFMTZP2CANHeU2BNVe/6UHQLIllQNipTY/50LEAJeAmjDEV2aS45YSL4M1ZFTN2Pa/6MsRogvkfE542g733u+2bxm7g9Z8p6A6F9HH/x7s9h9B1kTPU4Op4clM1MCFIz2bNwduc7u7bvyHbN/ikGlJQ6YICiQ1GrZivIcAVBumPQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6zLGa3qDUgulBXHAB2hs1h4QJ6YJvgGM3S0o6aRubWw=;
 b=EfBxTW9vcQzmskes7w8pol3xjgI61eGBVYHdRgvRQWIKFXevHQ0UYMSMeIl+b3+v3OvZiVBjU1xW9YF/NvY1dKH70Tvsd2u2Kacv72ajYKnZSi8FeIk+SjK4sdDM+BN7uaVFAfK3fSdTWQ3ajehZyEMOG85DP1xW29n3QGB0+0JmdBeI/X4AlUdkzaR/NTnW6wyliU9hZE6j+0KxuxQy/pbaVQlAt/qCuaMySdcYhBxTPwtVR1lo2JrbwkTcdHDkQK0V0tk5QkhV0+Uv6ro/PHUjEXuLqELRXi8bh8hlnYacm9rkVP/6CfnsXxnJjnA27pY7rnt2GcX5KPSsLAO2Sg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6zLGa3qDUgulBXHAB2hs1h4QJ6YJvgGM3S0o6aRubWw=;
 b=EUzraOS05MZCYBNUE4h/9EzXMdeg9Yc167xJ6WACzVsfYi0WpHrJL5w3vd3jgRk+S6ih2akCv6N+gHt3Vy2m1c3f3yRVLiWRnt5Acx4RVUlYVeA5oFH3xmri4nuBQo1G18ArCw/XzHweZVdHOZ0F2iWWPdOrLx1+QCFXEvNaBRM=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by DB6PR0802MB2262.eurprd08.prod.outlook.com (2603:10a6:4:84::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.20; Mon, 25 Jul
 2022 20:17:20 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::fc06:20ca:a7cd:4d72]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::fc06:20ca:a7cd:4d72%8]) with mapi id 15.20.5458.024; Mon, 25 Jul 2022
 20:17:20 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "raj.khem@gmail.com" <raj.khem@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 3/3] gcc-runtime: Use --with-target-subdir for
 baremetal targets
Thread-Topic: [OE-core] [PATCH 3/3] gcc-runtime: Use --with-target-subdir for
 baremetal targets
Thread-Index: AQHYnqQxwWWDuyxN8Uya3miIaCI9wq2PicyA
Date: Mon, 25 Jul 2022 20:17:20 +0000
Message-ID: <9B4C3C09-D597-4328-9964-F54E096B2854@arm.com>
References: <20220723145416.1374755-1-raj.khem@gmail.com>
 <20220723145416.1374755-3-raj.khem@gmail.com>
In-Reply-To: <20220723145416.1374755-3-raj.khem@gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3696.100.31)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 339766d6-2a5e-415d-2e74-08da6e7ab2d5
x-ms-traffictypediagnostic: 
	DB6PR0802MB2262:EE_|AM5EUR03FT007:EE_|PR3PR08MB5769:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 lJ+GQRaEkrA2KWaVErS+hGRfjxcVTszlm0VvWCFrNE0bOgwWVEbralH1MgivDQPDTriu76s+ONZSkoalJbw6W+EZWHWERcl2ugKZYGr2KtYmaPZBZoeK1bCjepGLpZQktEBJ1+46S/gYMXFbEqltrjVuJvWVX3MxGkYmvBYZyAbn4d+MuLocPr0WskZav4EG3fCzDxTYboCcLYwTFNoW3/aA3fMlOQUNkXkF3w+vJX05TNNkdsWWBE7YIW+oFwGXrFI8XOGO5gvvhDyQg02qv1QgEpcWbj+b8DmOYbOHszsBYi8ODUj5pSMQ8w2PC/tvjxY0CTPcMQFGRlTLyKleY96N4iD7U+C/LYJHI0WQ6Wy2ofzhFLC1OxaQTBaMr8SjK8TAMz6KZ2rb+Q/vVN3cXSWdlhUtV4fgHFAlJONljCkmTm7ce7fZ2ZFeo94j3t0c3UIoLJL5I7ZB+ufQOivSYp1HWgZiBz+TDviB3YUcdxWNExyO8XFTrtpzQjpc/Ei5QxCHDS58kUege8geBmiMiyrcX1gjOlwW1D6B3Kd6QhyideX/IytWDZMwI7xFdgdA7VLmqQm41C5NQzyxhvmurSjA/mf4x52l+Zq38Zfphx7YfHhyyJn/iHaltf8qCW5Rbz2gnRwRpH0bn4alVr27Y41YYB4HD0l2D/pqlxwU9S4JBd4JlAalKAlQzcejI9HGFE8S6nE5W1+UwANcL9OEvMmKkHF6c3Sj6yCADit14BjHTTMyL6SHpB0EzZ4uBH5WtKpc1sK7YONEx4ogkskweSC+k95bdfeU4wBA/94Fz04AQLnnd3009EypW+m2unz1yGcAtSIHUE6JKE6DQF5f0HMQMTDH/NByueJGkB8w5fe+PVD1kCKLPbaZBX4b6X+YmMVZftIu4US33alkWfEh6CPTlHs3f9tXu4D155KySHM=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(366004)(346002)(396003)(39860400002)(376002)(136003)(6506007)(71200400001)(83380400001)(86362001)(41300700001)(2906002)(2616005)(5660300002)(186003)(8936002)(91956017)(36756003)(6486002)(4326008)(76116006)(38070700005)(64756008)(38100700002)(66476007)(8676002)(6916009)(66556008)(66946007)(66446008)(26005)(53546011)(316002)(6512007)(122000001)(478600001)(33656002)(966005)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <1BB11C9DD35A5B4182B35FFD9C3F2AF4@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0802MB2262
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM5EUR03FT007.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	babe18fd-5ccb-4169-3c72-08da6e7aad99
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	RDgW6RlEN3dOQWCkvnNb0kSCmnd+onghdv7wt6l+5QqqrR3hgpz73iD0+ON/nbYR+ORUHLw3o0HLIZBk6TFQtK7y+Q10oQlC/P1n3kebwjWhG3l5auNHblQzPTq7+I0UlzGKVpY4iZ4Krkmvo00Ec8IsYN1Pr6Y34WxK82+WUgcWs0b/2BGydOCyth7Ahsopq20OJb8uBThlw2YXkM2CKyij4bxVRQwCDnGdqXkRq03FpqENhB05wNfOwyUoMPhTQIQ2mVht0r+MJMDvldj29HpvoFqpdmy/SDDCfUBI5Oys3U6xErFE3W3yQqqBmTfJgo2ojf0dQ+D9fBLTB0xIQWM2vQPlwTozyTcXXmthSKFmVwwLfaeoRHi1FUD2D7YEh4FrmNSyOwZgV/fUG9ND1bwdYQ/y7dAnYziaHnK+xJ3hHtG2qn/1CDUgRsepgeE0vIsncmBV5vf+O4YtNAp1XkYLWh7aipbJxm36DMjpRspnUfYAxgdqvgEK+o4I/8WW0nsn5vA4OCxNA6IUHf0XKkfdrgaur9m3kstFng7G6z2P98FQupRO4JwhTT0GoPgLekrd9uAJbg7H6Bo1wxYUQ3PzWWFSWUyuOiys8WaPZnmzVc+QxA9t9/RAa/LKcYLBvzwlRdrYWjjQn+/2+Fx0GpqOrFLedlz66zofXroJaAV//XV/ALXLRe0eKCMjabAlE5FtOqkqX9Ec0/9CATCAw6vop4L+MweUEdoZcJH9/IGATfHG5ostxDm4tAiVQsczUb076Q2kCON9wYmq/I/XAT1NbKLilVDDIt6Zzn/Ieg706swacZaK3635MomhopdzCWhej7c6n1VQ2T3xPDZzIw==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(396003)(376002)(346002)(39860400002)(136003)(40470700004)(46966006)(36840700001)(83380400001)(8676002)(186003)(36756003)(53546011)(40480700001)(47076005)(336012)(70206006)(8936002)(70586007)(4326008)(2906002)(6512007)(26005)(2616005)(40460700003)(33656002)(86362001)(6486002)(81166007)(6506007)(966005)(36860700001)(82310400005)(5660300002)(316002)(41300700001)(478600001)(82740400003)(356005)(6862004);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jul 2022 20:17:29.1102
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 339766d6-2a5e-415d-2e74-08da6e7ab2d5
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM5EUR03FT007.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR08MB5769
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 25 Jul 2022 20:17:39 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168490

Fixes our builds, thanks Khem!

Ross

> On 23 Jul 2022, at 15:54, Khem Raj via lists.openembedded.org <raj.khem=
=3Dgmail.com@lists.openembedded.org> wrote:
>=20
> This disables tests for runtime system specific functions like fcntl
> there is no other change seen
>=20
> +configure:77372: checking for fcntl
> +configure:77372: result: yes
>=20
> In libsttdc++ configure log outputs.
>=20
> [YOCTO #14803]
>=20
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
> meta/recipes-devtools/gcc/gcc-runtime.inc | 3 ++-
> 1 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/meta/recipes-devtools/gcc/gcc-runtime.inc b/meta/recipes-dev=
tools/gcc/gcc-runtime.inc
> index 15f4175214b..91b74c732bd 100644
> --- a/meta/recipes-devtools/gcc/gcc-runtime.inc
> +++ b/meta/recipes-devtools/gcc/gcc-runtime.inc
> @@ -16,7 +16,8 @@ EXTRA_OECONF_PATHS =3D "\
>=20
> EXTRA_OECONF:append:linuxstdbase =3D " --enable-clocale=3Dgnu"
> EXTRA_OECONF:append =3D " --cache-file=3D${B}/config.cache"
> -EXTRA_OECONF:append:libc-newlib =3D " --with-newlib"
> +EXTRA_OECONF:append:libc-newlib =3D " --with-newlib --with-target-subdir=
"
> +EXTRA_OECONF:append:libc-baremetal =3D " --with-target-subdir"
>=20
> # Disable ifuncs for libatomic on arm conflicts -march/-mcpu
> EXTRA_OECONF:append:arm =3D " libat_cv_have_ifunc=3Dno "
> --=20
> 2.37.1
>=20
>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#168442): https://lists.openembedded.org/g/openembedde=
d-core/message/168442
> Mute This Topic: https://lists.openembedded.org/mt/92568011/6875888
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ro=
ss.burton@arm.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20


