Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83422C3DA7D
	for <webhook@archiver.kernel.org>; Tue,  3 Jan 2023 16:30:22 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.75])
 by mx.groups.io with SMTP id smtpd.web10.68419.1672763416904086063
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Jan 2023 08:30:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=fkr5zraK;
 spf=pass (domain: arm.com, ip: 40.107.20.75, mailfrom: ross.burton@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=umEfzVA1pXEZXAIyZhIjZTOKIbAN0PGMd0WQYSHATww=;
 b=fkr5zraKULgp/09UZKDH3PBiigJ1e0iJ1I4X50mnqvaY7AT1SAmsDpHhVj+L5tVv2vrUYH+ca3xsGvO6jcgnr2AW0un9a2qmRvPPNii0dA+9NOoRhAiJllrxETRsdGg/akdC4skMJPm1xVhO/JAxf6wakIznYIajzX5pJoSHDRQ=
Received: from AS9PR01CA0002.eurprd01.prod.exchangelabs.com
 (2603:10a6:20b:540::14) by GV1PR08MB9940.eurprd08.prod.outlook.com
 (2603:10a6:150:3d::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.9; Tue, 3 Jan
 2023 16:30:12 +0000
Received: from VI1EUR03FT043.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:540:cafe::ea) by AS9PR01CA0002.outlook.office365.com
 (2603:10a6:20b:540::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5966.19 via Frontend
 Transport; Tue, 3 Jan 2023 16:30:12 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VI1EUR03FT043.mail.protection.outlook.com (100.127.145.21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5944.16 via Frontend Transport; Tue, 3 Jan 2023 16:30:11 +0000
Received: ("Tessian outbound 6e565e48ed4a:v132"); Tue, 03 Jan 2023 16:30:11 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 4048f4fb3403524d
X-CR-MTA-TID: 64aa7808
Received: from 3089a8d38aff.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 0413FAD0-0F40-4E57-9A88-BC36EA062934.1;
	Tue, 03 Jan 2023 16:30:04 +0000
Received: from EUR03-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 3089a8d38aff.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Tue, 03 Jan 2023 16:30:04 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oaPoE+AvWfLOSsYY0IHYJpaYjkJYwfa5MDdEVWIons+JtOXUo0wQDMozFf1puzrcWUCQz6RaslXhj3bUd/phGV2c1gdP4pPQV656FoC2BrwpsBHDKuoyiX2LIe/PYUyY9roeUOVOh9+/Aj9gGQ2dXN1HkXNR7NO43ZAAcgYEUFEE/LKVUtMrk+3od3Okjiq+eIFLEYOZ66jiKKpmimXTqgGbgQMMuQKI28bP8wn56o2zFIghy+ua2KiUx65dd+ey9U3cpeMEOmMNZPhTdxJMb6ehMjGFaQjBNqf6KkdAh7b7ZbtCirbOxraE3Op4RdWvJYwQgc/J/hcaEfR8df5Grg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=umEfzVA1pXEZXAIyZhIjZTOKIbAN0PGMd0WQYSHATww=;
 b=ZY5v0iTf+nBNWQESBj7Fd/Ba4hmqoLdLExtAHCLUb2sMDt+6h33ymvCEY9wHPlgEQPIK5jd+1GXeoCuoB87z0ee6aj5ALpiyKLMiqAbB3ZUmKN55+xn6L7UDSMVd2ryYVUqYGCyZiBzd8G9f2EQQ8jZyBmxq1/N8XZBoPpA1//tlaaYoBZxOK6OUkSW1yxDR/m2h9VjY3JQTwxtm4yL0RBdH+D9XszvCwTXZ/KC+q0cu87LJnvoO9yXkgIHop1vjuOZ57DG8QqaUrpvaT6gaxGv2qOeMplVKhWHxyl9PTUyzgC14CuYEQKOSubN49SNWC6+5xHVLsGcDU1UTPAekLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=umEfzVA1pXEZXAIyZhIjZTOKIbAN0PGMd0WQYSHATww=;
 b=fkr5zraKULgp/09UZKDH3PBiigJ1e0iJ1I4X50mnqvaY7AT1SAmsDpHhVj+L5tVv2vrUYH+ca3xsGvO6jcgnr2AW0un9a2qmRvPPNii0dA+9NOoRhAiJllrxETRsdGg/akdC4skMJPm1xVhO/JAxf6wakIznYIajzX5pJoSHDRQ=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by AS8PR08MB5912.eurprd08.prod.outlook.com (2603:10a6:20b:29f::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.9; Tue, 3 Jan
 2023 16:30:02 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::2d3c:c53c:86ba:a3b0]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::2d3c:c53c:86ba:a3b0%4]) with mapi id 15.20.5986.014; Tue, 3 Jan 2023
 16:30:02 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
CC: Markus Volk <f_l_k@t-online.de>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [oe-core][PATCH] gsettings-desktop-schemas.pc.in: use
 pc_sysrootdir for prefix
Thread-Topic: [oe-core][PATCH] gsettings-desktop-schemas.pc.in: use
 pc_sysrootdir for prefix
Thread-Index: AQHZG1zBH9orUU5Cv0OjuhO1oRNeDa6IQBaAgASqZAA=
Date: Tue, 3 Jan 2023 16:30:01 +0000
Message-ID: <1D1B209C-6A40-42CB-ABD0-5D695C95923E@arm.com>
References: <20221229080810.98961-1-f_l_k@t-online.de>
 <f75728aa4e2acbf7274889aeaeb6a8f2b5c72533.camel@linuxfoundation.org>
In-Reply-To: 
 <f75728aa4e2acbf7274889aeaeb6a8f2b5c72533.camel@linuxfoundation.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3731.300.101.1.3)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|AS8PR08MB5912:EE_|VI1EUR03FT043:EE_|GV1PR08MB9940:EE_
X-MS-Office365-Filtering-Correlation-Id: f472112d-1395-4036-c790-08daeda7c95e
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 RCrHBrX48+3ui7gR2hvjCzXtIFq8hBMZfFdDR+6xOxJdBCZTQVWbuzrdsW0padzZSX+dZrUqYu/hOIcsaW70mBCt6K4s9tfVRpFxRc3Yzl5UGOOOEkB/xKK+5mKh7azu7eO1id8Yj7a/MmoXnhmgs3OlgrrTqPKl+ze956bB5/R3Y8xvBcRPn+2H74SMEPrHfiIVtbnQ0enGMWdh/TG9ITk/goJ3ZAVy992nuOY0u5Peqho684pkxKK0Dyb0/Kh/hlKCTZ1op3HX55GELTG/Ah2zF7tuNqFF5prXRbSbbWoQmcA7k52kBKFNNnFQRl3WrLc1xlnwmGqkHWFvnk2Jy2GbfvdoN7e4+oDyDL9FV5sqTeKL3cYof1+QXeeDTsHcSq418fFQmK6RGgAJ18OoQh7CZo9DEJahqXolpybso00N/K2s84htmyWBCFlLArV3EglO8uDuXobrIOwzAQkarLGZYlsESd9UuwhT1Ll6MATa14iltrmLXf2O0FLTP7GfzMYJs5hcGzNCcaI+4laThjg+YUjknEKhpiMNzK8Q5oZk5pWFxGv02n/gPBBXfN50E9rMTnkvkmw30N2hiatsTVc0kNNwcGC643RvfVLORPyladWcD76jyHfOFWmRDUmWPGsQ9C2EzZrZJIGD2cBfNTOd7QeWoE5vtV1acGOqjrweSgxzxJh3GoGA2J2ol4e0+9ZSS35iLzlj5ZPLayEMqyCdiQO/rcaDCUAD+esLSdZIIpi9/a6LbROkl4iHEH7hnsn8kAN8NcZvGb7ZyQyqpdMZdcbuBkqbwlprJblojYBh4ctcQ3BIUhaRhQ2QZ7WlyXGqALgzhEtbc5GH3FfCSg==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(366004)(136003)(376002)(39860400002)(396003)(346002)(451199015)(6916009)(66946007)(66556008)(8676002)(66446008)(66476007)(33656002)(64756008)(4001150100001)(5660300002)(316002)(91956017)(76116006)(4326008)(966005)(41300700001)(36756003)(54906003)(2906002)(8936002)(83380400001)(6506007)(53546011)(2616005)(6486002)(122000001)(6512007)(71200400001)(86362001)(38100700002)(26005)(186003)(38070700005)(66899015)(478600001)(22166006)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <49524E01980EF542A329DE167B011E24@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB5912
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 VI1EUR03FT043.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	4baabdd2-38be-4a4b-7af4-08daeda7c36c
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	BiCKLwSMXWHRvz6/n7wtJgT6SfoFCCuqLZ6BU8iBVLjPENHCz885CsQYw6E90TFhm7J1/R5Z68R/XJxOwp6SNr4MGnIpjeHcl+9/z6UflsIHKXLECbvaQ6bx4idOSfh+MksGgO0tMiEpFYGY/pHWgGyCLDm9Ojw40lcA9jF8IUQtDQ2b10a9NjMD8ZbTBQ4BiEjxgpaCXtKGBD9WDsqHMkeNLspYm5GBEh0ZRHxhJtvQrnui2u2GBTGBiXI/F0GbJR983nxocnLd7xgqCEj36zYHP3HoZq8NusLP++SqBQu7FPxeOtlOllC8uYpvcHMseZD1Bx483Su5AD4w/SzY7vpzDOdSINiQ1xzLE5qhBQ5HJuhxH+gI030Aun5WpeccTLK50BX3Eg4gsdNKIViaC284Pf1lwUeUhWlEUyQUMjAIL3VKnjtZozUo1rRWYsTRqF7gNpMSLSzJl6Ju91tNomwGxzo6otCxw15TnxyJFj3Gnw6QfwAkMzDUIMjd3wqyxfvxONYZBwav+Mlc//Lh/ZS3JjILU3MIoMogBSGoP4At8W5lB16JXewAKZnuMsthoiMOJno4OpVBvSI81yvSUiplLSbkx645U/J96xYq656iGFyX88Im59WdOGRgbX2TIgQoyW502OpczKUrPnTaWfQzkREn9OgYT15zW/xw8iQxDKrjfg7x8ehfudFdzzYiDKu2GMpjjq1l3aim080x4IGmIqj1duRDh80ScbJntFrXrVqEANBAK/Tb8azvFdNRHRQ91gpVhXUVVDch4QvnhiGitFLYrP1wWOK5hP1MGI8=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(396003)(346002)(376002)(39860400002)(136003)(451199015)(46966006)(40470700004)(36840700001)(33656002)(70206006)(81166007)(356005)(82740400003)(36860700001)(70586007)(4326008)(41300700001)(8676002)(54906003)(316002)(40460700003)(4001150100001)(2906002)(83380400001)(40480700001)(8936002)(336012)(2616005)(5660300002)(6862004)(82310400005)(6512007)(478600001)(186003)(966005)(6506007)(26005)(6486002)(47076005)(86362001)(66899015)(36756003)(22166006);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jan 2023 16:30:11.9006
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f472112d-1395-4036-c790-08daeda7c95e
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	VI1EUR03FT043.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB9940
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 Jan 2023 16:30:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175361

Agreed, and commented on the MR.

Ross

> On 31 Dec 2022, at 17:14, Richard Purdie via lists.openembedded.org <rich=
ard.purdie=3Dlinuxfoundation.org@lists.openembedded.org> wrote:
>=20
> On Thu, 2022-12-29 at 09:08 +0100, Markus Volk wrote:
>> Signed-off-by: Markus Volk <f_l_k@t-online.de>
>> ---
>> ...ktop-schemas.pc.in-use-pc_sysrootdir.patch | 34 +++++++++++++++++++
>> .../gsettings-desktop-schemas_43.0.bb         |  1 +
>> 2 files changed, 35 insertions(+)
>> create mode 100644 meta/recipes-gnome/gsettings-desktop-schemas/gsetting=
s-desktop-schemas/0001-gsettings-desktop-schemas.pc.in-use-pc_sysrootdir.pa=
tch
>>=20
>> diff --git a/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desk=
top-schemas/0001-gsettings-desktop-schemas.pc.in-use-pc_sysrootdir.patch b/=
meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas/0001=
-gsettings-desktop-schemas.pc.in-use-pc_sysrootdir.patch
>> new file mode 100644
>> index 0000000000..4bf38c1987
>> --- /dev/null
>> +++ b/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-sch=
emas/0001-gsettings-desktop-schemas.pc.in-use-pc_sysrootdir.patch
>> @@ -0,0 +1,34 @@
>> +From abd179df28adcdd9fac3d066aaccbd4c4cd135f5 Mon Sep 17 00:00:00 2001
>> +From: Markus Volk <f_l_k@t-online.de>
>> +Date: Thu, 29 Dec 2022 06:39:59 +0100
>> +Subject: [PATCH] gsettings-desktop-schemas.pc.in: use pc_sysrootdir for=
 prefix
>> +
>> +gnome-settings uses pkgconfig to find gdesktop-enums.h
>> +https://github.com/GNOME/gnome-control-center/blob/4648296a706df83af984=
a918e5f14c3ece42f5fc/panels/background/meson.build#L22
>> +
>> +Adding pc-sysrootdir to prefix would allow to find the file also if we =
have a user defined sysroot.
>> +
>> +This will fix cross compilation of gnome-control-center with yocto/open=
embedded that otherwise fails like this:
>> +
>> +| ../gnome-control-center-43.2/panels/background/meson.build:27:0: ERRO=
R: File /usr/include/gsettings-desktop-schemas/gdesktop-enums.h does not ex=
ist.
>> +
>> +Upstream-Status: Submitted [https://gitlab.gnome.org/GNOME/gsettings-de=
sktop-schemas/-/merge_requests/62]
>> +
>> +Signed-off-by: Markus Volk <f_l_k@t-online.de>
>> +---
>> + gsettings-desktop-schemas.pc.in | 2 +-
>> + 1 file changed, 1 insertion(+), 1 deletion(-)
>> +
>> +diff --git a/gsettings-desktop-schemas.pc.in b/gsettings-desktop-schema=
s.pc.in
>> +index d611dc1..992fa55 100644
>> +--- a/gsettings-desktop-schemas.pc.in
>> ++++ b/gsettings-desktop-schemas.pc.in
>> +@@ -1,4 +1,4 @@
>> +-prefix=3D@prefix@
>> ++prefix=3D${pc_sysrootdir}@prefix@
>> +=20
>> + Name: gsettings-desktop-schemas
>> + Description: Shared GSettings schemas for the desktop, including helpe=
r headers
>> +--=20
>> +2.34.1
>> +
>=20
> This doesn't look right to me. It would lead to an arms race where
> every .pc file would need to start accounting for the sysroot. The
> sysroot should really be handled at the calling site.
>=20
> Cheers,
>=20
> Richard
>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#175181): https://lists.openembedded.org/g/openembedde=
d-core/message/175181
> Mute This Topic: https://lists.openembedded.org/mt/95933924/6875888
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ro=
ss.burton@arm.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20


