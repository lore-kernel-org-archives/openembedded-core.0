Return-Path: <amaury.couderc@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85C78C43458
	for <webhook@archiver.kernel.org>; Mon,  6 Jul 2026 12:31:48 +0000 (UTC)
Received: from AM0PR83CU005.outbound.protection.outlook.com (AM0PR83CU005.outbound.protection.outlook.com [52.101.69.9])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.149939.1783341103682201494
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Jul 2026 05:31:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@est.tech header.s=selector1 header.b=IHQDOzkv;
 spf=pass (domain: est.tech, ip: 52.101.69.9, mailfrom: amaury.couderc@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RyHYZxKdiFR4L15d0TYAwatlD+//UmeM0KemiMGtLPGDqdL5H2+7AWn8/qD136eTJvxGc1vou3Uniggoszd7vyY/dNo4OvJTQm9q64fdf7WGmGXIEbBoiC44u7JScfigP26JWDs/gJU/b7SFQuPvJXrC39WiuKkCFTZH9NuyplEQHLaHix41VIk/iHSh5g4sm6frMfuTWR8b79oZ907Rp+qxq9dLe2vAySyr9vOE6gD/1iTnHw16rwHxII5Lyie03POZRAITNswyFBpwGkFfp4rHE0dVAPU1aoB3Jk4Hwnr3dTWwSpbLaWdBnJqqj4vISOl/3HbBtQrHKQNRZjQHNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=13FztIxMUiH9g9OdVnTQ6ZEFCrXbm0HUiGgN3Zs1tsc=;
 b=V+OjYc7dHtRyY8feUJIRNi/d7NKf76Om5GFL2M0J3ewxxudkJJWDHUYmRU99WgIPu609ZPLgxmUkPPC5Es27QU2CvAMZaSGfVvBej/5Pp/S3fHpBNim9xtKQJO46w5wEFWdUfB1XnxD8rBaYzCTIEQPjtMqpJsT4IA1yv1tHH+hm7ebdFDZ5tY4FDXYF/D7K3hR4nx9kXjAdu6rP+f8OvEVUVf5zX/1z6kpWj82PG4xNZcjIr+CITVgHavJUcDAD0zU/DVonWZbfFKcCEF4M4hGD+tklEo1wdnhImx9qFmahaBwXhfEUpp4QYMOblnPmxZpij3aNc4jiYgxi7tME6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=13FztIxMUiH9g9OdVnTQ6ZEFCrXbm0HUiGgN3Zs1tsc=;
 b=IHQDOzkvQSS/k9mHXEA9tEnqiZM8y36fMyS1EbghQH5IHliPGZxDZonBH4yBVza0qi8q9phgr1Of14Q97YDPN+FccziARfj+pUlGtozxpVRAi8lJjF3hVYmDdSQCWrj2Y+dPDWVxFVsm7LXCp+1JZu+ER+Glkpf0IiuEqN7uV414YkAPEKbeLgpnZw1BZJJttOwODgZK0Dcrt/ltICElfHccMPi2n6dua8v4WUrsuzo0Ie3quiMhGoXYgbjdwc20zCvHpfpnwQcFT63GM/T7jVUCJ3lJ1utZMFZogLUlxYfMYXRjuVeIkqTWzQCddUpwvjgKz4riOvNJPCSudeU2Aw==
Received: from AMBP189MB3196.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6ad::11)
 by VI0P189MB3640.EURP189.PROD.OUTLOOK.COM (2603:10a6:800:2d6::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.18; Mon, 6 Jul
 2026 12:31:38 +0000
Received: from AMBP189MB3196.EURP189.PROD.OUTLOOK.COM
 ([fe80::1afd:f059:542:3d95]) by AMBP189MB3196.EURP189.PROD.OUTLOOK.COM
 ([fe80::1afd:f059:542:3d95%4]) with mapi id 15.21.0181.008; Mon, 6 Jul 2026
 12:31:38 +0000
From: Amaury Couderc <amaury.couderc@est.tech>
To: Yoann Congal <yoann.congal@smile.fr>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2 2/2][OE-core][scarthgap] python3: fix CVE-2026-7210
Thread-Topic: [PATCH v2 2/2][OE-core][scarthgap] python3: fix CVE-2026-7210
Thread-Index: AQHc/JFe6ZKemIWpCkO8yaPucHQ4vLZB2REAgB6yKB0=
Date: Mon, 6 Jul 2026 12:31:38 +0000
Message-ID: 
 <AMBP189MB31965402490609FB034B7DCDF8F12@AMBP189MB3196.EURP189.PROD.OUTLOOK.COM>
References: <20260615063640.25128-1-amaury.couderc@est.tech>
 <DJAVAP82IHN7.ZUBCLSIJUS0O@smile.fr>
In-Reply-To: <DJAVAP82IHN7.ZUBCLSIJUS0O@smile.fr>
Accept-Language: en-SE, en-US
Content-Language: aa
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AMBP189MB3196:EE_|VI0P189MB3640:EE_
x-ms-office365-filtering-correlation-id: 55d6babd-ec38-4fe9-8923-08dedb5a86a1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|23010399003|1800799024|376014|366016|38070700021|13003099007|22082099003|18002099003|12006099003|25016099003|16056099006|4143699003|29003799003|6133799003|11063799006|56012099006|8096899003;
x-microsoft-antispam-message-info: 
 ZRUHEKZexcK+12Zz6SwW8vL/uLdpRLYOhx40YzIk8Sxh9XdpNuLp2qTrZ9nDRRnCaOBnecj2c1oMt+yAqJ1pdwa5bMPgwbOEOJMJ656Wjnn1Zi/DniMC77iMZtdumwX9aMhHFyNwz4TGqPmhgWxparyWy8q3rjCd9NiSAAhc+IOsR6ds6SNA3kKBgIqVyjffP5+T1ObI1qUJknfVMjxQiMwBx6Z9vAq6urQNu7hRX7ZQG5W1qc2kuHkR8HpQGSj9oxr+/c9AFCLHiOEEc5BzBw+7aPLmnPEWy2WqCeLx+uypQHdXpnfXcW9kAvp7ZVzguKhQj3e6VURt4lKp6st8/4whlyaR3l2JMuagnZcSouSs/gvemGoCOWIl+2r6grcpVKK+ijwARqam30czq7hQ4pHnwnx/IRxxkgMcJ6EPxTP5WypIQ41h+hNs1g3KIxzO+6hotAwGGZvN6RC0K8+dLjPGm1H4s1kMHW9kCPUehOBRp5UHR3Rvg5rhTf23W43aGJ4/CVPBMe4dWyKuKRktXX5tcyiZkRKFOCtp6FZOsTIxcZ1CDjoOGDR8dNcS3SupTJGTDjK7Gh7kFNngmr/yGM2JBHSSnyBCCtnU9kyrEAenqDaCHT8oKTq2JRkpiBlVyCIzuEI29oAP5Lomnxmj4bwWbRe257N8IaHS4BCbG4A=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AMBP189MB3196.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(38070700021)(13003099007)(22082099003)(18002099003)(12006099003)(25016099003)(16056099006)(4143699003)(29003799003)(6133799003)(11063799006)(56012099006)(8096899003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?0VrU45uZ0kD2eqwpnAjd1Mf1KLBvj4wBmX40Q0GTV7WnRrOuAu9zUQ52wvNz?=
 =?us-ascii?Q?7KpWxxquAsU04zjHg2m1fjcbLRUWaxgq11uOz1s4QPzaTo2s5CsxsAClCE+n?=
 =?us-ascii?Q?EsHo/L+TVRzTaqVaZZLz/MeUh8DdWnjMpTB7tapCCr9nxvcSzx4ue4Gz5YvL?=
 =?us-ascii?Q?GYCrBTLoY/6zkMsBOz+1sdTiOoZuOVf+en/fyjI0kgZhPeJPcXb/3jJLURCz?=
 =?us-ascii?Q?HAaazVCJWp9lRzHhLLfBpvYzBUpLta6SijslnDXhFe8BBP+FjxVCqnsjhsM0?=
 =?us-ascii?Q?eFY1UB6FQFE/d+c34cTppZNDuPFsja1R93tco7Pg7zFuaiuJjUiEvlEVcxxx?=
 =?us-ascii?Q?nPpXvlmtpohB7oRz8HMPtwAjV4vxR1jsvjDu1MMdYVKYmLytTydnswEXsr/k?=
 =?us-ascii?Q?5QkIenCGkwUeqvuj6bgcMa/Slm/i0q7NwuuEVrDGOrCeDc7jucVyDLNMeA3g?=
 =?us-ascii?Q?MIBLk8MbJl/OI/Xz7KSi7VCcM8ZQjvdsz/JAvSfutblgk4lqcIDirwkB5Gru?=
 =?us-ascii?Q?t6X2prap3UzGHJrW49NEwBwkBtOZPL1pzAIOQB9JgyEDAXnN/8ZQm+fg1NyJ?=
 =?us-ascii?Q?h7eFT+cbOEMC4ZPEVg/k8rpnvavBsTuRSCn9c8dA+OODsEyv6bviekDXtKnt?=
 =?us-ascii?Q?qKf9TjzoQ6ihlbGbg3O5oCeHOdlyV7ggBX+LEfJPQTdIPyOJD3sFtqSgFVlz?=
 =?us-ascii?Q?fk3DGSgCipVZOLOFSvQ/gMX/j+4xc7i9f088G3KzoBsjObqHMZKOXJ9roxZj?=
 =?us-ascii?Q?aKWsEVeUVCLSXmDLVk2VqHhkZ3zCXOIkgV1bx7Ns/866v+VJ8Uu6UQrMg0LG?=
 =?us-ascii?Q?HZXnTdNdTQtt0IwFeYaFkzNlDmNAt1PW+C18aGgFXh7tkSyZPxSSSgrfHATC?=
 =?us-ascii?Q?TYIy7G2mxyJZufB+g9cXwKPubiD1PDVd3GiVCc6H9WUCzAhHErVzpRgklV/h?=
 =?us-ascii?Q?HumLBKk/EDugSCD0/g2G5IP2BoWD+Nk0C2P+X8W+LkLaAOcWWs365dPGVy98?=
 =?us-ascii?Q?/jLX3DR5YlH1OjBOmh1YwxgP3I381aFhthCMETayq7LwR5EoWgoZxudO+3vq?=
 =?us-ascii?Q?ENoTVl/UYrTOL3O+cBVPbCB8cqLkrF1jul6BWBAkyxxJus4eHG9V41WqDylk?=
 =?us-ascii?Q?tLQ1Y3G9BnlYc3GhS1VwqzV8vr40ewl0Se1qR0dXAlqwUKdpfjQhCU0NO3Cn?=
 =?us-ascii?Q?AQ5FYi0ohoohsJXN9Yfs7imhTs79Fc2DlmOXMys+IbLVMz3decqa51FCAciJ?=
 =?us-ascii?Q?nrSRWK4hUbH9GVv/qYXBh4uMwRMylQSZZtzNH08OuDyOfpn7iUgE8BrsBc1O?=
 =?us-ascii?Q?9MRh0dCBatbNq9QBdtredmnhCN1JUfCEMPQQkl/ByruhudympZi3/ZBLbAi+?=
 =?us-ascii?Q?xQ+S5Zyy+buiayFA5fwDaTW5xJWkx6X88W/VZ4+xdL1BhUnlI7WEApuJOB75?=
 =?us-ascii?Q?kShFwWrWBVbPZDUcu8hmJqOsxsaTSQZoHntf4+Upo2UaDvfpXfM42hul+i4d?=
 =?us-ascii?Q?Evr3fJp3VA5jRlG7YTW2qYJb0t/L2CF8Ua+ZM/6N1KTYDW19+DOPFne2/GR6?=
 =?us-ascii?Q?HUceMdav5scBJ95iMls1RI78NPrccZlXkhMKT6YFKKFjSUxL9y+rKCcPVxup?=
 =?us-ascii?Q?E4HLbTPcw4T8rBEwptsMMBzPz5teqWnud8NrTciq0qUBWeg2Yfp0M+32Xa+Z?=
 =?us-ascii?Q?enWEN+s4fw2J3iaYD1atXeqUtJoVzHwWlJTLHLeMimbfhDxA?=
Content-Type: multipart/alternative;
	boundary="_000_AMBP189MB31965402490609FB034B7DCDF8F12AMBP189MB3196EURP_"
MIME-Version: 1.0
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AMBP189MB3196.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 55d6babd-ec38-4fe9-8923-08dedb5a86a1
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Jul 2026 12:31:38.4847
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fs8YL4w/FQBmhWazCTWDmovR8cZRo0K4NHybNfUxDOYN96tMaXzOWAzHDD4w48pYYmPqdNFrSsRvnssSyLyWJA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0P189MB3640
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Jul 2026 12:31:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240265

--_000_AMBP189MB31965402490609FB034B7DCDF8F12AMBP189MB3196EURP_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

________________________________
Hello Yoann,
I've submitted patches for CVE-2026-7210 and CVE-2026-41080 to the wrynose =
branch. The master branch requires neither backports nor updates.
However, the patch for CVE-2026-7210 requires the patch for CVE-2026-41080 =
for full mitigation, which I've seen was already submitted to the scarthgap=
 branch (see https://lists.openembedded.org/g/openembedded-core/message/237=
838?p=3D%2C%2C%2C20%2C0%2C0%2C0%3A%3Acreated%2C%2CCVE-2026-41080%2C20%2C2%2=
C0%2C119168855), but I'm uncertain whether it has been merged yet.
Given this dependency, do you think it's still worth submitting my backport=
 for CVE-2026-7210 to scarthgap?
Kind Regards,
Amaury
________________________________
From: Yoann Congal <yoann.congal@smile.fr>
Sent: Wednesday, 17 June 2026 01:37
To: Amaury Couderc <amaury.couderc@est.tech>; openembedded-core@lists.opene=
mbedded.org <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2 2/2][OE-core][scarthgap] python3: fix CVE-2026-7210

On Mon Jun 15, 2026 at 8:36 AM CEST, Amaury Couderc via lists.openembedded.=
org wrote:
> From: Amaury Couderc <amaury.couderc@est.tech>
>
> Backport patch to fix CVE-2026-7210.
>   https://nvd.nist.gov/vuln/detail/CVE-2026-7210
>
> In order to mitigate CVE-2026-7210 this patch should come alongside
> the associated expat one which backports to expat 2.6.4 the fixes
> introduced in expat 2.8.0.
>
> Upstream fixes:
>   https://github.com/python/cpython/pull/149023/commits/03794ce9a58b1f337=
51c88d7d876dfbf27645c56
>   https://github.com/python/cpython/pull/149023/commits/ccb8d2f7df9534e49=
a43554193d7f5f4d993189c

Hello,

If I'm not mistaken those fixes are in 3.14.6 or the future 3.15 and
neither are in wrynose nor master. Can you please send a fix for those
branches (either backport or upgrade), and, then, ping back here?

Thanks!

>
>
> Signed-off-by: Amaury Couderc <amaury.couderc@est.tech>
> ---
>  .../python/python3/CVE-2026-7210-1.patch      | 90 +++++++++++++++++++
>  .../python/python3/CVE-2026-7210-2.patch      | 74 +++++++++++++++
>  .../python/python3_3.12.13.bb                 |  2 +
>  3 files changed, 166 insertions(+)
>  create mode 100644 meta/recipes-devtools/python/python3/CVE-2026-7210-1.=
patch
>  create mode 100644 meta/recipes-devtools/python/python3/CVE-2026-7210-2.=
patch
>
> diff --git a/meta/recipes-devtools/python/python3/CVE-2026-7210-1.patch b=
/meta/recipes-devtools/python/python3/CVE-2026-7210-1.patch
> new file mode 100644
> index 0000000000..63aac320af
> --- /dev/null
> +++ b/meta/recipes-devtools/python/python3/CVE-2026-7210-1.patch
> @@ -0,0 +1,90 @@
> +From 03794ce9a58b1f33751c88d7d876dfbf27645c56 Mon Sep 17 00:00:00 2001
> +From: Stan Ulbrych <stan@python.org>
> +Date: Sun, 26 Apr 2026 19:31:25 +0100
> +Subject: [PATCH] Use `XML_SetHashSalt16Bytes` from libExpat when possibl=
e
> +
> +CVE: CVE-2026-7210
> +Upstream-Status: Backport [https://github.com/python/cpython/pull/149023=
/commits/03794ce9a58b1f33751c88d7d876dfbf27645c56] with downstream extensio=
n for XML_BACKPORT_SET_HASH_SALT_16_BYTES detection
> +
> +Signed-off-by: Amaury Couderc <amaury.couderc@est.tech>
> +---
> + Include/pyexpat.h                                     |  3 +++
> + .../2026-04-26-19-30-45.gh-issue-149018.a9SqWb.rst   |  3 +++
> + Modules/_elementtree.c                                |  8 ++++++--
> + Modules/pyexpat.c                                     | 11 ++++++++++-
> + 4 files changed, 22 insertions(+), 3 deletions(-)
> + create mode 100644 Misc/NEWS.d/next/Security/2026-04-26-19-30-45.gh-iss=
ue-149018.a9SqWb.rst
> +
> +diff --git a/Include/pyexpat.h b/Include/pyexpat.h
> +index f523f8bb273983a..a676e16a7a457ea 100644
> +--- a/Include/pyexpat.h
> ++++ b/Include/pyexpat.h
> +@@ -57,6 +57,9 @@ struct PyExpat_CAPI
> +         XML_Parser parser, unsigned long long activationThresholdBytes)=
;
> +     XML_Bool (*SetAllocTrackerMaximumAmplification)(
> +         XML_Parser parser, float maxAmplificationFactor);
> ++    /* might be NULL for expat < 2.8.0 */
> ++    XML_Bool (*SetHashSalt16Bytes)(
> ++        XML_Parser parser, const uint8_t entropy[16]);
> +     /* always add new stuff to the end! */
> + };
> +
> +diff --git a/Misc/NEWS.d/next/Security/2026-04-26-19-30-45.gh-issue-1490=
18.a9SqWb.rst b/Misc/NEWS.d/next/Security/2026-04-26-19-30-45.gh-issue-1490=
18.a9SqWb.rst
> +new file mode 100644
> +index 000000000000000..d1b5b368684e6a5
> +--- /dev/null
> ++++ b/Misc/NEWS.d/next/Security/2026-04-26-19-30-45.gh-issue-149018.a9Sq=
Wb.rst
> +@@ -0,0 +1,3 @@
> ++Improved protection against XML hash-flooding attacks in
> ++:mod:`xml.parsers.expat` and :mod:`xml.etree.ElementTree` when Python i=
s
> ++compiled with libExpat 2.8.0 or later.
> +diff --git a/Modules/_elementtree.c b/Modules/_elementtree.c
> +index cbd1e026df27227..b2d4b982602c583 100644
> +--- a/Modules/_elementtree.c
> ++++ b/Modules/_elementtree.c
> +@@ -3657,8 +3657,12 @@ _elementtree_XMLParser___init___impl(XMLParserObj=
ect *self, PyObject *target,
> +         PyErr_NoMemory();
> +         return -1;
> +     }
> +-    /* expat < 2.1.0 has no XML_SetHashSalt() */
> +-    if (EXPAT(st, SetHashSalt) !=3D NULL) {
> ++    // Prefer 16-byte entropy, only expat >=3D 2.8.0. See gh-149018
> ++    if (EXPAT(st, SetHashSalt16Bytes) !=3D NULL) {
> ++        EXPAT(st, SetHashSalt16Bytes)(self->parser,
> ++                                      (const uint8_t *)_Py_HashSecret.u=
c);
> ++    }
> ++    else if (EXPAT(st, SetHashSalt) !=3D NULL) {
> +         EXPAT(st, SetHashSalt)(self->parser,
> +                            (unsigned long)_Py_HashSecret.expat.hashsalt=
);
> +     }
> +diff --git a/Modules/pyexpat.c b/Modules/pyexpat.c
> +index 0f0afe17513ef1c..1df433e64bc096f 100644
> +--- a/Modules/pyexpat.c
> ++++ b/Modules/pyexpat.c
> +@@ -1388,7 +1388,12 @@ newxmlparseobject(pyexpat_state *state, const cha=
r *encoding,
> +         Py_DECREF(self);
> +         return NULL;
> +     }
> +-#if XML_COMBINED_VERSION >=3D 20100
> ++#if defined(XML_BACKPORT_SET_HASH_SALT_16_BYTES) \
> ++    || XML_COMBINED_VERSION >=3D 20800
> ++    /* This feature was added upstream in libexpat 2.8.0. */
> ++    XML_SetHashSalt16Bytes(self->itself,
> ++                           (const uint8_t *)_Py_HashSecret.uc);
> ++#elif XML_COMBINED_VERSION >=3D 20100
> +     /* This feature was added upstream in libexpat 2.1.0. */
> +     XML_SetHashSalt(self->itself,
> +                     (unsigned long)_Py_HashSecret.expat.hashsalt);
> +@@ -2257,6 +2262,12 @@ pyexpat_exec(PyObject *mod)
> + #else
> +     capi->SetHashSalt =3D NULL;
> + #endif
> ++#if defined(XML_BACKPORT_SET_HASH_SALT_16_BYTES) \
> ++    || XML_COMBINED_VERSION >=3D 20800
> ++    capi->SetHashSalt16Bytes =3D XML_SetHashSalt16Bytes;
> ++#else
> ++    capi->SetHashSalt16Bytes =3D NULL;
> ++#endif
> + #if XML_COMBINED_VERSION >=3D 20600
> +     capi->SetReparseDeferralEnabled =3D XML_SetReparseDeferralEnabled;
> + #else
> diff --git a/meta/recipes-devtools/python/python3/CVE-2026-7210-2.patch b=
/meta/recipes-devtools/python/python3/CVE-2026-7210-2.patch
> new file mode 100644
> index 0000000000..e9a10d3705
> --- /dev/null
> +++ b/meta/recipes-devtools/python/python3/CVE-2026-7210-2.patch
> @@ -0,0 +1,74 @@
> +From ccb8d2f7df9534e49a43554193d7f5f4d993189c Mon Sep 17 00:00:00 2001
> +From: Stan Ulbrych <stan@python.org>
> +Date: Sun, 26 Apr 2026 19:42:01 +0100
> +Subject: [PATCH] Add `_Py_HashSecret_t.expat.hashsalt16` instead
> +
> +CVE: CVE-2026-7210
> +Upstream-Status: Backport [https://github.com/python/cpython/pull/149023=
/commits/ccb8d2f7df9534e49a43554193d7f5f4d993189c]
> +
> +Signed-off-by: Amaury Couderc <amaury.couderc@est.tech>
> +---
> + Include/pyhash.h       | 8 +++++---
> + Modules/_elementtree.c | 2 +-
> + Modules/pyexpat.c      | 3 +--
> + 3 files changed, 7 insertions(+), 6 deletions(-)
> +
> +diff --git a/Include/pyhash.h b/Include/pyhash.h
> +index 84cb72fa6fd1b26..3056dc44cc0f1b1 100644
> +--- a/Include/pyhash.h
> ++++ b/Include/pyhash.h
> +@@ -39,14 +39,14 @@
> +  *   pppppppp ssssssss ........  fnv -- two Py_hash_t
> +  *   k0k0k0k0 k1k1k1k1 ........  siphash -- two uint64_t
> +  *   ........ ........ ssssssss  djbx33a -- 16 bytes padding + one Py_h=
ash_t
> +- *   ........ ........ eeeeeeee  pyexpat XML hash salt
> ++ *   eeeeeeee eeeeeeee eeeeeeee  pyexpat XML hash salt
> +  *
> +  * memory layout on 32 bit systems
> +  *   cccccccc cccccccc cccccccc  uc
> +  *   ppppssss ........ ........  fnv -- two Py_hash_t
> +  *   k0k0k0k0 k1k1k1k1 ........  siphash -- two uint64_t (*)
> +  *   ........ ........ ssss....  djbx33a -- 16 bytes padding + one Py_h=
ash_t
> +- *   ........ ........ eeee....  pyexpat XML hash salt
> ++ *   eeeeeeee eeeeeeee eeee....  pyexpat XML hash salt
> +  *
> +  * (*) The siphash member may not be available on 32 bit platforms with=
out
> +  *     an unsigned int64 data type.
> +@@ -71,7 +71,9 @@ typedef union {
> +         Py_hash_t suffix;
> +     } djbx33a;
> +     struct {
> +-        unsigned char padding[16];
> ++        /* 16 bytes for XML_SetHashSalt16Bytes */
> ++        uint8_t hashsalt16[16];
> ++        /* 4/8 bytes for legacy XML_SetHashSalt */
> +         Py_hash_t hashsalt;
> +     } expat;
> + } _Py_HashSecret_t;
> +diff --git a/Modules/_elementtree.c b/Modules/_elementtree.c
> +index b2d4b982602c583..9e794be5c109ba5 100644
> +--- a/Modules/_elementtree.c
> ++++ b/Modules/_elementtree.c
> +@@ -3660,7 +3660,7 @@ _elementtree_XMLParser___init___impl(XMLParserObje=
ct *self, PyObject *target,
> +     // Prefer 16-byte entropy, only expat >=3D 2.8.0. See gh-149018
> +     if (EXPAT(st, SetHashSalt16Bytes) !=3D NULL) {
> +         EXPAT(st, SetHashSalt16Bytes)(self->parser,
> +-                                      (const uint8_t *)_Py_HashSecret.u=
c);
> ++                                      _Py_HashSecret.expat.hashsalt16);
> +     }
> +     else if (EXPAT(st, SetHashSalt) !=3D NULL) {
> +         EXPAT(st, SetHashSalt)(self->parser,
> +diff --git a/Modules/pyexpat.c b/Modules/pyexpat.c
> +index 1df433e64bc096f..78efbef679024f3 100644
> +--- a/Modules/pyexpat.c
> ++++ b/Modules/pyexpat.c
> +@@ -1391,8 +1391,7 @@ newxmlparseobject(pyexpat_state *state, const char=
 *encoding,
> + #if defined(XML_BACKPORT_SET_HASH_SALT_16_BYTES) \
> +     || XML_COMBINED_VERSION >=3D 20800
> +     /* This feature was added upstream in libexpat 2.8.0. */
> +-    XML_SetHashSalt16Bytes(self->itself,
> +-                           (const uint8_t *)_Py_HashSecret.uc);
> ++    XML_SetHashSalt16Bytes(self->itself, _Py_HashSecret.expat.hashsalt1=
6);
> + #elif XML_COMBINED_VERSION >=3D 20100
> +     /* This feature was added upstream in libexpat 2.1.0. */
> +     XML_SetHashSalt(self->itself,
> diff --git a/meta/recipes-devtools/python/python3_3.12.13.bb b/meta/recip=
es-devtools/python/python3_3.12.13.bb
> index 5fa25235fe..3e5575d396 100644
> --- a/meta/recipes-devtools/python/python3_3.12.13.bb
> +++ b/meta/recipes-devtools/python/python3_3.12.13.bb
> @@ -34,6 +34,8 @@ SRC_URI =3D "http://www.python.org/ftp/python/${PV}/Pyt=
hon-${PV}.tar.xz \
>           file://0001-test_deadlock-skip-problematic-test.patch \
>           file://0001-test_active_children-skip-problematic-test.patch \
>             file://0001-test_readline-skip-limited-history-test.patch \
> +           file://CVE-2026-7210-1.patch \
> +           file://CVE-2026-7210-2.patch \
>             "
>
>  SRC_URI:append:class-native =3D " \


--
Yoann Congal
Smile ECS


--_000_AMBP189MB31965402490609FB034B7DCDF8F12AMBP189MB3196EURP_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<hr>
<div style=3D"margin-top: 1em; margin-bottom: 1em; font-family: Aptos, Apto=
s_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-s=
ize: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
Hello Yoann,</div>
<div style=3D"margin-top: 1em; margin-bottom: 1em; font-family: Aptos, Apto=
s_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-s=
ize: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
I've submitted patches for CVE-2026-7210 and CVE-2026-41080 to the wrynose =
branch. The master branch requires neither backports nor updates.</div>
<div style=3D"margin-top: 1em; margin-bottom: 1em; font-family: Aptos, Apto=
s_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-s=
ize: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
However, the patch for CVE-2026-7210 requires the patch for CVE-2026-41080 =
for full mitigation, which I've seen was already submitted to the scarthgap=
 branch (see
<a href=3D"https://lists.openembedded.org/g/openembedded-core/message/23783=
8?p=3D%2C%2C%2C20%2C0%2C0%2C0%3A%3Acreated%2C%2CCVE-2026-41080%2C20%2C2%2C0=
%2C119168855" target=3D"_blank" id=3D"OWA47518045-9bd6-048d-001e-3b2b20fb36=
4b" class=3D"OWAAutoLink" rel=3D"noopener noreferrer">
https://lists.openembedded.org/g/openembedded-core/message/237838?p=3D%2C%2=
C%2C20%2C0%2C0%2C0%3A%3Acreated%2C%2CCVE-2026-41080%2C20%2C2%2C0%2C11916885=
5</a>), but I'm uncertain whether it has been merged yet.</div>
<div style=3D"margin-top: 1em; margin-bottom: 1em; font-family: Aptos, Apto=
s_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-s=
ize: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
Given this dependency, do you think it's still worth submitting my backport=
 for CVE-2026-7210 to scarthgap?</div>
<div style=3D"margin-top: 1em; margin-bottom: 1em; font-family: Aptos, Apto=
s_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-s=
ize: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
Kind Regards,</div>
<div style=3D"margin-top: 1em; margin-bottom: 1em; font-family: Aptos, Apto=
s_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-s=
ize: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
Amaury</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Yoann Congal &lt;yoan=
n.congal@smile.fr&gt;<br>
<b>Sent:</b> Wednesday, 17 June 2026 01:37<br>
<b>To:</b> Amaury Couderc &lt;amaury.couderc@est.tech&gt;; openembedded-cor=
e@lists.openembedded.org &lt;openembedded-core@lists.openembedded.org&gt;<b=
r>
<b>Subject:</b> Re: [PATCH v2 2/2][OE-core][scarthgap] python3: fix CVE-202=
6-7210</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">On Mon Jun 15, 2026 at 8:36 AM CEST, Amaury Couder=
c via lists.openembedded.org wrote:<br>
&gt; From: Amaury Couderc &lt;amaury.couderc@est.tech&gt;<br>
&gt;<br>
&gt; Backport patch to fix CVE-2026-7210.<br>
&gt;&nbsp;&nbsp; <a href=3D"https://nvd.nist.gov/vuln/detail/CVE-2026-7210"=
>https://nvd.nist.gov/vuln/detail/CVE-2026-7210</a><br>
&gt;<br>
&gt; In order to mitigate CVE-2026-7210 this patch should come alongside <b=
r>
&gt; the associated expat one which backports to expat 2.6.4 the fixes <br>
&gt; introduced in expat 2.8.0.<br>
&gt;<br>
&gt; Upstream fixes:<br>
&gt;&nbsp;&nbsp; <a href=3D"https://github.com/python/cpython/pull/149023/c=
ommits/03794ce9a58b1f33751c88d7d876dfbf27645c56">
https://github.com/python/cpython/pull/149023/commits/03794ce9a58b1f33751c8=
8d7d876dfbf27645c56</a><br>
&gt;&nbsp;&nbsp; <a href=3D"https://github.com/python/cpython/pull/149023/c=
ommits/ccb8d2f7df9534e49a43554193d7f5f4d993189c">
https://github.com/python/cpython/pull/149023/commits/ccb8d2f7df9534e49a435=
54193d7f5f4d993189c</a><br>
<br>
Hello,<br>
<br>
If I'm not mistaken those fixes are in 3.14.6 or the future 3.15 and<br>
neither are in wrynose nor master. Can you please send a fix for those<br>
branches (either backport or upgrade), and, then, ping back here?<br>
<br>
Thanks!<br>
<br>
&gt;<br>
&gt;<br>
&gt; Signed-off-by: Amaury Couderc &lt;amaury.couderc@est.tech&gt;<br>
&gt; ---<br>
&gt;&nbsp; .../python/python3/CVE-2026-7210-1.patch&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp; | 90 +++++++++++++++++++<br>
&gt;&nbsp; .../python/python3/CVE-2026-7210-2.patch&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp; | 74 +++++++++++++++<br>
&gt;&nbsp; .../python/python3_3.12.13.bb&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp; 2 +<b=
r>
&gt;&nbsp; 3 files changed, 166 insertions(+)<br>
&gt;&nbsp; create mode 100644 meta/recipes-devtools/python/python3/CVE-2026=
-7210-1.patch<br>
&gt;&nbsp; create mode 100644 meta/recipes-devtools/python/python3/CVE-2026=
-7210-2.patch<br>
&gt;<br>
&gt; diff --git a/meta/recipes-devtools/python/python3/CVE-2026-7210-1.patc=
h b/meta/recipes-devtools/python/python3/CVE-2026-7210-1.patch<br>
&gt; new file mode 100644<br>
&gt; index 0000000000..63aac320af<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta/recipes-devtools/python/python3/CVE-2026-7210-1.patch<br>
&gt; @@ -0,0 +1,90 @@<br>
&gt; +From 03794ce9a58b1f33751c88d7d876dfbf27645c56 Mon Sep 17 00:00:00 200=
1<br>
&gt; +From: Stan Ulbrych &lt;stan@python.org&gt;<br>
&gt; +Date: Sun, 26 Apr 2026 19:31:25 +0100<br>
&gt; +Subject: [PATCH] Use `XML_SetHashSalt16Bytes` from libExpat when poss=
ible<br>
&gt; +<br>
&gt; +CVE: CVE-2026-7210<br>
&gt; +Upstream-Status: Backport [<a href=3D"https://github.com/python/cpyth=
on/pull/149023/commits/03794ce9a58b1f33751c88d7d876dfbf27645c56">https://gi=
thub.com/python/cpython/pull/149023/commits/03794ce9a58b1f33751c88d7d876dfb=
f27645c56</a>] with downstream extension
 for XML_BACKPORT_SET_HASH_SALT_16_BYTES detection<br>
&gt; +<br>
&gt; +Signed-off-by: Amaury Couderc &lt;amaury.couderc@est.tech&gt;<br>
&gt; +---<br>
&gt; + Include/pyexpat.h&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; |&nbsp; 3 +++<br>
&gt; + .../2026-04-26-19-30-45.gh-issue-149018.a9SqWb.rst&nbsp;&nbsp; |&nbs=
p; 3 +++<br>
&gt; + Modules/_elementtree.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp; 8=
 ++++++--<br>
&gt; + Modules/pyexpat.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; | 11 ++++++++++-<br>
&gt; + 4 files changed, 22 insertions(+), 3 deletions(-)<br>
&gt; + create mode 100644 Misc/NEWS.d/next/Security/2026-04-26-19-30-45.gh-=
issue-149018.a9SqWb.rst<br>
&gt; +<br>
&gt; +diff --git a/Include/pyexpat.h b/Include/pyexpat.h<br>
&gt; +index f523f8bb273983a..a676e16a7a457ea 100644<br>
&gt; +--- a/Include/pyexpat.h<br>
&gt; ++++ b/Include/pyexpat.h<br>
&gt; +@@ -57,6 +57,9 @@ struct PyExpat_CAPI<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; XML_Parser parser, u=
nsigned long long activationThresholdBytes);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; XML_Bool (*SetAllocTrackerMaximumAmplificati=
on)(<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; XML_Parser parser, f=
loat maxAmplificationFactor);<br>
&gt; ++&nbsp;&nbsp;&nbsp; /* might be NULL for expat &lt; 2.8.0 */<br>
&gt; ++&nbsp;&nbsp;&nbsp; XML_Bool (*SetHashSalt16Bytes)(<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; XML_Parser parser, const =
uint8_t entropy[16]);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; /* always add new stuff to the end! */<br>
&gt; + };<br>
&gt; + <br>
&gt; +diff --git a/Misc/NEWS.d/next/Security/2026-04-26-19-30-45.gh-issue-1=
49018.a9SqWb.rst b/Misc/NEWS.d/next/Security/2026-04-26-19-30-45.gh-issue-1=
49018.a9SqWb.rst<br>
&gt; +new file mode 100644<br>
&gt; +index 000000000000000..d1b5b368684e6a5<br>
&gt; +--- /dev/null<br>
&gt; ++++ b/Misc/NEWS.d/next/Security/2026-04-26-19-30-45.gh-issue-149018.a=
9SqWb.rst<br>
&gt; +@@ -0,0 +1,3 @@<br>
&gt; ++Improved protection against XML hash-flooding attacks in<br>
&gt; ++:mod:`xml.parsers.expat` and :mod:`xml.etree.ElementTree` when Pytho=
n is<br>
&gt; ++compiled with libExpat 2.8.0 or later.<br>
&gt; +diff --git a/Modules/_elementtree.c b/Modules/_elementtree.c<br>
&gt; +index cbd1e026df27227..b2d4b982602c583 100644<br>
&gt; +--- a/Modules/_elementtree.c<br>
&gt; ++++ b/Modules/_elementtree.c<br>
&gt; +@@ -3657,8 +3657,12 @@ _elementtree_XMLParser___init___impl(XMLParser=
Object *self, PyObject *target,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; PyErr_NoMemory();<br=
>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return -1;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; +-&nbsp;&nbsp;&nbsp; /* expat &lt; 2.1.0 has no XML_SetHashSalt() */<b=
r>
&gt; +-&nbsp;&nbsp;&nbsp; if (EXPAT(st, SetHashSalt) !=3D NULL) {<br>
&gt; ++&nbsp;&nbsp;&nbsp; // Prefer 16-byte entropy, only expat &gt;=3D 2.8=
.0. See gh-149018<br>
&gt; ++&nbsp;&nbsp;&nbsp; if (EXPAT(st, SetHashSalt16Bytes) !=3D NULL) {<br=
>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; EXPAT(st, SetHashSalt16By=
tes)(self-&gt;parser,<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp; (const uint8_t *)_Py_HashSecret.uc);<br>
&gt; ++&nbsp;&nbsp;&nbsp; }<br>
&gt; ++&nbsp;&nbsp;&nbsp; else if (EXPAT(st, SetHashSalt) !=3D NULL) {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; EXPAT(st, SetHashSal=
t)(self-&gt;parser,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp; (unsigned long)_Py_HashSecret.expat.hashsalt);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; +diff --git a/Modules/pyexpat.c b/Modules/pyexpat.c<br>
&gt; +index 0f0afe17513ef1c..1df433e64bc096f 100644<br>
&gt; +--- a/Modules/pyexpat.c<br>
&gt; ++++ b/Modules/pyexpat.c<br>
&gt; +@@ -1388,7 +1388,12 @@ newxmlparseobject(pyexpat_state *state, const =
char *encoding,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Py_DECREF(self);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return NULL;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; +-#if XML_COMBINED_VERSION &gt;=3D 20100<br>
&gt; ++#if defined(XML_BACKPORT_SET_HASH_SALT_16_BYTES) \<br>
&gt; ++&nbsp;&nbsp;&nbsp; || XML_COMBINED_VERSION &gt;=3D 20800<br>
&gt; ++&nbsp;&nbsp;&nbsp; /* This feature was added upstream in libexpat 2.=
8.0. */<br>
&gt; ++&nbsp;&nbsp;&nbsp; XML_SetHashSalt16Bytes(self-&gt;itself,<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp; (const uint8_t *)_Py_HashSecret.uc);<br>
&gt; ++#elif XML_COMBINED_VERSION &gt;=3D 20100<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; /* This feature was added upstream in libexp=
at 2.1.0. */<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; XML_SetHashSalt(self-&gt;itself,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (unsigned long)_Py_Hash=
Secret.expat.hashsalt);<br>
&gt; +@@ -2257,6 +2262,12 @@ pyexpat_exec(PyObject *mod)<br>
&gt; + #else<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; capi-&gt;SetHashSalt =3D NULL;<br>
&gt; + #endif<br>
&gt; ++#if defined(XML_BACKPORT_SET_HASH_SALT_16_BYTES) \<br>
&gt; ++&nbsp;&nbsp;&nbsp; || XML_COMBINED_VERSION &gt;=3D 20800<br>
&gt; ++&nbsp;&nbsp;&nbsp; capi-&gt;SetHashSalt16Bytes =3D XML_SetHashSalt16=
Bytes;<br>
&gt; ++#else<br>
&gt; ++&nbsp;&nbsp;&nbsp; capi-&gt;SetHashSalt16Bytes =3D NULL;<br>
&gt; ++#endif<br>
&gt; + #if XML_COMBINED_VERSION &gt;=3D 20600<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; capi-&gt;SetReparseDeferralEnabled =3D XML_S=
etReparseDeferralEnabled;<br>
&gt; + #else<br>
&gt; diff --git a/meta/recipes-devtools/python/python3/CVE-2026-7210-2.patc=
h b/meta/recipes-devtools/python/python3/CVE-2026-7210-2.patch<br>
&gt; new file mode 100644<br>
&gt; index 0000000000..e9a10d3705<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta/recipes-devtools/python/python3/CVE-2026-7210-2.patch<br>
&gt; @@ -0,0 +1,74 @@<br>
&gt; +From ccb8d2f7df9534e49a43554193d7f5f4d993189c Mon Sep 17 00:00:00 200=
1<br>
&gt; +From: Stan Ulbrych &lt;stan@python.org&gt;<br>
&gt; +Date: Sun, 26 Apr 2026 19:42:01 +0100<br>
&gt; +Subject: [PATCH] Add `_Py_HashSecret_t.expat.hashsalt16` instead<br>
&gt; +<br>
&gt; +CVE: CVE-2026-7210<br>
&gt; +Upstream-Status: Backport [<a href=3D"https://github.com/python/cpyth=
on/pull/149023/commits/ccb8d2f7df9534e49a43554193d7f5f4d993189c">https://gi=
thub.com/python/cpython/pull/149023/commits/ccb8d2f7df9534e49a43554193d7f5f=
4d993189c</a>]<br>
&gt; +<br>
&gt; +Signed-off-by: Amaury Couderc &lt;amaury.couderc@est.tech&gt;<br>
&gt; +---<br>
&gt; + Include/pyhash.h&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 8 +++++---<br=
>
&gt; + Modules/_elementtree.c | 2 +-<br>
&gt; + Modules/pyexpat.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 3 +--<br>
&gt; + 3 files changed, 7 insertions(+), 6 deletions(-)<br>
&gt; +<br>
&gt; +diff --git a/Include/pyhash.h b/Include/pyhash.h<br>
&gt; +index 84cb72fa6fd1b26..3056dc44cc0f1b1 100644<br>
&gt; +--- a/Include/pyhash.h<br>
&gt; ++++ b/Include/pyhash.h<br>
&gt; +@@ -39,14 +39,14 @@<br>
&gt; +&nbsp; *&nbsp;&nbsp; pppppppp ssssssss ........&nbsp; fnv -- two Py_h=
ash_t<br>
&gt; +&nbsp; *&nbsp;&nbsp; k0k0k0k0 k1k1k1k1 ........&nbsp; siphash -- two =
uint64_t<br>
&gt; +&nbsp; *&nbsp;&nbsp; ........ ........ ssssssss&nbsp; djbx33a -- 16 b=
ytes padding + one Py_hash_t<br>
&gt; +- *&nbsp;&nbsp; ........ ........ eeeeeeee&nbsp; pyexpat XML hash sal=
t<br>
&gt; ++ *&nbsp;&nbsp; eeeeeeee eeeeeeee eeeeeeee&nbsp; pyexpat XML hash sal=
t<br>
&gt; +&nbsp; *<br>
&gt; +&nbsp; * memory layout on 32 bit systems<br>
&gt; +&nbsp; *&nbsp;&nbsp; cccccccc cccccccc cccccccc&nbsp; uc<br>
&gt; +&nbsp; *&nbsp;&nbsp; ppppssss ........ ........&nbsp; fnv -- two Py_h=
ash_t<br>
&gt; +&nbsp; *&nbsp;&nbsp; k0k0k0k0 k1k1k1k1 ........&nbsp; siphash -- two =
uint64_t (*)<br>
&gt; +&nbsp; *&nbsp;&nbsp; ........ ........ ssss....&nbsp; djbx33a -- 16 b=
ytes padding + one Py_hash_t<br>
&gt; +- *&nbsp;&nbsp; ........ ........ eeee....&nbsp; pyexpat XML hash sal=
t<br>
&gt; ++ *&nbsp;&nbsp; eeeeeeee eeeeeeee eeee....&nbsp; pyexpat XML hash sal=
t<br>
&gt; +&nbsp; *<br>
&gt; +&nbsp; * (*) The siphash member may not be available on 32 bit platfo=
rms without<br>
&gt; +&nbsp; *&nbsp;&nbsp;&nbsp;&nbsp; an unsigned int64 data type.<br>
&gt; +@@ -71,7 +71,9 @@ typedef union {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Py_hash_t suffix;<br=
>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; } djbx33a;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; struct {<br>
&gt; +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; unsigned char padding[16]=
;<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* 16 bytes for XML_SetHa=
shSalt16Bytes */<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; uint8_t hashsalt16[16];<b=
r>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* 4/8 bytes for legacy X=
ML_SetHashSalt */<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Py_hash_t hashsalt;<=
br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; } expat;<br>
&gt; + } _Py_HashSecret_t;<br>
&gt; +diff --git a/Modules/_elementtree.c b/Modules/_elementtree.c<br>
&gt; +index b2d4b982602c583..9e794be5c109ba5 100644<br>
&gt; +--- a/Modules/_elementtree.c<br>
&gt; ++++ b/Modules/_elementtree.c<br>
&gt; +@@ -3660,7 +3660,7 @@ _elementtree_XMLParser___init___impl(XMLParserO=
bject *self, PyObject *target,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; // Prefer 16-byte entropy, only expat &gt;=
=3D 2.8.0. See gh-149018<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; if (EXPAT(st, SetHashSalt16Bytes) !=3D NULL)=
 {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; EXPAT(st, SetHashSal=
t16Bytes)(self-&gt;parser,<br>
&gt; +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp; (const uint8_t *)_Py_HashSecret.uc);<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp; _Py_HashSecret.expat.hashsalt16);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; else if (EXPAT(st, SetHashSalt) !=3D NULL) {=
<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; EXPAT(st, SetHashSal=
t)(self-&gt;parser,<br>
&gt; +diff --git a/Modules/pyexpat.c b/Modules/pyexpat.c<br>
&gt; +index 1df433e64bc096f..78efbef679024f3 100644<br>
&gt; +--- a/Modules/pyexpat.c<br>
&gt; ++++ b/Modules/pyexpat.c<br>
&gt; +@@ -1391,8 +1391,7 @@ newxmlparseobject(pyexpat_state *state, const c=
har *encoding,<br>
&gt; + #if defined(XML_BACKPORT_SET_HASH_SALT_16_BYTES) \<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; || XML_COMBINED_VERSION &gt;=3D 20800<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; /* This feature was added upstream in libexp=
at 2.8.0. */<br>
&gt; +-&nbsp;&nbsp;&nbsp; XML_SetHashSalt16Bytes(self-&gt;itself,<br>
&gt; +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp; (const uint8_t *)_Py_HashSecret.uc);<br>
&gt; ++&nbsp;&nbsp;&nbsp; XML_SetHashSalt16Bytes(self-&gt;itself, _Py_HashS=
ecret.expat.hashsalt16);<br>
&gt; + #elif XML_COMBINED_VERSION &gt;=3D 20100<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; /* This feature was added upstream in libexp=
at 2.1.0. */<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; XML_SetHashSalt(self-&gt;itself,<br>
&gt; diff --git a/meta/recipes-devtools/python/python3_3.12.13.bb b/meta/re=
cipes-devtools/python/python3_3.12.13.bb<br>
&gt; index 5fa25235fe..3e5575d396 100644<br>
&gt; --- a/meta/recipes-devtools/python/python3_3.12.13.bb<br>
&gt; +++ b/meta/recipes-devtools/python/python3_3.12.13.bb<br>
&gt; @@ -34,6 +34,8 @@ SRC_URI =3D &quot;<a href=3D""></a>http://www.python=
.org/ftp/python/${PV}/Python-${PV}.tar.xz \<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=3D=
"file://0001-test_deadlock-skip-problematic-test.patch">file://0001-test_de=
adlock-skip-problematic-test.patch</a> \<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=3D=
"file://0001-test_active_children-skip-problematic-test.patch">
file://0001-test_active_children-skip-problematic-test.patch</a> \<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; <a href=3D"file://0001-test_readline-skip-limited-history-test.patch">
file://0001-test_readline-skip-limited-history-test.patch</a> \<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=
=3D"file://CVE-2026-7210-1.patch">file://CVE-2026-7210-1.patch</a>&nbsp;\<b=
r>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=
=3D"file://CVE-2026-7210-2.patch">file://CVE-2026-7210-2.patch</a>&nbsp;\<b=
r>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; &quot;<br>
&gt;&nbsp; <br>
&gt;&nbsp; SRC_URI:append:class-native =3D &quot; \<br>
<br>
<br>
-- <br>
Yoann Congal<br>
Smile ECS<br>
<br>
</div>
</span></font></div>
</body>
</html>

--_000_AMBP189MB31965402490609FB034B7DCDF8F12AMBP189MB3196EURP_--

