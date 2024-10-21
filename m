Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2A01D0E6D0
	for <webhook@archiver.kernel.org>; Mon, 21 Oct 2024 08:38:56 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.67.45])
 by mx.groups.io with SMTP id smtpd.web11.41258.1729499927139969435
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Oct 2024 01:38:47 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@cherry.de header.s=selector1 header.b=jMJvVYrQ;
 spf=pass (domain: cherry.de, ip: 52.101.67.45, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oqsUZKrVcbc73f1sHFxIahpXLiTF9FNaG4Nt8IepZGDUOw+HsXcsrQOZ2tAC9wPblGB1C4SLt9KSdnLhwg58v2hiz/bnzftE6eMq7Jes9YQlxYoWsC3lmVQYtUrAkfU+0E8j5te8hYtBByqEUUDKIbllclyVpPKYNgWOKVmYClg+lqRhRv+xWsZlcZfrTVr4vNqeRZgru8xDKDTuGbc8HAxAh2oNdmCUxF7ysTPrTQEOAQ9U9YZmCVqOeH6x6KnLkcO8xHp6QgCULvslAU2iIL/EHzhxYa389ruliO2y7ALzD/h4Zwex+6feCV9tITI3ngm4dZC2NfxfnIX0kTMcmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E92znt97i92h9G1PUIk9+6zxhWANXJUVNCoZP6CpP2I=;
 b=qJxNLHh05BxKHbcwThWX9dRRAh/dkY2aBa57EbtGVEEjOD19XAaOimt0jCMTnw4jWzQjdpZ3/Up10PYLpHqT5yZkXX7DPsJsHgcjXbbbx0g2e4oZklLWdkh5dgD8lHAXOE42LP+UQ3jkFu4l3hWSRWShZ536j7m9njcjD0xn7RQ1UpFtbpB+vpy9b6onFpKp3UeuDRlVmTlF9ZrcAsKM2oLnVZKY4mYdxpIrUI/GR0CPOk7ntjiF6zvYQVorqZklKX7I5QN9knZe9yW+dueIN/tKFCnCncwAQK6LOwLkyCd7M/o/J2TqN0/lPyE8soOFV1ywpiLsDsqWILrU0Udo9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E92znt97i92h9G1PUIk9+6zxhWANXJUVNCoZP6CpP2I=;
 b=jMJvVYrQ1gv/H6TJLEZEWTIfxzrZ9IfPUVOWIC5msRJGRPT2BLNnWgOCTESGgqEoTMjDs/Rc5/WUF37oWJgmglnt6Cy4ubTj67nFtC4VnrtlnXvTKkbV5t9tNqTx1qKqWM1NaDOnc6Zy/u5dcsENBE65A11RDfG/jT0nnyh7QfA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AM9PR04MB8906.eurprd04.prod.outlook.com (2603:10a6:20b:409::9)
 by DU4PR04MB10385.eurprd04.prod.outlook.com (2603:10a6:10:56d::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.28; Mon, 21 Oct
 2024 08:38:43 +0000
Received: from AM9PR04MB8906.eurprd04.prod.outlook.com
 ([fe80::d379:5378:b1:cea]) by AM9PR04MB8906.eurprd04.prod.outlook.com
 ([fe80::d379:5378:b1:cea%5]) with mapi id 15.20.8069.020; Mon, 21 Oct 2024
 08:38:43 +0000
Message-ID: <12b5b746-3a77-4f0d-ba61-e28b9e5ea136@cherry.de>
Date: Mon, 21 Oct 2024 10:38:42 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH v2] linux-firmware: Upgrade to 20241017 and
 allow compressing firmware
To: zboszor@gmail.com, openembedded-core@lists.openembedded.org
References: <20241018092605.219447-1-zboszor@gmail.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20241018092605.219447-1-zboszor@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: FR0P281CA0263.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b5::6) To AM9PR04MB8906.eurprd04.prod.outlook.com
 (2603:10a6:20b:409::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8906:EE_|DU4PR04MB10385:EE_
X-MS-Office365-Filtering-Correlation-Id: 84bf71e9-bf0a-40e8-75cf-08dcf1abc53e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?DSZjA9Lu+whwJqVDtjAlUQz6dQE84m3taOyzrgP5CqAPRJRfqL6wUgX4A8AR?=
 =?us-ascii?Q?pqm+eMVdsuFErzU4AR/JRWZaO4zna2TqZibqtJAZJXmdnQrGAvIxVzui2obe?=
 =?us-ascii?Q?qPwfjk3ZXsE1uwqdyPltIxwodpMSLekjZZzx0CJlFMyBmY2kpqiZOCTVE0zy?=
 =?us-ascii?Q?Gs5phwNaKKXdYur6QKJ5/RLufxnYcA1sT2/HamG8AaXgvN1uxchlad7xc9Hv?=
 =?us-ascii?Q?LAKJux2ZEuROoWWrMZQbiwq7Ee0EyYZ4TwdFJYcCDsM/AX7Z/9/qYLEBf4QS?=
 =?us-ascii?Q?SCvhwBrf41A/0EFtPqne7I7BxTe83QJIJ/fLSR3qT9I1LTOPOyW9bWBed8a7?=
 =?us-ascii?Q?6+7Lux3qpfMkgaaZ/3P4X7rfgeolxDBw3JBSzNR0mGH/0Voxz/w3IOyduaKU?=
 =?us-ascii?Q?uefOokw5Q+WsGY9hanAQoSYsp66Z/9sKRVBnGAGkkzxv2/iY3N1O4jEfn1mf?=
 =?us-ascii?Q?tx2WV0KDkW3Nhf3jhW2aTUSWOK+nxVRSsg4J6sTRy8vx+VjjE8PjwILXmCBs?=
 =?us-ascii?Q?oLwNf/zxisyHbd52nYhIaw/QrpqjYbImVKStyDIvywGKEzd7BiXU27KjtOJh?=
 =?us-ascii?Q?QD7xsiYwXu/IgWvXolhVklrIgjiv1ttedboTxXNohXLgF9e9O9G8UF/bmTUk?=
 =?us-ascii?Q?sFSRuw4IP4bWe+3GJPlEpCeDFErw1i7r6so6tq1tpbRNrSZcsDQ8/aGOUwCA?=
 =?us-ascii?Q?jhJBFbjEP9olQdxxCQdFl2TA4XugIuVjS4IUUyn5yvRRTVuZOFpg4+mOnO5l?=
 =?us-ascii?Q?MVJ7JbPG7FSIQyqCAdqtf24gZBBOL5ICiIhTxcKJWzCiy2f4NYAl3SV7iaKZ?=
 =?us-ascii?Q?mv99/qMbNUngyfQxll8VL3+txMxL5+UKus0WxJCwBg9Qn+jx3WZzlkEjtzxy?=
 =?us-ascii?Q?4S2eckODuXCkp2MRM8z1ck11u2TiMboGkWNjaNQXWbjsjfIJF681YtmQM2IO?=
 =?us-ascii?Q?k9H+zm0iQoOwb1tnaXfqWpndNd5rHd6CwSCzoEweA2ksTCq7s1fQJxpQMD5W?=
 =?us-ascii?Q?PmWkKSrw3TGtOHB+x8NOBu8Im8+A20bkpYVhjpCVWmXwdTC7SuEAcVYWepLf?=
 =?us-ascii?Q?gqMexZd/jqmXIIArSvWGSXsTZugTw10xpoTnH0awmFQM7wQpXnQaCVx4bM7k?=
 =?us-ascii?Q?gRVPpCoZl/QKjdooYxvNn+WxpW+l/QVrP/ia+/qRb2+jGkmvB5ZJ30PpWvTo?=
 =?us-ascii?Q?D2hobp98YRFyeQ2l368in2BhO/SEhw2rql4wifPfQCYGAuMmJQHiX1mPQBW9?=
 =?us-ascii?Q?PGMlVHsp+S0oWg5fKEyyFUrVe7H7C5cElpuNhA98qFSLoXUeOBOEFJvwKMZN?=
 =?us-ascii?Q?R03u1HArgzprHhLa727LG49Y?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8906.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?EwODWwBrLYgfKhTULxzPJv2CTjADniKeDjAVnajubzuQRW4ELKI6PCsgi9/i?=
 =?us-ascii?Q?HxA80lDjOl7aerq4/epV3I15AqEOYZVbpELwFd3jTrDlp8MTO79e3xO5wb3H?=
 =?us-ascii?Q?4awMU1z7bWDNsZQ+ikFYTHgHxG3GXxFCf01sxoKkjUQKMnEhJ3SxZsMPOdUe?=
 =?us-ascii?Q?kIg6SvBMNSi4to+4sCMFzybNpp13kH6fu2v3u0aWXFboGd7H0UkyJVvG2Q3H?=
 =?us-ascii?Q?u5v4q6GM+SWX3doFS6Nlwh2GbGD6Vydc9P2m18rNkiRGb8Vgwni93ub9qSKY?=
 =?us-ascii?Q?Ti54HQ5JENqb1nz3ACuVnPHVBnVVrRr6+TVDfhlbD6vD1zTByYkjgTbhi8u3?=
 =?us-ascii?Q?/EBDth8l+cVMAFmvzA5vqJ+bq4NyDyf1PiVTiflrgrCBrk1rKkY6AYSIKxCe?=
 =?us-ascii?Q?WVC9fCLv3tS/QnhHcPfLfF9a2a71IjWK+gfY0xZ+fIBbk2qZ2i3akcGYyS9I?=
 =?us-ascii?Q?W+BPyrvgIaMFA7MzYsHrXJOhYd+3GbFIwp+kyLuwrjmzk6PpNe/8BXmqPxTR?=
 =?us-ascii?Q?tTc5D+h7cbs4wV1Ggh1MELDN5wQfUzDs59ilJAG9Nw7q4PpZ8i1i2NO4sS2M?=
 =?us-ascii?Q?AUYjp3s3RsIU0a2F3cTfr5GPoh66F/68Wss7BGWW+2xPakBrvlRkhyutrQkU?=
 =?us-ascii?Q?smx3DkBCUZ176P7+gy14T/imYO+1+pT/isO4wg6EedLzh+Kif+akFoYfRTDa?=
 =?us-ascii?Q?6QwsZp56h4lituLx80acRsFaCUp+uU3uJ5vsY8OXhglX/DebYI25ynBgBrxM?=
 =?us-ascii?Q?R20MX8AHiuPGAFmZMYfsrsmfaf7d1EyiSd8HYlc1Ggpyu0Hv/bcpsGyigUs/?=
 =?us-ascii?Q?YfWArHQbH57XNcONcHbuW8AZDDzrcwAAP5f/QOArbGbRN99/5SgRLnni7gB9?=
 =?us-ascii?Q?6fSz3VDDlNT4c3ZUuhpXXxxwrxGFisnQx3GlaemP32bi3J8msYeE/A9izSQT?=
 =?us-ascii?Q?9rFqBOx6g+dJ/TfZGyfUE9VWLrvGaKQfRW6w+UOfvG2BTtw1GRV9wTW58eLF?=
 =?us-ascii?Q?e2H17A+aT1Mx6Rp2pmwcAzjHNCxlFhvcpVMk1xQcv5Kpd+kgU/9X4LbfvXaa?=
 =?us-ascii?Q?kXlxtkhGKWgdLaZczobvurMuNhS9OUTrFhs8AA5PnIlTzC/e9jRrRiiTY6YW?=
 =?us-ascii?Q?YuMC3spJ9i6mJcIQ31JnF6ZxyyVlQlcAOdXAREJQmQhcph2VecZ4PCNxxL+A?=
 =?us-ascii?Q?Fp7zbZeJt8lkAYIh/MeRfuxk+RLbwmx6cvWGdTLIJdb4mgKtb4zo40jJAPgV?=
 =?us-ascii?Q?pCzKHPEsXq0doR7LjcDXBa0NIftL6P05lI0dYbr3Jb6plJQ4xvLqmkhWW7Sx?=
 =?us-ascii?Q?RACkTnYKfMW43MD2IvvXPEb16yiRXvF4xo8mc9BrstvGsME3F2J/Q91OJeGO?=
 =?us-ascii?Q?Zb6XUoFDWOftGeOoJW0lzl+VJ9hthQ2QHDuDFZ6tQ4ZeG+FQBM4xA36qcyTc?=
 =?us-ascii?Q?gjtpSDTq9l/SHPq7IdBCQvjwbR8sMJZ2Ojt3HcLB7r1pzKPKyEQmvsBtvg92?=
 =?us-ascii?Q?P6ApkAoTL3O7k8na3kwjzKsuiZfNorm5BojP5NCkxr7C7YPGGqTlMvXjeJVg?=
 =?us-ascii?Q?MACN16A7MEVT54KeQLdUhLFr/aacruL7eXL8Q6NdFZk9eiLSgUaGFyQofEXn?=
 =?us-ascii?Q?nA=3D=3D?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 84bf71e9-bf0a-40e8-75cf-08dcf1abc53e
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8906.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2024 08:38:43.2330
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7IFT2j8VRqBdP7jKIN4uR8Mz/AOYpviyrHXwYA8GmR6/eEi3Ms0TLukgZYrYphBxtkX6OX4fXA3lnqy28pa+fc/WitDAdmkT8bEn9C6yhn8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB10385
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 21 Oct 2024 08:38:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206097

Hi Zoltan,

On 10/18/24 11:26 AM, Zoltan Boszormenyi via lists.openembedded.org wrote:
> The new 20241017 version contains some breaking changes
> regarding firmware file deduplication.
>=20
> Disable running check_whence.py in copy-firmware.sh to avoid
> build issues. Instead, assume that WHENCE as accepted into
> release tarballs is correct.
>=20

Which build issues?

Which breaking changes?

Please extend the commit log to provide more info on those so we know=20
what we're talking about and if this is indeed the best way to handle=20
those issues (now, or in the future). Also, adding comments in the=20
do_install where we disable check_whence.py would be nice.

Finally, is this something that was done on purpose by linux-firmware=20
maintainers? If yes, are they aware they are breaking stuff, or should=20
we file a bug report/send a patch?

> The kernel, dracut and systemd all support compressed firmware
> files. Allow compressing them either as xz or zst which allows
> significant disk space savings.
>=20

Please send this as a separate patch so it's easier to review and revert=20
if necessary.

> Ship non-compressed firmware as default.
>=20
> Signed-off-by: Zolt=C3=A1n B=C3=B6sz=C3=B6rm=C3=A9nyi <zboszor@gmail.com>
> ---
> v2: Fix non-compressed firmware symlinking in do_install:append
>=20
>   ...20240909.bb =3D> linux-firmware_20241017.bb} | 364 +++++++++--------=
-
>   1 file changed, 190 insertions(+), 174 deletions(-)
>   rename meta/recipes-kernel/linux-firmware/{linux-firmware_20240909.bb =
=3D> linux-firmware_20241017.bb} (89%)
>=20
> diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20240909.b=
b b/meta/recipes-kernel/linux-firmware/linux-firmware_20241017.bb
> similarity index 89%
> rename from meta/recipes-kernel/linux-firmware/linux-firmware_20240909.bb
> rename to meta/recipes-kernel/linux-firmware/linux-firmware_20241017.bb
> index 4bcda67c8f..f40723cbca 100644
> --- a/meta/recipes-kernel/linux-firmware/linux-firmware_20240909.bb
> +++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20241017.bb
> @@ -158,7 +158,7 @@ LIC_FILES_CHKSUM =3D "file://LICENCE.Abilis;md5=3Db5e=
e3f410780e56711ad48eadc22b8bc \
>                       "
>   # WHENCE checksum is defined separately to ease overriding it if
>   # class-devupstream is selected.
> -WHENCE_CHKSUM  =3D "6ae5ffd807c84809977286ad0b37acdb"
> +WHENCE_CHKSUM  =3D "f82849fb6325a8a14e21a4feacc5ebb0"
>  =20
>   # These are not common licenses, set NO_GENERIC_LICENSE for them
>   # so that the license files will be copied from fetched source
> @@ -247,23 +247,35 @@ SRC_URI:class-devupstream =3D "git://git.kernel.org=
/pub/scm/linux/kernel/git/firmw
>   # Pin this to the 20220509 release, override this in local.conf
>   SRCREV:class-devupstream ?=3D "b19cbdca78ab2adfd210c91be15a22568e8b8cae=
"
>  =20
> -SRC_URI[sha256sum] =3D "943fbd19883cf8eadf89e0b22422549db056557b1ecd30a5=
6400615971369671"
> +SRC_URI[sha256sum] =3D "a26c38ef5a83272f2b98ce8bf8ca1865a852a3deea49ce5a=
8dd804b914351273"
>  =20
>   inherit allarch
>  =20
>   CLEANBROKEN =3D "1"
>  =20
> -# Use PACKAGECONFIG_CONFARGS to set the Makefile target
>   PACKAGECONFIG ??=3D ""
> -# Enabling dedup will turn duplicate firmware files into links
> -PACKAGECONFIG[deduplicate] =3D "install,install-nodedup,rdfind-native"
> +PACKAGECONFIG[deduplicate] =3D ",,rdfind-native"
> +
> +# Possible values are "xz" and "zst".
> +FIRMWARE_COMPRESSION ?=3D ""
> +
> +def fw_compr_suffix(d):
> +    compr =3D d.getVar('FIRMWARE_COMPRESSION')
> +    if compr =3D=3D '':
> +        return ''
> +    return '-' + compr
>  =20
>   do_compile() {
>   	:
>   }
>  =20
>   do_install() {
> -        oe_runmake 'DESTDIR=3D${D}' 'FIRMWAREDIR=3D${nonarch_base_libdir=
}/firmware' ${PACKAGECONFIG_CONFARGS}
> +        sed -i 's:^./check_whence.py:#./check_whence.py:' ${S}/copy-firm=
ware.sh
> +
> +        oe_runmake 'DESTDIR=3D${D}' 'FIRMWAREDIR=3D${nonarch_base_libdir=
}/firmware' install${@fw_compr_suffix(d)}
> +        if [ "${@bb.utils.contains('PACKAGECONFIG', 'deduplicate', '1', =
'0', d)}" =3D "1" ]; then
> +                oe_runmake 'DESTDIR=3D${D}' 'FIRMWAREDIR=3D${nonarch_bas=
e_libdir}/firmware' dedup
> +        fi
>           cp LICEN[CS]E.* WHENCE ${D}${nonarch_base_libdir}/firmware/
>           cp wfx/LICEN[CS]E.* ${D}${nonarch_base_libdir}/firmware/wfx/
>   }
> @@ -437,7 +449,7 @@ RDEPENDS:${PN}-amphion-vpu +=3D "${PN}-amphion-vpu-li=
cense"
>   LICENSE:${PN}-cw1200 =3D "Firmware-cw1200"
>   LICENSE:${PN}-cw1200-license =3D "Firmware-cw1200"
>  =20
> -FILES:${PN}-cw1200 =3D "${nonarch_base_libdir}/firmware/wsm_22.bin"
> +FILES:${PN}-cw1200 =3D "${nonarch_base_libdir}/firmware/wsm_22.bin*"

I assume this is due to the file now being compressed?

I think we should rather explicitly add the compression extension=20
because this could be catching more than intended.

This is also probably a bit of an error-prone process for new firmware=20
for which we shouldn't forget about adding the * or ${COMP_EXT}. Is=20
there something we can do with some python/shell logic to update the=20
paths to automatically add this compression extension/suffix? Not sure=20
it's really wiser, but suggesting anyway.

Cheers,
Quentin

