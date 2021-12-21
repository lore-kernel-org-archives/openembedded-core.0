Return-Path: <kweihmann@outlook.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90A18C433F5
	for <webhook@archiver.kernel.org>; Tue, 21 Dec 2021 13:08:04 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (EUR05-VI1-obe.outbound.protection.outlook.com [40.92.90.105])
 by mx.groups.io with SMTP id smtpd.web11.5442.1640092083367224030
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Dec 2021 05:08:04 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@outlook.com
 header.s=selector1 header.b=l0gsDlNn;
 spf=pass (domain: outlook.com, ip: 40.92.90.105,
 mailfrom: kweihmann@outlook.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I2E/ukjk2iEwZpRFjUsUnIh8+bjEm5YZcWDr8CFHVDYMWJV8IzjxEbZPlqGV1GF2ZH37OtoUaWGp6nmUapBmEzneP02GJXpKuJ00gqps30081jz9Nl8/qZ2uJSR+1uk1joqDaXkRLsLGB+RRJkwtj32MebLlEtOOAg1AArjSApkteh9extdkkB7NHUY7GiO/KT/0xgAz6kW40gsHLylKlf5I3nP6eTzjDXeoVysHyu8OjoPkBsWKQWE0DrmS4RaDBGMDwC76Rk2jlWguWMc2vylbksmS/O0NYP5dgsIWZvt98qmWxKZK/GPvvo85xop5xwQWtuYSfU5L41DMoCkqVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d9aqDknzMQ8SJnKcYpPrfyDVWe0rmU5NtWGbblmTYY0=;
 b=btUq2nGrQ1HQqHiHTuev4dY7eHkAf8yYzPIWRTs1PiePB0oXEaUOTayjIz7EAjLusyyGY6vxenHkxnfCoN43nHQgNwxcaCRC9YYmPxtWrCs6uyzuhRf6PYlOeO3Fr/Tww8jWKEjtrKFwOkaaH67dYd3nw2HaewhB6V740JdR2jK7/XFMJSPut9Zo6M8ZRYpkJQsWVLYsm1lb4ArGwLVzEzaQgtlpuP2NUkfZJonz0R4me5UEpFH40wpaU9vCMrxR2mAD2rri8SBibmnUk4p4cWUBm2GtHB4pLL1QChfipVUMvFw6AS4CsOVnUE8lAzuwPFVUWEF8yuVvyudu8tNoBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d9aqDknzMQ8SJnKcYpPrfyDVWe0rmU5NtWGbblmTYY0=;
 b=l0gsDlNn0kC08irjrqb8OsocjlHx/c662pw6Ras71obEmjv0B1dc6VP6rqbtrfrmotm7zjC35R0+d1s+u5cMQHET23FmFYSBVVMTVdrd5csd+Cjmic6tTjL25YCVhhImNFR9BHvafkjG6M/sqrQ6SgpjSBrqDAqDVz8Bt7KFGSrkhvAiWZPPJPeBNI7bJ7hsL05/pPLFYBWPuXAmXCX0C5m8ymA7Ps9PnhdDVIJ+AvC2vFe1e4K87Ojgy/knkoN7igGHKMNbkg0QhDXZmzy/jkaL9oneOrZ5VwtzowEVS7xYAg9DL+vKEcM+B80BPk6XEN9tihwKKYUP9y7Oev/ijw==
Received: from AM9PR09MB4642.eurprd09.prod.outlook.com (2603:10a6:20b:284::24)
 by AM0PR09MB3987.eurprd09.prod.outlook.com (2603:10a6:208:19a::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4823.14; Tue, 21 Dec
 2021 13:08:01 +0000
Received: from AM9PR09MB4642.eurprd09.prod.outlook.com
 ([fe80::782f:9964:348b:b2fa]) by AM9PR09MB4642.eurprd09.prod.outlook.com
 ([fe80::782f:9964:348b:b2fa%9]) with mapi id 15.20.4801.020; Tue, 21 Dec 2021
 13:08:00 +0000
Subject: Re: [OE-core] [dunfell][PATCH v2] dropbear: Fix CVE-2020-36254
To: =?UTF-8?Q?Ernst_Sj=c3=b6strand?= <ernst.sjostrand@lists.verisure.com>,
 "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>,
 "steve@sakoman.com" <steve@sakoman.com>
References: <16C2B9B88AD918F7.22520@lists.openembedded.org>
 <0ab160933ee8b84b5d5b0e648a2a20f8ed3367d3.camel@lists.verisure.com>
From: Konrad Weihmann <kweihmann@outlook.com>
Message-ID: 
 <AM9PR09MB4642921897485601CE80186EA87C9@AM9PR09MB4642.eurprd09.prod.outlook.com>
Date: Tue, 21 Dec 2021 14:07:59 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: 
 <0ab160933ee8b84b5d5b0e648a2a20f8ed3367d3.camel@lists.verisure.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-TMN: [Lg+P4wrdJ4tijbnQUDZ+IzHmXsRaAaRxcfsRJrK/WkOchnynOLJQwdLkxlYCMix8]
X-ClientProxiedBy: FR0P281CA0082.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1e::21) To AM9PR09MB4642.eurprd09.prod.outlook.com
 (2603:10a6:20b:284::24)
X-Microsoft-Original-Message-ID: 
 <29500e73-cbae-bd3e-c679-1562b29db150@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6a812324-2c20-4baa-016c-08d9c482ea39
X-MS-TrafficTypeDiagnostic: AM0PR09MB3987:EE_
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	b4ZvL+PcHaGDS4ToyVWGPAOoXXbGtu1dX/2ZxmMWMrWmFgyCjuJ1EEtFltPTzwYv9wyzPeTvkOSYL8DYH/iYqb6KlkQylySLykKT2P1wbi4MW30QhmF5PX/e7M7kipdP8jim10xm14I+HYMpyrXYP5JlUj1RkG+P2pAdabDNqNmYoGVyh9drLbyXgOxYJ3OPC44HOx2WYq6RtgOoBzDYCbbw/7sXKWBlUZLqN+k9L7sFJgDChA1D7Kdd2HUJddRsF1sHg+ns2SrX6KdnUIZUxWeixdsvwBMxermgTZIhSHPOmvA2JU+JFFo+P5MpJ/opdLLMYSiYVeE6/uXEZNVqr05MBUaqq/XsVSQcfuGMa/x4yyN3BkAcZ9uLBlvAEySG2dtxj/7OoEHzmCpIs2Jtlpw8vDsqBNRZtPkmz86+kyeNXH968k9xb4wn20HzzKUfrSlq2tKKw9v9VRlIHSQ9/SGGYm4od35zcbOcKPv9AC8qvc52FcjyuZqZOcftclBLrRjYxyYSaKUjEfe718V8sBoJUrEyYmc/OE0UreoWIK2EAysiby+FniCFKGpY2WLNidgDH3KcOqS91IhjlOdbGVmMBu41LXM+7SoZSrE3QTtvV51i90mwo0s2oSqPDi9obFm0dtFXVkt31smRrMsQIWq5CGFTFaiD4SMS7GfSwrI=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?I6yIC62FKxsqkACaCHuXl7WZt+H7agZZhq3KUX1ZD2v8URM9YTxBtrtn1mIu?=
 =?us-ascii?Q?D4luW1gmzUWB+7owwLhIfunfwiL+aJUf6CM9Ub/wPDV6A4yqoebdMeSDhDLE?=
 =?us-ascii?Q?4sl7iRdnMo3DF2Z/eZ0oekqY03RWbcpjWoHVmpBodDPe1wRP4U0s2Tf0bLXX?=
 =?us-ascii?Q?m+vO9N6Xt0VvbPlQs5VqHIAtLqoEZ5kh/g7RkXxeVbP4prUeQO1rRj87TnpC?=
 =?us-ascii?Q?USpzz3f1S2V0+fP2UN0ufG/5rraeVnRbL6wee/8Qci1/0Qb4HVN/aQkvWSG2?=
 =?us-ascii?Q?O3OYkgf6LlyFddKgDX3HrUI5diLcKe2Ay/m4eTyuOQR1q1htuLEzDybDlbXK?=
 =?us-ascii?Q?r6Rrp64cIxLQcq/0t8aDQCaLkR4nhHhgBc0ObjFjuueYFDi5Jt22U7u9jy5O?=
 =?us-ascii?Q?LWf9bmaVoDeqROOrb2zt1xagSsG28uDL0/bI2InBwt3tLeW2zuP9DMrvDMmO?=
 =?us-ascii?Q?35NzS8/s6EhDyCEwd96uD2mihsI83um0IR4BPVtv024yXRc8n+qcPy3g/pQy?=
 =?us-ascii?Q?vghCQHioJx4dAN0YsvN+EFSQl5h7mz50YZ2NRIgsv10jL/9/jLFmjGx2otRP?=
 =?us-ascii?Q?ucre1ihYtY4sGLEfVN4z/+SzFQZ4J/2r297PGUYvb9LBNYqMpVDTOAUEpIph?=
 =?us-ascii?Q?ZAB9nCoftFfrPQXUzkhQG3PUTYf/4JEc+BkGxygEptPk/B/kHFtkYoA0hPyy?=
 =?us-ascii?Q?OUaxki0ahJexjo+atc3wFCxbLm+lYfez+QCxMq0JKv63vZxL0jHUqkGSB1XC?=
 =?us-ascii?Q?FXlLUxE27wqt1/W6IORQNq1/wwz6i1BngsvIlg55TDAf8dotNsaEWcc3Tm/V?=
 =?us-ascii?Q?y8gUxTPI+Rjp8KBzFIq5aejfHUbITzs/8FaHqCA4iu87NgWkNLeZzlCjhNyI?=
 =?us-ascii?Q?QmIlqkMPKMrThvQgPf6v7g+cgi0P4tLKHtTr4p9WeIb5YoAX3q2ZcN5F+67x?=
 =?us-ascii?Q?ycFrjxyMrAX0XAea3ShtRReU6+AZScZ9muMRHr1G61TOLwlVNRWQ3sUrdQGo?=
 =?us-ascii?Q?a2iQBtH/aFchbo0sf5R1DZLeRQ=3D=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 6a812324-2c20-4baa-016c-08d9c482ea39
X-MS-Exchange-CrossTenant-AuthSource: AM9PR09MB4642.eurprd09.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Dec 2021 13:08:00.7782
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR09MB3987
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Dec 2021 13:08:04 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159917



On 21.12.21 14:02, Ernst Sj=C3=B6strand wrote:
> Dropbear shares a lot of code with other SSH implementations, so this is
> a port of CVE-2018-20685 to dropbear.
>=20
> Reference:
> https://github.com/mkj/dropbear/commit/8f8a3dff705fad774a10864a2e3dbcfa97=
79ceff
>=20
> Signed-off-by: Ernst Sj=C3=B6strand <ernst.sjostrand@verisure.com>

This is missing an Upstream-Status entry - in this case that should be=20
"Upstream-Status: Backport"

> ---
> Rename the patch file to make sure cve-check picks it up.
>=20
>   meta/recipes-core/dropbear/dropbear.inc       |  4 +++-
>   .../dropbear/dropbear/CVE-2020-36254.patch    | 23 +++++++++++++++++++
>   2 files changed, 26 insertions(+), 1 deletion(-)
>   create mode 100644 meta/recipes-core/dropbear/dropbear/CVE-2020-36254.p=
atch
>=20
> diff --git a/meta/recipes-core/dropbear/dropbear.inc b/meta/recipes-core/=
dropbear/dropbear.inc
> index d41e8b36dc..b949a9a337 100644
> --- a/meta/recipes-core/dropbear/dropbear.inc
> +++ b/meta/recipes-core/dropbear/dropbear.inc
> @@ -22,7 +22,9 @@ SRC_URI =3D "http://matt.ucc.asn.au/dropbear/releases/d=
ropbear-${PV}.tar.bz2 \
>              file://dropbear.socket \
>              file://dropbear.default \
>              ${@bb.utils.contains('DISTRO_FEATURES', 'pam', '${PAM_SRC_UR=
I}', '', d)} \
> -           ${@bb.utils.contains('PACKAGECONFIG', 'disable-weak-ciphers',=
 'file://dropbear-disable-weak-ciphers.patch', '', d)} "
> +           ${@bb.utils.contains('PACKAGECONFIG', 'disable-weak-ciphers',=
 'file://dropbear-disable-weak-ciphers.patch', '', d)} \
> +           file://CVE-2020-36254.patch \
> +           "
>  =20
>   PAM_SRC_URI =3D "file://0005-dropbear-enable-pam.patch \
>                  file://0006-dropbear-configuration-file.patch \
> diff --git a/meta/recipes-core/dropbear/dropbear/CVE-2020-36254.patch b/m=
eta/recipes-core/dropbear/dropbear/CVE-2020-36254.patch
> new file mode 100644
> index 0000000000..72ac3e6630
> --- /dev/null
> +++ b/meta/recipes-core/dropbear/dropbear/CVE-2020-36254.patch
> @@ -0,0 +1,23 @@
> +From c96c48d62aefc372f2105293ddf8cff2d116dc3a Mon Sep 17 00:00:00 2001
> +From: Haelwenn Monnier <contact+github.com@hacktivis.me>
> +Date: Mon, 25 May 2020 14:54:29 +0200
> +Subject: [PATCH] scp.c: Port OpenSSH CVE-2018-20685 fix (#80)
> +
> +---
> + scp.c | 3 ++-
> + 1 file changed, 2 insertions(+), 1 deletion(-)
> +
> +diff --git a/scp.c b/scp.c
> +index 742ae00..7b8e7d2 100644
> +--- a/scp.c
> ++++ b/scp.c
> +@@ -935,7 +935,8 @@ sink(int argc, char **argv)
> + 			size =3D size * 10 + (*cp++ - '0');
> + 		if (*cp++ !=3D ' ')
> + 			SCREWUP("size not delimited");
> +-		if ((strchr(cp, '/') !=3D NULL) || (strcmp(cp, "..") =3D=3D 0)) {
> ++		if (*cp =3D=3D '\0' || strchr(cp, '/') !=3D NULL ||
> ++		    strcmp(cp, ".") =3D=3D 0 || strcmp(cp, "..") =3D=3D 0) {
> + 			run_err("error: unexpected filename: %s", cp);
> + 			exit(1);
> + 		}
>=20
>=20
>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#159916): https://lists.openembedded.org/g/openembedde=
d-core/message/159916
> Mute This Topic: https://lists.openembedded.org/mt/87876568/3647476
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [kw=
eihmann@outlook.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20

