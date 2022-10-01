Return-Path: <virendra.thakur@kpit.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D8B3C433FE
	for <webhook@archiver.kernel.org>; Sat,  1 Oct 2022 05:52:46 +0000 (UTC)
Received: from IND01-BMX-obe.outbound.protection.outlook.com
 (IND01-BMX-obe.outbound.protection.outlook.com [40.107.239.66])
 by mx.groups.io with SMTP id smtpd.web10.3409.1664603559674618480
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 Sep 2022 22:52:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kpit.com header.s=selector1 header.b=sa4x4gWI;
 spf=pass (domain: kpit.com, ip: 40.107.239.66,
 mailfrom: virendra.thakur@kpit.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D+fc5jT7gQyC3WonIB8rhi7yaoV0oIVmIpskWEEChXO7yZs5SpmV5ZX0UfrQ8VqErZQSavP2yuGwRaQE5GcuYkPO6MAdjaGMMb7ulmkhCJ6Yv9VcqSEoYK/E019/ZY0zReq91vQJa0xUOyEw9sclTfqPm6V/vXJ6N9Hc/IzhXb+lQYMeL33ySRSmA7SATRGLX8bNAgivL96l8AmkdA5tu/qsH2jO8AleGLzKQGKTz7EBiLA/sdcheoPsAALfR7fUsiRUUo0qFQlO8XWNyKQ2Yg+8EBtJinPwXbtCBo7LzeVrHWaSmf3oXJwVo5gkQVEivkyS0OrwAmLPynhaBphT1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=34ilVgCK6AZo94TYPSz/oW/QfhA5ROzjdgnU+8OBjLE=;
 b=XFkrriWwUB9AH1IszAv7l86fyREsXqsp3iCvZLU8/VPFnv2YqMYxazIW/UD+wys5YKhHZfcNl4RCYcZdjHOlCI1eMj90yrS7PaigD17Dv04ky/5GNbbCAvlgsgkd9JyM78JgU2JiTFWYtb80np7kewQ6nuhaiZy1AALzota8jt/g0BZG6flSA/mC9Ggxa73IoYhRO8e2j9ScA4Kr4VmGtupjXw1sTlWQWq73LMSEQ3LxsKBAYtWEgSqGDCgNZ5FbDG0Oa0A7IQ4MYHg6jHAp1R1HlCmkS2OgER+MitkTKjFZMsBjN44xlWldYt2XkDWPj0Xh1w6wKRZBl4n09Zw5JQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kpit.com; dmarc=pass action=none header.from=kpit.com;
 dkim=pass header.d=kpit.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kpit.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=34ilVgCK6AZo94TYPSz/oW/QfhA5ROzjdgnU+8OBjLE=;
 b=sa4x4gWIBr5q0tUproUcet6sIXOOBqKPFDv6+mjHvaP2Jp8c9lP6p5tr8ds5v/kGJkjQg3SPgiE0p0p6zVM4P8HhrFkfLamR7yzt892jxm+Jl/kwmOppa172iFtG720stLbDkZbv9bD4Dclxe/FbjQw/WkM/FP5E4RXPKS59zXA=
Received: from MAXPR01MB4327.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a01:3::12)
 by PN3PR01MB6824.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:a7::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.17; Sat, 1 Oct
 2022 05:52:34 +0000
Received: from MAXPR01MB4327.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::2427:1977:88:b63b]) by MAXPR01MB4327.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::2427:1977:88:b63b%4]) with mapi id 15.20.5676.023; Sat, 1 Oct 2022
 05:52:33 +0000
From: Virendra Kumar Thakur <Virendra.Thakur@kpit.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, Virendra Kumar Thakur
	<Virendra.Thakur@kpit.com>
CC: "steve@sakoman.com" <steve@sakoman.com>
Subject: Re: [OE-Core][kirkstone][PATCH] qemu: Fix CVE-2021-3750 for qemu
Thread-Topic: [OE-Core][kirkstone][PATCH] qemu: Fix CVE-2021-3750 for qemu
Thread-Index: AQHY1VnJc/cvVveQDUOeemfBtqZUQa35CQPs
Date: Sat, 1 Oct 2022 05:52:33 +0000
Message-ID: 
 <MAXPR01MB43275C9203484CFC733FFA929D599@MAXPR01MB4327.INDPRD01.PROD.OUTLOOK.COM>
References: <1719DC05CA23710A.18826@lists.openembedded.org>
In-Reply-To: <1719DC05CA23710A.18826@lists.openembedded.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=kpit.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MAXPR01MB4327:EE_|PN3PR01MB6824:EE_
x-ms-office365-filtering-correlation-id: 05ca8a92-f297-48c9-51b9-08daa37122ec
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 qhlGbLCpfHjlmVMfNeWe70Tb87URlaJGKex18NmI7aWHpyQ1AjivTsY/35pThinsQn5UJimP9m6Zw50SCDUyzTpc46xIL55nXiH+LFqm0E22d3DLJ32XCOw3CjUDHnAcX7m7BRT/yWXRQ+9waJ+lF+6/erNsnXC/tCLaO8crzXdYAlKz4w86QIR3pNbmEUTuj0Oo4J0eM/kuSeUz4TjRCFz1VFgP/DaK5dkj8w9p6PIvdw+rBxFWW1BtO87taa8FdSMupoC9E/xuCelH/v0siPzK5/IO/R/njccw+X+plrYy1FNtTN7BvbcVp9zPA9p+kYPgL/O2kDJpVk+slI3a91KNS0LVw57DPPJdWdnVO0ho/dRcQOuUVc9IQw+bmg4b1jjatMoeeHrU5neIjrGpNgMie0pizwZXsZkjKyNCpiCuumbdPqJ15UIbC6oAr+eTXMVPIzzdw6MSm3EbU8Alnq5D4S91V106EwDPaiNSfUsbm7XvkI0fX/FWnRkLhylx9fl5ugUGEqvs/eUwxAYyZkZAJlum/lyvG3DOm+avJx0hr/dPVbWSP8OouLf8BxmlfBsW2qWHyL325RiGBuaX7CUc/7XJkfZEu5dGWgvM41k1/vV4L0kj8fczCHyzXOTe5JBXlBMm/0DW8ZGOHEs7Mt0dG64BnMj6HnnalKjknni5od6AL6gLfDiTfskQefzxTn9JSJ/if9AwazZhEEyISKy8RQUFMHU1qCaXycjzZP7VgMNLfx1jrikGkAO3DRe0Xhl8aLmEaD+JUHPHzb758n2BpUjM2iedOyeQ1qNVDvo1Kz2WF557OYRDnjA9C7PZ6Cq1n3P8BrrthgZsk5Z2+RgK4fqCZhDIi5u8dSpN+L8=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MAXPR01MB4327.INDPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(376002)(346002)(396003)(136003)(366004)(451199015)(9686003)(55236004)(26005)(19627405001)(38100700002)(33656002)(122000001)(166002)(91956017)(45080400002)(99936003)(55016003)(86362001)(18265965005)(71200400001)(64756008)(66574015)(478600001)(66446008)(186003)(41300700001)(38070700005)(8936002)(316002)(83380400001)(5660300002)(110136005)(2906002)(52536014)(7696005)(6506007)(30864003)(66476007)(4326008)(76116006)(66946007)(8676002)(66556008)(21314003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?f3HQOvCL8x2BWaNBHa8foaZ6XSUdIpZlA9FB6wDbJ8z7jmgtsdF9EpfrXV?=
 =?iso-8859-1?Q?yA6wMAk6FQSRNtOxfNYQSng1gWeaYRsnoNyFf1GZDjSYhUkCPGTG+srYBj?=
 =?iso-8859-1?Q?XPr0DM7BUJUh7ZFAGfSUaaWUczYkjYaIbJx8yBK70/bWuYcl3dtuI+Fzix?=
 =?iso-8859-1?Q?VivGHK9X1nOPGwCOOiQyjVyhEkE7ewueMdHZ14zhtHTmC+KBtzWzZyNZ9H?=
 =?iso-8859-1?Q?9BOMjTYDr2iDe4TCCD7OlEyB9gG1f1N8NYl84V9BjTGOPIkqpPeYTuyGv/?=
 =?iso-8859-1?Q?uGHnbGQVVRHG36GWjchXdMeS3+x4RjabciuxWCHnC3RKPJQIgayx7SN3Vx?=
 =?iso-8859-1?Q?2+Nf5DlcAEeTuGFiuOh72Ie6o3zU2bSooJSPCjKIGV3g0BiMAfdttofTZq?=
 =?iso-8859-1?Q?Fkfd5YKNP/a6nt5TEGWYev0UUsqAyRmRqf6NdH4Ckh5FUC8QVfVOSpvxAb?=
 =?iso-8859-1?Q?EBRccZB195SLqxadYGuTG62LiXTd3LsjEd3/naPs1qNhukF4OIGxbxOWIp?=
 =?iso-8859-1?Q?LaNgopGzeM3p9yz71GYodS2K8EOxINMFBwasHnZMpQf7O5uge0okOZxXml?=
 =?iso-8859-1?Q?qvMhAaee2w5nT9ZvOHAx5DYWRgrNXe0aJtIKG+qZ0cMyqFh2dhRjiYQSs7?=
 =?iso-8859-1?Q?jZyeeeo99lKfLGkiqZFqJ4IV8wDZW2euBw9GlOsHXlw8YlvkFdAC5XC8Gj?=
 =?iso-8859-1?Q?cHp649Z24uvSbI5p2swZclJ866y+jM9uX6wscT+e2iVFpYqQ/SjMYspUH/?=
 =?iso-8859-1?Q?so2N2JRPQAPke1wW9SUY7K0jp8A8F5sJaoaAKeLOuAE53kpPS0kEWxYxol?=
 =?iso-8859-1?Q?g/sIkil+xFm1WLSTjDY5TvN/XB4ZylxuU3wy7HbmwDwio8rjcOm4grS8z+?=
 =?iso-8859-1?Q?yysgyWEv6xhNFEO1TY8dNCy56FgIvhV4ky8HcaBeIqxWdyTjmu5aWt5H94?=
 =?iso-8859-1?Q?2g4qdYeWGTrpoc4tnjBOCgC8qNtI6sRe8rrea5RemAGxUdw4c0TUzJlV3N?=
 =?iso-8859-1?Q?O8AYlD2jjZYkxGQJVx3kWESior5qX+M2fDp1s4PZT1iBRWEN5EdfigG3Y6?=
 =?iso-8859-1?Q?LCDKS3PHu2LDpkrHZusJm0f7GJ4M/+bt2jxSfabgET/rpeRcRnHemImUhR?=
 =?iso-8859-1?Q?zQnLm1J4VX880OmYJYRpVZCzKq8g6aE9oNkFVGZW3BcODc0xk9/ZFJ33O2?=
 =?iso-8859-1?Q?cu1DZ3dDpEzvuOnphbCJHYFJLu7dQ0TXh6yxDOcnprYOORxLMx9fnoxgbZ?=
 =?iso-8859-1?Q?TAsqNrlhzHKNpAPB1NpeX7sf8zITRDG+oiBoWrOqRE/QkjNFKoZRJ5ns50?=
 =?iso-8859-1?Q?iu4PxzAoWYOkul4cucmzU98vDUZUPKOI4iPj3LHzCjwg91YUBrkxRybfeY?=
 =?iso-8859-1?Q?QpUhOuMZv4ZsXcSWDG2aAoOUQJXTVhqX2X6obCMZzKzazhVWeI8Egq/fwa?=
 =?iso-8859-1?Q?cpkXdBHzxmjcdaeYvFKftBATJf01jimt/iaQaMDIIBjIDxu4bSPJBjVRtO?=
 =?iso-8859-1?Q?rWs3n9o7RfxpIcOr7+FEkBDEcG7dgDsMVBXpZrcs8csYQDnE74SfxR/K8y?=
 =?iso-8859-1?Q?1Rk8GAvL9zYR3BdDVxJFTS2Urg2V0AjP/w8e3awgcmnpx56dOiNORK3q94?=
 =?iso-8859-1?Q?wnw8MrgK6Gq0w=3D?=
Content-Type: multipart/mixed;
	boundary="_004_MAXPR01MB43275C9203484CFC733FFA929D599MAXPR01MB4327INDP_"
MIME-Version: 1.0
X-OriginatorOrg: kpit.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MAXPR01MB4327.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 05ca8a92-f297-48c9-51b9-08daa37122ec
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Oct 2022 05:52:33.8578
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3539451e-b46e-4a26-a242-ff61502855c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 dDxe60+OxuJXTpgYok3JYjSWlezH/nJWE0fVwqdUoRTBIxolBtgh+5uBhpJcN0CTNY/ralVfMJax7ESe3mIsMw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN3PR01MB6824
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 01 Oct 2022 05:52:46 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171249

--_004_MAXPR01MB43275C9203484CFC733FFA929D599MAXPR01MB4327INDP_
Content-Type: multipart/alternative;
	boundary="_000_MAXPR01MB43275C9203484CFC733FFA929D599MAXPR01MB4327INDP_"

--_000_MAXPR01MB43275C9203484CFC733FFA929D599MAXPR01MB4327INDP_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Attached patch file also.
________________________________
From: openembedded-core@lists.openembedded.org <openembedded-core@lists.ope=
nembedded.org> on behalf of Virendra Thakur via lists.openembedded.org <vir=
endra.thakur=3Dkpit.com@lists.openembedded.org>
Sent: Saturday, October 1, 2022 11:20 AM
To: openembedded-core@lists.openembedded.org <openembedded-core@lists.opene=
mbedded.org>
Cc: steve@sakoman.com <steve@sakoman.com>
Subject: [OE-Core][kirkstone][PATCH] qemu: Fix CVE-2021-3750 for qemu

Caution: This email originated from outside of the KPIT. Do not click links=
 or open attachments unless you recognize the sender and know the content i=
s safe.

Add patch to fix CVE-2021-3750

Signed-off-by: Virendra Thakur <virendra.thakur@kpit.com>
---
 meta/recipes-devtools/qemu/qemu.inc           |   3 +
 .../qemu/qemu/CVE-2021-3750-1.patch           |  59 +++++++
 .../qemu/qemu/CVE-2021-3750-2.patch           |  65 ++++++++
 .../qemu/qemu/CVE-2021-3750-3.patch           | 156 ++++++++++++++++++
 4 files changed, 283 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2021-3750-1.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2021-3750-2.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2021-3750-3.patch

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qe=
mu/qemu.inc
index a493ac8add..816f9a7eac 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -43,6 +43,9 @@ SRC_URI =3D "https://apc01.safelinks.protection.outlook.c=
om/?url=3Dhttps%3A%2F%2Fdownload.qemu.org%2F%24&amp;data=3D05%7C01%7Cvirend=
ra.thakur%40kpit.com%7Ca0b284fe19a44c82e83708daa370e956%7C3539451eb46e4a26a=
242ff61502855c7%7C0%7C0%7C638002002616918239%7CUnknown%7CTWFpbGZsb3d8eyJWIj=
oiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7=
C&amp;sdata=3DQVDwSHyy12MaO5HE89G3XFl%2BlGS0TnVbNFue8cEl5C8%3D&amp;reserved=
=3D0{BPN}-${PV}.tar.xz \
            file://CVE-2022-0358.patch \
            file://CVE-2022-0216_1.patch \
            file://CVE-2022-0216_2.patch \
+           file://CVE-2021-3750-1.patch \
+           file://CVE-2021-3750-2.patch \
+           file://CVE-2021-3750-3.patch \
            "
 UPSTREAM_CHECK_REGEX =3D "qemu-(?P<pver>\d+(\.\d+)+)\.tar"

diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2021-3750-1.patch b/meta/r=
ecipes-devtools/qemu/qemu/CVE-2021-3750-1.patch
new file mode 100644
index 0000000000..db908874b6
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2021-3750-1.patch
@@ -0,0 +1,59 @@
+From b9d383ab797f54ae5fa8746117770709921dc529 Mon Sep 17 00:00:00 2001
+From: =3D?utf8?q?Philippe=3D20Mathieu-Daud=3DC3=3DA9?=3D <philmd@redhat.co=
m>
+Date: Wed, 15 Dec 2021 19:24:19 +0100
+Subject: [PATCH] hw/intc/arm_gicv3: Check for !MEMTX_OK instead of MEMTX_E=
RROR
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3Dutf8
+Content-Transfer-Encoding: 8bit
+
+Quoting Peter Maydell:
+
+ "These MEMTX_* aren't from the memory transaction
+  API functions; they're just being used by gicd_readl() and
+  friends as a way to indicate a success/failure so that the
+  actual MemoryRegionOps read/write fns like gicv3_dist_read()
+  can log a guest error."
+
+We are going to introduce more MemTxResult bits, so it is
+safer to check for !MEMTX_OK rather than MEMTX_ERROR.
+
+Reviewed-by: Peter Xu <peterx@redhat.com>
+Reviewed-by: David Hildenbrand <david@redhat.com>
+Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
+Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
+Signed-off-by: Philippe Mathieu-Daud=C3f=C2=A9 <philmd@redhat.com>
+Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
+Signed-off-by: Virendra Thakur <virendra.thakur@kpit.com>
+
+CVE: CVE-2021-3750
+
+Upstream-Status: Backport [https://apc01.safelinks.protection.outlook.com/=
?url=3Dhttps%3A%2F%2Fgit.qemu.org%2F%3Fp%3Dqemu.git%3Ba%3Dcommit%3Bh%3Db9d3=
83ab797f54ae5fa8746117770709921dc529&amp;data=3D05%7C01%7Cvirendra.thakur%4=
0kpit.com%7Ca0b284fe19a44c82e83708daa370e956%7C3539451eb46e4a26a242ff615028=
55c7%7C0%7C0%7C638002002616918239%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwM=
DAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=
=3D%2F5qLB4ry00kujvgdAPmZcSX3dfUQiDBTKXg2GYQHLQg%3D&amp;reserved=3D0]
+---
+ hw/intc/arm_gicv3_redist.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/hw/intc/arm_gicv3_redist.c b/hw/intc/arm_gicv3_redist.c
+index c8ff3ec..99b11ca 100644
+--- a/hw/intc/arm_gicv3_redist.c
++++ b/hw/intc/arm_gicv3_redist.c
+@@ -462,7 +462,7 @@ MemTxResult gicv3_redist_read(void *opaque, hwaddr off=
set, uint64_t *data,
+         break;
+     }
+
+-    if (r =3D=3D MEMTX_ERROR) {
++    if (r !=3D MEMTX_OK) {
+         qemu_log_mask(LOG_GUEST_ERROR,
+                       "%s: invalid guest read at offset " TARGET_FMT_plx
+                       " size %u\n", __func__, offset, size);
+@@ -521,7 +521,7 @@ MemTxResult gicv3_redist_write(void *opaque, hwaddr of=
fset, uint64_t data,
+         break;
+     }
+
+-    if (r =3D=3D MEMTX_ERROR) {
++    if (r !=3D MEMTX_OK) {
+         qemu_log_mask(LOG_GUEST_ERROR,
+                       "%s: invalid guest write at offset " TARGET_FMT_plx
+                       " size %u\n", __func__, offset, size);
+--
+1.8.3.1
+
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2021-3750-2.patch b/meta/r=
ecipes-devtools/qemu/qemu/CVE-2021-3750-2.patch
new file mode 100644
index 0000000000..1ce32089a8
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2021-3750-2.patch
@@ -0,0 +1,65 @@
+From 58e74682baf4e1ad26b064d8c02e5bc99c75c5d9 Mon Sep 17 00:00:00 2001
+From: =3D?utf8?q?Philippe=3D20Mathieu-Daud=3DC3=3DA9?=3D <philmd@redhat.co=
m>
+Date: Wed, 15 Dec 2021 19:24:20 +0100
+Subject: [PATCH] softmmu/physmem: Simplify flatview_write and
+ address_space_access_valid
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3Dutf8
+Content-Transfer-Encoding: 8bit
+
+Remove unuseful local 'result' variables.
+
+Reviewed-by: Peter Xu <peterx@redhat.com>
+Reviewed-by: David Hildenbrand <david@redhat.com>
+Reviewed-by: Alexander Bulekov <alxndr@bu.edu>
+Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
+Signed-off-by: Philippe Mathieu-Daud=C3f=C2=A9 <philmd@redhat.com>
+Message-Id: <20211215182421.418374-3-philmd@redhat.com>
+Signed-off-by: Thomas Huth <thuth@redhat.com>
+Signed-off-by: Virendra Thakur <virendra.thakur@kpit.com>
+
+CVE: CVE-2021-3750
+
+Upstream-Status: Backport [https://apc01.safelinks.protection.outlook.com/=
?url=3Dhttps%3A%2F%2Fgit.qemu.org%2F%3Fp%3Dqemu.git%3Ba%3Dcommit%3Bh%3D58e7=
4682baf4e1ad26b064d8c02e5bc99c75c5d9&amp;data=3D05%7C01%7Cvirendra.thakur%4=
0kpit.com%7Ca0b284fe19a44c82e83708daa370e956%7C3539451eb46e4a26a242ff615028=
55c7%7C0%7C0%7C638002002616918239%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwM=
DAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=
=3De89z0JI%2F06n8FrOneQNuXOg2Jo0ckdVqeqCAgMg5JvQ%3D&amp;reserved=3D0]
+---
+ softmmu/physmem.c | 11 +++--------
+ 1 file changed, 3 insertions(+), 8 deletions(-)
+
+diff --git a/softmmu/physmem.c b/softmmu/physmem.c
+index 43ae70f..3d968ca 100644
+--- a/softmmu/physmem.c
++++ b/softmmu/physmem.c
+@@ -2826,14 +2826,11 @@ static MemTxResult flatview_write(FlatVi
+     hwaddr l;
+     hwaddr addr1;
+     MemoryRegion *mr;
+-    MemTxResult result =3D MEMTX_OK;
+
+     l =3D len;
+     mr =3D flatview_translate(fv, addr, &addr1, &l, true, attrs);
+-    result =3D flatview_write_continue(fv, addr, attrs, buf, len,
+-                                     addr1, l, mr);
+-
+-    return result;
++    return flatview_write_continue(fv, addr, attrs, buf, len,
++                                   addr1, l, mr);
+ }
+
+ /* Called within RCU critical section.  */
+@@ -3130,12 +3127,10 @@ bool address_space_access_valid(AddressS
+                                 MemTxAttrs attrs)
+ {
+     FlatView *fv;
+-    bool result;
+
+     RCU_READ_LOCK_GUARD();
+     fv =3D address_space_to_flatview(as);
+-    result =3D flatview_access_valid(fv, addr, len, is_write, attrs);
+-    return result;
++    return flatview_access_valid(fv, addr, len, is_write, attrs);
+ }
+
+ static hwaddr
+--
+1.8.3.1
+
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2021-3750-3.patch b/meta/r=
ecipes-devtools/qemu/qemu/CVE-2021-3750-3.patch
new file mode 100644
index 0000000000..703646365f
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2021-3750-3.patch
@@ -0,0 +1,156 @@
+From 3ab6fdc91b72e156da22848f0003ff4225690ced Mon Sep 17 00:00:00 2001
+From: =3D?utf8?q?Philippe=3D20Mathieu-Daud=3DC3=3DA9?=3D <philmd@redhat.co=
m>
+Date: Wed, 15 Dec 2021 19:24:21 +0100
+Subject: [PATCH] softmmu/physmem: Introduce MemTxAttrs::memory field and
+ MEMTX_ACCESS_ERROR
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3Dutf8
+Content-Transfer-Encoding: 8bit
+
+Add the 'memory' bit to the memory attributes to restrict bus
+controller accesses to memories.
+
+Introduce flatview_access_allowed() to check bus permission
+before running any bus transaction.
+
+Have read/write accessors return MEMTX_ACCESS_ERROR if an access is
+restricted.
+
+There is no change for the default case where 'memory' is not set.
+
+Signed-off-by: Philippe Mathieu-Daud=C3f=C2=A9 <philmd@redhat.com>
+Message-Id: <20211215182421.418374-4-philmd@redhat.com>
+Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
+Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
+[thuth: Replaced MEMTX_BUS_ERROR with MEMTX_ACCESS_ERROR, remove "inline"]
+Signed-off-by: Thomas Huth <thuth@redhat.com>
+Signed-off-by: Virendra Thakur <virendra.thakur@kpit.com>
+
+CVE: CVE-2021-3750
+
+Upstream-Status: Backport [https://apc01.safelinks.protection.outlook.com/=
?url=3Dhttps%3A%2F%2Fgit.qemu.org%2F%3Fp%3Dqemu.git%3Ba%3Dcommit%3Bh%3D3ab6=
fdc91b72e156da22848f0003ff4225690ced&amp;data=3D05%7C01%7Cvirendra.thakur%4=
0kpit.com%7Ca0b284fe19a44c82e83708daa370e956%7C3539451eb46e4a26a242ff615028=
55c7%7C0%7C0%7C638002002616918239%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwM=
DAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=
=3DJChPhlgoy7XG4cIV9bpvX%2BeGV%2FIO5JSru9wuqRacLJA%3D&amp;reserved=3D0]
+---
+ include/exec/memattrs.h |  9 +++++++++
+ softmmu/physmem.c       | 44 ++++++++++++++++++++++++++++++++++++++++++--
+ 2 files changed, 51 insertions(+), 2 deletions(-)
+
+diff --git a/include/exec/memattrs.h b/include/exec/memattrs.h
+index 95f2d20..9fb98bc 100644
+--- a/include/exec/memattrs.h
++++ b/include/exec/memattrs.h
+@@ -35,6 +35,14 @@ typedef struct MemTxAttrs {
+     unsigned int secure:1;
+     /* Memory access is usermode (unprivileged) */
+     unsigned int user:1;
++    /*
++     * Bus interconnect and peripherals can access anything (memories,
++     * devices) by default. By setting the 'memory' bit, bus transaction
++     * are restricted to "normal" memories (per the AMBA documentation)
++     * versus devices. Access to devices will be logged and rejected
++     * (see MEMTX_ACCESS_ERROR).
++     */
++    unsigned int memory:1;
+     /* Requester ID (for MSI for example) */
+     unsigned int requester_id:16;
+     /* Invert endianness for this page */
+@@ -66,6 +74,7 @@ typedef struct MemTxAttrs {
+ #define MEMTX_OK 0
+ #define MEMTX_ERROR             (1U << 0) /* device returned an error */
+ #define MEMTX_DECODE_ERROR      (1U << 1) /* nothing at that address */
++#define MEMTX_ACCESS_ERROR      (1U << 2) /* access denied */
+ typedef uint32_t MemTxResult;
+
+ #endif
+diff --git a/softmmu/physmem.c b/softmmu/physmem.c
+index 3d968ca..4e1b27a 100644
+--- a/softmmu/physmem.c
++++ b/softmmu/physmem.c
+@@ -41,6 +41,7 @@
+ #include "qemu/config-file.h"
+ #include "qemu/error-report.h"
+ #include "qemu/qemu-print.h"
++#include "qemu/log.h"
+ #include "exec/memory.h"
+ #include "exec/ioport.h"
+ #include "sysemu/dma.h"
+@@ -2759,6 +2760,33 @@ static bool prepare_mmio_access(MemoryRe
+     return release_lock;
+ }
+
++/**
++ * flatview_access_allowed
++ * @mr: #MemoryRegion to be accessed
++ * @attrs: memory transaction attributes
++ * @addr: address within that memory region
++ * @len: the number of bytes to access
++ *
++ * Check if a memory transaction is allowed.
++ *
++ * Returns: true if transaction is allowed, false if denied.
++ */
++static bool flatview_access_allowed(MemoryRegion *mr, MemTxAttrs attrs,
++                                    hwaddr addr, hwaddr len)
++{
++    if (likely(!attrs.memory)) {
++        return true;
++    }
++    if (memory_region_is_ram(mr)) {
++        return true;
++    }
++    qemu_log_mask(LOG_GUEST_ERROR,
++                  "Invalid access to non-RAM device at "
++                  "addr 0x%" HWADDR_PRIX ", size %" HWADDR_PRIu ", "
++                  "region '%s'\n", addr, len, memory_region_name(mr));
++    return false;
++}
++
+ /* Called within RCU critical section.  */
+ static MemTxResult flatview_write_continue(FlatView *fv, hwaddr addr,
+                                            MemTxAttrs attrs,
+@@ -2773,7 +2801,10 @@ static MemTxResult flatview_write_contin
+     const uint8_t *buf =3D ptr;
+
+     for (;;) {
+-        if (!memory_access_is_direct(mr, true)) {
++        if (!flatview_access_allowed(mr, attrs, addr1, l)) {
++            result |=3D MEMTX_ACCESS_ERROR;
++            /* Keep going. */
++        } else if (!memory_access_is_direct(mr, true)) {
+             release_lock |=3D prepare_mmio_access(mr);
+             l =3D memory_access_size(mr, l, addr1);
+             /* XXX: could force current_cpu to NULL to avoid
+@@ -2818,6 +2849,9 @@ static MemTxResult flatview_write(FlatVi
+
+     l =3D len;
+     mr =3D flatview_translate(fv, addr, &addr1, &l, true, attrs);
++    if (!flatview_access_allowed(mr, attrs, addr, len)) {
++        return MEMTX_ACCESS_ERROR;
++    }
+     return flatview_write_continue(fv, addr, attrs, buf, len,
+                                    addr1, l, mr);
+ }
+@@ -2836,7 +2870,10 @@ MemTxResult flatview_read_continue(FlatV
+
+     fuzz_dma_read_cb(addr, len, mr);
+     for (;;) {
+-        if (!memory_access_is_direct(mr, false)) {
++        if (!flatview_access_allowed(mr, attrs, addr1, l)) {
++            result |=3D MEMTX_ACCESS_ERROR;
++            /* Keep going. */
++        } else if (!memory_access_is_direct(mr, false)) {
+             /* I/O case */
+             release_lock |=3D prepare_mmio_access(mr);
+             l =3D memory_access_size(mr, l, addr1);
+@@ -2879,6 +2916,9 @@ static MemTxResult flatview_read(FlatVie
+
+     l =3D len;
+     mr =3D flatview_translate(fv, addr, &addr1, &l, false, attrs);
++    if (!flatview_access_allowed(mr, attrs, addr, len)) {
++        return MEMTX_ACCESS_ERROR;
++    }
+     return flatview_read_continue(fv, addr, attrs, buf, len,
+                                   addr1, l, mr);
+ }
+--
+1.8.3.1
+
--
2.17.1

This message contains information that may be privileged or confidential an=
d is the property of the KPIT Technologies Ltd. It is intended only for the=
 person to whom it is addressed. If you are not the intended recipient, you=
 are not authorized to read, print, retain copy, disseminate, distribute, o=
r use this message or any part thereof. If you receive this message in erro=
r, please notify the sender immediately and delete all copies of this messa=
ge. KPIT Technologies Ltd. does not accept any liability for virus infected=
 mails.
This message contains information that may be privileged or confidential an=
d is the property of the KPIT Technologies Ltd. It is intended only for the=
 person to whom it is addressed. If you are not the intended recipient, you=
 are not authorized to read, print, retain copy, disseminate, distribute, o=
r use this message or any part thereof. If you receive this message in erro=
r, please notify the sender immediately and delete all copies of this messa=
ge. KPIT Technologies Ltd. does not accept any liability for virus infected=
 mails.

--_000_MAXPR01MB43275C9203484CFC733FFA929D599MAXPR01MB4327INDP_
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
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
Attached patch file also.&nbsp;</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> openembedded-core@lis=
ts.openembedded.org &lt;openembedded-core@lists.openembedded.org&gt; on beh=
alf of Virendra Thakur via lists.openembedded.org
 &lt;virendra.thakur=3Dkpit.com@lists.openembedded.org&gt;<br>
<b>Sent:</b> Saturday, October 1, 2022 11:20 AM<br>
<b>To:</b> openembedded-core@lists.openembedded.org &lt;openembedded-core@l=
ists.openembedded.org&gt;<br>
<b>Cc:</b> steve@sakoman.com &lt;steve@sakoman.com&gt;<br>
<b>Subject:</b> [OE-Core][kirkstone][PATCH] qemu: Fix CVE-2021-3750 for qem=
u</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">Caution: This email originated from outside of the=
 KPIT. Do not click links or open attachments unless you recognize the send=
er and know the content is safe.<br>
<br>
Add patch to fix CVE-2021-3750<br>
<br>
Signed-off-by: Virendra Thakur &lt;virendra.thakur@kpit.com&gt;<br>
---<br>
&nbsp;meta/recipes-devtools/qemu/qemu.inc&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp; 3 +<br>
&nbsp;.../qemu/qemu/CVE-2021-3750-1.patch&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp; 59 +++++++<br>
&nbsp;.../qemu/qemu/CVE-2021-3750-2.patch&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp; 65 ++++++++<br>
&nbsp;.../qemu/qemu/CVE-2021-3750-3.patch&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp; | 156 ++++++++++++++++++<br>
&nbsp;4 files changed, 283 insertions(+)<br>
&nbsp;create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2021-3750-1.pa=
tch<br>
&nbsp;create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2021-3750-2.pa=
tch<br>
&nbsp;create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2021-3750-3.pa=
tch<br>
<br>
diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qe=
mu/qemu.inc<br>
index a493ac8add..816f9a7eac 100644<br>
--- a/meta/recipes-devtools/qemu/qemu.inc<br>
+++ b/meta/recipes-devtools/qemu/qemu.inc<br>
@@ -43,6 +43,9 @@ SRC_URI =3D &quot;<a href=3D""></a>https://apc01.safelink=
s.protection.outlook.com/?url=3Dhttps%3A%2F%2Fdownload.qemu.org%2F%24&amp;a=
mp;data=3D05%7C01%7Cvirendra.thakur%40kpit.com%7Ca0b284fe19a44c82e83708daa3=
70e956%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C638002002616918239%7CUn=
known%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJ=
XVCI6Mn0%3D%7C3000%7C%7C%7C&amp;amp;sdata=3DQVDwSHyy12MaO5HE89G3XFl%2BlGS0T=
nVbNFue8cEl5C8%3D&amp;amp;reserved=3D0{BPN}-${PV}.tar.xz
 \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=
=3D"file://CVE-2022-0358.patch">file://CVE-2022-0358.patch</a> \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=
=3D"file://CVE-2022-0216_1.patch">file://CVE-2022-0216_1.patch</a> \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=
=3D"file://CVE-2022-0216_2.patch">file://CVE-2022-0216_2.patch</a> \<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=3D"fi=
le://CVE-2021-3750-1.patch">file://CVE-2021-3750-1.patch</a> \<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=3D"fi=
le://CVE-2021-3750-2.patch">file://CVE-2021-3750-2.patch</a> \<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=3D"fi=
le://CVE-2021-3750-3.patch">file://CVE-2021-3750-3.patch</a> \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;<b=
r>
&nbsp;UPSTREAM_CHECK_REGEX =3D &quot;qemu-(?P&lt;pver&gt;\d+(\.\d+)+)\.tar&=
quot;<br>
<br>
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2021-3750-1.patch b/meta/r=
ecipes-devtools/qemu/qemu/CVE-2021-3750-1.patch<br>
new file mode 100644<br>
index 0000000000..db908874b6<br>
--- /dev/null<br>
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2021-3750-1.patch<br>
@@ -0,0 +1,59 @@<br>
+From b9d383ab797f54ae5fa8746117770709921dc529 Mon Sep 17 00:00:00 2001<br>
+From: =3D?utf8?q?Philippe=3D20Mathieu-Daud=3DC3=3DA9?=3D &lt;philmd@redhat=
.com&gt;<br>
+Date: Wed, 15 Dec 2021 19:24:19 +0100<br>
+Subject: [PATCH] hw/intc/arm_gicv3: Check for !MEMTX_OK instead of MEMTX_E=
RROR<br>
+MIME-Version: 1.0<br>
+Content-Type: text/plain; charset=3Dutf8<br>
+Content-Transfer-Encoding: 8bit<br>
+<br>
+Quoting Peter Maydell:<br>
+<br>
+ &quot;These MEMTX_* aren't from the memory transaction<br>
+&nbsp; API functions; they're just being used by gicd_readl() and<br>
+&nbsp; friends as a way to indicate a success/failure so that the<br>
+&nbsp; actual MemoryRegionOps read/write fns like gicv3_dist_read()<br>
+&nbsp; can log a guest error.&quot;<br>
+<br>
+We are going to introduce more MemTxResult bits, so it is<br>
+safer to check for !MEMTX_OK rather than MEMTX_ERROR.<br>
+<br>
+Reviewed-by: Peter Xu &lt;peterx@redhat.com&gt;<br>
+Reviewed-by: David Hildenbrand &lt;david@redhat.com&gt;<br>
+Reviewed-by: Peter Maydell &lt;peter.maydell@linaro.org&gt;<br>
+Reviewed-by: Stefan Hajnoczi &lt;stefanha@redhat.com&gt;<br>
+Signed-off-by: Philippe Mathieu-Daud=C3f=C2=A9 &lt;philmd@redhat.com&gt;<b=
r>
+Signed-off-by: Peter Maydell &lt;peter.maydell@linaro.org&gt;<br>
+Signed-off-by: Virendra Thakur &lt;virendra.thakur@kpit.com&gt;<br>
+<br>
+CVE: CVE-2021-3750<br>
+<br>
+Upstream-Status: Backport [<a href=3D"https://apc01.safelinks.protection.o=
utlook.com/?url=3Dhttps%3A%2F%2Fgit.qemu.org%2F%3Fp%3Dqemu.git%3Ba%3Dcommit=
%3Bh%3Db9d383ab797f54ae5fa8746117770709921dc529&amp;amp;data=3D05%7C01%7Cvi=
rendra.thakur%40kpit.com%7Ca0b284fe19a44c82e83708daa370e956%7C3539451eb46e4=
a26a242ff61502855c7%7C0%7C0%7C638002002616918239%7CUnknown%7CTWFpbGZsb3d8ey=
JWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%=
7C%7C&amp;amp;sdata=3D%2F5qLB4ry00kujvgdAPmZcSX3dfUQiDBTKXg2GYQHLQg%3D&amp;=
amp;reserved=3D0">https://apc01.safelinks.protection.outlook.com/?url=3Dhtt=
ps%3A%2F%2Fgit.qemu.org%2F%3Fp%3Dqemu.git%3Ba%3Dcommit%3Bh%3Db9d383ab797f54=
ae5fa8746117770709921dc529&amp;amp;data=3D05%7C01%7Cvirendra.thakur%40kpit.=
com%7Ca0b284fe19a44c82e83708daa370e956%7C3539451eb46e4a26a242ff61502855c7%7=
C0%7C0%7C638002002616918239%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJ=
QIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;amp;sdata=
=3D%2F5qLB4ry00kujvgdAPmZcSX3dfUQiDBTKXg2GYQHLQg%3D&amp;amp;reserved=3D0</a=
>]<br>
+---<br>
+ hw/intc/arm_gicv3_redist.c | 4 ++--<br>
+ 1 file changed, 2 insertions(+), 2 deletions(-)<br>
+<br>
+diff --git a/hw/intc/arm_gicv3_redist.c b/hw/intc/arm_gicv3_redist.c<br>
+index c8ff3ec..99b11ca 100644<br>
+--- a/hw/intc/arm_gicv3_redist.c<br>
++++ b/hw/intc/arm_gicv3_redist.c<br>
+@@ -462,7 +462,7 @@ MemTxResult gicv3_redist_read(void *opaque, hwaddr off=
set, uint64_t *data,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; break;<br>
+&nbsp;&nbsp;&nbsp;&nbsp; }<br>
+<br>
+-&nbsp;&nbsp;&nbsp; if (r =3D=3D MEMTX_ERROR) {<br>
++&nbsp;&nbsp;&nbsp; if (r !=3D MEMTX_OK) {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; qemu_log_mask(LOG_GUEST_E=
RROR,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;%s: invali=
d guest read at offset &quot; TARGET_FMT_plx<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot; size %u\n=
&quot;, __func__, offset, size);<br>
+@@ -521,7 +521,7 @@ MemTxResult gicv3_redist_write(void *opaque, hwaddr of=
fset, uint64_t data,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; break;<br>
+&nbsp;&nbsp;&nbsp;&nbsp; }<br>
+<br>
+-&nbsp;&nbsp;&nbsp; if (r =3D=3D MEMTX_ERROR) {<br>
++&nbsp;&nbsp;&nbsp; if (r !=3D MEMTX_OK) {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; qemu_log_mask(LOG_GUEST_E=
RROR,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;%s: invali=
d guest write at offset &quot; TARGET_FMT_plx<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot; size %u\n=
&quot;, __func__, offset, size);<br>
+--<br>
+1.8.3.1<br>
+<br>
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2021-3750-2.patch b/meta/r=
ecipes-devtools/qemu/qemu/CVE-2021-3750-2.patch<br>
new file mode 100644<br>
index 0000000000..1ce32089a8<br>
--- /dev/null<br>
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2021-3750-2.patch<br>
@@ -0,0 +1,65 @@<br>
+From 58e74682baf4e1ad26b064d8c02e5bc99c75c5d9 Mon Sep 17 00:00:00 2001<br>
+From: =3D?utf8?q?Philippe=3D20Mathieu-Daud=3DC3=3DA9?=3D &lt;philmd@redhat=
.com&gt;<br>
+Date: Wed, 15 Dec 2021 19:24:20 +0100<br>
+Subject: [PATCH] softmmu/physmem: Simplify flatview_write and<br>
+ address_space_access_valid<br>
+MIME-Version: 1.0<br>
+Content-Type: text/plain; charset=3Dutf8<br>
+Content-Transfer-Encoding: 8bit<br>
+<br>
+Remove unuseful local 'result' variables.<br>
+<br>
+Reviewed-by: Peter Xu &lt;peterx@redhat.com&gt;<br>
+Reviewed-by: David Hildenbrand &lt;david@redhat.com&gt;<br>
+Reviewed-by: Alexander Bulekov &lt;alxndr@bu.edu&gt;<br>
+Reviewed-by: Stefan Hajnoczi &lt;stefanha@redhat.com&gt;<br>
+Signed-off-by: Philippe Mathieu-Daud=C3f=C2=A9 &lt;philmd@redhat.com&gt;<b=
r>
+Message-Id: &lt;20211215182421.418374-3-philmd@redhat.com&gt;<br>
+Signed-off-by: Thomas Huth &lt;thuth@redhat.com&gt;<br>
+Signed-off-by: Virendra Thakur &lt;virendra.thakur@kpit.com&gt;<br>
+<br>
+CVE: CVE-2021-3750<br>
+<br>
+Upstream-Status: Backport [<a href=3D"https://apc01.safelinks.protection.o=
utlook.com/?url=3Dhttps%3A%2F%2Fgit.qemu.org%2F%3Fp%3Dqemu.git%3Ba%3Dcommit=
%3Bh%3D58e74682baf4e1ad26b064d8c02e5bc99c75c5d9&amp;amp;data=3D05%7C01%7Cvi=
rendra.thakur%40kpit.com%7Ca0b284fe19a44c82e83708daa370e956%7C3539451eb46e4=
a26a242ff61502855c7%7C0%7C0%7C638002002616918239%7CUnknown%7CTWFpbGZsb3d8ey=
JWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%=
7C%7C&amp;amp;sdata=3De89z0JI%2F06n8FrOneQNuXOg2Jo0ckdVqeqCAgMg5JvQ%3D&amp;=
amp;reserved=3D0">https://apc01.safelinks.protection.outlook.com/?url=3Dhtt=
ps%3A%2F%2Fgit.qemu.org%2F%3Fp%3Dqemu.git%3Ba%3Dcommit%3Bh%3D58e74682baf4e1=
ad26b064d8c02e5bc99c75c5d9&amp;amp;data=3D05%7C01%7Cvirendra.thakur%40kpit.=
com%7Ca0b284fe19a44c82e83708daa370e956%7C3539451eb46e4a26a242ff61502855c7%7=
C0%7C0%7C638002002616918239%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJ=
QIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;amp;sdata=
=3De89z0JI%2F06n8FrOneQNuXOg2Jo0ckdVqeqCAgMg5JvQ%3D&amp;amp;reserved=3D0</a=
>]<br>
+---<br>
+ softmmu/physmem.c | 11 +++--------<br>
+ 1 file changed, 3 insertions(+), 8 deletions(-)<br>
+<br>
+diff --git a/softmmu/physmem.c b/softmmu/physmem.c<br>
+index 43ae70f..3d968ca 100644<br>
+--- a/softmmu/physmem.c<br>
++++ b/softmmu/physmem.c<br>
+@@ -2826,14 +2826,11 @@ static MemTxResult flatview_write(FlatVi<br>
+&nbsp;&nbsp;&nbsp;&nbsp; hwaddr l;<br>
+&nbsp;&nbsp;&nbsp;&nbsp; hwaddr addr1;<br>
+&nbsp;&nbsp;&nbsp;&nbsp; MemoryRegion *mr;<br>
+-&nbsp;&nbsp;&nbsp; MemTxResult result =3D MEMTX_OK;<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp; l =3D len;<br>
+&nbsp;&nbsp;&nbsp;&nbsp; mr =3D flatview_translate(fv, addr, &amp;addr1, &=
amp;l, true, attrs);<br>
+-&nbsp;&nbsp;&nbsp; result =3D flatview_write_continue(fv, addr, attrs, bu=
f, len,<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; addr1,=
 l, mr);<br>
+-<br>
+-&nbsp;&nbsp;&nbsp; return result;<br>
++&nbsp;&nbsp;&nbsp; return flatview_write_continue(fv, addr, attrs, buf, l=
en,<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; addr1, l, mr);<br>
+ }<br>
+<br>
+ /* Called within RCU critical section.&nbsp; */<br>
+@@ -3130,12 +3127,10 @@ bool address_space_access_valid(AddressS<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; MemTxAttrs attrs)<br>
+ {<br>
+&nbsp;&nbsp;&nbsp;&nbsp; FlatView *fv;<br>
+-&nbsp;&nbsp;&nbsp; bool result;<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp; RCU_READ_LOCK_GUARD();<br>
+&nbsp;&nbsp;&nbsp;&nbsp; fv =3D address_space_to_flatview(as);<br>
+-&nbsp;&nbsp;&nbsp; result =3D flatview_access_valid(fv, addr, len, is_wri=
te, attrs);<br>
+-&nbsp;&nbsp;&nbsp; return result;<br>
++&nbsp;&nbsp;&nbsp; return flatview_access_valid(fv, addr, len, is_write, =
attrs);<br>
+ }<br>
+<br>
+ static hwaddr<br>
+--<br>
+1.8.3.1<br>
+<br>
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2021-3750-3.patch b/meta/r=
ecipes-devtools/qemu/qemu/CVE-2021-3750-3.patch<br>
new file mode 100644<br>
index 0000000000..703646365f<br>
--- /dev/null<br>
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2021-3750-3.patch<br>
@@ -0,0 +1,156 @@<br>
+From 3ab6fdc91b72e156da22848f0003ff4225690ced Mon Sep 17 00:00:00 2001<br>
+From: =3D?utf8?q?Philippe=3D20Mathieu-Daud=3DC3=3DA9?=3D &lt;philmd@redhat=
.com&gt;<br>
+Date: Wed, 15 Dec 2021 19:24:21 +0100<br>
+Subject: [PATCH] softmmu/physmem: Introduce MemTxAttrs::memory field and<b=
r>
+ MEMTX_ACCESS_ERROR<br>
+MIME-Version: 1.0<br>
+Content-Type: text/plain; charset=3Dutf8<br>
+Content-Transfer-Encoding: 8bit<br>
+<br>
+Add the 'memory' bit to the memory attributes to restrict bus<br>
+controller accesses to memories.<br>
+<br>
+Introduce flatview_access_allowed() to check bus permission<br>
+before running any bus transaction.<br>
+<br>
+Have read/write accessors return MEMTX_ACCESS_ERROR if an access is<br>
+restricted.<br>
+<br>
+There is no change for the default case where 'memory' is not set.<br>
+<br>
+Signed-off-by: Philippe Mathieu-Daud=C3f=C2=A9 &lt;philmd@redhat.com&gt;<b=
r>
+Message-Id: &lt;20211215182421.418374-4-philmd@redhat.com&gt;<br>
+Reviewed-by: Richard Henderson &lt;richard.henderson@linaro.org&gt;<br>
+Reviewed-by: Stefan Hajnoczi &lt;stefanha@redhat.com&gt;<br>
+[thuth: Replaced MEMTX_BUS_ERROR with MEMTX_ACCESS_ERROR, remove &quot;inl=
ine&quot;]<br>
+Signed-off-by: Thomas Huth &lt;thuth@redhat.com&gt;<br>
+Signed-off-by: Virendra Thakur &lt;virendra.thakur@kpit.com&gt;<br>
+<br>
+CVE: CVE-2021-3750<br>
+<br>
+Upstream-Status: Backport [<a href=3D"https://apc01.safelinks.protection.o=
utlook.com/?url=3Dhttps%3A%2F%2Fgit.qemu.org%2F%3Fp%3Dqemu.git%3Ba%3Dcommit=
%3Bh%3D3ab6fdc91b72e156da22848f0003ff4225690ced&amp;amp;data=3D05%7C01%7Cvi=
rendra.thakur%40kpit.com%7Ca0b284fe19a44c82e83708daa370e956%7C3539451eb46e4=
a26a242ff61502855c7%7C0%7C0%7C638002002616918239%7CUnknown%7CTWFpbGZsb3d8ey=
JWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%=
7C%7C&amp;amp;sdata=3DJChPhlgoy7XG4cIV9bpvX%2BeGV%2FIO5JSru9wuqRacLJA%3D&am=
p;amp;reserved=3D0">https://apc01.safelinks.protection.outlook.com/?url=3Dh=
ttps%3A%2F%2Fgit.qemu.org%2F%3Fp%3Dqemu.git%3Ba%3Dcommit%3Bh%3D3ab6fdc91b72=
e156da22848f0003ff4225690ced&amp;amp;data=3D05%7C01%7Cvirendra.thakur%40kpi=
t.com%7Ca0b284fe19a44c82e83708daa370e956%7C3539451eb46e4a26a242ff61502855c7=
%7C0%7C0%7C638002002616918239%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiL=
CJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;amp;sdata=
=3DJChPhlgoy7XG4cIV9bpvX%2BeGV%2FIO5JSru9wuqRacLJA%3D&amp;amp;reserved=3D0<=
/a>]<br>
+---<br>
+ include/exec/memattrs.h |&nbsp; 9 +++++++++<br>
+ softmmu/physmem.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 44 ++++++++++++++=
++++++++++++++++++++++++++++--<br>
+ 2 files changed, 51 insertions(+), 2 deletions(-)<br>
+<br>
+diff --git a/include/exec/memattrs.h b/include/exec/memattrs.h<br>
+index 95f2d20..9fb98bc 100644<br>
+--- a/include/exec/memattrs.h<br>
++++ b/include/exec/memattrs.h<br>
+@@ -35,6 +35,14 @@ typedef struct MemTxAttrs {<br>
+&nbsp;&nbsp;&nbsp;&nbsp; unsigned int secure:1;<br>
+&nbsp;&nbsp;&nbsp;&nbsp; /* Memory access is usermode (unprivileged) */<br=
>
+&nbsp;&nbsp;&nbsp;&nbsp; unsigned int user:1;<br>
++&nbsp;&nbsp;&nbsp; /*<br>
++&nbsp;&nbsp;&nbsp;&nbsp; * Bus interconnect and peripherals can access an=
ything (memories,<br>
++&nbsp;&nbsp;&nbsp;&nbsp; * devices) by default. By setting the 'memory' b=
it, bus transaction<br>
++&nbsp;&nbsp;&nbsp;&nbsp; * are restricted to &quot;normal&quot; memories =
(per the AMBA documentation)<br>
++&nbsp;&nbsp;&nbsp;&nbsp; * versus devices. Access to devices will be logg=
ed and rejected<br>
++&nbsp;&nbsp;&nbsp;&nbsp; * (see MEMTX_ACCESS_ERROR).<br>
++&nbsp;&nbsp;&nbsp;&nbsp; */<br>
++&nbsp;&nbsp;&nbsp; unsigned int memory:1;<br>
+&nbsp;&nbsp;&nbsp;&nbsp; /* Requester ID (for MSI for example) */<br>
+&nbsp;&nbsp;&nbsp;&nbsp; unsigned int requester_id:16;<br>
+&nbsp;&nbsp;&nbsp;&nbsp; /* Invert endianness for this page */<br>
+@@ -66,6 +74,7 @@ typedef struct MemTxAttrs {<br>
+ #define MEMTX_OK 0<br>
+ #define MEMTX_ERROR&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp; (1U &lt;&lt; 0) /* device returned an error */<br>
+ #define MEMTX_DECODE_ERROR&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (1U &lt;&lt; 1) =
/* nothing at that address */<br>
++#define MEMTX_ACCESS_ERROR&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (1U &lt;&lt; 2) =
/* access denied */<br>
+ typedef uint32_t MemTxResult;<br>
+<br>
+ #endif<br>
+diff --git a/softmmu/physmem.c b/softmmu/physmem.c<br>
+index 3d968ca..4e1b27a 100644<br>
+--- a/softmmu/physmem.c<br>
++++ b/softmmu/physmem.c<br>
+@@ -41,6 +41,7 @@<br>
+ #include &quot;qemu/config-file.h&quot;<br>
+ #include &quot;qemu/error-report.h&quot;<br>
+ #include &quot;qemu/qemu-print.h&quot;<br>
++#include &quot;qemu/log.h&quot;<br>
+ #include &quot;exec/memory.h&quot;<br>
+ #include &quot;exec/ioport.h&quot;<br>
+ #include &quot;sysemu/dma.h&quot;<br>
+@@ -2759,6 +2760,33 @@ static bool prepare_mmio_access(MemoryRe<br>
+&nbsp;&nbsp;&nbsp;&nbsp; return release_lock;<br>
+ }<br>
+<br>
++/**<br>
++ * flatview_access_allowed<br>
++ * @mr: #MemoryRegion to be accessed<br>
++ * @attrs: memory transaction attributes<br>
++ * @addr: address within that memory region<br>
++ * @len: the number of bytes to access<br>
++ *<br>
++ * Check if a memory transaction is allowed.<br>
++ *<br>
++ * Returns: true if transaction is allowed, false if denied.<br>
++ */<br>
++static bool flatview_access_allowed(MemoryRegion *mr, MemTxAttrs attrs,<b=
r>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; hwaddr addr,=
 hwaddr len)<br>
++{<br>
++&nbsp;&nbsp;&nbsp; if (likely(!attrs.memory)) {<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return true;<br>
++&nbsp;&nbsp;&nbsp; }<br>
++&nbsp;&nbsp;&nbsp; if (memory_region_is_ram(mr)) {<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return true;<br>
++&nbsp;&nbsp;&nbsp; }<br>
++&nbsp;&nbsp;&nbsp; qemu_log_mask(LOG_GUEST_ERROR,<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;Invalid access to non-RAM device at &qu=
ot;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;addr 0x%&quot; HWADDR_PRIX &quot;, size=
 %&quot; HWADDR_PRIu &quot;, &quot;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;region '%s'\n&quot;, addr, len, memory_=
region_name(mr));<br>
++&nbsp;&nbsp;&nbsp; return false;<br>
++}<br>
++<br>
+ /* Called within RCU critical section.&nbsp; */<br>
+ static MemTxResult flatview_write_continue(FlatView *fv, hwaddr addr,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; MemTxAttrs attrs,<br>
+@@ -2773,7 +2801,10 @@ static MemTxResult flatview_write_contin<br>
+&nbsp;&nbsp;&nbsp;&nbsp; const uint8_t *buf =3D ptr;<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp; for (;;) {<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!memory_access_is_direct(m=
r, true)) {<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!flatview_access_allowed(m=
r, attrs, addr1, l)) {<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; result=
 |=3D MEMTX_ACCESS_ERROR;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* Kee=
p going. */<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; } else if (!memory_access_is_d=
irect(mr, true)) {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; r=
elease_lock |=3D prepare_mmio_access(mr);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; l=
 =3D memory_access_size(mr, l, addr1);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /=
* XXX: could force current_cpu to NULL to avoid<br>
+@@ -2818,6 +2849,9 @@ static MemTxResult flatview_write(FlatVi<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp; l =3D len;<br>
+&nbsp;&nbsp;&nbsp;&nbsp; mr =3D flatview_translate(fv, addr, &amp;addr1, &=
amp;l, true, attrs);<br>
++&nbsp;&nbsp;&nbsp; if (!flatview_access_allowed(mr, attrs, addr, len)) {<=
br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return MEMTX_ACCESS_ERROR;<br>
++&nbsp;&nbsp;&nbsp; }<br>
+&nbsp;&nbsp;&nbsp;&nbsp; return flatview_write_continue(fv, addr, attrs, b=
uf, len,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; addr1, l, mr)=
;<br>
+ }<br>
+@@ -2836,7 +2870,10 @@ MemTxResult flatview_read_continue(FlatV<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp; fuzz_dma_read_cb(addr, len, mr);<br>
+&nbsp;&nbsp;&nbsp;&nbsp; for (;;) {<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!memory_access_is_direct(m=
r, false)) {<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!flatview_access_allowed(m=
r, attrs, addr1, l)) {<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; result=
 |=3D MEMTX_ACCESS_ERROR;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* Kee=
p going. */<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; } else if (!memory_access_is_d=
irect(mr, false)) {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /=
* I/O case */<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; r=
elease_lock |=3D prepare_mmio_access(mr);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; l=
 =3D memory_access_size(mr, l, addr1);<br>
+@@ -2879,6 +2916,9 @@ static MemTxResult flatview_read(FlatVie<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp; l =3D len;<br>
+&nbsp;&nbsp;&nbsp;&nbsp; mr =3D flatview_translate(fv, addr, &amp;addr1, &=
amp;l, false, attrs);<br>
++&nbsp;&nbsp;&nbsp; if (!flatview_access_allowed(mr, attrs, addr, len)) {<=
br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return MEMTX_ACCESS_ERROR;<br>
++&nbsp;&nbsp;&nbsp; }<br>
+&nbsp;&nbsp;&nbsp;&nbsp; return flatview_read_continue(fv, addr, attrs, bu=
f, len,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; addr1, l, mr);<br>
+ }<br>
+--<br>
+1.8.3.1<br>
+<br>
--<br>
2.17.1<br>
<br>
This message contains information that may be privileged or confidential an=
d is the property of the KPIT Technologies Ltd. It is intended only for the=
 person to whom it is addressed. If you are not the intended recipient, you=
 are not authorized to read, print,
 retain copy, disseminate, distribute, or use this message or any part ther=
eof. If you receive this message in error, please notify the sender immedia=
tely and delete all copies of this message. KPIT Technologies Ltd. does not=
 accept any liability for virus
 infected mails.<br>
</div>
</span></font></div>
This message contains information that may be privileged or confidential an=
d is the property of the KPIT Technologies Ltd. It is intended only for the=
 person to whom it is addressed. If you are not the intended recipient, you=
 are not authorized to read, print,
 retain copy, disseminate, distribute, or use this message or any part ther=
eof. If you receive this message in error, please notify the sender immedia=
tely and delete all copies of this message. KPIT Technologies Ltd. does not=
 accept any liability for virus
 infected mails.
</body>
</html>

--_000_MAXPR01MB43275C9203484CFC733FFA929D599MAXPR01MB4327INDP_--

--_004_MAXPR01MB43275C9203484CFC733FFA929D599MAXPR01MB4327INDP_
Content-Type: text/x-patch; name="0001-qemu-Fix-CVE-2021-3750-for-qemu.patch"
Content-Description: 0001-qemu-Fix-CVE-2021-3750-for-qemu.patch
Content-Disposition: attachment;
	filename="0001-qemu-Fix-CVE-2021-3750-for-qemu.patch"; size=12605;
	creation-date="Sat, 01 Oct 2022 05:52:26 GMT";
	modification-date="Sat, 01 Oct 2022 05:52:33 GMT"
Content-Transfer-Encoding: base64

RnJvbSBlYWNkZGZmZTE1YWE2NDM3OGQ2YzUxNDM4NDU2ODU1ZjIwNzgwODhhIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBWaXJlbmRyYSBUaGFrdXIgPHZpcmVuZHJhLnRoYWt1ckBrcGl0
LmNvbT4KRGF0ZTogRnJpLCA1IEF1ZyAyMDIyIDE0OjAxOjIwICswNTMwClN1YmplY3Q6IFtQQVRD
SF0gcWVtdTogRml4IENWRS0yMDIxLTM3NTAgZm9yIHFlbXUKCkFkZCBwYXRjaCB0byBmaXggQ1ZF
LTIwMjEtMzc1MAoKU2lnbmVkLW9mZi1ieTogVmlyZW5kcmEgVGhha3VyIDx2aXJlbmRyYS50aGFr
dXJAa3BpdC5jb20+Ci0tLQogbWV0YS9yZWNpcGVzLWRldnRvb2xzL3FlbXUvcWVtdS5pbmMgICAg
ICAgICAgIHwgICAzICsKIC4uLi9xZW11L3FlbXUvQ1ZFLTIwMjEtMzc1MC0xLnBhdGNoICAgICAg
ICAgICB8ICA1OSArKysrKysrCiAuLi4vcWVtdS9xZW11L0NWRS0yMDIxLTM3NTAtMi5wYXRjaCAg
ICAgICAgICAgfCAgNjUgKysrKysrKysKIC4uLi9xZW11L3FlbXUvQ1ZFLTIwMjEtMzc1MC0zLnBh
dGNoICAgICAgICAgICB8IDE1NiArKysrKysrKysrKysrKysrKysKIDQgZmlsZXMgY2hhbmdlZCwg
MjgzIGluc2VydGlvbnMoKykKIGNyZWF0ZSBtb2RlIDEwMDY0NCBtZXRhL3JlY2lwZXMtZGV2dG9v
bHMvcWVtdS9xZW11L0NWRS0yMDIxLTM3NTAtMS5wYXRjaAogY3JlYXRlIG1vZGUgMTAwNjQ0IG1l
dGEvcmVjaXBlcy1kZXZ0b29scy9xZW11L3FlbXUvQ1ZFLTIwMjEtMzc1MC0yLnBhdGNoCiBjcmVh
dGUgbW9kZSAxMDA2NDQgbWV0YS9yZWNpcGVzLWRldnRvb2xzL3FlbXUvcWVtdS9DVkUtMjAyMS0z
NzUwLTMucGF0Y2gKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcWVtdS9xZW11
LmluYyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9xZW11L3FlbXUuaW5jCmluZGV4IGE0OTNhYzhh
ZGQuLjgxNmY5YTdlYWMgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9xZW11L3Fl
bXUuaW5jCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9xZW11L3FlbXUuaW5jCkBAIC00Myw2
ICs0Myw5IEBAIFNSQ19VUkkgPSAiaHR0cHM6Ly9kb3dubG9hZC5xZW11Lm9yZy8ke0JQTn0tJHtQ
Vn0udGFyLnh6IFwKICAgICAgICAgICAgZmlsZTovL0NWRS0yMDIyLTAzNTgucGF0Y2ggXAogICAg
ICAgICAgICBmaWxlOi8vQ1ZFLTIwMjItMDIxNl8xLnBhdGNoIFwKICAgICAgICAgICAgZmlsZTov
L0NWRS0yMDIyLTAyMTZfMi5wYXRjaCBcCisgICAgICAgICAgIGZpbGU6Ly9DVkUtMjAyMS0zNzUw
LTEucGF0Y2ggXAorICAgICAgICAgICBmaWxlOi8vQ1ZFLTIwMjEtMzc1MC0yLnBhdGNoIFwKKyAg
ICAgICAgICAgZmlsZTovL0NWRS0yMDIxLTM3NTAtMy5wYXRjaCBcCiAgICAgICAgICAgICIKIFVQ
U1RSRUFNX0NIRUNLX1JFR0VYID0gInFlbXUtKD9QPHB2ZXI+XGQrKFwuXGQrKSspXC50YXIiCiAK
ZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9xZW11L3FlbXUvQ1ZFLTIwMjEtMzc1
MC0xLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3FlbXUvcWVtdS9DVkUtMjAyMS0zNzUw
LTEucGF0Y2gKbmV3IGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggMDAwMDAwMDAwMC4uZGI5MDg4NzRi
NgotLS0gL2Rldi9udWxsCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9xZW11L3FlbXUvQ1ZF
LTIwMjEtMzc1MC0xLnBhdGNoCkBAIC0wLDAgKzEsNTkgQEAKK0Zyb20gYjlkMzgzYWI3OTdmNTRh
ZTVmYTg3NDYxMTc3NzA3MDk5MjFkYzUyOSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb206
ID0/dXRmOD9xP1BoaWxpcHBlPTIwTWF0aGlldS1EYXVkPUMzPUE5Pz0gPHBoaWxtZEByZWRoYXQu
Y29tPgorRGF0ZTogV2VkLCAxNSBEZWMgMjAyMSAxOToyNDoxOSArMDEwMAorU3ViamVjdDogW1BB
VENIXSBody9pbnRjL2FybV9naWN2MzogQ2hlY2sgZm9yICFNRU1UWF9PSyBpbnN0ZWFkIG9mIE1F
TVRYX0VSUk9SCitNSU1FLVZlcnNpb246IDEuMAorQ29udGVudC1UeXBlOiB0ZXh0L3BsYWluOyBj
aGFyc2V0PXV0ZjgKK0NvbnRlbnQtVHJhbnNmZXItRW5jb2Rpbmc6IDhiaXQKKworUXVvdGluZyBQ
ZXRlciBNYXlkZWxsOgorCisgIlRoZXNlIE1FTVRYXyogYXJlbid0IGZyb20gdGhlIG1lbW9yeSB0
cmFuc2FjdGlvbgorICBBUEkgZnVuY3Rpb25zOyB0aGV5J3JlIGp1c3QgYmVpbmcgdXNlZCBieSBn
aWNkX3JlYWRsKCkgYW5kCisgIGZyaWVuZHMgYXMgYSB3YXkgdG8gaW5kaWNhdGUgYSBzdWNjZXNz
L2ZhaWx1cmUgc28gdGhhdCB0aGUKKyAgYWN0dWFsIE1lbW9yeVJlZ2lvbk9wcyByZWFkL3dyaXRl
IGZucyBsaWtlIGdpY3YzX2Rpc3RfcmVhZCgpCisgIGNhbiBsb2cgYSBndWVzdCBlcnJvci4iCisK
K1dlIGFyZSBnb2luZyB0byBpbnRyb2R1Y2UgbW9yZSBNZW1UeFJlc3VsdCBiaXRzLCBzbyBpdCBp
cworc2FmZXIgdG8gY2hlY2sgZm9yICFNRU1UWF9PSyByYXRoZXIgdGhhbiBNRU1UWF9FUlJPUi4K
KworUmV2aWV3ZWQtYnk6IFBldGVyIFh1IDxwZXRlcnhAcmVkaGF0LmNvbT4KK1Jldmlld2VkLWJ5
OiBEYXZpZCBIaWxkZW5icmFuZCA8ZGF2aWRAcmVkaGF0LmNvbT4KK1Jldmlld2VkLWJ5OiBQZXRl
ciBNYXlkZWxsIDxwZXRlci5tYXlkZWxsQGxpbmFyby5vcmc+CitSZXZpZXdlZC1ieTogU3RlZmFu
IEhham5vY3ppIDxzdGVmYW5oYUByZWRoYXQuY29tPgorU2lnbmVkLW9mZi1ieTogUGhpbGlwcGUg
TWF0aGlldS1EYXVkw4PCqSA8cGhpbG1kQHJlZGhhdC5jb20+CitTaWduZWQtb2ZmLWJ5OiBQZXRl
ciBNYXlkZWxsIDxwZXRlci5tYXlkZWxsQGxpbmFyby5vcmc+CitTaWduZWQtb2ZmLWJ5OiBWaXJl
bmRyYSBUaGFrdXIgPHZpcmVuZHJhLnRoYWt1ckBrcGl0LmNvbT4KKworQ1ZFOiBDVkUtMjAyMS0z
NzUwCisKK1Vwc3RyZWFtLVN0YXR1czogQmFja3BvcnQgW2h0dHBzOi8vZ2l0LnFlbXUub3JnLz9w
PXFlbXUuZ2l0O2E9Y29tbWl0O2g9YjlkMzgzYWI3OTdmNTRhZTVmYTg3NDYxMTc3NzA3MDk5MjFk
YzUyOV0KKy0tLQorIGh3L2ludGMvYXJtX2dpY3YzX3JlZGlzdC5jIHwgNCArKy0tCisgMSBmaWxl
IGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKKworZGlmZiAtLWdpdCBh
L2h3L2ludGMvYXJtX2dpY3YzX3JlZGlzdC5jIGIvaHcvaW50Yy9hcm1fZ2ljdjNfcmVkaXN0LmMK
K2luZGV4IGM4ZmYzZWMuLjk5YjExY2EgMTAwNjQ0CistLS0gYS9ody9pbnRjL2FybV9naWN2M19y
ZWRpc3QuYworKysrIGIvaHcvaW50Yy9hcm1fZ2ljdjNfcmVkaXN0LmMKK0BAIC00NjIsNyArNDYy
LDcgQEAgTWVtVHhSZXN1bHQgZ2ljdjNfcmVkaXN0X3JlYWQodm9pZCAqb3BhcXVlLCBod2FkZHIg
b2Zmc2V0LCB1aW50NjRfdCAqZGF0YSwKKyAgICAgICAgIGJyZWFrOworICAgICB9CisgCistICAg
IGlmIChyID09IE1FTVRYX0VSUk9SKSB7CisrICAgIGlmIChyICE9IE1FTVRYX09LKSB7CisgICAg
ICAgICBxZW11X2xvZ19tYXNrKExPR19HVUVTVF9FUlJPUiwKKyAgICAgICAgICAgICAgICAgICAg
ICAgIiVzOiBpbnZhbGlkIGd1ZXN0IHJlYWQgYXQgb2Zmc2V0ICIgVEFSR0VUX0ZNVF9wbHgKKyAg
ICAgICAgICAgICAgICAgICAgICAgIiBzaXplICV1XG4iLCBfX2Z1bmNfXywgb2Zmc2V0LCBzaXpl
KTsKK0BAIC01MjEsNyArNTIxLDcgQEAgTWVtVHhSZXN1bHQgZ2ljdjNfcmVkaXN0X3dyaXRlKHZv
aWQgKm9wYXF1ZSwgaHdhZGRyIG9mZnNldCwgdWludDY0X3QgZGF0YSwKKyAgICAgICAgIGJyZWFr
OworICAgICB9CisgCistICAgIGlmIChyID09IE1FTVRYX0VSUk9SKSB7CisrICAgIGlmIChyICE9
IE1FTVRYX09LKSB7CisgICAgICAgICBxZW11X2xvZ19tYXNrKExPR19HVUVTVF9FUlJPUiwKKyAg
ICAgICAgICAgICAgICAgICAgICAgIiVzOiBpbnZhbGlkIGd1ZXN0IHdyaXRlIGF0IG9mZnNldCAi
IFRBUkdFVF9GTVRfcGx4CisgICAgICAgICAgICAgICAgICAgICAgICIgc2l6ZSAldVxuIiwgX19m
dW5jX18sIG9mZnNldCwgc2l6ZSk7CistLSAKKzEuOC4zLjEKKwpkaWZmIC0tZ2l0IGEvbWV0YS9y
ZWNpcGVzLWRldnRvb2xzL3FlbXUvcWVtdS9DVkUtMjAyMS0zNzUwLTIucGF0Y2ggYi9tZXRhL3Jl
Y2lwZXMtZGV2dG9vbHMvcWVtdS9xZW11L0NWRS0yMDIxLTM3NTAtMi5wYXRjaApuZXcgZmlsZSBt
b2RlIDEwMDY0NAppbmRleCAwMDAwMDAwMDAwLi4xY2UzMjA4OWE4Ci0tLSAvZGV2L251bGwKKysr
IGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3FlbXUvcWVtdS9DVkUtMjAyMS0zNzUwLTIucGF0Y2gK
QEAgLTAsMCArMSw2NSBAQAorRnJvbSA1OGU3NDY4MmJhZjRlMWFkMjZiMDY0ZDhjMDJlNWJjOTlj
NzVjNWQ5IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbTogPT91dGY4P3E/UGhpbGlwcGU9
MjBNYXRoaWV1LURhdWQ9QzM9QTk/PSA8cGhpbG1kQHJlZGhhdC5jb20+CitEYXRlOiBXZWQsIDE1
IERlYyAyMDIxIDE5OjI0OjIwICswMTAwCitTdWJqZWN0OiBbUEFUQ0hdIHNvZnRtbXUvcGh5c21l
bTogU2ltcGxpZnkgZmxhdHZpZXdfd3JpdGUgYW5kCisgYWRkcmVzc19zcGFjZV9hY2Nlc3NfdmFs
aWQKK01JTUUtVmVyc2lvbjogMS4wCitDb250ZW50LVR5cGU6IHRleHQvcGxhaW47IGNoYXJzZXQ9
dXRmOAorQ29udGVudC1UcmFuc2Zlci1FbmNvZGluZzogOGJpdAorCitSZW1vdmUgdW51c2VmdWwg
bG9jYWwgJ3Jlc3VsdCcgdmFyaWFibGVzLgorCitSZXZpZXdlZC1ieTogUGV0ZXIgWHUgPHBldGVy
eEByZWRoYXQuY29tPgorUmV2aWV3ZWQtYnk6IERhdmlkIEhpbGRlbmJyYW5kIDxkYXZpZEByZWRo
YXQuY29tPgorUmV2aWV3ZWQtYnk6IEFsZXhhbmRlciBCdWxla292IDxhbHhuZHJAYnUuZWR1Pgor
UmV2aWV3ZWQtYnk6IFN0ZWZhbiBIYWpub2N6aSA8c3RlZmFuaGFAcmVkaGF0LmNvbT4KK1NpZ25l
ZC1vZmYtYnk6IFBoaWxpcHBlIE1hdGhpZXUtRGF1ZMODwqkgPHBoaWxtZEByZWRoYXQuY29tPgor
TWVzc2FnZS1JZDogPDIwMjExMjE1MTgyNDIxLjQxODM3NC0zLXBoaWxtZEByZWRoYXQuY29tPgor
U2lnbmVkLW9mZi1ieTogVGhvbWFzIEh1dGggPHRodXRoQHJlZGhhdC5jb20+CitTaWduZWQtb2Zm
LWJ5OiBWaXJlbmRyYSBUaGFrdXIgPHZpcmVuZHJhLnRoYWt1ckBrcGl0LmNvbT4KKworQ1ZFOiBD
VkUtMjAyMS0zNzUwCisKK1Vwc3RyZWFtLVN0YXR1czogQmFja3BvcnQgW2h0dHBzOi8vZ2l0LnFl
bXUub3JnLz9wPXFlbXUuZ2l0O2E9Y29tbWl0O2g9NThlNzQ2ODJiYWY0ZTFhZDI2YjA2NGQ4YzAy
ZTViYzk5Yzc1YzVkOV0KKy0tLQorIHNvZnRtbXUvcGh5c21lbS5jIHwgMTEgKysrLS0tLS0tLS0K
KyAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCA4IGRlbGV0aW9ucygtKQorCitkaWZm
IC0tZ2l0IGEvc29mdG1tdS9waHlzbWVtLmMgYi9zb2Z0bW11L3BoeXNtZW0uYworaW5kZXggNDNh
ZTcwZi4uM2Q5NjhjYSAxMDA2NDQKKy0tLSBhL3NvZnRtbXUvcGh5c21lbS5jCisrKysgYi9zb2Z0
bW11L3BoeXNtZW0uYworQEAgLTI4MjYsMTQgKzI4MjYsMTEgQEAgc3RhdGljIE1lbVR4UmVzdWx0
IGZsYXR2aWV3X3dyaXRlKEZsYXRWaQorICAgICBod2FkZHIgbDsKKyAgICAgaHdhZGRyIGFkZHIx
OworICAgICBNZW1vcnlSZWdpb24gKm1yOworLSAgICBNZW1UeFJlc3VsdCByZXN1bHQgPSBNRU1U
WF9PSzsKKyAKKyAgICAgbCA9IGxlbjsKKyAgICAgbXIgPSBmbGF0dmlld190cmFuc2xhdGUoZnYs
IGFkZHIsICZhZGRyMSwgJmwsIHRydWUsIGF0dHJzKTsKKy0gICAgcmVzdWx0ID0gZmxhdHZpZXdf
d3JpdGVfY29udGludWUoZnYsIGFkZHIsIGF0dHJzLCBidWYsIGxlbiwKKy0gICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgYWRkcjEsIGwsIG1yKTsKKy0KKy0gICAgcmV0dXJuIHJl
c3VsdDsKKysgICAgcmV0dXJuIGZsYXR2aWV3X3dyaXRlX2NvbnRpbnVlKGZ2LCBhZGRyLCBhdHRy
cywgYnVmLCBsZW4sCisrICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBhZGRyMSwg
bCwgbXIpOworIH0KKyAKKyAvKiBDYWxsZWQgd2l0aGluIFJDVSBjcml0aWNhbCBzZWN0aW9uLiAg
Ki8KK0BAIC0zMTMwLDEyICszMTI3LDEwIEBAIGJvb2wgYWRkcmVzc19zcGFjZV9hY2Nlc3NfdmFs
aWQoQWRkcmVzc1MKKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIE1lbVR4QXR0cnMg
YXR0cnMpCisgeworICAgICBGbGF0VmlldyAqZnY7CistICAgIGJvb2wgcmVzdWx0OworIAorICAg
ICBSQ1VfUkVBRF9MT0NLX0dVQVJEKCk7CisgICAgIGZ2ID0gYWRkcmVzc19zcGFjZV90b19mbGF0
dmlldyhhcyk7CistICAgIHJlc3VsdCA9IGZsYXR2aWV3X2FjY2Vzc192YWxpZChmdiwgYWRkciwg
bGVuLCBpc193cml0ZSwgYXR0cnMpOworLSAgICByZXR1cm4gcmVzdWx0OworKyAgICByZXR1cm4g
ZmxhdHZpZXdfYWNjZXNzX3ZhbGlkKGZ2LCBhZGRyLCBsZW4sIGlzX3dyaXRlLCBhdHRycyk7Cisg
fQorIAorIHN0YXRpYyBod2FkZHIKKy0tIAorMS44LjMuMQorCmRpZmYgLS1naXQgYS9tZXRhL3Jl
Y2lwZXMtZGV2dG9vbHMvcWVtdS9xZW11L0NWRS0yMDIxLTM3NTAtMy5wYXRjaCBiL21ldGEvcmVj
aXBlcy1kZXZ0b29scy9xZW11L3FlbXUvQ1ZFLTIwMjEtMzc1MC0zLnBhdGNoCm5ldyBmaWxlIG1v
ZGUgMTAwNjQ0CmluZGV4IDAwMDAwMDAwMDAuLjcwMzY0NjM2NWYKLS0tIC9kZXYvbnVsbAorKysg
Yi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcWVtdS9xZW11L0NWRS0yMDIxLTM3NTAtMy5wYXRjaApA
QCAtMCwwICsxLDE1NiBAQAorRnJvbSAzYWI2ZmRjOTFiNzJlMTU2ZGEyMjg0OGYwMDAzZmY0MjI1
NjkwY2VkIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbTogPT91dGY4P3E/UGhpbGlwcGU9
MjBNYXRoaWV1LURhdWQ9QzM9QTk/PSA8cGhpbG1kQHJlZGhhdC5jb20+CitEYXRlOiBXZWQsIDE1
IERlYyAyMDIxIDE5OjI0OjIxICswMTAwCitTdWJqZWN0OiBbUEFUQ0hdIHNvZnRtbXUvcGh5c21l
bTogSW50cm9kdWNlIE1lbVR4QXR0cnM6Om1lbW9yeSBmaWVsZCBhbmQKKyBNRU1UWF9BQ0NFU1Nf
RVJST1IKK01JTUUtVmVyc2lvbjogMS4wCitDb250ZW50LVR5cGU6IHRleHQvcGxhaW47IGNoYXJz
ZXQ9dXRmOAorQ29udGVudC1UcmFuc2Zlci1FbmNvZGluZzogOGJpdAorCitBZGQgdGhlICdtZW1v
cnknIGJpdCB0byB0aGUgbWVtb3J5IGF0dHJpYnV0ZXMgdG8gcmVzdHJpY3QgYnVzCitjb250cm9s
bGVyIGFjY2Vzc2VzIHRvIG1lbW9yaWVzLgorCitJbnRyb2R1Y2UgZmxhdHZpZXdfYWNjZXNzX2Fs
bG93ZWQoKSB0byBjaGVjayBidXMgcGVybWlzc2lvbgorYmVmb3JlIHJ1bm5pbmcgYW55IGJ1cyB0
cmFuc2FjdGlvbi4KKworSGF2ZSByZWFkL3dyaXRlIGFjY2Vzc29ycyByZXR1cm4gTUVNVFhfQUND
RVNTX0VSUk9SIGlmIGFuIGFjY2VzcyBpcworcmVzdHJpY3RlZC4KKworVGhlcmUgaXMgbm8gY2hh
bmdlIGZvciB0aGUgZGVmYXVsdCBjYXNlIHdoZXJlICdtZW1vcnknIGlzIG5vdCBzZXQuCisKK1Np
Z25lZC1vZmYtYnk6IFBoaWxpcHBlIE1hdGhpZXUtRGF1ZMODwqkgPHBoaWxtZEByZWRoYXQuY29t
PgorTWVzc2FnZS1JZDogPDIwMjExMjE1MTgyNDIxLjQxODM3NC00LXBoaWxtZEByZWRoYXQuY29t
PgorUmV2aWV3ZWQtYnk6IFJpY2hhcmQgSGVuZGVyc29uIDxyaWNoYXJkLmhlbmRlcnNvbkBsaW5h
cm8ub3JnPgorUmV2aWV3ZWQtYnk6IFN0ZWZhbiBIYWpub2N6aSA8c3RlZmFuaGFAcmVkaGF0LmNv
bT4KK1t0aHV0aDogUmVwbGFjZWQgTUVNVFhfQlVTX0VSUk9SIHdpdGggTUVNVFhfQUNDRVNTX0VS
Uk9SLCByZW1vdmUgImlubGluZSJdCitTaWduZWQtb2ZmLWJ5OiBUaG9tYXMgSHV0aCA8dGh1dGhA
cmVkaGF0LmNvbT4KK1NpZ25lZC1vZmYtYnk6IFZpcmVuZHJhIFRoYWt1ciA8dmlyZW5kcmEudGhh
a3VyQGtwaXQuY29tPgorCitDVkU6IENWRS0yMDIxLTM3NTAKKworVXBzdHJlYW0tU3RhdHVzOiBC
YWNrcG9ydCBbaHR0cHM6Ly9naXQucWVtdS5vcmcvP3A9cWVtdS5naXQ7YT1jb21taXQ7aD0zYWI2
ZmRjOTFiNzJlMTU2ZGEyMjg0OGYwMDAzZmY0MjI1NjkwY2VkXQorLS0tCisgaW5jbHVkZS9leGVj
L21lbWF0dHJzLmggfCAgOSArKysrKysrKysKKyBzb2Z0bW11L3BoeXNtZW0uYyAgICAgICB8IDQ0
ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKy0tCisgMiBmaWxlcyBj
aGFuZ2VkLCA1MSBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQorCitkaWZmIC0tZ2l0IGEv
aW5jbHVkZS9leGVjL21lbWF0dHJzLmggYi9pbmNsdWRlL2V4ZWMvbWVtYXR0cnMuaAoraW5kZXgg
OTVmMmQyMC4uOWZiOThiYyAxMDA2NDQKKy0tLSBhL2luY2x1ZGUvZXhlYy9tZW1hdHRycy5oCisr
KysgYi9pbmNsdWRlL2V4ZWMvbWVtYXR0cnMuaAorQEAgLTM1LDYgKzM1LDE0IEBAIHR5cGVkZWYg
c3RydWN0IE1lbVR4QXR0cnMgeworICAgICB1bnNpZ25lZCBpbnQgc2VjdXJlOjE7CisgICAgIC8q
IE1lbW9yeSBhY2Nlc3MgaXMgdXNlcm1vZGUgKHVucHJpdmlsZWdlZCkgKi8KKyAgICAgdW5zaWdu
ZWQgaW50IHVzZXI6MTsKKysgICAgLyoKKysgICAgICogQnVzIGludGVyY29ubmVjdCBhbmQgcGVy
aXBoZXJhbHMgY2FuIGFjY2VzcyBhbnl0aGluZyAobWVtb3JpZXMsCisrICAgICAqIGRldmljZXMp
IGJ5IGRlZmF1bHQuIEJ5IHNldHRpbmcgdGhlICdtZW1vcnknIGJpdCwgYnVzIHRyYW5zYWN0aW9u
CisrICAgICAqIGFyZSByZXN0cmljdGVkIHRvICJub3JtYWwiIG1lbW9yaWVzIChwZXIgdGhlIEFN
QkEgZG9jdW1lbnRhdGlvbikKKysgICAgICogdmVyc3VzIGRldmljZXMuIEFjY2VzcyB0byBkZXZp
Y2VzIHdpbGwgYmUgbG9nZ2VkIGFuZCByZWplY3RlZAorKyAgICAgKiAoc2VlIE1FTVRYX0FDQ0VT
U19FUlJPUikuCisrICAgICAqLworKyAgICB1bnNpZ25lZCBpbnQgbWVtb3J5OjE7CisgICAgIC8q
IFJlcXVlc3RlciBJRCAoZm9yIE1TSSBmb3IgZXhhbXBsZSkgKi8KKyAgICAgdW5zaWduZWQgaW50
IHJlcXVlc3Rlcl9pZDoxNjsKKyAgICAgLyogSW52ZXJ0IGVuZGlhbm5lc3MgZm9yIHRoaXMgcGFn
ZSAqLworQEAgLTY2LDYgKzc0LDcgQEAgdHlwZWRlZiBzdHJ1Y3QgTWVtVHhBdHRycyB7CisgI2Rl
ZmluZSBNRU1UWF9PSyAwCisgI2RlZmluZSBNRU1UWF9FUlJPUiAgICAgICAgICAgICAoMVUgPDwg
MCkgLyogZGV2aWNlIHJldHVybmVkIGFuIGVycm9yICovCisgI2RlZmluZSBNRU1UWF9ERUNPREVf
RVJST1IgICAgICAoMVUgPDwgMSkgLyogbm90aGluZyBhdCB0aGF0IGFkZHJlc3MgKi8KKysjZGVm
aW5lIE1FTVRYX0FDQ0VTU19FUlJPUiAgICAgICgxVSA8PCAyKSAvKiBhY2Nlc3MgZGVuaWVkICov
CisgdHlwZWRlZiB1aW50MzJfdCBNZW1UeFJlc3VsdDsKKyAKKyAjZW5kaWYKK2RpZmYgLS1naXQg
YS9zb2Z0bW11L3BoeXNtZW0uYyBiL3NvZnRtbXUvcGh5c21lbS5jCitpbmRleCAzZDk2OGNhLi40
ZTFiMjdhIDEwMDY0NAorLS0tIGEvc29mdG1tdS9waHlzbWVtLmMKKysrKyBiL3NvZnRtbXUvcGh5
c21lbS5jCitAQCAtNDEsNiArNDEsNyBAQAorICNpbmNsdWRlICJxZW11L2NvbmZpZy1maWxlLmgi
CisgI2luY2x1ZGUgInFlbXUvZXJyb3ItcmVwb3J0LmgiCisgI2luY2x1ZGUgInFlbXUvcWVtdS1w
cmludC5oIgorKyNpbmNsdWRlICJxZW11L2xvZy5oIgorICNpbmNsdWRlICJleGVjL21lbW9yeS5o
IgorICNpbmNsdWRlICJleGVjL2lvcG9ydC5oIgorICNpbmNsdWRlICJzeXNlbXUvZG1hLmgiCitA
QCAtMjc1OSw2ICsyNzYwLDMzIEBAIHN0YXRpYyBib29sIHByZXBhcmVfbW1pb19hY2Nlc3MoTWVt
b3J5UmUKKyAgICAgcmV0dXJuIHJlbGVhc2VfbG9jazsKKyB9CisgCisrLyoqCisrICogZmxhdHZp
ZXdfYWNjZXNzX2FsbG93ZWQKKysgKiBAbXI6ICNNZW1vcnlSZWdpb24gdG8gYmUgYWNjZXNzZWQK
KysgKiBAYXR0cnM6IG1lbW9yeSB0cmFuc2FjdGlvbiBhdHRyaWJ1dGVzCisrICogQGFkZHI6IGFk
ZHJlc3Mgd2l0aGluIHRoYXQgbWVtb3J5IHJlZ2lvbgorKyAqIEBsZW46IHRoZSBudW1iZXIgb2Yg
Ynl0ZXMgdG8gYWNjZXNzCisrICoKKysgKiBDaGVjayBpZiBhIG1lbW9yeSB0cmFuc2FjdGlvbiBp
cyBhbGxvd2VkLgorKyAqCisrICogUmV0dXJuczogdHJ1ZSBpZiB0cmFuc2FjdGlvbiBpcyBhbGxv
d2VkLCBmYWxzZSBpZiBkZW5pZWQuCisrICovCisrc3RhdGljIGJvb2wgZmxhdHZpZXdfYWNjZXNz
X2FsbG93ZWQoTWVtb3J5UmVnaW9uICptciwgTWVtVHhBdHRycyBhdHRycywKKysgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBod2FkZHIgYWRkciwgaHdhZGRyIGxlbikKKyt7Cisr
ICAgIGlmIChsaWtlbHkoIWF0dHJzLm1lbW9yeSkpIHsKKysgICAgICAgIHJldHVybiB0cnVlOwor
KyAgICB9CisrICAgIGlmIChtZW1vcnlfcmVnaW9uX2lzX3JhbShtcikpIHsKKysgICAgICAgIHJl
dHVybiB0cnVlOworKyAgICB9CisrICAgIHFlbXVfbG9nX21hc2soTE9HX0dVRVNUX0VSUk9SLAor
KyAgICAgICAgICAgICAgICAgICJJbnZhbGlkIGFjY2VzcyB0byBub24tUkFNIGRldmljZSBhdCAi
CisrICAgICAgICAgICAgICAgICAgImFkZHIgMHglIiBIV0FERFJfUFJJWCAiLCBzaXplICUiIEhX
QUREUl9QUkl1ICIsICIKKysgICAgICAgICAgICAgICAgICAicmVnaW9uICclcydcbiIsIGFkZHIs
IGxlbiwgbWVtb3J5X3JlZ2lvbl9uYW1lKG1yKSk7CisrICAgIHJldHVybiBmYWxzZTsKKyt9Cisr
CisgLyogQ2FsbGVkIHdpdGhpbiBSQ1UgY3JpdGljYWwgc2VjdGlvbi4gICovCisgc3RhdGljIE1l
bVR4UmVzdWx0IGZsYXR2aWV3X3dyaXRlX2NvbnRpbnVlKEZsYXRWaWV3ICpmdiwgaHdhZGRyIGFk
ZHIsCisgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIE1lbVR4QXR0
cnMgYXR0cnMsCitAQCAtMjc3Myw3ICsyODAxLDEwIEBAIHN0YXRpYyBNZW1UeFJlc3VsdCBmbGF0
dmlld193cml0ZV9jb250aW4KKyAgICAgY29uc3QgdWludDhfdCAqYnVmID0gcHRyOworIAorICAg
ICBmb3IgKDs7KSB7CistICAgICAgICBpZiAoIW1lbW9yeV9hY2Nlc3NfaXNfZGlyZWN0KG1yLCB0
cnVlKSkgeworKyAgICAgICAgaWYgKCFmbGF0dmlld19hY2Nlc3NfYWxsb3dlZChtciwgYXR0cnMs
IGFkZHIxLCBsKSkgeworKyAgICAgICAgICAgIHJlc3VsdCB8PSBNRU1UWF9BQ0NFU1NfRVJST1I7
CisrICAgICAgICAgICAgLyogS2VlcCBnb2luZy4gKi8KKysgICAgICAgIH0gZWxzZSBpZiAoIW1l
bW9yeV9hY2Nlc3NfaXNfZGlyZWN0KG1yLCB0cnVlKSkgeworICAgICAgICAgICAgIHJlbGVhc2Vf
bG9jayB8PSBwcmVwYXJlX21taW9fYWNjZXNzKG1yKTsKKyAgICAgICAgICAgICBsID0gbWVtb3J5
X2FjY2Vzc19zaXplKG1yLCBsLCBhZGRyMSk7CisgICAgICAgICAgICAgLyogWFhYOiBjb3VsZCBm
b3JjZSBjdXJyZW50X2NwdSB0byBOVUxMIHRvIGF2b2lkCitAQCAtMjgxOCw2ICsyODQ5LDkgQEAg
c3RhdGljIE1lbVR4UmVzdWx0IGZsYXR2aWV3X3dyaXRlKEZsYXRWaQorIAorICAgICBsID0gbGVu
OworICAgICBtciA9IGZsYXR2aWV3X3RyYW5zbGF0ZShmdiwgYWRkciwgJmFkZHIxLCAmbCwgdHJ1
ZSwgYXR0cnMpOworKyAgICBpZiAoIWZsYXR2aWV3X2FjY2Vzc19hbGxvd2VkKG1yLCBhdHRycywg
YWRkciwgbGVuKSkgeworKyAgICAgICAgcmV0dXJuIE1FTVRYX0FDQ0VTU19FUlJPUjsKKysgICAg
fQorICAgICByZXR1cm4gZmxhdHZpZXdfd3JpdGVfY29udGludWUoZnYsIGFkZHIsIGF0dHJzLCBi
dWYsIGxlbiwKKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGFkZHIxLCBsLCBt
cik7CisgfQorQEAgLTI4MzYsNyArMjg3MCwxMCBAQCBNZW1UeFJlc3VsdCBmbGF0dmlld19yZWFk
X2NvbnRpbnVlKEZsYXRWCisgCisgICAgIGZ1enpfZG1hX3JlYWRfY2IoYWRkciwgbGVuLCBtcik7
CisgICAgIGZvciAoOzspIHsKKy0gICAgICAgIGlmICghbWVtb3J5X2FjY2Vzc19pc19kaXJlY3Qo
bXIsIGZhbHNlKSkgeworKyAgICAgICAgaWYgKCFmbGF0dmlld19hY2Nlc3NfYWxsb3dlZChtciwg
YXR0cnMsIGFkZHIxLCBsKSkgeworKyAgICAgICAgICAgIHJlc3VsdCB8PSBNRU1UWF9BQ0NFU1Nf
RVJST1I7CisrICAgICAgICAgICAgLyogS2VlcCBnb2luZy4gKi8KKysgICAgICAgIH0gZWxzZSBp
ZiAoIW1lbW9yeV9hY2Nlc3NfaXNfZGlyZWN0KG1yLCBmYWxzZSkpIHsKKyAgICAgICAgICAgICAv
KiBJL08gY2FzZSAqLworICAgICAgICAgICAgIHJlbGVhc2VfbG9jayB8PSBwcmVwYXJlX21taW9f
YWNjZXNzKG1yKTsKKyAgICAgICAgICAgICBsID0gbWVtb3J5X2FjY2Vzc19zaXplKG1yLCBsLCBh
ZGRyMSk7CitAQCAtMjg3OSw2ICsyOTE2LDkgQEAgc3RhdGljIE1lbVR4UmVzdWx0IGZsYXR2aWV3
X3JlYWQoRmxhdFZpZQorIAorICAgICBsID0gbGVuOworICAgICBtciA9IGZsYXR2aWV3X3RyYW5z
bGF0ZShmdiwgYWRkciwgJmFkZHIxLCAmbCwgZmFsc2UsIGF0dHJzKTsKKysgICAgaWYgKCFmbGF0
dmlld19hY2Nlc3NfYWxsb3dlZChtciwgYXR0cnMsIGFkZHIsIGxlbikpIHsKKysgICAgICAgIHJl
dHVybiBNRU1UWF9BQ0NFU1NfRVJST1I7CisrICAgIH0KKyAgICAgcmV0dXJuIGZsYXR2aWV3X3Jl
YWRfY29udGludWUoZnYsIGFkZHIsIGF0dHJzLCBidWYsIGxlbiwKKyAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgYWRkcjEsIGwsIG1yKTsKKyB9CistLSAKKzEuOC4zLjEKKwotLSAK
Mi4xNy4xCgo=

--_004_MAXPR01MB43275C9203484CFC733FFA929D599MAXPR01MB4327INDP_--

