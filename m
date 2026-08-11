Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74C94C5CFCF
	for <webhook@archiver.kernel.org>; Tue, 11 Aug 2026 11:11:37 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.31])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.52146.1786446691655539095
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Aug 2026 04:11:32 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=w8JQWxg2;
 spf=pass (domain: est.tech, ip: 40.107.162.31, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=i4aaFo/GSXfBpoS+5e3cTzHu8ueQANgBl8e0MHnMAShiwDrkDIw5Z1IcO7UbNdiZRkNeGa9WA55XtpCsLaBmUr3Wd6xXTCwfpZczALe7mY55XB40g1RTLqusrp5DmmEJmxSr7qnHxu+pKmdtjH2i6I5AspndHShAbUZsg3ufBCdkOcjUhmPqTsFcCkMFnxFRvM/0KEZjPqJmi9J8dedSQ87Bt35BSTipIjByMx2FXnyMiApPZHZyNAwRvPp/3Owi04JTTlSawCSOnfuidx5+UriBjozlFFZ2oiu2L/PX72x2VHwMuqqreqxllpXwI5fqG9ahKCkIcXgcUNi4xqZ49Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gOopr6Ubdi1T2SytUmRHehywLMMbz7+Xa27VomVESdA=;
 b=fF9EX6i7FC2Zww4CeCtg+gow2ew/2o49Sl+54dWADXObYGNbbHmo4qNcj+ymWeNRRl77JJBB4yH2iN2QDxuA1WpMTtQ1zv+laVis7luVVFWXFoNTABwQAT+64oomTOzLdbnxonxDNgI4Euq5/TLQxZTRWs4PkoRG3szmcP5jDQTu9Y7u/ruehc/Sby62uvclAGQxSOUIxcGL85BrmBmmF6m77QPpzQg+zUbimhaPCl8wUKjSDaormW1PjjnaPoBImmZG1XNNoFUcZDCDnCntRkAL6QYTWIl6fy3+E7tkME/Oh/cT5g25NIF/sUK0NoxvbxrYjeJlFqod8aAS5ZszOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gOopr6Ubdi1T2SytUmRHehywLMMbz7+Xa27VomVESdA=;
 b=w8JQWxg2PbnVk/G1BpZt2z8zPOMjoKxJ7EQ5XzIfKJwFzjzk4Cenehvb2Ho4/YqnnXhu6URl+2Wxu8JEcAQLagkhqpK8qd2D7cW5WO25g3jn2K6BhNoPACMsuWtgm6D9fm0pg0MkLfG8MlJJiaOssePaCIMKighhr47b8rldRb7sv99y3/7pmk2J82OMAlu6OT/Emu45jUl4LV91Cso7AyOdD/oACuxnQco49ueYWymNAt4z96zf5ou4vEdq1YekmmuqpZGK9rr4zFuywjr9pHkpIICGbnAMbvc2xA64ceGQmQ6jDENdjzL/Ta54i6XLpOUN4uevHe1njir9iWTebQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM (2603:10a6:18:3::ad4)
 by AMBP189MB3247.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6a5::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.12; Tue, 11 Aug
 2026 11:11:27 +0000
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85]) by DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85%7]) with mapi id 15.21.0315.008; Tue, 11 Aug 2026
 11:11:26 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
CC: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
Subject: [PATCH v3 0/4] swig: upgrade 4.4.1 -> 4.5.0
Date: Tue, 11 Aug 2026 13:11:16 +0200
Message-ID: <20260811111120.17612-1-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260810154520.12466-1-jaipaul.cheernam@est.tech>
References: <20260810154520.12466-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: DB9PR01CA0009.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:1d8::14) To DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:18:3::ad4)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU7PPF66507B2D7:EE_|AMBP189MB3247:EE_
X-MS-Office365-Filtering-Correlation-Id: 0cf99854-c86b-48b5-2100-08def7994961
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|376014|1800799024|366016|56012099006|11063799006|10067099003|6133799003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	i90m8jxEi2Z8NHgvpNc1pFE3r186CGtP99S1eT4oipDC/p8KfmGj8QqZuuMINmyM5cxGFG6guC700Fmdo0TWB1IMa0cTxAYdVy3zl0BPb/MwfxCED87iNixUSB09mv8KILVqAdkQAOMXgitsMm9aQpNCFDW6rGmh/TOH0JIB4wMJxcVzROD+F1jhJGBK/H8csPYReBQbFCRIKcgTirS5Z3oj3xutrlqEL+4g8Jvq9O3N/uP9LX5A5xBsifvorv/jmyzoFQJ9nd9pijzWk8i/xCl8il927IqBXaH1zMkH4gk4oj6kNKTvO8DZodGCNp+T1iY//EpQeRFk3tP1LtGy4hQgx4/124oWtMOVZaDzYmcC28EQJqyqVKhA0FhDmBEAS6kDLCDPcHQFs0rl4FvRPuVnsAIQXm2Rxs9kjeHoW5qW/ALVMkuzEYxxeOBOMa++PUsOuUROpOsfFNfhfcaQxW6GzB1maRulqDZU7UjDkOheABSDUoX3C/jkztMYKtIC8K3WLd6hO9qQFAUNTsQh7jIWv1PXTU/7tNMvHFX4zY4wqlVaaM3DHuoWB9jM+6LjLYjEgpu1pTUC2T+ku9bPmbEfLYfqRPu+tI1Kow/DxBbT+O7R3xXYBtNhDOqQV28aVCHXnWwU5HwqeVSrKllpuI02744SDgW3H9H2JPoHd0Y=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(56012099006)(11063799006)(10067099003)(6133799003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?yfa4CbUW228jGaq/TOz0IuMVEM/N11bz7dt5TH4yILv9aH7hF8ha211wJra0?=
 =?us-ascii?Q?XthtSobj8R2aZRL8eM83Xk9McF1BRa8QYpfFYWpk0KSEDrDW/bUWOZfieGFU?=
 =?us-ascii?Q?MutBeo+wi6kswR2gPZr9LnZxtpO4uN9jHcYhjmFHucVPi3qNEdmaJl55WjX1?=
 =?us-ascii?Q?bjCRbPTQfam6EFC4kTC9B9AIsZF8t1mz4hXsD41i7kZJQ7ZMQvZQvyE5es6t?=
 =?us-ascii?Q?UwxsyYPQDjaMxfj8PvMyRXYEraTaLW7vqNzF4mw60FQVJ2C3V+5MLKhZfgeZ?=
 =?us-ascii?Q?tnLv8EiNNR3yfd3suDakZla7gyTZlIz8dQdEB7ZnRvwvzq4HxEw/+QecPTuz?=
 =?us-ascii?Q?It52SSgnQ5RVM51hs7DFutg69hBb/8s1KwTtzFvgQneGlLcBjAtGLzDaiySB?=
 =?us-ascii?Q?SNX7XZL53CT4267xF3NdiDVGd7baRJRrke1d69j3HXNYezJ+OATwu0BHa1MJ?=
 =?us-ascii?Q?7fiQRAmsLMF8xq7I1o6qYwsvJmIHhchdMDJHfTd2jnkpOTY4+fZHBk8V2p1+?=
 =?us-ascii?Q?la6fFAGC/nzcMn2qRemRP2t2rZos9sKMbNHmxpCFQHBA/qJyYwCc1Eg7ZjHL?=
 =?us-ascii?Q?p0m6xVSUyxRPfE3EH5mToaoWvxS5/xlQTZfhf13EoGunUVHsc7R5Kr8zZw1E?=
 =?us-ascii?Q?+N9O6tS4u+04dkds3tKKJsqtEzMXbKviz+Twng0OsYCE73eZsE/SP19Kx3Pw?=
 =?us-ascii?Q?9AiMkT+0Kl1UP5yjM3KAKIFGYeaKBWmTpAtSlmYzm9JQU6DjbrG/zAczSvtC?=
 =?us-ascii?Q?va2Gsdo8BK+iWC6LExJcmgmVG7OITmgLM5tTZIF8s8VE2q2luO+dw1T7kjGK?=
 =?us-ascii?Q?GyiLh24GMiSHN9AYmzSLnBFa4PJ5Qesj1cN9vjTKvOJSnYktJTqk9CIoUEYT?=
 =?us-ascii?Q?lyaum0GcD9hu4X6YBJ9ysMfjkvIwGrwwUUGzlXq/D6beqY5CD8ZsHos/hADN?=
 =?us-ascii?Q?U8oVoEziAfqvxdQiUtVqow20PYY4hSt5wFxKvChMJ+io9TmZm43J+VG2eR3I?=
 =?us-ascii?Q?GkXQZM6eEx3/G+9nh1pwiThHg1asU1O7IwaiegCDNGUnT2oYEBYVuNhYhlUF?=
 =?us-ascii?Q?fYMdhHG+4EGar+FUUe2Za4OqTGxd1JT5wRtB2Igr5TDqkceoYLpDBGI4ylku?=
 =?us-ascii?Q?vFWkGzkBTuHjl4O6dfyuPAILndcYLVY4P3vAI+5IJMRNdtjHdl0DoxjeVlIq?=
 =?us-ascii?Q?OjhUuSeMqA7i2Ady36hf9ZJTw97VSdu0/bHdetewfmKX9fgq7lFnmrFNqYE5?=
 =?us-ascii?Q?qKKzAFtztIRefKJqzV01qDRvq20diIaWt74DX/k2wYrCTG7bDlzQIZGs6/ul?=
 =?us-ascii?Q?k1P08KJrMlWBgkSnQVr2VKKwGNZIezJeaqsNPqG3CZikMowsHNDj8XLEoK8G?=
 =?us-ascii?Q?uAkuNCrpIBWivFTD1eqZtFHUWxjYCsROVkaN6ak/xntUYC8uuinVviSlK6Xo?=
 =?us-ascii?Q?EWtWmOLj6ktDVReTy8JH9uoFr0/g9cUiBSz2Et8VqjzqbQHEtH3bQCY8lFt2?=
 =?us-ascii?Q?pGbImy2ndwREgt0mpSe116qs9KlyyNYgKehJFhjfiU36pyaEeDky7/jdhQIQ?=
 =?us-ascii?Q?JHwpj9cEcFFQoKpaAG9En8aFTStai6KciKjckaeTMdbbxMAaE+YOpCJh29rZ?=
 =?us-ascii?Q?sPD69pbSv2B0PdR0dMTUSVYzXtMGUTVje648Yt65crnjh+FnVaW+H47mfXVi?=
 =?us-ascii?Q?twLy1v1FQY0FhEugEqTr8khLgh5V8r2Bd8HYmt7seJM7R3c79OcfMSiGNuRL?=
 =?us-ascii?Q?oRTSMBti8HYPDKWoxP+WPSU//P5kfeo=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 0cf99854-c86b-48b5-2100-08def7994961
X-MS-Exchange-CrossTenant-AuthSource: DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2026 11:11:26.8039
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hsrqul3uzSeZUqi5RbVIAQnimB5KJ97t8z9JJeFV4y+Uojb2ItT6c0bgajFuUmvbPkJoSQrwEJIiM2Z1J+7umEKpjCiSyZm78O9yM1md8vA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMBP189MB3247
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Aug 2026 11:11:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243187

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

Changes in v3:
- Added u-boot-tools and python3-dtc patches to fix pylibfdt build

Changes in v2:
- Added babeltrace2 patch to fix SWIG 4.5.0 compatibility

Jaipaul Cheernam (4):
  swig: upgrade 4.4.1 -> 4.5.0
  babeltrace2: fix build with swig 4.5.0
  u-boot-tools: fix pylibfdt build with swig 4.5.0
  python3-dtc: fix build with swig 4.5.0

 ...-removed-SWIG-Python-2-compatibility.patch | 57 +++++++++++++++
 .../u-boot/u-boot-tools_2026.07.bb            |  4 +-
 ...-removed-SWIG-Python-2-compatibility.patch | 57 +++++++++++++++
 .../python/python3-dtc_1.8.1.bb               |  1 +
 .../swig/swig/determinism.patch               | 20 +++---
 .../swig/{swig_4.4.1.bb =3D> swig_4.5.0.bb}     |  4 +-
 ...Python-2-C-API-macros-for-SWIG-4.5.0.patch | 70 +++++++++++++++++++
 .../recipes-kernel/lttng/babeltrace2_2.1.2.bb |  1 +
 8 files changed, 201 insertions(+), 13 deletions(-)
 create mode 100644 meta/recipes-bsp/u-boot/files/0001-pylibfdt-Replace-rem=
oved-SWIG-Python-2-compatibility.patch
 create mode 100644 meta/recipes-devtools/python/python3-dtc/0001-pylibfdt-=
Replace-removed-SWIG-Python-2-compatibility.patch
 rename meta/recipes-devtools/swig/{swig_4.4.1.bb =3D> swig_4.5.0.bb} (92%)
 create mode 100644 meta/recipes-kernel/lttng/babeltrace2/0001-bt2-replace-=
removed-Python-2-C-API-macros-for-SWIG-4.5.0.patch


