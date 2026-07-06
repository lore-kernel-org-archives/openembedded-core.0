Return-Path: <amaury.couderc@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9F22C43458
	for <webhook@archiver.kernel.org>; Mon,  6 Jul 2026 13:28:18 +0000 (UTC)
Received: from AM0PR02CU008.outbound.protection.outlook.com (AM0PR02CU008.outbound.protection.outlook.com [52.101.72.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.150028.1783344496559437811
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Jul 2026 06:28:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@est.tech header.s=selector1 header.b=qQjOR8l2;
 spf=pass (domain: est.tech, ip: 52.101.72.44, mailfrom: amaury.couderc@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Zt3ZJCT/PUGJ6ciQGjFl6hBFslZfTwgpuo+D65k+W6zSl18a5pMosXEvIo2zVx8KKEZrhdKrKBbyE31AosBBU4J/WyHPQV39sxno1tGp84g4ETpuXdCn0pkNH2JL9TKO7D4SVfNC33yxeT8DxSenZY75viH3fyJwmoRfe6PmEolRO+suwpwii/UDtIgApF4hZ/6jjr8GyfeJxzSym1ruAudI8SXO+KiPfLSQb7lO9BaMqBRio7z0s3qp121az9Lh5ZAuqAleg8TkfrCNlS2oUkSTmFvPHRXlF8RBKTUXLSob0lzgJs7qpraWzPv6uNVSDZ1llF824bsu6p4vM97kGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dAW1MfhCIWxQpmZbP9Lu7/xn5mySkeNJN79mke5QO7Y=;
 b=ll6uFcvP/Pnx7L2+/V2d+fwe6DyMgeAu1STj/9VvHozPLyuaCcmV5vhsghlE2amjA0AAW1DlvTqPwZfpb9lyzvygpJz+Fz0MUlfmj4ZJ+q4fOzyopoy3R1wFk9Juy4zqZiB55aZa4cbu/3wGPP4rfOlLLS4eMYRlnhik8D6TgBL90MLdzc2ysbIdwzFX9xTUL7zkCIfV4jYQejFJI5WY1oSFc3XnM5xdCgssdBujyf+XA4GOZHdYSW/3GxRub2CvvJYwatKB5eZt2TJNZTHUcMESosnXqblppdz6dx2C260qoARejaWPxIJSTCMPj+/f2OCINgLUxLkJZg/K7ysQqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dAW1MfhCIWxQpmZbP9Lu7/xn5mySkeNJN79mke5QO7Y=;
 b=qQjOR8l2cClA7EVy0wc1Tw/3l8OV0QYrhGVgz5AXYSJu5Wf7g4EMeQbmRXL53FzwGyXHL7LEY1tlgNQIu7oQGqlHdyFf1PTrNIKrG0vqU2KQhGI2HZVjHm4o8jSWyuWUg5NwPm4UCS8G9edTy1r7w/q1jIcoB+w2gCMNKwy5jKmexcds9Dgwlg6XdMDLtjmrtkL5GsA6KKV5vlZGfDcQeKceJgW0UVpUXzvFNK88NBDbfiJm9wlslD1UqpJUgXQZyzY++ZnWXn00b8Dpvu7nxdWlUwsdMUVgV1rRc/iYBPBl5W+ROuuBKdKKwdC0d6nlVMAtF+SlS7sciUnETN6+nQ==
Received: from AMBP189MB3196.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6ad::11)
 by GV1P189MB2785.EURP189.PROD.OUTLOOK.COM (2603:10a6:150:1ee::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.11; Mon, 6 Jul
 2026 13:28:13 +0000
Received: from AMBP189MB3196.EURP189.PROD.OUTLOOK.COM
 ([fe80::1afd:f059:542:3d95]) by AMBP189MB3196.EURP189.PROD.OUTLOOK.COM
 ([fe80::1afd:f059:542:3d95%4]) with mapi id 15.21.0181.008; Mon, 6 Jul 2026
 13:28:13 +0000
From: Amaury Couderc <amaury.couderc@est.tech>
To: Yoann Congal <yoann.congal@smile.fr>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2 2/2][OE-core][scarthgap] python3: fix CVE-2026-7210
Thread-Topic: [PATCH v2 2/2][OE-core][scarthgap] python3: fix CVE-2026-7210
Thread-Index: AQHc/JFe6ZKemIWpCkO8yaPucHQ4vLZB2REAgB6yKB2AAAgNgIAACgVe
Date: Mon, 6 Jul 2026 13:28:13 +0000
Message-ID: 
 <AMBP189MB3196D1967C16EC45E7A31C41F8F12@AMBP189MB3196.EURP189.PROD.OUTLOOK.COM>
References: <20260615063640.25128-1-amaury.couderc@est.tech>
 <DJAVAP82IHN7.ZUBCLSIJUS0O@smile.fr>
 <AMBP189MB31965402490609FB034B7DCDF8F12@AMBP189MB3196.EURP189.PROD.OUTLOOK.COM>
 <CAMSfU+49rELGwdjk3fDq-xpsy6iPkpyxEwdZ-46SDirvw3rYXw@mail.gmail.com>
In-Reply-To: 
 <CAMSfU+49rELGwdjk3fDq-xpsy6iPkpyxEwdZ-46SDirvw3rYXw@mail.gmail.com>
Accept-Language: en-SE, en-US
Content-Language: aa
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AMBP189MB3196:EE_|GV1P189MB2785:EE_
x-ms-office365-filtering-correlation-id: dc53d74d-7f9d-41ca-b4bd-08dedb626e1a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|376014|1800799024|366016|23010399003|38070700021|22082099003|18002099003|11063799006|4143699003|8096899003|25016099003|12006099003|16056099006|6133799003|56012099006|29003799003|13003099007;
x-microsoft-antispam-message-info: 
 ElHSw8ZlEI4HO4hopiHe9spe1HwzaoVCKLXDRdEb5NfH9F6jCRnFoHhlat1/hwG9KlsTy5d1zF4vSapzR8HEPEUbAG+Kv2TtbcUf8stzo1RLEE/Ba5ZLjk/yR8wbFe+7MlfPQqfBuRluNIXfiN96040lO+3Jb6w2o9cvVg9wT5fSbQRXwvXfl2Z2tnBt8xdl9WwCdmTqW2XFjIGUmZz3kIgX1NTJH4a3PacLGKesTdRisIGmazhXG2szOV0XTJw+a8cTgaXCW4YsNAuVvjoNmG7XH+2tmrmzI2rBqrKqLHj2ELOk36tpLpoY2bQ4+wJHwhQdgQqQrfZ2pGjBW6CXgnUnE/YUJdTgxhf3hxDf6tDo74qOgiAAYCTyRk32Q/4KZ7cRaLhGeqmu4CD02sI6x/Rpqci+0zbZg/G5CTgrLYJyX9ysrQOl5T8+V2JxsvhbVViA/pOiy/M6H8vSVLhCDn0sEVVwejuTT6s8eLRtBm0n0rnjMjW8h15BWl4FeMgJ4m1+8AJiqYa3Ce+bwGDaQjVkRzcXzstwlhubRyr/I2C0Ka2+rio+oTG1FgHoMfFzMGQJd6lK4f8FnSHi0vUOlTnGLhnGMx3Nsp2HRJ9DEsEEINq/74wxMcO4Kq+WFsPdTqhEkeb/EgrlDMm//KMt9hUhGyc8DXaU69zq+VZDCUE=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AMBP189MB3196.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(23010399003)(38070700021)(22082099003)(18002099003)(11063799006)(4143699003)(8096899003)(25016099003)(12006099003)(16056099006)(6133799003)(56012099006)(29003799003)(13003099007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?B4AM35LEAqZYHXBUV/xIj6JdEa1bZxGPT+f1LnJpu3wF2ZlwgLI4Q6rLpH?=
 =?iso-8859-1?Q?bk9MkFFLa69/1omIvYGMel3yYvMwKsHVZ5vCpxma0mTRieZzBA5t186JPr?=
 =?iso-8859-1?Q?Fv9o1NmjAYy159N3aMozpR+YjgcQlHUjyJBtomwZFisgefgsEEGjKB3Pc9?=
 =?iso-8859-1?Q?N7UAC7pwkvP2igUVC20AT8cH/TVDF3OJMsoeW4zqD7oiCG3dXEh3SKM1/Z?=
 =?iso-8859-1?Q?YrB2ks62aLjzCOSRv/yfX0Mq49ebPOvTMLtT9pSZsI14FATzZrqtPuTWgA?=
 =?iso-8859-1?Q?ZxDiKFBbO80xCpOKJxcSsHKmhQNbjg1BZ+1bWqTODVPQb7hr5tp1xFkOfa?=
 =?iso-8859-1?Q?qJLJTGcuAt7HBgfuvmqJQloek0NKoazMPsOMpGlECTYH6vgrKEkx5A3oWJ?=
 =?iso-8859-1?Q?33odaWGsZf7gIC1qU0aFSrVcLnTV5yd0Chavv+TrC4HjRoPXvwRiKim3DI?=
 =?iso-8859-1?Q?23vE0JnEd+TUOqv4Odhs37sHSFFZ9Zh1J+ms4w6HjAyRdT1sg+ZI2fZfMY?=
 =?iso-8859-1?Q?z7DozUaX9LcYaKIMMEaY/euCyYylRjxR3JC0x+Ajc1PdJfjfVVv2fNJrSn?=
 =?iso-8859-1?Q?ara8Cpd6e+aaUBaKBiZws5PBOoSZKBYoL0hEgYBW6dh3FNa2mFQjr4uKP1?=
 =?iso-8859-1?Q?uQqs6dpeN+IHpLntti+X9rtr0BLo8wJ7lYkl1E/bCEEmBQElhxk1TPKDCS?=
 =?iso-8859-1?Q?6w8VNDSyRPri4VauIua1r+cM/aJg3ukLhEW+zdBFDLND8iTlk0291PC5ET?=
 =?iso-8859-1?Q?VXWoXb3YwbgFzggKsOpJ58p2W43BqDnXuAbwvpyN/EviBjjAte7/+scZEt?=
 =?iso-8859-1?Q?kaYMeWcGgX9yXk3zuB2xdiz15ho+2HuG5VPgJ9nPfwe2iORCGpoUopwWm5?=
 =?iso-8859-1?Q?viC9krm+Nvq5MFl3TGiZy6PCri4coynIuzbuGwKdqkTP+loE1tjiEcDRi1?=
 =?iso-8859-1?Q?IBbWfJ4r+mhiO9GASAa3Eomu8B8/fD35ZggYCkNHr69scxqqQbyNwK9hTU?=
 =?iso-8859-1?Q?WX+wVGuHad3DeEB637UcWCj0+v/SN1Lc+Gtiu2JbNO8VJalebn59XIJEf6?=
 =?iso-8859-1?Q?d7pgfg50G6E214WjIPh3taUiR/2tHUrcKKKAQX74fafJrYI3OPd/qnn04u?=
 =?iso-8859-1?Q?yK79Iva3I8gr97+iDVXAhrWUbgK71zH/rA46gkmWtYTwV/FJQq72JC7q6r?=
 =?iso-8859-1?Q?sZhYWCOFgDKm8b8cITUszdoDpV4Hj783NwL9IMdIxc8mLcMuQyZGF6WtPc?=
 =?iso-8859-1?Q?TE1rfZxHkTKlEWmTeFKCQ7LDJHm8Pm8vGDqlvX6WAaHEYRK5BT69WrSgPm?=
 =?iso-8859-1?Q?YPj3ngTSMHH+Y3+BLxdmo2u2JJZOCqch30iehlxodGLhnNp6wDqHwLO5hN?=
 =?iso-8859-1?Q?XpxDF24Uxd504u7IEQcJ6CUzu+YbysWWxs+HiPYRh7bAJoYXQJzWFyoygt?=
 =?iso-8859-1?Q?YR0IyADH/rpyjdRm9Fh40oa5kEb0lCqyNqlfsLDW6mPKyjy05W8apA58MZ?=
 =?iso-8859-1?Q?zcmdwhzfac7iNmPUflajGvImdW6APOZhq2yuIkiVyDZjeN/k9Kdn7d36P8?=
 =?iso-8859-1?Q?mmeVJfes9Os0fmOAYT4M9s4Hm/8mvqWUsO5e6kai2k1F4voiUkG1Gi+CAn?=
 =?iso-8859-1?Q?Qg9RMZWr0yLP7LVMOzFeZ/nKgPICjYRXmVvCX31cMYUnD4wjBVDC3X++tH?=
 =?iso-8859-1?Q?F+Fk8QHKHkBb2l2KLZ7lHcqnunYbi3YDj2COvAEUeU71vyO8VnakABGxjD?=
 =?iso-8859-1?Q?s1mNfM3AjU0evUmzjpTJgsi0vsPvImiH+6hXd3PWltBmZO?=
Content-Type: multipart/alternative;
	boundary="_000_AMBP189MB3196D1967C16EC45E7A31C41F8F12AMBP189MB3196EURP_"
MIME-Version: 1.0
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AMBP189MB3196.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: dc53d74d-7f9d-41ca-b4bd-08dedb626e1a
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Jul 2026 13:28:13.3701
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8s5qhv3NifwsC0SSyGN9fpiBx1PcO8SUTthtEzZAKj5LhiMRDBdJM98tUVpeEBqQCXDDz7PQbyi9Tr6kkSwq+g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1P189MB2785
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Jul 2026 13:28:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240270

--_000_AMBP189MB3196D1967C16EC45E7A31C41F8F12AMBP189MB3196EURP_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Thanks for the input! Just sent the patch.

Kind Regards,

Amaury
________________________________
From: Yoann Congal <yoann.congal@smile.fr>
Sent: Monday, 6 July 2026 14:51
To: Amaury Couderc <amaury.couderc@est.tech>
Cc: openembedded-core@lists.openembedded.org <openembedded-core@lists.opene=
mbedded.org>
Subject: Re: [PATCH v2 2/2][OE-core][scarthgap] python3: fix CVE-2026-7210



Le lun. 6 juil. 2026 =E0 14:31, Amaury Couderc <amaury.couderc@est.tech> a =
=E9crit :
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
Yes please.

I'll take the patch for CVE-2026-41080: (see https://lore.kernel.org/all/20=
30b4435c8bc81bb4452637c0517ac33ab94d20.camel@pbarker.dev/)
Note in you patch comment (below the "---") that the patch for CVE-2026-410=
80 needs to go first.

Thanks!

Kind Regards,
Amaury
________________________________
From: Yoann Congal <yoann.congal@smile.fr<mailto:yoann.congal@smile.fr>>
Sent: Wednesday, 17 June 2026 01:37
To: Amaury Couderc <amaury.couderc@est.tech>; openembedded-core@lists.opene=
mbedded.org<mailto:openembedded-core@lists.openembedded.org> <openembedded-=
core@lists.openembedded.org<mailto:openembedded-core@lists.openembedded.org=
>>
Subject: Re: [PATCH v2 2/2][OE-core][scarthgap] python3: fix CVE-2026-7210

On Mon Jun 15, 2026 at 8:36 AM CEST, Amaury Couderc via lists.openembedded.=
org<http://lists.openembedded.org> wrote:
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
>  .../python/python3_3.12.13.bb<http://python3_3.12.13.bb>                =
 |  2 +
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
> +From: Stan Ulbrych <stan@python.org<mailto:stan@python.org>>
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
> +From: Stan Ulbrych <stan@python.org<mailto:stan@python.org>>
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
> diff --git a/meta/recipes-devtools/python/python3_3.12.13.bb<http://pytho=
n3_3.12.13.bb> b/meta/recipes-devtools/python/python3_3.12.13.bb<http://pyt=
hon3_3.12.13.bb>
> index 5fa25235fe..3e5575d396 100644
> --- a/meta/recipes-devtools/python/python3_3.12.13.bb<http://python3_3.12=
.13.bb>
> +++ b/meta/recipes-devtools/python/python3_3.12.13.bb<http://python3_3.12=
.13.bb>
> @@ -34,6 +34,8 @@ SRC_URI =3D "http://www.python.org/ftp/python/${PV}/Pyt=
hon-${PV}.tar.xz<http://www.python.org/ftp/python/$%7BPV%7D/Python-$%7BPV%7=
D.tar.xz> \
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



--
Yoann Congal
Smile ECS

--_000_AMBP189MB3196D1967C16EC45E7A31C41F8F12AMBP189MB3196EURP_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
Thanks for the input! Just sent the patch.</div>
<div id=3D"Signature" class=3D"elementToProof">
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, &quot;Aptos_Embe=
ddedFont&quot;, &quot;Aptos_MSFontService&quot;, Calibri, Helvetica, sans-s=
erif; font-size: 12pt; color: rgb(0, 0, 0);">
Kind Regards,</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, &quot;Aptos_Embe=
ddedFont&quot;, &quot;Aptos_MSFontService&quot;, Calibri, Helvetica, sans-s=
erif; font-size: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, &quot;Aptos_Embe=
ddedFont&quot;, &quot;Aptos_MSFontService&quot;, Calibri, Helvetica, sans-s=
erif; font-size: 12pt; color: rgb(0, 0, 0);">
Amaury</div>
</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Yoann Congal &lt;yoan=
n.congal@smile.fr&gt;<br>
<b>Sent:</b> Monday, 6 July 2026 14:51<br>
<b>To:</b> Amaury Couderc &lt;amaury.couderc@est.tech&gt;<br>
<b>Cc:</b> openembedded-core@lists.openembedded.org &lt;openembedded-core@l=
ists.openembedded.org&gt;<br>
<b>Subject:</b> Re: [PATCH v2 2/2][OE-core][scarthgap] python3: fix CVE-202=
6-7210</font>
<div>&nbsp;</div>
</div>
<div>
<div dir=3D"ltr">
<div dir=3D"ltr"><br>
</div>
<br>
<div class=3D"x_gmail_quote x_gmail_quote_container">
<div dir=3D"ltr" class=3D"x_gmail_attr">Le&nbsp;lun. 6 juil. 2026 =E0&nbsp;=
14:31, Amaury Couderc &lt;amaury.couderc@est.tech&gt; a =E9crit&nbsp;:<br>
</div>
<blockquote class=3D"x_gmail_quote" style=3D"margin:0px 0px 0px 0.8ex; bord=
er-left:1px solid rgb(204,204,204); padding-left:1ex">
<div class=3D"x_msg-5366290115774986660">
<div dir=3D"ltr">
<hr>
<div style=3D"margin-top:1em; margin-bottom:1em; font-family:Aptos,Aptos_Em=
beddedFont,Aptos_MSFontService,Calibri,Helvetica,sans-serif; font-size:12pt=
; color:rgb(0,0,0)">
Hello Yoann,</div>
<div style=3D"margin-top:1em; margin-bottom:1em; font-family:Aptos,Aptos_Em=
beddedFont,Aptos_MSFontService,Calibri,Helvetica,sans-serif; font-size:12pt=
; color:rgb(0,0,0)">
I've submitted patches for CVE-2026-7210 and CVE-2026-41080 to the wrynose =
branch. The master branch requires neither backports nor updates.</div>
<div style=3D"margin-top:1em; margin-bottom:1em; font-family:Aptos,Aptos_Em=
beddedFont,Aptos_MSFontService,Calibri,Helvetica,sans-serif; font-size:12pt=
; color:rgb(0,0,0)">
However, the patch for CVE-2026-7210 requires the patch for CVE-2026-41080 =
for full mitigation, which I've seen was already submitted to the scarthgap=
 branch (see
<a href=3D"https://lists.openembedded.org/g/openembedded-core/message/23783=
8?p=3D%2C%2C%2C20%2C0%2C0%2C0%3A%3Acreated%2C%2CCVE-2026-41080%2C20%2C2%2C0=
%2C119168855" id=3D"x_m_-5366290115774986660OWA47518045-9bd6-048d-001e-3b2b=
20fb364b" rel=3D"noopener noreferrer" target=3D"_blank">
https://lists.openembedded.org/g/openembedded-core/message/237838?p=3D%2C%2=
C%2C20%2C0%2C0%2C0%3A%3Acreated%2C%2CCVE-2026-41080%2C20%2C2%2C0%2C11916885=
5</a>), but I'm uncertain whether it has been merged yet.</div>
<div style=3D"margin-top:1em; margin-bottom:1em; font-family:Aptos,Aptos_Em=
beddedFont,Aptos_MSFontService,Calibri,Helvetica,sans-serif; font-size:12pt=
; color:rgb(0,0,0)">
Given this dependency, do you think it's still worth submitting my backport=
 for CVE-2026-7210 to scarthgap?</div>
</div>
</div>
</blockquote>
<div>Yes please.</div>
<div><br>
</div>
<div>I'll take the patch for&nbsp;CVE-2026-41080: (see <a href=3D"https://l=
ore.kernel.org/all/2030b4435c8bc81bb4452637c0517ac33ab94d20.camel@pbarker.d=
ev/">
https://lore.kernel.org/all/2030b4435c8bc81bb4452637c0517ac33ab94d20.camel@=
pbarker.dev/</a>)</div>
<div>Note in you patch comment (below the &quot;---&quot;) that the patch f=
or CVE-2026-41080 needs to go first.</div>
<div><br>
</div>
<div>Thanks!</div>
<div>&nbsp;</div>
<blockquote class=3D"x_gmail_quote" style=3D"margin:0px 0px 0px 0.8ex; bord=
er-left:1px solid rgb(204,204,204); padding-left:1ex">
<div class=3D"x_msg-5366290115774986660">
<div dir=3D"ltr">
<div style=3D"margin-top:1em; margin-bottom:1em; font-family:Aptos,Aptos_Em=
beddedFont,Aptos_MSFontService,Calibri,Helvetica,sans-serif; font-size:12pt=
; color:rgb(0,0,0)">
Kind Regards,</div>
<div style=3D"margin-top:1em; margin-bottom:1em; font-family:Aptos,Aptos_Em=
beddedFont,Aptos_MSFontService,Calibri,Helvetica,sans-serif; font-size:12pt=
; color:rgb(0,0,0)">
Amaury</div>
<div id=3D"x_m_-5366290115774986660appendonsend"></div>
<hr style=3D"display:inline-block; width:98%">
<div id=3D"x_m_-5366290115774986660divRplyFwdMsg" dir=3D"ltr"><font face=3D=
"Calibri, sans-serif" color=3D"#000000" style=3D"font-size:11pt"><b>From:</=
b> Yoann Congal &lt;<a href=3D"mailto:yoann.congal@smile.fr" target=3D"_bla=
nk">yoann.congal@smile.fr</a>&gt;<br>
<b>Sent:</b> Wednesday, 17 June 2026 01:37<br>
<b>To:</b> Amaury Couderc &lt;amaury.couderc@est.tech&gt;; <a href=3D"mailt=
o:openembedded-core@lists.openembedded.org" target=3D"_blank">
openembedded-core@lists.openembedded.org</a> &lt;<a href=3D"mailto:openembe=
dded-core@lists.openembedded.org" target=3D"_blank">openembedded-core@lists=
.openembedded.org</a>&gt;<br>
<b>Subject:</b> Re: [PATCH v2 2/2][OE-core][scarthgap] python3: fix CVE-202=
6-7210</font>
<div>&nbsp;</div>
</div>
<div><font size=3D"2"><span style=3D"font-size:11pt">
<div>On Mon Jun 15, 2026 at 8:36 AM CEST, Amaury Couderc via <a href=3D"htt=
p://lists.openembedded.org" target=3D"_blank">
lists.openembedded.org</a> wrote:<br>
&gt; From: Amaury Couderc &lt;amaury.couderc@est.tech&gt;<br>
&gt;<br>
&gt; Backport patch to fix CVE-2026-7210.<br>
&gt;&nbsp;&nbsp; <a href=3D"https://nvd.nist.gov/vuln/detail/CVE-2026-7210"=
 target=3D"_blank">https://nvd.nist.gov/vuln/detail/CVE-2026-7210</a><br>
&gt;<br>
&gt; In order to mitigate CVE-2026-7210 this patch should come alongside <b=
r>
&gt; the associated expat one which backports to expat 2.6.4 the fixes <br>
&gt; introduced in expat 2.8.0.<br>
&gt;<br>
&gt; Upstream fixes:<br>
&gt;&nbsp;&nbsp; <a href=3D"https://github.com/python/cpython/pull/149023/c=
ommits/03794ce9a58b1f33751c88d7d876dfbf27645c56" target=3D"_blank">
https://github.com/python/cpython/pull/149023/commits/03794ce9a58b1f33751c8=
8d7d876dfbf27645c56</a><br>
&gt;&nbsp;&nbsp; <a href=3D"https://github.com/python/cpython/pull/149023/c=
ommits/ccb8d2f7df9534e49a43554193d7f5f4d993189c" target=3D"_blank">
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
&gt;&nbsp; .../python/<a href=3D"http://python3_3.12.13.bb" target=3D"_blan=
k">python3_3.12.13.bb</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp; 2 +<br>
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
&gt; +From: Stan Ulbrych &lt;<a href=3D"mailto:stan@python.org" target=3D"_=
blank">stan@python.org</a>&gt;<br>
&gt; +Date: Sun, 26 Apr 2026 19:31:25 +0100<br>
&gt; +Subject: [PATCH] Use `XML_SetHashSalt16Bytes` from libExpat when poss=
ible<br>
&gt; +<br>
&gt; +CVE: CVE-2026-7210<br>
&gt; +Upstream-Status: Backport [<a href=3D"https://github.com/python/cpyth=
on/pull/149023/commits/03794ce9a58b1f33751c88d7d876dfbf27645c56" target=3D"=
_blank">https://github.com/python/cpython/pull/149023/commits/03794ce9a58b1=
f33751c88d7d876dfbf27645c56</a>] with downstream
 extension for XML_BACKPORT_SET_HASH_SALT_16_BYTES detection<br>
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
&gt; +From: Stan Ulbrych &lt;<a href=3D"mailto:stan@python.org" target=3D"_=
blank">stan@python.org</a>&gt;<br>
&gt; +Date: Sun, 26 Apr 2026 19:42:01 +0100<br>
&gt; +Subject: [PATCH] Add `_Py_HashSecret_t.expat.hashsalt16` instead<br>
&gt; +<br>
&gt; +CVE: CVE-2026-7210<br>
&gt; +Upstream-Status: Backport [<a href=3D"https://github.com/python/cpyth=
on/pull/149023/commits/ccb8d2f7df9534e49a43554193d7f5f4d993189c" target=3D"=
_blank">https://github.com/python/cpython/pull/149023/commits/ccb8d2f7df953=
4e49a43554193d7f5f4d993189c</a>]<br>
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
&gt; diff --git a/meta/recipes-devtools/python/<a href=3D"http://python3_3.=
12.13.bb" target=3D"_blank">python3_3.12.13.bb</a> b/meta/recipes-devtools/=
python/<a href=3D"http://python3_3.12.13.bb" target=3D"_blank">python3_3.12=
.13.bb</a><br>
&gt; index 5fa25235fe..3e5575d396 100644<br>
&gt; --- a/meta/recipes-devtools/python/<a href=3D"http://python3_3.12.13.b=
b" target=3D"_blank">python3_3.12.13.bb</a><br>
&gt; +++ b/meta/recipes-devtools/python/<a href=3D"http://python3_3.12.13.b=
b" target=3D"_blank">python3_3.12.13.bb</a><br>
&gt; @@ -34,6 +34,8 @@ SRC_URI =3D &quot;<a></a><a href=3D"http://www.pytho=
n.org/ftp/python/$%7BPV%7D/Python-$%7BPV%7D.tar.xz" target=3D"_blank">http:=
//www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz</a> \<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a>file://=
0001-test_deadlock-skip-problematic-test.patch</a> \<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a>file://=
0001-test_active_children-skip-problematic-test.patch</a> \<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; <a>file://0001-test_readline-skip-limited-history-test.patch</a> \<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a>file:=
//CVE-2026-7210-1.patch</a>&nbsp;\<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a>file:=
//CVE-2026-7210-2.patch</a>&nbsp;\<br>
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
</div>
</div>
</blockquote>
</div>
<div><br clear=3D"all">
</div>
<br>
<span class=3D"x_gmail_signature_prefix">-- </span><br>
<div dir=3D"ltr" class=3D"x_gmail_signature">
<div dir=3D"ltr"><font face=3D"Raleway, regular">Yoann Congal</font>
<div><font face=3D"Raleway, regular">Smile ECS</font></div>
</div>
</div>
</div>
</div>
</body>
</html>

--_000_AMBP189MB3196D1967C16EC45E7A31C41F8F12AMBP189MB3196EURP_--

