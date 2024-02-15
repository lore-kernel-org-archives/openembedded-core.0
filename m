Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98411C4829E
	for <webhook@archiver.kernel.org>; Thu, 15 Feb 2024 11:25:46 +0000 (UTC)
Received: from EUR03-AM7-obe.outbound.protection.outlook.com (EUR03-AM7-obe.outbound.protection.outlook.com [40.107.105.66])
 by mx.groups.io with SMTP id smtpd.web11.11899.1707996342753642664
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Feb 2024 03:25:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=MP1OU7Q+;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=MP1OU7Q+;
 spf=pass (domain: arm.com, ip: 40.107.105.66, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=Ybo5icXvzIMjyobJxO7Nm85YoEDuwllgdq4c4jo/6e1p0f1d5CKGt6ZbEibTOadwPz3axeW4woCbI+Ke7chqFK1qUXAUE+e2i6m0WoVyAWQaMkHLH9GY5qoF/KUftPP6xttRD223dvgCeBytnXKIbOTdQkCEl8gp9ZkJ+7O4Z7CmmJ1zEQlv166U3kj+djy4gVxOYc1Upli+NdDoCExdMY2gRXDsrdirsTiubsB4fBTG3JNOynlJZp+kyTbJZxmgQzHfegSWS4eC5tBi3MPUFb2Thnez6OVM2li1nLEDTToB7A6g44hQbCYC33kmkTeGjiONtbS1eAq8cfJfMiaBtg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h1Wvxzx6f3KSuGSEYEOpQjWxanf8ewlGe12nCamMsgY=;
 b=i49sCDvbHzkfpyPXSm64qPkyUs1aBS94uTOWANgoyaTnIOqOSI9r+2y6ixG7owLLYYLHsvflgUQFhhaVblHmpDi59DhTvCNyBxXG34ZjiAyUigE6aiRRnhEQBy4jiZaNftBfXPyYoGjwchFbtAEtw1k7SvvJvaNnUFb7l/gPr8u14zpLaIqtTqmySYJMbcmHHabQ93ASNhoclgzsTIsoqytB92J32J5HaVNjsGZs4eUIFrDmnedORujCawCkFQxPkZT7UJ8JpbpyV9rKrp9LHgDyL1FdWVnaEsolVoVBi/e0AWr83UeFO8ZDSn+ng5+n/VmlLeIiE9A4luR8vh93Lg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h1Wvxzx6f3KSuGSEYEOpQjWxanf8ewlGe12nCamMsgY=;
 b=MP1OU7Q+hMBlfgHRZmDMEDXVBP+CgxXJzi764xHs0dLLh4shDuvgrwyv4SBk4jj1jYQGiqs3LeX9Z9q95YZc5rFfsVsoKl0RiZ1a4+fF3BNh3HXEnFizl6sn86HqIBKFRZpKaJYpmxbuNh/SiVWq8LXXQkKQP1/2LrjU4I34OgI=
Received: from DUZPR01CA0148.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4bd::15) by GV1PR08MB8329.eurprd08.prod.outlook.com
 (2603:10a6:150:84::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7270.39; Thu, 15 Feb
 2024 11:25:33 +0000
Received: from DU2PEPF0001E9C5.eurprd03.prod.outlook.com
 (2603:10a6:10:4bd:cafe::89) by DUZPR01CA0148.outlook.office365.com
 (2603:10a6:10:4bd::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.26 via Frontend
 Transport; Thu, 15 Feb 2024 11:25:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DU2PEPF0001E9C5.mail.protection.outlook.com (10.167.8.74) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7292.25 via Frontend Transport; Thu, 15 Feb 2024 11:25:33 +0000
Received: ("Tessian outbound a6e56d06a0e4:v228"); Thu, 15 Feb 2024 11:25:33 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: e496759fadc5f678
X-CR-MTA-TID: 64aa7808
Received: from 8094059271f0.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 8169F948-096E-47EF-81B5-923FD7AD36C8.1;
	Thu, 15 Feb 2024 11:25:26 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 8094059271f0.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 15 Feb 2024 11:25:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YDHy8Q7cIZSsdRRXdqfAdtab4mCfETpQPLo65w69uka3R7r0xE1I/qIq0ZMhBwTdPZSmi49bgLrLVo/PR3510xhP7mdeNzUcgSOIAfhqvj95thh/LRlM+45p9sMwcHI7BwpB1pxBS0O7jw/eD+IOJvPDbMGS7LLMHY7mm3kheFHalKASL1Y8A8lOysl+PMylVEsYy6OipOeHwOjgfbPAH9FqsyIBG5Gcm/ZQ+beGlGpLStKLIGIFUJHLsQrGfwKQHp/tCpgVkb5eb41GeNjyJIXz7kW0QMdqyZqAsDmeh9JDFCUdry8QDEvOFbL8da3Vb0nbgFyeHBBHTLlrdzfW7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h1Wvxzx6f3KSuGSEYEOpQjWxanf8ewlGe12nCamMsgY=;
 b=Nz9ept3fyfMyyoAhL3+uS+gsKQhTI+TOM4Ta9t5Y1ID3UnpmGHg1dBLuWt19w2YcQBujj29SFbjy+swvbWEpe24L/Jn8+963Ug7QM8LTbWCFpMsikFr3UIHvQeltduF3ZRwgSo8UY2/zrF5NoCtUjMsYHoFJ8vjQ2FUZ2nwqIh2CkmAsrhxJh0Y/rTyDt0s0H0VdUmmKi77BD2qds6XkiKkxEEXtPSAbF7NQegwwTzovZ2718lLlaT823wAFouEEQCdPY27lLFLTk90r6V2hQFnNYvuWGwPgbDjb+CR8CF0FbcIWJ8EENg1qbOcfq7OFktYlUfbfcinuIdzN4c3v5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h1Wvxzx6f3KSuGSEYEOpQjWxanf8ewlGe12nCamMsgY=;
 b=MP1OU7Q+hMBlfgHRZmDMEDXVBP+CgxXJzi764xHs0dLLh4shDuvgrwyv4SBk4jj1jYQGiqs3LeX9Z9q95YZc5rFfsVsoKl0RiZ1a4+fF3BNh3HXEnFizl6sn86HqIBKFRZpKaJYpmxbuNh/SiVWq8LXXQkKQP1/2LrjU4I34OgI=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by PAVPR08MB9860.eurprd08.prod.outlook.com (2603:10a6:102:2f4::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.29; Thu, 15 Feb
 2024 11:25:24 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::740e:ab01:e66a:61c9]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::740e:ab01:e66a:61c9%3]) with mapi id 15.20.7270.036; Thu, 15 Feb 2024
 11:25:24 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Markus Volk <f_l_k@t-online.de>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [oe-core][PATCH] mesa: update 23.3.5 -> 24.0.0
Thread-Topic: [oe-core][PATCH] mesa: update 23.3.5 -> 24.0.0
Thread-Index: AQHaX3G/Lw0uNettBE6vXJAfiQaevLELRGWA
Date: Thu, 15 Feb 2024 11:25:24 +0000
Message-ID: <1A350816-2A84-452F-B41D-E99BE46C4D82@arm.com>
References: <20240214181453.795654-1-f_l_k@t-online.de>
In-Reply-To: <20240214181453.795654-1-f_l_k@t-online.de>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3774.400.31)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|PAVPR08MB9860:EE_|DU2PEPF0001E9C5:EE_|GV1PR08MB8329:EE_
X-MS-Office365-Filtering-Correlation-Id: acb05cce-4338-48fc-d515-08dc2e18d303
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 SQI0cXbohI7h9sQEj5nblFIvf9yILyMLKZ/nfwDiu7CaqB1szNC1RgHpi9iwW5rr+ratocD9CZXLQ5ssy05lU747mcpgPGjqgu9KyHXNKv/fmfU7NmryNm64B781nQs/BeafpCJD73yfIlA7uIpfk485u/9SG69buroKpSh1WiSRTSyYmI1+83821KJbs1KjxZprALSiJkNIZXSiYbbS4eFGq4GYNkGx6dFaMHFdUGnfFETqUGehlDbya6uObmOz7MkCUoDda/CmNkH2jRSRHfchrQSWVMeqNuQKWnvvxFczTxzpSiRotIeSXunDUZOCkIaF6/DwE4f9weUpwpl2a9Zapos3pngLZXL3H2hx6hgYrl44pKcXTDDnwd079APRCzUfzLePKuZlYU17GODUQsOGqO5Sw7sF+vLgY4+yN6EzsiqL/d40g3grcxTrHZnDIxAi6+GfbK1ZMugvrKDHrGAUSL8YBIxOSUiygGiXjQ+HFogJ09eBQDR1LHVBLd3m1/MVWs9bNGrqzuG1leYwKz8CIkz0ZA6yejzsdTcWnDSYNbrCadAJtFQ3gYQHxmr1l1ZIvEt3AJbyobukaqDrpXUKPFSDxDiADXb70U41EMk=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(346002)(396003)(39860400002)(136003)(376002)(230922051799003)(1800799012)(186009)(451199024)(64100799003)(5660300002)(15650500001)(66899024)(66946007)(2906002)(4326008)(66556008)(66476007)(66446008)(64756008)(76116006)(8936002)(8676002)(6916009)(33656002)(36756003)(122000001)(38100700002)(86362001)(83380400001)(38070700009)(316002)(478600001)(6486002)(6506007)(53546011)(966005)(6512007)(26005)(41300700001)(71200400001)(2616005);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <914970795E9FFE4A8C5DBE9A1A87C064@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR08MB9860
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DU2PEPF0001E9C5.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	5ed2e879-e86f-44cd-b199-08dc2e18cd70
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	R8Hzx9xuSb8EyLnNlMZ1JzBozXupyISlzwU+LHKIoOH39jrjvz0U97BTFwxkTSg7Slx7KZjWpO93MjZPXWYx5kAjwannaFzQWft4BkorkQ/EmWkfPctozOdzNaRp5/1yqJm3WxYL1b/uiUqvtzL6/DTAGS5IaYL8OuF7nSssKEE1f/G3gfj6nOHcth2gDgYWB1NqHHVXILqO37f6mNUe3PQVRPq2DBN7LuZG/RfbTD3Z694y/1pMZVsXNnOV4bj2xG2KYv7E6fA7KDq0Gb0iAlONTz38Uv19e9HbYC/Fv9P/acJu2VnZbBs5jR5130w5USuhnMY2b5jAV10m/pzRwI5WjXnz5ROBr1q/XYnURc3h/CZziHjnES4sIm3gomNQ1OvOrP/ggX3QoRTQctaXyhbKhormdAmBnCrhvuXQlmQ/HohoZKgo+CZl9X8uoGnOnxHgNCZ9gYyy6Hi2uHhfCnMNnMzIy6J89+l0obNIDKsqtprIJUbbHa4XYxJAsE2Lf/hpwBA9h1/JXJyVSwIBPfTaejGCT/dFBVSxYQw1OwadOC0cXgMWoydkPZFF/locXjyLBMQmuSn1CHRwcRb1Ugua5/8qSt0t6Rv0LUqs0WCQkWSFv5u7Ut112lGdsV8OfVHqzIAU6tKxKnIjbMtMIg==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(39860400002)(396003)(376002)(136003)(346002)(230922051799003)(1800799012)(451199024)(64100799003)(82310400011)(186009)(36860700004)(40470700004)(46966006)(36756003)(33656002)(6512007)(478600001)(83380400001)(2616005)(53546011)(70586007)(336012)(70206006)(4326008)(6506007)(8676002)(6862004)(8936002)(6486002)(316002)(356005)(86362001)(82740400003)(41300700001)(26005)(966005)(66899024)(81166007)(5660300002)(15650500001)(2906002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Feb 2024 11:25:33.4104
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: acb05cce-4338-48fc-d515-08dc2e18d303
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DU2PEPF0001E9C5.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB8329
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Feb 2024 11:25:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195510

Mesa 24.0.0 is - as clearly indicated on the web site - a development snaps=
hot.  24.0.1 is now out, can you upgrade to that?

Ross

> On 14 Feb 2024, at 18:14, Markus Volk via lists.openembedded.org <f_l_k=
=3Dt-online.de@lists.openembedded.org> wrote:
>=20
> - refresh 0001-meson.build-check-for-all-linux-host_os-combinations.patch
> - rework VIDEO_CODECS. mesa now provides options for 'all' and 'all_free'
>  Adjust accordingly.
>  Free codecs are built by default:
>    Codecs                       : av1dec av1enc vp9dec
>  If LICENSE_FLAGS_ACCEPTED contains 'commercial' all supported codecs are=
 built:
>    Codecs                       : vc1dec h264dec h264enc h265dec h265enc
>                                   av1dec av1enc vp9dec
>=20
> Signed-off-by: Markus Volk <f_l_k@t-online.de>
> ---
> ...ld-check-for-all-linux-host_os-combinations.patch | 12 ++++++------
> .../mesa/{mesa-gl_23.3.5.bb =3D> mesa-gl_24.0.0.bb}    |  0
> meta/recipes-graphics/mesa/mesa.inc                  |  8 ++++----
> .../mesa/{mesa_23.3.5.bb =3D> mesa_24.0.0.bb}          |  0
> 4 files changed, 10 insertions(+), 10 deletions(-)
> rename meta/recipes-graphics/mesa/{mesa-gl_23.3.5.bb =3D> mesa-gl_24.0.0.=
bb} (100%)
> rename meta/recipes-graphics/mesa/{mesa_23.3.5.bb =3D> mesa_24.0.0.bb} (1=
00%)
>=20
> diff --git a/meta/recipes-graphics/mesa/files/0001-meson.build-check-for-=
all-linux-host_os-combinations.patch b/meta/recipes-graphics/mesa/files/000=
1-meson.build-check-for-all-linux-host_os-combinations.patch
> index fadd6ee201..b0be8d0feb 100644
> --- a/meta/recipes-graphics/mesa/files/0001-meson.build-check-for-all-lin=
ux-host_os-combinations.patch
> +++ b/meta/recipes-graphics/mesa/files/0001-meson.build-check-for-all-lin=
ux-host_os-combinations.patch
> @@ -23,21 +23,21 @@ diff --git a/meson.build b/meson.build
> index 35cc5f1..9a49c0d 100644
> --- a/meson.build
> +++ b/meson.build
> -@@ -121,7 +121,7 @@ with_any_opengl =3D with_opengl or with_gles1 or wit=
h_gles2
> +@@ -128,7 +128,7 @@
>  # Only build shared_glapi if at least one OpenGL API is enabled
>  with_shared_glapi =3D with_shared_glapi and with_any_opengl
>=20
> --system_has_kms_drm =3D ['openbsd', 'netbsd', 'freebsd', 'gnu/kfreebsd',=
 'dragonfly', 'linux', 'sunos', 'android'].contains(host_machine.system())
> -+system_has_kms_drm =3D ['openbsd', 'netbsd', 'freebsd', 'gnu/kfreebsd',=
 'dragonfly', 'linux', 'sunos', 'android'].contains(host_machine.system()) =
or host_machine.system().startswith('linux')
> +-system_has_kms_drm =3D ['openbsd', 'netbsd', 'freebsd', 'gnu/kfreebsd',=
 'dragonfly', 'linux', 'sunos', 'android', 'managarm'].contains(host_machin=
e.system())
> ++system_has_kms_drm =3D ['openbsd', 'netbsd', 'freebsd', 'gnu/kfreebsd',=
 'dragonfly', 'linux', 'sunos', 'android', 'managarm'].contains(host_machin=
e.system()) or host_machine.system().startswith('linux')
>=20
>  gallium_drivers =3D get_option('gallium-drivers')
>  if gallium_drivers.contains('auto')
> -@@ -956,7 +956,7 @@ if cc.has_function('fmemopen')
> +@@ -998,7 +998,7 @@
>  endif
>=20
>  # TODO: this is very incomplete
> --if ['linux', 'cygwin', 'gnu', 'freebsd', 'gnu/kfreebsd', 'haiku', 'andr=
oid'].contains(host_machine.system())
> -+if ['linux', 'cygwin', 'gnu', 'freebsd', 'gnu/kfreebsd', 'haiku'].conta=
ins(host_machine.system()) or host_machine.system().startswith('linux')
> +-if ['linux', 'cygwin', 'gnu', 'freebsd', 'gnu/kfreebsd', 'haiku', 'andr=
oid', 'managarm'].contains(host_machine.system())
> ++if ['linux', 'cygwin', 'gnu', 'freebsd', 'gnu/kfreebsd', 'haiku', 'andr=
oid', 'managarm'].contains(host_machine.system()) or host_machine.system().=
startswith('linux')
>    pre_args +=3D '-D_GNU_SOURCE'
>  elif host_machine.system() =3D=3D 'sunos'
>    pre_args +=3D '-D__EXTENSIONS__'
> diff --git a/meta/recipes-graphics/mesa/mesa-gl_23.3.5.bb b/meta/recipes-=
graphics/mesa/mesa-gl_24.0.0.bb
> similarity index 100%
> rename from meta/recipes-graphics/mesa/mesa-gl_23.3.5.bb
> rename to meta/recipes-graphics/mesa/mesa-gl_24.0.0.bb
> diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/=
mesa/mesa.inc
> index 3a7b91f637..fabc52f0e7 100644
> --- a/meta/recipes-graphics/mesa/mesa.inc
> +++ b/meta/recipes-graphics/mesa/mesa.inc
> @@ -20,7 +20,7 @@ SRC_URI =3D "https://mesa.freedesktop.org/archive/mesa-=
${PV}.tar.xz \
>            file://0001-gallium-Fix-build-with-llvm-17.patch \
> "
>=20
> -SRC_URI[sha256sum] =3D "69ccb1278641ff5bad71ca0f866188aeb1a92aadc4dbb9d3=
5f50aebec5b8b50f"
> +SRC_URI[sha256sum] =3D "dc7e8c077bc5884df95478263b34bdebb7e88e600689cb56=
fb07be2b8c304c36"
>=20
> UPSTREAM_CHECK_GITTAGREGEX =3D "mesa-(?P<pver>\d+(\.\d+)+)"
>=20
> @@ -81,12 +81,12 @@ def strip_comma(s):
>=20
> PACKAGECONFIG =3D " \
> gallium \
> + video-codecs \
> ${@bb.utils.filter('DISTRO_FEATURES', 'x11 vulkan wayland', d)} \
> ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'opengl egl gles gbm vi=
rgl', '', d)} \
> ${@bb.utils.contains('DISTRO_FEATURES', 'x11 opengl', 'dri3', '', d)} \
> ${@bb.utils.contains('DISTRO_FEATURES', 'x11 vulkan', 'dri3', '', d)} \
> ${@bb.utils.contains('DISTRO_FEATURES', 'vulkan', 'zink', '', d)} \
> - ${@bb.utils.contains('LICENSE_FLAGS_ACCEPTED', 'commercial', 'video-cod=
ecs', '', d)} \
> "
>=20
> PACKAGECONFIG:append:class-native =3D "gallium-llvm r600"
> @@ -203,8 +203,8 @@ PACKAGECONFIG[unwind] =3D "-Dlibunwind=3Denabled,-Dli=
bunwind=3Ddisabled,libunwind"
>=20
> PACKAGECONFIG[lmsensors] =3D "-Dlmsensors=3Denabled,-Dlmsensors=3Ddisable=
d,lmsensors"
>=20
> -VIDEO_CODECS =3D "vc1dec,h264dec,h264enc,h265dec,h265enc"
> -PACKAGECONFIG[video-codecs] =3D "-Dvideo-codecs=3D${@strip_comma('${VIDE=
O_CODECS}')}, -Dvideo-codecs=3D''"
> +VIDEO_CODECS ?=3D "${@bb.utils.contains('LICENSE_FLAGS_ACCEPTED', 'comme=
rcial', 'all', 'all_free', d)}"
> +PACKAGECONFIG[video-codecs] =3D "-Dvideo-codecs=3D${VIDEO_CODECS}, -Dvid=
eo-codecs=3D''"
>=20
> # llvmpipe is slow if compiled with -fomit-frame-pointer (e.g. -O2)
> FULL_OPTIMIZATION:append =3D " -fno-omit-frame-pointer"
> diff --git a/meta/recipes-graphics/mesa/mesa_23.3.5.bb b/meta/recipes-gra=
phics/mesa/mesa_24.0.0.bb
> similarity index 100%
> rename from meta/recipes-graphics/mesa/mesa_23.3.5.bb
> rename to meta/recipes-graphics/mesa/mesa_24.0.0.bb
> --=20
> 2.43.0
>=20
>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#195492): https://lists.openembedded.org/g/openembedde=
d-core/message/195492
> Mute This Topic: https://lists.openembedded.org/mt/104358245/6875888
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ro=
ss.burton@arm.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20


