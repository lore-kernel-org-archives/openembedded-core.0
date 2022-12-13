Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40F2CC4332F
	for <webhook@archiver.kernel.org>; Tue, 13 Dec 2022 14:37:38 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.45])
 by mx.groups.io with SMTP id smtpd.web10.74755.1670942254204594482
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Dec 2022 06:37:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=Qohoy/fK;
 spf=pass (domain: arm.com, ip: 40.107.22.45, mailfrom: ross.burton@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U/m8oilFsovLoG3wBIrdh75MLHQqxk/oqdJkViWBOPQ=;
 b=Qohoy/fKWKEatOLpecu0jNrz0/Ma+aHthJ8/xelYY8gLhJxRuJqpSARPII5qLlBF0gnD3M1IDYuZ6UhJVwWOrWRJaDBOTsYhXQa0tIl2ybOuKAjkwo9zAmqbLlkvSLhAqCZu4v4hqjaKASUhn9Cn/mntAGEd76PQ43DTxE8g5Ik=
Received: from FR0P281CA0018.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:15::23)
 by DU0PR08MB8833.eurprd08.prod.outlook.com (2603:10a6:10:478::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5924.9; Tue, 13 Dec
 2022 14:37:30 +0000
Received: from VI1EUR03FT031.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:d10:15:cafe::67) by FR0P281CA0018.outlook.office365.com
 (2603:10a6:d10:15::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5924.10 via Frontend
 Transport; Tue, 13 Dec 2022 14:37:30 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VI1EUR03FT031.mail.protection.outlook.com (100.127.144.221) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5901.21 via Frontend Transport; Tue, 13 Dec 2022 14:37:29 +0000
Received: ("Tessian outbound aeae1c7b66fd:v130"); Tue, 13 Dec 2022 14:37:28 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: f9ac8c53761b2e6e
X-CR-MTA-TID: 64aa7808
Received: from 09b89de88fcf.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id CC2F2D0C-4F99-41AA-A5F7-99E6E9E199FA.1;
	Tue, 13 Dec 2022 14:37:19 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 09b89de88fcf.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Tue, 13 Dec 2022 14:37:19 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IItoWuP+pfAYbuibmXWx9ZLcOuMV6lSN7Ynq5Td2ZdlhWzg3aWq4F9R4m2ya5ivktZ345mhYzvka1RzZNCfLHEA+dOsaeJeT8vptitAbPc8icyZ7bndVaD8l5QqzTWklCzZ1W7fQzEmddkm3gVmUhtkt3zO6/KE2VejM08l4Q/Pu7w6r9Z6rGx62FP2ONWGyptuAY7cENVdCJyTxqjzfflU+VjomTQz2UN7fa9dAVuDdRVxkXbw+cwGkKxhSNnbO+wCSebBdvYOT3zsvbrv4dFkH7xwLIJDGapjOoppf8i9Xr92H44vm7eIfCYGQt+fvBLQjJfuofneDqXQzgrID9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U/m8oilFsovLoG3wBIrdh75MLHQqxk/oqdJkViWBOPQ=;
 b=R71zgo7vVN1S6dAPAO8//PzF83LxVO+87F21ZyNc4yBEIq1EH9t7OLQQ51ghKqcqu2HylSj6UyX7sUO8/3XjMquC1D1T4550VldPMSbd/eyl9NjlduFBDz7CUpe1NgyQqWfCK/bb2Y14gNfCOh3hugKmgdfsbo82ESntdK4dqMDQ6mezK/YwVnAci5FLKNjsLQMi5x52VMCJbQt1t+q+qg7ZV8gopMjCmCK7SRP21WvFUa3Tz6zciT1eBq/yrQvYcYeHXkh0ysCAmF6Ch98qMp+CctHhkopdLwvGOg7Sl0fAB7JpSocRJcRqKSzd+5YYeLIWFrfQST4Cscn0hT8vIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U/m8oilFsovLoG3wBIrdh75MLHQqxk/oqdJkViWBOPQ=;
 b=Qohoy/fKWKEatOLpecu0jNrz0/Ma+aHthJ8/xelYY8gLhJxRuJqpSARPII5qLlBF0gnD3M1IDYuZ6UhJVwWOrWRJaDBOTsYhXQa0tIl2ybOuKAjkwo9zAmqbLlkvSLhAqCZu4v4hqjaKASUhn9Cn/mntAGEd76PQ43DTxE8g5Ik=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by PR3PR08MB5787.eurprd08.prod.outlook.com (2603:10a6:102:90::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5924.9; Tue, 13 Dec
 2022 14:37:18 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::1ecf:7fb9:8c0:8119]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::1ecf:7fb9:8c0:8119%9]) with mapi id 15.20.5924.009; Tue, 13 Dec 2022
 14:37:17 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
CC: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 09/24] gtk+3: update 3.24.34 -> 3.24.35
Thread-Topic: [OE-core] [PATCH 09/24] gtk+3: update 3.24.34 -> 3.24.35
Thread-Index: AQHZDuPUpmVol0uRhUiuL/8a5IdpEq5r4vaA
Date: Tue, 13 Dec 2022 14:37:17 +0000
Message-ID: <7581DDCC-E835-4768-AC73-05A566255286@arm.com>
References: <20221213111118.149697-1-alex@linutronix.de>
 <20221213111118.149697-9-alex@linutronix.de>
In-Reply-To: <20221213111118.149697-9-alex@linutronix.de>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3731.200.110.1.12)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|PR3PR08MB5787:EE_|VI1EUR03FT031:EE_|DU0PR08MB8833:EE_
X-MS-Office365-Filtering-Correlation-Id: 38e33c47-1edc-46de-b4b5-08dadd178fda
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 mf5fiI9kZ5B8+07Vv9p4jH1JKHSfQUuP69z4UoXFmWwnD0CIHMINW5sW3jnYYPeHg1FgKGUWyPWlObQ+q0q+omPW03uD3fLkpAE2zrgnQsxSXCKcj1VorqSTzYmnQb3hqlBhciOkrVpki/mzPWrXkzT8lULJfh6FYRpE45MEJ0lmwkTqpzBj8rGXonVU/dfZ4nWljEo8l5IWV6iUFx3QFxhExiS7RMlU6oOvnJEe10BrG9tuwEW34FNZw8jXHu1Q2TNQFMhqyhR6WDqm2IkA4wlGZbZujDDjnR0e1/UXfB2B/0l/w8f+8VB9czGwT2GujB9frrB/hqfsAMpAxh21meBX/fpOIEniDZzVyh8ybHLZ/T2cTdX/+CUEEzLdTA9ROT6S0h/+OkRw8Kah2sOfmoyMULqRqJ3eEnxQqHTAkprkca6qbNO+eJ8QiGMZsvR7CEVzXFwx6SdmIVgAMs7pg74cj4FU+nsegTcUhm1V8lxIwCL51mTi0FStciVOkPkCwvL2fD7L1REcHiM4SmEf10+FWSzO2oMrY9HEpIyxcynJ7A6T7Y0sNJQGVh9obbC3wsFZYprd9nE0SoggVPtHFrYdVlJz74LcxAm+Xr4zT2uLrwElxgKfrCWJrbCMLIPmeIj5Y6USRgs0+bMAgrhh9w0Qd1W/5YSV+uzmEUJMy57junmpS1OGzx6RUmnkyoeOIB2++zGuPo70OF6z6BPJ4Bh8XpWymDUnA3Q6pPnpaIgiwPNu7dAEvc0xCwE7FZamcRB7XtniSDY6Vg6GRG9frw==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(376002)(366004)(396003)(39860400002)(136003)(451199015)(83380400001)(66899015)(2906002)(33656002)(6486002)(86362001)(966005)(478600001)(36756003)(2616005)(38070700005)(66946007)(122000001)(38100700002)(4326008)(8676002)(186003)(91956017)(6512007)(71200400001)(53546011)(6506007)(26005)(19627235002)(5660300002)(316002)(6916009)(76116006)(64756008)(41300700001)(66476007)(66556008)(15650500001)(8936002)(66446008)(290074003)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <D0E1ECE4667530469121D80595CE0042@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR08MB5787
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 VI1EUR03FT031.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	9c5395f4-0eec-426b-60e4-08dadd1788c1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	QRZlCXPGLsZSN5DkW9OuYXXPQLioc3QEhu8TKgY66a9Zy4Ifhcz5BMwAu1VVRm8N6RvjOlLCsk9Pu61lMIllkEZD9oyMCxkaWUOuXBMncbXJlUVm86zFqcGfiRMlQAaW++w0tOmxUAFoGx1to0wRMFASUI/ndkujFtviw5KllNRWQw7Aq6l/ec8vSH9dyiTv6VRUiwvFbqZfMWL9l158+Fqy3Y0hMbYz6mlyuLvysoppX4RWGe1PkaUTcqM4upZrky5Tg2c0baqh7JpE/YZb1iKq13I543imzur3n8PF+VB+zPIXPguRxug51o2vjKfHYQlvwLVYrB2F7V2Si3/Cm7NYRQChegqv3pLVlVouF4qD2+nY0C67JsqC1WJOqfDWzuVpZ+1wCyOxcDatWl1EgEWwXbDm8hmbe0awtPLswUkWJ5Z/7/ftqaDhuiU9F/CNsJ0Kc10/4BuFuhm5WsNQC+91NPUjESvC2BjdFa/skzmxMdIlIYc/X9Elveb3R46vOT2xa86qyQqUfhQ17+0nKCB+PkwixUg/S+sQ3bj9Mhi90TMM9ESVYHA/jZG48/xgflCiWyP1FcQG34QAcgUYOrsGayAKSK1UPhLOytwvMpZrjfhF4FAKKnw7C3BOJVW761T/VCLxeP0xBeSImpnN+5SQHRwRs3qlw/0U+OKelSP+k4kNMXOrFnYgOyJeKa3UxDMPf2Qmliyd56oMh0XoQIKkifwhimJVp68dKTaH26Jf5mroNfwcmKIN6P28sNc5
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(396003)(136003)(39860400002)(376002)(346002)(451199015)(46966006)(40470700004)(36840700001)(40480700001)(36756003)(6512007)(33656002)(86362001)(478600001)(966005)(40460700003)(2906002)(6486002)(5660300002)(19627235002)(26005)(53546011)(6506007)(41300700001)(8676002)(4326008)(15650500001)(316002)(70206006)(70586007)(186003)(6862004)(82310400005)(336012)(81166007)(8936002)(36860700001)(47076005)(82740400003)(2616005)(83380400001)(356005)(66899015)(290074003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Dec 2022 14:37:29.2557
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 38e33c47-1edc-46de-b4b5-08dadd178fda
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	VI1EUR03FT031.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB8833
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 13 Dec 2022 14:37:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174535

I just posted this, and have a followup to move to Meson too that is just g=
oing through the final tweaks.

Ross

> On 13 Dec 2022, at 11:11, Alexander Kanavin via lists.openembedded.org <a=
lex.kanavin=3Dgmail.com@lists.openembedded.org> wrote:
>=20
> Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> ---
> ...-Add-disable-opengl-configure-option.patch | 60 +++++++++----------
> .../{gtk+3_3.24.34.bb =3D> gtk+3_3.24.35.bb}    |  2 +-
> 2 files changed, 31 insertions(+), 31 deletions(-)
> rename meta/recipes-gnome/gtk+/{gtk+3_3.24.34.bb =3D> gtk+3_3.24.35.bb} (=
89%)
>=20
> diff --git a/meta/recipes-gnome/gtk+/gtk+3/0003-Add-disable-opengl-config=
ure-option.patch b/meta/recipes-gnome/gtk+/gtk+3/0003-Add-disable-opengl-co=
nfigure-option.patch
> index 35cbab8761..ea8bd28e7b 100644
> --- a/meta/recipes-gnome/gtk+/gtk+3/0003-Add-disable-opengl-configure-opt=
ion.patch
> +++ b/meta/recipes-gnome/gtk+/gtk+3/0003-Add-disable-opengl-configure-opt=
ion.patch
> @@ -1,4 +1,4 @@
> -From eef50c94587fc30cd624adb5eb213eb9fa663dc1 Mon Sep 17 00:00:00 2001
> +From 8f3edf5f8379ac482d9eb7a64d7408b5f95535ce Mon Sep 17 00:00:00 2001
> From: Jussi Kukkonen <jussi.kukkonen@intel.com>
> Date: Tue, 21 Jun 2016 15:11:39 +0300
> Subject: [PATCH] Add --disable-opengl configure option
> @@ -25,7 +25,7 @@ Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com=
>
>  demos/gtk-demo/glarea.c                    | 14 ++++++
>  docs/tools/Makefile.am                     |  9 +++-
>  docs/tools/widgets.c                       |  4 +-
> - gdk/Makefile.am                            |  8 ++-
> + gdk/gdk-sources.inc                        |  8 ++-
>  gdk/gdkdisplay.c                           |  4 +-
>  gdk/gdkgl.c                                | 10 ++++
>  gdk/gdkglcontext.c                         |  6 +++
> @@ -47,7 +47,7 @@ Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com=
>
>  create mode 100644 gdk/x11/gdkx-without-gl-context.h
>=20
> diff --git a/configure.ac b/configure.ac
> -index 851bcbf..6cbf6a2 100644
> +index 9ed65e5..70c6836 100644
> --- a/configure.ac
> +++ b/configure.ac
> @@ -346,6 +346,15 @@ AC_ARG_ENABLE(cloudproviders,
> @@ -66,7 +66,7 @@ index 851bcbf..6cbf6a2 100644
>  AC_ARG_ENABLE(glx,
>                [AS_HELP_STRING([--enable-glx],
>                                [When enabled Gdk will try to initialize G=
LX])])
> -@@ -1345,7 +1354,7 @@ CFLAGS=3D"$saved_cflags"
> +@@ -1367,7 +1376,7 @@ CFLAGS=3D"$saved_cflags"
>  LDFLAGS=3D"$saved_ldflags"
>=20
>  GDK_PACKAGES=3D"$PANGO_PACKAGES gdk-pixbuf-2.0 >=3D gdk_pixbuf_required_=
version cairo >=3D cairo_required_version cairo-gobject >=3D cairo_required=
_version"
> @@ -75,7 +75,7 @@ index 851bcbf..6cbf6a2 100644
>=20
>  PKG_CHECK_MODULES(GDK_DEP, $GDK_PACKAGES $GDK_PRIVATE_PACKAGES)
>  GDK_DEP_LIBS=3D"$GDK_EXTRA_LIBS $GDK_DEP_LIBS $MATH_LIB"
> -@@ -1379,7 +1388,7 @@ fi
> +@@ -1401,7 +1410,7 @@ fi
>  PKG_CHECK_MODULES(ATK, $ATK_PACKAGES)
>=20
>  GTK_PACKAGES=3D"atk >=3D atk_required_version cairo >=3D cairo_required_=
version cairo-gobject >=3D cairo_required_version gdk-pixbuf-2.0 >=3D gdk_p=
ixbuf_required_version gio-2.0 >=3D glib_required_version"
> @@ -209,11 +209,11 @@ index 932daf1..54239d6 100644
>    info =3D new_widget_info ("glarea", widget, MEDIUM);
>=20
>    return info;
> -diff --git a/gdk/Makefile.am b/gdk/Makefile.am
> -index 710a548..b45f631 100644
> ---- a/gdk/Makefile.am
> -+++ b/gdk/Makefile.am
> -@@ -274,7 +274,6 @@ x11_introspection_files =3D \
> +diff --git a/gdk/gdk-sources.inc b/gdk/gdk-sources.inc
> +index 9235edb..eb59524 100644
> +--- a/gdk/gdk-sources.inc
> ++++ b/gdk/gdk-sources.inc
> +@@ -146,7 +146,6 @@ x11_introspection_files =3D \
>   x11/gdkeventsource.c \
>   x11/gdkeventtranslator.c \
>   x11/gdkgeometry-x11.c \
> @@ -221,7 +221,7 @@ index 710a548..b45f631 100644
>   x11/gdkkeys-x11.c \
>   x11/gdkmain-x11.c \
>   x11/gdkmonitor-x11.c \
> -@@ -300,7 +299,6 @@ x11_introspection_files =3D \
> +@@ -172,7 +171,6 @@ x11_introspection_files =3D \
>   x11/gdkx11display.h \
>   x11/gdkx11displaymanager.h \
>   x11/gdkx11dnd.h \
> @@ -229,19 +229,19 @@ index 710a548..b45f631 100644
>   x11/gdkx11keys.h \
>   x11/gdkx11monitor.h \
>   x11/gdkx11property.h \
> -@@ -310,6 +308,12 @@ x11_introspection_files =3D \
> +@@ -182,6 +180,12 @@ x11_introspection_files =3D \
>   x11/gdkx11visual.h \
>   x11/gdkx11window.h
>=20
> +if HAVE_OPENGL
> -+x11_introspection_files +=3D \
> -+ x11/gdkglcontext-x11.c \
> -+ x11/gdkx11glcontext.h
> ++x11_introspection_files +=3D              \
> ++        x11/gdkglcontext-x11.c          \
> ++        x11/gdkx11glcontext.h
> +endif
> +
> - GdkX11-3.0.gir: libgdk-3.la Gdk-3.0.gir Makefile
> - GdkX11_3_0_gir_SCANNERFLAGS =3D \
> - --identifier-prefix=3DGdk \
> + w32_introspection_files =3D \
> + win32/gdkcursor-win32.c \
> + win32/gdkdevicemanager-win32.c \
> diff --git a/gdk/gdkdisplay.c b/gdk/gdkdisplay.c
> index 748f548..911ab2a 100644
> --- a/gdk/gdkdisplay.c
> @@ -380,7 +380,7 @@ index 3b23639..1f04f8e 100644
>=20
>  /**
> diff --git a/gdk/gdkwindow.c b/gdk/gdkwindow.c
> -index 2de8ba4..1883a79 100644
> +index 727b0cf..d4d91b0 100644
> --- a/gdk/gdkwindow.c
> +++ b/gdk/gdkwindow.c
> @@ -45,7 +45,9 @@
> @@ -538,10 +538,10 @@ index 7e08f47..30fd7b6 100644
>    display_class->get_default_seat =3D gdk_x11_display_get_default_seat;
>=20
> diff --git a/gdk/x11/gdkscreen-x11.c b/gdk/x11/gdkscreen-x11.c
> -index bb4df05..46f5349 100644
> +index c2b7480..114fd4c 100644
> --- a/gdk/x11/gdkscreen-x11.c
> +++ b/gdk/x11/gdkscreen-x11.c
> -@@ -1827,3 +1827,8 @@ gdk_x11_screen_get_current_desktop (GdkScreen *scr=
een)
> +@@ -1842,3 +1842,8 @@ gdk_x11_screen_get_current_desktop (GdkScreen *scr=
een)
>  {
>    return get_netwm_cardinal_property (screen, "_NET_CURRENT_DESKTOP");
>  }
> @@ -551,7 +551,7 @@ index bb4df05..46f5349 100644
> +void _gdk_x11_screen_update_visuals_for_gl (GdkScreen *screen) {}
> +#endif
> diff --git a/gdk/x11/gdkwindow-x11.c b/gdk/x11/gdkwindow-x11.c
> -index 721d9bb..8e87acc 100644
> +index 194bc82..0302bb6 100644
> --- a/gdk/x11/gdkwindow-x11.c
> +++ b/gdk/x11/gdkwindow-x11.c
> @@ -36,7 +36,9 @@
> @@ -564,7 +564,7 @@ index 721d9bb..8e87acc 100644
>  #include "gdkprivate-x11.h"
>  #include "gdk-private.h"
>=20
> -@@ -5881,7 +5883,9 @@ gdk_window_impl_x11_class_init (GdkWindowImplX11Cl=
ass *klass)
> +@@ -5888,7 +5890,9 @@ gdk_window_impl_x11_class_init (GdkWindowImplX11Cl=
ass *klass)
>    impl_class->set_opaque_region =3D gdk_x11_window_set_opaque_region;
>    impl_class->set_shadow_width =3D gdk_x11_window_set_shadow_width;
>    impl_class->show_window_menu =3D gdk_x11_window_show_window_menu;
> @@ -668,10 +668,10 @@ index 0000000..c9e2617
> +
> +#endif /* __GDK_X_H__ */
> diff --git a/gtk/Makefile.am b/gtk/Makefile.am
> -index 074fb35..4fa9eb6 100644
> +index 946e72f..b01da7f 100644
> --- a/gtk/Makefile.am
> +++ b/gtk/Makefile.am
> -@@ -1457,7 +1457,7 @@ gtktypefuncs.inc: stamp-gtktypebuiltins.h stamp-gt=
kprivatetypebuiltins.h $(top_s
> +@@ -467,7 +467,7 @@ gtktypefuncs.inc: stamp-gtktypebuiltins.h stamp-gtkp=
rivatetypebuiltins.h $(top_s
>    ${CPP} $(DEFS) $(AM_CPPFLAGS) $(CPPFLAGS) $(AM_CFLAGS) $(CFLAGS) xgen-=
gtfsrc.c | \
>    $(GREP) -o '\bg[td]k_[a-zA-Z0-9_]*_get_type\b' | \
>    sort | uniq | \
> @@ -777,7 +777,7 @@ index 802303e..33001cf 100644
>=20
>  static gboolean
> diff --git a/gtk/inspector/general.c b/gtk/inspector/general.c
> -index 48237d1..1f9b9be 100644
> +index 4fd0c30..a8e59ed 100644
> --- a/gtk/inspector/general.c
> +++ b/gtk/inspector/general.c
> @@ -33,8 +33,10 @@
> @@ -791,7 +791,7 @@ index 48237d1..1f9b9be 100644
>=20
>  #ifdef GDK_WINDOWING_WIN32
>  #include "win32/gdkwin32.h"
> -@@ -196,6 +198,7 @@ add_label_row (GtkInspectorGeneral *gen,
> +@@ -217,6 +219,7 @@ add_label_row (GtkInspectorGeneral *gen,
>    gtk_size_group_add_widget (GTK_SIZE_GROUP (gen->priv->labels), label);
>  }
>=20
> @@ -799,7 +799,7 @@ index 48237d1..1f9b9be 100644
>  #ifdef GDK_WINDOWING_X11
>  static void
>  append_glx_extension_row (GtkInspectorGeneral *gen,
> -@@ -205,6 +208,7 @@ append_glx_extension_row (GtkInspectorGeneral *gen,
> +@@ -226,6 +229,7 @@ append_glx_extension_row (GtkInspectorGeneral *gen,
>    add_check_row (gen, GTK_LIST_BOX (gen->priv->gl_box), ext, epoxy_has_g=
lx_extension (dpy, 0, ext), 0);
>  }
>  #endif
> @@ -807,7 +807,7 @@ index 48237d1..1f9b9be 100644
>=20
>  #ifdef GDK_WINDOWING_WAYLAND
>  static void
> -@@ -254,6 +258,7 @@ wayland_get_display (struct wl_display *wl_display)
> +@@ -275,6 +279,7 @@ wayland_get_display (struct wl_display *wl_display)
>  static void
>  init_gl (GtkInspectorGeneral *gen)
>  {
> @@ -815,7 +815,7 @@ index 48237d1..1f9b9be 100644
>  #ifdef GDK_WINDOWING_X11
>    if (GDK_IS_X11_DISPLAY (gdk_display_get_default ()))
>      {
> -@@ -280,6 +285,7 @@ init_gl (GtkInspectorGeneral *gen)
> +@@ -301,6 +306,7 @@ init_gl (GtkInspectorGeneral *gen)
>      }
>    else
>  #endif
> diff --git a/meta/recipes-gnome/gtk+/gtk+3_3.24.34.bb b/meta/recipes-gnom=
e/gtk+/gtk+3_3.24.35.bb
> similarity index 89%
> rename from meta/recipes-gnome/gtk+/gtk+3_3.24.34.bb
> rename to meta/recipes-gnome/gtk+/gtk+3_3.24.35.bb
> index f862e143d4..3a63ef57fc 100644
> --- a/meta/recipes-gnome/gtk+/gtk+3_3.24.34.bb
> +++ b/meta/recipes-gnome/gtk+/gtk+3_3.24.35.bb
> @@ -7,7 +7,7 @@ SRC_URI =3D "http://ftp.gnome.org/pub/gnome/sources/gtk+/=
${MAJ_VER}/gtk+-${PV}.tar
>            file://0003-Add-disable-opengl-configure-option.patch \
>            file://link_fribidi.patch \
>            "
> -SRC_URI[sha256sum] =3D "dbc69f90ddc821b8d1441f00374dc1da4323a2eafa9078e6=
1edbe5eeefa852ec"
> +SRC_URI[sha256sum] =3D "ec10fe6d712ef0b3c63b5f932639c9d1ae99fce94f500f6f=
06965629fef60bd1"
>=20
> S =3D "${WORKDIR}/gtk+-${PV}"
>=20
> --=20
> 2.30.2
>=20
>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#174519): https://lists.openembedded.org/g/openembedde=
d-core/message/174519
> Mute This Topic: https://lists.openembedded.org/mt/95642219/6875888
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ro=
ss.burton@arm.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20


