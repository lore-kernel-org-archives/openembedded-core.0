Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB7CBC982CF
	for <webhook@archiver.kernel.org>; Thu, 17 Sep 2026 12:05:00 +0000 (UTC)
Received: from MA0PR01CU012.outbound.protection.outlook.com (MA0PR01CU012.outbound.protection.outlook.com [40.107.57.5])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.34419.1789632410712948532
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Sep 2026 01:06:51 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bmwtechworks.in header.s=selector1 header.b=KTHr3dOs;
 spf=pass (domain: bmwtechworks.in, ip: 40.107.57.5, mailfrom: upstream_ip-sk@bmwtechworks.in)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZuGcYgtyZkK6VPZZPAX+ophGjb/hwc7ng3O/VDyXKrtayj1NaQ2YpK5BTtHCICA/ChAjzkN4tU6GEOvc9XF+pSDyJK+vAjNlBea9nydO1PdcJdIyRdC2M4BULej4ZXSEnpHJ7of9YHF75r4a/gR1QgLG9pZqsQ+R1M3TCFcbCRcrsMyXRxlryCKUaXPGc52hey7VhhjcxMuUGygaVfxQzkfL+y+gR/aUq9pIVDi3QwhIYP656429NYyZzRYnBVOvFSN1lowxKurYM5Wx/PfNG6yv/X/J+QLXknMCgMrTKopHu+/PgxKGq7InO3rFD1l6V8VC99HOzIp+w1ElElKmZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AqY95CSktREbY3+qWkyShHSMis/HrcVN80w0Q6BqIg4=;
 b=w6XyavsvTYczMDcGPA9CCnpMwFNTAbTIrAPI9qLHke88xqvETvJucwDIKvhZlzNVaI13PfMnpfCSIRxZklx1soDjUIOmCyjgQeQ2xX8Mw5NWaRpsntgeY5EFgBQKvsTFDkWd8KiJOytg0Hllmkj3pXaEMBG9LLUzWgQmbaBeLhBoM8oAZWkE1GPsSdXIt6sPrH383VM/jIyAasbK3h7bjclCu5QFOnCPaYn1cquqBbrVlFNe+YRd6+m+4sUSydOBoNmVbdv1tArJ4/x21m1cWwId0YGFxlcXJAlbTry3ewTGISVPoYIhOXHY6N7HJaif+KveEwSaSA699x/OKEbAFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bmwtechworks.in; dmarc=pass action=none
 header.from=bmwtechworks.in; dkim=pass header.d=bmwtechworks.in; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bmwtechworks.in;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AqY95CSktREbY3+qWkyShHSMis/HrcVN80w0Q6BqIg4=;
 b=KTHr3dOsoWuKW/xeI+WsCD0JwfOY0sUh2n0g6vnXvi+yedQZenoaecZGHvFFj0zHV+i7yiV5T6442BF7uUTIMFztdlA8oRTsLa4StEkMeQXzDEV7BPRydOr0Bn+z219/59Q+iqvLowSGY54Igzqf2p8RiVdLNcwdTCd5N8Y8u/T4WpHaZj0LxMMMcQciqb3VUgZXRfLnZGaDcpzfHF8P8uwowck3+kbp7v1a6MGi44jIFLNYVdEhS+pjcJzsQyILV30oSJpLvazDqfLFLrPsBJ492PpQqLToIC0DP07HOl8PPTM4rBq3FQXgH40Q/a4xKBZGND1qBBo8tOaFGJ/K/w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bmwtechworks.in;
Received: from PN2PPFE40D44641.INDP287.PROD.OUTLOOK.COM (2603:1096:c04:1::156)
 by PN4P287MB4792.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:2e7::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.12; Thu, 17 Sep
 2026 08:06:43 +0000
Received: from PN2PPFE40D44641.INDP287.PROD.OUTLOOK.COM
 ([fe80::a44:7591:bce5:fd12]) by PN2PPFE40D44641.INDP287.PROD.OUTLOOK.COM
 ([fe80::a44:7591:bce5:fd12%4]) with mapi id 15.21.0428.011; Thu, 17 Sep 2026
 08:06:43 +0000
From: Sana Kazi <UpStream_IP-SK@bmwtechworks.in>
To: openembedded-core@lists.openembedded.org
CC: Sana Kazi <Kazi.S@bmwtechworks.in>
Subject: [oe-core][master][PATCH] libgcrypt: Update license for dbg package
Date: Thu, 17 Sep 2026 13:36:32 +0530
Message-ID: <20260917080632.1039202-1-UpStream_IP-SK@bmwtechworks.in>
X-Mailer: git-send-email 2.43.0
X-ClientProxiedBy: PN4P287CA0012.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:26a::11) To PN2PPFE40D44641.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c04:1::156)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PN2PPFE40D44641:EE_|PN4P287MB4792:EE_
X-MS-Office365-Filtering-Correlation-Id: f8d00889-0a78-4361-e091-08df14929c52
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|366016|376014|1800799024|52116014|38350700014|11063799006|56012099006|55112099003|18002099003|10067099003;
X-Microsoft-Antispam-Message-Info: 
	oRcPRHBvFf0OEYD5yDgzY8wUTobvgs0sSdMYj0ztaNDntHc51GQeHT4VVlEVvK0q2rJf82rOVsufWdQaUh+7LTj8qy17L2dOCInUnalBz0c6mST50ATv1olydyD4XMg5rOXn2C405KKQwSXRkBVND2hbWAakOpEuX69tdxinPHNncWgjUdlTVeuvwxXgCjRk4oqHGRw7y3xz36mlPIY6FRNxSZoAymxN/zpa8vVTUnbTEeg7iGCp2PRDJD5i9g4pBUnLzqFI2q2wBDGE/1k+VO3AgXbqO7fvRYglj6ZTTen0es6a/2JOKNa8nHBWRYZpd+crGtgdGFUhds34+b5ufLLq0jI9/VRJwf5WkWBnimokq/PZejBLRNqoPldF0ypjumECLoB2qBmW6M8XNaRWZk/FITQC/bwJ8JIf74/nbdOfDc7/4Vo58Ik453yrgpbvgFcs6OsfG3xppP06xOY4Ncc2sZCRticjSXiyEotknBxnL40Fga0aPPEVo6893Xsuhd2Q5hLPwDJMwxl6KzlHENbU0sqdv2jw3L+vLHGAYQ4d9fzzy3oTA8EDFN67s9Y2cKTexPZuGDJGCz2jAlS9amgVexhxavVfItgzd9n2EzbnhiIHgXfFjes1P6AIllvclP/sbSbZRlRptH9nmHRkzKRMhOT1b2jOh+NQoWGUpwuW1YIm0eBkM/jMhKOfntFZeKCRn1lUKG1frdvgoyHxMhXLuv+AgLflOn3I5SYvkTQ=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN2PPFE40D44641.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(52116014)(38350700014)(11063799006)(56012099006)(55112099003)(18002099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?/GAXbJ5p+dCm2ws4brv0mebQB5C6pnVGs1BVWWqeInmNmTCxkeA6GaifYKrG?=
 =?us-ascii?Q?0yrE20DBCsha94zQQ0XlorNV8LEnEgcLr+8/pfsVUkp+Yok45I2YEnWiUfFg?=
 =?us-ascii?Q?SlhU2Py2wAOtzjxsoydrSlE5CS1kY0Wj6QQLtyXJM9fdLzzEVTnmOqwsnFS7?=
 =?us-ascii?Q?XdliI1DLG8kQT47/mtn5H3iDxioql+Jqbrq0gn4lB2UGlAHhBHP8QsWNuy4k?=
 =?us-ascii?Q?C0WT9r5AZiPHu3AlM1iYaTQFzk8lkLiKbgXkOTsyXq1FiHx4+kjqKkAzEBG8?=
 =?us-ascii?Q?OwGLvBmBjuiERrOwAaTpUhJDq2KGAW6i5sP4JPDbvXFANikMLfvmaeRtQf4v?=
 =?us-ascii?Q?sAGdT0UlBnDNFiRM+ixZ2veecG3ABzL5I2qvmwrDtjK4RVktN5LADJPTG0dq?=
 =?us-ascii?Q?VVBMxX8B3Sci/gKDFeu5k7DnfbCNg7rT0JbKDHaIOgFBW0KUiY6IGEiDKNmb?=
 =?us-ascii?Q?AlZ85DSGXVtH/Q53+3Q5mn0iTjeFrQ8806W1zaz+GwPtXR0sLXpv4hoZXTN6?=
 =?us-ascii?Q?jKdqZiTVpFXG4yXTOIwBqE6X/5N0uKnJc5H+aBQQ84sWl1r6tZMRORKkyXuk?=
 =?us-ascii?Q?5REE3eBXOaMntWzrFkdVA+fqGj8C/5AUePF+vRwfL841etixpXDTcC4dRh+9?=
 =?us-ascii?Q?uuzATsSDsZxoAJ7/WYDHf+yyXapnbAz8RfqAcU/pVRW5fBWTBpy2ryTQYvch?=
 =?us-ascii?Q?BaPyuYXGS/KpqGo6XjbGWW+Sbv/Xrnd8HjWNA+DNjV14XPQtFspZzgd+Y7ba?=
 =?us-ascii?Q?gwgZ9ZTiSzDiXtp45TLHP2taBWih51Mx23UR6xOn7Zcg46ug4SdDZTPoItgG?=
 =?us-ascii?Q?9Qt9OInyherSsoOdKU/aociRY0h86MB0j9RaiSgbqf9187CmyUR/aa/ANOYQ?=
 =?us-ascii?Q?p3VnWKaNBPq1Wrzgbv8+D4MmbfbS4s8P5Hy3h4RG7datAe/gq/qBmGqokziY?=
 =?us-ascii?Q?C01vE2TyM4aBHOnMqjFmN5SwoUBKWDc9Joof1MrVDHmLEoXhFChukVoeUZLS?=
 =?us-ascii?Q?Y/Vk7sDTIsnZ4qlLInWD+OrrXsJnJzfXquTXVjjpR/zEz1gZeQZOXqui0+2s?=
 =?us-ascii?Q?3VOppxyxEDxixJMSHFVCf3yGUuIXBuj6e3FlXQiRTU4DYJyFnQvCFkyb0qb4?=
 =?us-ascii?Q?uR2m2NtjuK2hsRxqP+d7w4q8OPze51JLE1NyZ/CsG5jfBO6j/xeSRqx6G2+w?=
 =?us-ascii?Q?Rs88YadGRS24f8VTtRwTjIUxsNJjDb/0aYTndxyFIU/JJc+DC4uLLq1BvAXp?=
 =?us-ascii?Q?/4/J1pW6gISQG3tWBKECfYUleyeiAHW8IiQ4JgK03EZqsjKia12mM7RBYqLn?=
 =?us-ascii?Q?u7Z3fWwBCS8JTKq3HK8LZ7UQqVFodUhme+FcIv4ZiXRKYkOFbP4Y7YTs/LXA?=
 =?us-ascii?Q?qgCbVHWzBHFZr/bHjy++ABjJAm4hEnMcfmGk8UlZ8QI+p0toIxTj/PscWK+F?=
 =?us-ascii?Q?W0P/FjjL+sX5nsrRY0zFDTeB+XhleEHCixlRwmMwJyYFcuDiXLbqcB4pVDcf?=
 =?us-ascii?Q?+rvioydtBtIFolGa10oVQdqV0rqhBi19zXf0tVwDIvcaa0qUxJTYYvZSdRbV?=
 =?us-ascii?Q?iDTZXG5JT8C63ovV6c8L0lpPumIvdV0a6I+ycGSB36PfviOjaOtlGhkU1qmj?=
 =?us-ascii?Q?hAcHV/Mn+ZwC/ccQV8QxvXnUSNehL8ayt1BtM6Jl7TmSjXgsw3c1cp7x8dkb?=
 =?us-ascii?Q?z56VAlYRi3FIa9P6bYxd/rxDjIRaZnbn6pn94y01UR/NAlWd2kxRbuCtz6cT?=
 =?us-ascii?Q?wBOQ9llDHB25rkUuGQdbL1eC0LVx9m8=3D?=
X-OriginatorOrg: bmwtechworks.in
X-MS-Exchange-CrossTenant-Network-Message-Id: f8d00889-0a78-4361-e091-08df14929c52
X-MS-Exchange-CrossTenant-AuthSource: PN2PPFE40D44641.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2026 08:06:43.1364
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 970fa6fd-1031-4cc6-8c56-488f3c61cd05
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rEp3usoNSrnuPHFZNXv1HLKLNa6fsKqfkaKtU2ius4OKZZheAbnK7QrlzGzXLD/I1jTBt+zZwFeZdlTItzbsOTs019xRljMmLZ6g+5TLZgo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN4P287MB4792
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Sep 2026 12:05:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246058

From: Sana Kazi <Kazi.S@bmwtechworks.in>

Set LICENSE for libgcrypt-dbg as "LGPL-2.1-or-later"
as the files used in dbg package use LGPL-2.1-or-later.

Signed-off-by: Sana Kazi <Kazi.S@bmwtechworks.in>
---
 meta/recipes-support/libgcrypt/libgcrypt_1.12.4.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-support/libgcrypt/libgcrypt_1.12.4.bb b/meta/reci=
pes-support/libgcrypt/libgcrypt_1.12.4.bb
index 1b2b1dc13b..27b9d7fa15 100644
--- a/meta/recipes-support/libgcrypt/libgcrypt_1.12.4.bb
+++ b/meta/recipes-support/libgcrypt/libgcrypt_1.12.4.bb
@@ -9,6 +9,7 @@ SECTION =3D "libs"
 LICENSE =3D "BSD-3-Clause AND GPL-2.0-or-later AND LGPL-2.1-or-later"
 LICENSE:${PN} =3D "BSD-3-Clause AND LGPL-2.1-or-later"
 LICENSE:${PN}-dev =3D "GPL-2.0-or-later AND LGPL-2.1-or-later"
+LICENSE:${PN}-dbg =3D "LGPL-2.1-or-later"
=20
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D570a9b3749dd0463a1778803b12a6dc=
e \
                     file://COPYING.LIB;md5=3D4bf661c1e3793e55c8d1051bc5e0a=
e21 \
--=20
2.43.0


