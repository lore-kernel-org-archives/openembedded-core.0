Return-Path: <joerg.sommer@navimatix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E58BBC43458
	for <webhook@archiver.kernel.org>; Wed,  8 Jul 2026 08:52:26 +0000 (UTC)
Received: from AM0PR02CU008.outbound.protection.outlook.com (AM0PR02CU008.outbound.protection.outlook.com [52.101.72.87])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4249.1783500743357964613
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Jul 2026 01:52:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@navimatix.de header.s=selector1 header.b=S/B/7Fbn;
 spf=pass (domain: navimatix.de, ip: 52.101.72.87, mailfrom: joerg.sommer@navimatix.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j39CtRK/m/yxBWyFk1eMTdUvPB6732uj6Fsw+DyVB5l/hspwlhcl3ZqTx3Bk5VSOCtMUFyjlosk15qraHu5c6v71srrf1SUhPfcrGfWYJmHmw7CRcYrS9Y+M8FhaZh59dKd55gw57auToNmt4fASIwm/1YU59t8PPKv5OzRl3uDdQpAVVVl6ua1sv5Ncpj6W0Y1faIqDf8F5k8nBcOEYgMCuR1RA4xdODHjcwgA1w924FrTU3nkbGZBzwUq6Nsa6Z2yyPiTqZ1ib271pTNmLbIYac+wL12e+6aKRI55hc02r2ZM+0r5jgKRSqtqD7rZbpDrX88BQLLHPdIzg2FkNPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J13mZM9ZphHehppsOgDo7tp3FLqv3JMgZvonexz/HHg=;
 b=Cy/F1RtcI5drzYZCFeb1XoVXv73qsg1nWOqhGxqz7Ug/yPNGG3/aBTMudhXHExvy2rft/mONnlE6Sw4+yUHm61JJ8yAIcZIGiovKKOg0YhEfJSS7fvu2EhNdM3Zqfc16BBy962coBcG4RKpJP/xZJnlyhAA/MZCOBoVkN5Ig+/jTWa05JBaTbG76sIRVULrcwyt7fzf9ibMDpEMe+G0o5nl8fVGFdgRi+aAEp84qoUj996k6q1Q7At1z56QIdJ/xplmxHADedphv51FSUNxWmQYo8WLyi7RdeJmE4lk6lKqjXC1738ef3H5NU2P+KnJdMRM3NBPHM1MbctqDWvuJ7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=navimatix.de; dmarc=pass action=none header.from=navimatix.de;
 dkim=pass header.d=navimatix.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=navimatix.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J13mZM9ZphHehppsOgDo7tp3FLqv3JMgZvonexz/HHg=;
 b=S/B/7Fbndqlj3VvcwmOpx/bVxy9+RGptoJZ+oVyP2VXOIRiyedU+N8bvD5cgzdQR4jzsCoHuZVUbsPBO1U8XrwaY2jLqcgfl8EbXcYALPO4Porhm/xJdryTGi0VFccdr/ahUQKgxjzAGGdiVyuLhOk5Y0iFVO4xttL75TaWyUCI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=navimatix.de;
Received: from GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 (2603:10a6:150:2cb::8) by AS8PR01MB8586.eurprd01.prod.exchangelabs.com
 (2603:10a6:20b:449::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.10; Wed, 8 Jul
 2026 08:52:15 +0000
Received: from GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 ([fe80::d5c3:2dea:3d98:25fd]) by
 GV2PR01MB11835.eurprd01.prod.exchangelabs.com ([fe80::d5c3:2dea:3d98:25fd%3])
 with mapi id 15.21.0181.008; Wed, 8 Jul 2026 08:52:14 +0000
Date: Wed, 8 Jul 2026 10:52:11 +0200
From: =?utf-8?B?SsO2cmc=?= Sommer <joerg.sommer@navimatix.de>
To: Leon Anavi <leon.anavi@konsulko.com>
Cc: openembedded-core@lists.openembedded.org, 
	Paul Barker <paul@pbarker.dev>
Subject: Re: [OE-core] [[PATCHv2] meta: Add pam to DISTRO_FEATURES if using
 systemd
Message-ID: <ak4Iqn1lnJUP2Myd@navimatix.de>
References: <20260707090248.417251-1-leon.anavi@konsulko.com>
 <ak0mCn1v18QBHsYI@navimatix.de>
 <CALtQ3O07H7h7v5GzckUB=Am2R7KaX6ZK=tpUhQLUPK0ovkEBmQ@mail.gmail.com>
Content-Type: multipart/signed; micalg=sha256;
	protocol="application/pkcs7-signature"; boundary="uvvzajprp5wrpruw"
Content-Disposition: inline
In-Reply-To: <CALtQ3O07H7h7v5GzckUB=Am2R7KaX6ZK=tpUhQLUPK0ovkEBmQ@mail.gmail.com>
X-ClientProxiedBy: BE1P281CA0274.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:84::19) To GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 (2603:10a6:150:2cb::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR01MB11835:EE_|AS8PR01MB8586:EE_
X-MS-Office365-Filtering-Correlation-Id: b5db6d41-1956-4c4f-083d-08dedcce34a8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|23010399003|376014|22082099003|18002099003|6133799003|56012099006|4143699003;
X-Microsoft-Antispam-Message-Info: 
	y0TV8HzTy4VUJDpVeQqHdnEYkmU2TVyHP/NMmeU09z5FynGm0KXEUnLqvn9tUS9p9GiROm8aMBp/VHxiODgZL7kuG5jCtFyaHYnwDd/f91fMrnfhE6YfyZl4TFzDWn6l+C22K552whJpG0XtOcgDKkM+EXcdzJfmBC+syHM/lYqkgos/Hqtkjlo3JhNYLBKEOXUXJ19/K1ZZJTORK12xEnzdvdly72SIzer5F2VXIkEAYABHtMSDK+MjLuVX7ibWivxcfzJMEFt8DSND0wYeCrPgtOrKVNjMEzYtcfRJm8F0c7GQJ69LyDxK2e+GAvj56JUDtvmE84CI1aSRubRYEWRb92USvBGciW3eB+/LB4lJp4CQoSo/tM/zcqOw+MrM9Yv48EnluuoxyL0oqk2ICDeCtC2NUNv3HdSaCwjp+omcCXYA4JUenmnz3sPcRIK6nQiD/IrnYnPPJMgUY38DIWpl0qbieMaHAhmss23z9t92ULLFMyBjQPTiacbTUErwCUhXVpRc5V91YGU5PPT61yfCpujvrbVX7iLfWoEYkZDzthnQPgC9M3ePyxiscK05E7O7S0Tf4+lA1hWvvCxraWSs/VsCThEAyW7aaMNmPsU=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR01MB11835.eurprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(22082099003)(18002099003)(6133799003)(56012099006)(4143699003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?Ny9BY2NHVmo5Qk9wZ2VKdlJWVCtsVmxrY2lmVVF3RnE2aW1oVFV0aVlSeWVR?=
 =?utf-8?B?V3htb0ZUdnNMa2NtY2NwK3BiWEEzNlNlTFJyMHFwWHB3Rjhra3krRkIwMEl4?=
 =?utf-8?B?Z1MvQjBFMUpWUHVGTTkrMGhvNHZNbnNFVUtNZytOa3VNVXV5M3JMeFkybXBT?=
 =?utf-8?B?U1cvMlRTSFZYYURUc1d0M21WSXBtWHNqK3paYWJKRjYwVWZ1SFo0cXJVVnp1?=
 =?utf-8?B?OEIzeEh3R2lEbWJLSWZMN2Zpam83T3NJL3VXYm9FaWxWQ29MQXk5R2VaR2cy?=
 =?utf-8?B?cW1kUUh3MlZLYVlJWW9BK1EveEkzc25RMGlDN0tZeDlHNzB1TFh5VVZKWW04?=
 =?utf-8?B?OXV5TlpjejJaN2JPSTQ1M2NOWDZ1NldEWlRGNUpQRWFiUkVKN2JmMlcrNXh6?=
 =?utf-8?B?K3NwNVBCbVZyeFBYbUg1TVdyZ2R6cS9UY1prMnB3TDFpb0RFTEx4MGRRbjJq?=
 =?utf-8?B?UVllS2dOV0N1dWdxRGhQY250Nk9UNVRTNTh1bEZrdXNCa2dMYnFmTnl6WlMy?=
 =?utf-8?B?Ym9sdS9QdDFyUmVBQXJGb3dpbDl2UHBKQlphS2ZQcWlUaHU0VmtlZE1EZUJm?=
 =?utf-8?B?cE9PL0tEZ3ZlM1hNYTd3aWlZRDR3OUJMN2xUMGJLcGZTZlEzeWFlZlh0Q0xF?=
 =?utf-8?B?d2w1NFdOTGNwdDlaeUlRVmJIWFh2SXRraDErR2VvYWhuSFJWeVlINXpsN0NP?=
 =?utf-8?B?V2hlTm5qRHV5Ky9MaGVLa1J3MElKUXFhVHFsaVZnbm5yL1RIa1EzT1E2TUw4?=
 =?utf-8?B?dk0vYUdGaHQrNjFtWjNBTUtIRDg5VXVsT1Mvak4rWHBWUWRnS0Q4S0oxdkkv?=
 =?utf-8?B?ZndSM2xCeVYvT2RwU2Rwd0JqbE9BQ0hyL05abDRhdSt4VDJYYnNhMHdwb1l3?=
 =?utf-8?B?ZkI4bkhQZzdlSjd5VnpwUmt2R29QaUpFQVAxR3Vkam9ac2dNbFFzVzZIS2pX?=
 =?utf-8?B?dXZRNkRLVFhVenE2T3JxdU9JSzVvSzRxcFBpWHAzUzBpME55QStXRXhld05l?=
 =?utf-8?B?bS85UHhEV0U1RjJUMU5lNWJ1Y1M1cVdTaVU2ZzZnVnEwa3ZmbGJsRVEwQ2ZX?=
 =?utf-8?B?aFFCZ3JtMlRqbmFieU1VMVZ4OXpxaXdVR25aUGw5SXJZa1NKUzNjZUpxTkor?=
 =?utf-8?B?bUNoVWlKUURLR3lZUTA0blpTM0NOR3YyK1AvQ2UySDluWW1HWmNaL09aakF6?=
 =?utf-8?B?MkFvb1oyNWlzOXFZNFgrQk9CK2ZqNTNxeUh4aHpHZnB5SmR0cHhBSUFUdnJn?=
 =?utf-8?B?R2p2QVVCZmtDTGFIM0NkTld1dVFnWTQxRkg5K254U1RYQ0JhMTRuYjY4VUQx?=
 =?utf-8?B?QmhhL1lPZW5oT3JwRGFwTjdGdzFQMVV5TTJUaHRLNHNWMnRibTZydDh6QVRO?=
 =?utf-8?B?WGVQc1M2TGVFaGgyZXc5Y3F1bXN2LzRxWEgxYlBBMTFWWUZ4eFZjeFBXYXE2?=
 =?utf-8?B?UGhmQlp2dnQxODUyUklhcFFaQnN1eU5kQkc2QS9PM0pYMEQ2bUdVL3JpVGhJ?=
 =?utf-8?B?MDF3TEt3a3loL3pkbjFoNGNuSUFSM2Uwb0x1MEhKWENyWEFrbW9XdE53VjF6?=
 =?utf-8?B?dEJ6QTcyd1d0ZW1UZVVlY2ZwUFNiVjY0bTFPTFJGWndSTVFXL2xNSFovMjNP?=
 =?utf-8?B?Qm5jeUJLclA5dlFjQUdPR3Y1azkyNG5tVVBSL2dSU24vcFRvN3BsSXo2czR5?=
 =?utf-8?B?RFpHSkRvV1RSWUpNMVhaVjRtR1phcEE2TGFlM0pUbTMzdDlEeW9GZmNFOE1W?=
 =?utf-8?B?Q2tnUXRWSG4wRlRlVWFlaWdyMmpJR2ZHMjdNbzBWZmdhMjlSNDJYenlmL0Fw?=
 =?utf-8?B?ZEw1RmVLVlV3ZDIyZG9paHlRL3U2WU1WdHlUcUJoaThQOHRYRnBLcHYreWlV?=
 =?utf-8?B?UENMUHNnODlFNWpjYWZuOVdSLzE3R0g3cGZSV0o1WWJUeGhxcmd5V3FJdzU4?=
 =?utf-8?B?WTFoK0pqRWM1blA0ZnlnMnl1elYxR2F4UVl1bnBOSEFscDlZTkpOOFZhTWdT?=
 =?utf-8?B?K2RuYVdrNmtyK2VjMHBvS2piMFRCZ21lK21tQXRhNVk2Qk5IRGxoaThtaG9l?=
 =?utf-8?B?YnNEUDM3dS9JTnA2MHpGSjJaR2VCd3JOZXJybjlWZFBrUnhCamZSMXlIUzJX?=
 =?utf-8?B?YU5sWlZYV1hINnIvQTFySnd6Z2cxQnQzdTUzQ1FDQjN6UE9scFFlWGtiVVJM?=
 =?utf-8?B?WU1LdkE0S2F6Sm9GUXBBOVAwWGFKRTQxQlExTzFhQS93bktyeGRiYzl1c2hn?=
 =?utf-8?B?SnVTQUFDWGMrNjhZbWlubFQxSmgwS1R4aWtWMGgrTElDd1p0SmVYOGdqcUp3?=
 =?utf-8?B?MmtzREM1TmFZTVkxbDNNNXJTUCtpeVE4Y2huTElWQXRrelpTWTZDRDZqMk1B?=
 =?utf-8?Q?30fsN4MFEUjDuzdQ=3D?=
X-OriginatorOrg: navimatix.de
X-MS-Exchange-CrossTenant-Network-Message-Id: b5db6d41-1956-4c4f-083d-08dedcce34a8
X-MS-Exchange-CrossTenant-AuthSource: GV2PR01MB11835.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2026 08:52:14.4906
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: c87b4f54-b992-4813-8f3f-4a876324197f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qi2lwrzZkzTx2T/u/mHmjRQcVPaNNqVacBF+mhup08Gcq808M4T/UKcE5ETbnLfVL2OdyD01h5gzIDiMIXCtt/XSKSWXTlaGytTYoaceO90=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR01MB8586
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Jul 2026 08:52:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240446

--uvvzajprp5wrpruw
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [OE-core] [[PATCHv2] meta: Add pam to DISTRO_FEATURES if using
 systemd
MIME-Version: 1.0

Leon Anavi schrieb am Mi 08. Jul, 09:37 (+0300):
> On Tue, Jul 7, 2026 at 7:25=E2=80=AFPM J=C3=B6rg Sommer <joerg.sommer@nav=
imatix.de>
> wrote:
>=20
> > Leon Anavi via lists.openembedded.org schrieb am Di 07. Jul, 12:02
> > (+0300):
> > > Add pam to the list of DISTRO_FEATURES in init-manager-systemd.inc.
> > > This way pam will available if variable VIRTUAL-RUNTIME_init_manager
> > > has been set to systemd. Otherwise having systemd in conjunction
> > > with wayland but without pam leads to a conflict with the
> > > REQUIRED_DISTRO_FEATURES for weston related recipes.
> > >
> > > This adjustment is required following these recent changes that
> > > switched VIRTUAL-RUNTIME_init_manager to systemd by default and added
> > > wayland to DISTRO_FEATURES_DEFAULTS which affects "nodistro":
> > >
> > > - 159148f4de2595556fef6e8678578df83383857b
> > >   meta: Support opting out of any distro features
> > >   (Please note that this commit also extended DISTRO_FEATURES_DEFAULTS
> > >   with wayland and vulkan.)
> > >
> > > - 0b4061c5d50261f826d0edb4b478d2d305274b7c
> > >   conf: Switch to systemd by default and simplify init manager select=
ion
> > >
> > > This fixes issues with test_machine_world when running the
> > > yocto-check-layer script for BSP layers that include weston in the
> > > dependency chain, for example meta-tegra:
> > >
> > > ERROR: Required build target 'meta-world-pkgdata' has no buildable
> > providers.
> > > Missing or unbuildable dependency chain was: ['meta-world-pkgdata',
> > 'l4t-graphics-demos', 'weston']
> > >
> > > The weston recipe has pam in REQUIRED_DISTRO_FEATURES if systemd is
> > > enabled. Therefore, it makes sense to also add pam to the defaults
> > > through DISTRO_FEATURES in init-manager-systemd.inc.
> > >
> > > Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
> > > ---
> > >  meta/conf/distro/include/init-manager-systemd.inc | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > > diff --git a/meta/conf/distro/include/init-manager-systemd.inc
> > b/meta/conf/distro/include/init-manager-systemd.inc
> > > index 63fd225ca5..2e9eef24b5 100644
> > > --- a/meta/conf/distro/include/init-manager-systemd.inc
> > > +++ b/meta/conf/distro/include/init-manager-systemd.inc
> > > @@ -1,5 +1,5 @@
> > >  # Use systemd for system initialization
> > > -DISTRO_FEATURES:append =3D " systemd usrmerge"
> > > +DISTRO_FEATURES:append =3D " systemd usrmerge pam"
> >
> > systemd and usrmerge are required features for systemd. But pam is opti=
onal
> > and should be in DISTRO_FEATURES_DEFAULTS to allow for easy opt-out.
> >
> >
> Thank you for your feedback but please note that version 1 of my patch was
> adding pam to DISTRO_FEATURES_DEFAULTS if systemd was enabled. Here is a
> link to v1 of my patch:
> https://lists.openembedded.org/g/openembedded-core/message/240113

Thanks for the link. For an unknown reason I do not get all mails from the
list. I suspect it's an outlook feature.

> Following the code review and feedback provided by Paul Barker I modified
> the patch and submitted version 2. For your convenience, here is a link to
> Paul's email with his recommendation that init-manager-systemd.inc is the
> better place for this:
> https://lists.openembedded.org/g/openembedded-core/message/240233

Yes, I think so too. But as Paul said: =E2=80=9CI'm not sure we want to ena=
ble pam
for everyone using systemd, there may be many systemd users who don't use
weston.=E2=80=9D And I am one of these users who do not want pam.

My idea was to add to init-manager-systemd.inc this line:

DISTRO_FEATURES_DEFAULTS +=3D "pam"

> > On the other side: Is pam so much common that it should be enabled by
> > default?
>=20
>=20
> The purpose of my proposed patch is to fix the behavior of the
> yocto-check-layer script when running it with DISTRO=3D"nodistro" for lay=
ers
> that depend on recipes requiring pam, such as weston. Since the Wrynose
> release and the previously mentioned git commits by Richard and Paul,
> openembedded-core has switched to systemd by default and extended
> DISTRO_FEATURES_DEFAULTS with wayland and vulkan. Because wayland is now
> enabled by default,

As far as I can see, wayland was enabled by default before Paul's =E2=80=9C=
meta:
Support opting out of any distro features=E2=80=9D
159148f4de2595556fef6e8678578df83383857b. The real breaking change was the
default init-manager of systemd.

Hence, the setup must have been broken before, if someone choose systemd.

I would add =E2=80=9Cpam=E2=80=9D to DISTRO_FEATURES_DEFAULTS in init-manag=
er-systemd.inc,
because this sets the required features to build all recipes, but users can
opt-out.

Maybe it's worth to mention this in the release notes that more people
become aware of they have to set `DISTRO_FEATURES_OPTED_OUT +=3D "pam"`.


--=20
Navimatix GmbH           T: 03641 - 327 99 0
Tatzendpromenade 2       F: 03641 - 526 306
07745 Jena               www.navimatix.de

Gesch=C3=A4ftsf=C3=BChrer: Steffen Sp=C3=A4the, Jan Rommeley
Registergericht: Amtsgericht Jena, HRB 501480

--uvvzajprp5wrpruw
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Disposition: attachment; filename="smime.p7s"
Content-Transfer-Encoding: base64

MIIaGAYJKoZIhvcNAQcCoIIaCTCCGgUCAQExDzANBglghkgBZQMEAgEFADALBgkqhkiG9w0B
BwGgghehMIIFgTCCBGmgAwIBAgIQOXJEOvkit1HX02wQ3TE1lTANBgkqhkiG9w0BAQwFADB7
MQswCQYDVQQGEwJHQjEbMBkGA1UECAwSR3JlYXRlciBNYW5jaGVzdGVyMRAwDgYDVQQHDAdT
YWxmb3JkMRowGAYDVQQKDBFDb21vZG8gQ0EgTGltaXRlZDEhMB8GA1UEAwwYQUFBIENlcnRp
ZmljYXRlIFNlcnZpY2VzMB4XDTE5MDMxMjAwMDAwMFoXDTI4MTIzMTIzNTk1OVowgYgxCzAJ
BgNVBAYTAlVTMRMwEQYDVQQIEwpOZXcgSmVyc2V5MRQwEgYDVQQHEwtKZXJzZXkgQ2l0eTEe
MBwGA1UEChMVVGhlIFVTRVJUUlVTVCBOZXR3b3JrMS4wLAYDVQQDEyVVU0VSVHJ1c3QgUlNB
IENlcnRpZmljYXRpb24gQXV0aG9yaXR5MIICIjANBgkqhkiG9w0BAQEFAAOCAg8AMIICCgKC
AgEAgBJlFzYOw9sIs9CsVw127c0n00ytUINh4qogTQktZAnczomfzD2p7PbPwdzx07HWezco
EStH2jnGvDoZtF+mvX2do2NCtnbyqTsrkfjib9DsFiCQCT7i6HTJGLSR1GJk23+jBvGIGGqQ
Ijy8/hPwhxR79uQfjtTkUcYRZ0YIUcuGFFQ/vDP+fmyc/xadGL1RjjWmp2bIcmfbIWax1Jt4
A8BQOujM8Ny8nkz+rwWWNR9XWrf/zvk9tyy29lTdyOcSOk2uTIq3XJq0tyA9yn8iNK5+O2hm
AUTnAU5GU5szYPeUvlM3kHND8zLDU+/bqv50TmnHa4xgk97Exwzf4TKuzJM7UXiVZ4vuPVb+
DNBpDxsP8yUmazNt925H+nND5X4OpWaxKXwyhGNVicQNwZNUMBkTrNN9N6frXTpsNVzbQdcS
2qlJC9/YgIoJk2KOtWbPJYjNhLixP6Q5D9kCnusSTJV882sFqV4Wg8y4Z+LoE53MW4LTTLPt
W//e5XOsIzstAL81VXQJSdhJWBp/kjbmUZIO8yZ9HE0XvMnsQybQv0FfQKlERPSZ51eHnlAf
V1SoPv10Yy+xUGUJ5lhCLkMaTLTwJUdZ+gQek9QmRkpQgbLevni3/GcV4clXhB4PY9bpYrrW
X1Uu6lzGKAgEJTm4Diup8kyXHAc/DVL17e8vgg8CAwEAAaOB8jCB7zAfBgNVHSMEGDAWgBSg
EQojPpbxB+zirynvgqV/0DCktDAdBgNVHQ4EFgQUU3m/WqorSs9UgOHYm8Cd8rIDZsswDgYD
VR0PAQH/BAQDAgGGMA8GA1UdEwEB/wQFMAMBAf8wEQYDVR0gBAowCDAGBgRVHSAAMEMGA1Ud
HwQ8MDowOKA2oDSGMmh0dHA6Ly9jcmwuY29tb2RvY2EuY29tL0FBQUNlcnRpZmljYXRlU2Vy
dmljZXMuY3JsMDQGCCsGAQUFBwEBBCgwJjAkBggrBgEFBQcwAYYYaHR0cDovL29jc3AuY29t
b2RvY2EuY29tMA0GCSqGSIb3DQEBDAUAA4IBAQAYh1HcdCE9nIrgJ7cz0C7M7PDmy14R3iJv
m3WOnnL+5Nb+qh+cli3vA0p+rvSNb3I8QzvAP+u431yqqcau8vzY7qN7Q/aGNnwU4M309z/+
3ri0ivCRlv79Q2R+/czSAaF9ffgZGclCKxO/WIu6pKJmBHaIkU4MiRTOok3JMrO66BQavHHx
W/BBC5gACiIDEOUMsfnNkjcZ7Tvx5Dq2+UUTJnWvu6rvP3t3O9LEApE9GQDTF1w52z97GA1F
zZOFli9d31kWTz9RvdVFGD/tSo7oBmF0Ixa1DVBzJ0RHfxBdiSprhTEUxOipakyAvGp4z7h/
jnZymQyd/teRCBaho1+VMIIGkDCCBHigAwIBAgIRAJNhG7GFaX1Mm3w/sd+ASzYwDQYJKoZI
hvcNAQEMBQAwgYgxCzAJBgNVBAYTAlVTMRMwEQYDVQQIEwpOZXcgSmVyc2V5MRQwEgYDVQQH
EwtKZXJzZXkgQ2l0eTEeMBwGA1UEChMVVGhlIFVTRVJUUlVTVCBOZXR3b3JrMS4wLAYDVQQD
EyVVU0VSVHJ1c3QgUlNBIENlcnRpZmljYXRpb24gQXV0aG9yaXR5MB4XDTIxMDMyMjAwMDAw
MFoXDTM4MDExODIzNTk1OVowWjELMAkGA1UEBhMCR0IxGDAWBgNVBAoTD1NlY3RpZ28gTGlt
aXRlZDExMC8GA1UEAxMoU2VjdGlnbyBQdWJsaWMgRW1haWwgUHJvdGVjdGlvbiBSb290IFI0
NjCCAiIwDQYJKoZIhvcNAQEBBQADggIPADCCAgoCggIBAJHlG/qqbTcrdccuXxSl2yyXtixG
j2nZ7JYt8x1avtMdI+ZoCf9KEXMarmefdprS5+y42V8r+SZWUa92nan8F+8yCtAjPLosT0eD
7J0FaEJeBuDV6CtoSJey+vOkcTV9NJsXi39NDdvcTwVMlGK/NfovyKccZtlxX+XmWlXKq/S4
dxlFUEVOSqvbnmbBGbc3QshWpUAS+TPoOEU6xoSjAo4vJLDDQYUHSZzP3NHyJm/tMxwzZypF
N9mFZSIasbUQUglrA8YfcD2RxH2QPe1m+JD/JeDtkqKLMSmtnBJmeGOdV+z7C96O3IvLOql3
9Lrl7DiMi+YTZqdpWMOCGhrN8Z/YU5JOSX2pRefxQyFatz5AzWOJz9m/x1AL4bzniJatntQX
2l3P4JH9phDUuQOBm2ms+4SogTXrG+tobHxgPsPfybSudB1Ird1uEYbhKmo2Fq7IzrzbWPxA
k0DYjlOXwqwiOOWIMbMuoe/s4EIN6v+TVkoGpJtMAmhkj1ZQwYEF/cvbxdcV8mu1dsOj+TLO
yrVKqRt9Gdx/x2p+ley2uI39lUqcoytti/Fw5UcrAFzkuZ7U+NlYKdDL4ChibK6cYuLMvDaT
QfXv/kZilbBXSnQsR1Ipnd2ioU9CwpLOLVBSXowKoffYncX4/TaHTlf9aKFfmYMc8LXd6JLT
ZUBVypaFAgMBAAGjggEgMIIBHDAfBgNVHSMEGDAWgBRTeb9aqitKz1SA4dibwJ3ysgNmyzAd
BgNVHQ4EFgQUp9eVd+tKwyfNk743TCaEIRR9XZgwDgYDVR0PAQH/BAQDAgGGMA8GA1UdEwEB
/wQFMAMBAf8wHQYDVR0lBBYwFAYIKwYBBQUHAwQGCCsGAQUFBwMCMBEGA1UdIAQKMAgwBgYE
VR0gADBQBgNVHR8ESTBHMEWgQ6BBhj9odHRwOi8vY3JsLnVzZXJ0cnVzdC5jb20vVVNFUlRy
dXN0UlNBQ2VydGlmaWNhdGlvbkF1dGhvcml0eS5jcmwwNQYIKwYBBQUHAQEEKTAnMCUGCCsG
AQUFBzABhhlodHRwOi8vb2NzcC51c2VydHJ1c3QuY29tMA0GCSqGSIb3DQEBDAUAA4ICAQBw
pquT4ow8LyRHG6NgR4oUsFncHl+eWLMtEBwv90EpGCGGDDDjoO23j4Zw6tS+THzwgz4SyP0M
FQaMzHj40enm+z1Y29QIQCnJTeDOHWHKMRxeiFD8MBso+XgVM6z6MMDbbJ95btM/4eE3LyaB
uBbheiINaAVieIdxLq6+dVkm00kmvMdlARsTkEvr5a9nYhGAs8T5RBD1DozAv9r89WJcn+QY
X1M2l5vv0ws3Me1ziVSjC2cRhcae4seOFFjkRdJItzfk6H/Wm2FNv2XG8nE1nbgN8UCdhORO
lQGGQ9DN152RmSJ1A6KAJIldo3YrJNiO8J4JLAE5/Tl9CNUHtbdYTOZLCAZ95G1g2GELQ2DQ
1Xxo55iNojqUA4w1feORe86Dq2P08xzolHKepP1LGEw1gDGCkUYR0gVXLJExGd3dfEZDm0mm
U7vWb6vRyLso/GUawFD2MZS4kK8/igkPO2Pkjfd5HD7hknpPVhcuBaWxWj8Q7bjwVlxGwts6
sNZ+UJ5HC4c+11vVoV9cdbb93qpbWn/d+azhit6kRYdUmAUl8Bt5VRBMKCUnSaAAspxb9kFK
+cvm/MjErxN63YNEcMs2QKs3N862V8MQaoKqD+KsKnaLxF6pxRpOotenpfUTNE9GqxP9nI6i
9rSHf16VFwW4NnJ6yUgzHUMdIqtTge98VjCCBiowggQSoAMCAQICEHb3t/4teUvaYKSSf0s+
XMIwDQYJKoZIhvcNAQEMBQAwWjELMAkGA1UEBhMCR0IxGDAWBgNVBAoTD1NlY3RpZ28gTGlt
aXRlZDExMC8GA1UEAxMoU2VjdGlnbyBQdWJsaWMgRW1haWwgUHJvdGVjdGlvbiBSb290IFI0
NjAeFw0yMTAzMjIwMDAwMDBaFw0zNjAzMjEyMzU5NTlaMFgxCzAJBgNVBAYTAkdCMRgwFgYD
VQQKEw9TZWN0aWdvIExpbWl0ZWQxLzAtBgNVBAMTJlNlY3RpZ28gUHVibGljIEVtYWlsIFBy
b3RlY3Rpb24gQ0EgUjM2MIIBojANBgkqhkiG9w0BAQEFAAOCAY8AMIIBigKCAYEAk7qaEDRX
E35PMot8PAmiNaWYblItPHGyt1+H+DUs2GAYHofsdeURmjngaB0C3GcUcrVav1HsGjJuoh77
nRif3O0gxUJGnIzj4ppKxxTsMNau8qvL+FnEkK6VrnqqnKIL3myjhJRdghUlK8Lgetl/3Pdz
KQ7JO2xPZFklrLRm8EQSuUdyccvb+auvRdSnwrxsOvV+9n18ZdeahL/RBxM7R31DhVkMPO19
EiQMj4PBl99wuWzXWL7yLgYh2/TJvIpSOf7waFcHkVYvfAPivV/ulUVaN2ncpSvlE4/TjA8d
5NXKOY+C7RcyD3UZIi6XVg7T81gOfnvE/eEGsyHmgjzLFDYpgBwVOd7jLQ9jhLX4hdRbm959
FrXQQrozzfTbyxRIwMwDqgUoPxIQVU9A7qXKu3yRXsn7OvnjYkYve6X0ZifTbjZaf4Hi/KXW
fNn67zqCt0eNONM2QB5bNqg14qLooRQcgRpSNAEB4UsSyhwsJqEhXz4QwPFWn/wwvEJ0FgYD
AgMBAAGjggFsMIIBaDAfBgNVHSMEGDAWgBSn15V360rDJ82TvjdMJoQhFH1dmDAdBgNVHQ4E
FgQUHwSkfkz2MrEJ4pF84WzfUr/PLv0wDgYDVR0PAQH/BAQDAgGGMBIGA1UdEwEB/wQIMAYB
Af8CAQAwHQYDVR0lBBYwFAYIKwYBBQUHAwIGCCsGAQUFBwMEMBEGA1UdIAQKMAgwBgYEVR0g
ADBPBgNVHR8ESDBGMESgQqBAhj5odHRwOi8vY3JsLnNlY3RpZ28uY29tL1NlY3RpZ29QdWJs
aWNFbWFpbFByb3RlY3Rpb25Sb290UjQ2LmNybDB/BggrBgEFBQcBAQRzMHEwSgYIKwYBBQUH
MAKGPmh0dHA6Ly9jcnQuc2VjdGlnby5jb20vU2VjdGlnb1B1YmxpY0VtYWlsUHJvdGVjdGlv
blJvb3RSNDYucDdjMCMGCCsGAQUFBzABhhdodHRwOi8vb2NzcC5zZWN0aWdvLmNvbTANBgkq
hkiG9w0BAQwFAAOCAgEAWooWgE/1j6esLJfOKB48VUcFaafH6wZcbEln7ls6BP7IvAP2GDRF
33LtQhuVpt7qIqm/RXxWQLaC0yA14LE/pZZdm6CkkoWlTRgzZln6rM9dm2JvqyX2TLS0Z7P1
E6o9EmPx53bRNrnauUu2lYYfpODYq/5LzDPWBjGNK5QW4+oKCykPzzfSveoF5KTuW1xxy+da
EmtXm3hgYwYvTrB/7jHZU2hVbj/8DUAf/JCa/+AdQCtUE5XzKl6o5gGtWahY1yh9smQ3b48/
cto1QW+ZwGCHk5CLr5bDhe2uh2ifn8BXxBOf33D6YHjnrOUyNxi43QD2wZRwyL8arpu/Ljl4
H9zwIM0Q4vfbZuDghYLDnRVC1fGYBArWxw+uvoEMvO7lcc9MTezGkonPmanHYAcGffaIXpIQ
rQWtWS9Pb22jEy6YZCUiqH4YcqkelJHqJD1HBLVMOPaCn2wXgBbv9jvZQsP9yFrD6tKX//ue
D1V12I+L8qjUj17/ZRuxLcPDCF6vb/Svnu38Ejni16jHUO9G/YWFBZOuRbutUEgEp8hMXEzJ
XO43NzBthf80VV86GaC83nNy3TETFF2yav+ioLIK7Qd5NRnI4DXNQYPq6j8qkEnODayXA1bR
7V/qy4BrdrLHJf9NHMiANvCNiDn02MuniTPmb+rp4syaXK409MSG4PYwggVWMIIDvqADAgEC
AhEAsFHj29zvfVPWA2FcnDeJlzANBgkqhkiG9w0BAQsFADBYMQswCQYDVQQGEwJHQjEYMBYG
A1UEChMPU2VjdGlnbyBMaW1pdGVkMS8wLQYDVQQDEyZTZWN0aWdvIFB1YmxpYyBFbWFpbCBQ
cm90ZWN0aW9uIENBIFIzNjAeFw0yNjA3MDIwMDAwMDBaFw0yODA3MDEyMzU5NTlaMCoxKDAm
BgkqhkiG9w0BCQEWGWpvZXJnLnNvbW1lckBuYXZpbWF0aXguZGUwggEiMA0GCSqGSIb3DQEB
AQUAA4IBDwAwggEKAoIBAQDNxFyhl/UuZdUpuQiuqZBMSU/pN5SMIj4lkvTlrtp2jl4Q77wb
v4vXdXIFWqKd3qtut55G0ptK4nXs1ARrh3AHQAYwB0vW+PHVNPLs9yombnTeMgnEv/RQDFkH
+DxoKdY5+DRUmcVO/tYl6ExMEBj6oh6b/63whIkC61WRETH3FpRCRbyNBD73OWt0KzxoKzW9
xmdqfhNtylLcIFMzuv9C1WAqJ3mLbFHYaW4NEMMckPZJWWYzvA2nwCCryerE3J9z4ZbSK0OK
6DDRN9gW/H7+/4pHSIhdooGfQEdgLj+Z4ZPhvLMF5DncBD8k5DOK8mlDxCKp4GsrLLuBfLQd
xilvAgMBAAGjggHHMIIBwzAfBgNVHSMEGDAWgBQfBKR+TPYysQnikXzhbN9Sv88u/TAdBgNV
HQ4EFgQU3lTOaS6cJRsIzzEjdtC4j6GPtWIwDgYDVR0PAQH/BAQDAgWgMAwGA1UdEwEB/wQC
MAAwHQYDVR0lBBYwFAYIKwYBBQUHAwQGCCsGAQUFBwMCMFAGA1UdIARJMEcwOgYMKwYBBAGy
MQECAQoBMCowKAYIKwYBBQUHAgEWHGh0dHBzOi8vc2VjdGlnby5jb20vU01JTUVDUFMwCQYH
Z4EMAQUBAjBNBgNVHR8ERjBEMEKgQKA+hjxodHRwOi8vY3JsLnNlY3RpZ28uY29tL1NlY3Rp
Z29QdWJsaWNFbWFpbFByb3RlY3Rpb25DQVIzNi5jcmwwfQYIKwYBBQUHAQEEcTBvMEgGCCsG
AQUFBzAChjxodHRwOi8vY3J0LnNlY3RpZ28uY29tL1NlY3RpZ29QdWJsaWNFbWFpbFByb3Rl
Y3Rpb25DQVIzNi5jcnQwIwYIKwYBBQUHMAGGF2h0dHA6Ly9vY3NwLnNlY3RpZ28uY29tMCQG
A1UdEQQdMBuBGWpvZXJnLnNvbW1lckBuYXZpbWF0aXguZGUwDQYJKoZIhvcNAQELBQADggGB
AD6hnou447615g2A0y87bR6mtVI+C+wAFCqRqfrCgHu0dB29VPiVXIVYbPN7H6meSMNr2lFo
e81aZfbE7LMQj98hVKA/ljqWKJe6R5W1Tssv1568G9GJ0fvL1iGT74LuqcuYPt0LVH99Q1rH
MfCBKpsyFo7P3JwoqEkuIpbAhaQMYdTcOgeHMYOLrIdx/9wQ1BXjTa/Cajvc3QxJEb308wgJ
PBxhl8FWWm5MNOynBmRZPKeOeMF5113u6b03KTmXhBqSVeN2nZXEZ+B+wNcJv1dr4Sa0/k6p
tbjZcr9ZkK7QtCarYgLDbsSbcLRJMuXUSHf1yaLwihZWJ1asynbFEmv1SrRSQ+3Hv4megEeY
kYmW9Jiu9qh5z6S98F7JhsP4n6tGs24Xz7l2I/T+BmJMRglTeQnzBihH0kFPUanlApSKC99A
clKs/tfOX8HKHs79Bw3PjRjJDog4D4Pbkom8UwQ/m5sCuOf7v632pjK2jm3OErS3XZxIjnFV
4Gl+5jZ1zzGCAjswggI3AgEBMG0wWDELMAkGA1UEBhMCR0IxGDAWBgNVBAoTD1NlY3RpZ28g
TGltaXRlZDEvMC0GA1UEAxMmU2VjdGlnbyBQdWJsaWMgRW1haWwgUHJvdGVjdGlvbiBDQSBS
MzYCEQCwUePb3O99U9YDYVycN4mXMA0GCWCGSAFlAwQCAQUAoIGgMBgGCSqGSIb3DQEJAzEL
BgkqhkiG9w0BBwEwHAYJKoZIhvcNAQkFMQ8XDTI2MDcwODA4NTIxMFowLwYJKoZIhvcNAQkE
MSIEIIus1MpF+E+48VwvY0osluN00amTrBWzj3D5cmyevsqUMDUGCSqGSIb3DQEJDzEoMCYw
CwYJYIZIAWUDBAEqMAsGCWCGSAFlAwQBAjAKBggqhkiG9w0DBzANBgkqhkiG9w0BAQEFAASC
AQBZJPDhhR1TcPk4q9VCrRKo7Y9P8wibX2pKfBgv5w+hr3z2R+3iKNn4EdR3AdFxof/Uk9ax
VxcTo0tdK5h6CVwLNd7JhoIHExNq7gRZizYUsxBoHZc8K9COAeDomQ7+7WXn9C2PIjtjpkyx
3IVihfbM/mBXgt4vCosEw3KqGSUOhAXRWN2sV0C6F7u9Hg7jGWA0kwTQv0Ho9xG+s/01CoXQ
yY+HL162zTj2/mBJgtBXL2Qi3yW2q2eBj4WxU2UmgBeyJluvM1ffADrD+up3YRRYkMkPmG5P
QCxS1lDMwA3p4DykTdw25LsoakdxPnYdkn2dvihz3GWciiadGLtaWTqA

--uvvzajprp5wrpruw--

