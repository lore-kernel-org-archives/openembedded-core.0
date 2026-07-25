Return-Path: <markus.swarowsky@norbit.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A627BC531F9
	for <webhook@archiver.kernel.org>; Sat, 25 Jul 2026 08:00:47 +0000 (UTC)
Received: from OS6P279CU014.outbound.protection.outlook.com (OS6P279CU014.outbound.protection.outlook.com [52.101.178.111])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.35857.1784966443396363170
 for <openembedded-core@lists.openembedded.org>;
 Sat, 25 Jul 2026 01:00:43 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@norbit.com header.s=selector1 header.b=3Xb7yWxS;
 spf=pass (domain: norbit.com, ip: 52.101.178.111, mailfrom: markus.swarowsky@norbit.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QbQRitEWoODy0ln6fVwsUHg+ysCrReY8mqveJbKx+FNOV9YEKrJtS8dZWA1gEPcTTRFtP6qA8ZNdourAZ+Bxc/U0/7rbvGu7ugt/deZHnVYqr7pgrn57BJ1Lj9KNDDyyQ/3OZ90k5um3UTZpKtnx2M4ZxoGUgVktSSgVo3tQGrXF2cIXNFYxYaJ4VovYHIPyAdTHYz2A57gf0shq03LG50PlhCIG7BI5yhq5VIHom/OKswjeV0Dtu733kDc140DycGrzMm0plM8HsSJLcl3hn/MMArA2fS8Upz8uL1JIw835++df1pwacH75SdfN7jJig37TslKmjgy0aveqvQZe1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mk647m2pGDdkOxuY2bbbZPRVmJl6ti/Fkf1DAjAiwLc=;
 b=MrTh0+q3QZEv4PUxbu8mAExa1n2/svxsm6n+64rfLU1jqBpM2o2ZtVnfJ/SY3ONSHjtolUpxRJppuEdEe05r6mnUhu1pB6Nf4fNS63oopi+L5qPEoHaUaygiZhrJaPCFsq1htoNvKWVHUaijx3/8AFeM58/4FFqVwbl6aOWMH7DiNFxX3laoQMMg6lck8zuyHNuOW+LqFtzcP389s1ySkGFBN3ZkVeJfURzDLAf4dhbzuvOyd0ld72wJmvIliqVIVWZ+0/1y34cdWkkpYBGes1KUziel3kb22GZY2gWWRaSQRhE1GrCeaKuDdy0wjguS5bdNI8bPRdpjfVxc46HpGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=norbit.com; dmarc=pass action=none header.from=norbit.com;
 dkim=pass header.d=norbit.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=norbit.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mk647m2pGDdkOxuY2bbbZPRVmJl6ti/Fkf1DAjAiwLc=;
 b=3Xb7yWxSdhIfHt8AqzmmmvCmYsOGx8sJV29ExJbmTcLD9b2wca0lEjHJGkbODH2uLyyqPZXQSIfZGCxao2bALx8I/ilvC+vrpSc+tM2OW88/1R7O1CY/lEvFJZnjOxiaEaU3NH96hcfmJnHtfOKA8T7GIF9RSKYn/JJIBDJWPks=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=norbit.com;
Received: from OL1P279MB0193.NORP279.PROD.OUTLOOK.COM (2603:10a6:e10:e::10) by
 OS6P279MB1472.NORP279.PROD.OUTLOOK.COM (2603:10a6:e10:88::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.245.12; Sat, 25 Jul 2026 08:00:37 +0000
Received: from OL1P279MB0193.NORP279.PROD.OUTLOOK.COM
 ([fe80::432c:f18f:6780:d825]) by OL1P279MB0193.NORP279.PROD.OUTLOOK.COM
 ([fe80::432c:f18f:6780:d825%5]) with mapi id 15.21.0245.012; Sat, 25 Jul 2026
 08:00:37 +0000
From: Markus Swarowsky <markus.swarowsky@norbit.com>
To: openembedded-core@lists.openembedded.org
CC: Markus Swarowsky <markus.swarowsky@norbit.com>
Subject: [PATCH] scripts: contrib: Fix reserved typo in imporve_kernel_cve_report script
Date: Sat, 25 Jul 2026 10:00:34 +0200
Message-ID: <20260725080034.3374079-1-markus.swarowsky@norbit.com>
X-Mailer: git-send-email 2.55.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: OL1P279CA0001.NORP279.PROD.OUTLOOK.COM
 (2603:10a6:e10:12::6) To OL1P279MB0193.NORP279.PROD.OUTLOOK.COM
 (2603:10a6:e10:e::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OL1P279MB0193:EE_|OS6P279MB1472:EE_
X-MS-Office365-Filtering-Correlation-Id: 2a013b68-f370-4fea-0fc0-08deea22cfd8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|366016|23010399003|1800799024|11063799006|56012099006|10067099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	ELkhS8M5cPUcrYXFSSKmMd++fB7sTh4BwbZ/dfaIAS6/btOJMqS2WMWVnCDqWWBN0SOB+c5xD1Wk5iCskVnopiTvC+70vWXCy0t6q6RvUVpd0vhcBqJpSdW9YnDB9mROXhPF+4fOZYSpIUcIFfGlL87WHYqyMUFrLb/yUFkfoJte1OdQCXXtI/WmLIZnQIMqBJNB/Zls+XRWNWpfUDXqEElyi/UW9LfjhQ6XlmAl+YfJ4hv9AriUtkJegeO3qZpTGcYjqPAmQKmkl2dBDFhdAJM43l5MoBHd4P04FunqbQbL2Sj+RAdRq/RiFtscrn4udcimkib4PvsZfr8UxRgZ+PFTNbRWznckEzek6AWxA7QRWzCplFWRDFMKp00PqIRkMTm/AywdQPk1+PX0uiwwhqRwLwPWOwig77BM6SZ00PeZd0H2zE24o99lMkI8rqop8cBsu8ho6TK8p82LS61Y+6aYzwT3ToHlVUwwQs3dDI3GFNts/7anJaR0tufLSA4QipEv32+bUWp/udnNcE4T+PghxtECJAkrsU5kyI+RO5hq0bbS23BQSg/KVaXWd+L+KhRJgljMIG1CVHqc87a9G4GK4GvYBYOYEYqYaMl+iuiVDaxDp3X8qrgVLL/VGY3f6GX8Al59cwMVBwFD8fLrEjgsMeZ2aWG0ubkcHqzsF3A=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OL1P279MB0193.NORP279.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(23010399003)(1800799024)(11063799006)(56012099006)(10067099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?2T7ttZ45cl0c3rKikrYV253HpYa+4CFPSvOTryXxGpEv6IJBkzG1RHynjbCm?=
 =?us-ascii?Q?gKKlPXpEgSvOKh6ByLWESlQFbaqLt8bOWhvKDje4xdeoakbf0WG4b87+f8R+?=
 =?us-ascii?Q?AlIEjeSM9H7nb9ZBxGeR+ngKZkSIaTQzHd1QpSUpNhCEhcydBD/gTFzXDodc?=
 =?us-ascii?Q?RiBImNibu/WjLKzk+oCSc39dZVfb+EZVWHEXJMIAYN3vQCyDXP/ibuPWxAot?=
 =?us-ascii?Q?3tfBm7mx+Yd5TLw4MsYQ1RorXAY+34DSc/Pe9W4E9WIDqOwJ2Hig0MVDTFEh?=
 =?us-ascii?Q?LH2JR2UTploGzAYCuigKRr9e5RRRVDKsVxYymjYF7wJFW/uGWG+LgDZCQYG4?=
 =?us-ascii?Q?paBlD8/IxH6+YsvrwfsQRrsH/vmLFlBsk6N/n4z5HiHgJr+zTqmpvIUUhgyc?=
 =?us-ascii?Q?C8Sa7ZxW/YLJhwx2erCvmS0rZ860ni2/sFHuRGSxnRt/o+lfFl7WtOA+yxVJ?=
 =?us-ascii?Q?AhxyTZEKP8w2NdpByVmC7/ASOr2dmxIXSmfdZsGsM5vmPNxSWdpL1NJRiRQR?=
 =?us-ascii?Q?7WDXF5eK2F42Qt2z0o7NW5hBtvbTLzEB+QNnm56GLrtWcfHNJXbKqOFgjefc?=
 =?us-ascii?Q?5x+gUNJc/BZWH9xMkxhQUznnxlE9PLbVgiMMJ5uU97MbNzX7oLLPoI9CRHdE?=
 =?us-ascii?Q?Oun3aQcQ8XL7QJhdYM1tna9GGHep/NWzW3SupWS/6UREVf2g8u2pRKdmEF7Z?=
 =?us-ascii?Q?fVsKM3D1EupXRU4/dSyBkAKW4sJzWlBKmA8SWgeYZrfRbKwv1hl0ama01MG6?=
 =?us-ascii?Q?Id8tiEIrQFRFp8eEsodvii0b3R3+dXlfGY0mpG6BSWzDHfAmZPm9k+EEilp+?=
 =?us-ascii?Q?NrBMoao3ia3XbQ0AmgGDg+nfjS1q5wO4iKivUszD0Lx2l9xgOFdTVIWFffkK?=
 =?us-ascii?Q?s1Z+6yged4bqfIUoe5stQepSvm1/5N+Ol3KS7DGxSzrTV8ze+7w7izSWbsDo?=
 =?us-ascii?Q?T0wADtEfBUhid9kJ5RVUNOYW87W5Poo+EIACz3VXrehH1d6VeByXlqsc74eJ?=
 =?us-ascii?Q?YYtdsn9h8tPPN83CF86+dsMsieVvWsiYLgfR+NoC7kFK+B74hYCRh44KxnWL?=
 =?us-ascii?Q?ZRYFUN9dgRjUGVQ/Q2R8o607hfAjrEJg4OnZHTxguWNjuIM6Ib2ya37nWjWD?=
 =?us-ascii?Q?YDQ9d6c++bzpnygr/8GjymNLSeYfHtYzfwb9bN1p8svt2ntbcnMdfE6B2zJA?=
 =?us-ascii?Q?J8Sb6DWZXp7bd0KPoZWnWTM5eq9MnR+ixfWwkNPtG/wYjmIXRTSWszNtgP9b?=
 =?us-ascii?Q?mE5xPWsiKXqgxUSWtSv1HbkbyQpLSGULw00dGIt1Yl9Mhkat+7TcxAXDiBDA?=
 =?us-ascii?Q?gXGtrT0tTYbRcAdi9YbzkWZuRv8vigc8X8OetPcBHstYXEpfDXoU1OUlywDd?=
 =?us-ascii?Q?YVy2pqeM82QtY5B5lfKknEDgIphP3UjsiNFJ3smN77vItRTfRgqH+mrq298q?=
 =?us-ascii?Q?InIPJ9xcSQDMfizylttEK0dwSTJqiIfAgflIfYOhk2Yirxddo3CoYyAbvShZ?=
 =?us-ascii?Q?RJXi6ppSKM8oe8t+MieQblbMEW7pPUph5c4LTi5/mERwbheZ7DAJ8zd/aiTK?=
 =?us-ascii?Q?qwW+xJCgZhIfmtO1pxRpzbdg5ByxKv/240G8YyZfQSnHF4NUbvBW7LZ9/0NW?=
 =?us-ascii?Q?qyAI97N7dN+72BUcO6cDt9jl1qvxN1eZfI7hjugwKjqkhhgSckr5+ECifeov?=
 =?us-ascii?Q?Zin5BXWx4BlnWmnWEITQzJ7ERichcIMdf7bwOQOKMc+o6LqBXZPhF97Qg9LP?=
 =?us-ascii?Q?9sW+VMMD2ZdSiv1Xr1Y8z1wjtKXNp+U=3D?=
X-OriginatorOrg: norbit.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a013b68-f370-4fea-0fc0-08deea22cfd8
X-MS-Exchange-CrossTenant-AuthSource: OL1P279MB0193.NORP279.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jul 2026 08:00:37.2089
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: a659db1b-eb77-4aaf-849d-11e9e8c70371
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AprI+5gbTVNOjMs5lhGrwMsmqPimPXIITasJ1TWZUZ8cYp4TtxSxQeI7kudO734Y0YszS9cS+JQvvOkgvAl3NH6qTmT66uMjH35pzGJBl6o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS6P279MB1472
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 25 Jul 2026 08:00:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241967

In the filter function for the linux cves it checked for reverved but I sus=
pect
it should be reserved.

Signed-off-by: Markus Swarowsky <markus.swarowsky@norbit.com>
---
 scripts/contrib/improve_kernel_cve_report.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/contrib/improve_kernel_cve_report.py b/scripts/contrib=
/improve_kernel_cve_report.py
index b386c9383a..018cff3b65 100755
--- a/scripts/contrib/improve_kernel_cve_report.py
+++ b/scripts/contrib/improve_kernel_cve_report.py
@@ -82,7 +82,7 @@ def get_kernel_cves(datadir, compiled_files, version):
                 "description": f"Rejected by CNA"
             }
             continue
-        if any(elem in cve_file for elem in ["review", "reverved", "testin=
g"]):
+        if any(elem in cve_file for elem in ["review", "reserved", "testin=
g"]):
             continue
=20
         is_vulnerable, first_affected, last_affected, better_match_first, =
better_match_last, affected_versions =3D get_cpe_applicability(cve_info, ve=
rsion)
--=20
2.55.0


