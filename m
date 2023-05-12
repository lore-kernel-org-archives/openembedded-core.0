Return-Path: <fabiferro@hotmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1251CC77B7F
	for <webhook@archiver.kernel.org>; Fri, 12 May 2023 17:31:04 +0000 (UTC)
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (NAM02-BN1-obe.outbound.protection.outlook.com [40.92.15.21])
 by mx.groups.io with SMTP id smtpd.web11.30866.1683912660719288039
 for <openembedded-core@lists.openembedded.org>;
 Fri, 12 May 2023 10:31:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@hotmail.com header.s=selector1 header.b=jR+cplVO;
 spf=pass (domain: hotmail.com, ip: 40.92.15.21, mailfrom: fabiferro@hotmail.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FMHoV1AzKGklewgVYNUzsQa9VIGVxtiU1GIwcuzTNqBAH4DYaYbebTQSxj9k6+2l1YD+YdU1pQ2JEbZLA2B2Ct0AhA9my5/WGX4WBWraOC1jm6tm2gxqO3c5J3spU8wiLdLzRHwQq3+yMJz6oezvQ47tm79bz9FPmKukY9NH3FpWeVtSJcNMCllDhOSOz2JcCNemEz36csYGEQOfd+KnyiwzPjl0uxn1l0H19pn1NR6Mbe4eYUM2DPMkWnw+XwDEpoW1thsNz9WHV8xgXtPebrWSQXv6FrgW4PpHjC+lLr3VducbKscDslTBLtvHHZUU6idJl8+FxVZEZgcRoQX3/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Fye9pIFmTa3amSD17ggDIlnrNAKDCECrDgnswps0Xlo=;
 b=CAjQlWrUeq4K4Umf2sZcA2VNjBH8jj9l6pUiLxLKw5iL3hoaTRPdpJ08Yt4WYSdgeuC7MmvBQM6StolOjPl2kmn1foocdJ17V0YDdEV34L0UYmh0DWoLQnz8CYENgSqF1YHaBMnT3N5JFTRHAfThUBUQ/gWfhGAWcH1gDYrQOf2v8ZnkIPijO6eLX9N5fLWsuJ7D9hYmwhjC3QDXTG3fA+iP/5oo/TeS+tf4DgZgEura9mJMa+xOz1By5C17NW1EkcD8yVPNsyZq1aKMDcnvdiTcj3+ZiCyMd8bFeqfr5T2IOpE3XUipZuvcCIZxcXJ4SKw0Iiaf2/d/aOBWXRsOZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Fye9pIFmTa3amSD17ggDIlnrNAKDCECrDgnswps0Xlo=;
 b=jR+cplVOywXfhhdSdwsxDHgxUwB05zOli/sNlR84IAhaxxJxCKzV3HJBs/gEWNemFCNW9nCGbwtQgfVAtdRgzFAMiQEi8mNr11a/iTWDAzuSn8KZ3ebsb9OZqfBSfkv6qTkxmmrpd9o54dglIZAuzmU8+Lnrz1ED9O64DDseVHwFFfcn4eF4OfkkdKINV6BpdE3ZJwCPjwDl4JtfKoiQcqfRxMQnNZco7udQvPpH4CVAnFL30i9NMiJnKFzRRdBv8ZVBouHaRFI4BXIrI9FVreWWWDmYKmrHfRAJEsHuq7VVxFf91iBPRw2gUprUfV0SS0qeFNcLDOHmR9HWiaTlNw==
Received: from SJ0PR03MB7050.namprd03.prod.outlook.com (2603:10b6:a03:4d6::14)
 by SJ0PR03MB6550.namprd03.prod.outlook.com (2603:10b6:a03:38e::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.24; Fri, 12 May
 2023 17:30:58 +0000
Received: from SJ0PR03MB7050.namprd03.prod.outlook.com
 ([fe80::d9fc:1fcc:9866:3fe]) by SJ0PR03MB7050.namprd03.prod.outlook.com
 ([fe80::d9fc:1fcc:9866:3fe%7]) with mapi id 15.20.6387.021; Fri, 12 May 2023
 17:30:58 +0000
From: Fabiano Ferronato <fabiferro@hotmail.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: [Kirkstone][PATCH] kernel.bbclass: Backport improve initramfs bundle
 processing time
Thread-Topic: [Kirkstone][PATCH] kernel.bbclass: Backport improve initramfs
 bundle processing time
Thread-Index: AQHZhPc5ZtyPb/Whw0ab1nYPjubIyA==
Date: Fri, 12 May 2023 17:30:58 +0000
Message-ID: 
 <SJ0PR03MB70500DC32860BC4008C279C6AF759@SJ0PR03MB7050.namprd03.prod.outlook.com>
Accept-Language: en-GB, pt-BR, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-tmn: [ZsSvzOV+mV4HaulZQsFDyyvCKTSvROQX]
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR03MB7050:EE_|SJ0PR03MB6550:EE_
x-ms-office365-filtering-correlation-id: 77681b61-090c-4f9b-ec13-08db530ea61a
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 9CdamQPTcu3sNNx1RikWKLsTHjB0cibwhcKAGvZTZBIe+09bYbUCEwXzS8Tw/VUw8VTEC6tJQonC0/jILIqzYGW7rM/8WZ0BiH6FZdR0UP8wzwXHm2P+XH4X9+I1p9dHL6v/qJdcacrI1JthnvvfO5fBUOREtXS7X3RrHTFGCTE3JV1BcCEOxJfT8JzGCW7mFvxWLgMJR7IplWvbzteuQ2JLrNi/uvnNsb+WtVgVwXaN+HoA9VG2ub5q4QX4dZFIm+zoQDkZB2Ldr0GlpjQbb8GUwjkb9+d1pBnWVePuamugDgN9jqudNHEm3lgA23dGPJodXh2o0oSHgh9aBb3BSjuOBH/0fuqTKsMVjjulhMu7Ro8zit/Db94xGapcpqOUQhR4syucc2Vjp6t9jep4KPGCxTw98u++UN6i5Wf2anwnAaaMTV3xU5AzGNX71QmSknPdRrTiDT9KWIgj7jbHfbGSmRYzsrGWtbB/eRNndqGGHkmaqUpzmZ+W539TSMSY8lNa86KGlGM2rbbjcqKW8cmowuc4iuFw2YldZ7YyZFeL4uPw2jgozs637o1TcUej
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?O1HlN+rl4Ut3whw0iOJSuJaoybfnYjoiPljcvC3kZET7YA1X2DmEn3+xBh?=
 =?iso-8859-1?Q?YUvc/FLl9v2yKGSk6NCLrVWgigcNz76WO6fxQ1E8N/xadfxO9Qpc1rw2Ra?=
 =?iso-8859-1?Q?vhkJYIYSQO5RLbJQd6haGgwSKm5BNG+i1LFU8pG7o16w6fmViHmeW/I91W?=
 =?iso-8859-1?Q?B+Hh4TdtrCkr3AAhVcZdWwHToBFbs82HwQfp8bT7DBkW0HQHYfUhx8HHNv?=
 =?iso-8859-1?Q?gWeAUVK3FDMF6EaVllmJ8BCyY93Zja/2CbXuqHXq4mIkotW4Wg1ciWdIIy?=
 =?iso-8859-1?Q?dmB9E9BCdLNL+Q1WnhIvfcbYxqG2q5bGScj5d7uNRHOcgUtj08jAjSYZSF?=
 =?iso-8859-1?Q?hebu+upWs0Ailn9WLvku/6J5Em5cI3Emkz8itV215ylxjHKaPSVBRGsnJ9?=
 =?iso-8859-1?Q?7cQe9nFrklaz5+K08lqWCYYgWlyawPu4+vw125/BdQT7kMmCMIILl8CqaE?=
 =?iso-8859-1?Q?Gg0aSFtqhiVPTZQAOiQDzqQQ8+6gvtwS01MoYrcSxG9XF0la7WFDw+6Dnj?=
 =?iso-8859-1?Q?3HkRSiw9HzjGzXxrRS84OaV2EAWkBYQOlW6V/K2PFrLaeBJTbGhbUzxaKh?=
 =?iso-8859-1?Q?RaCfsvkihovohOjM/WSKcS23vGOxAUq8PFvhvaCw6Zm7O0eMmYEOPDlrgr?=
 =?iso-8859-1?Q?/HzZGGQp1GR4QuROjAjWBBlt4zPPCsbP/r7G2jOkRdBxmhTTjS8nakIKcE?=
 =?iso-8859-1?Q?SUj/1iAu7pqK/y7zD0/BpUkD1ScjvzWWLfPwHYGVQBS1MYHMHNuOAZ0UP5?=
 =?iso-8859-1?Q?mEvqALKGqkhdBptnBh4Idw5xwf4R2x84RKU6XZTyE6yQZ/a3eBHDWf6g1a?=
 =?iso-8859-1?Q?hdwl2tXRU7xwhrv3mgfbb47c63mBrF8TXi2wvUJDkfKb8RzfFKTCXaspXk?=
 =?iso-8859-1?Q?zEGcW1vrNO8luTSzQ5f95XyRs946a4u4dY7+aZ7CrX7hcfzIzzTpgZP3/s?=
 =?iso-8859-1?Q?EazONLksy46kmQt8xkqh/Z2vGQYsC/SUP+lY8XDnMscaCsHvypr7gVvMvj?=
 =?iso-8859-1?Q?+BsM7+IzS/RwrPkyJrCDuF3DUC5AlqA9Xbo6UMq6np2H0kbavxNsep7Ryi?=
 =?iso-8859-1?Q?xWuMN21h1ZV576mTceI7TOIfJ83PRMD5SznkgUSVfkQ6bSZmV6kDcCzv86?=
 =?iso-8859-1?Q?TZxDi7w0JpbkoUzufN/62/cdB9C8IAm6tIYBsMBuHNK+1nCrOcqTX49o8G?=
 =?iso-8859-1?Q?IPi+/S4b8sTwULQh6H/84CBKvaD0EK5RMJUryMQh7j0C0rbFHSwRopwxwM?=
 =?iso-8859-1?Q?Fan0ojQ+g4mZ9TLx0L+A=3D=3D?=
Content-Type: multipart/alternative;
	boundary="_000_SJ0PR03MB70500DC32860BC4008C279C6AF759SJ0PR03MB7050namp_"
MIME-Version: 1.0
X-OriginatorOrg: sct-15-20-4755-11-msonline-outlook-685f7.templateTenant
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB7050.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 77681b61-090c-4f9b-ec13-08db530ea61a
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 May 2023 17:30:58.4161
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB6550
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 12 May 2023 17:31:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181192

--_000_SJ0PR03MB70500DC32860BC4008C279C6AF759SJ0PR03MB7050namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

From 6ec497c2c87ceb75cd61dee9b91dcbe650287326 Mon Sep 17 00:00:00 2001
From: Fabiano Ferronato <fabiferro@hotmail.com>
Date: Fri, 12 May 2023 18:05:48 +0200
Subject: [Kirkstone][PATCH] kernel.bbclass: Backport improve initramfs bund=
le
 processing time

Building a bundled initramfs, on do_bundle_initramfs task,
-j defaults to 1, which means no parallel make.

Passing PARALLEL_MAKE explicitly to ensure parallel build.

Backported from upstream.

(From Poky rev: 01f0a371b139d35a6f6f39fdd96f0d1a796684d7)
(From OE-Core rev: 88fd394ecf0f2174b792075d409d87046896426b)

Signed-off-by: Fabiano Ferronato <fabiferro@hotmail.com>
---
 meta/classes/kernel.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index b315737fd2..d45fa25c32 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -377,7 +377,7 @@ kernel_do_compile() {
                use_alternate_initrd=3DCONFIG_INITRAMFS_SOURCE=3D${B}/usr/$=
{INITRAMFS_IMAGE_NAME}.cpio
        fi
        for typeformake in ${KERNEL_IMAGETYPE_FOR_MAKE} ; do
-               oe_runmake ${typeformake} ${KERNEL_EXTRA_ARGS} $use_alterna=
te_initrd
+               oe_runmake ${PARALLEL_MAKE} ${typeformake} ${KERNEL_EXTRA_A=
RGS} $use_alternate_initrd
        done
 }

--
2.30.2

--_000_SJ0PR03MB70500DC32860BC4008C279C6AF759SJ0PR03MB7050namp_
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
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0);" class=3D"elementToProof ContentPasted0">
From 6ec497c2c87ceb75cd61dee9b91dcbe650287326 Mon Sep 17 00:00:00 2001
<div class=3D"ContentPasted0">From: Fabiano Ferronato &lt;fabiferro@hotmail=
.com&gt;</div>
<div class=3D"ContentPasted0">Date: Fri, 12 May 2023 18:05:48 +0200</div>
<div class=3D"ContentPasted0">Subject: [Kirkstone][PATCH] kernel.bbclass: B=
ackport improve initramfs bundle</div>
<div class=3D"ContentPasted0">&nbsp;processing time</div>
<div><br class=3D"ContentPasted0">
</div>
<div class=3D"ContentPasted0">Building a bundled initramfs, on do_bundle_in=
itramfs task,</div>
<div class=3D"ContentPasted0">-j defaults to 1, which means no parallel mak=
e.</div>
<div><br class=3D"ContentPasted0">
</div>
<div class=3D"ContentPasted0">Passing PARALLEL_MAKE explicitly to ensure pa=
rallel build.</div>
<div><br class=3D"ContentPasted0">
</div>
<div class=3D"ContentPasted0">Backported from upstream.</div>
<div><br class=3D"ContentPasted0">
</div>
<div class=3D"ContentPasted0">(From Poky rev: 01f0a371b139d35a6f6f39fdd96f0=
d1a796684d7)</div>
<div class=3D"ContentPasted0">(From OE-Core rev: 88fd394ecf0f2174b792075d40=
9d87046896426b)</div>
<div><br class=3D"ContentPasted0">
</div>
<div class=3D"ContentPasted0">Signed-off-by: Fabiano Ferronato &lt;fabiferr=
o@hotmail.com&gt;</div>
<div class=3D"ContentPasted0">---</div>
<div class=3D"ContentPasted0">&nbsp;meta/classes/kernel.bbclass | 2 +-</div=
>
<div class=3D"ContentPasted0">&nbsp;1 file changed, 1 insertion(+), 1 delet=
ion(-)</div>
<div><br class=3D"ContentPasted0">
</div>
<div class=3D"ContentPasted0">diff --git a/meta/classes/kernel.bbclass b/me=
ta/classes/kernel.bbclass</div>
<div class=3D"ContentPasted0">index b315737fd2..d45fa25c32 100644</div>
<div class=3D"ContentPasted0">--- a/meta/classes/kernel.bbclass</div>
<div class=3D"ContentPasted0">+++ b/meta/classes/kernel.bbclass</div>
<div class=3D"ContentPasted0">@@ -377,7 +377,7 @@ kernel_do_compile() {</di=
v>
<div class=3D"ContentPasted0">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; use_alternate_initrd=3DCONFIG_INITRAMFS_SOURCE=3D${B}/usr/${INIT=
RAMFS_IMAGE_NAME}.cpio</div>
<div class=3D"ContentPasted0">&nbsp; &nbsp; &nbsp; &nbsp; fi</div>
<div class=3D"ContentPasted0">&nbsp; &nbsp; &nbsp; &nbsp; for typeformake i=
n ${KERNEL_IMAGETYPE_FOR_MAKE} ; do</div>
<div class=3D"ContentPasted0">- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; oe_runmake ${typeformake} ${KERNEL_EXTRA_ARGS} $use_alternate_initrd<=
/div>
<div class=3D"ContentPasted0">+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; oe_runmake ${PARALLEL_MAKE} ${typeformake} ${KERNEL_EXTRA_ARGS} $use_=
alternate_initrd</div>
<div class=3D"ContentPasted0">&nbsp; &nbsp; &nbsp; &nbsp; done</div>
<div class=3D"ContentPasted0">&nbsp;}</div>
<div><br class=3D"ContentPasted0">
</div>
<div class=3D"ContentPasted0">--</div>
2.30.2<br>
</div>
</body>
</html>

--_000_SJ0PR03MB70500DC32860BC4008C279C6AF759SJ0PR03MB7050namp_--

