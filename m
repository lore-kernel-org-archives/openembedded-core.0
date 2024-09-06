Return-Path: <niko.mauno@vaisala.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2736AE6FE2F
	for <webhook@archiver.kernel.org>; Fri,  6 Sep 2024 15:17:46 +0000 (UTC)
Received: from EUR02-AM0-obe.outbound.protection.outlook.com (EUR02-AM0-obe.outbound.protection.outlook.com [40.107.247.90])
 by mx.groups.io with SMTP id smtpd.web11.1424.1725635856935465437
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Sep 2024 08:17:37 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@vaisala.com header.s=selector1 header.b=AF4zWf02;
 spf=permerror, err=parse error for token &{10 18 spf3.vaisala.com}: parse error for token &{10 18 _spf-dc57.sapsf.eu}: limit exceeded (domain: vaisala.com, ip: 40.107.247.90, mailfrom: niko.mauno@vaisala.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UCiTlYmhMwlfrG2LEKNXoMuDdq5UR3LKSeVnPZJIr7rWuo17yT/7CmtMe1ZLgZfRqIEBFwtuJD8VtVoMLo4GSVlNTx91nXaNAK0vTULV0ksfyg9jxNuteL2pI7o1rUCTZ25g6h5SdOb7V87a6SLXgsrqBmtSTwmoBw/bFi+mdN0cso0nEIsFWQd1kBezyeVo3rEyNnbqR0ivjMDp6fg2RUnXhAd20FAf/xGvQuqTZiYOtVH/BmYBErWIibcTpDt9rc5vEiI/FgZegn8lLzAnlcmac6PpgVSVrAEurIb1LKwbtvnyP6BSsfHDgr82fCtadaA7mHTYWifhuh7TDY7L6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2D7dvq0ysehPJWtHSEfMOtpymhyhRdQGmvlG4Cu8yMk=;
 b=N85yrIx+yVm9ZrbogaXM3CGpRK6WkFZumU4ldsuDnOkiUYcu2kn0D+MfqnN49NbJ43oze+N/lx6wui+zVsZf89DtFHAS/hpTHBK1GQFYmIBn6s4EfaGZXzrSnF1CT7UB1DLfdcaGMEaHS6CHT/ECsnPdLKmsyHsBFA+CTKQDzoPLHZfnPqFbljPVm1of2Z9SqQN7DPuk4WX8tMmNEfRe/bufJCsQTjPAibA9DgvhFBZmQWa/gYjmYfmRHXmQiKx6wNDK7FThX2QxpKQyRkxqSTEl3c2uPoz16Zf8Z8xHFq5lWaZbR3e1G0wunHK51Dk6/BB24lTZMYmOCwPqKUMIQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2D7dvq0ysehPJWtHSEfMOtpymhyhRdQGmvlG4Cu8yMk=;
 b=AF4zWf026w5Ws0qcJzxUzMMVs1r8iA3PoKh4vC9HwHsivrwDNDpWDmrmBhWptX/DIzE/QNF4zNhi9QbghGHN7Txlb0YNTbFH39jjTLfdSzsLBWTmDexq163qiQBvOmRkiyGN8x+mYA7vZCN6Q0zFWDCSs9HTmWiF5sJppmTvrQobXiGGSdSWpuQvKrx7JAAXMjow3qd33GGUufwZe022hL3pk8p7Tred7m9zVw+tkzzKCZpSJWe3koVtzTEc6TPm1AEZtBH/vj86n0pdHVkp8SIB/o7TF5kIlts0b37cwWZLnweDBGKwYCkQDEeo6AppAZ3QbWkYQ/VnpAamCx1Gqg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com (2603:10a6:20b:4e2::11)
 by VI1PR06MB8950.eurprd06.prod.outlook.com (2603:10a6:800:1d1::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.17; Fri, 6 Sep
 2024 15:17:32 +0000
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc]) by AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc%5]) with mapi id 15.20.7939.017; Fri, 6 Sep 2024
 15:17:31 +0000
From: Niko Mauno <niko.mauno@vaisala.com>
To: openembedded-core@lists.openembedded.org
CC: steve@sakoman.com,
	Niko Mauno <niko.mauno@vaisala.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [kirkstone][PATCH 3/6] unzip: Fix LICENSE
Date: Fri,  6 Sep 2024 15:16:59 +0000
Message-ID: <20240906151702.3006933-3-niko.mauno@vaisala.com>
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
X-MS-Office365-Filtering-Correlation-Id: f4153f6e-4ce4-4ea7-fc1f-08dcce87070b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|1800799024|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?YQRSDlHMywaY5vLkWkVvMk7iuKwyuT4SWknycZ5jdFhXFYYZqhLoOsBYRkyN?=
 =?us-ascii?Q?1N24SCTR/He7RSawz1z14VJALVjrNqZGtFehLkBAHPImaGMWe4O7/aX8Kw7D?=
 =?us-ascii?Q?YamwR7zGLq2+1iqLd+bvKSbMvEWn2RtA+VtXcxTN9GHiw/7KwahFP0EsZLhh?=
 =?us-ascii?Q?vewkC6Ykh/QB6f5+vePAQQreS9dnMfW2CKyPv12hkvpGhF9tZpktcAgovdHL?=
 =?us-ascii?Q?i6eUvQKWNBbvI9RNmhAH0K5M9FuV6eazCaCCKTarIrBNvD8rcs3AA6fmQ4d+?=
 =?us-ascii?Q?rzeCVTWKCwnmYPPrzRX8osbK67wPlY5XvNN7jEQGrfHfPybsF9GgMMrNI9fb?=
 =?us-ascii?Q?4wYkM1IiR5ac6YDqBYFILUM7awYzb1PgCWh9TJ8Se47D3JMS+uVRd5Np2hcj?=
 =?us-ascii?Q?n2G+fuXibRo66/1I04C/rFSfoVUXEqm1z+u01G4lnLBg8RrkZcM9sXbgvpG8?=
 =?us-ascii?Q?5NxIiUNWX9nYEpNOlibyyN10P9kpmuabPy5z+MsTGgnwuYDLxyruirtw/tO8?=
 =?us-ascii?Q?fH0JoVXtThZgnrudNTiRl7Mcb7xXZoh7FMIDmG6mYt+Vq/1DTmnhXt8L5PWn?=
 =?us-ascii?Q?E8+LlOZrF1aFHz9PQAVr80sBOVMXwAckyQTpeA6NxpuauyHjW+1Vyat3/KwE?=
 =?us-ascii?Q?hZDhkCF7TW3mkCaW0N8UKjagbTjPmrrapRJwO+s6+x2rZF7tAjMZ5/qhk18w?=
 =?us-ascii?Q?vCTwmfqGxAOjIiOTtq0Ca+74V53+c12egqcgqHKEThZzBmuw74riPsXyqW4K?=
 =?us-ascii?Q?HUwv3KmfW2sKoSHmFRQ5sRqyoe1Kl6KoJoDF6PeDvFa8tBOQAt4SQo9AdoYN?=
 =?us-ascii?Q?JXX2h+QNHAF/yCLZTUSl3jufRgFSPtPmGudALxHaPMs7wP2ZwtlpxI/Y1XrV?=
 =?us-ascii?Q?eHZVsj2p6GlfqHRnN6eQWfITPNXh0394u5PEG3+btCTQaHVAapMTInNbfYL9?=
 =?us-ascii?Q?3pm9NpUhzkw76ZcbDtn7KEGpSNJd4RNg6taHnnzO9HS6hYqy1OBbVLN+ZMSu?=
 =?us-ascii?Q?50+qK9mNaQvQ3xC5U/x9PYCcyU06jkTFhQpiPVWgb2lelcIquTDZ8VZgK9C5?=
 =?us-ascii?Q?jtCzAcUxYT2rG0mHTnowLc7JW8xZiDKve0JQp6D9JOi+no0ty4Np2enu2jV7?=
 =?us-ascii?Q?PX60TPe7y+bxZ7YJ+IcrATZXEeUC6X+AMzKOM2e0IoemF457S/oGq3H8vQmL?=
 =?us-ascii?Q?JAlAqxMF3CjY32pRX/I58qblJQZMlVtigCz8y/D5bqAdirufEQKTKXjHe0re?=
 =?us-ascii?Q?sT/bAEwR4hzdCy+P4VDkJgc6TmbE4xmA3DsokG11Egu+0eZ21XW3DK6L8R+z?=
 =?us-ascii?Q?G60MtZ/z5VQCoeTHV+VONAXr3SpfsU5T/cV3iG3/iyFCmHlAb1cT9u7VqyEi?=
 =?us-ascii?Q?cHeSwM4=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR06MB8447.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(1800799024)(376014)(366016)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?FhiMvirnOOuTq6LV/9eIMTYXxsFPB/PZa3ZbpWy7nj6fnfa00Rq31US3ysXz?=
 =?us-ascii?Q?KpuRyaHXkUu0iXVhq8HWYa9pEk0GWXWH4+8U9lHqMg0AUqSs62eEwhpvXY6t?=
 =?us-ascii?Q?4/XT6iyJf2zESP1DXBU3UAIkrhIFB48YUMx0b3ZFeBkFOVlHSWA6ouMzYEwm?=
 =?us-ascii?Q?MQpkIVNop5QnK+6TAN66lgATUKG34CjkZ/yxiTjKBVx1M4Uvl1KN0pdXHS8A?=
 =?us-ascii?Q?Z6RVJbwILcxpU4moEktHwH0eGGrTJJwVePmfIKX2t8pwoEzo58faZupyOb8l?=
 =?us-ascii?Q?GLVwcQRBFRzhJtm9jHJxIZ+ZViuwVG69N8rl+Np2RCQpVWyu9v+c+QVD8h+O?=
 =?us-ascii?Q?jH1IA1WR4Xc2TFZ4YO+kukvVZmC8X6q1OJGkdSWc+zSQrHeYltU5eh5rgQR8?=
 =?us-ascii?Q?6Abvtv7Bdb+bgGWF0YuHUwZWdksCf5YnCjpNmsKTlK96YxF61tJkJpgZemCX?=
 =?us-ascii?Q?zK0naeI6EPwDG1u+0TWrsvGeMsgNgGY6/QhnQPzbBppBXXD3LOxc1+h4HcI4?=
 =?us-ascii?Q?5hnUrAZhvjvO/BEMUhaSUTOcWU2RgpSl/UUP2VtOMvM5oMD3S8bOawQNPPDw?=
 =?us-ascii?Q?zcEcwBUWXR1l6Idc/Hd1M/YXGETP/IEhQETJ6eEwgNgnkrjm5yZGkd9vGGjt?=
 =?us-ascii?Q?kgccQApExzwmqT3zYb+BDE8PCVpeaE1k070WpHRqxKbhtSQl1p7OohY0JW8q?=
 =?us-ascii?Q?QEMSrV0A61O39VAH3BZKft6XoCB6qG26A94LjwTYSL8CZxxrjApvzmAIVAqV?=
 =?us-ascii?Q?FB6ZL8S1INRbmeThW8J3ZE8m7Sf3dtqwFveLGe8tOUMtYWQ5VUnto9E5QVj0?=
 =?us-ascii?Q?/oShrQ0vr9TuTM+e8xmpq8I4FF2iny0Jp2Qj90TuWoHpWRMwUu8befWzxviE?=
 =?us-ascii?Q?OKO/ISnnSz35g9kMqr4MF4dGHaKz+KpxxrMA2zTSX27YMflV/64EXP5OCOc5?=
 =?us-ascii?Q?jsihCwt2IMQmyM6lzken8AvI6kR8k50+hl1ZJ92HtTY9rsL72CH0AyDVPW3V?=
 =?us-ascii?Q?O2VvHD0jDfC3Zk655Yzf4YC1Jc3aBg7VqE2swWyjH1zVw797+G0OO6HK526k?=
 =?us-ascii?Q?X4x6p3067HqwNqVvrxD8l9BTLd4yK4Im1c8rUSHDjJ/JqKnBFq/wQu4Tq9IB?=
 =?us-ascii?Q?ZEtI8XHqLUt42t7zhloMb+EBGvy/V9kILyJ4YeT8gqI4abNPHEzz9d08b1sg?=
 =?us-ascii?Q?XCvoUq3O9KEyvlgAx1WlFV1z0QwI2CSLbVtwOl6IJw8MsbnpA5ttdgXCN5Cq?=
 =?us-ascii?Q?DRBwyjRr0XQFm1Ogtk0E0xeNKCNn5Dz2CbG1cKko5eeiIitAlgZ/UJm//mlV?=
 =?us-ascii?Q?aGQO64YgoONKM62UmlE42YBw5mc/ZCncnXMVge5LsxsyMklSMaK5uc47dX2E?=
 =?us-ascii?Q?qLq6lrvSVmaak0qLGXOmmp0dFkmyT5zcFAPHucjxYkS8IXkj5cb/KumFIwiZ?=
 =?us-ascii?Q?i3IDVNDqgtg6JVAHUUXM5cZHpcCsdlDLGstwGozSLVsOiwriKWnUUBlT2jmJ?=
 =?us-ascii?Q?BpVxFooDz4LcQUXf2RJr0gPihhLCvg2LeZu+Syj0jfemH0s11WMZlA+LrfZ6?=
 =?us-ascii?Q?XFJhxhpg5niBx/M89grzfp9vEgnY0k5McunS8zVIKCJ652Pdj9oby8okLIoH?=
 =?us-ascii?Q?ng=3D=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f4153f6e-4ce4-4ea7-fc1f-08dcce87070b
X-MS-Exchange-CrossTenant-AuthSource: AS4PR06MB8447.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2024 15:17:31.5252
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TYLXJHXJ4P4Ra3MaBHN21yfABn9RtsqusrJ6aAtbde+Vw98gNHtYXgh48ql4jFYEpk/y09Oc+Be9TmzvhFr/6Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR06MB8950
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 06 Sep 2024 15:17:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204272

The contents of the LICENSE file included in the current source code
package match those of Info-ZIP license, which seems to originate from
the year 2009:

  This is version 2009-Jan-02 of the Info-ZIP license.

(From OE-Core rev: e7c9368e56a6ad90b4ffbba1b765e2b3a331c796)

Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-extended/unzip/unzip_6.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/unzip/unzip_6.0.bb b/meta/recipes-extend=
ed/unzip/unzip_6.0.bb
index e3fffa30ab..cf532c09d6 100644
--- a/meta/recipes-extended/unzip/unzip_6.0.bb
+++ b/meta/recipes-extended/unzip/unzip_6.0.bb
@@ -2,7 +2,7 @@ SUMMARY =3D "Utilities for extracting and viewing files in =
.zip archives"
 HOMEPAGE =3D "http://www.info-zip.org"
 DESCRIPTION =3D "Info-ZIP's purpose is to provide free, portable, high-qua=
lity versions of the Zip and UnZip compressor-archiver utilities that are c=
ompatible with the DOS-based PKZIP by PKWARE, Inc."
 SECTION =3D "console/utils"
-LICENSE =3D "BSD-3-Clause"
+LICENSE =3D "Info-ZIP"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D94caec5a51ef55ef711ee4e8b1c69e2=
9"
 PE =3D "1"
 PR =3D "r5"
--=20
2.39.2


