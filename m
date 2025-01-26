Return-Path: <joerg.sommer@navimatix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D703C02181
	for <webhook@archiver.kernel.org>; Sun, 26 Jan 2025 15:51:34 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.90])
 by mx.groups.io with SMTP id smtpd.web10.32150.1737906691024828084
 for <openembedded-core@lists.openembedded.org>;
 Sun, 26 Jan 2025 07:51:31 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@navimatix.de header.s=selector1 header.b=F4dz38Zd;
 spf=pass (domain: navimatix.de, ip: 40.107.21.90, mailfrom: joerg.sommer@navimatix.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WB43abl9tHr1h62DpO2ofnSowyrlO+coigThSjILaiq+HoVvTEE+uKPKE7dPD/PRMaz6/+6YH6IFjHWmY6TVmhQMenqHfNsMHjFaUfB3SJTf+/v5I3RbViX3rX/e7J/FH/nPth1lfauCl0yEJHTS/FQHclpPh6JL3xTqDDv4ZCWTJiUTJbi3MbR7TKvPxXcuvqDfuW8+U4B8e7gY6N6iIOdQj6+fgUnGudgqg/MwvR94rzu319/O/Pb90fFt9XjGzzFz2tHZr3qXltSBautCJ9IL4CNg9O9oKpiNYLhfXpTWQ3MJeBJoChjDug9zOZXuM92odkDB0rTyUlwbHOuJhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9zGRBHirh5E1Zc6ZTNXKsFjA4UW6y2BlLrbfMesEI3E=;
 b=L2kOb+zxl8StIddjy2fWY1AuFEjzc+hW8t9mEslUzcsJ38O7QZqU69G4GuMEMj0lnAsUv8TIIzcTNCAmTjd8ec7v1LJJ1UeCh8ROPjUgE1emu0QBPT+n0OqxSZgTdzeUkZE9gHR2clD9BO/KuOjf1X/yccsxbjszsUWqyv0TEwmdEbVU+AzLbXyRj8sSDxk3NxPFH3QRbMwuddGN6A+mqGegz94543VZMxrdJvKrsSIb5txzdwqYJeSGBOJYhaETqJF+5D0SsZYHEl1P1gN4c2fy+/a2pJP5psSoQnyGmoRouKG5vd8b9LtQJyTRv9KWPci/uJ8Sr0ZgyxyyLBvmwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=navimatix.de; dmarc=pass action=none header.from=navimatix.de;
 dkim=pass header.d=navimatix.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=navimatix.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9zGRBHirh5E1Zc6ZTNXKsFjA4UW6y2BlLrbfMesEI3E=;
 b=F4dz38ZdEJ+cPY1him+ghoTPQsIZ5XP9ZtvaSTSsLmztc1CYItKTPI1PkHz3NTokd+4Np2x0tZHKvjGYHJtVkiLgW5f1OWD7z5vVxHzgehgufzxOQopiAC449ANqgamzEx4PjF0RuVtUuzB43NQ0sRHbMEjdLq3jA1y83L6NWc4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=navimatix.de;
Received: from DU2PR01MB8293.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:2d4::5) by PAXPR01MB9314.eurprd01.prod.exchangelabs.com
 (2603:10a6:102:2be::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.22; Sun, 26 Jan
 2025 15:51:26 +0000
Received: from DU2PR01MB8293.eurprd01.prod.exchangelabs.com
 ([fe80::d520:1b9e:a30e:69a7]) by DU2PR01MB8293.eurprd01.prod.exchangelabs.com
 ([fe80::d520:1b9e:a30e:69a7%4]) with mapi id 15.20.8377.021; Sun, 26 Jan 2025
 15:51:26 +0000
Date: Sun, 26 Jan 2025 16:51:24 +0100
From: =?utf-8?B?SsO2cmc=?= Sommer <joerg.sommer@navimatix.de>
To: sst@poczta.fm
CC: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH RESEND] kernel-yocto: fix merge_config.sh flag
 set when KBUILD_DEFCONFIG is used
Message-ID: <tymbfhiwtonqtgdulmtqdhaswoxq43asvxtizp2zeocaytipdi@5k6e2fmt22p7>
References: <20250126132005.1540374-1-sst@poczta.fm>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250126132005.1540374-1-sst@poczta.fm>
X-ClientProxiedBy: FR3P281CA0173.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a0::15) To DU2PR01MB8293.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:2d4::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR01MB8293:EE_|PAXPR01MB9314:EE_
X-MS-Office365-Filtering-Correlation-Id: 630b2436-26be-4ce3-1b65-08dd3e214a9e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?5HCB3wD0+hgBkWgQAxIothiLB2n4FKiiD/18GysbsyTDHySzRguMq4UegwuD?=
 =?us-ascii?Q?IS6Byox6hVirRiu2JkFgbrpsbA0JrSfvdWjUBwZnBhA9x9HB6xpSZGXKMAeV?=
 =?us-ascii?Q?mfiosACnmddAn2cdpzMBAgIfIkBCyLY3F4RP6BiDi6EpezJTF626FoQOs3Uw?=
 =?us-ascii?Q?F5oj5411qqVdCCcMAgUjWgTzv+06emFl3rMJjH1Zfob+HqkoK5Q4ZYCj8s1W?=
 =?us-ascii?Q?+/CEuR4NtV+SlE01ykhMSLCAASrFlzscTNZydiQ5yQuwFVnjpVCIudD3ildM?=
 =?us-ascii?Q?AZTVtcLWv3YnyNCmLk1cFhCM9nkOLfT2Jk9PO8FN8OEqlG5+WSEOdIimB3xq?=
 =?us-ascii?Q?0vHuJse7unZ9/ylYG+skSRxRNLtyDmy76qj/jSGRanS9xTpwDQajv1SZ8Tjs?=
 =?us-ascii?Q?z/ItkgRLC1lzsAXS8+SGhHeXVlcOfuVoCsXm3QvfnJYcIPX/w7YQY4uoRIzu?=
 =?us-ascii?Q?QAAdDfIpZBkCc6IZ2M+RdIxgG5TYGtj2SkiquAN2UCw6wRlPkLxOsOdyqLma?=
 =?us-ascii?Q?Uqyw1swOZ9KkWxDR6shh3oHll7Q9BYuW8OmuLZjQkHHOmzhbH8Zc8mB6NBo4?=
 =?us-ascii?Q?P6+LkTeATUy0GKPhmzVJ6z2nbZHkbTiUtKd1MrAx6TMklUhhTuQVGvCYemas?=
 =?us-ascii?Q?eVdUibEF9EH2gvig5WlDB/V3WC4k7GENaXkb5nEFOwioBqe/LAGi/wscPQ77?=
 =?us-ascii?Q?tPfDmZiqsp8hQMb/XjuRtKvwYZ0EIV9fjDdezEjn4GlZIVBuei38CQ7Ueg1k?=
 =?us-ascii?Q?lB5I2nHZ/gESIs/KGLyHPqWkxvWS3/r76fAczeaaLPhLNdi+0e4E/5F7m3Iu?=
 =?us-ascii?Q?4j03LMP16x4NLtHcjOBuGx8Tm4xFwjSpXjFUzEIfz47myLXR9U5ozBDT8Y/0?=
 =?us-ascii?Q?v4RmVg7xhf9BYOxGgYYCGEuh2B5KwOYTHSzwgLQfEe2TjbiO7mDLtcm70UNv?=
 =?us-ascii?Q?4cnERC5QIrr/tCg1uerar88Vra8dAZsEhXLw2Pt2SwbCYH55rWo4biQJgGCD?=
 =?us-ascii?Q?g5tzIc7zj0ou1qXYJye3AV8GRgiQiuLdlsSxdrqs0btR8zx5ld9uVQDzCWEa?=
 =?us-ascii?Q?pT9xtD8Eo+fPWGeWA6O0Ytpapwtupfa8Bs7xuVpnXWw721jr1glB4V0qK+xO?=
 =?us-ascii?Q?PbQ4cQPglwcYlbhCvNgOcofF2G3bNs1m5nEOlOCnY59J5XM+2z3uqwYhFxAJ?=
 =?us-ascii?Q?OHD3rt3Qw42uNymEWQL0TfyWN8SFN7dYsbp1jMt8vWFl97WIxB0/AbeqChgL?=
 =?us-ascii?Q?jXXCYPzWU9PAiyrOjLB2wBjSxPiRxwyLobTPZEYSt9fG86C+uEb0fmDGWalH?=
 =?us-ascii?Q?/UN228WNfe6+rrz+ig1/104o?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR01MB8293.eurprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?mDOVCjvbEryNTEwLXZg27kXxR509PcqTr/QuVchBie0Dh1FtXo+UpzWc3NkE?=
 =?us-ascii?Q?eDBFQEcx1pmvcgH128HzdjFsl+Ai85YeyvypwLD20MCEx5tvnIrBxUJvNLpW?=
 =?us-ascii?Q?oeVz2Z0V9C9hWZLdDd5uLTm26UxOD1RAgOLUYx7j31/iRYXqCz/MH6qH4DbP?=
 =?us-ascii?Q?3DMwuwmj9PODSkwZuAFCZXRNhrn66ucrOAw0vPHYjoHY5m4/mNTm4/uWJ935?=
 =?us-ascii?Q?SjrgR/Euy+ZDGSbVj9fEqgPAAoAOQ79k7iTAPF8oHm7egGGko8YulqHx9CFC?=
 =?us-ascii?Q?wAmCaw66+//1qR2aRTAtShPWUVPJzascu5WvCf3iXN9WCOaBLqdX8eFdu6l0?=
 =?us-ascii?Q?JQZACFJyhoSNWWLuX8b2LqGBmskkLowYfhMVompNeNW9CQlCTIxORVlYZ0yg?=
 =?us-ascii?Q?zxr2dWSQANV1rGERlMpCUylasge6Ce0uNGpNRJ8Vdfo8rJ/SYUw77J8mC/2M?=
 =?us-ascii?Q?IgGJFGJD7MIlTrJq21NvU2/+e9QN9OBxJdlfuHO+lCnzWmWerE2SQX7fuGqW?=
 =?us-ascii?Q?23mw5ws0hXaRVb0gybejx5ivO6//8qnm9gTwWIXcox3xB34zqU1cdJD6C2I+?=
 =?us-ascii?Q?fn4nXpb6L7IKAtCqD2gB8VojahcjAfUmO+xdRgVdPzlfPIbwb+4QhPnxaP1d?=
 =?us-ascii?Q?yqD0wDihzSThMqHCGG9DS7kDlgaZ/2Xu8/MZGGrPOAqIucNNhuLhXKxvlbJn?=
 =?us-ascii?Q?T1jHCWRA/luEzU3YFwiam074qJ/aVwAT9Li/XUcSg38eLqez32KKltnvFYri?=
 =?us-ascii?Q?hBIxXxtNxygpGXLv0h1vFBz3Lo0zjWjd1VqFNiyqBCKQ8/2PaBcRJp/7qrwn?=
 =?us-ascii?Q?BtvRyyJvwvK2gpcCP1sAazEedDRHFD2aZiH4VIYoPM1pIAjQsHFmxvNODMHS?=
 =?us-ascii?Q?RyjIsRM0PUEzwG8103rTWqP/zR1BCNgdFV1TCZLWuUFQfuscsm8dJgZm7RFU?=
 =?us-ascii?Q?0lJ4iGPB97R+GRFqDTxknV5dUgc1EpEHSqus6sdm0dXyoUQH545aukjtIP2h?=
 =?us-ascii?Q?UzqonclTLHbkdAIzUpjuNC/sODVctvyyH6ttcBH3fG/3szj9nWccWoTekmIi?=
 =?us-ascii?Q?yZ//+CAi+fStZk7oFS1hO9PZfvWxZB8FD/TCFerKc6Qcn0zMFOqsDYDq27tC?=
 =?us-ascii?Q?mD+t40rAe0TA+tYgToZSNFSly7T/R/gMEZVewAndqRsJb9mmEfc1EV9Q+7HT?=
 =?us-ascii?Q?5bB8cSelcXX5h+KB72UYsg4mU4mJeyJhFR4pWNkDEECIou/9ynHtQ1gpv1Sc?=
 =?us-ascii?Q?BWCC4a/lqeXZ4dyXldTFyISlq4fQUrZj2UQr6HPf0DTgsfV0qkjEOGmJcv27?=
 =?us-ascii?Q?Ch3Cr5iiL8DOnFhKm2BtMKeyIRUFZ7B5kHaiHM/FxzF9byvQChHRvh1MIbXs?=
 =?us-ascii?Q?BA1uNlMRdqIYyGSwfE0zXtLNMFo2Jxyq6JrZG4ec2NBKlFBac5KkXtyS7dBi?=
 =?us-ascii?Q?mfFt6J92AOEbUQ/lBp8NoEll4XVXW+qkN6Te4UN1BrRGCuhjpHywf+RtC2I6?=
 =?us-ascii?Q?1pW5n4qmtX4y09W90qDmAQsNSzE/TMjPFJcvC81SsCU21/yvjgg6mFgcS4CG?=
 =?us-ascii?Q?qaevgtTjvorCttF0dE6k6UMqNFrPyjhWaeInaAWYf9JqIoqrYG4MTJ0i7N/u?=
 =?us-ascii?Q?fA=3D=3D?=
X-OriginatorOrg: navimatix.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 630b2436-26be-4ce3-1b65-08dd3e214a9e
X-MS-Exchange-CrossTenant-AuthSource: DU2PR01MB8293.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2025 15:51:26.3968
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: c87b4f54-b992-4813-8f3f-4a876324197f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qWunolDo8nIpomAAqieMPx8uaNDUCLf4hpKIoiOEN7X/OTztvAoFx89vVHDtUPWqb5OgiRURtnXIWaEJVCgXubNawYvE5tnOqzbdwcHPFWI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR01MB9314
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 26 Jan 2025 15:51:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210292

Slawomir Stepien via lists.openembedded.org schrieb am So 26. Jan, 13:43 (+=
0100):
> Based on the documentation of KCONFIG_MODE[1], when we use "in-tree"
> defconfig (the KBUILD_DEFCONFIG is set), then the alldefconfig mode
> should be used with merge_config.sh.
>=20
> This commit fixes the logic behind setting the flag by checking if the
> provided defconfig file exists in the linux source tree.
>=20
> [1] https://docs.yoctoproject.org/ref-manual/variables.html#term-KCONFIG_=
MODE
>=20
> Signed-off-by: Slawomir Stepien <sst@poczta.fm>
> ---
>  meta/classes-recipe/kernel-yocto.bbclass | 18 +++++++++++++++---
>  1 file changed, 15 insertions(+), 3 deletions(-)
>=20
> diff --git a/meta/classes-recipe/kernel-yocto.bbclass b/meta/classes-reci=
pe/kernel-yocto.bbclass
> index c45abf6ddc..ffda41ffc9 100644
> --- a/meta/classes-recipe/kernel-yocto.bbclass
> +++ b/meta/classes-recipe/kernel-yocto.bbclass
> @@ -113,6 +113,14 @@ def get_dirs_with_fragments(d):
> =20
>      return " ".join(extrafiles)
> =20
> +kbuild_defconfig_exists() {
> +	if [ -f "${S}/arch/${ARCH}/configs/${KBUILD_DEFCONFIG}" ]; then
> +		return 0
> +	fi
> +
> +	return 1

Hi,

you don't need the branching logic here. The function always returns the
last return value. So

kbuild_defconfig_exists() {
    [ -f "${S}/arch/${ARCH}/configs/${KBUILD_DEFCONFIG}" ]
}

is enough.

Is it really worth to have a single function for this command? Maybe, it's
more useful to define a variable S_KBUILD_DEFCONFIG_PATH and replace all
occurrences of `${S}/arch/${ARCH}/configs/${KBUILD_DEFCONFIG}` by this. But
even this might not help so much.

>  	if [ -n "${KBUILD_DEFCONFIG}" ]; then
> -		if [ -f "${S}/arch/${ARCH}/configs/${KBUILD_DEFCONFIG}" ]; then
> +		if $(kbuild_defconfig_exists); then

I think you don't want the $(), because you don't want the output of the
command, but the return value. So `if kbuild_defconfig_exists; then`

>  			if [ -f "${UNPACKDIR}/defconfig" ]; then
>  				# If the two defconfig's are different, warn that we overwrote the
>  				# one already placed in UNPACKDIR
> @@ -478,8 +486,12 @@ do_kernel_configme() {
>  			config_flags=3D""
>  			;;
>  		*)
> -			if [ -f ${UNPACKDIR}/defconfig ]; then
> -				config_flags=3D"-n"
> +			if $(kbuild_defconfig_exists); then

Is it save here to assume KBUILD_DEFCONFIG is set. This is checked in the
code fragment above.

> +				config_flags=3D""
> +			else
> +				if [ -f ${UNPACKDIR}/defconfig ]; then

You can use `elif [ =E2=80=A6` to reduce the nesting.

> +					config_flags=3D"-n"
> +				fi
>  			fi
>  			;;
>  	esac
> --=20
> 2.48.1
>=20


Bye, J=C3=B6rg

--=20
Manchmal denke ich, das sicherste Indiz daf=C3=BCr, da=C3=9F anderswo im Un=
iversum
intelligentes Leben existiert, ist, da=C3=9F niemand versucht hat, mit uns
Kontakt aufzunehmen.                           (Calvin und Hobbes)

Navimatix GmbH           T: 03641 - 327 99 0
Tatzendpromenade 2       F: 03641 - 526 306
07745 Jena               www.navimatix.de

Gesch=C3=A4ftsf=C3=BChrer: Steffen Sp=C3=A4the, Jan Rommeley
Registergericht: Amtsgericht Jena, HRB 501480

