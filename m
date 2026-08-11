Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFF47C5AC67
	for <webhook@archiver.kernel.org>; Tue, 11 Aug 2026 13:56:08 +0000 (UTC)
Received: from MRWPR03CU001.outbound.protection.outlook.com (MRWPR03CU001.outbound.protection.outlook.com [40.107.130.32])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.54564.1786456560011933770
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Aug 2026 06:56:00 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=mwkofFa4;
 spf=pass (domain: est.tech, ip: 40.107.130.32, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nEliT0h30cbMRdqd3T9tO8+Xk3OZtQ6/0DO7w+EDLehd9INOf3Ly+ANEQPApkSqhoAILT9m2AzA1YXRzvPxNw/pUektFtiHhd7uY8kLhpxApXHyXkNLtz8t+/zRDNK+tLaQpGxkbME+CKMugIFRM5Ht29VV02FXNrh2ry/IYdgtKOHRKih3kNN+Na6uzkSgU6SMtMWF6os93a9ISTNOkkyHufpeyz+uTYIH2DKXdiTsg7sA7FrrImVW1xLpIC+roC9dI4BVCDorOLimNbTUFfKjAkO8v41JeGTl/9Pncv3uURsp+JkNOumz044uD4uVVg0QGWaW+cyg6FaynsHm4UQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gDFLzHVizma47UXIgaZubbpjsUDzyixz1f2QVM1Uwsc=;
 b=dI9XaHvHEb8pk1MArJ7UO1NS7H3u7OsBWuPk1osYmBqr1kc12KeUEwZnkbIFoxKtzrRvpxDyskd/GUC96W4o2Bx44LkxR+aB/G7770EoGZsw9Dmvc9pasmsnQMwL6nl2cLdexYGODfA7CL/ynb/GRuVwF8ON1/fSvb9BXW1U3joZNCZMRyiDKHOZPwiFRT0e0wd1tvNuQPHulZD7mGbyVrXE5AXtPq3HVlCftEsWif7Ux7gzU5jpAmnZlAKaLP503FP39lB3KDauqMq25IWO9XYJjCTGrInhSmC4obDv4GOxWCbU5yMfpcPRhlvIlWKxHsWjbuk4px6bP1PGpmmdXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gDFLzHVizma47UXIgaZubbpjsUDzyixz1f2QVM1Uwsc=;
 b=mwkofFa4XRJadwY5E0hq9xm490cnt+omzy6kiJop3HSIVee/sY5EFL0SQzw0psnU/rJnE2eextBIRw5okE6tqRB1Q+C51/uA7dRxyZeVuLkPoH8X1rTmx03RO140HG2SmGT4p+93nE9FkKFZUaTEWmz5VJALKrnvjUke3XSifaAkqDWcZ4wzMQV47YDhIGOYjP5EsPKyFpv3Fi2QLSFgKeG+/vpkbwDEWr7HAs9PysTmuBbE1t1IwZ+KVwmpko+xumUV2VXn5OG+QpAQSYxxDwUDKvNM7Uz2u0+EpHd0lHFdj0zavj11bFLL05XvjmhXkdJVGTdZizjoOHva9RrMCQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM (2603:10a6:18:3::ad4)
 by DB9P189MB3526.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:5f6::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.12; Tue, 11 Aug
 2026 13:55:54 +0000
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85]) by DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85%7]) with mapi id 15.21.0315.008; Tue, 11 Aug 2026
 13:55:54 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
CC: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
Subject: [PATCH v4 0/4] swig: upgrade 4.4.1 -> 4.5.0
Date: Tue, 11 Aug 2026 15:51:56 +0200
Message-ID: <20260811135200.18942-1-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260810154520.12466-1-jaipaul.cheernam@est.tech>
References: <20260810154520.12466-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0526.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:2c5::12) To DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:18:3::ad4)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU7PPF66507B2D7:EE_|DB9P189MB3526:EE_
X-MS-Office365-Filtering-Correlation-Id: f8131008-4bfc-40e0-913c-08def7b0432c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|366016|23010399003|22082099003|18002099003|11063799006|6133799003|56012099006|10067099003;
X-Microsoft-Antispam-Message-Info: 
	yN6uRAfQQTlKmrvaCtT13gaCKeMxKkZ4Fmdl2Ikx+Nu7TsdLMYPP2NHYK2U92tJotM3Hu4JIN0siNL2gORGm3dXrL6I2LH6rclohH2ET3hUxdwb6MQtCsumcQmdGUn2aVr1oPWCD5r8viLnLycVS1PKsiuai8k6w1sNhHgNeysceyn/wXNYrTIAKxDHy3yL6DWIf/32aw4mt9K5oU/brJe2llQpdtXti4pFTwn8grW+/X/rzoLN16ebB6KW8ryfr4dE+izkW8fxTxkhcultQ/iEcuO896rs5Q7tfBSqXOw8Yq64zuVSh16e+fwqGxfNxEFDqu52IEbgei4ngq2HK+IJ4JvL8qtIDRsGmI/lIg3E9Vc4J0fj62BkJOS4X1cifnsHWDMVS6Up7KLUaE0WkELKaurDG6GpBOpipXKI6UWQvYiuHaPW6gyltS04DUahDVlwiuoPSr53//cx1iC5W3mCFN6XaqBM/3JysZSsEtITyZxsaHLLdYl4QIAWQC5YPcYgQ+vIdyDzZ20zvAAVxUK14I9T8+4FHmTNH4Qa+poji32jJCE6BoMKNLea7Or7F0Hq0L5xY5mSDgiWarYwgPKlvX+SHs0FIWtId9sYC1pFVjbBoCq/+UizGG03LOYTVoWpO3vevYVs2ce07zuRJTu8GsgB/DZtb8XbSfeB/+GQ=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(23010399003)(22082099003)(18002099003)(11063799006)(6133799003)(56012099006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?LXScITdLZDHdibCEvkgsyx2RsLB3dI+70lsEFvbmgKorkK5gAzIXyG+PIRwd?=
 =?us-ascii?Q?ZNTEz8vIMXYGalVVee4210vHlc7W/+3GJdAxxOmGhr6TP30AaZ+YxAGQz4yV?=
 =?us-ascii?Q?CGUDrQ7/cO9LagePPXOYlSZ8Op/b8b0BG7+GQeQT670woSKrYmqFnei8/zH8?=
 =?us-ascii?Q?+zPVERI+FwbU42LAfzzlUkopjjnhfSOWgqH+MO9iFt1mGKSnpoIK7oXlATOW?=
 =?us-ascii?Q?uIYZqi5Mf1LnaKDtDhIKYSZvrml+/mGUvGy7M6CP5NLA0MOG7VZuWfSbq8ux?=
 =?us-ascii?Q?Va12Dde5eoUu3W2tLB7m018TckdBcaEVtkcubGmjvOxlO5rztkaPqk4g2AK/?=
 =?us-ascii?Q?5jIcBEaWRE3n/tmOZFTq0l3CmWzy41HfN72kDv2rRMHyyRVO+A3sQ5MhA8ne?=
 =?us-ascii?Q?P0tJA93etTtf83yiieqKaWqEXT8WgKwnUQjoGrChj3T3071ogWe+kKrt1z7p?=
 =?us-ascii?Q?oNHYVd2PYrM7DvvfzUdxWVber2IPWqE+3A3lccPYbWXtlZlSSI2e1fMk4BeM?=
 =?us-ascii?Q?7VsqoNOnTnZW5UbTTq2fyjvnKMOkTpcOhP5QFm5QjJa8MSBh2NRsUlsdzs7v?=
 =?us-ascii?Q?yZ9JEh2ggYujtIjEEKmtWByF5NEAWFik+gC8be21pZaT4SU1Pb3KVLsixkqV?=
 =?us-ascii?Q?hiej1+G7v509NE92RYCpUlCtblU/TgHjc0WNmHEpDToiwDLFd3e33ZR17awF?=
 =?us-ascii?Q?BOyRxI7Qd+rmUuMv84kWiY8W8RDBDu++kBNIQf69sTxsAe0yYI8rlIsti9pb?=
 =?us-ascii?Q?cDbZBplCevYp3d89jQO6sKcxvfhEBT37GjD9fang8t4dxOi15yec2MCCbxj7?=
 =?us-ascii?Q?w51YUlsDhXx1x6wWKMUq4Mbb9dG3hJCbxhEPp4lOSPyAQAdcv9FdBGjvo6ra?=
 =?us-ascii?Q?wKxp/VDcY+hdHs6WSywJBpxkLhCQFj5mXv+bTvpNq/Ot9tZRRBiJZ4cC+1/t?=
 =?us-ascii?Q?2nC4BUJhvunZBh5x4Wq7tYxhG6S9shk4aFK9rrKpQQfb9MKO7d5VaY5QGh6b?=
 =?us-ascii?Q?FGqJpHLL3awz63Rb1nTk3VdTd0ECQQiDf7g/Ovz22+r1qTmMaS29+o5AjZLq?=
 =?us-ascii?Q?Yo2ouEK/JsJbPCTSYUjpupJp0oz4m4MHY/sUf1e4hEQAqPH2LYIh7sHqo4Ws?=
 =?us-ascii?Q?TokvYbIpa+0E2YQr0SB2AQVSf40H4idTF/pu3rSRLh39r8sBQlgRm+oQUqxX?=
 =?us-ascii?Q?mTGqaFUE6jbFtQQamQdwiT/w9C7PwujITYMTkE/UJI0BdcvuPbxsELkooGwT?=
 =?us-ascii?Q?ghoKAKQVhjhPaHtgTlCLuNwa4hMzNyo9B93huQUy/yOuUGfECt41RkL8mRe3?=
 =?us-ascii?Q?wvBq+hcw4x8MGNgyUK4s28T+pQUJ91QQEPcZbiQleFMNvGuf6SRmy18qmAcr?=
 =?us-ascii?Q?vKTNL1kQKFAn8ywU9Bck9hca9FPeYYGY6qZMBlHPp5lX3zRcMLHz1qtHtP2H?=
 =?us-ascii?Q?5iWY3NIPF+H1jzla5NuFfoUVS8yk7tDrxHS/XgP4Nx2LJWAJlcyXR8svlYYi?=
 =?us-ascii?Q?0FGbvytZkrQMbbGd8wRLIKGsIo0N2dwlyBu3snULguLWNb+kVAVfjootsslm?=
 =?us-ascii?Q?FHkPkS2hyvMQ4NhbE0ymtad3dtM6ZdGzEVbMuIDtRZNFAfy5QeeC+s6FUu9P?=
 =?us-ascii?Q?ifw4BPlapZ4APFPnGz6zYuRebuidwXhhQCbEn2xpxsn+gX/eE1efCD6K1pbQ?=
 =?us-ascii?Q?IDjCJofgqdvJj3O1gDxp5CcoDua1iaqgpjCl0JHGY45XOOf6/1ALfbvTt++S?=
 =?us-ascii?Q?64s/ZTawEC6ER1lhKbt/HQvqdBnDrBI=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: f8131008-4bfc-40e0-913c-08def7b0432c
X-MS-Exchange-CrossTenant-AuthSource: DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2026 13:55:54.7714
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Knt17kA6h0HcMFKBig+xSxFr5WKdbmHYSFxQsu/rhNVfzic+1s0/eeF04DNO0Tde7A9be0fHk58+qB8oVz7g4P0C/TSdj2PdQRbtzGHWor8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9P189MB3526
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Aug 2026 13:56:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243200

Upgrade swig to 4.5.0 and fix build breakage in recipes that used
Python 2 C API macros removed in swig 4.5.0.

Note: The following recipes in meta-openembedded may also be affected
if python/swig bindings are enabled:
- gensio (meta-oe): fix available upstream [1]
- unbound (meta-networking): fix available upstream [2]
- ldns (meta-oe): fix pending upstream [3]

[1] https://github.com/cminyard/gensio/commit/e024df7fc3d21896bd9d2e26964a0=
b59b7c2a91b
[2] https://github.com/NLnetLabs/unbound/commit/93a56205cfa6b9a6d34db7245aa=
71e5ca67d1fd7
[3] https://github.com/NLnetLabs/ldns/issues/314

Changes in v4:
- Fixed u-boot-tools patch path (libfdt.i_shipped, not libfdt.i)
- Submitted fix to u-boot upstream [4]

[4] https://patchwork.ozlabs.org/patch/2283713/

Changes in v3:
- Added u-boot-tools and python3-dtc patches to fix pylibfdt build

Changes in v2:
- Added babeltrace2 patch to fix SWIG 4.5.0 compatibility

Jaipaul Cheernam (4):
  swig: upgrade 4.4.1 -> 4.5.0
  babeltrace2: fix build with swig 4.5.0
  u-boot-tools: fix pylibfdt build with swig 4.5.0
  python3-dtc: fix build with swig 4.5.0

 ...-removed-SWIG-Python-2-compatibility.patch | 55 +++++++++++++++
 .../u-boot/u-boot-tools_2026.07.bb            |  4 +-
 ...-removed-SWIG-Python-2-compatibility.patch | 57 +++++++++++++++
 .../python/python3-dtc_1.8.1.bb               |  1 +
 .../swig/swig/determinism.patch               | 20 +++---
 .../swig/{swig_4.4.1.bb =3D> swig_4.5.0.bb}     |  4 +-
 ...Python-2-C-API-macros-for-SWIG-4.5.0.patch | 70 +++++++++++++++++++
 .../recipes-kernel/lttng/babeltrace2_2.1.2.bb |  1 +
 8 files changed, 199 insertions(+), 13 deletions(-)
 create mode 100644 meta/recipes-bsp/u-boot/files/0001-pylibfdt-Replace-rem=
oved-SWIG-Python-2-compatibility.patch
 create mode 100644 meta/recipes-devtools/python/python3-dtc/0001-pylibfdt-=
Replace-removed-SWIG-Python-2-compatibility.patch
 rename meta/recipes-devtools/swig/{swig_4.4.1.bb =3D> swig_4.5.0.bb} (92%)
 create mode 100644 meta/recipes-kernel/lttng/babeltrace2/0001-bt2-replace-=
removed-Python-2-C-API-macros-for-SWIG-4.5.0.patch


