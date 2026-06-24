Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02BCECDB471
	for <webhook@archiver.kernel.org>; Wed, 24 Jun 2026 12:28:06 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5780.1782304076010881776
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Jun 2026 05:27:56 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@cherry.de header.s=selector1 header.b=Tdl64rMe;
 spf=pass (domain: cherry.de, ip: 40.107.162.53, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EmujMF2Wrqc6QFG/uB54m0q0BTGJogdPfPERhQGVZ2+PMJTKf+vakXYA4krVliw943yRVYZxva9H+zAfy/vi5CC1YdFaCinUCi1iFsoc70aG2PMdp+Y77yy4OgRAfQZI2H7TsEM6yko5/uoDCD4PVz5SuDba7ejhOZQF9h5XivMoQgfOZW9eJ1aQeWD4rst79tBCGxEndW/qGcyvXb8OUWQLCIaCIekSJKzenK19qs+EDmhCD2Mz5v3pfIfauCePST+s+kLFuTzSUDxeq+a6mI2CwzPqN8WmAGQmJE/bf7ygCbzkJNWgxxAKNjQm+4GbJ7ehZ7M463MLENgV/O4gPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G19NHE2AsHEyGySQm8EplEtMiq7hhxDAuSNcoXr4vCw=;
 b=VH2SMpxLG84pWeW4nF5d+4cEbvuNMiD8cocEyuC08qXA75QC9neEoA4ekiRNGyVU7TNywnI6kdtKh8C2pX0INScWyS4bN9+fQLyrlN65dvRiM6DHcNlbC59nqet9DgeKlIpHkFwSSJvLy1P8rVhouG6XSQFEOx0ZlKDIL/jr0iz80nQ2XtROFjs8CBuUJNxRNdbILxWCMazHjoLbGDuDd5FsxuEkVdEqywZDMR0hG64zLfrCIOiXf1EQviCNR3kIRr9Ns39qTae3JQ6uMd84Eth3diT9UeVs9k5e9ocSFJG78UDGpDdECYDb4X6vrddtKGcRi+4Ag5Vo66T5NbtAyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G19NHE2AsHEyGySQm8EplEtMiq7hhxDAuSNcoXr4vCw=;
 b=Tdl64rMeExFGwiSJqy4tZwxOqhUlq+1U/UsDVXskwSazPlBMuUPWBE2kt6ATMWd70eD/PKJCw38/MJLNj2zx2p539FVEyA3FTVFrh2pwZHpEjc2LyhtRjagJqQ3w0UobHPBwRB2fYucKmolAyXlFfW/4QhJLVE8uKIKrrLIyCo8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from DBBPR04MB7737.eurprd04.prod.outlook.com (2603:10a6:10:1e5::22)
 by AM9PR04MB8305.eurprd04.prod.outlook.com (2603:10a6:20b:3ee::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.12; Wed, 24 Jun
 2026 12:27:51 +0000
Received: from DBBPR04MB7737.eurprd04.prod.outlook.com
 ([fe80::5960:fb4b:9313:2b00]) by DBBPR04MB7737.eurprd04.prod.outlook.com
 ([fe80::5960:fb4b:9313:2b00%5]) with mapi id 15.21.0139.018; Wed, 24 Jun 2026
 12:27:51 +0000
Message-ID: <678f6221-8a20-4899-af67-aaeedc47dcbb@cherry.de>
Date: Wed, 24 Jun 2026 14:27:49 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] uki.bbclass: add merge logic in dtb section
To: shoudil@qti.qualcomm.com, openembedded-core@lists.openembedded.org
References: <20260624023506.1474514-1-shoudil@qti.qualcomm.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20260624023506.1474514-1-shoudil@qti.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: VI1PR07CA0285.eurprd07.prod.outlook.com
 (2603:10a6:800:130::13) To DBBPR04MB7737.eurprd04.prod.outlook.com
 (2603:10a6:10:1e5::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DBBPR04MB7737:EE_|AM9PR04MB8305:EE_
X-MS-Office365-Filtering-Correlation-Id: 97f61bd3-8445-4d59-c243-08ded1ec0216
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|1800799024|366016|376014|18002099003|22082099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: 
	59N3ktxp4AZu6NWiv4HYvcX+KcmKM6w9eA+tPn08+rSdnyPCQQ4XZHnqjsNaQke6r4HX9zDtGG1LugyBEbqYQu3A1bz5BaYlbE0+gyhiZJRRsjOczdjrjElFVQbmLfdNqGdMVHMRe/qWe6Pa+qe9wIjaxEAHxn++QljMw3q+nfSIRcfOy0xYfismIW2sT4MbkNRXdPVi5NqxRYE2LEO7ic9XB3lvewL0TpSqRKJC6lmOdFBPooXj7/v4JkL+C7ZZfomAYubJszIzGe2WnUHB4TG23mfd35ce3b1yS+J1vQOrBTXw8PZE5JoxFV52oKqo0tDvlMxkLtx5yByY3eVImtolMnrIQcbjCnXeGitz03ey06/4Bj7muiJtvjgjEJmEiU98L4yocy2O778/melQWcYzt2eplNOjPW1t2TOgxKdQ1XNCaAtpFgKrp+RpDPDV05i9fGLh4nMIPacE1+YU03cL6xtyrFo4dhlqYn68O3jyv74gQEVI/FvA3dEyWY9hcXbQvhpd/ZsRqhbOET1Z937lWMUhTF4hYtL5fZpHSarnu4sJuZRVFIiWT2eEcu28BWVUYLaylD2s8k5ZJ2FDol37x/Txf4AQGI81PwqiKvkpHj1sLOCzMaKxmpOY96VS24X8S7JRfUTpnPzl+Z2qlVhWh6HRnEMvW54hQ1FLqNw=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR04MB7737.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(366016)(376014)(18002099003)(22082099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?uQEsnxnIv4VrLmfyPPOpuwk+93Bm8Bb3mmLoLESq/HdTh3NLZpvESBr5/teA?=
 =?us-ascii?Q?ljYZyHkcAui1FnPM79N8Cr5AcuC97boKPakz4omF28QQ77CiWe8soXG9xmdI?=
 =?us-ascii?Q?9yTggqmOurPhk49YzIcwiX4C3Uqto3OHo3pdj+mpfyvcqw09TWCyJfAlxRIW?=
 =?us-ascii?Q?EHwETyrHKvm5Rpeull2WXAaWskJLCUJcGQIXYdMnKUf/3u5I9ZptCkYQcMK3?=
 =?us-ascii?Q?ClB3h9LCkh50+k+1ibZoDG87+f+EX1qOo4bUFQHAZm4IfWN02RH3VsNwW7IZ?=
 =?us-ascii?Q?jUs+vvREt3eYFJYOxZ4sEXGBMYgLrumoGIby5ZMBJHajiH+RuWngqo2E8TTj?=
 =?us-ascii?Q?o2+lGiukLD1iZJA6TiOeCX0hrg7A8phZU82K/oJLIvXIab0WSVFEoqIJb10b?=
 =?us-ascii?Q?jI4UTFeoH3ytuYksL3PQuGgvwxJXics4axP2jWA0SmFeKEXjnHF3WrBq3p6p?=
 =?us-ascii?Q?84d45wVqp9Cf6D+Ibeqxn6iHCYwQFbA8efQffaXae5kWILiKv9fyOKJxnncR?=
 =?us-ascii?Q?n44u8KRx2hPtdrE45Qp3Jkv71GK3iWr3PKcOIG2HKkvNIe1UInlaAoItCUU6?=
 =?us-ascii?Q?X9Mnp83Ib/Uu0qWbjH+XLJ+NDSOVd5H4UBFbFLMkFnq7yw4vaHWuYXIujT9U?=
 =?us-ascii?Q?Hwnx7upCN66ddsnUze9t5ywTlohr2xdUUG/0TcdjvYYA7AfCASAGz4E1o/NK?=
 =?us-ascii?Q?/RjGjaJaaOyZGmeLt7Pvll0HPugfSNmn5QJN06B8gUZ14777fAjiFXg6hEaO?=
 =?us-ascii?Q?ku5NvwJBolfemoyaZCImcB+/EUJvjodgHokuCFHdu1EHwxnkNg7CXDttZNIy?=
 =?us-ascii?Q?sgi+u6QMEOwcsFkTSR8UfzZWjIZsNZz+O+hA9URcqRaWCMEl1R1SiyRirtYW?=
 =?us-ascii?Q?7QeUObwSto38ba/YNQYCihPzBNxyxYlW/1Dz90XTeTQmD1hmgHssFK2zgdeG?=
 =?us-ascii?Q?LODVw/pCvk3LeFAkK2uMJ6e3S9LBTIvTJFNduloCSg6neK4HVfK1KcAGoRa3?=
 =?us-ascii?Q?jjC/6eCnZXOIxCItGgqc3+rCl8OAHU5xSR2Uu7JnLyofVFB+aEX/G1tgx2Q6?=
 =?us-ascii?Q?QQrWuqQqItrw1ljzSuopdhU5oj3hbd2Vlbu9I3e9axVoVj/U1Vmg0CDRjafA?=
 =?us-ascii?Q?GO6SNUp7kgmv5gRTRBxlrvSQlFnpImQLYcmVm6wC0l02CwJyK4MsE8eCjwgO?=
 =?us-ascii?Q?Oq9RPErHWD2Cz3vtP6dLD+tm/MAC4vLLMGIwXQgiSUBvqlGzKpE7mh4OAJzV?=
 =?us-ascii?Q?SKaxX3lTmvMYBLW53a/wNlM0iX+AXLfaC0HnTdmWs/que3xfs5YfUcDrfgmU?=
 =?us-ascii?Q?DTPDAWnCyT41or6AOgaxVBWKdYqG0ZojzrvlPrBrW2uCMR7m4+rkN+Cwobu6?=
 =?us-ascii?Q?/ztIIuxsZzn4xcpuaAVwBAmUe95EXrYPCjHFYX4WYdwFn/PedBhYmFBi2hX0?=
 =?us-ascii?Q?aWuW8zIUA41DTeKy9EF1QXmfMg9vRx5C7ji8jvR+ey9tLr8x1g9LXltvGVse?=
 =?us-ascii?Q?x7oPTHFzZPUTtip2NVAVOFLUuk64LfAfbGq+hNzU6lVdiv9W6CeTRoZNunYH?=
 =?us-ascii?Q?gJLoqY90PrS4z1zy53/nBvuhGQOa5VDDsmW3oDIK2i23dMpT2/cqvt5msdmv?=
 =?us-ascii?Q?hZby9F+5OyzvifMHXnqpXi5aIIGVGzFb1bVHn83kr+scmnd8ii+dx+4wSumd?=
 =?us-ascii?Q?a9f+oW44XYy6qLjgC0499sd8z83V4pnFmTWxhkkcObYCqh2Ixw7sZuD5zgaN?=
 =?us-ascii?Q?if2PWhSdYw=3D=3D?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 97f61bd3-8445-4d59-c243-08ded1ec0216
X-MS-Exchange-CrossTenant-AuthSource: DBBPR04MB7737.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2026 12:27:51.3142
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: w7mxvMedwrejLPE42sbOC23PTWzD/jmUub/x+u5Cd0iJkpeTsR9XxoSdUKRRxo3om6vR4c71ncg1rGHemyhkXtc1+862cEYLt8pqpXeN7FY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8305
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Jun 2026 12:28:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239493

Hi Shoudi Li,

On 6/24/26 4:35 AM, Shoudi Li via lists.openembedded.org wrote:
> [You don't often get email from shoudil=3Dqti.qualcomm.com@lists.openembe=
dded.org. Learn why this is important at https://aka.ms/LearnAboutSenderIde=
ntification ]
>=20
> For machine with multiple dtbs specified, we need to merge dtb overlays
> to base and pass the merged dtb to ukify to create UKI.
> Walks UKI_DEVICETREE, splits entries into base_dtbs (.dtb) and overlays,
> and validates all paths exist. For each base DTB, finds matching overlays
> by checking whether the overlay filename starts with the base DTB name.
>=20
> If matches exist, runs fdtoverlay -i <base> <overlays=E2=80=A6> -o <B>/<b=
ase>-merged.dtb
> and passes the merged file to ukify.
> If no overlays match, passes the base DTB directly =E2=80=94 no change in=
 behaviour for
> DTB-only boards.
>=20
> Signed-off-by: Shoudi Li <shoudil@qti.qualcomm.com>
> ---
>   meta/classes-recipe/uki.bbclass | 28 ++++++++++++++++++++++++++--
>   1 file changed, 26 insertions(+), 2 deletions(-)
>=20
> diff --git a/meta/classes-recipe/uki.bbclass b/meta/classes-recipe/uki.bb=
class
> index fa1c95603b..03eb9eafbd 100644
> --- a/meta/classes-recipe/uki.bbclass
> +++ b/meta/classes-recipe/uki.bbclass
> @@ -61,6 +61,7 @@
>   #
>=20
>   DEPENDS +=3D "\
> +    dtc-native \
>       os-release \
>       systemd-boot \
>       systemd-boot-native \
> @@ -150,16 +151,39 @@ python do_uki() {
>       if cmdline:
>           ukify_cmd +=3D " --cmdline=3D'%s'" % (cmdline)
>=20
> -    # dtb
> +    # dtb: separate base DTBs from overlays, merge each base with its ma=
tching overlays
>       uki_devicetree =3D d.getVar('UKI_DEVICETREE')
>       if uki_devicetree:
> +        base_dtbs =3D []
> +        overlays =3D []
>           for dtb in uki_devicetree.split():
>               # DTBs are without sub-directories in deploy_dir
>               dtb_name =3D os.path.basename(dtb)
>               dtb_path =3D "%s/%s" % (deploy_dir_image, dtb_name)
>               if not os.path.exists(dtb_path):
>                   bb.fatal(f"ERROR: cannot find {dtb_path}.")
> -            ukify_cmd +=3D " --devicetree %s" % (dtb_path)
> +            if dtb_name.endswith('.dtbo'):
> +                overlays.append(dtb_path)
> +            else:
> +                base_dtbs.append(dtb_path)
> +
> +        fdtoverlay_bin =3D os.path.join(d.getVar('STAGING_BINDIR_NATIVE'=
), 'fdtoverlay')
> +        build_dir =3D d.getVar('B')
> +        for base_dtb in base_dtbs:
> +            base_name =3D os.path.splitext(os.path.basename(base_dtb))[0=
]
> +            # Overlays whose filename starts with the base DTB name
> +            matching_overlays =3D [o for o in overlays
> +                                  if os.path.basename(o).startswith(base=
_name)]> +            if matching_overlays:
> +                merged_dtb =3D os.path.join(build_dir, "%s-merged.dtb" %=
 base_name)
> +                fdtoverlay_cmd =3D "%s -i %s %s -o %s" % (
> +                    fdtoverlay_bin, base_dtb, " ".join(matching_overlays=
), merged_dtb)
> +                bb.debug(2, "uki: merging DTBs: %s" % fdtoverlay_cmd)
> +                out, err =3D bb.process.run(fdtoverlay_cmd, shell=3DTrue=
)

Please do not use shell=3DTrue except absolutely required (and even then,=20
we should really be thinking hard about not doing that). See recent=20
patches on the ML where we started to migrate away from this.

Cheers,
Quentin

