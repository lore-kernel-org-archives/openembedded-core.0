Return-Path: <joerg.sommer@navimatix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11711C43458
	for <webhook@archiver.kernel.org>; Tue,  7 Jul 2026 13:53:18 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.117])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.174903.1783432396666666502
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Jul 2026 06:53:17 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@navimatix.de header.s=selector1 header.b=mRhvlOpr;
 spf=pass (domain: navimatix.de, ip: 40.107.159.117, mailfrom: joerg.sommer@navimatix.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=A5HnwsRmWLP8anrW6CV8WeKMUU/UkA66/dacLJQfavc1lfl3j1P8iLqc0uMwIOpw3Ca0lAVJ2FgNpZ9woEb9NqlEOWlSUkn3Duea2FvacLePRdD6c1lKPqJyBvjm2u0szYb9C9yh0bVyRlnugFCzIifGVf3bwReppmuy8JCl+ZNVh1EpYdh2ksKxBk1GYDjfmFlBB1U/o7ExMjqkx9j5bYvWOcGp2oM/7JiZNacLwcSp6JItHIiGq3Gs6sThWeB/QNzH8q7voOs5WEFVAiBaBDnENBeC0INN202aVvtUyGGrIJK4Ak8KneOnorgOpMXnvkzS3N2hXB2IudWFINAc9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m/s0zDs9rFgsZYuucg5Rh57+8O1ki6YVQM37uw/HviI=;
 b=xSu5fz6cD5JYbjb/E4DA5/l4/acKTkSZyCijAEf+G3ZDJeMSAfKKYLwPXvX+TuEH3q1D2NmMyWi7TJT3nNnIwq+iLbove4denwXBrHyTk4MwhfoxpQb9Vzao7aA6gJC9tIAsyEzSr/SHRuIPm9Uj6+krRjqPdHwSXhoHlFmtws5nOkmHK5HLH1ZTbqJjPdmcnl3NYnqQa23QxkakgUWXeltfzb67owsinHtxry8OnOXVhQ4cfQ9Kl7B4dJyxANsjipiXtat6/3uwDy9X9BlRUSQWgGQA4YK9MuAsjaa2pU443opRh6wqLH5+0TAIT9Gt327SpDKSkN6uoTF4Jr/xCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=navimatix.de; dmarc=pass action=none header.from=navimatix.de;
 dkim=pass header.d=navimatix.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=navimatix.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m/s0zDs9rFgsZYuucg5Rh57+8O1ki6YVQM37uw/HviI=;
 b=mRhvlOprLJ3i77MtdJtjHPdPSLxpwjK1CPWVp5+D9fm+SVQuIUezo3zf3zhX6zzaO9v47GjnTcCMQ4FsIMiXZj4nCdRkHVrfyt0xlB3Q6bztAI72Jhoku+6GjOU438w9q5FD/iyVWC0XDFx9OjK6MIQxxN2ty3xYXKH1emZnlJQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=navimatix.de;
Received: from GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 (2603:10a6:150:2cb::8) by AS8PR01MB7189.eurprd01.prod.exchangelabs.com
 (2603:10a6:20b:25c::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.13; Tue, 7 Jul
 2026 13:53:11 +0000
Received: from GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 ([fe80::d5c3:2dea:3d98:25fd]) by
 GV2PR01MB11835.eurprd01.prod.exchangelabs.com ([fe80::d5c3:2dea:3d98:25fd%3])
 with mapi id 15.21.0181.008; Tue, 7 Jul 2026 13:53:11 +0000
Date: Tue, 7 Jul 2026 15:53:09 +0200
From: =?utf-8?B?SsO2cmc=?= Sommer <joerg.sommer@navimatix.de>
To: openembedded-core@lists.openembedded.org, joerg.sommer@navimatix.de
CC: =?utf-8?B?SsO2cmc=?= Sommer <joerg.sommer@navimatix.de>
Subject: [PATCH] base-files: Replace /srv, /var by $servicedir, $localstatedir
Message-ID: <b032b8a153fccb0cb0cd0dff38fbcecec27f5d0e.1783432389.git.joerg.sommer@navimatix.de>
X-Mailer: git-send-email 2.53.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: BE1P281CA0283.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:84::9) To GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 (2603:10a6:150:2cb::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR01MB11835:EE_|AS8PR01MB7189:EE_
X-MS-Office365-Filtering-Correlation-Id: 87cefe14-feee-4b25-c496-08dedc2f1513
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|376014|23010399003|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info: 
	c3HBMjGblz1OOohfnb6hwhV3jbto0xccCQZGtdMXHU1o3Is+ETOSoNfmr4fwqVvS8q8DPADpi+TKJVH96hXRsHxMvSStSuJdr7aHne9nwFBA9SQJMQVp8fGLn+SA5slidLAgTW603Uhf98clIj9tKCztDccTJdky+mqARTPFH9VIcN+aU+h4YJjSFN4C0jJrN5SyhaabS+vQvkiyFNKgP5Ia4Hxty1+7JvXeWtcLOm5S5wBtSbr1wMkjY+GHo/S0+ORptxm+mSpGq2FKUMBsITlcEyotzaLgG6OTFWXTPB7J5SPonRRsBrJEABpMDt9y4QcUCrIXreYzcIt0ZybUM4XNIgxLKH6eIiQKPaXJzkMZenhtf1fAj97QXFlDPS02RmilIO6sKcnP/NnGlR2mEqou/tVjAqyIKRvNFyk+NYr1UDkTNluRiCuY3q0Zn17N5n8YpTqV39V4eOkhJlcif+mXWljEmsTx2XO51mJqSzHq6doi0ecZeGz1EcvGZtXTjKDuoCOpub68Z9y2RaYHDoJDHc8iFtWPawK5fsMfCOX+OoW9X7anQia5FWh2qP8ETeC/M+OIcWWrYMVak7aHa8lwcQnPK0uPOEshP3gFmrtlXn6LZSz3IsNCCg3tjis480KHOMeb2hJMwfrmJFfQtP0OcmYV9J06rMqyzHt5Ewc=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR01MB11835.eurprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(18002099003)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?jCLpkB7s5rNtbwcOs948gWjjLmXg2/bd+kwXFXDHWMc2W2t9vLLZfYdh/1uD?=
 =?us-ascii?Q?9M49V24Zs1ezuWMEJ6M7JQMQ3ss1W+m65yBFjRQ8dkl4JN9L80cCHXoFleJf?=
 =?us-ascii?Q?b++CL4pgxggChJvAy0zf0yRrAw6qMdePqid4zUwmk5m8U9mJ/LFSqJF3eJ3K?=
 =?us-ascii?Q?GHBdXFMj7mGOBmj5T5mY2EYAYWIZsSrKh8l5JIx4AJRd7S0hl3xSMeRXlFmg?=
 =?us-ascii?Q?fdbMg/LmRWB6aBpoYLmpXUlgiNAma+s/6luUt2jr6O/wfW26RDw5SmZNxXqN?=
 =?us-ascii?Q?QeA1OYMyeBXvFCZAcgze5PgEIKGGAVtDx3O3wheF8K3QVAzTJ7FkABXbo4cD?=
 =?us-ascii?Q?ZefqmxEGg3y2YDBqRa61kM2ofGFRIYVRzPBYxUXMz2ND5W2OpJAK0Lf6tljt?=
 =?us-ascii?Q?ArtWm2B04bZlGGcSl8WmdEUw3BVTC1z97ylRkC84u/3JQCWwHO/vuwVbjF+y?=
 =?us-ascii?Q?J7uaBvx/bOugNqKeqZmb9E9I5g7SLRI04ffrNRypPpdPnnMewkkHNEsD42IJ?=
 =?us-ascii?Q?YSbVPxVFuZQJ3g/dsPchBfkRh90B16YNU0lNwMP2fzAPsqEM2U5W64IS6tpz?=
 =?us-ascii?Q?U6BC1nNnJM0r/Uh2QGs1bk/RBEh0d35m3cSsKlv7lILFvd+wGkwkH41GYEYR?=
 =?us-ascii?Q?GkjUBWbvrimZb21PE8U+cqHILEA7rpn1qRQpCh3UawvjB4L5iwe8xxQi0LRM?=
 =?us-ascii?Q?9V8552JUltxpKASCV/RX7BqQUEJ4ICX0DJfdYrPnXW0ZwkHp2kt81wFdIAsi?=
 =?us-ascii?Q?RTWV8f+vecc2WAgqAR3CAHLelp/a7sW79l/+h+2VCvvmchy/8JIsRTvwAcmK?=
 =?us-ascii?Q?mmkRK83tkbl7Hjr8h4VjcC6FbvtwjnarNUwIwOn8eBuUGp/ggmPB7cyZUQgT?=
 =?us-ascii?Q?wDfGLBFyuDXUYeZtPEYJWEd7QP1/dayojlIeDi+sX5mgtEYsTb5Ry9MyQ7h4?=
 =?us-ascii?Q?xa5KzFCVrSfC8tRGRBQtzPgLxD8GPTn+9MgoXDaQJpQxguRG2wqSdHlw5su+?=
 =?us-ascii?Q?cEYliIROIJd17djEP3CPFDsvqUvbuxbuVwVs440+yx4sellFQQ5sYvZmffwh?=
 =?us-ascii?Q?RyMQh+QxOggctP9AEkC/4dRKb/uKDoVJVKEgJP59IAbCYwILwlk+p5zoVHGE?=
 =?us-ascii?Q?b9VPzQh3OUj2XlMf1/ZWdf4qcRmNLj4rKUQZY14oXSTEHsNPMuYEKzdHSMmx?=
 =?us-ascii?Q?EKowuvsfT7fzWixaphLB1cL/4Lb+M4lup7yyEgZNScHGtC2EVIS1ZPVJNDcX?=
 =?us-ascii?Q?9FtCPaRpXM6kw6/oOQFs80/IGIyUpRfKccuiuJ9bS8QH/eOu91F2809dPytb?=
 =?us-ascii?Q?8pKv33z2feY7V75Rn+r/CliLsF/YQlDW17rZr/qzfYszm+FDROnluw9dIxir?=
 =?us-ascii?Q?3Z1tPh2XHytipoZcn0GO8JcyOl8HmH9BcbZ22omF/LC6pIbfpXTtM9jpEv7N?=
 =?us-ascii?Q?ouSsQSZQAcgtnv9BXax+638PJhuQBU8uMrdnVDpXwn/Gy0X2EKL2kfj90w/r?=
 =?us-ascii?Q?UiGsQWwglPiLOSsqqrX4SIQtIpBdPw6cm8sQcA1Z7tVaS9jCkt5pL53h3/YC?=
 =?us-ascii?Q?+R31L1zw97t4LMtIS30sJxqEyljrjJR4lADS1FcGmp4Kf7yQfx0EOhmV07yD?=
 =?us-ascii?Q?kvnnFWivvyBkyu3pis18sWpmgCSSEW3MEfe02gm6tazNafHhjsG7TayGyzI5?=
 =?us-ascii?Q?sMjBomvCc+PefN8dfBiu5bSo72DhFHMkBevEuswrr4/YzvRXsZvTL314IBlr?=
 =?us-ascii?Q?PlaQ8j4Z7NJb0tzi25TbAgwBDlE3Vf0=3D?=
X-OriginatorOrg: navimatix.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 87cefe14-feee-4b25-c496-08dedc2f1513
X-MS-Exchange-CrossTenant-AuthSource: GV2PR01MB11835.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2026 13:53:10.9983
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: c87b4f54-b992-4813-8f3f-4a876324197f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XYv97U5qKH6JqfRWtnO+y2OzjnGxvvRFq6N3hAT7SexV+P9GAQWb2qKNhLiTrbVEPMtwUGi5WjdpfXioIVg7ceyOZffbB4FlnBRmHPRVHH8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR01MB7189
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Jul 2026 13:53:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240388

From: J=F6rg Sommer <joerg.sommer@navimatix.de>

Signed-off-by: J=F6rg Sommer <joerg.sommer@navimatix.de>
---
 meta/recipes-core/base-files/base-files_3.0.14.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/base-files/base-files_3.0.14.bb b/meta/recip=
es-core/base-files/base-files_3.0.14.bb
index aafc0aa923..1f24f282b6 100644
--- a/meta/recipes-core/base-files/base-files_3.0.14.bb
+++ b/meta/recipes-core/base-files/base-files_3.0.14.bb
@@ -47,12 +47,12 @@ dirs755 =3D "/boot /dev ${base_bindir} ${base_sbindir} =
${base_libdir} \
            /home ${prefix}/src ${localstatedir}/local \
            /media"
=20
-dirs755-lsb =3D "/srv  \
+dirs755-lsb =3D "${servicedir} \
                ${prefix}/local ${prefix}/local/bin ${prefix}/local/games \
                ${prefix}/local/include ${prefix}/local/lib ${prefix}/local=
/sbin \
                ${prefix}/local/share ${prefix}/local/src \
                ${prefix}/lib/locale"
-dirs2775-lsb =3D "/var/mail"
+dirs2775-lsb =3D "${localstatedir}/mail"
=20
 volatiles =3D "${@bb.utils.contains('FILESYSTEM_PERMS_TABLES', 'files/fs-p=
erms-volatile-log.txt', 'log', '', d)} \
              ${@bb.utils.contains('FILESYSTEM_PERMS_TABLES', 'files/fs-per=
ms-volatile-tmp.txt', 'tmp', '', d)}"
--=20
2.53.0


