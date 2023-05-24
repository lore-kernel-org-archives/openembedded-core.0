Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3435C7EE2C
	for <webhook@archiver.kernel.org>; Wed, 24 May 2023 15:00:35 +0000 (UTC)
Received: from EUR03-AM7-obe.outbound.protection.outlook.com (EUR03-AM7-obe.outbound.protection.outlook.com [40.107.105.44])
 by mx.groups.io with SMTP id smtpd.web10.11284.1684940432721978990
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 May 2023 08:00:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=k5czVh/f;
 spf=pass (domain: arm.com, ip: 40.107.105.44, mailfrom: ross.burton@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n9HRZArbmVAELNzkDAuNxVWZmfmC6ktLHM2pKSEjFW4=;
 b=k5czVh/fUwPKi6WrgjzfKDHYApV6pFN4T4NyX6VM4FUtmNlGKr9KHNGLGZObTkxpU+0ei5yCRBYWJgbqrr3Gzi+u9HitlNNaGbkr+8FTwRGqsu8nHu0cAcF9arVD4qZp9hs0H41VmgFCOFkWog+D/1Qz+/la2TSzAMG4IL1sDyo=
Received: from DB9PR02CA0019.eurprd02.prod.outlook.com (2603:10a6:10:1d9::24)
 by DB4PR08MB8030.eurprd08.prod.outlook.com (2603:10a6:10:38a::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.28; Wed, 24 May
 2023 15:00:27 +0000
Received: from DBAEUR03FT061.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:1d9:cafe::7d) by DB9PR02CA0019.outlook.office365.com
 (2603:10a6:10:1d9::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.29 via Frontend
 Transport; Wed, 24 May 2023 15:00:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT061.mail.protection.outlook.com (100.127.143.28) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6433.15 via Frontend Transport; Wed, 24 May 2023 15:00:27 +0000
Received: ("Tessian outbound 8b05220b4215:v136"); Wed, 24 May 2023 15:00:27 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: d12bfbaf858f43b1
X-CR-MTA-TID: 64aa7808
Received: from 7a8bf82db223.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 81092FFB-ACFC-4DB7-8386-116E38A122AE.1;
	Wed, 24 May 2023 15:00:20 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 7a8bf82db223.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Wed, 24 May 2023 15:00:20 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mDsFu+V0jZvS1BGA3EhddeTmelXTIWDxa0sGBdT8wGwcNa7vJ2lNBp1M3ThGxbqyCx1zER37t2dCk7tr11cgmSQ7gUAWGC/KakLqF2XUx7T2SJ9giAbgA/IlN3CxJFsfB6G6asB0ieIYNBawc1aTILGM3KadxyaTusG+cc171PIl7RXquCdTVhCu0aNG6QVFAOogfawABiXvOCY81TnePYcx1qsETKGZ74VYdxi82vxvOJNa5OPfKV2iQQcnfy/zJ9k8wIyDHb1cQLIQZgz/12XXY1IvShC9oFkJNb4/ED29W6hNC2viUlQEqKPBV/gNv1x8GZGpmodnkqMa8xMiFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n9HRZArbmVAELNzkDAuNxVWZmfmC6ktLHM2pKSEjFW4=;
 b=Xhao4HGXnvDzukSYy37i9xkRlqqgcE61ESt4cg6hVWl1g2izlSszRSbxG1EVtW6PYiTcFgxdYqDyklwzcCJZ0lZMb47R35hQXQPwMNuo3weZSKK7bmrXKiJiEpuYIfdWW+VDgzQZJczOZzx6C504gkOr3w260ei4C+ziolsmnA0lBVxLiQNCyDxZ2ygfLJJVIZasixWHv2nCaHiU4m1eSnjMP1aBpTjVGPIAw6VMzLJDLHCtC2XDqDhj3TpwP3m4oWdfimf2mwfQE5kQrzUS50iBwxbdXggBligG5zauUPIEH3B0iDXMGoZOH4DZn/SjFKdg5SVD4B1Lh0CKRMQVbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n9HRZArbmVAELNzkDAuNxVWZmfmC6ktLHM2pKSEjFW4=;
 b=k5czVh/fUwPKi6WrgjzfKDHYApV6pFN4T4NyX6VM4FUtmNlGKr9KHNGLGZObTkxpU+0ei5yCRBYWJgbqrr3Gzi+u9HitlNNaGbkr+8FTwRGqsu8nHu0cAcF9arVD4qZp9hs0H41VmgFCOFkWog+D/1Qz+/la2TSzAMG4IL1sDyo=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by PAWPR08MB9520.eurprd08.prod.outlook.com (2603:10a6:102:2f2::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.28; Wed, 24 May
 2023 15:00:18 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::eb3c:9b42:21c9:494e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::eb3c:9b42:21c9:494e%7]) with mapi id 15.20.6411.028; Wed, 24 May 2023
 15:00:18 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "Martin.Jansa@gmail.com" <Martin.Jansa@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 1/6] libx11: remove unused patch and
 FILESEXTRAPATHS
Thread-Topic: [OE-core] [PATCH 1/6] libx11: remove unused patch and
 FILESEXTRAPATHS
Thread-Index: AQHZjhTgFaD0sUd8i0ONBB09l6fAwK9phLIA
Date: Wed, 24 May 2023 15:00:18 +0000
Message-ID: <6DA23AA1-4320-4219-AB7E-7BAE7EE0DB08@arm.com>
References: <20230524075320.1086358-1-Martin.Jansa@gmail.com>
In-Reply-To: <20230524075320.1086358-1-Martin.Jansa@gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3731.500.231)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|PAWPR08MB9520:EE_|DBAEUR03FT061:EE_|DB4PR08MB8030:EE_
X-MS-Office365-Filtering-Correlation-Id: e47113f1-8f2a-4974-d0f7-08db5c679c36
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 ukhwoNxPRqc3J73jICzrrXCITxf3Z5ZOyKpDmJvtWWuxLGGWQShvLvE0bBDy+eFgUjRgG5IsJRHVUyxgXaEWPGz0hPV/LFOLg5GCxjlA3U0bsUk3a1JADMEBwID73rF6Pl2C4pnCMXy7Y5fWm3c7VbtHnJMdEu4KI7mNwc35h9bV9ZSW+HFYdlcTwpKlPcuceUtD8bkKvMY3dPVJIvkbZbqclP7JJcVzKOmOBGTKx/BM54Utqo+BgifkkLfqqPYXwpPA8nFAltGUQNRhM2VAmw3PWzS/ZL1HPuPjgPx8QqKNsZmSQ/gPo6UVEePusH6FJTKYWAAmOWIOz5gy4or4Nob+lbbHm69oYVA2IRzmkr0rWoGhyjE0rfM1zbtsz6tzL5ykJE48gJ1sSEDvphGeTf012yW63ENkUl5I3UIhaWplbDqDq5i52cyEluGcc9TjipArruG0Fp5p3aoCeHs7i0LrA7leUgTg4EuR6O1oCf9b/l16bmVCwKbgI92+QjGt/YIdYoN5ywKGVv5uq8Q0Iuzua3xA4jjeTKTL+AwKV6M1blXkE6gSUx+pn6WU3FqvKdpB7iwJ8MzvK4y5IyxtpLJ0gZQ6BsGUfDczFXHCRYu1hh8N+aplkyZ1jG92InFmNb/6knaQTxr7mJjz9UYwqQ==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(396003)(39860400002)(346002)(136003)(366004)(451199021)(2906002)(66899021)(5660300002)(83380400001)(91956017)(8936002)(8676002)(71200400001)(76116006)(36756003)(6916009)(966005)(4326008)(66556008)(66946007)(41300700001)(316002)(64756008)(6486002)(66446008)(478600001)(33656002)(66476007)(26005)(2616005)(86362001)(6506007)(122000001)(186003)(6512007)(53546011)(38100700002)(38070700005)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <387FDB9F4C2E234DB43789DA97023DF1@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB9520
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DBAEUR03FT061.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	f6cadcda-55f4-4a3b-d50e-08db5c6796cc
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	q938u4nt2WcBADFHIRIQ+SeV8YnRQy9xBDBGeaKl2xN2lDYUN1hIlL4RjpUkNDwivfuxC0cX0zto25gy6rNYcgKq+oXE9GEOpmfJAfnzuFqAXbXmXt3r54j7Dcxc4UueaEps4HvBbVOUczc4CRIiNoj6DmfQ9qewbbRE+ZRnAVlY6fNATDQU5SOr2zJ6IGNOU6HzdhJoS7ypB4eGnyG77kt9ykNjU8pkvhFbE26jnMba21tWJCNgyclDVAk45z3vVzMMkAnAM8N2ZuxF+0BD2YfSLutfAjxxUVksGMu4OSZEEqmLx+QZIEemYHjvLbkVdwbZpsnnibjduu9JFRs3AigBVR7u9HazAhNcyKtf3aBusaHbv0qQanAUc0sgDdfQ88kTpb+5zMugLaHefAW+JMyvSXpidTtausROkItxhiyaDLV5FFbFAe5dwf/XlcyJtM06LBe1XPXeRCzPTVI9V6qdimGdlDPOzFRSCQMfE/58rTcj6wayc9Rcp7IBcfZim95ur6L+STOd+QC9/8ITxhztldBxZfgflLOVjMUOE6bIT2iB1+E5HhOuWmdp0dD2FeQQ1Bqvffla1J6Tg8f0eml02+MYCS/9Kgj0Yk2UX6DuCfpPYCDpWkv6lHxH5Q0CRTy8+q8bPAS5tojzwQxuNyzGKQ6GOKJIOEa0Dt3foYwavVIjJg/BnO6EzQgjsCDelJzrtK0GH0QQSe0KCJY8w1B3OMuLjCA7fgysW77oMHo=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(376002)(346002)(396003)(136003)(451199021)(46966006)(40470700004)(36840700001)(33656002)(186003)(6506007)(26005)(6512007)(81166007)(82740400003)(356005)(40460700003)(53546011)(2906002)(2616005)(36860700001)(47076005)(36756003)(83380400001)(336012)(40480700001)(966005)(316002)(86362001)(70206006)(70586007)(4326008)(6486002)(41300700001)(82310400005)(478600001)(6862004)(8676002)(8936002)(5660300002)(66899021);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 May 2023 15:00:27.4344
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e47113f1-8f2a-4974-d0f7-08db5c679c36
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DBAEUR03FT061.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4PR08MB8030
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 May 2023 15:00:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181679

Do you have a script to find these patches?  Can we get it added to oe-core=
? :)

Ross

> On 24 May 2023, at 08:53, Martin Jansa via lists.openembedded.org <Martin=
.Jansa=3Dgmail.com@lists.openembedded.org> wrote:
>=20
> * 0001-fix-a-memory-leak-in-XRegisterIMInstantiateCallback.patch was remo=
ved
>  from SRC_URI in:
>  https://git.openembedded.org/openembedded-core/commit/?id=3De13f651f73db=
0f26f4645447ab5fa17e36d1903b
>=20
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
> ...ak-in-XRegisterIMInstantiateCallback.patch | 57 -------------------
> .../recipes-graphics/xorg-lib/libx11_1.8.4.bb |  6 +-
> 2 files changed, 2 insertions(+), 61 deletions(-)
> delete mode 100644 meta/recipes-graphics/xorg-lib/libx11/0001-fix-a-memor=
y-leak-in-XRegisterIMInstantiateCallback.patch
>=20
> diff --git a/meta/recipes-graphics/xorg-lib/libx11/0001-fix-a-memory-leak=
-in-XRegisterIMInstantiateCallback.patch b/meta/recipes-graphics/xorg-lib/l=
ibx11/0001-fix-a-memory-leak-in-XRegisterIMInstantiateCallback.patch
> deleted file mode 100644
> index 722116c07e..0000000000
> --- a/meta/recipes-graphics/xorg-lib/libx11/0001-fix-a-memory-leak-in-XRe=
gisterIMInstantiateCallback.patch
> +++ /dev/null
> @@ -1,57 +0,0 @@
> -CVE: CVE-2022-3554
> -Upstream-Status: Backport
> -Signed-off-by: Ross Burton <ross.burton@arm.com>
> -
> -From 1d11822601fd24a396b354fa616b04ed3df8b4ef Mon Sep 17 00:00:00 2001
> -From: "Thomas E. Dickey" <dickey@invisible-island.net>
> -Date: Tue, 4 Oct 2022 18:26:17 -0400
> -Subject: [PATCH] fix a memory leak in XRegisterIMInstantiateCallback
> -
> -Analysis:
> -
> -    _XimRegisterIMInstantiateCallback() opens an XIM and closes it using
> -    the internal function pointers, but the internal close function does
> -    not free the pointer to the XIM (this would be done in XCloseIM()).
> -
> -Report/patch:
> -
> -    Date: Mon, 03 Oct 2022 18:47:32 +0800
> -    From: Po Lu <luangruo@yahoo.com>
> -    To: xorg-devel@lists.x.org
> -    Subject: Re: Yet another leak in Xlib
> -
> -    For reference, here's how I'm calling XRegisterIMInstantiateCallback=
:
> -
> -    XSetLocaleModifiers ("");
> -    XRegisterIMInstantiateCallback (compositor.display,
> -                                    XrmGetDatabase (compositor.display),
> -                                    (char *) compositor.resource_name,
> -                                    (char *) compositor.app_name,
> -                                    IMInstantiateCallback, NULL);
> -
> -    and XMODIFIERS is:
> -
> -        @im=3Dibus
> -
> -Signed-off-by: Thomas E. Dickey <dickey@invisible-island.net>
> ----
> - modules/im/ximcp/imInsClbk.c | 3 +++
> - 1 file changed, 3 insertions(+)
> -
> -diff --git a/modules/im/ximcp/imInsClbk.c b/modules/im/ximcp/imInsClbk.c
> -index 95b379cb..c10e347f 100644
> ---- a/modules/im/ximcp/imInsClbk.c
> -+++ b/modules/im/ximcp/imInsClbk.c
> -@@ -212,6 +212,9 @@ _XimRegisterIMInstantiateCallback(
> -     if( xim ) {
> - lock =3D True;
> - xim->methods->close( (XIM)xim );
> -+ /* XIMs must be freed manually after being opened; close just
> -+   does the protocol to deinitialize the IM.  */
> -+ XFree( xim );
> - lock =3D False;
> - icb->call =3D True;
> - callback( display, client_data, NULL );
> ---=20
> -2.34.1
> -
> diff --git a/meta/recipes-graphics/xorg-lib/libx11_1.8.4.bb b/meta/recipe=
s-graphics/xorg-lib/libx11_1.8.4.bb
> index 7831b4986a..9058c1844e 100644
> --- a/meta/recipes-graphics/xorg-lib/libx11_1.8.4.bb
> +++ b/meta/recipes-graphics/xorg-lib/libx11_1.8.4.bb
> @@ -18,14 +18,12 @@ DEPENDS +=3D "xorgproto \
>=20
> PROVIDES =3D "virtual/libx11"
>=20
> -FILESEXTRAPATHS =3D. "${FILE_DIRNAME}/libx11:"
> -
> PE =3D "1"
>=20
> XORG_PN =3D "libX11"
>=20
> -SRC_URI +=3D "file://disable_tests.patch \
> -            "
> +SRC_URI +=3D "file://disable_tests.patch"
> +
> SRC_URI[sha256sum] =3D "c9a287a5aefa9804ce3cfafcf516fe96ed3f7e8e45c0e2ee5=
9e84c86757df518"
>=20
> inherit gettext
> --=20
> 2.40.1
>=20
>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#181661): https://lists.openembedded.org/g/openembedde=
d-core/message/181661
> Mute This Topic: https://lists.openembedded.org/mt/99104244/6875888
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ro=
ss.burton@arm.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20


