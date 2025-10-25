Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FB02CCD1BF
	for <webhook@archiver.kernel.org>; Sat, 25 Oct 2025 00:48:32 +0000 (UTC)
Received: from MRWPR03CU001.outbound.protection.outlook.com (MRWPR03CU001.outbound.protection.outlook.com [40.107.130.6])
 by mx.groups.io with SMTP id smtpd.web11.2962.1761353303400350608
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Oct 2025 17:48:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=selector1 header.b=A16W5UGS;
 spf=pass (domain: axis.com, ip: 40.107.130.6, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GMSQcfegm9CvAZMVZqjZb3YOz2H8KVNW9oos5Ulh2h0+2IoXmLA8yTPs7yIt2utPRHNuOV7FCLPoEMzkqwoqneK2lvTmIm900DXdFtfrMOu6yufv0VtzbqOVNUEzeIFfoWQbCdmps5aTEtAXI0sMlGF6ARmaoyyoBDlL3pWIF6BhlJ9NfdxkkKcNUpq68kOwb1OzDcq5L2KgiA53vQe12I2UoxM48NZYVUjbzRFxwlGGtlrSKiZdnZrp96QLOUAUJYC8rvpmY944l+1yKaxv6UAhLAfPKYXSGP6eJ+vLzUpUjhnR4lRCT+ionM/957uW/SXqCjgf5PWlb1iz2brGmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p1JtaE5BxfWtKvnjCWA2lpGPGDFvuuT2fH1/O/HIYgE=;
 b=CNcu8QMzyEoqoohP/+HhHgtqZOiJxfHsJNfjBXCpXnRe6J6hPmVffN3EM40YE9q7hfAhUhZSGMM5ekxDXZS3aMXqHLkXA6BnH7gcsIyB6epP2kirNj5+CdxgB/sErwukBdflS8qf4nZQToX60ryoSoJ4oAMuxIcWOuCjMF0DMSeUxMHUA+9r7gGNJNuT6atD97t3yY6v5fQuP4fKtf6CSXKpMe7ku+PLC1hdM8Oaj43w2AkUiKsj/ZsLjddrTCIDdYmADrymDfMlxLrxkqqdLJmEaNddtwRF9JV8fooHGv+xHqqJz9+VenJK+4Pu/UQs9ldVSiiti1ER5dfvgDAjqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axis.com; dmarc=pass action=none header.from=axis.com;
 dkim=pass header.d=axis.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p1JtaE5BxfWtKvnjCWA2lpGPGDFvuuT2fH1/O/HIYgE=;
 b=A16W5UGSRLvRwc4uZzym4yk7RMZFSKpe8DagpCTjoyHvUBVxGZtzJQgIHY/iWyKXBgtcTSYFb/BcL7oes8LiGJXQoUPjmVvzGYpzEnpl4TTUTPhSg1usRGn0bVsPVlWpX718aQ1bHgvtD77SgT2ZJOcR97m0vOwFABiuL8je2wE=
Received: from AS8PR02MB10201.eurprd02.prod.outlook.com (2603:10a6:20b:63d::6)
 by AS8PR02MB9627.eurprd02.prod.outlook.com (2603:10a6:20b:5aa::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.13; Sat, 25 Oct
 2025 00:48:19 +0000
Received: from AS8PR02MB10201.eurprd02.prod.outlook.com
 ([fe80::90d0:ca74:2479:bbdb]) by AS8PR02MB10201.eurprd02.prod.outlook.com
 ([fe80::90d0:ca74:2479:bbdb%3]) with mapi id 15.20.9253.013; Sat, 25 Oct 2025
 00:48:19 +0000
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: "osama.abdelkader@gmail.com" <osama.abdelkader@gmail.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "ross.burton@arm.com"
	<ross.burton@arm.com>
Subject: RE: [OE-core] [PATCH] bitbake: bblayers/query: Add --show-variants
 option to display BBCLASSEXTEND variants
Thread-Topic: [OE-core] [PATCH] bitbake: bblayers/query: Add --show-variants
 option to display BBCLASSEXTEND variants
Thread-Index: AQHcRQTkmJIQOaoL402lsGI34v1fCbTSBhFw
Date: Sat, 25 Oct 2025 00:48:19 +0000
Message-ID: 
 <AS8PR02MB102010B239D247D8B7C983C5FEFFEA@AS8PR02MB10201.eurprd02.prod.outlook.com>
References: <20251024164008.4753-1-osama.abdelkader@gmail.com>
In-Reply-To: <20251024164008.4753-1-osama.abdelkader@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axis.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8PR02MB10201:EE_|AS8PR02MB9627:EE_
x-ms-office365-filtering-correlation-id: 13c33011-5dc9-4059-8713-08de136030e0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700021;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?XpL4TBUKmiS9TmlIYi6Wc6ZNL8u/kYz+J3/qXEzSMrJAU7e2fQFknR52LMzi?=
 =?us-ascii?Q?c0nn4HPGv/1Csa1HW0hexAUFt9U0ai3itfmJgr3wFCUUDbVbyEX3UnhiX/Cp?=
 =?us-ascii?Q?MaZIYPWKkMajLttni2WB+h9Ls31paKATpr1kUHrvYRUBU1sh+LyTvHqCcK8W?=
 =?us-ascii?Q?31vfSxQqbfX2bUNDwRAVgQd115npE5EyC/lBx3CZfVG6aj25QxUsi1tp/M2n?=
 =?us-ascii?Q?kJqFV3XxOpQJQmI00e0YSeRwGO+eU2UocaMAJoGDQ94Dyx9+vrpCuTX82soh?=
 =?us-ascii?Q?vIhpDKhgO9yhloneHVISyEo7kQAePL4GPtdQMqItwyVwTbdU7LGJlZVqCt3l?=
 =?us-ascii?Q?VadhMlDPo9WSDpk3XNi8IKybSFCJH2KIjSJ/2rnrcx2VHQkZ3u2KIdWN040G?=
 =?us-ascii?Q?zmjdWj1PswrukpZ/NC7aZ2B0bmG0ir4nzauO2Lq08uqkbqbkM5CXGg1eU0Xf?=
 =?us-ascii?Q?xOhkJ45JjZ8tNKi+EzNHuXcuAnFxrXxC3tsbRqD9VWNi8j+CNFGAR7uf6mHV?=
 =?us-ascii?Q?P12sYtGosSusSP9a9OE8RFcyrY4cpsoXt5Sdw/NGY+RL9vfHwmFiQvXNmHzA?=
 =?us-ascii?Q?sEG3+ZFbg+LnkxEgFgJzvn268TU1Xi9ZfB//+hRudg9Bl/HMLKt0rzIibU8m?=
 =?us-ascii?Q?2oxOyLZZMHbbyQDOBMuOZYzAMSqHzb4NGcjbsqeQl1nae4u9OY5NKDk01xew?=
 =?us-ascii?Q?o3p2P4h/kQ+ss+wqQP722f1NZ0KsfdXBpO7i7joogu51tHyrW1LfM2JTLTcF?=
 =?us-ascii?Q?DntFoJHWPJGvgzltcgYnj2vauOrAsqotzAy8761UPPf7ZWJEQwN1bSLbblTs?=
 =?us-ascii?Q?tvkR3E1zw/CR7xzdUo4W31s8b8z9j8yoO6kpdcQURDdHn3P+fRzIxXa50rDo?=
 =?us-ascii?Q?S2OIHh2NuHo46EwBNrid2VWQaD+fgIqBffD7Mf4wlFNlIo3ZnMG4EZW3KJz7?=
 =?us-ascii?Q?yAqt3iA7+q9yOBfnKuJbsa54H3SpocY/o2+dy/OncZwBPYMz5SM+npqanmSy?=
 =?us-ascii?Q?2jfmapPphbsN5NYCrk4bAm5K3FK78VkbOen1ZMwOBS9Ws6uzAnTF/znvKF5F?=
 =?us-ascii?Q?NP2vDd43GeZOhwaNgrsT6etxY1/c9CD7a7s5i4VieWynCYRj0GATLvhZnveD?=
 =?us-ascii?Q?UwhYEFTO2MUM2mL/jM2OChVp3ttj0Z3taymPx84QQFEzGD8aPRplUF1yyZD5?=
 =?us-ascii?Q?7yVn+HcdnLE3/GRmkOAbI37zLFPJ9IHqFwow1mYnfzzGI1gDnjlVaNwy0IT7?=
 =?us-ascii?Q?TW8C3NskIbx47l1jFH5KPgrQUx//aotfpgI4UoJ09qP4uwdf3+7FZ0trIGWI?=
 =?us-ascii?Q?0uI+RZhjKBhkILVPoOGb/TB63zdu4aeutrGD/L0TQqihuJNyF92qTjrXiamq?=
 =?us-ascii?Q?SDc9u7ykWylKSYhbFRoECdkb0mT2oAX+T9ZoEYm9yO+Et2gNas4RVg1nR+MS?=
 =?us-ascii?Q?MaQypwAoxvbN/bmGv+P6CBqQlbiQ9eFEPvFLu6oEDvHDssioqkniow6nLT5N?=
 =?us-ascii?Q?vbtjamFSbp9Rgok6fYy+AukD4rGYJlcLhznU?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR02MB10201.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?VShsRJCUQ+1kbbscc+DM/N+ZZxDo5DTBpPlcjiVLUhwTdLfBe2XzRHgX52HE?=
 =?us-ascii?Q?WYL1YrIkg1o2/P3MJVYue2llo6CCsezXaNcdLYfDShe5Ve3fHQyg+R1NoZJN?=
 =?us-ascii?Q?ncRLHXitZjxCSN9A5jJNFbm0B27PugN5KU9ReqMK373jlOs8GY67wv8sIeK3?=
 =?us-ascii?Q?pcnenV/An9swh/Kt26UTndYPlRNrUMVZ+M3yj8AVSVxwHVyPZyxjnxNcFrJ7?=
 =?us-ascii?Q?Ch7UntQ3pRv+ZptPCbSHy1Cue4rbdMkOAap65Kk9is69HbUWY08SVgXrFMtd?=
 =?us-ascii?Q?v/XE6aZC9VzRPCFYp1TgPCwXzY47lMJpGIjOilwj0w+SfdtzOKUkcWavMLLE?=
 =?us-ascii?Q?6F/Bt1s8WrxuaJCIEVSgOahlkox/272w9AUalqyH4vXlke/12+1atZadNWOL?=
 =?us-ascii?Q?rIiya0wENioW2nUP9cYSUXJyEV01uDAhZ+NMvKiV1eg+qeI6L/k6jJ/kSRkh?=
 =?us-ascii?Q?NdXO/37WznyXKHJPexvHZUrT1bLiIAu6Lz2oeZOU1JTRSJXt+2Zwz3FIb4UL?=
 =?us-ascii?Q?1NkUjflAZUoU5E2sKrTh1Q5WxD/vUy8Nc9tRHxNDPlw9tCTdPksITL6s5/um?=
 =?us-ascii?Q?cvy1gRUrg1dDN2DY9aygxee4a2C5rLcQ1XZo0aQ7wjLV1AKxY0eeUmloIKES?=
 =?us-ascii?Q?T/Mzfwq8zsuDg4G4MyazSuQXfn1dwLOtE4k9DUVQ9UjCt7rx9rg65dnn88T7?=
 =?us-ascii?Q?gKcTBhRGf0jP5rjiz0EKJLO+0aCHbCtcpJ6yBtq4iRbZJRXS43gkpwhBL3sF?=
 =?us-ascii?Q?5bGN4IMpfhjk6kixD1iiKhUO35iPf1YG84YvUNGX6MOd/xL4FrWfY1bCfnoA?=
 =?us-ascii?Q?TUeNqAXp8t5i0me2gSTriYAgyGfK2cSc2/ifI0E9tGVQSVkz66ZsK3aN93iz?=
 =?us-ascii?Q?oZ21NWb1ZzRIG4wtMa9jEuiR8s8UFJbNdaKZSz7uFnAWep7f+i4wJCe1KjBr?=
 =?us-ascii?Q?Dw8GzfVo8ktsI2ejono9vHQWKBp8Zf5dRseaG06o71oY2UNbxXIUWtXUWHJJ?=
 =?us-ascii?Q?DEmBmvFjceJyAC0Yrpl+TrsiYfKSMP4T2kWX/vXOYR61mYIUwKHlNuxPXjvC?=
 =?us-ascii?Q?gqNomENcfr9qehqmwti2bLosSrOR57WUtypOqvPR3Kq5nYgwuWia/LJ4IfJ9?=
 =?us-ascii?Q?dm/OqMPF/ocEucjsSQeGIx4rOIo086Kgd/9XL8v2qBXZrR5w0Ylr9DoLGhB7?=
 =?us-ascii?Q?LClUhtNRfpdVMLaKUfhIRNDojUNg1TcJknoTPRa6EbTKLESFKCPk51JeWxUU?=
 =?us-ascii?Q?a/MSBF7B8zSIChdHWouCy0mDEhPz2nca7BCxL8ux0pL9FPcWWT5tjIrUTSkl?=
 =?us-ascii?Q?G+8e4TjI12sbiXGMZ+3NKxIoTVoVi1BorG/z0xVoDhwqAWETgqFyPigocJaL?=
 =?us-ascii?Q?U8DqK/rweOAT/g1nIcDmAl8gZj6OikQ+E70sl7htBqBB2/ha8I/r99IiUEPR?=
 =?us-ascii?Q?8/E/BwQz04654vExu1jcltu4DfaNoYLuZN/p/yT7R5tznUvW+YtnOZqJKx4D?=
 =?us-ascii?Q?rPFm7LLOOXsUZiFIi1JIJ/8ZHFzxIwbghY3L2eSKaSyfBD26cTb7GfkaTw?=
 =?us-ascii?Q?=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8PR02MB10201.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 13c33011-5dc9-4059-8713-08de136030e0
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Oct 2025 00:48:19.0502
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: eY9ajINLa1mBprkF4K4hq6psEuPS3tO0wLgHJIPKSJG6gLUCHj8RhltWmoKaHZTx
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR02MB9627
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 25 Oct 2025 00:48:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225301

> -----Original Message-----
> From: openembedded-core@lists.openembedded.org <openembedded-core@lists.o=
penembedded.org> On Behalf Of Osama Abdelkader via lists.openembedded.org
> Sent: den 24 oktober 2025 18:40
> To: openembedded-core@lists.openembedded.org; ross.burton@arm.com
> Cc: Osama Abdelkader <osama.abdelkader@gmail.com>
> Subject: [OE-core] [PATCH] bitbake: bblayers/query: Add --show-variants o=
ption to display BBCLASSEXTEND variants

This should go to the bitbake-devel@lists.openembedded.org list instead.
And drop the "bitbake:" prefix from the subject. It is added by=20
combo-layer when updating the poky repository.

>=20
> The bitbake-layers show-recipes command was hiding BBCLASSEXTEND recipe
> variants (e.g., devupstream, nativesdk, cross-canadian) by design, to
> avoid clutter in the output. However, this made it impossible to see
> recipes like linux-firmware's devupstream variant which uses git snapshot=
s
> instead of release tarballs.
>=20
> This patch adds a new --show-variants (-v) option to show-recipes that
> allows users to view all BBCLASSEXTEND variants when needed, while
> maintaining the default behavior of hiding them for a cleaner output.
>=20
> Example usage:
>   bitbake-layers show-recipes -v linux-firmware
>=20
> This will now show both:
>   - Base version: 1:20251011
>   - Devupstream version: 1:20251011+git
>=20
> Signed-off-by: Osama Abdelkader <osama.abdelkader@gmail.com>
> ---
>  bitbake/lib/bblayers/query.py | 23 ++++++++++++++++-------
>  1 file changed, 16 insertions(+), 7 deletions(-)
>=20
> diff --git a/bitbake/lib/bblayers/query.py b/bitbake/lib/bblayers/query.p=
y
> index eb7cb465b4..11341d5d53 100644
> --- a/bitbake/lib/bblayers/query.py
> +++ b/bitbake/lib/bblayers/query.py
> @@ -52,7 +52,7 @@ layer, with the preferred version first. Note that skip=
ped recipes that
>  are overlayed will also be listed, with a " (skipped)" suffix.
>  """
>=20
> -        items_listed =3D self.list_recipes('Overlayed recipes', None, Tr=
ue, args.same_version, args.filenames, False, True, None, False, None, args=
.mc)
> +        items_listed =3D self.list_recipes('Overlayed recipes', None, Tr=
ue, args.same_version, args.filenames, False, True, None, False, None, args=
.mc, False)

Since False is the default for show_variants, there is no add it=20
here explicitly.

>=20
>          # Check for overlayed .bbclass files
>          classes =3D collections.defaultdict(list)
> @@ -119,9 +119,9 @@ skipped recipes will also be listed, with a " (skippe=
d)" suffix.
>              title =3D 'Matching recipes:'
>          else:
>              title =3D 'Available recipes:'
> -        self.list_recipes(title, args.pnspec, False, False, args.filenam=
es, args.recipes_only, args.multiple, args.layer, args.bare, inheritlist, a=
rgs.mc)
> +        self.list_recipes(title, args.pnspec, False, False, args.filenam=
es, args.recipes_only, args.multiple, args.layer, args.bare, inheritlist, a=
rgs.mc, args.show_variants)
>=20
> -    def list_recipes(self, title, pnspec, show_overlayed_only, show_same=
_ver_only, show_filenames, show_recipes_only, show_multi_provider_only, sel=
ected_layer, bare, inherits, mc):
> +    def list_recipes(self, title, pnspec, show_overlayed_only, show_same=
_ver_only, show_filenames, show_recipes_only, show_multi_provider_only, sel=
ected_layer, bare, inherits, mc, show_variants=3DFalse):
>          if inherits:
>              bbpath =3D str(self.tinfoil.config_data.getVar('BBPATH'))
>              for classname in inherits:
> @@ -203,8 +203,10 @@ skipped recipes will also be listed, with a " (skipp=
ed)" suffix.
>                  # We only display once per recipe, we should prefer non =
extended versions of the
>                  # recipe if present (so e.g. in OpenEmbedded, openssl ra=
ther than nativesdk-openssl
>                  # which would otherwise sort first).
> +                # However, if show_variants is True, we show all BBCLASS=
EXTEND variants.
>                  if realfn[1] and realfn[0] in self.tinfoil.cooker.recipe=
caches[mc].pkg_fn:
> -                    continue
> +                    if not show_variants:
> +                        continue
>=20
>                  if inherits:
>                      matchcount =3D 0
> @@ -229,7 +231,11 @@ skipped recipes will also be listed, with a " (skipp=
ed)" suffix.
>                      for prov in allproviders[p]:
>                          provfile =3D bb.cache.virtualfn2realfn(prov[1])[=
0]
>                          provlayer =3D self.get_file_layer(provfile)
> -                        provs.append((provfile, provlayer, prov[0]))
> +                        # When show_variants is True, use the virtual fi=
lename to distinguish BBCLASSEXTEND variants
> +                        if show_variants:
> +                            provs.append((prov[1], provlayer, prov[0]))
> +                        else:
> +                            provs.append((provfile, provlayer, prov[0]))
>                          if provlayer !=3D preflayer:
>                              multilayer =3D True
>                          if prov[0] !=3D pref[0]:
> @@ -238,10 +244,12 @@ skipped recipes will also be listed, with a " (skip=
ped)" suffix.
>                          if not items_listed:
>                              logger.plain('=3D=3D=3D %s =3D=3D=3D' % titl=
e)
>                              items_listed =3D True
> +                        # When show_variants is True, use the virtual fi=
lename for preference check
> +                        pref_cmp_file =3D pref[1] if show_variants else =
preffile
>                          print_item(preffile, p, self.version_str(pref[0]=
[0], pref[0][1]), preflayer, True)
>                          for (provfile, provlayer, provver) in provs:
> -                            if provfile !=3D preffile:
> -                                print_item(provfile, p, self.version_str=
(provver[0], provver[1]), provlayer, False)
> +                            if provfile !=3D pref_cmp_file:
> +                                print_item(bb.cache.virtualfn2realfn(pro=
vfile)[0] if show_variants else provfile, p, self.version_str(provver[0], p=
rovver[1]), provlayer, False)
>                          # Ensure we don't show two entries for BBCLASSEX=
TENDed recipes
>                          preffiles.append(preffile)
>=20
> @@ -530,6 +538,7 @@ NOTE: .bbappend files can impact the dependencies.
>          parser_show_recipes.add_argument('-i', '--inherits', help=3D'onl=
y list recipes that inherit the named class(es) - separate multiple classes=
 using , (without spaces)', metavar=3D'CLASS', default=3D'')
>          parser_show_recipes.add_argument('-l', '--layer', help=3D'only l=
ist recipes from the selected layer', default=3D'')
>          parser_show_recipes.add_argument('-b', '--bare', help=3D'output =
just names without the "(skipped)" marker', action=3D'store_true')
> +        parser_show_recipes.add_argument('-v', '--show-variants', help=
=3D'show all BBCLASSEXTEND recipe variants (e.g., devupstream, nativesdk)',=
 action=3D'store_true')
>          parser_show_recipes.add_argument('--mc', help=3D'use specified m=
ulticonfig', default=3D'')
>          parser_show_recipes.add_argument('pnspec', nargs=3D'*', help=3D'=
optional recipe name specification (wildcards allowed, enclose in quotes to=
 avoid shell expansion)')
>=20
> --
> 2.43.0

//Peter


