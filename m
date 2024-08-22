Return-Path: <olani@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CC5EC3DA4A
	for <webhook@archiver.kernel.org>; Thu, 22 Aug 2024 08:18:20 +0000 (UTC)
Received: from AM0PR83CU005.outbound.protection.outlook.com (AM0PR83CU005.outbound.protection.outlook.com [52.101.69.68])
 by mx.groups.io with SMTP id smtpd.web10.8711.1724314689438977053
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Aug 2024 01:18:10 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=ew0aUm/H;
 spf=pass (domain: axis.com, ip: 52.101.69.68, mailfrom: ola.x.nilsson@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xsNrEa7A6mKpuUnBjGl5t7QFV+iAELGFFnbxdEgpEl7gswQGv/W4vhzMQvEWY9tLTGDLzLy2oCJCXvBsNUOgItUbt4Xf3IX38frb+RyRufnfMbcEo27GopkkB/djrfuWc1iGQxy++iH6LoWdp/o3S87AznyNf9ZTrJevhnqIja9iZsPirZDfnocDALdojjvrJLJ4ftVQMEo2N9E7AxBUFrNFxCOFas5NWeQ6qtOAN+cN8YJRErHzKEShoB7xX73k5VdY7e2i9GeipkqV+BZMLxEoG/9OvRMaiZXZlLa1MKouiPyYhJKfddxX5VOQ0xy8Ry5oCouByiTQ0AlVkzidpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=15CPDz5oqCM1sKPa6fAJUqPMpc1Ah1K1QE9U4BvY+PQ=;
 b=hmCw9zxRY/kLH47deje3LHc0fhhQyNli81Xmt5hH+TdbFusB+gLFKN4IKAxtYBlAivyRS9siYj2d7qS/fIgIImEN/XNp4y3sFegeZrMx2c4lMFGBSKmiYBwcNmPjlcZzIXGTS4dBRtGtc1dxinusp/c0DS4RF3l5rR+EYIiQspExNi0DHkv57FWZSH5KlFE1NmplVBBaRi3CnmpkSF7cwW0WhiO9ddpEa3ciT2Hy1d7fhd7G29u7hm6rwnwW3AkluQEDPhusNo7E+PKLRrMic3cHivX/4xUaBvd6GOPJQ/4Gww4ios6X2uSIyhBXZukGwIV7BEf99ff7YxD2nZhMbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=axis.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=15CPDz5oqCM1sKPa6fAJUqPMpc1Ah1K1QE9U4BvY+PQ=;
 b=ew0aUm/HrvSdTWPcBPCULfS0nAaaEiR3aJ/jjbUsYqgwmwSde0WzCijViaGd1g4ZT/sRHnv7V5KSiNCCw+R6NlBtCUPa+tbp3FARwTFQsYb4Cz9uif2+fDvXK/4oQlKHOGVliCrJi+93d6KULSfecgc/GgYC82MU7ob+BZnQuoM=
Received: from AM6PR10CA0066.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:209:80::43)
 by VI1PR02MB10250.eurprd02.prod.outlook.com (2603:10a6:800:1ca::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.19; Thu, 22 Aug
 2024 08:18:04 +0000
Received: from AM2PEPF0001C70B.eurprd05.prod.outlook.com
 (2603:10a6:209:80:cafe::f) by AM6PR10CA0066.outlook.office365.com
 (2603:10a6:209:80::43) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21 via Frontend
 Transport; Thu, 22 Aug 2024 08:18:04 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 AM2PEPF0001C70B.mail.protection.outlook.com (10.167.16.199) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7897.11 via Frontend Transport; Thu, 22 Aug 2024 08:18:04 +0000
Received: from se-mail02w.axis.com (10.20.40.8) by se-mail02w.axis.com
 (10.20.40.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 22 Aug
 2024 10:18:03 +0200
Received: from pc58073-2410.se.axis.com (10.0.5.60) by se-mail02w.axis.com
 (10.20.40.8) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 22 Aug 2024 10:18:03 +0200
From: <olani@axis.com>
To: <openembedded-core@lists.openembedded.org>
CC: <olani@axis.com>
Subject: [PATCH] scons.bbclass: Add scons class prefix to do_configure
Date: Thu, 22 Aug 2024 10:18:16 +0200
Message-ID: <20240822081816.139600-1-olani@axis.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM2PEPF0001C70B:EE_|VI1PR02MB10250:EE_
X-MS-Office365-Filtering-Correlation-Id: 7861b850-81c7-4031-60cd-08dcc282f21d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|1800799024|376014|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?eWA+3tU6Iazl+X66SmMe1ulZy4YlsdsnizNJ96CI3WJ+m+U40Y8cQh6Jj+Gb?=
 =?us-ascii?Q?J0pUNaG1njJodhfr9X0LdFzCbjHWUNtTgjTb0MahEb04rde9+udXyi3tbY05?=
 =?us-ascii?Q?0z7xDzH1xG9CGgtSw88EM5zx0sxuTYmka9RSg04SL5zFZNqNBaSQk0e0iW0Z?=
 =?us-ascii?Q?z0yrV1pxVg9sEx0Tj2C7fE4TXsCYQ/k/ohYSeBjx0ByMhgb63O5G3fooyA0w?=
 =?us-ascii?Q?zjxbAjRTHTsfTSTGNJ4vO5OqSz6fSAIF3heZaSQUiHnNNA9gKR75TsUousyO?=
 =?us-ascii?Q?0DgBnIrasRnf9s3P9owx8ZDtKQtqtHZ4IWUNNi6UpouzFb+yPYunKNIs/GCf?=
 =?us-ascii?Q?mJRPvVk2dkc13ow0j99xrnbUupy5T2A/zUN725rhOefd7HCRSWnubLe7ZlXT?=
 =?us-ascii?Q?LiLDio2OJKJwY7wAErdg5Zq7yLfrekmJeIAvh6ol3+Qy6DJLRxYDd2FT2DUN?=
 =?us-ascii?Q?kmmh9GKCxZT7Q+Cpvg+9BZzb10S6X6HB9XR40/LDpT4I/2pzuKPXTUmqkSPE?=
 =?us-ascii?Q?4Ygg2WnnGoXaBqfJKdfY2qk4rMjEXNlZDa74E3XUIBWWXWwDPn3Z8b2Jh5U2?=
 =?us-ascii?Q?y28yNO7GuXlLX5k//lErPD+zALq1hjIteIQBnaUvN24bxMLAANxFuqXJgL8m?=
 =?us-ascii?Q?wvjsn00dgXljFMLOIgLp/ZXU7t5+r4ntK/W7YDz2YzjYWifMyKdz8bjJ8Neh?=
 =?us-ascii?Q?5DSc0elvK8zLZNybfUs0ALh3CrEkWpVZxky6S/AO7bZP+M2rdzML8OXaQylz?=
 =?us-ascii?Q?cnmtqrQBT3mvdPScK8GvZXFoIVHL4c9j+kw7PtufLNMTZas4i08Mpw2MkM4W?=
 =?us-ascii?Q?70aAGxZDaGaiTQE490HqitEZ4XkRbUjSnKDTSLIPGGHCPXqXG5+bUQvQWXP/?=
 =?us-ascii?Q?2n0gLU5fNeJ94jx3e2NtDNlKBLgZh4fEwgGrW6KpmrMhfi7FLizO8WpEnXaB?=
 =?us-ascii?Q?rd6vTWNapw2VKQeZOcbQJ3AElQZywUoMflo3nWls8BJoYDUJwbe7VFNqcogi?=
 =?us-ascii?Q?rR/N9yM7Wh2UbE+OWm8e5V0SYm5ZOUyTiD9kvYr/dajA1+7DinMJbjnjj7Wk?=
 =?us-ascii?Q?Vlv+eLwQU9yh3ycCbN84HNbed46TrpSWBTevCn6Uo3Wu/0JhgYw6GxwfUmdd?=
 =?us-ascii?Q?k3SHX6P4qmVOldicGpBhaNEUho3SzkD9lVGcCPoUGI2hxCZnqB96GMxyreoa?=
 =?us-ascii?Q?vmwtZcgY6jHYqwA3SjZx85h58i9O4kAiWEV++GA54mL7fOkSl/WccOdPkSlK?=
 =?us-ascii?Q?p2/Si+nV6Sdcn1G0cKG1SggJT1ALxk2ysoeiJ1so1PVFqhfXGxO61WXNeoCY?=
 =?us-ascii?Q?+KrKMuzynlsHGpEY7B6dFResmgkShXaffFCfPFZrbxqCPYFui5/iKV0KIlPR?=
 =?us-ascii?Q?OFaWOx+xTe+bf7u2Ced22gXN1NJTWOQj56rbwU6iRJqzuIHPQ6Qth1NuyLrz?=
 =?us-ascii?Q?cRiaIO/mVbUZkclqJn7lFsG5S6fGErHv?=
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2024 08:18:04.2847
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7861b850-81c7-4031-60cd-08dcc282f21d
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM2PEPF0001C70B.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR02MB10250
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 22 Aug 2024 08:18:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203613

From: Ola x Nilsson <olani@axis.com>

While do_compile and do_install already have the scons_ prefix,
do_configure did not.  This was most likely an oversight from when it
was converted from do_configure[noexec] =3D "1".

Signed-off-by: Ola x Nilsson <olani@axis.com>
---
 meta/classes-recipe/scons.bbclass | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes-recipe/scons.bbclass b/meta/classes-recipe/scons.=
bbclass
index d20a78dc6e..1cb375522d 100644
--- a/meta/classes-recipe/scons.bbclass
+++ b/meta/classes-recipe/scons.bbclass
@@ -12,7 +12,7 @@ EXTRA_OESCONS ?=3D ""
 # This value below is derived from $(getconf ARG_MAX)
 SCONS_MAXLINELENGTH ?=3D "MAXLINELENGTH=3D2097152"
 EXTRA_OESCONS:append =3D " ${SCONS_MAXLINELENGTH}"
-do_configure() {
+scons_do_configure() {
 	if [ -n "${CONFIGURESTAMPFILE}" -a "${S}" =3D "${B}" ]; then
 		if [ -e "${CONFIGURESTAMPFILE}" -a "`cat ${CONFIGURESTAMPFILE}`" !=3D "$=
{BB_TASKHASH}" -a "${CLEANBROKEN}" !=3D "1" ]; then
 			${STAGING_BINDIR_NATIVE}/scons --directory=3D${S} --clean PREFIX=3D${pr=
efix} prefix=3D${prefix} ${EXTRA_OESCONS}
@@ -37,4 +37,4 @@ do_configure[vardepsexclude] =3D "SCONS_MAXLINELENGTH"
 do_compile[vardepsexclude] =3D "SCONS_MAXLINELENGTH"
 do_install[vardepsexclude] =3D "SCONS_MAXLINELENGTH"
=20
-EXPORT_FUNCTIONS do_compile do_install
+EXPORT_FUNCTIONS do_configure do_compile do_install
--=20
2.39.2


