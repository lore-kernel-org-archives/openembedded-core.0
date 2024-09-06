Return-Path: <niko.mauno@vaisala.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17872E6FE23
	for <webhook@archiver.kernel.org>; Fri,  6 Sep 2024 15:17:46 +0000 (UTC)
Received: from EUR02-AM0-obe.outbound.protection.outlook.com (EUR02-AM0-obe.outbound.protection.outlook.com [40.107.247.90])
 by mx.groups.io with SMTP id smtpd.web11.1424.1725635856935465437
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Sep 2024 08:17:38 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@vaisala.com header.s=selector1 header.b=Qx3Rlw47;
 spf=permerror, err=parse error for token &{10 18 spf3.vaisala.com}: parse error for token &{10 18 _spf-dc57.sapsf.eu}: limit exceeded (domain: vaisala.com, ip: 40.107.247.90, mailfrom: niko.mauno@vaisala.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=b+2VCUt4qSKyDew6JeWg1e2v5YhetZ1Ymb4RLZQJ8ehGwChwDqny9CrVbxZYkdxADR4IezDcj76RfZ18tfHiixocvnD+uu5V8tyW5aayI0GIMtK++csCVID0DkbX7f0aM3f93BD5Mt/YHx6w8AsLXy6l9stfo3raWIsvWS0l3G71WKmra6FviLQk3g07f2fGZAnsUue7X3r9vJu0YzxImP5vGa4wAdoWa0NH+VfGquPvDvbe9BgoVGxbvO6C82/yE3Kq27gITzxXK/wF52TIr1cpqCLZCz1kj5J8kURWBNEokzuAlNSj3PFPzUcluFYsuaRyKtIu16roU6oTfa8EQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iIA1k9+f4szhkWvjTzU0Eoy1iBgflfDO19F4BtuN0b4=;
 b=ATNvj2HbGP+KQN+svlB6vrsMA3mLfq18gg6NHKzVafPrJuUqju0jnZh+Xkf/Xy2GZ1PRKkCfGxnylX2kxGtEazoUGTyJhO2C4F8V5HKUzVMpbjaokDvYGbRMrbTzdiWRn/mqUuO3WTCWxORAyTNejRdC4jTTTy/YLQuANkeuV+MGyG5snIuxpkLCR7JgVn/POna94oGP2s++cGZkO7WxIK1wB8uH2I9hCmcDlVI7HyvcrUxiMc+6eu2et+mo5O1DV3wi12etIGekdos9wyH70C66OTgsKglZdtyu13r+8X8wW7R8ILuKVFl2UwaGHM9rAoe/pr0LgvqLtSSa8iwtjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iIA1k9+f4szhkWvjTzU0Eoy1iBgflfDO19F4BtuN0b4=;
 b=Qx3Rlw47/6mHt24Djnq2t4gZZQ862EzdwmzgCLnJzSjeuDajd8lVsAXwDA+U0Bv4Xw6oCa/ycLUbfD6yhVAZKUQJN5LJja2Kyjm26l62PXm7yuNYw+U67QflYz3OU+TtyXcYVPSgxoDyankv6zcssNJxjW4CgtS8OTyWlNW4ScmMRSrS5z6jdN2Ovb7dyCt+73kkNcAXHzUI31Z9GuaKggoIgkkuI0gZ7SFLY0n7XxVPMeiGOxdkxCkEzmw1bzZ9/O8Z/R1kV12kKnHe7l4ksrqAaH178v+w7moYla0nFi06yZwT6njPQ84B0hVBcavHjvpBjQ20v0lJkHFugM1AbQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com (2603:10a6:20b:4e2::11)
 by VI1PR06MB8950.eurprd06.prod.outlook.com (2603:10a6:800:1d1::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.17; Fri, 6 Sep
 2024 15:17:33 +0000
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc]) by AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc%5]) with mapi id 15.20.7939.017; Fri, 6 Sep 2024
 15:17:32 +0000
From: Niko Mauno <niko.mauno@vaisala.com>
To: openembedded-core@lists.openembedded.org
CC: steve@sakoman.com,
	Niko Mauno <niko.mauno@vaisala.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [kirkstone][PATCH 5/6] tiff: Fix LICENSE
Date: Fri,  6 Sep 2024 15:17:01 +0000
Message-ID: <20240906151702.3006933-5-niko.mauno@vaisala.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240906151702.3006933-1-niko.mauno@vaisala.com>
References: <20240906151702.3006933-1-niko.mauno@vaisala.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: GV3P280CA0114.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:150:8::32) To AS4PR06MB8447.eurprd06.prod.outlook.com
 (2603:10a6:20b:4e2::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR06MB8447:EE_|VI1PR06MB8950:EE_
X-MS-Office365-Filtering-Correlation-Id: 443febbd-0b13-4fa0-59c1-08dcce870791
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|1800799024|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?47FEBsYpxvvOJLKg8rsa9a+4UrdFSUN0d3i3L4Wyzbf8H270RUv7b/lYvoZd?=
 =?us-ascii?Q?RXGkuh/r/mg/3dgX9IOROODc/Q/247HwYM0vdoN/7Cy16cWOKCsuKun7tVHR?=
 =?us-ascii?Q?nDO6kilGmFgfRfnSDT6wGILPBm5M88yuhhJFdJfBgBDAZI7T3sFMEhCjGpuQ?=
 =?us-ascii?Q?rsjPE7otv70KtUN6eWOoPsusZQOuNaPnDGkP5cPTod26nOxOJdwvam4X/Zs5?=
 =?us-ascii?Q?G0oF1HZeyQMBKZeodOnqFcQzPPdUomqg50BwhD+Tu+NDXFJn83eV35qezE0d?=
 =?us-ascii?Q?CX0nmujQ5msBq7Myj56PB7+h1AGckDtMVXMe9YcUOjEZ+izfT5N2OFsVyw2p?=
 =?us-ascii?Q?virvR0bXstzCb2yPJONpmbfepDoR7zzwqWE7RC2JcwAH1ZcBsPGLGmBSgHs7?=
 =?us-ascii?Q?mbPaa3o+hPHMSXKsevZV0A8NK6AKAsppfJv4nNVoUB9A9c1tAJvdgDlkcU8j?=
 =?us-ascii?Q?vdRbCtTCwzDLsU45DK24gH42+ljwugev636uMp+RCXYE70L21991Wm8BUtRY?=
 =?us-ascii?Q?2AGOWw2r4PEGT4gv8oXG6vL8mNA6vT9h6WFWqu3PBYJzDL+1mHzkZwk94VAY?=
 =?us-ascii?Q?a2F4KH7fLRUbBe8nrtRlLVzyRWcydyIaGSj+cw7gETOkAzkey/9RqYyS0EhF?=
 =?us-ascii?Q?eF+Q+AtT9o3qCisl6tYrc7v+5B/3jrKVIYx6LxnihQyIcLUPemAndDyigdwW?=
 =?us-ascii?Q?pMVbD/UvBIG9r1GtUGH9yLlJKmnmdsvFlNrEgE6Uxm/0P9LJ35LVzI1DYpXG?=
 =?us-ascii?Q?kDNsNKaEW13Ny4AJV4jarDiFLdvE4npACkm3a3LRS1rtltVHXqRFSYq4CpXX?=
 =?us-ascii?Q?DXHbj0YcgKBPR1D3EvQ/6Mutww/qGKMgF4RaBgkxTBBYPE6ZIrSPXbAmwIo9?=
 =?us-ascii?Q?Bu1VznVerCa0onQ8D8Ly+2sroMes+WDjuK39wvn7yr2qTXG5To9YcSeJYkvp?=
 =?us-ascii?Q?dZCA4p5mEaSQJsVRP77MQvT3ib2voob6mRpzpbkpqkcnIZGWTEakcqK2NIsu?=
 =?us-ascii?Q?vBO7+g6hgMb+9DY7woJYiIo7FTGCRKorAHps0pwPHQyDB4Aq9CZ5V6vZ7phW?=
 =?us-ascii?Q?ATskwpaePpdATLqp78Kcnh0efKW827559bmS0KdvPH2sp3ZW9G/XdlS4WLch?=
 =?us-ascii?Q?4+cZuOuZSLl8bLxOFW60UaZ3QiChylPp5s1LJq2vDaiu2RlncDno9JJL4y5T?=
 =?us-ascii?Q?PrR20ocfjvHaQ38nVACrFm2ZeEKIPCuAS7tGMASqSVuZ6JhSkDepau8v8suE?=
 =?us-ascii?Q?Qpg50VcMgpgMa+wdtlT+2UgqdXWNJx5O3OD2uoV/BBKx6sggPCCpkVqKt+Zf?=
 =?us-ascii?Q?tCnzrYTZ5ZTTug98ZZY+oxw51UjmKi4a1Z1Visx0Vw6pujf6YmmINAlx3sdu?=
 =?us-ascii?Q?Yh+kZao=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR06MB8447.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(1800799024)(376014)(366016)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?DxUhLuoryplUbEvBV5mk4QHRs2fCmpRbBaJVPmfh/ikK23/CNFHrcScB8x+l?=
 =?us-ascii?Q?tFNlN7+Li9l4azKaW12f3hseD4I0KBxLCueYtHEGmj2cMra1gagTg03fZmOc?=
 =?us-ascii?Q?N6VxMU6b4vDgCzklS9N1VZi6DXZErfNVFQu0fZ+/OdPc9CuAloItdsSoc5wH?=
 =?us-ascii?Q?0LHU3e7nOQvstBNyt8mKgIzlZlz3y3y/4qNdSinnL/hTrtUGAXLm0/mGRydP?=
 =?us-ascii?Q?3c7ZJuoycg20Bk7U1WBIttvXPpn5jIL+UGsvcYyrkLek3WRBY+SBNnUamADh?=
 =?us-ascii?Q?BYjHlzCXxGf0nDy9YeTZm1ZtFi7pT+HqbfhVMqg+K0zeuGnBXGUhR7Inzc0D?=
 =?us-ascii?Q?Rgtv8vcHwzIB3OPCcAscJF/sf8LfEyK9XHuZa1oIHZZGx7qba2qeoHqmYofL?=
 =?us-ascii?Q?6XkWV9cxpH4NfGe9TYZevNxoxbCidCtzC6QgSnsavb8Dqls4VXIqFy8dT7Fc?=
 =?us-ascii?Q?AYT6QhH6nBQW/E+Purm6GhbuQIePDM+QkJNzMNLSTnbez4bGr48M5yAMXhaj?=
 =?us-ascii?Q?J6cb9vWsMRWUXLOGfkb08mXQXoohAd1wUXPAi0sc4k9ZfjdrdQHw0oh9GS7F?=
 =?us-ascii?Q?W822cZWzhQFpc+KTILez2gboBdzEVe0nPmFykS9JUEpXYI0K5YgejDzB9gcd?=
 =?us-ascii?Q?KbIH+jRD6THqST18Z2USHqXWKO+GsC0c+y8zIv/Vaeo7XCu34Tn/wJxNwRLx?=
 =?us-ascii?Q?rT0DgpoHXP9wfzwYEVB/19hCOQvllKPIg8HVeuiiiyFaLpt2wBZmG6xdArro?=
 =?us-ascii?Q?PnJPHIWLN9HLizZ5oAdIsm1pPO0yS9wrLNJcdfqs0oyYjCqzd7v7y0vFke3a?=
 =?us-ascii?Q?kZ9Qo3nHpFhOOPTEIuZYXoZSYXrg/EZtOr3jLhyREQT3FmmOoscLwqqRtitW?=
 =?us-ascii?Q?Ii836YjEX3EvH3wbinA2+GdIu/djnF6vlehW1cao8HLovtpQDiBz4WPzrBBa?=
 =?us-ascii?Q?PpQ0+2QGCIjhQncw6R5YvzKkeCsnVeDVlxY7NVuJSNEy94p4aO7vqgLJjYhT?=
 =?us-ascii?Q?hNGj0mkrbJ7N1/kdBCkYl1S65KX7SqXbrsBddxtMir7KMZ7lJN+f9FULhMqs?=
 =?us-ascii?Q?v/y0VRVuSN5XE5Wt1KWHnJzBlb3Uyi6Yo4pUPRjavQI4Rnc6aSswSVwr3Wwz?=
 =?us-ascii?Q?wQHW35AdRwguhFVfNnVxk7VwRUjhba9QRbZjifQvtDMIxVBH1gOOHK40k++s?=
 =?us-ascii?Q?OShqwdrlTNLe2wTjYKEbILRe3jjJ+yTXUvhYj8G6pFcx25UYMzTzWkRhCgWO?=
 =?us-ascii?Q?fUV74MmwOL/C8ZeaHhgO/NABy3r12kz6JlT8ZZceLAJZoMOR8gpr9/QNPFOd?=
 =?us-ascii?Q?V30wdGk7YSBUlBjKJi1dIBYc3KMIeWD5q6AZWtR9hb000R7iRtBXYrPmiCvD?=
 =?us-ascii?Q?pxCfnlHgbufMG+ljOGs++sTNtQ5P2kG3RsNGDGq3089TiXtTMClov9vz1bXR?=
 =?us-ascii?Q?uZZaHbASinq+mMHpJUIGAnAtqxPaaVXJwrSSBOgXFgqwbHkjTZG9oAwuJaUB?=
 =?us-ascii?Q?Bx15Qvoxb6b8QWslw9lfrrNCbRX/qCNzCrxKaXJdMT25BsSQW6O4mmY5djVf?=
 =?us-ascii?Q?CwO97pkjoBqDwIys689vcNxaUEzPN9NVfolTuy1JhhWBWzdI8JqYIeIccse9?=
 =?us-ascii?Q?uA=3D=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 443febbd-0b13-4fa0-59c1-08dcce870791
X-MS-Exchange-CrossTenant-AuthSource: AS4PR06MB8447.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2024 15:17:32.3395
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Sz0qBPQ3nIKh92lGuxTvHyM0McxKSGfaECMVtR1KQryYUR8QLgpmYyEd4C4DyB83Z1siKgDyofWMl1b1yLqkhQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR06MB8950
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 06 Sep 2024 15:17:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204273

The contents of the LICENSE.md file included in the current source
code package match those of libtiff license, which seems to have been
the case since 1999 commit
https://gitlab.com/libtiff/libtiff/-/commit/0ef31e1f62aa7a8b1c488a59c493077=
5ee0046e4
where it was added with filename COPYRIGHT and was then changed to
LICENSE.md in 2022 commit
https://gitlab.com/libtiff/libtiff/-/commit/fa1d6d787fc67a1eeb3abccb790b5be=
e969d424b

(From OE-Core rev: 71d8e8b03349ab18dca558055c2b3a3687785ddf)

Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-multimedia/libtiff/tiff_4.3.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-multimedia/libtiff/tiff_4.3.0.bb b/meta/recipes-m=
ultimedia/libtiff/tiff_4.3.0.bb
index 209b38b8f2..27bb306e94 100644
--- a/meta/recipes-multimedia/libtiff/tiff_4.3.0.bb
+++ b/meta/recipes-multimedia/libtiff/tiff_4.3.0.bb
@@ -3,7 +3,7 @@ DESCRIPTION =3D "Library provides support for the Tag Image=
 File Format \
 (TIFF), a widely used format for storing image data.  This library \
 provide means to easily access and create TIFF image files."
 HOMEPAGE =3D "http://www.libtiff.org/"
-LICENSE =3D "BSD-2-Clause"
+LICENSE =3D "libtiff"
 LIC_FILES_CHKSUM =3D "file://COPYRIGHT;md5=3D34da3db46fab7501992f9615d7e15=
8cf"
=20
 CVE_PRODUCT =3D "libtiff"
--=20
2.39.2


