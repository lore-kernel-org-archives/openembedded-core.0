Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA039C7EE23
	for <webhook@archiver.kernel.org>; Wed, 24 May 2023 14:59:15 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (EUR04-VI1-obe.outbound.protection.outlook.com [40.107.8.85])
 by mx.groups.io with SMTP id smtpd.web11.11132.1684940345547022141
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 May 2023 07:59:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=xNk8JtM8;
 spf=pass (domain: arm.com, ip: 40.107.8.85, mailfrom: ross.burton@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T/S1xzAaw+fvNxRpgntjrSsWmEjdNqVNPwhdZAcihjE=;
 b=xNk8JtM8G8sV3vAb+AgMS84nRcO6nYOx+0pdPJjiMp39OsNtma7ttF5JkrMb9tOJrJ5HW0U+xOQQGmga4h4RF7K0k5q3Y3Qoul5Tqv9YmwY20+gXKIkBRgRYuhiMccb8is0B5coY6vPn0OzL5sao34IAqdP2WTKL5uuvQUgrIiA=
Received: from AS4PR09CA0027.eurprd09.prod.outlook.com (2603:10a6:20b:5d4::17)
 by AS2PR08MB10252.eurprd08.prod.outlook.com (2603:10a6:20b:648::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.15; Wed, 24 May
 2023 14:59:01 +0000
Received: from AM7EUR03FT058.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:5d4:cafe::ec) by AS4PR09CA0027.outlook.office365.com
 (2603:10a6:20b:5d4::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.15 via Frontend
 Transport; Wed, 24 May 2023 14:59:01 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT058.mail.protection.outlook.com (100.127.140.247) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6433.15 via Frontend Transport; Wed, 24 May 2023 14:59:01 +0000
Received: ("Tessian outbound 945aec65ec65:v136"); Wed, 24 May 2023 14:59:01 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 4d63f92f50880bf4
X-CR-MTA-TID: 64aa7808
Received: from 5f2962abe88c.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 1580F7E9-609E-474B-A821-6D792AC12849.1;
	Wed, 24 May 2023 14:58:54 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 5f2962abe88c.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Wed, 24 May 2023 14:58:54 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h+dSvWEnjQLlQUm1Z4Fz3vpRvSPO2pMew7rbo97DvpDeIhwrWGMziuob47uXQpAK6/kxM9Zc/MXY7azZvRkbN9SD1X0icPKfbsaj1m9de1s6KTfBaSuMM7G8YpU4J1qyYeJqhoYhs9BwKjyPQdj8D4ACbSaXnPEqtnXZXd55Y2bgyazfitXuGoTCCr8TxRcQk1WTKv74yrBEhaDs0vfjGmYzlG70q2xcFo434Db/YCSw0NUmtbtzge+HW2OHpop4iqvYnOArWBSYHFzVSj6++o2WRzOwsxVTntWT2EoFgFu6k7UYa1lKTW1waJ6wqyJa2z9vzgclhUJTOf4xv3wMyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T/S1xzAaw+fvNxRpgntjrSsWmEjdNqVNPwhdZAcihjE=;
 b=JfaQsBzaA0OflPn597+JeWHdpT3d+PJ1sXUeSimnDPXmn0utKH/OKtwe6luBgDhEclDk+405IS70gsXH5lgh/I5s6wNauY+29alBNWQX+rF2QNt48+LzsP4z/tj5pdb5lBmFwNGpS7w2eRY00O3VwBVvREd1KsGHFSPejmrF76UJCq3LDIUe3xcFQU6RRubL3tEmzNrG56INML1aDNdlYT/14ulJGWgH/QBK19qL4/6bTt+jOPT3tz1g/nII1VOG4NEYG8saPjDnZ9qpVrF8Ys3jycjBXa3JNm5T6NNDdq2tGZX2+c9z509UyQaAEMEdBvGJnUXmDWdjMNGgyaOgNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T/S1xzAaw+fvNxRpgntjrSsWmEjdNqVNPwhdZAcihjE=;
 b=xNk8JtM8G8sV3vAb+AgMS84nRcO6nYOx+0pdPJjiMp39OsNtma7ttF5JkrMb9tOJrJ5HW0U+xOQQGmga4h4RF7K0k5q3Y3Qoul5Tqv9YmwY20+gXKIkBRgRYuhiMccb8is0B5coY6vPn0OzL5sao34IAqdP2WTKL5uuvQUgrIiA=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by AM8PR08MB5617.eurprd08.prod.outlook.com (2603:10a6:20b:1dc::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.15; Wed, 24 May
 2023 14:58:52 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::eb3c:9b42:21c9:494e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::eb3c:9b42:21c9:494e%7]) with mapi id 15.20.6411.028; Wed, 24 May 2023
 14:58:52 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "docs@lists.yoctoproject.org" <docs@lists.yoctoproject.org>
CC: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] base: add ability to provide further details
 when using LICENSE_FLAGS
Thread-Topic: [OE-core] [PATCH] base: add ability to provide further details
 when using LICENSE_FLAGS
Thread-Index: AQHZjlAXmsOjZWFYgk6sIDbI6BE40K9pg9SA
Date: Wed, 24 May 2023 14:58:52 +0000
Message-ID: <5432CF2D-FEFB-472A-A980-0D05A1AEE7E8@arm.com>
References: <20230524145721.3628187-1-ross.burton@arm.com>
In-Reply-To: <20230524145721.3628187-1-ross.burton@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3731.500.231)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|AM8PR08MB5617:EE_|AM7EUR03FT058:EE_|AS2PR08MB10252:EE_
X-MS-Office365-Filtering-Correlation-Id: 060bad48-2814-4289-4605-08db5c6768fd
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 msvXSiZi/xGsrOQWyTitdEtrhMwf/Z59T2pmleEdLaNRKE8B8ktIZ53Gb+g1OR3CKn1ipWwjR2UDwSb7m30dHp5D+Y+VLPALpYEVTJE0lFw9IVsqZXcTw6cbaOTBZkBbmjBZkWxQo6zdPMZy/aTs/FkAW9hO+7zFIJys+0D0FZGcdevZjIvlFj5ZbcconOa8XTmxeQOWIIrCt/TPtvMaMpWnHH4PbVls9LoN7+fuHwDgfET8CtmtPdP5p3+5DnI5yTgyyqKmVr3ClrlIUYa1e9NfCNivMW8DSBSe4g8MaS4U3qEyc91DIwHhV48ME7/v/9gI6hYsgHXyMQAxQC2xrMO72f41LKalrTt+YSsniFlVK1OIEhfKdwMIVRTWAY+hfayp6YQT3wDEG9hy92JB2DeomtChcpAsA54ayS5cTjfkGFh7MRqOAr5rHdE9XjCpooHbqKWPspznkO2KFpmD9yXuZGc9OFuz5lJrgTlT69gsRQ2ckxvqIzSV87voZH35bFc0Q7YW6VGuVC9aW6lWjF7ICEFYCVS5YCLmTzKcMa8c17aEKKUIVMWkaBdIUxl+ST91j867liS7mPKRSbbuhGrIoj0kaWyVAFvi9ieXyjCwYy2SBljhljZ0GUNgLnzGjIhYbmjo3bukXfoUSuHlrg==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(396003)(136003)(366004)(346002)(376002)(451199021)(2906002)(66899021)(5660300002)(8936002)(8676002)(41300700001)(6486002)(76116006)(91956017)(64756008)(66446008)(66476007)(66556008)(6916009)(478600001)(316002)(36756003)(4326008)(66946007)(33656002)(71200400001)(966005)(6512007)(6506007)(26005)(53546011)(38100700002)(2616005)(122000001)(86362001)(83380400001)(186003)(38070700005)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <04C55DD519955A42820FB911CFBE0C54@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB5617
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM7EUR03FT058.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	12a7d781-cb7e-4b4d-0415-08db5c676369
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	eeMXcBfnGHJTtQBnFxSTaZ3jcbN9R40cW8HQ0SvepIDcteVg3tPZV4BEVPmtZUq1bYcdvipyLQ20Usg6OoNlYP6A0JV+ofz4hsJ/dqyCxjdY9TMaYoyB7zmhiz/BlN1bacIwy3dlvBWyBOjyVLx5gLay3dkyBARtJZQx+hiOT02oKapehavXepHni4IjyQB283eNu+VddnYrfiboJe7ZoIR+dtLvO5WXtdQqScWsme78s27GTzFuhLnMZii/zXOBrJQRy0TMCTlvZlOwurIB3I6k+u33Pc6Jh3kyzVVJOdBU7xU649D29syLi5si1nt6vBqZpoW5G0pODG3gS4eW38xpCu+fWJByYzRnjEIlXt/etfr/l4YEelbMHzwRfWwAUXk/qKZTVxC9JUd8YN0hYEoQp9069XqrliP0b7wWyEpnyI4kaZNNyqXxg8J9Thp/0aksyGmveLfzVdyWMm6qoT+GLX+QOA7db6w5rxW6cnL/ewJBlIjKVwxCF6t5lwefYKiNOm+vp4YmVWAaFhHwJpfTaZCGq9z9O3eFKKwc5Bq5EgUH/jhhFFighvDkxarjJUPvcmfe21NG75n+AWf+PuhAjd93tPd0sSzPcBFnkP4vKEkF10y6cVq6C7G7FXmaGmMmL/GniZVuPViEclp+zsoctfMhXjnwFX0VCqYGFh3SfAauCcVHGBXSbxQpTA3C+HaRbB4J/2c+xfhHe/nacchq9lvsUz1+5pImpxILYpo=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(396003)(136003)(376002)(39860400002)(346002)(451199021)(40470700004)(36840700001)(46966006)(336012)(36860700001)(47076005)(83380400001)(4326008)(70206006)(70586007)(6486002)(966005)(2616005)(6506007)(6512007)(26005)(53546011)(478600001)(186003)(86362001)(2906002)(6862004)(8676002)(8936002)(5660300002)(36756003)(81166007)(33656002)(316002)(40460700003)(82740400003)(356005)(40480700001)(41300700001)(82310400005)(66899021);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 May 2023 14:59:01.5248
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 060bad48-2814-4289-4605-08db5c6768fd
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM7EUR03FT058.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB10252
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 May 2023 14:59:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181678

Hi,

If this merges, this new variable should be covered in the section about us=
ing special licenses.

Ross


> On 24 May 2023, at 15:57, Ross Burton via lists.openembedded.org <ross.bu=
rton=3Darm.com@lists.openembedded.org> wrote:
>=20
> From: Ross Burton <ross.burton@arm.com>
>=20
> Recipes with proprietary licenses often need to use LICENSE_FLAGS so
> that the user can opt-in with consent. However, if you don't consent
> then the error simply tells you the license identifier but not further
> context.
>=20
> Add a new variable LICENSE_FLAGS_DETAILS, which will be looked in for a
> flag with the name of the licence.  If found then the contents are
> printed as a source of further details.
>=20
> For example, a recipe with an EULA may set:
>=20
>  LICENSE_FLAGS =3D "FooBar-EULA"
>  LICENSE_FLAGS_DETAILS[FooBar-EULA] =3D "https://example.com/eula"
>=20
> If Foobar-EULA isn't in LICENSE_FLAGS_ACCEPTED then the error message is
> more useful:
>=20
>  Has a restricted license 'FooBar-EULA' which is not listed in your
>  LICENSE_FLAGS_ACCEPTED. For further details, see
>  https://example.com/eula.
>=20
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
> meta/classes-global/base.bbclass | 12 ++++++------
> 1 file changed, 6 insertions(+), 6 deletions(-)
>=20
> diff --git a/meta/classes-global/base.bbclass b/meta/classes-global/base.=
bbclass
> index b6e339ed9c5..976a2ddee4b 100644
> --- a/meta/classes-global/base.bbclass
> +++ b/meta/classes-global/base.bbclass
> @@ -516,12 +516,12 @@ python () {
>         check_license_format(d)
>         unmatched_license_flags =3D check_license_flags(d)
>         if unmatched_license_flags:
> -            if len(unmatched_license_flags) =3D=3D 1:
> -                message =3D "because it has a restricted license '{0}'. =
Which is not listed in LICENSE_FLAGS_ACCEPTED".format(unmatched_license_fla=
gs[0])
> -            else:
> -                message =3D "because it has restricted licenses {0}. Whi=
ch are not listed in LICENSE_FLAGS_ACCEPTED".format(
> -                    ", ".join("'{0}'".format(f) for f in unmatched_licen=
se_flags))
> -            bb.debug(1, "Skipping %s %s" % (pn, message))
> +            for unmatched in unmatched_license_flags:
> +                message =3D "Has a restricted license '%s' which is not =
listed in your LICENSE_FLAGS_ACCEPTED." % unmatched
> +                details =3D d.getVarFlag("LICENSE_FLAGS_DETAILS", unmatc=
hed)
> +                if details:
> +                    message +=3D " For further details, see %s." % detai=
ls
> +            bb.debug(1, "Skipping %s: %s" % (pn, message))
>             raise bb.parse.SkipRecipe(message)
>=20
>     # If we're building a target package we need to use fakeroot (pseudo)
> --=20
> 2.34.1
>=20
>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#181677): https://lists.openembedded.org/g/openembedde=
d-core/message/181677
> Mute This Topic: https://lists.openembedded.org/mt/99110379/6875888
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ro=
ss.burton@arm.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20


