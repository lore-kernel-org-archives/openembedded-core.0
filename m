Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3486D49C83
	for <webhook@archiver.kernel.org>; Fri, 30 Jan 2026 09:17:08 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.66.37])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6744.1769764622081069255
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 Jan 2026 01:17:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=G2NehU52;
 spf=pass (domain: siemens.com, ip: 52.101.66.37, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DOVZ/zhW11nBKx+UlxX4b+vUyPfFrt+D6KAYk3fcjdvKLTxdzPp5jrFeSctvJ2yP1QpAQC8dAj6bgfZXbONORZIHmWYqeKKdWXzsDoahc8OSYYqArJui9Ynak6d/pOexf8QIgB5h9eGrDDnAPbvgcWI7OgqgQZtUyWTxQrQk+2sBL4NMqkfmUOUuYSjK5dyECJEPDAg53NWfwfqPxxW+K7KHitztv73hfljVlNVw09l9U2c4MmQwN0bl79uFClIkG+hjvIftOoxi9kgten8uukNSIEQuYL0YNZNhUUd2+9il6Jl0GiSu5cNo+RD5KWEGh52xx6a4XDz1xk99WLKr7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U3Hg/daDkJ0sRqaAodj0wGPKvIMvbWGX+Ru6E4g454c=;
 b=IlWleNKV+KdFdKHIunXDazlNCD68xPx3Pf9OZb7JsRm9808MjEfpZiwy2FlH8nYHNua4D2ip/2jccx0OzyWyDV7+ebWVqe2wyUXnj5a/C1ILAB6upApuwvtd5+9Qvnt3+525xi9aEVKlsW36u4kHs+2LcbZAuFhKwyoaa4SlKQSko61fmOpS+tK0vd5O4td8oVyaoGKZTIcjQMxQNVG4iH3pH02i701CZBM1hkt6MtZylcD1JpCxpycYV5OZc1p6zszqf+f4muVIURV11nHewAKkF0E6hZolNoYTZJFjThJBaW6oeBNtvtZZ9nQXG0W2+Ac2kHI3OwwQIjDOCsZv5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U3Hg/daDkJ0sRqaAodj0wGPKvIMvbWGX+Ru6E4g454c=;
 b=G2NehU52AP1qsvjrT9ldm70MliUamfZEzJgq+9pqFFuLXjdSiZH6ZLpeyTEPWrKGp0p71qpi+imxmxSY1iHB2o+sA4GP+gLTNSaflrMQZ4mI+T0PFtJWd9czt2OyqljjIhrrigVRH6iVRLzbbpZmql37558vD4Z0YatBjJ+Lzvm6no1/25VrnmLwLRQSmK4pwVsDRKRfTRuiZVQKvxgQ6awqvvqYxELYpMLzixlboNL6UHtEXc9Adaj2TfjozypbXI9ilifHi0egD5efFmLbpYiYFT+0kW3lDNYuKcw/7JE76oBdcKHOCPfuI3pdb0RO2ysdf8/n3gIrMcbYCUHuhw==
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:479::20)
 by GV1PR10MB6147.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:150:98::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.8; Fri, 30 Jan
 2026 09:16:58 +0000
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::b54d:255a:1abf:2dc7]) by AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::b54d:255a:1abf:2dc7%6]) with mapi id 15.20.9564.006; Fri, 30 Jan 2026
 09:16:58 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: "Freihofer, Adrian" <adrian.freihofer@siemens.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [PATCH 0/2] fix bug 16135 - useradd/groupadd debug
 output includes PATH
Thread-Topic: [OE-core] [PATCH 0/2] fix bug 16135 - useradd/groupadd debug
 output includes PATH
Thread-Index: AQHckb2Zatnupz3A2ESz4bILIyOZybVqbiXg
Date: Fri, 30 Jan 2026 09:16:57 +0000
Message-ID: 
 <AS1PR10MB5697329513C17C6B6199FB66FD9FA@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
References: <20260130075333.940897-1-adrian.freihofer@siemens.com>
In-Reply-To: <20260130075333.940897-1-adrian.freihofer@siemens.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=ebdf1907-71c3-4725-ab6b-b76dd4aab65c;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2026-01-30T09:14:19Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Tag=10,
 3, 0, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1PR10MB5697:EE_|GV1PR10MB6147:EE_
x-ms-office365-filtering-correlation-id: 7b6331fb-2ca4-4fe3-9dd8-08de5fe0519a
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|1800799024|366016|376014|7053199007|38070700021;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?MhBVnuJe57iHQYeIlTLez7vAHoWPDMBua8weGPFrz8SFeqPtcBjLvfriLMHi?=
 =?us-ascii?Q?HbuF88wMhCOi88GLJqQvKVWrRZifmaiVm25EWUmHBiKJPJ3qgMjV/ExL9Nq0?=
 =?us-ascii?Q?Te0lbfPKw9zIzCJrpZgoNJ+FTCVcK3fXmpVK4yDSBXyFp8xKOTqGxjaLDIhr?=
 =?us-ascii?Q?MJkO/YY6XMNSAQrnNDoQNittaipH9cY0FoaOYB7SbDY+UPDJOtEjxAp6hZla?=
 =?us-ascii?Q?a3emGF8fho489aVahEpeSJmFSiMy+RZOnZ4PWqQx3gOeg0zLhCEw0oa6zu1U?=
 =?us-ascii?Q?W26Kyw/Y5H4yUO26sUGUtZlhdM5Kaun1EPuGv95w67HBJ/C11EnDO1CZGk1n?=
 =?us-ascii?Q?bAf9OEOdL2ss3huaDy3xWAE3MkyFgsBVNTTs06P0mx5/lDdxlpZ4LfnN96cp?=
 =?us-ascii?Q?9cf46x8xBL3UEOQqOgL1pqeLQQR1XN5RaHFbJSiHtCibLk+jWCotR0v62OXc?=
 =?us-ascii?Q?X4VF8VwCjQ915nn49BC427QuLq8UYJvCcLQU4j/ZTJ3hgVCXH1tCrYYglRh4?=
 =?us-ascii?Q?Ed8LzGOo5MNw6xgEgb0UgIYvEQMz69MMtrLBxhuWQ+4Mw2MbbdRiB9PS8Mod?=
 =?us-ascii?Q?1H/heDGcuDDdKP+z3serYO3BTa0lR6bV+/i9fgrimRqcWdjH6VHn0r1yWvPB?=
 =?us-ascii?Q?lIynkgYYUcqGOMItn5matvBNEqQ688N3v92vbN09dkIYJ25/aUtu7tQ6GR5E?=
 =?us-ascii?Q?sf0ToQHSXp0pUb9kYvgIzXN+NyG3RYlAeXRYFRnjS5t7jUDEI2fAPfnQcqQh?=
 =?us-ascii?Q?ucTcwmnhulNrWvudJKv4BYRKnIiq9SCowlML7MAvURUuP40Qngvnvd5BUdXU?=
 =?us-ascii?Q?7bMbB4L52oBNHqW9pDX6nAV9Otg1FrIGZC+/GRcnsndnjR+jS6+8k2SPeGu+?=
 =?us-ascii?Q?y7OzRcO25r4xi3Yr9HWksqt0ZbCEbKVEcvUeXxrRIX0bc2hUa+47f3UL/7nR?=
 =?us-ascii?Q?Fjgdo5UkodN0zM3NRE+J7JkY55WMgKAZLXqf5Rv67mWDpduHcXl39m0JRGVE?=
 =?us-ascii?Q?ytX3hfDedRtbO7MmJEK+Mk0tGQOP2nG2rglAMQ1TkLnrON4qUsT1hsxzUn6q?=
 =?us-ascii?Q?+T5KeRC09kbal1kIUR9DjQ9NQ2jU8+rPXhatlTFTjvtBIpCF9qSd7ZfgL6m7?=
 =?us-ascii?Q?MTXdcYq3mJefHpBaExGP4wtnrsbXVLX2n71HMLmqVHKcCPyFxLKWnYknlEF7?=
 =?us-ascii?Q?Dj41F9ewtcQO4U83SorP/cyleeBpKANq8F//ECGFGppylq7BOETa1qPVxwsX?=
 =?us-ascii?Q?v+BCNFFmcfPvX6ZeY4+nHi1NyV7izHsZb+of2jLUhseA4X6u0+G1GR0l+hli?=
 =?us-ascii?Q?A0sSdDXU5rIviwfTaGiUVus6QOHx1m2ICk0tRaKII23BC2I44J8Tr5ztgTv8?=
 =?us-ascii?Q?zjSU6+vzYfuGfYLf3l+uCmOWxDQiHbSDQbjFDeHVLxl7q1k9ZnYNAHfDPK58?=
 =?us-ascii?Q?44sX/3U6ZdoWtzutLWdGUjPN/vLG0wTcEWIOeNJrBEouuODF5cHu6WJ4G/Pg?=
 =?us-ascii?Q?L/4A/N+42KMzGjQfFmz1Ykp7H6+ZEqX6hoECr6B6LGMjKhfdQ+GKxhDhrWj0?=
 =?us-ascii?Q?wkLL0wHcYEbq6vIuEjc=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7053199007)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?2JwN5PBvuBsi29+A5inL4+MKkVcT1AfjfqXHATHc72u2QwaxReyRso87ffoQ?=
 =?us-ascii?Q?nGUM1r7MZLi6UxoCZPLIjZdu0viDDWLcXGuEZKgbnOgdWldCXadOfaWOzvgt?=
 =?us-ascii?Q?NygzrbGoXZ96Ly2gBb4qW8TYf95K7XFSvzlA10Dgp7UUdfhDMPacdnkdg8xW?=
 =?us-ascii?Q?1e/pw44H9nRGjZBr2Uk/IlvXixDO23N0WnETwy3yxlcftBD/mlSa6zxW4aEs?=
 =?us-ascii?Q?b3gLlcXEtaHYUNmWrF6wGAWRMzXCGbU+E34udlYDLS2E+AQqJX6iZPkfFCH7?=
 =?us-ascii?Q?e6hj7LVr2R7EhWyweCbofhgJOgMEP4dVsIft2r7xZPMVCheZX1QCj5r9bqWB?=
 =?us-ascii?Q?BU+fTKlXEqo+FerWl7EEg9j4Ynj0odaH5g+r/SzrRRtihPZSAJmf7u/3YQFb?=
 =?us-ascii?Q?TKc49lWXVRS4uvDKYYuwPZ1+qu76yy6bNTaUAq4yds4t4X2OA4I2udKl83c4?=
 =?us-ascii?Q?Ze7yUhZ3Hd649sBqlwoyM967UwDPPwiCHhjgQBuH1j9X4y9YzdAVZl+DIhQE?=
 =?us-ascii?Q?fglnly+nRQR0Qj31+C5OnJkWR8/HLK9i/lty32mbxZiVpRes7HCvz6AgJYbv?=
 =?us-ascii?Q?Wcsr4H5LsJpIW6pO5xafhyjtrJIXkaeDgQwUKO3P2Y3fqM6xkgatqANwuYGh?=
 =?us-ascii?Q?6ObfYTp8tfcbHCN1JQddb465BIoxGQ3XvyEq+XraTHzTeCeHOp+eXdRAqpgg?=
 =?us-ascii?Q?YhbAS8dTv8Co2OPfuD1M4+neH/s2wY76XwggHG21knxIlresQrK1FeCl+MS4?=
 =?us-ascii?Q?olcTjHEv6qGc4IDLHyYlPxShyBeqpGirI03Ym0+ujP7Dek0Mi/F4ULOZTIyy?=
 =?us-ascii?Q?R5OIxA/8OONJzJLa3c1qdngVSGkO8nfuMWkGDOzMAGRVO0CUzWb9WL9jfEXx?=
 =?us-ascii?Q?n3bO2rNbDm2x/fecKzsWdmsm/twjaRmX1PU4NuleicEvaHiCiWk6UkQ4pHjL?=
 =?us-ascii?Q?kEq+NjBomVqPjhL1LnrQMET48dAFND0pvrMPd8+YjXhCrE4jHa0EOoPo2iKs?=
 =?us-ascii?Q?4HbjBHwt/qtO4W+PmOryINHeXphYJk9SDrb60A4oC78Uwfb2fZ474C06scaG?=
 =?us-ascii?Q?NV4FLqiOvLUBrpA3DUkSKJLRt54cGEf4aY6QXpVfvqc6QPH90j+GhnJeJGmy?=
 =?us-ascii?Q?dRuTGNJynraWBbz4/RciAB1XOQXE+xLFzXErg/GHQlk9FVaOOJXvFcpDcuM/?=
 =?us-ascii?Q?RZlEOVJv9qDbk37z4yQ8sbiFKaaj/3L1PwSG83PI8pGkTqp9mmIc5pBwhnog?=
 =?us-ascii?Q?CavKuY+WNWJxUajRU/O1qiZBnX+22/s8o11xEFOmgIbCvRGH7XgCV9sE4C+/?=
 =?us-ascii?Q?cxfIunb6EsYrpU4B/I4/wmovbntmHdAruuIPRODsOArB9M5VSkG5uc1xiqYT?=
 =?us-ascii?Q?D5Wh1/BYXor9Kgon8iIM+D/AzmvBQXLgYPJ++DWFw83dLaoFCjPR1imL0l6+?=
 =?us-ascii?Q?7m0tPZ9+DrVXvHL+vyfqSsY+QOHDoJaDfusQStba3Cs7LYUr8n959GSXeTho?=
 =?us-ascii?Q?lKn4mzsH8O1JTUGjU935LgpSzAiF6c3KqgyTsLk9u90Gp+rYHAZg0gLmZThz?=
 =?us-ascii?Q?LV7O53NTO/2CUPjeez44lcWYgdzOCK3tiG/Qocm2cN3UzmMASwTZprWVb1xD?=
 =?us-ascii?Q?9riuyJk6rIhxrLoM2jdc5WgnN7nrL1eYGnYwEg1d6yadc7EZvqo8sBZhNBHw?=
 =?us-ascii?Q?SQUp8Gsnxi4wWOXG38HbBoUVBxDU+sxr4E02chQTecjDmGFwFvdIz47d7xbw?=
 =?us-ascii?Q?g3GVH/n9UA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b6331fb-2ca4-4fe3-9dd8-08de5fe0519a
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jan 2026 09:16:57.8319
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gowb3kKPIGlcLwlv5d5sGmtFvkDB03aRck/ygksYrFnhiXQIkdukrO9gz1ZMfncGXWC0xe2RNNfz372LGNbPyg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR10MB6147
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 30 Jan 2026 09:17:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230187

Does this also handle https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D1=
5444 ?

Also does this need documentation update?
https://docs.yoctoproject.org/singleindex.html#setting-up-the-extensible-sd=
k-environment-directly-in-a-yocto-build

Peter

> -----Original Message-----
> From: openembedded-core@lists.openembedded.org <openembedded-
> core@lists.openembedded.org> On Behalf Of Adrian Freihofer via
> lists.openembedded.org
> Sent: Friday, January 30, 2026 8:53
> To: openembedded-core@lists.openembedded.org
> Cc: Freihofer, Adrian (SI B PRO TI EAC CCP) <adrian.freihofer@siemens.com=
>
> Subject: [OE-core] [PATCH 0/2] fix bug 16135 - useradd/groupadd debug out=
put
> includes PATH
>=20
> From: Adrian Freihofer <adrian.freihofer@siemens.com>
>=20
> More details are available at
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D16135#add_comment
>=20
> Adrian Freihofer (2):
>   build-sysroots: Serialize native and target sysroot population
>   build-sysroots: Add sysroot tasks to default build and remove warning
>=20
>  meta/recipes-core/meta/build-sysroots.bb | 14 ++++----------
>  1 file changed, 4 insertions(+), 10 deletions(-)
>=20
> --
> 2.52.0


