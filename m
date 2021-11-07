Return-Path: <tom.hochstein@nxp.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 084BCC433EF
	for <webhook@archiver.kernel.org>; Sun,  7 Nov 2021 16:01:31 +0000 (UTC)
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (EUR02-VE1-obe.outbound.protection.outlook.com [40.107.2.53])
 by mx.groups.io with SMTP id smtpd.web10.32596.1636300889653418305
 for <openembedded-core@lists.openembedded.org>;
 Sun, 07 Nov 2021 08:01:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@nxp.com header.s=selector2 header.b=m+0Ee8Hz;
 spf=pass (domain: nxp.com, ip: 40.107.2.53, mailfrom: tom.hochstein@nxp.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FVYuQ2+zcbKdKQUD/1eU+Jgf6d8T3GuuhE99505E4OeDlJmwwwg++hwiJliUI+vNHHyN5Jw1KIY5zrJ8vKQ8P0GQUbbn70S7WlK1jGzWCa4k/qgp84oqVVHpnYlVR5AGrvtVsKJZYRBgi6kxxqJ2rBO/8tU44i4GSJr6pKkBZOSY6q6jwsInX8H+Hp4K7tSBEINsbkJaqWjkq9t6cVgog3sbxSUsT+R/vVendXDX12jLnahA0WkCLrDsBu7espyitL5yE2Xk9d+kUJfn3ZjL/fHcfMUMlHoHGSPzgu5CjdpoWweRuwzGATnSAsrv275QLGjKkXinMmAbXdL/DcyV1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nz08e/gYiDRQUmKallxALXjbUVa+kyC8MI6SXwwEYc0=;
 b=R4iXBtLiwIsAY+hrWVWxbkOJUKxJLPOyugXdP/RKnT0KSTABasG/EZ/zuq3Ci47PbqjpoNCqxYAWGZ4alEB9l5ctTMx1aNLOMfhLdLIGDm8SDEB2BLEFdvJhcZWi6Y3ypRoI/v7mnn+cqecsq0FxxINllu2xCBR/FDzA8g59sP1yeh5OXT5svtYaHG+SPrcpUkHet1f65b/+Uh9FRfgMC9MfERj4vHQmX5abq510acYDbNClyVO+W3RepI0ckvRB9dfmSgkivWofvf0I0FKdQr/mV/2nv0GgyvuRsslxPRuHQuDJtoZXgZeFBw43eR9lJEGxQEtzKywUKPUfumQMKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nz08e/gYiDRQUmKallxALXjbUVa+kyC8MI6SXwwEYc0=;
 b=m+0Ee8Hzb+OJwYyk3dMbCipA9ZkHhcVSImDRYGRfUeluUh4rpjC6+HfJD7kWmQ8WkJcdu46rPgMLaDvpxjNEsU/QAOuQqBxrhUVE+qFsjOjLQdKw3ceBvSh0DiP49IcHDzTwAoHTBAauldg5f1+E73NmiW3BaXDwuFKJ8yB4V28=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DBBPR04MB7753.eurprd04.prod.outlook.com (2603:10a6:10:1e1::5)
 by DB7PR04MB5259.eurprd04.prod.outlook.com (2603:10a6:10:1b::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.15; Sun, 7 Nov
 2021 16:01:27 +0000
Received: from DBBPR04MB7753.eurprd04.prod.outlook.com
 ([fe80::25a8:33dc:5634:180a]) by DBBPR04MB7753.eurprd04.prod.outlook.com
 ([fe80::25a8:33dc:5634:180a%3]) with mapi id 15.20.4669.015; Sun, 7 Nov 2021
 16:01:27 +0000
From: Tom Hochstein <tom.hochstein@nxp.com>
To: openembedded-core@lists.openembedded.org
Cc: Tom Hochstein <tom.hochstein@nxp.com>
Subject: [PATCH 3/3] bitbake.conf: Use wayland distro feature for native
 builds
Date: Sun,  7 Nov 2021 10:00:06 -0600
Message-Id: <20211107160006.25440-3-tom.hochstein@nxp.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211107160006.25440-1-tom.hochstein@nxp.com>
References: <20211107160006.25440-1-tom.hochstein@nxp.com>
Content-Type: text/plain
X-ClientProxiedBy: BY3PR05CA0007.namprd05.prod.outlook.com
 (2603:10b6:a03:254::12) To DBBPR04MB7753.eurprd04.prod.outlook.com
 (2603:10a6:10:1e1::5)
MIME-Version: 1.0
Received: from lsv07069.swis.us-cdc01.nxp.com (192.88.158.246) by
 BY3PR05CA0007.namprd05.prod.outlook.com (2603:10b6:a03:254::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.5 via Frontend
 Transport; Sun, 7 Nov 2021 16:01:26 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 00687bb7-f35e-4fee-2cd6-08d9a207db0d
X-MS-TrafficTypeDiagnostic: DB7PR04MB5259:
X-Microsoft-Antispam-PRVS: 
	<DB7PR04MB5259599D8F8EFF4344D2F47CE2909@DB7PR04MB5259.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	fuPpUc2lcDK45utHcya66nwHeEZZOc8bmrYpw0FRZOQvI9GpT7hr8YnCG9PhcuDD03EfURJk71siMiGxbMXlsUFWdMFIja2cmxFnYUlTSth+nC20YbpQz3Ld4qUM6+OnkBHV16K7z6nVvnOjagbf6xSeWx5s3MZdQfHcG/a8CWIwpGQPPp4TsdZTctw+ZBvyOMSmyQr+MDg3/KgvGYak5icsa8Qzr8yV5T4LWznJgMehHfOjD/qgBnjfpqAfTivbE/h0dYWsAmBE/KLye2pa5But1PLywi+6j8fk0sNUS4TvXQlF5ORcZXaJ6XWlnNJ5oDmQrN2rO0kk/pkunqpn/0gl4STn5+lY51S77UewxOW+XbU12IBLDVrfv1QPEiNHsPdrmecRY8X/vTg3bQ2rpVIPsGLd87PQGgccXXC6WwhOi5DGV0Pde2rx7heo/KZGsIVY9A6ZTvpRZAD8RYEieVlJvWxsrXA2OiPEyhWXSW2nkVXi/IXiis3lJ3ShrRf/5AONofU/hwdMifSeL1DwKc1o+qosMkGkMulcBSp9dd5MUl7OJoW5uGcxDpL4eqc+7vY2NQHeRGuuAGlrusb5f0XC+iNmsD0WSVo6GB479xaJez7zMqracSTn+Jc4dDkuaw83jtLONVI5gSOvLwh/x2wu2Fncoeos0PMV0JEqVsP2Np6t4yaXW1lHty19W1Ij7ElZihHdUfukf4aYDirq4g==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR04MB7753.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(86362001)(5660300002)(38100700002)(6916009)(38350700002)(52116002)(7696005)(508600001)(1076003)(66946007)(6666004)(8676002)(66556008)(6486002)(66476007)(8936002)(2616005)(2906002)(26005)(44832011)(186003)(316002)(4326008)(36756003)(83380400001)(956004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?iR9lbz8Z7v1aSGtD3vCuLIT9Sx9Xnc+8vEqwulA8mKrK81yzJECsnstmqUV2?=
 =?us-ascii?Q?LZEyzIbe8DQrSUqXV5NNluMBwmDknXW8HmtH20woOXSa/5ogon04wGPkbVKM?=
 =?us-ascii?Q?pkY9CxrySVWutS3uoCRBeRcnmmV4btIzxTRi36rLDblrsMrwESPyS63XO0gn?=
 =?us-ascii?Q?2pUwXJSWrFf07TTaUyqc3F9qEqc8FJzdKKvfF4vCZeW93Szbd6sdrS5HV79L?=
 =?us-ascii?Q?fVVQHizGjaX/duAlk7aInFJ/IgXHMiz1GXKTXcPutoolST01qlL+CoS6fxcj?=
 =?us-ascii?Q?57ysJPXbxlXx86PRpy5RcS9FJdLP+gLBX76FKs8sfpC1qcWa7P/6e/rnQ/qJ?=
 =?us-ascii?Q?0nPhmLKm+wihstFbBdYW+Z6odZsDsx8MJhzgAYuOPom7HUlVOJHgLZWIZK7/?=
 =?us-ascii?Q?i3qu46jTMKfbZRg89vjoIjvPnmkaSw/At07KY5h3V5PAvx9XcqV1/kAya+Pj?=
 =?us-ascii?Q?FeTNZrJ3SBZE6gvTvsm9Ixodn44KXOA7+hryhBQGKsh1W4Bl8CM7RMawiZka?=
 =?us-ascii?Q?ddPIyjuDDvgfwRLiuBKXG3xeFTckkU5aKAFARs+/PzMYqwZIcM2odOX4ocfV?=
 =?us-ascii?Q?wukdv7hwDzPKWXPvYH6otsUELa3pfA8wKQjeyIZnEqi+BgVIkDKSkrnDNuZa?=
 =?us-ascii?Q?gr554AbWds554gppdOO9Aps1u+UuYIfv4k+tRxAiy3ODSbQC9uOo0ijAlNHc?=
 =?us-ascii?Q?suf6utO26eirjRny55p2QjEJc24O2v+EqS67Z0N5/lgbVD7JZfbN6jadsG5e?=
 =?us-ascii?Q?xNOLCw2KELiSY4GBBZYUlWRVOD9gurfN9qOOUOq+t19/RJ/vIuyVDD2QNJse?=
 =?us-ascii?Q?3O6Z7WoZ9GVfPlbUWl2BFZV7zaaojLHB5nrsYcs9DSDHyzGKT1RFErNCB0tQ?=
 =?us-ascii?Q?zQ1nNCP1S/wDcOvpr8sUTGxhCi4TO6FV/d1XxEqBJhA6cO8AfwpEY1JPwP+U?=
 =?us-ascii?Q?uKi0a+L7P6dAKvrjWfC39VeDSLHCbL9Peuy/tnoHRRYuVthRH+LI0oKgjf0b?=
 =?us-ascii?Q?Yo5eUCzdhZ7KL0//2/MwkkXcOf9Fp1w9BKuqIJ6iWd2NJIiEe+MPm6Xo3But?=
 =?us-ascii?Q?DNONX0+DkSfQ7hnsXKl1Y1WiPMf9LwiQVKj7TNuBa8wo6HTPuFj5oNo9LZUU?=
 =?us-ascii?Q?g9faj9Cw03MpOl71QFtBNDZV44837pk213O6Cye13CQoUwdo449mUlujUgOB?=
 =?us-ascii?Q?e7WQIAB7NUwTjbBbYEu3NijOJlErPTYkfOVtRSNUzT0ZGLphHAunyY5M3Xft?=
 =?us-ascii?Q?o8Mng4bbcAAkg8u3VtZq4r+HaKIUSrjh5k0wUM5ejLktQhPMWjCRXEsDp5wX?=
 =?us-ascii?Q?iffW2m7tPMWByNL/doSlOiCCISkk2WvmX2DYj6Ix7DDIqPkV+E6PtZnOpOsU?=
 =?us-ascii?Q?A7cgqPWOJtAqthUdVcw/iU35dB6ioYK8PXSYW8QjdvM5wSUCFGzEUVNQRZ/c?=
 =?us-ascii?Q?q4QLEVN1MbrQvekeiw/KTsR8w+X8E4rCNdORwPn2P+gbKzv8ztl42sWAWE7B?=
 =?us-ascii?Q?yPg8uQXtEcbtLgeXq73ou+ElIP7e8k5GsnVfMcmBB0IL/zPon0QF5KdcQ9iD?=
 =?us-ascii?Q?bMqbZP+vcOpgW30KYVpumhXdD639J/+tFHjpKSG8TjNCqfSCEsblSIigAAgD?=
 =?us-ascii?Q?EeUzBjEoPpVYq/gm425Tc5M=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 00687bb7-f35e-4fee-2cd6-08d9a207db0d
X-MS-Exchange-CrossTenant-AuthSource: DBBPR04MB7753.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2021 16:01:27.5669
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 YdCBkVa8zaHjNgONKXkkBUnebpdEpNWDHFRosfIOcMcJWJs01aPlsjr/7I4pEo+izQWX+eXfmj+Qjt5Wtu/GdA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB5259
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 07 Nov 2021 16:01:31 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157956

The wayland-scanner is missing from SDKs with weston, but the weston build
requires wayland-scanner. Allow the distro feature in order to include
the wayland-scanner packages via nativesdk-packagegroup-sdk-host.bb.

Signed-off-by: Tom Hochstein <tom.hochstein@nxp.com>
---
 meta/conf/bitbake.conf | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 790f2f7a8c..71c1e52ad6 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -869,8 +869,8 @@ DISTRO_FEATURES_NATIVESDK ?= "x11"
 
 # Normally target distro features will not be applied to native builds:
 # Native distro features on this list will use the target feature value
-DISTRO_FEATURES_FILTER_NATIVE ?= "api-documentation debuginfod opengl"
-DISTRO_FEATURES_FILTER_NATIVESDK ?= "api-documentation debuginfod opengl"
+DISTRO_FEATURES_FILTER_NATIVE ?= "api-documentation debuginfod opengl wayland"
+DISTRO_FEATURES_FILTER_NATIVESDK ?= "api-documentation debuginfod opengl wayland"
 
 DISTRO_FEATURES_BACKFILL = "pulseaudio sysvinit gobject-introspection-data ldconfig"
 MACHINE_FEATURES_BACKFILL = "rtc qemu-usermode"
-- 
2.17.1


