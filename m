Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E8A1C61DE5
	for <webhook@archiver.kernel.org>; Sat, 21 Feb 2026 10:45:35 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.65.7])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16946.1771666026829811057
 for <openembedded-core@lists.openembedded.org>;
 Sat, 21 Feb 2026 01:27:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@est.tech header.s=selector1 header.b=O/5z+fLv;
 spf=pass (domain: est.tech, ip: 52.101.65.7, mailfrom: adarsh.jagadish.kamini@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dn5EDA4DsZqjttco6U1gEHBfdBoIZenjdTwKa8DS1XdTqi7d8OkxTZHych/LSKtKAkc+eJ3h6QUSFR97t75YNY5AoRt7A49KYACYdi0E54gj2Dv3+BK73/KZuhdAmzs+72R4fhhgo+yk/WR+mW4NKQXLrF4inu8wLOnlAxg5RKOMpi8KUtF+d8lpViPsHy/D8wm2T9p81Kv1R13c3X9z/X7ivBvSjFjOout3wTxSRSH8NwAxJ5bJJPiJTDSTo9Bq6tLSoMuotdsqgzZ9Gliw0hY+F6R14Y0YxXo7nwInkvPZoYtgM8aTF0fhMWAY8bShq3nWi4Vg1PoXHBk15c3EXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MGyok/YvSJHFfSQ5iQlSVo1BBpeloHB9g3AVLcVtQcE=;
 b=wikdGTijhmY9fqrlQCltvOcguIt3oILgkuccbLPBPPnYkUi8f/Vvki7hiQB2hTiTgP6s/wNDIU5A0gWMq9wWpdQ3f05CBRsAgkw9sM0bmU++82cPzGiOqZrdbtjoti2LihJb1ekPCLcZIpcsoss0gNZP0zcsCXw/VbgOqpd08Fqz6PFiyqnWZzqINSTSRFuw57wj9yw3026p4AXgHYZElZgK4pEK7B1CrcOekJIZr7yhyE/aIMbrH4i36HZRLcUzYJjQc6MwYGltHJyo5cbSk9JUCB+aQ5N+M8rVsoOKaRS2uXFQuukcuKt62jBQpxu67pBgKWLTjmFVghLUQTWocQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MGyok/YvSJHFfSQ5iQlSVo1BBpeloHB9g3AVLcVtQcE=;
 b=O/5z+fLvj3cDOS398COsqwSjbMBReemOH+GNHPuhRtV9D5cRCsQojUIyxu/Xcj8pMy3JyVYnKH/IKpPP1HuxgW4DhettH8COnV68nDI4Xw/0sW5AJ5PLx7krpmBZRTXKt6V3s+yPMNA/7/GbE8kHScU5xt+TybpyT6cKywk1tl398DYvo2tPqcsnWYz4MwU4hb3jGj4y2kWz1tUeoBmG620juv2k9dWdCNBpquC9ro+Txxn+1HkzH2qRE2M83asDAdyHK3QiodhpnYfWQOOkVLfeL0/kV9csxHazVK2LvSoI76dO+oaPXIftytWvKOsiF2IeSG0VD/z3axcUYG8Erw==
Received: from AM9P189MB1666.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:305::16)
 by DB9P189MB3525.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:5f6::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.17; Sat, 21 Feb
 2026 09:27:03 +0000
Received: from AM9P189MB1666.EURP189.PROD.OUTLOOK.COM
 ([fe80::806f:3b74:7216:3e92]) by AM9P189MB1666.EURP189.PROD.OUTLOOK.COM
 ([fe80::806f:3b74:7216:3e92%4]) with mapi id 15.20.9632.015; Sat, 21 Feb 2026
 09:27:03 +0000
From: "Adarsh Jagadish Kamini" <adarsh.jagadish.kamini@est.tech>
To: Yoann Congal <yoann.congal@smile.fr>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][scarthgap][PATCH v3] python3-pip: Backport fix CVE-2026-1703
Thread-Topic: [OE-core][scarthgap][PATCH v3] python3-pip: Backport fix
 CVE-2026-1703
Thread-Index: AQHcoA6DPJ3n+5ZsuE+Bxnt99PkASrWKngsAgAJJvZk=
Date: Sat, 21 Feb 2026 09:27:03 +0000
Message-ID: 
 <AM9P189MB16669E50DFF65DE70AE03FDFB369A@AM9P189MB1666.EURP189.PROD.OUTLOOK.COM>
References: <20260217130823.393314-1-adarsh.jagadish.kamini@est.tech>
 <DGJAK4JLFA5M.1ZGI0FMRE5T79@smile.fr>
In-Reply-To: <DGJAK4JLFA5M.1ZGI0FMRE5T79@smile.fr>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM9P189MB1666:EE_|DB9P189MB3525:EE_
x-ms-office365-filtering-correlation-id: 6807f769-3412-4b20-166d-08de712b5fd6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|366016|1800799024|376014|13003099007|38070700021|8096899003|7053199007;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?MHGK96ApuW6rSaLgICkIn2SqWE+HkhQw5Hq2QQw4hLaYceRZcwNOoubpVOnf?=
 =?us-ascii?Q?n3Spp18furKWxssX7crN5rBJ87342BTgTQs/BNKfY9LvELQ9117UreOqFhJY?=
 =?us-ascii?Q?Mynwp7bx4dLr0tD2FUQM7S2XDALlYkLfNHuaVysD1QDK1/fDHqkap/T3jY/W?=
 =?us-ascii?Q?3cQ9AqR1Eh0MfpBwyXdubpAzMqkYOcc0RxNffyqyeJlKbZ7Qksjk/bQhGRIq?=
 =?us-ascii?Q?Uqw4YPG73EnlidxXG8kMvu3Knz2mpgWeWSajF7oyb140I7HSwBVpFQCKkM+6?=
 =?us-ascii?Q?nJ0VhFi2p6wobC9CEDyCro9XU5Z3PpLpu+Con9nIxeEcRd+YNY5O87y7bs4y?=
 =?us-ascii?Q?41USlL8WNhW6C0K4zp3/woEs3JsbgmQe7M1mqypqXY9kO5jL3zN6xMw/gsJS?=
 =?us-ascii?Q?EkWURddSfcDZZyhRAss1UaWJIlRvGfzBQB+mv9S4QHBKymvQ22hUbmEmupvV?=
 =?us-ascii?Q?6Z/ESalKBO+Rs1UCE2tM9L32fuey0Q5sf6t8kSNSMY1dMge7DS8iBzQLHLSP?=
 =?us-ascii?Q?r36ziMClcxITUn7pWQF8bo1aszWOMuQiDKQHxRveixx2PVu0k6jpsTuci996?=
 =?us-ascii?Q?uhGDJkqvu0EZzjj7EXtQJ4l4rTD04XFDD9UOHaRYvXKUaZJyHxm6CPS8JY7S?=
 =?us-ascii?Q?i+kjueAhQVVGIF4K9wo7HLr8euDO3vUAxgjvJ311AoC0zY/iqniU7cP6TEeA?=
 =?us-ascii?Q?1gWOhU8Lme+c8ld4ltYGASdoLnSDOSqpQn1tSczQ1SQZVo4u4eO6fGunil9Q?=
 =?us-ascii?Q?viJe7uDDmGnM58SAMCKTQNqE7RrCBkVTXUKRm5WqgR542OFTi/FA7aMb880A?=
 =?us-ascii?Q?CInoI7+v0GNThgescpSl9Q6uarzN4FphBIdoXa6qoGwzwO3GcJ/ASY2qN7qW?=
 =?us-ascii?Q?ZMVv4T8C2K2Z+/jLZt0W9TVXNzLVAkDR6nF/XaUYaXoUSVqDcaEN/XprzjLc?=
 =?us-ascii?Q?PON+8gvnisDF6TLlOdVyQSyUCbiwVwzRymITlTj68ztkYR48Fqb/z5ejarfR?=
 =?us-ascii?Q?Mm10vR5pTpRm9lBRQgvnFEEGvp8cSyT+L50fZYaCaPdSzOyj3GABcvB2hPhO?=
 =?us-ascii?Q?IGKPcDpLkD4cFWw+iwoL3VeL1mK9p4iSNeS1cYruZGvS57ooV3+0bFi12SwJ?=
 =?us-ascii?Q?sUrosfcXK3eguC5g4zjibJ1XLkuh8BcvgB3bJUOeWnmg6HFAKmf66zPJRA1c?=
 =?us-ascii?Q?TzFccCH4thbR9ZxelZst/28kIrWV8dYGTSO0/ke4osAShUMzcuV6l3XONkLP?=
 =?us-ascii?Q?xCEtZJsJINP0T4dlza1mh7xKKOB276LF8HzvuK9F4j2gzju++2W+H5rc153e?=
 =?us-ascii?Q?eiepf73j15pk+Ms+I0RAyjpON9LESpq/5PS4MaFpQcX3eas93uVHkszYwIY+?=
 =?us-ascii?Q?gCNHp9O6a+JasiSrQYPiHtDh0TR4JQ5KZts7CUwmemY0KNJlWHq4h+wnzUmj?=
 =?us-ascii?Q?0n9Cvsfqt+fIXoke/O64lwf0JN4DYNuyWejjMy4aAsz12Gj0MFWSyI7iWZQv?=
 =?us-ascii?Q?NGkDyXArYW8q5/kLajb99q+XwUXTix3eUe9KtT8H8T384DBPeXqfvGicIMWO?=
 =?us-ascii?Q?ePkOMwykkayWMlNT04Y=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9P189MB1666.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(13003099007)(38070700021)(8096899003)(7053199007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?vBQutM3a0VPZ0VACfph52o+h0mfDPUn/3WQi2hOXSVCT31QmByOvSn5dx9Jz?=
 =?us-ascii?Q?CUqathogjnf1foNjdLhjT/gpPXi0be02nHDAXMMtBFe7KbHcZYEbHXxjOmaT?=
 =?us-ascii?Q?19wb9obtfXip/P6miOJbm/2aJQgSkHDBw5nFLadim4ve+B055dodWxHmpVHL?=
 =?us-ascii?Q?we4eRxD2CCtn6y/NgFKjbvcEKOyWk0aJFpp6VRw0OrGdEondAU3ljg/jrACK?=
 =?us-ascii?Q?vAqPjkp072WpQ/K901BdgdliMeqMY+vPLppbqGA7nYtSA4ASp/HX0XfAZzsg?=
 =?us-ascii?Q?4FEDO943oiBjYAyXIkAAuQELOZl6l8J2FRA5OpKDQXM6bCCC1zW9/yMGmqGM?=
 =?us-ascii?Q?bYMpp7rqeY0/0zxQHx2u+2mwAq/LCJsPoOz0eDlzNlgCThZyevAbOgxqYuo4?=
 =?us-ascii?Q?MCmCqmLHtRjump8TlI6g3+JFZTX4nfvc0o34nnmOuYsF00sIQ1/m2nQXI6AL?=
 =?us-ascii?Q?8sH8SWM11LHaRPenViiGun5xuODyMfvAQ3cMWWlZG25ahOL5/REB77ae5uJQ?=
 =?us-ascii?Q?gfNaVPyBVm6m0geJ9S0WhLJ/jlN3gNtaIaVExtKNnOiBT6WzUn0XTLw6M8AI?=
 =?us-ascii?Q?JStnNeLf8TBuXP5iKerd4nAT+QpwkzfutUs5EulbAmM1jX244s0xqpSrjSbM?=
 =?us-ascii?Q?90CzGyFc20x0ic+f4UmKhJSfGwLxLdMrsv2uhX0O4gth5emqPz+JfevvB+em?=
 =?us-ascii?Q?/vpzkE80t8VTfOsgW9p1jfUZZtE0Gyas5qurQ+OfBjSw7wbI96msOMD7r3cg?=
 =?us-ascii?Q?X4o8ECGaG8c3bBhF97E5ZwUa17U0d6+gvBzQ9FHl//8zNd14GDMcJPIGa8wj?=
 =?us-ascii?Q?nZxxDU35fsLbnEzY4cJ2x5s+0x5hjhjZL7oVcZo+uFA/xBRzCgJeInhzeYIj?=
 =?us-ascii?Q?F6tYJJd+kN1aKyKhIcOQgl1lekQi4fNvFCgrKJwLyXe7SuU3cq21UcSUojuO?=
 =?us-ascii?Q?iUDbM9KyEi6x47CjratiIzATxKmqzxiGtPCxxCQK767yI354Gm8KJ6pnveIo?=
 =?us-ascii?Q?XASlwh+uw0d924vU7wZ3S6IgNypD17ExW+XP564DiCCHEsohHi5exgm73STA?=
 =?us-ascii?Q?yaou0osE7g718/WJpyRgbxjQhMRmqYUZjjKVt1P297lb+AxjASrfEiSDw0BR?=
 =?us-ascii?Q?ibgAfCH7dngDZTJzlOiaf4btzQivmXpIvpgP2cuG3oXMlY0rsNQ22+f0M8Fk?=
 =?us-ascii?Q?DonYlwjaILuh7WS+p2zppxhjd1hjwN/n7u6TBDz0R+Fr3Gt0vjHIvijtiRBx?=
 =?us-ascii?Q?VqvMqPz6mAO8jEFHN1i6WO+4QuItZEEDX4S7UScghdnJOZKIvXqNSB8Iy57h?=
 =?us-ascii?Q?mRBzfK3zgkS9NwtCGOX5B61inWy15xLCp3RIS0rLQlhF78WdvjqvlgdSD4io?=
 =?us-ascii?Q?Sadvl8v3l0TxEZTxasxLGtboSOLb0iB3xitjHZAqAbpPobUIAHdXc9u0mj2j?=
 =?us-ascii?Q?4V3Dc6ig2HvAwyim3QyU3ixIB109N0V+TQQnBKaxqmihe/ASVqlWrjlnxsH9?=
 =?us-ascii?Q?TjO+71z04jZz/+AfPqaGIUiMSa7t2UFYEqxaHdV4Ow5PHZBUD+DUtiHwKovz?=
 =?us-ascii?Q?t1McR01KoP48/bU96bsTqAMjlCuwgqMrJfESLB2DGxGVrepri9sseWwhPpLc?=
 =?us-ascii?Q?WuSEjqE4oAOXoPctxAxyETIoR2fbNX5aeEOY3ruJPI8hVxqNqamxzxlg8Ia0?=
 =?us-ascii?Q?FWWPN1n0QEnm5iaVC/cUkV7WCY/WciT014xQSaJJEqZ8JIUqg5X5DTzgY1xq?=
 =?us-ascii?Q?fPEBXHUhE6Gys1frT7OWl6pfEdo+AQE=3D?=
MIME-Version: 1.0
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM9P189MB1666.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 6807f769-3412-4b20-166d-08de712b5fd6
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Feb 2026 09:27:03.8513
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1WADdR3tj1ObgB1RckxRXxC8aCgyyOyM/SnYny1g+kldjoU+vAZNs++jFFYKVOxlkO5XIE3JFe2XCPBPMidsLOchyGffvFSBHgScj4nGYJI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9P189MB3525
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_AM9P189MB16669E50DFF65DE70AE03FDFB369AAM9P189MB1666EURP_"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 21 Feb 2026 10:45:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231615

--_000_AM9P189MB16669E50DFF65DE70AE03FDFB369AAM9P189MB1666EURP_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi,
I submitted the v3 patch for whinlatter now.

Thanks!
________________________________
From: Yoann Congal <yoann.congal@smile.fr>
Sent: Thursday, February 19, 2026 23:28
To: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>; openembedded-=
core@lists.openembedded.org <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][scarthgap][PATCH v3] python3-pip: Backport fix CVE-2=
026-1703

On Tue Feb 17, 2026 at 2:08 PM CET, Adarsh Jagadish Kamini via lists.openem=
bedded.org wrote:
> From: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>
>
> Include the patch linked in the NVD report: https://github.com/pypa/pip/c=
ommit/8e227a9be4faa9594e05d02ca05a413a2a4e7735
>
> Signed-off-by: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>

Hello,

If I'm not mistaken, I'm still waiting for a v3 for whinlatter (v2 did
not apply)

Thanks!

> ---
>  .../python/python3-pip/CVE-2026-1703.patch    | 55 +++++++++++++++++++
>  .../python/python3-pip_24.0.bb                |  4 +-
>  2 files changed, 58 insertions(+), 1 deletion(-)
>  create mode 100644 meta/recipes-devtools/python/python3-pip/CVE-2026-170=
3.patch
>
> diff --git a/meta/recipes-devtools/python/python3-pip/CVE-2026-1703.patch=
 b/meta/recipes-devtools/python/python3-pip/CVE-2026-1703.patch
> new file mode 100644
> index 0000000000..a30475319c
> --- /dev/null
> +++ b/meta/recipes-devtools/python/python3-pip/CVE-2026-1703.patch
> @@ -0,0 +1,55 @@
> +From 2a89ce91220e50c1b667bd9d5075e1fd10c1fed2 Mon Sep 17 00:00:00 2001
> +From: Damian Shaw <damian.peter.shaw@gmail.com>
> +Date: Fri, 30 Jan 2026 16:27:57 -0500
> +Subject: [PATCH v3] Merge pull request #13777 from sethmlarson/commonpat=
h
> +
> +Use os.path.commonpath() instead of commonprefix()
> +
> +CVE: CVE-2026-1703
> +
> +Upstream-Status: Backport [https://github.com/pypa/pip/commit/8e227a9be4=
faa9594e05d02ca05a413a2a4e7735]
> +
> +Signed-off-by: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>
> +---
> + news/+1ee322a1.bugfix.rst            | 1 +
> + src/pip/_internal/utils/unpacking.py | 2 +-
> + tests/unit/test_utils_unpacking.py   | 2 ++
> + 3 files changed, 4 insertions(+), 1 deletion(-)
> + create mode 100644 news/+1ee322a1.bugfix.rst
> +
> +diff --git a/news/+1ee322a1.bugfix.rst b/news/+1ee322a1.bugfix.rst
> +new file mode 100644
> +index 000000000..edb1b320c
> +--- /dev/null
> ++++ b/news/+1ee322a1.bugfix.rst
> +@@ -0,0 +1 @@
> ++Use a path-segment prefix comparison, not char-by-char.
> +diff --git a/src/pip/_internal/utils/unpacking.py b/src/pip/_internal/ut=
ils/unpacking.py
> +index 78b5c13ce..0b26525fb 100644
> +--- a/src/pip/_internal/utils/unpacking.py
> ++++ b/src/pip/_internal/utils/unpacking.py
> +@@ -81,7 +81,7 @@ def is_within_directory(directory: str, target: str) -=
> bool:
> +     abs_directory =3D os.path.abspath(directory)
> +     abs_target =3D os.path.abspath(target)
> +
> +-    prefix =3D os.path.commonprefix([abs_directory, abs_target])
> ++    prefix =3D os.path.commonpath([abs_directory, abs_target])
> +     return prefix =3D=3D abs_directory
> +
> +
> +diff --git a/tests/unit/test_utils_unpacking.py b/tests/unit/test_utils_=
unpacking.py
> +index 1f0b59dbd..724ca0be8 100644
> +--- a/tests/unit/test_utils_unpacking.py
> ++++ b/tests/unit/test_utils_unpacking.py
> +@@ -202,6 +202,8 @@ def test_unpack_tar_unicode(tmpdir: Path) -> None:
> +         (("parent/", "parent/sub"), True),
> +         # Test target outside parent
> +         (("parent/", "parent/../sub"), False),
> ++        # Test target sub-string of parent
> ++        (("parent/child", "parent/childfoo"), False),
> +     ],
> + )
> + def test_is_within_directory(args: Tuple[str, str], expected: bool) -> =
None:
> +--
> +2.44.4
> +
> diff --git a/meta/recipes-devtools/python/python3-pip_24.0.bb b/meta/reci=
pes-devtools/python/python3-pip_24.0.bb
> index be4a29500a..35428260c3 100644
> --- a/meta/recipes-devtools/python/python3-pip_24.0.bb
> +++ b/meta/recipes-devtools/python/python3-pip_24.0.bb
> @@ -31,7 +31,9 @@ LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3D63ec52ba=
f95163b597008bb46db68030 \
>
>  inherit pypi python_setuptools_build_meta
>
> -SRC_URI +=3D "file://no_shebang_mangling.patch"
> +SRC_URI +=3D "file://no_shebang_mangling.patch \
> +            file://CVE-2026-1703.patch \
> +            "
>
>  SRC_URI[sha256sum] =3D "ea9bd1a847e8c5774a5777bb398c19e80bcd4e2aa16a4b30=
1b718fe6f593aba2"
>


--
Yoann Congal
Smile ECS


--_000_AM9P189MB16669E50DFF65DE70AE03FDFB369AAM9P189MB1666EURP_
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
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
Hi,</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
I submitted the v3 patch for whinlatter now.</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
Thanks!</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Yoann Congal &lt;yoan=
n.congal@smile.fr&gt;<br>
<b>Sent:</b> Thursday, February 19, 2026 23:28<br>
<b>To:</b> Adarsh Jagadish Kamini &lt;adarsh.jagadish.kamini@est.tech&gt;; =
openembedded-core@lists.openembedded.org &lt;openembedded-core@lists.openem=
bedded.org&gt;<br>
<b>Subject:</b> Re: [OE-core][scarthgap][PATCH v3] python3-pip: Backport fi=
x CVE-2026-1703</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">On Tue Feb 17, 2026 at 2:08 PM CET, Adarsh Jagadis=
h Kamini via lists.openembedded.org wrote:<br>
&gt; From: Adarsh Jagadish Kamini &lt;adarsh.jagadish.kamini@est.tech&gt;<b=
r>
&gt;<br>
&gt; Include the patch linked in the NVD report: <a href=3D"https://github.=
com/pypa/pip/commit/8e227a9be4faa9594e05d02ca05a413a2a4e7735">
https://github.com/pypa/pip/commit/8e227a9be4faa9594e05d02ca05a413a2a4e7735=
</a><br>
&gt;<br>
&gt; Signed-off-by: Adarsh Jagadish Kamini &lt;adarsh.jagadish.kamini@est.t=
ech&gt;<br>
<br>
Hello,<br>
<br>
If I'm not mistaken, I'm still waiting for a v3 for whinlatter (v2 did<br>
not apply)<br>
<br>
Thanks!<br>
<br>
&gt; ---<br>
&gt;&nbsp; .../python/python3-pip/CVE-2026-1703.patch&nbsp;&nbsp;&nbsp; | 5=
5 +++++++++++++++++++<br>
&gt;&nbsp; .../python/python3-pip_24.0.bb&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp; 4 +-<br>
&gt;&nbsp; 2 files changed, 58 insertions(+), 1 deletion(-)<br>
&gt;&nbsp; create mode 100644 meta/recipes-devtools/python/python3-pip/CVE-=
2026-1703.patch<br>
&gt;<br>
&gt; diff --git a/meta/recipes-devtools/python/python3-pip/CVE-2026-1703.pa=
tch b/meta/recipes-devtools/python/python3-pip/CVE-2026-1703.patch<br>
&gt; new file mode 100644<br>
&gt; index 0000000000..a30475319c<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta/recipes-devtools/python/python3-pip/CVE-2026-1703.patch<br>
&gt; @@ -0,0 +1,55 @@<br>
&gt; +From 2a89ce91220e50c1b667bd9d5075e1fd10c1fed2 Mon Sep 17 00:00:00 200=
1<br>
&gt; +From: Damian Shaw &lt;damian.peter.shaw@gmail.com&gt;<br>
&gt; +Date: Fri, 30 Jan 2026 16:27:57 -0500<br>
&gt; +Subject: [PATCH v3] Merge pull request #13777 from sethmlarson/common=
path<br>
&gt; +<br>
&gt; +Use os.path.commonpath() instead of commonprefix()<br>
&gt; +<br>
&gt; +CVE: CVE-2026-1703<br>
&gt; +<br>
&gt; +Upstream-Status: Backport [<a href=3D"https://github.com/pypa/pip/com=
mit/8e227a9be4faa9594e05d02ca05a413a2a4e7735">https://github.com/pypa/pip/c=
ommit/8e227a9be4faa9594e05d02ca05a413a2a4e7735</a>]<br>
&gt; +<br>
&gt; +Signed-off-by: Adarsh Jagadish Kamini &lt;adarsh.jagadish.kamini@est.=
tech&gt;<br>
&gt; +---<br>
&gt; + news/+1ee322a1.bugfix.rst&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; | 1 +<br>
&gt; + src/pip/_internal/utils/unpacking.py | 2 +-<br>
&gt; + tests/unit/test_utils_unpacking.py&nbsp;&nbsp; | 2 ++<br>
&gt; + 3 files changed, 4 insertions(+), 1 deletion(-)<br>
&gt; + create mode 100644 news/+1ee322a1.bugfix.rst<br>
&gt; +<br>
&gt; +diff --git a/news/+1ee322a1.bugfix.rst b/news/+1ee322a1.bugfix.rst<br=
>
&gt; +new file mode 100644<br>
&gt; +index 000000000..edb1b320c<br>
&gt; +--- /dev/null<br>
&gt; ++++ b/news/+1ee322a1.bugfix.rst<br>
&gt; +@@ -0,0 +1 @@<br>
&gt; ++Use a path-segment prefix comparison, not char-by-char.<br>
&gt; +diff --git a/src/pip/_internal/utils/unpacking.py b/src/pip/_internal=
/utils/unpacking.py<br>
&gt; +index 78b5c13ce..0b26525fb 100644<br>
&gt; +--- a/src/pip/_internal/utils/unpacking.py<br>
&gt; ++++ b/src/pip/_internal/utils/unpacking.py<br>
&gt; +@@ -81,7 +81,7 @@ def is_within_directory(directory: str, target: str=
) -&gt; bool:<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; abs_directory =3D os.path.abspath(directory)=
<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; abs_target =3D os.path.abspath(target)<br>
&gt; + <br>
&gt; +-&nbsp;&nbsp;&nbsp; prefix =3D os.path.commonprefix([abs_directory, a=
bs_target])<br>
&gt; ++&nbsp;&nbsp;&nbsp; prefix =3D os.path.commonpath([abs_directory, abs=
_target])<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; return prefix =3D=3D abs_directory<br>
&gt; + <br>
&gt; + <br>
&gt; +diff --git a/tests/unit/test_utils_unpacking.py b/tests/unit/test_uti=
ls_unpacking.py<br>
&gt; +index 1f0b59dbd..724ca0be8 100644<br>
&gt; +--- a/tests/unit/test_utils_unpacking.py<br>
&gt; ++++ b/tests/unit/test_utils_unpacking.py<br>
&gt; +@@ -202,6 +202,8 @@ def test_unpack_tar_unicode(tmpdir: Path) -&gt; N=
one:<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ((&quot;parent/&quot=
;, &quot;parent/sub&quot;), True),<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; # Test target outsid=
e parent<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ((&quot;parent/&quot=
;, &quot;parent/../sub&quot;), False),<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; # Test target sub-string =
of parent<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ((&quot;parent/child&quot=
;, &quot;parent/childfoo&quot;), False),<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; ],<br>
&gt; + )<br>
&gt; + def test_is_within_directory(args: Tuple[str, str], expected: bool) =
-&gt; None:<br>
&gt; +-- <br>
&gt; +2.44.4<br>
&gt; +<br>
&gt; diff --git a/meta/recipes-devtools/python/python3-pip_24.0.bb b/meta/r=
ecipes-devtools/python/python3-pip_24.0.bb<br>
&gt; index be4a29500a..35428260c3 100644<br>
&gt; --- a/meta/recipes-devtools/python/python3-pip_24.0.bb<br>
&gt; +++ b/meta/recipes-devtools/python/python3-pip_24.0.bb<br>
&gt; @@ -31,7 +31,9 @@ LIC_FILES_CHKSUM =3D &quot;<a href=3D""></a>file://L=
ICENSE.txt;md5=3D63ec52baf95163b597008bb46db68030 \<br>
&gt;&nbsp; <br>
&gt;&nbsp; inherit pypi python_setuptools_build_meta<br>
&gt;&nbsp; <br>
&gt; -SRC_URI +=3D &quot;<a href=3D"file://no_shebang_mangling.patch">file:=
//no_shebang_mangling.patch</a>&quot;<br>
&gt; +SRC_URI +=3D &quot;<a href=3D""></a>file://no_shebang_mangling.patch =
\<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a=
 href=3D"file://CVE-2026-1703.patch">file://CVE-2026-1703.patch</a> \<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &q=
uot;<br>
&gt;&nbsp; <br>
&gt;&nbsp; SRC_URI[sha256sum] =3D &quot;ea9bd1a847e8c5774a5777bb398c19e80bc=
d4e2aa16a4b301b718fe6f593aba2&quot;<br>
&gt;&nbsp; <br>
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

--_000_AM9P189MB16669E50DFF65DE70AE03FDFB369AAM9P189MB1666EURP_--

