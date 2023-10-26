Return-Path: <niko.mauno@vaisala.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A21FC25B67
	for <webhook@archiver.kernel.org>; Thu, 26 Oct 2023 16:02:48 +0000 (UTC)
Received: from EUR01-HE1-obe.outbound.protection.outlook.com (EUR01-HE1-obe.outbound.protection.outlook.com [40.107.13.84])
 by mx.groups.io with SMTP id smtpd.web11.74757.1698336157726336770
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Oct 2023 09:02:39 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@vaisala.com header.s=selector1 header.b=z5Z0OBqJ;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: vaisala.com, ip: 40.107.13.84, mailfrom: niko.mauno@vaisala.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ear5TxYGKczCEP/HyxOCbldH0h+jFEQz3WDN1IxmWEIqylnRD48sDpRfMfRq+YtP8C3Uwqo4dUnr8DUTVS1rUL8fF5OZG6S1NUX3yjsUcelVK3Fv3AxSi5QKsOv3OTlIb6Z88MTM0tAqOEe9bXTnPb30GjJ/1riAkiD5NjBMTQRF+t5NIheNb94ij80BvGfoXQnY482RPdGN5nnvkhbBjuuMV26tw2bE67tfbjKikWEBIo/6t36cQpzVmOMPrOkbPH4TTRbi3BLlkvla2C7Pl/U5rqnEH4g7fkjXzUp48D3XIgpdtYHQn1Ou9YeDfaouHVGBloihiiEJ0toZgeT37Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sQ6+PMv7XRKuLQMsU/Hxi8wEvD4edZ977K4t1LMceB8=;
 b=gYiJIvrG+TSU5yEws3NI0cmG7cS+V5GsSW+DrJVNWRtICEfMZtXylubzPFLbBSVLXVG/897XJqWczbPwDs1KmDTlViPBAvqt9Zya4sKXLkQYpf2w2xjnKVDINXPwIB3AB/zRZilZqIEddDzuZbqaBetR5OkVS7Q/EmOWXFVB/D4bpPmMLhjt6jWrF1hYTGnwDlHtjfu2CzG4Ykn7CyWJ/7rMXPk8nf0WCEC3tO9BDvI3VkPK7D0xSzlfoFSFoWHauUIRNeM7BLYWQvNoVLir5E2F5KkOBU6pmO/uYXxW9IvaOxypEKXkS+ghhcQTZ1u1VdA3t9ErrguQ5XsnckU31w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sQ6+PMv7XRKuLQMsU/Hxi8wEvD4edZ977K4t1LMceB8=;
 b=z5Z0OBqJbukmh4WM28cniuY21q+v0JvLRGveYvX1+J9G/R4YeGsC99tNPbJN0cGTwUzXJY/IA9nkuPrw5WTb8t0ZNBIjleaR+GDj9JUACznB3nMWBUDFfgOnyABLKCC+MyE8XmrhwNOIQLYYZ/+FK6tEG0+eH6huPtR45zUVJ3v9MRZPR3qkOiNsqHuNqRfY1p0Ws2mCW7LdVsYU+8q0jXkCH0Qpllclg45cnyvO6UEdyNqUWvfDugJ26R6JJEX39l/jeElkptVS+eY1k8qIkW2M/NLbeRGXNsaJMopJHpenu/gpMasTW8tBFIUa95xjHA8Q8rixY1GDX5jRWj8RSg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com (2603:10a6:20b:4e2::11)
 by AM9PR06MB7218.eurprd06.prod.outlook.com (2603:10a6:20b:2cd::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.33; Thu, 26 Oct
 2023 16:02:34 +0000
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::746a:49b5:ef81:9ff9]) by AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::746a:49b5:ef81:9ff9%5]) with mapi id 15.20.6933.022; Thu, 26 Oct 2023
 16:02:34 +0000
From: niko.mauno@vaisala.com
To: openembedded-core@lists.openembedded.org
CC: Niko Mauno <niko.mauno@vaisala.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [kirkstone][PATCH] package_rpm: Allow compression mode override
Date: Thu, 26 Oct 2023 16:01:44 +0000
Message-ID: <20231026160144.1479454-1-niko.mauno@vaisala.com>
X-Mailer: git-send-email 2.39.2
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: GVYP280CA0004.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:150:fa::6) To AS4PR06MB8447.eurprd06.prod.outlook.com
 (2603:10a6:20b:4e2::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR06MB8447:EE_|AM9PR06MB7218:EE_
X-MS-Office365-Filtering-Correlation-Id: 5b9fd79f-0c1b-4a24-9529-08dbd63cf751
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	TfTYn7XZUmnL5QhtRZdm+3vpqbg1VCvKy+1Kd+1KtF+hIwX0sVPM358lJ6Ok4rWEbYb1YPlgP74WhczixemC5asVEf3CCb/f5EhxXg7F8KvUg9BD06FSZNljCXcNOchinX5KBuNQ5AY3dgZNRiD4BPFHdqKE1Ap4iS6EDp7OGxau+zOTdMWriV2rZxp01KPbJTT4g3V8j+PC2VOtcFow02w1oE4EINgMv9yQdJxsnVWoyV/Rhb3BUan6b2nf2dcK70u5Qg9+2tf/IsLkgPF5qH86GAHuuspgmGcYk6pYxlQuhC8+b7me2x7b23nbpWLit78Y8vr/HoD45KF/u+y1st+UJp08xxvrHZ6iev9jd8sc+q83twrVkVylsssAggAwyYLJjMOZa8bqQNMoow4Hdg/60wleqhlnnfPrDX01+EF4Qk7uvN8EX7ovYnhYQl8dkZQq3TM6mOmvLjeFmDN/4TmBiE/nOQUm3TMcWdaPFwOJbdoyKGvr+sv0fuCia5fKnZtir8DjBrtJxCYJK1sKJEI0Bvr65Om3uk3gt0loNUoeCtk41B58d/4VnBWVCNTalGz5jKnTtD/DKynkq82Eq+Kz2hPqk41I+VAqqOlMkX2rLpwqdE9shTuNzSR48olw
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR06MB8447.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(136003)(346002)(366004)(376002)(39860400002)(230922051799003)(186009)(64100799003)(1800799009)(451199024)(38350700005)(83380400001)(4326008)(2906002)(8676002)(52116002)(38100700002)(8936002)(26005)(2616005)(1076003)(36756003)(54906003)(6666004)(5660300002)(6916009)(6506007)(9686003)(316002)(6486002)(6512007)(66946007)(41300700001)(66476007)(86362001)(478600001)(66556008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?BJCTfKJYYL46n4Df2/gini5+gm7/rt9eMhLGBv9v1bkv7KBrHabHni/af5k0?=
 =?us-ascii?Q?rtvDt/HN8+Eu467EjfE2SL6gsbz39MwqS59z/aIWsalFttW6TKqiYoTZK3rh?=
 =?us-ascii?Q?T1Z7Tb99L8/RSQY/AQeP6UJuDSUS/rJj0VDnJxzuBmANdCmMhJlSBqDJASIH?=
 =?us-ascii?Q?agIH2t4SykcYA5wvfqdQ8/metxNc2PLdAccKcUOpvfx4GCxwcQLMfK6iN7Bg?=
 =?us-ascii?Q?WJY5fmprSTmilSdD3dAH2Wyi8K6zEmizWS/jp2uyAskXqLgCHWRSxCTVvM8R?=
 =?us-ascii?Q?Hbmq7NXjSDQjvJitzAqhOZcwYbTokDhtRMT9rKklvEbl8yXYgr0Lzn1iloRS?=
 =?us-ascii?Q?dxbdgt0iVQBB6LQ91tfQ+kDxyfVIVX1fA4yak+blQ/d3aBvvhmPlLNzU39Z+?=
 =?us-ascii?Q?M9yXHCEzkHDfVyQfNa32HrpzPASq22jm5Uk0/oCH3YXduBZTBmIz/8aLA5e9?=
 =?us-ascii?Q?WCO30Y7xx0jyPly9PQVhxq+DbpufssdRi7IsUwpU3PVsxvNAMiEVaHa/I97g?=
 =?us-ascii?Q?lrhU70h2evu3QrpdyICplMMpxsU5BgswnPP1vBxYxalAadR1rcz9gnH5xtJZ?=
 =?us-ascii?Q?WumoZGHSRgxvdgU1DwTVDdcx4aGrfxEBI/aqZi+19St+HJVkuToDe8dq6Nn6?=
 =?us-ascii?Q?2umFlVZUjoCK++kqQl08tuDtMWhW4h3cTQdra9KGaI+VzXbf5gXZcysgGTk3?=
 =?us-ascii?Q?iS4yjPbbgJofaITJoU5TsDvEhWPPZCn7fUEBOen8+a6f+zsaT2/TdKzTkn4u?=
 =?us-ascii?Q?KL/YbrXf3xzvzqJ4nXDu+IPYTpYGa5uXrfU0bapH6o0b/LkghJKuIvQECrGM?=
 =?us-ascii?Q?oSABHrmmGM8OVCuIUYbXxA1KjvLZE2kO7RgajGcme2Oqi25AJ7vfxTxIdi8z?=
 =?us-ascii?Q?Qrg+BjrUFH9twJyqGR9oHOI5vAoivymgVsan13UO7K3/nXuLPrXnfvgkIz22?=
 =?us-ascii?Q?0fKoSs92VK7DNG23h9lhKkBQRmKNhd8NloT4vWuNRLWJFC5k8957X1SgPI16?=
 =?us-ascii?Q?3EhKSUDpafSE+dV3DWdaxgKLqVTVHSnxNYmp30WaKId5ETrGepMSFPydHfBm?=
 =?us-ascii?Q?9g2jhDON01k+XLy3rZALljl8gGe5cZR6SiWP8IV/7AUQ2wQ96+YMWP9M296Z?=
 =?us-ascii?Q?3I5Lj6Xqq1AO/OYaA9CtxtNJ8fIoOcF8CarNUo2gxkvr7C4mXx3hBCS2+QlG?=
 =?us-ascii?Q?GKNfX0Aml1p30ZbZg5arSjEE0ixfCgrKzFgpOXZBJMssbjTlb6/7Jkk+5hiA?=
 =?us-ascii?Q?kfMOIj2D2sEqoDWkUbmsYKqzyhjxi1mWvSVSSvW01/ljAIdJdNADBkdSmxiX?=
 =?us-ascii?Q?eNG8mxnR4KRQHJJHozM2upPCDioY4j+JYl7UH7lKJ0fOrzSVyqmoIUq9Y+Um?=
 =?us-ascii?Q?XhnkHvq/HeRcvRTZM/zkv23UsGk35izNf10ICRCJ5LgYIqtwasD0CjELfpk+?=
 =?us-ascii?Q?CfWgSCTenMKVoZGgcZMbfr3pEyvRbHQX9h4jIksTVSZxoMPpQeWTWd9LAurD?=
 =?us-ascii?Q?kmbAM+eFZaYTwxFnnjjb4NAGFFCnbHAPjj7SxzC5Eawrr+uLBHq4lh4PkDG6?=
 =?us-ascii?Q?NmEO/qsEPwEJMo6XN13QT+ER0RnO92FAYSjsGuc+ZZG5X8YjL4xBfbQCUBiS?=
 =?us-ascii?Q?5A=3D=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b9fd79f-0c1b-4a24-9529-08dbd63cf751
X-MS-Exchange-CrossTenant-AuthSource: AS4PR06MB8447.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2023 16:02:33.9579
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oZt02fqJstFoAoVBoVUJumjvvx3RcG1r3JIJa6MnYYSZuwmAPlt3IqmqfRA6Qcx3bMDzXIqi9+vBmvCMOCWCdw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR06MB7218
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 26 Oct 2023 16:02:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189734

From: Niko Mauno <niko.mauno@vaisala.com>

Commit 4a4d5f78a6962dda5f63e9891825c80a8a87bf66 ("package_rpm: use zstd
instead of xz") changed the rpm package compressor from 'xz' to 'zstd'
which results in decompression failure with BusyBox-provided 'rpm2cpio'
applet and 'rpm' applet when given the '-i' (Install package) option:

  rpm2cpio: no gzip/bzip2/xz magic

Introduce a variable which makes it possible to use a different
compression mode, making it possible to override the default value for
example like

  RPMBUILD_COMPMODE =3D "${@'w6T%d.xzdio' % int(d.getVar('XZ_THREADS'))}"

to enable rpm decompression without including the full rpm package in
the resulting root filesystem.

(From OE-Core rev: a40d9258148e28cbee2168c93179cd4c1232fb62)

Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/package_rpm.bbclass | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/classes/package_rpm.bbclass b/meta/classes/package_rpm.bb=
class
index bbbef3793f..f403af5343 100644
--- a/meta/classes/package_rpm.bbclass
+++ b/meta/classes/package_rpm.bbclass
@@ -4,6 +4,7 @@ IMAGE_PKGTYPE ?=3D "rpm"
=20
 RPM=3D"rpm"
 RPMBUILD=3D"rpmbuild"
+RPMBUILD_COMPMODE ?=3D "${@'w19T%d.zstdio' % int(d.getVar('ZSTD_THREADS'))=
}"
=20
 PKGWRITEDIRRPM =3D "${WORKDIR}/deploy-rpms"
=20
@@ -652,6 +653,7 @@ python do_package_rpm () {
=20
     # Setup the rpmbuild arguments...
     rpmbuild =3D d.getVar('RPMBUILD')
+    rpmbuild_compmode =3D d.getVar('RPMBUILD_COMPMODE')
     targetsys =3D d.getVar('TARGET_SYS')
     targetvendor =3D d.getVar('HOST_VENDOR')
=20
@@ -678,8 +680,8 @@ python do_package_rpm () {
     cmd =3D cmd + " --define '_use_internal_dependency_generator 0'"
     cmd =3D cmd + " --define '_binaries_in_noarch_packages_terminate_build=
 0'"
     cmd =3D cmd + " --define '_build_id_links none'"
-    cmd =3D cmd + " --define '_binary_payload w19T%d.zstdio'" % int(d.getV=
ar("ZSTD_THREADS"))
-    cmd =3D cmd + " --define '_source_payload w19T%d.zstdio'" % int(d.getV=
ar("ZSTD_THREADS"))
+    cmd =3D cmd + " --define '_source_payload %s'" % rpmbuild_compmode
+    cmd =3D cmd + " --define '_binary_payload %s'" % rpmbuild_compmode
     cmd =3D cmd + " --define 'clamp_mtime_to_source_date_epoch 1'"
     cmd =3D cmd + " --define 'use_source_date_epoch_as_buildtime 1'"
     cmd =3D cmd + " --define '_buildhost reproducible'"
--=20
2.39.2


