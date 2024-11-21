Return-Path: <rasmus.villemoes@prevas.dk>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA9A5D75BDA
	for <webhook@archiver.kernel.org>; Thu, 21 Nov 2024 09:08:51 +0000 (UTC)
Received: from EUR03-AM7-obe.outbound.protection.outlook.com (EUR03-AM7-obe.outbound.protection.outlook.com [40.107.105.80])
 by mx.groups.io with SMTP id smtpd.web11.6819.1732180127259040972
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Nov 2024 01:08:48 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@prevas.dk header.s=selector1 header.b=jSVO4F09;
 spf=pass (domain: prevas.dk, ip: 40.107.105.80, mailfrom: rasmus.villemoes@prevas.dk)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kP2qSp/e6EaKSnR8WavzpESrfGPt0Ojl7ftgj14rnGWupQbJMXjfKjLaE4qa8XSZ9/pPO1TWUnpk57VqPm1ZvHelneYQnfZRRTUUNZekQ56CR8CqlmPMsvA72DXvgneeZhfgzBS7pA+D34t8aHNZwsp4IwxuSxqS6nd6SSz3714AIdf+4xnGugAl4WzhIOOGIty88XXgve7/wP4+AmGmNVLWOTtt4NvKjK+w2+mvBoQj4zBdQwdehtVnfrLmW7WJXlNV2wUpgx+yO7GDCa6MCnn5S+fykyldKb4atElC9nBz0lNzmafV5zMQumBDy1PFJfUumVvRWbLOCG7myeKdRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ng4pUyvESRsamNEEk0NwOxnYmNo/qkkLH6+Zv1JIBLo=;
 b=cqMHm4PEbkBAVTlBtJaGVPgOJYlHzVO845KaJH2SLrYGBYL7X4TPUSozY5PFH8fRD/Y9IuEOTS+NAwb5kwZxq6HmN7J6os/04FiVlh1gLQAQk+mfQcj3PxiC/MdN8Hl7EO6dBdO/KrISFW1rsjps2RJM6Xj3J/HhfUItD6IzvxSfBOTia8Qlxba/xDoVFjbAanhTkZEzhMRJdLmTwxD4L7QZv1LEJDOHjYcQtNSIL9dYk8fkHZ4Czy4BJi2jNShu3jq1qTevss0iMQolLJIM0qK4gBRaPrG0M4ta+Wm9XPb1Fvzm3UqaWoiKLJVemSnA+A4FU6e8kPfQ5C+y8XlHpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=prevas.dk; dmarc=pass action=none header.from=prevas.dk;
 dkim=pass header.d=prevas.dk; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prevas.dk;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ng4pUyvESRsamNEEk0NwOxnYmNo/qkkLH6+Zv1JIBLo=;
 b=jSVO4F09POvklXF6ny2Yi0sqeYjoWkdKLrwa8VFpk41aIVHy57MDDHlOFDsC/PsurP/QVbt8ly7Jak7qA1xkbvMLJygLTXuQtetZp4lwQC+KZ6Fnz8/aP62rNGhbPoPABz7mGptbp9s37qdJWnxQ0EjMMQ3GOAYGGe+IWLhKujI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=prevas.dk;
Received: from DB7PR10MB2475.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:41::17)
 by AS1PR10MB5626.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:479::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.14; Thu, 21 Nov
 2024 09:08:42 +0000
Received: from DB7PR10MB2475.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::7e2c:5309:f792:ded4]) by DB7PR10MB2475.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::7e2c:5309:f792:ded4%5]) with mapi id 15.20.8182.004; Thu, 21 Nov 2024
 09:08:42 +0000
From: Rasmus Villemoes <ravi@prevas.dk>
To: openembedded-core@lists.openembedded.org
CC: Richard Purdie <richard.purdie@linuxfoundation.org>,
	Changqing Li <changqing.li@windriver.com>,
	emkan@prevas.dk,
	Rasmus Villemoes <ravi@prevas.dk>
Subject: [PATCH] bitbake.conf: set FILESYSTEM_PERMS_TABLES using ??=
Date: Thu, 21 Nov 2024 10:08:47 +0100
Message-ID: <20241121090847.608522-1-ravi@prevas.dk>
X-Mailer: git-send-email 2.47.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: MM0P280CA0013.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:190:a::19) To DB7PR10MB2475.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:10:41::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB7PR10MB2475:EE_|AS1PR10MB5626:EE_
X-MS-Office365-Filtering-Correlation-Id: 434cfb74-1baf-4c16-b70b-08dd0a0c186e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|52116014|366016|376014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?olc717AqzTYNDFCgYdCG6q06js9ARa+9yrADO+WTTDBoBogRb5x33d7G1mMc?=
 =?us-ascii?Q?dycckAPu0I/JXHp57sdYMTPNgJouXopMAmKhxif21oFtyhT+swoyBWrd5Sc6?=
 =?us-ascii?Q?zWqfMRXpheTjYUd+xCQJGcY2kLEi7iIn+h6KShl3ydKvvRUKMj4QrSHqQ9Iq?=
 =?us-ascii?Q?tlp7Hx0djhftj/b9jqhxCx2MINp/4fk/Dd+48CFcytjEJhnW/2YWbM5B+WSs?=
 =?us-ascii?Q?sHFrTtVuXqhenG2izcJVzx44sllo8DNf9/i0Tbr3zPK39mJ+R3NbT3eixn/a?=
 =?us-ascii?Q?BbEtFnDp2/own4xgVeFQUamEpR/H4k/FWzcWevWaHxtnKj2VSsWY1+vYsIG0?=
 =?us-ascii?Q?SSNOE5YSOLn09vI07TXMwr3IovXf6gpRKMbfHSCXYeeQ8jdOYRks3VtC6g/z?=
 =?us-ascii?Q?kghp7M1Gkz6SkI3AMAY33C8lih7ZNycoRgWGe5dEWMHDxurKtWa16qVMB7J3?=
 =?us-ascii?Q?EsOOg29MhhSW9NV1TgBx7DubRgS4FtOYjtGlt1JpHff7dNmGIsXR6kvLwc2z?=
 =?us-ascii?Q?w7dCOPRFJUhHTUAQwfGgHQ9kiCaCzzCp3cS8v5MC/F4mcWQJ9f9J/xL0woNW?=
 =?us-ascii?Q?8HmiUPx5vkcKwSH7AHMYodO9sRJ6MQ3lFalC3azsKMyv80+fO4BbCO54b7v4?=
 =?us-ascii?Q?YowsWYecGhtQmMymfnlT555To7jJoq7ASwEKkmOq5c8hDA5pHcAaHBcRdcHp?=
 =?us-ascii?Q?sdkQ5Z9YRtb7oVU7U4k2d5lzIUL2l77gz6GFMt/8EAGt9fzCObbwsZZJvWlg?=
 =?us-ascii?Q?cSD77XHZy8DpD79sDsL5LKtSKwn8MNVH0S6BwCWtSQdzDAFfp5njbYhalDAl?=
 =?us-ascii?Q?Eg7OMr6PjxFEtntiXO/N/eCbss1lE/ZamQjatap/j+bDs76ruheYiHaE0+ot?=
 =?us-ascii?Q?7jtJuHGX6eo3JTHzhcfNBu5pAERKTYiVtriUKT/JwqDmQ3Xp9HgKdLn1YVH3?=
 =?us-ascii?Q?eWE9n+OVdLm0Lq9iYX3uRpFFJf/HJ1rBVkXPQkR0W5MzLfU9YFPV2MY4BORz?=
 =?us-ascii?Q?g3iqk0QY1uF2ML/lF/aQ2XqeYrCVXSEZnY8SLA3csGhfEsqSmmEG3bVoVxZ9?=
 =?us-ascii?Q?Nnzu3dN+BvINrdNcXwTAvaMYAtOe7EdTmC0IH92ZAtrB4ArhLQMdhslCs8kH?=
 =?us-ascii?Q?ydyE0Qmx/aNyOG78VEPC0id4ujD3LffEe1LpYyX9eIIoS2SlBSDexkN7Rirn?=
 =?us-ascii?Q?9Iu7oyWelJNrMHsK1kwGd67XJAEo7kZNtQfo1GXhjGr00PI/4nRLDXIDYFSP?=
 =?us-ascii?Q?wRsawDN7XdSmeFcsYKhiWhgo/vjv7m9UzuctslmtV88u0m3X4Q1OY6O6LKqc?=
 =?us-ascii?Q?OFyP5sw6XvX1hl3hpVM17smnIxdwjUrc6lvZW3Oatomp97GSU4JcthBjwpxu?=
 =?us-ascii?Q?29llwBU=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR10MB2475.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(366016)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?UI5mMoOGDH6Ups0TqPffgHpBFDh2Qw27y6Qk+4y+NRUfbpr28PpWifnZ+FS7?=
 =?us-ascii?Q?LYIIupyHmVVRbvT9b96COFT4O9kR0gctLylC49DhvO+30R7+TGoiWzx93Nj+?=
 =?us-ascii?Q?ulKbORuzJITKAvaXglE2k+NQzDj6KWFDNKfO76fofuafSdK90gQrx+7YgHhH?=
 =?us-ascii?Q?w+4tkigawRthVm3Dxk85sCpxYx5Gh4oReSz7XInGv3+z6uZ0eXfkXzWnWZJC?=
 =?us-ascii?Q?EsS9Iy7ETsQROv/WJQnyYgHOh57TnsnCv6OU0nxjKcBHamri/mYJ0vKNRcv4?=
 =?us-ascii?Q?rGFJPt0CSlWpD+MnUN0HbQAa1cGb3HFzBz0ZGEC1I/PhsrNsBr28VtLhuO1B?=
 =?us-ascii?Q?Kqtq6s55dN4SfSIVWCIhAfARsWCv0tdY+d0tM7rq8V79ZyoemW0eZHwO7g8f?=
 =?us-ascii?Q?QPgMd4Kuz5g3ZECjAJfSwpFwVmy8ajRhMM6M/YR2pPl2P/m3eTnkkfTd8KyF?=
 =?us-ascii?Q?fq/omCpq37MH8AcI2w0NHIuvE2bNVj/ly1ETthaIYYHwIzdfOopaUKh7ufZz?=
 =?us-ascii?Q?ZCZ3i98dk+s9YiIbmiMwAK5kTMbfb6pZ2FyxMDIiPAhBBf1KugypCkAKVakq?=
 =?us-ascii?Q?fRgV44RZ0NgVPWapYwI7LJzwS8APaRA5+10hVy6vFfFXPJvsqtVn6Xu6Tooi?=
 =?us-ascii?Q?RTb8gcKIXJDjiCo6h1YQZvtT3NSuBqohPspm1KrQE/fdnUg6/+bj910Cp9E4?=
 =?us-ascii?Q?aTHCjCb0qvB4+830uVwqL0ZSN+SqDJUFTUaDf6cazkBbFMd3tehRu63DhE1Z?=
 =?us-ascii?Q?xVCCE8OQsrCOCxuGcYl8IAtyYGexWi9qDFddTXN0KcFB5/8qscebeUa6ma8M?=
 =?us-ascii?Q?CcJp7y+gu13zcjVCphGe37+2F6RkMuxcWySaF+QHQx9q/hze39PF4l894lAa?=
 =?us-ascii?Q?o7y6+qGYViSYBxKPe/+fCCfebtwoHX5MzajegfL/PMdyqW++HWsR7r9ON5W0?=
 =?us-ascii?Q?1jW3PgDFIZ0UZD+MmGHKoQhOcaa1WnA6Ii5JX7mvqfA84j2BOu5oQ5VY4t2j?=
 =?us-ascii?Q?AlFcsOGewUs7ZeqH65bOaQzw+biQf+xxgUbjRTWsFrVmgfj3N3sLePKQi049?=
 =?us-ascii?Q?KX+ikBGbyf18zRxooYvhZJ2gWe3fboZmq/ylhyGc/v2Q02bq+usSV6NDXR4R?=
 =?us-ascii?Q?MNpDiOtuhNAAxOaJRA4c6KuxQTm0H/ybayiMW9n4PEu9/mPfGttiHFCvVCMk?=
 =?us-ascii?Q?2vzX95uxraEey9gLBSZ787cEoaWZot+KEg36fqB2LsGRSjvHGonu2Uw5+zSr?=
 =?us-ascii?Q?tl5gAPniP+pf8/ha7CnToBwcJsnZEu/CMuQNP4a8DK4cyC1yXg9kDM3ORZfk?=
 =?us-ascii?Q?0Jp8HTRj0frunImIQfsaps21Jy0zO6M1fChgSEV2B85fdHufJTkScWF9FxCl?=
 =?us-ascii?Q?z7nYYgF7KR4YLHCt9Xg/w9s9HThAr76xXCptZ4O3bQlkkN5E6pdmY8V5jies?=
 =?us-ascii?Q?fpqYe0r6U1Ns5cC26hmou8s9VHLR6HkTyWtBXhCe96ofDGKryQ492YJMolN0?=
 =?us-ascii?Q?UHRsa/m9zbwO0pUjQrOR71Jyq+ESkXdiCZej5k+RctsGkVWaTws6DbqOjbTv?=
 =?us-ascii?Q?HyRpZcidDVwuk9tkZaUNmbkF4ikGGeCDXgFL/tHlpFL2fTt4x9GW/12gf3dj?=
 =?us-ascii?Q?0Q=3D=3D?=
X-OriginatorOrg: prevas.dk
X-MS-Exchange-CrossTenant-Network-Message-Id: 434cfb74-1baf-4c16-b70b-08dd0a0c186e
X-MS-Exchange-CrossTenant-AuthSource: DB7PR10MB2475.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2024 09:08:42.4077
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d350cf71-778d-4780-88f5-071a4cb1ed61
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MUgFApKe8SaAdmpGR1Js4KJmYH9wYhHYp/BniO/YX82ntGdZAamFNLysJVMrq4Z8qgYDdleorkXDyqFp6x7ToXzd2CabKuvgr353AR83YAY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR10MB5626
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Nov 2024 09:08:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207519

From: Rasmus Villemoes <ravi@prevas.dk>

This default value of FILESYSTEM_PERMS_TABLES is set before
local.conf, ${DISTRO}.conf etc. are parsed. So in order for
${DISTRO}.conf to define the value, it has to use =3D. But that then
precludes the ${MACHINE}.conf from having final say, unless one there
resorts to some override hack.

Demote this default setting to a weak default. Then local.conf,
${DISTRO}.conf, ${MACHINE}.conf etc. can each use ?=3D with the expected
precedence.

Signed-off-by: Rasmus Villemoes <ravi@prevas.dk>
---
 meta/conf/bitbake.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 02bbf0e7a5..daf2d952e4 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -381,7 +381,7 @@ FILESEXTRAPATHS ?=3D "__default:"
 #  base_prefix, prefix, exec_prefix, base_bindir, base_sbindir, base_libdi=
r,
 #  datadir, sysconfdir, servicedir, sharedstatedir, localstatedir, infodir=
,
 #  mandir, docdir, bindir, sbindir, libexecdir, libdir and includedir
-FILESYSTEM_PERMS_TABLES ?=3D  "files/fs-perms.txt \
+FILESYSTEM_PERMS_TABLES ??=3D "files/fs-perms.txt \
                              files/fs-perms-volatile-log.txt \
                              files/fs-perms-volatile-tmp.txt"
=20
--=20
2.47.0


